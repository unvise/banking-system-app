package com.unvise.bankingsystemapp.transaction.details;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.unvise.bankingsystemapp.account.account.Account;
import com.unvise.bankingsystemapp.credit.Credit;
import com.unvise.bankingsystemapp.transaction.enums.TransactionType;
import com.unvise.bankingsystemapp.transaction.transaction.Transaction;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "transaction_details")
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TransactionDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "transaction_details_seq_gen")
    @SequenceGenerator(name = "transaction_details_seq_gen", sequenceName = "transaction_details_seq_id", allocationSize = 1)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "amount", precision = 18, scale = 4, nullable = false)
    private BigDecimal amount;

    @Column(name = "transaction_type", nullable = false)
    @Enumerated(EnumType.STRING)
    private TransactionType transactionType;

    @OneToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "from_account_id", foreignKey = @ForeignKey(name = "transaction_from_account_fk"))
    private Account fromAccount;


    @OneToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "to_account_id", foreignKey = @ForeignKey(name = "transaction_to_account_fk"))
    private Account toAccount;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "credit_id")
    private Credit credit;

    @OneToOne(mappedBy = "transactionDetails")
    @ToString.Exclude
    private Transaction transaction;

}