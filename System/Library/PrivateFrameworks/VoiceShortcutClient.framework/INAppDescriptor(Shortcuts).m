@implementation INAppDescriptor(Shortcuts)

- (id)serializedRepresentation
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("Name"));

  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("BundleIdentifier"));

  objc_msgSend(a1, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("ExtensionBundleIdentifier"));

  objc_msgSend(a1, "teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("TeamIdentifier"));

  return v2;
}

- (uint64_t)initWithBundleRecord:()Shortcuts
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v13 = v6;

    objc_msgSend(v13, "if_extensionAttributesDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD3F8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0CBD728]);
    objc_msgSend(v13, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "teamIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v18, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v19, 0, v20, 0, v21, v17, v22, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a1 = (id)objc_msgSend(a1, "initWithApplicationRecord:", v4);
      v7 = (uint64_t)a1;
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0CBD728]);
      objc_msgSend(v4, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "teamIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v9, v10, 0, 0, v11, 0, v12, 0);

    }
  }

  return v7;
}

- (uint64_t)initWithSerializedRepresentation:()Shortcuts
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v4, "objectForKey:", CFSTR("BundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v4, "objectForKey:", CFSTR("ExtensionBundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v4, "objectForKey:", CFSTR("TeamIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  v17 = objc_msgSend(a1, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v7, v10, v13, 0, v16, 0, 0, 0);
  return v17;
}

- (uint64_t)hashForSmartPromptPurposes
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(a1, "teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  if (a1 == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = v5;
        else
          v6 = 0;
      }
      else
      {
        v6 = 0;
      }
      v8 = v6;

      objc_msgSend(a1, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(&unk_1E6004078, "containsObject:", v9))
      {
        objc_msgSend(v8, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(&unk_1E6004078, "containsObject:", v10);

      }
      else
      {
        v11 = 0;
      }

      objc_msgSend(a1, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = v13;
      v16 = v15;
      if (v14 == v15)
      {
        v11 = 1;
      }
      else if (v14 && v15)
      {
        v11 |= objc_msgSend(v14, "isEqualToString:", v15);
      }

      objc_msgSend(a1, "teamIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "teamIdentifier");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v17)
      {
        if (v18)
          goto LABEL_20;
      }
      else
      {
        objc_msgSend(a1, "applicationRecord");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "teamIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
LABEL_20:
          if (v11)
          {
LABEL_21:
            v20 = v17;
            v21 = v19;
            v22 = v21;
            if (v20 == v21)
            {
              v7 = 1;
            }
            else
            {
              v7 = 0;
              if (v20 && v21)
                v7 = objc_msgSend(v20, "isEqualToString:", v21);
            }

            goto LABEL_30;
          }
LABEL_27:
          v7 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      objc_msgSend(v8, "applicationRecord");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "teamIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_21;
      goto LABEL_27;
    }
    v7 = 0;
  }
LABEL_31:

  return v7;
}

- (uint64_t)isThirdParty
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.siri.TeaMinus"), CFSTR("com.iosframeworksqa.Receptor"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(a1, "extensionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PBBridgeSupport.BridgeIntents"));

    if ((v8 & 1) != 0)
    {
      v6 = 0;
      goto LABEL_12;
    }
    objc_msgSend(a1, "applicationRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "developerType") == 3)
      {
        v6 = 1;
LABEL_11:

        goto LABEL_12;
      }
      if (objc_msgSend(v10, "developerType") == 1)
      {
        v6 = 0;
        goto LABEL_11;
      }
    }
    objc_msgSend(a1, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple."));

    objc_msgSend(a1, "extensionBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple."));

    v6 = (v13 | v12) ^ 1;
    goto LABEL_11;
  }
  v6 = 1;
LABEL_12:

  return v6;
}

- (uint64_t)isShortcutsApp
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.shortcuts"));

  return v2;
}

- (id)selfIfNotShortcutsApp
{
  void *v2;

  if (objc_msgSend(a1, "isShortcutsApp"))
    v2 = 0;
  else
    v2 = a1;
  return v2;
}

@end
