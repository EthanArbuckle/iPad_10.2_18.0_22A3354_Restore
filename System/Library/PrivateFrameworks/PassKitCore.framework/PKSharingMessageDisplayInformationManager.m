@implementation PKSharingMessageDisplayInformationManager

+ (id)displayInformationForAccessPass:(id)a3 share:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(a1, "displayInformationForAccessPassType:pass:webService:", objc_msgSend(v5, "accessType"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)displayInformationForAccessPass:(id)a3 webService:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "displayInformationForAccessPassType:pass:webService:", objc_msgSend(v7, "accessType"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)displayInformationForAccessPassType:(int64_t)a3 pass:(id)a4 webService:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  objc_class *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  PKSharingMessageDisplayInformation *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "localizedDescription");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 6)
  {
    v9 = 0;
    v10 = 0;
    v38 = 0;
    if (v7)
      goto LABEL_6;
  }
  else
  {
    v9 = off_1E2AD35A8[a3];
    v10 = off_1E2AD35E0[a3];
    PKLocalizedShareableCredentialString(&off_1E2AD3570[a3]->isa, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_6;
  }
  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_msgSend(v7, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "regionForIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "regionCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    PKCurrentRegion();
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  v36 = v18;
  v37 = v12;
  objc_msgSend(v12, "featureWithType:inRegion:", 5, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "openGraphPreviewUrls");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PKSecureElementAccessPassTypeToString(a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "staticContentBaseURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v26 = CFSTR("https://smp-device-content.apple.com/static/displayInfo");
    if (os_variant_has_internal_ui())
    {
      PKStockholmEnvironmentName();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "containsString:", CFSTR("QA")))
        v26 = CFSTR("https://smp-device-qa1.apple.com/static/displayInfo");

    }
    v28 = (objc_class *)MEMORY[0x1E0C99E98];
    v29 = v26;
    v23 = (void *)objc_msgSend([v28 alloc], "initWithString:", v29);

    if (v22)
      goto LABEL_11;
LABEL_17:
    v30 = v9;
    v24 = v7;
    objc_msgSend(v23, "URLByAppendingPathComponent:", v30);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!v22)
    goto LABEL_17;
LABEL_11:
  v24 = v7;
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v22);
LABEL_18:
  v31 = (void *)v25;
  objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("assets"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "URLByAppendingPathComponent:", v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = -[PKSharingMessageDisplayInformation initWithTitle:subtitle:imageURL:openGraphURL:]([PKSharingMessageDisplayInformation alloc], "initWithTitle:subtitle:imageURL:openGraphURL:", v39, v38, v33, v31);
  return v34;
}

@end
