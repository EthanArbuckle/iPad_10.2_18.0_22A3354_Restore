@implementation RBDomainAttributeManager

- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4
{
  NSDictionary *domainAttributeTemplatesByDomain;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBDomainAttributeTemplate endowmentNamespace]((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)restrictionsForDomain:(id)a3 andName:(id)a4
{
  NSDictionary *domainAttributeTemplatesByDomain;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "restriction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5
{
  RBDomainAttributeManager *v7;
  NSDictionary *domainAttributeTemplatesByDomain;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = self;
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v9 = a5;
  v10 = a3;
  -[NSDictionary objectForKeyedSubscript:](domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "targetBundleProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = -[RBDomainAttributeManager _compareTargetBundleProperties:withContext:]((uint64_t)v7, v13, v10);

  return (char)v7;
}

- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4
{
  NSDictionary *domainAttributeTemplatesByDomain;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v8, "additionalRestrictions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4
{
  NSDictionary *domainAttributeTemplatesByDomain;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "targetEntitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4
{
  NSDictionary *domainAttributeTemplatesByDomain;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "originatorEntitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  RBDomainAttributeManager *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  NSObject *obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[NSDictionary objectForKeyedSubscript:](self->_domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      -[NSObject attributeGroups](v15, "attributeGroups");
      obj = objc_claimAutoreleasedReturnValue();
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (!v17)
        goto LABEL_35;
      v18 = v17;
      v41 = v15;
      v42 = v14;
      v43 = v11;
      v44 = v10;
      v19 = *(_QWORD *)v52;
      while (1)
      {
        v20 = 0;
        v45 = v18;
        do
        {
          if (*(_QWORD *)v52 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v20);
          if (!v12)
            goto LABEL_11;
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v20), "targetBundleProperties");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[RBDomainAttributeManager _compareTargetBundleProperties:withContext:]((uint64_t)self, v22, v12))
          {
            objc_msgSend(v21, "restriction");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[RBDomainAttributeManager _compareRestrictions:withContext:]((uint64_t)self, v23, v12);

            if (!v24)
              goto LABEL_22;
LABEL_11:
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            objc_msgSend(v21, "attributes", v41, v42, v43, v44);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v25)
            {
              v26 = v25;
              v27 = v19;
              v28 = v12;
              v29 = self;
              v30 = *(_QWORD *)v48;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v48 != v30)
                    objc_enumerationMutation(v22);
                  v32 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                  if (v32)
                  {
                    v33 = (void *)objc_msgSend(v32, "copy");
                    objc_msgSend(v16, "addObject:", v33);

                  }
                }
                v26 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              }
              while (v26);
              self = v29;
              v12 = v28;
              v19 = v27;
              v18 = v45;
            }
          }

LABEL_22:
          ++v20;
        }
        while (v20 != v18);
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (!v18)
        {
          v11 = v43;
          v10 = v44;
          v15 = v41;
          v14 = v42;
          goto LABEL_35;
        }
      }
    }
    if (a6)
    {
      v37 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BE80D88];
      v57 = *MEMORY[0x24BDD0FD8];
      v58 = CFSTR("Could not find attribute name in domain plist");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 2, v39);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    rbs_assertion_log();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[RBDomainAttributeManager attributesForDomain:andName:context:withError:].cold.2((uint64_t)v11, (uint64_t)v10, obj);
    v16 = 0;
LABEL_35:

  }
  else
  {
    if (a6)
    {
      v34 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BE80D88];
      v59 = *MEMORY[0x24BDD0FD8];
      v60[0] = CFSTR("Could not find plist for domain attribute");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 2, v36);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    rbs_assertion_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RBDomainAttributeManager attributesForDomain:andName:context:withError:].cold.1((uint64_t)v10, v15);
    v16 = 0;
  }

  return v16;
}

- (BOOL)_compareTargetBundleProperties:(void *)a3 withContext:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    objc_msgSend(v6, "targetProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke;
    v12[3] = &unk_24DD474E0;
    v9 = v8;
    v13 = v9;
    v15 = &v16;
    v14 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);
    v10 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_compareRestrictions:(void *)a3 withContext:
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5)
      a1 = objc_msgSend(v5, "allowsContext:withError:", v6, 0);
    else
      a1 = 1;
  }

  return a1;
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  char v13;
  char v14;
  int v15;
  int v16;
  int v17;
  id v18;

  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SupportsBackgroundContentFetching")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "supportsBackgroundContentFetching");
LABEL_35:
      v15 = v9;
      v16 = objc_msgSend(v8, "BOOLValue");
      goto LABEL_36;
    }
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_58;
LABEL_63:

    goto LABEL_64;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("UsesSocketMonitoring")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "usesSocketMonitoring");
      goto LABEL_35;
    }
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_58;
    goto LABEL_63;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SupportsBackgroundNetworkAuthentication")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "supportsBackgroundNetworkAuthentication");
      goto LABEL_35;
    }
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_63;
LABEL_58:
    __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_1();
    goto LABEL_63;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SupportsUnboundedTaskCompletion")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "supportsUnboundedTaskCompletion");
      goto LABEL_35;
    }
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_63;
    goto LABEL_58;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SupportsBackgroundAudio")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "supportsBackgroundAudio");
      goto LABEL_35;
    }
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_63;
    goto LABEL_58;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuousBackgroundMode")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      rbs_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        goto LABEL_63;
      goto LABEL_58;
    }
    v11 = objc_msgSend(*(id *)(a1 + 32), "continuousBackgroundMode");
    if (v11 != objc_msgSend(v8, "BOOLValue"))
    {
LABEL_37:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_64;
    }
    objc_msgSend(*(id *)(a1 + 40), "targetProcess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPlatformBinary");
    goto LABEL_28;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("IsExtension")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "isExtension");
      goto LABEL_35;
    }
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_63;
    goto LABEL_58;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Platform")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("NotPlatform")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(*(id *)(a1 + 32), "platform");
        if (v17 != objc_msgSend(v8, "intValue"))
          goto LABEL_64;
        goto LABEL_37;
      }
      rbs_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        goto LABEL_63;
      goto LABEL_58;
    }
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("BundleID")))
    {
      rbs_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_11((uint64_t)v7, v10);
      goto LABEL_63;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      rbs_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_10();
      goto LABEL_63;
    }
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18 == v8)
    {

      goto LABEL_64;
    }
    if (!v8 || !v18)
    {

      goto LABEL_37;
    }
    v12 = v18;
    v13 = objc_msgSend(v18, "isEqual:", v8);
LABEL_28:
    v14 = v13;

    if ((v14 & 1) != 0)
      goto LABEL_64;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_63;
    goto LABEL_58;
  }
  v15 = objc_msgSend(*(id *)(a1 + 32), "platform");
  v16 = objc_msgSend(v8, "intValue");
LABEL_36:
  if (v15 != v16)
    goto LABEL_37;
LABEL_64:

}

- (RBDomainAttributeManager)initWithDataProvider:(id)a3
{
  id v5;
  RBDomainAttributeManager *v6;
  RBDomainAttributeManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBDomainAttributeManager;
  v6 = -[RBDomainAttributeManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataProvider, a3);
    -[RBDomainAttributeManager _prepareAttributeTemplates]((uint64_t)v7);
  }

  return v7;
}

- (void)_prepareAttributeTemplates
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x22074BD78]();
    objc_msgSend(*(id *)(a1 + 16), "templatesByDomain");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;

    objc_autoreleasePoolPop(v2);
  }
}

- (NSString)debugDescription
{
  id v3;
  NSDictionary *domainAttributeTemplatesByDomain;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__RBDomainAttributeManager_debugDescription__block_invoke;
  v11[3] = &unk_24DD47438;
  v12 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](domainAttributeTemplatesByDomain, "enumerateKeysAndObjectsUsingBlock:", v11);
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("<%@|  domainAttributeTemplatesByDomain:%@>"), v7, v8);

  return (NSString *)v9;
}

void __44__RBDomainAttributeManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "entriesToStringWithIndent:debug:", 2, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@={\n%@\n\t}"), v5, v6);

}

- (id)allEntitlements
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__RBDomainAttributeManager_allEntitlements__block_invoke;
  block[3] = &unk_24DD46160;
  block[4] = self;
  if (allEntitlements_onceToken != -1)
    dispatch_once(&allEntitlements_onceToken, block);
  return (id)allEntitlements_entitlements;
}

uint64_t __43__RBDomainAttributeManager_allEntitlements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allEntitlements_entitlements;
  allEntitlements_entitlements = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_18);
}

uint64_t __43__RBDomainAttributeManager_allEntitlements__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_14);
}

void __43__RBDomainAttributeManager_allEntitlements__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)allEntitlements_entitlements;
  v4 = a3;
  objc_msgSend(v4, "originatorEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  v7 = (void *)allEntitlements_entitlements;
  objc_msgSend(v4, "targetEntitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allEntitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v9);

  v10 = (void *)allEntitlements_entitlements;
  objc_msgSend(v4, "restriction");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allEntitlements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v11);

}

- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4
{
  NSDictionary *domainAttributeTemplatesByDomain;
  id v6;
  void *v7;
  void *v8;

  domainAttributeTemplatesByDomain = self->_domainAttributeTemplatesByDomain;
  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](domainAttributeTemplatesByDomain, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_domainAttributeTemplatesByDomain, 0);
}

- (void)attributesForDomain:(uint64_t)a1 andName:(NSObject *)a2 context:withError:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Could not find plist for domain %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)attributesForDomain:(os_log_t)log andName:context:withError:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Could not find attribute name %{public}@ in domain plist %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_1();
  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_11(v0);
  OUTLINED_FUNCTION_1_10(&dword_21A8B4000, v2, v3, "Malformed domain plist - %{public}@ is not of class %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_10()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_1();
  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_11(v0);
  OUTLINED_FUNCTION_1_10(&dword_21A8B4000, v2, v3, "Malformed domain plist - %{public}@ is not of class %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __71__RBDomainAttributeManager__compareTargetBundleProperties_withContext___block_invoke_cold_11(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_FAULT, "Malformed domain plist - %{public}@ unrecognized", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

@end
