@implementation WRWorkflow

+ (uint64_t)diagnosticsEnabled
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  id v8;

  objc_opt_self();
  v8 = 0;
  WROverrideDiagnosticsEnablement(&v8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v8;
  v2 = v1;
  if (v0)
  {
    v3 = objc_msgSend(v0, "BOOLValue");
LABEL_10:
    v6 = v3;
    goto LABEL_11;
  }
  if (v1)
  {
    v4 = *__error();
    _wrlog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[WRWorkflow diagnosticsEnabled].cold.1();

    *__error() = v4;
  }
  if ((WRIsSeedBuild() & 1) == 0)
  {
    v3 = WRIsAppleInternal();
    goto LABEL_10;
  }
  v6 = 1;
LABEL_11:

  return v6;
}

+ (uint64_t)telemetryEnabled
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  id v7;

  objc_opt_self();
  v7 = 0;
  WROverrideTelemetryEnablement(&v7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v7;
  v2 = v1;
  if (v0)
  {
    v3 = objc_msgSend(v0, "BOOLValue");
  }
  else
  {
    if (v1)
    {
      v4 = *__error();
      _wrlog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        +[WRWorkflow diagnosticsEnabled].cold.1();

      *__error() = v4;
    }
    v3 = 1;
  }

  return v3;
}

+ (id)plistDirectory
{
  void *v0;
  void *v1;
  int v2;
  NSObject *v3;
  void *v4;

  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resourceURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    v2 = *__error();
    _wrlog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      +[WRWorkflow plistDirectory].cold.1();

    *__error() = v2;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:relativeToURL:", CFSTR("WorkflowPlists"), v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)overridePlistDirectory
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/private/var/db/WorkflowResponsiveness/OverridePlists"), 1);
}

+ (id)makeOverridePlistDirectoryWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  if (geteuid())
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 513, 0);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "overridePlistDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, a3);

    v5 = 0;
    if (v8)
      v5 = v6;

  }
  return v5;
}

+ (id)allWorkflows
{
  char v2;
  char v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  WRWorkflow *v37;
  id *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int v44;
  NSObject *v45;
  int v46;
  NSObject *v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v52;
  id v53;
  id v54;
  id obj;
  uint64_t v56;
  char v57;
  char v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  id v75;
  char v76;
  char v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v2 = +[WRWorkflow telemetryEnabled]();
  v3 = +[WRWorkflow diagnosticsEnabled]();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __26__WRWorkflow_allWorkflows__block_invoke;
  v73[3] = &unk_251BE4B20;
  v6 = v5;
  v74 = v6;
  v57 = v3;
  v58 = v2;
  v76 = v2;
  v77 = v3;
  v7 = v4;
  v75 = v7;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x24BD14614](v73);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WRWorkflow overridePlistDirectory](WRWorkflow, "overridePlistDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, v11, 5, &__block_literal_global_2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v70 != v16)
          objc_enumerationMutation(v13);
        v8[2](v8, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
    }
    while (v15);
  }
  v54 = v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[WRWorkflow plistDirectory]();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v19, v20, 5, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = 0u;
  v66 = 0u;
  v67 = 0u;
  v65 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v66 != v25)
          objc_enumerationMutation(v22);
        v8[2](v8, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
    }
    while (v24);
  }

  v64 = 0;
  WROverrideNewWorkflows((uint64_t *)&v64);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v64;
  v29 = v28;
  v30 = v54;
  if (v27)
  {
    v52 = v27;
    v53 = v6;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v27;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    if (!v31)
      goto LABEL_37;
    v32 = v31;
    v56 = *(_QWORD *)v61;
    while (1)
    {
      for (k = 0; k != v32; ++k)
      {
        v34 = v29;
        if (*(_QWORD *)v61 != v56)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("name"), v52, v53);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = [WRWorkflow alloc];
        v59 = v29;
        v38 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](v37, v35, v58, v57, 1, (uint64_t *)&v59);
        v29 = v59;

        if (!v38)
        {
          objc_msgSend(v29, "domain");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v42, "isEqualToString:", CFSTR("WorkflowResponsivenessError")))
          {
            v43 = objc_msgSend(v29, "code");

            if (v43 == 3)
            {
              v44 = *__error();
              _wrlog();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v79 = v36;
                _os_log_impl(&dword_24A5B4000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: New workflow disabled", buf, 0xCu);
              }
LABEL_34:

              *__error() = v44;
              goto LABEL_35;
            }
          }
          else
          {

          }
          v44 = *__error();
          _wrlog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543618;
            v79 = v36;
            v80 = 2114;
            v81 = v29;
            _os_log_fault_impl(&dword_24A5B4000, v45, OS_LOG_TYPE_FAULT, "%{public}@: Unable to create new workflow: %{public}@", buf, 0x16u);
          }
          goto LABEL_34;
        }
        if (objc_msgSend(v30, "containsObject:", v38))
        {
          objc_msgSend(v38, "name");

          v39 = *__error();
          _wrlog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v38, "name");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v79 = v41;
            _os_log_impl(&dword_24A5B4000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: New workflow is duplicate of existing workflow (whose settings are already overridden)", buf, 0xCu);

          }
          *__error() = v39;
          v30 = v54;
        }
        else
        {
          objc_msgSend(v30, "addObject:", v38);
        }
LABEL_35:

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
      if (!v32)
      {
LABEL_37:

        v27 = v52;
        v6 = v53;
        goto LABEL_42;
      }
    }
  }
  if (v28)
  {
    v46 = *__error();
    _wrlog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      +[WRWorkflow allWorkflows].cold.2();

    *__error() = v46;
  }
LABEL_42:
  objc_msgSend(v30, "sortUsingSelector:", sel_compare_, v52, v53);
  if (!objc_msgSend(v30, "count"))
  {
    v48 = *__error();
    _wrlog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      +[WRWorkflow allWorkflows].cold.1();

    *__error() = v48;
  }
  if (objc_msgSend(v30, "count"))
    v50 = (void *)objc_msgSend(v30, "copy");
  else
    v50 = 0;

  return v50;
}

void __26__WRWorkflow_allWorkflows__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  WRWorkflow *v8;
  char v9;
  char v10;
  id *v11;
  id v12;
  void *v13;
  char v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
    {
      v31 = 0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v3, &v31);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v31;
      if (!v6)
      {
        v22 = WRIsDisabledWorkflow(v3);
        v23 = *__error();
        _wrlog();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v22)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v5;
            _os_log_impl(&dword_24A5B4000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
          }

          *__error() = v23;
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
        }
        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v33 = v5;
            v34 = 2114;
            v35 = v3;
            v36 = 2112;
            v37 = v7;
            _os_log_error_impl(&dword_24A5B4000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Unable to read in %{public}@: %@", buf, 0x20u);
          }

          *__error() = v23;
        }
        v12 = v7;
        goto LABEL_32;
      }
      v8 = [WRWorkflow alloc];
      v9 = *(_BYTE *)(a1 + 48);
      v10 = *(_BYTE *)(a1 + 49);
      v30 = v7;
      v11 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](v8, v6, v9, v10, 1, (uint64_t *)&v30);
      v12 = v30;

      if (v11)
      {
        objc_msgSend(v11, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v5);

        if ((v14 & 1) != 0)
        {
          v15 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11);
          objc_msgSend(v11, "name");

          v16 = *__error();
          _wrlog();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v15)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v33 = v19;
              v34 = 2114;
              v35 = v3;
              _os_log_impl(&dword_24A5B4000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring duplicate workflow from %{public}@", buf, 0x16u);

            }
            *__error() = v16;
          }
          else
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              __26__WRWorkflow_allWorkflows__block_invoke_cold_3();

            *__error() = v16;
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
          }
          goto LABEL_31;
        }
        objc_msgSend(v11, "name");

        v28 = *__error();
        _wrlog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          __26__WRWorkflow_allWorkflows__block_invoke_cold_4();
LABEL_30:

        *__error() = v28;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      objc_msgSend(v12, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqualToString:", CFSTR("WorkflowResponsivenessError")))
      {
        v27 = objc_msgSend(v12, "code");

        if (v27 == 3)
        {
          v28 = *__error();
          _wrlog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v5;
            _os_log_impl(&dword_24A5B4000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
          }
          goto LABEL_30;
        }
      }
      else
      {

      }
      v28 = *__error();
      _wrlog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __26__WRWorkflow_allWorkflows__block_invoke_cold_2();
      goto LABEL_30;
    }
  }
  else
  {
    v20 = *__error();
    _wrlog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      __26__WRWorkflow_allWorkflows__block_invoke_cold_1();

    *__error() = v20;
  }
LABEL_33:

}

- (id)initWithPlist:(char)a3 telemetryEnabled:(char)a4 diagnosticsEnabled:(int)a5 checkForOverrides:(uint64_t *)a6 error:
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  int v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t j;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  BOOL v93;
  int v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  int v100;
  NSObject *v101;
  void *v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t k;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t m;
  void *v114;
  char v115;
  int v116;
  NSObject *v117;
  void *v118;
  void *v119;
  _BOOL4 v120;
  int v121;
  NSObject *v122;
  id v123;
  int v124;
  NSObject *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  id v146;
  id v147;
  char v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t n;
  void *v159;
  void *v160;
  _BOOL4 v161;
  int v162;
  NSObject *v163;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  int v173;
  NSObject *v174;
  void *v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  id v179;
  id v180;
  id v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t ii;
  uint64_t v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t jj;
  void *v192;
  void *v193;
  int v194;
  id v195;
  void *v196;
  void *v197;
  id *v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  void *v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t kk;
  void *v215;
  void *v216;
  char v217;
  void *v218;
  uint64_t v219;
  uint64_t nn;
  void *v221;
  void *v222;
  id v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t i1;
  void *v227;
  void *v228;
  char v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  void *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  void *v260;
  void *v261;
  char v262;
  uint64_t v263;
  id v264;
  id v265;
  void *v266;
  id v267;
  void *v268;
  void *v269;
  void *v270;
  id *v271;
  uint64_t v272;
  id v273;
  uint64_t mm;
  void *v275;
  id obj;
  id obja;
  id v278;
  void (**v279)(_QWORD, _QWORD, _QWORD);
  void *v280;
  id v281;
  id v282;
  id v283;
  id v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  void *v291;
  void *v292;
  uint64_t *v293;
  id v294;
  id *v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  _QWORD v324[4];
  id v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  id v338;
  id v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  _QWORD v344[4];
  id v345;
  id v346;
  id v347;
  id *v348;
  id v349;
  id v350;
  uint64_t *v351;
  __int128 *p_buf;
  uint64_t *v353;
  uint64_t *v354;
  char v355;
  char v356;
  uint64_t v357;
  uint64_t *v358;
  uint64_t v359;
  char v360;
  uint64_t v361;
  uint64_t *v362;
  uint64_t v363;
  char v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  id v369;
  id v370;
  uint64_t v371;
  uint64_t *v372;
  uint64_t v373;
  char v374;
  id v375;
  objc_super v376;
  uint64_t v377;
  _BYTE v378[128];
  _BYTE v379[128];
  _BYTE v380[128];
  _BYTE v381[128];
  _BYTE v382[128];
  _BYTE v383[128];
  _BYTE v384[128];
  _BYTE v385[128];
  _BYTE v386[128];
  uint8_t v387[128];
  uint8_t v388[4];
  id v389;
  __int16 v390;
  void *v391;
  __int16 v392;
  void *v393;
  _BYTE v394[128];
  uint8_t v395[128];
  __int128 buf;
  uint64_t v397;
  char v398;
  uint64_t v399;

  v399 = *MEMORY[0x24BDAC8D0];
  v294 = a2;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_180;
  }
  v377 = 0;
  if (a6)
  {
    v293 = a6;
    *a6 = 0;
  }
  else
  {
    v293 = &v377;
  }
  v376.receiver = a1;
  v376.super_class = (Class)WRWorkflow;
  v295 = (id *)objc_msgSendSuper2(&v376, sel_init);

  if (!v295)
  {
    WRMakeError(2, CFSTR("Unable to init"), v11, v12, v13, v14, v15, v16, v258);
    v18 = 0;
    *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_179;
  }
  WRCheckForBadWorkflowDict(v294);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  *v293 = (uint64_t)v17;
  if (!v17)
  {
    objc_msgSend(v294, "objectForKeyedSubscript:", CFSTR("name"));
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v290)
    {
      WRMakeError(7, CFSTR("No workflow name in workflow plist"), v19, v20, v21, v22, v23, v24, v258);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (+[WRWorkflowEventTracker isReservedWorkflowName:]((uint64_t)WRWorkflowEventTracker, v290))
    {
      WRMakeError(8, CFSTR("Workflow name is reserved: %@"), v25, v26, v27, v28, v29, v30, (uint64_t)v290);
      v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v18 = 0;
      *v293 = (uint64_t)v31;
LABEL_178:

      goto LABEL_179;
    }
    v32 = v290;
    if (a5)
    {
      v375 = 0;
      WROverrideTelemetryEnablementForWorkflow(v290, &v375);
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v375;
      if (v275)
      {
        v291 = v33;
        v34 = objc_msgSend(v275, "BOOLValue");
        v35 = *__error();
        _wrlog();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
        if (!v34)
        {
          if (v37)
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v290;
            _os_log_impl(&dword_24A5B4000, v36, OS_LOG_TYPE_INFO, "%{public}@: overridden telemetry (disabled)", (uint8_t *)&buf, 0xCu);
          }

          *__error() = v35;
          WRMakeError(3, CFSTR("Workflow disabled by override"), v55, v56, v57, v58, v59, v60, v258);
          *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

          v18 = 0;
          goto LABEL_177;
        }
        if (v37)
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v290;
          _os_log_impl(&dword_24A5B4000, v36, OS_LOG_TYPE_INFO, "%{public}@: overridden telemetry (enabled)", (uint8_t *)&buf, 0xCu);
        }

        *__error() = v35;
        v32 = v290;
        goto LABEL_28;
      }
      if (v33)
      {
        v38 = *__error();
        _wrlog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.7();

        *__error() = v38;
      }
      v32 = v290;
    }
    else
    {
      v33 = 0;
    }
    v291 = v33;
    if ((a3 & 1) == 0)
    {
      WRMakeError(3, CFSTR("Workflow disabled"), v25, v26, v27, v28, v29, v30, v258);
      v18 = 0;
      *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_177:

      goto LABEL_178;
    }
    v275 = 0;
LABEL_28:
    v40 = objc_msgSend(v32, "copy");
    v41 = v295[2];
    v295[2] = (id)v40;

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v397 = 0x2020000000;
    v398 = 0;
    v371 = 0;
    v372 = &v371;
    v373 = 0x2020000000;
    v374 = 0;
    v42 = objc_alloc_init(MEMORY[0x24BE906A0]);
    v43 = v295[7];
    v295[7] = v42;

    v44 = objc_alloc_init(MEMORY[0x24BE906A0]);
    v45 = v295[8];
    v295[8] = v44;

    if (a5)
    {

      v370 = 0;
      WROverrideForWorkflow(v290, &v370);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v370;
      v291 = v47;
      if (!v46 && v47)
      {
        v48 = *__error();
        _wrlog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.6();

        v46 = 0;
        *__error() = v48;
      }
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("maximum_duration"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (!v50)
    {
      objc_msgSend(v294, "objectForKeyedSubscript:", CFSTR("maximum_duration"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v51, "doubleValue");
    v270 = v46;
    v295[9] = v52;
    if (!v50)

    if (a5)
    {

      v369 = 0;
      WROverrideDiagnosticsEnablementForWorkflow(v290, &v369);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v369;
      v291 = v54;
      if (v53)
      {
        a4 = objc_msgSend(v53, "BOOLValue");
      }
      else if (v54)
      {
        v61 = *__error();
        _wrlog();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
          -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.5();

        *__error() = v61;
      }

    }
    v63 = objc_opt_class();
    DictGetArrayOfClass(v294, CFSTR("diagnostics"), v63, v293);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = v64;
    if (v64 || !*v293)
    {
      +[WRDiagnostic diagnosticsForWorkflowName:signpostName:diagnosticDicts:diagnosticsEnabled:checkForOverrides:error:]((uint64_t)WRDiagnostic, v290, 0, v64, a4, a5, v293);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = v295[6];
      v295[6] = (id)v65;

      if (v295[6])
      {
        *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = 1;
        v365 = 0u;
        v366 = 0u;
        v368 = 0u;
        v367 = 0u;
        v67 = v295[6];
        v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v365, v395, 16);
        if (v68)
        {
          v69 = *(_QWORD *)v366;
          while (2)
          {
            for (i = 0; i != v68; ++i)
            {
              if (*(_QWORD *)v366 != v69)
                objc_enumerationMutation(v67);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v365 + 1) + 8 * i), "reportOmittingNetworkBoundIntervals") & 1) != 0)
              {
                v262 = 1;
                goto LABEL_65;
              }
            }
            v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v365, v395, 16);
            if (v68)
              continue;
            break;
          }
        }
        v262 = 0;
LABEL_65:

        v71 = v293;
LABEL_66:
        v72 = objc_opt_class();
        DictGetArrayOfClass(v294, CFSTR("signposts"), v72, v71);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v268 = v79;
        if (!v79)
        {
          if (!*v71)
          {
            v18 = 0;
LABEL_175:

            goto LABEL_176;
          }
          WRMakeError(7, CFSTR("No signposts in plist"), v73, v74, v75, v76, v77, v78, v258);
          v18 = 0;
          *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_174:
          v79 = v268;
          goto LABEL_175;
        }
        v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v79, "count"));
        v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
        v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
        v361 = 0;
        v362 = &v361;
        v363 = 0x2020000000;
        v364 = 0;
        v357 = 0;
        v358 = &v357;
        v359 = 0x2020000000;
        v360 = 0;
        v83 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v344[0] = MEMORY[0x24BDAC760];
        v344[1] = 3221225472;
        v344[2] = __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke;
        v344[3] = &unk_251BE4B90;
        v351 = &v361;
        v355 = a4;
        v356 = a5;
        v273 = v290;
        v345 = v273;
        p_buf = &buf;
        v264 = v83;
        v346 = v264;
        v353 = &v357;
        v278 = v80;
        v347 = v278;
        v271 = v295;
        v348 = v271;
        v354 = &v371;
        v267 = v81;
        v349 = v267;
        v265 = v82;
        v350 = v265;
        v279 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x24BD14614](v344);
        v342 = 0u;
        v343 = 0u;
        v340 = 0u;
        v341 = 0u;
        v84 = v79;
        v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v340, v394, 16);
        if (!v85)
          goto LABEL_91;
        v285 = *(_QWORD *)v341;
        do
        {
          for (j = 0; j != v85; ++j)
          {
            if (*(_QWORD *)v341 != v285)
              objc_enumerationMutation(v84);
            v87 = *(void **)(*((_QWORD *)&v340 + 1) + 8 * j);
            WRCheckForBadSignpostDict(v87);
            v88 = (id)objc_claimAutoreleasedReturnValue();
            *v293 = (uint64_t)v88;
            if (v88)
              goto LABEL_134;
            objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("name"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (a5)
            {
              v339 = 0;
              WROverrideForSignpost(v273, v89, &v339);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = v339;
              v92 = v91;
              if (v90)
                v93 = 1;
              else
                v93 = v91 == 0;
              if (!v93)
              {
                v94 = *__error();
                _wrlog();
                v95 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v388 = 138543874;
                  v389 = v273;
                  v390 = 2114;
                  v391 = v89;
                  v392 = 2112;
                  v393 = v92;
                  _os_log_fault_impl(&dword_24A5B4000, v95, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: Invalid signpost override: %@", v388, 0x20u);
                }

                *__error() = v94;
              }

            }
            else
            {
              v90 = 0;
            }
            ((void (**)(_QWORD, void *, void *))v279)[2](v279, v90, v87);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = v96;
            if (v96)
            {
              objc_msgSend(v96, "domain");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v98, "isEqualToString:", CFSTR("WorkflowResponsivenessError")))
              {

LABEL_133:
                v123 = objc_retainAutorelease(v97);
                *v293 = (uint64_t)v123;

LABEL_134:
LABEL_135:
                v18 = 0;
                goto LABEL_173;
              }
              v99 = objc_msgSend(v97, "code") == 3;

              if (!v99)
                goto LABEL_133;
              v100 = *__error();
              _wrlog();
              v101 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v388 = 138543618;
                v389 = v273;
                v390 = 2114;
                v391 = v89;
                _os_log_impl(&dword_24A5B4000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: signpost disabled", v388, 0x16u);
              }

              *__error() = v100;
            }

          }
          v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v340, v394, 16);
        }
        while (v85);
LABEL_91:

        if (a5)
        {

          v338 = 0;
          WROverrideNewSignpostsForWorkflow(v273, (uint64_t *)&v338);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v338;
          v104 = v103;
          if (v102)
          {
            v336 = 0u;
            v337 = 0u;
            v334 = 0u;
            v335 = 0u;
            obj = v102;
            v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v334, v387, 16);
            v261 = v102;
            if (!v105)
              goto LABEL_125;
            v281 = *(id *)v335;
            while (1)
            {
              v286 = v105;
              for (k = 0; k != v286; ++k)
              {
                if (*(id *)v335 != v281)
                  objc_enumerationMutation(obj);
                v107 = *(void **)(*((_QWORD *)&v334 + 1) + 8 * k);
                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("name"));
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v292 = v104;
                if (v108)
                {
                  v332 = 0u;
                  v333 = 0u;
                  v330 = 0u;
                  v331 = 0u;
                  v109 = v278;
                  v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v330, v386, 16);
                  if (!v110)
                  {

LABEL_112:
                    ((void (**)(_QWORD, void *, _QWORD))v279)[2](v279, v107, 0);
                    v118 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v118)
                    {
                      v292 = 0;
                      goto LABEL_123;
                    }
                    objc_msgSend(v118, "domain");
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v119, "isEqualToString:", CFSTR("WorkflowResponsivenessError")))
                    {
                      v120 = objc_msgSend(v118, "code") == 3;

                      if (v120)
                      {
                        v121 = *__error();
                        _wrlog();
                        v122 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v388 = 138543618;
                          v389 = v273;
                          v390 = 2114;
                          v391 = v108;
                          _os_log_impl(&dword_24A5B4000, v122, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: new signpost disabled", v388, 0x16u);
                        }
LABEL_122:

                        *__error() = v121;
                        v292 = v118;
                        goto LABEL_123;
                      }
                    }
                    else
                    {

                    }
                    v121 = *__error();
                    _wrlog();
                    v122 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v388 = 138543618;
                      v389 = v273;
                      v390 = 2112;
                      v391 = v118;
                      _os_log_fault_impl(&dword_24A5B4000, v122, OS_LOG_TYPE_FAULT, "%{public}@: Invalid signpost override: %@", v388, 0x16u);
                    }
                    goto LABEL_122;
                  }
                  v111 = 0;
                  v112 = *(_QWORD *)v331;
                  do
                  {
                    for (m = 0; m != v110; ++m)
                    {
                      if (*(_QWORD *)v331 != v112)
                        objc_enumerationMutation(v109);
                      objc_msgSend(*(id *)(*((_QWORD *)&v330 + 1) + 8 * m), "name");
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      v115 = objc_msgSend(v114, "isEqualToString:", v108);

                      v111 |= v115;
                    }
                    v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v330, v386, 16);
                  }
                  while (v110);

                  if ((v111 & 1) == 0)
                    goto LABEL_112;
                }
                else
                {
                  v116 = *__error();
                  _wrlog();
                  v117 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v388 = 138543618;
                    v389 = v273;
                    v390 = 2112;
                    v391 = v107;
                    _os_log_fault_impl(&dword_24A5B4000, v117, OS_LOG_TYPE_FAULT, "%{public}@: Invalid new signpost with no name: %@", v388, 0x16u);
                  }

                  *__error() = v116;
                }
LABEL_123:

                v104 = v292;
              }
              v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v334, v387, 16);
              if (!v105)
              {
LABEL_125:
                v291 = v104;

                v102 = v261;
                goto LABEL_141;
              }
            }
          }
          if (v103)
          {
            v291 = v103;
            v124 = *__error();
            _wrlog();
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_FAULT))
              -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.4();

            *__error() = v124;
          }
          else
          {
            v291 = 0;
          }
LABEL_141:

        }
        if (!objc_msgSend(v278, "count"))
        {
          WRMakeError(7, CFSTR("No signposts in plist"), v126, v127, v128, v129, v130, v131, v258);
          v147 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_172;
        }
        if (!objc_msgSend(v267, "count"))
        {
          WRMakeError(7, CFSTR("No start signpost in plist"), v132, v133, v134, v135, v136, v137, v258);
          v147 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_172;
        }
        if (!objc_msgSend(v265, "count"))
        {
          WRMakeError(7, CFSTR("No end signpost in plist"), v138, v139, v140, v141, v142, v143, v258);
          v147 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_172;
        }
        _WRGetString(v270, v294, CFSTR("contextual_telemetry"));
        v144 = objc_claimAutoreleasedReturnValue();
        v145 = v271[10];
        v271[10] = (id)v144;

        v146 = v271[10];
        if (v146)
        {
          if (objc_msgSend(v146, "isEqualToString:", CFSTR("YES")))
          {
            *((_BYTE *)v271 + 9) = 1;
            goto LABEL_156;
          }
          if (objc_msgSend(v271[10], "isEqualToString:", CFSTR("NO")))
          {
LABEL_155:
            *((_BYTE *)v271 + 9) = 0;
LABEL_156:
            if (!*((_BYTE *)v358 + 24))
            {
              if ((unint64_t)objc_msgSend(v278, "count") < 2)
              {
                if ((objc_msgSend(v271, "hasMaximumEventDuration") & 1) != 0)
                {
                  objc_msgSend(v278, "firstObject");
                  v172 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v172, "name");

                  v173 = *__error();
                  _wrlog();
                  v174 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v172, "name");
                    v175 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.2((uint64_t)v273, v175, (uint64_t)v388, v174);
                  }

                  *__error() = v173;
                  -[WRSignpostTracker setIsMiddleOfInterval:]((uint64_t)v172, 1);
                  *((_BYTE *)v271 + 8) = 1;

                  goto LABEL_192;
                }
                v162 = *__error();
                _wrlog();
                v163 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
                  -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.3();
              }
              else
              {
                v162 = *__error();
                _wrlog();
                v163 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
                  -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.1();
              }

              *__error() = v162;
              goto LABEL_192;
            }
            if ((objc_msgSend(v271, "hasMaximumEventDuration") & 1) != 0)
            {
              v328 = 0u;
              v329 = 0u;
              v326 = 0u;
              v327 = 0u;
              v155 = v267;
              v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v326, v385, 16);
              if (v156)
              {
                v157 = *(_QWORD *)v327;
                while (2)
                {
                  for (n = 0; n != v156; ++n)
                  {
                    if (*(_QWORD *)v327 != v157)
                      objc_enumerationMutation(v155);
                    v159 = *(void **)(*((_QWORD *)&v326 + 1) + 8 * n);
                    objc_msgSend(v159, "eventIdentifierFieldName");
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    v161 = v160 == 0;

                    if (v161)
                    {
                      objc_msgSend(v159, "name");
                      v165 = (void *)objc_claimAutoreleasedReturnValue();
                      WRMakeError(7, CFSTR("Workflow supports concurrent events, but start signpost %@ has no event identifier field name"), v166, v167, v168, v169, v170, v171, (uint64_t)v165);
                      *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

                      goto LABEL_135;
                    }
                  }
                  v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v326, v385, 16);
                  if (v156)
                    continue;
                  break;
                }
              }

              *((_BYTE *)v271 + 8) = 1;
LABEL_192:
              objc_msgSend(v278, "sortUsingSelector:", sel_compare_);
              v176 = objc_msgSend(v278, "copy");
              v177 = v271[5];
              v271[5] = (id)v176;

              objc_msgSend(v267, "sortUsingSelector:", sel_compare_);
              v178 = objc_msgSend(v267, "copy");
              v179 = v271[3];
              v271[3] = (id)v178;

              v180 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v324[0] = MEMORY[0x24BDAC760];
              v324[1] = 3221225472;
              v324[2] = __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke_73;
              v324[3] = &unk_251BE4BB8;
              v181 = v180;
              v325 = v181;
              objc_msgSend(v265, "enumerateKeysAndObjectsUsingBlock:", v324);
              objc_msgSend(v181, "sortUsingComparator:", &__block_literal_global_76);
              v182 = objc_msgSend(v181, "copy");
              v280 = v181;
              v183 = v271[4];
              v271[4] = (id)v182;

              v322 = 0u;
              v323 = 0u;
              v320 = 0u;
              v321 = 0u;
              v282 = v264;
              v184 = objc_msgSend(v282, "countByEnumeratingWithState:objects:count:", &v320, v384, 16);
              if (v184)
              {
                v287 = *(_QWORD *)v321;
                do
                {
                  v185 = v184;
                  for (ii = 0; ii != v185; ++ii)
                  {
                    if (*(_QWORD *)v321 != v287)
                      objc_enumerationMutation(v282);
                    v187 = *(_QWORD *)(*((_QWORD *)&v320 + 1) + 8 * ii);
                    v318 = 0u;
                    v319 = 0u;
                    v316 = 0u;
                    v317 = 0u;
                    v188 = v271[5];
                    v189 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v316, v383, 16);
                    if (v189)
                    {
                      v190 = *(_QWORD *)v317;
                      do
                      {
                        for (jj = 0; jj != v189; ++jj)
                        {
                          if (*(_QWORD *)v317 != v190)
                            objc_enumerationMutation(v188);
                          v192 = *(void **)(*((_QWORD *)&v316 + 1) + 8 * jj);
                          objc_msgSend(v192, "individuationFieldName");
                          v193 = (void *)objc_claimAutoreleasedReturnValue();
                          v194 = objc_msgSend(v193, "isEqualToString:", v187);

                          if (v194)
                          {
                            v195 = v295[8];
                            objc_msgSend(v192, "subsystem");
                            v196 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v192, "category");
                            v197 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v195, "addSubsystem:category:", v196, v197);

                          }
                        }
                        v189 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v316, v383, 16);
                      }
                      while (v189);
                    }

                  }
                  v184 = objc_msgSend(v282, "countByEnumeratingWithState:objects:count:", &v320, v384, 16);
                }
                while (v184);
              }

              v198 = v295;
              if ((v262 & 1) != 0)
              {
LABEL_209:
                v199 = v295[7];
                goto LABEL_216;
              }
              if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
              {
                if (!*((_BYTE *)v372 + 24))
                  goto LABEL_209;
              }
              else
              {
                v199 = 0;
LABEL_216:
                v206 = v295[8];
                v295[8] = v199;

                v198 = v295;
              }
              v314 = 0u;
              v315 = 0u;
              v312 = 0u;
              v313 = 0u;
              v283 = v198[6];
              v207 = objc_msgSend(v283, "countByEnumeratingWithState:objects:count:", &v312, v382, 16);
              if (v207)
              {
                v288 = *(_QWORD *)v313;
LABEL_219:
                v208 = 0;
                while (1)
                {
                  if (*(_QWORD *)v313 != v288)
                    objc_enumerationMutation(v283);
                  v209 = *(void **)(*((_QWORD *)&v312 + 1) + 8 * v208);
                  if (objc_msgSend(v209, "triggerEventTimeout")
                    && (objc_msgSend(v271, "hasMaximumEventDuration") & 1) == 0)
                  {
                    objc_msgSend(v209, "name");
                    v230 = (void *)objc_claimAutoreleasedReturnValue();
                    WRMakeError(8, CFSTR("Workflow diagnostic %@ has event timeout threshold, but workflow has no maximum duration"), v245, v246, v247, v248, v249, v250, (uint64_t)v230);
                    v251 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_271;
                  }
                  if (objc_msgSend(v209, "reportOmittingNetworkBoundIntervals") && !*((_BYTE *)v362 + 24))
                    break;
                  objc_msgSend(v209, "reportOtherSignpostWithName");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v210)
                  {
                    v310 = 0u;
                    v311 = 0u;
                    v308 = 0u;
                    v309 = 0u;
                    v211 = v271[5];
                    v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v308, v381, 16);
                    if (v212)
                    {
                      v213 = *(_QWORD *)v309;
                      while (2)
                      {
                        for (kk = 0; kk != v212; ++kk)
                        {
                          if (*(_QWORD *)v309 != v213)
                            objc_enumerationMutation(v211);
                          objc_msgSend(*(id *)(*((_QWORD *)&v308 + 1) + 8 * kk), "name");
                          v215 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v209, "reportOtherSignpostWithName");
                          v216 = (void *)objc_claimAutoreleasedReturnValue();
                          v217 = objc_msgSend(v215, "isEqualToString:", v216);

                          if ((v217 & 1) != 0)
                          {

                            goto LABEL_237;
                          }
                        }
                        v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v308, v381, 16);
                        if (v212)
                          continue;
                        break;
                      }
                    }

                    objc_msgSend(v209, "name");
                    v230 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v209, "reportOtherSignpostWithName");
                    v259 = (void *)objc_claimAutoreleasedReturnValue();
                    WRMakeError(8, CFSTR("Workflow diagnostic %@ reports signpost %@, but no such signpost exists"), v231, v232, v233, v234, v235, v236, (uint64_t)v230);
                    *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_272;
                  }
LABEL_237:
                  if (++v208 == v207)
                  {
                    v207 = objc_msgSend(v283, "countByEnumeratingWithState:objects:count:", &v312, v382, 16);
                    if (v207)
                      goto LABEL_219;
                    goto LABEL_239;
                  }
                }
                objc_msgSend(v209, "name");
                v230 = (void *)objc_claimAutoreleasedReturnValue();
                WRMakeError(8, CFSTR("Workflow diagnostic %@ omits network-bound work, but no network-bound signposts"), v252, v253, v254, v255, v256, v257, (uint64_t)v230);
                v251 = (id)objc_claimAutoreleasedReturnValue();
LABEL_271:
                *v293 = (uint64_t)v251;
LABEL_272:

LABEL_273:
                v18 = 0;
                goto LABEL_274;
              }
LABEL_239:

              v306 = 0u;
              v307 = 0u;
              v304 = 0u;
              v305 = 0u;
              obja = v271[5];
              v263 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v304, v380, 16);
              if (v263)
              {
                v272 = *(_QWORD *)v305;
                do
                {
                  for (mm = 0; mm != v263; ++mm)
                  {
                    if (*(_QWORD *)v305 != v272)
                      objc_enumerationMutation(obja);
                    v218 = *(void **)(*((_QWORD *)&v304 + 1) + 8 * mm);
                    v300 = 0u;
                    v301 = 0u;
                    v302 = 0u;
                    v303 = 0u;
                    v266 = v218;
                    objc_msgSend(v218, "diagnostics");
                    v284 = (id)objc_claimAutoreleasedReturnValue();
                    v219 = objc_msgSend(v284, "countByEnumeratingWithState:objects:count:", &v300, v379, 16);
                    if (v219)
                    {
                      v289 = *(_QWORD *)v301;
                      while (2)
                      {
                        for (nn = 0; nn != v219; ++nn)
                        {
                          if (*(_QWORD *)v301 != v289)
                            objc_enumerationMutation(v284);
                          v221 = *(void **)(*((_QWORD *)&v300 + 1) + 8 * nn);
                          objc_msgSend(v221, "reportOtherSignpostWithName");
                          v222 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v222)
                          {
                            v298 = 0u;
                            v299 = 0u;
                            v296 = 0u;
                            v297 = 0u;
                            v223 = v271[5];
                            v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v296, v378, 16);
                            if (v224)
                            {
                              v225 = *(_QWORD *)v297;
                              while (2)
                              {
                                for (i1 = 0; i1 != v224; ++i1)
                                {
                                  if (*(_QWORD *)v297 != v225)
                                    objc_enumerationMutation(v223);
                                  objc_msgSend(*(id *)(*((_QWORD *)&v296 + 1) + 8 * i1), "name");
                                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v221, "reportOtherSignpostWithName");
                                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                                  v229 = objc_msgSend(v227, "isEqualToString:", v228);

                                  if ((v229 & 1) != 0)
                                  {

                                    goto LABEL_260;
                                  }
                                }
                                v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v296, v378, 16);
                                if (v224)
                                  continue;
                                break;
                              }
                            }

                            objc_msgSend(v266, "name");
                            v237 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v221, "name");
                            v238 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v221, "reportOtherSignpostWithName");
                            v260 = (void *)objc_claimAutoreleasedReturnValue();
                            WRMakeError(8, CFSTR("Signpost %@ diagnostic %@ reports other signpost %@, but no such signpost exists"), v239, v240, v241, v242, v243, v244, (uint64_t)v237);
                            *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

                            goto LABEL_273;
                          }
LABEL_260:
                          ;
                        }
                        v219 = objc_msgSend(v284, "countByEnumeratingWithState:objects:count:", &v300, v379, 16);
                        if (v219)
                          continue;
                        break;
                      }
                    }

                  }
                  v263 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v304, v380, 16);
                }
                while (v263);
              }

              v18 = v271;
LABEL_274:

LABEL_173:
              _Block_object_dispose(&v357, 8);
              _Block_object_dispose(&v361, 8);

              goto LABEL_174;
            }
            WRMakeError(7, CFSTR("Workflow supports concurrent events, but has no maximum_duration (required by concurrent events)"), v149, v150, v151, v152, v153, v154, v258);
            v147 = (id)objc_claimAutoreleasedReturnValue();
LABEL_172:
            v18 = 0;
            *v293 = (uint64_t)v147;
            goto LABEL_173;
          }
          if (objc_msgSend(v271[10], "isEqualToString:", CFSTR("seed")))
          {
            if ((WRIsSeedBuild() & 1) != 0)
            {
              v148 = 1;
              goto LABEL_153;
            }
          }
          else if (!objc_msgSend(v271[10], "isEqualToString:", CFSTR("internal")))
          {
            WRMakeError(8, CFSTR("Workflow contextual telemetry value is invalid: %@"), v200, v201, v202, v203, v204, v205, (uint64_t)v271[10]);
            v147 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_172;
          }
        }
        else if (objc_msgSend(v278, "count") == 1)
        {
          goto LABEL_155;
        }
        v148 = WRIsAppleInternal();
LABEL_153:
        *((_BYTE *)v271 + 9) = v148;
        goto LABEL_156;
      }
      v71 = v293;
      if (!*v293)
      {
        v262 = 0;
        goto LABEL_66;
      }
    }
    v18 = 0;
LABEL_176:

    _Block_object_dispose(&v371, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_177;
  }
  v18 = 0;
LABEL_179:

LABEL_180:
  return v18;
}

uint64_t __26__WRWorkflow_allWorkflows__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;

  v4 = a2;
  v5 = a3;
  v6 = *__error();
  _wrlog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __26__WRWorkflow_allWorkflows__block_invoke_12_cold_1();

  *__error() = v6;
  return 1;
}

+ (WRWorkflow)workflowWithName:(id)a3
{
  id v3;
  char v4;
  char v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  id v32;
  id v33;
  int v34;
  NSObject *v35;
  void *v36;
  _BOOL4 v37;
  int v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  char v42;
  char v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint8_t buf[4];
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = +[WRWorkflow telemetryEnabled]();
  v5 = +[WRWorkflow diagnosticsEnabled]();
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __31__WRWorkflow_workflowWithName___block_invoke;
  v59[3] = &unk_251BE4B68;
  v44 = v3;
  v60 = v44;
  v61 = &v64;
  v42 = v5;
  v43 = v4;
  v62 = v4;
  v63 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x24BD14614](v59);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WRWorkflow overridePlistDirectory](WRWorkflow, "overridePlistDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v9, 5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(v11);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 || *((_BYTE *)v65 + 24))
        {
          v20 = v11;
          goto LABEL_31;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WRWorkflow plistDirectory]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v17, v18, 5, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(v20);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 || *((_BYTE *)v65 + 24))
        {

          goto LABEL_31;
        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
    }
    while (v21);
  }

  v50 = 0;
  WROverrideNewWorkflows((uint64_t *)&v50);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v50;
  v20 = v24;
  if (v11)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v11 = v11;
    v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
    if (!v25)
      goto LABEL_28;
    v26 = *(_QWORD *)v47;
LABEL_22:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v26)
        objc_enumerationMutation(v11);
      v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v27);
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("name"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", v44);

      if (v30)
        break;
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v70, 16);
        if (v25)
          goto LABEL_22;
LABEL_28:

        v15 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    v45 = v20;
    v15 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:]([WRWorkflow alloc], v28, v43, v42, 1, (uint64_t *)&v45);
    v32 = v45;

    if (v15)
    {
      v33 = v15;
LABEL_49:

      v20 = v32;
      goto LABEL_31;
    }
    objc_msgSend(v32, "domain");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "isEqualToString:", CFSTR("WorkflowResponsivenessError")))
    {
      v37 = objc_msgSend(v32, "code") == 3;

      if (v37)
      {
        v38 = *__error();
        _wrlog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v69 = v44;
          _os_log_impl(&dword_24A5B4000, v39, OS_LOG_TYPE_INFO, "%{public}@: New workflow disabled", buf, 0xCu);
        }

        *__error() = v38;
        goto LABEL_49;
      }
    }
    else
    {

    }
    v40 = *__error();
    _wrlog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      +[WRWorkflow workflowWithName:].cold.2();

    *__error() = v40;
    goto LABEL_49;
  }
  if (v24)
  {
    v34 = *__error();
    _wrlog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      +[WRWorkflow allWorkflows].cold.2();

    v15 = 0;
    *__error() = v34;
    goto LABEL_31;
  }
  v15 = 0;
LABEL_32:

  _Block_object_dispose(&v64, 8);
  return (WRWorkflow *)v15;
}

id *__31__WRWorkflow_workflowWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  WRWorkflow *v8;
  char v9;
  char v10;
  id *v11;
  id v12;
  void *v13;
  char v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v31 = 0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v3, &v31);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v31;
      if (!v6)
      {
        v21 = WRIsDisabledWorkflow(v3);
        v22 = *__error();
        _wrlog();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v21)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v25 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v33 = v25;
            _os_log_impl(&dword_24A5B4000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
          }

          v18 = 0;
          *__error() = v22;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            v29 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v33 = v29;
            v34 = 2114;
            v35 = v3;
            v36 = 2114;
            v37 = v7;
            _os_log_fault_impl(&dword_24A5B4000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Unable to read in %{public}@: %{public}@", buf, 0x20u);
          }

          v18 = 0;
          *__error() = v22;
        }
        v12 = v7;
        goto LABEL_32;
      }
      v8 = [WRWorkflow alloc];
      v9 = *(_BYTE *)(a1 + 48);
      v10 = *(_BYTE *)(a1 + 49);
      v30 = v7;
      v11 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](v8, v6, v9, v10, 1, (uint64_t *)&v30);
      v12 = v30;

      if (v11)
      {
        objc_msgSend(v11, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v5);

        objc_msgSend(v11, "name");
        v15 = *__error();
        _wrlog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((v14 & 1) != 0)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            __31__WRWorkflow_workflowWithName___block_invoke_cold_3();

          *__error() = v15;
          v18 = v11;
          goto LABEL_31;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          __26__WRWorkflow_allWorkflows__block_invoke_cold_4();
LABEL_30:

        v18 = 0;
        *__error() = v15;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      objc_msgSend(v12, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqualToString:", CFSTR("WorkflowResponsivenessError")))
      {
        v27 = objc_msgSend(v12, "code");

        if (v27 == 3)
        {
          v15 = *__error();
          _wrlog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v5;
            _os_log_impl(&dword_24A5B4000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
          }
          goto LABEL_30;
        }
      }
      else
      {

      }
      v15 = *__error();
      _wrlog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __26__WRWorkflow_allWorkflows__block_invoke_cold_2();
      goto LABEL_30;
    }
    v18 = 0;
  }
  else
  {
    v19 = *__error();
    _wrlog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __26__WRWorkflow_allWorkflows__block_invoke_cold_1();

    v18 = 0;
    *__error() = v19;
  }
LABEL_33:

  return v18;
}

+ (WRWorkflow)workflowWithPlist:(id)a3 checkForOverrides:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithContentsOfURL:error:", v12, a5);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_8;
  }
  v14 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](objc_alloc((Class)a1), v13, 1, 1, v6, (uint64_t *)a5);
  v15 = v14;
  if (!v14)
  {
LABEL_8:
    a5 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v14, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v10);

  if ((v17 & 1) == 0)
  {
    if (!a5)
      goto LABEL_9;
    objc_msgSend(v15, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    WRMakeError(8, CFSTR("Filename \"%@\" doesn't match workflow name \"%@\"), v18, v19, v20, v21, v22, v23, (uint64_t)v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v15 = v15;
  a5 = v15;
LABEL_9:

  return (WRWorkflow *)a5;
}

id __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  char v56;
  void *v57;
  char v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  char v65;
  int v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  void *v87;
  int v88;
  WRSignpost *v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __CFString *v97;
  void *v98;
  void *v99;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  WRSignpost *v106;
  void *v107;
  id v108;
  void *v109;
  __CFString *v110;
  void *v111;
  int v112;
  int v113;
  id obj;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  id v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", 0x251BE5AE8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", 0x251BE5AE8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if ((v18 & 1) != 0)
      goto LABEL_3;
LABEL_5:
    _WRGetString(v5, v6, CFSTR("name"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      WRMakeError(7, CFSTR("No name for signpost"), v19, v20, v21, v22, v23, v24, v101);
      goto LABEL_9;
    }
    if (+[WRWorkflowEventTracker isReservedSignpostName:]((uint64_t)WRWorkflowEventTracker, v25))
    {
      WRMakeError(8, CFSTR("Signpost name is reserved: %@"), v26, v27, v28, v29, v30, v31, (uint64_t)v25);
LABEL_9:
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_80:

      goto LABEL_81;
    }
    _WRGetString(v5, v6, CFSTR("subsystem"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      WRMakeError(7, CFSTR("No subsystem for signpost %@"), v32, v33, v34, v35, v36, v37, (uint64_t)v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_79:

      goto LABEL_80;
    }
    _WRGetString(v5, v6, CFSTR("category"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      WRMakeError(7, CFSTR("No category for signpost %@"), v39, v40, v41, v42, v43, v44, (uint64_t)v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_78:

      goto LABEL_79;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("start"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      v113 = objc_msgSend(v46, "BOOLValue");
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("start"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend(v48, "BOOLValue");

    }
    _WRGetString(v5, v6, CFSTR("end_group"));
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v112 = 1;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("end"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (v50)
      {
        v112 = objc_msgSend(v50, "BOOLValue");
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("end"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v52, "BOOLValue");

      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("network_bound"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = v53;
      v55 = objc_msgSend(v53, "BOOLValue");

      if (v55)
      {
LABEL_25:
        v56 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
LABEL_28:
        v59 = objc_opt_class();
        v120 = 0;
        DictGetArrayOfClass(v6, CFSTR("diagnostics"), v59, &v120);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v120;
        v62 = v61;
        if (!v60 && v61)
        {
          v63 = v61;
          v16 = v63;
LABEL_77:

          goto LABEL_78;
        }
        v110 = v49;
        v111 = v45;
        v64 = *(void **)(a1 + 32);
        v65 = *(_BYTE *)(a1 + 112);
        v66 = *(unsigned __int8 *)(a1 + 113);
        v119 = v61;
        +[WRDiagnostic diagnosticsForWorkflowName:signpostName:diagnosticDicts:diagnosticsEnabled:checkForOverrides:error:]((uint64_t)WRDiagnostic, v64, v25, v60, v65, v66, (uint64_t *)&v119);
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = v119;

        v108 = v68;
        v109 = (void *)v67;
        if (v67)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        }
        else if (v68)
        {
          v63 = v68;
          v16 = v63;
          v49 = v110;
          v45 = v111;
          goto LABEL_77;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("environment_field_names"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v69;
        if (!v69)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("environment_field_names"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v70, "sortedArrayUsingSelector:", sel_compare_);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v69)

        _WRGetString(v5, v6, CFSTR("individuation_field_name"));
        v71 = objc_claimAutoreleasedReturnValue();
        v78 = (void *)v71;
        v49 = v110;
        if (!v71 || ((v113 ^ 1) & 1) != 0)
        {
          if (v71 && ((v112 ^ 1) & 1) == 0)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v71);
          v102 = v60;
          _WRGetString(v5, v6, CFSTR("event_identifier_field_name"));
          v80 = objc_claimAutoreleasedReturnValue();
          if (v80)
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
          LOBYTE(v101) = v56;
          v103 = v38;
          v104 = (void *)v80;
          v105 = v78;
          v106 = -[WRSignpost initWithSubsystem:category:name:eventIdentifierFieldName:individuationFieldName:environmentFieldNames:networkBound:diagnostics:]([WRSignpost alloc], "initWithSubsystem:category:name:eventIdentifierFieldName:individuationFieldName:environmentFieldNames:networkBound:diagnostics:", v38, v111, v25, v80, v78, v107, v101, v109);
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v118 = 0u;
          v81 = *(id *)(a1 + 48);
          v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
          if (v82)
          {
            v83 = v82;
            v84 = *(_QWORD *)v116;
            obj = v81;
            while (2)
            {
              for (i = 0; i != v83; ++i)
              {
                if (*(_QWORD *)v116 != v84)
                  objc_enumerationMutation(obj);
                v86 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
                objc_msgSend(v86, "name");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = objc_msgSend(v87, "isEqualToString:", v25);

                if (v88)
                {
                  v89 = v106;
                  if (objc_msgSend(v86, "isEqual:", v106))
                    v97 = CFSTR("Duplicate signpost dictionary for signpost %@");
                  else
                    v97 = CFSTR("Multiple signposts with name %@");
                  WRMakeError(8, v97, v91, v92, v93, v94, v95, v96, (uint64_t)v25);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = v102;
                  v38 = v103;
                  v49 = v110;
                  v45 = v111;
                  v63 = v108;
                  goto LABEL_74;
                }
              }
              v81 = obj;
              v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
              if (v83)
                continue;
              break;
            }
          }

          v89 = v106;
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v106);
          v38 = v103;
          v45 = v111;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "addSubsystem:category:", v103, v111);
          v90 = v112;
          if (v109)
            v90 = 1;
          if ((v113 | v90) == 1)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 64), "addSubsystem:category:", v103, v111);
          else
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
          v49 = v110;
          v60 = v102;
          v63 = v108;
          if (v113)
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v106);
          if (v112)
          {
            if (!v110)
              v49 = CFSTR("NOGROUP");
            objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v49);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            obj = v98;
            if (v98)
            {
              objc_msgSend(v98, "addObject:", v106);
            }
            else
            {
              v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v106, 0);
              objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v99, v49);

              v89 = v106;
            }
            v16 = 0;
LABEL_74:

          }
          else
          {
            v16 = 0;
          }

          v79 = v105;
        }
        else
        {
          WRMakeError(8, CFSTR("Start signposts cannot be individuated (%@) for signpost %@"), v72, v73, v74, v75, v76, v77, v71);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v78;
          v45 = v111;
          v63 = v108;
        }

        goto LABEL_77;
      }
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("network_bound"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "BOOLValue");

      if ((v58 & 1) != 0)
        goto LABEL_25;
    }
    v56 = 0;
    goto LABEL_28;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "BOOLValue");

  if (!v9)
    goto LABEL_5;
LABEL_3:
  WRMakeError(3, CFSTR("Signpost disabled"), v10, v11, v12, v13, v14, v15, v101);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_81:

  return v16;
}

void __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke_73(uint64_t a1, __CFString *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2 == CFSTR("NOGROUP"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v6);
          v13 = *(void **)(a1 + 32);
          v19 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

uint64_t __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    if (v8 <= objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v4, "count"))
      {
        v9 = 0;
        while (1)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v10, "compare:", v11);

          if (v7)
            break;
          if (++v9 >= (unint64_t)objc_msgSend(v4, "count"))
            goto LABEL_9;
        }
      }
      else
      {
LABEL_9:
        v7 = 0;
      }
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (WRWorkflow)initWithEncodedDict:(id)a3 error:(id *)a4
{
  return (WRWorkflow *)-[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](self, a3, 1, 1, 0, (uint64_t *)a4);
}

- (id)encodedDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  id obj;
  uint64_t v59;
  WRWorkflow *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[WRWorkflow name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("name"), 0);

  if (-[WRWorkflow hasMaximumEventDuration](self, "hasMaximumEventDuration"))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[WRWorkflow maximumEventDuration](self, "maximumEventDuration");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("maximum_duration"));

  }
  -[WRWorkflow contextualTelemetryRawValue](self, "contextualTelemetryRawValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v5;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, 0x251BE59A8);

  v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[WRWorkflow allSignposts](self, "allSignposts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[WRWorkflow allSignposts](self, "allSignposts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
  if (v62)
  {
    v59 = *(_QWORD *)v77;
    v60 = self;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v77 != v59)
          objc_enumerationMutation(obj);
        v63 = v11;
        v12 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "subsystem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "category");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v14, CFSTR("name"), v15, CFSTR("subsystem"), v16, CFSTR("category"), 0);

        -[WRWorkflow startSignposts](self, "startSignposts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "indexOfObjectIdenticalTo:", v12);

        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("start"));
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        -[WRWorkflow endSignpostGroups](self, "endSignpostGroups");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        if (v21)
        {
          v22 = v21;
          LODWORD(v23) = 0;
          v24 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v73 != v24)
                objc_enumerationMutation(v20);
              v26 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              if (objc_msgSend(v26, "indexOfObjectIdenticalTo:", v12) != 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((unint64_t)objc_msgSend(v26, "count") < 2)
                {
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("end"));
                }
                else
                {
                  v23 = (v23 + 1);
                  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("group%d"), v23);
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("end_group"));

                }
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
          }
          while (v22);
        }

        objc_msgSend(v12, "individuationFieldName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("individuation_field_name"));

        objc_msgSend(v12, "environmentFieldNames");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("environment_field_names"));

        if (objc_msgSend(v12, "networkBound"))
          objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("network_bound"));
        objc_msgSend(v12, "diagnostics");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31)
        {
          v32 = objc_alloc(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v12, "diagnostics");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v32, "initWithCapacity:", objc_msgSend(v33, "count"));

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          objc_msgSend(v12, "diagnostics");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v69;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v69 != v38)
                  objc_enumerationMutation(v35);
                objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "encodedDict");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "addObject:", v40);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
            }
            while (v37);
          }

          v41 = (void *)objc_msgSend(v34, "copy");
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v41, CFSTR("diagnostics"));

        }
        objc_msgSend(v61, "addObject:", v17);

        v11 = v63 + 1;
        self = v60;
      }
      while (v63 + 1 != v62);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
    }
    while (v62);
  }

  v42 = (void *)objc_msgSend(v61, "copy");
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v42, CFSTR("signposts"));

  -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (v44)
  {
    v45 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v45, "initWithCapacity:", objc_msgSend(v46, "count"));

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v65 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "encodedDict");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v53);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
      }
      while (v50);
    }

    v54 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v54, CFSTR("diagnostics"));

  }
  v55 = (void *)objc_msgSend(v57, "copy");

  return v55;
}

- (BOOL)hasChangesRelativeTo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  unint64_t v69;
  BOOL v70;

  v4 = a3;
  -[WRWorkflow maximumEventDuration](self, "maximumEventDuration");
  v6 = v5;
  objc_msgSend(v4, "maximumEventDuration");
  if (v6 != v7)
    goto LABEL_36;
  -[WRWorkflow contextualTelemetryRawValue](self, "contextualTelemetryRawValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextualTelemetryRawValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_35;
  -[WRWorkflow contextualTelemetryRawValue](self, "contextualTelemetryRawValue");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  objc_msgSend(v4, "contextualTelemetryRawValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_8:
    goto LABEL_9;
  }
  v13 = (void *)v12;
  -[WRWorkflow contextualTelemetryRawValue](self, "contextualTelemetryRawValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextualTelemetryRawValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
    goto LABEL_36;
LABEL_9:
  -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  objc_msgSend(v4, "workflowDiagnostics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v18 == v20)
  {
    -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = 0;
      do
      {
        -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "workflowDiagnostics");
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v26, "objectAtIndexedSubscript:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v26) = objc_msgSend(v25, "isEqual:", v27);
        if ((v26 & 1) == 0)
          goto LABEL_36;
        ++v23;
        -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

      }
      while (v23 < v29);
    }
    -[WRWorkflow allSignposts](self, "allSignposts");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");
    objc_msgSend(v4, "allSignposts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v31 == v33)
    {
      -[WRWorkflow allSignposts](self, "allSignposts");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        v36 = 0;
        while (1)
        {
          -[WRWorkflow allSignposts](self, "allSignposts");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v36);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "allSignposts");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndexedSubscript:", v36);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v8, "isEqual:", v9) || (-[WRSignpost hasChangesRelativeTo:](v8, v9) & 1) != 0)
            break;

          ++v36;
          -[WRWorkflow allSignposts](self, "allSignposts");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

          if (v36 >= v40)
            goto LABEL_20;
        }
LABEL_35:

        goto LABEL_36;
      }
LABEL_20:
      -[WRWorkflow startSignposts](self, "startSignposts");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");
      objc_msgSend(v4, "startSignposts");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");

      if (v42 == v44)
      {
        -[WRWorkflow startSignposts](self, "startSignposts");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        if (v46)
        {
          v47 = 0;
          do
          {
            -[WRWorkflow startSignposts](self, "startSignposts");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "startSignposts");
            v50 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v50, "objectAtIndexedSubscript:", v47);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            LOBYTE(v50) = objc_msgSend(v49, "isEqual:", v51);
            if ((v50 & 1) == 0)
              goto LABEL_36;
            ++v47;
            -[WRWorkflow startSignposts](self, "startSignposts");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "count");

          }
          while (v47 < v53);
        }
        -[WRWorkflow endSignpostGroups](self, "endSignpostGroups");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "count");
        objc_msgSend(v4, "endSignpostGroups");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count");

        if (v55 == v57)
        {
          -[WRWorkflow endSignpostGroups](self, "endSignpostGroups");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "count");

          if (!v59)
          {
            v70 = 0;
            goto LABEL_37;
          }
          v60 = 0;
          while (1)
          {
            -[WRWorkflow endSignpostGroups](self, "endSignpostGroups");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectAtIndexedSubscript:", v60);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "endSignpostGroups");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectAtIndexedSubscript:", v60);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v63 = objc_msgSend(v8, "count");
            if (v63 != objc_msgSend(v9, "count"))
              goto LABEL_35;
            if (objc_msgSend(v8, "count"))
            {
              v64 = 0;
              do
              {
                objc_msgSend(v8, "objectAtIndexedSubscript:", v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectAtIndexedSubscript:", v64);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = objc_msgSend(v65, "isEqual:", v66);

                if ((v67 & 1) == 0)
                  goto LABEL_35;
              }
              while (++v64 < (unint64_t)objc_msgSend(v8, "count"));
            }

            ++v60;
            -[WRWorkflow endSignpostGroups](self, "endSignpostGroups");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "count");

            v70 = 0;
            if (v60 >= v69)
              goto LABEL_37;
          }
        }
      }
    }
  }
LABEL_36:
  v70 = 1;
LABEL_37:

  return v70;
}

- (id)wrsignpostWithName:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(a1, "allSignposts", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", v3);

          if ((v10 & 1) != 0)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)wrsignpostForSignpostObject:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(a1, "allSignposts", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          if ((-[WRSignpost matchesSignpost:](v8, v3) & 1) != 0)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WRWorkflow *v4;
  WRWorkflow *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WRWorkflow *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WRWorkflow name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WRWorkflow name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WRWorkflow name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WRWorkflow name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)hasMaximumEventDuration
{
  double v2;

  -[WRWorkflow maximumEventDuration](self, "maximumEventDuration");
  return v2 != 0.0;
}

- (id)debugDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ (%lu signposts)"), self->_name, -[NSArray count](self->_allSignposts, "count"));
}

- (double)overallDiagnosticThresholdIntervalSeconds
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasTriggerThresholdDurationSingle") & 1) != 0)
        {
          objc_msgSend(v8, "triggerThresholdDurationSingle");
          v4 = v9;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasOverallDiagnosticThresholdInterval
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[WRWorkflow workflowDiagnostics](self, "workflowDiagnostics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasTriggerThresholdDurationSingle") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)startSignposts
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)endSignpostGroups
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)allSignposts
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)workflowDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (SignpostSupportSubsystemCategoryAllowlist)allowListForAllSignposts
{
  return (SignpostSupportSubsystemCategoryAllowlist *)objc_getProperty(self, a2, 56, 1);
}

- (SignpostSupportSubsystemCategoryAllowlist)allowListForDiagnostics
{
  return (SignpostSupportSubsystemCategoryAllowlist *)objc_getProperty(self, a2, 64, 1);
}

- (double)maximumEventDuration
{
  return self->_maximumEventDuration;
}

- (BOOL)workflowSupportsConcurrentEvents
{
  return self->_workflowSupportsConcurrentEvents;
}

- (BOOL)contextualTelemetryEnabled
{
  return self->_contextualTelemetryEnabled;
}

- (NSString)contextualTelemetryRawValue
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualTelemetryRawValue, 0);
  objc_storeStrong((id *)&self->_allowListForDiagnostics, 0);
  objc_storeStrong((id *)&self->_allowListForAllSignposts, 0);
  objc_storeStrong((id *)&self->_workflowDiagnostics, 0);
  objc_storeStrong((id *)&self->_allSignposts, 0);
  objc_storeStrong((id *)&self->_endSignpostGroups, 0);
  objc_storeStrong((id *)&self->_startSignposts, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)diagnosticsEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_24A5B4000, v0, v1, "Error getting diagnotic enablement override: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_24();
}

+ (void)plistDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_15_0(&dword_24A5B4000, v0, v1, "Unable to get resources directory for workflow plists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9_0();
}

+ (void)allWorkflows
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_24A5B4000, v0, v1, "Bad override for new workflows: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_24();
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_24A5B4000, v0, v1, "Unable to determine filename for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_24();
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_24A5B4000, v0, v1, "%{public}@: Unable to create workflow: %{public}@");
  OUTLINED_FUNCTION_24();
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_35(&dword_24A5B4000, v0, v3, "%{public}@: Adding workflow from %{public}@", v4);

  OUTLINED_FUNCTION_0();
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_4()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_5(&dword_24A5B4000, v0, v3, "%{public}@: workflow name doesn't match plist filename %{public}@", v4);

  OUTLINED_FUNCTION_0();
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_34(&dword_24A5B4000, v0, v1, "%{public}@: Inferring no support of concurrent events due to having multiple signposts", v2);
  OUTLINED_FUNCTION_24();
}

- (void)initWithPlist:(uint64_t)a3 telemetryEnabled:(NSObject *)a4 diagnosticsEnabled:checkForOverrides:error:.cold.2(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_35(&dword_24A5B4000, a4, a3, "%{public}@: %{public}@: Inferring support of concurrent events", (uint8_t *)a3);

}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_34(&dword_24A5B4000, v0, v1, "%{public}@: Inferring no support of concurrent events due to having no maximum duration", v2);
  OUTLINED_FUNCTION_24();
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_0(&dword_24A5B4000, v0, v1, "%{public}@: Invalid new signposts: %@");
  OUTLINED_FUNCTION_24();
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_24A5B4000, v0, v1, "%{public}@: Bad override for diagnostics enablement: %{public}@");
  OUTLINED_FUNCTION_24();
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_24A5B4000, v0, v1, "%{public}@: Bad override workflow: %{public}@");
  OUTLINED_FUNCTION_24();
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_24A5B4000, v0, v1, "%{public}@: Bad override for telemetry enablement: %{public}@");
  OUTLINED_FUNCTION_24();
}

void __26__WRWorkflow_allWorkflows__block_invoke_12_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_24A5B4000, v0, v1, "Error with plist file %{public}@: %@");
  OUTLINED_FUNCTION_24();
}

+ (void)workflowWithName:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_24A5B4000, v0, v1, "%{public}@: Unable to create new workflow: %{public}@");
  OUTLINED_FUNCTION_24();
}

void __31__WRWorkflow_workflowWithName___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_8();
  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v3;
  v7 = 2112;
  v8 = v1;
  OUTLINED_FUNCTION_35(&dword_24A5B4000, v0, v4, "%{public}@: Found workflow from %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_0();
}

@end
