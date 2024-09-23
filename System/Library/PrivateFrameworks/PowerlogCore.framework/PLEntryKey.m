@implementation PLEntryKey

+ (Class)operatorClassForEntryKey:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "PLEntryKeyForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operatorClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (id)PLEntryKeyForEntryKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_PLEntryKeys, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%@"), CFSTR("Dynamic"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "rangeOfString:", v7);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E6A56538);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v9;
    }
    if (objc_msgSend(v4, "rangeOfString:", CFSTR("+")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("+"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (id)v12;
    }
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v15 = objc_msgSend(v14, "count");
    if (v15 < 3)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectAtIndex:", 0);
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectAtIndex:", 0);
      if ((unint64_t)objc_msgSend(v14, "count") < 2)
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      else
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("_"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "PLEntryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:", v16, v17, v19, v10, v8 != 0x7FFFFFFFFFFFFFFFLL);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v15 < 3)
    {
      v20 = 0;
      goto LABEL_17;
    }
    v6 = v18;
  }
  v18 = v6;
  v20 = v6;
LABEL_17:

  return v20;
}

- (Class)operatorClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (NSString)entryType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)entryName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 isDynamic:(BOOL)a6
{
  return (id)objc_msgSend(a1, "entryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:", a3, a4, a5, 0, a6);
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6 isDynamic:(BOOL)a7
{
  void *v7;
  void *v8;

  objc_msgSend(a1, "PLEntryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:", a3, a4, a5, a6, a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (id)PLEntryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6 isDynamic:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  PLEntryKey *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  id v34;
  double v35;
  id v37;
  id v38;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_PLEntryKeyForOperatorForEntryTypeForEntryName, "objectForKeyedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v14);
  v18 = (PLEntryKey *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  if (v18)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v18 = -[PLEntryKey initWithOperatorName:withEntryType:withEntryName:]([PLEntryKey alloc], "initWithOperatorName:withEntryType:withEntryName:", v12, v13, v14);
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v37 = v15;
      v38 = a1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown entryKey %@"), v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLEntryKey.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEntryKey PLEntryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v25, v26, 295);

      PLLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFileSP copyAndPrepareLog].cold.1((uint64_t)v23, v27);

      v15 = v37;
      a1 = v38;
    }
    objc_msgSend(a1, "addPLEntryKey:", v18);
    if (v7)
    {
LABEL_3:
      objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
      v19 = (void *)_PLEntryKeysDynamic;
      -[PLEntryKey entryKey](v18, "entryKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
      if (!v21)
      {
        v22 = -[PLEntryKey copyWithIsDynamic:](v18, "copyWithIsDynamic:", 1);
LABEL_15:
        v21 = v22;
        objc_msgSend(a1, "addPLEntryKey:", v22);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  if (v15)
  {
    objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
    v28 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
    -[PLEntryKey entryKey](v18, "entryKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v15);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
    if (!v21)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Aggregate")) & 1) != 0)
      {
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("_"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "count");
        objc_msgSend(v31, "objectAtIndex:", 0);
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v33 = atof((const char *)objc_msgSend(v32, "UTF8String"));

        objc_msgSend(v31, "objectAtIndex:", 1);
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = atof((const char *)objc_msgSend(v34, "UTF8String"));

        v22 = -[PLEntryKey copyWithTimeIntervalRange:](v18, "copyWithTimeIntervalRange:", v33, v35);
      }
      else
      {
        v22 = -[PLEntryKey copyWithWildCardName:](v18, "copyWithWildCardName:", v15);
      }
      goto LABEL_15;
    }
LABEL_16:

    v18 = (PLEntryKey *)v21;
  }

  return v18;
}

+ (BOOL)isEntryKeySetup:(id)a3 forOperatorName:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  +[PLEntryKey entryKeysForOperatorNameCopy:](PLEntryKey, "entryKeysForOperatorNameCopy:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

+ (id)entryKeysForOperatorNameCopy:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_entryKeysForOperator, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  return v5;
}

- (NSString)wildCardName
{
  return self->_wildCardName;
}

- (NSString)operatorName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (PLEntryKey)initWithOperatorName:(id)a3 withEntryType:(id)a4 withEntryName:(id)a5
{
  NSString *v9;
  id v10;
  id v11;
  PLEntryKey *v12;
  PLEntryKey *v13;
  uint64_t v14;
  Class operatorClass;
  uint64_t v16;
  NSString *entryKey;
  NSString *wildCardName;
  objc_super v25;

  v9 = (NSString *)a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PLEntryKey;
  v12 = -[PLEntryKey init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operatorName, a3);
    NSClassFromString(v9);
    v14 = objc_claimAutoreleasedReturnValue();
    operatorClass = v13->_operatorClass;
    v13->_operatorClass = (Class)v14;

    objc_storeStrong((id *)&v13->_entryType, a4);
    objc_storeStrong((id *)&v13->_entryName, a5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), v9, v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    entryKey = v13->_entryKey;
    v13->_entryKey = (NSString *)v16;

    objc_storeWeak((id *)&v13->_baseEntryKey, v13);
    wildCardName = v13->_wildCardName;
    v13->_wildCardName = 0;

    __asm { FMOV            V0.2D, #-1.0 }
    v13->_timeIntervalRange = _Q0;
    v13->_isDynamic = 0;
  }

  return v13;
}

+ (void)addPLEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[2];

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  if (objc_msgSend(v3, "isDynamic"))
  {
    v4 = (void *)_PLEntryKeysDynamic;
    objc_msgSend(v3, "baseEntryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v6);

  }
  else
  {
    objc_msgSend(v3, "wildCardName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "timeIntervalRange");
      if (v8 != -1.0)
      {
        objc_msgSend(v3, "timeIntervalRange");
        if (v9 != -1.0)
        {
          v10 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
          objc_msgSend(v3, "baseEntryKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "entryKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = (void *)objc_opt_new();
            v15 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
            objc_msgSend(v3, "baseEntryKey");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "entryKey");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v17);

          }
          objc_msgSend(v3, "timeIntervalRange");
          v19 = v18;
          v21 = v20;
          v22 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
          objc_msgSend(v3, "baseEntryKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "entryKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v86[0] = v19;
          v86[1] = v21;
          objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v86, "{_PLTimeIntervalRange=dd}");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v3, v26);

        }
      }
      v27 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
      objc_msgSend(v3, "baseEntryKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "entryKey");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v31 = (void *)objc_opt_new();
        v32 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
        objc_msgSend(v3, "baseEntryKey");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "entryKey");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v34);

      }
      v35 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
      objc_msgSend(v3, "baseEntryKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entryKey");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "wildCardName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v3, v38);

    }
    else
    {
      v39 = (void *)_PLEntryKeysForOperator;
      objc_msgSend(v3, "operatorName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        v42 = (void *)objc_opt_new();
        v43 = (void *)_PLEntryKeysForOperator;
        objc_msgSend(v3, "operatorName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v44);

        v45 = (void *)objc_opt_new();
        v46 = (void *)_entryKeysForOperator;
        objc_msgSend(v3, "operatorName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, v47);

      }
      v48 = (void *)_PLEntryKeysForOperator;
      objc_msgSend(v3, "operatorName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObject:", v3);

      v51 = (void *)_entryKeysForOperator;
      objc_msgSend(v3, "operatorName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryKey");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v54);

      v55 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
      objc_msgSend(v3, "operatorName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57)
      {
        v58 = (void *)objc_opt_new();
        v59 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
        objc_msgSend(v3, "operatorName");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, v60);

      }
      v61 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
      objc_msgSend(v3, "operatorName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryType");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectForKeyedSubscript:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v65)
      {
        v66 = (void *)objc_opt_new();
        v67 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
        objc_msgSend(v3, "operatorName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectForKeyedSubscript:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "entryType");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v66, v70);

      }
      v71 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
      objc_msgSend(v3, "operatorName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForKeyedSubscript:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryType");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectForKeyedSubscript:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryName");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setObject:forKeyedSubscript:", v3, v76);

      v77 = (void *)_PLEntryKeysForEntryType;
      objc_msgSend(v3, "entryType");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKeyedSubscript:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v79)
      {
        v80 = (void *)objc_opt_new();
        v81 = (void *)_PLEntryKeysForEntryType;
        objc_msgSend(v3, "entryType");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setObject:forKeyedSubscript:", v80, v82);

      }
      v83 = (void *)_PLEntryKeysForEntryType;
      objc_msgSend(v3, "entryType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "objectForKeyedSubscript:", v5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v3);
    }

  }
  v84 = (void *)_PLEntryKeys;
  objc_msgSend(v3, "entryKey");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setObject:forKeyedSubscript:", v3, v85);

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
}

+ (void)addPLEntryKeyStringToTasking:(id)a3
{
  id v3;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_PLEntryKeyStringsForTasking, "addObject:", v3);
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

}

+ (BOOL)shouldConfigureAdditionalTable:(id)a3 withType:(id)a4 withName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (+[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "objectForKey:", v8),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    +[PLEntryKey entryKeyStringForOperatorName:withType:withName:](PLEntryKey, "entryKeyStringForOperatorName:withType:withName:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
      goto LABEL_7;
    +[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_9;
    +[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (!v24)
      goto LABEL_7;
    +[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsObject:", v10);

    if (!v28)
    {
LABEL_9:
      v29 = 0;
    }
    else
    {
LABEL_7:
      objc_msgSend(a1, "addPLEntryKeyStringToTasking:", v14);
      v29 = 1;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (BOOL)shouldConfigureTable:(id)a3 withType:(id)a4 withName:(id)a5 withConfigs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  char v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!+[PLDefaults fullMode](PLDefaults, "fullMode")
    && (objc_msgSend(v13, "objectForKey:", CFSTR("TaskModeTable")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14)
    && (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TaskModeTable")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "BOOLValue"),
        v15,
        v16))
  {
    if (+[PLDefaults liteMode](PLDefaults, "liteMode"))
      v17 = 0;
    else
      v17 = objc_msgSend(a1, "shouldConfigureAdditionalTable:withType:withName:", v10, v11, v12);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

+ (void)setupEntryObjectsForOperatorClass:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  +[PLEntryDefinition entryDefinitionsForOperatorClass:](PLEntryDefinition, "entryDefinitionsForOperatorClass:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (setupEntryObjectsForOperatorClass__onceToken != -1)
    dispatch_once(&setupEntryObjectsForOperatorClass__onceToken, &__block_literal_global_26);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__11;
  v12[4] = __Block_byref_object_dispose__11;
  v13 = 0;
  -[objc_class className](a3, "className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PLEntryKey_setupEntryObjectsForOperatorClass___block_invoke_13;
  v8[3] = &unk_1E6A54A40;
  v10 = v12;
  v11 = a1;
  v7 = v6;
  v9 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  _Block_object_dispose(v12, 8);
}

uint64_t __48__PLEntryKey_setupEntryObjectsForOperatorClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  v0 = objc_opt_new();
  v1 = (void *)_PLEntryKeysForOperator;
  _PLEntryKeysForOperator = v0;

  v2 = objc_opt_new();
  v3 = (void *)_entryKeysForOperator;
  _entryKeysForOperator = v2;

  v4 = objc_opt_new();
  v5 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
  _PLEntryKeyForOperatorForEntryTypeForEntryName = v4;

  v6 = objc_opt_new();
  v7 = (void *)_PLEntryKeysForEntryType;
  _PLEntryKeysForEntryType = v6;

  v8 = objc_opt_new();
  v9 = (void *)_PLEntryKeys;
  _PLEntryKeys = v8;

  v10 = objc_opt_new();
  v11 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
  _PLEntryKeyForEntryKeyForWildCardName = v10;

  v12 = objc_opt_new();
  v13 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
  _PLEntryKeyForEntryKeyForPLTimeInterval = v12;

  v14 = objc_opt_new();
  v15 = (void *)_PLEntryKeysDynamic;
  _PLEntryKeysDynamic = v14;

  v16 = objc_opt_new();
  v17 = (void *)_PLEntryKeyStringsForTasking;
  _PLEntryKeyStringsForTasking = v16;

  return objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
}

void __48__PLEntryKey_setupEntryObjectsForOperatorClass___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  PLEntryKey *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Configs"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        if (objc_msgSend(*(id *)(a1 + 48), "shouldConfigureTable:withType:withName:withConfigs:", *(_QWORD *)(a1 + 32), v5, v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))
        {
          v17 = -[PLEntryKey initWithOperatorName:withEntryType:withEntryName:]([PLEntryKey alloc], "initWithOperatorName:withEntryType:withEntryName:", *(_QWORD *)(a1 + 32), v5, v12);
          objc_msgSend(*(id *)(a1 + 48), "addPLEntryKey:", v17);

        }
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = 0;

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

+ (id)entryKeysForOperator:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryKeysForOperatorName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryKeysForOperatorClass:(Class)a3
{
  void *v4;
  void *v5;

  -[objc_class className](a3, "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryKeysForOperatorName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryKeysForOperatorName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_entryKeysForOperator, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

  return v4;
}

+ (id)PLEntryKeysForEntryType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_PLEntryKeysForEntryType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));

  return v4;
}

+ (id)PLEntryKeyStringsForTasking
{
  id v2;

  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  v2 = (id)_PLEntryKeyStringsForTasking;
  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  return v2;
}

+ (void)PLEntryKeyStringsForTaskingReset
{
  void *v2;

  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  v2 = (void *)_PLEntryKeyStringsForTasking;
  _PLEntryKeyStringsForTasking = 0;

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
}

+ (id)PLEntryAggregateKeysForOperator:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "PLEntryAggregateKeysForOperatorName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)PLEntryAggregateKeysForOperatorClass:(Class)a3
{
  void *v4;
  void *v5;

  -[objc_class className](a3, "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "PLEntryAggregateKeysForOperatorName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)PLEntryAggregateKeysForOperatorName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  objc_msgSend((id)_PLEntryKeyForOperatorForEntryTypeForEntryName, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Aggregate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  return v6;
}

+ (id)PLEntryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5
{
  return (id)objc_msgSend(a1, "PLEntryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:", a3, a4, a5, 0, 0);
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5
{
  return (id)objc_msgSend(a1, "entryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:", a3, a4, a5, 0, 0);
}

+ (id)entryKeyStringForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), a3, a4, a5);
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6
{
  return (id)objc_msgSend(a1, "entryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:", a3, a4, a5, a6, 0);
}

+ (id)dynamicEntryKeyForEntryKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "PLEntryKeyForEntryKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operatorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryKeyForOperatorName:withType:withName:isDynamic:", v5, v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)timeintervalRangeEntryKeyForEntryKey:(id)a3 withTimeIntervalRange:(_PLTimeIntervalRange)a4
{
  double length;
  double location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend(a1, "PLEntryKeyForEntryKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(CFSTR("++entryKeyObjectsSync++"));
  v9 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
  objc_msgSend(v8, "entryKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v16 = location;
  *(double *)&v16[1] = length;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v16, "{_PLTimeIntervalRange=dd}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("++entryKeyObjectsSync++"));
  if (!v13)
  {
    v13 = (void *)objc_msgSend(v8, "copyWithTimeIntervalRange:", location, length);
    objc_msgSend(a1, "addPLEntryKey:", v13);
  }
  objc_msgSend(v13, "entryKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)operatorNameForEntryKey:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "PLEntryKeyForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operatorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)wildCardForEntryKey:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "PLEntryKeyForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wildCardName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)baseEntryKeyForEntryKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "PLEntryKeyForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseEntryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (_PLTimeIntervalRange)timeIntervalRangeForEntryKey:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _PLTimeIntervalRange result;

  objc_msgSend(a1, "PLEntryKeyForEntryKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalRange");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)setWildCardName:(id)a3
{
  NSString *v4;
  NSString *wildCardName;
  void *v6;
  NSString *v7;
  NSString *entryKey;
  id v9;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  wildCardName = self->_wildCardName;
  self->_wildCardName = v4;

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PLEntryKey entryKey](self, "entryKey");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@+%@"), v9, self->_wildCardName);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  entryKey = self->_entryKey;
  self->_entryKey = v7;

}

- (void)setIsDynamic:(BOOL)a3
{
  void *v4;
  NSString *v5;
  NSString *entryKey;
  id v7;

  self->_isDynamic = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLEntryKey entryKey](self, "entryKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v7, CFSTR("Dynamic"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  entryKey = self->_entryKey;
  self->_entryKey = v5;

}

- (void)setTimeIntervalRange:(_PLTimeIntervalRange)a3
{
  id v4;

  self->_timeIntervalRange = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f_%f"), *(_QWORD *)&a3.location, *(_QWORD *)&a3.length);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey setWildCardName:](self, "setWildCardName:", v4);

}

- (id)copyWithWildCardName:(id)a3
{
  id v4;
  PLEntryKey *v5;
  void *v6;
  void *v7;
  void *v8;
  PLEntryKey *v9;

  v4 = a3;
  v5 = [PLEntryKey alloc];
  -[PLEntryKey operatorName](self, "operatorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryType](self, "entryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryName](self, "entryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLEntryKey initWithOperatorName:withEntryType:withEntryName:](v5, "initWithOperatorName:withEntryType:withEntryName:", v6, v7, v8);

  -[PLEntryKey setWildCardName:](v9, "setWildCardName:", v4);
  -[PLEntryKey setBaseEntryKey:](v9, "setBaseEntryKey:", self);
  return v9;
}

- (id)copyWithIsDynamic:(BOOL)a3
{
  _BOOL8 v3;
  PLEntryKey *v5;
  void *v6;
  void *v7;
  void *v8;
  PLEntryKey *v9;

  v3 = a3;
  v5 = [PLEntryKey alloc];
  -[PLEntryKey operatorName](self, "operatorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryType](self, "entryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryName](self, "entryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLEntryKey initWithOperatorName:withEntryType:withEntryName:](v5, "initWithOperatorName:withEntryType:withEntryName:", v6, v7, v8);

  -[PLEntryKey setIsDynamic:](v9, "setIsDynamic:", v3);
  -[PLEntryKey setBaseEntryKey:](v9, "setBaseEntryKey:", self);
  return v9;
}

- (id)copyWithTimeIntervalRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  PLEntryKey *v6;
  void *v7;
  void *v8;
  void *v9;
  PLEntryKey *v10;

  length = a3.length;
  location = a3.location;
  v6 = [PLEntryKey alloc];
  -[PLEntryKey operatorName](self, "operatorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryType](self, "entryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryName](self, "entryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLEntryKey initWithOperatorName:withEntryType:withEntryName:](v6, "initWithOperatorName:withEntryType:withEntryName:", v7, v8, v9);

  -[PLEntryKey setTimeIntervalRange:](v10, "setTimeIntervalRange:", location, length);
  -[PLEntryKey setBaseEntryKey:](v10, "setBaseEntryKey:", self);
  return v10;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLEntryKey entryKey](self, "entryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey operatorName](self, "operatorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryType](self, "entryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey entryName](self, "entryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey wildCardName](self, "wildCardName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntryKey isDynamic](self, "isDynamic");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%p] entryKey=%@ operatorName=%@ entryType=%@ entryName=%@ wildCardName=%@ isDynamc=%@"), self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PLEntryKey)baseEntryKey
{
  return (PLEntryKey *)objc_loadWeakRetained((id *)&self->_baseEntryKey);
}

- (void)setBaseEntryKey:(id)a3
{
  objc_storeWeak((id *)&self->_baseEntryKey, a3);
}

- (_PLTimeIntervalRange)timeIntervalRange
{
  double location;
  double length;
  _PLTimeIntervalRange result;

  location = self->_timeIntervalRange.location;
  length = self->_timeIntervalRange.length;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wildCardName, 0);
  objc_storeStrong((id *)&self->_entryName, 0);
  objc_storeStrong((id *)&self->_entryType, 0);
  objc_storeStrong((id *)&self->_operatorClass, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_destroyWeak((id *)&self->_baseEntryKey);
  objc_storeStrong((id *)&self->_entryKey, 0);
}

@end
