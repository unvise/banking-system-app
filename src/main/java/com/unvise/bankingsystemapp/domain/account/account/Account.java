package com.unvise.bankingsystemapp.domain.account.account;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.unvise.bankingsystemapp.domain.account.history.AccountHistory;
import com.unvise.bankingsystemapp.domain.account.security.AccountSecurityDetails;
import com.unvise.bankingsystemapp.domain.currency.enums.CurrencyType;
import com.unvise.bankingsystemapp.domain.person.person.Person;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "account")
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@NamedEntityGraph(
        name = "account-sec-details-person-graph",
        attributeNodes = {
                @NamedAttributeNode(value = "accountSecurityDetails"),
                @NamedAttributeNode(value = "person")
        }
)
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "account_seq_gen")
    @SequenceGenerator(name = "account_seq_gen", sequenceName = "account_seq_id", allocationSize = 1)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "balance", nullable = false, precision = 18, scale = 4)
    private BigDecimal balance;

    @Column(name = "currency", nullable = false)
    @Enumerated(EnumType.STRING)
    private CurrencyType currency;

    @OneToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(
            name = "account_security_details_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "account_account_security_details_fk")
    )
    private AccountSecurityDetails accountSecurityDetails;

    @OneToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(
            name = "account_history_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "account_account_history_fk")
    )
    private AccountHistory accountHistory;

    @OneToOne(mappedBy = "account")
    @ToString.Exclude
    private Person person;

    @PrePersist
    private void insertNewInstance() {
        if (balance == null) {
            balance = BigDecimal.ZERO;
        }

        if (accountHistory == null) {
            accountHistory = new AccountHistory();
        }
    }

    public void addToBalance(BigDecimal value) {
        this.balance = this.balance.add(value);
    }

    public void subtractFromBalance(BigDecimal value) {
        this.balance = this.balance.subtract(value);
    }


}
