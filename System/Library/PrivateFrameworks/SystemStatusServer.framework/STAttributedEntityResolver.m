@implementation STAttributedEntityResolver

- (id)_localizedSystemStatusServerString:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(a1, "preferredLocalizations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (objc_msgSend(v4, "localizedStringForKey:value:table:localization:", v3, 0, CFSTR("SystemStatusServer"), v9),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E8E18D48, CFSTR("SystemStatusServer"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)resolveEntity:(id)a3
{
  id v4;
  STReferenceCountedCache *cache;
  id v6;
  STExecutableIdentityResolver *identityResolver;
  STExecutableIdentityResolver *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  STExecutableIdentityResolver *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  __CFBundle *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  __CFBundle *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  __CFBundle *v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  int v76;
  id v77;
  uint64_t v78;
  NSObject *v79;
  NSObject *v80;
  id v81;
  NSObject *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  STExecutableIdentityResolver *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  __CFString *v105;
  uint64_t v106;
  void *v107;
  id v108;
  int v109;
  void *v110;
  _QWORD v111[4];
  id v112;
  uint8_t buf[4];
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  -[STReferenceCountedCache cachedObjectForKey:](cache, "cachedObjectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_102;
  if (self)
    identityResolver = self->_identityResolver;
  else
    identityResolver = 0;
  v8 = identityResolver;
  objc_msgSend(v4, "executableIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STExecutableIdentityResolver resolvedIdentityForIdentity:](v8, "resolvedIdentityForIdentity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedDisplayName");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedExecutableDisplayName");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  v15 = v14;
  if (!v14)
  {
    v34 = objc_alloc(MEMORY[0x1E0DB0860]);
    objc_msgSend(v4, "website");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v10, v35, objc_msgSend(v4, "isSystemService"), v11, v13);

    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0858]), "initWithAttributedEntity:", v36);
    v6 = 0;
    goto LABEL_101;
  }
  v109 = objc_msgSend(v10, "isSystemExecutable");
  objc_msgSend(v10, "executablePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAttributedEntityResolver dynamicAttributions](self, "dynamicAttributions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __44__STAttributedEntityResolver_resolveEntity___block_invoke;
  v111[3] = &unk_1E8E18348;
  v108 = v16;
  v112 = v108;
  objc_msgSend(v17, "bs_firstObjectPassingTest:", v111);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = v10;
  v19 = v10;
  objc_msgSend(v4, "website");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizationKey");
  v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v110 = v20;
  v21 = v20;
  v22 = v19;
  v99 = v8;
  v100 = v18;
  v96 = v15;
  if (v18)
  {
    v21 = v110;
    v22 = v19;
    if (!v105)
    {
      objc_msgSend(v18, "website");
      v106 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "maskingClientExecutablePath");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v23)
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v23, 0, 0);
        if (v26)
        {
          v27 = objc_alloc(MEMORY[0x1E0DB08D8]);
          objc_msgSend(v26, "executableURL");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "path");
          v101 = v11;
          v29 = v23;
          v30 = v26;
          v31 = v25;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v27, "initWithExecutablePath:", v32);

          v25 = v31;
          v26 = v30;
          v23 = v29;
          v11 = v101;

          -[STExecutableIdentityResolver resolvedIdentityForIdentity:](v99, "resolvedIdentityForIdentity:", v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          STSystemStatusLogEntityResolving();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v114 = v23;
            _os_log_fault_impl(&dword_1D02C7000, v39, OS_LOG_TYPE_FAULT, "Failed to find app record for dynamic bundle ID: %{public}@", buf, 0xCu);
          }

          v22 = v19;
        }

        v8 = v99;
      }
      else
      {
        v22 = v19;
        if (v24)
        {
          v102 = (void *)v24;
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB08D8]), "initWithExecutablePath:", v24);
          -[STExecutableIdentityResolver resolvedIdentityForIdentity:](v8, "resolvedIdentityForIdentity:", v38);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v102;
        }
      }

      v21 = (id)v106;
    }
  }
  v107 = v21;
  objc_msgSend(v19, "bundlePath");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v98 = v22;
  if (objc_msgSend(v22, "isEqual:", v19))
  {
    if (v40)
    {
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01700]), "initWithPath:", v40);
      v95 = 0;
    }
    else
    {
      v95 = 0;
      v41 = 0;
    }
  }
  else
  {
    v103 = v11;
    v42 = v8;
    objc_msgSend(v22, "executablePath");
    v43 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "bundlePath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v44 = v41;
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01700]), "initWithPath:", v41);
    }
    else
    {
      v44 = 0;
    }
    v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0860]), "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v19, v110, objc_msgSend(v4, "isSystemService"), 0, 0);
    v108 = (id)v43;
    v40 = v44;
    v8 = v42;
    v11 = v103;
  }
  -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, CFSTR("UNKNOWN_ATTRIBUTION_STRING"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v40;
  if (v41)
  {
    if (v109)
    {
      v46 = CFSTR("_STAttributionDisplayName");
      if (v105)
        v46 = v105;
      v47 = v46;
      objc_msgSend(v41, "infoDictionary");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKey:", v47);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v49;
      if (v49)
        v51 = (void *)v49;
      else
        v51 = v45;
      v52 = v51;

      v53 = (__CFBundle *)objc_msgSend(v41, "cfBundle");
      -[STAttributedEntityResolver preferredLocalizations](self, "preferredLocalizations");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      STAttributedEntityResolverLocalizedStringFromTableInCFBundle(v47, v53, v52, v54);
      v55 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v55;
    }
    if (!v13 || objc_msgSend(v13, "isEqualToString:", v45))
    {
      objc_msgSend(v41, "infoDictionary");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKey:", CFSTR("CFBundleDisplayName"));
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v57;
      if (v57)
        v59 = (void *)v57;
      else
        v59 = v45;
      v60 = v59;

      v61 = (__CFBundle *)objc_msgSend(v41, "cfBundle");
      -[STAttributedEntityResolver preferredLocalizations](self, "preferredLocalizations");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      STAttributedEntityResolverLocalizedStringFromTableInCFBundle(CFSTR("CFBundleDisplayName"), v61, v60, v62);
      v63 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v63;
    }
    if (objc_msgSend(v13, "isEqualToString:", v45))
    {
      objc_msgSend(v41, "infoDictionary");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKey:", CFSTR("CFBundleName"));
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v65;
      if (v65)
        v67 = (void *)v65;
      else
        v67 = v45;
      v68 = v67;

      v69 = (__CFBundle *)objc_msgSend(v41, "cfBundle");
      -[STAttributedEntityResolver preferredLocalizations](self, "preferredLocalizations");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      STAttributedEntityResolverLocalizedStringFromTableInCFBundle(CFSTR("CFBundleName"), v69, v68, v70);
      v71 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v71;
    }
    v8 = v99;
    v40 = v104;
  }
  if ((v109 & 1) == 0 && (!v13 || objc_msgSend(v13, "isEqualToString:", v45)))
  {
    v72 = v40 ? v40 : v108;
    if (v72)
    {
      objc_msgSend(v72, "lastPathComponent");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "stringByDeletingPathExtension");
      v74 = objc_claimAutoreleasedReturnValue();

      STSystemStatusLogEntityResolving();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v114 = v98;
        _os_log_fault_impl(&dword_1D02C7000, v75, OS_LOG_TYPE_FAULT, "Generating name from path: failed to create bundle for executable with identity %{public}@", buf, 0xCu);
      }

      v13 = (void *)v74;
    }
  }
  v76 = objc_msgSend(v4, "isSystemService");
  if (v76 && (!v13 || objc_msgSend(v13, "isEqualToString:", v45)))
  {
    -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, CFSTR("SYSTEM_SERVICES_ATTRIBUTION_STRING"));
    v77 = (id)objc_claimAutoreleasedReturnValue();

    v13 = v77;
  }
  else
  {
    v77 = 0;
  }
  if (v109)
  {
    if (v13 && !objc_msgSend(v13, "isEqualToString:", v45))
    {
LABEL_79:
      if (!objc_msgSend(v13, "isEqualToString:", v45))
        goto LABEL_83;
      goto LABEL_80;
    }
    -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, CFSTR("SYSTEM_ATTRIBUTION_STRING"));
    v78 = objc_claimAutoreleasedReturnValue();

    STSystemStatusLogEntityResolving();
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v104)
    {
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v114 = v98;
        _os_log_fault_impl(&dword_1D02C7000, v80, OS_LOG_TYPE_FAULT, "Failed to create bundle for system executable with identity %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v114 = v98;
      _os_log_impl(&dword_1D02C7000, v80, OS_LOG_TYPE_DEFAULT, "Failed to create bundle for system executable with identity %{public}@", buf, 0xCu);
    }

    v13 = (void *)v78;
  }
  if (v13)
    goto LABEL_79;
LABEL_80:
  v81 = v45;

  STSystemStatusLogEntityResolving();
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v114 = v98;
    _os_log_fault_impl(&dword_1D02C7000, v82, OS_LOG_TYPE_FAULT, "Failed to find any name for executable with identity %{public}@", buf, 0xCu);
  }

  v13 = v81;
LABEL_83:
  v94 = v77;
  if (v76)
  {
    if (v77)
    {
      v83 = v77;
      v37 = v45;
      v84 = v83;

      v11 = v84;
      goto LABEL_100;
    }
    -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, CFSTR("SYSTEM_SERVICES_ATTRIBUTION_STRING"));
    v85 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v85;
  }
  v37 = v45;
  if (!v11)
  {
    objc_msgSend(v100, "formattedString");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      v87 = v86;
      v88 = v13;
      if (self && objc_msgSend(v87, "containsString:", CFSTR("%@")))
      {
        objc_msgSend(v87, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v89 = 0;
      }

      if (v89)
      {
        v11 = v89;

        goto LABEL_100;
      }

    }
    else if (v107)
    {
      v90 = (void *)MEMORY[0x1E0CB3940];
      -[STAttributedEntityResolver _localizedSystemStatusServerString:](self, CFSTR("WEBSITE_IN_APP_ATTRIBUTION_FORMAT"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "localizedStringWithFormat:", v91, v107, v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_100;
    }
    v11 = v13;
  }
LABEL_100:
  v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0860]), "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v98, v107, objc_msgSend(v4, "isSystemService"), v11, v13);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0858]), "initWithAttributedEntity:activeEntity:", v92, v95);

  v10 = v97;
  v15 = v96;
LABEL_101:

  if (v15)
  {
LABEL_102:
    v6 = v6;
    v37 = v6;
  }

  return v37;
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (NSArray)dynamicAttributions
{
  return self->_dynamicAttributions;
}

uint64_t __44__STAttributedEntityResolver_resolveEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientExecutablePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (STAttributedEntityResolver)init
{
  void *v3;
  void *v4;
  STAttributedEntityResolver *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STAttributedEntityResolver initWithPreferredLocalizations:](self, "initWithPreferredLocalizations:", v4);

  return v5;
}

- (STAttributedEntityResolver)initWithPreferredLocalizations:(id)a3
{
  id v4;
  STAttributedEntityResolver *v5;
  uint64_t v6;
  NSArray *preferredLocalizations;
  STExecutableIdentityResolver *v8;
  STExecutableIdentityResolver *identityResolver;
  STReferenceCountedCache *v10;
  STReferenceCountedCache *cache;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STAttributedEntityResolver;
  v5 = -[STAttributedEntityResolver init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    preferredLocalizations = v5->_preferredLocalizations;
    v5->_preferredLocalizations = (NSArray *)v6;

    v8 = objc_alloc_init(STExecutableIdentityResolver);
    identityResolver = v5->_identityResolver;
    v5->_identityResolver = v8;

    v10 = objc_alloc_init(STReferenceCountedCache);
    cache = v5->_cache;
    v5->_cache = v10;

  }
  return v5;
}

- (void)setDynamicAttributions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *dynamicAttributions;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  void *v31;
  STReferenceCountedCache *cache;
  STReferenceCountedCache *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  STExecutableIdentityResolver *identityResolver;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[2];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[2];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  STAttributedEntityResolver *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (STSystemStatusIsInternalLoggingEnabled())
  {
    STSystemStatusLogEntityResolving();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[STAttributedEntityResolver dynamicAttributions](self, "dynamicAttributions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v64 = self;
      v65 = 2114;
      v66 = v6;
      v67 = 2114;
      v68 = v4;
      _os_log_impl(&dword_1D02C7000, v5, OS_LOG_TYPE_DEFAULT, "Entity resolver: %{public}@ -- updating dynamic attributions from: %{public}@ to: %{public}@", buf, 0x20u);

    }
  }
  -[STAttributedEntityResolver dynamicAttributions](self, "dynamicAttributions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToArray:", v4);

  if ((v8 & 1) == 0)
  {
    -[STAttributedEntityResolver dynamicAttributions](self, "dynamicAttributions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = (NSArray *)objc_msgSend(v4, "copy");
    dynamicAttributions = self->_dynamicAttributions;
    self->_dynamicAttributions = v11;

    if (v4)
      objc_msgSend(v10, "removeObjectsInArray:", v4);
    v45 = v4;
    v13 = (void *)objc_msgSend(v4, "mutableCopy");
    v14 = v13;
    if (v9)
      objc_msgSend(v13, "removeObjectsInArray:", v9);
    v44 = v9;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v22 = objc_alloc(MEMORY[0x1E0DB08D8]);
          if (v21)
            objc_msgSend(v21, "clientAuditToken");
          else
            memset(v55, 0, sizeof(v55));
          v23 = (void *)objc_msgSend(v22, "initWithAuditToken:", v55);
          objc_msgSend(v15, "addObject:", v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v18);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v52 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          v30 = objc_alloc(MEMORY[0x1E0DB08D8]);
          if (v29)
            objc_msgSend(v29, "clientAuditToken");
          else
            memset(v50, 0, sizeof(v50));
          v31 = (void *)objc_msgSend(v30, "initWithAuditToken:", v50);
          objc_msgSend(v15, "addObject:", v31);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v26);
    }

    v43 = v16;
    if (self)
      cache = self->_cache;
    else
      cache = 0;
    v33 = cache;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v34 = v15;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v47;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v34);
          if (self)
            identityResolver = self->_identityResolver;
          else
            identityResolver = 0;
          -[STExecutableIdentityResolver resolvedIdentityForIdentity:](identityResolver, "resolvedIdentityForIdentity:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v38));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0860]), "initWithExecutableIdentity:", v40);
          -[STReferenceCountedCache clearObjectForKey:](v33, "clearObjectForKey:", v41);

          ++v38;
        }
        while (v36 != v38);
        v42 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
        v36 = v42;
      }
      while (v42);
    }

    v4 = v45;
  }

}

- (id)beginBatchResolutionSession
{
  STAttributedEntityResolutionSession *v3;
  STExecutableIdentityResolver *identityResolver;
  STExecutableIdentityResolver *v5;
  void *v6;
  STReferenceCountedCache *cache;
  STAttributedEntityResolutionSession *v8;

  v3 = [STAttributedEntityResolutionSession alloc];
  if (self)
    identityResolver = self->_identityResolver;
  else
    identityResolver = 0;
  v5 = identityResolver;
  -[STExecutableIdentityResolver beginBatchResolutionSession](v5, "beginBatchResolutionSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  v8 = -[STAttributedEntityResolutionSession initWithEntityResolver:identityResolver:cache:](v3, "initWithEntityResolver:identityResolver:cache:", self, v6, cache);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_identityResolver, 0);
  objc_storeStrong((id *)&self->_dynamicAttributions, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
}

@end
