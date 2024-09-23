@implementation CKRecord(BRCSerializationAdditions)

- (void)sqliteBind:()BRCSerializationAdditions index:
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

+ (uint64_t)newFromSqliteValue:()BRCSerializationAdditions
{
  void *v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  NSObject *v12;

  if (sqlite3_value_type(a3) == 4)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = objc_opt_class();
    v6 = (void *)MEMORY[0x24BDBCE50];
    v7 = sqlite3_value_blob(a3);
    objc_msgSend(v6, "dataWithBytes:length:", v7, sqlite3_value_bytes(a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:].cold.1();

    }
    return 0;
  }
  return v9;
}

+ (uint64_t)newFromSqliteStatement:()BRCSerializationAdditions atIndex:
{
  void *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  NSObject *v14;

  if (sqlite3_column_type(a3, iCol) == 4)
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    v7 = objc_opt_class();
    v8 = (void *)MEMORY[0x24BDBCE50];
    v9 = sqlite3_column_blob(a3, iCol);
    objc_msgSend(v8, "dataWithBytes:length:", v9, sqlite3_column_bytes(a3, iCol));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (sqlite3_column_type(a3, iCol) != 5)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:].cold.1();

    }
    return 0;
  }
  return v11;
}

- (uint64_t)_deserializeValue:()BRCSerializationAdditions forKey:encrypted:expectClass:allowNil:errorDescription:
{
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v13 = a4;
  if ((a5 & 1) != 0)
  {
    objc_msgSend(a1, "encryptedValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_6;
  }
  if ((a7 & 1) == 0)
  {
    if (!a8)
      goto LABEL_11;
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "recordType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("missing key '%@' in %@ record %@"), v13, v18, v19, v23, v24);
LABEL_16:
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)a8;
    *(_QWORD *)a8 = v21;

    a8 = 0;
    goto LABEL_11;
  }
LABEL_6:
  if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a8)
      goto LABEL_11;
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "recordType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("invalid value for key '%@' in %@ record %@: %@ %@"), v13, v18, v19, objc_opt_class(), v15);
    goto LABEL_16;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v15);
  a8 = 1;
LABEL_11:

  return a8;
}

- (uint64_t)deserializeFilename:()BRCSerializationAdditions basename:bounceno:extension:userInfo:error:
{
  id v14;
  char v15;
  id v16;
  char v17;
  __CFString *v18;
  char v19;
  id v20;
  __CFString *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  id *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  __CFString *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v14 = a7;
  v46 = 0;
  v47 = 0;
  v15 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v46, CFSTR("encryptedBasename"), 1, objc_opt_class(), 0, &v47);
  v16 = v46;
  if ((v15 & 1) == 0)
  {
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v47, CFSTR("encryptedBasename"));
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v47);
      v25 = 0;
      v24 = 0;
      v26 = 0;
      v18 = 0;
      v27 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v25 = 0;
    v24 = 0;
    v26 = 0;
    v18 = 0;
    v27 = 0;
LABEL_18:
    v20 = v16;
    v16 = 0;
    goto LABEL_40;
  }
  v45 = 0;
  v17 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v45, CFSTR("bounceNo"), 0, objc_opt_class(), 1, &v47);
  v18 = (__CFString *)v45;
  if ((v17 & 1) == 0)
  {
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v47, CFSTR("bounceNo"));
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v47);
      v25 = 0;
      v24 = 0;
      v26 = 0;
      v27 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v25 = 0;
    v24 = 0;
    v26 = 0;
    v27 = 0;
LABEL_24:
    v20 = v18;
    v18 = 0;
    goto LABEL_40;
  }
  v44 = 0;
  v19 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v44, CFSTR("extension"), 0, objc_opt_class(), 1, &v47);
  v20 = v44;
  if ((v19 & 1) != 0)
  {
    if (v18 && -[__CFString integerValue](v18, "integerValue") <= 1)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v49 = v18;
        v50 = 2112;
        v51 = v39;
        _os_log_impl(&dword_230455000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] The server sent a bounceNo <= 1: %@%@", buf, 0x16u);
      }

      v18 = 0;
    }
    v21 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v16, 4);
    if (!v21)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[CKRecord(BRCSerializationAdditions) deserializeFilename:basename:bounceno:extension:userInfo:error:].cold.2();

      v21 = &stru_24FE4A790;
    }
    v43 = a6;
    if (-[__CFString length](v21, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", -[__CFString br_safeFileSystemRepresentation](v21, "br_safeFileSystemRepresentation"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v22;
      v24 = v23;
      if (v18)
      {
        objc_msgSend(v23, "stringByAppendingFormat:", CFSTR(" %@"), v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v25 = v23;
      }
    }
    else
    {
      if (v18)
      {
        -[__CFString stringByAppendingFormat:](v21, "stringByAppendingFormat:", CFSTR(" %@"), v18);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v18;
      }
      else
      {
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) deserializeFilename:basename:bounceno:extension:userInfo:error:].cold.1();

        objc_msgSend(MEMORY[0x24BDD17C8], "br_emptyFilenameAlternativeName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v24 = v38;
      v18 = 0;
      v25 = v24;
    }
    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(v25, "stringByAppendingPathExtension:", v20);
      v28 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v28;
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", objc_msgSend(objc_retainAutorelease(v25), "fileSystemRepresentation"));
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *a3;
      *a3 = (void *)v29;

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", objc_msgSend(objc_retainAutorelease(v24), "fileSystemRepresentation"));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *a4;
      *a4 = (void *)v31;

    }
    if (a5)
      objc_storeStrong(a5, v18);
    if (!v43)
    {
      v27 = 1;
      goto LABEL_41;
    }
    if (v20)
    {
      v33 = (void *)MEMORY[0x24BDD17C8];
      v34 = objc_retainAutorelease(v20);
      objc_msgSend(v33, "br_pathWithFileSystemRepresentation:", objc_msgSend(v34, "fileSystemRepresentation"));
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    v26 = v20;
    v20 = *v43;
    *v43 = v26;
    v27 = 1;
  }
  else
  {
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v47, CFSTR("extension"));
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v47);
      v25 = 0;
      v24 = 0;
      v26 = 0;
      v27 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    v25 = 0;
    v24 = 0;
    v26 = 0;
    v27 = 0;
  }
LABEL_40:

  v20 = v26;
LABEL_41:

  return v27;
}

- (uint64_t)deserializeAliasInfo:()BRCSerializationAdditions serverZone:error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BRFieldCKInfo *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  char *v72;
  char *v73;
  NSObject *v74;
  const char *v75;
  char *v76;
  char *v77;
  const char *v78;
  void *v79;
  void *v80;
  _QWORD *v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(v8, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertOnQueue");

  objc_msgSend(v8, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v102 = 0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v101 = 0;
  v12 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v101, CFSTR("parent"), 0, objc_opt_class(), 0, &v102);
  v13 = v101;
  v14 = v13;
  if ((v12 & 1) != 0)
  {
    v14 = v13;

    v100 = 0;
    v15 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v100, CFSTR("target"), 0, objc_opt_class(), 0, &v102);
    v16 = v100;
    v17 = v16;
    if ((v15 & 1) != 0)
    {
      v17 = v16;

      v99 = 0;
      v18 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v99, CFSTR("favoriteRank"), 0, objc_opt_class(), 1, &v102);
      v19 = v99;
      v20 = v19;
      if ((v18 & 1) != 0)
      {
        v21 = v19;

        v98 = 0;
        v22 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v98, CFSTR("lastOpenTime"), 0, objc_opt_class(), 1, &v102);
        v23 = v98;
        v24 = v23;
        if ((v22 & 1) == 0)
        {
          if (v11)
          {
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v102, CFSTR("lastOpenTime"));
          }
          else if (a5)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v102);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_45;
        }
        v94 = v23;

        v97 = 0;
        v25 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v97, CFSTR("finderTags"), 1, objc_opt_class(), 1, &v102);
        v26 = v97;
        v27 = v26;
        if ((v25 & 1) == 0)
        {
          if (v11)
          {
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v102, CFSTR("finderTags"));
          }
          else if (a5)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v102);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_44;
        }
        v28 = v26;

        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE17430], 1001, v11);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            brc_bread_crumbs();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
            {
              v75 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v104 = "-[CKRecord(BRCSerializationAdditions) deserializeAliasInfo:serverZone:error:]";
              v105 = 2080;
              if (!a5)
                v75 = "(ignored by caller)";
              v106 = v75;
              v107 = 2112;
              v108 = v29;
              v109 = 2112;
              v110 = v30;
              _os_log_error_impl(&dword_230455000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a5)
            *a5 = objc_retainAutorelease(v29);

LABEL_44:
LABEL_45:
          v32 = 0;
          v14 = v21;
          goto LABEL_32;
        }
        v92 = v28;
        v93 = v21;
        objc_msgSend(v14, "recordID");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "zoneID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "recordID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "zoneID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v34, "isEqual:", v36);

        if ((v85 & 1) == 0)
        {
          brc_bread_crumbs();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v14, "recordID");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "zoneID");
            v76 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "recordID");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "zoneID");
            v77 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v104 = v76;
            v105 = 2112;
            v106 = v77;
            v107 = 2112;
            v108 = v43;
            _os_log_fault_impl(&dword_230455000, v44, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Aliases parent ref zoneID %@ must be equal to aliases zoneID %@!%@", buf, 0x20u);

          }
          v89 = (void *)MEMORY[0x24BDD1540];
          v45 = *MEMORY[0x24BE17430];
          objc_msgSend(a1, "recordID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "zoneID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recordID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "zoneID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "br_errorWithDomain:code:description:", v45, 1005, CFSTR("Records zoneID %@ must be equal to parents zoneID %@"), v47, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            brc_bread_crumbs();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              v78 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v104 = "-[CKRecord(BRCSerializationAdditions) deserializeAliasInfo:serverZone:error:]";
              v105 = 2080;
              if (!a5)
                v78 = "(ignored by caller)";
              v106 = v78;
              v107 = 2112;
              v108 = v50;
              v109 = 2112;
              v110 = v51;
              _os_log_error_impl(&dword_230455000, v52, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a5)
            *a5 = objc_retainAutorelease(v50);

          v32 = 0;
          goto LABEL_74;
        }
        v81 = (_QWORD *)objc_opt_new();
        objc_msgSend(v81, "setType:", 3);
        objc_msgSend(v17, "recordID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "zoneID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "recordID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "recordName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithRecordZoneID:", v38);
        v83 = v41;
        if (objc_msgSend(v41, "isPrivate"))
        {
          objc_msgSend(v10, "getOrReserveLibraryRowIDForLibrary:", v41);
          v42 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v42 = 0;
        }
        objc_msgSend(v17, "recordID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)v42;
        objc_msgSend(v53, "brc_itemIDOfTargetWithLibraryRowID:session:", v42, v10);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v84 = v40;
        v86 = v38;
        v90 = v54;
        if (objc_msgSend(v40, "hasPrefix:", CFSTR("documentContent/")))
        {
          v79 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v38, "zoneName");
          v55 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "ownerName");
          v56 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "itemIDString");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stringWithFormat:", CFSTR("%@:%@/%@"), v55, v56, v57);
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = v81;
        }
        else
        {
          v59 = v81;
          if (objc_msgSend(v40, "hasPrefix:", CFSTR("documentStructure/")))
          {
            v60 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v38, "zoneName");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "itemIDString");
            v56 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", CFSTR("%@/%@"), v61, v56);
            v62 = objc_claimAutoreleasedReturnValue();
            v63 = (void *)v81[8];
            v81[8] = v62;

LABEL_62:
            objc_msgSend(v14, "recordID");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "brc_itemIDWithSession:", v10);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setParentID:", v66);

            v67 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", a1);
            objc_msgSend(v59, "setCkInfo:", v67);

            objc_msgSend(v59, "setLastUsedTime:", objc_msgSend(v94, "longLongValue"));
            objc_msgSend(v59, "setFavoriteRank:", objc_msgSend(v93, "longLongValue"));
            if (objc_msgSend(v92, "length"))
              v68 = v92;
            else
              v68 = 0;
            objc_msgSend(v59, "setFinderTags:", v68);
            objc_msgSend(a1, "encryptedValues");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("encryptedBasename"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70)
            {
              v95 = 0;
              v96 = 0;
              v71 = objc_msgSend(a1, "deserializeFilename:basename:bounceno:extension:userInfo:error:", &v96, 0, 0, 0, v11, &v95);
              v72 = (char *)v95;
              if ((v71 & 1) == 0)
              {
                brc_bread_crumbs();
                v73 = (char *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v74 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v104 = v72;
                  v105 = 2112;
                  v106 = v73;
                  _os_log_impl(&dword_230455000, v74, OS_LOG_TYPE_DEFAULT, "[WARNING] can't deserialize filename: %@%@", buf, 0x16u);
                }

              }
              objc_msgSend(v59, "setLogicalName:", v96);

            }
            if (a3)
              objc_storeStrong(a3, v59);

            v32 = 1;
LABEL_74:
            v14 = v93;
            goto LABEL_32;
          }
          if (!objc_msgSend(v40, "hasPrefix:", CFSTR("directory/")))
          {
            brc_bread_crumbs();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
              -[CKRecord(BRCSerializationAdditions) deserializeAliasInfo:serverZone:error:].cold.1();
            goto LABEL_62;
          }
          v80 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v38, "zoneName");
          v55 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "ownerName");
          v56 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "itemIDString");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringWithFormat:", CFSTR("%@:%@/%@"), v55, v56, v57);
          v58 = objc_claimAutoreleasedReturnValue();
        }
        v64 = (void *)v59[8];
        v59[8] = v58;

        v61 = (void *)v55;
        goto LABEL_62;
      }
      if (v11)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v102, CFSTR("favoriteRank"));
      }
      else if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v102);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (v11)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v102, CFSTR("target"));
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v102);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_31;
  }
  if (v11)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v102, CFSTR("parent"));
LABEL_31:
    v32 = 0;
    goto LABEL_32;
  }
  if (!a5)
    goto LABEL_31;
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v102);
  v32 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v32;
}

- (void)_deserializeRootSharingOptions:()BRCSerializationAdditions
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;

  objc_msgSend(a1, "share");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v11 = 0;
    if (!a3)
      return;
    goto LABEL_8;
  }
  objc_msgSend(a1, "encryptedPublicSharingKey");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(a1, "routingKey"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[CKRecord(BRCSerializationAdditions) _deserializeRootSharingOptions:].cold.1();

  }
  v11 = 4;
  if (a3)
LABEL_8:
    *a3 = v11;
}

- (BOOL)deserializeiWorkSharingOptions:()BRCSerializationAdditions error:
{
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  id v19;
  id v20;
  uint64_t v21;
  id v22;

  v21 = 0;
  v22 = 0;
  objc_msgSend(a1, "_deserializeRootSharingOptions:", &v21);
  v7 = 0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = 0;
  v8 = *MEMORY[0x24BDB8FD8];
  v9 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v20, *MEMORY[0x24BDB8FD8], 0, objc_opt_class(), 1, &v22);
  v10 = v20;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (v7)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v8);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v11 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend(v10, "BOOLValue"))
  {
    v21 |= 1uLL;
    v19 = 0;
    v12 = *MEMORY[0x24BDB8FD0];
    v13 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v19, *MEMORY[0x24BDB8FD0], 0, objc_opt_class(), 0, &v22);
    v14 = v19;
    v15 = v14;
    if ((v13 & 1) != 0)
    {
      if (objc_msgSend(v14, "BOOLValue"))
        v21 |= 2uLL;
      goto LABEL_11;
    }
    if (v7)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v12);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_22:
    v17 = 0;
    v15 = 0;
    goto LABEL_23;
  }
  v15 = 0;
LABEL_11:
  v16 = objc_msgSend(v7, "count");
  v17 = v16 == 0;
  if (a3 && !v16)
  {
    *a3 = v21;
    v17 = 1;
  }
LABEL_23:

  return v17;
}

- (uint64_t)deserializeStatInfo:()BRCSerializationAdditions serverMetrics:itemID:session:error:
{
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  char v33;
  id v34;
  char v35;
  id v36;
  id v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  char v43;
  char v44;
  void *v45;
  char v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  void *v65;
  char v66;
  id v67;
  char v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  _QWORD *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  double v101;
  uint64_t v102;
  id v103;
  void *v104;
  void *v105;
  NSObject *v106;
  char v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  unsigned int v126;
  int v127;
  BRCItemID *v128;
  void *v129;
  uint64_t v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  BRCItemID *v135;
  void *v136;
  id v137;
  void *v138;
  char v139;
  id v140;
  void *v141;
  BRFieldCKInfo *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  BRFieldUserIdentity *v162;
  BRFieldUserIdentity *v163;
  uint64_t v164;
  BRFieldUserIdentity *v165;
  void *v166;
  void *v167;
  char v168;
  id v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  const char *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  const char *v180;
  _QWORD *v181;
  char v182;
  void *v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  id v189;
  void *v190;
  _QWORD *v191;
  void *v192;
  unsigned int v193;
  id v194;
  void *v195;
  id *v196;
  char *v197;
  char v198;
  id v199;
  void *v200;
  void *v201;
  char *v202;
  id v203;
  void *v204;
  void *v205;
  void *v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  uint8_t buf[4];
  const char *v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  void *v230;
  __int16 v231;
  void *v232;
  uint64_t v233;

  v233 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v203 = a6;
  objc_msgSend(v203, "serverDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertOnQueue");

  v14 = 0;
  v224 = 0;
  v196 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "recordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneID");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "ownerName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDB8E88];
  v19 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDB8E88]);

  v223 = 0;
  objc_msgSend(a1, "recordID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recordName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v21, "hasPrefix:", CFSTR("directory/"));

  v198 = v16;
  v202 = v12;
  v206 = v14;
  if ((v16 & 1) != 0)
  {
    v193 = 0;
  }
  else
  {
    v22 = a7;
    objc_msgSend(a1, "recordID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "recordName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hasPrefix:", CFSTR("documentStructure/"));

    if ((v25 & 1) != 0)
    {
      v26 = 1;
    }
    else
    {
      objc_msgSend(a1, "recordID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "recordName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "hasPrefix:", CFSTR("finderBookmark/"));

      if ((v29 & 1) != 0)
      {
        v26 = 6;
      }
      else
      {
        objc_msgSend(a1, "recordID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "recordName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "hasPrefix:", CFSTR("symlink/"));

        if ((v32 & 1) == 0)
        {
          v74 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(a1, "recordID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "recordType");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "stringWithFormat:", CFSTR("invalid record type for record %@: %@"), v75, v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v224 = v77;

          if (v14)
          {
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v77, CFSTR("recordType"));
            v200 = 0;
            v201 = 0;
            v204 = 0;
            v205 = 0;
            v56 = 0;
            v49 = 0;
            v51 = 0;
            v50 = 0;
            v78 = 0;
            v79 = 0;
            v80 = 0;
            v22 = 0;
            v81 = 0;
            v55 = 0;
            goto LABEL_61;
          }
          if (v22)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v77);
            v90 = (id)objc_claimAutoreleasedReturnValue();
            v200 = 0;
            v201 = 0;
            v204 = 0;
            v205 = 0;
            v91 = v22;
            v55 = 0;
            v56 = 0;
            v49 = 0;
            v51 = 0;
            v50 = 0;
            v78 = 0;
            v79 = 0;
            v80 = 0;
            v22 = 0;
            v81 = 0;
            *v91 = v90;
            goto LABEL_61;
          }
          v200 = 0;
          v201 = 0;
          v204 = 0;
          v205 = 0;
          v55 = 0;
          v56 = 0;
          v49 = 0;
          goto LABEL_74;
        }
        v26 = 5;
      }
    }
    v193 = v26;
    a7 = v22;
  }
  if (objc_msgSend(v12, "isDocumentsFolder"))
    v223 = (id)*MEMORY[0x24BE17538];
  else
    objc_msgSend(a1, "deserializeFilename:basename:bounceno:extension:userInfo:error:", &v223, 0, 0, 0, v14, a7);
  v222 = 0;
  v33 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v222, CFSTR("parent"), 0, objc_opt_class(), v19 ^ 1u, &v224);
  v34 = v222;
  if ((v33 & 1) == 0)
  {
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v224, CFSTR("parent"));
    }
    else if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    v55 = 0;
    v56 = 0;
    v49 = 0;
    goto LABEL_59;
  }
  v191 = a7;
  v221 = 0;
  v35 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v221, CFSTR("exactBirthtime"), 1, objc_opt_class(), 1, &v224);
  v36 = v221;
  v37 = v36;
  if ((v35 & 1) == 0)
  {
    if (v14)
    {
      v52 = v14;
      v49 = v34;
      v53 = v224;
      v54 = CFSTR("exactBirthtime");
LABEL_29:
      objc_msgSend(v52, "setObject:forKeyedSubscript:", v53, v54);
LABEL_58:

      v200 = 0;
      v201 = 0;
      v204 = 0;
      v205 = 0;
      v55 = 0;
      v56 = 0;
LABEL_59:
      v51 = 0;
      v50 = 0;
      v78 = 0;
      v79 = 0;
      v80 = 0;
      v22 = 0;
LABEL_60:
      v81 = 0;
      goto LABEL_61;
    }
LABEL_56:
    v49 = v34;
    if (v191)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
      *v191 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_58;
  }
  if (!v36)
  {
    v220 = 0;
    v38 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v220, CFSTR("birthtime"), 0, objc_opt_class(), 1, &v224);
    v37 = v220;
    if ((v38 & 1) == 0)
    {
      if (v14)
      {
        v52 = v14;
        v49 = v34;
        v53 = v224;
        v54 = CFSTR("birthtime");
        goto LABEL_29;
      }
      goto LABEL_56;
    }
  }
  v190 = v34;
  objc_msgSend(a1, "recordID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "zoneID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "ownerName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToString:", v18);

  if (!v42)
  {
    v47 = 0;
    v188 = 0;
    v189 = 0;
    v45 = v190;
    goto LABEL_34;
  }
  v219 = 0;
  v43 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v219, CFSTR("lastOpenTime"), 0, objc_opt_class(), 1, &v224);
  v189 = v219;
  if ((v43 & 1) == 0)
  {
    v83 = v14;
    v49 = v190;
    v22 = v37;
    if (v83)
    {
      objc_msgSend(v83, "setObject:forKeyedSubscript:", v224, CFSTR("lastOpenTime"));
      v84 = v189;
    }
    else
    {
      v84 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    v55 = 0;
    v56 = 0;
LABEL_74:
    v51 = 0;
LABEL_83:
    v50 = 0;
LABEL_84:
    v78 = 0;
    v79 = 0;
    v80 = 0;
    goto LABEL_60;
  }
  v218 = 0;
  v44 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v218, CFSTR("favoriteRank"), 0, objc_opt_class(), 1, &v224);
  v188 = v218;
  v45 = v190;
  if ((v44 & 1) == 0)
  {
    v88 = v14;
    v49 = v190;
    v22 = v37;
    if (v88)
    {
      objc_msgSend(v88, "setObject:forKeyedSubscript:", v224, CFSTR("favoriteRank"));
      v89 = v188;
      v51 = v189;
    }
    else
    {
      v89 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    v55 = 0;
    v56 = 0;
    goto LABEL_83;
  }
  v217 = 0;
  v46 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v217, CFSTR("finderTags"), 1, objc_opt_class(), 1, &v224);
  v47 = v217;
  if ((v46 & 1) == 0)
  {
    v48 = v14;
    v49 = v190;
    v22 = v37;
    if (v48)
    {
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v224, CFSTR("finderTags"));
      v50 = v188;
      v51 = v189;
    }
    else
    {
      v50 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    v55 = 0;
    v56 = 0;
    goto LABEL_84;
  }
LABEL_34:
  v187 = v47;
  v216 = 0;
  v57 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v216, CFSTR("hiddenExt"), 0, objc_opt_class(), 1, &v224);
  v58 = v216;
  if ((v57 & 1) == 0)
  {
    v82 = v14;
    v49 = v45;
    v22 = v37;
    if (v82)
    {
      objc_msgSend(v82, "setObject:forKeyedSubscript:", v224, CFSTR("hiddenExt"));
      v50 = v188;
      v51 = v189;
    }
    else
    {
      v50 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v200 = 0;
    v201 = 0;
    v204 = 0;
    v205 = 0;
    v55 = 0;
    v78 = 0;
    v79 = 0;
    v80 = 0;
    goto LABEL_94;
  }
  v215 = 0;
  v59 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v215, CFSTR("xattr"), 0, objc_opt_class(), 1, &v224);
  v60 = v215;
  if ((v59 & 1) == 0)
  {
    v86 = v14;
    v49 = v45;
    v22 = v37;
    v80 = v58;
    if (v86)
    {
      v87 = v60;
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v224, CFSTR("xattr"));
      v60 = v87;
      v50 = v188;
      v51 = v189;
    }
    else
    {
      v50 = v188;
      v51 = v189;
      if (v191)
      {
        v94 = v60;
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
        v60 = v94;
      }
    }

    v201 = 0;
    v204 = 0;
    goto LABEL_91;
  }
  v204 = v60;
  v214 = 0;
  v61 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v214, CFSTR("xattrSignature"), 1, objc_opt_class(), 1, &v224);
  v62 = v214;
  if ((v61 & 1) == 0)
  {
    v92 = v14;
    v49 = v45;
    v22 = v37;
    v80 = v58;
    if (v92)
    {
      v93 = v62;
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v224, CFSTR("xattrSignature"));
      v62 = v93;
      v50 = v188;
      v51 = v189;
    }
    else
    {
      v50 = v188;
      v51 = v189;
      if (v191)
      {
        v96 = v62;
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
        v62 = v96;
      }
    }

    v201 = 0;
LABEL_91:
    v205 = 0;
LABEL_92:
    v55 = 0;
LABEL_93:
    v200 = 0;
    v78 = 0;
    v79 = 0;
LABEL_94:
    v81 = 0;
    v56 = v187;
    goto LABEL_61;
  }
  v205 = v62;
  v213 = 0;
  v63 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v213, CFSTR("restorePath"), 1, objc_opt_class(), 1, &v224);
  v64 = v213;
  v65 = v64;
  if ((v63 & 1) == 0)
  {
    v95 = v14;
    v49 = v45;
    v22 = v37;
    v80 = v58;
    if (v95)
    {
      objc_msgSend(v95, "setObject:forKeyedSubscript:", v224, CFSTR("restorePath"));
      v50 = v188;
      v51 = v189;
    }
    else
    {
      v50 = v188;
      v51 = v189;
      if (v191)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v201 = 0;
    goto LABEL_92;
  }
  v186 = v64;
  v212 = 0;
  v66 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v212, CFSTR("restoreParent"), 0, objc_opt_class(), 1, &v224);
  v67 = v212;
  if ((v66 & 1) == 0)
  {
    v22 = v37;
    v80 = v58;
    if (v14)
    {
      v97 = v67;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v224, CFSTR("restoreParent"));
      v67 = v97;
      v51 = v189;
      v49 = v190;
      v50 = v188;
      v55 = v186;
    }
    else
    {
      v51 = v189;
      v49 = v190;
      v50 = v188;
      v55 = v186;
      if (v191)
      {
        v98 = v67;
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
        v67 = v98;
      }
    }

    v201 = 0;
    goto LABEL_93;
  }
  v200 = v67;
  v185 = v58;
  v211 = 0;
  v68 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v211, CFSTR("countMetrics"), 0, objc_opt_class(), 1, &v224);
  v69 = v211;
  if ((v68 & 1) == 0)
  {
    v22 = v37;
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v224, CFSTR("countMetrics"));
      v51 = v189;
      v49 = v190;
      v50 = v188;
      v55 = v186;
    }
    else
    {
      v51 = v189;
      v49 = v190;
      v50 = v188;
      v55 = v186;
      if (v191)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        *v191 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v201 = 0;
    v78 = 0;
    v79 = 0;
    v81 = 0;
    v56 = v187;
    v80 = v185;
    goto LABEL_61;
  }
  v70 = (uint64_t)v205;
  if (!v205 && v204)
  {
    objc_msgSend(v204, "signature");
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v205 = (void *)v70;
  v201 = v69;
  if (!v37)
  {
    brc_bread_crumbs();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      -[CKRecord(BRCSerializationAdditions) deserializeStatInfo:serverMetrics:itemID:session:error:].cold.1();
    goto LABEL_110;
  }
  v71 = v190;
  if ((BRCIsBusyDate(objc_msgSend(v37, "longLongValue")) & 1) != 0)
  {
    brc_bread_crumbs();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v226 = v202;
      v227 = 2112;
      v228 = (uint64_t)v72;
      _os_log_impl(&dword_230455000, v73, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring Finder busy date on %@%@", buf, 0x16u);
    }
LABEL_110:

    v99 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "creationDate");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "timeIntervalSince1970");
    if (!(unint64_t)v101)
      time(0);
    objc_msgSend(v99, "numberWithUnsignedLongLong:");
    v102 = objc_claimAutoreleasedReturnValue();

    v37 = (id)v102;
    v71 = v190;
  }
  if ((v198 & 1) != 0)
  {
    v78 = 0;
    v103 = 0;
    goto LABEL_115;
  }
  v210 = 0;
  v107 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v210, CFSTR("writable"), 0, objc_opt_class(), 1, &v224);
  v103 = v210;
  if ((v107 & 1) != 0)
  {
    v209 = 0;
    v108 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v209, CFSTR("executable"), 0, objc_opt_class(), 1, &v224);
    v78 = v209;
    if ((v108 & 1) == 0)
    {
      v184 = v103;
      v22 = v37;
      if (v14)
      {
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v224, CFSTR("executable"));
        v51 = v189;
        v49 = v190;
        v50 = v188;
        v55 = v186;
      }
      else
      {
        v51 = v189;
        v49 = v190;
        v50 = v188;
        v55 = v186;
        if (v191)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
          *v191 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      v78 = 0;
      v81 = 0;
      goto LABEL_176;
    }
    v71 = v190;
LABEL_115:
    v55 = v186;
    v199 = v78;
    if (objc_msgSend(v14, "count"))
    {
      v79 = v103;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE17430], 1001, v14);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (v104)
      {
        brc_bread_crumbs();
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, (os_log_type_t)0x90u))
        {
          v175 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v226 = "-[CKRecord(BRCSerializationAdditions) deserializeStatInfo:serverMetrics:itemID:session:error:]";
          v227 = 2080;
          if (!v191)
            v175 = "(ignored by caller)";
          v228 = (uint64_t)v175;
          v229 = 2112;
          v230 = v104;
          v231 = 2112;
          v232 = v105;
          _os_log_error_impl(&dword_230455000, v106, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      v49 = v71;
      v22 = v37;
      if (v191)
        *v191 = objc_retainAutorelease(v104);

      v81 = 0;
      v50 = v188;
      v51 = v189;
      v56 = v187;
      v80 = v185;
      goto LABEL_61;
    }
    v184 = v103;
    if (!v71)
      goto LABEL_132;
    objc_msgSend(v71, "recordID");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "zoneID");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordID");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "zoneID");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v110, "isEqual:", v112);

    v71 = v190;
    v78 = v199;

    if ((v182 & 1) != 0)
    {
LABEL_132:
      v183 = (void *)objc_opt_new();
      objc_msgSend(v183, "setType:", v193);
      if ((v193 | 4) == 4)
      {
        v113 = 3;
      }
      else
      {
        v126 = objc_msgSend(v103, "BOOLValue");
        if (objc_msgSend(v78, "BOOLValue"))
          v127 = 2;
        else
          v127 = 0;
        v113 = v127 | v126;
        v71 = v190;
      }
      objc_msgSend(v183, "setMode:", v113);
      objc_msgSend(v183, "setLogicalName:", v223);
      if (v71)
      {
        if (objc_msgSend(v202, "isDocumentsFolder"))
        {
          v128 = [BRCItemID alloc];
          objc_msgSend(v202, "appLibraryRowID");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:](v128, "_initAsLibraryRootWithAppLibraryRowID:", v129);
        }
        else
        {
          objc_msgSend(v71, "recordID");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "brc_itemIDWithSession:", v203);
          v130 = objc_claimAutoreleasedReturnValue();
        }
        v134 = (void *)v130;
        v138 = v183;
        objc_msgSend(v183, "setParentID:", v130);
      }
      else
      {
        v131 = objc_alloc(MEMORY[0x24BE17640]);
        objc_msgSend(a1, "recordID");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "zoneID");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = (void *)objc_msgSend(v131, "initWithRecordZoneID:", v133);

        objc_msgSend(v203, "sharedClientZoneByMangledID:", v129);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = [BRCItemID alloc];
        objc_msgSend(v134, "dbRowID");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = -[BRCItemID _initAsZoneRootWithZoneRowID:](v135, "_initAsZoneRootWithZoneRowID:", v136);
        v138 = v183;
        objc_msgSend(v183, "setParentID:", v137);

      }
      objc_msgSend(v138, "setBirthtime:", objc_msgSend(v37, "longLongValue"));
      objc_msgSend(v138, "setLastUsedTime:", objc_msgSend(v189, "longLongValue"));
      objc_msgSend(v138, "setFavoriteRank:", objc_msgSend(v188, "longLongValue"));
      objc_msgSend(v138, "setHiddenExt:", objc_msgSend(v185, "BOOLValue"));
      v181 = v37;
      if (objc_msgSend(v187, "length"))
      {
        objc_msgSend(v138, "setFinderTags:", v187);
        goto LABEL_163;
      }
      v208 = 0;
      v139 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v208, CFSTR("ftags"), 0, objc_opt_class(), 1, &v224);
      v140 = v208;
      v141 = v140;
      if ((v139 & 1) != 0)
      {
        if (objc_msgSend(v140, "length"))
          objc_msgSend(v183, "setFinderTags:", v141);

        v138 = v183;
LABEL_163:
        v142 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", a1);
        objc_msgSend(v138, "setCkInfo:", v142);

        objc_msgSend(v138, "setXattrSignature:", v205);
        objc_msgSend(v204, "fileURL");
        v143 = (void *)objc_claimAutoreleasedReturnValue();

        if (v143)
        {
          objc_msgSend(v203, "stageRegistry");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "fileURL");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "signature");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "saveXattrAtURL:forSignature:error:", v145, v146, 0);

        }
        if (objc_msgSend(v186, "length"))
        {
          v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v186, 4);
          objc_msgSend(v138, "setTrashPutBackPath:", v147);

        }
        else
        {
          objc_msgSend(v138, "setTrashPutBackPath:", 0);
        }
        objc_msgSend(v200, "recordID");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "brc_itemIDWithSession:", v203);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setTrashPutBackParentID:", v149);

        objc_msgSend(a1, "creatorUserRecordID");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "recordName");
        v151 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v203, "cachedCurrentUserRecordName");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v207 = 0;
        v153 = a1;
        v154 = (void *)v151;
        objc_msgSend(v153, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v152, &v207);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = v207;

        v192 = v155;
        if ((objc_msgSend(v155, "isEqualToString:", v154) & 1) == 0)
        {

          v194 = 0;
        }
        v156 = v196;
        v78 = v199;
        v157 = v201;
        objc_msgSend(v203, "createUserKeyForOwnerName:", v154);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setCreatorRowID:", v158);

        if (!v194)
          goto LABEL_188;
        objc_msgSend(v203, "serverDB");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCAccountSessionFPFS userIdentityForName:db:](BRCAccountSessionFPFS, "userIdentityForName:db:", v154, v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = v160;
        if (v160)
          v162 = v160;
        else
          v162 = objc_alloc_init(BRFieldUserIdentity);
        v163 = v162;

        -[BRFieldUserIdentity nameComponents](v163, "nameComponents");
        v164 = objc_claimAutoreleasedReturnValue();
        v165 = v163;
        if (v164)
        {
          v166 = (void *)v164;
          -[BRFieldUserIdentity nameComponents](v163, "nameComponents");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v167, "br_shouldOverwriteExistingName") & 1) == 0)
          {

            v165 = v163;
            v156 = v196;
            goto LABEL_186;
          }
          v168 = objc_msgSend(v194, "br_shouldOverwriteExistingName");

          v165 = v163;
          v156 = v196;
          if ((v168 & 1) != 0)
          {
LABEL_187:

            v157 = v201;
LABEL_188:
            v169 = objc_alloc_init(MEMORY[0x24BE17698]);
            if ((unint64_t)objc_msgSend(v157, "count") >= 4)
            {
              objc_msgSend(v157, "objectAtIndexedSubscript:", 0);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "setQuotaUsed:", v170);

              objc_msgSend(v157, "objectAtIndexedSubscript:", 1);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "setRecursiveChildCount:", v171);

              objc_msgSend(v157, "objectAtIndexedSubscript:", 2);
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "setSharedByMeRecursiveCount:", v172);

              objc_msgSend(v157, "objectAtIndexedSubscript:", 3);
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "setSharedAliasRecursiveCount:", v173);

            }
            v141 = v154;
            if ((unint64_t)objc_msgSend(v157, "count") >= 5)
            {
              objc_msgSend(v157, "objectAtIndexedSubscript:", 4);
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "setChildCount:", v174);

            }
            v55 = v186;
            if (v156)
              objc_storeStrong(v156, v138);
            if (a4)
              objc_storeStrong(a4, v169);

            v81 = 1;
            goto LABEL_197;
          }
        }
        -[BRFieldUserIdentity setNameComponents:](v165, "setNameComponents:", v194);
        objc_msgSend(v203, "serverDB");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "execute:", CFSTR("UPDATE users SET user_plist = %@ WHERE user_name = %@"), v165, v154);
LABEL_186:

        goto LABEL_187;
      }
      if (v14)
      {
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v224, CFSTR("ftags"));
      }
      else if (v191)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
        v81 = 0;
        *v191 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_203;
      }
      v81 = 0;
LABEL_203:
      v55 = v186;
      v138 = v183;
LABEL_197:

      v50 = v188;
      v51 = v189;
      v56 = v187;
      v79 = v184;
      v80 = v185;
      v22 = v181;
      v49 = v190;
      goto LABEL_61;
    }
    v114 = v190;
    brc_bread_crumbs();
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(a1, "recordType");
      v197 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "recordID");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "zoneID");
      v177 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "recordID");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "zoneID");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v226 = v197;
      v227 = 2112;
      v228 = v177;
      v179 = (void *)v177;
      v229 = 2112;
      v230 = v178;
      v231 = 2112;
      v232 = v115;
      _os_log_fault_impl(&dword_230455000, v116, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ parent ref zoneID %@ must be equal to record's zoneID %@!%@", buf, 0x2Au);

      v114 = v190;
    }

    v117 = (void *)MEMORY[0x24BDD1540];
    v118 = *MEMORY[0x24BE17430];
    objc_msgSend(a1, "recordID");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "zoneID");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "recordID");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "zoneID");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "br_errorWithDomain:code:description:", v118, 1005, CFSTR("Records zoneID %@ must be equal to parents zoneID %@"), v120, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = v186;
    if (v123)
    {
      brc_bread_crumbs();
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v125 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v125, (os_log_type_t)0x90u))
      {
        v180 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v226 = "-[CKRecord(BRCSerializationAdditions) deserializeStatInfo:serverMetrics:itemID:session:error:]";
        v227 = 2080;
        if (!v191)
          v180 = "(ignored by caller)";
        v228 = (uint64_t)v180;
        v229 = 2112;
        v230 = v123;
        v231 = 2112;
        v232 = v124;
        _os_log_error_impl(&dword_230455000, v125, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    v22 = v37;
    if (v191)
      *v191 = objc_retainAutorelease(v123);

    v81 = 0;
    v51 = v189;
    v49 = v190;
    v50 = v188;
LABEL_176:
    v56 = v187;
    v79 = v184;
    v80 = v185;
    goto LABEL_61;
  }
  v22 = v37;
  if (v14)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v224, CFSTR("writable"));
    v50 = v188;
    v55 = v186;
  }
  else
  {
    v50 = v188;
    v55 = v186;
    if (v191)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v224);
      *v191 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  v78 = 0;
  v79 = 0;
  v81 = 0;
  v56 = v187;
  v80 = v185;
  v51 = v189;
  v49 = v190;
LABEL_61:

  return v81;
}

- (uint64_t)deserializeSymlinkTarget:()BRCSerializationAdditions error:
{
  uint64_t v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v14;
  id v15;

  v14 = 0;
  v15 = 0;
  v6 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v14, CFSTR("targetPath"), 1, objc_opt_class(), 0, &v15);
  v7 = v14;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;
    v8 = 0;
    goto LABEL_9;
  }
  if (a3)
  {
    if (v7)
    {
      v9 = (objc_class *)MEMORY[0x24BDD17C8];
      v10 = v7;
      v11 = objc_msgSend([v9 alloc], "initWithData:encoding:", v10, 4);
      v12 = *a3;
      *a3 = (void *)v11;

      v8 = v10;
    }
    else
    {
      v10 = *a3;
      *a3 = 0;
    }
LABEL_9:

  }
  return v6;
}

- (uint64_t)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:error:
{
  return objc_msgSend(a1, "deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:", a3, a4, a5, a6, 0, a7);
}

- (uint64_t)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:
{
  void *v14;
  char v15;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v40;
  int v41;
  char v42;
  char v43;
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  NSObject *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  char *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  double v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  const __CFString *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  NSObject *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  id v121;
  void *v122;
  const char *v123;
  char *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  BRFieldCKInfo *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  BRCStatInfo *v137;
  void *v138;
  void *v139;
  void *v140;
  BRCItemID *v141;
  void *v142;
  id v143;
  void *v144;
  double v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  NSObject *v152;
  void *v153;
  uint64_t v154;
  const char *v155;
  void *v156;
  void *v157;
  void *v158;
  char v159;
  void *v160;
  id v161;
  id v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  _QWORD *v167;
  id v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  char *v193;
  id v194;
  uint8_t buf[4];
  const char *v196;
  __int16 v197;
  const char *v198;
  __int16 v199;
  uint64_t v200;
  __int16 v201;
  uint64_t v202;
  __int16 v203;
  void *v204;
  uint64_t v205;

  v205 = *MEMORY[0x24BDAC8D0];
  v176 = a6;
  objc_msgSend(v176, "session");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v194 = 0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v192 = 0;
  v193 = 0;
  v190 = 0;
  v191 = 0;
  objc_msgSend(a1, "deserializeFilename:basename:bounceno:extension:userInfo:error:", &v193, &v192, &v190, &v191, v14, a8);
  v189 = 0;
  v15 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v189, CFSTR("exactSize"), 1, objc_opt_class(), 1, &v194);
  v16 = v189;
  v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("exactSize"));
      v30 = 0;
      v31 = 0;
      a8 = 0;
    }
    else
    {
      if (a8)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = 0;
        goto LABEL_22;
      }
      v30 = 0;
      v31 = 0;
    }
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
LABEL_22:
    v20 = v17;
    v38 = 0;
    goto LABEL_23;
  }
  v174 = v16;
  if (!v16)
  {
    v188 = 0;
    v18 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v188, CFSTR("size"), 0, objc_opt_class(), a7, &v194);
    v19 = v188;
    v20 = v19;
    if ((v18 & 1) == 0)
    {
      if (v14)
      {
        v40 = v19;
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("size"));
        v20 = v40;
        v30 = 0;
        v31 = 0;
        a8 = 0;
      }
      else
      {
        if (a8)
        {
          v57 = v19;
          objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
          v58 = (id)objc_claimAutoreleasedReturnValue();
          v20 = v57;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v38 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
LABEL_68:
          v36 = 0;
          *a8 = v58;
          goto LABEL_69;
        }
        v30 = 0;
        v31 = 0;
      }
      v32 = 0;
      v38 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
LABEL_27:
      v36 = 0;
      goto LABEL_23;
    }
    v174 = v19;
  }
  v187 = 0;
  v21 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v187, CFSTR("exactMtime"), 1, objc_opt_class(), 1, &v194);
  v22 = v187;
  if ((v21 & 1) == 0)
  {
    v37 = v22;
    if (!v14)
    {
      v35 = v174;
      if (a8)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v38 = 0;
        v33 = 0;
        v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = 0;
      }
      else
      {
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v38 = 0;
        v33 = 0;
        v36 = 0;
      }
      v20 = v37;
      v34 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("exactMtime"));
    v30 = 0;
    v31 = 0;
    a8 = 0;
    v32 = 0;
    v38 = 0;
    v33 = 0;
    v36 = 0;
    v20 = v37;
    v34 = 0;
LABEL_19:
    v35 = v174;
    goto LABEL_23;
  }
  v170 = v22;
  if (!v22)
  {
    v186 = 0;
    v23 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v186, CFSTR("mtime"), 0, objc_opt_class(), 1, &v194);
    v24 = v186;
    v20 = v24;
    if ((v23 & 1) != 0)
    {
      v170 = v24;
      goto LABEL_11;
    }
    if (v14)
    {
      v56 = v24;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("mtime"));
      v20 = v56;
      v30 = 0;
      v31 = 0;
      a8 = 0;
      v32 = 0;
      v38 = 0;
      v33 = 0;
      v34 = 0;
LABEL_52:
      v36 = 0;
      goto LABEL_19;
    }
    v35 = v174;
    if (a8)
    {
      v61 = v24;
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
      v58 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v61;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = 0;
      v33 = 0;
      v34 = 0;
      goto LABEL_68;
    }
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v38 = 0;
    v33 = 0;
    v34 = 0;
    goto LABEL_27;
  }
LABEL_11:
  v167 = a4;
  objc_msgSend(a1, "recordID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "recordName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("finderBookmark/"));

  if (v27)
  {
    v185 = 0;
    v28 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v185, CFSTR("bookmarkContent"), 0, objc_opt_class(), 1, &v194);
    v29 = v185;
    v20 = v29;
    if ((v28 & 1) != 0)
    {
      v168 = 0;
      v169 = v29;
      v166 = 0;
      goto LABEL_32;
    }
    if (v14)
    {
      v55 = v29;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("bookmarkContent"));
      v20 = v55;
      v30 = 0;
      v31 = 0;
      a8 = 0;
      v32 = 0;
      v38 = 0;
      v33 = 0;
      v36 = 0;
      goto LABEL_61;
    }
    v34 = v170;
    if (a8)
    {
      v59 = v29;
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
      v60 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v59;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = 0;
      v33 = 0;
      v36 = 0;
      *a8 = v60;
      a8 = 0;
      goto LABEL_19;
    }
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v38 = 0;
    v33 = 0;
    goto LABEL_52;
  }
  v184 = 0;
  v41 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v184, CFSTR("fileContent"), 0, objc_opt_class(), 1, &v194);
  v169 = v184;
  if ((v41 & 1) == 0)
  {
    if (!v14)
    {
      v34 = v170;
      v35 = v174;
      if (a8)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v38 = 0;
        v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = 0;
      }
      else
      {
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v38 = 0;
        v36 = 0;
      }
      v20 = v169;
      v33 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("fileContent"));
    v30 = 0;
    v31 = 0;
    a8 = 0;
    v32 = 0;
    v38 = 0;
    v36 = 0;
    v20 = v169;
    v33 = 0;
LABEL_61:
    v34 = v170;
    v35 = v174;
    goto LABEL_23;
  }
  v183 = 0;
  v42 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v183, CFSTR("pkgSignature"), 0, objc_opt_class(), 1, &v194);
  v168 = v183;
  if ((v42 & 1) == 0)
  {
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("pkgSignature"));
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = 0;
      v36 = 0;
      v20 = v168;
      v33 = v169;
      a8 = 0;
      goto LABEL_61;
    }
    v34 = v170;
    v35 = v174;
    v33 = v169;
    if (!a8)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = 0;
      v36 = 0;
      v20 = v168;
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v38 = 0;
    v36 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v168;
LABEL_69:
    a8 = 0;
    goto LABEL_23;
  }
  v182 = 0;
  v43 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v182, CFSTR("thumb1024"), 0, objc_opt_class(), 1, &v194);
  v44 = v182;
  v20 = v44;
  if ((v43 & 1) == 0)
  {
    if (v14)
    {
      v63 = v44;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("thumb1024"));
      v20 = v63;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = 0;
      v36 = 0;
      v34 = v170;
      v35 = v174;
      a8 = v168;
      v33 = v169;
      goto LABEL_23;
    }
    v33 = v169;
    v34 = v170;
    if (a8)
    {
      v67 = v44;
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v67;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = 0;
      v36 = 0;
      *a8 = v68;
    }
    else
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = 0;
      v36 = 0;
    }
LABEL_92:
    a8 = v168;
    goto LABEL_19;
  }
  v166 = v44;
LABEL_32:
  v181 = 0;
  v45 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v181, CFSTR("xattr"), 0, objc_opt_class(), 1, &v194);
  v46 = v181;
  if ((v45 & 1) == 0)
  {
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("xattr"));
      v30 = 0;
      v31 = 0;
      v36 = 0;
      v20 = v46;
      v32 = 0;
      goto LABEL_73;
    }
    v33 = v169;
    v34 = v170;
    v38 = v166;
    if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
      v30 = 0;
      v31 = 0;
      v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
      v31 = 0;
      v36 = 0;
    }
    v20 = v46;
    v32 = 0;
    goto LABEL_92;
  }
  v180 = 0;
  v47 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v180, CFSTR("xattrSignature"), 1, objc_opt_class(), 1, &v194);
  v48 = v180;
  if ((v47 & 1) == 0)
  {
    if (!v14)
    {
      v32 = v46;
      v34 = v170;
      v35 = v174;
      v33 = v169;
      v38 = v166;
      if (a8)
      {
        v66 = v48;
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
        v31 = 0;
        v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        v20 = v66;
      }
      else
      {
        v31 = 0;
        v36 = 0;
        v20 = v48;
      }
      v30 = 0;
      a8 = v168;
      goto LABEL_23;
    }
    v62 = v48;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("xattrSignature"));
    v31 = 0;
    v36 = 0;
    v32 = v46;
    v20 = v62;
    v30 = 0;
LABEL_73:
    v34 = v170;
    v35 = v174;
    a8 = v168;
    v33 = v169;
    v38 = v166;
    goto LABEL_23;
  }
  if (!v48 && v46)
  {
    objc_msgSend(v46, "signature");
    v48 = (id)objc_claimAutoreleasedReturnValue();
  }
  v165 = v48;
  v179 = 0;
  v49 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v179, CFSTR("boundaryKey"), 1, objc_opt_class(), 1, &v194);
  v50 = v179;
  if ((v49 & 1) != 0)
  {
    v163 = v46;
    v178 = 0;
    v51 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v178, CFSTR("boundaryKeyValidationKey"), 0, objc_opt_class(), 1, &v194);
    v52 = v178;
    v53 = v52;
    if ((v51 & 1) != 0)
    {
      v162 = v52;
      if (v50
        && (objc_msgSend(v50, "brc_truncatedSHA256"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v159 = objc_msgSend(v54, "isEqualToData:", v162),
            v54,
            (v159 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateBogusKey");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:].cold.3();

        v74 = objc_alloc(MEMORY[0x24BE17640]);
        objc_msgSend(a1, "recordID");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "zoneID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = (void *)objc_msgSend(v74, "initWithRecordZoneID:", v75);

        objc_msgSend(a1, "recordID");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "recordName");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = +[AppTelemetryTimeSeriesEvent newEDPKeysMismatchForRecordID:mangledID:](AppTelemetryTimeSeriesEvent, "newEDPKeysMismatchForRecordID:mangledID:", v76, v160);

        objc_msgSend(v177, "analyticsReporter");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v77);

      }
      else if (!a5)
      {
LABEL_109:
        v161 = v50;
        v34 = v170;
        if (!v170)
        {
          brc_bread_crumbs();
          v79 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(a1, "recordID");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "brc_itemIDWithSession:", v177);
            v173 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v154 = objc_msgSend(v173, "UTF8String");
            *(_DWORD *)buf = 136315394;
            v196 = (const char *)v154;
            v197 = 2112;
            v198 = v79;
            _os_log_fault_impl(&dword_230455000, v80, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: The server should have set an mtime for %s%@", buf, 0x16u);

          }
          v81 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(a1, "modificationDate");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "timeIntervalSince1970");
          if (!(unint64_t)v83)
            time(0);
          objc_msgSend(v81, "numberWithUnsignedLongLong:");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v169)
        {
          if (v17 || (v84 = objc_msgSend(v174, "unsignedLongLongValue"), v84 == objc_msgSend(v169, "size")))
          {
            v35 = v174;
          }
          else
          {
            v172 = v34;
            brc_bread_crumbs();
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(a1, "recordType");
              v109 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "recordID");
              v110 = (char *)objc_claimAutoreleasedReturnValue();
              v111 = objc_msgSend(v174, "longLongValue");
              v112 = objc_msgSend(v169, "size");
              *(_DWORD *)buf = 138413314;
              v196 = v109;
              v197 = 2112;
              v198 = v110;
              v199 = 2048;
              v200 = v111;
              v201 = 2048;
              v202 = v112;
              v203 = 2112;
              v204 = v107;
              _os_log_impl(&dword_230455000, v108, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ record %@ has a size inconsistency, %llu != %llu%@", buf, 0x34u);

            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v169, "size"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = v172;
          }
          if (v168)
          {
            v85 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(a1, "recordType");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "recordID");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "stringWithFormat:", CFSTR("%@ record %@ is both a file and a package"), v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v194;
            v194 = v88;

            if (v14)
            {
              v90 = v194;
              v91 = CFSTR("asset+pkg");
LABEL_143:
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v90, v91);
              v36 = 0;
              a8 = v168;
              v33 = v169;
              v38 = v166;
              v31 = v161;
LABEL_156:
              v32 = v163;
              v30 = v165;
LABEL_182:
              v20 = v162;
              goto LABEL_23;
            }
            goto LABEL_144;
          }
        }
        else
        {
          if (!v168)
          {
            v102 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(a1, "recordType");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "recordID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "stringWithFormat:", CFSTR("%@ record %@ is neither a file nor a package"), v103, v104);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v194;
            v194 = v105;

            v35 = v174;
            if (v14)
            {
              v90 = v194;
              v91 = CFSTR("pkg+signature");
              goto LABEL_143;
            }
LABEL_144:
            v31 = v161;
            v33 = v169;
            v38 = v166;
            if (a8)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
              v36 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v36 = 0;
            }
            a8 = v168;
            goto LABEL_156;
          }
          v35 = v174;
        }
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE17430], 1001, v14);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v92)
          {
            brc_bread_crumbs();
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, (os_log_type_t)0x90u))
            {
              v155 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v196 = "-[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone"
                     ":outOfBandUpload:error:]";
              v197 = 2080;
              if (!a8)
                v155 = "(ignored by caller)";
              v198 = v155;
              v199 = 2112;
              v200 = (uint64_t)v92;
              v201 = 2112;
              v202 = (uint64_t)v93;
              _os_log_error_impl(&dword_230455000, v94, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a8)
            *a8 = objc_retainAutorelease(v92);
          v31 = v161;

          brc_bread_crumbs();
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v196 = (const char *)a1;
            v197 = 2112;
            v198 = (const char *)v14;
            v199 = 2112;
            v200 = (uint64_t)v95;
            _os_log_error_impl(&dword_230455000, v96, (os_log_type_t)0x90u, "[ERROR] failed deserializing version in %@: %@%@", buf, 0x20u);
          }

          v36 = 0;
          a8 = v168;
          v33 = v169;
        }
        else
        {
          objc_msgSend(a1, "modifiedByDevice");
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v97)
          {
            brc_bread_crumbs();
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v99 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, (os_log_type_t)0x90u))
              -[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:].cold.2();

          }
          v100 = (void *)objc_opt_new();
          if (objc_msgSend(a1, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v177))
          {
            objc_msgSend(a1, "brc_lastEditorDeviceName");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setLastEditorDeviceName:", v101);

          }
          v171 = v34;
          if (objc_msgSend(v193, "br_nameIsRepresentableOnHFS"))
          {
            objc_msgSend(v100, "setOriginalPOSIXName:", v193);
          }
          else
          {
            v113 = v192;
            v114 = v190;
            v115 = v191;
            v116 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v114, "stringValue");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v115;
            objc_msgSend(v116, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v113, v117, v115, 0);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setOriginalPOSIXName:", v118);

            brc_bread_crumbs();
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v120 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              v175 = v35;
              v121 = v114;
              v122 = v100;
              v123 = v193;
              objc_msgSend(v122, "originalPOSIXName");
              v124 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v196 = v123;
              v100 = v122;
              v114 = v121;
              v35 = v175;
              v197 = 2112;
              v198 = v124;
              v199 = 2112;
              v200 = (uint64_t)v119;
              _os_log_impl(&dword_230455000, v120, OS_LOG_TYPE_DEFAULT, "[WARNING] Server gave us an unrepresentable filename: \"%@\" using \"%@\"%@", buf, 0x20u);

            }
            v34 = v171;
          }
          a8 = v168;
          objc_msgSend(v100, "setSize:", objc_msgSend(v35, "longLongValue"));
          objc_msgSend(v100, "setMtime:", objc_msgSend(v34, "longLongValue"));
          if (v169)
          {
            objc_msgSend(v169, "signature");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setContentSignature:", v125);

          }
          else
          {
            objc_msgSend(v100, "setContentSignature:", v168);
          }
          if (v166)
          {
            objc_msgSend(v166, "signature");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setThumbnailSignature:", v126);

            v127 = objc_msgSend(v166, "size");
          }
          else
          {
            objc_msgSend(v100, "setThumbnailSignature:", 0);
            v127 = 0;
          }
          objc_msgSend(v100, "setThumbnailSize:", v127);
          objc_msgSend(a1, "conflictLoserEtags");
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          if (v128)
          {
            v129 = objc_alloc(MEMORY[0x24BDBCF20]);
            objc_msgSend(a1, "conflictLoserEtags");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = (void *)objc_msgSend(v129, "initWithArray:", v130);
            objc_msgSend(v100, "setConflictLoserEtags:", v131);

            a8 = v168;
          }
          v132 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", a1);
          objc_msgSend(v100, "setCkInfo:", v132);

          objc_msgSend(v100, "setQuarantineInfo:", 0);
          objc_msgSend(v100, "setXattrSignature:", v165);
          objc_msgSend(v163, "fileURL");
          v133 = (void *)objc_claimAutoreleasedReturnValue();

          if (v133)
          {
            objc_msgSend(v177, "stageRegistry");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "fileURL");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "signature");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "saveXattrAtURL:forSignature:error:", v135, v136, 0);

            a8 = v168;
          }
          if (a3)
            *a3 = objc_retainAutorelease(v100);
          if (v167)
          {
            v137 = objc_alloc_init(BRCStatInfo);
            -[BRCStatInfo setType:](v137, "setType:", 1);
            -[BRCStatInfo setMode:](v137, "setMode:", objc_msgSend(a1, "permission") == 1);
            objc_msgSend(v100, "originalPOSIXName");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCStatInfo setLogicalName:](v137, "setLogicalName:", v138);

            objc_msgSend(a1, "recordID");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "recordName");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v140, "hasPrefix:", CFSTR("documentContent/"));

            if ((v36 & 1) != 0)
            {
              v141 = [BRCItemID alloc];
              objc_msgSend(v176, "dbRowID");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              v143 = -[BRCItemID _initAsZoneRootWithZoneRowID:](v141, "_initAsZoneRootWithZoneRowID:", v142);
              -[BRCStatInfo setParentID:](v137, "setParentID:", v143);

              objc_msgSend(a1, "creationDate");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "timeIntervalSince1970");
              v146 = (unint64_t)v145;
              if (!(unint64_t)v145)
                v146 = time(0);

              v147 = objc_msgSend(v171, "unsignedLongLongValue");
              if (v146 >= v147)
                v148 = v147;
              else
                v148 = v146;
              -[BRCStatInfo setBirthtime:](v137, "setBirthtime:", v148);
              objc_msgSend(v100, "ckInfo");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = (void *)objc_msgSend(v149, "copy");
              -[BRCStatInfo setCkInfo:](v137, "setCkInfo:", v150);

              -[BRCStatInfo setHiddenExt:](v137, "setHiddenExt:", 1);
              *v167 = objc_retainAutorelease(v137);
            }
            else
            {
              brc_bread_crumbs();
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v152 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v152, OS_LOG_TYPE_FAULT))
                -[CKRecord(BRCSerializationAdditions) deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:].cold.1();

            }
            v31 = v161;

            v33 = v169;
            v34 = v171;
            a8 = v168;
          }
          else
          {
            v31 = v161;
            v36 = 1;
            v33 = v169;
            v34 = v171;
          }

        }
        v30 = v165;
        v38 = v166;
        v32 = v163;
        goto LABEL_182;
      }
      *a5 = objc_retainAutorelease(v50);
      goto LABEL_109;
    }
    if (v14)
    {
      v31 = v50;
      v69 = v52;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v194, CFSTR("boundaryKeyValidationKey"));
      v53 = v69;
      v34 = v170;
      v35 = v174;
      v33 = v169;
      v38 = v166;
    }
    else
    {
      v14 = 0;
      v31 = v50;
      v34 = v170;
      v35 = v174;
      v33 = v169;
      v38 = v166;
      if (a8)
      {
        v70 = v52;
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
        v71 = (id)objc_claimAutoreleasedReturnValue();
        v53 = v70;
        *a8 = v71;
      }
    }

    v20 = 0;
    v36 = 0;
    a8 = v168;
    v32 = v163;
    v30 = v165;
  }
  else
  {
    v64 = v14;
    v65 = v50;
    v164 = v64;
    v32 = v46;
    if (v64)
    {
      objc_msgSend(v64, "setObject:forKeyedSubscript:", v194, CFSTR("boundaryKey"));
      v34 = v170;
      v35 = v174;
      v33 = v169;
      v38 = v166;
    }
    else
    {
      v34 = v170;
      v35 = v174;
      v33 = v169;
      v38 = v166;
      if (a8)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v194);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    v20 = 0;
    v31 = 0;
    v36 = 0;
    a8 = v168;
    v14 = v164;
    v30 = v165;
  }
LABEL_23:

  return v36;
}

- (uint64_t)deserializeSideCarInfo:()BRCSerializationAdditions error:
{
  BRCSideCarInfo *v7;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  BRFieldCKInfo *v14;
  BRCSideCarInfo *v15;
  void *v16;
  uint64_t v17;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = objc_alloc_init(BRCSideCarInfo);
  v21 = 0;
  v22 = 0;
  v8 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v21, CFSTR("lastOpenTime"), 0, objc_opt_class(), 1, &v22);
  v9 = v21;
  if ((v8 & 1) != 0)
  {
    v20 = 0;
    v10 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v20, CFSTR("favoriteRank"), 0, objc_opt_class(), 1, &v22);
    v11 = v20;
    if ((v10 & 1) != 0)
    {
      v19 = 0;
      v12 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v19, CFSTR("finderTags"), 1, objc_opt_class(), 1, &v22);
      v13 = v19;
      if ((v12 & 1) != 0)
      {
        v14 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", a1);
        -[BRCSideCarInfo setCkInfo:](v7, "setCkInfo:", v14);

        -[BRCSideCarInfo setFavoriteRank:](v7, "setFavoriteRank:", objc_msgSend(v11, "longLongValue"));
        -[BRCSideCarInfo setLastUsedTime:](v7, "setLastUsedTime:", objc_msgSend(v9, "longLongValue"));
        -[BRCSideCarInfo setFinderTags:](v7, "setFinderTags:", v13);
        v15 = v7;
        v16 = *a3;
        *a3 = v15;
        v17 = 1;
      }
      else
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v22);
          v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
        v16 = v13;
        v13 = 0;
      }
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v22);
        v13 = 0;
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
        v17 = 0;
      }
      v16 = v11;
      v11 = 0;
    }
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 1001, CFSTR("%@"), v22);
      v11 = 0;
      v13 = 0;
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
      v13 = 0;
      v17 = 0;
    }
    v16 = v9;
    v9 = 0;
  }

  return v17;
}

- (uint64_t)_locateSideCarServerZone:()BRCSerializationAdditions withShareAliasReference:withSession:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;

  v8 = a5;
  objc_msgSend(a4, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "brc_itemIDWithSession:error:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "serverDB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "fetch:", CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_id = %@"), v10);

    if (objc_msgSend(v12, "next"))
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __100__CKRecord_BRCSerializationAdditions___locateSideCarServerZone_withShareAliasReference_withSession___block_invoke;
      v23[3] = &unk_24FE40010;
      v24 = v8;
      objc_msgSend(v12, "object:", v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isBRAlias") & 1) == 0)
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) _locateSideCarServerZone:withShareAliasReference:withSession:].cold.1();

      }
      objc_msgSend(v13, "aliasTargetClientZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serverZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "asSharedZone");
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = *a3;
      *a3 = (void *)v16;

      objc_msgSend(v12, "close");
      v18 = v16 != 0;

    }
    else
    {
      objc_msgSend(a1, "recordID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v19, "locateSideCarServerZone:withSession:", a3, v8);

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (uint64_t)locateSideCarServerZone:()BRCSerializationAdditions shareRecordName:withSession:
{
  id v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;

  v8 = a5;
  v24 = 0;
  v25 = 0;
  v9 = objc_msgSend(a1, "_deserializeValue:forKey:encrypted:expectClass:allowNil:errorDescription:", &v24, CFSTR("shareReference"), 0, objc_opt_class(), 0, &v25);
  v10 = v24;
  v11 = v10;
  v12 = 0;
  if (v9)
  {
    objc_msgSend(v10, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordName");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *a4;
    *a4 = (void *)v14;

    objc_msgSend(v13, "recordName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("shareAlias/"));

    if (v17)
    {
      v12 = objc_msgSend(a1, "_locateSideCarServerZone:withShareAliasReference:withSession:", a3, v11, v8);
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x24BE17640]);
      objc_msgSend(v13, "zoneID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithRecordZoneID:", v19);

      objc_msgSend(v8, "serverZoneByMangledID:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "asSharedZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v22 != 0;
      if (v22)
        objc_storeStrong(a3, v22);

    }
  }

  return v12;
}

- (uint64_t)serializeSystemFields:()BRCSerializationAdditions
{
  return objc_msgSend(a1, "serializeSystemFields:includeCZMEtag:", a3, 1);
}

- (void)serializeSystemFields:()BRCSerializationAdditions includeCZMEtag:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "setCKInfoFieldsInRecord:includeCZMEtag:", a1);
  v4 = objc_alloc(MEMORY[0x24BE17640]);
  objc_msgSend(a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "initWithRecordZoneID:", v6);

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "useFailIfOutdatedForResets"))
  {
    objc_msgSend(a1, "setKnownToServer:", 1);
    objc_msgSend(v7, "fakeEtagForFailIfOutdated");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("none")) & 1) == 0)
      objc_msgSend(a1, "setEtag:", v8);

  }
}

- (void)serializeFinderTags:()BRCSerializationAdditions forCreation:
{
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(a1, "encryptedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("finderTags"));

  }
  else if ((a4 & 1) == 0)
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("finderTags"));
  }

}

- (void)serializeContentBoundaryKey:()BRCSerializationAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(a1, "encryptedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("boundaryKey"));

    objc_msgSend(v6, "brc_truncatedSHA256");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v5, CFSTR("boundaryKeyValidationKey"));

  }
}

- (void)seralizeBirthtime:()BRCSerializationAdditions
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSendRoundedTimestamps");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", BRCRoundedTimestamp(a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, CFSTR("birthtime"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("exactBirthtime"));

}

- (void)serializeSpecialIdentityForFilename:()BRCSerializationAdditions parentIDIsCloudDocsRoot:parentIDisDocumentsFolder:
{
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("specialDirectoryIdentity"));
  if (a4)
  {
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17568]) & 1) != 0)
    {
      v8 = &unk_24FEB3320;
LABEL_11:
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, CFSTR("specialDirectoryIdentity"));
      goto LABEL_12;
    }
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17578]) & 1) != 0)
    {
      v8 = &unk_24FEB3338;
      goto LABEL_11;
    }
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE175A0]) & 1) == 0)
    {
      if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17580]) & 1) == 0)
        goto LABEL_12;
      v8 = &unk_24FEB3368;
      goto LABEL_11;
    }
LABEL_10:
    v8 = &unk_24FEB3350;
    goto LABEL_11;
  }
  if (a5 && objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE175A0]))
    goto LABEL_10;
LABEL_12:

}

- (uint64_t)serializeFilename:()BRCSerializationAdditions forCreation:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:
{
  return objc_msgSend(a1, "serializeFilename:forCreation:setExtension:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", a3, a4, 1, a5, a6, a7);
}

- (uint64_t)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return objc_msgSend(a1, "serializeFilename:forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", a3, a4, a5, 0, a6, a7, v9);
}

- (void)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:
{
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  unsigned int v45;
  id v46;
  unint64_t v47;

  v15 = a3;
  v16 = a7;
  v46 = 0;
  v47 = 0;
  objc_msgSend(v15, "br_stringByDeletingPathBounceNo:andPathExtension:", &v47, &v46);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v46;
  if (v17)
  {
    v45 = a8;
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encryptedValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("encryptedBasename"));

    if ((a6 & 1) != 0)
      goto LABEL_23;
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "supportsEnhancedDrivePrivacy");

    if (!v22)
    {
      objc_msgSend(v17, "brc_SHA256");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v34, CFSTR("basehash"));

      goto LABEL_23;
    }
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateBogusKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v16, "isEqualToData:", v23);

      if (v24)
      {
        objc_msgSend(a1, "pluginFields");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(a1, "pluginFields");
          v44 = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v26, "mutableCopy");

          v25 = v44;
        }
        else
        {
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
        }

        objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("br_bougusSaltingKey"));
        objc_msgSend(a1, "setPluginFields:", v27);

      }
      objc_msgSend(v17, "brc_SHA256WithSalt:", v16);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v38, CFSTR("basehash"));

      objc_msgSend(a1, "recordType");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("structure"));

      if (v40)
      {
        objc_msgSend(v16, "brc_truncatedSHA256");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v41, CFSTR("basehashSaltValidationKey"));

        objc_msgSend(a1, "serializeSpecialIdentityForFilename:parentIDIsCloudDocsRoot:parentIDisDocumentsFolder:", v15, v45, a9);
      }
      goto LABEL_23;
    }
    objc_msgSend(v17, "brc_SHA256");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v35, CFSTR("basehash"));

    objc_msgSend(a1, "recordType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("structure"));

    if (!v37)
    {
LABEL_23:

      if (v47 < 2)
      {
        if ((a4 & 1) == 0)
          objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("bounceNo"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v42, CFSTR("bounceNo"));

      }
      if (v18)
        v43 = 0;
      else
        v43 = a4;
      if (a5 && (v43 & 1) == 0)
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v18, CFSTR("extension"));
      goto LABEL_33;
    }
    objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("basehashSaltValidationKey"));
    v29 = CFSTR("specialDirectoryIdentity");
    v28 = a1;
LABEL_10:
    objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, v29);
    goto LABEL_23;
  }
  if (a6)
  {
    objc_msgSend(a1, "encryptedValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v28;
    v29 = CFSTR("encryptedBasename");
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    -[CKRecord(BRCSerializationAdditions) serializeFilename:forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:].cold.2();

  brc_bread_crumbs();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    -[CKRecord(BRCSerializationAdditions) serializeFilename:forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:].cold.1();

LABEL_33:
}

- (BOOL)_verifyValueForRecordWithNumber:()BRCSerializationAdditions key:item:error:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "unsignedLongLongValue");
  if (v13 < 0)
  {
    v27 = a6;
    objc_msgSend(v12, "session");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "analyticsReporter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mangledID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v12, "clientZone");
    v18 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithBool:", objc_msgSend(v19, "enhancedDrivePrivacyEnabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "aggregateReportForAppTelemetryIdentifier:itemID:zoneMangledID:enhancedDrivePrivacyEnabled:error:", 41, v14, v16, v20, 0);

    v11 = v18;
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v11;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v21;
      _os_log_fault_impl(&dword_230455000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has negative value %@!%@", buf, 0x20u);
    }

    if (v27)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", v11, v10);
      *v27 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13 >= 0;
}

- (uint64_t)serializeStatInfo:()BRCSerializationAdditions diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
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
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  BOOL v58;
  uint64_t v59;
  void *v60;
  int v61;
  void *v62;
  uint64_t v65;
  void *v66;
  BOOL v67;
  void *v68;
  BOOL v69;
  void *v70;
  unsigned int v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  BOOL v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  int v109;
  char v110;
  id v111;
  void (**v112)(void);
  void (**v113)(id, id);
  void *v114;
  void *v115;
  _BOOL4 v116;
  void *v117;
  id v118;
  uint8_t buf[4];
  id v120;
  __int16 v121;
  void *v122;
  _BYTE v123[32];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v111 = a5;
  v113 = a8;
  v112 = a9;
  objc_msgSend(v15, "st");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = a6;
  if ((a6 & 1) != 0)
  {
    v116 = 1;
  }
  else
  {
    objc_msgSend(v117, "ckInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "etag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v17 == 0;

  }
  objc_msgSend(v117, "ckInfo");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "clientZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v18, "enhancedDrivePrivacyEnabled");

  objc_msgSend(v15, "clientZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isPrivateZone"))
  {
    objc_msgSend(v15, "appLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "wasMovedToCloudDocs");

  }
  else
  {
    v21 = 0;
  }

  if (v116)
  {
    if (objc_msgSend(v15, "isDirectory"))
    {
      if (v112)
      {
        v112[2]();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(a1, "brc_fillWithChildBasehashSalt:", v22);
          objc_msgSend(v15, "clientZone");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "itemID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "saltingStateForItemID:", v24);

          if (v25)
            v26 = v25;
          else
            v26 = 3;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setObject:forKeyedSubscript:", v27, CFSTR("saltingState"));

        }
      }
      else
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:].cold.2();

      }
    }
  }
  else if ((a4 & 0x60) == 0 && (a7 & 0x2C) == 0)
  {
    v114 = 0;
    goto LABEL_35;
  }
  if (v21
    && (objc_msgSend(v15, "itemID"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v30, "isDocumentsFolder"),
        v30,
        v31))
  {
    objc_msgSend(v15, "clientZone");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "asPrivateClientZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "rootItemID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "session");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "appLibraryRowID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appLibraryByRowID:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appLibraryID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("~"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "stringByAppendingString:", CFSTR("_Documents"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v117, "logicalNameWithoutLocalBounce");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "parentID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "appLibrary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "isCloudDocsAppLibrary"))
  {
    objc_msgSend(v15, "clientZone");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "isCloudDocsZone"))
    {
      objc_msgSend(v15, "parentItemIDInZone");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isNonDesktopRoot");

    }
    else
    {
      v45 = 0;
    }

  }
  else
  {
    v45 = 0;
  }

  objc_msgSend(v15, "parentItemIDInZone");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isDocumentsFolder");

  v113[2](v113, v15);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serializeFilename:forCreation:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", v41, v115 == 0, v114, v45, v47);
  objc_msgSend(v15, "serverZone");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "validatingDirectoryReferenceInZone:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v49, CFSTR("parent"));

  if ((a7 & 0x3C) != 0)
  {
    objc_msgSend(v15, "serverZone");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "pcsChainParentReferenceInZone:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setParent:", v51);

  }
LABEL_35:
  if (a7 == 2)
  {
LABEL_45:
    objc_msgSend(a1, "setWantsChainPCS:", 1);
    goto LABEL_46;
  }
  if ((objc_msgSend(v15, "isDirectory") & 1) != 0)
  {
    if ((a7 & 0xC) == 0)
      goto LABEL_46;
  }
  else
  {
    v52 = objc_msgSend(v15, "isDocument");
    if ((a7 & 0xC) != 0)
      v53 = v52;
    else
      v53 = 0;
    if ((v53 & 1) == 0)
      goto LABEL_46;
  }
  if (v116)
    goto LABEL_45;
  objc_msgSend(v15, "clientZone");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "asPrivateClientZone");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v55, "pcsChainStateForItem:", v56) < 2;

  if (v57)
    goto LABEL_45;
LABEL_46:
  v58 = !v116;
  if ((a4 & 0x10) != 0)
    v58 = 0;
  if (!v58)
  {
    v59 = objc_msgSend(v117, "birthtime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(a1, "_verifyValueForRecordWithNumber:key:item:error:", v60, CFSTR("birthtime"), v15, 0);

    if (!v61)
      v59 = 0;
    if (objc_msgSend(v15, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", v114 != 0))
    {
      objc_msgSend(a1, "seralizeBirthtime:", v59);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v59);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v62, CFSTR("birthtime"));

    }
  }
  if ((objc_msgSend(v15, "isSharedToMe") & 1) == 0)
  {
    if ((a4 & 0x800) != 0 || v116)
      objc_msgSend(a1, "setLastUsedTime:", objc_msgSend(v117, "lastUsedTime"));
    if ((a4 & 0x1000) != 0 || v116)
    {
      v65 = objc_msgSend(v117, "favoriteRank");
      if (v65)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v117, "favoriteRank"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v66 = 0;
      }
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v66, CFSTR("favoriteRank"));
      if (v65)

    }
    v67 = !v116;
    if ((a4 & 0x200) != 0)
      v67 = 0;
    if (!v67)
    {
      objc_msgSend(v117, "finderTags");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "serializeFinderTags:forCreation:", v68, v115 == 0);

    }
  }
  v69 = !v116;
  if ((a4 & 0x80) != 0)
    v69 = 0;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v117, "isHiddenExt"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v70, CFSTR("hiddenExt"));

  }
  if (v115)
    objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("ftags"));
  if ((a4 & 4) != 0 || v116)
  {
    v72 = objc_msgSend(v117, "type");
    if (v72 <= 0xA && ((1 << v72) & 0x611) != 0)
    {
      if (v115)
      {
        objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("writable"));
        objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("executable"));
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v117, "mode") & 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v73, CFSTR("writable"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (objc_msgSend(v117, "mode") >> 1) & 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v74, CFSTR("executable"));

    }
  }
  if ((a4 & 0x100) != 0 || v116)
  {
    objc_msgSend(v117, "xattrSignature");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      objc_msgSend(v15, "session");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "stageRegistry");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "xattrSignature");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "urlForXattrSignature:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      v118 = 0;
      LODWORD(v78) = objc_msgSend(v80, "checkResourceIsReachableAndReturnError:", &v118);
      v81 = v118;
      if ((_DWORD)v78)
      {
        if (v109)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateSaltingKey");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v82 = 0;
        }
        objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v80, v82);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v86, CFSTR("xattr"));
        if (v109)
        {
          objc_msgSend(v117, "xattrSignature");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v87 = 0;
        }
        objc_msgSend(a1, "encryptedValues");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v87, CFSTR("xattrSignature"));

        if (v109)
      }
      else
      {
        brc_bread_crumbs();
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v117, "xattrSignature");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKRecord(BRCSerializationAdditions) serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:].cold.1(v85, (uint64_t)v83, (uint64_t)v123, v84);
        }

        objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("xattr"));
        objc_msgSend(a1, "encryptedValues");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setObject:forKeyedSubscript:", 0, CFSTR("xattrSignature"));
      }

    }
    else
    {
      if (!v115)
        goto LABEL_110;
      objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("xattr"));
      objc_msgSend(a1, "encryptedValues");
      v81 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", 0, CFSTR("xattrSignature"));
    }

  }
LABEL_110:
  v89 = !v116;
  if ((a4 & 0x400) != 0)
    v89 = 0;
  if (!v89)
  {
    objc_msgSend(v15, "st");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "trashPutBackPath");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dataUsingEncoding:", 4);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "encryptedValues");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setObject:forKeyedSubscript:", v92, CFSTR("restorePath"));

    objc_msgSend(v15, "st");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "trashPutBackParentID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverZone");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "directoryReferenceInZone:action:", v96, 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v97, CFSTR("restoreParent"));

  }
  if (objc_msgSend(v15, "isSymLink"))
  {
    v98 = !v116;
    if ((a4 & 0x2000) != 0)
      v98 = 0;
    if (!v98)
    {
      objc_msgSend(v15, "asSymlink");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "symlinkTarget");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "dataUsingEncoding:", 4);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "encryptedValues");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("targetPath"));

    }
  }
  if ((v110 & 1) == 0)
  {
    objc_msgSend(v117, "ckInfo");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v103)
    {
      if (objc_msgSend(v15, "isFinderBookmark"))
      {
        brc_bread_crumbs();
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v120 = v15;
          v121 = 2112;
          v122 = v104;
          _os_log_impl(&dword_230455000, v105, OS_LOG_TYPE_DEFAULT, "[WARNING] Item is missing structure CKInfo so using the version CKInfo because they are the same record %@%@", buf, 0x16u);
        }

        objc_msgSend(v15, "asFinderBookmark");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "currentVersion");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "ckInfo");
        v103 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v103 = 0;
      }
    }
    objc_msgSend(a1, "serializeSystemFields:includeCZMEtag:", v103, objc_msgSend(v15, "isDocumentBeingCopiedToNewZone") ^ 1);

  }
  return 1;
}

- (uint64_t)_updateSize:()BRCSerializationAdditions mtime:shouldUseEnhancedDrivePrivacy:item:error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && a5)
  {
    objc_msgSend(a1, "encryptedValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("exactSize"));

  }
  if (v11)
  {
    if ((objc_msgSend(a1, "_verifyValueForRecordWithNumber:key:item:error:", v11, CFSTR("mtime"), v12, 0) & 1) == 0)
    {

      v11 = &unk_24FEB3380;
    }
    if (a5)
    {
      objc_msgSend(a1, "encryptedValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("exactMtime"));

      if (objc_msgSend(v13, "shouldSendRoundedTimestamps"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", BRCRoundedTimestamp(objc_msgSend(v11, "unsignedLongLongValue")));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setObject:forKeyedSubscript:", v16, CFSTR("mtime"));

      }
    }
    else
    {
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v11, CFSTR("mtime"));
    }
  }

  return 1;
}

- (uint64_t)serializeForContentUpload:()BRCSerializationAdditions size:mtime:etag:shouldUseEnhancedDrivePrivacy:error:
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v14 = a3;
  objc_msgSend(a1, "setEtag:", a6);
  objc_msgSend(a1, "setKnownToServer:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "_updateSize:mtime:shouldUseEnhancedDrivePrivacy:item:error:", v15, v16, a7, v14, a8);

  return v17;
}

- (uint64_t)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  NSObject *v36;
  char v37;
  void *v38;
  uint64_t v39;
  char v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  NSObject *v46;
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
  int v57;
  void *v58;
  void *v60;
  int v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  char v66;
  void *v68;
  id v69;

  v10 = a3;
  v69 = a6;
  objc_msgSend(v10, "currentVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = a5;
  v12 = objc_msgSend(v10, "contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:", a5);
  objc_msgSend(v11, "ckInfo");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4 & 0x4000000000000000) != 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:].cold.5();

  }
  if (!v11)
  {
    brc_bread_crumbs();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:].cold.4();

  }
  objc_msgSend(v10, "appLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isCloudDocsAppLibrary"))
  {
    objc_msgSend(v10, "clientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isCloudDocsZone"))
    {
      objc_msgSend(v10, "parentItemIDInZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isNonDesktopRoot");

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(v10, "parentItemIDInZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isDocumentsFolder");

  if (objc_msgSend(v10, "isSharedToMeTopLevelItem"))
  {
    if (v68)
      v21 = 0;
    else
      v21 = v12;
    if (v21 == 1)
    {
      objc_msgSend(v10, "clientZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "serverItemByItemID:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "latestVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "originalPOSIXName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        v28 = v26;
      }
      else
      {
        objc_msgSend(v11, "originalPOSIXName");
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = v28;

      objc_msgSend(a1, "serializeFilename:forCreation:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", v31, 1, 0, v18, v20);
    }
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initShareIDWithShareableItem:", v10);
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v30, 0);
    objc_msgSend(a1, "setShare:", v32);

    goto LABEL_26;
  }
  v29 = v12 ^ 1;
  if ((a4 & 0x40000) != 0)
    v29 = 0;
  if ((v29 & 1) == 0)
  {
    objc_msgSend(v11, "originalPOSIXName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "serializeFilename:forCreation:basehashSalt:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", v30, v68 == 0, v69, v18, v20);
LABEL_26:

  }
  if ((a4 & 0x80000) != 0)
    v33 = 0;
  else
    v33 = v12 ^ 1;
  if ((v33 & 1) != 0)
  {
    v34 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v11, "size"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 0x100000) == 0 && (objc_msgSend(v10, "isDocumentBeingCopiedToNewZone") & 1) == 0)
    {
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:].cold.3();

    }
  }
  if ((a4 & 0x20000) != 0)
    v37 = 0;
  else
    v37 = v12 ^ 1;
  if ((v37 & 1) != 0)
  {
    v38 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v11, "mtime"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = objc_msgSend(a1, "_updateSize:mtime:shouldUseEnhancedDrivePrivacy:item:error:", v34, v38, objc_msgSend(v10, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", v69 != 0), v10, a7);
  if ((v39 & 1) != 0)
  {
    v40 = v12 ^ 1;
    if ((a4 & 0x200000) != 0)
      v40 = 0;
    if ((v40 & 1) == 0)
    {
      objc_msgSend(v11, "xattrSignature");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (v42)
      {
        if (v68)
        {
          objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("xattr"));
          objc_msgSend(a1, "encryptedValues");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", 0, CFSTR("xattrSignature"));
          goto LABEL_55;
        }
LABEL_52:
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "encryptedValues");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("quarantine"));

LABEL_55:
LABEL_56:
        objc_msgSend(v10, "resolvedConflictLoserEtags");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if ((a4 & 0x800000) != 0 && objc_msgSend(v49, "count") && v68)
        {
          objc_msgSend(v11, "conflictLoserEtags");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_msgSend(v51, "mutableCopy");

          objc_msgSend(v52, "minusSet:", v50);
          objc_msgSend(v52, "allObjects");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setConflictLoserEtags:", v53);

        }
        if ((v66 & 1) != 0)
        {
          objc_msgSend(v10, "clientZone");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "mangledID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "forceFailIfExistOnRevival");

          if (v57)
          {
            objc_msgSend(a1, "setKnownToServer:", 0);
            objc_msgSend(a1, "setEtag:", 0);
          }
        }
        else
        {
          objc_msgSend(v11, "ckInfo");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "serializeSystemFields:includeCZMEtag:", v58, objc_msgSend(v10, "isDocumentBeingCopiedToNewZone") ^ 1);

        }
        goto LABEL_65;
      }
      objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("xattr"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43 == 0;

      if (v44)
      {
        brc_bread_crumbs();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:].cold.2();

      }
      objc_msgSend(a1, "encryptedValues");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("xattrSignature"));
      v46 = objc_claimAutoreleasedReturnValue();
      if (v46)
        goto LABEL_50;
      objc_msgSend(v10, "clientZone");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "enhancedDrivePrivacyEnabled");

      if (v61)
      {
        brc_bread_crumbs();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) serializeVersion:diffs:deadInServerTruth:basehashSalt:error:].cold.1();
LABEL_50:

      }
    }
    if (v68)
      goto LABEL_56;
    goto LABEL_52;
  }
LABEL_65:

  return v39;
}

- (void)serializeSideCarInfo:()BRCSerializationAdditions filenameExtension:diffs:deadInServerTruth:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  if ((a5 & 0x1000) != 0 || a6)
  {
    if (!objc_msgSend(v16, "favoriteRank"))
    {
      objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("favoriteRank"));
      if ((a5 & 0x800) != 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v16, "favoriteRank"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v11, CFSTR("favoriteRank"));

  }
  if ((a5 & 0x800) != 0)
  {
LABEL_7:
    objc_msgSend(a1, "setLastUsedTime:", objc_msgSend(v16, "lastUsedTime"));
    goto LABEL_8;
  }
LABEL_6:
  if (a6)
    goto LABEL_7;
LABEL_8:
  if ((a5 & 0x200) != 0 || a6)
  {
    objc_msgSend(v16, "finderTags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ckInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "etag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "serializeFinderTags:forCreation:", v12, v14 == 0);

  }
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v10, CFSTR("extension"));
  if ((a6 & 1) == 0)
  {
    objc_msgSend(v16, "ckInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "serializeSystemFields:", v15);

  }
}

- (void)setLastUsedTime:()BRCSerializationAdditions
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v4, CFSTR("lastOpenTime"));

  }
  else
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, CFSTR("lastOpenTime"));
  }
}

- (id)_createAppLibraryIfNecessary:()BRCSerializationAdditions session:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v5 = (objc_class *)MEMORY[0x24BE17640];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithAppLibraryName:", v7);

  objc_msgSend(v6, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:appLibraryExists:", v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Created app library through sync flow %@%@", buf, 0x16u);
    }

  }
  return v9;
}

- (void)_saveAppLibraryIfNecessary:()BRCSerializationAdditions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  if (objc_msgSend(v6, "needsSave"))
  {
    objc_msgSend(v6, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveAppLibraryToDB:", v6);

    objc_msgSend(v6, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flush");

  }
}

- (void)_processSaltingOnAppLibrary:()BRCSerializationAdditions
{
  id v4;
  void *v5;
  BRCBasehashSaltInfo *v6;

  v4 = a3;
  v6 = -[BRCBasehashSaltInfo initWithRecord:]([BRCBasehashSaltInfo alloc], "initWithRecord:", a1);
  -[BRCBasehashSaltInfo childBasehashSalt](v6, "childBasehashSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChildBasehashSalt:", v5);

  objc_msgSend(v4, "setSaltingState:", -[BRCBasehashSaltInfo saltingState](v6, "saltingState"));
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  void *v47;
  id v48;
  char v49;
  _QWORD block[4];
  id v51;
  void *v52;
  char v53;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "recordType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("structure"));

  if (v11)
  {
    objc_msgSend(a1, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "brc_isZoneRootRecordID"))
    {
      objc_msgSend(v9, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientTruthWorkloop");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke;
      block[3] = &unk_24FE437E8;
      v51 = v9;
      v52 = a1;
      v53 = a5;
      dispatch_async_and_wait(v15, block);

LABEL_33:
      goto LABEL_34;
    }
    if (objc_msgSend(v12, "brc_isAppLibraryRootRecordID"))
    {
      objc_msgSend(v12, "brc_appLibraryRootZoneName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_createAppLibraryIfNecessary:session:", v16, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "session");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clientTruthWorkloop");
      v19 = objc_claimAutoreleasedReturnValue();
      v43 = MEMORY[0x24BDAC760];
      v44 = 3221225472;
      v45 = __102__CKRecord_BRCSerializationAdditions__processAppLibraryDataWithMovedZoneNames_serverZone_isDeltaSync___block_invoke_2;
      v46 = &unk_24FE437E8;
      v47 = a1;
      v48 = v17;
      v49 = a5;
      v20 = v17;
      dispatch_async_and_wait(v19, &v43);

    }
    if (!objc_msgSend(v9, "isCloudDocsZone", v43, v44, v45, v46, v47))
      goto LABEL_33;
    if (objc_msgSend(v12, "brc_isAppLibraryRootRecordID"))
    {
      objc_msgSend(v12, "brc_appLibraryRootZoneName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.9();

      if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE17550]))
      {
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.1();

      }
      objc_msgSend(v8, "addObject:", v21);

    }
    if (objc_msgSend(v12, "brc_isAppLibraryDocumentsRecordID"))
    {
      objc_msgSend(v12, "brc_appLibraryDocumentsZoneName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.7();

      if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE17550]))
      {
        brc_bread_crumbs();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.1();

      }
      objc_msgSend(v8, "addObject:", v24);

    }
    if ((objc_msgSend(v9, "state") & 4) != 0)
      goto LABEL_33;
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("parent"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v27, "recordID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "brc_isAppLibraryRootRecordID"))
      {
        objc_msgSend(v28, "brc_appLibraryRootZoneName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.4();

        if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE17550]))
        {
          brc_bread_crumbs();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.1();

        }
        objc_msgSend(v8, "addObject:", v29);

      }
      if (!objc_msgSend(v28, "brc_isAppLibraryDocumentsRecordID"))
        goto LABEL_32;
      objc_msgSend(v28, "brc_appLibraryDocumentsZoneName");
      v32 = objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.2();

      if (-[NSObject isEqualToString:](v32, "isEqualToString:", *MEMORY[0x24BE17550]))
      {
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.1();

      }
      objc_msgSend(v8, "addObject:", v32);
    }
    else
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[CKRecord(BRCSerializationAdditions) processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:].cold.5();
    }

LABEL_32:
    goto LABEL_33;
  }
LABEL_34:

}

- (id)getAndUpdateBoundaryKeyForItem:()BRCSerializationAdditions
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if ((objc_msgSend(v4, "isFinderBookmark") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsEnhancedDrivePrivacy");

    v5 = 0;
    if (v7)
    {
      objc_msgSend(v4, "clientZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "itemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "db");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentBoundaryKeyForItemID:withDB:", v9, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", v5 != 0))
      {
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateSaltingKey");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(a1, "serializeContentBoundaryKey:", v5);
        v11 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "currentVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "size"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "encryptedValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("exactSize"));

      }
    }
  }

  return v5;
}

- (void)deserializeFilename:()BRCSerializationAdditions basename:bounceno:extension:userInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: empty basename and no bounceno%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)deserializeFilename:()BRCSerializationAdditions basename:bounceno:extension:userInfo:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] basename is nil -> replace with empty string%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)deserializeAliasInfo:()BRCSerializationAdditions serverZone:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No alias target%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_deserializeRootSharingOptions:()BRCSerializationAdditions .cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: Record %@ is missing its PSK or routing key!%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)deserializeStatInfo:()BRCSerializationAdditions serverMetrics:itemID:session:error:.cold.1()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_14();
  objc_msgSend(OUTLINED_FUNCTION_11_1(v1), "UTF8String");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v2, "[CRIT] UNREACHABLE: The server should have set a birthtime on %s%@", v3);
  OUTLINED_FUNCTION_2_0();
}

- (void)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: The record name is not a content in the shared zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_14();
  v3 = v2;
  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = v1;
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] %@ record %@ doesn't have a lastEditorDeviceName%@", (uint8_t *)&v6, 0x20u);

}

- (void)deserializeVersion:()BRCSerializationAdditions fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v3, "[CRIT] UNREACHABLE: Got unexpected content boundary key for recordID %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_locateSideCarServerZone:()BRCSerializationAdditions withShareAliasReference:withSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: si.isBRAlias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: invalid filename%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serializeFilename:()BRCSerializationAdditions forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] couldn't set basename to '%@'%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)serializeStatInfo:()BRCSerializationAdditions diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:.cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0(&dword_230455000, a4, a3, "[CRIT] UNREACHABLE: Couldn't find xattr for signature %@%@", (uint8_t *)a3);

}

- (void)serializeStatInfo:()BRCSerializationAdditions diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: childBasehashSaltGetter%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.encryptedValues[kBRRecordKeyXattrSignature] || !item.clientZone.enhancedDrivePrivacyEnabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self[kBRRecordKeyXattr]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: (diffs & BRC_IF_CONTENT_SIGNATURE) || item.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: version != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serializeVersion:()BRCSerializationAdditions diffs:deadInServerTruth:basehashSalt:error:.cold.5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[DEBUG] On Sync-up of %@ using old etag due to iWork conflict%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![zoneName isEqualToString:BRUbiquitousDefaultContainerID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] found parent app documents record named: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] found parent app library record named: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: parent is not a CKReference for %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.7()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] found app documents record named: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)processAppLibraryDataWithMovedZoneNames:()BRCSerializationAdditions serverZone:isDeltaSync:.cold.9()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v2, v3, "[DEBUG] found app library record named: %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
