package com.unvise.bankingsystemapp.transaction.web.dto;

import com.unvise.bankingsystemapp.common.View;
import com.unvise.bankingsystemapp.transaction.web.validator.ValidateTransaction;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.time.LocalDate;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@ValidateTransaction(groups = {View.New.class})
public class TransactionDto {

    @Null(groups = {View.New.class})
    private Long id;

    @NotNull(groups = {View.New.class})
    private LocalDate date;

    @NotNull(groups = {View.New.class})
    private TransactionDetailsDto transactionDetails;

}