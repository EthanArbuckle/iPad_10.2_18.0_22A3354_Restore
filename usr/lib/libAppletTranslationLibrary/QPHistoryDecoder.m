@implementation QPHistoryDecoder

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
    objc_msgSend(v3, "decodeBCDAtOffset:length:", 0, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeBCDAtOffset:length:", 2, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeBCDAtOffset:length:", 3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDay:", (int)objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "setMonth:", (int)objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "setYear:", (int)objc_msgSend(v5, "intValue"));

  }
  else
  {
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction date for QuicPay, invalid block: %@", (uint8_t *)&v10, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

+ (id)getTransactionAmount:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v4[13] << 16) | (v4[14] << 8) | v4[15]);
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
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction amount for QuicPay, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (unsigned)getTypeOfUse:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  unsigned __int16 v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    v4 = *(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 4) >> 4;
    switch(v4)
    {
      case 1:
        LOWORD(v4) = 241;
        break;
      case 2:
        LOWORD(v4) = 240;
        break;
      case 4:
        LOWORD(v4) = 74;
        break;
    }
    v6 = (_WORD)v4 << 8;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get the type of use for QuicPay, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (unsigned)getHistoryNumber:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 11)) >> 16;
  }
  else
  {
    ATLLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the hisotry number for QuicPay, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

+ (id)getDPAN:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 0, 10);
}

+ (id)parseQuickPayHistoryBlocks:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v7))
    {
      objc_msgSend(a1, "getTransactionDate:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "getTransactionAmount:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(a1, "getTypeOfUse:", v7);
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, CFSTR("NFTransactionDate"));
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("NFAmount"));
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &unk_1E7D9B238, CFSTR("NFAmountType"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10 >> 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, CFSTR("NFTransactionType"));

      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &unk_1E7D9B250, CFSTR("NFSectorCombination"));
      v12 = objc_msgSend(a1, "getHistoryNumber:", v7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, CFSTR("NFHistorySequenceNumber"));

      v14 = v6;
    }
    else
    {
      ATLLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, "the array contains an empty block", v16, 2u);
      }
      v14 = 0;
    }

  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "the array of block does not contain block entry", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
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
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  char v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  __int16 v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  unsigned __int8 md[16];
  __int128 v71;
  uint64_t data;
  __int16 v73;
  char v74;
  int v75;
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &unk_1E7D9B268, CFSTR("NFServiceProviderID"));
      FelicaGetDataFileSystemCommand(13771, 4);
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
          if (v13)
          {
            v14 = (void *)v13;
            v62 = v10;
            v60 = v12;
            objc_msgSend(a1, "getDPAN:", v13);
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v57 = *(_QWORD *)(objc_msgSend(v15, "bytes") + 2);
            objc_msgSend(v15, "asHexString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v8;
            -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, CFSTR("NFDPAN"));

            v58 = a1;
            v61 = v14;
            v56 = objc_msgSend(a1, "getExpirationDate:", v14);

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v59 = v6;
            v17 = v6;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v67;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v67 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("EventType"));
                  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (v23 == CFSTR("TransactionEvent"))
                  {
                    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("parsedInfo"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("OPWrite"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("OPRead"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v25, "count"))
                      objc_msgSend(v65, "addObject:", v25);
                    if (objc_msgSend(v26, "count"))
                      objc_msgSend(v64, "addObject:", v26);

                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
              }
              while (v19);
            }

            v27 = objc_msgSend(v65, "count");
            if (v27)
            {
              FelicaGetDataFileSystemCommand(13839, 0);
              v10 = objc_claimAutoreleasedReturnValue();

              if (v10)
              {
                objc_msgSend(v7, "transceiveAndCheckSW:error:", v10, 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                v8 = v63;
                if (v28)
                {
                  FeliCaGetBlockDataFromGetDataCommand(v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v29)
                  {
                    v30 = objc_retainAutorelease(v29);
                    v31 = objc_msgSend(v30, "bytes");
                    v32 = *(_WORD *)(v31 + 13);
                    v33 = v27;
                    v34 = *(_BYTE *)(v31 + 15);
                    v35 = *(_DWORD *)v31;
                    v76 = v30;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    +[QPHistoryDecoder parseQuickPayHistoryBlocks:](QPHistoryDecoder, "parseQuickPayHistoryBlocks:", v36);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    -[NSObject addEntriesFromDictionary:](v63, "addEntriesFromDictionary:", v37);
                    data = v57;
                    v73 = v32;
                    v74 = v34;
                    v75 = v35;
                    v8 = v63;
                    CC_SHA256(&data, 0xFu, md);
                    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", md, 32);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "asHexString");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v39, CFSTR("NFTransactionID"));

                    v40 = objc_msgSend(v58, "getTypeOfUse:", v30);
                    LOBYTE(v39) = v40;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v40 >> 8);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v41, CFSTR("NFTransactionType"));

                    v27 = v33;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v39);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v42, CFSTR("NFSectorCombination"));

LABEL_44:
                    v6 = v59;
LABEL_63:
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27 == 0);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v54, CFSTR("readOnly"));

                    v44 = v8;
                    goto LABEL_64;
                  }
LABEL_51:
                  v6 = v59;
                  ATLLogObject();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)md = 138412290;
                    *(_QWORD *)&md[4] = 0;
                    v51 = "QP block is unexpected (Sercice 360F block 0): %@";
LABEL_61:
                    _os_log_impl(&dword_1C3511000, v50, OS_LOG_TYPE_DEFAULT, v51, md, 0xCu);
                    goto LABEL_62;
                  }
                  goto LABEL_62;
                }
              }
              else
              {
                ATLLogObject();
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)md = 138412290;
                  *(_QWORD *)&md[4] = 0;
                  _os_log_impl(&dword_1C3511000, v48, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
                }

                v8 = v63;
              }
              ATLLogObject();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)md = 138412290;
                *(_QWORD *)&md[4] = 0;
                _os_log_impl(&dword_1C3511000, v49, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
              }

              v28 = 0;
              goto LABEL_51;
            }
            FelicaGetDataFileSystemCommand(13771, 6);
            v10 = objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              objc_msgSend(v7, "transceiveAndCheckSW:error:", v10, 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                FeliCaGetBlockDataFromGetDataCommand(v28);
                v30 = (id)objc_claimAutoreleasedReturnValue();

                if (v30)
                {
                  data = v57;
                  v47 = objc_msgSend(v58, "getATC:", v30);
                  LOBYTE(v73) = HIBYTE(v47);
                  HIBYTE(v73) = v47;
                  v74 = HIBYTE(v56);
                  LOBYTE(v75) = v56;
                  *(_OWORD *)md = 0u;
                  v71 = 0u;
                  CC_SHA256(&data, 0xCu, md);
                  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", md, 32);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "asHexString");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v8 = v63;
                  -[NSObject setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v38, CFSTR("NFTransactionID"));
                  goto LABEL_44;
                }
LABEL_59:
                v6 = v59;
                v8 = v63;
                ATLLogObject();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)md = 138412290;
                  *(_QWORD *)&md[4] = 0;
                  v51 = "QP block is unexpected (Sercice 408C block 0): %@";
                  goto LABEL_61;
                }
LABEL_62:

                v30 = 0;
                goto LABEL_63;
              }
            }
            else
            {
              ATLLogObject();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)md = 138412290;
                *(_QWORD *)&md[4] = 0;
                _os_log_impl(&dword_1C3511000, v52, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
              }

            }
            ATLLogObject();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)md = 138412290;
              *(_QWORD *)&md[4] = 0;
              _os_log_impl(&dword_1C3511000, v53, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
            }

            v28 = 0;
            goto LABEL_59;
          }
          ATLLogObject();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            *(_QWORD *)&md[4] = 0;
            _os_log_impl(&dword_1C3511000, v46, OS_LOG_TYPE_DEFAULT, "QP block is unexpected (Sercice 35CB block 4): %@", md, 0xCu);
          }

        }
        else
        {
          ATLLogObject();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            *(_QWORD *)&md[4] = 0;
            _os_log_impl(&dword_1C3511000, v45, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
          }

        }
      }
      else
      {
        ATLLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)md = 138412290;
          *(_QWORD *)&md[4] = 0;
          _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
        }
      }
      v44 = 0;
LABEL_64:

      goto LABEL_65;
    }
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v43 = "HCI Array provided does not contain HCI events";
LABEL_29:
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, v43, md, 2u);
    }
  }
  else
  {
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v43 = "No transceiver provided";
      goto LABEL_29;
    }
  }
  v44 = 0;
LABEL_65:

  return v44;
}

+ (unsigned)getATC:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 4)) >> 16;
  }
  else
  {
    ATLLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the ATC for QuicPay, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

+ (unsigned)getExpirationDate:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:](SlalomUtils, "isValidFelicaBlock:", v3))
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 13)) >> 16;
  }
  else
  {
    ATLLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the expiration date for QuicPay, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

@end
