@implementation INAppIntentDescriptor(Shortcuts)

- (id)serializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_1EEE75610;
  objc_msgSendSuper2(&v6, sel_serializedRepresentation);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(a1, "intentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("AppIntentIdentifier"));

  return v3;
}

- (uint64_t)initWithFullyQualifiedActionIdentifier:()Shortcuts
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CA5898];
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "containingBundleRecord");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = v8;
    if (!v9)
    {
LABEL_9:

      v12 = 0;
      v9 = 0;
      if ((v10 & 1) != 0)
        goto LABEL_10;
LABEL_8:
      objc_msgSend(v11, "bundleIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {

    v9 = v8;
    v11 = 0;
    v10 = 1;
    if (!v9)
      goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  objc_msgSend(v9, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((v10 & 1) == 0)
    goto LABEL_8;
LABEL_10:
  v13 = 0;
LABEL_11:
  if (!(v12 | v13))
  {
    objc_msgSend(v4, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "actionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "teamIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "initWithIntentIdentifier:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:supportedEntities:bundleURL:documentTypes:", v14, v15, v12, v13, 0, v16, 0, 0, 0, 0);

  return v17;
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
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;

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

  objc_msgSend(v4, "objectForKey:", CFSTR("AppIntentIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  v20 = objc_msgSend(a1, "initWithIntentIdentifier:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:supportedEntities:bundleURL:documentTypes:", v19, v7, v10, v13, 0, v16, 0, 0, 0, 0);
  return v20;
}

- (uint64_t)hashForSmartPromptPurposes
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_1EEE75610;
  v2 = (unint64_t)objc_msgSendSuper2(&v6, sel_hashForSmartPromptPurposes);
  objc_msgSend(a1, "intentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") ^ v2;

  return v4;
}

- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  if (a1 == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16.receiver = a1;
      v16.super_class = (Class)&off_1EEE75610;
      v5 = objc_msgSendSuper2(&v16, sel_isEqualForSmartPromptPurposes_, v4);
      v6 = v4;
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      v9 = v7;

      if (v5)
      {
        objc_msgSend(a1, "intentIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "intentIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10;
        v13 = v11;
        v14 = v13;
        if (v12 == v13)
        {
          v8 = 1;
        }
        else
        {
          v8 = 0;
          if (v12 && v13)
            v8 = objc_msgSend(v12, "isEqualToString:", v13);
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

@end
