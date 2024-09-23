@implementation IDHistoryDecoder

+ (id)getTransactionDate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v3, "decodeBCDAtOffset:length:", 13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeBCDAtOffset:length:", 14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeBCDAtOffset:length:", 15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDay:", (int)objc_msgSend(v5, "intValue"));
    objc_msgSend(v4, "setMonth:", (int)objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "setYear:", (int)(objc_msgSend(v7, "intValue") + 2000));

  }
  else
  {
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction date for ID, invalid block: %@", (uint8_t *)&v10, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

+ (id)getTransactionAmount:(id)a3
{
  id v3;
  _BYTE *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    LOBYTE(v8) = v4[11];
    BYTE1(v8) = v4[10];
    BYTE2(v8) = v4[9];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", DecodeBCD((const unsigned __int8 *)&v8, 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction amount for ID, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (unsigned)getTypeOfUse:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  unsigned __int16 v6;
  NSObject *v7;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = *(unsigned __int8 *)(v4 + 3);
    if (v5 == 32)
    {
      v6 = 18944;
    }
    else if (v5 == 16)
    {
      v6 = -4096;
    }
    else
    {
      NSLog(CFSTR("unknown iD Type of Use: %ud, skipping conversion"), *(unsigned __int8 *)(v4 + 3));
      v6 = (_WORD)v5 << 8;
    }
  }
  else
  {
    ATLLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction type of use for ID, invalid block: %@", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (unsigned)getHistoryNumber:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned __int16 v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = *(unsigned __int8 *)(v4 + 2) | (*(unsigned __int8 *)(v4 + 13) << 8);
  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the history number for ID, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)getDPAN:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  void *v6;
  uint64_t i;
  char v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = (char *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = malloc_type_calloc(1uLL, 0x10uLL, 0x65AF33C5uLL);
    v6 = v5;
    for (i = 15; i != -1; --i)
    {
      v8 = *v4++;
      *((_BYTE *)v5 + i) = v8;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else
  {
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get the DPAN for ID, invalid block: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

+ (id)parseIDHistoryBlocks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v7))
    {
      objc_msgSend(a1, "getTransactionDate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "getTransactionAmount:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(a1, "getHistoryNumber:", v7);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("NFTransactionDate"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("NFAmount"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7D9A8A8, CFSTR("NFAmountType"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7D9A8C0, CFSTR("NFSectorCombination"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("NFHistorySequenceNumber"));

      v12 = v6;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("the array of block does not contain block entry"));
    v12 = 0;
  }

  return v12;
}

+ (id)getExpirationDate:(id)a3
{
  id v3;
  uint8x8_t v4;
  int16x8_t v5;
  void *v6;
  NSObject *v7;
  unsigned __int32 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4.i32[0] = *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 12);
    v5 = (int16x8_t)vmovl_u8(v4);
    *(int16x4_t *)v5.i8 = vrev64_s16(*(int16x4_t *)v5.i8);
    v9 = vmovn_s16(v5).u32[0];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the expiration date for ID, invalid block: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)generateEndEventFromHCI:(id)a3 withTransceiver:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  _BYTE *v35;
  void *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  unsigned int v50;
  unsigned __int8 v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  id v62;
  id v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  unsigned __int8 md[4];
  uint64_t v76;
  __int128 data;
  __int16 v78;
  int v79;
  void *v80;
  _BYTE v81[128];
  __int128 v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &unk_1E7D9A8A8, CFSTR("NFServiceProviderID"));
      FelicaGetDataFileSystemCommand(16587, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v7, "transceiveAndCheckSW:error:", v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v11;
          FeliCaGetBlockDataFromGetDataCommand(v11);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            ATLLogObject();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)md = 138412290;
              v76 = 0;
              _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_DEFAULT, "ID block is unexpected (Sercice 40CB block 1): %@", md, 0xCu);
            }
            v39 = 0;
            goto LABEL_73;
          }
          v64 = v12;
          v65 = v10;
          v66 = v13;
          v67 = v7;
          v62 = a1;
          objc_msgSend(a1, "getDPAN:");
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v82 = *(_OWORD *)objc_msgSend(v14, "bytes");
          objc_msgSend(v14, "asHexString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v8;
          -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, CFSTR("NFDPAN"));

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v70 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v63 = v6;
          v16 = v6;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v72 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("EventType"));
                v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

                if (v22 == CFSTR("TransactionEvent"))
                {
                  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("parsedInfo"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("OPWrite"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("OPRead"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v24, "count"))
                    -[NSObject addObject:](v70, "addObject:", v24);
                  if (objc_msgSend(v25, "count"))
                    objc_msgSend(v69, "addObject:", v25);

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
            }
            while (v18);
          }

          v26 = v70;
          v27 = -[NSObject count](v70, "count");
          if (!v27)
          {
            FelicaGetDataFileSystemCommand(16587, 2);
            v10 = objc_claimAutoreleasedReturnValue();

            v7 = v67;
            v8 = v68;
            v41 = v66;
            if (v10)
            {
              objc_msgSend(v67, "transceiveAndCheckSW:error:", v10, 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v63;
              if (v12)
              {
                FeliCaGetBlockDataFromGetDataCommand(v12);
                v42 = objc_claimAutoreleasedReturnValue();

                if (!v42)
                {
LABEL_72:
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27 == 0);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v60, CFSTR("readOnly"));

                  v39 = v8;
LABEL_73:

                  goto LABEL_74;
                }
                objc_msgSend(v62, "getExpirationDate:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                data = v82;
                v78 = 0;
                v44 = objc_retainAutorelease(v43);
                v79 = *(_DWORD *)objc_msgSend(v44, "bytes");
                CC_SHA256(&data, 0x16u, md);
                objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", md, 16);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "asHexString");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v46, CFSTR("NFTransactionID"));

                v7 = v67;
                v26 = v70;

                v27 = 0;
                v41 = v42;
LABEL_71:

                goto LABEL_72;
              }
            }
            else
            {
              ATLLogObject();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)md = 138412290;
                v76 = 0;
                _os_log_impl(&dword_1C3511000, v58, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
              }

              v6 = v63;
            }
            ATLLogObject();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)md = 138412290;
              v76 = 0;
              _os_log_impl(&dword_1C3511000, v59, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
            }

            v12 = 0;
            goto LABEL_71;
          }
          FelicaGetDataFileSystemCommand(16527, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v67;
          if (v28)
          {
            objc_msgSend(v67, "transceiveAndCheckSW:error:", v28, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              FeliCaGetBlockDataFromGetDataCommand(v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
              {
                v31 = v27;
                v80 = v30;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                +[IDHistoryDecoder parseIDHistoryBlocks:](IDHistoryDecoder, "parseIDHistoryBlocks:", v32);
                v33 = objc_claimAutoreleasedReturnValue();

                -[NSObject addEntriesFromDictionary:](v68, "addEntriesFromDictionary:", v33);
                v34 = objc_retainAutorelease(v30);
                v35 = (_BYTE *)objc_msgSend(v34, "bytes");
                data = v82;
                LOBYTE(v78) = v35[11];
                HIBYTE(v78) = v35[10];
                LOBYTE(v79) = v35[9];
                BYTE1(v79) = v35[15];
                BYTE2(v79) = v35[14];
                HIBYTE(v79) = v35[13];
                CC_SHA256(&data, 0x16u, md);
                objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", md, 16);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "asHexString");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v70;
                -[NSObject setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v37, CFSTR("NFTransactionID"));

                v27 = v31;
                v6 = v63;
                goto LABEL_53;
              }
LABEL_50:
              v6 = v63;
              ATLLogObject();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)md = 138412290;
                v76 = 0;
                _os_log_impl(&dword_1C3511000, v33, OS_LOG_TYPE_DEFAULT, "ID block is unexpected (Sercice 408F block 0): %@", md, 0xCu);
              }
              v34 = 0;
LABEL_53:

              FelicaGetDataFileSystemCommand(16524, 0);
              v10 = objc_claimAutoreleasedReturnValue();

              if (v10)
              {
                objc_msgSend(v67, "transceiveAndCheckSW:error:", v10, 0);
                v12 = (void *)objc_claimAutoreleasedReturnValue();

                if (v12)
                {
                  FeliCaGetBlockDataFromGetDataCommand(v12);
                  v49 = objc_claimAutoreleasedReturnValue();

                  if (v49)
                  {
                    v41 = v49;
                    v50 = objc_msgSend(v62, "getTypeOfUse:", v49);
                    v51 = v50;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v50 >> 8);
                    v52 = v10;
                    v53 = v27;
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v8 = v68;
                    -[NSObject setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v54, CFSTR("NFTransactionType"));

                    v27 = v53;
                    v10 = v52;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v51);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v55, CFSTR("NFSectorCombination"));

                    goto LABEL_71;
                  }
LABEL_63:
                  v8 = v68;
                  ATLLogObject();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)md = 138412290;
                    v76 = 0;
                    _os_log_impl(&dword_1C3511000, v41, OS_LOG_TYPE_DEFAULT, "ID block is unexpected (Sercice 408C block 0): %@", md, 0xCu);
                  }
                  goto LABEL_71;
                }
              }
              else
              {
                ATLLogObject();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)md = 138412290;
                  v76 = 0;
                  _os_log_impl(&dword_1C3511000, v56, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
                }

              }
              ATLLogObject();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)md = 138412290;
                v76 = 0;
                _os_log_impl(&dword_1C3511000, v57, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
              }

              v12 = 0;
              goto LABEL_63;
            }
          }
          else
          {
            ATLLogObject();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)md = 138412290;
              v76 = 0;
              _os_log_impl(&dword_1C3511000, v47, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
            }

          }
          ATLLogObject();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            v76 = 0;
            _os_log_impl(&dword_1C3511000, v48, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
          }

          v29 = 0;
          goto LABEL_50;
        }
        ATLLogObject();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)md = 138412290;
          v76 = 0;
          _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
        }

      }
      else
      {
        ATLLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)md = 138412290;
          v76 = 0;
          _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
        }
      }
      v39 = 0;
LABEL_74:

      goto LABEL_75;
    }
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v38 = "HCI Array provided does not contain HCI events";
LABEL_29:
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, v38, md, 2u);
    }
  }
  else
  {
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v38 = "No transceiver provided";
      goto LABEL_29;
    }
  }
  v39 = 0;
LABEL_75:

  return v39;
}

@end
