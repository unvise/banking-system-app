package com.unvise.bankingsystemapp.domain.account.account;

import com.unvise.bankingsystemapp.common.BaseRepository;
import com.unvise.bankingsystemapp.domain.currency.enums.CurrencyType;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AccountRepository extends BaseRepository<Account, Long> {

    List<Account> findByCurrency(CurrencyType currency);

    Optional<Account> findByAccountHistory_Id(Long id);

}