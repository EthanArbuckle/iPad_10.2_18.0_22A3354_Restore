@implementation PKStandaloneTransactionBannerHandleRequest(PKBannerViewController)

- (id)createBannerViewController
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v31;

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passWithUniqueID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(a1, "transactionType");
  if (v5 == 1)
  {
    v6 = CFSTR("lock.fill");
    v7 = CFSTR("TRANSACTION_LOCKED");
  }
  else
  {
    if (v5 != 2)
    {
      v9 = 0;
LABEL_14:
      v17 = 0;
      goto LABEL_28;
    }
    v6 = CFSTR("lock.open.fill");
    v7 = CFSTR("TRANSACTION_UNLOCKED");
  }
  PKLocalizedCredentialString(&v7->isa);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v4)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    goto LABEL_14;
  objc_msgSend(v4, "secureElementPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isHomeKeyPass");
  v14 = SBSIsSystemApertureAvailable();
  if (v13 && v12)
  {
    if (v14)
    {
      v15 = v12;
      v16 = v9;
    }
    else
    {
      v15 = v9;
      v16 = v12;
    }
    v26 = v16;
    v27 = 0;
    v28 = 2;
  }
  else
  {
    if (v14)
    {
      objc_msgSend(v4, "localizedDescription");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "organizationName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v15)
      {
        v20 = objc_msgSend(v15, "length");
        v21 = objc_msgSend(v19, "length");
        if (v20 > v21 + 1)
        {
          v22 = v21;
          v31 = v21 + 1;
          if (objc_msgSend(v15, "hasPrefix:", v19))
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", v22));

            if (v24)
            {
              objc_msgSend(v15, "substringFromIndex:", v31);
              v25 = objc_claimAutoreleasedReturnValue();

              v15 = (id)v25;
            }
          }
        }
      }
      else
      {
        v15 = v18;
      }
      v26 = v9;

      v27 = 0;
    }
    else
    {
      v15 = v9;
      objc_msgSend(v4, "localizedDescription");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = 0;
  }
  v29 = +[PKPassBannerTrailingViewConfiguration createWithSymbolName:overrideColor:](PKPassBannerTrailingViewConfiguration, "createWithSymbolName:overrideColor:", v6, v27);
  v17 = +[PKPassBannerViewController createForTransactionWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:](PKPassBannerViewController, "createForTransactionWithPass:primaryText:secondaryText:preferredLabelAxis:trailingViewConfiguration:walletForeground:", v4, v15, v26, v28, v29, objc_msgSend(a1, "isWalletForeground"));

LABEL_28:
  return v17;
}

@end
