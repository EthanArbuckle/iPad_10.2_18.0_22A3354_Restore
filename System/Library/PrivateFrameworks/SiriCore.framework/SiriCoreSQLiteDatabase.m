@implementation SiriCoreSQLiteDatabase

- (BOOL)beginTransactionWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", CFSTR("BEGIN TRANSACTION"), a3);
}

- (id)executeQuery:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  id v10;
  NSString *path;
  void *v12;
  void *v13;
  SiriCoreSQLiteQueryResult *v14;
  NSObject *v15;
  id v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  sqlite3_stmt *v24;
  id v25;
  NSString *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t v31;
  int v32;
  id v33;
  NSString *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  sqlite3 *handle;
  int v39;
  int v40;
  uint64_t v41;
  id v42;
  NSString *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  os_log_t *v48;
  void *v49;
  sqlite3_stmt *v50;
  SiriCoreSQLiteQueryResult *v51;
  uint64_t v52;
  const void *v53;
  int v54;
  uint64_t v55;
  id v56;
  int v57;
  NSObject *v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  int v64;
  const char *v65;
  void *v66;
  id v67;
  NSString *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  id v72;
  NSString *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  SiriCoreSQLiteStatement *v77;
  uint64_t v78;
  void *v79;
  int v80;
  id v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  uint64_t v91;
  sqlite3_stmt *v92;
  int v93;
  uint64_t v94;
  int v95;
  SiriCoreSQLiteQueryResult *v96;
  NSObject *v97;
  const unsigned __int8 *v98;
  const void *v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  id v114;
  NSString *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  NSCache *cachedSQLiteStatementsByQueryString;
  void *v121;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  id v127;
  id v128;
  SiriCoreSQLiteDatabase *v129;
  id v130;
  id v131;
  id v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *context;
  void *contexta;
  void *contextb;
  void *v140;
  void *v141;
  void *v142;
  sqlite3_stmt *ppStmt;
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[4];
  _QWORD v147[4];
  _QWORD v148[3];
  _QWORD v149[3];
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[3];
  _QWORD v153[3];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  _QWORD v157[2];
  uint64_t v158;
  NSString *v159;
  uint64_t v160;
  NSString *v161;
  _BYTE buf[12];
  __int16 v163;
  SiriCoreSQLiteQueryResult *v164;
  __int16 v165;
  int v166;
  __int16 v167;
  uint64_t v168;
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = mach_absolute_time();
  ppStmt = 0;
  if (!self->_handle)
  {
    v10 = objc_alloc(MEMORY[0x24BDD1540]);
    path = self->_path;
    v160 = *MEMORY[0x24BDD0CB8];
    v161 = path;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 6, v12);

    v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v5, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
    if (!v13)
      goto LABEL_197;
    v15 = *MEMORY[0x24BE08FC8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
      goto LABEL_197;
LABEL_14:
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
    v163 = 2112;
    v164 = v14;
    _os_log_error_impl(&dword_211AB2000, v15, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
    goto LABEL_197;
  }
  if (!v4)
  {
    v16 = objc_alloc(MEMORY[0x24BDD1540]);
    v17 = self->_path;
    v158 = *MEMORY[0x24BDD0CB8];
    v159 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 7, v18);

    v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", 0, v5, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
    if (!v13)
      goto LABEL_197;
    v15 = *MEMORY[0x24BE08FC8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
      goto LABEL_197;
    goto LABEL_14;
  }
  objc_msgSend(v4, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v8 = (sqlite3_stmt *)objc_msgSend(v6, "impl");
  ppStmt = v8;
  if (!v8)
    goto LABEL_8;
  v9 = v8;
  if (sqlite3_reset(v8) || sqlite3_clear_bindings(v9))
  {
    ppStmt = 0;
LABEL_8:

    v9 = 0;
    v7 = 0;
  }
LABEL_16:
  v19 = objc_msgSend(v4, "options");
  v20 = 0;
  if (!v9 && (v19 & 0x10000) != 0)
  {
    objc_msgSend(v4, "string");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v25 = objc_alloc(MEMORY[0x24BDD1540]);
      v26 = self->_path;
      v156[0] = *MEMORY[0x24BDD0CB8];
      v156[1] = CFSTR("query");
      v157[0] = v26;
      v157[1] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 8, v27);

      v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v5, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
      if (v13)
      {
        v28 = *MEMORY[0x24BE08FC8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
          v163 = 2112;
          v164 = v14;
          _os_log_error_impl(&dword_211AB2000, v28, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
        }
      }
      v29 = 0;
      goto LABEL_196;
    }
    v22 = (void *)v21;
    -[NSCache objectForKey:](self->_cachedSQLiteStatementsByQueryString, "objectForKey:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;
    if (v23)
    {
      v24 = (sqlite3_stmt *)objc_msgSend(v23, "impl");
      ppStmt = v24;
      if (v24)
      {
        v9 = v24;
        if (!sqlite3_reset(v24) && !sqlite3_clear_bindings(v9))
          goto LABEL_30;
        ppStmt = 0;
      }

      v9 = 0;
      v20 = 0;
    }
    else
    {
      v9 = 0;
    }
LABEL_30:

  }
  if (!v9)
  {
    objc_msgSend(v4, "string");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      handle = self->_handle;
      v30 = objc_retainAutorelease(v37);
      v39 = sqlite3_prepare_v2(handle, (const char *)objc_msgSend(v30, "UTF8String"), 0x80000000, &ppStmt, 0);
      if (!v39)
      {
        v129 = self;
        v77 = [SiriCoreSQLiteStatement alloc];
        v78 = -[SiriCoreSQLiteStatement initWithImpl:finalizeWhenDone:](v77, "initWithImpl:finalizeWhenDone:", ppStmt, 1);

        v30 = (id)v78;
        goto LABEL_33;
      }
      v40 = v39;
      v41 = sqlite3_extended_errcode(self->_handle);
      if (ppStmt)
      {
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
      }
      v42 = objc_alloc(MEMORY[0x24BDD1540]);
      v43 = self->_path;
      v152[0] = *MEMORY[0x24BDD0CB8];
      v152[1] = CFSTR("query");
      v153[0] = v43;
      v153[1] = v4;
      v152[2] = *MEMORY[0x24BDD1398];
      SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v40, v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v153[2] = v44;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v153, v152, 3);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v42, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 2, v45);

      v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v5, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
      if (v13)
      {
        v46 = *MEMORY[0x24BE08FC8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
          v163 = 2112;
          v164 = v14;
          _os_log_error_impl(&dword_211AB2000, v46, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v67 = objc_alloc(MEMORY[0x24BDD1540]);
      v68 = self->_path;
      v154[0] = *MEMORY[0x24BDD0CB8];
      v154[1] = CFSTR("query");
      v155[0] = v68;
      v155[1] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v155, v154, 2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v67, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 8, v69);

      v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v5, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
      if (v13)
      {
        v70 = *MEMORY[0x24BE08FC8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
          v163 = 2112;
          v164 = v14;
          _os_log_error_impl(&dword_211AB2000, v70, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
        }
      }
      v30 = 0;
    }
    v29 = 0;
    goto LABEL_195;
  }
  v129 = self;
  v30 = 0;
LABEL_33:
  objc_msgSend(v4, "parameters");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v136, "count");
  v32 = sqlite3_bind_parameter_count(ppStmt);
  if ((v32 & 0x80000000) == 0 && v32 != (_DWORD)v31)
  {
    v33 = objc_alloc(MEMORY[0x24BDD1540]);
    v34 = v129->_path;
    v150[0] = *MEMORY[0x24BDD0CB8];
    v150[1] = CFSTR("query");
    v151[0] = v34;
    v151[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v151, v150, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v33, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 9, v35);

    v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v5, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
    if (v13)
    {
      v36 = *MEMORY[0x24BE08FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
        v163 = 2112;
        v164 = v14;
        _os_log_error_impl(&dword_211AB2000, v36, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
      }
    }
    v29 = 0;
    goto LABEL_194;
  }
  v126 = v5;
  v127 = v30;
  v124 = v7;
  v125 = v20;
  v128 = v4;
  if (v31)
  {
    v47 = 0;
    v48 = (os_log_t *)MEMORY[0x24BE08FC8];
    do
    {
      objc_msgSend(v136, "objectAtIndex:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      ++v47;
      v50 = ppStmt;
      v51 = v49;
      v52 = -[SiriCoreSQLiteQueryResult siriCoreSQLiteValue_type](v51, "siriCoreSQLiteValue_type");
      switch(v52)
      {
        case 1:
          *(_QWORD *)buf = 0;
          v53 = (const void *)-[SiriCoreSQLiteQueryResult siriCoreSQLiteValue_blobRepresentationWithLength:](v51, "siriCoreSQLiteValue_blobRepresentationWithLength:", buf);
          v54 = sqlite3_bind_blob64(v50, v47, v53, *(sqlite3_uint64 *)buf, 0);
          goto LABEL_56;
        case 2:
          -[SiriCoreSQLiteQueryResult siriCoreSQLiteValue_doubleRepresentation](v51, "siriCoreSQLiteValue_doubleRepresentation");
          v54 = sqlite3_bind_double(v50, v47, v59);
          goto LABEL_56;
        case 3:
          v54 = sqlite3_bind_int64(v50, v47, -[SiriCoreSQLiteQueryResult siriCoreSQLiteValue_integerRepresentation](v51, "siriCoreSQLiteValue_integerRepresentation"));
          goto LABEL_56;
        case 4:
          v54 = sqlite3_bind_null(v50, v47);
          goto LABEL_56;
        case 5:
          v54 = sqlite3_bind_text(v50, v47, (const char *)-[SiriCoreSQLiteQueryResult siriCoreSQLiteValue_textRepresentation](v51, "siriCoreSQLiteValue_textRepresentation"), -1, 0);
LABEL_56:
          v57 = v54;
          break;
        default:
          v55 = v52;
          -[SiriCoreSQLiteQueryResult description](v51, "description");
          v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v57 = sqlite3_bind_text(v50, v47, (const char *)objc_msgSend(v56, "UTF8String"), -1, 0);

          v58 = *v48;
          if (os_log_type_enabled(*v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "SiriCoreSQLiteDatabaseBindQueryParameterToSQLiteStatement";
            v163 = 2112;
            v164 = v51;
            v165 = 1024;
            v166 = v47;
            v167 = 2048;
            v168 = v55;
            _os_log_error_impl(&dword_211AB2000, v58, OS_LOG_TYPE_ERROR, "%s %@ (sqlite_parameter_index = %d, valueType = %ld)", buf, 0x26u);
          }
          break;
      }

      if (v57)
      {
        v71 = sqlite3_extended_errcode(v129->_handle);
        v72 = objc_alloc(MEMORY[0x24BDD1540]);
        v73 = v129->_path;
        v148[0] = *MEMORY[0x24BDD0CB8];
        v148[1] = CFSTR("query");
        v149[0] = v73;
        v149[1] = v4;
        v148[2] = *MEMORY[0x24BDD1398];
        SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v57, v71);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v149[2] = v74;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v149, v148, 3);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v72, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 2, v75);

        v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v126, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
        if (v13)
        {
          v76 = *v48;
          if (os_log_type_enabled(*v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
            v163 = 2112;
            v164 = v14;
            _os_log_error_impl(&dword_211AB2000, v76, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
          }
        }

        v29 = 0;
        v7 = v124;
        v20 = v125;
        v30 = v127;
        goto LABEL_194;
      }

    }
    while (v31 != v47);
  }
  objc_msgSend(v4, "recordBuilder");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v19 & 0x7E) == 0)
  {
    LODWORD(v61) = 0;
    if ((v19 & 0x6A) != 0)
    {
      v63 = (void *)MEMORY[0x24BDBD1A8];
      v20 = v125;
      v62 = v126;
      goto LABEL_83;
    }
LABEL_80:
    v63 = 0;
    v66 = 0;
    v20 = v125;
    v62 = v126;
    goto LABEL_86;
  }
  v60 = sqlite3_column_count(ppStmt);
  v61 = v60;
  if ((v19 & 0x6A) == 0)
    goto LABEL_80;
  v20 = v125;
  v62 = v126;
  if ((int)v60 < 1)
  {
    v63 = (void *)MEMORY[0x24BDBD1A8];
LABEL_83:
    if ((v19 & 2) != 0)
      v66 = (void *)objc_msgSend(v63, "copy");
    else
      v66 = 0;
LABEL_86:
    v142 = v63;
    if ((v19 & 0x7C) == 0)
    {
      do
      {
        v82 = (void *)MEMORY[0x212BE6400]();
        v83 = sqlite3_step(ppStmt);
        objc_autoreleasePoolPop(v82);
      }
      while (v83 == 100);
      v130 = 0;
      v131 = 0;
      v132 = 0;
      v84 = 0;
      v85 = 0;
      goto LABEL_174;
    }
    v123 = v66;
    if ((v19 & 0xC) != 0)
    {
      if ((int)v61 < 1)
      {
        v79 = (void *)MEMORY[0x24BDBD1A8];
      }
      else
      {
        v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v61);
        v80 = v61;
        do
        {
          v81 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v79, "addObject:", v81);

          --v80;
        }
        while (v80);
      }
    }
    else
    {
      v79 = 0;
    }
    if ((v19 & 0x10) != 0)
    {
      v132 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if ((v19 & 0x20) != 0)
        goto LABEL_98;
    }
    else
    {
      v132 = 0;
      if ((v19 & 0x20) != 0)
      {
LABEL_98:
        v131 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
LABEL_101:
        v141 = v79;
        if ((v19 & 0x40) != 0)
          v130 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        else
          v130 = 0;
        v86 = v61;
        v135 = MEMORY[0x24BDBD1A8] & (v19 << 59 >> 63);
        v134 = MEMORY[0x24BDBD1B8] & (v19 << 58 >> 63);
        v133 = v61;
        while (1)
        {
          v87 = (void *)MEMORY[0x212BE6400]();
          v88 = sqlite3_step(ppStmt);
          if (v88 != 100)
          {
            v83 = v88;
            objc_autoreleasePoolPop(v87);
            if (v83 != 101)
            {
              v84 = 0;
              v85 = 0;
              v20 = v125;
              v62 = v126;
              v66 = v123;
              goto LABEL_173;
            }
            v20 = v125;
            v62 = v126;
            v66 = v123;
            if ((v19 & 4) == 0)
            {
              if ((v19 & 8) == 0)
              {
                v84 = 0;
                v85 = 0;
                goto LABEL_173;
              }
              v85 = 0;
              if ((int)v61 >= 1)
              {
LABEL_167:
                contexta = v85;
                v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v86);
                v110 = 0;
                do
                {
                  objc_msgSend(v142, "objectAtIndex:", v110);
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v141, "objectAtIndex:", v110);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "setObject:forKey:", v112, v111);

                  ++v110;
                }
                while (v86 != v110);
                v66 = v123;
                v62 = v126;
                v85 = contexta;
LABEL_173:

                v4 = v128;
LABEL_174:
                if (v83 == 101)
                {
                  contextb = v85;
                  if ((v19 & 1) != 0)
                  {
                    v119 = v127;
                    if (v20)
                      v119 = v20;
                    if (v124)
                      v119 = v124;
                    v29 = v119;
                  }
                  else
                  {
                    v29 = 0;
                  }
                  if ((v19 & 0x10000) != 0 && v127)
                  {
                    cachedSQLiteStatementsByQueryString = v129->_cachedSQLiteStatementsByQueryString;
                    objc_msgSend(v4, "string");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSCache setObject:forKey:](cachedSQLiteStatementsByQueryString, "setObject:forKey:", v127, v121);

                    v4 = v128;
                  }
                  v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v62, mach_absolute_time(), v29, v66, contextb, v84, v132, v131, v130, 0);

                  v13 = 0;
LABEL_192:
                  v7 = v124;
                  v30 = v127;
                }
                else
                {

                  v113 = sqlite3_extended_errcode(v129->_handle);
                  v114 = objc_alloc(MEMORY[0x24BDD1540]);
                  v115 = v129->_path;
                  v144[0] = *MEMORY[0x24BDD0CB8];
                  v144[1] = CFSTR("query");
                  v145[0] = v115;
                  v145[1] = v4;
                  v144[2] = *MEMORY[0x24BDD1398];
                  SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v83, v113);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  v145[2] = v116;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, v144, 3);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = (void *)objc_msgSend(v114, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 2, v117);

                  v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v62, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
                  if (!v13)
                  {
                    v29 = 0;
                    v66 = v142;
                    goto LABEL_192;
                  }
                  v118 = *MEMORY[0x24BE08FC8];
                  v7 = v124;
                  v30 = v127;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
                    v163 = 2112;
                    v164 = v14;
                    _os_log_error_impl(&dword_211AB2000, v118, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
                  }
                  v29 = 0;
                  v66 = v142;
                }
                goto LABEL_193;
              }
LABEL_172:
              v84 = (void *)MEMORY[0x24BDBD1B8];
              goto LABEL_173;
            }
            if ((int)v61 <= 0)
            {
              v85 = (void *)MEMORY[0x24BDBD1A8];
              if ((v19 & 8) != 0)
                goto LABEL_172;
            }
            else
            {
              v85 = (void *)objc_msgSend(v141, "copy");
              if ((v19 & 8) != 0)
                goto LABEL_167;
            }
            v84 = 0;
            goto LABEL_173;
          }
          context = v87;
          if ((v19 & 0x40) != 0)
            objc_msgSend(v140, "reset");
          v89 = (void *)v134;
          v90 = (void *)v135;
          if ((int)v61 >= 1)
            break;
LABEL_144:
          if ((v19 & 0x10) != 0)
          {
            objc_msgSend(v132, "addObject:", v90);
            if ((v19 & 0x20) == 0)
            {
LABEL_146:
              if ((v19 & 0x40) == 0)
                goto LABEL_153;
              goto LABEL_150;
            }
          }
          else if ((v19 & 0x20) == 0)
          {
            goto LABEL_146;
          }
          objc_msgSend(v131, "addObject:", v89);
          if ((v19 & 0x40) == 0)
            goto LABEL_153;
LABEL_150:
          objc_msgSend(v140, "build");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103)
            objc_msgSend(v130, "addObject:", v103);

LABEL_153:
          objc_autoreleasePoolPop(context);
        }
        if ((v19 & 0x10) != 0)
        {
          v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v86);
          if ((v19 & 0x20) != 0)
            goto LABEL_111;
        }
        else
        {
          v90 = 0;
          if ((v19 & 0x20) != 0)
          {
LABEL_111:
            v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v86);
            goto LABEL_114;
          }
        }
        v89 = 0;
LABEL_114:
        v91 = 0;
        while (2)
        {
          v92 = ppStmt;
          v93 = sqlite3_column_type(ppStmt, v91);
          switch(v93)
          {
            case 1:
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_column_int64(v92, v91));
              v94 = objc_claimAutoreleasedReturnValue();
              goto LABEL_128;
            case 2:
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqlite3_column_double(v92, v91));
              v94 = objc_claimAutoreleasedReturnValue();
              goto LABEL_128;
            case 3:
              v98 = sqlite3_column_text(v92, v91);
              if (!v98)
                goto LABEL_142;
              v94 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v98);
              goto LABEL_128;
            case 4:
              v99 = sqlite3_column_blob(v92, v91);
              v100 = sqlite3_column_bytes(v92, v91);
              if (v100 < 1)
                goto LABEL_142;
              objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v99, v100);
              v94 = objc_claimAutoreleasedReturnValue();
LABEL_128:
              v96 = (SiriCoreSQLiteQueryResult *)v94;
              if (v94)
                goto LABEL_129;
              goto LABEL_142;
            case 5:
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v94 = objc_claimAutoreleasedReturnValue();
              goto LABEL_128;
            default:
              v95 = v93;
              v96 = (SiriCoreSQLiteQueryResult *)sqlite3_column_text(v92, v91);
              if (v96)
                v96 = (SiriCoreSQLiteQueryResult *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v96);
              v97 = *MEMORY[0x24BE08FC8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "SiriCoreSQLiteDatabaseGetColumnValueFromSQLiteStatement";
                v163 = 2112;
                v164 = v96;
                v165 = 1024;
                v166 = v91;
                v167 = 1024;
                LODWORD(v168) = v95;
                _os_log_error_impl(&dword_211AB2000, v97, OS_LOG_TYPE_ERROR, "%s %@ (sqlite_column_index = %d, sqlite_column_type = %d)", buf, 0x22u);
                if (v96)
                {
LABEL_129:
                  if ((v19 & 0xC) == 0)
                    goto LABEL_131;
LABEL_130:
                  objc_msgSend(v141, "objectAtIndex:", v91);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "addObject:", v96);

                  goto LABEL_131;
                }
              }
              else if (v96)
              {
                goto LABEL_129;
              }
LABEL_142:
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v96 = (SiriCoreSQLiteQueryResult *)objc_claimAutoreleasedReturnValue();
              if ((v19 & 0xC) != 0)
                goto LABEL_130;
LABEL_131:
              if ((v19 & 0x10) != 0)
                objc_msgSend(v90, "addObject:", v96);
              if ((v19 & 0x60) != 0)
              {
                objc_msgSend(v142, "objectAtIndex:", v91);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v19 & 0x20) != 0)
                  objc_msgSend(v89, "setObject:forKey:", v96, v102);
                if ((v19 & 0x40) != 0)
                  objc_msgSend(v140, "setValue:forColumnName:", v96, v102);

              }
              if (v86 != ++v91)
                continue;
              LODWORD(v61) = v133;
              break;
          }
          goto LABEL_144;
        }
      }
    }
    v131 = 0;
    goto LABEL_101;
  }
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v60);
  v64 = 0;
  while (1)
  {
    v65 = sqlite3_column_name(ppStmt, v64);
    if (v65)
    {
      v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v65);
      if (!v63)
        break;
      goto LABEL_67;
    }
    v66 = 0;
    if (!v63)
      break;
LABEL_67:
    objc_msgSend(v63, "addObject:", v66);

    if ((_DWORD)v61 == ++v64)
      goto LABEL_83;
  }
  v104 = objc_alloc(MEMORY[0x24BDD1540]);
  v105 = *MEMORY[0x24BDD0CB8];
  v147[0] = v129->_path;
  v146[0] = v105;
  v146[1] = CFSTR("columnCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v61);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v106;
  v146[2] = CFSTR("columnIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v146[3] = CFSTR("query");
  v147[2] = v107;
  v147[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v147, v146, 4);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v104, "initWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 10, v108);

  v14 = -[SiriCoreSQLiteQueryResult initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:]([SiriCoreSQLiteQueryResult alloc], "initWithQuery:beginMachTime:endMachTime:statement:columnNameTuple:columnValueTuples:columnValuesMap:rowValueTuples:rowValueMaps:records:error:", v4, v126, mach_absolute_time(), 0, 0, 0, 0, 0, 0, 0, v13);
  if (!v13)
  {
    v29 = 0;
    goto LABEL_192;
  }
  v109 = *MEMORY[0x24BE08FC8];
  v7 = v124;
  v30 = v127;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
    v163 = 2112;
    v164 = v14;
    _os_log_error_impl(&dword_211AB2000, v109, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
  }
  v29 = 0;
LABEL_193:

LABEL_194:
LABEL_195:

LABEL_196:
LABEL_197:

  return v14;
}

- (BOOL)executeQueryString:(id)a3 error:(id *)a4
{
  id v6;
  SiriCoreSQLiteQuery *v7;

  v6 = a3;
  v7 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v6, 0, 0, 0, 0);

  LOBYTE(a4) = -[SiriCoreSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", v7, a4);
  return (char)a4;
}

void __71__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_record_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "siriCoreSQLiteValue_escapedString:", 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    objc_msgSend(v6, "appendFormat:", CFSTR(", %@"), v8);
  else
    objc_msgSend(v6, "appendString:", v8);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (BOOL)insertIntoTableWithName:(id)a3 record:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SiriCoreSQLiteQuery *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __71__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_record_error___block_invoke;
  v23 = &unk_24CCE6A88;
  v26 = v27;
  v12 = v10;
  v24 = v12;
  v13 = v11;
  v25 = v13;
  objc_msgSend(v9, "siriCoreSQLiteRecord_enumerateColumnNamesAndValuesUsingBlock:", &v20);
  v14 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v8, "siriCoreSQLiteValue_escapedString:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SiriCoreSQLiteQueryCreateParametrizedAndCommaSeparatedString(objc_msgSend(v13, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (%@)"), v15, v12, v16, v20, v21, v22, v23);

  v18 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v17, 0, v13, 0, 0);
  LOBYTE(a5) = -[SiriCoreSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", v18, a5);

  _Block_object_dispose(v27, 8);
  return (char)a5;
}

- (BOOL)executeQuery:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (a4)
    *a4 = 0;
  -[SiriCoreSQLiteDatabase executeQuery:](self, "executeQuery:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 && v6)
    *a4 = objc_retainAutorelease(v6);

  return v7 == 0;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", CFSTR("COMMIT TRANSACTION"), a3);
}

- (SiriCoreSQLiteDatabase)initWithPath:(id)a3 dataProtectionClass:(int64_t)a4 options:(int64_t)a5
{
  id v8;
  SiriCoreSQLiteDatabase *v9;
  void *v10;
  uint64_t v11;
  NSString *path;
  NSCache *v13;
  NSCache *cachedSQLiteStatementsByQueryString;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SiriCoreSQLiteDatabase;
  v9 = -[SiriCoreSQLiteDatabase init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "stringByStandardizingPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    path = v9->_path;
    v9->_path = (NSString *)v11;

    v9->_dataProtectionClass = a4;
    v9->_options = a5;
    v13 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cachedSQLiteStatementsByQueryString = v9->_cachedSQLiteStatementsByQueryString;
    v9->_cachedSQLiteStatementsByQueryString = v13;

    -[NSCache setCountLimit:](v9->_cachedSQLiteStatementsByQueryString, "setCountLimit:", 64);
  }

  return v9;
}

- (BOOL)openWithError:(id *)a3
{
  os_log_t *v5;
  NSObject *v6;
  sqlite3 **p_handle;
  id v8;
  int v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v14;
  int v15;
  void *v16;
  NSString *path;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  unint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  NSString *v47;
  uint64_t v48;
  void *v49;
  NSString **v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  char v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  id v63;
  uint64_t v64;
  NSString *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FC8];
  v6 = *MEMORY[0x24BE08FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (a3)
    *a3 = 0;
  p_handle = &self->_handle;
  if (self->_handle)
  {
    v8 = 0;
    v9 = 1;
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (!self->_path)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 3, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v57 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", self->_path, &v57);

  if (v15)
  {
    if (v57)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      path = self->_path;
      v72 = *MEMORY[0x24BDD0CB8];
      v73[0] = path;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 4, v18);
      v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
      v9 = 0;
      goto LABEL_46;
    }
    goto LABEL_26;
  }
  -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v19, &v57);

  if (v21)
  {
    if (!v57)
    {
      v39 = (void *)MEMORY[0x24BDD1540];
      v70 = *MEMORY[0x24BDD0CB8];
      v71 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 5, v40);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }

LABEL_26:
    v8 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v23 = objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v56);
  v8 = v56;

  if (!v23)
    goto LABEL_22;
LABEL_28:
  v24 = self->_dataProtectionClass - 1;
  if (v24 >= 3)
    v25 = 1048582;
  else
    v25 = ((_DWORD)v24 << 20) + 2097158;
  v26 = sqlite3_open_v2(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), &self->_handle, v25, 0);
  if (v26)
  {
    v27 = v26;
    v28 = sqlite3_extended_errcode(self->_handle);
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0CB8];
    v69[0] = self->_path;
    v31 = *MEMORY[0x24BDD1398];
    v68[0] = v30;
    v68[1] = v31;
    SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 2, v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
    self->_handle = 0;
    v8 = (id)v34;
  }
  else
  {
    if ((self->_options & 2) != 0)
    {
      v35 = sqlite3_exec(*p_handle, "PRAGMA journal_mode=WAL", 0, 0, 0);
      if (v35)
      {
        v36 = v35;
        v37 = sqlite3_extended_errcode(*p_handle);
        v38 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
          v60 = 1024;
          v61 = v36;
          v62 = 1024;
          LODWORD(v63) = v37;
          _os_log_error_impl(&dword_211AB2000, v38, OS_LOG_TYPE_ERROR, "%s Failed to enable WAL journal_mode with errorCode: %d, extendedCode: %d", buf, 0x18u);
        }
      }
      else
      {
        v41 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
          _os_log_debug_impl(&dword_211AB2000, v41, OS_LOG_TYPE_DEBUG, "%s WAL mode enabled succesfully.", buf, 0xCu);
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_path);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_options & 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x24BDBCC68];
    v55 = v8;
    v9 = objc_msgSend(v42, "setResourceValue:forKey:error:", v43, v44, &v55);
    v45 = v55;

    if ((v9 & 1) == 0)
    {
      v46 = (void *)MEMORY[0x24BDD1540];
      if (v45)
      {
        v47 = self->_path;
        v48 = *MEMORY[0x24BDD1398];
        v66[0] = *MEMORY[0x24BDD0CB8];
        v66[1] = v48;
        v67[0] = v47;
        v67[1] = v45;
        v49 = (void *)MEMORY[0x24BDBCE70];
        v50 = (NSString **)v67;
        v51 = v66;
        v52 = 2;
      }
      else
      {
        v64 = *MEMORY[0x24BDD0CB8];
        v65 = self->_path;
        v49 = (void *)MEMORY[0x24BDBCE70];
        v50 = &v65;
        v51 = &v64;
        v52 = 1;
      }
      objc_msgSend(v49, "dictionaryWithObjects:forKeys:count:", v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 1, v53);
      v54 = objc_claimAutoreleasedReturnValue();

      sqlite3_close_v2(*p_handle);
      *p_handle = 0;
      v45 = (id)v54;
    }

    v8 = v45;
  }
LABEL_46:
  -[NSCache removeAllObjects](self->_cachedSQLiteStatementsByQueryString, "removeAllObjects");
  if (a3)
LABEL_7:
    *a3 = objc_retainAutorelease(v8);
LABEL_8:
  if (v8)
    v10 = 0;
  else
    v10 = v9;
  v11 = *v5;
  v12 = *v5;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
      _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s done", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
    v60 = 1024;
    v61 = v9;
    v62 = 2112;
    v63 = v8;
    _os_log_error_impl(&dword_211AB2000, v11, OS_LOG_TYPE_ERROR, "%s success = %d, error = %@", buf, 0x1Cu);
  }

  return v9;
}

- (BOOL)closeWithError:(id *)a3
{
  NSObject **v5;
  NSObject *v6;
  sqlite3 *handle;
  int v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v5 = (NSObject **)MEMORY[0x24BE08FC8];
  v6 = *MEMORY[0x24BE08FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_INFO))
  {
    v22 = 136315138;
    v23 = "-[SiriCoreSQLiteDatabase closeWithError:]";
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v22, 0xCu);
  }
  if (a3)
    *a3 = 0;
  handle = self->_handle;
  if (handle)
  {
    v8 = sqlite3_close_v2(handle);
    v9 = v8 == 0;
    if (v8)
    {
      v10 = v8;
      v11 = sqlite3_extended_errcode(self->_handle);
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDD0CB8];
      v29[0] = self->_path;
      v14 = *MEMORY[0x24BDD1398];
      v28[0] = v13;
      v28[1] = v14;
      SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v10, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 2, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
      self->_handle = 0;
    }
    -[NSCache removeAllObjects](self->_cachedSQLiteStatementsByQueryString, "removeAllObjects");
    if (a3)
      goto LABEL_12;
  }
  else
  {
    v17 = 0;
    v9 = 1;
    if (a3)
LABEL_12:
      *a3 = objc_retainAutorelease(v17);
  }
  if (v17)
    v18 = 0;
  else
    v18 = v9;
  v19 = *v5;
  v20 = *v5;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = 136315138;
      v23 = "-[SiriCoreSQLiteDatabase closeWithError:]";
      _os_log_impl(&dword_211AB2000, v19, OS_LOG_TYPE_INFO, "%s done", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v22 = 136315650;
    v23 = "-[SiriCoreSQLiteDatabase closeWithError:]";
    v24 = 1024;
    v25 = v9;
    v26 = 2112;
    v27 = v17;
    _os_log_error_impl(&dword_211AB2000, v19, OS_LOG_TYPE_ERROR, "%s success = %d, error = %@", (uint8_t *)&v22, 0x1Cu);
  }

  return v9;
}

- (BOOL)checkpointWriteAheadLogWithError:(id *)a3
{
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[SiriCoreSQLiteDatabase checkpointWriteAheadLogWithError:]";
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = sqlite3_wal_checkpoint_v2(self->_handle, 0, 1, 0, 0);
  v7 = v6;
  if (a3 && v6)
  {
    v8 = sqlite3_extended_errcode(self->_handle);
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0CB8];
    v19[0] = self->_path;
    v11 = *MEMORY[0x24BDD1398];
    v17 = v10;
    v18 = v11;
    SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSQLiteDatabaseErrorDomain"), 2, v13, v17, v18, v19[0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v14);
    *a3 = v15;

  }
  return v7 == 0;
}

- (NSString)path
{
  return self->_path;
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_cachedSQLiteStatementsByQueryString, 0);
}

- (BOOL)updateTableWithName:(id)a3 valueMap:(id)a4 criterion:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  SiriCoreSQLiteQuery *v24;
  BOOL v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  id v31;
  id v32;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v11, "count");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v13);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v13);
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __79__SiriCoreSQLiteDatabase_Update__updateTableWithName_valueMap_criterion_error___block_invoke;
  v30 = &unk_24CCE6A60;
  v16 = v14;
  v31 = v16;
  v17 = v15;
  v32 = v17;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v27);

  v18 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v12, "siriCoreSQLiteValue_escapedString:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("UPDATE %@ SET %@"), v19, v20, v27, v28, v29, v30);

  SiriCoreSQLiteQueryCreateCriterionExpression(v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v23;
  }
  v24 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v21, 0, v17, 0, 0);
  v25 = -[SiriCoreSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", v24, a6);

  return v25;
}

- (BOOL)updateTableWithName:(id)a3 columnName:(id)a4 columnValue:(id)a5 criterion:(id)a6 error:(id *)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  SiriCoreSQLiteQuery *v24;
  BOOL v25;

  v12 = (objc_class *)MEMORY[0x24BDD17C8];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [v12 alloc];
  objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "siriCoreSQLiteValue_escapedString:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("UPDATE %@ SET %@ = %@"), v18, v19, v20);
  SiriCoreSQLiteQueryCreateCriterionExpression(v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v23;
  }
  v24 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v21, 0, 0, 0, 0);
  v25 = -[SiriCoreSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", v24, a7);

  return v25;
}

void __79__SiriCoreSQLiteDatabase_Update__updateTableWithName_valueMap_criterion_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a3;
  v7 = a2;
  v8 = [v6 alloc];
  objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ = ?"), v9);
  objc_msgSend(v5, "addObject:", v10);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", CFSTR("ROLLBACK TRANSACTION"), a3);
}

- (id)selectValueTuplesFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  SiriCoreSQLiteQuery *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v47 = a9;
  if (a10)
    *a10 = 0;
  v20 = a7;
  v21 = objc_msgSend(v17, "count");
  if (a5 == 2)
  {
    v24 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "initWithFormat:", CFSTR("SELECT ALL %@ FROM %@"), v23, v26);
  }
  else if (a5 == 1)
  {
    v22 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v22, "initWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@"), v23, v26);
  }
  else
  {
    v25 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithFormat:", CFSTR("SELECT %@ FROM %@"), v23, v26);
  }
  v28 = (void *)v27;

  if (v21)
  _SiriCoreSQLiteApplyIndexToQuery(v18, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateCriterionExpression(v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v31;
  }
  SiriCoreSQLiteQueryCreateOrderExpression(v19);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  v46 = v16;
  if (v32)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" %@"), v32);
    v34 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v34;
  }
  v45 = v19;
  SiriCoreSQLiteQueryCreateRangeExpression(v47);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  v37 = v18;
  if (v35)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" %@"), v35);
    v38 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v38;
  }
  v39 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v29, 0, 0, 0, 16);
  -[SiriCoreSQLiteDatabase executeQuery:](self, "executeQuery:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    v43 = 0;
    if (a10)
      *a10 = objc_retainAutorelease(v41);
  }
  else
  {
    objc_msgSend(v40, "rowValueTuples");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v43;
}

- (id)selectValueMapsFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  SiriCoreSQLiteQuery *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v47 = a9;
  if (a10)
    *a10 = 0;
  v20 = a7;
  v21 = objc_msgSend(v17, "count");
  if (a5 == 2)
  {
    v24 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "initWithFormat:", CFSTR("SELECT ALL %@ FROM %@"), v23, v26);
  }
  else if (a5 == 1)
  {
    v22 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v22, "initWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@"), v23, v26);
  }
  else
  {
    v25 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithFormat:", CFSTR("SELECT %@ FROM %@"), v23, v26);
  }
  v28 = (void *)v27;

  if (v21)
  _SiriCoreSQLiteApplyIndexToQuery(v18, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateCriterionExpression(v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v31;
  }
  SiriCoreSQLiteQueryCreateOrderExpression(v19);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  v46 = v16;
  if (v32)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" %@"), v32);
    v34 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v34;
  }
  v45 = v19;
  SiriCoreSQLiteQueryCreateRangeExpression(v47);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  v37 = v18;
  if (v35)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" %@"), v35);
    v38 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v38;
  }
  v39 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v29, 0, 0, 0, 32);
  -[SiriCoreSQLiteDatabase executeQuery:](self, "executeQuery:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    v43 = 0;
    if (a10)
      *a10 = objc_retainAutorelease(v41);
  }
  else
  {
    objc_msgSend(v40, "rowValueMaps");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v43;
}

- (id)selectRecordsFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 recordBuilder:(id)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  SiriCoreSQLiteQuery *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  SiriCoreSQLiteDatabase *v45;
  void *v46;
  id v47;
  id v48;
  id v49;

  v47 = a3;
  v17 = a4;
  v18 = a6;
  v49 = a8;
  v48 = a9;
  if (a11)
    *a11 = 0;
  v19 = a10;
  v20 = a7;
  v21 = objc_msgSend(v17, "count");
  v45 = self;
  v46 = v17;
  if (a5 == 2)
  {
    v24 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v47, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "initWithFormat:", CFSTR("SELECT ALL %@ FROM %@"), v23, v26);
  }
  else if (a5 == 1)
  {
    v22 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v47, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v22, "initWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@"), v23, v26);
  }
  else
  {
    v25 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("*");
    }
    objc_msgSend(v47, "siriCoreSQLiteValue_escapedString:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithFormat:", CFSTR("SELECT %@ FROM %@"), v23, v26);
  }
  v28 = (void *)v27;

  if (v21)
  _SiriCoreSQLiteApplyIndexToQuery(v18, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateCriterionExpression(v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v31;
  }
  SiriCoreSQLiteQueryCreateOrderExpression(v49);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" %@"), v32);
    v34 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v34;
  }
  SiriCoreSQLiteQueryCreateRangeExpression(v48);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  v37 = v18;
  if (v35)
  {
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(" %@"), v35);
    v38 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v38;
  }
  v39 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v29, 0, 0, v19, 64);

  -[SiriCoreSQLiteDatabase executeQuery:](v45, "executeQuery:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    v43 = 0;
    if (a11)
      *a11 = objc_retainAutorelease(v41);
  }
  else
  {
    objc_msgSend(v40, "records");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v43;
}

- (id)selectValuesFromTableWithName:(id)a3 columnName:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  SiriCoreSQLiteQuery *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v49 = a9;
  if (a10)
    *a10 = 0;
  v48 = v15;
  if (a5 == 2)
  {
    v24 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v24, "initWithFormat:", CFSTR("SELECT ALL %@ FROM %@"), v21, v22);
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    if (a5 == 1)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "initWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@"), v21, v22);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "initWithFormat:", CFSTR("SELECT %@ FROM %@"), v21, v22);
    }
  }
  v25 = (void *)v23;

  _SiriCoreSQLiteApplyIndexToQuery(v17, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateCriterionExpression(v18);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
  {
    objc_msgSend(v26, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v27);
    v29 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v29;
  }
  v45 = v19;
  SiriCoreSQLiteQueryCreateOrderExpression(v19);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
  {
    objc_msgSend(v26, "stringByAppendingFormat:", CFSTR(" %@"), v30);
    v32 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v32;
  }
  SiriCoreSQLiteQueryCreateRangeExpression(v49);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  v46 = v18;
  v47 = v17;
  if (v33)
  {
    objc_msgSend(v26, "stringByAppendingFormat:", CFSTR(" %@"), v33);
    v35 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v35;
  }
  v36 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v26, 0, 0, 0, 4);
  -[SiriCoreSQLiteDatabase executeQuery:](self, "executeQuery:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "error");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    v40 = 0;
    if (a10)
      *a10 = objc_retainAutorelease(v38);
  }
  else
  {
    objc_msgSend(v37, "columnValueTuples");
    v41 = v16;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v41;
  }

  return v40;
}

- (unint64_t)countValuesInTableWithName:(id)a3 columnName:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 range:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  __CFString *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  SiriCoreSQLiteQuery *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (a9)
    *a9 = 0;
  v47 = v15;
  if (a5 == 2)
  {
    v22 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v16)
    {
      objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("*");
    }
    objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "initWithFormat:", CFSTR("SELECT ALL COUNT(%@) FROM %@"), v21, v24);
  }
  else if (a5 == 1)
  {
    v20 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v16)
    {
      objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("*");
    }
    objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v20, "initWithFormat:", CFSTR("SELECT DISTINCT COUNT(%@) FROM %@"), v21, v24);
  }
  else
  {
    v23 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v16)
    {
      objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("*");
    }
    objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithFormat:", CFSTR("SELECT COUNT(%@) FROM %@"), v21, v24);
  }
  v26 = (void *)v25;

  if (v16)
  _SiriCoreSQLiteApplyIndexToQuery(v17, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateCriterionExpression(v18);
  v28 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v28;
  if (v28)
  {
    objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v29;
  }
  v46 = v19;
  SiriCoreSQLiteQueryCreateRangeExpression(v19);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
  {
    objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(" %@"), v30);
    v32 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v32;
  }
  v33 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v27, 0, 0, 0, 4);
  -[SiriCoreSQLiteDatabase executeQuery:](self, "executeQuery:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "error");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = 0;
    if (a9)
      *a9 = objc_retainAutorelease(v35);
  }
  else
  {
    objc_msgSend(v34, "columnValueTuples");
    v43 = v18;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v44 = v17;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = v16;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v41, "unsignedIntegerValue");

    v16 = v40;
    v17 = v44;

    v18 = v43;
  }

  return v37;
}

- (id)fetchTableNamesWithError:(id *)a3
{
  void *v5;
  SiriCoreSQLiteQuery *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
    *a3 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SELECT \"name\" FROM \"sqlite_master\" WHERE (\"type\" == 'table')"));
  v6 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v5, 0, 0, 0, 4);
  -[SiriCoreSQLiteDatabase executeQuery:](self, "executeQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v7, "columnValueTuples");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)fetchTableWithName:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SiriCoreSQLiteQuery *v10;
  void *v11;
  void *v12;
  void *v13;
  _SiriCoreSQLiteTableInfo *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _SiriCoreSQLiteColumnInfo *v31;
  void *v33;
  SiriCoreSQLiteQuery *v34;
  void *v35;
  id v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v6, "siriCoreSQLiteValue_escapedString:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("pragma table_info(%@)"), v8);

  v10 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v9, 0, 0, 0, 32);
  -[SiriCoreSQLiteDatabase executeQuery:](self, "executeQuery:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      v14 = 0;
      *a4 = objc_retainAutorelease(v12);
      goto LABEL_16;
    }
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v11, "rowValueMaps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
    goto LABEL_15;
  v34 = v10;
  v35 = v9;
  v36 = v6;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v16);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = v11;
  objc_msgSend(v11, "rowValueMaps");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKey:", CFSTR("cid"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

        objc_msgSend(v21, "objectForKey:", CFSTR("name"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("type"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("pk"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "BOOLValue");

        objc_msgSend(v21, "objectForKey:", CFSTR("notnull"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "BOOLValue");

        objc_msgSend(v21, "objectForKey:", CFSTR("dflt_value"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[_SiriCoreSQLiteColumnInfo initWithIdentifier:name:type:isPrimaryKey:isNotNull:defaultValue:]([_SiriCoreSQLiteColumnInfo alloc], "initWithIdentifier:name:type:isPrimaryKey:isNotNull:defaultValue:", v23, v24, v25, v27, v29, v30);
        objc_msgSend(v38, "addObject:", v31);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v18);
  }

  v6 = v36;
  v14 = -[_SiriCoreSQLiteTableInfo initWithName:columns:]([_SiriCoreSQLiteTableInfo alloc], "initWithName:columns:", v36, v38);

  v10 = v34;
  v9 = v35;
  v13 = 0;
  v11 = v33;
LABEL_16:

  return v14;
}

- (BOOL)createTable:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v4;
  objc_msgSend(v4, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        SiriCoreSQLiteQueryCreateColumnDefinition(*(void **)(*((_QWORD *)&v45 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v10);
  }
  v37 = v8;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v18);
        v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v19, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v20, "addObject:", CFSTR("CONSTRAINT"));
          objc_msgSend(v21, "siriCoreSQLiteValue_escapedString:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v22);

        }
        v23 = objc_msgSend(v19, "type");
        if (v23 == 2)
        {
          v24 = v20;
          v25 = CFSTR("UNIQUE");
        }
        else
        {
          if (v23 != 1)
            goto LABEL_22;
          v24 = v20;
          v25 = CFSTR("PRIMARY KEY");
        }
        objc_msgSend(v24, "addObject:", v25);
        v26 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v19, "columnNames");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("(%@)"), v28);
        objc_msgSend(v20, "addObject:", v29);

LABEL_22:
        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" "));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v30);

        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v16);
  }

  v31 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v40, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "siriCoreSQLiteValue_escapedString:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@)"), v33, v34);

  LOBYTE(v31) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v35, a4);
  return (char)v31;
}

- (BOOL)dropTableWithName:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), v9);
  LOBYTE(a4) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v10, a4);

  return (char)a4;
}

- (BOOL)alterTableWithName:(id)a3 renameTo:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (objc_class *)MEMORY[0x24BDD17C8];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(v10, "siriCoreSQLiteValue_escapedString:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "siriCoreSQLiteValue_escapedString:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("ALTER TABLE %@ RENAME TO %@"), v12, v13);
  LOBYTE(a5) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v14, a5);

  return (char)a5;
}

- (BOOL)alterTableWithName:(id)a3 addColumn:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (objc_class *)MEMORY[0x24BDD17C8];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(v10, "siriCoreSQLiteValue_escapedString:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateColumnDefinition(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@"), v12, v13);
  LOBYTE(a5) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v14, a5);

  return (char)a5;
}

- (BOOL)createIndex:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = [v6 alloc];
  if ((objc_msgSend(v7, "options") & 1) != 0)
    v9 = CFSTR(" UNIQUE ");
  else
    v9 = CFSTR(" ");
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "siriCoreSQLiteValue_escapedString:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "siriCoreSQLiteValue_escapedString:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columnNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("CREATE%@INDEX IF NOT EXISTS %@ ON %@ (%@)"), v9, v11, v13, v15);

  v17 = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v16, a4);
  return v17;
}

- (BOOL)dropIndexWithName:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("DROP INDEX IF EXISTS %@"), v9);
  LOBYTE(a4) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v10, a4);

  return (char)a4;
}

- (BOOL)savepointWithName:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("SAVEPOINT %@"), v9);
  LOBYTE(a4) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v10, a4);

  return (char)a4;
}

- (BOOL)releaseSavepointWithName:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("RELEASE SAVEPOINT %@"), v9);
  LOBYTE(a4) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v10, a4);

  return (char)a4;
}

- (BOOL)rollbackToSavepointWithName:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("ROLLBACK TO SAVEPOINT %@"), v9);
  LOBYTE(a4) = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v10, a4);

  return (char)a4;
}

- (BOOL)vacuumWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", CFSTR("VACUUM"), a3);
}

- (BOOL)performForeignKeyCheckWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", CFSTR("PRAGMA foreign_key_check"), a3);
}

- (BOOL)performIntegrityCheckWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", CFSTR("PRAGMA integrity_check"), a3);
}

- (BOOL)performQuickCheckWithError:(id *)a3
{
  return -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", CFSTR("PRAGMA quick_check"), a3);
}

- (BOOL)insertIntoTableWithName:(id)a3 valueMap:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SiriCoreSQLiteQuery *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v8, "count");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __73__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_valueMap_error___block_invoke;
  v22[3] = &unk_24CCE6A60;
  v23 = v11;
  v24 = v12;
  v13 = v12;
  v14 = v11;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v22);

  v15 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v9, "siriCoreSQLiteValue_escapedString:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v14, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SiriCoreSQLiteQueryCreateParametrizedAndCommaSeparatedString(objc_msgSend(v14, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (%@)"), v16, v17, v18);

  v20 = -[SiriCoreSQLiteQuery initWithString:statement:parameters:recordBuilder:options:]([SiriCoreSQLiteQuery alloc], "initWithString:statement:parameters:recordBuilder:options:", v19, 0, v13, 0, 0);
  LOBYTE(a5) = -[SiriCoreSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", v20, a5);

  return (char)a5;
}

void __73__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_valueMap_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (BOOL)deleteFromTableWithName:(id)a3 indexedBy:(id)a4 criterion:(id)a5 error:(id *)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  BOOL v20;

  v10 = a4;
  v11 = (objc_class *)MEMORY[0x24BDD17C8];
  v12 = a5;
  v13 = a3;
  v14 = [v11 alloc];
  objc_msgSend(v13, "siriCoreSQLiteValue_escapedString:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("DELETE FROM %@"), v15);
  v17 = _SiriCoreSQLiteApplyIndexToQuery(v10, v16);
  SiriCoreSQLiteQueryCreateCriterionExpression(v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
  }
  v20 = -[SiriCoreSQLiteDatabase executeQueryString:error:](self, "executeQueryString:error:", v16, a6);

  return v20;
}

@end
