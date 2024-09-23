@implementation PLSQLiteConnection

- (int)bindEntry:(id)a3 toPreparedStatement:(id)a4 atBindPosition:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  unsigned int v55;
  char v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v77;
  void *v78;
  int v79;
  unsigned int v80;
  int v81;
  id v82;
  int v83;
  void *v84;
  uint64_t v85;
  _QWORD block[5];
  uint8_t buf[4];
  void *v88;
  uint64_t v89;

  v5 = *(_QWORD *)&a5;
  v89 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "isPPSEnabled");
  objc_msgSend(v7, "definedKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v83 = v9;
  if (v9)
  {
    objc_msgSend(v7, "arrayKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    objc_msgSend(v7, "dynamicKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

  }
  if (objc_msgSend(v7, "entryID") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "entryID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bindValue:withFormater:atPosition:", v14, 5, v5);

    v5 = (v5 + 1);
  }
  objc_msgSend(v7, "entryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindValue:withFormater:atPosition:", v15, 2, v5);

  v16 = (v5 + 1);
  objc_msgSend(v7, "entryDefinition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = +[PLEntryDefinition isAggregateForEntryDefinition:](PLEntryDefinition, "isAggregateForEntryDefinition:", v17);

  if ((_DWORD)v15)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timeInterval"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bindValue:withFormater:atPosition:", v18, 6, (v5 + 1));

    v16 = (v5 + 2);
  }
  objc_msgSend(v7, "entryDefinition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[PLEntryDefinition overridesEntryDateForEntryDefinition:](PLEntryDefinition, "overridesEntryDateForEntryDefinition:", v19);

  if (v20)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestampLogged"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bindValue:withFormater:atPosition:", v21, 2, v16);

    v22 = (v16 + 1);
  }
  else
  {
    v22 = v16;
  }
  if (!objc_msgSend(v11, "count"))
    goto LABEL_63;
  v23 = 0;
  v84 = v8;
  v82 = v7;
  v77 = v10;
  v78 = v11;
  do
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v7, "formaterForKey:", v26);

    objc_msgSend(v7, "entryKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = +[PLUtilities logModeForEntryKey:withKey:andValue:](PLUtilities, "logModeForEntryKey:withKey:andValue:", v27, v28, v25);

    switch(v29)
    {
      case 0:
        goto LABEL_32;
      case 1:
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v30 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __67__PLSQLiteConnection_bindEntry_toPreparedStatement_atBindPosition___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v30;
          if (bindEntry_toPreparedStatement_atBindPosition__defaultOnce != -1)
            dispatch_once(&bindEntry_toPreparedStatement_atBindPosition__defaultOnce, block);
          if (bindEntry_toPreparedStatement_atBindPosition__classDebugEnabled)
          {
            v79 = v22;
            v31 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v7, "entryKey");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringWithFormat:", CFSTR("ALLOWLIST DENIED: entry = %@ key = %@ value = %@ withFormatter = %hd"), v32, v33, v25, (int)v85);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "lastPathComponent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection bindEntry:toPreparedStatement:atBindPosition:]");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v36, v37, 1295);

            PLLogCommon();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v88 = v34;
              _os_log_debug_impl(&dword_1B6AB6000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v8 = v84;
            LODWORD(v22) = v79;
          }
        }
        if ((_DWORD)v85)
        {
          if (!v83)
            goto LABEL_62;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_62;
        }
        LODWORD(v39) = v22;
        objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v7, "staticArraySizeForKey:", v40);

        if (v41 < 1)
          goto LABEL_54;
        objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
        v22 = objc_claimAutoreleasedReturnValue();
        v42 = v39 + objc_msgSend(v7, "staticArraySizeForKey:", v22) - 1;

        LODWORD(v22) = v42;
        v8 = v84;
        goto LABEL_62;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v25);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLUtilities hashString:](PLUtilities, "hashString:", v43);
        v44 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v44;
        goto LABEL_26;
      case 3:
        goto LABEL_28;
      case 4:
LABEL_26:
        if (v29 == 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v25);
          v45 = objc_claimAutoreleasedReturnValue();
          +[PLUtilities hashBundleID:](PLUtilities, "hashBundleID:", v45);
          v46 = objc_claimAutoreleasedReturnValue();

          v25 = (void *)v45;
LABEL_31:

          v25 = (void *)v46;
          goto LABEL_32;
        }
LABEL_28:
        if (v29 == 3)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v25, "lastPathComponent");
            v46 = objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          }
        }
LABEL_32:
        if ((_DWORD)v85 && (!v83 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          || (objc_msgSend(v11, "objectAtIndexedSubscript:", v23),
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              v48 = objc_msgSend(v7, "staticArraySizeForKey:", v47),
              v47,
              v48 < 1))
        {
          v39 = v22;
          objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v10, "containsObject:", v65);

          if (v66)
          {
            v8 = v84;
            LODWORD(v22) = v39;
            objc_msgSend(v84, "bindValue:withFormater:atPosition:", v25, v85, v39);
          }
          else
          {
LABEL_54:
            v8 = v84;
            LODWORD(v22) = v39;
          }
          goto LABEL_62;
        }
        objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v7, "staticArraySizeForKey:", v49);

        if ((v83 & 1) == 0)
        {
          if (!+[PLValueUtilties isFormater:validForObject:](PLValueUtilties, "isFormater:validForObject:", v85, v25))
          {
            if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
            {
              v67 = v22;
              v68 = (void *)MEMORY[0x1E0CB3940];
              v69 = objc_opt_class();
              objc_msgSend(v25, "description");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = v67;
              objc_msgSend(v68, "stringWithFormat:", CFSTR("*** formater does not match object type! (Static Array) ***\nposition=%d formater=%d class=%@ value=%@\n"), v67, v85, v69, v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "lastPathComponent");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection bindEntry:toPreparedStatement:atBindPosition:]");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v71, v73, v74, 1284);

              PLLogCommon();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v88 = v71;
                _os_log_debug_impl(&dword_1B6AB6000, v75, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v8 = v84;
              LODWORD(v22) = v81;
            }
            LODWORD(v22) = v22 + v50 - 1;
            goto LABEL_61;
          }
          objc_msgSend(v78, "objectAtIndexedSubscript:", v23);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "definitionForKey:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("TypeArrayValue"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v53, "shortValue");

        }
        if ((int)v50 < 1)
          goto LABEL_55;
        v54 = 0;
        v55 = v22;
        v56 = 0;
        v80 = v55;
        v57 = v55;
        break;
      default:
        goto LABEL_62;
    }
    do
    {
      if (objc_msgSend(v25, "count") > v54)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bindValue:withFormater:atPosition:", v58, v85, v57 + v54);
LABEL_43:

        goto LABEL_50;
      }
      if ((v56 & 1) == 0 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v59 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "entryKey");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "stringWithFormat:", CFSTR("Provided array is too short! entryKey=%@ expectedSize=%d actualSize=%lu bindPosition=%d"), v60, v50, objc_msgSend(v25, "count"), v57 + v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "lastPathComponent");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection bindEntry:toPreparedStatement:atBindPosition:]");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v58, v62, v63, 1275);

        PLLogCommon();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v58;
          _os_log_debug_impl(&dword_1B6AB6000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v56 = 1;
        v7 = v82;
        v8 = v84;
        goto LABEL_43;
      }
      v56 = 1;
LABEL_50:
      ++v54;
    }
    while (v50 != v54);
    LODWORD(v22) = v80 + v54;
    v10 = v77;
LABEL_55:
    LODWORD(v22) = v22 - 1;
LABEL_61:
    v11 = v78;
LABEL_62:

    ++v23;
    v22 = (v22 + 1);
  }
  while (objc_msgSend(v11, "count") > v23);
LABEL_63:

  return v22;
}

- (int64_t)writeEntry:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  PLSQLStatement *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  PLSQLStatement *v15;
  sqlite3 *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  _QWORD block[4];
  __CFString *v59;
  uint64_t v60;
  int v61;
  id v62;
  id v63[2];

  v4 = a3;
  objc_msgSend(v4, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PLEntryDefinition cacheSQLPrepareStatementForEntryKey:](PLEntryDefinition, "cacheSQLPrepareStatementForEntryKey:", v5);

  if (!v6)
    goto LABEL_3;
  -[PLSQLiteConnection preparedStatements](self, "preparedStatements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[PLSQLiteConnection preparedStatements](self, "preparedStatements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (PLSQLStatement *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  if (!v10)
  {
LABEL_3:
    v11 = (void *)objc_opt_new();
    objc_msgSend(v4, "entryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("INSERT INTO \"%@\" "), v12);

    v62 = 0;
    v63[0] = 0;
    -[PLSQLiteConnection buildColumnInsert:andValueInsert:forEntry:](self, "buildColumnInsert:andValueInsert:forEntry:", v63, &v62, v4);
    v13 = v63[0];
    v14 = v62;
    objc_msgSend(v11, "appendFormat:", CFSTR(" (%@) VALUES (%@);"), v13, v14);
    v61 = 0;
    v15 = [PLSQLStatement alloc];
    v16 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v15, "initWithSQLQuery:forDatabase:withDBSem:result:", v11, v16, v17, &v61);

    if (!v10 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare statement fail: entry=%@"), v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeEntry:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v19, v20, 1333);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "entryKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSQLiteConnection displaySchema:](self, "displaySchema:", v24);

    }
    if (v61 == 11)
      +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, self);
    if (v10)
      v25 = v6;
    else
      v25 = 0;
    if (v25)
    {
      -[PLSQLiteConnection preparedStatements](self, "preparedStatements");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v26);
      -[PLSQLiteConnection preparedStatements](self, "preparedStatements");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v10, v28);

      objc_sync_exit(v26);
    }

  }
  -[PLSQLiteConnection bindEntry:toPreparedStatement:atBindPosition:](self, "bindEntry:toPreparedStatement:atBindPosition:", v4, v10, 1);
  -[PLSQLiteConnection performStatement:](self, "performStatement:", v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "entryKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("writeEntry_%@"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_opt_class();
    v34 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLSQLiteConnection_writeEntry___block_invoke;
    block[3] = &unk_1E6A52828;
    v59 = CFSTR("writeEntry");
    v60 = v33;
    if (writeEntry__defaultOnce_0 != -1)
      dispatch_once(&writeEntry__defaultOnce_0, block);
    v35 = writeEntry__classDebugEnabled_0;

    if (v35)
      goto LABEL_23;
    v36 = objc_opt_class();
    v55[0] = v34;
    v55[1] = 3221225472;
    v55[2] = __33__PLSQLiteConnection_writeEntry___block_invoke_2;
    v55[3] = &unk_1E6A52828;
    v56 = v32;
    v57 = v36;
    if (writeEntry__defaultOnce_400 != -1)
      dispatch_once(&writeEntry__defaultOnce_400, v55);
    v37 = writeEntry__classDebugEnabled_401;

    if (v37)
    {
LABEL_23:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("insert_rowid=%@\nentry=%@\nstatement=%@"), v29, v4, v10);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lastPathComponent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeEntry:]");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v40, v41, 1353);

      PLLogCommon();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("insert_rowid"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "longLongValue");

    if (v45 != objc_msgSend(v4, "entryID") && objc_msgSend(v4, "entryID") != 0x8000000000000000)
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "entryKey");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("future mismatch! entryKey=%@ entryID=%lld insertID=%lld entry_addr=%p entry=%@"), v47, objc_msgSend(v4, "entryID"), v45, v4, v4);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "lastPathComponent");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeEntry:]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v50, v51, 1359);

      PLLogCommon();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    objc_msgSend(v4, "setEntryID:", v45);
    if (objc_msgSend(v4, "hasDynamicKeys"))
      -[PLSQLiteConnection writeDynamicEntries:](self, "writeDynamicEntries:", v4);
    if (objc_msgSend(v4, "hasArrayKeys"))
      -[PLSQLiteConnection writeArrayEntries:](self, "writeArrayEntries:", v4);
    objc_msgSend(v4, "setExistsInDB:", 1);
  }
  else
  {
    v45 = -1;
  }

  return v45;
}

- (NSMutableDictionary)preparedStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (id)performStatement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  PLSQLiteConnection *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = (id)objc_opt_new();
  -[PLSQLiteConnection workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__PLSQLiteConnection_performStatement___block_invoke;
  v9[3] = &unk_1E6A526C0;
  v12 = &v13;
  v6 = v4;
  v10 = v6;
  v11 = self;
  +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v5, v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  void *v2;
  void *v3;

  -[PLSQLiteConnection cachedClassName](self, "cachedClassName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (NSString)cachedClassName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)writeDynamicEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PLSQLStatement *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  char v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
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
  PLSQLiteConnection *v94;
  void *v95;
  id obj;
  void *v97;
  PLSQLStatement *v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD block[5];
  _QWORD v106[4];
  __CFString *v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t buf[4];
  void *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "isPPSEnabled"))
  {
    v94 = self;
    v97 = v4;
    objc_msgSend(v4, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition dynamicKeyConfigsForEntryKey:](PLEntryDefinition, "dynamicKeyConfigsForEntryKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v97, "dynamicKeys");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v100, "count"))
    {

LABEL_74:
      v4 = v97;
      goto LABEL_75;
    }
    -[PLSQLiteConnection preparedDynamicStatements](self, "preparedDynamicStatements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    -[PLSQLiteConnection preparedDynamicStatements](self, "preparedDynamicStatements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "entryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v7);
    if (v10)
    {
      v98 = (PLSQLStatement *)v10;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
        obj = (id)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(obj, "count") + 3;
      }
      else
      {
        obj = 0;
        v15 = 4;
      }
      v28 = v97;
      if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        goto LABEL_44;
      v29 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLSQLiteConnection_writeDynamicEntries___block_invoke_441;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v29;
      if (writeDynamicEntries__defaultOnce_439 != -1)
        dispatch_once(&writeDynamicEntries__defaultOnce_439, block);
      if (!writeDynamicEntries__classDebugEnabled_440)
        goto LABEL_44;
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v97, "entryKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("Retrieving dynamic statement for %@, bindposition count = %u"), v31, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeDynamicEntries:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v33, v34, 1534);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_43:

      v28 = v97;
LABEL_44:
      objc_msgSend(v28, "entryKey");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLEntryDefinition dynamicKeyConfigsForEntryKey:](PLEntryDefinition, "dynamicKeyConfigsForEntryKey:", v55);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLSQLiteConnection beginTransaction](v94, "beginTransaction");
      if (objc_msgSend(v100, "count"))
      {
        v56 = 0;
        do
        {
          objc_msgSend(v100, "objectAtIndexedSubscript:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "objectForKeyedSubscript:", v57);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v97, "entryKey");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "objectAtIndexedSubscript:", v56);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = +[PLUtilities shouldLogForEntryKey:withKey:andValue:](PLUtilities, "shouldLogForEntryKey:withKey:andValue:", v58, v59, v95);

          if (v60)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v97, "entryID"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v61, 5, 1);

            objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("value"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("Type"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v95, objc_msgSend(v63, "shortValue"), 2);

            objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("unit"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            if (v64)
            {
              objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("unit"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("Unit"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("unit"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Type"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v66, objc_msgSend(v68, "shortValue"), 3);

              v69 = 4;
            }
            else
            {
              v69 = 3;
            }
            objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("key"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v71 = objc_opt_isKindOfClass();

            if ((v71 & 1) != 0)
            {
              v103 = 0u;
              v104 = 0u;
              v101 = 0u;
              v102 = 0u;
              v72 = obj;
              v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
              if (v73)
              {
                v74 = *(_QWORD *)v102;
                do
                {
                  v75 = 0;
                  v76 = v69;
                  do
                  {
                    if (*(_QWORD *)v102 != v74)
                      objc_enumerationMutation(v72);
                    v77 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v75);
                    objc_msgSend(v100, "objectAtIndexedSubscript:", v56);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v78, "objectForKeyedSubscript:", v77);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v97, "entryKey");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      v81 = +[PLUtilities logModeForEntryKey:withKey:andValue:](PLUtilities, "logModeForEntryKey:withKey:andValue:", v80, v77, v79);

                      if (v81 == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        objc_msgSend(v79, "lastPathComponent");
                        v78 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v78 = v79;
                      }
                    }
                    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("key"));
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "objectForKeyedSubscript:", v77);
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("Type"));
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v78, objc_msgSend(v84, "shortValue"), v76 + v75);

                    ++v75;
                  }
                  while (v73 != v75);
                  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
                  LODWORD(v69) = v76 + v75;
                }
                while (v73);
              }
            }
            else
            {
              objc_msgSend(v100, "objectAtIndexedSubscript:", v56);
              v72 = (id)objc_claimAutoreleasedReturnValue();
              -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v72, 1, v69);
            }

            -[PLSQLiteConnection performStatement:](v94, "performStatement:", v98);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = v85;
            if ((!v85 || !objc_msgSend(v85, "count"))
              && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
            {
              v87 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v97, "entryKey");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "stringWithFormat:", CFSTR("Empty insert ID: Error while inserting dynamic entry for %@"), v88);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "lastPathComponent");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeDynamicEntries:]");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v89, v91, v92, 1579);

              PLLogCommon();
              v93 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v114 = v89;
                _os_log_debug_impl(&dword_1B6AB6000, v93, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

            }
          }

          ++v56;
        }
        while (objc_msgSend(v100, "count") > v56);
      }
      -[PLSQLiteConnection endTransaction](v94, "endTransaction");

      goto LABEL_74;
    }
    v16 = (void *)objc_opt_new();
    objc_msgSend(v97, "entryKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR("INSERT INTO \"%@_%@\" (\"FK_ID\", \"value\"), v17, CFSTR("Dynamic"));

    v18 = objc_opt_new();
    -[NSObject appendString:](v18, "appendString:", CFSTR("(?, ?"));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("unit"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v16, "appendString:", CFSTR(", \"unit\"));
      -[NSObject appendString:](v18, "appendString:", CFSTR(", ?"));
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v21 = objc_opt_isKindOfClass();

    if ((v21 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      obj = v24;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v110;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v110 != v26)
              objc_enumerationMutation(obj);
            objc_msgSend(v16, "appendFormat:", CFSTR(", \"%@\"), *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i));
            -[NSObject appendString:](v18, "appendString:", CFSTR(", ?"));
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
        }
        while (v25);
      }

    }
    else
    {
      objc_msgSend(v16, "appendString:", CFSTR(", \"key\"));
      -[NSObject appendString:](v18, "appendString:", CFSTR(", ?"));
      obj = 0;
    }
    -[NSObject appendString:](v18, "appendString:", CFSTR(")"));
    objc_msgSend(v16, "appendString:", CFSTR(") VALUES "));
    objc_msgSend(v16, "appendString:", v18);
    objc_msgSend(v16, "appendString:", CFSTR(";"));
    *(_DWORD *)buf = 0;
    v35 = [PLSQLStatement alloc];
    v36 = -[PLSQLiteConnection dbConnection](v94, "dbConnection");
    -[PLSQLiteConnection dbSem](v94, "dbSem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v35, "initWithSQLQuery:forDatabase:withDBSem:result:", v16, v36, v37, buf);

    if (v98)
    {
      -[PLSQLiteConnection preparedDynamicStatements](v94, "preparedDynamicStatements");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v38);
      -[PLSQLiteConnection preparedDynamicStatements](v94, "preparedDynamicStatements");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "entryKey");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v98, v40);

      objc_sync_exit(v38);
    }
    else
    {
      if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
LABEL_34:
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v48 = objc_opt_class();
          v106[0] = MEMORY[0x1E0C809B0];
          v106[2] = __42__PLSQLiteConnection_writeDynamicEntries___block_invoke;
          v106[3] = &unk_1E6A52828;
          v106[1] = 3221225472;
          v107 = CFSTR("writeDynamic");
          v108 = v48;
          if (writeDynamicEntries__defaultOnce != -1)
            dispatch_once(&writeDynamicEntries__defaultOnce, v106);
          v49 = writeDynamicEntries__classDebugEnabled == 0;

          if (!v49)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("writeDynamic=%@"), v16);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "lastPathComponent");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeDynamicEntries:]");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v50, v52, v53, 1523);

            PLLogCommon();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          }
        }
        if (*(_DWORD *)buf == 11)
          +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, v94);
        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare statement fail: entry=%@"), v97);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeDynamicEntries:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 1515);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v46 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v97, "entryKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("%@_%@"), v38, CFSTR("Dynamic"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSQLiteConnection displaySchema:](v94, "displaySchema:", v47);

    }
    goto LABEL_34;
  }
  -[PLSQLiteConnection writeDynamicEntriesToPPS:](self, "writeDynamicEntriesToPPS:", v4);
LABEL_75:

}

- (NSMutableDictionary)preparedDynamicStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (id)entriesForKey:(id)a3 withProperties:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  void *context;
  id v63;
  id obj;
  void *v65;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD block[4];
  __CFString *v73;
  uint64_t v74;
  _QWORD v75[4];
  __CFString *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v5 = a4;
  context = (void *)MEMORY[0x1BCC9E9B4]();
  v67 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT * "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("select"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("select"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v6, "appendString:", CFSTR(", "));
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("select"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v12);

    }
  }
  v13 = v63;
  objc_msgSend(v6, "appendFormat:", CFSTR(" FROM '%@' "), v63);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("where"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("where"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("where"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" AND "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("WHERE %@ "), v19);

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("order by"));
  v20 = objc_claimAutoreleasedReturnValue();
  v65 = v6;
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("order by"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 != v23)
    {
      objc_msgSend(v6, "appendString:", CFSTR("ORDER BY "));
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("order by"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v25;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
      if (v26)
      {
        v27 = v26;
        v28 = 1;
        v29 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v79 != v29)
              objc_enumerationMutation(obj);
            v31 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
            if ((v28 & 1) == 0)
              objc_msgSend(v65, "appendString:", CFSTR(", "));
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("order by"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "BOOLValue");
            v35 = CFSTR("ASC");
            if (v34)
              v35 = CFSTR("DESC");
            objc_msgSend(v65, "appendFormat:", CFSTR("%@ %@"), v31, v35, context);

            v28 = 0;
          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
          v28 = 0;
        }
        while (v27);
      }

      v6 = v65;
      objc_msgSend(v65, "appendString:", CFSTR(" "));
      v13 = v63;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("limit"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("limit"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("LIMIT %@ "), v37);

  }
  objc_msgSend(v6, "appendString:", CFSTR(";"));
  v38 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v39 = MEMORY[0x1E0C809B0];
  if (v38)
  {
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke;
    v75[3] = &unk_1E6A52828;
    v76 = CFSTR("entryQuery");
    v77 = objc_opt_class();
    if (entriesForKey_withProperties__defaultOnce != -1)
      dispatch_once(&entriesForKey_withProperties__defaultOnce, v75);
    v40 = entriesForKey_withProperties__classDebugEnabled;

    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlQuery=%@"), v6);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection entriesForKey:withProperties:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 1840);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v6 = v65;
    }
  }
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v39;
  block[1] = 3221225472;
  block[2] = __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke_531;
  block[3] = &unk_1E6A52828;
  v73 = CFSTR("entryQuery");
  v74 = objc_opt_class();
  if (entriesForKey_withProperties__defaultOnce_529 != -1)
    dispatch_once(&entriesForKey_withProperties__defaultOnce_529, block);
  v47 = entriesForKey_withProperties__classDebugEnabled_530;

  if (v47)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! sqlQuery=%@, results=%@"), v6, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "lastPathComponent");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection entriesForKey:withProperties:]");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v50, v51, 1843);

    PLLogCommon();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v53 = v46;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v69 != v56)
          objc_enumerationMutation(v53);
        +[PLEntry entryWithEntryKey:withData:](PLEntry, "entryWithEntryKey:withData:", v13, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setExistsInDB:", 1);
        objc_msgSend(v67, "addObject:", v58);
        if (objc_msgSend(v58, "hasDynamicKeys"))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loadDynamic"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
            -[PLSQLiteConnection loadDynamicValuesIntoEntry:](self, "loadDynamicValuesIntoEntry:", v58);
        }
        if (objc_msgSend(v58, "hasArrayKeys"))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loadDynamic"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
            -[PLSQLiteConnection loadArrayValuesIntoEntry:](self, "loadArrayValuesIntoEntry:", v58);
        }

      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    }
    while (v55);
  }

  objc_autoreleasePoolPop(context);
  return v67;
}

- (id)performQuery:(id)a3
{
  id v4;
  PLSQLStatement *v5;
  sqlite3 *v6;
  void *v7;
  PLSQLStatement *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[4];
  __CFString *v24;
  uint64_t v25;
  int v26;

  v4 = a3;
  v26 = 0;
  v5 = [PLSQLStatement alloc];
  v6 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v5, "initWithSQLQuery:forDatabase:withDBSem:result:", v4, v6, v7, &v26);

  if (!v8 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare statement fail: query=%@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection performQuery:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 986);

    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  if (v26 == 11)
    +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, self);
  -[PLSQLiteConnection performStatement:](self, "performStatement:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v15 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __35__PLSQLiteConnection_performQuery___block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v24 = CFSTR("query");
    v25 = v15;
    if (performQuery__defaultOnce != -1)
      dispatch_once(&performQuery__defaultOnce, block);
    v16 = performQuery__classDebugEnabled;

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("query=%@\nresult=%@"), v4, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection performQuery:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 993);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

  return v14;
}

void __39__PLSQLiteConnection_performStatement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void **v8;
  const __CFString **v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "perform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  if (objc_msgSend(*(id *)(a1 + 32), "isInsert"))
  {
    objc_msgSend(*(id *)(a1 + 40), "dbSem");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    v15 = CFSTR("insert_rowid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "dbConnection")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (void **)v16;
    v9 = &v15;
LABEL_5:
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "dbSem");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v12);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v11);
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isDelete"))
  {
    objc_msgSend(*(id *)(a1 + 40), "dbSem");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    v13 = CFSTR("changes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_changes((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "dbConnection")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v14;
    v9 = &v13;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "reset");
  objc_autoreleasePoolPop(v2);
}

- (OS_dispatch_semaphore)dbSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (sqlite3)dbConnection
{
  return self->_dbConnection;
}

- (void)writeArrayEntries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  signed __int16 v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  PLSQLStatement *v24;
  sqlite3 *v25;
  void *v26;
  PLSQLStatement *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  uint64_t v55;
  _QWORD block[4];
  __CFString *v57;
  uint64_t v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "entryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition arrayKeyConfigsForEntryKey:](PLEntryDefinition, "arrayKeyConfigsForEntryKey:", v4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "arrayKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v6)
  {
    v7 = v6;
    v8 = &off_1E6A51000;
    v55 = *(_QWORD *)v61;
    v50 = v5;
    do
    {
      v9 = 0;
      v51 = v7;
      do
      {
        if (*(_QWORD *)v61 != v55)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v9);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v8[72];
        objc_msgSend(v3, "entryKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "shouldLogForEntryKey:withKey:andValue:", v13, v10, v11);

        if ((_DWORD)v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v11, "count"))
            {
              v53 = v11;
              v14 = v11;
              if (objc_msgSend(v3, "isPPSEnabled"))
              {
                v15 = +[PLEntry dataFormatForMetric:auxiliaryMetrics:](PLEntry, "dataFormatForMetric:auxiliaryMetrics:", v10, v48);
                v16 = v10;
              }
              else
              {
                objc_msgSend(v3, "definitionForKey:", v10);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TypeArrayValue"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v18, "shortValue");

                v16 = CFSTR("value");
              }
              v19 = (void *)MEMORY[0x1E0CB37A0];
              objc_msgSend(v3, "entryKey");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (__CFString *)v16;
              objc_msgSend(v19, "stringWithFormat:", CFSTR("INSERT INTO \"%@_Array_%@\" (\"FK_ID\", \"%@\") VALUES "), v20, v10, v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if ((v15 & 0xFFFE) != 0)
                v22 = v15;
              else
                v22 = 1;
              if (objc_msgSend(v14, "count"))
              {
                v23 = 0;
                do
                {
                  if (v23)
                    objc_msgSend(v21, "appendString:", CFSTR(", "));
                  objc_msgSend(v21, "appendString:", CFSTR("(?, ?)"));
                  ++v23;
                }
                while (objc_msgSend(v14, "count") > v23);
              }
              v59 = 0;
              v24 = [PLSQLStatement alloc];
              v25 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
              -[PLSQLiteConnection dbSem](self, "dbSem");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v24, "initWithSQLQuery:forDatabase:withDBSem:result:", v21, v25, v26, &v59);

              if (!v27 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare statement fail: entry=%@"), v3);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "lastPathComponent");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeArrayEntries:]");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v29, v30, 1629);

                PLLogCommon();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v28;
                  _os_log_debug_impl(&dword_1B6AB6000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v32 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v3, "entryKey");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "stringWithFormat:", CFSTR("%@_Array_%@"), v33, v10);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLSQLiteConnection displaySchema:](self, "displaySchema:", v34);

              }
              if (v59 == 11)
                +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, self);
              if (objc_msgSend(v14, "count"))
              {
                v35 = 0;
                v36 = 1;
                do
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "entryID"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLSQLStatement bindValue:withFormater:atPosition:](v27, "bindValue:withFormater:atPosition:", v37, 5, v36);

                  objc_msgSend(v14, "objectAtIndexedSubscript:", v35);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLSQLStatement bindValue:withFormater:atPosition:](v27, "bindValue:withFormater:atPosition:", v38, v22, (v36 + 1));

                  ++v35;
                  v36 = (v36 + 2);
                }
                while (objc_msgSend(v14, "count") > v35);
              }
              if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
              {
                v39 = objc_opt_class();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __40__PLSQLiteConnection_writeArrayEntries___block_invoke;
                block[3] = &unk_1E6A52828;
                v57 = CFSTR("writeArray");
                v58 = v39;
                if (writeArrayEntries__defaultOnce != -1)
                  dispatch_once(&writeArrayEntries__defaultOnce, block);
                v40 = writeArrayEntries__classDebugEnabled;

                if (v40)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlArrayInsert=%@"), v21);
                  v41 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "lastPathComponent");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeArrayEntries:]");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 1645);

                  v45 = (void *)v41;
                  PLLogCommon();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v65 = v45;
                    _os_log_debug_impl(&dword_1B6AB6000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                }
              }
              v47 = -[PLSQLiteConnection performStatement:](self, "performStatement:", v27);

              v5 = v50;
              v7 = v51;
              v8 = &off_1E6A51000;
              v11 = v53;
            }
          }
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v7);
  }

}

- (void)updateEntry:(id)a3
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  PLSQLStatement *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t i;
  uint64_t v25;
  PLSQLStatement *v26;
  sqlite3 *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
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
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  _BOOL4 v85;
  id v87;
  _QWORD v88[5];
  _QWORD block[5];
  _QWORD v90[5];
  _QWORD v91[5];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v87 = a3;
  objc_msgSend(v87, "definedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v87, "entryKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[PLEntryDefinition cacheSQLPrepareStatementForEntryKey:](PLEntryDefinition, "cacheSQLPrepareStatementForEntryKey:", v4);

    v85 = v5;
    if (!v5)
      goto LABEL_11;
    -[PLSQLiteConnection preparedUpdateStatements](self, "preparedUpdateStatements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    -[PLSQLiteConnection preparedUpdateStatements](self, "preparedUpdateStatements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "entryKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (PLSQLStatement *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v6);
    if (v9)
    {
      if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        goto LABEL_40;
      v10 = objc_opt_class();
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __34__PLSQLiteConnection_updateEntry___block_invoke_468;
      v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v90[4] = v10;
      if (updateEntry__defaultOnce_466 != -1)
        dispatch_once(&updateEntry__defaultOnce_466, v90);
      if (!updateEntry__classDebugEnabled_467)
        goto LABEL_40;
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v87, "entryKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Reusing cached updated statement for %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection updateEntry:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 1708);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    else
    {
LABEL_11:
      v18 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v87, "entryKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("UPDATE '%@' SET "), v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v20 = v3;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v93;
        v23 = 1;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v93 != v22)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
            if ((v23 & 1) == 0)
              objc_msgSend(v13, "appendString:", CFSTR(", "));
            objc_msgSend(v13, "appendFormat:", CFSTR("\"%@\"=?"), v25);
            v23 = 0;
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
          v23 = 0;
        }
        while (v21);

        objc_msgSend(v13, "appendString:", CFSTR(", "));
      }
      else
      {

      }
      objc_msgSend(v13, "appendString:", CFSTR("\"timestamp\"=?"));
      objc_msgSend(v13, "appendString:", CFSTR(" WHERE \"ID\" == ?"));
      *(_DWORD *)buf = 0;
      v26 = [PLSQLStatement alloc];
      v27 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
      -[PLSQLiteConnection dbSem](self, "dbSem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v26, "initWithSQLQuery:forDatabase:withDBSem:result:", v13, v27, v28, buf);

      if (!v9 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare statement fail: entry=%@"), v87);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection updateEntry:]");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v31, v32, 1688);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        objc_msgSend(v87, "entryKey");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSQLiteConnection displaySchema:](self, "displaySchema:", v34);

      }
      if (*(_DWORD *)buf == 11)
        +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, self);
      if (!v9)
      {
        v78 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v87, "entryKey");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "stringWithFormat:", CFSTR("ERROR: prepared update statement failed for %@"), v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "lastPathComponent");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection updateEntry:]");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v80, v82, v83, 1704);

        PLLogCommon();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        v9 = 0;
LABEL_72:

        goto LABEL_73;
      }
      if (v85)
      {
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v35 = objc_opt_class();
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __34__PLSQLiteConnection_updateEntry___block_invoke;
          v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v91[4] = v35;
          if (updateEntry__defaultOnce != -1)
            dispatch_once(&updateEntry__defaultOnce, v91);
          if (updateEntry__classDebugEnabled)
          {
            v36 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v87, "entryKey");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringWithFormat:", CFSTR("Caching update statement for %@"), v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "lastPathComponent");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection updateEntry:]");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v40, v41, 1698);

            PLLogCommon();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          }
        }
        -[PLSQLiteConnection preparedUpdateStatements](self, "preparedUpdateStatements");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v43);
        -[PLSQLiteConnection preparedUpdateStatements](self, "preparedUpdateStatements");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "entryKey");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v9, v45);

        objc_sync_exit(v43);
      }
    }

LABEL_40:
    if (objc_msgSend(v3, "count"))
    {
      v46 = 0;
      while (1)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "objectForKeyedSubscript:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectAtIndexedSubscript:", v46);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v87, "formaterForKey:", v49);

        objc_msgSend(v87, "entryKey");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", v46);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = +[PLUtilities logModeForEntryKey:withKey:andValue:](PLUtilities, "logModeForEntryKey:withKey:andValue:", v51, v52, v48);

        if (v53)
        {
          if (v53 == 1)
          {
            if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
              goto LABEL_62;
            v55 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __34__PLSQLiteConnection_updateEntry___block_invoke_473;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v55;
            if (updateEntry__defaultOnce_471 != -1)
              dispatch_once(&updateEntry__defaultOnce_471, block);
            if (!updateEntry__classDebugEnabled_472)
              goto LABEL_62;
            v56 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v87, "entryKey");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectAtIndexedSubscript:", v46);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringWithFormat:", CFSTR("Allowlist denied: entry = %@ key = %@ value = %@ withFormatter = %hd"), v57, v58, v48, (int)v50);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "lastPathComponent");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection updateEntry:]");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v59, v61, v62, 1728);

            PLLogCommon();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v97 = v59;
              _os_log_debug_impl(&dword_1B6AB6000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_61:

            goto LABEL_62;
          }
          if (v53 != 3)
          {
            if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
              goto LABEL_62;
            v64 = objc_opt_class();
            v88[0] = MEMORY[0x1E0C809B0];
            v88[1] = 3221225472;
            v88[2] = __34__PLSQLiteConnection_updateEntry___block_invoke_478;
            v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v88[4] = v64;
            if (updateEntry__defaultOnce_476 != -1)
              dispatch_once(&updateEntry__defaultOnce_476, v88);
            if (!updateEntry__classDebugEnabled_477)
              goto LABEL_62;
            v65 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v87, "entryKey");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectAtIndexedSubscript:", v46);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringWithFormat:", CFSTR("Allowlist denied error case: entry = %@ key = %@ value = %@ withFormatter = %hd"), v66, v67, v48, (int)v50);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "lastPathComponent");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection updateEntry:]");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v59, v69, v70, 1731);

            PLLogCommon();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v97 = v59;
              _os_log_debug_impl(&dword_1B6AB6000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
            goto LABEL_61;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v48, "lastPathComponent");
            v54 = objc_claimAutoreleasedReturnValue();

            v48 = (void *)v54;
          }
        }
        -[PLSQLStatement bindValue:withFormater:atPosition:](v9, "bindValue:withFormater:atPosition:", v48, v50, (v46 + 1));
LABEL_62:

        if (objc_msgSend(v3, "count") <= (unint64_t)++v46)
          goto LABEL_65;
      }
    }
    LODWORD(v46) = 0;
LABEL_65:
    v71 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v87, "entryDate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "timeIntervalSince1970");
    objc_msgSend(v71, "numberWithDouble:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSQLStatement bindValue:withFormater:atPosition:](v9, "bindValue:withFormater:atPosition:", v73, 6, (v46 + 1));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v87, "entryID"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSQLStatement bindValue:withFormater:atPosition:](v9, "bindValue:withFormater:atPosition:", v74, 5, (v46 + 2));

    v75 = -[PLSQLiteConnection performStatement:](self, "performStatement:", v9);
    if ((objc_msgSend(v87, "hasArrayKeys") & 1) != 0)
    {
      objc_msgSend(v87, "entryKey");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSQLiteConnection deleteArrayEntriesForKey:withRowID:](self, "deleteArrayEntriesForKey:withRowID:", v76, objc_msgSend(v87, "entryID"));

      -[PLSQLiteConnection writeArrayEntries:](self, "writeArrayEntries:", v87);
    }
    if (objc_msgSend(v87, "hasDynamicKeys"))
    {
      objc_msgSend(v87, "entryKey");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSQLiteConnection deleteDynamicEntriesForKey:withRowID:](self, "deleteDynamicEntriesForKey:withRowID:", v77, objc_msgSend(v87, "entryID"));

      -[PLSQLiteConnection writeDynamicEntries:](self, "writeDynamicEntries:", v87);
    }
    goto LABEL_72;
  }
LABEL_73:

}

- (NSMutableDictionary)preparedUpdateStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)buildColumnInsert:(id *)a3 andValueInsert:(id *)a4 forEntry:(id)a5
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  id v24;
  id v25;
  id obj;
  void *v29;
  uint64_t v30;
  id v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  v6 = objc_msgSend(v5, "isPPSEnabled");
  objc_msgSend(v5, "definedKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v29, "mutableCopy");
  v32 = v6;
  if (v6)
  {
    objc_msgSend(v5, "arrayKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    objc_msgSend(v5, "dynamicKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "entryID") >= 1)
  {
    objc_msgSend(v10, "appendString:", CFSTR("\"ID\", "));
    objc_msgSend(v11, "appendString:", CFSTR("?, "));
  }
  objc_msgSend(v10, "appendString:", CFSTR("\"timestamp\"));
  objc_msgSend(v11, "appendString:", CFSTR("?"));
  objc_msgSend(v5, "entryDefinition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[PLEntryDefinition isAggregateForEntryDefinition:](PLEntryDefinition, "isAggregateForEntryDefinition:", v12);

  if (v13)
  {
    objc_msgSend(v10, "appendString:", CFSTR(", \"timeInterval\"));
    objc_msgSend(v11, "appendString:", CFSTR(", ?"));
  }
  objc_msgSend(v5, "entryDefinition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[PLEntryDefinition overridesEntryDateForEntryDefinition:](PLEntryDefinition, "overridesEntryDateForEntryDefinition:", v14);

  if (v15)
  {
    objc_msgSend(v10, "appendString:", CFSTR(", \"timestampLogged\"));
    objc_msgSend(v11, "appendString:", CFSTR(", ?"));
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v7;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = v16;
    v30 = *(_QWORD *)v34;
    v31 = v5;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v5, "formaterForKey:", v19))
          v20 = v32;
        else
          v20 = 1;
        if (v20 == 1 && (int)objc_msgSend(v5, "staticArraySizeForKey:", v19) >= 1)
        {
          v21 = objc_msgSend(v5, "staticArraySizeForKey:", v19);
          if (v21 >= 1)
          {
            v22 = v21;
            v23 = 0;
            do
            {
              if (objc_msgSend(v10, "length"))
                objc_msgSend(v10, "appendString:", CFSTR(", "));
              if (objc_msgSend(v11, "length"))
                objc_msgSend(v11, "appendString:", CFSTR(", "));
              objc_msgSend(v10, "appendFormat:", CFSTR("\"%@_%d\"), v19, v23);
              objc_msgSend(v11, "appendFormat:", CFSTR("?"));
              v23 = (v23 + 1);
            }
            while (v22 != (_DWORD)v23);
          }
        }
        else if (objc_msgSend(v29, "containsObject:", v19))
        {
          if (objc_msgSend(v10, "length"))
            objc_msgSend(v10, "appendString:", CFSTR(", "));
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v11, "appendString:", CFSTR(", "));
          objc_msgSend(v10, "appendFormat:", CFSTR("\"%@\"), v19);
          objc_msgSend(v11, "appendFormat:", CFSTR("?"));
        }
        v5 = v31;
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v17);
  }

  v24 = objc_retainAutorelease(v10);
  *a3 = v24;
  v25 = objc_retainAutorelease(v11);
  *a4 = v25;

}

+ (id)sharedSQLiteConnection
{
  void *v2;
  void *v3;
  void *v4;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)endTransaction
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  __CFString *v13;
  uint64_t v14;

  -[PLSQLiteConnection transactionLock](self, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (-[PLSQLiteConnection isTransactionInProgress](self, "isTransactionInProgress"))
  {
    -[PLSQLiteConnection setTransactionInProgress:](self, "setTransactionInProgress:", -[PLSQLiteConnection transactionInProgress](self, "transactionInProgress") - 1);
    if (!-[PLSQLiteConnection isTransactionInProgress](self, "isTransactionInProgress"))
      v4 = -[PLSQLiteConnection performQuery:](self, "performQuery:", CFSTR("END TRANSACTION;"));
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __36__PLSQLiteConnection_endTransaction__block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v13 = CFSTR("transactions");
    v14 = v5;
    if (endTransaction_defaultOnce != -1)
      dispatch_once(&endTransaction_defaultOnce, block);
    v6 = endTransaction_classDebugEnabled;

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("endTransaction counter=%d"), -[PLSQLiteConnection transactionInProgress](self, "transactionInProgress"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection endTransaction]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 1141);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_sync_exit(v3);

}

- (BOOL)isTransactionInProgress
{
  return -[PLSQLiteConnection transactionInProgress](self, "transactionInProgress") > 0;
}

- (int)transactionInProgress
{
  return self->_transactionInProgress;
}

- (void)beginTransaction
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  __CFString *v13;
  uint64_t v14;

  -[PLSQLiteConnection transactionLock](self, "transactionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (!-[PLSQLiteConnection isTransactionInProgress](self, "isTransactionInProgress"))
    v4 = -[PLSQLiteConnection performQuery:](self, "performQuery:", CFSTR("BEGIN TRANSACTION;"));
  -[PLSQLiteConnection setTransactionInProgress:](self, "setTransactionInProgress:", -[PLSQLiteConnection transactionInProgress](self, "transactionInProgress") + 1);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __38__PLSQLiteConnection_beginTransaction__block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v13 = CFSTR("transactions");
    v14 = v5;
    if (beginTransaction_defaultOnce != -1)
      dispatch_once(&beginTransaction_defaultOnce, block);
    v6 = beginTransaction_classDebugEnabled;

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("beginTransaction counter=%d"), -[PLSQLiteConnection transactionInProgress](self, "transactionInProgress"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection beginTransaction]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 1126);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_sync_exit(v3);

}

- (NSString)transactionLock
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransactionInProgress:(int)a3
{
  self->_transactionInProgress = a3;
}

- (void)loadDynamicValuesIntoEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasDynamicKeys"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "entryKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("SELECT * FROM '%@_%@' WHERE \"FK_ID\"==\"%lld\"), v6, CFSTR("Dynamic"), objc_msgSend(v4, "entryID"));
    v7 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v7;
    -[PLSQLiteConnection performQuery:](self, "performQuery:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition dynamicKeyConfigsForEntryKey:](PLEntryDefinition, "dynamicKeyConfigsForEntryKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v8;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v31)
    {
      v11 = *(_QWORD *)v37;
      v28 = *(_QWORD *)v37;
      v29 = v10;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("key"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("key"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "allKeys");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v19 = v18;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v33;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v33 != v22)
                    objc_enumerationMutation(v19);
                  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v24);

                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              }
              while (v21);
              v26 = v19;
              v11 = v28;
              v10 = v29;
            }
            else
            {
              v26 = v19;
            }
          }
          else
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Key"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v26);
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v31);
    }

  }
}

- (void)loadArrayValuesIntoEntry:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasArrayKeys"))
  {
    objc_msgSend(v3, "arrayKeys");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v22)
    {
      v19 = *(_QWORD *)v28;
      v20 = v3;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v4);
          v6 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v3, "entryKey");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT value FROM '%@_Array_%@' WHERE \"FK_ID\"==\"%lld\"), v7, v5, objc_msgSend(v3, "entryID"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          -[PLSQLiteConnection performQuery:](self, "performQuery:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_opt_new();
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v24;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v24 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "objectForKeyedSubscript:", CFSTR("value"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v16);

                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v13);
          }

          if (objc_msgSend(v10, "count"))
            v17 = v10;
          else
            v17 = 0;
          v3 = v20;
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v5);

          ++v4;
        }
        while (v4 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v22);
    }

  }
}

- (void)deleteDynamicEntriesForKey:(id)a3 withRowID:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  __CFString *v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM '%@_%@' WHERE FK_ID=%lld;"),
    a3,
    CFSTR("Dynamic"),
    a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __59__PLSQLiteConnection_deleteDynamicEntriesForKey_withRowID___block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v15 = CFSTR("delete");
    v16 = v6;
    if (deleteDynamicEntriesForKey_withRowID__defaultOnce != -1)
      dispatch_once(&deleteDynamicEntriesForKey_withRowID__defaultOnce, block);
    v7 = deleteDynamicEntriesForKey_withRowID__classDebugEnabled;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlDelete=%@"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection deleteDynamicEntriesForKey:withRowID:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 1771);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v13 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v5);

}

+ (void)removeAdditionalFiles:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-shm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-wal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeItemAtPath:error:", v7, 0);
}

+ (void)removeDBAtFilePath:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PLSQLiteConnection removeAdditionalFiles:](PLSQLiteConnection, "removeAdditionalFiles:", v3);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

+ (id)tableHasTimestampColumn
{
  if (tableHasTimestampColumn_onceToken != -1)
    dispatch_once(&tableHasTimestampColumn_onceToken, &__block_literal_global_20_0);
  return (id)tableHasTimestampColumn_tableHasTimestampColumn;
}

void __45__PLSQLiteConnection_tableHasTimestampColumn__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tableHasTimestampColumn_tableHasTimestampColumn;
  tableHasTimestampColumn_tableHasTimestampColumn = v0;

}

+ (id)tableHasTimestampColumnSem
{
  if (tableHasTimestampColumnSem_onceToken != -1)
    dispatch_once(&tableHasTimestampColumnSem_onceToken, &__block_literal_global_22_2);
  return (id)tableHasTimestampColumnSem_tableHasTimestampColumnSem;
}

void __48__PLSQLiteConnection_tableHasTimestampColumnSem__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)tableHasTimestampColumnSem_tableHasTimestampColumnSem;
  tableHasTimestampColumnSem_tableHasTimestampColumnSem = (uint64_t)v0;

}

- (PLSQLiteConnection)init
{
  void *v3;
  void *v4;
  PLSQLiteConnection *v5;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLSQLiteConnection initWithFilePath:](self, "initWithFilePath:", v4);

  return v5;
}

- (PLSQLiteConnection)initWithFilePath:(id)a3
{
  return -[PLSQLiteConnection initWithFilePath:withCacheSize:](self, "initWithFilePath:withCacheSize:", a3, 50);
}

- (PLSQLiteConnection)initWithFilePath:(id)a3 withFlags:(id)a4
{
  return -[PLSQLiteConnection initWithFilePath:withCacheSize:withFlags:](self, "initWithFilePath:withCacheSize:withFlags:", a3, 50, a4);
}

- (BOOL)commonInitProcessWithFilePath:(id)a3 withCacheSize:(int64_t)a4
{
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *preparedStatements;
  NSMutableDictionary *v10;
  NSMutableDictionary *preparedUpdateStatements;
  NSMutableDictionary *v12;
  NSMutableDictionary *preparedDynamicStatements;
  NSString *transactionLock;
  objc_class *v15;
  NSString *v16;
  NSString *cachedClassName;
  OS_dispatch_semaphore *v18;
  OS_dispatch_semaphore *dbSem;
  int v20;
  void *v21;
  void *v22;
  void *v23;
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

  v7 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  v8 = (NSMutableDictionary *)objc_opt_new();
  preparedStatements = self->_preparedStatements;
  self->_preparedStatements = v8;

  v10 = (NSMutableDictionary *)objc_opt_new();
  preparedUpdateStatements = self->_preparedUpdateStatements;
  self->_preparedUpdateStatements = v10;

  v12 = (NSMutableDictionary *)objc_opt_new();
  preparedDynamicStatements = self->_preparedDynamicStatements;
  self->_preparedDynamicStatements = v12;

  self->_transactionInProgress = 0;
  transactionLock = self->_transactionLock;
  self->_transactionLock = (NSString *)CFSTR("_-transactionLock-_");

  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  cachedClassName = self->_cachedClassName;
  self->_cachedClassName = v16;

  self->_cacheSize = a4;
  v18 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  dbSem = self->_dbSem;
  self->_dbSem = v18;

  v20 = sqlite3_initialize();
  if (!v20)
  {
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v22) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("/Library/Logs/CurrentPowerlog.PLSQL"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v23, "fileExistsAtPath:", v25);

      if (!v26)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeItemAtPath:error:", v29, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByAppendingString:", CFSTR("/Library/Logs/CurrentPowerlog.PLSQL"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "moveItemAtPath:toPath:error:", v32, v34, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL-wal"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeItemAtPath:error:", v37, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringByAppendingString:", CFSTR("/Library/Logs/CurrentPowerlog.PLSQL-wal"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL-wal"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "moveItemAtPath:toPath:error:", v40, v42, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL-shm"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "removeItemAtPath:error:", v45, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingString:", CFSTR("/Library/Logs/CurrentPowerlog.PLSQL-shm"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL-shm"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "moveItemAtPath:toPath:error:", v46, v48, 0);

    }
    goto LABEL_7;
  }
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "failed to initialize library: %d\n", v20);
LABEL_7:

  return v20 == 0;
}

- (PLSQLiteConnection)initWithFilePath:(id)a3 withCacheSize:(int64_t)a4
{
  id v6;
  PLSQLiteConnection *v7;
  PLSQLiteConnection *v8;
  void *v9;
  void *v10;
  BOOL v11;
  PLSQLiteConnection *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLSQLiteConnection;
  v7 = -[PLSQLiteConnection init](&v14, sel_init);
  v8 = v7;
  if (!v7)
  {
LABEL_13:
    v12 = v8;
    goto LABEL_14;
  }
  if (-[PLSQLiteConnection commonInitProcessWithFilePath:withCacheSize:](v7, "commonInitProcessWithFilePath:withCacheSize:", v6, a4)&& -[PLSQLiteConnection openCurrentFileWithCacheSize:](v8, "openCurrentFileWithCacheSize:", a4))
  {
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v10))
    {
      v11 = +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd");

      if (!v11)
      {
        if (+[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", CFSTR("RunIntegrityCheck"))
          && !-[PLSQLiteConnection passesIntegrityCheck](v8, "passesIntegrityCheck"))
        {
          +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, v8);
        }
        -[PLSQLiteConnection scheduleIntegrityCheck](v8, "scheduleIntegrityCheck");
      }
    }
    else
    {

    }
    -[PLSQLiteConnection setJournalMode:](v8, "setJournalMode:", +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("DBModeWAL"), 1) ^ 1);
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (PLSQLiteConnection)initWithFilePath:(id)a3 withCacheSize:(int64_t)a4 withFlags:(id)a5
{
  id v8;
  id v9;
  PLSQLiteConnection *v10;
  PLSQLiteConnection *v11;
  PLSQLiteConnection *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PLSQLiteConnection;
  v10 = -[PLSQLiteConnection init](&v14, sel_init);
  v11 = v10;
  if (!v10
    || -[PLSQLiteConnection commonInitProcessWithFilePath:withCacheSize:](v10, "commonInitProcessWithFilePath:withCacheSize:", v8, a4)&& -[PLSQLiteConnection openCurrentFileWithCacheSize:withFlags:](v11, "openCurrentFileWithCacheSize:withFlags:", a4, v9))
  {
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)getIntegrityCheckCriteria
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "periodicIntegrityCheckInterval");
  +[PLActivityCriterionTime timeCriterionWithInterval:](PLActivityCriterionTime, "timeCriterionWithInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  if (!+[PLPlatform isDisplayClass:](PLPlatform, "isDisplayClass:", 0xFFFFFFFFLL))
  {
    +[PLActivityCriterionEntry displayOffCriterion](PLActivityCriterionEntry, "displayOffCriterion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  if (+[PLUtilities hasBattery](PLUtilities, "hasBattery"))
  {
    +[PLActivityCriterionEntry pluggedInCriterion](PLActivityCriterionEntry, "pluggedInCriterion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  return v2;
}

- (void)scheduleIntegrityCheck
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 5000000000);
  dispatch_get_global_queue(-2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke;
  block[3] = &unk_1E6A52050;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

void __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "getIntegrityCheckCriteria");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLActivityScheduler sharedInstance](PLActivityScheduler, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLActivityCriterionTime timeCriterionWithInterval:](PLActivityCriterionTime, "timeCriterionWithInterval:", 2592000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_2;
  v6[3] = &unk_1E6A55308;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "scheduleActivityWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", CFSTR("com.apple.powerlogd.integrity_check"), v2, v4, v5, 0, v6);

}

void __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  v7 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (kPLCacheSizeForBackupDatabaseConnection_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLCacheSizeForBackupDatabaseConnection_block_invoke_defaultOnce, block);
    if (kPLCacheSizeForBackupDatabaseConnection_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Periodic integrity_check activity running"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection scheduleIntegrityCheck]_block_invoke_2");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 215);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v14 = (void *)os_transaction_create();
  v15 = (void *)MEMORY[0x1BCC9E9B4]();
  if ((objc_msgSend(*(id *)(a1 + 32), "passesIntegrityCheck") & 1) == 0)
    +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v15);
  v16 = dispatch_time(0, 60000000000);
  +[PLUtilities transactionWorkQueue](PLUtilities, "transactionWorkQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_57;
  v19[3] = &unk_1E6A52050;
  v20 = v14;
  v18 = v14;
  dispatch_after(v16, v17, v19);

}

BOOL __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_3(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLCacheSizeForBackupDatabaseConnection_block_invoke_classDebugEnabled = result;
  return result;
}

+ (double)periodicIntegrityCheckInterval
{
  if (periodicIntegrityCheckInterval_onceToken != -1)
    dispatch_once(&periodicIntegrityCheckInterval_onceToken, &__block_literal_global_59);
  return *(double *)&periodicIntegrityCheckInterval_periodicIntegrityCheckInterval;
}

uint64_t __52__PLSQLiteConnection_periodicIntegrityCheckInterval__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLSQLiteConnection_periodicIntegrityCheckInterval"), 604800.0);
  periodicIntegrityCheckInterval_periodicIntegrityCheckInterval = v1;
  return result;
}

- (BOOL)isIncrementalVacuumEnabled
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_exec_b();
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((unsigned __int8 *)v9 + 24);
    *(_DWORD *)buf = 67109120;
    v13 = v5;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Incremental Vacuum is %d", buf, 8u);
  }

  -[PLSQLiteConnection dbSem](self, "dbSem");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  LOBYTE(v6) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v6;
}

uint64_t __48__PLSQLiteConnection_isIncrementalVacuumEnabled__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int(a2, 0) == 2;
  return 0;
}

- (int)getCacheSpillValue
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_exec_b();
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((_DWORD *)v9 + 6);
    *(_DWORD *)buf = 67109120;
    v13 = v5;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Cache spill is %d", buf, 8u);
  }

  -[PLSQLiteConnection dbSem](self, "dbSem");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  LODWORD(v6) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return (int)v6;
}

uint64_t __40__PLSQLiteConnection_getCacheSpillValue__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int(a2, 0);
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[PLSQLiteConnection closeConnection](self, "closeConnection");
  v3.receiver = self;
  v3.super_class = (Class)PLSQLiteConnection;
  -[PLSQLiteConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)openCurrentFile
{
  return -[PLSQLiteConnection openCurrentFileWithCacheSize:](self, "openCurrentFileWithCacheSize:", -[PLSQLiteConnection cacheSize](self, "cacheSize"));
}

- (BOOL)openCurrentFileWithCacheSize:(int64_t)a3
{
  return -[PLSQLiteConnection openCurrentFileWithCacheSize:withFlags:](self, "openCurrentFileWithCacheSize:withFlags:", a3, 0);
}

- (BOOL)openCurrentFileWithCacheSize:(int64_t)a3 withFlags:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  id v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  int v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  int v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLSQLiteConnection openCurrentFileWithCacheSize:withFlags:].cold.2(self);

  if (objc_msgSend(v6, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v8);
          v11 |= objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "intValue");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 3145734;
  }
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  -[PLSQLiteConnection filePath](self, "filePath");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = sqlite3_open_v2((const char *)objc_msgSend(v15, "UTF8String"), &self->_dbConnection, v11, 0);
  v41 = v16;

  -[PLSQLiteConnection dbSem](self, "dbSem");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v17);

  if (v16)
  {
    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[PLSQLiteConnection openCurrentFileWithCacheSize:withFlags:].cold.1();
    goto LABEL_18;
  }
  if ((v11 & 1) != 0)
  {
    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      v19 = v16 == 0;
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v30 = "done initializing read-only connection";
    v31 = v18;
    v32 = 2;
LABEL_34:
    _os_log_impl(&dword_1B6AB6000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_18;
  }
  -[PLSQLiteConnection filePath](self, "filePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities setMobileOwnerForFile:](PLUtilities, "setMobileOwnerForFile:", v21);

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v22, OS_LOG_TYPE_DEFAULT, "Configure the page cache", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA cache_size = %ld;"), a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", v23, &v41, 0);

  v19 = 0;
  if (!v41)
  {
    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v25, OS_LOG_TYPE_DEFAULT, "Configure the cache_spill", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA cache_spill = %ld;"), 640);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", v26, &v41, 0);

    v19 = 0;
    if (!v41)
    {
      v28 = -[PLSQLiteConnection getCacheSpillValue](self, "getCacheSpillValue");
      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        v43 = v41;
        v44 = 2080;
        v45 = 0;
        v46 = 1024;
        v47 = v28;
        _os_log_impl(&dword_1B6AB6000, v29, OS_LOG_TYPE_DEFAULT, "Tuning cache spill for the db retun value %d and error %s val returned from query %d", buf, 0x18u);
      }

      if (!+[PLUtilities SwitchToIncrementalVacuumEnabled](PLUtilities, "SwitchToIncrementalVacuumEnabled")|| -[PLSQLiteConnection isIncrementalVacuumEnabled](self, "isIncrementalVacuumEnabled"))
      {
        v19 = 1;
        goto LABEL_19;
      }
      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v33, OS_LOG_TYPE_DEFAULT, "Configure auto_vacuum = 2", buf, 2u);
      }

      v34 = objc_unsafeClaimAutoreleasedReturnValue(-[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", CFSTR("PRAGMA auto_vacuum = 2;"),
                &v41,
                0));
      v19 = 0;
      if (!v41)
      {
        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6AB6000, v35, OS_LOG_TYPE_DEFAULT, "Invoke VACUUM to ensure the transition to incremental_vacuum mode", buf, 2u);
        }

        v36 = objc_unsafeClaimAutoreleasedReturnValue(-[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", CFSTR("VACUUM;"),
                  &v41,
                  0));
        v19 = 0;
        if (!v41)
        {
          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            goto LABEL_18;
          *(_DWORD *)buf = 67109378;
          v43 = v41;
          v44 = 2080;
          v45 = 0;
          v30 = "Executed vacuum on db to switch to incremental vacuum - %d and %s ";
          v31 = v18;
          v32 = 18;
          goto LABEL_34;
        }
      }
    }
  }
LABEL_19:

  return v19;
}

- (void)printDBStatusString
{
  int pHiwtr;
  int pCur;

  pCur = 0;
  pHiwtr = 0;
  sqlite3_db_status(self->_dbConnection, 0, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Lookaside Slots Used:        %d (max %d)\n"), pCur, pHiwtr);
  sqlite3_db_status(self->_dbConnection, 4, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Successful lookasides:       %d\n"), pHiwtr);
  sqlite3_db_status(self->_dbConnection, 5, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Lookaside size faults:       %d\n"), pHiwtr);
  sqlite3_db_status(self->_dbConnection, 6, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Lookaside OOM faults:        %d\n"), pHiwtr);
  sqlite3_db_status(self->_dbConnection, 1, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Pager Heap Usage:            %d bytes\n"), pCur);
  sqlite3_db_status(self->_dbConnection, 7, &pCur, &pHiwtr, 1);
  NSLog(CFSTR("-- Page cache hits:             %d\n"), pCur);
  sqlite3_db_status(self->_dbConnection, 8, &pCur, &pHiwtr, 1);
  NSLog(CFSTR("-- Page cache misses:           %d\n"), pCur);
  sqlite3_db_status(self->_dbConnection, 9, &pCur, &pHiwtr, 1);
  NSLog(CFSTR("-- Page cache writes:           %d\n"), pCur);
  sqlite3_db_status(self->_dbConnection, 2, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Schema Heap Usage:           %d bytes\n"), pCur);
  sqlite3_db_status(self->_dbConnection, 3, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Statement Heap Usage:        %d bytes\n"), pCur);
  sqlite3_status(0, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Memory Used (bytes):         %d (max %d)\n"), pCur, pHiwtr);
  sqlite3_status(9, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Outstanding Allocations:     %d (max %d)\n"), pCur, pHiwtr);
  sqlite3_status(2, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Pcache Overflow Bytes:       %d (max %d)\n"), pCur, pHiwtr);
  sqlite3_status(4, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Scratch Overflow Bytes:      %d (max %d)\n"), pCur, pHiwtr);
  sqlite3_status(5, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Largest Allocation:          %d bytes\n"), pHiwtr);
  sqlite3_status(7, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Largest Pcache Allocation:   %d bytes\n"), pHiwtr);
  sqlite3_status(8, &pCur, &pHiwtr, 0);
  NSLog(CFSTR("-- Largest Scratch Allocation:  %d bytes\n"), pHiwtr);
}

- (BOOL)tableHasTimestampColumn:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumnSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumnSem");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v8);

  if (v7)
  {
    LOBYTE(v9) = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[PLSQLiteConnection tableInfo:](self, "tableInfo:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v22 = v4;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("name"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("timestamp"));

          if ((v16 & 1) != 0)
          {
            v9 = 1;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          continue;
        break;
      }
      v9 = 0;
LABEL_13:
      v4 = v22;
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumnSem");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumn");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v4);

    objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumnSem");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v20);

  }
  return v9;
}

- (void)clearTableHasTimestampColumnCache
{
  NSObject *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumnSem");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend((id)objc_opt_class(), "tableHasTimestampColumnSem");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

- (int)rowCountForTable:(id)a3
{
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t block;
  uint64_t v21;
  BOOL (*v22)(uint64_t);
  void *v23;
  __CFString *v24;
  uint64_t v25;

  v4 = a3;
  v5 = CFSTR("FK_ID");
  if ((objc_msgSend(v4, "containsString:", CFSTR("_Dynamic")) & 1) == 0
    && !objc_msgSend(v4, "containsString:", CFSTR("_Array_")))
  {
    v5 = CFSTR("ID");
  }
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("'")) == 0x7FFFFFFFFFFFFFFFLL)
    v6 = CFSTR("SELECT count(%@) AS count FROM '%@';");
  else
    v6 = CFSTR("SELECT count(%@) AS count FROM %@;");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v22 = __39__PLSQLiteConnection_rowCountForTable___block_invoke;
    v23 = &unk_1E6A52828;
    v21 = 3221225472;
    v24 = CFSTR("mergeDBCount");
    v25 = v8;
    if (rowCountForTable__defaultOnce != -1)
      dispatch_once(&rowCountForTable__defaultOnce, &block);
    v9 = rowCountForTable__classDebugEnabled;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Counting %@ (%@)"), v4, v7, block, v21, v22, v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection rowCountForTable:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 438);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

BOOL __39__PLSQLiteConnection_rowCountForTable___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  rowCountForTable__classDebugEnabled = result;
  return result;
}

- (id)sortedSqlFormatedColumnNamesForTableInsert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM pragma_table_info('%@')"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v13;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ID")) & 1) == 0
            && (objc_msgSend(v20, "isEqualToString:", CFSTR("FK_ID")) & 1) == 0)
          {
            if (objc_msgSend(v14, "length"))
              objc_msgSend(v14, "appendString:", CFSTR(", "));
            objc_msgSend(v14, "appendFormat:", CFSTR("%c%@%c"), 39, v20, 39);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v17);
    }

    objc_msgSend(v14, "appendString:", CFSTR(")"));
    v13 = v22;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)sqlFormatedColumnNamesForTableInsert:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PLSQLiteConnection tableInfo:](self, "tableInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ID"));

        if ((v11 & 1) == 0)
        {
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v4, "appendString:", CFSTR(", "));
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("%c%@%c"), 39, v12, 39);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)sqlFormatedColumnNamesForTableSelect:(id)a3 withSystemOffset:(double)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLSQLiteConnection tableInfo:](self, "tableInfo:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ID"));

        if ((v13 & 1) == 0)
        {
          if (objc_msgSend(v6, "length"))
            objc_msgSend(v6, "appendString:", CFSTR(", "));
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("timestamp"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v15)
            objc_msgSend(v6, "appendFormat:", CFSTR("%c%@%c - %f"), 96, v16, 96, *(_QWORD *)&a4);
          else
            objc_msgSend(v6, "appendFormat:", CFSTR("%c%@%c"), 96, v16, 96, v19);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v6;
}

- (void)removeTableNameFromMergeDB:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("DROP TABLE mergeDB.'%@'"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM mergeDB.'PLCoreStorage_schemaVersions' WHERE tableName='%@';"),
    v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v9);
}

- (void)enumerateAllTablesWithBlock:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PLSQLiteConnection *v21;
  void (**v22)(id, void *, void *);
  uint64_t v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v22 = (void (**)(id, void *, void *))a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type=\"table\" AND name LIKE \"PL%%\" AND name NOT LIKE \"PLCoreStorage%%\";"));
  v21 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    v20 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      v23 = v5;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1BCC9E9B4]();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "containsStringInArray:", &unk_1E6AF5FD8) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type=\"table\" AND name LIKE \"%@%%\" AND (name LIKE \"%%_Array_%%\" OR name LIKE \"%%_Dynamic\") AND name != \"%@\";"),
            v10,
            v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSQLiteConnection performQuery:](v21, "performQuery:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_opt_new();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "objectForKeyedSubscript:", CFSTR("name"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v18);

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v15);
          }

          v22[2](v22, v10, v12);
          v6 = v20;
          v5 = v23;
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
  }

}

- (int)rowCountForTableName:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("'")) == 0x7FFFFFFFFFFFFFFFLL)
    v5 = CFSTR("SELECT count(ID) AS count FROM '%@';");
  else
    v5 = CFSTR("SELECT count(ID) AS count FROM %@;");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSQLiteConnection performQuery:](self, "performQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)enumerateTablesWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type=\"table\" AND name NOT LIKE \"PLCoreStorage%%\" AND name NOT LIKE \"sqlite%%\";"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1BCC9E9B4](v7);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v7;
    }
    while (v7);
  }

}

- (void)mergeDataFromOtherDBFile:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[6];
  uint8_t v27[16];
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLLogSQLiteConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134349056;
      v29 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v4);
      _os_signpost_emit_with_name_impl(&dword_1B6AB6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MergeDB", " preUnlockDBSize=%{public, signpost.telemetry:number1}lld enableTelemetry=YES ", buf, 0xCu);
    }

    *(_DWORD *)buf = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATTACH DATABASE '%@' AS mergeDB;"), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", v6, buf, 0);
    v8 = *(_DWORD *)buf;
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PLSQLiteConnection mergeDataFromOtherDBFile:].cold.3();

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_INFO, "MERGE begins", v27, 2u);
      }

      -[PLSQLiteConnection beginTransaction](self, "beginTransaction");
      +[PLUtilities getLastSystemTimeOffset](PLUtilities, "getLastSystemTimeOffset");
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175;
      v26[3] = &unk_1E6A55928;
      v26[4] = self;
      v26[5] = v18;
      -[PLSQLiteConnection enumerateTablesWithBlock:](self, "enumerateTablesWithBlock:", v26);
      -[PLSQLiteConnection endTransaction](self, "endTransaction");
      *(_DWORD *)buf = 0;
      v19 = objc_unsafeClaimAutoreleasedReturnValue(-[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", CFSTR("DETACH DATABASE mergeDB;"),
                buf,
                0));
      v20 = *(_DWORD *)buf;
      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[PLSQLiteConnection mergeDataFromOtherDBFile:].cold.2((int *)buf, v22);
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1B6AB6000, v22, OS_LOG_TYPE_INFO, "MERGE Complete", v27, 2u);
      }

    }
    AnalyticsSendEventLazy();
    PLLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1B6AB6000, v23, OS_LOG_TYPE_INFO, "MERGE Deleting pre unlock DB", v27, 2u);
    }

    +[PLSQLiteConnection removeDBAtFilePath:](PLSQLiteConnection, "removeDBAtFilePath:", v4);
    PLLogSQLiteConnection();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6AB6000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MergeDB", ", v27, 2u);
    }

    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1B6AB6000, v25, OS_LOG_TYPE_INFO, "MERGE Deleted the pre unlock db", v27, 2u);
    }

  }
  else
  {
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PLSQLiteConnection mergeDataFromOtherDBFile:].cold.1(v6, v11, v12, v13, v14, v15, v16, v17);
  }

}

void *__47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke()
{
  return &unk_1E6AF7750;
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  NSObject *v15;
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
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  _BYTE v32[10];
  _DWORD v33[2];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mergeDB.'%@'"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rowCountForTableName:", v5);

  if (v6 < 1)
  {
    v28 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE mergeDB.'%@'"), v3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v28, "performQuery:returnValue:returnResult:", v29, 0, 0);

  }
  else
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v32 = v3;
      *(_WORD *)&v32[8] = 1024;
      v33[0] = v6;
      _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_INFO, "MERGE : ****** copying %@ (%d)", buf, 0x12u);
    }

    v8 = objc_msgSend(*(id *)(a1 + 32), "rowCountForTableName:", v3);
    objc_msgSend(*(id *)(a1 + 32), "sqlFormatedColumnNamesForTableInsert:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sqlFormatedColumnNamesForTableSelect:withSystemOffset:", v3, *(double *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO '%@'(%@) SELECT %@ FROM mergeDB.'%@';"),
      v3,
      v9,
      v10,
      v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175_cold_3();

    v13 = (id)objc_msgSend(*(id *)(a1 + 32), "performQuery:returnValue:returnResult:", v11, 0, 0);
    v14 = objc_msgSend(*(id *)(a1 + 32), "rowCountForTableName:", v3);
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v32 = v8;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v14;
      LOWORD(v33[0]) = 1024;
      *(_DWORD *)((char *)v33 + 2) = v6;
      _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_INFO, "MERGE : startCount=%d endCount=%d rowCount=%d", buf, 0x14u);
    }

    if (v8 + v6 != v14)
    {
      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);

    }
    v24 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE mergeDB.'%@'"), v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v24, "performQuery:returnValue:returnResult:", v25, 0, 0);

    PLLogCommon();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175_cold_1();

  }
}

void *__47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_183()
{
  return &unk_1E6AF7778;
}

void *__47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_190()
{
  return &unk_1E6AF77A0;
}

- (void)trimAllTablesFromDate:(id)a3 toDate:(id)a4
{
  -[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:](self, "trimAllTablesFromDate:toDate:withTableFilters:", a3, a4, 0);
}

- (void)trimAllTablesFromDate:(id)a3 toDate:(id)a4 withTableFilters:(id)a5
{
  id v8;
  _UNKNOWN **v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char isKindOfClass;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id obj;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *context;
  uint64_t v70;
  id v71;
  PLSQLiteConnection *v72;
  int64_t v73;
  id v74;
  void *v75;
  _QWORD block[4];
  __CFString *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  __CFString *v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  __CFString *v95;
  uint64_t v96;
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v63 = a4;
  v67 = a5;
  v9 = &off_1E6A51000;
  v71 = v8;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v10 = objc_opt_class();
    v94[0] = MEMORY[0x1E0C809B0];
    v94[2] = __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke;
    v94[3] = &unk_1E6A52828;
    v94[1] = 3221225472;
    v95 = CFSTR("trimming");
    v96 = v10;
    if (trimAllTablesFromDate_toDate_withTableFilters__defaultOnce != -1)
      dispatch_once(&trimAllTablesFromDate_toDate_withTableFilters__defaultOnce, v94);
    v11 = trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled;

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trimming from %@ to %@"), v8, v63);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v14, v15, 652);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v8 = v71;
    }
  }
  if (v8 || v63 || v67)
  {
    v17 = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("trimLimit"), 1000);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type=\"table\" AND name NOT LIKE \"PLCoreStorage%%\" AND name NOT LIKE \"sqlite%%\";"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSQLiteConnection performQuery:](self, "performQuery:");
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    if (!v18)
      goto LABEL_71;
    v19 = v18;
    v66 = *(_QWORD *)v91;
    v72 = self;
    v73 = v17;
    while (1)
    {
      v20 = 0;
      v62 = v19;
      do
      {
        if (*(_QWORD *)v91 != v66)
          objc_enumerationMutation(obj);
        v70 = v20;
        v21 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v20);
        context = (void *)MEMORY[0x1BCC9E9B4]();
        if (objc_msgSend(v9[28], "debugEnabled"))
        {
          v22 = objc_opt_class();
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_205;
          v87[3] = &unk_1E6A52828;
          v88 = CFSTR("trimming");
          v89 = v22;
          if (trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_203 != -1)
            dispatch_once(&trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_203, v87);
          v23 = trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_204;

          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trimming table %@"), v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:]");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v26, v27, 665);

            PLLogCommon();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v100 = v24;
              _os_log_debug_impl(&dword_1B6AB6000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v72;
            v9 = &off_1E6A51000;
          }
        }
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("name"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v30 = objc_msgSend(&unk_1E6AF5FF0, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
        if (!v30)
        {
          v68 = 0;
LABEL_40:
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67)
          {
            objc_msgSend(v67, "objectForKeyedSubscript:", v29);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              objc_msgSend(v67, "objectForKeyedSubscript:", v29);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              objc_msgSend(v67, "objectForKeyedSubscript:", v29);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v38, "addObjectsFromArray:", v42);
                goto LABEL_46;
              }
              objc_opt_class();
              v43 = objc_opt_isKindOfClass();

              if ((v43 & 1) != 0)
              {
                objc_msgSend(v67, "objectForKeyedSubscript:", v29);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v42);
LABEL_46:

              }
            }
          }
          if (!objc_msgSend(v38, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v44);

          }
          if (-[PLSQLiteConnection tableHasTimestampColumn:](self, "tableHasTimestampColumn:", v29))
          {
            if (v63 && (objc_msgSend(v29, "isEqualToString:", CFSTR("PLApplicationAgent_EventNone_AllApps")) & 1) == 0)
            {
              v45 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v63, "timeIntervalSince1970");
              objc_msgSend(v45, "stringWithFormat:", CFSTR("DELETE FROM '%@' WHERE ID IN (SELECT ID FROM '%@' WHERE timestamp>%f limit %ld);"),
                v29,
                v29,
                v46,
                v17);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLSQLiteConnection runTrimQuery:](self, "runTrimQuery:", v47);

            }
            v75 = v29;
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            v65 = v38;
            v74 = v38;
            v48 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
            if (v48)
            {
              v49 = v48;
              v50 = *(_QWORD *)v80;
              do
              {
                v51 = 0;
                do
                {
                  if (*(_QWORD *)v80 != v50)
                    objc_enumerationMutation(v74);
                  v52 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v51);
                  v53 = (void *)MEMORY[0x1BCC9E9B4]();
                  if (objc_msgSend(v9[28], "debugEnabled"))
                  {
                    v54 = objc_opt_class();
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_220;
                    block[3] = &unk_1E6A52828;
                    v77 = CFSTR("trimming");
                    v78 = v54;
                    if (trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_218 != -1)
                      dispatch_once(&trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_218, block);
                    v55 = trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_219;

                    if (v55)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trimming filter %@"), v52);
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "lastPathComponent");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:]");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v56, v58, v59, 729);

                      PLLogCommon();
                      v60 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v100 = v56;
                        _os_log_debug_impl(&dword_1B6AB6000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      v8 = v71;
                      self = v72;
                      v9 = &off_1E6A51000;
                      v17 = v73;
                    }
                  }
                  -[PLSQLiteConnection trimTable:fromDate:withFilter:withTrimLimit:](self, "trimTable:fromDate:withFilter:withTrimLimit:", v75, v8, v52, v17);
                  objc_autoreleasePoolPop(v53);
                  ++v51;
                }
                while (v49 != v51);
                v49 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
              }
              while (v49);
            }

            v19 = v62;
            v29 = v75;
            v38 = v65;
          }

          goto LABEL_69;
        }
        v31 = v30;
        v32 = v29;
        v33 = 0;
        v34 = *(_QWORD *)v84;
        while (2)
        {
          v35 = 0;
          v36 = v33;
          do
          {
            if (*(_QWORD *)v84 != v34)
              objc_enumerationMutation(&unk_1E6AF5FF0);
            objc_msgSend((id)objc_opt_class(), "masterTableForTable:andType:", v32, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v35));
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33 && objc_msgSend(v33, "length"))
              goto LABEL_33;
            ++v35;
            v36 = v33;
          }
          while (v31 != v35);
          v31 = objc_msgSend(&unk_1E6AF5FF0, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
          if (v31)
            continue;
          break;
        }
        if (!v33)
        {
          v68 = 0;
LABEL_39:
          v17 = v73;
          v29 = v32;
          goto LABEL_40;
        }
LABEL_33:
        v68 = v33;
        if (!objc_msgSend(v33, "length"))
          goto LABEL_39;
        v17 = v73;
        v29 = v32;
        if (-[PLSQLiteConnection checkEmptyMasterTable:](self, "checkEmptyMasterTable:", v33))
        {
          -[PLSQLiteConnection dropTable:](self, "dropTable:", v32);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM '%@' WHERE FK_ID < (SELECT MIN(ID) FROM '%@') OR FK_ID > (SELECT MAX(ID) FROM '%@');"),
            v32,
            v33,
            v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSQLiteConnection runTrimQuery:](self, "runTrimQuery:", v37);

        }
LABEL_69:

        objc_autoreleasePoolPop(context);
        v20 = v70 + 1;
      }
      while (v70 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
      if (!v19)
      {
LABEL_71:

        break;
      }
    }
  }

}

BOOL __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled = result;
  return result;
}

BOOL __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_205(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_204 = result;
  return result;
}

BOOL __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_220(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_219 = result;
  return result;
}

- (void)runTrimQuery:(id)a3
{
  id v4;
  PLSQLStatement *v5;
  sqlite3 *v6;
  void *v7;
  PLSQLStatement *v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *context;
  void *v45;
  PLSQLiteConnection *v46;
  PLSQLStatement *v47;
  _QWORD v48[4];
  __CFString *v49;
  uint64_t v50;
  _QWORD block[4];
  __CFString *v52;
  uint64_t v53;
  _QWORD v54[4];
  __CFString *v55;
  uint64_t v56;
  int v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1BCC9E9B4]();
  v57 = 0;
  v5 = [PLSQLStatement alloc];
  v6 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v5, "initWithSQLQuery:forDatabase:withDBSem:result:", v4, v6, v7, &v57);

  v9 = &off_1E6A51000;
  v47 = v8;
  if (!v8 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare statement fail: query=%@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection runTrimQuery:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 742);

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    v8 = 0;
    v9 = &off_1E6A51000;
  }
  if (v57 == 11)
    +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, self);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v15 = objc_opt_class();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __35__PLSQLiteConnection_runTrimQuery___block_invoke;
    v54[3] = &unk_1E6A52828;
    v55 = CFSTR("trimming");
    v56 = v15;
    if (runTrimQuery__defaultOnce != -1)
      dispatch_once(&runTrimQuery__defaultOnce, v54);
    v16 = runTrimQuery__classDebugEnabled;

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trimming query: %@"), v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection runTrimQuery:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 747);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v8 = v47;
      v9 = &off_1E6A51000;
    }
  }
  v45 = v4;
  v22 = 0;
  if (v8)
  {
    v23 = CFSTR("changes");
    v46 = self;
    do
    {
      v24 = (void *)MEMORY[0x1BCC9E9B4]();
      -[PLSQLiteConnection performStatement:](self, "performStatement:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "intValue");

      v22 = (v22 + 1);
      if (objc_msgSend(v9[28], "debugEnabled"))
      {
        v29 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __35__PLSQLiteConnection_runTrimQuery___block_invoke_232;
        block[3] = &unk_1E6A52828;
        v52 = CFSTR("trimming");
        v53 = v29;
        if (runTrimQuery__defaultOnce_230 != -1)
          dispatch_once(&runTrimQuery__defaultOnce_230, block);
        v30 = runTrimQuery__classDebugEnabled_231;

        if (v30)
        {
          v31 = v23;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("run %d changes=%d"), v22, v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection runTrimQuery:]");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v34, v35, 756);

          PLLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v32;
            _os_log_debug_impl(&dword_1B6AB6000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v9 = &off_1E6A51000;
          v23 = v31;
          self = v46;
          v8 = v47;
        }
      }

      objc_autoreleasePoolPop(v24);
    }
    while ((_DWORD)v28);
  }
  if (objc_msgSend(v9[28], "debugEnabled"))
  {
    v37 = objc_opt_class();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __35__PLSQLiteConnection_runTrimQuery___block_invoke_237;
    v48[3] = &unk_1E6A52828;
    v49 = CFSTR("trimming");
    v50 = v37;
    if (runTrimQuery__defaultOnce_235 != -1)
      dispatch_once(&runTrimQuery__defaultOnce_235, v48);
    v38 = runTrimQuery__classDebugEnabled_236;

    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("runs=%d"), v22);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastPathComponent");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection runTrimQuery:]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v41, v42, 759);

      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v8 = v47;
    }
  }

  objc_autoreleasePoolPop(context);
}

BOOL __35__PLSQLiteConnection_runTrimQuery___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  runTrimQuery__classDebugEnabled = result;
  return result;
}

BOOL __35__PLSQLiteConnection_runTrimQuery___block_invoke_232(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  runTrimQuery__classDebugEnabled_231 = result;
  return result;
}

BOOL __35__PLSQLiteConnection_runTrimQuery___block_invoke_237(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  runTrimQuery__classDebugEnabled_236 = result;
  return result;
}

- (void)trimTable:(id)a3 fromDate:(id)a4 withFilter:(id)a5 withTrimLimit:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 == v11))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    if (v10)
      objc_msgSend(v10, "timeIntervalSince1970");
    else
      v14 = 0;
    objc_msgSend(v13, "stringWithFormat:", CFSTR("DELETE FROM '%@' WHERE ID IN (SELECT ID FROM '%@' WHERE (timestamp is NULL OR timestamp<%f) limit %ld);"),
      v16,
      v16,
      v14,
      a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM '%@' WHERE ID IN (SELECT ID FROM '%@' WHERE (%@) limit %ld);"),
      v16,
      v16,
      v11,
      a6);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection runTrimQuery:](self, "runTrimQuery:", v15);

}

- (BOOL)checkEmptyMasterTable:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("PLOLD_")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else if (-[PLSQLiteConnection tableExistsForTableName:](self, "tableExistsForTableName:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSQLiteConnection performQuery:](self, "performQuery:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rowCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "intValue") == 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)masterTableForTable:(id)a3 andType:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = objc_msgSend(v5, "rangeOfString:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    objc_msgSend((id)objc_opt_class(), "versionForTable:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%@"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_1E6A56538;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "substringToIndex:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), v13, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)versionForTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("PLOLD_")))
  {
    objc_msgSend(v3, "tokenizedByString:", CFSTR("_"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)removeIDIndexes
{
  PLSQLStatement *v3;
  sqlite3 *v4;
  void *v5;
  PLSQLStatement *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  PLSQLStatement *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v3 = [PLSQLStatement alloc];
  v4 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v3, "initWithSQLQuery:forDatabase:withDBSem:result:", CFSTR("select name from sqlite_master where type='index' and name like 'Index_PL%_ID';"),
         v4,
         v5,
         &v21);

  if (!v21)
  {
    v16 = v6;
    -[PLSQLStatement perform](v6, "perform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("name"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("DROP INDEX IF EXISTS '%@';"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    v6 = v16;
  }

}

- (void)removeEmptyOldTables
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  _QWORD block[4];
  __CFString *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name LIKE \"PLOLD_%%\" AND name NOT LIKE \"PLCoreStorage%%\";"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v38;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v3);
        v5 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLSQLiteConnection performQuery:](self, "performQuery:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count") == 1)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rowCount"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "intValue");

          if (!v11)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLSQLiteConnection dropTable:](self, "dropTable:", v12);

          }
          if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
          {
            v13 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke;
            block[3] = &unk_1E6A52828;
            v35 = CFSTR("removeEmptyOldTables");
            v36 = v13;
            if (removeEmptyOldTables_defaultOnce != -1)
              dispatch_once(&removeEmptyOldTables_defaultOnce, block);
            v14 = removeEmptyOldTables_classDebugEnabled;

            if (v14)
            {
              v15 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rowCount"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringWithFormat:", CFSTR("oldTable=%@ rowCount=%@"), v16, v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "lastPathComponent");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection removeEmptyOldTables]");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 853);

              PLLogCommon();
              v23 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
LABEL_20:

                goto LABEL_21;
              }
LABEL_23:
              *(_DWORD *)buf = 138412290;
              v42 = v19;
              _os_log_debug_impl(&dword_1B6AB6000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              goto LABEL_20;
            }
          }
        }
        else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v24 = objc_opt_class();
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke_270;
          v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v33[4] = v24;
          if (removeEmptyOldTables_defaultOnce_268 != -1)
            dispatch_once(&removeEmptyOldTables_defaultOnce_268, v33);
          if (removeEmptyOldTables_classDebugEnabled_269)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR! wrong results for countQuery: %@ results=%@"), v7, v8);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection removeEmptyOldTables]");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v26, v27, 855);

            PLLogCommon();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              goto LABEL_20;
            goto LABEL_23;
          }
        }
LABEL_21:

        ++v3;
      }
      while (v32 != v3);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      v32 = v28;
    }
    while (v28);
  }

}

BOOL __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  removeEmptyOldTables_classDebugEnabled = result;
  return result;
}

BOOL __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke_270(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  removeEmptyOldTables_classDebugEnabled_269 = result;
  return result;
}

- (void)dropTable:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[4];
  __CFString *v38;
  uint64_t v39;
  _BYTE v40[128];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __32__PLSQLiteConnection_dropTable___block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v38 = CFSTR("dropTable");
    v39 = v5;
    if (dropTable__defaultOnce != -1)
      dispatch_once(&dropTable__defaultOnce, block);
    v6 = dropTable__classDebugEnabled;

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %lu"), v4, objc_msgSend(v4, "rangeOfString:", CFSTR("%")));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection dropTable:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 864);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("%")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v41 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name LIKE \"%@\" AND name NOT LIKE \"PLCoreStorage%%\";"),
      v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSQLiteConnection performQuery:](self, "performQuery:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("name"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v17);
    }

    v4 = v28;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE '%@';"),
          *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v23);
  }

}

BOOL __32__PLSQLiteConnection_dropTable___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  dropTable__classDebugEnabled = result;
  return result;
}

- (void)dropTables:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PLSQLiteConnection dropTable:](self, "dropTable:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)hashEntryKeyKeys:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke;
  v3[3] = &unk_1E6A55990;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[4];
  __CFString *v18;
  uint64_t v19;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("UPDATE '%@' SET "), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      if (v7)
        objc_msgSend(v6, "appendString:", CFSTR(", "));
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("%@=''"), v8);

      ++v7;
    }
    while (objc_msgSend(v5, "count") > v7);
  }
  objc_msgSend(v6, "appendString:", CFSTR(";"));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke_2;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v18 = CFSTR("HashEntryKeys");
    v19 = v9;
    if (kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_defaultOnce, block);
    v10 = kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_classDebugEnabled;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hashUpdateQuery=%@"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection hashEntryKeyKeys:]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 901);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "performQuery:", v6);

}

BOOL __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (void)displaySchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "appendFormat:", CFSTR("pragma table_info('%@')"), v4);

  -[PLSQLiteConnection performQuery:](self, "performQuery:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Table info: %@"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection displaySchema:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 979);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_7;
      goto LABEL_8;
    }
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fail no query table info; query=%@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection displaySchema:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v14, v15, 978);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
LABEL_7:
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_8:

  }
}

BOOL __35__PLSQLiteConnection_performQuery___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  performQuery__classDebugEnabled = result;
  return result;
}

- (id)performQuery:(id)a3 returnValue:(int *)a4 returnResult:(BOOL)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  sqlite3 *dbConnection;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  char *errmsg;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    -[PLSQLiteConnection performQuery:](self, "performQuery:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    errmsg = 0;
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    dbConnection = self->_dbConnection;
    v12 = objc_retainAutorelease(v8);
    v13 = sqlite3_exec(dbConnection, (const char *)objc_msgSend(v12, "UTF8String"), 0, 0, &errmsg);
    v14 = v13;
    if (a4)
      *a4 = v13;
    if (v13)
    {
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v20 = v12;
        v21 = 1024;
        v22 = v14;
        v23 = 2080;
        v24 = errmsg;
        _os_log_error_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_ERROR, "Failed to execute query %@ - %d and %s", buf, 0x1Cu);
      }

      sqlite3_free(errmsg);
    }
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v16);

    v9 = 0;
  }

  return v9;
}

- (BOOL)tableExistsForTableName:(id)a3
{
  void *v3;
  BOOL v4;

  -[PLSQLiteConnection tableInfo:](self, "tableInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)tableInfo:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pragma 'main'.table_info('%@')"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSchemaVersion:(double)a3 forTableName:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@=\"%@\"), CFSTR("schemaVersion"), CFSTR("PLCoreStorage_schemaVersions"), CFSTR("tableName"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
      CFSTR("PLCoreStorage_schemaVersions"),
      CFSTR("schemaVersion"),
      *(_QWORD *)&a3,
      CFSTR("tableName"),
      v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ ('%@', '%@') VALUES ('%@', '%f')"), CFSTR("PLCoreStorage_schemaVersions"), CFSTR("tableName"), CFSTR("schemaVersion"), v7, *(_QWORD *)&a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v9);
}

- (double)schemaVersionForTable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@=\"%@\"), CFSTR("schemaVersion"), CFSTR("PLCoreStorage_schemaVersions"), CFSTR("tableName"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("schemaVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)setVersionHash:(id)a3 forTableName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@=\"%@\"), CFSTR("schemaVersion"), CFSTR("PLCoreStorage_schemaVersions"), CFSTR("tableName"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
      CFSTR("PLCoreStorage_schemaVersions"),
      CFSTR("schemaVersion"),
      v8,
      CFSTR("tableName"),
      v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ ('%@', '%@') VALUES ('%@', '%@')"), CFSTR("PLCoreStorage_schemaVersions"), CFSTR("tableName"), CFSTR("schemaVersion"), v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v10);
}

- (id)versionHashForTable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@=\"%@\"), CFSTR("schemaVersion"), CFSTR("PLCoreStorage_schemaVersions"), CFSTR("tableName"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("schemaVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)createTableName:(id)a3 withColumns:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id obj;
  _QWORD v32[4];
  __CFString *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[5];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLSQLiteConnection_createTableName_withColumns___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (createTableName_withColumns__defaultOnce != -1)
      dispatch_once(&createTableName_withColumns__defaultOnce, block);
    if (createTableName_withColumns__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating table: %@"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection createTableName:withColumns:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 1080);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v13 = (void *)objc_opt_new();
  v30 = v6;
  objc_msgSend(v13, "appendFormat:", CFSTR("CREATE TABLE IF NOT EXISTS '%@' ("), v6);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 1;
    v17 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if ((v16 & 1) == 0)
          objc_msgSend(v13, "appendString:", CFSTR(", "));
        objc_msgSend(v19, "objectForKey:", CFSTR("column-name"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", CFSTR("type"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("'%@' %@"), v20, v21);

        v16 = 0;
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v16 = 0;
    }
    while (v15);
  }

  objc_msgSend(v13, "appendString:", CFSTR(");"));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v22 = objc_opt_class();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __50__PLSQLiteConnection_createTableName_withColumns___block_invoke_335;
    v32[3] = &unk_1E6A52828;
    v33 = CFSTR("sqlCreate");
    v34 = v22;
    if (createTableName_withColumns__defaultOnce_333 != -1)
      dispatch_once(&createTableName_withColumns__defaultOnce_333, v32);
    v23 = createTableName_withColumns__classDebugEnabled_334;

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlCreate=%@"), v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection createTableName:withColumns:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v26, v27, 1091);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v29 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v13);

}

BOOL __50__PLSQLiteConnection_createTableName_withColumns___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createTableName_withColumns__classDebugEnabled = result;
  return result;
}

BOOL __50__PLSQLiteConnection_createTableName_withColumns___block_invoke_335(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  createTableName_withColumns__classDebugEnabled_334 = result;
  return result;
}

- (void)createIndexOnTable:(id)a3 forColumn:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLSQLiteConnection_createIndexOnTable_forColumn___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (createIndexOnTable_forColumn__defaultOnce != -1)
      dispatch_once(&createIndexOnTable_forColumn__defaultOnce, block);
    if (createIndexOnTable_forColumn__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating Index On: %@.%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection createIndexOnTable:forColumn:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 1096);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS \"Index_%@_%@\" ON \"%@\" (\"%@\");"),
    v6,
    v7,
    v6,
    v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v14);

}

BOOL __51__PLSQLiteConnection_createIndexOnTable_forColumn___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createIndexOnTable_forColumn__classDebugEnabled = result;
  return result;
}

- (void)createCompositeIndexOnTable:(id)a3 forColumns:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[5];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PLSQLiteConnection_createCompositeIndexOnTable_forColumns___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (createCompositeIndexOnTable_forColumns__defaultOnce != -1)
      dispatch_once(&createCompositeIndexOnTable_forColumns__defaultOnce, block);
    if (createCompositeIndexOnTable_forColumns__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating Index On: %@.%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection createCompositeIndexOnTable:forColumns:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 1103);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Index_%@_"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "appendString:", v21);
        objc_msgSend(v15, "appendFormat:", CFSTR(",%@"), v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v18);
  }

  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v15, "substringFromIndex:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@);"), v14, v6, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v24);
}

BOOL __61__PLSQLiteConnection_createCompositeIndexOnTable_forColumns___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createCompositeIndexOnTable_forColumns__classDebugEnabled = result;
  return result;
}

BOOL __38__PLSQLiteConnection_beginTransaction__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  beginTransaction_classDebugEnabled = result;
  return result;
}

BOOL __36__PLSQLiteConnection_endTransaction__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  endTransaction_classDebugEnabled = result;
  return result;
}

BOOL __67__PLSQLiteConnection_bindEntry_toPreparedStatement_atBindPosition___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  bindEntry_toPreparedStatement_atBindPosition__classDebugEnabled = result;
  return result;
}

BOOL __33__PLSQLiteConnection_writeEntry___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeEntry__classDebugEnabled_0 = result;
  return result;
}

BOOL __33__PLSQLiteConnection_writeEntry___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeEntry__classDebugEnabled_401 = result;
  return result;
}

- (void)writeDynamicEntriesToPPS:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  PLSQLStatement *v25;
  void *v26;
  sqlite3 *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  PLSQLiteConnection *v60;
  void *v61;
  void *v62;
  id v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition dynamicKeyConfigsForEntryKey:](PLEntryDefinition, "dynamicKeyConfigsForEntryKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dynamicKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v8;
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "entryKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_Dynamic"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLSQLiteConnection sortedSqlFormatedColumnNamesForTableInsert:](self, "sortedSqlFormatedColumnNamesForTableInsert:", v11);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v6, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v66 = v12;
    if (v14)
    {
      v15 = 0;
      do
      {
        if (v15)
          objc_msgSend(v12, "appendString:", CFSTR(", "));
        objc_msgSend(v12, "appendString:", CFSTR("?"));
        ++v15;
        objc_msgSend(v6, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        v12 = v66;
      }
      while (v17 > v15);
    }
    objc_msgSend(v12, "appendString:", CFSTR(")"));
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "appendFormat:", CFSTR("INSERT INTO \"%@\" ('FK_ID',"), v11);
    objc_msgSend(v18, "appendString:", v61);
    objc_msgSend(v18, "appendString:", CFSTR(" VALUES "));
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("(?, %@"), v12);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__PPSKVPairs__"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[PLSQLiteConnection writeDynamicEntriesToPPS:].cold.5();

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[PLSQLiteConnection writeDynamicEntriesToPPS:].cold.4(v20);

    if (objc_msgSend(v20, "count"))
    {
      v23 = 0;
      do
      {
        if (v23)
          objc_msgSend(v18, "appendString:", CFSTR(", "));
        objc_msgSend(v18, "appendString:", v19);
        ++v23;
      }
      while (objc_msgSend(v20, "count") > v23);
    }
    v58 = (void *)v19;
    objc_msgSend(v18, "appendString:", CFSTR(";"));
    PLLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[PLSQLiteConnection writeDynamicEntriesToPPS:].cold.3();

    v72 = 0;
    v25 = [PLSQLStatement alloc];
    v26 = v18;
    v27 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v26;
    v29 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v25, "initWithSQLQuery:forDatabase:withDBSem:result:", v26, v27, v28, &v72);

    v67 = (void *)v29;
    if (v29)
    {
      v57 = v11;
      v60 = self;
      v30 = v6;
      if (v72 == 11)
        +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, self);
      -[PLSQLiteConnection beginTransaction](self, "beginTransaction");
      v63 = v4;
      if (objc_msgSend(v20, "count"))
      {
        v31 = 0;
        v32 = 1;
        v62 = v20;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "entryID"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "bindValue:withFormater:atPosition:", v33, 5, v32);

          v32 = (v32 + 1);
          objc_msgSend(v20, "objectAtIndexedSubscript:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v65;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
          if (v36)
          {
            v37 = v36;
            v64 = v31;
            v38 = *(_QWORD *)v69;
            do
            {
              v39 = 0;
              v40 = v32;
              do
              {
                if (*(_QWORD *)v69 != v38)
                  objc_enumerationMutation(v35);
                v41 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v39);
                objc_msgSend(v34, "objectForKeyedSubscript:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "bindValue:withFormater:atPosition:", v42, +[PLEntry dataFormatForMetric:auxiliaryMetrics:](PLEntry, "dataFormatForMetric:auxiliaryMetrics:", v41, v30), v32 + v39);

                ++v39;
              }
              while (v37 != v39);
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
              LODWORD(v32) = v32 + v39;
            }
            while (v37);
            v32 = (v40 + v39);
            v20 = v62;
            v4 = v63;
            v31 = v64;
          }

          ++v31;
        }
        while (objc_msgSend(v20, "count") > v31);
      }
      -[PLSQLiteConnection performStatement:](v60, "performStatement:", v67);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v6 = v30;
      v11 = v57;
      if ((!v43 || !objc_msgSend(v43, "count")) && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v45 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "entryKey");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("Empty insert ID: Error while inserting dynamic entry for %@"), v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "lastPathComponent");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection writeDynamicEntriesToPPS:]");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v49, v50, 1455);

        PLLogCommon();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        v4 = v63;
      }
      -[PLSQLiteConnection endTransaction](v60, "endTransaction");
      v52 = v66;
      v53 = v58;
      v26 = v59;
    }
    else
    {
      PLLogCommon();
      v54 = objc_claimAutoreleasedReturnValue();
      v53 = v58;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[PLSQLiteConnection writeDynamicEntriesToPPS:].cold.1();

      v55 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "entryKey");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringWithFormat:", CFSTR("%@_%@"), v44, CFSTR("Dynamic"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSQLiteConnection displaySchema:](self, "displaySchema:", v56);

      v52 = v66;
    }

  }
}

BOOL __42__PLSQLiteConnection_writeDynamicEntries___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeDynamicEntries__classDebugEnabled = result;
  return result;
}

BOOL __42__PLSQLiteConnection_writeDynamicEntries___block_invoke_441(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  writeDynamicEntries__classDebugEnabled_440 = result;
  return result;
}

BOOL __40__PLSQLiteConnection_writeArrayEntries___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeArrayEntries__classDebugEnabled = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateEntry__classDebugEnabled = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke_468(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateEntry__classDebugEnabled_467 = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke_473(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateEntry__classDebugEnabled_472 = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke_478(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateEntry__classDebugEnabled_477 = result;
  return result;
}

- (void)deleteEntryForKey:(id)a3 withRowID:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD block[4];
  __CFString *v18;
  uint64_t v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM '%@' WHERE ID=%lld;"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __50__PLSQLiteConnection_deleteEntryForKey_withRowID___block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v18 = CFSTR("delete");
    v19 = v8;
    if (deleteEntryForKey_withRowID__defaultOnce != -1)
      dispatch_once(&deleteEntryForKey_withRowID__defaultOnce, block);
    v9 = deleteEntryForKey_withRowID__classDebugEnabled;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlDelete=%@"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection deleteEntryForKey:withRowID:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 1755);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v15 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v7);
  +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLEntryDefinition hasArrayKeysForEntryDefinition:](PLEntryDefinition, "hasArrayKeysForEntryDefinition:", v16))
  {
    -[PLSQLiteConnection deleteArrayEntriesForKey:withRowID:](self, "deleteArrayEntriesForKey:withRowID:", v6, a4);
  }
  if (+[PLEntryDefinition hasDynamicKeysForEntryDefinition:](PLEntryDefinition, "hasDynamicKeysForEntryDefinition:", v16))
  {
    -[PLSQLiteConnection deleteDynamicEntriesForKey:withRowID:](self, "deleteDynamicEntriesForKey:withRowID:", v6, a4);
  }

}

BOOL __50__PLSQLiteConnection_deleteEntryForKey_withRowID___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  deleteEntryForKey_withRowID__classDebugEnabled = result;
  return result;
}

BOOL __59__PLSQLiteConnection_deleteDynamicEntriesForKey_withRowID___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  deleteDynamicEntriesForKey_withRowID__classDebugEnabled = result;
  return result;
}

- (void)deleteArrayEntriesForKey:(id)a3 withRowID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  _UNKNOWN **v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  const __CFString *v18;
  id v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  PLSQLiteConnection *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  _QWORD block[4];
  __CFString *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition arrayKeysForEntryDefinition:](PLEntryDefinition, "arrayKeysForEntryDefinition:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = CFSTR("DELETE FROM '%@_Array_%@' WHERE FK_ID=%lld;");
    v12 = 0x1E0CB3000uLL;
    v13 = &off_1E6A51000;
    v30 = *(_QWORD *)v35;
    v27 = self;
    do
    {
      v14 = 0;
      v28 = v10;
      do
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", v11, v6, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14), a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13[28], "debugEnabled"))
        {
          v16 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __57__PLSQLiteConnection_deleteArrayEntriesForKey_withRowID___block_invoke;
          block[3] = &unk_1E6A52828;
          v32 = CFSTR("delete");
          v33 = v16;
          if (deleteArrayEntriesForKey_withRowID__defaultOnce != -1)
            dispatch_once(&deleteArrayEntriesForKey_withRowID__defaultOnce, block);
          v17 = deleteArrayEntriesForKey_withRowID__classDebugEnabled;

          if (v17)
          {
            v18 = v11;
            v19 = v6;
            v20 = a4;
            objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", CFSTR("sqlDelete=%@"), v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v12 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lastPathComponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v12 + 2368), "stringWithUTF8String:", "-[PLSQLiteConnection deleteArrayEntriesForKey:withRowID:]");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v23, v24, 1779);

            PLLogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v21;
              _os_log_debug_impl(&dword_1B6AB6000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            a4 = v20;
            v6 = v19;
            v11 = v18;
            self = v27;
            v10 = v28;
            v12 = 0x1E0CB3000;
            v13 = &off_1E6A51000;
          }
        }
        v26 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v15);

        ++v14;
      }
      while (v10 != v14);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }

}

BOOL __57__PLSQLiteConnection_deleteArrayEntriesForKey_withRowID___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  deleteArrayEntriesForKey_withRowID__classDebugEnabled = result;
  return result;
}

- (void)deleteAllEntriesForKey:(id)a3 withFilters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[4];
  __CFString *v18;
  uint64_t v19;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("DELETE FROM '%@'"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" AND "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("WHERE %@ "), v8);

  }
  objc_msgSend(v7, "appendString:", CFSTR(";"));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __57__PLSQLiteConnection_deleteAllEntriesForKey_withFilters___block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v18 = CFSTR("delete");
    v19 = v9;
    if (deleteAllEntriesForKey_withFilters__defaultOnce != -1)
      dispatch_once(&deleteAllEntriesForKey_withFilters__defaultOnce, block);
    v10 = deleteAllEntriesForKey_withFilters__classDebugEnabled;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlDelete=%@"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection deleteAllEntriesForKey:withFilters:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 1791);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v16 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v7);

}

BOOL __57__PLSQLiteConnection_deleteAllEntriesForKey_withFilters___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  deleteAllEntriesForKey_withFilters__classDebugEnabled = result;
  return result;
}

- (void)setAllNullValuesForEntryKey:(id)a3 forKey:(id)a4 toValue:(id)a5 withFilters:(id)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("UPDATE %@ SET \"%@\" = %@ WHERE \"%@\" IS NULL"), a3, a4, a5, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "appendFormat:", CFSTR(" AND %@"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  v17 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v11);
}

BOOL __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  entriesForKey_withProperties__classDebugEnabled = result;
  return result;
}

BOOL __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke_531(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  entriesForKey_withProperties__classDebugEnabled_530 = result;
  return result;
}

- (id)entriesForKey:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *context;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x1BCC9E9B4]();
  v8 = (void *)objc_opt_new();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        +[PLEntry entryWithEntryKey:withData:](PLEntry, "entryWithEntryKey:withData:", v6, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setExistsInDB:", 1);
        objc_msgSend(v8, "addObject:", v14);
        if (objc_msgSend(v14, "hasDynamicKeys"))
          -[PLSQLiteConnection loadDynamicValuesIntoEntry:](self, "loadDynamicValuesIntoEntry:", v14);
        if (objc_msgSend(v14, "hasArrayKeys"))
          -[PLSQLiteConnection loadArrayValuesIntoEntry:](self, "loadArrayValuesIntoEntry:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(context);
  return v8;
}

- (void)moveDatabaseToPath:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;

  v4 = a3;
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    if (-[PLSQLiteConnection dbConnection](self, "dbConnection"))
    {
      -[PLSQLiteConnection copyDatabase:](self, "copyDatabase:", v4);
      if (_sqlite3_db_truncate())
      {
        PLLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          -[PLSQLiteConnection moveDatabaseToPath:].cold.1();

      }
    }
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v7);

  }
}

- (BOOL)truncateDB
{
  NSObject *v3;
  int v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    return 0;
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!-[PLSQLiteConnection dbConnection](self, "dbConnection"))
  {
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v8);

    return 0;
  }
  v4 = _sqlite3_db_truncate();
  v5 = v4 == 0;
  if (v4)
  {
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[PLSQLiteConnection moveDatabaseToPath:].cold.1();

  }
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v7);

  return v5;
}

- (void)closeConnection
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[16];

  -[PLSQLiteConnection dbSem](self, "dbSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (-[PLSQLiteConnection dbConnection](self, "dbConnection"))
  {
    PLLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Closing dbConnection!", buf, 2u);
    }

    sqlite3_close(-[PLSQLiteConnection dbConnection](self, "dbConnection"));
    -[PLSQLiteConnection setDbConnection:](self, "setDbConnection:", 0);
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v5);

  }
  else
  {
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v6);

  }
}

- (void)vacuum
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  uint8_t v14[16];
  _QWORD block[4];
  __CFString *v16;
  uint64_t v17;

  if (+[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("Vacuum"), 1))
  {
    -[PLSQLiteConnection transactionLock](self, "transactionLock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__PLSQLiteConnection_vacuum__block_invoke;
      block[3] = &unk_1E6A52828;
      v16 = CFSTR("Vacuum");
      v17 = v4;
      if (vacuum_defaultOnce != -1)
        dispatch_once(&vacuum_defaultOnce, block);
      v5 = vacuum_classDebugEnabled;

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Vacuum!"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection vacuum]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 1981);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (-[PLSQLiteConnection isTransactionInProgress](self, "isTransactionInProgress"))
    {
      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "Vacuuming whilst in a critical data section!", v14, 2u);
      }

    }
    if (-[PLSQLiteConnection isIncrementalVacuumEnabled](self, "isIncrementalVacuumEnabled"))
      v12 = CFSTR("PRAGMA incremental_vacuum;");
    else
      v12 = CFSTR("VACUUM;");
    v13 = -[PLSQLiteConnection performQuery:](self, "performQuery:", v12);
    objc_sync_exit(v3);

  }
}

BOOL __28__PLSQLiteConnection_vacuum__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  vacuum_classDebugEnabled = result;
  return result;
}

- (void)fullVacuum
{
  id v3;
  id obj;

  -[PLSQLiteConnection transactionLock](self, "transactionLock");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = -[PLSQLiteConnection performQuery:](self, "performQuery:", CFSTR("VACUUM;"));
  objc_sync_exit(obj);

}

- (BOOL)passesIntegrityCheck
{
  NSObject *v3;
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  -[PLSQLiteConnection filePath](self, "filePath");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  v5 = _sqlite3_integrity_check();

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "Integrity check result: %d", (uint8_t *)v9, 8u);
  }

  -[PLSQLiteConnection dbSem](self, "dbSem");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v7);

  return v5 == 0;
}

- (void)setJournalMode:(signed __int16)a3
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t block;
  uint64_t v19;
  BOOL (*v20)(uint64_t);
  void *v21;
  __CFString *v22;
  uint64_t v23;

  v3 = a3;
  if (a3 == 1)
  {
    v4 = CFSTR("PRAGMA journal_mode = DELETE;");
    goto LABEL_5;
  }
  if (!a3)
  {
    v4 = CFSTR("PRAGMA journal_mode = WAL;");
LABEL_5:
    -[PLSQLiteConnection performQuery:](self, "performQuery:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** ERROR *** invalid journalMode=%d"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection setJournalMode:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 2017);

    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  v5 = 0;
LABEL_11:
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v11 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v20 = __37__PLSQLiteConnection_setJournalMode___block_invoke;
    v21 = &unk_1E6A52828;
    v19 = 3221225472;
    v22 = CFSTR("journalMode");
    v23 = v11;
    if (setJournalMode__defaultOnce != -1)
      dispatch_once(&setJournalMode__defaultOnce, &block);
    v12 = setJournalMode__classDebugEnabled;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("journalMode=%d result=%@"), v3, v5, block, v19, v20, v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLiteConnection setJournalMode:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 2020);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

BOOL __37__PLSQLiteConnection_setJournalMode___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  setJournalMode__classDebugEnabled = result;
  return result;
}

- (BOOL)copyDatabase:(id)a3
{
  int v3;
  NSObject *v4;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v3 = _sqlite3_db_copy();
  if (v3)
  {
    PLLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[PLSQLiteConnection copyDatabase:].cold.1();

  }
  return v3 == 0;
}

- (BOOL)copyDatabaseToPath:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  LOBYTE(v5) = -[PLSQLiteConnection copyDatabase:](self, "copyDatabase:", v4);
  -[PLSQLiteConnection dbSem](self, "dbSem");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  return (char)v5;
}

- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return -[PLSQLiteConnection copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:](self, "copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:", a3, a4, a5, 0, 1);
}

- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5 withTableFilters:(id)a6 vacuumDB:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  LOBYTE(v7) = -[PLSQLiteConnection copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:withCacheSize:](self, "copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:withCacheSize:", v15, v14, v13, v12, v7, -[PLSQLiteConnection cacheSize](self, "cacheSize"));

  return v7;
}

- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5 withTableFilters:(id)a6 vacuumDB:(BOOL)a7 withCacheSize:(int64_t)a8
{
  _BOOL4 v9;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  PLSQLiteConnection *v20;
  PLSQLiteConnection *v21;

  v9 = a7;
  v14 = a3;
  v15 = (unint64_t)a4;
  v16 = (unint64_t)a5;
  v17 = a6;
  v18 = (void *)MEMORY[0x1BCC9E9B4]();
  v19 = -[PLSQLiteConnection copyDatabaseToPath:](self, "copyDatabaseToPath:", v14);
  if (v19)
  {
    v20 = -[PLSQLiteConnection initWithFilePath:withCacheSize:]([PLSQLiteConnection alloc], "initWithFilePath:withCacheSize:", v14, a8);
    v21 = v20;
    if (v15 | v16)
      -[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:](v20, "trimAllTablesFromDate:toDate:withTableFilters:", v15, v16, v17);
    if (v9)
      -[PLSQLiteConnection vacuum](v21, "vacuum");
    -[PLSQLiteConnection closeConnection](v21, "closeConnection");

  }
  objc_autoreleasePoolPop(v18);

  return v19;
}

- (id)cachedStatementForMetadataInsert
{
  PLSQLStatement *v3;
  sqlite3 *v4;
  void *v5;
  PLSQLStatement *v6;
  PLSQLStatement *metadataStmt;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PLSQLStatement *v16;
  int v18;

  if (!self->_metadataStmtCreated)
  {
    v18 = 0;
    v3 = [PLSQLStatement alloc];
    v4 = -[PLSQLiteConnection dbConnection](self, "dbConnection");
    -[PLSQLiteConnection dbSem](self, "dbSem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v3, "initWithSQLQuery:forDatabase:withDBSem:result:", CFSTR("INSERT INTO PLCoreStorage_Metadata_Dynamic (FK_ID, build, name, version, metadata) VALUES (?, ?, ?, ?, ?)"), v4, v5, &v18);
    metadataStmt = self->_metadataStmt;
    self->_metadataStmt = v6;

    if (v18)
    {
      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PLSQLiteConnection cachedStatementForMetadataInsert].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

      v16 = self->_metadataStmt;
      self->_metadataStmt = 0;

    }
    self->_metadataStmtCreated = 1;
  }
  return self->_metadataStmt;
}

- (void)writeMetadata:(id)a3 forFKID:(id)a4 build:(id)a5 name:(id)a6 version:(double)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[PLSQLiteConnection cachedStatementForMetadataInsert](self, "cachedStatementForMetadataInsert");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "bindValue:withFormater:atPosition:", v12, 5, 1);
    objc_msgSend(v16, "bindValue:withFormater:atPosition:", v13, 1, 2);
    objc_msgSend(v16, "bindValue:withFormater:atPosition:", v14, 1, 3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bindValue:withFormater:atPosition:", v17, 6, 4);

    objc_msgSend(v16, "bindValue:withFormater:atPosition:", v19, 7, 5);
    v18 = -[PLSQLiteConnection performStatement:](self, "performStatement:", v16);
  }

}

- (void)freeMetadataState
{
  PLSQLStatement *metadataStmt;

  metadataStmt = self->_metadataStmt;
  self->_metadataStmt = 0;

  self->_metadataStmtCreated = 0;
}

- (BOOL)attachDB:(id)a3 withName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATTACH DATABASE '%@' AS '%@';"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", v7, &v12, 0);

  sqlConnectionHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 1024;
    v16 = v12;
    _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "attach DB ('%@') return value '%d'", buf, 0x12u);
  }

  v10 = v12 == 0;
  return v10;
}

- (BOOL)detachDB:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DETACH DATABASE '%@';"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", v5, &v10, 0);

  sqlConnectionHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 1024;
    v14 = v10;
    _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "detach DB ('%@') return value '%d'", buf, 0x12u);
  }

  v8 = v10 == 0;
  return v8;
}

- (BOOL)copyTable:(id)a3 fromConnection:(id)a4 withDBName:(id)a5 withProperties:(id)a6 andAttach:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v7 = a7;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (-[PLSQLiteConnection tableExistsForTableName:](self, "tableExistsForTableName:", v12))
  {
    sqlConnectionHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_INFO, "table (%@) already exists", (uint8_t *)&v22, 0xCu);
    }
LABEL_20:
    v19 = 0;
LABEL_21:

    goto LABEL_22;
  }
  if ((objc_msgSend(v13, "tableExistsForTableName:", v12) & 1) == 0)
  {
    sqlConnectionHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "filePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_INFO, "table ('%@') does not exist in source database (%@)", (uint8_t *)&v22, 0x16u);

    }
    goto LABEL_20;
  }
  if (!v7)
  {
    if (-[PLSQLiteConnection copyTable:fromDBName:withProperties:](self, "copyTable:fromDBName:withProperties:", v12, v14, v15))
    {
      goto LABEL_15;
    }
LABEL_16:
    sqlConnectionHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PLSQLiteConnection copyTable:fromConnection:withDBName:withProperties:andAttach:].cold.2();
    goto LABEL_20;
  }
  objc_msgSend(v13, "filePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PLSQLiteConnection attachDB:withName:](self, "attachDB:withName:", v17, v14);

  if (!v18)
  {
    sqlConnectionHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PLSQLiteConnection copyTable:fromConnection:withDBName:withProperties:andAttach:].cold.3(v13);
    goto LABEL_20;
  }
  if (!-[PLSQLiteConnection copyTable:fromDBName:withProperties:](self, "copyTable:fromDBName:withProperties:", v12, v14, v15))goto LABEL_16;
  if (!-[PLSQLiteConnection detachDB:](self, "detachDB:", v14))
  {
    sqlConnectionHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PLSQLiteConnection copyTable:fromConnection:withDBName:withProperties:andAttach:].cold.1((uint64_t)v14, v13);
    v19 = 1;
    goto LABEL_21;
  }
LABEL_15:
  v19 = 1;
LABEL_22:

  return v19;
}

- (BOOL)copyTable:(id)a3 fromDBName:(id)a4 withProperties:(id)a5
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v43;
  NSObject *v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  int v52;
  uint8_t buf[4];
  NSObject *v54;
  __int16 v55;
  NSObject *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PLSQLiteConnection beginTransaction](self, "beginTransaction");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM '%@'.sqlite_schema WHERE name = '%@'"), v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection performQuery:](self, "performQuery:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sql"));
    v14 = objc_claimAutoreleasedReturnValue();

    sqlConnectionHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v54 = v8;
      v55 = 2112;
      v56 = v14;
      _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_DEFAULT, "creating table \"%@\" with schema query '%@'", buf, 0x16u);
    }

    v52 = 0;
    v16 = -[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", v14, &v52, 0);
    v17 = v52;
    sqlConnectionHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.6();
      v20 = 0;
      goto LABEL_29;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v54 = v8;
      v55 = 2112;
      v56 = v10;
      _os_log_impl(&dword_1B6AB6000, v19, OS_LOG_TYPE_INFO, "copying entries to \"%@\" with properties %@", buf, 0x16u);
    }

    -[PLSQLiteConnection sqlFormatedColumnNamesForTableInsert:](self, "sqlFormatedColumnNamesForTableInsert:", v8);
    v19 = objc_claimAutoreleasedReturnValue();
    -[PLSQLiteConnection sqlFormatedColumnNamesForTableSelect:withSystemOffset:](self, "sqlFormatedColumnNamesForTableSelect:withSystemOffset:", v8, 0.0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    v51 = v10;
    -[PLSQLiteConnection sqlPropertiesAsString:](self, "sqlPropertiesAsString:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v21;
    objc_msgSend(v22, "stringWithFormat:", CFSTR("SELECT %@ FROM '%@'.'%@' %@"), v21, v9, v8, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO '%@' (%@) %@"), v8, v19, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    sqlConnectionHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.5();

    v27 = -[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", v25, &v52, 0);
    if (v52)
    {
      sqlConnectionHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.4();

      -[PLSQLiteConnection endTransaction](self, "endTransaction");
LABEL_19:
      v20 = 0;
LABEL_28:

      v10 = v51;
LABEL_29:

      goto LABEL_30;
    }
    -[NSObject objectForKeyedSubscript:](v51, "objectForKeyedSubscript:", CFSTR("uuid"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      -[PLSQLiteConnection sqlPropertiesAsString:](self, "sqlPropertiesAsString:", v51);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("SELECT IFNULL(MIN(ID), -1) as startID, IFNULL(MAX(ID), -1) as endID FROM '%@'.'%@' %@"), v9, v8, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v32;
      sqlConnectionHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.3();

      -[PLSQLiteConnection performQuery:](self, "performQuery:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        sqlConnectionHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.2();

        goto LABEL_19;
      }
      v47 = v24;
      v49 = v33;
      v36 = v35;
      objc_msgSend(v35, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("startID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v38, "intValue");

      v48 = v36;
      objc_msgSend(v36, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("endID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v40, "intValue");

      PLLogSubmission();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject objectForKeyedSubscript:](v51, "objectForKeyedSubscript:", CFSTR("uuid"));
        v44 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v54 = v44;
        v55 = 2112;
        v56 = v8;
        v57 = 1024;
        v58 = v46;
        v59 = 1024;
        v60 = v45;
        _os_log_debug_impl(&dword_1B6AB6000, v41, OS_LOG_TYPE_DEBUG, "Copy Session UUID = %@, table = '%@', startID = %d, endID = %d", buf, 0x22u);

      }
      v24 = v47;
    }
    -[PLSQLiteConnection endTransaction](self, "endTransaction");
    v20 = 1;
    goto LABEL_28;
  }
  sqlConnectionHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.1();
  v20 = 0;
LABEL_30:

  return v20;
}

- (id)sqlPropertiesAsString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WHERE"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WHERE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WHERE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" AND "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ %@ "), CFSTR("WHERE"), v10);

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ORDER BY"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ORDER BY"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v14)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ "), CFSTR("ORDER BY"));
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v3;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ORDER BY"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v17;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 1;
        v21 = *(_QWORD *)v33;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v22);
            if ((v20 & 1) == 0)
              objc_msgSend(v4, "appendString:", CFSTR(", "));
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ORDER BY"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "BOOLValue");
            v27 = CFSTR("ASC");
            if (v26)
              v27 = CFSTR("DESC");
            objc_msgSend(v4, "appendFormat:", CFSTR("%@ %@"), v23, v27);

            v20 = 0;
            ++v22;
          }
          while (v19 != v22);
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          v20 = 0;
        }
        while (v19);
      }

      objc_msgSend(v4, "appendString:", CFSTR(" "));
      v3 = v15;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LIMIT"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LIMIT"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@ %@ "), CFSTR("LIMIT"), v29);

  }
  return v4;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDbConnection:(sqlite3 *)a3
{
  self->_dbConnection = a3;
}

- (void)setDbSem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setPreparedStatements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setPreparedUpdateStatements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setPreparedDynamicStatements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setTransactionLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setCachedClassName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int)entryCacheStorageSize
{
  return self->_entryCacheStorageSize;
}

- (void)setEntryCacheStorageSize:(int)a3
{
  self->_entryCacheStorageSize = a3;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (BOOL)metadataStmtCreated
{
  return self->_metadataStmtCreated;
}

- (void)setMetadataStmtCreated:(BOOL)a3
{
  self->_metadataStmtCreated = a3;
}

- (PLSQLStatement)metadataStmt
{
  return (PLSQLStatement *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMetadataStmt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataStmt, 0);
  objc_storeStrong((id *)&self->_cachedClassName, 0);
  objc_storeStrong((id *)&self->_transactionLock, 0);
  objc_storeStrong((id *)&self->_preparedDynamicStatements, 0);
  objc_storeStrong((id *)&self->_preparedUpdateStatements, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_storeStrong((id *)&self->_dbSem, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)openCurrentFileWithCacheSize:withFlags:.cold.1()
{
  NSObject *v0;
  sqlite3 **v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(v1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_0(&dword_1B6AB6000, v0, v2, "failed to open conn(%d): %s", v3);
  OUTLINED_FUNCTION_2_1();
}

- (void)openCurrentFileWithCacheSize:(void *)a1 withFlags:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "filePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14_0(&dword_1B6AB6000, v2, v3, "DB Cache size %ld %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_3();
}

- (void)mergeDataFromOtherDBFile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "FilePath nil in mergeDb call. Aborting merge", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)mergeDataFromOtherDBFile:(int *)a1 .cold.2(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "MERGE Detaching failed %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)mergeDataFromOtherDBFile:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_4(&dword_1B6AB6000, v0, v1, "MERGE Attaching %@ as mergeDB failed %d");
  OUTLINED_FUNCTION_1_0();
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "MERGE : Done merging table %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "MERGE : *****  ERROR : merge count does not add up ******", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_175_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "SQL query to be executed is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeDynamicEntriesToPPS:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Prepare statement fail: entry=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeDynamicEntriesToPPS:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "writeDynamic=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeDynamicEntriesToPPS:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_14_0(&dword_1B6AB6000, v1, v2, "DynamicArray=%@ and count %lu", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)writeDynamicEntriesToPPS:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "DynamicEntry %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)moveDatabaseToPath:.cold.1()
{
  sqlite3 **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(v0);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_13_0(&dword_1B6AB6000, v1, v2, "Failed to truncate db %d : %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)copyDatabase:.cold.1()
{
  NSObject *v0;
  sqlite3 **v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(v1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_0(&dword_1B6AB6000, v0, v2, "Failed to copy db %d : %s", v3);
  OUTLINED_FUNCTION_2_1();
}

- (void)cachedStatementForMetadataInsert
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "Failed to prepare metadata insert stmt!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)copyTable:(uint64_t)a1 fromConnection:(void *)a2 withDBName:withProperties:andAttach:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "filePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1B6AB6000, v3, v4, "failed to detach DB '%@' (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_8_3();
}

- (void)copyTable:fromConnection:withDBName:withProperties:andAttach:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_3();
  v3 = v0;
  _os_log_error_impl(&dword_1B6AB6000, v1, OS_LOG_TYPE_ERROR, "failed to copy table '%@' from '%@'", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyTable:(void *)a1 fromConnection:withDBName:withProperties:andAttach:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "filePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_12(&dword_1B6AB6000, v2, v3, "failed to attach DB at '%@' as '%@'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_3();
}

- (void)copyTable:fromDBName:withProperties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "skipping, cannot find table schema (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyTable:fromDBName:withProperties:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "skipping, cannot determine range with query (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyTable:fromDBName:withProperties:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "performing debug query '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyTable:fromDBName:withProperties:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_4(&dword_1B6AB6000, v0, v1, "failed to perform insert query '%@' with return value %d");
  OUTLINED_FUNCTION_1_0();
}

- (void)copyTable:fromDBName:withProperties:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "performing '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyTable:fromDBName:withProperties:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_4(&dword_1B6AB6000, v0, v1, "failed to perform schema query '%@' with return value %d");
  OUTLINED_FUNCTION_1_0();
}

@end
