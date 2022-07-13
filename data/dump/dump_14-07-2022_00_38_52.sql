PGDMP     "    (                 z            postgres    14.3    14.3 L    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    13754    postgres    DATABASE     l   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            ^           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3421                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            _           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    28372    acc_sec_details_seq_id    SEQUENCE        CREATE SEQUENCE public.acc_sec_details_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.acc_sec_details_seq_id;
       public          postgres    false            �            1259    28309    account    TABLE     �   CREATE TABLE public.account (
    id bigint NOT NULL,
    balance numeric(18,4) NOT NULL,
    currency character varying(255) NOT NULL,
    account_history_id bigint NOT NULL,
    account_security_details_id bigint NOT NULL
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    28314    account_history    TABLE     W   CREATE TABLE public.account_history (
    id bigint NOT NULL,
    deposit_id bigint
);
 #   DROP TABLE public.account_history;
       public         heap    postgres    false            �            1259    28373    account_history_seq_id    SEQUENCE        CREATE SEQUENCE public.account_history_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_history_seq_id;
       public          postgres    false            �            1259    28319    account_security_details    TABLE     �   CREATE TABLE public.account_security_details (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_hash character varying(255) NOT NULL
);
 ,   DROP TABLE public.account_security_details;
       public         heap    postgres    false            �            1259    28374    account_seq_id    SEQUENCE     w   CREATE SEQUENCE public.account_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.account_seq_id;
       public          postgres    false            �            1259    28324    credit    TABLE     �  CREATE TABLE public.credit (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency integer NOT NULL,
    current numeric(18,4) NOT NULL,
    date_between_payments_in_days integer NOT NULL,
    is_closed boolean,
    remain numeric(18,4) NOT NULL,
    total numeric(18,4) NOT NULL,
    account_history_id bigint NOT NULL
);
    DROP TABLE public.credit;
       public         heap    postgres    false            �            1259    28375    credit_seq_id    SEQUENCE     v   CREATE SEQUENCE public.credit_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.credit_seq_id;
       public          postgres    false            �            1259    28329    deposit    TABLE       CREATE TABLE public.deposit (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    balance numeric(18,4) NOT NULL,
    currency character varying(3) NOT NULL,
    intense_rate numeric(18,6) NOT NULL
);
    DROP TABLE public.deposit;
       public         heap    postgres    false            �            1259    28376    deposit_seq_id    SEQUENCE     w   CREATE SEQUENCE public.deposit_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.deposit_seq_id;
       public          postgres    false            �            1259    28377    exc_rate_seq_id    SEQUENCE     x   CREATE SEQUENCE public.exc_rate_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.exc_rate_seq_id;
       public          postgres    false            �            1259    28334    exchange_rate    TABLE     �   CREATE TABLE public.exchange_rate (
    id bigint NOT NULL,
    from_currency character varying(3) NOT NULL,
    ratio numeric(18,4) NOT NULL,
    to_currency character varying(3) NOT NULL
);
 !   DROP TABLE public.exchange_rate;
       public         heap    postgres    false            �            1259    28339    person    TABLE     �  CREATE TABLE public.person (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date_of_birth date NOT NULL,
    email character varying(100) NOT NULL,
    first_name character varying(70) NOT NULL,
    last_name character varying(70) NOT NULL,
    password character varying(100) NOT NULL,
    phone character varying(30) NOT NULL,
    status boolean NOT NULL,
    account_id bigint NOT NULL
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    28344    person_role    TABLE     `   CREATE TABLE public.person_role (
    person_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.person_role;
       public         heap    postgres    false            �            1259    28378    person_seq_id    SEQUENCE     v   CREATE SEQUENCE public.person_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_seq_id;
       public          postgres    false            �            1259    28349    role    TABLE     _   CREATE TABLE public.role (
    id bigint NOT NULL,
    role character varying(255) NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    28379    role_seq_gen    SEQUENCE     u   CREATE SEQUENCE public.role_seq_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.role_seq_gen;
       public          postgres    false            �            1259    28354    transaction    TABLE     �   CREATE TABLE public.transaction (
    id bigint NOT NULL,
    data date NOT NULL,
    account_history_id bigint,
    transaction_details_id bigint NOT NULL
);
    DROP TABLE public.transaction;
       public         heap    postgres    false            �            1259    28359    transaction_details    TABLE       CREATE TABLE public.transaction_details (
    id bigint NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency character varying(3),
    transaction_type character varying(255) NOT NULL,
    credit_id bigint,
    from_account_id bigint,
    to_account_id bigint
);
 '   DROP TABLE public.transaction_details;
       public         heap    postgres    false            �            1259    28380    transaction_details_seq_id    SEQUENCE     �   CREATE SEQUENCE public.transaction_details_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.transaction_details_seq_id;
       public          postgres    false            �            1259    28381    transaction_seq_id    SEQUENCE     {   CREATE SEQUENCE public.transaction_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.transaction_seq_id;
       public          postgres    false            C          0    28309    account 
   TABLE DATA           i   COPY public.account (id, balance, currency, account_history_id, account_security_details_id) FROM stdin;
    public          postgres    false    210   �[       D          0    28314    account_history 
   TABLE DATA           9   COPY public.account_history (id, deposit_id) FROM stdin;
    public          postgres    false    211   �[       E          0    28319    account_security_details 
   TABLE DATA           ]   COPY public.account_security_details (id, created_at, updated_at, password_hash) FROM stdin;
    public          postgres    false    212   �[       F          0    28324    credit 
   TABLE DATA           �   COPY public.credit (id, created_at, updated_at, currency, current, date_between_payments_in_days, is_closed, remain, total, account_history_id) FROM stdin;
    public          postgres    false    213   �\       G          0    28329    deposit 
   TABLE DATA           ^   COPY public.deposit (id, created_at, updated_at, balance, currency, intense_rate) FROM stdin;
    public          postgres    false    214   �\       H          0    28334    exchange_rate 
   TABLE DATA           N   COPY public.exchange_rate (id, from_currency, ratio, to_currency) FROM stdin;
    public          postgres    false    215   �\       I          0    28339    person 
   TABLE DATA           �   COPY public.person (id, created_at, updated_at, date_of_birth, email, first_name, last_name, password, phone, status, account_id) FROM stdin;
    public          postgres    false    216   M]       J          0    28344    person_role 
   TABLE DATA           9   COPY public.person_role (person_id, role_id) FROM stdin;
    public          postgres    false    217   R^       K          0    28349    role 
   TABLE DATA           (   COPY public.role (id, role) FROM stdin;
    public          postgres    false    218   y^       L          0    28354    transaction 
   TABLE DATA           [   COPY public.transaction (id, data, account_history_id, transaction_details_id) FROM stdin;
    public          postgres    false    219   �^       M          0    28359    transaction_details 
   TABLE DATA           �   COPY public.transaction_details (id, amount, currency, transaction_type, credit_id, from_account_id, to_account_id) FROM stdin;
    public          postgres    false    220   �^       `           0    0    acc_sec_details_seq_id    SEQUENCE SET     D   SELECT pg_catalog.setval('public.acc_sec_details_seq_id', 2, true);
          public          postgres    false    221            a           0    0    account_history_seq_id    SEQUENCE SET     D   SELECT pg_catalog.setval('public.account_history_seq_id', 2, true);
          public          postgres    false    222            b           0    0    account_seq_id    SEQUENCE SET     <   SELECT pg_catalog.setval('public.account_seq_id', 2, true);
          public          postgres    false    223            c           0    0    credit_seq_id    SEQUENCE SET     <   SELECT pg_catalog.setval('public.credit_seq_id', 1, false);
          public          postgres    false    224            d           0    0    deposit_seq_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.deposit_seq_id', 1, false);
          public          postgres    false    225            e           0    0    exc_rate_seq_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.exc_rate_seq_id', 6, true);
          public          postgres    false    226            f           0    0    person_seq_id    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_seq_id', 2, true);
          public          postgres    false    227            g           0    0    role_seq_gen    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.role_seq_gen', 1, false);
          public          postgres    false    228            h           0    0    transaction_details_seq_id    SEQUENCE SET     I   SELECT pg_catalog.setval('public.transaction_details_seq_id', 1, false);
          public          postgres    false    229            i           0    0    transaction_seq_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.transaction_seq_id', 1, false);
          public          postgres    false    230            �           2606    28318 $   account_history account_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.account_history
    ADD CONSTRAINT account_history_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.account_history DROP CONSTRAINT account_history_pkey;
       public            postgres    false    211            �           2606    28313    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    210            �           2606    28323 6   account_security_details account_security_details_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.account_security_details
    ADD CONSTRAINT account_security_details_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.account_security_details DROP CONSTRAINT account_security_details_pkey;
       public            postgres    false    212            �           2606    28328    credit credit_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.credit
    ADD CONSTRAINT credit_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.credit DROP CONSTRAINT credit_pkey;
       public            postgres    false    213            �           2606    28365    exchange_rate currencies 
   CONSTRAINT     i   ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT currencies UNIQUE (from_currency, to_currency);
 B   ALTER TABLE ONLY public.exchange_rate DROP CONSTRAINT currencies;
       public            postgres    false    215    215            �           2606    28333    deposit deposit_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.deposit DROP CONSTRAINT deposit_pkey;
       public            postgres    false    214            �           2606    28367    person email_uk 
   CONSTRAINT     K   ALTER TABLE ONLY public.person
    ADD CONSTRAINT email_uk UNIQUE (email);
 9   ALTER TABLE ONLY public.person DROP CONSTRAINT email_uk;
       public            postgres    false    216            �           2606    28338     exchange_rate exchange_rate_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT exchange_rate_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.exchange_rate DROP CONSTRAINT exchange_rate_pkey;
       public            postgres    false    215            �           2606    28343    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    216            �           2606    28348    person_role person_role_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.person_role
    ADD CONSTRAINT person_role_pkey PRIMARY KEY (person_id, role_id);
 F   ALTER TABLE ONLY public.person_role DROP CONSTRAINT person_role_pkey;
       public            postgres    false    217    217            �           2606    28369    person phone_uk 
   CONSTRAINT     K   ALTER TABLE ONLY public.person
    ADD CONSTRAINT phone_uk UNIQUE (phone);
 9   ALTER TABLE ONLY public.person DROP CONSTRAINT phone_uk;
       public            postgres    false    216            �           2606    28353    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    218            �           2606    28371    role role_uk 
   CONSTRAINT     G   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_uk UNIQUE (role);
 6   ALTER TABLE ONLY public.role DROP CONSTRAINT role_uk;
       public            postgres    false    218            �           2606    28363 ,   transaction_details transaction_details_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.transaction_details
    ADD CONSTRAINT transaction_details_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.transaction_details DROP CONSTRAINT transaction_details_pkey;
       public            postgres    false    220            �           2606    28358    transaction transaction_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public            postgres    false    219            �           2606    28382 "   account account_account_history_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_account_history_fk FOREIGN KEY (account_history_id) REFERENCES public.account_history(id);
 L   ALTER TABLE ONLY public.account DROP CONSTRAINT account_account_history_fk;
       public          postgres    false    211    3217    210            �           2606    28387 +   account account_account_security_details_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_account_security_details_fk FOREIGN KEY (account_security_details_id) REFERENCES public.account_security_details(id);
 U   ALTER TABLE ONLY public.account DROP CONSTRAINT account_account_security_details_fk;
       public          postgres    false    210    212    3219            �           2606    28392 *   account_history account_history_deposit_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_history
    ADD CONSTRAINT account_history_deposit_fk FOREIGN KEY (deposit_id) REFERENCES public.deposit(id);
 T   ALTER TABLE ONLY public.account_history DROP CONSTRAINT account_history_deposit_fk;
       public          postgres    false    214    211    3223            �           2606    28397     credit credit_account_history_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit
    ADD CONSTRAINT credit_account_history_fk FOREIGN KEY (account_history_id) REFERENCES public.account_history(id);
 J   ALTER TABLE ONLY public.credit DROP CONSTRAINT credit_account_history_fk;
       public          postgres    false    3217    211    213            �           2606    28427 /   transaction_details fk7xw1deu1s389bd13c6wkcgcys    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_details
    ADD CONSTRAINT fk7xw1deu1s389bd13c6wkcgcys FOREIGN KEY (credit_id) REFERENCES public.credit(id);
 Y   ALTER TABLE ONLY public.transaction_details DROP CONSTRAINT fk7xw1deu1s389bd13c6wkcgcys;
       public          postgres    false    3221    220    213            �           2606    28412 '   person_role fkhyx1efsls0f00lxs6xd4w2b3j    FK CONSTRAINT     �   ALTER TABLE ONLY public.person_role
    ADD CONSTRAINT fkhyx1efsls0f00lxs6xd4w2b3j FOREIGN KEY (person_id) REFERENCES public.person(id);
 Q   ALTER TABLE ONLY public.person_role DROP CONSTRAINT fkhyx1efsls0f00lxs6xd4w2b3j;
       public          postgres    false    3231    217    216            �           2606    28407 '   person_role fks7asxi8amiwjjq1sonlc4rihn    FK CONSTRAINT     �   ALTER TABLE ONLY public.person_role
    ADD CONSTRAINT fks7asxi8amiwjjq1sonlc4rihn FOREIGN KEY (role_id) REFERENCES public.role(id);
 Q   ALTER TABLE ONLY public.person_role DROP CONSTRAINT fks7asxi8amiwjjq1sonlc4rihn;
       public          postgres    false    218    3237    217            �           2606    28402    person person_account_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_account_fk FOREIGN KEY (account_id) REFERENCES public.account(id);
 B   ALTER TABLE ONLY public.person DROP CONSTRAINT person_account_fk;
       public          postgres    false    3215    210    216            �           2606    28417 *   transaction transaction_account_history_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_account_history_fk FOREIGN KEY (account_history_id) REFERENCES public.account_history(id);
 T   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_account_history_fk;
       public          postgres    false    211    219    3217            �           2606    28432 /   transaction_details transaction_from_account_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_details
    ADD CONSTRAINT transaction_from_account_fk FOREIGN KEY (from_account_id) REFERENCES public.account(id);
 Y   ALTER TABLE ONLY public.transaction_details DROP CONSTRAINT transaction_from_account_fk;
       public          postgres    false    220    210    3215            �           2606    28437 -   transaction_details transaction_to_account_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_details
    ADD CONSTRAINT transaction_to_account_fk FOREIGN KEY (to_account_id) REFERENCES public.account(id);
 W   ALTER TABLE ONLY public.transaction_details DROP CONSTRAINT transaction_to_account_fk;
       public          postgres    false    3215    220    210            �           2606    28422 .   transaction transaction_transaction_details_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_transaction_details_fk FOREIGN KEY (transaction_details_id) REFERENCES public.transaction_details(id);
 X   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_transaction_details_fk;
       public          postgres    false    219    3243    220            C   '   x�3�4�3 ΠP'NCNC.#��kh��W� �&?      D      x�3���21z\\\ q�      E   �   x�3�4202�50�54V02�2��26�30��)�b��b`���b�����m���\f���dYZ��T\�_l�Q�g���P⚗��SV���e�f���XKt���0�Ң��
�ӂJ��
�R�-r���J��-��-���*�������-}�=��}�M�
3�b���� ��9h      F      x������ � �      G      x������ � �      H   Q   x�=�1�0��1���+�u���!��|&}B�U�5:<R̪:��b��B��5r2��<�-+%==��P[c���'q      I   �   x���1o�@����5���
�$-)D��t��p�;+~z)���i�柼��� &��
01�� ����(I�Ӿ�����$���M_�MD���c}/V��P4���V5��k���)���ّJ�Fϖ���]p舨w��A1�=�I�3L-t�"��"��^&g.P̥�eu���!��)����&m���/[��6��>�g�(�y�N���
|����G0P)c��ʇ�(���[�      J      x�3�4�2�4�2�1z\\\ 
      K      x�3�v�2�tt�������� ,>�      L      x������ � �      M      x������ � �     