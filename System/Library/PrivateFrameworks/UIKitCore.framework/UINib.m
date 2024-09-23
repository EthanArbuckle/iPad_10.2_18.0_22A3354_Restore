@implementation UINib

+ (UINib)nibWithNibName:(NSString *)name bundle:(NSBundle *)bundleOrNil
{
  NSBundle *v5;
  NSString *v6;
  UINib *v7;

  v5 = bundleOrNil;
  v6 = name;
  v7 = -[UINib initWithNibName:directory:bundle:]([UINib alloc], "initWithNibName:directory:bundle:", v6, 0, v5);

  return v7;
}

- (UINib)initWithNibName:(id)a3 directory:(id)a4 bundle:(id)a5
{
  id v9;
  id v10;
  id v11;
  UINib *v12;
  UINib *v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 || !objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINib.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(name != nil) && ([name length] > 0)"));

  }
  v12 = -[UINib initWithBundle:](self, "initWithBundle:", v11);
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12->storage, "setBundleResourceName:", v9);
    objc_msgSend(v13->storage, "setBundleDirectoryName:", v10);
    -[UINib _registerForMemoryWarningIfNeeded](v13, "_registerForMemoryWarningIfNeeded");
  }

  return v13;
}

- (UINib)initWithBundle:(id)a3
{
  id v4;
  UINib *v5;
  UINibStorage *v6;
  id storage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UINib;
  v5 = -[UINib init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(UINibStorage);
    storage = v5->storage;
    v5->storage = v6;

    objc_msgSend(v5->storage, "setBundle:", v4);
  }

  return v5;
}

- (void)_registerForMemoryWarningIfNeeded
{
  void *v3;
  id v4;

  objc_msgSend(self->storage, "bundleResourceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didReceiveMemoryWarning_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), UIApp);

  }
}

- (void)setIdentifierForStringsFile:(id)a3
{
  objc_msgSend(self->storage, "setIdentifierForStringsFile:", a3);
}

- (NSArray)instantiateWithOwner:(id)ownerOrNil options:(NSDictionary *)optionsOrNil
{
  id v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  int v49;
  char **v50;
  char **v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  id v69;
  UINib *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  NSDictionary *v85;
  char v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v6 = ownerOrNil;
  v7 = optionsOrNil;
  objc_msgSend(self->storage, "identifierForStringsFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[UINib bundleResourcePath](self, "bundleResourcePath");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[UINib effectiveBundle](self, "effectiveBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "pushNibLoadingBundle:", v12);
  v13 = objc_msgSend(MEMORY[0x1E0CB34D0], "pushNibPath:", v11);
  v86 = __isObjectTaggingEnabled;
  __isObjectTaggingEnabled = 1;
  v14 = (void *)MEMORY[0x186DC9484](v13);
  v107 = 0;
  -[UINib unarchiverForInstantiatingReturningError:](self, "unarchiverForInstantiatingReturningError:", &v107);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v107;
  v85 = v7;
  if (v15)
  {
    v76 = v16;
    -[NSDictionary objectForKey:](v7, "objectForKey:", CFSTR("UINibExternalObjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v78 = v14;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      -[NSDictionary objectForKey:](v7, "objectForKey:", CFSTR("UINibProxiedObjects"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v19;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v26, "count") + 2);
    if (!IBFirstResponderStandin)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0DE7910]);
      v29 = (void *)IBFirstResponderStandin;
      IBFirstResponderStandin = (uint64_t)v28;

    }
    if (v6 || (v6 = objc_alloc_init(MEMORY[0x1E0DE7910])) != 0)
    {
      objc_msgSend(v27, "addObject:", v6);
      +[UIProxyObject addMappingFromIdentifier:toObject:forCoder:](UIProxyObject, "addMappingFromIdentifier:toObject:forCoder:", 0x1E1737E80, v6, v15);
    }
    v79 = v12;
    v81 = v6;
    +[UIProxyObject addMappingFromIdentifier:toObject:forCoder:](UIProxyObject, "addMappingFromIdentifier:toObject:forCoder:", 0x1E1737EA0, IBFirstResponderStandin, v15);
    objc_msgSend(v27, "addObject:", IBFirstResponderStandin);
    if (objc_msgSend(v26, "count"))
    {
      objc_msgSend(v26, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObjectsFromArray:", v30);

      +[UIProxyObject addMappings:forCoder:](UIProxyObject, "addMappings:forCoder:", v26, v15);
    }
    -[UINib effectiveBundle](self, "effectiveBundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v11;
    UIResourceBeginDecodingNIBWithCoderFromBundleAndIdentifierForStringsFile(v15, v31, v11);

    -[NSDictionary valueForKey:](v7, "valueForKey:", 0x1E176FFE0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary valueForKey:](v7, "valueForKey:", 0x1E1770020);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary valueForKey:](v7, "valueForKey:", 0x1E1770000);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_decodeObjectsWithSourceSegueTemplate:creator:sender:forKey:", v32, v33, v34, CFSTR("UINibConnectionsKey"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "decodeObjectForKey:", CFSTR("UINibTopLevelObjectsKey"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "decodeObjectForKey:", CFSTR("UINibVisibleWindowsKey"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "decodeObjectForKey:", CFSTR("UINibObjectsKey"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "decodeObjectForKey:", CFSTR("UINibAccessibilityConfigurationsKey"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "decodeObjectForKey:", CFSTR("UINibKeyValuePairsKey"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v15;
    objc_msgSend(v15, "decodeObjectForKey:", CFSTR("UINibTraitStorageListsKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v104 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
          objc_msgSend(v40, "topLevelObject");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "_setTraitStorageList:", v40);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
      }
      while (v37);
    }
    v75 = v26;
    if (dyld_program_sdk_at_least())
    {
      v71 = self;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v42 = v35;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v100;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v100 != v45)
              objc_enumerationMutation(v42);
            objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * j), "topLevelObject");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v47, "traitCollection");
            else
              +[UITraitCollection _fallbackTraitCollection]();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "_applyTraitStorageRecordsForTraitCollection:", v48);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
        }
        while (v44);
      }

      self = v71;
    }
    objc_msgSend(v83, "makeObjectsPerformSelector:", sel_applyConfiguration);
    v49 = objc_msgSend(self->storage, "instantiatingForSimulator");
    v50 = &selRef_applyForSimulator;
    if (v49)
    {
      v51 = &selRef_connectForSimulator;
    }
    else
    {
      v50 = &selRef_apply;
      v51 = &selRef_connect;
    }
    objc_msgSend(v82, "makeObjectsPerformSelector:", *v50);
    objc_msgSend(v84, "makeObjectsPerformSelector:", *v51);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v52 = v72;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v96;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v96 != v55)
            objc_enumerationMutation(v52);
          v57 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k);
          if ((objc_msgSend(v27, "containsObject:", v57) & 1) == 0)
            objc_msgSend(v15, "addObject:", v57);
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
      }
      while (v54);
    }

    if ((v86 & 1) == 0 && dyld_program_sdk_at_least())
      __isObjectTaggingEnabled = 0;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v58 = v73;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v91, v109, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v92;
      do
      {
        for (m = 0; m != v60; ++m)
        {
          if (*(_QWORD *)v92 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * m);
          if ((objc_msgSend(v27, "containsObject:", v63) & 1) == 0)
            objc_msgSend(v63, "awakeFromNib");
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v91, v109, 16);
      }
      while (v60);
    }

    __isObjectTaggingEnabled = 1;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v64 = v74;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v88;
      do
      {
        for (n = 0; n != v66; ++n)
        {
          if (*(_QWORD *)v88 != v67)
            objc_enumerationMutation(v64);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * n), "makeKeyAndVisible");
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
      }
      while (v66);
    }

    v24 = v77;
    UIResourceFinishDecodingNIBWithCoder(v77);
    +[UIProxyObject removeMappingsForCoder:](UIProxyObject, "removeMappingsForCoder:", v77);
    objc_msgSend(v77, "finishDecoding");

    v11 = v80;
    v6 = v81;
    v14 = v78;
    v12 = v79;
    v25 = v86;
    v23 = v75;
    v22 = v76;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    v22 = v16;
    objc_msgSend(v16, "localizedDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "raise:format:", v21, CFSTR("%@"), v23);
    v24 = 0;
    v25 = v86;
  }

  objc_autoreleasePoolPop(v14);
  if ((v25 & 1) == 0)
    __isObjectTaggingEnabled = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "popNibPath");
  objc_msgSend(MEMORY[0x1E0CB34D0], "popNibLoadingBundle");
  v69 = objc_retainAutorelease(v15);

  return (NSArray *)v69;
}

- (id)effectiveBundle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(self->storage, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)unarchiverForInstantiatingReturningError:(id *)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  objc_msgSend(self->storage, "nibDecoder");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
LABEL_3:
    v7 = 0;
    goto LABEL_4;
  }
  -[UINib lazyArchiveData](self, "lazyArchiveData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (!UIDataLooksLikeNibArchive())
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, 0);
      objc_msgSend(v6, "setRequiresSecureCoding:", 0);

      goto LABEL_3;
    }
    v18 = 0;
    v6 = (void *)objc_msgSend(objc_alloc((Class)off_1E167B0C0), "initForReadingWithData:error:", v9, &v18);
    v7 = v18;
    objc_msgSend(self->storage, "setNibDecoder:", v6);
    objc_msgSend(self->storage, "setArchiveData:", 0);
  }
  else
  {
    -[UINib effectiveBundle](self, "effectiveBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->storage, "bundleResourceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->storage, "bundleDirectoryName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && v12)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not load NIB in bundle: '%@' with name '%@' and directory '%@'"), v10, v11, v12);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not load NIB in bundle: '%@' with name '%@'"), v10, v11, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB28A8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E0CB2D50]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 0, v16);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = 0;
  }

  if (a3 && v7)
  {
    v7 = objc_retainAutorelease(v7);
    *a3 = v7;
  }
LABEL_4:

  return v6;
}

- (id)lazyArchiveData
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;

  objc_msgSend(self->storage, "archiveData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(self->storage, "bundleResourceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINib.m"), 270, CFSTR("UINib must be instantiated with either data or a nib name."));

    }
    -[UINib bundleResourcePath](self, "bundleResourcePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[UINib nibDataForPath:](self, "nibDataForPath:", v6);
      objc_msgSend(self->storage, "setArchiveData:", v7);

    }
  }
  return (id)objc_msgSend(self->storage, "archiveData");
}

- (id)bundleResourcePath
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(self->storage, "bundleResourceName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(self->storage, "bundleDirectoryName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[UINib effectiveBundle](self, "effectiveBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->storage, "bundleResourceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->storage, "bundleDirectoryName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForResource:ofType:inDirectory:", v7, CFSTR("nib"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(self->storage, "bundleResourceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v9 = 0;
      return v9;
    }
    -[UINib effectiveBundle](self, "effectiveBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->storage, "bundleResourceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForResource:ofType:", v7, CFSTR("nib"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)nibDataForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-17.0+.nib"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContentsOfFile:", v8);
    v10 = v9;
    if (v9)
    {
      v6 = v9;
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-16.0+.nib"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithContentsOfFile:", v12);
      v14 = v13;
      if (v13)
      {
        v6 = v13;
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x1E0C99D50]);
        objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-15.0+.nib"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithContentsOfFile:", v16);
        v18 = v17;
        if (v17)
        {
          v6 = v17;
        }
        else
        {
          v19 = objc_alloc(MEMORY[0x1E0C99D50]);
          objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-14.0+.nib"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v19, "initWithContentsOfFile:");
          if (v20)
          {
            v21 = v16;
            v22 = v20;
            v6 = v20;
          }
          else
          {
            v23 = objc_alloc(MEMORY[0x1E0C99D50]);
            objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-13.0+.nib"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v23, "initWithContentsOfFile:");
            if (v24)
            {
              v21 = v16;
              v25 = v24;
              v6 = v24;
            }
            else
            {
              v26 = objc_alloc(MEMORY[0x1E0C99D50]);
              objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-12.3+.nib"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v26, "initWithContentsOfFile:");
              if (v27)
              {
                v28 = v27;
                v6 = v27;
              }
              else
              {
                v29 = objc_alloc(MEMORY[0x1E0C99D50]);
                objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-11.0+.nib"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (void *)objc_msgSend(v29, "initWithContentsOfFile:");
                if (v30)
                {
                  v31 = v30;
                  v6 = v30;
                }
                else
                {
                  v32 = objc_alloc(MEMORY[0x1E0C99D50]);
                  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-9.1+.nib"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = (void *)objc_msgSend(v32, "initWithContentsOfFile:");
                  if (v33)
                  {
                    v34 = v33;
                    v6 = v33;
                  }
                  else
                  {
                    v35 = objc_alloc(MEMORY[0x1E0C99D50]);
                    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects-8.0+.nib"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = (void *)objc_msgSend(v35, "initWithContentsOfFile:");
                    if (v36)
                    {
                      v37 = v36;
                      v6 = v36;
                    }
                    else
                    {
                      v45 = v16;
                      v38 = objc_alloc(MEMORY[0x1E0C99D50]);
                      objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("objects.nib"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v40 = (void *)objc_msgSend(v38, "initWithContentsOfFile:");
                      v41 = v40;
                      if (v40)
                      {
                        v6 = v40;
                      }
                      else
                      {
                        v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                        objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("runtime.nib"));
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v6 = (id)objc_msgSend(v42, "initWithContentsOfFile:", v43);

                      }
                      v16 = v45;
                      v37 = 0;
                    }

                    v34 = 0;
                  }

                  v31 = 0;
                }

                v28 = 0;
              }
              v21 = v16;

              v25 = 0;
            }

            v22 = 0;
          }

          v16 = v21;
          v18 = 0;
        }

      }
    }

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(self->storage, "bundleResourceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), UIApp);

  }
  v5.receiver = self;
  v5.super_class = (Class)UINib;
  -[UINib dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->storage, 0);
}

- (UINib)initWithData:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  UINib *v9;
  UINib *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINib.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

  }
  v9 = -[UINib initWithBundle:](self, "initWithBundle:", v8);
  v10 = v9;
  if (v9)
    objc_msgSend(v9->storage, "setArchiveData:", v7);

  return v10;
}

- (UINib)initWithContentsOfFile:(id)a3
{
  id v4;
  UINib *v5;

  v4 = -[UINib nibDataForPath:](self, "nibDataForPath:", a3);
  v5 = -[UINib initWithData:bundle:](self, "initWithData:bundle:", v4, 0);

  return v5;
}

+ (UINib)nibWithData:(NSData *)data bundle:(NSBundle *)bundleOrNil
{
  NSBundle *v5;
  NSData *v6;
  UINib *v7;

  v5 = bundleOrNil;
  v6 = data;
  v7 = -[UINib initWithData:bundle:]([UINib alloc], "initWithData:bundle:", v6, v5);

  return v7;
}

- (UINib)initWithCoder:(id)a3
{
  id v4;
  UINib *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  UINibStorage *v10;
  id storage;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UINib;
  v5 = -[UINib init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("bundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v4, "decodeObjectForKey:", CFSTR("identifierForStringsFile"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      NSLog(CFSTR("An instance of UINib could not be decoded because the referenced bundle with identifier \"%@\" could not be found."), v6);
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("identifierForStringsFile"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "decodeBoolForKey:", CFSTR("captureEnclosingNIBBundleOnDecode")))
      {
        v9 = 0;
        v8 = 0;
        goto LABEL_11;
      }
      UIResourceBundleForNIBBeingDecodedWithCoder(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      UIResourceIdentifierForStringsFileForNIBBeingDecodedWithCoder(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_11:
        v10 = objc_alloc_init(UINibStorage);
        storage = v5->storage;
        v5->storage = v10;

        objc_msgSend(v5->storage, "setBundle:", v8);
        v12 = v5->storage;
        objc_msgSend(v4, "decodeObjectForKey:", CFSTR("bundleResourceName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBundleResourceName:", v13);

        objc_msgSend(v5->storage, "setIdentifierForStringsFile:", v9);
        objc_msgSend(v5->storage, "bundleResourceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v5->storage;
        if (v14)
        {
          objc_msgSend(v4, "decodeObjectForKey:", CFSTR("bundleDirectoryName"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBundleDirectoryName:", v16);
        }
        else
        {
          objc_msgSend(v4, "decodeObjectForKey:", CFSTR("archiveData"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setArchiveData:", v16);
        }

        -[UINib _registerForMemoryWarningIfNeeded](v5, "_registerForMemoryWarningIfNeeded");
        goto LABEL_15;
      }
      NSLog(CFSTR("An instance of UINib could not be decoded because it expected a containing NIB bundle during decoding."));
    }

    v8 = 0;
    v5 = 0;
LABEL_15:

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id storage;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(self->storage, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(self->storage, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  }
  objc_msgSend(self->storage, "identifierForStringsFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(self->storage, "identifierForStringsFile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("identifierForStringsFile"));

  }
  if (-[UINib captureImplicitLoadingContextOnDecode](self, "captureImplicitLoadingContextOnDecode"))
    objc_msgSend(v17, "encodeBool:forKey:", -[UINib captureImplicitLoadingContextOnDecode](self, "captureImplicitLoadingContextOnDecode"), CFSTR("captureEnclosingNIBBundleOnDecode"));
  objc_msgSend(self->storage, "bundleResourceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  storage = self->storage;
  if (v9)
  {
    objc_msgSend(storage, "bundleResourceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("bundleResourceName"));

    objc_msgSend(self->storage, "bundleDirectoryName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v17;
    if (v12)
    {
      objc_msgSend(self->storage, "bundleDirectoryName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("bundleDirectoryName");
LABEL_12:
      objc_msgSend(v17, "encodeObject:forKey:", v14, v15);

      v13 = v17;
    }
  }
  else
  {
    objc_msgSend(storage, "archiveData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v17;
    if (v16)
    {
      objc_msgSend(self->storage, "archiveData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("archiveData");
      goto LABEL_12;
    }
  }

}

- (BOOL)instantiatingForSimulator
{
  return objc_msgSend(self->storage, "instantiatingForSimulator");
}

- (void)setInstantiatingForSimulator:(BOOL)a3
{
  objc_msgSend(self->storage, "setInstantiatingForSimulator:", a3);
}

- (BOOL)captureImplicitLoadingContextOnDecode
{
  return objc_msgSend(self->storage, "captureImplicitLoadingContextOnDecode");
}

- (void)setCaptureImplicitLoadingContextOnDecode:(BOOL)a3
{
  objc_msgSend(self->storage, "setCaptureImplicitLoadingContextOnDecode:", a3);
}

- (id)identifierForStringsFile
{
  return (id)objc_msgSend(self->storage, "identifierForStringsFile");
}

- (void)didReceiveMemoryWarning:(id)a3
{
  objc_msgSend(self->storage, "setNibDecoder:", 0);
  objc_msgSend(self->storage, "setArchiveData:", 0);
}

@end
