@implementation MKWalletRAPReport(InitWithTransaction)

- (void)initForMerchantIssue:()InitWithTransaction transaction:account:comments:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;

  v8 = a4;
  v9 = a5;
  v51 = a6;
  objc_msgSend(v8, "issueReportIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v52 = v9;
  objc_msgSend(v8, "merchant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapsMerchant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapsBrand");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postalAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v10;
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C973B0];
    objc_msgSend(v14, "postalAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromPostalAddress:style:", v18, 0);
    v19 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  objc_msgSend(v8, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "coordinate");
  v22 = v21;
  v24 = v23;

  v44 = objc_msgSend(v13, "industryCode");
  v48 = (void *)v15;
  v49 = v14;
  if (objc_msgSend(v14, "identifier"))
    v25 = v14;
  else
    v25 = (void *)v15;
  v43 = objc_msgSend(v25, "identifier");
  objc_msgSend(v13, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rawName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "industryCategory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "originURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "absoluteString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v19;
  if (v19)
    v31 = (const __CFString *)v19;
  else
    v31 = &stru_1E3E7D690;
  objc_msgSend(v8, "transactionDate");
  v32 = v8;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
  v35 = v34;
  objc_msgSend(v8, "transactionType");
  PKPaymentTransactionTypeToString();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(a1, "initForMerchantIssue:merchantIndustryCode:mapsIdentifier:merchantName:merchantRawName:merchantIndustryCategory:merchantURL:merchantFormattedAddress:transactionTime:transactionType:transactionLocation:", a3, v44, v43, v26, v27, v28, v35, v22, v24, v30, v31, v36);

  if (v37)
  {
    objc_msgSend(v37, "setIsAppleCard:", objc_msgSend(v52, "feature") == 2);
    v38 = objc_msgSend(v32, "transactionSource");
    objc_msgSend(v32, "transactionType");
    if ((unint64_t)(v38 - 1) > 7)
      v39 = 0;
    else
      v39 = qword_19DF160C8[v38 - 1];
    objc_msgSend(v37, "setLookupTransactionType:", v39);
    if (objc_msgSend(v32, "hasEffectiveTransactionSource"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "adamIdentifier"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringValue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setMerchantAdamId:", v41);

    }
    objc_msgSend(v37, "setCorrelationId:", v50);
    objc_msgSend(v37, "setReportersComment:", v51);
  }

  return v37;
}

@end
