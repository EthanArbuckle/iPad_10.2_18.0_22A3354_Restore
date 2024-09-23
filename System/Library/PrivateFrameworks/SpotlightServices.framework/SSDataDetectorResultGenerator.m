@implementation SSDataDetectorResultGenerator

- (void)cancel
{
  int64_t ddJobIdentifier;

  if (self)
    ddJobIdentifier = self->_ddJobIdentifier;
  else
    ddJobIdentifier = 0;
  objc_msgSend(MEMORY[0x1E0D1CE70], "cancelJob:", ddJobIdentifier);
}

- (void)getResultSections:(id)a3 queryId:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  int64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CE78]), "initWithScannerType:passiveIntent:", 0, 1);
  objc_msgSend(v10, "setResultsOptions:", objc_msgSend(v10, "resultsOptions") | 0x1000);
  v11 = objc_msgSend(v8, "length");
  v12 = (void *)MEMORY[0x1E0D1CE70];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__SSDataDetectorResultGenerator_getResultSections_queryId_completion___block_invoke;
  v16[3] = &unk_1E6E440C0;
  v18 = v9;
  v19 = 0;
  v20 = v11;
  v21 = a4;
  v16[4] = self;
  v17 = v8;
  v13 = v8;
  v14 = v9;
  v15 = objc_msgSend(v12, "scanString:range:configuration:completionBlock:", v13, 0, v11, v10, v16);
  if (self)
    self->_ddJobIdentifier = v15;

}

void __70__SSDataDetectorResultGenerator_getResultSections_queryId_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  char HasProperties;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_12;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if ((*(_BYTE *)(v4 + 8) & 1) != 0)
      goto LABEL_12;
  }
  objc_msgSend(v11, "coreResult");
  HasProperties = DDResultHasProperties();
  v7 = objc_msgSend(v11, "range") == *(_QWORD *)(a1 + 56) && v6 == *(_QWORD *)(a1 + 64);
  v8 = v7;
  if ((HasProperties & 1) == 0 && !v8)
    goto LABEL_12;
  if (v8)
  {
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CBA0]))
    {
      objc_msgSend(*(id *)(a1 + 32), "buildResultSectionsForTrackingNumberFromResult:completion:queryId:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
      goto LABEL_13;
    }
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CB40]))
    {
      objc_msgSend(v11, "coreResult");
      if (DDResultIsValidPhoneNumber())
      {
        objc_msgSend(*(id *)(a1 + 32), "buildResultSectionsForPhoneNumberFromResult:completion:queryId:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
        goto LABEL_13;
      }
    }
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CB40]);
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CAB0]))
  {
    objc_msgSend(*(id *)(a1 + 32), "buildResultSectionsForEmailFromResult:completion:queryId:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
    goto LABEL_13;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CA98]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CB88]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CAA0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CB80]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1CA90]))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coreResult");
    if (DDResultIsPastDate())
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    else
      objc_msgSend(*(id *)(a1 + 32), "buildResultSectionsForDateTimeFromResult:querString:completion:queryId:searchString:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));

  }
  else
  {
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_13:

}

- (void)buildResultSectionsForTrackingNumberFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5
{
  void (**v8)(id, void *);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *))a4;
  v9 = a3;
  objc_msgSend(v9, "subResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "coreResult");
  DDResultGetShipmentTrackingUrlString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSDataDetectorResultGenerator buildResultSectionForTrackingNumber:carrier:url:queryId:](self, "buildResultSectionForTrackingNumber:carrier:url:queryId:", v15, v12, v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v17);

}

- (id)buildResultSectionForTrackingNumber:(id)a3 carrier:(id)a4 url:(id)a5 queryId:(unint64_t)a6
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v31;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D8C660];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "textWithString:", a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v11;
  objc_msgSend(v11, "setPunchout:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setSymbolName:", CFSTR("shippingbox.fill"));
  v29 = v13;
  objc_msgSend(v13, "setIsTemplate:", 1);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTitle:", v31);
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDescriptions:", v16);

  objc_msgSend(v14, "setThumbnail:", v13);
  objc_msgSend(v14, "setCommand:", v11);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setRedComponent:", 0.635294118);
  objc_msgSend(v17, "setGreenComponent:", 0.517647059);
  objc_msgSend(v17, "setBlueComponent:", 0.368627451);
  objc_msgSend(v17, "setColorTintStyle:", 1);
  objc_msgSend(v14, "setBackgroundColor:", v17);
  v33 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_PACKAGE_TRACKING_SECTION_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_PACKAGE_TRACKING_COMPLETION"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDataDetectorResultGenerator buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:](self, "buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:", v18, a6, CFSTR("com.apple.datadetector.quick_actions.tracking_number"), v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "punchout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "results");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPunchout:", v24);

  return v23;
}

- (void)buildResultSectionsForPhoneNumberFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5
{
  void (**v8)(id, _QWORD);
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a4;
  v27 = 0;
  v9 = objc_msgSend(a3, "getPhoneValue:label:", &v27, 0);
  v10 = v27;
  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v10);
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v30[0] = *MEMORY[0x1E0C967C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unifiedContactsMatchingPredicate:keysToFetch:error:", v12, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v10 || v16)
    {
      v8[2](v8, MEMORY[0x1E0C9AA60]);
    }
    else
    {
      -[SSDataDetectorResultGenerator buildCardSectionForPhoneNumber:](self, "buildCardSectionForPhoneNumber:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v11;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a5;
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_PHONE_NUMBER_SECTION_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_PHONE_NUMBER_COMPLETION"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSDataDetectorResultGenerator buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:](self, "buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:", v24, v18, CFSTR("com.apple.datadetector.quick_actions.phone_number"), v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v23);

      v11 = v26;
    }

  }
  else
  {
    v8[2](v8, MEMORY[0x1E0C9AA60]);
  }

}

- (id)buildCardSectionForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSDataDetectorResultGenerator personWithPhoneNumber:email:](self, "personWithPhoneNumber:email:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_NUMBER"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDataDetectorResultGenerator buildPersonBasedSubtitleButtonItemWithTitle:person:](self, "buildPersonBasedSubtitleButtonItemWithTitle:person:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setPerson:", v5);
  TUNetworkCountryCode();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TUFormattedPhoneNumber();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v13);

  objc_msgSend(v12, "setSubtitleButtonItem:", v8);
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTrailingButtonItems:", v14);

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setPhoneNumber:", v4);

  objc_msgSend(v12, "setCommand:", v15);
  return v12;
}

- (void)buildResultSectionsForEmailFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5
{
  void (**v8)(id, _QWORD);
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a4;
  v25 = 0;
  v9 = objc_msgSend(a3, "getMailValue:label:", &v25, 0);
  v10 = v25;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v28[0] = *MEMORY[0x1E0C966A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v10 || v15)
    {
      v8[2](v8, MEMORY[0x1E0C9AA60]);
    }
    else
    {
      -[SSDataDetectorResultGenerator buildCardSectionForEmail:](self, "buildCardSectionForEmail:", v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a5;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_EMAIL_SECTION_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_EMAIL_COMPLETION"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSDataDetectorResultGenerator buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:](self, "buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:", v23, v22, CFSTR("com.apple.datadetector.quick_actions.email"), v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v21);

    }
  }
  else
  {
    v8[2](v8, MEMORY[0x1E0C9AA60]);
  }

}

- (id)buildCardSectionForEmail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSDataDetectorResultGenerator personWithPhoneNumber:email:](self, "personWithPhoneNumber:email:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_EMAIL"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDataDetectorResultGenerator buildPersonBasedSubtitleButtonItemWithTitle:person:](self, "buildPersonBasedSubtitleButtonItemWithTitle:person:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setPerson:", v5);
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  objc_msgSend(v10, "setSubtitleButtonItem:", v8);
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTrailingButtonItems:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setEmail:", v4);

  objc_msgSend(v10, "setCommand:", v13);
  return v10;
}

- (id)buildPersonBasedSubtitleButtonItemWithTitle:(id)a3 person:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAddToExistingContact:", 0);
  objc_msgSend(v8, "setPerson:", v6);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_CONTACT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDataDetectorResultGenerator buttonItemWithTitle:symbol:command:](self, "buttonItemWithTitle:symbol:command:", v10, CFSTR("person.crop.circle"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setAddToExistingContact:", 1);
  objc_msgSend(v12, "setPerson:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ADD_TO_EXISTING_CONTACT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDataDetectorResultGenerator buttonItemWithTitle:symbol:command:](self, "buttonItemWithTitle:symbol:command:", v14, CFSTR("person.crop.circle.badge.plus"), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSDataDetectorResultGenerator buttonItemWithTitle:symbol:command:](self, "buttonItemWithTitle:symbol:command:", v7, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v11;
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPreviewButtonItems:", v17);

  return v16;
}

- (id)personWithPhoneNumber:(id)a3 email:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (v5)
  {
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhoneNumbers:", v8);

  }
  if (v6)
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmailAddresses:", v9);

  }
  return v7;
}

- (void)buildResultSectionsForDateTimeFromResult:(id)a3 querString:(id)a4 completion:(id)a5 queryId:(unint64_t)a6 searchString:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  SSDataDetectorResultGenerator *v17;
  void *v18;
  int v19;
  char v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SSDataDetectorResultGenerator *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  SSDataDetectorResultGenerator *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  unsigned __int8 v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v75 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D1CB80];
  v74 = (void *)v14;
  v76 = v10;
  v17 = self;
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D1CB80]))
  {

  }
  else
  {
    objc_msgSend(v10, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1CA90]);

    if (!v19)
    {
      objc_msgSend(v10, "dateFromReferenceDate:referenceTimezone:timezoneRef:allDayRef:", v14, v13, 0, &v79);
      v25 = objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v73 = v13;
      v70 = v16;
      if (v79 || !v25)
      {
        v23 = (id)v25;
      }
      else
      {
        v23 = (id)v25;
        objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 32, 1);
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_11:
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v76, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ "), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "stringByReplacingOccurrencesOfString:withString:", v28, &stru_1E6E549F0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v76, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", v30, &stru_1E6E549F0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v23;
      if (!v23 || (v32 = v17) != 0 && v17->_canceled)
      {
        v24 = (void (**)(_QWORD, _QWORD))v11;
        (*((void (**)(id, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AA60]);

LABEL_31:
        v13 = v73;
        goto LABEL_32;
      }
      v24 = (void (**)(_QWORD, _QWORD))v11;
      if (v22)
      {
        v33 = objc_msgSend(v22, "compare:", v23);
        v34 = v70;
        if (v33 == -1)
        {
          v35 = v22;

          v22 = v21;
          v21 = v35;
        }
      }
      else
      {
        v34 = v70;
      }
      v69 = v12;
      if (objc_msgSend(v21, "compare:", v74) == -1 && objc_msgSend(v12, "isDateInToday:", v21))
      {
        objc_msgSend(v76, "type");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0D1CB88]))
        {

LABEL_24:
          objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, 1, v21, 0);
          v39 = objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 16, 1, v22, 0);
            v40 = objc_claimAutoreleasedReturnValue();

            v22 = (id)v40;
          }
          v21 = (id)v39;
          goto LABEL_27;
        }
        objc_msgSend(v76, "type");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToString:", v34);

        if (v38)
          goto LABEL_24;
      }
LABEL_27:
      v41 = (void *)objc_opt_new();
      v68 = v31;
      if (objc_msgSend(v31, "length"))
      {
        objc_msgSend(v41, "setTitle:", v31);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("NEW_EVENT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setTitle:", v43);

      }
      objc_msgSend(v41, "setStartDate:", v21);
      objc_msgSend(v41, "setEndDate:", v22);
      objc_msgSend(v41, "setIsAllDay:", v79);
      v44 = (void *)objc_opt_new();
      objc_msgSend(v44, "setEvent:", v41);
      v71 = v22;
      v45 = (void *)objc_opt_new();
      v46 = (void *)MEMORY[0x1E0D8C660];
      objc_msgSend(v41, "title");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "textWithString:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setTitle:", v48);

      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C200]), "initWithDate:", v21);
      objc_msgSend(v45, "setThumbnail:", v49);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("ADD"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSDataDetectorResultGenerator buttonItemWithTitle:symbol:command:](v32, "buttonItemWithTitle:symbol:command:", v51, 0, v44);
      v67 = v41;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
      v66 = v32;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setButtonItems:", v53);

      objc_msgSend(v45, "setButtonItemsAreTrailing:", 1);
      objc_msgSend(v45, "setCommand:", v44);
      v54 = (void *)MEMORY[0x1E0D8C660];
      +[SSDateFormatManager stringsFromDate:toDate:isAllDay:](SSDateFormatManager, "stringsFromDate:toDate:isAllDay:", v21, v22, v79);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR(" · "));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "textWithString:", v56);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v82 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setDescriptions:", v57);

      v81 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_CALENDAR_EVENT_SECTION_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("QUICK_ACTION_CALENDAR_EVENT_COMPLETION"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSDataDetectorResultGenerator buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:](v66, "buildResultSectionWithCardSections:queryId:resultBundleId:sectionTitle:completion:", v58, a6, CFSTR("com.apple.datadetector.quick_actions.calendar"), v60, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v80 = v63;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v24)[2](v24, v64);

      v22 = v71;
      v12 = v69;
      goto LABEL_31;
    }
  }
  v77 = 0;
  v78 = 0;
  v20 = objc_msgSend(v10, "extractStartDate:startTimezone:endDate:endTimezone:allDayRef:referenceDate:referenceTimezone:", &v78, 0, &v77, 0, &v79, v14, v13);
  v21 = v78;
  v22 = v77;
  if ((v20 & 1) != 0)
  {
    v70 = v16;
    v23 = v21;
    v73 = v13;
    goto LABEL_11;
  }
  v24 = (void (**)(_QWORD, _QWORD))v11;
  (*((void (**)(id, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AA60]);
LABEL_32:

}

- (id)buildResultSectionWithCardSections:(id)a3 queryId:(unint64_t)a4 resultBundleId:(id)a5 sectionTitle:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SFSearchResult_SpotlightExtras *v16;
  void *v17;
  SFMutableResultSection *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setCardSections:", v14);

  v16 = objc_alloc_init(SFSearchResult_SpotlightExtras);
  -[SFSearchResult_SpotlightExtras setInlineCard:](v16, "setInlineCard:", v15);
  -[SFSearchResult_SpotlightExtras setTopHit:](v16, "setTopHit:", SSSetTopHitWithReasonString(2, v16, CFSTR("SSDataDetectorResultGenerator direct"), 1));
  -[SFSearchResult_SpotlightExtras setResultBundleId:](v16, "setResultBundleId:", v13);

  -[SFSearchResult_SpotlightExtras setSectionBundleIdentifier:](v16, "setSectionBundleIdentifier:", CFSTR("com.apple.datadetector.quick_actions"));
  -[SFSearchResult_SpotlightExtras setSectionHeader:](v16, "setSectionHeader:", v12);
  -[SFSearchResult_SpotlightExtras setQueryId:](v16, "setQueryId:", a4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%llu"), CFSTR("com.apple.datadetector.quick_actions"), a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult_SpotlightExtras setIdentifier:](v16, "setIdentifier:", v17);

  -[SFSearchResult_SpotlightExtras setCompletion:](v16, "setCompletion:", v11);
  -[SFSearchResult_SpotlightExtras setApplicationBundleIdentifier:](v16, "setApplicationBundleIdentifier:", CFSTR("com.apple.datadetector.quick_actions"));
  -[SFSearchResult_SpotlightExtras setType:](v16, "setType:", 2);
  v18 = objc_alloc_init(SFMutableResultSection);
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMutableResultSection setResults:](v18, "setResults:", v19);

  -[SFResultSection setBundleIdentifier:](v18, "setBundleIdentifier:", CFSTR("com.apple.datadetector.quick_actions"));
  -[SFMutableResultSection setDomain:](v18, "setDomain:", 10);
  -[SFResultSection setTitle:](v18, "setTitle:", v12);

  return v18;
}

- (id)buttonItemWithTitle:(id)a3 symbol:(id)a4 command:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setTitle:", v9);

  if (v7)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setIsTemplate:", 1);
    objc_msgSend(v11, "setSymbolName:", v7);
    objc_msgSend(v10, "setImage:", v11);

  }
  objc_msgSend(v10, "setCommand:", v8);

  return v10;
}

@end
