@implementation INIntentDescriptor(Shortcuts)

- (id)_displayableAppDescriptor
{
  void *v2;
  void *v3;
  int v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  os_log_t v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayableBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(a1, "appDescriptor");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CA5870]);
    objc_msgSend(a1, "displayableBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 0, &v13);
    v9 = v13;

    if (v8)
    {
      v10 = (os_log_t)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithApplicationRecord:", v8);
      objc_msgSend(a1, "extensionBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject descriptorWithExtensionBundleIdentifier:](v10, "descriptorWithExtensionBundleIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = os_log_create("com.apple.siri", "Intents");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_error_impl(&dword_1AF681000, v10, OS_LOG_TYPE_ERROR, "Unable to get an app record for the displayable app, returning the launchable app instead. (%@)", buf, 0xCu);
      }
      objc_msgSend(a1, "appDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v12;
  }
}

- (id)serializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_1EEE751B0;
  objc_msgSendSuper2(&v6, sel_serializedRepresentation);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(a1, "intentClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("IntentClassName"));

  return v3;
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

  objc_msgSend(v4, "objectForKey:", CFSTR("IntentClassName"));
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

  v20 = objc_msgSend(a1, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v19, v7, v10, 0, v13, 0, 0, v16, 0, 0, 0, 0);
  return v20;
}

- (uint64_t)hashForSmartPromptPurposes
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_1EEE751B0;
  v2 = (unint64_t)objc_msgSendSuper2(&v6, sel_hashForSmartPromptPurposes);
  objc_msgSend(a1, "displayableBundleIdentifier");
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
      v16.super_class = (Class)&off_1EEE751B0;
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
        objc_msgSend(a1, "displayableBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayableBundleIdentifier");
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
