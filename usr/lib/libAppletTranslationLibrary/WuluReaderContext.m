@implementation WuluReaderContext

+ (id)readAllFiles:(id)a3 appletPID:(id)a4 debug:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  WuluReaderContext *v11;
  int v12;
  void *v13;

  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(WuluReaderContext);
  v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("A000000704A00110110700"));

  -[WuluReaderContext setLocalRecordFormat:](v11, "setLocalRecordFormat:", v12 ^ 1u);
  -[WuluReaderContext readAll:debug:error:](v11, "readAll:debug:error:", v10, v7, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)readAll:(id)a3 debug:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  unsigned int v42;
  void *v43;
  uint64_t v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  void *v53;
  void *v54;
  WuluReaderContext *v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  void *v74;
  void *v76;
  void *v77;
  _BOOL4 v78;
  uint8_t buf[4];
  int v80;
  _QWORD v81[2];
  _QWORD v82[2];
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[2];
  _QWORD v86[2];
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[2];
  _QWORD v94[2];
  uint64_t v95;
  _QWORD v96[3];

  v6 = a4;
  v96[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[WuluReaderContext readBalance:error:](self, "readBalance:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WuluReaderContext setBalance:](self, "setBalance:", v11);

    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WuluReaderContext setOverdraft:](self, "setOverdraft:", v12);

    -[WuluReaderContext balance](self, "balance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "unsignedIntValue"))
    {
      -[WuluReaderContext overdraft](self, "overdraft");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntValue");

      if (v15)
      {
        ATLLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_ERROR, "Balance and overdraft are not consistent.", buf, 2u);
        }

        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Balance and overdraft are not consistent."));
        v18 = (void *)v17;
        if (a5)
        {
          v19 = *a5;
          v20 = (void *)MEMORY[0x1E0CB35C8];
          if (*a5)
          {
            v21 = *MEMORY[0x1E0CB3388];
            v89[0] = *MEMORY[0x1E0CB2D50];
            v89[1] = v21;
            v90[0] = v17;
            v90[1] = v19;
            v22 = (void *)MEMORY[0x1E0C99D80];
            v23 = v90;
            v24 = v89;
LABEL_14:
            v29 = 2;
LABEL_57:
            objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v30);
            v55 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:

            goto LABEL_65;
          }
          v91 = *MEMORY[0x1E0CB2D50];
          v92 = v17;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = &v92;
          v24 = &v91;
          goto LABEL_56;
        }
        goto LABEL_42;
      }
    }
    else
    {

    }
    -[WuluReaderContext readBinary:sfi:error:](self, "readBinary:sfi:error:", v8, 21, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length") != 30)
    {
      ATLLogObject();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v56, OS_LOG_TYPE_ERROR, "Failed to read SFI 15", buf, 2u);
      }

      v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to read SFI 15"));
      v30 = (void *)v57;
      if (a5)
      {
        v58 = *a5;
        v59 = (void *)MEMORY[0x1E0CB35C8];
        if (*a5)
        {
          v60 = *MEMORY[0x1E0CB3388];
          v85[0] = *MEMORY[0x1E0CB2D50];
          v85[1] = v60;
          v86[0] = v57;
          v86[1] = v58;
          v61 = (void *)MEMORY[0x1E0C99D80];
          v62 = v86;
          v63 = v85;
          v64 = 2;
        }
        else
        {
          v87 = *MEMORY[0x1E0CB2D50];
          v88 = v57;
          v61 = (void *)MEMORY[0x1E0C99D80];
          v62 = &v88;
          v63 = &v87;
          v64 = 1;
        }
        objc_msgSend(v61, "dictionaryWithObjects:forKeys:count:", v62, v63, v64);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v54);
        v55 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      v55 = 0;
      goto LABEL_64;
    }
    -[WuluReaderContext setFile15:](self, "setFile15:", v18);
    -[WuluReaderContext readBinary:sfi:error:](self, "readBinary:sfi:error:", v8, 23, a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "length") != 60)
    {
      ATLLogObject();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v65, OS_LOG_TYPE_ERROR, "Failed to read SFI 17", buf, 2u);
      }

      v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to read SFI 17"));
      v54 = (void *)v66;
      if (a5)
      {
        v67 = *a5;
        v68 = (void *)MEMORY[0x1E0CB35C8];
        if (*a5)
        {
          v69 = *MEMORY[0x1E0CB3388];
          v81[0] = *MEMORY[0x1E0CB2D50];
          v81[1] = v69;
          v82[0] = v66;
          v82[1] = v67;
          v70 = (void *)MEMORY[0x1E0C99D80];
          v71 = v82;
          v72 = v81;
          v73 = 2;
        }
        else
        {
          v83 = *MEMORY[0x1E0CB2D50];
          v84 = v66;
          v70 = (void *)MEMORY[0x1E0C99D80];
          v71 = &v84;
          v72 = &v83;
          v73 = 1;
        }
        objc_msgSend(v70, "dictionaryWithObjects:forKeys:count:", v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v74);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v55 = 0;
LABEL_63:

      goto LABEL_64;
    }
    v78 = v6;
    v76 = v30;
    v77 = v18;
    -[WuluReaderContext setFile17:](self, "setFile17:", v30);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WuluReaderContext setFile18:](self, "setFile18:", v31);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WuluReaderContext setFile1E:](self, "setFile1E:", v32);

    v33 = 1;
    while (1)
    {
      -[WuluReaderContext readRecord:sfi:index:error:](self, "readRecord:sfi:index:error:", v8, 24, v33, a5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "length") == 23 && (objc_msgSend(v34, "isAll00") & 1) == 0)
      {
        -[WuluReaderContext file18](self, "file18");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_retainAutorelease(v34);
        +[WuluRecord withRecordSfi:recordNumber:recordData:associatedSerialNumber:](WuluRecord, "withRecordSfi:recordNumber:recordData:associatedSerialNumber:", 24, v33, v36, bswap32(*(unsigned __int16 *)objc_msgSend(v36, "bytes")) >> 16);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v37);

      }
      -[WuluReaderContext readExtendedRecord:sfi:index:error:](self, "readExtendedRecord:sfi:index:error:", v8, 30, v33, a5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "data");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "length") != 48)
        goto LABEL_25;
      objc_msgSend(v38, "data");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isAll00");

      if ((v41 & 1) == 0)
        break;
LABEL_26:

      v42 = v33++;
      if (v42 >= 0xA)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[WuluReaderContext setFile1A:](self, "setFile1A:", v43);

        v44 = 0;
        while (1)
        {
          v45 = readAll_debug_error__file1A_indices[v44];
          -[WuluReaderContext readExtendedRecord:sfi:index:error:](self, "readExtendedRecord:sfi:index:error:", v8, 26, readAll_debug_error__file1A_indices[v44], 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (!v46)
            break;
          objc_msgSend(v46, "data");
          v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v49 = *(unsigned __int8 *)(objc_msgSend(v48, "bytes") + 14);

          if (v49)
          {
            -[WuluReaderContext file1A](self, "file1A");
            v50 = objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v50, "addObject:", v47);
            goto LABEL_37;
          }
          if (v78)
          {
            ATLLogObject();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              v80 = v45;
              v51 = v50;
              v52 = "SFI 0x1A index %d is not initialized";
LABEL_36:
              _os_log_impl(&dword_1C3511000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 8u);
            }
            goto LABEL_37;
          }
LABEL_38:

          if (++v44 == 3)
          {
            -[WuluReaderContext file17](self, "file17");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "subdataWithOffset:length:", 6, 2);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            -[WuluReaderContext readAdditionalFile:cityCode:](self, "readAdditionalFile:cityCode:", v8, v54);
            if (v78)
              -[WuluReaderContext dumpAllFiles](self, "dumpAllFiles");
            v55 = self;
            v30 = v76;
            v18 = v77;
            goto LABEL_63;
          }
        }
        ATLLogObject();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v80 = v45;
          v51 = v50;
          v52 = "Failed to get SFI 0x1A index %u";
          goto LABEL_36;
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    -[WuluReaderContext file1E](self, "file1E");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v38);
LABEL_25:

    goto LABEL_26;
  }
  ATLLogObject();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_ERROR, "Failed to get balance", buf, 2u);
  }

  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to get balance"));
  v18 = (void *)v26;
  if (a5)
  {
    v27 = *a5;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v28 = *MEMORY[0x1E0CB3388];
      v93[0] = *MEMORY[0x1E0CB2D50];
      v93[1] = v28;
      v94[0] = v26;
      v94[1] = v27;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v94;
      v24 = v93;
      goto LABEL_14;
    }
    v95 = *MEMORY[0x1E0CB2D50];
    v96[0] = v26;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = v96;
    v24 = &v95;
LABEL_56:
    v29 = 1;
    goto LABEL_57;
  }
LABEL_42:
  v55 = 0;
LABEL_65:

  return v55;
}

- (void)readAdditionalFile:(id)a3 cityCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  id obj;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _QWORD v80[3];
  _QWORD v81[6];

  v81[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cityRules"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asHexString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    ATLLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)buf = 138412290;
    v75 = v7;
    v31 = "Configuration does not define city rules for city code %@";
LABEL_37:
    _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    goto LABEL_65;
  }
  v12 = objc_msgSend(v11, "unsignedIntValue");
  if (v12 == 7 || v12 == 5)
  {
    +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("localLogSettings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asHexString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      ATLLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v7;
        _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_DEFAULT, "Local log data settings missing for city %@.", buf, 0xCu);
      }
      goto LABEL_64;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WuluReaderContext setLocalRecords:](self, "setLocalRecords:", v18);

    -[NSObject objectForKey:](v17, "objectForKey:", CFSTR("localRecordSfi"));
    v19 = objc_claimAutoreleasedReturnValue();
    v62 = v17;
    -[NSObject objectForKey:](v17, "objectForKey:", CFSTR("localRecordId"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (!v19 || !v20)
    {
      ATLLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v7;
        _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_DEFAULT, "Local log data is not retrived from settings for city %@.", buf, 0xCu);
      }
      goto LABEL_63;
    }
    v58 = v11;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "u8:", 0);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "u8:", 0);

    -[WuluReaderContext readWuluRecord:sfi:index:](self, "readWuluRecord:sfi:index:", v6, v23, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      ATLLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v7;
        _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_DEFAULT, "Local record not read for city %@.", buf, 0xCu);
      }
      goto LABEL_62;
    }
    v27 = v26;
    -[WuluReaderContext localRecords](self, "localRecords");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v27);

    if (objc_msgSend(v11, "unsignedIntValue") == 5)
    {
      -[WuluReaderContext localRecords](self, "localRecords");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v27);

      -[WuluReaderContext localRecords](self, "localRecords");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v27);

LABEL_62:
      v11 = v58;
LABEL_63:

      v17 = v62;
LABEL_64:

      goto LABEL_65;
    }
    v43 = v7;
    v44 = (void *)MEMORY[0x1E0C99D50];
    -[NSObject objectForKey:](v62, "objectForKey:", CFSTR("metroEntryStationCode"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "dataWithHexString:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46 || objc_msgSend(v46, "length") != 4)
    {
      ATLLogObject();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v43;
        _os_log_impl(&dword_1C3511000, v52, OS_LOG_TYPE_DEFAULT, "Local log extra data is not retrived from settings for city %@.", buf, 0xCu);
      }
      goto LABEL_61;
    }
    -[WuluReaderContext readWuluRecord:sfi:index:](self, "readWuluRecord:sfi:index:", v6, objc_msgSend(v46, "u8:", 2), objc_msgSend(v46, "u8:", 3));
    v47 = objc_claimAutoreleasedReturnValue();

    v27 = v47;
    if (v47)
    {
      ATLLogObject();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v43;
        _os_log_impl(&dword_1C3511000, v48, OS_LOG_TYPE_DEFAULT, "Local entry record not read for city %@.", buf, 0xCu);
      }

      -[WuluReaderContext localRecords](self, "localRecords");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObject:", v27);

    }
    v50 = (void *)MEMORY[0x1E0C99D50];
    -[NSObject objectForKey:](v62, "objectForKey:", CFSTR("metroExitStationCode"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "dataWithHexString:", v51);
    v52 = objc_claimAutoreleasedReturnValue();

    if (v52 && -[NSObject length](v52, "length") == 4)
    {
      -[WuluReaderContext readWuluRecord:sfi:index:](self, "readWuluRecord:sfi:index:", v6, -[NSObject u8:](v52, "u8:", 2), -[NSObject u8:](v52, "u8:", 3));
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v27;
      v27 = v53;

      if (!v27)
      {
LABEL_61:

        v7 = v43;
        goto LABEL_62;
      }
      ATLLogObject();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v43;
        _os_log_impl(&dword_1C3511000, v55, OS_LOG_TYPE_DEFAULT, "Local exit record not read for city %@.", buf, 0xCu);
      }

      -[WuluReaderContext localRecords](self, "localRecords");
      v56 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v56, "addObject:", v27);
    }
    else
    {
      ATLLogObject();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v43;
        _os_log_impl(&dword_1C3511000, v56, OS_LOG_TYPE_DEFAULT, "Local log extra data is not retrived from settings for city %@.", buf, 0xCu);
      }
    }

    goto LABEL_61;
  }
  if (v12 != 4)
  {
    ATLLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)buf = 138412290;
    v75 = v11;
    v31 = "Configuration gave us unknown rule type %@";
    goto LABEL_37;
  }
  v57 = v7;
  v59 = v11;
  v80[0] = &unk_1E7D9AC38;
  v80[1] = &unk_1E7D9AC98;
  v81[0] = &unk_1E7D9CEA0;
  v81[1] = &unk_1E7D9CEB8;
  v80[2] = &unk_1E7D9ACB0;
  v81[2] = &unk_1E7D9CED0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3 * -[NSObject count](v17, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WuluReaderContext setLocalRecords:](self, "setLocalRecords:", v32);

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  -[NSObject allKeys](v17, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
  if (v64)
  {
    v61 = *(_QWORD *)v71;
    v63 = v17;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v71 != v61)
          objc_enumerationMutation(obj);
        v65 = v33;
        v34 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v33);
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v67 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              -[WuluReaderContext readWuluRecord:sfi:index:](self, "readWuluRecord:sfi:index:", v6, objc_msgSend(v34, "unsignedCharValue"), objc_msgSend(v40, "unsignedCharValue"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
              {
                -[WuluReaderContext localRecords](self, "localRecords");
                v42 = objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v42, "addObject:", v41);
              }
              else
              {
                ATLLogObject();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v75 = v34;
                  v76 = 2112;
                  v77 = v40;
                  _os_log_impl(&dword_1C3511000, v42, OS_LOG_TYPE_DEFAULT, "Failed to get SFI %@ index %@", buf, 0x16u);
                }
              }

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          }
          while (v37);
        }

        v33 = v65 + 1;
        v17 = v63;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    }
    while (v64);
  }

  v7 = v57;
  v11 = v59;
LABEL_65:

}

- (id)readWuluRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (-[WuluReaderContext localRecordFormat](self, "localRecordFormat") == 1)
  {
    -[WuluReaderContext readExtendedRecord:sfi:index:error:](self, "readExtendedRecord:sfi:index:error:", v8, v6, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[WuluReaderContext localRecordFormat](self, "localRecordFormat")
         || (-[WuluReaderContext readRecord:sfi:index:error:](self, "readRecord:sfi:index:error:", v8, v6, v5, 0),
             (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = 0;
  }
  else
  {
    v11 = (void *)v10;
    +[WuluRecord withRecordSfi:recordNumber:recordData:associatedSerialNumber:](WuluRecord, "withRecordSfi:recordNumber:recordData:associatedSerialNumber:", v6, v5, v10, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)dumpAllFiles
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v3, OS_LOG_TYPE_INFO, "--- WULU DUMP BEGIN --", buf, 2u);
  }

  ATLLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[WuluReaderContext balance](self, "balance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v5;
    _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_INFO, "    Balance File %@", buf, 0xCu);

  }
  -[WuluReaderContext file15](self, "file15");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "bytes");
  -[WuluReaderContext file15](self, "file15");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]", 241, v7, v9, CFSTR("    SFI 0x15:"), v10, v11, v34);

  -[WuluReaderContext file17](self, "file17");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "bytes");
  -[WuluReaderContext file17](self, "file17");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");
  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]", 242, v13, v15, CFSTR("    SFI 0x17:"), v16, v17, v35);

  -[WuluReaderContext file18](self, "file18");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", &__block_literal_global_4);

  -[WuluReaderContext file1E](self, "file1E");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", &__block_literal_global_386);

  -[WuluReaderContext file1A](self, "file1A");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", &__block_literal_global_389_0);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[WuluReaderContext localRecords](self, "localRecords");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v25, "data");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v27 = objc_msgSend(v26, "bytes");
        objc_msgSend(v25, "data");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length");
        v30 = objc_msgSend(v25, "sfi");
        objc_msgSend(v25, "number");
        objc_msgSend(v25, "associatedSerialNumber");
        LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]", 254, v27, v29, CFSTR("    SFI %02X record %u (SN 0x%X) localRecord"), v31, v32, v30);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v22);
  }

  ATLLogObject();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v33, OS_LOG_TYPE_INFO, "--- WULU DUMP END --", buf, 2u);
  }

}

void __33__WuluReaderContext_dumpAllFiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = a2;
  objc_msgSend(v2, "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v9, "bytes");
  objc_msgSend(v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(v2, "number");
  objc_msgSend(v2, "associatedSerialNumber");

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]_block_invoke", 244, v3, v5, CFSTR("    SFI 18 record %u (SN 0x%X)"), v7, v8, v6);
}

void __33__WuluReaderContext_dumpAllFiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = a2;
  objc_msgSend(v2, "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v9, "bytes");
  objc_msgSend(v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(v2, "number");
  objc_msgSend(v2, "associatedSerialNumber");

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]_block_invoke_2", 247, v3, v5, CFSTR("    SFI 1E record %u (SN 0x%X)"), v7, v8, v6);
}

void __33__WuluReaderContext_dumpAllFiles__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = a2;
  objc_msgSend(v2, "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v9, "bytes");
  objc_msgSend(v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(v2, "number");
  objc_msgSend(v2, "associatedSerialNumber");

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]_block_invoke_3", 250, v3, v5, CFSTR("    SFI 1A record %u (SN 0x%X)"), v7, v8, v6);
}

- (id)readRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v7 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  if (a4 < 0x1Fu)
  {
    *(_WORD *)buf = -19968;
    buf[2] = a5;
    buf[3] = (8 * a4) | 4;
    LOBYTE(v26) = 0;
    objc_msgSend(a3, "transceiveBytesAndCheckSW:length:error:", buf, 5, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v26 = v7;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Invalid SFI for read record 0x%x", buf, 8u);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid SFI for read record 0x%x"), v7);
    v10 = (void *)v9;
    if (a6)
    {
      v11 = *a6;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (*a6)
      {
        v13 = *MEMORY[0x1E0CB3388];
        v21[0] = *MEMORY[0x1E0CB2D50];
        v21[1] = v13;
        v22[0] = v9;
        v22[1] = v11;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v22;
        v16 = v21;
        v17 = 2;
      }
      else
      {
        v23 = *MEMORY[0x1E0CB2D50];
        v24 = v9;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v24;
        v16 = &v23;
        v17 = 1;
      }
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
  }
  return v18;
}

- (id)readExtendedRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int16 v15;
  char v16;
  char v17;
  char v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v15 = -3200;
  v16 = v7;
  v17 = (8 * v8) | 4;
  v18 = 0;
  objc_msgSend(v9, "transceiveBytesAndCheckSW:length:error:", &v15, 5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "length") >= 3)
  {
    objc_msgSend(v10, "subdataWithOffset:length:", 0, objc_msgSend(v10, "length") - 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_retainAutorelease(v10);
    +[WuluRecord withRecordSfi:recordNumber:recordData:associatedSerialNumber:](WuluRecord, "withRecordSfi:recordNumber:recordData:associatedSerialNumber:", v8, v7, v12, bswap32(*(unsigned __int16 *)(objc_msgSend(v13, "length") + objc_msgSend(v13, "bytes") - 2)) >> 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)readBinary:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  __int16 v20;
  char v21;
  __int16 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v20 = -20480;
  v21 = a4 | 0x80;
  v22 = 0;
  objc_msgSend(a3, "transceiveBytesAndCheckSW:length:error:", &v20, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v28 = v6;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "sfi 0x%x", buf, 8u);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("sfi 0x%x"), v6);
    v10 = (void *)v9;
    if (a5)
    {
      v11 = *a5;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v13 = *MEMORY[0x1E0CB3388];
        v23[0] = *MEMORY[0x1E0CB2D50];
        v23[1] = v13;
        v24[0] = v9;
        v24[1] = v11;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v24;
        v16 = v23;
        v17 = 2;
      }
      else
      {
        v25 = *MEMORY[0x1E0CB2D50];
        v26 = v9;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v26;
        v16 = &v25;
        v17 = 1;
      }
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v7;
}

- (id)readBalance:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "transceiveBytesAndCheckSW:length:error:", &readBalance_error__getBalanceCmd_0, 5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length") == 16)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v8, "numberWithUnsignedInt:", bswap32(*(_DWORD *)objc_msgSend(v9, "bytes")));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)(objc_msgSend(objc_retainAutorelease(v9), "bytes") + 8)));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  ATLLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v29 = objc_msgSend(v7, "length");
    _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "Failed or short balance %u", buf, 8u);
  }

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed or short balance %u"), objc_msgSend(v7, "length"));
  v10 = (void *)v14;
  if (a4)
  {
    v15 = *a4;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    if (*a4)
    {
      v17 = *MEMORY[0x1E0CB3388];
      v24[0] = *MEMORY[0x1E0CB2D50];
      v24[1] = v17;
      v25[0] = v14;
      v25[1] = v15;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v25;
      v20 = v24;
      v21 = 2;
    }
    else
    {
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = v14;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = &v27;
      v20 = &v26;
      v21 = 1;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v11);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (NSData)file15
{
  return self->_file15;
}

- (void)setFile15:(id)a3
{
  objc_storeStrong((id *)&self->_file15, a3);
}

- (NSData)file17
{
  return self->_file17;
}

- (void)setFile17:(id)a3
{
  objc_storeStrong((id *)&self->_file17, a3);
}

- (NSMutableArray)file18
{
  return self->_file18;
}

- (void)setFile18:(id)a3
{
  objc_storeStrong((id *)&self->_file18, a3);
}

- (NSMutableArray)file1E
{
  return self->_file1E;
}

- (void)setFile1E:(id)a3
{
  objc_storeStrong((id *)&self->_file1E, a3);
}

- (NSMutableArray)file1A
{
  return self->_file1A;
}

- (void)setFile1A:(id)a3
{
  objc_storeStrong((id *)&self->_file1A, a3);
}

- (NSNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_storeStrong((id *)&self->_balance, a3);
}

- (NSNumber)overdraft
{
  return self->_overdraft;
}

- (void)setOverdraft:(id)a3
{
  objc_storeStrong((id *)&self->_overdraft, a3);
}

- (NSMutableArray)localRecords
{
  return self->_localRecords;
}

- (void)setLocalRecords:(id)a3
{
  objc_storeStrong((id *)&self->_localRecords, a3);
}

- (unsigned)localRecordFormat
{
  return self->_localRecordFormat;
}

- (void)setLocalRecordFormat:(unsigned int)a3
{
  self->_localRecordFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecords, 0);
  objc_storeStrong((id *)&self->_overdraft, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_file1A, 0);
  objc_storeStrong((id *)&self->_file1E, 0);
  objc_storeStrong((id *)&self->_file18, 0);
  objc_storeStrong((id *)&self->_file17, 0);
  objc_storeStrong((id *)&self->_file15, 0);
}

@end
