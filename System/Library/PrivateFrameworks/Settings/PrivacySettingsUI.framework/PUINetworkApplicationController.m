@implementation PUINetworkApplicationController

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bundleIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUINetworkApplicationController;
  v4 = a3;
  -[PUINetworkApplicationController setSpecifier:](&v7, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("PUINetworkApplicationKey"), v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUINetworkApplicationController bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_10;
    v8 = (void *)MEMORY[0x1E0CA5860];
    -[PUINetworkApplicationController bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationProxyForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_10;
    objc_msgSend(v10, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.networking.bonjour-services"), objc_opt_class());
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "entitlementValueForKey:ofClass:", CFSTR("com.apple.developer.networking.multicast"), objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB3940];
      if (!v13)
      {
        v15 = CFSTR("LOCAL_NETWORK_BONJOUR");
LABEL_9:
        PUI_LocalizedStringForPrivacy(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setProperty:forKey:", v18, *MEMORY[0x1E0D80848]);
LABEL_10:
        objc_msgSend(v5, "addObject:", v6);
        v19 = (void *)MEMORY[0x1E0D804E8];
        PUI_LocalizedStringForPrivacy(CFSTR("LOCAL_NETWORK"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, sel_setLocalNetworkEnabled_specifier_, sel_isLocalNetworkEnabled_, 0, 6, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v21);
        v22 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

        v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        return v4;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
    }
    v15 = CFSTR("LOCAL_NETWORK_MULTICAST");
    goto LABEL_9;
  }
  return v4;
}

- (id)pathRuleCreate:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v21 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[PUINetworkController pathControllerConfiguration](self, "pathControllerConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "pathRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "matchSigningIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUINetworkApplicationController bundleIdentifier](self, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          v17 = v11;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (v21)
  {
    v15 = objc_alloc(MEMORY[0x1E0CD0838]);
    -[PUINetworkApplicationController bundleIdentifier](self, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "initWithSigningIdentifier:", v16);

    objc_msgSend(v5, "pathRules");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v5, "pathRules");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObject:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPathRules:", v19);

    }
    else
    {
      v26 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPathRules:", v6);
    }
LABEL_13:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  int v6;
  id v7;

  v5 = a3;
  -[PUINetworkApplicationController pathRuleCreate:](self, "pathRuleCreate:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setDenyMulticast:", v6 ^ 1u);
  objc_msgSend(v7, "setMulticastPreferenceSet:", 1);
  -[PUINetworkController saveConfiguration](self, "saveConfiguration");

}

- (id)isLocalNetworkEnabled:(id)a3
{
  void *v3;
  void *v4;

  -[PUINetworkApplicationController pathRuleCreate:](self, "pathRuleCreate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v3, "denyMulticast") ^ 1);

  return v4;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (LSApplicationProxy)application
{
  return (LSApplicationProxy *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
