id PDULocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleWithIdentifier:", CFSTR("com.apple.PrivacyDisclosureUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id getDescriptionForCategorySuffix(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  objc_msgSend(CFSTR("NSRegulatoryPrivacyDisclosure"), "stringByAppendingString:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  lookupLocalizedString(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id lookupLocalizedString(void *a1, void *a2)
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

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (platformSpecificSuffixes_once != -1)
    dispatch_once(&platformSpecificSuffixes_once, &__block_literal_global);
  v5 = (id)platformSpecificSuffixes_suffixes;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(v4, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v11 = 0;
  }

  return v11;
}

void PDURetrieveLocalizedTitlesAndDescriptions(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v16 = a2;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    a2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  v17 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v18 = v5;
  objc_msgSend(v5, "localizedInfoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(&unk_2515A8770, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(&unk_2515A8770);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        getDescriptionForCategorySuffix(v7, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(CFSTR("DISCLOSURE_TITLE_"), "stringByAppendingString:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PDULocalizedString(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a2, "addObject:", v15);
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(&unk_2515A8770, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  if (v16)
    *v16 = objc_retainAutorelease(a2);
  if (v17)
    *v17 = objc_retainAutorelease(v6);

}

id PDUWelcomeTitleTextForAppRecord(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  v2 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedInfoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lookupLocalizedString(v5, CFSTR("NSRegulatoryPrivacyDisclosureTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v1, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PDULocalizedString(CFSTR("WELCOME_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id PDULearnMoreDetailTextForAppRecord(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  PDULocalizedString(CFSTR("WELCOME_LEARN_MORE_DETAIL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v1, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id PDULocalizedNameForAppRecord(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v1 = a1;
  v2 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedInfoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lookupLocalizedString(v5, CFSTR("NSRegulatoryPrivacyDisclosureName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v1, "localizedName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

id PDUWelcomeDetailTextForAppRecord(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedInfoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lookupLocalizedString(v5, CFSTR("NSRegulatoryPrivacyDisclosureSummary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSRegulatoryPrivacyDisclosureSummmary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "length"))
    objc_msgSend(v7, "addObject:", v6);
  PDULearnMoreDetailTextForAppRecord(v1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL PDUShouldShowLearnMoreScreen(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BOOL8 v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedInfoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(&unk_2515A8770, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(&unk_2515A8770);
      getDescriptionForCategorySuffix(v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        ++v7;

    }
    v6 = objc_msgSend(&unk_2515A8770, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v6);
  if (v7)
  {
    v11 = 1;
  }
  else
  {
LABEL_12:
    objc_msgSend(v3, "pdu_aboutPrivacyBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12 != 0;

  }
  return v11;
}

id PDULocalizedNameForBundle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "localizedInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  localizedNameForDictionary(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v1, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    localizedNameForDictionary(v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id localizedNameForDictionary(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

void __platformSpecificSuffixes_block_invoke()
{
  int v0;
  const __CFString *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = MGGetSInt32Answer();
  switch(v0)
  {
    case 6:
      v1 = CFSTR("_Watch");
      goto LABEL_7;
    case 3:
      v1 = CFSTR("_iPad");
      goto LABEL_7;
    case 1:
      v1 = CFSTR("_iPhone");
LABEL_7:
      objc_msgSend(v4, "addObject:", v1);
      break;
  }
  objc_msgSend(v4, "addObject:", CFSTR("_iOS"));
  objc_msgSend(v4, "addObject:", &stru_2515A5F70);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)platformSpecificSuffixes_suffixes;
  platformSpecificSuffixes_suffixes = v2;

}

PDUDisclosureReviewViewController_iOS *PDUDisclosureReviewViewControllerForBundle(void *a1)
{
  return PDUDisclosureReviewViewControllerForBundleWithVariant(a1, 1);
}

PDUDisclosureReviewViewController_iOS *PDUDisclosureReviewViewControllerForBundleWithVariant(void *a1, uint64_t a2)
{
  id v3;
  PDUDisclosureReviewViewController_iOS *v4;

  v3 = a1;
  v4 = -[PDUDisclosureReviewViewController_iOS initWithBundle:variant:]([PDUDisclosureReviewViewController_iOS alloc], "initWithBundle:variant:", v3, a2);

  return v4;
}

id PDUDisclosureReviewViewControllerForApplication(void *a1)
{
  return PDUDisclosureReviewViewControllerForApplicationWithVariant(a1, 1);
}

id PDUDisclosureReviewViewControllerForApplicationWithVariant(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v3 = a1;
  v12 = 0;
  objc_msgSend(v3, "findApplicationRecordWithError:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      PDUDisclosureReviewViewControllerForApplicationWithVariant_cold_1((uint64_t)v3, (uint64_t)v5, v6);
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PDUDisclosureReviewViewControllerForBundleWithVariant(v10, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

BOOL PDUDoesApplicationSupportDisclosureReview()
{
  void *v0;
  _BOOL8 v1;

  PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0 != 0;

  return v1;
}

id PDUAllApplicationsSupportingDisclosureReview()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BE78898], "isPreflightFeatureEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    PDCGlobalApplicationEnvironment();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "allApplications");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v26 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v7, "regulatoryPrivacyDisclosureVersion");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            objc_msgSend(v7, "identities");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v22;
              do
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v22 != v12)
                    objc_enumerationMutation(v9);
                  PDCApplicationIdentityToLSApplicationIdentity();
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v0, "addObject:", v14);

                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              }
              while (v11);
            }

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v4);
    }

    v20 = 0;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Preferences"), 0, &v20);
    v16 = v20;
    if (v16)
    {
      v17 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        PDUAllApplicationsSupportingDisclosureReview_cold_1((uint64_t)v16, v17);
    }
    else if (v15)
    {
      objc_msgSend(v15, "identities");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "addObjectsFromArray:", v19);

    }
    return v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id PDUGetBundle()
{
  if (PDUGetBundle_once != -1)
    dispatch_once(&PDUGetBundle_once, &__block_literal_global_0);
  return (id)PDUGetBundle_result;
}

id PDUConvertColorString(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  int v4;
  int v5;
  int v6;
  double v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2 == 6)
  {
    v11 = 0;
    HIDWORD(v10) = 0;
    v3 = objc_retainAutorelease(v1);
    if (sscanf((const char *)objc_msgSend(v3, "cStringUsingEncoding:", 1), "%02x%02x%02x", (char *)&v11 + 4, &v11, (char *)&v10 + 4) == 3)
    {
      v5 = v11;
      v4 = HIDWORD(v11);
      v7 = 1.0;
      v6 = HIDWORD(v10);
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  if (v2 != 8)
  {

    goto LABEL_10;
  }
  v10 = 0;
  v11 = 0;
  v3 = objc_retainAutorelease(v1);
  if (sscanf((const char *)objc_msgSend(v3, "cStringUsingEncoding:", 1), "%02x%02x%02x%02x", (char *)&v11 + 4, &v11, (char *)&v10 + 4, &v10) != 4)
  {
LABEL_8:

LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  v5 = v11;
  v4 = HIDWORD(v11);
  v6 = HIDWORD(v10);
  v7 = (double)(int)v10 / 255.0;
LABEL_7:

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v4 / 255.0, (double)v5 / 255.0, (double)v6 / 255.0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v8;
}

uint64_t PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI()
{
  if (PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_onceToken != -1)
    dispatch_once(&PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_onceToken, &__block_literal_global_2);
  return PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_log;
}

void sub_244A0A55C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id PDUWelcomeViewControllerForApplication(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  PDCGlobalConsentStoreInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PDUWelcomeViewControllerForApplicationWithConsentStore(v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

PDUWelcomeViewController_iOS *PDUWelcomeViewControllerForApplicationWithConsentStore(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  PDUWelcomeViewController_iOS *v8;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = -[PDUWelcomeViewController_iOS initWithApplicationIdentity:consentStore:]([PDUWelcomeViewController_iOS alloc], "initWithApplicationIdentity:consentStore:", v7, v5);

  -[PDUWelcomeViewController_iOS setDelegate:](v8, "setDelegate:", v6);
  return v8;
}

id stackForViews(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v1);
    objc_msgSend(v2, "setAxis:", 1);
    objc_msgSend(v2, "setDistribution:", 0);
    objc_msgSend(v2, "setSpacing:", 1.17549435e-38);
    objc_msgSend(v2, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v2, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void fillViewWithNewSubview(void *a1, void *a2)
{
  id v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "addSubview:", v3);
  objc_msgSend(v3, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(v3, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(v3, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v9;
  objc_msgSend(v3, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraints:", v13);

  objc_msgSend(v4, "setNeedsLayout");
}

id PDUWelcomeTintColorForApplicationIdentity(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;

  v1 = a1;
  v7 = 0;
  objc_msgSend(v1, "findApplicationRecordWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    v4 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      PDUDisclosureReviewViewControllerForApplicationWithVariant_cold_1((uint64_t)v1, (uint64_t)v3, v4);
    v5 = 0;
  }
  else
  {
    PDUWelcomeTintColorForApplicationRecord(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id PDUWelcomeTintColorForApplicationRecord(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PDUWelcomeTintColorForBundle((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id PDUWelcomeTintColorForBundle(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PDUAppDisclosureStyle styleWithBundle:](PDUAppDisclosureStyle, "styleWithBundle:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void PDUDisclosureReviewViewControllerForApplicationWithVariant_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_244A07000, log, OS_LOG_TYPE_ERROR, "Attempt to locate app %@ failed: %@", (uint8_t *)&v3, 0x16u);
}

void PDUAllApplicationsSupportingDisclosureReview_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_244A07000, a2, OS_LOG_TYPE_ERROR, "Attempt to locate settings failed: %@", (uint8_t *)&v2, 0xCu);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

uint64_t PDCApplicationIdentityToLSApplicationIdentity()
{
  return MEMORY[0x24BE788A8]();
}

uint64_t PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity()
{
  return MEMORY[0x24BE788B0]();
}

uint64_t PDCGlobalApplicationEnvironment()
{
  return MEMORY[0x24BE788B8]();
}

uint64_t PDCGlobalConsentStoreInstance()
{
  return MEMORY[0x24BE788C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

