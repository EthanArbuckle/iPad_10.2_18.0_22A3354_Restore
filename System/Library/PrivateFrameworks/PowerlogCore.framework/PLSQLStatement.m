@implementation PLSQLStatement

- (int)bindValue:(id)a3 withFormater:(signed __int16)a4 atPosition:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  id v10;
  sqlite3_stmt *v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  sqlite3_stmt *v26;
  int v27;
  sqlite3_stmt *v28;
  double v29;
  sqlite3_stmt *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  if ((_DWORD)v6 == -32768
    || +[PLValueUtilties isFormater:validForObject:](PLValueUtilties, "isFormater:validForObject:", v6, v8))
  {
    -[PLSQLStatement dbSem](self, "dbSem");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

    if (!v8
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v10 = (id)objc_claimAutoreleasedReturnValue(),
          v10,
          v10 == v8))
    {
      v13 = sqlite3_bind_null(-[PLSQLStatement statement](self, "statement"), v5);
    }
    else
    {
      switch((int)v6)
      {
        case 0:
          v11 = -[PLSQLStatement statement](self, "statement");
          v12 = objc_msgSend(v8, "count") != 0;
          goto LABEL_23;
        case 1:
          v25 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
          goto LABEL_20;
        case 2:
          v28 = -[PLSQLStatement statement](self, "statement");
          objc_msgSend(v8, "timeIntervalSince1970");
          goto LABEL_26;
        case 3:
          v11 = -[PLSQLStatement statement](self, "statement");
          v12 = objc_msgSend(v8, "BOOLValue");
LABEL_23:
          v13 = sqlite3_bind_int(v11, v5, v12);
          break;
        case 4:
          goto LABEL_29;
        case 5:
          v13 = sqlite3_bind_int64(-[PLSQLStatement statement](self, "statement"), v5, objc_msgSend(v8, "longLongValue"));
          break;
        case 6:
          v28 = -[PLSQLStatement statement](self, "statement");
          objc_msgSend(v8, "doubleValue");
LABEL_26:
          v13 = sqlite3_bind_double(v28, v5, v29);
          break;
        case 7:
          if (!objc_msgSend(v8, "length"))
            goto LABEL_29;
          v30 = -[PLSQLStatement statement](self, "statement");
          v31 = objc_retainAutorelease(v8);
          v13 = sqlite3_bind_blob(v30, v5, (const void *)objc_msgSend(v31, "bytes"), objc_msgSend(v31, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          break;
        default:
          if ((_DWORD)v6 != -32768)
          {
LABEL_29:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid formatter=%i"), v6);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "lastPathComponent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLStatement bindValue:withFormater:atPosition:]");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v34, v35, 75);

            PLLogCommon();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

            v14 = 0;
            goto LABEL_9;
          }
          objc_msgSend(v8, "description");
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v25 = (const char *)objc_msgSend(v24, "UTF8String");

LABEL_20:
          v26 = -[PLSQLStatement statement](self, "statement");
          v27 = strlen(v25);
          v13 = sqlite3_bind_text(v26, v5, v25, v27, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          break;
      }
    }
    v14 = v13;
LABEL_9:
    -[PLSQLStatement dbSem](self, "dbSem");
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v15);
  }
  else
  {
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v14 = 20;
      goto LABEL_11;
    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = objc_opt_class();
    objc_msgSend(v8, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("*** formater does not match object type! ***\nposition=%d formater=%d class=%@ value=%@\n"), v5, v6, v18, v19);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLStatement bindValue:withFormater:atPosition:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v21, v22, 51);

    PLLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    v14 = 20;
  }

LABEL_11:
  return v14;
}

- (OS_dispatch_semaphore)dbSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 24, 1);
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (PLSQLStatement)initWithSQLQuery:(id)a3 forDatabase:(sqlite3 *)a4 withDBSem:(id)a5 result:(int *)a6
{
  id v10;
  id v11;
  PLSQLStatement *v12;
  PLSQLStatement *v13;
  NSObject *v14;
  int v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  PLSQLStatement *v24;
  NSObject *v25;
  objc_super v27;

  v10 = a3;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PLSQLStatement;
  v12 = -[PLSQLStatement init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dbSem, a5);
    v13->_isInsert = objc_msgSend(v10, "hasPrefix:", CFSTR("INSERT INTO "));
    v13->_isDelete = objc_msgSend(v10, "hasPrefix:", CFSTR("DELETE FROM "));
    -[PLSQLStatement dbSem](v13, "dbSem");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

    if (a4)
    {
      v15 = 5;
      do
      {
        v16 = objc_retainAutorelease(v10);
        v17 = sqlite3_prepare_v2(a4, (const char *)objc_msgSend(v16, "UTF8String"), -1, &v13->_statement, 0);
        *a6 = v17;
        if (!v17)
        {
          -[PLSQLStatement dbSem](v13, "dbSem");
          v25 = objc_claimAutoreleasedReturnValue();
          dispatch_semaphore_signal(v25);

          goto LABEL_12;
        }
        --v15;
      }
      while (v15);
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to prepare statement (error=%d, msg=%s) %@"), *a6, sqlite3_errmsg(a4), v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 38);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[PLSQLStatement dbSem](v13, "dbSem");
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v23);

    v24 = 0;
  }
  else
  {
LABEL_12:
    v24 = v13;
  }

  return v24;
}

- (void)dealloc
{
  objc_super v3;

  -[PLSQLStatement finalize](self, "finalize");
  v3.receiver = self;
  v3.super_class = (Class)PLSQLStatement;
  -[PLSQLStatement dealloc](&v3, sel_dealloc);
}

- (void)finalize
{
  NSObject *v3;
  NSObject *v4;

  -[PLSQLStatement dbSem](self, "dbSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_clear_bindings(-[PLSQLStatement statement](self, "statement"));
  sqlite3_reset(-[PLSQLStatement statement](self, "statement"));
  sqlite3_finalize(-[PLSQLStatement statement](self, "statement"));
  -[PLSQLStatement dbSem](self, "dbSem");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

- (void)reset
{
  NSObject *v3;
  NSObject *v4;

  -[PLSQLStatement dbSem](self, "dbSem");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_clear_bindings(-[PLSQLStatement statement](self, "statement"));
  sqlite3_reset(-[PLSQLStatement statement](self, "statement"));
  -[PLSQLStatement dbSem](self, "dbSem");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v4);

}

- (id)perform
{
  void *v3;
  void *v4;
  NSObject *v5;
  sqlite3_stmt *v6;
  _UNKNOWN **v7;
  sqlite3_stmt *v8;
  int v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  const unsigned __int8 *v33;
  void *v34;
  void *v35;
  id v36;
  const void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  PLSQLStatement *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[PLSQLStatement dbSem](self, "dbSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = -[PLSQLStatement statement](self, "statement");
  v7 = &off_1E6A51000;
  if (v6)
  {
    v8 = v6;
    v54 = self;
    v9 = sqlite3_column_count(v6);
    v10 = 0;
    v56 = v9;
    v57 = v9;
    v11 = 0x1E0CB3000uLL;
    v55 = v3;
    while (1)
    {
      while (1)
      {
        v12 = sqlite3_step(v8);
        if ((_DWORD)v12 == 5)
          break;
        v13 = v12;
        if ((_DWORD)v12 == 100)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v56;
          if ((int)v57 >= 1)
          {
            v21 = 0;
            do
            {
              if (objc_msgSend(v4, "count") == v57)
              {
                objc_msgSend(v4, "objectAtIndex:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", sqlite3_column_name(v8, v21));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v22);
              }
              v23 = sqlite3_column_type(v8, v21);
              switch((int)v23)
              {
                case 1:
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(v8, v21));
                  v24 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_31;
                case 2:
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(v8, v21));
                  v24 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_31;
                case 3:
                  v33 = sqlite3_column_text(v8, v21);
                  if (!v33)
                    goto LABEL_29;
                  objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = v34;
                  if (v34)
                  {
                    v36 = v34;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v36 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v38 = v36;

                  break;
                case 4:
                  v37 = sqlite3_column_blob(v8, v21);
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v37, sqlite3_column_bytes(v8, v21));
                  v24 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_31;
                case 5:
                  goto LABEL_29;
                default:
                  v25 = v23;
                  if (objc_msgSend(v7[28], "debugEnabled"))
                  {
                    objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("[SQLITE] UNKNOWN DATATYPE colType=%d"), v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "lastPathComponent");
                    v28 = objc_claimAutoreleasedReturnValue();
                    v29 = v11;
                    v30 = (void *)v28;
                    objc_msgSend(*(id *)(v29 + 2368), "stringWithUTF8String:", "-[PLSQLStatement perform]");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v30, v31, 138);

                    PLLogCommon();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v59 = v26;
                      _os_log_debug_impl(&dword_1B6AB6000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    v11 = 0x1E0CB3000;
                    v7 = &off_1E6A51000;
                    v20 = v56;
                  }
LABEL_29:
                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v24 = objc_claimAutoreleasedReturnValue();
LABEL_31:
                  v38 = (void *)v24;
                  break;
              }
              objc_msgSend(v19, "setObject:forKey:", v38, v22);

              ++v21;
            }
            while (v20 != v21);
          }
          v3 = v55;
          objc_msgSend(v55, "addObject:", v19);

          v10 = 0;
          LODWORD(v13) = 100;
        }
        else
        {
          if ((_DWORD)v12 == 101)
            goto LABEL_45;
          if (objc_msgSend(v7[28], "debugEnabled"))
          {
            objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("ERROR: sqlite3_step error=%d"), v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "lastPathComponent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "-[PLSQLStatement perform]");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v16, v17, 153);

            PLLogCommon();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v14;
              _os_log_debug_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v11 = 0x1E0CB3000;
            v7 = &off_1E6A51000;
          }
          if ((_DWORD)v13 == 11)
          {
            +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", 1001, v46);

            goto LABEL_45;
          }
        }
        if ((_DWORD)v13 != 100)
          goto LABEL_45;
      }
      if (v10 >= 5)
        break;
      sqlite3_sleep(10);
      ++v10;
    }
    ++v10;
LABEL_45:
    -[PLSQLStatement dbSem](v54, "dbSem");
    v47 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v47);

    if (v10 > 5 && objc_msgSend(v7[28], "debugEnabled"))
    {
      objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("WARNING: SQLITE_BUSY for too long"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "lastPathComponent");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "-[PLSQLStatement perform]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v50, v51, 163);

      PLLogCommon();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    v45 = v3;
  }
  else
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** invalid statement ***"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastPathComponent");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSQLStatement perform]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v41, v42, 93);

      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    -[PLSQLStatement dbSem](self, "dbSem");
    v44 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v44);

    v45 = (id)MEMORY[0x1E0C9AA60];
  }

  return v45;
}

- (BOOL)isInsert
{
  return self->_isInsert;
}

- (BOOL)isDelete
{
  return self->_isDelete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbSem, 0);
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (void)setDbSem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
