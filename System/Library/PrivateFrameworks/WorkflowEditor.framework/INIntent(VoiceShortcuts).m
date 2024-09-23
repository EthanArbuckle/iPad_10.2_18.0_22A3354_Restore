@implementation INIntent(VoiceShortcuts)

- (uint64_t)vcui_isIntentFromSystemApp
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "launchId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "launchId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INExtractAppInfoFromSiriLaunchId();
  v4 = (__CFString *)0;
  v5 = 0;

  v6 = 0;
  if (v4 && v5)
  {
    if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.callhistory.sync-helper")) & 1) != 0
      || -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.InCallService")))
    {

      v4 = CFSTR("com.apple.mobilephone");
    }
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqualToString:", CFSTR("System"));

  }
  return v6;
}

- (id)vcui_displayImage
{
  uint64_t i;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  UIImage *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  UIImage *v32;
  void *v33;
  void *v34;
  int v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  uint64_t v53;
  _QWORD v54[3];
  _BYTE v55[128];
  uint64_t v56;

  v2 = a1;
  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "vcui_keyPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

LABEL_42:
    objc_msgSend(v2, "keyImage");
    i = objc_claimAutoreleasedReturnValue();
    return (id)i;
  }
  objc_msgSend(v2, "keyImage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v2, "vcui_isIntentFromSystemApp");

    if (!v6)
      goto LABEL_42;
  }
  else
  {

  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "vcui_keyPeople");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v13, "contactIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "addObject:", v14);
        if (!v11)
        {
          objc_msgSend(v13, "nameComponents");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEB8]), "initWithStyle:diameter:", 0, 60.0);
  if (objc_msgSend(v7, "count") && WFCNContactIsAuthorizedToAccessContact())
  {
    v42 = v15;
    v16 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsWithIdentifiers:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BDBA2F0];
    v54[0] = *MEMORY[0x24BDBA3E8];
    v54[1] = v19;
    v54[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v39 = v16;
    objc_msgSend(v16, "unifiedContactsMatchingPredicate:keysToFetch:error:", v17, v20, &v45);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    i = (uint64_t)v45;
    if (i)
    {
      getWFGeneralLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v51 = "-[INIntent(VoiceShortcuts) vcui_displayImage]";
        v52 = 2114;
        v53 = i;
        _os_log_impl(&dword_226666000, v22, OS_LOG_TYPE_ERROR, "%s Error %{public}@ fetching contacts with predicate", buf, 0x16u);
      }

    }
    v40 = (void *)i;
    v23 = objc_msgSend(v21, "count");
    if (v23)
    {
      v24 = (void *)MEMORY[0x24BDD9DA8];
      objc_msgSend(v42, "monogramForContacts:", v21);
      v37 = v20;
      v25 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v25);
      v38 = v18;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "imageWithImageData:", v26);
      i = objc_claimAutoreleasedReturnValue();

      v18 = v38;
      v20 = v37;
    }

    if (v23)
    {
      v35 = 0;
      v15 = v42;
      goto LABEL_41;
    }
    v15 = v42;
    goto LABEL_40;
  }
  if (!v11)
  {
LABEL_40:
    v35 = 1;
    goto LABEL_41;
  }
  objc_msgSend(v11, "givenName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "length"))
  {
    objc_msgSend(v27, "substringToIndex:", 1);
    v28 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = &stru_24EE26238;
  }
  objc_msgSend(v11, "familyName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v27;
  v44 = v2;
  if (objc_msgSend(v29, "length"))
  {
    objc_msgSend(v29, "substringToIndex:", 1);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = &stru_24EE26238;
  }
  v31 = (void *)MEMORY[0x24BDD9DA8];
  objc_msgSend(v15, "monogramForPersonWithFirstName:lastName:", v28, v30);
  v41 = (__CFString *)v28;
  v32 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v32);
  v33 = v15;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "imageWithImageData:", v34);
  i = objc_claimAutoreleasedReturnValue();

  v15 = v33;
  v35 = 0;
  v2 = v44;
LABEL_41:

  if (v35)
    goto LABEL_42;
  return (id)i;
}

- (uint64_t)vcui_keyPeople
{
  return 0;
}

@end
