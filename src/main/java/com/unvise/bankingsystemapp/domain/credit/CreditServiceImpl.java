package com.unvise.bankingsystemapp.domain.credit;

import com.unvise.bankingsystemapp.domain.account.account.Account;
import com.unvise.bankingsystemapp.domain.account.account.AccountRepository;
import com.unvise.bankingsystemapp.domain.credit.web.dto.CreditDto;
import com.unvise.bankingsystemapp.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CreditServiceImpl implements CreditService {

    private final CreditRepository creditRepository;
    private final AccountRepository accountRepository;
    private final CreditMapper creditMapper;

    @Override
    @Transactional
    public List<CreditDto> getAll() {
        List<Credit> foundCredits = creditRepository.findAll();
        return creditMapper.toDtoList(foundCredits);
    }

    @Override
    @Transactional
    public CreditDto getById(Long aLong) {
        Credit foundCredit = creditRepository.findById(aLong).orElseThrow(() ->
                new ResourceNotFoundException("Credit", Map.of("id", aLong)));
        return creditMapper.toDto(foundCredit);
    }

    @Override
    @Transactional
    public CreditDto save(CreditDto creditDto) {
        Account foundAccount = getAccountByAccountHistoryId(creditDto.getAccountHistoryId());

        Credit credit = creditMapper.toEntity(creditDto);
        credit.setAccountHistory(foundAccount.getAccountHistory());

        Credit savedCredit = creditRepository.save(credit);
        return creditMapper.toDto(savedCredit);
    }

    @Override
    @Transactional
    public CreditDto updateById(Long aLong, CreditDto creditDto) {
        creditRepository.findById(aLong).orElseThrow(() ->
                new ResourceNotFoundException("Credit", Map.of("id", aLong)));

        creditDto.setId(aLong);

        Account foundAccount = getAccountByAccountHistoryId(creditDto.getAccountHistoryId());

        Credit credit = creditMapper.toEntity(creditDto);
        credit.setAccountHistory(foundAccount.getAccountHistory());

        Credit savedCredit = creditRepository.save(credit);
        return creditMapper.toDto(savedCredit);
    }

    @Override
    @Transactional
    public CreditDto deleteById(Long aLong) {
        Credit foundCredit = creditRepository.findById(aLong).orElseThrow(() ->
                new ResourceNotFoundException("Credit", Map.of("id", aLong)));
        creditRepository.delete(foundCredit);
        return creditMapper.toDto(foundCredit);
    }

    private Account getAccountByAccountHistoryId(Long id) {
        return accountRepository.findByAccountHistory_Id(id).orElseThrow(() ->
                new ResourceNotFoundException("AccountHistory", Map.of("id", id)));
    }

}