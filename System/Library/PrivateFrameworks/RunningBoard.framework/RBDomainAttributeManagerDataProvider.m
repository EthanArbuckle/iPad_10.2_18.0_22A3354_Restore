@implementation RBDomainAttributeManagerDataProvider

- (RBDomainAttributeManagerDataProvider)initWithPath:(id)a3
{
  id v4;
  RBDomainAttributeManagerDataProvider *v5;
  uint64_t v6;
  NSString *path;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBDomainAttributeManagerDataProvider;
  v5 = -[RBDomainAttributeManagerDataProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

  }
  return v5;
}

- (RBDomainAttributeManagerDataProvider)initWithDictionary:(id)a3
{
  id v5;
  RBDomainAttributeManagerDataProvider *v6;
  RBDomainAttributeManagerDataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBDomainAttributeManagerDataProvider;
  v6 = -[RBDomainAttributeManagerDataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawTemplates, a3);

  return v7;
}

- (id)validationErrors
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RBDomainAttributeManagerDataProvider _validatedTemplatesByDomainWithErrors:](self, v3);
  return v3;
}

- (_QWORD)_validatedTemplatesByDomainWithErrors:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = a2;
  if (a1)
  {
    -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke;
    v17[3] = &unk_24DD47810;
    v17[4] = a1;
    v8 = v6;
    v18 = v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v17);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_3;
    v13[3] = &unk_24DD47860;
    v13[4] = a1;
    v14 = v8;
    v15 = v3;
    v9 = v5;
    v16 = v9;
    v10 = v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);
    v11 = v16;
    a1 = v9;

  }
  return a1;
}

- (id)validDomains
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_templatesByDomainWithErrors:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void **v30;
  uint64_t *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  _BOOL4 v76;
  NSObject *v77;
  const char *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v84;
  uint64_t v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id obj;
  id obja;
  _QWORD *v93;
  _QWORD v94[4];
  id v95;
  void *v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  uint8_t v108[128];
  uint8_t buf[4];
  uint64_t v110;
  __int16 v111;
  void *v112;
  uint64_t v113;
  void *v114;
  _BYTE v115[128];
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  _QWORD v121[4];

  v121[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a1[1])
  {
    v13 = (void *)a1[2];
    v94[0] = MEMORY[0x24BDAC760];
    v94[1] = 3221225472;
    v94[2] = __69__RBDomainAttributeManagerDataProvider__templatesByDomainWithErrors___block_invoke;
    v94[3] = &unk_24DD47888;
    v14 = v4;
    v95 = v14;
    v96 = a1;
    v97 = v3;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v94);

    goto LABEL_52;
  }
  rbs_general_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[1];
    *(_DWORD *)buf = 138543362;
    v110 = v7;
    _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_DEFAULT, "Loading Domain Attributes from: %{public}@", buf, 0xCu);
  }

  objc_msgSend((id)a1[1], "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("domains.plist"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v9);
  v85 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v9;
  if (!v85)
  {
    rbs_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:].cold.1();

    v16 = (void *)MEMORY[0x24BDD1540];
    v116 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domains plist failure: %@"), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v10);
    goto LABEL_20;
  }
  RBSArrayForKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    rbs_general_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

    v27 = (void *)MEMORY[0x24BDD1540];
    v118 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domains array missing"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v28;
    v29 = (void *)MEMORY[0x24BDBCE70];
    v30 = &v119;
    v31 = &v118;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    rbs_general_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:].cold.3(v32, v33, v34, v35, v36, v37, v38, v39);

    v27 = (void *)MEMORY[0x24BDD1540];
    v120 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create domain set from plist"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v28;
    v29 = (void *)MEMORY[0x24BDBCE70];
    v30 = (void **)v121;
    v31 = &v120;
LABEL_19:
    objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v41);
LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  v12 = (void *)v11;
LABEL_21:

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = a1[1];
  v107 = 0;
  objc_msgSend(v42, "contentsOfDirectoryAtPath:error:", v43, &v107);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v107;

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v45 = v44;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
  v14 = v5;
  v47 = v45;
  v93 = a1;
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v104;
    v88 = *MEMORY[0x24BDD0FD8];
    v90 = *(_QWORD *)v104;
    do
    {
      v50 = 0;
      obj = (id)v48;
      do
      {
        if (*(_QWORD *)v104 != v49)
          objc_enumerationMutation(v47);
        v51 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v50);
        objc_msgSend(v51, "stringByDeletingPathExtension");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "containsObject:", v51) & 1) != 0)
        {
          -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:errors:]((void **)a1, v52, v51, v3);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v53, v52);
        }
        else
        {
          v54 = v47;
          v55 = v12;
          v56 = v14;
          v57 = v3;
          rbs_general_log();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = (uint64_t)v51;
            _os_log_fault_impl(&dword_21A8B4000, v58, OS_LOG_TYPE_FAULT, "Unknown RunningBoard domain file found: %{public}@", buf, 0xCu);
          }

          v59 = (void *)MEMORY[0x24BDD1540];
          v113 = v88;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ not allowed"), v52);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v60;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 4, v61);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = v57;
          objc_msgSend(v57, "addObject:", v53);
          v14 = v56;
          v12 = v55;
          v47 = v54;
          v49 = v90;
          v48 = (uint64_t)obj;
          a1 = v93;
        }

        ++v50;
      }
      while (v48 != v50);
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    }
    while (v48);
  }

  if (os_variant_has_internal_content())
  {
    v89 = v12;
    v62 = v3;
    objc_msgSend((id)a1[1], "stringByReplacingOccurrencesOfString:withString:", CFSTR("System/Library/LifecyclePolicy"), CFSTR("AppleInternal/LifecyclePolicy"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v84;
    objc_msgSend(v64, "contentsOfDirectoryAtPath:error:", v63, &v102);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v102;

    rbs_general_log();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = objc_msgSend(v65, "count");
      *(_DWORD *)buf = 134218242;
      v110 = v67;
      v111 = 2114;
      v112 = v63;
      _os_log_impl(&dword_21A8B4000, v66, OS_LOG_TYPE_DEFAULT, "Loading %lu Internal Domains from %{public}@", buf, 0x16u);
    }

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    obja = v65;
    v68 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v99 != v70)
            objc_enumerationMutation(obja);
          v72 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend(v72, "stringByDeletingPathExtension");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          rbs_general_log();
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
          if (v74)
          {
            if (!v76)
              goto LABEL_47;
            *(_DWORD *)buf = 138543362;
            v110 = (uint64_t)v73;
            v77 = v75;
            v78 = "Replacing domain %{public}@ with internal version";
          }
          else
          {
            if (!v76)
              goto LABEL_47;
            *(_DWORD *)buf = 138543362;
            v110 = (uint64_t)v73;
            v77 = v75;
            v78 = "Adding internal domain %{public}@";
          }
          _os_log_impl(&dword_21A8B4000, v77, OS_LOG_TYPE_DEFAULT, v78, buf, 0xCu);
LABEL_47:

          -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:dirpath:errors:](v93, v73, v72, v63, v62);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v79, v73);

        }
        v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
      }
      while (v69);
    }
    v80 = obja;

    v81 = v87;
    v3 = v62;
    v82 = (void *)v85;
    v12 = v89;
  }
  else
  {
    v80 = v47;
    v81 = v84;
    v82 = (void *)v85;
  }

LABEL_52:
  return v14;
}

- (id)templatesByDomain
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBDomainAttributeManagerDataProvider _validatedTemplatesByDomainWithErrors:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_2;
  v5[3] = &unk_24DD477E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  -[RBDomainAttributeManagerDataProvider _preDomainAttributeTemplateFromDomainAttributeTemplate:generateDependenciesByFullyQualifiedName:](*(_QWORD *)(a1 + 32), a3, *(void **)(a1 + 40));
}

- (void)_preDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 generateDependenciesByFullyQualifiedName:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(v7, "attributeGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke;
    v8[3] = &unk_24DD47928;
    v8[4] = a1;
    v9 = v7;
    v10 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_4;
  v11[3] = &unk_24DD47838;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = *(id *)(a1 + 48);
  v14 = v8;
  v10 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v10, v7);
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  -[RBDomainAttributeManagerDataProvider _validatedDomainAttributeTemplateFromDomainAttributeTemplate:dependenciesByFullyQualifiedName:errors:](*(_QWORD *)(a1 + 32), a3, *(void **)(a1 + 40), *(void **)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v5, v6);

}

- (RBDomainAttributeTemplate)_validatedDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 dependenciesByFullyQualifiedName:(void *)a4 errors:
{
  id v7;
  id v8;
  id v9;
  RBDomainAttributeTemplate *v10;
  char *v11;
  char *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = objc_alloc_init(RBDomainAttributeTemplate);
    -[RBDomainAttributeTemplate name]((uint64_t)v7);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setName:](v10, v11);

    -[RBDomainAttributeTemplate domain]((uint64_t)v7);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setDomain:](v10, v12);

    objc_msgSend(v7, "originatorEntitlements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setOriginatorEntitlements:](v10, "setOriginatorEntitlements:", v13);

    -[RBDomainAttributeTemplate endowmentNamespace]((uint64_t)v7);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setEndowmentNamespace:](v10, v14);

    objc_msgSend(v7, "targetBundleProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setTargetBundleProperties:](v10, "setTargetBundleProperties:", v15);

    objc_msgSend(v7, "targetEntitlements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setTargetEntitlements:](v10, "setTargetEntitlements:", v16);

    objc_msgSend(v7, "additionalRestrictions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setAdditionalRestrictions:](v10, "setAdditionalRestrictions:", v17);

    objc_msgSend(v7, "restriction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setRestriction:](v10, "setRestriction:", v18);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeGroups");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke;
    v23[3] = &unk_24DD47978;
    v23[4] = a1;
    v24 = v7;
    v25 = v8;
    v26 = v9;
    v27 = v19;
    v21 = v19;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v23);

    -[RBDomainAttributeTemplate setAttributeGroups:](v10, "setAttributeGroups:", v21);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 errors:
{
  if (a1)
  {
    -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:dirpath:errors:](a1, a2, a3, a1[1], a4);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 dirpath:(void *)a5 errors:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    objc_msgSend(a4, "stringByAppendingPathComponent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke;
    v18[3] = &unk_24DD478D8;
    v18[4] = a1;
    v19 = v9;
    v20 = v11;
    v15 = v14;
    v21 = v15;
    v22 = v10;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
    v16 = v22;
    a1 = v15;

  }
  return a1;
}

void __69__RBDomainAttributeManagerDataProvider__templatesByDomainWithErrors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = a2;
  -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromDictionary:errors:](v5, v7, a3, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

- (id)_templatesWithDomain:(void *)a3 fromDictionary:(void *)a4 errors:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = (void *)MEMORY[0x24BDBCED8];
    v10 = a3;
    objc_msgSend(v9, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke;
    v15[3] = &unk_24DD46EF0;
    v15[4] = a1;
    v16 = v7;
    v17 = v8;
    v12 = v11;
    v18 = v12;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

    v13 = v18;
    a1 = v12;

  }
  return a1;
}

- (id)_attributeTemplateForItem:(void *)a3 domain:(void *)a4 name:(void *)a5 errors:
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void **v36;
  uint64_t *v37;
  NSObject *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v45 = a3;
  v44 = a4;
  v46 = a5;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Class"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((-[RBDomainAttributeManagerDataProvider _isAttributeClassNameLegal:](a1, v10) & 1) != 0)
        {
          v43 = v10;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v41 = v9;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (!v12)
            goto LABEL_21;
          v13 = v12;
          v14 = *(_QWORD *)v49;
          v15 = *MEMORY[0x24BDD0FD8];
          while (1)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v49 != v14)
                objc_enumerationMutation(v11);
              v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                rbs_assertion_log();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v62 = v45;
                  v63 = 2114;
                  v64 = v44;
                  v65 = 2114;
                  v66 = v17;
                  _os_log_error_impl(&dword_21A8B4000, v22, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute property of wrong type: %{public}@", buf, 0x20u);
                }

                v23 = (void *)MEMORY[0x24BDD1540];
                v52 = v15;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains subattribute template of wrong type: %@"), v45, v44, v11);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v24;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v25);
                v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
                objc_msgSend(v46, "addObject:", v20);
                goto LABEL_18;
              }
              if ((objc_msgSend(v17, "isEqualToString:", CFSTR("Class")) & 1) != 0)
                continue;
              objc_msgSend(v11, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = 0;
              v19 = -[RBDomainAttributeManagerDataProvider _isPropertyLegalForClassName:propertyName:value:error:](a1, v43, v17, v18, (uint64_t)&v47);
              v20 = v47;

              if ((v19 & 1) == 0)
                goto LABEL_17;
              objc_msgSend(v11, "objectForKeyedSubscript:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v21, v17);

LABEL_18:
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
            if (!v13)
            {
LABEL_21:

              v26 = v42;
              v10 = v43;
              +[RBAttributeFactory attributeForClass:andProperties:errors:](RBAttributeFactory, "attributeForClass:andProperties:errors:", v43, v42, v46);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v41;
              goto LABEL_32;
            }
          }
        }
        rbs_assertion_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v62 = v45;
          v63 = 2114;
          v64 = v44;
          v65 = 2114;
          v66 = v10;
          _os_log_error_impl(&dword_21A8B4000, v38, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute property with an unsupported class name: %{public}@", buf, 0x20u);
        }

        v33 = (void *)MEMORY[0x24BDD1540];
        v55 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains subattribute property with an unsupported class name: %@"), v45, v44, v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v34;
        v35 = (void *)MEMORY[0x24BDBCE70];
        v36 = &v56;
        v37 = &v55;
      }
      else
      {
        rbs_assertion_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v62 = v45;
          v63 = 2114;
          v64 = v44;
          v65 = 2114;
          v66 = v10;
          _os_log_error_impl(&dword_21A8B4000, v32, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute with class name of wrong type: %{public}@", buf, 0x20u);
        }

        v33 = (void *)MEMORY[0x24BDD1540];
        v57 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains subattribute with class name of wrong type: %@"), v45, v44, v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v34;
        v35 = (void *)MEMORY[0x24BDBCE70];
        v36 = &v58;
        v37 = &v57;
      }
      objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v39);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "addObject:", v26);
      v27 = 0;
LABEL_32:

    }
    else
    {
      rbs_general_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v62 = v45;
        v63 = 2114;
        v64 = v44;
        v65 = 2114;
        v66 = v9;
        _os_log_error_impl(&dword_21A8B4000, v28, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattribute template of wrong type: %{public}@", buf, 0x20u);
      }

      v29 = (void *)MEMORY[0x24BDD1540];
      v59 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains subattribute template of wrong type: %@"), v45, v44, v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "addObject:", v10);
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)_isAttributeClassNameLegal:(void *)result
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = a2;
    -[RBDomainAttributeManagerDataProvider _legalClassNames](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    return (void *)v5;
  }
  return result;
}

- (uint64_t)_isPropertyLegalForClassName:(void *)a3 propertyName:(void *)a4 value:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  void *v25;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (!a1)
  {
    a5 = 0;
    goto LABEL_13;
  }
  -[RBDomainAttributeManagerDataProvider _legalPropertyNamesByClassName](a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    rbs_assertion_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[RBDomainAttributeManagerDataProvider _isPropertyLegalForClassName:propertyName:value:error:].cold.1();

    if (!a5)
      goto LABEL_12;
    v20 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown property %@ of attribute class %@"), v10, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v21;
    v22 = (void *)MEMORY[0x24BDBCE70];
    v23 = (void **)v37;
    v24 = &v36;
LABEL_11:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 3, v25);
    *(_QWORD *)a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v14, "containsObject:", v11) & 1) == 0 && objc_msgSend(v15, "count") != 1)
  {
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
    {
      rbs_assertion_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v31 = v11;
        v32 = 2114;
        v33 = v10;
        v34 = 2114;
        v35 = v9;
        _os_log_error_impl(&dword_21A8B4000, v27, OS_LOG_TYPE_ERROR, "Unknown value %{public}@ for property %{public}@ of attribute class %{public}@", buf, 0x20u);
      }

      if (!a5)
        goto LABEL_12;
      v20 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown value %@ for property %@ of attribute class %@"), v11, v10, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v21;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = &v29;
      v24 = &v28;
      goto LABEL_11;
    }
  }
  a5 = 1;
LABEL_12:

LABEL_13:
  return a5;
}

- (id)_attributeTemplatesFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;
  _QWORD v49[4];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a1)
  {
    v13 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    rbs_general_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:].cold.1();

    v21 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains no subattributes"), v10, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    v25 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_general_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v43 = v10;
      v44 = 2114;
      v45 = v11;
      v46 = 2114;
      v47 = v9;
      _os_log_error_impl(&dword_21A8B4000, v26, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains subattributes data of wrong type: %{public}@", buf, 0x20u);
    }

    v27 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains subattributes data of wrong type: %@"), v10, v11, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v27;
    v25 = 2;
LABEL_21:
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), v25, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

    objc_msgSend(v12, "addObject:", v28);
    goto LABEL_23;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = v9;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        -[RBDomainAttributeManagerDataProvider _attributeTemplateForItem:domain:name:errors:](a1, *(void **)(*((_QWORD *)&v33 + 1) + 8 * i), v10, v11, v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v16);
  }

  if (!objc_msgSend(v13, "count"))
  {
    rbs_general_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:].cold.2();

    v31 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains no subattributes"), v10, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 1, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v32;
    goto LABEL_22;
  }
  v9 = v32;
LABEL_23:

  return v13;
}

- (void)_configureTemplate:(void *)a3 fromInfo:(void *)a4 forDomain:(void *)a5 name:(char)a6 allowRestrictions:(void *)a7 errors:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  char v25;

  v17 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (a1)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __108__RBDomainAttributeManagerDataProvider__configureTemplate_fromInfo_forDomain_name_allowRestrictions_errors___block_invoke;
    v18[3] = &unk_24DD478B0;
    v19 = v14;
    v20 = v13;
    v25 = a6;
    v21 = v16;
    v22 = a1;
    v23 = v15;
    v24 = v17;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
}

void __108__RBDomainAttributeManagerDataProvider__configureTemplate_fromInfo_forDomain_name_allowRestrictions_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RB Domain template %@ malformed: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = 2;
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Attributes")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("AttributeGroups")) & 1) == 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Restriction")))
    {
      if (*(_BYTE *)(a1 + 80))
      {
LABEL_6:
        -[RBDomainAttributeManagerDataProvider _restrictionFromDictionary:forDomainAttributeWithDomain:name:errors:](*(_QWORD *)(a1 + 56), v6, *(void **)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 48));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 72), "setRestriction:", v7);
LABEL_9:

        goto LABEL_10;
      }
      v13 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RB Domain template %@ contains unexpected restriction with key : %@"), *(_QWORD *)(a1 + 32), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v9;
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v28;
      v16 = &v27;
    }
    else
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("RequiredTargetBundleProperties")))
      {
        -[RBDomainAttributeManagerDataProvider _bundlePropertiesFromDictionary:forDomainAttributeWithDomain:name:errors:](*(_QWORD *)(a1 + 56), v6, *(void **)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 48));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 72), "setTargetBundleProperties:", v7);
        goto LABEL_9;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("Selector")))
      {
        if (!*(_BYTE *)(a1 + 80))
          goto LABEL_6;
        v13 = (void *)MEMORY[0x24BDD1540];
        v25 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RB Domain template %@ contains unexpected selector"), *(_QWORD *)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v9;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = &v26;
        v16 = &v25;
      }
      else if (objc_msgSend(v5, "isEqualToString:", CFSTR("RequiredOriginatorEntitlements")))
      {
        if (*(_BYTE *)(a1 + 80))
        {
          +[RBEntitlementPredicate predicateForObject:forDomain:attribute:errors:](RBEntitlementPredicate, "predicateForObject:forDomain:attribute:errors:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 72), "setOriginatorEntitlements:", v7);
          goto LABEL_9;
        }
        v13 = (void *)MEMORY[0x24BDD1540];
        v23 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RB Domain template %@ contains unexpected restriction with key : %@"), *(_QWORD *)(a1 + 32), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v9;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = &v24;
        v16 = &v23;
      }
      else if (objc_msgSend(v5, "isEqualToString:", CFSTR("RequiredTargetEntitlements")))
      {
        if (*(_BYTE *)(a1 + 80))
        {
          +[RBEntitlementPredicate predicateForObject:forDomain:attribute:errors:](RBEntitlementPredicate, "predicateForObject:forDomain:attribute:errors:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 72), "setTargetEntitlements:", v7);
          goto LABEL_9;
        }
        v13 = (void *)MEMORY[0x24BDD1540];
        v21 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RB Domain template %@ contains unexpected restriction with key : %@"), *(_QWORD *)(a1 + 32), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v9;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = &v22;
        v16 = &v21;
      }
      else if (objc_msgSend(v5, "isEqualToString:", CFSTR("AdditionalRestrictions")))
      {
        if (*(_BYTE *)(a1 + 80))
        {
          -[RBDomainAttributeManagerDataProvider _additionalRestrictionsFromDictionary:forDomainAttributeWithDomain:name:errors:](*(_QWORD *)(a1 + 56), v6, *(void **)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 48));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 72), "setAdditionalRestrictions:", v7);
          goto LABEL_9;
        }
        v13 = (void *)MEMORY[0x24BDD1540];
        v19 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RB Domain template %@ contains unexpected restriction with key : %@"), *(_QWORD *)(a1 + 32), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v9;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = &v20;
        v16 = &v19;
      }
      else
      {
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("EndowmentNamespace")) & 1) != 0)
          goto LABEL_10;
        v13 = (void *)MEMORY[0x24BDD1540];
        v17 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RB Domain template %@ contains unrecognized key: %@"), *(_QWORD *)(a1 + 32), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v9;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = &v18;
        v16 = &v17;
      }
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v12 = 4;
LABEL_8:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), v12, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)_restrictionFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = 0;
  if (a1 && v9)
  {
    v17 = 0;
    +[RBDomainRestriction domainRestrictionForDictionary:withError:](RBDomainRestriction, "domainRestrictionForDictionary:withError:", v9, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (v14)
    {
      rbs_general_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v19 = v10;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains restriction that failed to resolve with error: %{public}@", buf, 0x20u);
      }

      objc_msgSend(v12, "addObject:", v14);
    }

  }
  return v13;
}

- (id)_bundlePropertiesFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke;
        v20[3] = &unk_24DD46EF0;
        v21 = v10;
        v22 = v11;
        v23 = v12;
        v13 = v13;
        v24 = v13;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v20);

      }
      else
      {
        rbs_general_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v28 = v10;
          v29 = 2114;
          v30 = v11;
          v31 = 2114;
          v32 = v9;
          _os_log_error_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains bundle properties of wrong type: %{public}@", buf, 0x20u);
        }

        if (v12)
        {
          v15 = (void *)MEMORY[0x24BDD1540];
          v25 = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains bundle property of wrong type: %@"), v10, v11, v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v16;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "addObject:", v18);
        }
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_additionalRestrictionsFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke;
        v20[3] = &unk_24DD46EF0;
        v21 = v10;
        v22 = v11;
        v23 = v12;
        v13 = v13;
        v24 = v13;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v20);

      }
      else
      {
        rbs_general_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v28 = v10;
          v29 = 2114;
          v30 = v11;
          v31 = 2114;
          v32 = v9;
          _os_log_error_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains additionalRestrictions of wrong type: %{public}@", buf, 0x20u);
        }

        if (v12)
        {
          v15 = (void *)MEMORY[0x24BDD1540];
          v25 = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains additionalRestrictions of wrong type: %@"), v10, v11, v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v16;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "addObject:", v18);
        }
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_checkConflictingAttributes:(uint64_t)a3 error:
{
  void *v4;
  _BOOL8 v5;

  if (result)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[RBAssertionDescriptorValidator checkConflictingAttributes:error:](RBAssertionDescriptorValidator, "checkConflictingAttributes:error:", v4, a3);

    return v5;
  }
  return result;
}

- (id)_attributeTemplateGroupsFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  RBAttributeTemplateGroup *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  void *v42;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;
  void *v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;
  _QWORD v71[4];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a1;
  v13 = v11;
  v51 = a5;
  if (!a1)
  {
    v47 = 0;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v45 = v13;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v14 = v9;
      v50 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v50)
      {
        v44 = v9;
        v48 = *MEMORY[0x24BDD0FD8];
        v49 = *(_QWORD *)v54;
        v46 = v14;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v54 != v49)
              objc_enumerationMutation(v14);
            v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Attributes"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:](v12, v17, v10, v13, v51);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                v52 = 0;
                v19 = (uint64_t)v12;
                v20 = -[RBDomainAttributeManagerDataProvider _checkConflictingAttributes:error:]((_BOOL8)v12, (uint64_t)v18, (uint64_t)&v52);
                v21 = v52;
                if (!v20)
                {
                  rbs_general_log();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v65 = v10;
                    v66 = 2112;
                    v67 = v21;
                    _os_log_error_impl(&dword_21A8B4000, v22, OS_LOG_TYPE_ERROR, "Conflicting attributes found in Domain: %@ with error: %@", buf, 0x16u);
                  }

                  v23 = (void *)MEMORY[0x24BDD1540];
                  v57 = v48;
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error in Domain %@: %@"), v10, v21);
                  v24 = v10;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = v25;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 5, v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();

                  v10 = v24;
                  objc_msgSend(v51, "addObject:", v27);

                  v13 = v45;
                }
                v28 = objc_alloc_init(RBAttributeTemplateGroup);
                -[RBAttributeTemplateGroup setAttributes:](v28, "setAttributes:", v18);
                -[RBDomainAttributeManagerDataProvider _configureTemplate:fromInfo:forDomain:name:allowRestrictions:errors:](v19, v28, v16, v10, v13, 0, v51);
                objc_msgSend(v47, "addObject:", v28);

                v12 = (void *)v19;
                v14 = v46;
              }
            }
            else
            {
              rbs_general_log();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v65 = v10;
                v66 = 2114;
                v67 = v13;
                v68 = 2114;
                v69 = v16;
                _os_log_error_impl(&dword_21A8B4000, v29, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains attribute group of wrong type: %{public}@", buf, 0x20u);
              }

              v30 = (void *)MEMORY[0x24BDD1540];
              v59 = v48;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains attribute group of wrong type: %@"), v10, v13, v16);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v31;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v32);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v51, "addObject:", v18);
            }

          }
          v50 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v50);
        v9 = v44;
      }
      goto LABEL_29;
    }
    rbs_general_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v65 = v10;
      v66 = 2114;
      v67 = v13;
      v68 = 2114;
      v69 = v9;
      _os_log_error_impl(&dword_21A8B4000, v40, OS_LOG_TYPE_ERROR, "Domain %{public}@ attribute %{public}@ contains attribute groups data of wrong type: %{public}@", buf, 0x20u);
    }

    v41 = v13;
    v42 = (void *)MEMORY[0x24BDD1540];
    v62 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains attribute groups data of wrong type: %@"), v10, v41, v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v42;
    v39 = 2;
  }
  else
  {
    rbs_general_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[RBDomainAttributeManagerDataProvider _attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:].cold.1();

    v34 = v13;
    v35 = (void *)MEMORY[0x24BDD1540];
    v70 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains no subattributes"), v10, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v35;
    v39 = 1;
  }
  objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), v39, v37);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "addObject:", v14);
  v13 = v45;
LABEL_29:

LABEL_30:
  return v47;
}

void __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v6, v5);
  }
  else
  {
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1();

    if (*(_QWORD *)(a1 + 48))
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains bundle property name of wrong type: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *MEMORY[0x24BDD0FD8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    }
  }

}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v6, v5);
      goto LABEL_13;
    }
    rbs_general_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1();

    if (*(_QWORD *)(a1 + 48))
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains entitlement value of wrong type: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6, *MEMORY[0x24BDD0FD8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v17;
      v12 = &v16;
      goto LABEL_12;
    }
  }
  else
  {
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_2();

    if (*(_QWORD *)(a1 + 48))
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute %@ contains entitlement name of wrong type: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = (void **)v19;
      v12 = &v18;
LABEL_12:
      objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
    }
  }
LABEL_13:

}

- (RBDomainAttributeTemplate)_templateWithDomain:(void *)a3 name:(void *)a4 dictionary:(void *)a5 errors:
{
  char *v9;
  char *v10;
  id v11;
  id v12;
  RBDomainAttributeTemplate *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void **v33;
  uint64_t *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(RBDomainAttributeTemplate);
        -[RBDomainAttributeTemplate setName:](v13, v10);
        -[RBDomainAttributeTemplate setDomain:](v13, v9);
        -[RBDomainAttributeManagerDataProvider _configureTemplate:fromInfo:forDomain:name:allowRestrictions:errors:]((uint64_t)a1, v13, v11, v9, v10, 1, v12);
        RBSArrayForKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          rbs_general_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

          v24 = (void *)MEMORY[0x24BDD1540];
          v40 = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain attribute specified with legacy array EndowmentNamespace"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v25;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 3, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "addObject:", v27);
          v28 = v15;
        }
        else
        {
          RBSStringForKey();
          v28 = (char *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
LABEL_20:
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AttributeGroups"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBDomainAttributeManagerDataProvider _attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:](a1, v37, v9, v10, v12);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              -[RBDomainAttributeTemplate setAttributeGroups:](v13, "setAttributeGroups:", v38);
            }
            else
            {

              v13 = 0;
            }

            goto LABEL_24;
          }
        }
        -[RBDomainAttributeTemplate setEndowmentNamespace:](v13, v28);

        goto LABEL_20;
      }
      rbs_general_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:].cold.2();

      if (v12)
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v42 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain attribute templates for %@ is not a dictionary: %@"), v10, v11);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v31;
        v32 = (void *)MEMORY[0x24BDBCE70];
        v33 = &v43;
        v34 = &v42;
        goto LABEL_16;
      }
    }
    else
    {
      rbs_general_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:].cold.3();

      if (v12)
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v44 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain %@ attribute name is not a string: %@"), v9, v10);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v31;
        v32 = (void *)MEMORY[0x24BDBCE70];
        v33 = (void **)v45;
        v34 = &v44;
LABEL_16:
        objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addObject:", v15);
        v13 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
  }
  v13 = 0;
LABEL_25:

  return v13;
}

void __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:](*(void **)(a1 + 32), *(void **)(a1 + 40), v5, a3, *(void **)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 56);
    -[RBDomainAttributeTemplate name](v6);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);
  }
  else
  {
    rbs_general_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke_cold_1();
  }

}

void __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:](*(void **)(a1 + 32), *(void **)(a1 + 40), v5, a3, *(void **)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 56);
    -[RBDomainAttributeTemplate name](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  else
  {
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke_cold_1();

  }
}

void __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke_2;
  v5[3] = &unk_24DD47900;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

void __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke_2(uint64_t a1, void *a2)
{
  -[RBDomainAttributeManagerDataProvider _preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_preAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 generateDependenciesByFullyQualifiedName:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = a3;
    -[RBDomainAttributeTemplate domain]((uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate name]((uint64_t)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByAppendingPathExtension:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v7;
      objc_msgSend(v13, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathExtension:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", v12))
      {
        rbs_assertion_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[RBDomainAttributeManagerDataProvider _preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:].cold.1();
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v12);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v12);
        }
        -[NSObject addObject:](v17, "addObject:", v16);
      }

    }
  }

}

void __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  RBAttributeTemplateGroup *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v13 = objc_alloc_init(RBAttributeTemplateGroup);
  objc_msgSend(v3, "originatorEntitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setOriginatorEntitlements:](v13, "setOriginatorEntitlements:", v4);

  objc_msgSend(v3, "targetBundleProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setTargetBundleProperties:](v13, "setTargetBundleProperties:", v5);

  objc_msgSend(v3, "targetEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setTargetEntitlements:](v13, "setTargetEntitlements:", v6);

  objc_msgSend(v3, "additionalRestrictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setAdditionalRestrictions:](v13, "setAdditionalRestrictions:", v7);

  objc_msgSend(v3, "restriction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setRestriction:](v13, "setRestriction:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke_2;
  v14[3] = &unk_24DD47950;
  v11 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v11;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = v9;
  v12 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  -[RBAttributeTemplateGroup setAttributes:](v13, "setAttributes:", v12);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);

}

void __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke_2(void **a1, void *a2)
{
  void *v3;
  void *v4;

  -[RBDomainAttributeManagerDataProvider _validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:](a1[4], a2, a1[5], a1[6], a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(a1[8], "addObject:", v3);
    v3 = v4;
  }

}

- (id)_validatedAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 dependenciesByFullyQualifiedName:(void *)a5 errors:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    v12 = a3;
    -[RBDomainAttributeTemplate domain]((uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate name]((uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stringByAppendingPathExtension:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v16 = v9;
    objc_msgSend(v16, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathExtension:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", v15))
    {
      rbs_assertion_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[RBDomainAttributeManagerDataProvider _preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:].cold.1();

      if (!v11)
      {
        v23 = 1;
        goto LABEL_17;
      }
      v21 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Domain attribute %@ attempts to include itself"), v15);
      v42 = v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v22;
      v23 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v40 = v18;
      v24 = v16;
      v25 = v11;
      v26 = v10;
      v27 = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 3, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v27;
      v10 = v26;
      v11 = v25;
      v16 = v24;
      v18 = v40;

      v19 = v42;
      objc_msgSend(v11, "addObject:", v29);
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "containsObject:", v15))
      {
        v43 = v19;
        rbs_assertion_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[RBDomainAttributeManagerDataProvider _validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:].cold.2();

        if (v11)
        {
          v31 = (void *)MEMORY[0x24BDD1540];
          v44 = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Detected cycle between domain attributes %@ and %@"), v15, v43);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v41;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
          v32 = v18;
          v33 = v16;
          v34 = v11;
          v35 = v10;
          v36 = v17;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 3, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v36;
          v10 = v35;
          v11 = v34;
          v16 = v33;
          v18 = v32;

          objc_msgSend(v11, "addObject:", v38);
          v19 = v43;
          v23 = 1;
        }
        else
        {
          v23 = 1;
          v19 = v43;
        }
      }
      else
      {
        v23 = 0;
      }
    }

LABEL_17:
    if (v23)
    {
      a1 = 0;
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    a1 = (void *)objc_msgSend(v9, "copy");
    goto LABEL_20;
  }
LABEL_21:

  return a1;
}

- (id)_legalPropertyNamesByClassName
{
  if (a1)
  {
    if (_legalPropertyNamesByClassName_onceToken != -1)
      dispatch_once(&_legalPropertyNamesByClassName_onceToken, &__block_literal_global_183);
    a1 = (id)_legalPropertyNamesByClassName_legalPropertyNamesByClassName;
  }
  return a1;
}

- (id)_legalClassNames
{
  if (a1)
  {
    if (_legalClassNames_onceToken != -1)
      dispatch_once(&_legalClassNames_onceToken, &__block_literal_global_24);
    a1 = (id)_legalClassNames_legalClassNames;
  }
  return a1;
}

void __56__RBDomainAttributeManagerDataProvider__legalClassNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("RBSAcquisitionCompletionAttribute"), CFSTR("RBSCPUAccessGrant"), CFSTR("RBSSuspendableCPUGrant"), CFSTR("RBSCarPlayModeGrant"), CFSTR("RBSCoalitionLevelGrant"), CFSTR("RBSCPUMaximumUsageLimitation"), CFSTR("RBSCPUMinimumUsageGrant"), CFSTR("RBSDefineRelativeStartTimeGrant"), CFSTR("RBSDomainAttribute"), CFSTR("RBSDebugGrant"), CFSTR("RBSDurationAttribute"), CFSTR("RBSGPUAccessGrant"), CFSTR("RBSJetsamPriorityGrant"), CFSTR("RBSBaseMemoryGrant"), CFSTR("RBSLaunchGrant"), CFSTR("RBSPreserveBaseMemoryGrant"), CFSTR("RBSPreventIdleSleepGrant"),
    CFSTR("RBSPreventResourceUsageInvalidationAttribute"),
    CFSTR("RBSResistTerminationGrant"),
    CFSTR("RBSRunningReasonAttribute"),
    CFSTR("RBSTagAttribute"),
    CFSTR("RBSAppNapEnableGrant"),
    CFSTR("RBSAppNapInactiveGrant"),
    CFSTR("RBSAppNapPreventBackgroundSocketsGrant"),
    CFSTR("RBSAppNapPreventDiskThrottleGrant"),
    CFSTR("RBSAppNapPreventLowPriorityCPUGrant"),
    CFSTR("RBSAppNapPreventSuppressedCPUGrant"),
    CFSTR("RBSAppNapPreventTimerThrottleGrant"),
    CFSTR("RBSMimicTaskSuspensionAttribute"),
    CFSTR("RBSForceRoleManageAttribute"),
    CFSTR("RBSEndowmentGrant"),
    CFSTR("RBSSubordinateProcessAttribute"),
    CFSTR("RBSSavedEndowmentGrant"),
    CFSTR("RBSConditionAttribute"),
    CFSTR("RBSInvalidateUnderConditionAttribute"),
    CFSTR("RBSPersistentAttribute"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_legalClassNames_legalClassNames;
  _legalClassNames_legalClassNames = v0;

}

void __70__RBDomainAttributeManagerDataProvider__legalPropertyNamesByClassName__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  void *v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  void *v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  _QWORD v68[2];
  _QWORD v69[2];
  void *v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  void *v77;
  void *v78;
  _QWORD v79[4];
  _QWORD v80[4];
  void *v81;
  void *v82;
  _QWORD v83[3];
  _QWORD v84[3];
  void *v85;
  void *v86;
  _QWORD v87[4];
  _QWORD v88[4];
  _QWORD v89[19];
  _QWORD v90[21];

  v90[19] = *MEMORY[0x24BDAC8D0];
  v89[0] = CFSTR("RBSAcquisitionCompletionAttribute");
  v89[1] = CFSTR("RBSCoalitionLevelGrant");
  v90[0] = &unk_24DD5FB98;
  v90[1] = &unk_24DD5FBC0;
  v89[2] = CFSTR("RBSCPUAccessGrant");
  v89[3] = CFSTR("RBSSuspendableCPUGrant");
  v90[2] = &unk_24DD5FBE8;
  v90[3] = &unk_24DD5FC10;
  v89[4] = CFSTR("RBSCPUMaximumUsageLimitation");
  v87[0] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v47;
  v87[1] = CFSTR("Percentage");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v45;
  v88[2] = &unk_24DD5FD68;
  v87[2] = CFSTR("Role");
  v87[3] = CFSTR("ViolationPolicy");
  v88[3] = &unk_24DD5FD80;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v90[4] = v44;
  v89[5] = CFSTR("RBSCPUMinimumUsageGrant");
  v83[0] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v42;
  v83[1] = CFSTR("Percentage");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v81, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = CFSTR("Role");
  v84[1] = v40;
  v84[2] = &unk_24DD5FD98;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v90[5] = v39;
  v89[6] = CFSTR("RBSDurationAttribute");
  v80[0] = &unk_24DD5FDB0;
  v79[0] = CFSTR("EndPolicy");
  v79[1] = CFSTR("WarningDuration");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v37;
  v79[2] = CFSTR("InvalidationDuration");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = CFSTR("StartPolicy");
  v80[2] = v35;
  v80[3] = &unk_24DD5FDC8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v90[6] = v34;
  v89[7] = CFSTR("RBSDomainAttribute");
  v75[0] = CFSTR("Domain");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v74, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v32;
  v75[1] = CFSTR("Name");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v90[7] = v29;
  v89[8] = CFSTR("RBSJetsamPriorityGrant");
  v71 = CFSTR("Band");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v90[8] = v26;
  v89[9] = CFSTR("RBSBaseMemoryGrant");
  v68[0] = CFSTR("Category");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = CFSTR("Strength");
  v69[0] = v24;
  v69[1] = &unk_24DD5FDE0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v90[9] = v23;
  v90[10] = &unk_24DD5FC38;
  v89[10] = CFSTR("RBSResistTerminationGrant");
  v89[11] = CFSTR("RBSRunningReasonAttribute");
  v65 = CFSTR("RunningReason");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v90[11] = v20;
  v89[12] = CFSTR("RBSTagAttribute");
  v62 = CFSTR("Tag");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v90[12] = v17;
  v90[13] = &unk_24DD5FC60;
  v89[13] = CFSTR("RBSAppNapPreventTimerThrottleGrant");
  v89[14] = CFSTR("RBSEndowmentGrant");
  v90[14] = &unk_24DD5FC88;
  v89[15] = CFSTR("RBSSavedEndowmentGrant");
  v59[0] = CFSTR("Namespace");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = CFSTR("Key");
  v60[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v90[15] = v12;
  v90[16] = &unk_24DD5FCB0;
  v89[16] = CFSTR("RBSGPUAccessGrant");
  v89[17] = CFSTR("RBSConditionAttribute");
  v55[0] = CFSTR("Condition");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = CFSTR("Value");
  v56[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v90[17] = v3;
  v89[18] = CFSTR("RBSInvalidateUnderConditionAttribute");
  v51[0] = CFSTR("Condition");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = CFSTR("MinValue");
  v52[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90[18] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 19);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_legalPropertyNamesByClassName_legalPropertyNamesByClassName;
  _legalPropertyNamesByClassName_legalPropertyNamesByClassName = v9;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTemplates, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_templatesByDomainWithErrors:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_21A8B4000, v0, OS_LOG_TYPE_FAULT, "Domains plist failure: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)_templatesByDomainWithErrors:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21A8B4000, a1, a3, "Domains array missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_templatesByDomainWithErrors:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21A8B4000, a1, a3, "Could not create domain set from plist", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_isPropertyLegalForClassName:propertyName:value:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Unknown property %{public}@ of attribute class %{public}@");
  OUTLINED_FUNCTION_1_1();
}

- (void)_attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %@ contains no subattributes");
  OUTLINED_FUNCTION_1_1();
}

- (void)_attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains no valid subattributes");
  OUTLINED_FUNCTION_1_1();
}

- (void)_attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains no attribute groups");
  OUTLINED_FUNCTION_1_1();
}

void __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_8(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains bundle property name of wrong type: %{public}@");
  OUTLINED_FUNCTION_3_2();
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_8(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains dditional restriction value of wrong type: %{public}@");
  OUTLINED_FUNCTION_3_2();
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_8(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute %{public}@ contains additional restriction of wrong type: %{public}@");
  OUTLINED_FUNCTION_3_2();
}

- (void)_templateWithDomain:(uint64_t)a3 name:(uint64_t)a4 dictionary:(uint64_t)a5 errors:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21A8B4000, a1, a3, "Domain attribute specified with legacy array EndowmentNamespace", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_templateWithDomain:name:dictionary:errors:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Domain attribute templates for %{public}@ is not a dictionary: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

- (void)_templateWithDomain:name:dictionary:errors:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Domain %{public}@ attribute name is not a string: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

void __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Error extracting domain attribute template with name %{public}@ from file %{public}@");
  OUTLINED_FUNCTION_1_1();
}

void __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Error extracting domain attribute template with name %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Domain attribute %{public}@ attempts to include itself", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Detected cycle between domain attributes %{public}@ and %{public}@");
  OUTLINED_FUNCTION_1_1();
}

@end
