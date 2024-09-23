@implementation AnalyticsProcessor

+ (id)sharedAnalyticsProcessor
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!+[WAUtil isAnalyticsProcessorAllowed](WAUtil, "isAnalyticsProcessorAllowed"))
  {
    KeepDbEmptyErrorMsg();
    return 0;
  }
  if (!_MergedGlobals_0
    && !+[AnalyticsStoreMOHandler isStoreCompatible](AnalyticsStoreMOHandler, "isStoreCompatible"))
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446466;
      v5 = "+[AnalyticsProcessor sharedAnalyticsProcessor]";
      v6 = 1024;
      v7 = 82;
      _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:Store needs migration - Wait for wifianalyticsd to complete migration and retry", (uint8_t *)&v4, 0x12u);
    }

    return 0;
  }
  if (qword_253D3A470 != -1)
    dispatch_once(&qword_253D3A470, &__block_literal_global_0);
  return (id)_MergedGlobals_0;
}

void __46__AnalyticsProcessor_sharedAnalyticsProcessor__block_invoke()
{
  AnalyticsProcessor *v0;
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = -[AnalyticsProcessor initWithOptions:]([AnalyticsProcessor alloc], "initWithOptions:", 0);
  v1 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v0;

  if (!_MergedGlobals_0)
  {
    WALogCategoryDefaultHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = 136446466;
      v4 = "+[AnalyticsProcessor sharedAnalyticsProcessor]_block_invoke";
      v5 = 1024;
      v6 = 87;
      _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:AnalyticsProcessor failed to init -- Store unavailable to this process until reboot", (uint8_t *)&v3, 0x12u);
    }

  }
}

- (AnalyticsProcessor)initWithOptions:(unint64_t)a3
{
  AnalyticsProcessor *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  AnalyticsStoreMOHandler *v9;
  NSObject *p_super;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  AnalyticsStoreMOHandler *v15;
  AnalyticsStoreMOHandler *managedObjectHandler;
  BOOL v17;
  NSObject *v18;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)AnalyticsProcessor;
  v4 = -[AnalyticsProcessor init](&v23, sel_init);
  if (v4)
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      v25 = (const char *)a3;
      _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptions", "options=%lu", buf, 0xCu);
    }

    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if ((a3 & 2) != 0)
    {
      if (v7)
      {
        *(_DWORD *)buf = 136446466;
        v25 = "-[AnalyticsProcessor initWithOptions:]";
        v26 = 1024;
        v27 = 110;
        _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Initting AnalyticsStoreMOHandler with AnalyticsProcessorMigrationCapable - this should only be proc wifianalyticsd", buf, 0x12u);
      }

      if ((a3 & 1) != 0)
      {
        WALogCategoryDefaultHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v25 = "-[AnalyticsProcessor initWithOptions:]";
          v26 = 1024;
          v27 = 114;
          _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Options have AnalyticsProcessorEnableXPCStore, setting AnalyticsStoreMOSetupXPCStore", buf, 0x12u);
        }

        v12 = 3;
      }
      else
      {
        v12 = 2;
      }
      WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v25 = "-[AnalyticsProcessor initWithOptions:]";
        v26 = 1024;
        v27 = 119;
        _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Options have AnalyticsProcessorMigrationCapable, setting AnalyticsStoreMOMigration", buf, 0x12u);
      }

      v15 = -[AnalyticsStoreMOHandler initWithType:options:]([AnalyticsStoreMOHandler alloc], "initWithType:options:", 1, v12);
      managedObjectHandler = v4->_managedObjectHandler;
      v4->_managedObjectHandler = v15;

      if (!v4->_managedObjectHandler)
      {
        WALogCategoryDefaultHandle();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v25 = "-[AnalyticsProcessor initWithOptions:]";
          v26 = 1024;
          v27 = 125;
          v28 = 2048;
          v29 = a3;
          v11 = "%{public}s::%d:Error getting managedObjectHandler with options %lu";
          v20 = p_super;
          v21 = 28;
          goto LABEL_30;
        }
        goto LABEL_31;
      }
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 136446466;
        v25 = "-[AnalyticsProcessor initWithOptions:]";
        v26 = 1024;
        v27 = 128;
        _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Initting AnalyticsStoreMOHandler attempting to reuse existing instance for this pid", buf, 0x12u);
      }

      +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist](AnalyticsStoreMOHandler, "sharedAnalyticsStoreMOHandlerWithPersist");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v4->_managedObjectHandler;
      v4->_managedObjectHandler = (AnalyticsStoreMOHandler *)v8;

      if (!v4->_managedObjectHandler)
      {
        WALogCategoryDefaultHandle();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v25 = "-[AnalyticsProcessor initWithOptions:]";
          v26 = 1024;
          v27 = 136;
          v11 = "%{public}s::%d:Error getting sharedAnalyticsStoreMOHandlerWithPersist";
LABEL_27:
          v20 = p_super;
          v21 = 18;
LABEL_30:
          _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, v11, buf, v21);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
    }
    v17 = -[AnalyticsProcessor initCommmonObjects](v4, "initCommmonObjects");
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    p_super = v18;
    if (v17)
    {
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134217984;
        v25 = (const char *)a3;
        _os_signpost_emit_with_name_impl(&dword_212581000, p_super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptions", "options=%lu", buf, 0xCu);
      }
      goto LABEL_23;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[AnalyticsProcessor initWithOptions:]";
      v26 = 1024;
      v27 = 145;
      v11 = "%{public}s::%d:Error creating initCommmonObjects";
      goto LABEL_27;
    }
LABEL_31:

    WALogCategoryDefaultHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptions", "Error in Init", buf, 2u);
    }

    p_super = &v4->super;
    v4 = 0;
LABEL_23:

  }
  return v4;
}

- (AnalyticsProcessor)initWithOptions:(unint64_t)a3 byoMOC:(id)a4
{
  NSObject *v7;
  AnalyticsProcessor *v8;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptionsAndMOC", ", (uint8_t *)&v11, 2u);
  }

  if (a4)
  {
    self = -[AnalyticsProcessor initWithOptions:](self, "initWithOptions:", a3);
    v8 = self;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[AnalyticsProcessor initWithOptions:byoMOC:]";
      v13 = 1024;
      v14 = 162;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error with byoMOC", (uint8_t *)&v11, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)initCommmonObjects
{
  RoamPolicyStore *v3;
  RoamPolicyStore *roamPolicyHandler;
  LinkChangePolicyHandler *v5;
  LinkChangePolicyHandler *linkChangePolicyHandler;
  DeploymentMetricHandler *v7;
  DeploymentMetricHandler *deploymentMetricHandler;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!+[WAUtil isAnalyticsProcessorAllowed](WAUtil, "isAnalyticsProcessorAllowed"))
  {
    KeepDbEmptyErrorMsg();
    return 0;
  }
  v3 = -[RoamPolicyStore initWithAnalyticsStore:]([RoamPolicyStore alloc], "initWithAnalyticsStore:", self->_managedObjectHandler);
  roamPolicyHandler = self->_roamPolicyHandler;
  self->_roamPolicyHandler = v3;

  if (!self->_roamPolicyHandler)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = 136446466;
    v13 = "-[AnalyticsProcessor initCommmonObjects]";
    v14 = 1024;
    v15 = 176;
    v11 = "%{public}s::%d:Error getting _roamPolicyHandler";
LABEL_14:
    _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x12u);
    goto LABEL_15;
  }
  v5 = -[LinkChangePolicyHandler initWithAnalyticsStore:]([LinkChangePolicyHandler alloc], "initWithAnalyticsStore:", self->_managedObjectHandler);
  linkChangePolicyHandler = self->_linkChangePolicyHandler;
  self->_linkChangePolicyHandler = v5;

  if (!self->_linkChangePolicyHandler)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = 136446466;
    v13 = "-[AnalyticsProcessor initCommmonObjects]";
    v14 = 1024;
    v15 = 179;
    v11 = "%{public}s::%d:Error getting _linkChangePolicyHandler";
    goto LABEL_14;
  }
  v7 = -[DeploymentMetricHandler initWithAnalyticsStore:]([DeploymentMetricHandler alloc], "initWithAnalyticsStore:", self->_managedObjectHandler);
  deploymentMetricHandler = self->_deploymentMetricHandler;
  self->_deploymentMetricHandler = v7;

  if (!self->_deploymentMetricHandler)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446466;
      v13 = "-[AnalyticsProcessor initCommmonObjects]";
      v14 = 1024;
      v15 = 182;
      v11 = "%{public}s::%d:Error getting _deploymentMetricHandler";
      goto LABEL_14;
    }
LABEL_15:

    return 0;
  }
  self->_numRoamSamples = 0;
  *(_OWORD *)&self->_testDateDiffDays = xmmword_21267A830;
  return 1;
}

+ (id)formattedMACAddressNotation:(id)a3 octetCount:(unint64_t)a4
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v18;
  unsigned int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a4 == 3)
  {
    v6 = CFSTR("xx:xx:xx:xx:xx:xx");
  }
  else
  {
    if (a4 != 6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = CFSTR("xx:xx:xx");
  }
  v7 = -[__CFString length](v6, "length");
LABEL_7:
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7 || objc_msgSend(v8, "count") != a4)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "+[AnalyticsProcessor formattedMACAddressNotation:octetCount:]";
      v22 = 1024;
      v23 = 223;
      v24 = 2112;
      v25 = (char *)v5;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot format %@ into %lu octets", buf, 0x26u);
    }
LABEL_18:

    v16 = (id)objc_msgSend(v5, "copy");
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v11 = 0;
    while (1)
    {
      v19 = 0;
      v12 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v9, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scannerWithString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "scanHexInt:", &v19);
      if (v19 == -1)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x"), v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", v15, v11);

      if ((char *)a4 == ++v11)
        goto LABEL_13;
    }
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "+[AnalyticsProcessor formattedMACAddressNotation:octetCount:]";
      v22 = 1024;
      v23 = 229;
      v24 = 2048;
      v25 = v11;
      v26 = 2112;
      v27 = (unint64_t)v5;
      _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:No int value for octet %lu for %@", buf, 0x26u);
    }

    goto LABEL_18;
  }
LABEL_13:
  -[NSObject componentsJoinedByString:](v10, "componentsJoinedByString:", CFSTR(":"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v16;
}

- (id)formattedNotation:(id)a3 octetCount:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)unpackRssiSnrCCAFromRssiMetricField:(id)a3 unpackedRssi:(id *)a4 unpackedCca:(id *)a5 unpackedSnr:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  NSObject *v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = v9;
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
      v33 = 1024;
      v34 = 249;
      v25 = "%{public}s::%d:packedRssi nil";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!a4 || !*a4)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
    v33 = 1024;
    v34 = 250;
    v25 = "%{public}s::%d:rssiArray nil";
LABEL_25:
    _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
    goto LABEL_26;
  }
  if (!a5 || !*a5)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
    v33 = 1024;
    v34 = 251;
    v25 = "%{public}s::%d:ccaArray nil";
    goto LABEL_25;
  }
  if (!a6 || !*a6)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
      v33 = 1024;
      v34 = 252;
      v25 = "%{public}s::%d:snrArray nil";
      goto LABEL_25;
    }
LABEL_26:

    v22 = 0;
    goto LABEL_16;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "intValue");
        v16 = *a4;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

        v18 = *a5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        v20 = *a6;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v21);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }
  v22 = 1;
LABEL_16:

  return v22;
}

- (id)getDateFromDateString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[AnalyticsProcessor dateFormatterWAMessage](self, "dateFormatterWAMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AnalyticsProcessor testDateDiffDays](self, "testDateDiffDays") && v6)
    {
      v7 = -[AnalyticsProcessor testDateDiffDays](self, "testDateDiffDays");
      v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v8, "setDay:", -(uint64_t)v7);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v8, v6, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446466;
      v14 = "-[AnalyticsProcessor getDateFromDateString:]";
      v15 = 1024;
      v16 = 272;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:string nil", (uint8_t *)&v13, 0x12u);
    }

    v6 = 0;
  }

  return v6;
}

- (void)processWAMessageMetric:(id)a3 data:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v32 = "-[AnalyticsProcessor processWAMessageMetric:data:]";
    v33 = 1024;
    v34 = 290;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Processing metric: %@", buf, 0x1Cu);
  }

  WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_212581000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processWAMessageMetric", "metricName:%@", buf, 0xCu);
  }

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.PowerState")) & 1) == 0)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.KnownNetworkEvent")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke;
      v30[3] = &unk_24CDDCCA8;
      v30[4] = self;
      v13 = v30;
LABEL_36:
      objc_msgSend(v11, "performBlockOnManagedObjectContext:block:", v7, v13);

      goto LABEL_37;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.Ipv4Latency")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_2;
      v29[3] = &unk_24CDDCCA8;
      v29[4] = self;
      v13 = v29;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.RoamStatus")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_3;
      v28[3] = &unk_24CDDCCA8;
      v28[4] = self;
      v13 = v28;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.LinkChange")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_4;
      v27[3] = &unk_24CDDCCA8;
      v27[4] = self;
      v13 = v27;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.AssociationFailure")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_5;
      v26[3] = &unk_24CDDCCA8;
      v26[4] = self;
      v13 = v26;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.NetworkGeotag")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_6;
      v25[3] = &unk_24CDDCCA8;
      v25[4] = self;
      v13 = v25;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.ClientAssociation")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_7;
      v24[3] = &unk_24CDDCCA8;
      v24[4] = self;
      v13 = v24;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.ParsedBeaconInfo")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_8;
      v23[3] = &unk_24CDDCCA8;
      v23[4] = self;
      v13 = v23;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.HistoricalKnownNetworkQuality")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_9;
      v22[3] = &unk_24CDDCCA8;
      v22[4] = self;
      v13 = v22;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.BeaconCache")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_10;
      v21[3] = &unk_24CDDCCA8;
      v21[4] = self;
      v13 = v21;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.Fault")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_11;
      v20[3] = &unk_24CDDCCA8;
      v20[4] = self;
      v13 = v20;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.Recovery")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_12;
      v19[3] = &unk_24CDDCCA8;
      v19[4] = self;
      v13 = v19;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.LinkTest")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_13;
      v18[3] = &unk_24CDDCCA8;
      v18[4] = self;
      v13 = v18;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.WiFiStats")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_14;
      v17[3] = &unk_24CDDCCA8;
      v17[4] = self;
      v13 = v17;
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.wifi.DiagnosticState")))
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_15;
      v16[3] = &unk_24CDDCCA8;
      v16[4] = self;
      v13 = v16;
      goto LABEL_36;
    }
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "-[AnalyticsProcessor processWAMessageMetric:data:]";
      v33 = 1024;
      v34 = 380;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled metric %@", buf, 0x1Cu);
    }

  }
LABEL_37:
  WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_212581000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processWAMessageMetric", "metricName:%@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v8);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricKnownNetworkEvent:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricIpV4Latency:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricRoamStatus:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricLinkChange:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricAssociationFailure:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricNetworkGeotag:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricClientAssociation:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricParsedBeaconInfo:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricHistoricalNetworkQuality:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricBeaconCache:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricFault:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricRecovery:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricLinkTest:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricWiFiStats:", a2);
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMetricDiagnosticState:", a2);
}

- (void)processMetricKnownNetworkEvent:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  const char *v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("networkTypeBitMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("networkAuthFlags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("oui"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v14, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v27 = 136448002;
    v28 = "-[AnalyticsProcessor processMetricKnownNetworkEvent:]";
    v29 = 1024;
    v30 = 398;
    v31 = 1024;
    *(_DWORD *)v32 = v6;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v8;
    LOWORD(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 2) = v10;
    HIWORD(v33) = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v13;
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:eventType:%d networkTypeBitMap:%d networkSecurity:%d oui:%@ ssid:%@ bssid:%@", (uint8_t *)&v27, 0x42u);
  }

  if (v6 <= 0xD && ((1 << v6) & 0x3694) != 0 && v13)
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      v27 = 67109120;
      LODWORD(v28) = v6;
      _os_signpost_emit_with_name_impl(&dword_212581000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricKnownNetworkEvent", "eventType:%d", (uint8_t *)&v27, 8u);
    }

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v13, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "setSwitchedToCount:", 0);
      objc_msgSend(v20, "setSwitchedAwayFromCount:", 0);
    }
    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "sucess";
      v28 = "-[AnalyticsProcessor processMetricKnownNetworkEvent:]";
      v29 = 1024;
      v30 = 433;
      v27 = 136446978;
      if (!v20)
        v22 = "failed";
      v31 = 2112;
      *(_QWORD *)v32 = v13;
      *(_WORD *)&v32[8] = 2080;
      v33 = v22;
      _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Resetting user preferences for ssid:%@ %s", (uint8_t *)&v27, 0x26u);
    }

    WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      v27 = 67109120;
      LODWORD(v28) = v6;
      _os_signpost_emit_with_name_impl(&dword_212581000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricKnownNetworkEvent", "eventType:%d", (uint8_t *)&v27, 8u);
    }

    if (v20)
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "saveManagedObjectContext");

      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "managedObjectContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "reset");

    }
  }

}

- (void)processMetricIpV4Latency:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  const char *v53;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  _BYTE v62[10];
  void *v63;
  _BYTE v64[6];
  void *v65;
  _DWORD v66[7];

  *(_QWORD *)&v66[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricIpV4Latency", ", buf, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("dhcpLatencyMilliSecs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("networkAuthFlags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("dhcpLeaseMins"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("success"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v15, 6);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)v16;
  objc_msgSend(v4, "valueForKey:", CFSTR("dhcpAddresses"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448002;
    v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
    v59 = 1024;
    v60 = 460;
    v61 = 1024;
    *(_DWORD *)v62 = v7;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = v9;
    LOWORD(v63) = 1024;
    *(_DWORD *)((char *)&v63 + 2) = v11;
    HIWORD(v63) = 1024;
    *(_DWORD *)v64 = v13;
    *(_WORD *)&v64[4] = 2112;
    v65 = v14;
    LOWORD(v66[0]) = 2112;
    *(_QWORD *)((char *)v66 + 2) = v16;
    _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dhcpLatencyMilliSecs:%d securityType:%d dhcpLeaseMins:%d successful:%d ssid:%@ bssid:%@", buf, 0x3Eu);
  }

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v17, v14, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v22 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "managedObjectContext");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v17;
    v26 = (void *)v24;
    v54 = v25;
    v56 = v22;
    +[JoinMO mostRecentJoin:ssid:moc:](JoinMO, "mostRecentJoin:ssid:moc:");
    v27 = objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[NSObject setDhcpSuccess:](v27, "setDhcpSuccess:", v13);
      -[NSObject setDhcpLatencyMs:](v27, "setDhcpLatencyMs:", v7);
      -[NSObject setDhcpLeaseMins:](v27, "setDhcpLeaseMins:", v11);
      v28 = v55;
      if (v55)
      {
        objc_msgSend(v55, "valueForKey:", CFSTR("IO80211InterfaceIPV4Address"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "valueForKey:", CFSTR("IO80211InterfaceIPV4RouterAddress"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "valueForKey:", CFSTR("IO80211InterfaceRouterMACAddress"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v31, 6);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject setIpv4Addr:](v27, "setIpv4Addr:", objc_msgSend(v29, "unsignedIntValue"));
        -[NSObject setIpv4routerAddr:](v27, "setIpv4routerAddr:", objc_msgSend(v30, "unsignedIntValue"));
        -[NSObject setRouterMAC:](v27, "setRouterMAC:", v32);

        objc_msgSend(v21, "network");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setAuthFlags:", v9);

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "updateManagedObjectContextWithoutSave");

        WALogCategoryDefaultHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject date](v27, "date");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bssid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[NSObject ipv4Addr](v27, "ipv4Addr");
          v39 = -[NSObject ipv4routerAddr](v27, "ipv4routerAddr");
          -[NSObject routerMAC](v27, "routerMAC");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136447746;
          v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
          v59 = 1024;
          v60 = 491;
          v61 = 2112;
          *(_QWORD *)v62 = v36;
          *(_WORD *)&v62[8] = 2112;
          v63 = v37;
          *(_WORD *)v64 = 1024;
          *(_DWORD *)&v64[2] = v38;
          LOWORD(v65) = 1024;
          *(_DWORD *)((char *)&v65 + 2) = v39;
          HIWORD(v65) = 2112;
          *(_QWORD *)v66 = v40;
          _os_log_impl(&dword_212581000, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Set the IPv4 latency to the Join[%@] for BSS[%@] ipv4Addr:0x%x routerIpv4Addr:0x%x routerMAC:%@", buf, 0x3Cu);

        }
        -[AnalyticsProcessor linkChangePolicyHandler](self, "linkChangePolicyHandler");
        v41 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bssid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[NSObject ipv4Addr](v27, "ipv4Addr");
        v44 = -[NSObject ipv4routerAddr](v27, "ipv4routerAddr");
        -[NSObject routerMAC](v27, "routerMAC");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:](v41, "checkAndApplyColocatedNetworkScope:bssid:ipAddr:routerIp:routerMAC:", v56, v42, v43, v44, v45);

      }
      else
      {
        objc_msgSend(v21, "network");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setAuthFlags:", v9);

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "updateManagedObjectContextWithoutSave");

        WALogCategoryDefaultHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
LABEL_14:
          v17 = v54;

          -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "saveManagedObjectContext");

          -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "managedObjectContext");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "reset");

          v14 = v56;
          goto LABEL_15;
        }
        -[NSObject date](v27, "date");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bssid");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
        v59 = 1024;
        v60 = 489;
        v61 = 2112;
        *(_QWORD *)v62 = v42;
        *(_WORD *)&v62[8] = 2112;
        v63 = v48;
        _os_log_impl(&dword_212581000, v41, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Set the IPv4 latency to the Join[%@] for BSS[%@]", buf, 0x26u);

      }
      goto LABEL_14;
    }
    WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v14 = v56;
      v17 = v54;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136446978;
    v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
    v59 = 1024;
    v60 = 467;
    v61 = 2112;
    v14 = v56;
    *(_QWORD *)v62 = v56;
    *(_WORD *)&v62[8] = 2112;
    v17 = v54;
    v63 = v54;
    v53 = "%{public}s::%d:joinMO nil for %@[%@]";
    goto LABEL_22;
  }
  WALogCategoryDefaultHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
    v59 = 1024;
    v60 = 464;
    v61 = 2112;
    *(_QWORD *)v62 = v14;
    *(_WORD *)&v62[8] = 2112;
    v63 = v17;
    v53 = "%{public}s::%d:bssMO nil for %@[%@]";
LABEL_22:
    _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_ERROR, v53, buf, 0x26u);
  }
LABEL_24:
  v28 = v55;
LABEL_15:

  WALogCategoryDefaultHandle();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricIpV4Latency", ", buf, 2u);
  }

}

- (void)processMetricRoamStatus:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  AnalyticsProcessor *v75;
  _BOOL4 v76;
  id v77;
  void *v78;
  double v79;
  double v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t i;
  id v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  int v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  char v123;
  NSObject *v124;
  void *v125;
  int v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  char v132;
  NSObject *v133;
  void *v134;
  void *v135;
  void *v136;
  char v137;
  void *v138;
  char v139;
  int v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  int v146;
  NSObject *v147;
  _BOOL4 v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  NSObject *v155;
  NSObject *v156;
  const char *v157;
  NSObject *v158;
  uint32_t v159;
  NSObject *v160;
  NSObject *v161;
  NSObject *v162;
  __int16 v163;
  __int16 v164;
  unsigned int v165;
  unsigned int v166;
  void *v167;
  void *v168;
  int v169;
  unsigned int v170;
  int v171;
  id v172;
  id v173;
  void *v174;
  NSObject *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  AnalyticsProcessor *v183;
  uint64_t v184;
  unsigned int obj;
  id obja;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  unsigned int v190;
  int v191;
  int v192;
  id v193;
  int v194;
  NSObject *v195;
  unsigned int v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  id v206;
  id v207;
  _BYTE v208[128];
  int buf;
  const char *v210;
  __int16 v211;
  int v212;
  __int16 v213;
  _QWORD v214[8];
  __int16 v215;
  unsigned int v216;
  __int16 v217;
  unsigned int v218;
  uint64_t v219;

  v219 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus", ", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("originAddr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v6, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKey:", CFSTR("targetAddr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v8, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v7))
  {
    WALogCategoryDefaultHandle();
    v155 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    buf = 136446722;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 510;
    v213 = 2112;
    v214[0] = v7;
    v157 = "%{public}s::%d:originAddr(%@) is the wildcard address!! bailing";
    goto LABEL_101;
  }
  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v9))
  {
    WALogCategoryDefaultHandle();
    v155 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    buf = 136446722;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 511;
    v213 = 2112;
    v214[0] = v9;
    v157 = "%{public}s::%d:targetAddr(%@) is the wildcard address!! bailing";
LABEL_101:
    v158 = v155;
    v159 = 28;
    goto LABEL_104;
  }
  if (objc_msgSend(v7, "isEqualToString:", v9))
  {
    WALogCategoryDefaultHandle();
    v155 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    buf = 136446466;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 512;
    v157 = "%{public}s::%d:ignoring roam status with identical origin and targetAddr";
    v158 = v155;
    v159 = 18;
LABEL_104:
    _os_log_impl(&dword_212581000, v158, OS_LOG_TYPE_ERROR, v157, (uint8_t *)&buf, v159);
    goto LABEL_93;
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("timeStarted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("timeEnded"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = objc_msgSend(v12, "longLongValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("networkAuthFlags"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("roamFlags"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("status"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend(v17, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("reason"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = objc_msgSend(v18, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("profileType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("originRssi"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = objc_msgSend(v21, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("targetRssi"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = objc_msgSend(v22, "intValue");

  WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    buf = 136448770;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 525;
    v213 = 2048;
    v214[0] = v11;
    LOWORD(v214[1]) = 2048;
    *(_QWORD *)((char *)&v214[1] + 2) = v198;
    WORD1(v214[2]) = 1024;
    HIDWORD(v214[2]) = v14;
    LOWORD(v214[3]) = 1024;
    *(_DWORD *)((char *)&v214[3] + 2) = v16;
    HIWORD(v214[3]) = 1024;
    LODWORD(v214[4]) = v180;
    WORD2(v214[4]) = 1024;
    *(_DWORD *)((char *)&v214[4] + 6) = v196;
    WORD1(v214[5]) = 1024;
    HIDWORD(v214[5]) = v20;
    LOWORD(v214[6]) = 1024;
    *(_DWORD *)((char *)&v214[6] + 2) = v192;
    HIWORD(v214[6]) = 1024;
    LODWORD(v214[7]) = v194;
    _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:timeStarted:%lld timeEnded:%lld securityType:%d flags:%d status:%d reason:%d profileType:%d originRssi:%d targetRssi:%d", (uint8_t *)&buf, 0x50u);
  }
  v189 = v11;

  objc_msgSend(v4, "valueForKey:", CFSTR("originChannel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = objc_msgSend(v24, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("targetChannel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("originChannelFlags"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = objc_msgSend(v27, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("targetChannelFlags"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(v28, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("originOui"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("originOui"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v30, 3);
    v175 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v175 = 0;
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("targetOui"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = self;
  v165 = v14;
  if (v31)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("targetOui"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v32, 3);
    v174 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v174 = 0;
  }
  v177 = v7;

  objc_msgSend(v4, "valueForKey:", CFSTR("ccaTotal"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("ccaOthers"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("ccaInt"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "unsignedIntValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("originTxPer"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "longLongValue");

  v178 = v4;
  objc_msgSend(v4, "valueForKey:", CFSTR("offChannelDt"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "unsignedIntValue");

  WALogCategoryDefaultHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    buf = 136449282;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 539;
    v213 = 1024;
    LODWORD(v214[0]) = v171;
    WORD2(v214[0]) = 1024;
    *(_DWORD *)((char *)v214 + 6) = v26;
    WORD1(v214[1]) = 2112;
    *(_QWORD *)((char *)&v214[1] + 4) = v175;
    WORD2(v214[2]) = 2112;
    *(_QWORD *)((char *)&v214[2] + 6) = v174;
    HIWORD(v214[3]) = 1024;
    LODWORD(v214[4]) = v34;
    WORD2(v214[4]) = 1024;
    *(_DWORD *)((char *)&v214[4] + 6) = v36;
    WORD1(v214[5]) = 1024;
    HIDWORD(v214[5]) = v38;
    LOWORD(v214[6]) = 2048;
    *(_QWORD *)((char *)&v214[6] + 2) = v40;
    WORD1(v214[7]) = 1024;
    HIDWORD(v214[7]) = v42;
    v215 = 1024;
    v216 = v170;
    v217 = 1024;
    v218 = v166;
    _os_log_impl(&dword_212581000, v43, OS_LOG_TYPE_DEBUG, "%{public}s::%d:originChannel:%d targetChannel:%d originOui:%@ targetOui:%@ ccaTotal:%d ccaOthers:%d ccaInt:%d originTxPer:%lld offChannelDt:%d, originChannelFlags:%d, targetChannelFlags:%d", (uint8_t *)&buf, 0x60u);
  }
  v164 = v26;

  v4 = v178;
  objc_msgSend(v178, "valueForKey:", CFSTR("roamScanDuration"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("associationDuration"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "longLongValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("hostReason"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("motionState"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = objc_msgSend(v50, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("voipActive"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = objc_msgSend(v51, "BOOLValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("lateRoam"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "BOOLValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("originBcnPer"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "longLongValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("originFwTxPer"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "longLongValue");

  WALogCategoryDefaultHandle();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    buf = 136448514;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 550;
    v213 = 1024;
    LODWORD(v214[0]) = v45;
    WORD2(v214[0]) = 2048;
    *(_QWORD *)((char *)v214 + 6) = v47;
    HIWORD(v214[1]) = 1024;
    LODWORD(v214[2]) = v49;
    WORD2(v214[2]) = 1024;
    *(_DWORD *)((char *)&v214[2] + 6) = v191;
    WORD1(v214[3]) = 1024;
    HIDWORD(v214[3]) = v190;
    LOWORD(v214[4]) = 1024;
    *(_DWORD *)((char *)&v214[4] + 2) = v53;
    HIWORD(v214[4]) = 2048;
    v214[5] = v55;
    LOWORD(v214[6]) = 2048;
    *(_QWORD *)((char *)&v214[6] + 2) = v57;
    _os_log_impl(&dword_212581000, v58, OS_LOG_TYPE_DEBUG, "%{public}s::%d:roamScanDuration:%d associatedDur:%lld hostReason:%d motionState:%d voipActive:%d lateRoam:%d originBcnPer:%lld originFwTxPer:%lld", (uint8_t *)&buf, 0x4Eu);
  }
  obj = v49;
  v187 = v47;

  objc_msgSend(v178, "valueForKey:", CFSTR("originEnhancedSecurityType"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("targetEnhancedSecurityType"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("originAKMs"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("targetAKMs"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("originPhyMode"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = objc_msgSend(v67, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("targetPhyMode"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "unsignedIntValue");

  objc_msgSend(v178, "valueForKey:", CFSTR("ssid"));
  v184 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "valueForKey:", CFSTR("roamCache"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  WALogCategoryDefaultHandle();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    buf = 136448770;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 561;
    v213 = 1024;
    LODWORD(v214[0]) = v60;
    WORD2(v214[0]) = 1024;
    *(_DWORD *)((char *)v214 + 6) = v62;
    WORD1(v214[1]) = 1024;
    HIDWORD(v214[1]) = v64;
    LOWORD(v214[2]) = 1024;
    *(_DWORD *)((char *)&v214[2] + 2) = v66;
    HIWORD(v214[2]) = 1024;
    LODWORD(v214[3]) = v169;
    WORD2(v214[3]) = 1024;
    *(_DWORD *)((char *)&v214[3] + 6) = v69;
    WORD1(v214[4]) = 2112;
    *(_QWORD *)((char *)&v214[4] + 4) = v177;
    WORD2(v214[5]) = 2112;
    *(_QWORD *)((char *)&v214[5] + 6) = v9;
    HIWORD(v214[6]) = 2112;
    v214[7] = v184;
    _os_log_impl(&dword_212581000, v70, OS_LOG_TYPE_DEBUG, "%{public}s::%d:originEnhancedSecurityType:%d targetEnhancedSecurityType:%d originAKMs:%d targetAKMs:%d originPhyMode:%d targetPhyMode:%d originAddr:%@ targetAddr:%@ ssid:%@", (uint8_t *)&buf, 0x54u);
  }
  v163 = v69;
  v176 = v9;

  v193 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v178, "valueForKey:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = v73;
  v207 = v72;
  v205 = v74;
  v75 = v183;
  v167 = v71;
  v76 = -[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:](v183, "unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:", v71, &v207, &v206, &v205);
  v77 = v207;

  v173 = v206;
  v172 = v205;

  objc_msgSend(v178, "valueForKey:", CFSTR("metricDate"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "doubleValue");
  v80 = v79;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v80);
  v81 = objc_claimAutoreleasedReturnValue();
  WALogCategoryDefaultHandle();
  v82 = objc_claimAutoreleasedReturnValue();
  v83 = v82;
  v181 = (void *)v81;
  v168 = v77;
  if (!v81)
  {
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      buf = 136446466;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      v211 = 1024;
      v212 = 579;
      _os_log_impl(&dword_212581000, v83, OS_LOG_TYPE_ERROR, "%{public}s::%d:date nil", (uint8_t *)&buf, 0x12u);
    }
    v140 = 4;
    v7 = v177;
    v93 = (void *)v184;
    goto LABEL_89;
  }
  if (os_signpost_enabled(v82))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v83, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_generateRoamMO", ", (uint8_t *)&buf, 2u);
  }

  -[AnalyticsProcessor managedObjectHandler](v183, "managedObjectHandler");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "managedObjectContext");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[RoamMO generateInstance:](RoamMO, "generateInstance:", v85);
  v86 = objc_claimAutoreleasedReturnValue();

  if (!v86)
  {
    WALogCategoryDefaultHandle();
    v83 = objc_claimAutoreleasedReturnValue();
    v151 = v167;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      buf = 136446466;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      v211 = 1024;
      v212 = 583;
      _os_log_impl(&dword_212581000, v83, OS_LOG_TYPE_ERROR, "%{public}s::%d:roamMO nil", (uint8_t *)&buf, 0x12u);
    }
    v140 = 4;
    v7 = v177;
    v93 = (void *)v184;
    goto LABEL_90;
  }
  -[NSObject setDate:](v86, "setDate:", v181);
  -[NSObject setFwReason:](v86, "setFwReason:", v196);
  -[NSObject setHostReason:](v86, "setHostReason:", obj);
  -[NSObject setStatus:](v86, "setStatus:", v180);
  -[NSObject setRoamLatencyMs:](v86, "setRoamLatencyMs:", (double)(v198 - v189));
  -[NSObject setMotionState:](v86, "setMotionState:", (__int16)v191);
  -[NSObject setSourceScanLatencyMs:](v86, "setSourceScanLatencyMs:", v45);
  -[NSObject setVoipActive:](v86, "setVoipActive:", v190);
  -[NSObject setSourceRssi:](v86, "setSourceRssi:", (__int16)v192);
  -[NSObject setTargetRssi:](v86, "setTargetRssi:", (__int16)v194);
  if (v76)
  {
    -[NSObject setHistRssi:](v86, "setHistRssi:", v77);
    -[NSObject setHistCca:](v86, "setHistCca:", v173);
    -[NSObject setHistSnr:](v86, "setHistSnr:", v172);
  }
  objc_msgSend(v178, "valueForKey:", CFSTR("txPer"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHistTxPer:](v86, "setHistTxPer:", v87);

  objc_msgSend(v178, "valueForKey:", CFSTR("txFrame"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHistTxFrames:](v86, "setHistTxFrames:", v88);

  objc_msgSend(v178, "valueForKey:", CFSTR("fwTxPer"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHistFwTxPer:](v86, "setHistFwTxPer:", v89);

  objc_msgSend(v178, "valueForKey:", CFSTR("fwTxFrames"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHistFwTxFrames:](v86, "setHistFwTxFrames:", v90);

  objc_msgSend(v178, "valueForKey:", CFSTR("beaconSched"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHistBcnSched:](v86, "setHistBcnSched:", v91);

  objc_msgSend(v178, "valueForKey:", CFSTR("beaconsPer"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHistBcnPer:](v86, "setHistBcnPer:", v92);

  v195 = v86;
  -[NSObject setSourceTimeSpentSecs:](v86, "setSourceTimeSpentSecs:", v187);
  v7 = v177;
  v93 = (void *)v184;
  if (v179)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    WALogCategoryDefaultHandle();
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v94))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, v94, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_roamCacheloop", ", (uint8_t *)&buf, 2u);
    }

    v203 = 0u;
    v204 = 0u;
    v201 = 0u;
    v202 = 0u;
    obja = v179;
    v197 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v201, v208, 16);
    if (v197)
    {
      v95 = *(_QWORD *)v202;
      v199 = *(_QWORD *)v202;
      do
      {
        for (i = 0; i != v197; ++i)
        {
          if (*(_QWORD *)v202 != v95)
            objc_enumerationMutation(obja);
          v97 = *(id *)(*((_QWORD *)&v201 + 1) + 8 * i);
          v98 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v97, "objectForKey:", CFSTR("channel"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "objectForKey:", CFSTR("rssi"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "objectForKey:", CFSTR("bssid"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v100, "intValue");
          if (v102 >= v192)
            v103 = (v192 - v102);
          else
            v103 = (v102 - v192);
          objc_msgSend(v98, "setObject:forKey:", v99, CFSTR("channel"));
          objc_msgSend(v98, "setObject:forKey:", v100, CFSTR("rssi"));
          objc_msgSend(v98, "setObject:forKey:", v101, CFSTR("bssid"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKey:", v104, CFSTR("roamDelta"));

          objc_msgSend(v193, "addObject:", v98);
          -[NSObject setRoamDelta:](v195, "setRoamDelta:", (__int16)v103);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v103);
          v105 = objc_claimAutoreleasedReturnValue();
          v106 = (void *)v105;
          v95 = v199;
          if (v99 && v100 && v101)
          {
            v188 = v99;
            objc_msgSend(v182, "appendFormat:", CFSTR(" {%@, %@, %@, %@} "), v101, v100, v99, v105);
            -[AnalyticsProcessor formattedNotation:octetCount:](v183, "formattedNotation:octetCount:", v101, 6);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[AnalyticsProcessor managedObjectHandler](v183, "managedObjectHandler");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "managedObjectContext");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v107, v184, v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();

            if (v110)
              objc_msgSend(v110, "setLastSeen:", v181);

            v95 = v199;
            v99 = v188;
          }

        }
        v197 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v201, v208, 16);
      }
      while (v197);
    }

    WALogCategoryDefaultHandle();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
    {
      buf = 136446722;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      v211 = 1024;
      v212 = 649;
      v213 = 2112;
      v214[0] = v182;
      _os_log_impl(&dword_212581000, v111, OS_LOG_TYPE_DEBUG, "%{public}s::%d:roamCacheStr:%@", (uint8_t *)&buf, 0x1Cu);
    }

    -[NSObject setNeighborCache:](v195, "setNeighborCache:", v193);
    WALogCategoryDefaultHandle();
    v112 = objc_claimAutoreleasedReturnValue();
    v7 = v177;
    v4 = v178;
    v75 = v183;
    v93 = (void *)v184;
    if (os_signpost_enabled(v112))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, v112, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_roamCacheloop", ", (uint8_t *)&buf, 2u);
    }

  }
  -[AnalyticsProcessor managedObjectHandler](v75, "managedObjectHandler");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "managedObjectContext");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v7, v93, v114);
  v83 = objc_claimAutoreleasedReturnValue();

  if (!v83)
  {
    WALogCategoryDefaultHandle();
    v160 = objc_claimAutoreleasedReturnValue();
    v151 = v167;
    if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
    {
      buf = 136446978;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      v211 = 1024;
      v212 = 655;
      v213 = 2112;
      v214[0] = v93;
      LOWORD(v214[1]) = 2112;
      *(_QWORD *)((char *)&v214[1] + 2) = v7;
      _os_log_impl(&dword_212581000, v160, OS_LOG_TYPE_ERROR, "%{public}s::%d:originBssMO nil for %@[%@]", (uint8_t *)&buf, 0x26u);
    }

    v140 = 4;
    v83 = v195;
    goto LABEL_90;
  }
  -[NSObject setChannel:](v83, "setChannel:", (__int16)v171);
  -[NSObject setChannelFlags:](v83, "setChannelFlags:", v170);
  -[NSObject setPhyMode:](v83, "setPhyMode:", (__int16)v169);
  -[NSObject setLastSeen:](v83, "setLastSeen:", v181);
  -[NSObject setSource:](v195, "setSource:", v83);
  WALogCategoryDefaultHandle();
  v115 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject bssid](v83, "bssid");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = -[NSObject channel](v83, "channel");
    buf = 136447234;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    v211 = 1024;
    v212 = 664;
    v213 = 2112;
    v214[0] = v116;
    LOWORD(v214[1]) = 1024;
    *(_DWORD *)((char *)&v214[1] + 2) = v117;
    HIWORD(v214[1]) = 1024;
    LODWORD(v214[2]) = v180;
    _os_log_impl(&dword_212581000, v115, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Set Roam Source BSS[%@] (chan: %d) status %d", (uint8_t *)&buf, 0x28u);

  }
  v200 = 0;
  if ((_DWORD)v180)
  {
    v118 = 0;
  }
  else
  {
    -[AnalyticsProcessor managedObjectHandler](v75, "managedObjectHandler");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "managedObjectContext");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSSMO generateInstance:ssid:created:moc:](BSSMO, "generateInstance:ssid:created:moc:", v176, v93, &v200, v120);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v118)
    {
      WALogCategoryDefaultHandle();
      v162 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
      {
        buf = 136446978;
        v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
        v211 = 1024;
        v212 = 669;
        v213 = 2112;
        v214[0] = v93;
        LOWORD(v214[1]) = 2112;
        *(_QWORD *)((char *)&v214[1] + 2) = v176;
        _os_log_impl(&dword_212581000, v162, OS_LOG_TYPE_ERROR, "%{public}s::%d:targetBssMO nil for %@[%@]", (uint8_t *)&buf, 0x26u);
      }

      v118 = 0;
      goto LABEL_120;
    }
    if (v200)
    {
      objc_msgSend(v118, "setChannel:", v164);
      objc_msgSend(v118, "setChannelFlags:", v166);
      objc_msgSend(v118, "setPhyMode:", v163);
      objc_msgSend(v118, "setLastSeen:", v181);
    }
    objc_msgSend(v4, "valueForKey:", CFSTR("apProfile"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (v121)
    {
      objc_msgSend(v118, "apProfileID");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v122, "isEqualToString:", v121);

      if ((v123 & 1) == 0)
        objc_msgSend(v118, "setApProfileID:", v121);
    }
    -[NSObject setTarget:](v195, "setTarget:", v118);
    WALogCategoryDefaultHandle();
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v118, "bssid");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend(v118, "channel");
      buf = 136446978;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      v211 = 1024;
      v212 = 682;
      v213 = 2112;
      v214[0] = v125;
      LOWORD(v214[1]) = 1024;
      *(_DWORD *)((char *)&v214[1] + 2) = v126;
      _os_log_impl(&dword_212581000, v124, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Set Roam Target BSS[%@] (chan: %d)", (uint8_t *)&buf, 0x22u);

    }
  }
  WALogCategoryDefaultHandle();
  v127 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v127))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v127, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_generateRoamMO", ", (uint8_t *)&buf, 2u);
  }

  if (!v200)
  {
    v130 = 0;
    goto LABEL_74;
  }
  -[AnalyticsProcessor managedObjectHandler](v75, "managedObjectHandler");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "managedObjectContext");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v93, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v130)
  {
    WALogCategoryDefaultHandle();
    v161 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
    {
      buf = 136446722;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      v211 = 1024;
      v212 = 689;
      v213 = 2112;
      v214[0] = v93;
      _os_log_impl(&dword_212581000, v161, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&buf, 0x1Cu);
    }

LABEL_120:
    v130 = 0;
    v140 = 4;
    goto LABEL_88;
  }
  objc_msgSend(v130, "setAuthFlags:", v165);
  if (v200)
  {
    objc_msgSend(v130, "bss");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v131, "containsObject:", v118);

    if ((v132 & 1) == 0)
    {
      objc_msgSend(v130, "addBssObject:", v118);
      WALogCategoryDefaultHandle();
      v133 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v118, "bssid");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "ssid");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 136446978;
        v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
        v211 = 1024;
        v212 = 696;
        v213 = 2112;
        v214[0] = v134;
        LOWORD(v214[1]) = 2112;
        *(_QWORD *)((char *)&v214[1] + 2) = v135;
        _os_log_impl(&dword_212581000, v133, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Added BSS[%@] to Network[%@]", (uint8_t *)&buf, 0x26u);

      }
    }
  }
LABEL_74:
  -[AnalyticsProcessor managedObjectHandler](v75, "managedObjectHandler");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "updateManagedObjectContextWithoutSave");

  if ((_DWORD)v180)
  {
    v137 = 0;
  }
  else
  {
    -[AnalyticsProcessor roamPolicyHandler](v75, "roamPolicyHandler");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v138, "buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:", v93, v7, v75->_numRoamSamples, objc_msgSend(v130, "didDeploymentChange"));

    v137 = v139 ^ 1;
  }
  v140 = 0;
  if (v179 && (v137 & 1) == 0)
  {
    -[AnalyticsProcessor roamPolicyHandler](v75, "roamPolicyHandler");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject bssid](v83, "bssid");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v141, "buildRoamCacheInfoForNetwork:bssid:numRoamSamples:", v93, v142, v75->_numRoamSamples);

    if (v143)
    {
      -[AnalyticsProcessor roamPolicyHandler](v75, "roamPolicyHandler");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bssid](v83, "bssid");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = objc_msgSend(v144, "monitorDeploymentChanges:ssid:roamStatus:originBssid:targetBssid:", v179, v93, (int)v180, v145, v176);

      WALogCategoryDefaultHandle();
      v147 = objc_claimAutoreleasedReturnValue();
      v148 = os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG);
      if (!v146)
      {
        if (v148)
        {
          buf = 136446466;
          v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
          v211 = 1024;
          v212 = 716;
          _os_log_impl(&dword_212581000, v147, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Deployment remained intact", (uint8_t *)&buf, 0x12u);
        }

        objc_msgSend(v130, "setDidDeploymentChange:", 0);
        v140 = 0;
        v75 = v183;
        goto LABEL_88;
      }
      if (v148)
      {
        buf = 136446466;
        v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
        v211 = 1024;
        v212 = 712;
        _os_log_impl(&dword_212581000, v147, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Deployment Changed, Reset Adaptive Roaming State Machine", (uint8_t *)&buf, 0x12u);
      }

      v75 = v183;
      -[AnalyticsProcessor roamPolicyHandler](v183, "roamPolicyHandler");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bssid](v83, "bssid");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "resetAdaptiveRoamingStateMachine:bssid:", v93, v150);

      objc_msgSend(v130, "setDidDeploymentChange:", 1);
    }
    v140 = 0;
  }
LABEL_88:

  v4 = v178;
LABEL_89:
  v151 = v167;
LABEL_90:

  if (v140)
  {

    v9 = v176;
    goto LABEL_94;
  }
  -[AnalyticsProcessor managedObjectHandler](v75, "managedObjectHandler");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "saveManagedObjectContext");

  -[AnalyticsProcessor managedObjectHandler](v75, "managedObjectHandler");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "managedObjectContext");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "reset");

  v155 = v175;
  v9 = v176;
LABEL_93:

LABEL_94:
  WALogCategoryDefaultHandle();
  v156 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v156))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v156, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus", ", (uint8_t *)&buf, 2u);
  }

}

- (void)processMetricLinkChange:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  unsigned int v24;
  NSObject *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  unsigned int v31;
  int v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  AnalyticsProcessor *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  char v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  int v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  NSObject *v115;
  const __CFString *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  unsigned int v122;
  unsigned int v123;
  __int16 v124;
  id v125;
  unsigned int v126;
  int v127;
  int v128;
  id v129;
  unsigned int v130;
  id v131;
  void *v132;
  void *v133;
  void *v135;
  void *v136;
  unsigned int v137;
  unsigned int v138;
  uint64_t v139;
  uint64_t v140;
  unsigned int v141;
  id v142;
  id v143;
  id v144;
  unsigned __int8 v145;
  unsigned __int8 v146;
  uint8_t buf[4];
  const char *v148;
  __int16 v149;
  int v150;
  __int16 v151;
  _BYTE v152[10];
  uint64_t v153;
  _BYTE v154[6];
  _BYTE v155[6];
  _BYTE v156[6];
  _BYTE v157[6];
  _BYTE v158[6];
  _DWORD v159[3];
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("isLinkUp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = objc_msgSend(v4, "BOOLValue");

  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = CFSTR("NO");
    if (v141)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v148 = (const char *)v6;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkChange", "isLinkUp:%@", buf, 0xCu);
  }

  objc_msgSend(v3, "valueForKey:", CFSTR("isInVol"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("subreason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("cachedRSSI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("channel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("channelFlags"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("channelWidth"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("phyMode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("phyMode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedCharValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("networkFlags"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntValue");

  WALogCategoryDefaultHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448770;
    v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
    v149 = 1024;
    v150 = 747;
    v151 = 1024;
    *(_DWORD *)v152 = v141;
    *(_WORD *)&v152[4] = 1024;
    *(_DWORD *)&v152[6] = v8;
    LOWORD(v153) = 1024;
    *(_DWORD *)((char *)&v153 + 2) = v138;
    HIWORD(v153) = 1024;
    *(_DWORD *)v154 = v137;
    *(_WORD *)&v154[4] = 1024;
    *(_DWORD *)v155 = v14;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)v156 = v18;
    *(_WORD *)&v156[4] = 1024;
    *(_DWORD *)v157 = v20;
    *(_WORD *)&v157[4] = 1024;
    *(_DWORD *)v158 = v22;
    *(_WORD *)&v158[4] = 1024;
    v159[0] = v24;
    _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_DEBUG, "%{public}s::%d:isLinkUp:%d isInVol:%d reason:%d subreason:%d channel:%d channelWidth:%d phyMode:%d awdlState:%d - flags:%d", buf, 0x48u);
  }

  objc_msgSend(v3, "valueForKey:", CFSTR("associationDuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  objc_msgSend(v3, "valueForKey:", CFSTR("networkAuthFlags"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(v29, "unsignedCharValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("bssid"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v30))
  {
    WALogCategoryDefaultHandle();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 791;
      v151 = 2112;
      *(_QWORD *)v152 = v30;
      _os_log_impl(&dword_212581000, v113, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    goto LABEL_48;
  }
  v124 = v14;
  v31 = v16;
  v32 = v12;
  objc_msgSend(v3, "valueForKey:", CFSTR("ssid"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("apProfile"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("metricDate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  v36 = v35;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v36);
  v37 = objc_claimAutoreleasedReturnValue();
  v132 = (void *)v37;
  if (!v33)
  {
    WALogCategoryDefaultHandle();
    v117 = objc_claimAutoreleasedReturnValue();
    v38 = self;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 803;
      _os_log_impl(&dword_212581000, v117, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid is nil", buf, 0x12u);
    }

    v66 = 0;
    v57 = 0;
    v61 = 0;
    v60 = 0;
    v73 = 0;
    v97 = 4;
    goto LABEL_65;
  }
  v38 = self;
  if (!v30)
  {
    WALogCategoryDefaultHandle();
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 804;
      _os_log_impl(&dword_212581000, v118, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid is nil", buf, 0x12u);
    }

    v53 = 0;
    v57 = 0;
    v60 = 0;
    v73 = 0;
    v97 = 4;
    v66 = v33;
    v61 = 0;
    goto LABEL_46;
  }
  v39 = v37;
  if (!v37)
  {
    WALogCategoryDefaultHandle();
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 805;
      _os_log_impl(&dword_212581000, v119, OS_LOG_TYPE_ERROR, "%{public}s::%d:date nil", buf, 0x12u);
    }

    v57 = 0;
    v60 = 0;
    v73 = 0;
    v97 = 4;
    v66 = v33;
    v61 = 0;
LABEL_65:
    v53 = v30;
    goto LABEL_46;
  }
  v126 = v24;
  objc_msgSend(v3, "valueForKey:", CFSTR("ssid"));
  v140 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForKey:", CFSTR("bssid"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v40, 6);
  v139 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForKey:", CFSTR("usageRank"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "unsignedShortValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("noiHomeType"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v43, "unsignedShortValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("noiWorkType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "unsignedShortValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("loiType"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedShortValue");

  objc_msgSend(v3, "valueForKey:", CFSTR("motionState"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "unsignedIntValue");

  WALogCategoryDefaultHandle();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448514;
    v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
    v149 = 1024;
    v150 = 817;
    v151 = 2112;
    *(_QWORD *)v152 = v140;
    *(_WORD *)&v152[8] = 2112;
    v153 = v139;
    *(_WORD *)v154 = 1024;
    *(_DWORD *)&v154[2] = v130;
    *(_WORD *)v155 = 1024;
    *(_DWORD *)&v155[2] = v42;
    *(_WORD *)v156 = 1024;
    *(_DWORD *)&v156[2] = v128;
    *(_WORD *)v157 = 1024;
    *(_DWORD *)&v157[2] = v45;
    *(_WORD *)v158 = 1024;
    *(_DWORD *)&v158[2] = v47;
    LOWORD(v159[0]) = 1024;
    *(_DWORD *)((char *)v159 + 2) = v49;
    _os_log_impl(&dword_212581000, v50, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ssid:%@ bssid:%@ securityType:%d usageRank:%d noiHomeType:%d noiWorkType:%d loiType:%d motionState:%d", buf, 0x4Au);
  }

  v127 = v32;
  if (v141)
  {
    v122 = v42;
    v123 = v31;
    v146 = 0;
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "managedObjectContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v139;
    +[BSSMO generateInstance:ssid:created:moc:](BSSMO, "generateInstance:ssid:created:moc:", v139, v140, &v146, v52);
    v54 = objc_claimAutoreleasedReturnValue();

    v135 = (void *)v54;
    if (v54)
    {
      v145 = 0;
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "managedObjectContext");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[NetworkMO generateInstance:created:moc:](NetworkMO, "generateInstance:created:moc:", v140, &v145, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "managedObjectContext");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[JoinMO generateInstance:](JoinMO, "generateInstance:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(v60, "setSuccess:", 1);
          objc_msgSend(v60, "setMotionState:", (__int16)v49);
          objc_msgSend(v60, "setReason:", v138);
          objc_msgSend(v60, "setSubreason:", v137);
          objc_msgSend(v60, "setDate:", v132);
          v61 = v135;
          objc_msgSend(v135, "setLastSeen:", v132);
          objc_msgSend(v135, "setChannel:", v124);
          objc_msgSend(v135, "setChannelFlags:", v123);
          objc_msgSend(v135, "setApProfileID:", v133);
          objc_msgSend(v135, "addJoinsObject:", v60);
          WALogCategoryDefaultHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v60, "date");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "bssid");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v135, "channel");
            *(_DWORD *)buf = 136447234;
            v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
            v149 = 1024;
            v150 = 842;
            v151 = 2112;
            *(_QWORD *)v152 = v63;
            *(_WORD *)&v152[8] = 2112;
            v153 = (uint64_t)v64;
            *(_WORD *)v154 = 1024;
            *(_DWORD *)&v154[2] = v65;
            _os_log_impl(&dword_212581000, v62, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Join at [%@] to BSS[%@] (chan: %d)", buf, 0x2Cu);

            v61 = v135;
          }

          objc_msgSend(v57, "setIsHome:", v128 == 1);
          objc_msgSend(v57, "setIsWork:", v45 == 1);
          objc_msgSend(v57, "setUsageRank:", v122);
          objc_msgSend(v57, "setAuthFlags:", v130);
          v38 = self;
          v66 = (void *)v140;
          if (v146 | v145)
          {
            objc_msgSend(v57, "bss");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "containsObject:", v61);

            if ((v68 & 1) == 0)
            {
              objc_msgSend(v57, "addBssObject:", v61);
              WALogCategoryDefaultHandle();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v61, "bssid");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "ssid");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446978;
                v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
                v149 = 1024;
                v150 = 852;
                v151 = 2112;
                *(_QWORD *)v152 = v70;
                *(_WORD *)&v152[8] = 2112;
                v153 = (uint64_t)v71;
                _os_log_impl(&dword_212581000, v69, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added BSS[%@] to Network[%@] with securityType", buf, 0x26u);

                v61 = v135;
              }

            }
          }
          -[AnalyticsProcessor roamPolicyHandler](self, "roamPolicyHandler");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:", v140, v139, self->_numRoamSamples, objc_msgSend(v57, "didDeploymentChange"));

          v73 = 0;
LABEL_33:
          -[AnalyticsProcessor linkChangePolicyHandler](v38, "linkChangePolicyHandler");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setLinkChange:ssid:bssid:reason:subReason:rssi:", v141, v66, v53, v138, v137, v127);

          if ((v141 & 1) == 0)
          {
            -[AnalyticsProcessor managedObjectHandler](v38, "managedObjectHandler");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "managedObjectContext");
            v100 = v53;
            v101 = v61;
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            +[SessionMO addMostRecentSession:moc:](SessionMO, "addMostRecentSession:moc:", v66, v102);

            v61 = v101;
            v53 = v100;

          }
          -[AnalyticsProcessor managedObjectHandler](v38, "managedObjectHandler");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "updateManagedObjectContextWithoutSave");

          if (v57)
          {
            -[AnalyticsProcessor managedObjectHandler](v38, "managedObjectHandler");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v126);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setNetworkManagedObjectPropertyValueForKeyWithoutSave:forKey:withValue:", v57, CFSTR("NetworkSummaryNetworkFlags"), v105);

          }
          if ((v141 & 1) != 0)
          {
            v97 = 0;
          }
          else
          {
            v106 = v61;
            objc_msgSend(v61, "apid");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = v107;
            if (v107
              && (objc_msgSend(v107, "UUIDString"),
                  v109 = (void *)objc_claimAutoreleasedReturnValue(),
                  v109,
                  v109))
            {
              objc_msgSend(v108, "UUIDString");
              v110 = objc_claimAutoreleasedReturnValue();
              -[AnalyticsProcessor deploymentMetricHandler](v38, "deploymentMetricHandler");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:", v66, v110, -[AnalyticsProcessor deploymentMetricDiffDays](v38, "deploymentMetricDiffDays"));

            }
            else
            {
              WALogCategoryDefaultHandle();
              v110 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136446722;
                v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
                v149 = 1024;
                v150 = 1013;
                v151 = 2112;
                *(_QWORD *)v152 = v66;
                _os_log_impl(&dword_212581000, v110, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Deployment uuid not set for %@", buf, 0x1Cu);
              }
            }

            v97 = 0;
            v61 = v106;
            v53 = (void *)v139;
          }
          goto LABEL_46;
        }
        WALogCategoryDefaultHandle();
        v121 = objc_claimAutoreleasedReturnValue();
        v61 = v135;
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
          v149 = 1024;
          v150 = 830;
          _os_log_impl(&dword_212581000, v121, OS_LOG_TYPE_ERROR, "%{public}s::%d:joinMO nil", buf, 0x12u);
        }
        v38 = self;
        v66 = (void *)v140;
      }
      else
      {
        WALogCategoryDefaultHandle();
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
          v149 = 1024;
          v150 = 827;
          v151 = 2112;
          v66 = (void *)v140;
          *(_QWORD *)v152 = v140;
          _os_log_impl(&dword_212581000, v121, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
          v38 = self;
        }
        else
        {
          v38 = self;
          v66 = (void *)v140;
        }
        v61 = (void *)v54;
      }

      goto LABEL_83;
    }
    WALogCategoryDefaultHandle();
    v120 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)v140;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 823;
      v151 = 2112;
      *(_QWORD *)v152 = v140;
      *(_WORD *)&v152[8] = 2112;
      v153 = v139;
LABEL_70:
      _os_log_impl(&dword_212581000, v120, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", buf, 0x26u);
      goto LABEL_71;
    }
    goto LABEL_71;
  }
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "managedObjectContext");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v139;
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v139, v140, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v76)
  {
    WALogCategoryDefaultHandle();
    v120 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)v140;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 862;
      v151 = 2112;
      *(_QWORD *)v152 = v140;
      *(_WORD *)&v152[8] = 2112;
      v153 = v139;
      goto LABEL_70;
    }
LABEL_71:

    v57 = 0;
    v61 = 0;
LABEL_83:
    v60 = 0;
    v73 = 0;
    v97 = 4;
    goto LABEL_46;
  }
  v136 = v76;
  objc_msgSend(v76, "setLastSeen:", v39);
  objc_msgSend(v3, "valueForKey:", CFSTR("rssi"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v77, "count"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v39;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v77, "count"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v77, "count"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v80;
  v144 = v78;
  v142 = v81;
  v82 = -[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:](self, "unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:", v77, &v144, &v143, &v142);
  v125 = v144;

  v131 = v143;
  v129 = v142;

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "managedObjectContext");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[LeaveMO generateInstance:](LeaveMO, "generateInstance:", v84);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend(v73, "setReason:", v138);
    objc_msgSend(v73, "setSubReason:", v137);
    objc_msgSend(v73, "setMotionState:", (__int16)v49);
    objc_msgSend(v73, "setDate:", v79);
    objc_msgSend(v73, "setAssocDuration:", v28);
    v85 = v125;
    if (v82)
    {
      objc_msgSend(v73, "setHistRssi:", v125);
      objc_msgSend(v73, "setHistCca:", v131);
      objc_msgSend(v73, "setHistSnr:", v129);
    }
    objc_msgSend(v3, "valueForKey:", CFSTR("rssi"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setHistRssi:", v86);

    objc_msgSend(v3, "valueForKey:", CFSTR("txPer"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setHistTxPer:", v87);

    objc_msgSend(v3, "valueForKey:", CFSTR("txFrame"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setHistTxFrames:", v88);

    objc_msgSend(v3, "valueForKey:", CFSTR("fwTxPer"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setHistFwTxPer:", v89);

    objc_msgSend(v3, "valueForKey:", CFSTR("fwTxFrames"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setHistFwTxFrames:", v90);

    objc_msgSend(v3, "valueForKey:", CFSTR("beaconSched"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setHistBcnSched:", v91);

    objc_msgSend(v3, "valueForKey:", CFSTR("beaconsPer"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setHistBcnPer:", v92);

    objc_msgSend(v136, "addLeavesObject:", v73);
    WALogCategoryDefaultHandle();
    v93 = objc_claimAutoreleasedReturnValue();
    v38 = self;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v73, "date");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "bssid");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v136, "channel");
      *(_DWORD *)buf = 136447234;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 899;
      v151 = 2112;
      *(_QWORD *)v152 = v94;
      *(_WORD *)&v152[8] = 2112;
      v153 = (uint64_t)v95;
      *(_WORD *)v154 = 1024;
      *(_DWORD *)&v154[2] = v96;
      _os_log_impl(&dword_212581000, v93, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Leave at [%@] to BSS[%@] (chan: %d)", buf, 0x2Cu);

    }
    v97 = 0;
    v53 = (void *)v139;
    v66 = (void *)v140;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      v149 = 1024;
      v150 = 875;
      _os_log_impl(&dword_212581000, v93, OS_LOG_TYPE_ERROR, "%{public}s::%d:leaveMO nil", buf, 0x12u);
    }
    v97 = 4;
    v38 = self;
    v53 = (void *)v139;
    v66 = (void *)v140;
    v85 = v125;
  }

  v57 = 0;
  v60 = 0;
  v61 = v136;
  if (v73)
    goto LABEL_33;
  v60 = 0;
  v73 = 0;
LABEL_46:

  if (v97 == 4)
    goto LABEL_49;
  -[AnalyticsProcessor managedObjectHandler](v38, "managedObjectHandler");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "saveManagedObjectContext");

  -[AnalyticsProcessor managedObjectHandler](v38, "managedObjectHandler");
  v113 = objc_claimAutoreleasedReturnValue();
  -[NSObject managedObjectContext](v113, "managedObjectContext");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "reset");

  v30 = v53;
LABEL_48:

  v53 = v30;
LABEL_49:
  WALogCategoryDefaultHandle();
  v115 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v115))
  {
    v116 = CFSTR("NO");
    if (v141)
      v116 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v148 = (const char *)v116;
    _os_signpost_emit_with_name_impl(&dword_212581000, v115, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkChange", "isLinkUp:%@", buf, 0xCu);
  }

}

- (void)processMetricAssociationFailure:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  _BYTE v61[10];
  _BYTE v62[10];
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  NSObject *v72;
  __int16 v73;
  NSObject *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricAssociationFailure", ", buf, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("deauthReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("deauthSourceOUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v10, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKey:", CFSTR("channel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v11, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("rssi"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("bssidOUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v14, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKey:", CFSTR("security"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("metricDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v15)
  {
    if (v16)
    {
      if (v20)
      {
        v54 = (void *)v20;
        objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v23, 6);
        v24 = objc_claimAutoreleasedReturnValue();

        WALogCategoryDefaultHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136448770;
          v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
          v58 = 1024;
          v59 = 1052;
          v60 = 1024;
          *(_DWORD *)v61 = v7;
          *(_WORD *)&v61[4] = 1024;
          *(_DWORD *)&v61[6] = v9;
          *(_WORD *)v62 = 2112;
          *(_QWORD *)&v62[2] = v53;
          v63 = 1024;
          v64 = v50;
          v65 = 1024;
          v66 = v13;
          v67 = 2112;
          v68 = v52;
          v69 = 2112;
          v70 = v51;
          v71 = 2112;
          v72 = v22;
          v73 = 2112;
          v74 = v24;
          _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_DEBUG, "%{public}s::%d:err:%d deauthReason:%d deauthSourceOUI:%@ channel:%d rssi%d bssidOUI:%@ security:%@ SSID:%@ BSSID:%@", buf, 0x5Cu);
        }

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "managedObjectContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[JoinMO generateInstance:](JoinMO, "generateInstance:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[NSObject setSuccess:](v28, "setSuccess:", 0);
          -[NSObject setReason:](v28, "setReason:", v7);
          -[NSObject setSubreason:](v28, "setSubreason:", v9);
          -[NSObject setDate:](v28, "setDate:", v54);
          -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "managedObjectContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v22, v30);
          v31 = objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v55 = 0;
            -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "managedObjectContext");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            +[BSSMO generateInstance:ssid:created:moc:](BSSMO, "generateInstance:ssid:created:moc:", v24, v22, &v55, v33);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v15, "addJoinsObject:", v28);
              WALogCategoryDefaultHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                -[NSObject date](v28, "date");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "bssid");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446978;
                v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
                v58 = 1024;
                v59 = 1070;
                v60 = 2112;
                *(_QWORD *)v61 = v35;
                *(_WORD *)&v61[8] = 2112;
                *(_QWORD *)v62 = v36;
                _os_log_impl(&dword_212581000, v34, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Join at [%@] to BSS[%@]", buf, 0x26u);

              }
              if (v55)
              {
                -[NSObject bss](v31, "bss");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "containsObject:", v15);

                if ((v38 & 1) == 0)
                {
                  -[NSObject addBssObject:](v31, "addBssObject:", v15);
                  WALogCategoryDefaultHandle();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v15, "bssid");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject ssid](v31, "ssid");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136446978;
                    v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
                    v58 = 1024;
                    v59 = 1075;
                    v60 = 2112;
                    *(_QWORD *)v61 = v40;
                    *(_WORD *)&v61[8] = 2112;
                    *(_QWORD *)v62 = v41;
                    _os_log_impl(&dword_212581000, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added BSS[%@] to Network[%@]", buf, 0x26u);

                  }
                }
              }
              -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "saveManagedObjectContext");

              -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "managedObjectContext");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "reset");

              v24 = v31;
            }
            else
            {
              WALogCategoryDefaultHandle();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446978;
                v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
                v58 = 1024;
                v59 = 1067;
                v60 = 2112;
                *(_QWORD *)v61 = v22;
                *(_WORD *)&v61[8] = 2112;
                *(_QWORD *)v62 = v24;
                _os_log_impl(&dword_212581000, v49, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", buf, 0x26u);
              }

              v24 = v28;
              v15 = v31;
            }
          }
          else
          {
            WALogCategoryDefaultHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
              v58 = 1024;
              v59 = 1063;
              v60 = 2112;
              *(_QWORD *)v61 = v22;
              _os_log_impl(&dword_212581000, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
            }

            v24 = v22;
            v15 = v28;
          }
        }
        else
        {
          WALogCategoryDefaultHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
            v58 = 1024;
            v59 = 1055;
            _os_log_impl(&dword_212581000, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:joinMO nil", buf, 0x12u);
          }

          v15 = v22;
        }
        v21 = v54;
      }
      else
      {
        WALogCategoryDefaultHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
          v58 = 1024;
          v59 = 1047;
          _os_log_impl(&dword_212581000, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:date nil", buf, 0x12u);
        }

        v24 = v16;
      }
    }
    else
    {
      WALogCategoryDefaultHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
        v58 = 1024;
        v59 = 1046;
        _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid is nil", buf, 0x12u);
      }
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
      v58 = 1024;
      v59 = 1045;
      _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid is nil", buf, 0x12u);
    }
    v15 = v16;
  }

  WALogCategoryDefaultHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricAssociationFailure", ", buf, 2u);
  }

}

- (void)processMetricNetworkGeotag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  CLLocationDegrees v11;
  void *v12;
  double v13;
  CLLocationDegrees v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  CLLocationCoordinate2D v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  uint64_t i;
  void *v36;
  void *v37;
  double v38;
  double v39;
  NSObject *v40;
  id v41;
  id v42;
  double v43;
  CLLocationDegrees v44;
  CLLocationDegrees v45;
  CLLocationCoordinate2D v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  CLLocationDegrees v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  uint32_t v74;
  NSObject *v75;
  id v76;
  NSObject *v77;
  void *v78;
  AnalyticsProcessor *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t v88[128];
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  CLLocationDegrees v98;
  __int16 v99;
  CLLocationDegrees v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricNetworkGeotag", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v7, 6);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForKey:", CFSTR("latitude"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v4, "valueForKey:", CFSTR("longitude"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v4, "valueForKey:", CFSTR("metricDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v81 = (void *)v18;
  v78 = (void *)v8;
  if (!v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
      v91 = 1024;
      v92 = 1104;
      v72 = "%{public}s::%d:date nil";
      v73 = v20;
      v74 = 18;
LABEL_52:
      _os_log_impl(&dword_212581000, v73, OS_LOG_TYPE_ERROR, v72, buf, v74);
    }
LABEL_53:
    v52 = 0;
    v82 = 0;
    v67 = 0;
    goto LABEL_57;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136447490;
    v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
    v91 = 1024;
    v92 = 1106;
    v93 = 2112;
    v94 = v6;
    v95 = 2112;
    v96 = v8;
    v97 = 2048;
    v98 = v11;
    v99 = 2048;
    v100 = v14;
    _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:SSID:%@ BSSID:%@ latitude:%f longitude:%f", buf, 0x3Au);
  }

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "managedObjectContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v8, v6, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
      v91 = 1024;
      v92 = 1109;
      v93 = 2112;
      v94 = v6;
      v95 = 2112;
      v96 = v8;
      v72 = "%{public}s::%d:bssMO nil for %@[%@]";
      v73 = v20;
      v74 = 38;
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  objc_msgSend(v23, "geoTag");
  v24 = objc_claimAutoreleasedReturnValue();
  v79 = self;
  v80 = v23;
  v77 = v24;
  if (!v24)
  {
    v82 = 0;
LABEL_37:
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "managedObjectContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[GeoTagMO generateInstance:](GeoTagMO, "generateInstance:", v55);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v53, "setTaggedCount:", 0);
      v52 = 0;
      goto LABEL_39;
    }
    WALogCategoryDefaultHandle();
    v75 = objc_claimAutoreleasedReturnValue();
    v20 = v77;
    v67 = v80;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
      v91 = 1024;
      v92 = 1156;
      _os_log_impl(&dword_212581000, v75, OS_LOG_TYPE_ERROR, "%{public}s::%d:geotagMO nil", buf, 0x12u);
    }

    v52 = 0;
LABEL_57:
    v53 = 0;
    goto LABEL_45;
  }
  v25 = (void *)v24;
  v76 = v4;
  v26 = objc_alloc(MEMORY[0x24BDBFA78]);
  v27 = CLLocationCoordinate2DMake(v11, v14);
  v28 = (void *)objc_msgSend(v26, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v81, v27.latitude, v27.longitude, -1.0, -1.0, -1.0);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v29 = v25;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
  if (v30)
  {
    v31 = v30;
    v82 = 0;
    v32 = 0;
    v33 = *(_QWORD *)v85;
    v34 = 0.0;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v85 != v33)
          objc_enumerationMutation(v29);
        v36 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(v36, "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeIntervalSinceNow");
        v39 = v38;

        if (v39 >= -31104000.0)
        {
          if (v39 < 0.0)
          {
            v41 = v36;

            v32 = v41;
          }
          v42 = objc_alloc(MEMORY[0x24BDBFA78]);
          objc_msgSend(v36, "latitude");
          v44 = v43;
          objc_msgSend(v36, "longitude");
          v46 = CLLocationCoordinate2DMake(v44, v45);
          objc_msgSend(v36, "date");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v42, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v47, v46.latitude, v46.longitude, -1.0, -1.0, -1.0);

          objc_msgSend(v48, "distanceFromLocation:", v28);
          if (v49 <= 300.0)
          {
            v50 = v49;
            if (!v82 || v49 < v34)
            {
              v51 = v36;

              v34 = v50;
              v82 = v51;
            }
          }

        }
        else
        {
          WALogCategoryDefaultHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
            v91 = 1024;
            v92 = 1121;
            v93 = 2112;
            v94 = v36;
            _os_log_impl(&dword_212581000, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:Expired geotag %@", buf, 0x1Cu);
          }

          objc_msgSend(v83, "addObject:", v36);
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    }
    while (v31);
  }
  else
  {
    v82 = 0;
    v32 = 0;
  }

  if ((unint64_t)objc_msgSend(v29, "count") >= 5)
  {
    if (v32)
    {
      objc_msgSend(v83, "addObject:", v32);
      if (v82 == v32)
      {

        v4 = v76;
        goto LABEL_36;
      }
    }
  }

  v4 = v76;
  if (!v82)
  {
    v82 = v32;
LABEL_36:
    self = v79;
    goto LABEL_37;
  }
  v52 = v82;
  v82 = v32;
  v53 = v52;
LABEL_39:
  if (objc_msgSend(v53, "taggedCount"))
  {
    objc_msgSend(v53, "latitude");
    objc_msgSend(v53, "setLatitude:", (v11 + v56 * (double)(int)objc_msgSend(v53, "taggedCount")) / (double)(int)(objc_msgSend(v53, "taggedCount") + 1));
    objc_msgSend(v53, "longitude");
    v58 = v14 + v57 * (double)(int)objc_msgSend(v53, "taggedCount");
    v14 = v58 / (double)(int)(objc_msgSend(v53, "taggedCount") + 1);
  }
  else
  {
    objc_msgSend(v53, "setLatitude:", v11);
  }
  objc_msgSend(v53, "setLongitude:", v14);
  objc_msgSend(v53, "setTaggedCount:", objc_msgSend(v53, "taggedCount") + 1);
  objc_msgSend(v53, "setDate:", v81);
  objc_msgSend(v80, "removeGeoTag:", v83);
  objc_msgSend(v80, "addGeoTagObject:", v53);
  WALogCategoryDefaultHandle();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v53, "latitude");
    v61 = v60;
    objc_msgSend(v53, "longitude");
    v63 = v62;
    objc_msgSend(v80, "bssid");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136447234;
    v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
    v91 = 1024;
    v92 = 1172;
    v93 = 2048;
    v94 = v61;
    v95 = 2048;
    v96 = v63;
    v97 = 2112;
    v98 = *(double *)&v64;
    _os_log_impl(&dword_212581000, v59, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Geotag at (lat:%f long:%f) to BSS[%@]", buf, 0x30u);

  }
  -[AnalyticsProcessor managedObjectHandler](v79, "managedObjectHandler");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "managedObjectContext");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:](NetworkMO, "classifyTraitsForNetwork:distanceFilter:moc:", v6, v66, 4000.0);

  v67 = v80;
  -[AnalyticsProcessor managedObjectHandler](v79, "managedObjectHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "saveManagedObjectContext");

  -[AnalyticsProcessor managedObjectHandler](v79, "managedObjectHandler");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "managedObjectContext");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "reset");

  v20 = v77;
LABEL_45:

  WALogCategoryDefaultHandle();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v71))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v71, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricNetworkGeotag", ", buf, 2u);
  }

}

- (void)processMetricClientAssociation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _BYTE v33[20];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricClientAssociation", ", (uint8_t *)&v26, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("networkAuthFlags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedCharValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("switchedFromNetworkSSID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("networkAuthFlags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "unsignedCharValue");
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v26 = 136447490;
    v27 = "-[AnalyticsProcessor processMetricClientAssociation:]";
    v28 = 1024;
    v29 = 1195;
    v30 = 2112;
    v31 = v6;
    v32 = 1024;
    *(_DWORD *)v33 = v8;
    *(_WORD *)&v33[4] = 2112;
    *(_QWORD *)&v33[6] = v9;
    *(_WORD *)&v33[14] = 1024;
    *(_DWORD *)&v33[16] = v11;
    _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:SSID: %@ securityType: %d prevSsid: %@ prevSecurityType: %d", (uint8_t *)&v26, 0x32u);
  }

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v9)
    {
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v9, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "setSwitchedAwayFromCount:", objc_msgSend(v18, "switchedAwayFromCount") + 1);
        objc_msgSend(v15, "setSwitchedToCount:", objc_msgSend(v15, "switchedToCount") + 1);
        WALogCategoryDefaultHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v20 = objc_msgSend(v15, "switchedToCount");
          v21 = objc_msgSend(v18, "switchedAwayFromCount");
          v26 = 136447490;
          v27 = "-[AnalyticsProcessor processMetricClientAssociation:]";
          v28 = 1024;
          v29 = 1211;
          v30 = 2112;
          v31 = v6;
          v32 = 2048;
          *(_QWORD *)v33 = v20;
          *(_WORD *)&v33[8] = 2112;
          *(_QWORD *)&v33[10] = v9;
          *(_WORD *)&v33[18] = 2048;
          v34 = v21;
          _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:SSID: %@ switchedTo: %lu SSID: %@ switchedAway: %lu", (uint8_t *)&v26, 0x3Au);
        }

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "saveManagedObjectContext");

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "managedObjectContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "reset");

      }
    }
  }
  WALogCategoryDefaultHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricClientAssociation", ", (uint8_t *)&v26, 2u);
  }

}

- (void)processMetricParsedBeaconInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricParsedBeaconInfo", ", (uint8_t *)&v22, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v7, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v8, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("ssid"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("bssid"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("scanBssidList"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("scanDirected"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("age"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("rssi"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("snr"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("channel"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("channelFlags"));
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", CFSTR("noise"));
    objc_msgSend(v11, "parsedBeacon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "parsedBeacon");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToDictionary:", v12) & 1) != 0)
      {
        v15 = 0;
LABEL_12:

        WALogCategoryDefaultHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v23 = "-[AnalyticsProcessor processMetricParsedBeaconInfo:]";
          v24 = 1024;
          v20 = "Did not update";
          v25 = 1269;
          v22 = 136447234;
          v26 = 2080;
          if (v15)
            v20 = "Updated";
          v27 = v20;
          v28 = 2112;
          v29 = v6;
          v30 = 2112;
          v31 = v8;
          _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%s for ssid:%@ bssid:%@", (uint8_t *)&v22, 0x30u);
        }

        goto LABEL_17;
      }
      WALogCategoryDefaultHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v22 = 136446466;
        v23 = "-[AnalyticsProcessor processMetricParsedBeaconInfo:]";
        v24 = 1024;
        v25 = 1255;
        _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:existing dictionary doesn't match.. overwriting", (uint8_t *)&v22, 0x12u);
      }

      objc_msgSend(v11, "setParsedBeacon:", v12);
    }
    else
    {
      objc_msgSend(v11, "setParsedBeacon:", v12);
    }
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveManagedObjectContext");

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reset");

    v15 = 1;
    goto LABEL_12;
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v22 = 136446978;
    v23 = "-[AnalyticsProcessor processMetricParsedBeaconInfo:]";
    v24 = 1024;
    v25 = 1235;
    v26 = 2112;
    v27 = (const char *)v6;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", (uint8_t *)&v22, 0x26u);
  }
LABEL_17:

  WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v21))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricParsedBeaconInfo", ", (uint8_t *)&v22, 2u);
  }

}

- (void)processMetricHistoricalNetworkQuality:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricHistoricalNetworkQuality", ", buf, 2u);
  }

  objc_msgSend(v3, "valueForKey:", CFSTR("networkHistoricalQuality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
      v38 = 1024;
      v39 = 1280;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidAndQualityArr nil", buf, 0x12u);
    }
    goto LABEL_26;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v5;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (!v8)
    goto LABEL_26;
  v9 = v8;
  v28 = v6;
  v29 = v3;
  v10 = *(_QWORD *)v33;
  obj = v7;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v12, "objectForKey:", CFSTR("ssid"), v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("ssid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        WALogCategoryDefaultHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
          v38 = 1024;
          v39 = 1284;
          v26 = "%{public}s::%d:ssid nil";
LABEL_23:
          _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x12u);
        }
LABEL_24:
        v3 = v29;
LABEL_25:
        v6 = v28;

        v7 = obj;
        goto LABEL_26;
      }
      objc_msgSend(v12, "objectForKey:", CFSTR("isTCPGood"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        WALogCategoryDefaultHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
          v38 = 1024;
          v39 = 1285;
          v26 = "%{public}s::%d:isTCPGood nil";
          goto LABEL_23;
        }
        goto LABEL_24;
      }
      objc_msgSend(v12, "objectForKey:", CFSTR("isTCPGood"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      WALogCategoryDefaultHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446978;
        v19 = CFSTR("bad");
        if ((_DWORD)v17)
          v19 = CFSTR("good");
        v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
        v38 = 1024;
        v39 = 1289;
        v40 = 2112;
        v41 = v13;
        v42 = 2112;
        v43 = v19;
        _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@ is known %@", buf, 0x26u);
      }

      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "managedObjectContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v13, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        WALogCategoryDefaultHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        v3 = v29;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
          v38 = 1024;
          v39 = 1292;
          v40 = 2112;
          v41 = v13;
          _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
        }
        goto LABEL_25;
      }
      objc_msgSend(v22, "setIsTCPGood:", v17);

    }
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v9)
      continue;
    break;
  }

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "saveManagedObjectContext");

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSObject managedObjectContext](v7, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "reset");

  v6 = v28;
  v3 = v29;
LABEL_26:

  WALogCategoryDefaultHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricHistoricalNetworkQuality", ", buf, 2u);
  }

}

- (void)processMetricBeaconCache:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  NSObject *v53;
  const char *v54;
  NSObject *v55;
  uint32_t v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  _BYTE v84[10];
  __int16 v85;
  NSObject *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricBeaconCache", ", buf, 2u);
  }

  objc_msgSend(v3, "valueForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v6, 6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForKey:", CFSTR("metricDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    *(_DWORD *)buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    v79 = 1024;
    v80 = 1322;
    v52 = "%{public}s::%d:date nil";
LABEL_63:
    _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, v52, buf, 0x12u);
    goto LABEL_56;
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("beaconCacheResults"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    *(_DWORD *)buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    v79 = 1024;
    v80 = 1325;
    v52 = "%{public}s::%d:beaconCacheResults nil";
    goto LABEL_63;
  }
  v11 = v10;
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    v79 = 1024;
    v80 = 1326;
    v54 = "%{public}s::%d:ssid nil";
LABEL_70:
    v55 = v53;
    v56 = 18;
LABEL_73:
    _os_log_impl(&dword_212581000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
    goto LABEL_74;
  }
  if (!v61)
  {
    WALogCategoryDefaultHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    v79 = 1024;
    v80 = 1327;
    v54 = "%{public}s::%d:bssid nil";
    goto LABEL_70;
  }
  if ((unint64_t)-[NSObject count](v10, "count") <= 1)
  {
    WALogCategoryDefaultHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    v79 = 1024;
    v80 = 1328;
    v54 = "%{public}s::%d:Not enough results";
    goto LABEL_70;
  }
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v61, v5, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    WALogCategoryDefaultHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
      v79 = 1024;
      v80 = 1331;
      v81 = 2112;
      v82 = v5;
      v83 = 2112;
      *(_QWORD *)v84 = v61;
      v54 = "%{public}s::%d:bssMO nil for %@[%@]";
      v55 = v53;
      v56 = 38;
      goto LABEL_73;
    }
LABEL_74:

    v14 = v11;
    goto LABEL_56;
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("channel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("channel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setChannel:](v14, "setChannel:", (__int16)objc_msgSend(v16, "unsignedIntValue"));

  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("bssid"), v61);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject filteredArrayUsingPredicate:](v11, "filteredArrayUsingPredicate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") != 1)
  {
    WALogCategoryDefaultHandle();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
      v79 = 1024;
      v80 = 1340;
      _os_log_impl(&dword_212581000, v57, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find connected Bssid in the scan results", buf, 0x12u);
    }

    goto LABEL_56;
  }
  v59 = v5;
  v60 = v17;
  v64 = v14;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v18;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v74 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "valueForKey:", CFSTR("rssi"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          WALogCategoryDefaultHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
            v79 = 1024;
            v80 = 1345;
            _os_log_impl(&dword_212581000, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:rssiRes for connected Bssid nil", buf, 0x12u);
          }

          goto LABEL_43;
        }
        v24 = v23;
        v25 = objc_msgSend(v23, "intValue");

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
    }
    while (v20);
    v58 = v3;
  }
  else
  {
    v58 = v3;
    v25 = 0;
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v62 = v11;
  v66 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
  if (!v66)
    goto LABEL_39;
  v65 = *(_QWORD *)v70;
  while (2)
  {
    for (j = 0; j != v66; ++j)
    {
      if (*(_QWORD *)v70 != v65)
        objc_enumerationMutation(v62);
      v27 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
      objc_msgSend(v27, "valueForKey:", CFSTR("rssi"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "valueForKey:", CFSTR("ssid"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "valueForKey:", CFSTR("channel"));
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "valueForKey:", CFSTR("bssid"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AnalyticsProcessor formattedNotation:octetCount:](self, "formattedNotation:octetCount:", v31, 6);
      v32 = objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        WALogCategoryDefaultHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          v79 = 1024;
          v80 = 1356;
          _os_log_impl(&dword_212581000, v49, OS_LOG_TYPE_ERROR, "%{public}s::%d:rssiRes nil", buf, 0x12u);
        }

        v50 = v32;
        goto LABEL_54;
      }
      if (!v29)
      {
        WALogCategoryDefaultHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          v79 = 1024;
          v80 = 1357;
          _os_log_impl(&dword_212581000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidRes nil", buf, 0x12u);
        }
        v29 = v30;
        goto LABEL_55;
      }
      if (!v30)
      {
        WALogCategoryDefaultHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          v79 = 1024;
          v80 = 1358;
          _os_log_impl(&dword_212581000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:chanRes nil", buf, 0x12u);
        }
        goto LABEL_55;
      }
      if (!v32)
      {
        WALogCategoryDefaultHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          v79 = 1024;
          v80 = 1359;
          _os_log_impl(&dword_212581000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidRes nil", buf, 0x12u);
        }
LABEL_54:
        v32 = v30;
LABEL_55:
        v3 = v58;
        v5 = v59;
        v14 = v64;

        goto LABEL_56;
      }
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "managedObjectContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v32, v29, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v27, "valueForKey:", CFSTR("channel"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v27, "valueForKey:", CFSTR("channel"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setChannel:", (__int16)objc_msgSend(v37, "unsignedIntValue"));

        }
        WALogCategoryDefaultHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = -[NSObject channel](v64, "channel");
          v40 = objc_msgSend(v35, "channel");
          v41 = objc_msgSend(v28, "intValue");
          *(_DWORD *)buf = 136448002;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          v79 = 1024;
          v80 = 1371;
          v81 = 2112;
          v82 = v61;
          v83 = 1024;
          *(_DWORD *)v84 = v39;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v25;
          v85 = 2112;
          v86 = v32;
          v87 = 1024;
          v88 = v40;
          v89 = 1024;
          v90 = v41;
          _os_log_impl(&dword_212581000, v38, OS_LOG_TYPE_DEBUG, "%{public}s::%d:origin %@(chan: %d) rssi %d neighbor %@(chan: %d) rssi %d", buf, 0x3Eu);
        }

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "managedObjectContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[ScanMO generateInstance:](ScanMO, "generateInstance:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "setOriginRssi:", (__int16)v25);
        objc_msgSend(v44, "setResultRssi:", (__int16)objc_msgSend(v28, "intValue"));
        objc_msgSend(v44, "setOrigin:", v64);
        objc_msgSend(v44, "setResult:", v35);
        objc_msgSend(v44, "setDate:", v63);

      }
    }
    v66 = -[NSObject countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
    if (v66)
      continue;
    break;
  }
LABEL_39:

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "saveManagedObjectContext");

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "managedObjectContext");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "reset");

  v3 = v58;
LABEL_43:
  v5 = v59;
  v14 = v64;
LABEL_56:

  WALogCategoryDefaultHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricBeaconCache", ", buf, 2u);
  }

}

- (void)processMetricFault:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  AnalyticsProcessor *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricFault", ", buf, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("interface"));
    v7 = objc_claimAutoreleasedReturnValue();
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v50 = "-[AnalyticsProcessor processMetricFault:]";
      v51 = 1024;
      v52 = 1408;
      v53 = 2112;
      v54 = v6;
      v55 = 2112;
      v56 = v7;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Processing Fault %@, Interface %@", buf, 0x26u);
    }

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FaultMO generateInstance:](FaultMO, "generateInstance:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "setType:", v6);
      if (v7)
        objc_msgSend(v11, "setInterface:", v7);
      objc_msgSend(v4, "valueForKey:", CFSTR("date"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v4, "valueForKey:", CFSTR("date"));
      else
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDate:", v13);

      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "managedObjectContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[JoinMO mostRecentJoin:ssid:moc:](JoinMO, "mostRecentJoin:ssid:moc:", 0, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (!v16)
      {
        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          v50 = "-[AnalyticsProcessor processMetricFault:]";
          v51 = 1024;
          v52 = 1441;
          _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No joinMO found", buf, 0x12u);
        }
        goto LABEL_21;
      }
      v46 = v7;
      v47 = v6;
      v48 = v4;
      if (v18)
      {
        objc_msgSend(v16, "bss");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "network");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ssid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bss");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bssid");
        v23 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v50 = "-[AnalyticsProcessor processMetricFault:]";
        v51 = 1024;
        v52 = 1432;
        v53 = 2112;
        v54 = v21;
        v55 = 2112;
        v56 = v23;
        _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding BSSMO for ssid %@ bssid %@", buf, 0x26u);

      }
      objc_msgSend(v16, "bss");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bssid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v16;
      objc_msgSend(v16, "bss");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "network");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ssid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = self;
      -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "managedObjectContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v25, v28, v30);
      v17 = objc_claimAutoreleasedReturnValue();

      WALogCategoryDefaultHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v17)
      {
        v7 = v46;
        v6 = v47;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v50 = "-[AnalyticsProcessor processMetricFault:]";
          v51 = 1024;
          v52 = 1437;
          _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Associating Fault to mostRecentJoin", buf, 0x12u);
        }

        -[NSObject addFaultsObject:](v17, "addFaultsObject:", v11);
        v4 = v48;
        self = v44;
        v16 = v45;
LABEL_21:

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "saveManagedObjectContext");

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "managedObjectContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "reset");

        goto LABEL_22;
      }
      v6 = v47;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v45, "bss");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "network");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "ssid");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "bss");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bssid");
        v43 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v50 = "-[AnalyticsProcessor processMetricFault:]";
        v51 = 1024;
        v52 = 1435;
        v53 = 2112;
        v54 = v41;
        v55 = 2112;
        v56 = v43;
        _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMo nil for %@[%@]", buf, 0x26u);

      }
      v4 = v48;
      v7 = v46;
    }
    else
    {
      WALogCategoryDefaultHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v50 = "-[AnalyticsProcessor processMetricFault:]";
        v51 = 1024;
        v52 = 1411;
        v53 = 2112;
        v54 = v6;
        _os_log_impl(&dword_212581000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create new FaultMO %@", buf, 0x1Cu);
      }

    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v50 = "-[AnalyticsProcessor processMetricFault:]";
      v51 = 1024;
      v52 = 1404;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to retrieve kWAMessageKeyFaultName", buf, 0x12u);
    }
  }
LABEL_22:

  WALogCategoryDefaultHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v50 = "-[AnalyticsProcessor processMetricFault:]";
    v51 = 1024;
    v52 = 1452;
    _os_log_impl(&dword_212581000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  WALogCategoryDefaultHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricFault", ", buf, 2u);
  }

}

- (void)processMetricRecovery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRecovery", ", buf, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("recoveryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    v35 = "-[AnalyticsProcessor processMetricRecovery:]";
    v36 = 1024;
    v37 = 1476;
    v30 = "%{public}s::%d:failed to retrieve kWAMessageKeyRecoveryType";
LABEL_35:
    _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, v30, buf, 0x12u);
    goto LABEL_26;
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("recoveryReason"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    v35 = "-[AnalyticsProcessor processMetricRecovery:]";
    v36 = 1024;
    v37 = 1479;
    v30 = "%{public}s::%d:failed to retrieve kWAMessageKeyRecoveryReason";
    goto LABEL_35;
  }
  v8 = v7;
  objc_msgSend(v4, "valueForKey:", CFSTR("apple80211Return"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v35 = "-[AnalyticsProcessor processMetricRecovery:]";
      v36 = 1024;
      v37 = 1487;
      v38 = 2112;
      v39 = v6;
      v40 = 2112;
      v41 = v8;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Processing Recovery type %@ reason %@ ", buf, 0x26u);
    }

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RecoveryMO generateInstance:](RecoveryMO, "generateInstance:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "setRecoveryType:", v6);
      objc_msgSend(v16, "setRecoveryReason:", v8);
      objc_msgSend(v16, "setApple80211Return:", objc_msgSend(v10, "intValue"));
      objc_msgSend(v4, "valueForKey:", CFSTR("date"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        objc_msgSend(v4, "valueForKey:", CFSTR("date"));
      else
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDate:", v18);

      WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v33 = v6;
      if (v11 && v12)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          v35 = "-[AnalyticsProcessor processMetricRecovery:]";
          v36 = 1024;
          v37 = 1503;
          v38 = 2112;
          v39 = v12;
          v40 = 2112;
          v41 = v11;
          _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding BSSMO for ssid %@ bssid %@", buf, 0x26u);
        }

        -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "managedObjectContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v11, v12, v22);
        v23 = objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          WALogCategoryDefaultHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v35 = "-[AnalyticsProcessor processMetricRecovery:]";
            v36 = 1024;
            v37 = 1510;
            _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Associating Recovery to BSS", buf, 0x12u);
          }

          -[NSObject addRecoveriesObject:](v23, "addRecoveriesObject:", v16);
LABEL_25:

          -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "saveManagedObjectContext");

          -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "managedObjectContext");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "reset");

          v6 = v33;
          goto LABEL_26;
        }
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v35 = "-[AnalyticsProcessor processMetricRecovery:]";
          v36 = 1024;
          v37 = 1506;
          _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Insufficient info to associate recovery to bss, leaving unlinked", buf, 0x12u);
        }

      }
      WALogCategoryDefaultHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v35 = "-[AnalyticsProcessor processMetricRecovery:]";
        v36 = 1024;
        v37 = 1514;
        _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No bssMo found", buf, 0x12u);
      }
      goto LABEL_25;
    }
    WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "-[AnalyticsProcessor processMetricRecovery:]";
      v36 = 1024;
      v37 = 1490;
      _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create new RecoveryMO", buf, 0x12u);
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "-[AnalyticsProcessor processMetricRecovery:]";
      v36 = 1024;
      v37 = 1482;
      _os_log_impl(&dword_212581000, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to retrieve kWAMessageKeyApple80211Return", buf, 0x12u);
    }

    v11 = v8;
  }
LABEL_26:

  WALogCategoryDefaultHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v35 = "-[AnalyticsProcessor processMetricRecovery:]";
    v36 = 1024;
    v37 = 1525;
    _os_log_impl(&dword_212581000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  WALogCategoryDefaultHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRecovery", ", buf, 2u);
  }

}

- (void)processMetricLinkTest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  AnalyticsProcessor *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkTest", ", buf, 2u);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("bssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("ssid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[LinkTestMO generateInstance:](LinkTestMO, "generateInstance:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributesByName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v7;
    v39 = self;
    if (v13)
      objc_msgSend(v4, "valueForKey:", CFSTR("date"));
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(v10, "setDate:", v14, v11);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            WALogCategoryDefaultHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446978;
              v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
              v46 = 1024;
              v47 = 1567;
              v48 = 2112;
              v49 = v21;
              v50 = 2112;
              v51 = v23;
              _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Storing linkTest key %@ value %@ to linkTestMo", buf, 0x26u);
            }

            objc_msgSend(v15, "setValue:forKey:", v23, v21);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v18);
    }

    WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v7 = v38;
    if (v6 && v38)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
        v46 = 1024;
        v47 = 1572;
        v48 = 2112;
        v49 = v38;
        v50 = 2112;
        v51 = v6;
        _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding BSSMO for ssid %@ bssid %@", buf, 0x26u);
      }

      -[AnalyticsProcessor managedObjectHandler](v39, "managedObjectHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "managedObjectContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v6, v38, v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v10 = v15;
      if (v29)
      {
        WALogCategoryDefaultHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v37;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
          v46 = 1024;
          v47 = 1580;
          _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Associating LinkTest to BSS", buf, 0x12u);
        }

        -[NSObject addLinkTestsObject:](v29, "addLinkTestsObject:", v15);
LABEL_31:

        -[AnalyticsProcessor managedObjectHandler](v39, "managedObjectHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "saveManagedObjectContext");

        -[AnalyticsProcessor managedObjectHandler](v39, "managedObjectHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "managedObjectContext");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "reset");

        goto LABEL_32;
      }
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
        v46 = 1024;
        v47 = 1576;
        _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Insufficient info to associate recovery to bss, leaving unlinked", buf, 0x12u);
      }

      v10 = v15;
    }
    WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v31 = v37;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
      v46 = 1024;
      v47 = 1584;
      _os_log_impl(&dword_212581000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No bssMo found", buf, 0x12u);
    }
    goto LABEL_31;
  }
  WALogCategoryDefaultHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
    v46 = 1024;
    v47 = 1550;
    _os_log_impl(&dword_212581000, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create new LinkTestMO", buf, 0x12u);
  }
LABEL_32:

  WALogCategoryDefaultHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
    v46 = 1024;
    v47 = 1595;
    _os_log_impl(&dword_212581000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  WALogCategoryDefaultHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkTest", ", buf, 2u);
  }

}

- (void)processMetricWiFiStats:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricWiFiStats", ", buf, 2u);
  }

  if (v4)
  {
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiStatMO generateInstance:](WiFiStatMO, "generateInstance:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject entity](v8, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributesByName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "valueForKey:", CFSTR("date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v4, "valueForKey:", CFSTR("date"));
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setDate:](v8, "setDate:", v13);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsObject:", v19, (_QWORD)v26))
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setValue:forKey:](v8, "setValue:forKey:", v20, v19);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "saveManagedObjectContext");

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reset");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[AnalyticsProcessor processMetricWiFiStats:]";
      v33 = 1024;
      v34 = 1608;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:bad metricData", buf, 0x12u);
    }
  }

  WALogCategoryDefaultHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v32 = "-[AnalyticsProcessor processMetricWiFiStats:]";
    v33 = 1024;
    v34 = 1638;
    _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  WALogCategoryDefaultHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricWiFiStats", ", buf, 2u);
  }

}

- (void)processMetricDiagnosticState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricDiagnosticState", ", buf, 2u);
  }

  if (v4)
  {
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticStateMO generateInstance:](DiagnosticStateMO, "generateInstance:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject entity](v8, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributesByName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "valueForKey:", CFSTR("date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v4, "valueForKey:", CFSTR("date"));
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setDate:](v8, "setDate:", v13);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsObject:", v19, (_QWORD)v26))
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setValue:forKey:](v8, "setValue:forKey:", v20, v19);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "saveManagedObjectContext");

    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reset");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[AnalyticsProcessor processMetricDiagnosticState:]";
      v33 = 1024;
      v34 = 1651;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:bad metricData", buf, 0x12u);
    }
  }

  WALogCategoryDefaultHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v32 = "-[AnalyticsProcessor processMetricDiagnosticState:]";
    v33 = 1024;
    v34 = 1681;
    _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  WALogCategoryDefaultHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricDiagnosticState", ", buf, 2u);
  }

}

- (void)ageOutAnalytics:(double)a3
{
  id v4;

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ageOutManagedObjectsOlderThan:", a3);

}

- (void)performPruneTestBSSes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__AnalyticsProcessor_performPruneTestBSSes___block_invoke;
  v8[3] = &unk_24CDDCCD0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __44__AnalyticsProcessor_performPruneTestBSSes___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pruneTestBSSes:", *(_QWORD *)(a1 + 40));

}

- (void)performPruneBasedOnStoreSizeAndSave
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__AnalyticsProcessor_performPruneBasedOnStoreSizeAndSave__block_invoke;
  v5[3] = &unk_24CDDCCF8;
  v5[4] = self;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __57__AnalyticsProcessor_performPruneBasedOnStoreSizeAndSave__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performPruneBasedOnStoreSizeAndSave");

}

- (id)summarizeAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  AnalyticsProcessor *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x212BEF45C]();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = (id)objc_opt_new();
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v25 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]";
    v26 = 1024;
    v27 = 1709;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@", buf, 0x1Cu);
  }

  if (v5)
  {
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__AnalyticsProcessor_summarizeAnalyticsForNetwork_maxAgeInDays___block_invoke;
    v14[3] = &unk_24CDDCD20;
    v15 = v5;
    v16 = self;
    v17 = &v18;
    objc_msgSend(v9, "performBlockAndWait:", v14);

  }
  WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)v19[5];
    *(_DWORD *)buf = 136446722;
    v25 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]";
    v26 = 1024;
    v27 = 1753;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Returning:%@", buf, 0x1Cu);
  }

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  objc_autoreleasePoolPop(v6);
  return v12;
}

void __64__AnalyticsProcessor_summarizeAnalyticsForNetwork_maxAgeInDays___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
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
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  NSObject *obj;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v1 = a1;
  v108 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    objc_msgSend(v5, "bss");
    obj = objc_claimAutoreleasedReturnValue();
    v80 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
    if (v80)
    {
      v77 = v5;
      v79 = *(_QWORD *)v91;
      v6 = 0x24BDD1000uLL;
      v85 = v1;
      while (2)
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v91 != v79)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          WALogCategoryDefaultHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(void **)(v1 + 32);
            objc_msgSend(v8, "bssid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446978;
            v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
            v96 = 1024;
            v97 = 1716;
            v98 = 2112;
            v99 = v10;
            v100 = 2112;
            v101 = v11;
            _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ %@", buf, 0x26u);

          }
          objc_msgSend(v8, "bssid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v81 = i;
            objc_msgSend(*(id *)(v1 + 40), "roamPolicyHandler");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(v1 + 32);
            objc_msgSend(v8, "bssid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:", v14, v15, *(_QWORD *)(*(_QWORD *)(v1 + 40) + 64), 0);

            objc_msgSend(v8, "bssid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(v1 + 32);
            objc_msgSend(*(id *)(v1 + 40), "managedObjectHandler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "managedObjectContext");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v16, v17, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              WALogCategoryDefaultHandle();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v8, "bssid");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
                v96 = 1024;
                v97 = 1724;
                v98 = 2112;
                v99 = v74;
                _os_log_impl(&dword_212581000, v73, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", buf, 0x1Cu);

              }
              goto LABEL_39;
            }
            +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v20, 0, "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            WALogCategoryDefaultHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            v82 = v21;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "bssid");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = *(void **)(v1 + 32);
              v25 = objc_msgSend(v20, "roamTriggerRssi");
              *(_DWORD *)buf = 136447234;
              v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              v96 = 1024;
              v97 = 1728;
              v98 = 2112;
              v99 = v23;
              v100 = 2112;
              v101 = v24;
              v21 = v82;
              v102 = 2048;
              v103 = (void *)v25;
              _os_log_impl(&dword_212581000, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:triggerRssi for bssid[%@] ssid[%@] : %ld", buf, 0x30u);

            }
            WALogCategoryDefaultHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "bssid");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = *(void **)(v1 + 32);
              objc_msgSend(v20, "neighborBSSIDs");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136447234;
              v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              v96 = 1024;
              v97 = 1729;
              v98 = 2112;
              v99 = v27;
              v100 = 2112;
              v101 = v28;
              v21 = v82;
              v102 = 2112;
              v103 = v29;
              _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborBSSIDs for bssid[%@] ssid[%@] : %@", buf, 0x30u);

            }
            WALogCategoryDefaultHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v20, "bssid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = *(void **)(v1 + 32);
              *(_DWORD *)buf = 136447234;
              v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              v96 = 1024;
              v97 = 1730;
              v98 = 2112;
              v99 = v31;
              v100 = 2112;
              v101 = v32;
              v102 = 2112;
              v103 = v21;
              _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborChannels for bssid[%@] ssid[%@] :%@", buf, 0x30u);

            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)objc_msgSend(v20, "roamTriggerRssi"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40);
            v35 = *(void **)(v6 + 1992);
            objc_msgSend(v20, "bssid");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("%@.triggerRSSI"), v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v37);

            objc_msgSend(v20, "neighborBSSIDs");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "componentsJoinedByString:", CFSTR(","));
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              objc_msgSend(v20, "neighborBSSIDs");
              v40 = v8;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "componentsJoinedByString:", CFSTR(","));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40);
              v44 = *(void **)(v6 + 1992);
              objc_msgSend(v20, "bssid");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "stringWithFormat:", CFSTR("%@.neighborBSSIDs"), v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v46);

              v8 = v40;
              v21 = v82;
            }
            objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40);
              v50 = *(void **)(v6 + 1992);
              objc_msgSend(v20, "bssid");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "stringWithFormat:", CFSTR("%@.neighborChannels"), v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, v52);

            }
            v53 = v20;
            WALogCategoryDefaultHandle();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136446466;
              v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              v96 = 1024;
              v97 = 1740;
              _os_log_impl(&dword_212581000, v54, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Checking for Faults", buf, 0x12u);
            }

            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            objc_msgSend(v8, "faults");
            v83 = (id)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
            if (v55)
            {
              v56 = v55;
              v57 = 0;
              v84 = *(_QWORD *)v87;
              do
              {
                v58 = 0;
                v59 = v57;
                do
                {
                  if (*(_QWORD *)v87 != v84)
                    objc_enumerationMutation(v83);
                  v60 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v58);
                  WALogCategoryDefaultHandle();
                  v61 = objc_claimAutoreleasedReturnValue();
                  v62 = v85;
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v53, "bssid");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = *(void **)(v85 + 32);
                    objc_msgSend(v60, "type");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "date");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136447490;
                    v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
                    v96 = 1024;
                    v97 = 1743;
                    v98 = 2112;
                    v99 = v63;
                    v100 = 2112;
                    v101 = v64;
                    v102 = 2112;
                    v103 = v65;
                    v104 = 2112;
                    v105 = v66;
                    _os_log_impl(&dword_212581000, v61, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Fault ssid[%@] bssid[%@] : %@ at date %@", buf, 0x3Au);

                    v62 = v85;
                  }

                  objc_msgSend(v60, "date");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = *(void **)(*(_QWORD *)(*(_QWORD *)(v62 + 48) + 8) + 40);
                  v69 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v53, "bssid");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "type");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "stringWithFormat:", CFSTR("%@.fault[%lu].%@"), v70, v59 + v58, v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "setObject:forKeyedSubscript:", v67, v72);

                  ++v58;
                }
                while (v56 != v58);
                v56 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
                v57 = v59 + v58;
              }
              while (v56);
            }

            v1 = v85;
            v6 = 0x24BDD1000;
            i = v81;
          }
        }
        v80 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
        if (v80)
          continue;
        break;
      }
LABEL_39:
      v5 = v77;
    }
    v75 = obj;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = *(void **)(v1 + 32);
      *(_DWORD *)buf = 136446722;
      v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
      v96 = 1024;
      v97 = 1713;
      v98 = 2112;
      v99 = v76;
      _os_log_impl(&dword_212581000, v75, OS_LOG_TYPE_ERROR, "%{public}s::%d:Could not find network for %@", buf, 0x1Cu);
    }
  }

}

- (void)processDatapathMetricStream:(id)a3 withDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  AnalyticsProcessor *v12;

  v6 = a3;
  v7 = a4;
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__AnalyticsProcessor_processDatapathMetricStream_withDate___block_invoke;
  v10[3] = &unk_24CDDCD48;
  v11 = v6;
  v12 = self;
  v9 = v6;
  objc_msgSend(v8, "performBlockOnManagedObjectContextForNSData:withDate:block:", v9, v7, v10);

}

uint64_t __59__AnalyticsProcessor_processDatapathMetricStream_withDate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(result + 32);
  if (v4)
    return objc_msgSend(*(id *)(result + 40), "storeMetricStreamFragment:withDate:", v4, a3);
  return result;
}

- (void)storeMetricStreamFragment:(id)a3 withDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  id v14;
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
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[MetricEntryMO metricEntryCount:moc:](MetricEntryMO, "metricEntryCount:moc:", 500, v9);

  v11 = v10 + 1;
  if (v10 + 1 >= 0x169)
  {
    v12 = v10 - 359;
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "-[AnalyticsProcessor storeMetricStreamFragment:withDate:]";
      v31 = 1024;
      v32 = 1776;
      v33 = 2048;
      v34 = v11;
      v35 = 2048;
      v36 = v12;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:metricEntryCount is %lu, deleting %lu", buf, 0x26u);
    }

    v14 = objc_alloc(MEMORY[0x24BDBB678]);
    +[MetricEntryMO entityName](MetricEntryMO, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithEntityName:", v15);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
    v28 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSortDescriptors:", v18);

    objc_msgSend(v16, "setFetchLimit:", v12);
    +[MetricEntryMO entityName](MetricEntryMO, "entityName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:](AnalyticsStoreProxy, "batchDelete:withPredicate:withFetchRequest:moc:", v19, 0, v16, v21);

  }
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "managedObjectContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MetricEntryMO generateInstance:](MetricEntryMO, "generateInstance:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setDate:", v6);
  objc_msgSend(v24, "setEventMessage:", v7);

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "saveManagedObjectContext");

  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "managedObjectContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reset");

}

- (id)apProfileForBssid:(id)a3 andSSID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  -[AnalyticsProcessor managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__AnalyticsProcessor_apProfileForBssid_andSSID___block_invoke;
  v15[3] = &unk_24CDDCD70;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v19 = &v20;
  objc_msgSend(v12, "performBlockAndWait:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __48__AnalyticsProcessor_apProfileForBssid_andSSID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a1[4])
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v16 = 136446466;
    v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
    v18 = 1024;
    v19 = 1805;
    v12 = "%{public}s::%d:bssid is nil. bailing";
LABEL_15:
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 0x12u);
    goto LABEL_8;
  }
  if (!a1[5])
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v16 = 136446466;
    v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
    v18 = 1024;
    v19 = 1806;
    v12 = "%{public}s::%d:ssid is nil. bailing";
    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", a1[4], 6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v16 = 136446466;
    v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
    v18 = 1024;
    v19 = 1809;
    v12 = "%{public}s::%d:bssidFormatted nil";
    goto LABEL_15;
  }
  v3 = v2;
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v2, a1[5], a1[6]);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSObject apProfileID](v4, "apProfileID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[NSObject apProfileID](v5, "apProfileID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1[7] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    else
    {
      WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = a1[5];
        v16 = 136446978;
        v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
        v18 = 1024;
        v19 = 1813;
        v20 = 2112;
        v21 = v3;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO.apProfileID nil for bssid:%@ and SSID:%@", (uint8_t *)&v16, 0x26u);
      }

    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[5];
      v16 = 136446978;
      v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
      v18 = 1024;
      v19 = 1812;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@ and SSID:%@", (uint8_t *)&v16, 0x26u);
    }
  }

LABEL_8:
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectHandler, a3);
}

- (LinkChangePolicyHandler)linkChangePolicyHandler
{
  return self->_linkChangePolicyHandler;
}

- (void)setLinkChangePolicyHandler:(id)a3
{
  objc_storeStrong((id *)&self->_linkChangePolicyHandler, a3);
}

- (RoamPolicyStore)roamPolicyHandler
{
  return self->_roamPolicyHandler;
}

- (void)setRoamPolicyHandler:(id)a3
{
  objc_storeStrong((id *)&self->_roamPolicyHandler, a3);
}

- (DeploymentMetricHandler)deploymentMetricHandler
{
  return self->_deploymentMetricHandler;
}

- (void)setDeploymentMetricHandler:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentMetricHandler, a3);
}

- (unint64_t)testDateDiffDays
{
  return self->_testDateDiffDays;
}

- (void)setTestDateDiffDays:(unint64_t)a3
{
  self->_testDateDiffDays = a3;
}

- (unint64_t)deploymentMetricDiffDays
{
  return self->_deploymentMetricDiffDays;
}

- (void)setDeploymentMetricDiffDays:(unint64_t)a3
{
  self->_deploymentMetricDiffDays = a3;
}

- (NSDateFormatter)dateFormatterWAMessage
{
  return self->_dateFormatterWAMessage;
}

- (void)setDateFormatterWAMessage:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatterWAMessage, a3);
}

- (unint64_t)numRoamSamples
{
  return self->_numRoamSamples;
}

- (void)setNumRoamSamples:(unint64_t)a3
{
  self->_numRoamSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterWAMessage, 0);
  objc_storeStrong((id *)&self->_deploymentMetricHandler, 0);
  objc_storeStrong((id *)&self->_roamPolicyHandler, 0);
  objc_storeStrong((id *)&self->_linkChangePolicyHandler, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
}

@end
