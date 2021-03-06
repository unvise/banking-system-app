package com.unvise.bankingsystemapp.domain.transaction.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.unvise.bankingsystemapp.domain.common.View;
import com.unvise.bankingsystemapp.domain.transaction.web.validator.ValidateTransaction;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@ValidateTransaction(message = "Invalid transaction. Check for the required field.", groups = {View.New.class})
public class TransactionDto {

    public static final String DATE_PATTERN = "yyyy-MM-dd";

    @Null(message = "id must be null", groups = {View.New.class})
    private Long id;

    @NotNull(message = "date must be not null and have format " + DATE_PATTERN, groups = {View.New.class})
    @DateTimeFormat(pattern = DATE_PATTERN)
    private String date;

    @NotNull(message = "transaction_details must be not null with json object with fields inside", groups = {View.New.class})
    @JsonProperty("transaction_details")
    private TransactionDetailsDto transactionDetails;

}
