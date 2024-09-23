@implementation PKAccountServiceTransferRequest

- (PKAccountServiceTransferRequest)initWithAccount:(id)a3 peerPaymentAccount:(id)a4 peerPaymentPass:(id)a5 transferType:(unint64_t)a6 fundingSources:(id)a7 currencyAmount:(id)a8
{
  return -[PKAccountServiceTransferRequest initWithAccount:peerPaymentAccount:peerPaymentPass:transferType:fundingSources:currencyAmount:paymentDate:objectSettings:](self, "initWithAccount:peerPaymentAccount:peerPaymentPass:transferType:fundingSources:currencyAmount:paymentDate:objectSettings:", a3, a4, a5, a6, a7, a8, 0, 0);
}

- (PKAccountServiceTransferRequest)initWithAccount:(id)a3 peerPaymentAccount:(id)a4 peerPaymentPass:(id)a5 transferType:(unint64_t)a6 fundingSources:(id)a7 currencyAmount:(id)a8 paymentDate:(id)a9 objectSettings:(id)a10
{
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  PKAccountServiceTransferRequest *v20;
  uint64_t v21;
  NSString *accountIdentifier;
  uint64_t v23;
  NSURL *accountBaseURL;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  PKAccountServiceTransferRequest *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  unint64_t transferType;
  char v39;
  void *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  char v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  id v88;
  _BOOL4 v89;
  int v90;
  int v91;
  NSObject *v92;
  uint64_t v93;
  _BOOL4 v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v102;
  void *v103;
  char v104;
  void *v105;
  _BOOL4 v106;
  _BOOL4 v107;
  _BOOL4 v108;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  void *v113;
  uint64_t v114;
  void *v115;
  id v116;
  id v118;
  id v119;
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  objc_super v125;
  uint8_t buf[4];
  _BYTE v127[10];
  __int16 v128;
  int v129;
  __int16 v130;
  _BOOL4 v131;
  __int16 v132;
  int v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v118 = a3;
  v16 = (unint64_t)a4;
  v17 = (unint64_t)a5;
  v120 = a7;
  v119 = a8;
  v18 = a9;
  v19 = a10;
  v125.receiver = self;
  v125.super_class = (Class)PKAccountServiceTransferRequest;
  v20 = -[PKPaymentRequest init](&v125, sel_init);
  if (!v20)
  {
LABEL_116:
    v34 = v20;
    v27 = v118;
LABEL_117:
    v25 = v119;
    goto LABEL_118;
  }
  if (!(v16 | v17) && !objc_msgSend(v120, "count"))
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v33 = objc_claimAutoreleasedReturnValue();
    v27 = v118;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Transfer request invalid: No peer payment or funding sources", buf, 2u);
    }

    v34 = 0;
    goto LABEL_117;
  }
  v116 = v19;
  objc_storeStrong((id *)&v20->_account, a3);
  v20->_featureIdentifier = -[PKAccount feature](v20->_account, "feature");
  -[PKAccount accountIdentifier](v20->_account, "accountIdentifier");
  v21 = objc_claimAutoreleasedReturnValue();
  accountIdentifier = v20->_accountIdentifier;
  v20->_accountIdentifier = (NSString *)v21;

  -[PKAccount accountBaseURL](v20->_account, "accountBaseURL");
  v23 = objc_claimAutoreleasedReturnValue();
  accountBaseURL = v20->_accountBaseURL;
  v20->_accountBaseURL = (NSURL *)v23;

  v20->_transferType = a6;
  objc_storeStrong((id *)&v20->_currencyAmount, a8);
  objc_storeStrong((id *)&v20->_peerPaymentAccount, a4);
  objc_storeStrong((id *)&v20->_peerPaymentPass, a5);
  -[PKPaymentRequest setRequestType:](v20, "setRequestType:", 2);
  -[PKPaymentRequest setClientCallbackTimeout:](v20, "setClientCallbackTimeout:", 65.0);
  v25 = v119;
  objc_msgSend(v119, "currency");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRequest setCurrencyCode:](v20, "setCurrencyCode:", v26);

  -[PKPaymentRequest setConfirmationStyle:](v20, "setConfirmationStyle:", 9);
  v27 = v118;
  if (v18)
  {
    v28 = v18;
    -[PKPaymentRequest setPaymentDate:](v20, "setPaymentDate:", v18);
    v29 = 2;
  }
  else
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setPaymentDate:](v20, "setPaymentDate:", v30);

    v29 = 1;
  }
  -[PKPaymentRequest setPaymentFrequency:](v20, "setPaymentFrequency:", v29);
  switch(objc_msgSend(v118, "type"))
  {
    case 0:
    case 2:
    case 3:
      PKLogFacilityTypeGetObject(0xEuLL);
      v31 = objc_claimAutoreleasedReturnValue();
      v18 = v28;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        PKAccountTypeToString(objc_msgSend(v118, "type"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v127 = v32;
        _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Transfer request invalid for account type %@", buf, 0xCu);

      }
      goto LABEL_106;
    case 1:
      objc_msgSend(v118, "creditDetails");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "productTimeZone");
      v114 = objc_claimAutoreleasedReturnValue();

      v18 = v28;
      v36 = (objc_msgSend(v19, "settings") & 0x200) != 0 || objc_msgSend(v120, "count") == 0;
      objc_msgSend(v118, "schedulePaymentFeatureDescriptor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "paymentFundingSourceTypes");

      -[PKPaymentRequest setDeviceSupportsPeerPaymentAccountPayment:](v20, "setDeviceSupportsPeerPaymentAccountPayment:", PKPeerPaymentCanPerformAccountServicePayments((void *)v16, (void *)v17));
      v42 = 0;
      if (!v18 && (v41 & 2) != 0)
        v42 = -[PKPaymentRequest deviceSupportsPeerPaymentAccountPayment](v20, "deviceSupportsPeerPaymentAccountPayment", 0);
      -[PKPaymentRequest setAccountPaymentSupportsPeerPayment:](v20, "setAccountPaymentSupportsPeerPayment:", v42);
      v43 = v36 && -[PKPaymentRequest accountPaymentSupportsPeerPayment](v20, "accountPaymentSupportsPeerPayment");
      -[PKPaymentRequest setAccountPaymentUsePeerPaymentBalance:](v20, "setAccountPaymentUsePeerPaymentBalance:", v43);
      -[PKAccountServiceTransferRequest _bankAccountsForFundingSources:](v20, "_bankAccountsForFundingSources:", v120);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v115, "count"))
      {
        objc_msgSend(v118, "accountIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        PKLastBankAccountIdentifierForAccountTransfer((uint64_t)v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "length");
        v47 = v18;
        if (!v46)
        {
          PKSharedCacheGetStringForKey(CFSTR("LastBankAccountIdentifier"));
          v48 = objc_claimAutoreleasedReturnValue();

          v45 = (void *)v48;
        }
        v49 = v115;
        if (!objc_msgSend(v45, "length"))
          goto LABEL_31;
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke;
        v123[3] = &unk_1E2AD2B68;
        v124 = v45;
        objc_msgSend(v115, "pk_firstObjectPassingTest:", v123);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
        {
LABEL_31:
          objc_msgSend(v115, "firstObject");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!v46 && v50)
        {
          objc_msgSend(v50, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          PKSetLastBankAccountIdentifierForAccountTransfer((uint64_t)v44, v51);

        }
        -[PKAccountServiceTransferRequest setDefaultBankAccount:](v20, "setDefaultBankAccount:", v50);
        -[PKPaymentRequest setBankAccounts:](v20, "setBankAccounts:", v115);

        v18 = v47;
        v19 = v116;
        goto LABEL_110;
      }
      objc_msgSend((id)v16, "currentBalance");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "amount");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "amount");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "compare:", v54);

      if (v55 == -1)
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v56 = objc_claimAutoreleasedReturnValue();
        v31 = v114;
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
LABEL_57:
          v25 = v119;

          goto LABEL_106;
        }
        *(_WORD *)buf = 0;
        v57 = "Transfer request invalid - no bank accounts and cash cannot cover the full amount";
      }
      else
      {
        v31 = v114;
        if (-[PKPaymentRequest accountPaymentSupportsPeerPayment](v20, "accountPaymentSupportsPeerPayment"))
          goto LABEL_120;
        PKLogFacilityTypeGetObject(0xEuLL);
        v56 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          goto LABEL_57;
        *(_WORD *)buf = 0;
        v57 = "Transfer request invalid - no bank accounts and cash is not supported";
      }
      _os_log_impl(&dword_18FC92000, v56, OS_LOG_TYPE_DEFAULT, v57, buf, 2u);
      goto LABEL_57;
    case 4:
      objc_msgSend(v118, "savingsDetails");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "productTimeZone");
      v114 = objc_claimAutoreleasedReturnValue();

      transferType = v20->_transferType;
      v18 = v28;
      if (transferType == 3)
      {
        v39 = objc_msgSend(v118, "oneTimeWithdrawalFundingSourceTypes");
        goto LABEL_41;
      }
      if (transferType == 2)
      {
        v39 = objc_msgSend(v118, "oneTimeDepositFundingSourceTypes");
LABEL_41:
        v58 = v39;
        goto LABEL_43;
      }
      v58 = 0;
LABEL_43:
      objc_msgSend(v119, "amount");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v58 & 1) == 0)
      {
        v59 = 0;
        goto LABEL_73;
      }
      if (a6 == 3)
      {
        objc_msgSend(v118, "oneTimeWithdrawalFeatureDescriptor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a6 != 2)
        {
LABEL_53:
          v64 = 0;
          v59 = 0;
          goto LABEL_72;
        }
        objc_msgSend(v118, "oneTimeDepositFeatureDescriptor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v60)
        goto LABEL_53;
      v61 = v60;
      objc_msgSend(v60, "minimumAmount");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v61;
      if (objc_msgSend(v115, "compare:") == -1)
      {
        v59 = 0;
LABEL_70:

        v25 = v119;
        goto LABEL_71;
      }
      v104 = v58;
      objc_msgSend(v61, "maximumAmount");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v115, "compare:", v62);

      if (v63 != 1)
      {
        -[PKAccountServiceTransferRequest _bankAccountsForFundingSources:](v20, "_bankAccountsForFundingSources:", v120);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "pk_firstObjectPassingTest:", &__block_literal_global_136);
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = (void *)v66;
        v59 = v66 != 0;
        if (v66)
        {
          v103 = (void *)v66;
          v107 = v66 != 0;
          objc_msgSend(v118, "accountIdentifier");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          PKLastBankAccountIdentifierForAccountTransfer((uint64_t)v102);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "length");
          if (!v69)
          {
            PKSharedCacheGetStringForKey(CFSTR("LastBankAccountIdentifier"));
            v110 = v65;
            v70 = objc_claimAutoreleasedReturnValue();

            v68 = (void *)v70;
            v65 = v110;
          }
          if (!objc_msgSend(v68, "length"))
            goto LABEL_64;
          v121[0] = MEMORY[0x1E0C809B0];
          v121[1] = 3221225472;
          v121[2] = __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke_2;
          v121[3] = &unk_1E2AD2B68;
          v122 = v68;
          objc_msgSend(v65, "pk_firstObjectPassingTest:", v121);
          v111 = v69;
          v71 = objc_claimAutoreleasedReturnValue();

          v72 = (id)v71;
          v69 = v111;
          if (!v72)
LABEL_64:
            v72 = v103;
          v112 = v72;
          if (!v69)
          {
            objc_msgSend(v72, "identifier");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            PKSetLastBankAccountIdentifierForAccountTransfer((uint64_t)v102, v73);

          }
          v59 = v107;
          v67 = v103;
          v74 = v112;
        }
        else
        {
          v74 = 0;
        }
        v109 = v74;
        -[PKAccountServiceTransferRequest setDefaultBankAccount:](v20, "setDefaultBankAccount:", v74);
        -[PKPaymentRequest setBankAccounts:](v20, "setBankAccounts:", v65);

        v58 = v104;
        goto LABEL_70;
      }
      v59 = 0;
      v25 = v119;
      v58 = v104;
LABEL_71:
      v64 = v105;
LABEL_72:

LABEL_73:
      if ((PKPeerPaymentNeedsResolutionToPerformAccountServicePayments((void *)v16, (void *)v17) & 1) != 0)
        LOBYTE(v75) = 0;
      else
        v75 = PKPeerPaymentCanPerformAccountServicePayments((void *)v16, (void *)v17) ^ 1;
      if ((v58 & 2) != 0 && (v75 & 1) == 0)
      {
        objc_msgSend((id)v16, "currentBalance");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "amount");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = v20->_transferType;
        v113 = v77;
        if (v78 == 2)
        {
          v108 = v59;
          objc_msgSend(v77, "decimalNumberBySubtracting:", v115);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v83, "compare:", v84) != -1;

          objc_msgSend(v118, "oneTimeDepositWithAppleCashFeatureDescriptor");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v78 != 3)
          {
            v87 = 0;
            v81 = 1;
LABEL_89:
            v88 = v18;
            v89 = a6 != 2 || objc_msgSend(v113, "compare:", v115) != -1;
            v90 = v59 & PKAccountServiceTransferPrefersBank();
            v91 = v81 && v87;
            PKLogFacilityTypeGetObject(0xEuLL);
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67110144;
              *(_DWORD *)v127 = 1;
              *(_WORD *)&v127[4] = 1024;
              *(_DWORD *)&v127[6] = 1;
              v128 = 1024;
              v129 = v91;
              v130 = 1024;
              v131 = v89;
              v132 = 1024;
              v133 = v90 ^ 1;
              _os_log_impl(&dword_18FC92000, v92, OS_LOG_TYPE_DEFAULT, "Should use peer payment for transfer request? Supports peer payment: %d, device can show peer payment: %d, satisfies cash limits %d, cash balance is sufficient %d, user doesn't prefer bank: %d", buf, 0x20u);
            }

            if (v91)
              v93 = v89 & (v90 ^ 1u);
            else
              v93 = 0;
            -[PKPaymentRequest setAccountPaymentUsePeerPaymentBalance:](v20, "setAccountPaymentUsePeerPaymentBalance:", v93);
            -[PKPaymentRequest setAccountPaymentSupportsPeerPayment:](v20, "setAccountPaymentSupportsPeerPayment:", 1);
            -[PKPaymentRequest setDeviceSupportsPeerPaymentAccountPayment:](v20, "setDeviceSupportsPeerPaymentAccountPayment:", 1);

            v25 = v119;
            v18 = v88;
            v19 = v116;
            goto LABEL_98;
          }
          v108 = v59;
          objc_msgSend(v115, "decimalNumberByAdding:", v77);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v16, "maximumBalance");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v79, "compare:", v80) != 1;

          objc_msgSend(v118, "oneTimeWithdrawalWithAppleCashFeatureDescriptor");
          v82 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v82)
        {
          v106 = v81;
          objc_msgSend(v82, "minimumAmount");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v115, "compare:", v85) == -1)
          {
            v87 = 0;
          }
          else
          {
            objc_msgSend(v82, "maximumAmount");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v115, "compare:", v86) != 1;

          }
          v59 = v108;
          v81 = v106;
        }
        else
        {
          v87 = 0;
          v59 = v108;
        }
        goto LABEL_89;
      }
LABEL_98:
      if (-[PKPaymentRequest accountPaymentSupportsPeerPayment](v20, "accountPaymentSupportsPeerPayment"))
        v94 = -[PKPaymentRequest deviceSupportsPeerPaymentAccountPayment](v20, "deviceSupportsPeerPaymentAccountPayment");
      else
        v94 = 0;
      -[PKPaymentRequest bankAccounts](v20, "bankAccounts");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "count");

      if (v94 || v96)
      {
        if (!v94)
        {
          v31 = v114;
LABEL_120:
          v49 = v115;
          goto LABEL_111;
        }
        v49 = v115;
        if (!v96)
          -[PKPaymentRequest setAccountPaymentUsePeerPaymentBalance:](v20, "setAccountPaymentUsePeerPaymentBalance:", 1);
LABEL_110:
        v31 = v114;
LABEL_111:

LABEL_112:
        -[PKPaymentRequest setPaymentTimeZone:](v20, "setPaymentTimeZone:", v31);
        if (-[PKPaymentRequest accountPaymentUsePeerPaymentBalance](v20, "accountPaymentUsePeerPaymentBalance"))
          v98 = 3;
        else
          v98 = 1;
        -[PKAccountServiceTransferRequest defaultBankAccount](v20, "defaultBankAccount");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccountServiceTransferRequest paymentSummaryItemsWithFundingSources:bankAccount:](v20, "paymentSummaryItemsWithFundingSources:bankAccount:", v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentRequest setPaymentSummaryItems:](v20, "setPaymentSummaryItems:", v100);

        goto LABEL_116;
      }
      PKLogFacilityTypeGetObject(0xEuLL);
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v97, OS_LOG_TYPE_DEFAULT, "Transfer request invalid: No bank account, and account does not support peer payment", buf, 2u);
      }

      v31 = v114;
LABEL_106:

      v34 = 0;
LABEL_118:

      return v34;
    default:
      v31 = 0;
      v18 = v28;
      goto LABEL_112;
  }
}

uint64_t __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

BOOL __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 1;
}

BOOL __156__PKAccountServiceTransferRequest_initWithAccount_peerPaymentAccount_peerPaymentPass_transferType_fundingSources_currencyAmount_paymentDate_objectSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  _BOOL8 v10;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_9;
  }
  v10 = objc_msgSend(v3, "status") == 1;
LABEL_10:

  return v10;
}

- (BOOL)supportsSplitPayment
{
  return self->_transferType == 1;
}

- (void)paymentAmountsWithFundingSources:(unint64_t)a3 apc:(id *)a4 ach:(id *)a5
{
  char v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = a3;
  -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((v7 & 2) != 0)
  {
    -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "amount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "compare:", v13) == -1)
    {
      if (!-[PKAccountServiceTransferRequest supportsSplitPayment](self, "supportsSplitPayment"))
      {
        v12 = *a4;
        goto LABEL_9;
      }
      v11 = v10;
    }
    else
    {
      v11 = v13;
    }
    v12 = objc_retainAutorelease(v11);
    *a4 = v12;
LABEL_9:
    objc_msgSend(v13, "decimalNumberBySubtracting:", v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  *a5 = objc_retainAutorelease(v13);
LABEL_10:

}

- (id)paymentSummaryItemsWithFundingSources:(unint64_t)a3 bankAccount:(id)a4
{
  id v6;
  void *v7;
  unint64_t transferType;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t featureIdentifier;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v48;
  id v49;
  id v50;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  transferType = self->_transferType;
  if (transferType != 3)
  {
    if (transferType == 2)
    {
      if (-[PKAccount type](self->_account, "type") == 4)
      {
        PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_DEPOSIT_SAVINGS_TOTAL"), self->_featureIdentifier, 0, v37, v38, v39, v40, v41, v48);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    else if (transferType == 1)
    {
      v49 = 0;
      v50 = 0;
      -[PKAccountServiceTransferRequest paymentAmountsWithFundingSources:apc:ach:](self, "paymentAmountsWithFundingSources:apc:ach:", a3, &v50, &v49);
      v9 = v50;
      v15 = v49;
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "compare:", v9) == -1 && v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "compare:", v15);

          if (!v6 || v18 != -1)
            goto LABEL_11;
          PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_APC_ITEM"), self->_featureIdentifier, 0, v10, v11, v12, v13, v14, v48);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          featureIdentifier = self->_featureIdentifier;
          objc_msgSend(v6, "bankName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ACH_ITEM_FORMAT"), featureIdentifier, CFSTR("%@"), v21, v22, v23, v24, v25, (uint64_t)v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v26, v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v16, v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "safelyAddObject:", v28);
          objc_msgSend(v7, "safelyAddObject:", v27);

        }
      }
LABEL_11:
      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ITEM_TOTAL"), self->_featureIdentifier, 0, v10, v11, v12, v13, v14, v48);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (-[PKAccount type](self->_account, "type") != 4)
  {
LABEL_18:
    v29 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v6, "bankName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 2) != 0)
  {
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_WITHDRAW_APPLE_CASH_TITLE"), self->_featureIdentifier, 0, v30, v31, v32, v33, v34, v48);
    v36 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v36;
  }
  PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_WITHDRAW_TOTAL_FMT"), self->_featureIdentifier, CFSTR("%@"), v30, v31, v32, v33, v34, (uint64_t)v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    v44 = v42;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  v45 = v44;

  +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v29, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v46);

  return v7;
}

- (id)_bankAccountsForFundingSources:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "bankAccountRepresentation", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "safelyAddObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  v11 = (void *)objc_msgSend(v4, "copy", (_QWORD)v13);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountServiceTransferRequest *v4;
  PKAccountServiceTransferRequest *v5;
  BOOL v6;

  v4 = (PKAccountServiceTransferRequest *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountServiceTransferRequest isEqualToAccountServicePaymentRequest:](self, "isEqualToAccountServicePaymentRequest:", v5);

  return v6;
}

- (BOOL)isEqualToAccountServicePaymentRequest:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  NSURL *accountBaseURL;
  NSURL *v12;
  BOOL v13;
  char v14;
  PKBankAccountInformation *defaultBankAccount;
  PKBankAccountInformation *v16;
  PKAccount *account;
  PKAccount *v18;
  BOOL v19;
  objc_super v21;

  v4 = a3;
  if (!v4)
    goto LABEL_30;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountServiceTransferRequest;
  if (!-[PKPaymentRequest isEqual:](&v21, sel_isEqual_, v4))
    goto LABEL_30;
  v5 = (void *)v4[70];
  v6 = self->_accountIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

      goto LABEL_30;
    }
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_30;
  }
  accountBaseURL = self->_accountBaseURL;
  v12 = (NSURL *)v4[71];
  if (accountBaseURL)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (accountBaseURL != v12)
      goto LABEL_30;
  }
  else
  {
    v14 = -[NSURL isEqual:](accountBaseURL, "isEqual:");
    if ((v14 & 1) == 0)
      goto LABEL_30;
  }
  defaultBankAccount = self->_defaultBankAccount;
  v16 = (PKBankAccountInformation *)v4[72];
  if (defaultBankAccount && v16)
  {
    if ((-[PKBankAccountInformation isEqual:](defaultBankAccount, "isEqual:") & 1) == 0)
      goto LABEL_30;
  }
  else if (defaultBankAccount != v16)
  {
    goto LABEL_30;
  }
  account = self->_account;
  v18 = (PKAccount *)v4[73];
  if (!account || !v18)
  {
    if (account == v18)
      goto LABEL_28;
LABEL_30:
    v19 = 0;
    goto LABEL_31;
  }
  if (!-[PKAccount isEqual:](account, "isEqual:"))
    goto LABEL_30;
LABEL_28:
  v19 = self->_transferType == v4[74];
LABEL_31:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountBaseURL);
  objc_msgSend(v3, "safelyAddObject:", self->_defaultBankAccount);
  objc_msgSend(v3, "safelyAddObject:", self->_account);
  v8.receiver = self;
  v8.super_class = (Class)PKAccountServiceTransferRequest;
  v4 = -[PKAccountServiceTransferRequest hash](&v8, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_transferType - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServiceTransferRequest)initWithCoder:(id)a3
{
  id v4;
  PKAccountServiceTransferRequest *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSURL *accountBaseURL;
  uint64_t v10;
  PKBankAccountInformation *defaultBankAccount;
  uint64_t v12;
  PKAccount *account;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountServiceTransferRequest;
  v5 = -[PKPaymentRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountBaseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountBaseURL = v5->_accountBaseURL;
    v5->_accountBaseURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultBankAccount"));
    v10 = objc_claimAutoreleasedReturnValue();
    defaultBankAccount = v5->_defaultBankAccount;
    v5->_defaultBankAccount = (PKBankAccountInformation *)v10;

    v5->_transferType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transferType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v12 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (PKAccount *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountServiceTransferRequest;
  v4 = a3;
  -[PKPaymentRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountBaseURL, CFSTR("accountBaseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultBankAccount, CFSTR("defaultBankAccount"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transferType, CFSTR("transferType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, CFSTR("account"));

}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSURL)accountBaseURL
{
  return self->_accountBaseURL;
}

- (PKBankAccountInformation)defaultBankAccount
{
  return self->_defaultBankAccount;
}

- (void)setDefaultBankAccount:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBankAccount, a3);
}

- (PKAccount)account
{
  return self->_account;
}

- (unint64_t)transferType
{
  return self->_transferType;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPaymentPass)peerPaymentPass
{
  return self->_peerPaymentPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_defaultBankAccount, 0);
  objc_storeStrong((id *)&self->_accountBaseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end
