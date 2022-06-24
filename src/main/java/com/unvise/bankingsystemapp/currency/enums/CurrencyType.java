package com.unvise.bankingsystemapp.currency.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum CurrencyType {

    RUB("RUB"), USD("USD"), EUR("EUR");

    @Getter
    private final String currencyTypeAsString;

}