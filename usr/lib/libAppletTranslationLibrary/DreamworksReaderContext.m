@implementation DreamworksReaderContext

+ (id)readAllFiles:(id)a3 debug:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  DreamworksReaderContext *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(DreamworksReaderContext);
  -[DreamworksReaderContext readAll:debug:error:](v8, "readAll:debug:error:", v7, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)readAll:(id)a3 debug:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  unsigned __int8 i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  DreamworksReaderContext *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  BOOL v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[8];
  int v66;
  char v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  _QWORD v77[2];
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v67 = 0;
  v66 = 61824;
  objc_msgSend(v8, "transceiveBytesAndCheckSW:length:error:", &v66, 5, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (unint64_t)objc_msgSend(v9, "length") > 0x8F)
  {
    v21 = *(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(v10), "bytes") + 52);
    v22 = __rev16(v21);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DreamworksReaderContext setFilePurseMaxRecCount:](self, "setFilePurseMaxRecCount:", v23);

    -[DreamworksReaderContext readBalance:error:](self, "readBalance:error:", v8, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[DreamworksReaderContext setBalance:](self, "setBalance:", v13);
      -[DreamworksReaderContext readRecord:sfi:index:error:](self, "readRecord:sfi:index:error:", v8, 2, 1, a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length") == 51)
      {
        v61 = a4;
        v62 = v24;
        v63 = v13;
        -[DreamworksReaderContext setFilePurseInfo:](self, "setFilePurseInfo:", v24);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[DreamworksReaderContext setFilePurse:](self, "setFilePurse:", v25);

        if (v21)
        {
          v26 = 1;
          do
          {
            -[DreamworksReaderContext readRecord:sfi:index:error:](self, "readRecord:sfi:index:error:", v8, 4, v26, a5);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "length") == 46 && (objc_msgSend(v27, "isAll00") & 1) == 0)
            {
              -[DreamworksReaderContext filePurse](self, "filePurse");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[DreamworksPurseRecord recordNumber:recordData:](DreamworksPurseRecord, "recordNumber:recordData:", v26, v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v29);

            }
            ++v26;
          }
          while (v22 >= v26);
        }
        -[DreamworksReaderContext filePurse](self, "filePurse");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[DreamworksPurseRecord adjustRecords:](DreamworksPurseRecord, "adjustRecords:", v30);

        -[DreamworksReaderContext readTransSN:error:](self, "readTransSN:error:", v8, a5);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v64, "count");
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[DreamworksReaderContext setFileTrans:](self, "setFileTrans:", v32);

        if (v31)
        {
          v33 = 1;
          for (i = 1; i <= v31; v33 = ++i)
          {
            -[DreamworksReaderContext readRecord:sfi:index:error:](self, "readRecord:sfi:index:error:", v8, 3, i, a5);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "length") == 52 && (objc_msgSend(v35, "isAll00") & 1) == 0)
            {
              -[DreamworksReaderContext fileTrans](self, "fileTrans");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectAtIndexedSubscript:", v33 - 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              +[DreamworksTransRecord recordNumber:recordData:seqnum:](DreamworksTransRecord, "recordNumber:recordData:seqnum:", i, v35, objc_msgSend(v37, "unsignedIntValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "addObject:", v38);

            }
          }
        }
        if (v61)
          -[DreamworksReaderContext dumpAllFiles](self, "dumpAllFiles");
        v39 = self;
        v24 = v62;
        v13 = v63;
        v40 = v64;
      }
      else
      {
        ATLLogObject();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3511000, v50, OS_LOG_TYPE_ERROR, "Failed to read EF_Purse_Info", buf, 2u);
        }

        v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to read EF_Purse_Info"));
        v40 = (void *)v51;
        if (a5)
        {
          v52 = *a5;
          v53 = (void *)MEMORY[0x1E0CB35C8];
          if (*a5)
          {
            v54 = *MEMORY[0x1E0CB3388];
            v68[0] = *MEMORY[0x1E0CB2D50];
            v68[1] = v54;
            v69[0] = v51;
            v69[1] = v52;
            v55 = (void *)MEMORY[0x1E0C99D80];
            v56 = v69;
            v57 = v68;
            v58 = 2;
          }
          else
          {
            v70 = *MEMORY[0x1E0CB2D50];
            v71 = v51;
            v55 = (void *)MEMORY[0x1E0C99D80];
            v56 = &v71;
            v57 = &v70;
            v58 = 1;
          }
          objc_msgSend(v55, "dictionaryWithObjects:forKeys:count:", v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v59);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v39 = 0;
      }
    }
    else
    {
      ATLLogObject();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v41, OS_LOG_TYPE_ERROR, "Failed to get balance", buf, 2u);
      }

      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to get balance"));
      v24 = (void *)v42;
      if (!a5)
      {
        v39 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v43 = *a5;
      v44 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v45 = *MEMORY[0x1E0CB3388];
        v72[0] = *MEMORY[0x1E0CB2D50];
        v72[1] = v45;
        v73[0] = v42;
        v73[1] = v43;
        v46 = (void *)MEMORY[0x1E0C99D80];
        v47 = v73;
        v48 = v72;
        v49 = 2;
      }
      else
      {
        v74 = *MEMORY[0x1E0CB2D50];
        v75 = v42;
        v46 = (void *)MEMORY[0x1E0C99D80];
        v47 = &v75;
        v48 = &v74;
        v49 = 1;
      }
      objc_msgSend(v46, "dictionaryWithObjects:forKeys:count:", v47, v48, v49);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v40);
      v39 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_45;
  }
  ATLLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v11, OS_LOG_TYPE_ERROR, "Failed to get correct signed state", buf, 2u);
  }

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to get correct signed state"));
  v13 = (void *)v12;
  if (a5)
  {
    v14 = *a5;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v76[0] = *MEMORY[0x1E0CB2D50];
      v76[1] = v16;
      v77[0] = v12;
      v77[1] = v14;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v77;
      v19 = v76;
      v20 = 2;
    }
    else
    {
      v78 = *MEMORY[0x1E0CB2D50];
      v79[0] = v12;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v79;
      v19 = &v78;
      v20 = 1;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v24);
    v39 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  v39 = 0;
LABEL_46:

  return v39;
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
  void *v12;
  void *v13;
  NSObject *v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1C3511000, v3, OS_LOG_TYPE_INFO, "--- Dreamworks DUMP BEGIN --", v15, 2u);
  }

  ATLLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[DreamworksReaderContext balance](self, "balance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v15 = 138412290;
    *(_QWORD *)&v15[4] = v5;
    _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_INFO, "    Balance File %@", v15, 0xCu);

  }
  -[DreamworksReaderContext filePurseInfo](self, "filePurseInfo");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "bytes");
  -[DreamworksReaderContext filePurseInfo](self, "filePurseInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[DreamworksReaderContext dumpAllFiles]", 109, v7, v9, CFSTR("    SFI 0x02:"), v10, v11, *(uint64_t *)v15);

  -[DreamworksReaderContext filePurse](self, "filePurse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_2);

  -[DreamworksReaderContext fileTrans](self, "fileTrans");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_397);

  ATLLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_INFO, "--- Dreamworks DUMP END --", v15, 2u);
  }

}

void __39__DreamworksReaderContext_dumpAllFiles__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v2, "seqnum");

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[DreamworksReaderContext dumpAllFiles]_block_invoke", 112, v3, v5, CFSTR("    Purse file record %u (SN 0x%X)"), v7, v8, v6);
}

void __39__DreamworksReaderContext_dumpAllFiles__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v2, "seqnum");

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[DreamworksReaderContext dumpAllFiles]_block_invoke_2", 115, v3, v5, CFSTR("    Trans file record %u (SN 0x%X)"), v7, v8, v6);
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
    objc_msgSend(a3, "transceiveBytesAndCheckSW:length:inArray:error:", buf, 5, &unk_1E7D9CE70, a6);
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

- (id)readTransSN:(id)a3 error:(id *)a4
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t i;
  void *v9;
  int v11;
  char v12;

  v12 = 0;
  v11 = 130688;
  objc_msgSend(a3, "transceiveBytesAndCheckSW:length:error:", &v11, 5, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 4)
  {
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5 >> 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < v7; i += 4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "u32BE:", i));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)readBalance:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
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
  _QWORD v20[2];
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "transceiveBytesAndCheckSW:length:error:", &readBalance_error__getBalanceCmd, 5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)objc_msgSend(objc_retainAutorelease(v6), "bytes")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v25 = objc_msgSend(v6, "length");
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Failed or short balance %u", buf, 8u);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed or short balance %u"), objc_msgSend(v6, "length"));
    v10 = (void *)v9;
    if (a4)
    {
      v11 = *a4;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v13 = *MEMORY[0x1E0CB3388];
        v20[0] = *MEMORY[0x1E0CB2D50];
        v20[1] = v13;
        v21[0] = v9;
        v21[1] = v11;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v21;
        v16 = v20;
        v17 = 2;
      }
      else
      {
        v22 = *MEMORY[0x1E0CB2D50];
        v23 = v9;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v23;
        v16 = &v22;
        v17 = 1;
      }
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7 = 0;
  }

  return v7;
}

- (NSData)filePurseInfo
{
  return self->_filePurseInfo;
}

- (void)setFilePurseInfo:(id)a3
{
  objc_storeStrong((id *)&self->_filePurseInfo, a3);
}

- (NSMutableArray)filePurse
{
  return self->_filePurse;
}

- (void)setFilePurse:(id)a3
{
  objc_storeStrong((id *)&self->_filePurse, a3);
}

- (NSMutableArray)fileTrans
{
  return self->_fileTrans;
}

- (void)setFileTrans:(id)a3
{
  objc_storeStrong((id *)&self->_fileTrans, a3);
}

- (NSNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_storeStrong((id *)&self->_balance, a3);
}

- (NSNumber)filePurseMaxRecCount
{
  return self->_filePurseMaxRecCount;
}

- (void)setFilePurseMaxRecCount:(id)a3
{
  objc_storeStrong((id *)&self->_filePurseMaxRecCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePurseMaxRecCount, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_fileTrans, 0);
  objc_storeStrong((id *)&self->_filePurse, 0);
  objc_storeStrong((id *)&self->_filePurseInfo, 0);
}

@end
