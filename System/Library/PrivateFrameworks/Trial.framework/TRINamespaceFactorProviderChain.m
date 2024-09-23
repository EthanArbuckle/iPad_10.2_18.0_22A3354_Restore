@implementation TRINamespaceFactorProviderChain

- (id)factorLevels
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSDictionary *aliasMap;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *context;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A1AC6B8C](self, a2);
  v3 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSArray reverseObjectEnumerator](self->_providerChain, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v27 = v4;
        v5 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v4);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v5, "factorLevels", context);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v30;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v30 != v8)
                objc_enumerationMutation(v28);
              v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
              v11 = (void *)MEMORY[0x1A1AC6B8C]();
              v12 = v10;
              aliasMap = self->_aliasMap;
              objc_msgSend(v12, "factor");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "name");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary allKeysForObject:](aliasMap, "allKeysForObject:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16 && objc_msgSend(v16, "count") == 1)
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[TRINamespaceFactorProviderChain _dealiasedFactorLevelForFactorLevel:unaliasedName:](self, "_dealiasedFactorLevelForFactorLevel:unaliasedName:", v12, v17);
                v18 = objc_claimAutoreleasedReturnValue();

                v12 = (id)v18;
              }
              objc_msgSend(v12, "factor");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v20);

              objc_autoreleasePoolPop(v11);
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v7);
        }

        v4 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }

  objc_msgSend(v3, "allValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v21;
}

- (TRINamespaceFactorProviderChain)initWithNamespaceName:(id)a3 typedProviderChain:(id)a4 paths:(id)a5
{
  return -[TRINamespaceFactorProviderChain initWithNamespaceName:typedProviderChain:paths:excludingTreatmentLayers:](self, "initWithNamespaceName:typedProviderChain:paths:excludingTreatmentLayers:", a3, a4, a5, 0);
}

- (id)providerForTreatmentLayer:(unint64_t)a3
{
  TRINamespaceFactorProviding *installedProvider;
  void *v7;
  TRINamespaceFactorProviding *v8;

  switch(a3)
  {
    case 1uLL:
      installedProvider = self->_installedProvider;
      goto LABEL_11;
    case 2uLL:
      installedProvider = self->_rolloutProvider;
      goto LABEL_11;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 4uLL:
      installedProvider = self->_experimentProvider;
      goto LABEL_11;
    case 8uLL:
      installedProvider = self->_devOverrideProvider;
      goto LABEL_11;
    default:
      if (a3 == 16)
      {
        installedProvider = self->_bmltProvider;
      }
      else
      {
        if (a3 != 32)
        {
LABEL_6:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 206, CFSTR("Bad layer 0x%llx"), a3);

          return v8;
        }
        installedProvider = self->_factorPackExperimentProvider;
      }
LABEL_11:
      v8 = installedProvider;
      return v8;
  }
}

- (TRINamespaceFactorProviderChain)initWithNamespaceName:(id)a3 typedProviderChain:(id)a4 paths:(id)a5 excludingTreatmentLayers:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  TRINamespaceFactorProviderChain *v13;
  TRINamespaceFactorProviderChain *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void **p_devOverrideProvider;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  id *v44;
  id *p_isa;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id *v50;
  NSObject *v51;
  void *v52;
  id *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  unint64_t v70;
  NSObject *v71;
  void *v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  BOOL v76;
  NSDictionary *aliasMap;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  NSArray *providerChain;
  NSArray *v84;
  id v86;
  void *v87;
  id v88;
  TRINamespaceFactorProviderChain *v89;
  uint64_t *p_rolloutProvider;
  id *v91;
  id *v92;
  NSArray *v93;
  void *v94;
  NSObject *v95;
  NSDictionary *v96;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  objc_super v106;
  uint8_t v107[128];
  uint8_t buf[4];
  id v109;
  __int16 v110;
  _BYTE v111[10];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v106.receiver = self;
  v106.super_class = (Class)TRINamespaceFactorProviderChain;
  v11 = a4;
  v12 = a5;
  v13 = -[TRINamespaceFactorProviderChain init](&v106, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_81;
  v89 = v13;
  objc_storeStrong((id *)&v13->_namespaceName, a3);
  v93 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v88 = v12;
  objc_msgSend(v12, "namespaceDescriptorsDefaultDir");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptor loadWithNamespaceName:fromDirectory:](TRINamespaceDescriptor, "loadWithNamespaceName:fromDirectory:", v10, v15);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v11, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "provider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    v20 = objc_msgSend(v18, "namespaceCompatibilityVersion");

  }
  else
  {
    v19 = v11;
    v20 = 0;
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v87 = v19;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
  v86 = v10;
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v103;
    p_rolloutProvider = (uint64_t *)&v89->_rolloutProvider;
    v95 = 0;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v103 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v26, "provider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "namespaceCompatibilityVersion");

        v29 = objc_msgSend(v26, "type");
        if (v28 == v20)
        {
          p_devOverrideProvider = (void **)&v89->_devOverrideProvider;
          switch(v29)
          {
            case 1:
              p_devOverrideProvider = (void **)&v89->_installedProvider;
              goto LABEL_26;
            case 2:
              p_devOverrideProvider = (void **)&v89->_rolloutProvider;
              goto LABEL_26;
            case 3:
            case 5:
            case 6:
            case 7:
              goto LABEL_27;
            case 4:
              p_devOverrideProvider = (void **)&v89->_experimentProvider;
              goto LABEL_26;
            case 8:
              goto LABEL_26;
            default:
              if (v29 == 16)
              {
                p_devOverrideProvider = (void **)&v89->_bmltProvider;
              }
              else
              {
                p_devOverrideProvider = (void **)&v89->_factorPackExperimentProvider;
                if (v29 != 32)
                  goto LABEL_27;
              }
LABEL_26:
              objc_msgSend(v26, "provider");
              v42 = objc_claimAutoreleasedReturnValue();
              v43 = *p_devOverrideProvider;
              *p_devOverrideProvider = (void *)v42;

LABEL_27:
              if ((objc_msgSend(v26, "type") & a6) != 0)
                continue;
              objc_msgSend(v26, "provider");
              v38 = objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v93, "addObject:", v38);
              break;
          }
        }
        else
        {
          if (v29 != 2)
            goto LABEL_18;
          objc_msgSend(v94, "upgradeNCVs");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v26, "provider");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "namespaceCompatibilityVersion"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v31, "containsObject:", v34);

          if (v35)
          {
            TRILogCategory_ClientFramework();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "logDesc");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v109 = v37;
              _os_log_impl(&dword_19B89C000, v36, OS_LOG_TYPE_DEFAULT, "Namespace factor provider \"%@\" is upgrade compatible. Keeping it in case there's no factor provider matching the download NCV.", buf, 0xCu);

            }
            v38 = v95;
            v95 = v26;
          }
          else
          {
LABEL_18:
            TRILogCategory_ClientFramework();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "logDesc");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "provider");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "namespaceCompatibilityVersion");
              *(_DWORD *)buf = 138412802;
              v109 = v39;
              v110 = 1024;
              *(_DWORD *)v111 = v20;
              *(_WORD *)&v111[4] = 1024;
              *(_DWORD *)&v111[6] = v41;
              _os_log_impl(&dword_19B89C000, v38, OS_LOG_TYPE_DEFAULT, "Omitting namespace factor provider \"%@\" due to NCV incompatibility (exp %u, act %u).", buf, 0x18u);

            }
          }
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    }
    while (v23);

    v44 = (id *)&v89->_rolloutProvider;
    v12 = v88;
    if (*p_rolloutProvider)
    {
      v10 = v86;
      v11 = v87;
      p_isa = (id *)&v89->super.isa;
    }
    else
    {
      v10 = v86;
      v11 = v87;
      p_isa = (id *)&v89->super.isa;
      if (v95)
      {
        TRILogCategory_ClientFramework();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject logDesc](v95, "logDesc");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v109 = v47;
          _os_log_impl(&dword_19B89C000, v46, OS_LOG_TYPE_DEFAULT, "Didn't find a download-NCV compatible rollout namespace factor provider. Using upgrade-NCV compatible factor provider instead: \"%@\".", buf, 0xCu);

          v12 = v88;
        }

        -[NSObject provider](v95, "provider");
        v48 = objc_claimAutoreleasedReturnValue();
        v44 = (id *)&v89->_rolloutProvider;
        v49 = (void *)*p_rolloutProvider;
        *p_rolloutProvider = v48;

        if ((a6 & 2) == 0)
          -[NSArray insertObject:atIndex:](v93, "insertObject:atIndex:", *p_rolloutProvider, 0);
      }
    }
  }
  else
  {

    v95 = 0;
    v12 = v88;
    p_isa = (id *)&v89->super.isa;
    v44 = (id *)&v89->_rolloutProvider;
    v11 = v19;
  }
  if (!-[NSArray count](v93, "count"))
  {
    v50 = v44;
    TRILogCategory_ClientFramework();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21, "_pas_mappedArrayWithTransform:", &__block_literal_global_23);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v109 = v10;
      v110 = 2112;
      *(_QWORD *)v111 = v52;
      _os_log_impl(&dword_19B89C000, v51, OS_LOG_TYPE_DEFAULT, "no factor providers loaded for namespace %@ from directories %@", buf, 0x16u);

      v12 = v88;
    }

    v44 = v50;
  }
  v53 = p_isa + 3;
  if (!p_isa[3])
    goto LABEL_65;
  v91 = v44;
  v96 = (NSDictionary *)objc_opt_new();
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v92 = p_isa + 3;
  objc_msgSend(*v53, "factorLevels");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
  if (!v55)
    goto LABEL_56;
  v56 = v55;
  v57 = *(_QWORD *)v99;
  do
  {
    for (j = 0; j != v56; ++j)
    {
      if (*(_QWORD *)v99 != v57)
        objc_enumerationMutation(v54);
      v59 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
      objc_msgSend(v59, "factor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "hasAlias"))
      {
        objc_msgSend(v59, "factor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "alias");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "isEqual:", &stru_1E3C00710);

        if ((v63 & 1) != 0)
          continue;
        objc_msgSend(v59, "factor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "alias");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "factor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "name");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v96, "setObject:forKeyedSubscript:", v64, v66);

      }
    }
    v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
  }
  while (v56);
LABEL_56:

  -[NSDictionary allKeys](v96, "allKeys");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "count");
  -[NSDictionary allValues](v96, "allValues");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "count");

  if (v68 > v70)
  {
    TRILogCategory_ClientFramework();
    v71 = objc_claimAutoreleasedReturnValue();
    v53 = v92;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B89C000, v71, OS_LOG_TYPE_ERROR, "Found multiple factor names sharing a common alias. Every factor name and any corresponding alias should be unique and 1-1 within a given namespace.", buf, 2u);
    }
    v10 = v86;
    v11 = v87;
    v12 = v88;
    v44 = v91;
    goto LABEL_63;
  }
  -[NSDictionary allKeys](v96, "allKeys");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "count");
  -[NSDictionary allValues](v96, "allValues");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "count");

  v76 = v73 >= v75;
  v10 = v86;
  v11 = v87;
  v12 = v88;
  v44 = v91;
  v53 = v92;
  if (!v76)
  {
    TRILogCategory_ClientFramework();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B89C000, v71, OS_LOG_TYPE_ERROR, "Found multiple aliases for a given factor name. Every factor name and any corresponding alias should be unique and 1-1 within a given namespace.", buf, 2u);
    }
LABEL_63:

  }
  p_isa = (id *)&v89->super.isa;
  aliasMap = v89->_aliasMap;
  v89->_aliasMap = v96;

LABEL_65:
  if ((a6 & 2) != 0)
    v78 = 0;
  else
    v78 = *v44;
  objc_storeStrong(v44, v78);
  if ((a6 & 0x20) != 0)
    v79 = 0;
  else
    v79 = p_isa[6];
  objc_storeStrong(p_isa + 6, v79);
  if ((a6 & 4) != 0)
    v80 = 0;
  else
    v80 = p_isa[5];
  objc_storeStrong(p_isa + 5, v80);
  if ((a6 & 1) != 0)
    v81 = 0;
  else
    v81 = *v53;
  objc_storeStrong(v53, v81);
  if ((a6 & 0x10) != 0)
    v82 = 0;
  else
    v82 = p_isa[8];
  objc_storeStrong(p_isa + 8, v82);
  providerChain = v89->_providerChain;
  v89->_providerChain = v93;
  v84 = v93;

  v14 = v89;
LABEL_81:

  return v14;
}

- (id)levelForFactor:(id)a3 outProvider:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSString *namespaceName;
  id *location;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_providerChain;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    location = a4;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "levelForFactor:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (location)
            objc_storeStrong(location, v12);
          v16 = v13;
          goto LABEL_21;
        }
        -[NSDictionary objectForKeyedSubscript:](self->_aliasMap, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_aliasMap, "objectForKeyedSubscript:", v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "levelForFactor:", v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            if (location)
              objc_storeStrong(location, v12);
LABEL_21:

            goto LABEL_26;
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      a4 = location;
      if (v9)
        continue;
      break;
    }
  }

  if (-[NSArray count](self->_providerChain, "count"))
  {
    if (+[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald")
      && !-[NSString hasPrefix:](self->_namespaceName, "hasPrefix:", CFSTR("TRIAL_")))
    {
      TRILogCategory_ClientFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_28:
        namespaceName = self->_namespaceName;
        *(_DWORD *)buf = 138412546;
        v26 = namespaceName;
        v27 = 2112;
        v28 = v6;
        _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "Namespace %@ does not provide a factor with name \"%@\".  Please check your factor name against your factor definitions on trial.apple.com.", buf, 0x16u);
      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
    }

  }
  v16 = 0;
  if (a4)
  {
    v7 = (NSArray *)*a4;
    *a4 = 0;
LABEL_26:

  }
  return v16;
}

- (id)levelForFactor:(id)a3
{
  return -[TRINamespaceFactorProviderChain levelForFactor:outProvider:](self, "levelForFactor:outProvider:", a3, 0);
}

- (void)dispose
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_providerChain;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "dispose", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliasMap, 0);
  objc_storeStrong((id *)&self->_bmltProvider, 0);
  objc_storeStrong((id *)&self->_devOverrideProvider, 0);
  objc_storeStrong((id *)&self->_factorPackExperimentProvider, 0);
  objc_storeStrong((id *)&self->_experimentProvider, 0);
  objc_storeStrong((id *)&self->_rolloutProvider, 0);
  objc_storeStrong((id *)&self->_installedProvider, 0);
  objc_storeStrong((id *)&self->_providerChain, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  TRINamespaceResolver *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[TRINamespaceResolver initWithPaths:]([TRINamespaceResolver alloc], "initWithPaths:", v7);
  objc_msgSend(a1, "factorProviderWithPaths:namespaceName:resolver:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4 excludingTreatmentLayers:(unint64_t)a5
{
  id v8;
  id v9;
  TRINamespaceResolver *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  v10 = -[TRINamespaceResolver initWithPaths:]([TRINamespaceResolver alloc], "initWithPaths:", v9);
  -[TRINamespaceResolver resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:](v10, "resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:", v8, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNamespaceName:typedProviderChain:paths:excludingTreatmentLayers:", v8, v11, v9, a5);

  return v12;
}

+ (id)factorProviderWithPaths:(id)a3 namespaceName:(id)a4 resolver:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:", v8, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNamespaceName:typedProviderChain:paths:", v8, v10, v9);

  return v11;
}

uint64_t __107__TRINamespaceFactorProviderChain_initWithNamespaceName_typedProviderChain_paths_excludingTreatmentLayers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logDesc");
}

- (id)namespaceName
{
  return self->_namespaceName;
}

- (id)experimentId
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_providerChain, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)deploymentId
{
  void *v2;
  int v3;

  -[NSArray firstObject](self->_providerChain, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deploymentId");

  return v3;
}

- (id)treatmentId
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_providerChain, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "treatmentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rolloutId
{
  return (id)-[TRINamespaceFactorProviding treatmentId](self->_rolloutProvider, "treatmentId");
}

- (unsigned)namespaceCompatibilityVersion
{
  void *v2;
  unsigned int v3;

  -[NSArray lastObject](self->_providerChain, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "namespaceCompatibilityVersion");

  return v3;
}

- (BOOL)isRegistered
{
  return self->_installedProvider != 0;
}

- (BOOL)hasAnyTreatmentInLayers:(unint64_t)a3
{
  if ((a3 & 1) != 0 && self->_installedProvider
    || (a3 & 2) != 0 && self->_rolloutProvider
    || (a3 & 4) != 0 && self->_experimentProvider
    || (a3 & 0x10) != 0 && self->_bmltProvider)
  {
    return 1;
  }
  if ((a3 & 0x20) != 0)
    return self->_factorPackExperimentProvider != 0;
  return 0;
}

- (void)cacheFactorLevels
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_providerChain;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cacheFactorLevels", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)computeTreatmentAssetIndexes:(id *)a3 withAssociatedExperimentIds:(id *)a4 andFactorPackAssetIds:(id *)a5 withAssociatedRolloutDeployments:(id *)a6 withExperimentFactorNames:(id *)a7 andRolloutFactorNames:(id *)a8 forFactors:(id)a9 usingFilter:(id)a10
{
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __objc2_class **v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void (*v29)(void);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  __objc2_class **v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v64;
  id v65;
  id v66;
  id v67;
  id *location;
  id *v73;
  id v74;
  id obj;
  id v76;
  id v77;
  void *v78;
  id v79;
  TRINamespaceFactorProviderChain *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void (**v88)(void);
  uint64_t (**v89)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  TRINamespaceFactorProviding *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  id v101;
  void (**v102)(void);
  _QWORD v103[5];
  id v104;
  uint8_t v105[128];
  uint8_t buf[4];
  void *v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v13 = a9;
  v14 = a10;
  v73 = a5;
  location = a3;
  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIndexes"));

    if (v73)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_74:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorNames"));

      if (v14)
        goto LABEL_5;
LABEL_75:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filterBlock"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIds"));

  if (!v13)
    goto LABEL_74;
LABEL_4:
  if (!v14)
    goto LABEL_75;
LABEL_5:
  v15 = MEMORY[0x1E0C809B0];
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke;
  v103[3] = &unk_1E3C00018;
  v16 = v14;
  v103[4] = self;
  v104 = v16;
  v17 = (void *)MEMORY[0x1A1AC6D30](v103);
  v18 = (void *)objc_opt_new();
  obj = (id)objc_opt_new();
  v19 = (void *)objc_opt_new();
  v74 = (id)objc_opt_new();
  v76 = (id)objc_opt_new();
  v20 = (void *)objc_opt_new();
  v99[0] = v15;
  v99[1] = 3221225472;
  v99[2] = __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke_2;
  v99[3] = &unk_1E3C00040;
  v88 = v17;
  v102 = v88;
  v65 = v19;
  v67 = v19;
  v100 = v67;
  v64 = v20;
  v66 = v20;
  v101 = v66;
  v89 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC6D30](v99);
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v21 = v13;
  v84 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (!v84)
    goto LABEL_63;
  v83 = *(_QWORD *)v96;
  v22 = off_1E3BFD000;
  v77 = v21;
  v78 = v18;
  v79 = v16;
  v80 = self;
  do
  {
    v23 = 0;
    do
    {
      if (*(_QWORD *)v96 != v83)
        objc_enumerationMutation(v21);
      v24 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v23);
      v25 = (void *)MEMORY[0x1A1AC6B8C]();
      v94 = 0;
      -[TRINamespaceFactorProviderChain levelForFactor:outProvider:](self, "levelForFactor:outProvider:", v24, &v94);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v26;
      if (!v26)
      {
        ((void (*)(void (**)(void), const __CFString *, uint64_t, uint64_t))v88[2])(v88, CFSTR("Unknown factor"), v24, 9);
        goto LABEL_27;
      }
      v85 = v25;
      if (!v94)
      {
        v56 = v26;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

        v26 = v56;
      }
      objc_msgSend(v26, "fileOrDirectoryLevelWithIsDir:", 0);
      v27 = objc_claimAutoreleasedReturnValue();
      v86 = (void *)v27;
      if (!v27)
      {
        v29 = v88[2];
LABEL_25:
        v29();
        goto LABEL_26;
      }
      if ((*((unsigned int (**)(id, uint64_t, uint64_t, _QWORD))v16 + 2))(v16, v24, v27, 0))
      {
        -[TRINamespaceFactorProviding treatmentId](v94, "treatmentId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {

        }
        else
        {
          -[TRINamespaceFactorProviding rolloutId](v94, "rolloutId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
            goto LABEL_26;
        }
        if ((objc_msgSend(v86, "hasAsset") & 1) == 0)
        {
          v29 = v88[2];
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((((uint64_t (**)(_QWORD, TRINamespaceFactorProviding *, uint64_t, void *))v89)[2](v89, v94, v24, v86) & 1) == 0)goto LABEL_26;
        }
        else
        {
          -[TRINamespaceFactorProviding treatmentId](v94, "treatmentId");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            TRILogCategory_ClientFramework();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              -[TRINamespaceFactorProviding experimentId](v94, "experimentId");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v107 = v55;
              _os_log_error_impl(&dword_19B89C000, v37, OS_LOG_TYPE_ERROR, "Provider's treatmentId is unexpectedly nil for experiment %@", buf, 0xCu);

            }
            goto LABEL_26;
          }
          v81 = v23;
          objc_msgSend(v86, "asset");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRINamespaceFactorProviding treatmentId](v94, "treatmentId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
            v36 = v34;
          else
            v36 = (id)objc_opt_new();
          v38 = v36;

          if (objc_msgSend(v32, "hasCloudKitIndex"))
          {
            objc_msgSend(v86, "asset");
            v39 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addIndex:", -[NSObject cloudKitIndex](v39, "cloudKitIndex"));
          }
          else
          {
            TRILogCategory_ClientFramework();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v107 = v86;
              _os_log_impl(&dword_19B89C000, v39, OS_LOG_TYPE_DEFAULT, "Level does not have a cloudKitIndex: %{public}@, this usually implies that the asset is coming from an MA reference", buf, 0xCu);
            }
          }
          v82 = v32;

          -[TRINamespaceFactorProviding treatmentId](v94, "treatmentId");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v38, v40);

          -[TRINamespaceFactorProviding experimentId](v94, "experimentId");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            -[TRINamespaceFactorProviding experimentId](v94, "experimentId");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "addObject:", v42);

          }
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v43 = self->_providerChain;
          v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v91;
            do
            {
              for (i = 0; i != v45; ++i)
              {
                if (*(_QWORD *)v91 != v46)
                  objc_enumerationMutation(v43);
                v48 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v48, "levelForFactor:", v24);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = v49;
                  if (v49)
                  {
                    v51 = v22;
                    v52 = v38;
                    objc_msgSend(v49, "fileOrDirectoryLevelWithIsDir:", 0);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v53)
                      ((uint64_t (**)(_QWORD, void *, uint64_t, void *))v89)[2](v89, v48, v24, v53);
                    else
                      ((void (*)(void (**)(void), const __CFString *, uint64_t, uint64_t))v88[2])(v88, CFSTR("Not file/directory-typed"), v24, 10);

                    v38 = v52;
                    v22 = v51;
                  }

                }
              }
              v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
            }
            while (v45);
          }

          v16 = v79;
          self = v80;
          v21 = v77;
          v18 = v78;
          v23 = v81;
        }
        if (v94 == self->_rolloutProvider)
        {
          v54 = v76;
          goto LABEL_61;
        }
        if (v94 == self->_experimentProvider)
        {
          v54 = v74;
LABEL_61:
          objc_msgSend(v54, "addObject:", v24);
        }
      }
LABEL_26:

      v25 = v85;
LABEL_27:

      objc_autoreleasePoolPop(v25);
      ++v23;
    }
    while (v23 != v84);
    v58 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    v84 = v58;
  }
  while (v58);
LABEL_63:

  objc_storeStrong(location, v18);
  if (a4)
    objc_storeStrong(a4, obj);
  objc_storeStrong(v73, v65);
  if (a7)
    objc_storeStrong(a7, v74);
  if (a8)
    objc_storeStrong(a8, v76);
  if (a6)
    objc_storeStrong(a6, v64);

}

void __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2D50];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@, with factor \"%@\" in namespace \"%@\"."), a2, v10, v9, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, void *))(v8 + 16))(v8, v10, 0, v13);

}

BOOL __218__TRINamespaceFactorProviderChain_computeTreatmentAssetIndexes_withAssociatedExperimentIds_andFactorPackAssetIds_withAssociatedRolloutDeployments_withExperimentFactorNames_andRolloutFactorNames_forFactors_usingFilter___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  TRIAssetIdFactorName *v21;
  uint64_t v22;
  void *v23;
  int v24;
  TRIRolloutDeployment *v25;
  void *v26;
  TRIRolloutDeployment *v27;
  void *v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "treatmentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    TRIValidateFactorPackId(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assetId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateAssetId(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15 != 0;
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
          v19 = v17;
        else
          v19 = (id)objc_opt_new();
        v20 = v19;

        v21 = -[TRIAssetIdFactorName initWithAssetId:factorName:]([TRIAssetIdFactorName alloc], "initWithAssetId:factorName:", v15, v8);
        objc_msgSend(v20, "addObject:", v21);

        v29 = v20;
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, v12);
        objc_msgSend(v7, "experimentId");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          v24 = objc_msgSend(v7, "deploymentId");

          if (v24 != -1)
          {
            v25 = [TRIRolloutDeployment alloc];
            objc_msgSend(v7, "experimentId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:](v25, "initWithRolloutId:deploymentId:", v26, objc_msgSend(v7, "deploymentId"));

            objc_msgSend(*(id *)(a1 + 40), "addObject:", v27);
          }
        }

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v16 = 0;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v16 = 0;
  }

  return v16;
}

- (id)promotableFactorPackId
{
  void *rolloutProvider;
  TRINamespaceFactorProviding *v5;
  void *v6;
  id v7;

  if (self->_experimentProvider)
    goto LABEL_2;
  rolloutProvider = self->_rolloutProvider;
  if (!rolloutProvider)
    return rolloutProvider;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_2:
    rolloutProvider = 0;
  }
  else
  {
    v5 = self->_rolloutProvider;
    -[TRINamespaceFactorProviding treatmentId](v5, "treatmentId");
    rolloutProvider = (void *)objc_claimAutoreleasedReturnValue();

    if (rolloutProvider)
    {
      if (-[TRINamespaceFactorProviding promotable](v5, "promotable"))
      {
        -[TRINamespaceFactorProviding treatmentId](v5, "treatmentId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateFactorPackId(v6);
        rolloutProvider = (void *)objc_claimAutoreleasedReturnValue();

        if (rolloutProvider)
          v7 = rolloutProvider;

      }
      else
      {
        rolloutProvider = 0;
      }
    }

  }
  return rolloutProvider;
}

- (id)_dealiasedFactorLevelForFactorLevel:(id)a3 unaliasedName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 461, CFSTR("Shallow copy of aliased TRIFactorLevel needs updating, not implemented to copy all currently available fields"));

  }
  objc_msgSend(v7, "factor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 != 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorProviderChain.m"), 462, CFSTR("Shallow copy of aliased TRIFactor needs updating, not implemented to copy all currently available fields"));

  }
  v16 = (void *)objc_opt_new();
  objc_msgSend(v7, "level");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLevel:", v17);

  objc_msgSend(v16, "factor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setName:", v8);

  objc_msgSend(v7, "factor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "id_p");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "factor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setId_p:", v20);

  objc_msgSend(v7, "factor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "type");
  objc_msgSend(v16, "factor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setType:", v23);

  objc_msgSend(v7, "factor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "namespaceId");
  objc_msgSend(v16, "factor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNamespaceId:", v26);

  objc_msgSend(v7, "factor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "namespaceName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "factor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setNamespaceName:", v29);

  objc_msgSend(v7, "factor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "metadataKeysArray");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "factor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMetadataKeysArray:", v32);

  objc_msgSend(v16, "factor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAlias:", 0);

  return v16;
}

- (id)factorNamesWithObfuscation:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__TRINamespaceFactorProviderChain_factorNamesWithObfuscation___block_invoke;
  v4[3] = &unk_1E3C00068;
  v4[4] = self;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62__TRINamespaceFactorProviderChain_factorNamesWithObfuscation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(*(id *)(a1 + 32), "levelForFactor:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6 = v4,
        !v5))
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (unsigned)namespaceId
{
  void *v3;
  unsigned int v5;

  v5 = -1;
  TRINamespace_NamespaceId_EnumDescriptor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v3, "getValue:forEnumTextFormatName:", &v5, self->_namespaceName);

  if ((_DWORD)self)
    return v5;
  else
    return 0;
}

@end
