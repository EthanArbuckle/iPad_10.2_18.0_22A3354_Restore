@implementation HerculesDecoder

+ (BOOL)canDecodeSPId:(unsigned __int8)a3
{
  return a3 == 49;
}

+ (id)getServiceProvider:(unsigned __int8)a3
{
  return CFSTR("Hercules");
}

+ (id)getEmReentryDelayMs
{
  return &unk_1E7D9A878;
}

+ (BOOL)getDontWaitForEOT
{
  return 1;
}

+ (BOOL)didTransactionError:(id *)a3 withTransactionResult:(unsigned __int16 *)a4
{
  _BOOL4 v6;
  __int16 v7;
  unsigned __int16 v8;

  v6 = *(unsigned __int16 *)((char *)&a3->var7 + 1) != 19 || a3->var8[1] != 238 || *(_WORD *)&a3->var4[31] != 0x4000;
  if (a4)
  {
    if (v6)
      v7 = 0;
    else
      v7 = 64;
    if (HIBYTE(a3->var7) == 15)
      v8 = -4096;
    else
      v8 = v7;
    *a4 = v8;
  }
  return v6;
}

+ (BOOL)supportsPlasticCardMode:(unsigned __int8)a3 withTransceiver:(id)a4
{
  void *v4;
  uint64_t v5;
  BOOL v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  +[MifareUtils getMcmDataDal:withTransceiver:withError:](MifareUtils, "getMcmDataDal:withTransceiver:withError:", 17987, a4, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (objc_msgSend(v4, "length") == 2 && v5 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v4, "u16BE:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[HerculesMappings supportsPlasticCardMode:](HerculesMappings, "supportsPlasticCardMode:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v8;
  void *v9;
  id v10;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = 0;
  +[MifareUtils getMcmDataDal:withTransceiver:withError:](MifareUtils, "getMcmDataDal:withTransceiver:withError:", 17987, v8, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;
  if (objc_msgSend(v9, "length") != 2 && v10 == 0)
  {
    ATLLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "asHexString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v13;
      _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_ERROR, "Invalid city code '%@'", buf, 0xCu);

    }
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v9, "asHexString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Invalid city code '%@'"), v15);

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v18);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v9, "u16BE:", 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    +[MifareUtils getMcmDataDal:withTransceiver:withError:](MifareUtils, "getMcmDataDal:withTransceiver:withError:", 17734, v8, &v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34;
    if (!objc_msgSend(v21, "length") && !v10)
    {
      ATLLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v22, OS_LOG_TYPE_ERROR, "No DAL data for Event File", buf, 2u);
      }

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No DAL data for Event File"));
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v25);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v10)
    {
      if (a7)
      {
        v10 = objc_retainAutorelease(v10);
        v19 = 0;
        *a7 = v10;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    +[HerculesDecoder parseDalData:withCityCode:withStateDict:withError:](HerculesDecoder, "parseDalData:withCityCode:withStateDict:withError:", v21, v20, v26, &v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v33;
    if (v28)
    {
      v10 = v28;
      if (a7)
      {
LABEL_23:
        v10 = objc_retainAutorelease(v10);
        v19 = 0;
        *a7 = v10;
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Balances"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      +[HerculesMappings addBalancesFromVC:withTransceiver:forCity:withError:](HerculesMappings, "addBalancesFromVC:withTransceiver:forCity:withError:", v29, v8, v20, &v32);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v32;
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("Balances"));

      if (!v10)
      {
        v36[0] = CFSTR("State");
        v36[1] = CFSTR("TransactionHistory");
        v37[0] = v26;
        v37[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (a7)
        goto LABEL_23;
    }
    v19 = 0;
    goto LABEL_29;
  }
  if (a7)
  {
    v10 = objc_retainAutorelease(v10);
    v19 = 0;
    *a7 = v10;
  }
  else
  {
    v19 = 0;
  }
LABEL_31:

  return v19;
}

+ (id)getRecords:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  unint64_t v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v39 = objc_msgSend(v5, "bytes");
  v40 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  v8 = (_BYTE *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  v12 = v10 + v11;
  if ((unint64_t)v8 >= v10 + v11)
  {
LABEL_10:
    objc_msgSend(v6, "reverseObjectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (_BYTE *)(v11 + v10);
    while (1)
    {
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v14 = DERDecodeItemCtx((uint64_t)&v39, &v36);
      if ((_DWORD)v14)
        break;
      if (v36 != 0xE000000000000000)
      {
        ATLLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v46 = v36;
          _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "Unexpected event tag 0x%llx", buf, 0xCu);
        }

        v29 = objc_alloc(MEMORY[0x1E0CB3940]);
        v30 = objc_msgSend(v29, "initWithFormat:", CFSTR("Unexpected event tag 0x%llx"), v36);
        v21 = (void *)v30;
        if (a4)
        {
          v31 = *a4;
          v23 = (void *)MEMORY[0x1E0CB35C8];
          if (*a4)
          {
            v32 = *MEMORY[0x1E0CB3388];
            v41[0] = *MEMORY[0x1E0CB2D50];
            v41[1] = v32;
            v42[0] = v30;
            v42[1] = v31;
            v25 = (void *)MEMORY[0x1E0C99D80];
            v26 = v42;
            v27 = v41;
LABEL_21:
            v33 = 2;
LABEL_25:
            objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v34);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_26;
          }
          v43 = *MEMORY[0x1E0CB2D50];
          v44 = v30;
          v25 = (void *)MEMORY[0x1E0C99D80];
          v26 = &v44;
          v27 = &v43;
LABEL_24:
          v33 = 1;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v37 - (_QWORD)v8 + v38, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v15);

      v8 = (_BYTE *)(v37 + v38);
      if (v37 + v38 < v12)
      {
        while (!*v8)
        {
          if ((unint64_t)++v8 >= v12)
          {
            v8 = v13;
            break;
          }
        }
      }
      v39 = (uint64_t)v8;
      v40 = v12 - (_QWORD)v8;
      if (v12 <= (unint64_t)v8)
        goto LABEL_10;
    }
    v18 = v14;
    ATLLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = v18;
      _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "Failed to decode item %d", buf, 8u);
    }

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode item %d"), v18);
    v21 = (void *)v20;
    if (a4)
    {
      v22 = *a4;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v47[0] = *MEMORY[0x1E0CB2D50];
        v47[1] = v24;
        v48[0] = v20;
        v48[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v48;
        v27 = v47;
        goto LABEL_21;
      }
      v49 = *MEMORY[0x1E0CB2D50];
      v50[0] = v20;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = v50;
      v27 = &v49;
      goto LABEL_24;
    }
LABEL_26:

    v17 = 0;
  }

  return v17;
}

+ (id)parseDalData:(id)a3 withCityCode:(id)a4 withStateDict:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  id *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[8];
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  _BYTE v61[128];
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  _QWORD v67[2];
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v51 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    +[HerculesDecoder getRecords:withError:](HerculesDecoder, "getRecords:withError:", v9, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!*a6)
    {
      if (objc_msgSend(v11, "count"))
      {
        v49 = v9;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v48 = v12;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v57;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v57 != v17)
                objc_enumerationMutation(v13);
              v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              *(_QWORD *)buf = 0;
              v55 = 0;
              v20 = objc_retainAutorelease(v19);
              *(_QWORD *)buf = objc_msgSend(v20, "bytes");
              v55 = objc_msgSend(v20, "length");
              if (v16)
                v21 = 0;
              else
                v21 = &v53;
              if (!v16)
                v53 = 0;
              if (objc_msgSend(v10, "count", v48))
                v22 = 0;
              else
                v22 = v10;
              +[HerculesDecoder getTransactionsFromRecord:withCityCode:withServerRefreshRequired:withStateDict:withError:](HerculesDecoder, "getTransactionsFromRecord:withCityCode:withServerRefreshRequired:withStateDict:withError:", buf, v51, v21, v22, a6);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v16)
                v16 = v53;
              if (*a6)
              {

                v33 = 0;
                v12 = v48;
                v9 = v49;
                v34 = v50;
                v35 = v13;
                goto LABEL_44;
              }
              if (objc_msgSend(v23, "count"))
                objc_msgSend(v50, "addObjectsFromArray:", v23);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
            if (v15)
              continue;
            break;
          }
        }
        else
        {
          v16 = 0;
        }

        v52 = 0;
        +[HerculesMappings mergeTaps:forCity:outEnRoute:](HerculesMappings, "mergeTaps:forCity:outEnRoute:", v50, v51, &v52);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v52;

        if (v16)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("ServerRefreshRequired"));
        v12 = v48;
        v9 = v49;
        if (v35)
        {
          v60 = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v46, CFSTR("TransactionInProgress"));

        }
        v34 = v45;
        v33 = v34;
LABEL_44:

      }
      else
      {
        ATLLogObject();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_ERROR, "No records", buf, 2u);
        }

        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No records"));
        v16 = (id)v37;
        v38 = *a6;
        v39 = (void *)MEMORY[0x1E0CB35C8];
        if (*a6)
        {
          v40 = *MEMORY[0x1E0CB3388];
          v62[0] = *MEMORY[0x1E0CB2D50];
          v62[1] = v40;
          v63[0] = v37;
          v63[1] = v38;
          v41 = (void *)MEMORY[0x1E0C99D80];
          v42 = v63;
          v43 = v62;
          v44 = 2;
        }
        else
        {
          v64 = *MEMORY[0x1E0CB2D50];
          v65 = v37;
          v41 = (void *)MEMORY[0x1E0C99D80];
          v42 = &v65;
          v43 = &v64;
          v44 = 1;
        }
        objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, v44);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v34);
        v33 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_48;
    }
  }
  else
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "No DAL data", buf, 2u);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No DAL data"));
    v12 = (void *)v25;
    if (a6)
    {
      v26 = *a6;
      v27 = (void *)MEMORY[0x1E0CB35C8];
      if (*a6)
      {
        v28 = *MEMORY[0x1E0CB3388];
        v66[0] = *MEMORY[0x1E0CB2D50];
        v66[1] = v28;
        v67[0] = v25;
        v67[1] = v26;
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = v67;
        v31 = v66;
        v32 = 2;
      }
      else
      {
        v68 = *MEMORY[0x1E0CB2D50];
        v69[0] = v25;
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = v69;
        v31 = &v68;
        v32 = 1;
      }
      objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v32);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v16);
      v33 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

      goto LABEL_49;
    }
  }
  v33 = 0;
LABEL_49:

  return v33;
}

+ (id)getTransactionsFromRecord:(id *)a3 withCityCode:(id)a4 withServerRefreshRequired:(id *)a5 withStateDict:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
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
  uint64_t v44;
  uint64_t v45;
  id v46;
  NSObject *v48;
  int v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t v69[8];
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint8_t *v76;
  uint64_t v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  uint64_t v81;
  uint64_t v82;
  uint8_t v83[8];
  uint8_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[2];
  _QWORD v94[2];
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[2];
  _QWORD v98[2];
  uint64_t v99;
  uint64_t v100;
  uint8_t buf[16];
  __int128 v102;
  __int128 v103;
  _OWORD v104[2];
  __int128 v105;
  __int128 v106;
  _OWORD v107[2];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[2];
  _QWORD v112[2];
  uint64_t v113;
  uint64_t v114;
  _QWORD v115[2];
  _QWORD v116[2];
  uint64_t v117;
  _QWORD v118[3];

  v118[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v77 = 0;
  v78[0] = 0;
  v78[1] = 0;
  v13 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v77);
  if (!(_DWORD)v13)
  {
    if (v77 != 0xE000000000000000)
    {
      ATLLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v77;
        _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx when trying to decode E0", buf, 0xCu);
      }

      v28 = objc_alloc(MEMORY[0x1E0CB3940]);
      v68 = v77;
      v29 = objc_msgSend(v28, "initWithFormat:", CFSTR("Unexpected tag 0x%llx when trying to decode E0"));
      v30 = (void *)v29;
      if (a7)
      {
        v31 = *a7;
        v32 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v33 = *MEMORY[0x1E0CB3388];
          v111[0] = *MEMORY[0x1E0CB2D50];
          v111[1] = v33;
          v112[0] = v29;
          v112[1] = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
        }
        else
        {
          v113 = *MEMORY[0x1E0CB2D50];
          v114 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v43);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[HerculesDecoder getTransactionsFromRecord:withCityCode:withServerRefreshRequired:withStateDict:withError:]", 296, (uint64_t)a3->var0, a3->var1, CFSTR("Record data"), v44, v45, v68);
      goto LABEL_37;
    }
    v109 = 0u;
    v110 = 0u;
    v108 = 0u;
    v106 = 0u;
    memset(v107, 0, sizeof(v107));
    v105 = 0u;
    v103 = 0u;
    memset(v104, 0, sizeof(v104));
    *(_OWORD *)buf = 0u;
    v102 = 0u;
    v20 = DERParseSequenceSpec((uint64_t)v78, (uint64_t)&EventContentSpec, (char *)buf, 0xC0uLL);
    if ((_DWORD)v20)
    {
      ATLLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v83 = 67109120;
        *(_DWORD *)&v83[4] = v20;
        _os_log_impl(&dword_1C3511000, v21, OS_LOG_TYPE_ERROR, "Failed to decode E0 contents %d", v83, 8u);
      }

      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E0 contents %d"), v20);
      v23 = (id)v22;
      if (a7)
      {
        v24 = *a7;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v26 = *MEMORY[0x1E0CB3388];
          v97[0] = *MEMORY[0x1E0CB2D50];
          v97[1] = v26;
          v98[0] = v22;
          v98[1] = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
        }
        else
        {
          v99 = *MEMORY[0x1E0CB2D50];
          v100 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        }
LABEL_60:
        v54 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v54);
        v46 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_65:

        goto LABEL_66;
      }
      goto LABEL_58;
    }
    if (**(_BYTE **)buf != 1)
    {
      ATLLogObject();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = **(_BYTE **)buf;
        *(_DWORD *)v83 = 67109120;
        *(_DWORD *)&v83[4] = v49;
        _os_log_impl(&dword_1C3511000, v48, OS_LOG_TYPE_ERROR, "Incorrect record version %hhu", v83, 8u);
      }

      v50 = objc_alloc(MEMORY[0x1E0CB3940]);
      v51 = objc_msgSend(v50, "initWithFormat:", CFSTR("Incorrect record version %hhu"), **(_BYTE **)buf);
      v23 = (id)v51;
      if (a7)
      {
        v52 = *a7;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v53 = *MEMORY[0x1E0CB3388];
          v93[0] = *MEMORY[0x1E0CB2D50];
          v93[1] = v53;
          v94[0] = v51;
          v94[1] = v52;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
        }
        else
        {
          v95 = *MEMORY[0x1E0CB2D50];
          v96 = v51;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        }
        goto LABEL_60;
      }
      goto LABEL_58;
    }
    if (v12)
    {
      +[HerculesDecoder parseBalanceCollection:withError:](HerculesDecoder, "parseBalanceCollection:withError:", v107, a7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        ATLLogObject();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v83 = 0;
          _os_log_impl(&dword_1C3511000, v64, OS_LOG_TYPE_ERROR, "Empty balance array", v83, 2u);
        }

        v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Empty balance array"));
        v23 = (id)v65;
        if (a7)
        {
          v66 = *a7;
          v25 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v67 = *MEMORY[0x1E0CB3388];
            v89[0] = *MEMORY[0x1E0CB2D50];
            v89[1] = v67;
            v90[0] = v65;
            v90[1] = v66;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
          }
          else
          {
            v91 = *MEMORY[0x1E0CB2D50];
            v92 = v65;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
          }
          goto LABEL_60;
        }
LABEL_58:
        v46 = 0;
LABEL_66:

        goto LABEL_38;
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, CFSTR("Balances"));
      if (*((_QWORD *)&v108 + 1))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)v108 != 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, CFSTR("CardDenyListed"));

      }
    }
    +[HerculesDecoder parseDateAndTime:](HerculesDecoder, "parseDateAndTime:", &v103);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[HerculesDecoder calculateTransactionSN:withDeviceId:withDeviceSN:](HerculesDecoder, "calculateTransactionSN:withDeviceId:withDeviceSN:", &v103, &v105, &v106);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a5 && *((_QWORD *)&v109 + 1) && *(_BYTE *)v109)
      *a5 = objc_retainAutorelease(v38);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v102);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)&v104[0] + 1))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", v104);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[HerculesMappings getStationCode:withTransitInformation:forCity:](HerculesMappings, "getStationCode:withTransitInformation:forCity:", v41, v40, v11);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42 = 0;
    }
    *(_QWORD *)v83 = 0;
    v84 = v83;
    v85 = 0x3032000000;
    v86 = __Block_byref_object_copy__0;
    v87 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v88 = (id)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __108__HerculesDecoder_getTransactionsFromRecord_withCityCode_withServerRefreshRequired_withStateDict_withError___block_invoke;
    v70[3] = &unk_1E7D8A210;
    v23 = v37;
    v71 = v23;
    v54 = v39;
    v72 = v54;
    v73 = v11;
    v55 = v40;
    v74 = v55;
    v56 = v42;
    v75 = v56;
    v76 = v83;
    if (DERDecodeSequenceWithBlock((unsigned __int8 **)&v110, (uint64_t)v70))
    {
      ATLLogObject();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v69 = 0;
        _os_log_impl(&dword_1C3511000, v57, OS_LOG_TYPE_ERROR, "Failed to parse event", v69, 2u);
      }

      v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to parse event"));
      v59 = (void *)v58;
      if (a7)
      {
        v60 = *a7;
        v61 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v62 = *MEMORY[0x1E0CB3388];
          v79[0] = *MEMORY[0x1E0CB2D50];
          v79[1] = v62;
          v80[0] = v58;
          v80[1] = v60;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
        }
        else
        {
          v81 = *MEMORY[0x1E0CB2D50];
          v82 = v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        }
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v63);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v46 = 0;
    }
    else
    {
      v46 = *((id *)v84 + 5);
    }

    _Block_object_dispose(v83, 8);
    goto LABEL_65;
  }
  ATLLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v13;
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "Failed to decode E0 %d", buf, 8u);
  }

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E0 %d"), v13);
  v16 = (void *)v15;
  if (a7)
  {
    v17 = *a7;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v19 = *MEMORY[0x1E0CB3388];
      v115[0] = *MEMORY[0x1E0CB2D50];
      v115[1] = v19;
      v116[0] = v15;
      v116[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
    }
    else
    {
      v117 = *MEMORY[0x1E0CB2D50];
      v118[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v34);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_37:
  v46 = 0;
LABEL_38:

  return v46;
}

uint64_t __108__HerculesDecoder_getTransactionsFromRecord_withCityCode_withServerRefreshRequired_withStateDict_withError___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  +[HerculesDecoder parseEvent:withError:](HerculesDecoder, "parseEvent:withError:", a2, &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v4)
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v6 = 3;
LABEL_16:

    goto LABEL_17;
  }
  if (v3)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[4], CFSTR("TransactionTime"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[5], CFSTR("SerialNumber"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[6], CFSTR("CityCode"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("Transit"));

    if (v8)
    {
      +[HerculesMappings getTransitModality:forCity:](HerculesMappings, "getTransitModality:forCity:", a1[7], a1[6]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("TypeDetail"));

      if (a1[8])
      {
        +[HerculesMappings getStationMode:forCity:](HerculesMappings, "getStationMode:forCity:", a1[7], a1[6]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[8], v10);

      }
      +[HerculesMappings processEnRouteStatus:forTransitInformation:forCity:](HerculesMappings, "processEnRouteStatus:forTransitInformation:forCity:", v3, a1[7], a1[6]);
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("TopUp")))
      {
        v13 = a1[8];

        if (v13)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[8], CFSTR("StartStation"));
      }
      else
      {

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "addObject:", v3);
    v6 = 0;
    goto LABEL_16;
  }
  v6 = 0;
LABEL_17:

  return v6;
}

+ (id)parseEvent:(id *)a3 withError:(id *)a4
{
  void *v5;
  NSObject *v6;
  unint64_t var0;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v5 = 0;
  v11 = *MEMORY[0x1E0C80C00];
  switch(a3->var0)
  {
    case 0xE000000000000001:
      +[HerculesDecoder parseUseEvent:withError:](HerculesDecoder, "parseUseEvent:withError:", &a3->var1, a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 0xE000000000000002:
      +[HerculesDecoder parseSaleEvent:withError:](HerculesDecoder, "parseSaleEvent:withError:", &a3->var1, a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 0xE000000000000003:
      +[HerculesDecoder parsePurchaseEvent:withError:](HerculesDecoder, "parsePurchaseEvent:withError:", &a3->var1, a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 0xE000000000000004:
      return v5;
    default:
      if (a3->var0 == 0xE00000000000000ELL)
        return v5;
      ATLLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a3->var0;
        v9 = 134217984;
        v10 = var0;
        _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%llx", (uint8_t *)&v9, 0xCu);
      }

      return 0;
  }
}

+ (id)parseUseEvent:(id *)a3 withError:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _OWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  memset(v22, 0, sizeof(v22));
  v5 = DERParseSequenceSpec((uint64_t)a3, (uint64_t)&UseEventContentSpec, (char *)v22, 0x20uLL);
  if ((_DWORD)v5)
  {
    v6 = v5;
    ATLLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v28 = v6;
      _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_ERROR, "Failed to decode use event item contents %d", buf, 8u);
    }

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode use event item contents %d"), v6);
    v9 = (void *)v8;
    if (a4)
    {
      v10 = *a4;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v12 = *MEMORY[0x1E0CB3388];
        v23[0] = *MEMORY[0x1E0CB2D50];
        v23[1] = v12;
        v24[0] = v8;
        v24[1] = v10;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = v24;
        v15 = v23;
        v16 = 2;
      }
      else
      {
        v25 = *MEMORY[0x1E0CB2D50];
        v26 = v8;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = &v26;
        v15 = &v25;
        v16 = 1;
      }
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v18);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    +[HerculesDecoder parseIdentifierCollection:withError:](HerculesDecoder, "parseIdentifierCollection:withError:", v22, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if (v17)
    {
      Filter(v17, &__block_literal_global);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      Filter(v9, &__block_literal_global_338);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("Transit"), CFSTR("TypeDetail"));
      if (objc_msgSend(v18, "count"))
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("Amounts"));
      if (objc_msgSend(v19, "count"))
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("CommutePlans"));

      goto LABEL_16;
    }
  }
  v20 = 0;
LABEL_17:

  return v20;
}

BOOL __43__HerculesDecoder_parseUseEvent_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AmountIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __43__HerculesDecoder_parseUseEvent_withError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CommutePlanIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)parseSaleEvent:(id *)a3 withError:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  _OWORD v28[5];
  __int128 v29;
  _OWORD v30[4];
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  memset(v30, 0, sizeof(v30));
  v29 = 0u;
  memset(v28, 0, sizeof(v28));
  v27 = 0u;
  v5 = DERParseSequenceSpec((uint64_t)a3, (uint64_t)&SaleEventContentSpec, (char *)&v27, 0xB0uLL);
  if ((_DWORD)v5)
  {
    v6 = v5;
    ATLLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v39 = v6;
      _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_ERROR, "Failed to decode sale event item contents %d", buf, 8u);
    }

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode sale event item contents %d"), v6);
    v9 = (void *)v8;
    if (a4)
    {
      v10 = *a4;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v12 = *MEMORY[0x1E0CB3388];
        v34[0] = *MEMORY[0x1E0CB2D50];
        v34[1] = v12;
        v35[0] = v8;
        v35[1] = v10;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = v35;
        v15 = v34;
        v16 = 2;
      }
      else
      {
        v36 = *MEMORY[0x1E0CB2D50];
        v37 = v8;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = &v37;
        v15 = &v36;
        v16 = 1;
      }
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v21);
      v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    +[HerculesDecoder addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:](HerculesDecoder, "addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:", v30, &v29, CFSTR("Amount"), CFSTR("AmountCurrency"), CFSTR("AmountCurrencyExponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if (v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Amount"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 1, 0, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "decimalNumberByMultiplyingBy:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("Amount"));

      +[HerculesDecoder getIdentifier:withInstanceIdentifier:](HerculesDecoder, "getIdentifier:withInstanceIdentifier:", &v27, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("AmountIdentifier"));
      v22 = (void *)MEMORY[0x1E0C99E08];
      v32[1] = CFSTR("Amounts");
      v33[0] = CFSTR("TopUp");
      v31 = v9;
      v32[0] = CFSTR("TypeDetail");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dictionaryWithDictionary:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      goto LABEL_13;
    }
  }
  v25 = 0;
LABEL_13:

  return v25;
}

+ (id)parsePurchaseEvent:(id *)a3 withError:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  _OWORD v24[4];
  __int128 v25;
  _OWORD v26[3];
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  memset(v26, 0, sizeof(v26));
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
  v5 = DERParseSequenceSpec((uint64_t)a3, (uint64_t)&PurchaseEventContentSpec, (char *)&v23, 0x90uLL);
  if ((_DWORD)v5)
  {
    v6 = v5;
    ATLLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v35 = v6;
      _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_ERROR, "Failed to decode purchase event item contents %d", buf, 8u);
    }

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode purchase event item contents %d"), v6);
    v9 = (void *)v8;
    if (a4)
    {
      v10 = *a4;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v12 = *MEMORY[0x1E0CB3388];
        v30[0] = *MEMORY[0x1E0CB2D50];
        v30[1] = v12;
        v31[0] = v8;
        v31[1] = v10;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = v31;
        v15 = v30;
        v16 = 2;
      }
      else
      {
        v32 = *MEMORY[0x1E0CB2D50];
        v33 = v8;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = &v33;
        v15 = &v32;
        v16 = 1;
      }
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v17);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    +[HerculesDecoder addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:](HerculesDecoder, "addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:", v26, &v25, CFSTR("Amount"), CFSTR("AmountCurrency"), CFSTR("AmountCurrencyExponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[HerculesDecoder getIdentifier:withInstanceIdentifier:](HerculesDecoder, "getIdentifier:withInstanceIdentifier:", &v23, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("AmountIdentifier"));
      v18 = (void *)MEMORY[0x1E0C99E08];
      v28[1] = CFSTR("Amounts");
      v29[0] = CFSTR("Purchase");
      v28[0] = CFSTR("TypeDetail");
      v27 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dictionaryWithDictionary:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      goto LABEL_13;
    }
  }
  v21 = 0;
LABEL_13:

  return v21;
}

+ (id)parseBalanceCollection:(id *)a3 withError:(id *)a4
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint8_t v22[8];
  _QWORD v23[5];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a3->var1)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__HerculesDecoder_parseBalanceCollection_withError___block_invoke;
    v23[3] = &unk_1E7D8A298;
    v23[4] = buf;
    if (DERDecodeSequenceWithBlock((unsigned __int8 **)a3, (uint64_t)v23))
    {
      ATLLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_ERROR, "Failed to parse balance item", v22, 2u);
      }

      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to parse balance item"));
      v8 = (void *)v7;
      if (a4)
      {
        v9 = *a4;
        v10 = (void *)MEMORY[0x1E0CB35C8];
        if (*a4)
        {
          v11 = *MEMORY[0x1E0CB3388];
          v30[0] = *MEMORY[0x1E0CB2D50];
          v30[1] = v11;
          v31[0] = v7;
          v31[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        }
        else
        {
          v32 = *MEMORY[0x1E0CB2D50];
          v33 = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
    }
    else
    {
      v19 = *((id *)v25 + 5);
    }
    _Block_object_dispose(buf, 8);

    return v19;
  }
  else
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "Missing or zero length balance collection", buf, 2u);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing or zero length balance collection"));
    v15 = (void *)v14;
    if (a4)
    {
      v16 = *a4;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v18 = *MEMORY[0x1E0CB3388];
        v34[0] = *MEMORY[0x1E0CB2D50];
        v34[1] = v18;
        v35[0] = v14;
        v35[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      }
      else
      {
        v36 = *MEMORY[0x1E0CB2D50];
        v37[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

uint64_t __52__HerculesDecoder_parseBalanceCollection_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  +[HerculesDecoder parseBalanceItem:withError:](HerculesDecoder, "parseBalanceItem:withError:", a2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v5 = 0;
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v5 = 3;
  }

  return v5;
}

+ (id)parseBalanceItem:(id *)a3 withError:(id *)a4
{
  uint64_t v6;
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
  NSObject *v18;
  unint64_t var0;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  int v37;
  uint8_t v38[16];
  __int128 v39;
  __int128 v40;
  _OWORD v41[4];
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  if (a3->var0 == 0xE000000000000005)
  {
    memset(v41, 0, sizeof(v41));
    v39 = 0u;
    v40 = 0u;
    *(_OWORD *)v38 = 0u;
    v6 = DERParseSequenceSpec((uint64_t)&a3->var1, (uint64_t)&BalanceItemContentSpec, (char *)v38, 0x70uLL);
    if ((_DWORD)v6)
    {
      v7 = v6;
      ATLLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v37 = v7;
        _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Failed to decode balance item contents %d", buf, 8u);
      }

      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode balance item contents %d"), v7);
      v10 = (void *)v9;
      if (a4)
      {
        v11 = *a4;
        v12 = (void *)MEMORY[0x1E0CB35C8];
        if (*a4)
        {
          v13 = *MEMORY[0x1E0CB3388];
          v32[0] = *MEMORY[0x1E0CB2D50];
          v32[1] = v13;
          v33[0] = v9;
          v33[1] = v11;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = v33;
          v16 = v32;
          v17 = 2;
        }
        else
        {
          v34 = *MEMORY[0x1E0CB2D50];
          v35 = v9;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = &v35;
          v16 = &v34;
          v17 = 1;
        }
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v31);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        a4 = 0;
      }
    }
    else
    {
      +[HerculesDecoder addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:](HerculesDecoder, "addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:", v41, &v40, CFSTR("Balance"), CFSTR("BalanceCurrency"), CFSTR("BalanceCurrencyExponent"));
      a4 = (id *)objc_claimAutoreleasedReturnValue();
      +[HerculesDecoder getIdentifier:withInstanceIdentifier:](HerculesDecoder, "getIdentifier:withInstanceIdentifier:", v38, &v39);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a4, "setObject:forKeyedSubscript:", v10, CFSTR("BalanceIdentifier"));
    }

    return a4;
  }
  else
  {
    ATLLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      var0 = a3->var0;
      *(_DWORD *)v38 = 134217984;
      *(_QWORD *)&v38[4] = var0;
      _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx for balance item", v38, 0xCu);
    }

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected tag 0x%llx for balance item"), a3->var0);
    v21 = (void *)v20;
    if (a4)
    {
      v22 = *a4;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v42[0] = *MEMORY[0x1E0CB2D50];
        v42[1] = v24;
        v43[0] = v20;
        v43[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v43;
        v27 = v42;
        v28 = 2;
      }
      else
      {
        v44 = *MEMORY[0x1E0CB2D50];
        v45[0] = v20;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v45;
        v27 = &v44;
        v28 = 1;
      }
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

+ (id)parseIdentifierCollection:(id *)a3 withError:(id *)a4
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint8_t v22[8];
  _QWORD v23[5];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a3->var1)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__HerculesDecoder_parseIdentifierCollection_withError___block_invoke;
    v23[3] = &unk_1E7D8A298;
    v23[4] = buf;
    if (DERDecodeSequenceWithBlock((unsigned __int8 **)a3, (uint64_t)v23))
    {
      ATLLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_ERROR, "Failed to parse identifier item", v22, 2u);
      }

      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to parse identifier item"));
      v8 = (void *)v7;
      if (a4)
      {
        v9 = *a4;
        v10 = (void *)MEMORY[0x1E0CB35C8];
        if (*a4)
        {
          v11 = *MEMORY[0x1E0CB3388];
          v30[0] = *MEMORY[0x1E0CB2D50];
          v30[1] = v11;
          v31[0] = v7;
          v31[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        }
        else
        {
          v32 = *MEMORY[0x1E0CB2D50];
          v33 = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
    }
    else
    {
      v19 = *((id *)v25 + 5);
    }
    _Block_object_dispose(buf, 8);

    return v19;
  }
  else
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "Missing or zero length identifier collection", buf, 2u);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing or zero length identifier collection"));
    v15 = (void *)v14;
    if (a4)
    {
      v16 = *a4;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v18 = *MEMORY[0x1E0CB3388];
        v34[0] = *MEMORY[0x1E0CB2D50];
        v34[1] = v18;
        v35[0] = v14;
        v35[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      }
      else
      {
        v36 = *MEMORY[0x1E0CB2D50];
        v37[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

uint64_t __55__HerculesDecoder_parseIdentifierCollection_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  +[HerculesDecoder parseIdentifierItem:withError:](HerculesDecoder, "parseIdentifierItem:withError:", a2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v6 = 3;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v6 = 0;
  }

  return v6;
}

+ (id)parseIdentifierItem:(id *)a3 withError:(id *)a4
{
  uint64_t v6;
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
  NSObject *v18;
  unint64_t var0;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  id *v29;
  const __CFString *v30;
  void *v31;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  int v40;
  uint8_t v41[16];
  _OWORD v42[5];
  __int128 v43;
  _OWORD v44[2];
  __int128 v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  if (a3->var0 == 0xE000000000000006)
  {
    v45 = 0u;
    v43 = 0u;
    memset(v44, 0, sizeof(v44));
    *(_OWORD *)v41 = 0u;
    memset(v42, 0, sizeof(v42));
    v6 = DERParseSequenceSpec((uint64_t)&a3->var1, (uint64_t)&IdItemContentSpec, (char *)v41, 0xA0uLL);
    if ((_DWORD)v6)
    {
      v7 = v6;
      ATLLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v40 = v7;
        _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Failed to decode id item contents %d", buf, 8u);
      }

      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode id item contents %d"), v7);
      v10 = (void *)v9;
      if (a4)
      {
        v11 = *a4;
        v12 = (void *)MEMORY[0x1E0CB35C8];
        if (*a4)
        {
          v13 = *MEMORY[0x1E0CB3388];
          v35[0] = *MEMORY[0x1E0CB2D50];
          v35[1] = v13;
          v36[0] = v9;
          v36[1] = v11;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = v36;
          v16 = v35;
          v17 = 2;
        }
        else
        {
          v37 = *MEMORY[0x1E0CB2D50];
          v38 = v9;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = &v38;
          v16 = &v37;
          v17 = 1;
        }
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v33);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        a4 = 0;
      }
    }
    else
    {
      +[HerculesDecoder getIdentifier:withInstanceIdentifier:](HerculesDecoder, "getIdentifier:withInstanceIdentifier:", v41, v42);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_QWORD *)&v44[0] + 1))
      {
        +[HerculesDecoder addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:](HerculesDecoder, "addAmount:withCurrency:usingAmountKey:usingCurrencyKey:usingExponentKey:", v44, &v43, CFSTR("Amount"), CFSTR("AmountCurrency"), CFSTR("AmountCurrencyExponent"));
        v29 = (id *)objc_claimAutoreleasedReturnValue();
        a4 = v29;
        v30 = CFSTR("AmountIdentifier");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        a4 = (id *)objc_claimAutoreleasedReturnValue();
        if (*((_QWORD *)&v45 + 1))
        {
          +[HerculesDecoder parseDateAndTime:](HerculesDecoder, "parseDateAndTime:", &v45);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a4, "setObject:forKeyedSubscript:", v34, CFSTR("CommutePlanExpirationDate"));

        }
        v30 = CFSTR("CommutePlanIdentifier");
        v29 = a4;
      }
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v10, v30);
    }

    return a4;
  }
  else
  {
    ATLLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      var0 = a3->var0;
      *(_DWORD *)v41 = 134217984;
      *(_QWORD *)&v41[4] = var0;
      _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx for identifier item", v41, 0xCu);
    }

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected tag 0x%llx for identifier item"), a3->var0);
    v21 = (void *)v20;
    if (a4)
    {
      v22 = *a4;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v46[0] = *MEMORY[0x1E0CB2D50];
        v46[1] = v24;
        v47[0] = v20;
        v47[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v47;
        v27 = v46;
        v28 = 2;
      }
      else
      {
        v48 = *MEMORY[0x1E0CB2D50];
        v49[0] = v20;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v49;
        v27 = &v48;
        v28 = 1;
      }
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

+ (id)getIdentifier:(id *)a3 withInstanceIdentifier:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4->var1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asHexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asHexString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asHexString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)parseDateAndTime:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (void *)MEMORY[0x1E0C99D78];
  v5 = DecodeBCD((const unsigned __int8 *)a3->var0, 1) + 2000;
  v6 = DecodeBCD((const unsigned __int8 *)a3->var0 + 1, 1);
  v7 = DecodeBCD((const unsigned __int8 *)a3->var0 + 2, 1);
  v8 = DecodeBCD((const unsigned __int8 *)a3->var0 + 3, 1);
  v9 = DecodeBCD((const unsigned __int8 *)a3->var0 + 4, 1);
  return (id)objc_msgSend(v4, "dateWithYear:month:day:hour:minute:second:", v5, v6, v7, v8, v9, DecodeBCD((const unsigned __int8 *)a3->var0 + 5, 1));
}

+ (id)addAmount:(id *)a3 withCurrency:(id *)a4 usingAmountKey:(id)a5 usingCurrencyKey:(id)a6 usingExponentKey:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  int S32BE;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int16 v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  if (a3->var1)
  {
    v24 = 0;
    if (a4->var1
      && (+[ATLCurrency currencyCodeForNumber:exponentOut:](ATLCurrency, "currencyCodeForNumber:exponentOut:", DecodeBCD((const DERItem *)a4), &v24), (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = (__CFString *)v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("XXX");
      v16 = &unk_1E7D9A890;
    }
    S32BE = ReadS32BE((const DERItem *)a3);
    if (S32BE >= 0)
      v18 = S32BE;
    else
      v18 = -S32BE;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v18, (__int16)-v24, S32BE >> 31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0C99E08];
    v25[0] = v11;
    v25[1] = v12;
    v26[0] = v19;
    v26[1] = v15;
    v25[2] = v13;
    v26[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryWithDictionary:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)calculateTransactionSN:(id *)a3 withDeviceId:(id *)a4 withDeviceSN:(id *)a5
{
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;

  +[HashHelper hashHelper]();
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addData:withLength:](v8, a3->var0, a3->var1);
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addData:withLength:](v9, a4->var0, a4->var1);
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addData:withLength:](v10, a5->var0, a5->var1);
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper getHash](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "u32BE:", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint8_t v21[8];
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "MIFARE Hercules Decoder doesn't support getServiceProviderData", v21, 2u);
  }

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MIFARE Hercules Decoder doesn't support getServiceProviderData"));
  v11 = (void *)v10;
  if (a9)
  {
    v12 = *a9;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    if (*a9)
    {
      v14 = *MEMORY[0x1E0CB3388];
      v22[0] = *MEMORY[0x1E0CB2D50];
      v22[1] = v14;
      v23[0] = v10;
      v23[1] = v12;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v23;
      v17 = v22;
      v18 = 2;
    }
    else
    {
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = v10;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v25;
      v17 = &v24;
      v18 = 1;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v19);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint8_t v20[8];
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "MIFARE Hercules Decoder doesn't support getServiceProviderData", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MIFARE Hercules Decoder doesn't support getServiceProviderData"));
  v10 = (void *)v9;
  if (a7)
  {
    v11 = *a7;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
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
      v24[0] = v9;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v24;
      v16 = &v23;
      v17 = 1;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
