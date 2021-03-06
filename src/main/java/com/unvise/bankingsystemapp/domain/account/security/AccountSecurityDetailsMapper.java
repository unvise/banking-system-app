package com.unvise.bankingsystemapp.domain.account.security;

import com.unvise.bankingsystemapp.domain.account.web.dto.AccountSecurityDetailsDto;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface AccountSecurityDetailsMapper {

    AccountSecurityDetailsDto toDto(AccountSecurityDetails accountSecurityDetails);

    AccountSecurityDetails toEntity(AccountSecurityDetailsDto accountSecurityDetailsDto);

    List<AccountSecurityDetailsDto> toDtoList(List<AccountSecurityDetails> accountSecurityDetails);

}
