package com.unvise.bankingsystemapp.domain.account.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.unvise.bankingsystemapp.domain.common.View;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountSecurityDetailsDto {

    @Null(message = "id must be null", groups = {View.New.class, View.Update.class})
    private Long id;

    @NotNull(message = "password_hash must not be null", groups = {View.New.class, View.Update.class})
    @Size(message = "account password must be in range [4, 20] ", min = 4, max = 20, groups = {View.New.class, View.Update.class})
    @JsonProperty("password_hash")
    private String passwordHash;

}
