@implementation MercuryDecoder

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  int v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!objc_msgSend(v11, "length"))
  {
    ATLLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_ERROR, "Empty eventData?", buf, 2u);
    }

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Empty eventData?"));
    v19 = (void *)v18;
    if (!a8)
      goto LABEL_24;
    v20 = *a8;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v22 = *MEMORY[0x1E0CB3388];
      v47[0] = *MEMORY[0x1E0CB2D50];
      v47[1] = v22;
      v48[0] = v18;
      v48[1] = v20;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v48;
      v25 = v47;
      v26 = 2;
    }
    else
    {
      v49 = *MEMORY[0x1E0CB2D50];
      v50[0] = v18;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v50;
      v25 = &v49;
      v26 = 1;
    }
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v21;
    v39 = 6;
    goto LABEL_23;
  }
  v14 = objc_retainAutorelease(v11);
  v15 = *(unsigned __int8 *)objc_msgSend(v14, "bytes");
  if ((_DWORD)v15 == 16)
  {
    +[MercuryDecoder parseActivityTimeout:withApplet:error:](MercuryDecoder, "parseActivityTimeout:withApplet:error:", v14, v12, a8);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ((_DWORD)v15 == 2)
  {
    +[MercuryDecoder parseEndEvent:withApplet:moduleAID:error:](MercuryDecoder, "parseEndEvent:withApplet:moduleAID:error:", v14, v12, v13, a8);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ((_DWORD)v15 != 1)
  {
    ATLLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v46 = v15;
      _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x", buf, 8u);
    }

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid event type 0x%x"), v15);
    v19 = (void *)v29;
    if (!a8)
      goto LABEL_24;
    v30 = *a8;
    v31 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v32 = *MEMORY[0x1E0CB3388];
      v41[0] = *MEMORY[0x1E0CB2D50];
      v41[1] = v32;
      v42[0] = v29;
      v42[1] = v30;
      v33 = (void *)MEMORY[0x1E0C99D80];
      v34 = v42;
      v35 = v41;
      v36 = 2;
    }
    else
    {
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = v29;
      v33 = (void *)MEMORY[0x1E0C99D80];
      v34 = &v44;
      v35 = &v43;
      v36 = 1;
    }
    objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v31;
    v39 = 3;
LABEL_23:
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v39, v37);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
    v27 = 0;
    goto LABEL_25;
  }
  +[MercuryDecoder parseStartEvent:withApplet:error:](MercuryDecoder, "parseStartEvent:withApplet:error:", v14, v12, a8);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v27 = (void *)v16;
LABEL_25:

  return v27;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  unsigned __int8 v44;
  int v45;
  char v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  uint8_t buf[4];
  id v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SelectByNameCmd(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "transceiveAndCheckSW:error:", v13, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &getAppletStateAndHistory_withApplet_withPackage_withModule_withError__getE1Cmd, 5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transceiveAndCheckSW:error:", v15, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v47[0] = objc_msgSend(v16, "bytes");
      v47[1] = objc_msgSend(v17, "length");
      +[MercuryDecoder DecodeE1TLV:transactionInfo:error:](MercuryDecoder, "DecodeE1TLV:transactionInfo:error:", v47, 0, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v39 = v14;
        v40 = v17;
        v41 = v15;
        v42 = v13;
        v43 = v11;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        v45 = 52352;
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v45, 5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 1;
        v38 = 138412290;
        do
        {
          objc_msgSend(v20, "replaceBytesInRange:withBytes:length:", 3, 1, &v44, 1, v38);
          objc_msgSend(v10, "transceiveAndCheckSW:error:", v20, a7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v31 = 0;
            goto LABEL_30;
          }
          v22 = v21;
          if (objc_msgSend(v21, "length"))
          {
            v52 = 0uLL;
            *(_QWORD *)&v52 = objc_msgSend(v22, "bytes");
            *((_QWORD *)&v52 + 1) = objc_msgSend(v22, "length");
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CardCurrencyExponent"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[MercuryDecoder DecodeE456TLV:currencyExponent:error:](MercuryDecoder, "DecodeE456TLV:currencyExponent:error:", &v52, v23, a7);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v19, "addObject:", v24);
            }
            else
            {
              v25 = objc_msgSend(v22, "bytes");
              v26 = objc_msgSend(v22, "length");
              LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[MercuryDecoder getAppletStateAndHistory:withApplet:withPackage:withModule:withError:]", 127, v25, v26, CFSTR("Skipping invalid transaction info:"), v27, v28, v38);
              if (a7 && *a7)
              {
                ATLLogObject();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  v30 = *a7;
                  *(_DWORD *)buf = v38;
                  v51 = v30;
                  _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_ERROR, "Swallowing txn error %@", buf, 0xCu);
                }

                *a7 = 0;
              }
            }

          }
          ++v44;
        }
        while (v44 <= 0xAu);
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[MercuryDecoder RemoveMatchedTapIns:transactionsInProgress:](MercuryDecoder, "RemoveMatchedTapIns:transactionsInProgress:", v19, v32);

        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SPRaw"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "unsignedIntegerValue");

        if (v34 == 16)
          +[MercuryDecoder ApplyHackFor50863616:historyRecords:transceiver:](MercuryDecoder, "ApplyHackFor50863616:historyRecords:transceiver:", v18, v19, v10);
        if (+[AppletTranslator isInternalBuild]())
        {
          +[AppletConfigurationData extraDebugScriptForModule:](AppletConfigurationData, "extraDebugScriptForModule:", v43);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            objc_msgSend(v10, "applyScript:ignoreSW:error:", v35, 1, 0);
          ATLLogObject();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v52) = v38;
            *(_QWORD *)((char *)&v52 + 4) = v35;
            _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_DEFAULT, "Script executed: %@", (uint8_t *)&v52, 0xCu);
          }

        }
        v48[0] = CFSTR("State");
        v48[1] = CFSTR("TransactionHistory");
        v49[0] = v18;
        v49[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

        v13 = v42;
        v11 = v43;
        v17 = v40;
        v15 = v41;
        v14 = v39;
      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[9];
  _QWORD v30[9];
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 9)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    if (*(_BYTE *)(v9 + 1) == 2)
    {
      v29[0] = CFSTR("EventType");
      v29[1] = CFSTR("appletIdentifier");
      v30[0] = CFSTR("StartEvent");
      v30[1] = v8;
      v29[2] = CFSTR("Version");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v10;
      v29[3] = CFSTR("command");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)(v9 + 5)));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v11;
      v29[4] = CFSTR("selectStatus");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[5] = CFSTR("IgnoreRFEvents");
      v29[6] = CFSTR("DontWaitForEOT");
      v30[4] = v12;
      v30[5] = MEMORY[0x1E0C9AAB0];
      v30[6] = MEMORY[0x1E0C9AAB0];
      v30[7] = MEMORY[0x1E0C9AAB0];
      v29[7] = CFSTR("RequiresPowerCycle");
      v29[8] = CFSTR("DelayExpressReentry");
      v30[8] = &unk_1E7D9ABC0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
      goto LABEL_21;
    }
    ATLLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(unsigned __int8 *)(v9 + 1);
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v23;
      _os_log_impl(&dword_1C3511000, v22, OS_LOG_TYPE_ERROR, "Start event version %u", buf, 8u);
    }

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start event version %u"), *(unsigned __int8 *)(v9 + 1));
    v10 = (void *)v24;
    if (a5)
    {
      v25 = *a5;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v26 = *MEMORY[0x1E0CB3388];
        v31[0] = *MEMORY[0x1E0CB2D50];
        v31[1] = v26;
        v32[0] = v24;
        v32[1] = v25;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v32;
        v21 = v31;
        goto LABEL_14;
      }
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = v24;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v34;
      v21 = &v33;
      goto LABEL_18;
    }
  }
  else
  {
    ATLLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v40 = objc_msgSend(v7, "length");
      v41 = 2048;
      v42 = 9;
      _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start event length %zu (exp) %zu"), objc_msgSend(v7, "length"), 9);
    v10 = (void *)v15;
    if (a5)
    {
      v16 = *a5;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v18 = *MEMORY[0x1E0CB3388];
        v35[0] = *MEMORY[0x1E0CB2D50];
        v35[1] = v18;
        v36[0] = v15;
        v36[1] = v16;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v36;
        v21 = v35;
LABEL_14:
        v27 = 2;
LABEL_19:
        objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v11);
        v13 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      v37 = *MEMORY[0x1E0CB2D50];
      v38 = v15;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v38;
      v21 = &v37;
LABEL_18:
      v27 = 1;
      goto LABEL_19;
    }
  }
  v13 = 0;
LABEL_21:

  return v13;
}

+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 moduleAID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  __int16 v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  int v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[12];
  _QWORD v68[12];
  __int128 buf;
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];
  _QWORD v75[2];
  uint64_t v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((unint64_t)objc_msgSend(v10, "length") <= 0x2C)
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v10, "length");
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu"), objc_msgSend(v10, "length"));
    v15 = (void *)v14;
    if (!a6)
      goto LABEL_37;
    v16 = *a6;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v74[0] = *MEMORY[0x1E0CB2D50];
      v74[1] = v18;
      v75[0] = v14;
      v75[1] = v16;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v75;
      v21 = v74;
LABEL_30:
      v54 = 2;
LABEL_36:
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v55);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
      v44 = 0;
      goto LABEL_38;
    }
    v76 = *MEMORY[0x1E0CB2D50];
    v77[0] = v14;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v77;
    v21 = &v76;
    goto LABEL_35;
  }
  v22 = objc_retainAutorelease(v10);
  v23 = objc_msgSend(v22, "bytes");
  v24 = v23;
  if (*(_BYTE *)(v23 + 1) != 2)
  {
    ATLLogObject();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = *(unsigned __int8 *)(v24 + 1);
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v50;
      _os_log_impl(&dword_1C3511000, v49, OS_LOG_TYPE_ERROR, "End event version %u", (uint8_t *)&buf, 8u);
    }

    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event version %u"), *(unsigned __int8 *)(v24 + 1));
    v15 = (void *)v51;
    if (!a6)
      goto LABEL_37;
    v52 = *a6;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v53 = *MEMORY[0x1E0CB3388];
      v70[0] = *MEMORY[0x1E0CB2D50];
      v70[1] = v53;
      v71[0] = v51;
      v71[1] = v52;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v71;
      v21 = v70;
      goto LABEL_30;
    }
    v72 = *MEMORY[0x1E0CB2D50];
    v73 = v51;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v73;
    v21 = &v72;
LABEL_35:
    v54 = 1;
    goto LABEL_36;
  }
  *(_QWORD *)&buf = v23 + 44;
  *((_QWORD *)&buf + 1) = objc_msgSend(v22, "length") - 44;
  v66 = 0;
  +[MercuryDecoder DecodeE1TLV:transactionInfo:error:](MercuryDecoder, "DecodeE1TLV:transactionInfo:error:", &buf, &v66, a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v66;
  if (v25)
  {
    v64 = v12;
    v65 = v11;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v25;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, CFSTR("State"));
    if (v26)
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("Transaction"));
    v62 = v27;
    v28 = bswap32(*(_DWORD *)(v24 + 4));
    v29 = bswap32(*(unsigned __int16 *)(v24 + 2)) >> 16;
    v30 = +[MercuryDecoder IsIncompatibleApplet:sw:](MercuryDecoder, "IsIncompatibleApplet:sw:", v28, v29);
    v31 = *(unsigned __int16 *)(v24 + 40);
    v32 = v26;
    if (v30)
      v33 = -4092;
    else
      v33 = 64;
    v34 = objc_msgSend(a1, "isSpecialBusErrorFor45299868:state:transaction:", v64, v63, v32);
    v59 = (void *)MEMORY[0x1E0C99E08];
    v67[0] = CFSTR("EventType");
    v67[1] = CFSTR("appletIdentifier");
    v68[0] = CFSTR("EndEvent");
    v68[1] = v65;
    v67[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v24 + 1));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v61;
    v67[3] = CFSTR("transactionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24 + 8, 32);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "asHexString");
    v35 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v35;
    if (v31 == 1)
      v33 = 0;
    v68[3] = v35;
    v67[4] = CFSTR("didError");
    v36 = v31 == 1 || v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36 | v34);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v68[4] = v57;
    v67[5] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v28);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v68[5] = v37;
    v67[6] = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v68[6] = v38;
    v67[7] = CFSTR("result");
    v39 = (unsigned __int16)v33 & 0xFFFC;
    v26 = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v68[7] = v40;
    v67[8] = CFSTR("informative");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v24 + 42)) >> 16);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68[8] = v41;
    v68[9] = &unk_1E7D9ABD8;
    v67[9] = CFSTR("type");
    v67[10] = CFSTR("tlv");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &buf);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v67[11] = CFSTR("parsedInfo");
    v68[10] = v42;
    v68[11] = v62;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 12);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dictionaryWithDictionary:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Amount"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Amount"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v46, CFSTR("amount"));

      }
    }
    v25 = v63;
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("CardCurrency"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("CardCurrency"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v48, CFSTR("currency"));

    }
    v12 = v64;
    v11 = v65;
  }
  else
  {
    v44 = 0;
  }

LABEL_38:
  return v44;
}

+ (id)parseActivityTimeout:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
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
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  uint64_t *v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v40[2];
  _QWORD v41[2];
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  _QWORD v46[10];
  _QWORD v47[10];
  _QWORD v48[2];
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  _QWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[4];
  _BYTE v57[10];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") != 11)
  {
    ATLLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v57 = objc_msgSend(v7, "length");
      *(_WORD *)&v57[8] = 2048;
      v58 = 11;
      _os_log_impl(&dword_1C3511000, v23, OS_LOG_TYPE_ERROR, "Activity param length %zu (exp %zu)", buf, 0x16u);
    }

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Activity param length %zu (exp %zu)"), objc_msgSend(v7, "length"), 11);
    v25 = (void *)v24;
    if (!a5)
      goto LABEL_23;
    v26 = *a5;
    v27 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v28 = *MEMORY[0x1E0CB3388];
      v52[0] = *MEMORY[0x1E0CB2D50];
      v52[1] = v28;
      v53[0] = v24;
      v53[1] = v26;
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = v53;
      v31 = v52;
LABEL_17:
      v37 = 2;
LABEL_22:
      objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v38);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
      v22 = 0;
      goto LABEL_24;
    }
    v54 = *MEMORY[0x1E0CB2D50];
    v55 = v24;
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = &v55;
    v31 = &v54;
LABEL_21:
    v37 = 1;
    goto LABEL_22;
  }
  v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
  v10 = v9;
  if (*(_BYTE *)(v9 + 1) != 2)
  {
    ATLLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = *(unsigned __int8 *)(v10 + 1);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v57 = v33;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = 2;
      _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_ERROR, "Activity Timeout got vers %u exp %u", buf, 0xEu);
    }

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Activity Timeout got vers %u exp %u"), *(unsigned __int8 *)(v10 + 1), 2);
    v25 = (void *)v34;
    if (!a5)
      goto LABEL_23;
    v35 = *a5;
    v27 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v36 = *MEMORY[0x1E0CB3388];
      v48[0] = *MEMORY[0x1E0CB2D50];
      v48[1] = v36;
      v49[0] = v34;
      v49[1] = v35;
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = v49;
      v31 = v48;
      goto LABEL_17;
    }
    v50 = *MEMORY[0x1E0CB2D50];
    v51 = v34;
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = &v51;
    v31 = &v50;
    goto LABEL_21;
  }
  v11 = bswap32(*(_DWORD *)(v9 + 5));
  v12 = bswap32(*(unsigned __int16 *)(v9 + 3)) >> 16;
  v13 = +[MercuryDecoder IsIncompatibleApplet:sw:](MercuryDecoder, "IsIncompatibleApplet:sw:", v11, v12);
  ATLLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v57 = v11;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v12;
    LOWORD(v58) = 1024;
    *(_DWORD *)((char *)&v58 + 2) = v13;
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_DEFAULT, "Timeout! Last cmd 0x%x sw 0x%x incompatible %d", buf, 0x14u);
  }

  if (v13)
  {
    v46[0] = CFSTR("EventType");
    v46[1] = CFSTR("appletIdentifier");
    v47[0] = CFSTR("EndEvent");
    v47[1] = v8;
    v46[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v15;
    v47[3] = MEMORY[0x1E0C9AAB0];
    v46[3] = CFSTR("didError");
    v46[4] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v16;
    v46[5] = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v17;
    v46[6] = CFSTR("TimeOutValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(v10 + 9));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47[6] = v18;
    v47[7] = &unk_1E7D9ABF0;
    v46[7] = CFSTR("result");
    v46[8] = CFSTR("type");
    v47[8] = &unk_1E7D9ABD8;
    v46[9] = CFSTR("parsedInfo");
    v44 = CFSTR("State");
    v42 = CFSTR("SPRaw");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[9] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v40[0] = CFSTR("EventType");
    v40[1] = CFSTR("Result");
    v41[0] = CFSTR("ActivityTimeout");
    v41[1] = CFSTR("Success");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_24:

  return v22;
}

+ (id)DecodeE1TLV:(id *)a3 transactionInfo:(id *)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int S32BE;
  uint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void **v72;
  uint64_t *v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  void *v86;
  __int16 v87;
  uint64_t v88;
  $BE749665CD263385F3F5ED554982D87D v89;
  _QWORD v90[2];
  _QWORD v91[2];
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[2];
  _QWORD v95[2];
  uint64_t v96;
  void *v97;
  uint8_t v98[4];
  uint64_t v99;
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  uint64_t v104;
  uint64_t v105;
  __int128 buf;
  _QWORD v107[4];
  unsigned __int128 v108;
  unsigned __int128 v109;
  unsigned __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[2];
  _QWORD v116[2];
  uint64_t v117;
  _QWORD v118[4];

  v118[1] = *MEMORY[0x1E0C80C00];
  v88 = 0;
  v89 = ($BE749665CD263385F3F5ED554982D87D)0;
  v8 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v88);
  if (!(_DWORD)v8)
  {
    if (v88 != 0xE000000000000001)
    {
      LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[MercuryDecoder DecodeE1TLV:transactionInfo:error:]", 333, (uint64_t)a3->var0, a3->var1, CFSTR("Unexpected tag 0x%llx, skipping to contents..."), v9, v10, v88);
      v89 = *a3;
    }
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v108 = 0u;
    buf = 0u;
    memset(v107, 0, sizeof(v107));
    v22 = DERParseSequenceSpec((uint64_t)&v89, (uint64_t)&e1ContentSpec, (char *)&buf, 0xA0uLL);
    if ((_DWORD)v22)
    {
      v23 = v22;
      ATLLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v98 = 67109120;
        LODWORD(v99) = v23;
        _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v98, 8u);
      }

      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E1 contents %d"), v23);
      v26 = (void *)v25;
      if (!a5)
      {
        v63 = 0;
LABEL_64:

        return v63;
      }
      v27 = *a5;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v29 = *MEMORY[0x1E0CB3388];
        v102[0] = *MEMORY[0x1E0CB2D50];
        v102[1] = v29;
        v103[0] = v25;
        v103[1] = v27;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = v103;
        v32 = v102;
        v33 = 2;
      }
      else
      {
        v104 = *MEMORY[0x1E0CB2D50];
        v105 = v25;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v105;
        v32 = &v104;
        v33 = 1;
      }
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v36);
      v63 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:

      goto LABEL_64;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = &unk_1E7D9AC08;
    v100[1] = &unk_1E7D9AC20;
    v101[0] = CFSTR("Pioneer");
    v101[1] = CFSTR("Galileo");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)&buf + 1)
      && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)buf),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v36, "objectForKeyedSubscript:", v37),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v37,
          v38))
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("SP"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)buf);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v39, CFSTR("SPRaw"));

      if (v107[1])
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", v107);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v40, CFSTR("CardIdentifier"));

      }
      v87 = 0x7FFF;
      if (!*((_QWORD *)&v108 + 1))
        goto LABEL_30;
      v41 = DecodeBCD((const DERItem *)&v108);
      +[ATLCurrency currencyCodeForNumber:exponentOut:](ATLCurrency, "currencyCodeForNumber:exponentOut:", v41, &v87);
      v42 = objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v43 = (void *)v42;
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v42, CFSTR("CardCurrency"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v87);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v44, CFSTR("CardCurrencyExponent"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v41);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v45, CFSTR("CardCurrencyCode"));

        if (v87 != 0x7FFF && *((_QWORD *)&v109 + 1))
        {
          S32BE = ReadS32BE((const DERItem *)&v109);
          if (S32BE >= 0)
            v47 = S32BE;
          else
            v47 = -S32BE;
          objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v47, (__int16)-v87, S32BE >> 31);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v48, CFSTR("Balance"));

        }
LABEL_30:
        if (*((_QWORD *)&v110 + 1))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ReadS32BE((const DERItem *)&v110));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v49, CFSTR("PointBalance"));

        }
        v50 = *((_QWORD *)&v111 + 1);
        if (*((_QWORD *)&v111 + 1))
        {
          v51 = *((_QWORD *)&v111 + 1) / 3uLL;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *((_QWORD *)&v111 + 1) / 3uLL);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50 >= 3)
          {
            v53 = 0;
            if (v51 <= 1)
              v54 = 1;
            else
              v54 = v51;
            do
            {
              DecodeTransactionDetail((unsigned __int8 *)(v111 + v53));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "addObject:", v55);

              v53 += 3;
              --v54;
            }
            while (v54);
          }
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v52);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v56, CFSTR("TransactionInProgress"));

        }
        if (*((_QWORD *)&v112 + 1))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)v112 != 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v57, CFSTR("CardDenyListed"));

        }
        if (*((_QWORD *)&v113 + 1))
        {
          v58 = (void *)MEMORY[0x1E0C99D78];
          v59 = DecodeBCD((const unsigned __int8 *)v113, 1);
          v60 = DecodeBCD((const unsigned __int8 *)(v113 + 1), 1);
          objc_msgSend(v58, "dateWithYear:month:day:", v59, v60, DecodeBCD((const unsigned __int8 *)(v113 + 2), 1));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v61, "year") != 99 || objc_msgSend(v61, "month") != 12 || objc_msgSend(v61, "day") != 31)
          {
            objc_msgSend(v61, "setYear:", objc_msgSend(v61, "year") + 2000);
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v61, CFSTR("CardExpirationDate"));
          }

        }
        if (a4 && *((_QWORD *)&v114 + 1))
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CardCurrencyExponent"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          +[MercuryDecoder DecodeE456TLV:currencyExponent:error:](MercuryDecoder, "DecodeE456TLV:currencyExponent:error:", &v114, v62, a5);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v63 = v26;
        goto LABEL_62;
      }
      ATLLogObject();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v98 = 134217984;
        v99 = v41;
        _os_log_impl(&dword_1C3511000, v76, OS_LOG_TYPE_ERROR, "Invalid currency code %llu", v98, 0xCu);
      }

      v77 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid currency code %llu"), v41);
      v78 = (void *)v77;
      if (a5)
      {
        v79 = *a5;
        v80 = (void *)MEMORY[0x1E0CB35C8];
        if (*a5)
        {
          v81 = *MEMORY[0x1E0CB3388];
          v90[0] = *MEMORY[0x1E0CB2D50];
          v90[1] = v81;
          v91[0] = v77;
          v91[1] = v79;
          v82 = (void *)MEMORY[0x1E0C99D80];
          v83 = v91;
          v84 = v90;
          v85 = 2;
        }
        else
        {
          v92 = *MEMORY[0x1E0CB2D50];
          v93 = v77;
          v82 = (void *)MEMORY[0x1E0C99D80];
          v83 = &v93;
          v84 = &v92;
          v85 = 1;
        }
        objc_msgSend(v82, "dictionaryWithObjects:forKeys:count:", v83, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v86);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      ATLLogObject();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &buf);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v98 = 138412290;
        v99 = (uint64_t)v65;
        _os_log_impl(&dword_1C3511000, v64, OS_LOG_TYPE_ERROR, "Invalid SP identifier %@", v98, 0xCu);

      }
      v66 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &buf);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v66, "initWithFormat:", CFSTR("Invalid SP identifier %@"), v67);

      if (a5)
      {
        v68 = *a5;
        v69 = (void *)MEMORY[0x1E0CB35C8];
        if (*a5)
        {
          v70 = *MEMORY[0x1E0CB3388];
          v94[0] = *MEMORY[0x1E0CB2D50];
          v94[1] = v70;
          v95[0] = v38;
          v95[1] = v68;
          v71 = (void *)MEMORY[0x1E0C99D80];
          v72 = (void **)v95;
          v73 = v94;
          v74 = 2;
        }
        else
        {
          v96 = *MEMORY[0x1E0CB2D50];
          v97 = v38;
          v71 = (void *)MEMORY[0x1E0C99D80];
          v72 = &v97;
          v73 = &v96;
          v74 = 1;
        }
        objc_msgSend(v71, "dictionaryWithObjects:forKeys:count:", v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v75);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v63 = 0;
LABEL_62:

    goto LABEL_63;
  }
  v11 = v8;
  ATLLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v11;
    _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_ERROR, "Failed to decode E1 %d", (uint8_t *)&buf, 8u);
  }

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E1 %d"), v11);
  v14 = (void *)v13;
  if (a5)
  {
    v15 = *a5;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v17 = *MEMORY[0x1E0CB3388];
      v115[0] = *MEMORY[0x1E0CB2D50];
      v115[1] = v17;
      v116[0] = v13;
      v116[1] = v15;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v116;
      v20 = v115;
      v21 = 2;
    }
    else
    {
      v117 = *MEMORY[0x1E0CB2D50];
      v118[0] = v13;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v118;
      v20 = &v117;
      v21 = 1;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v34);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)DecodeE456TLV:(id *)a3 currencyExponent:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  id v34;
  int S32BE;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  uint8_t v58[4];
  int v59;
  uint8_t buf[32];
  unsigned __int128 v61;
  unsigned __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  unsigned __int128 v66;
  unsigned __int128 v67;
  unsigned __int128 v68;
  __int128 v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v52 = 0;
  v53[0] = 0;
  v53[1] = 0;
  v8 = DERDecodeItemCtx((uint64_t)a3, &v52);
  if ((_DWORD)v8 || v52 + 0x1FFFFFFFFFFFFFF9 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    ATLLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v52;
      _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "Failed to decode E4,E5,E6 %d 0x%llX", buf, 0x12u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = objc_msgSend(v10, "initWithFormat:", CFSTR("Failed to decode E4,E5,E6 %d 0x%llX"), v8, v52);
    v12 = (void *)v11;
    if (a5)
    {
      v13 = *a5;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v15 = *MEMORY[0x1E0CB3388];
        v70[0] = *MEMORY[0x1E0CB2D50];
        v70[1] = v15;
        v71[0] = v11;
        v71[1] = v13;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v71;
        v18 = v70;
        v19 = 2;
      }
      else
      {
        v72 = *MEMORY[0x1E0CB2D50];
        v73[0] = v11;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v73;
        v18 = &v72;
        v19 = 1;
      }
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    a5 = 0;
    goto LABEL_11;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  memset(buf, 0, sizeof(buf));
  v22 = DERParseSequenceSpec((uint64_t)v53, (uint64_t)&e456ContentSpec, (char *)buf, 0xB0uLL);
  if ((_DWORD)v22)
  {
    v23 = v22;
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v58 = 67109120;
      v59 = v23;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E4,E5,E6 contents %d", v58, 8u);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E4,E5,E6 contents %d"), v23);
    v26 = (void *)v25;
    if (a5)
    {
      v27 = *a5;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v29 = *MEMORY[0x1E0CB3388];
        v54[0] = *MEMORY[0x1E0CB2D50];
        v54[1] = v29;
        v55[0] = v25;
        v55[1] = v27;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = v55;
        v32 = v54;
        v33 = 2;
      }
      else
      {
        v56 = *MEMORY[0x1E0CB2D50];
        v57 = v25;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v57;
        v32 = &v56;
        v33 = 1;
      }
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v33);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v48);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 11);
  a5 = (id *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)&buf[8])
  {
    v34 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v34, "setYear:", DecodeBCD(*(const unsigned __int8 **)buf, 1));
    objc_msgSend(v34, "setMonth:", DecodeBCD((const unsigned __int8 *)(*(_QWORD *)buf + 1), 1));
    objc_msgSend(v34, "setDay:", DecodeBCD((const unsigned __int8 *)(*(_QWORD *)buf + 2), 1));
    objc_msgSend(v34, "setYear:", objc_msgSend(v34, "year") + 2000);
    if (*(_QWORD *)&buf[24])
    {
      objc_msgSend(v34, "setHour:", DecodeBCD(*(const unsigned __int8 **)&buf[16], 1));
      objc_msgSend(v34, "setMinute:", DecodeBCD((const unsigned __int8 *)(*(_QWORD *)&buf[16] + 1), 1));
      objc_msgSend(v34, "setSecond:", DecodeBCD((const unsigned __int8 *)(*(_QWORD *)&buf[16] + 2), 1));
    }
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v34, CFSTR("TransactionTime"));

  }
  if (v7 && *((_QWORD *)&v61 + 1))
  {
    S32BE = ReadS32BE((const DERItem *)&v61);
    if (S32BE >= 0)
      v36 = S32BE;
    else
      v36 = -S32BE;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v36, (__int16)-objc_msgSend(v7, "shortValue"), S32BE >> 31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v37, CFSTR("FinalBalance"));

  }
  if (v7 && *((_QWORD *)&v62 + 1))
  {
    v38 = ReadS32BE((const DERItem *)&v62);
    if (v38 >= 0)
      v39 = v38;
    else
      v39 = -v38;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v39, (__int16)-objc_msgSend(v7, "shortValue"), v38 >> 31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v40, CFSTR("Amount"));

  }
  if (*((_QWORD *)&v63 + 1))
  {
    DecodeTransactionDetail((unsigned __int8 *)v63);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v41, CFSTR("TypeDetail"));

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v63);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v42, CFSTR("TypeDetailRaw"));

  }
  if (*((_QWORD *)&v64 + 1))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v64);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v43, "isAlLFF") & 1) == 0)
      objc_msgSend(a5, "setObject:forKeyedSubscript:", v43, CFSTR("StartStation"));

  }
  if (*((_QWORD *)&v65 + 1))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v65);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v44, "isAlLFF") & 1) == 0)
      objc_msgSend(a5, "setObject:forKeyedSubscript:", v44, CFSTR("EndStation"));

  }
  if (*((_QWORD *)&v66 + 1))
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
      v47 = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v45), "bytes") << 24;
    else
      v47 = -16777216;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47 | ReadU16BE((const DERItem *)&v66));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v49, CFSTR("SerialNumber"));

  }
  if (*((_QWORD *)&v67 + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ReadS32BE((const DERItem *)&v67));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v50, CFSTR("PointsBalance"));

  }
  if (*((_QWORD *)&v68 + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ReadS32BE((const DERItem *)&v68));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v51, CFSTR("PointsAmount"));

  }
  if (*((_QWORD *)&v69 + 1))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v69);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v26, CFSTR("TerminalIdentifier"));
LABEL_57:

  }
LABEL_11:

  return a5;
}

+ (void)RemoveMatchedTapIns:(id)a3 transactionsInProgress:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *log;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = -1;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StartStation"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Amount"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Amount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "numberWithUnsignedInteger:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

      }
      else
      {
        v14 = 1;
      }

      if (v14)
      {
        if (v9)
        {
          if (v10)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EndStation"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              if (v6 < 1)
              {
                v22 = 0;
              }
              else
              {
                v16 = v7;
                while (1)
                {
                  objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("EndStation"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = v19;
                  if (v18)
                  {
                    if (v19 && objc_msgSend(v19, "isEqual:", v10))
                      break;
                  }

                  v21 = v16-- + 1;
                  if (v21 <= 1)
                  {
                    v22 = 0;
                    goto LABEL_29;
                  }
                }
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v17);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setObject:forKeyedSubscript:", v8, CFSTR("MergedStartRecord"));
                objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("StartStation"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v32)
                  objc_msgSend(v34, "setObject:forKeyedSubscript:", v9, CFSTR("StartStation"));
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("Merged"), CFSTR("IgnoreReason"));
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                ATLLogObject();
                log = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  if (v33)
                    v23 = objc_msgSend(v33, "intValue");
                  else
                    v23 = -1;
                  if (v31)
                  {
                    v28 = v23;
                    v24 = objc_msgSend(v31, "intValue");
                    v23 = v28;
                  }
                  else
                  {
                    v24 = -1;
                  }
                  *(_DWORD *)buf = 67109888;
                  v37 = v6;
                  v38 = 1024;
                  v39 = v23;
                  v40 = 1024;
                  v41 = v16;
                  v42 = 1024;
                  v43 = v24;
                  _os_log_impl(&dword_1C3511000, log, OS_LOG_TYPE_DEFAULT, "Merged events %u (SN 0x%x) --> %u (SN 0x%x)", buf, 0x1Au);
                }

                objc_msgSend(v5, "setObject:atIndexedSubscript:", v34, v16);
                objc_msgSend(v5, "setObject:atIndexedSubscript:", v29, v6);

                v22 = 1;
              }
LABEL_29:
              if (v35)
                v25 = objc_msgSend(v35, "containsObject:", v10);
              else
                v25 = 0;
              ATLLogObject();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                v37 = v6;
                v38 = 1024;
                v39 = v22;
                v40 = 1024;
                v41 = v25;
                _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_DEFAULT, "Tap-In event %d merged %d enRouteEvent %d", buf, 0x14u);
              }

              if (((v22 | v25 ^ 1) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
                objc_msgSend(v5, "setObject:atIndexedSubscript:", v27, v6);

              }
            }
          }
        }
      }

      ++v6;
      ++v7;
    }
    while (v6 < (unint64_t)objc_msgSend(v5, "count"));
  }

}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Supported");
  v8[1] = CFSTR("DelayExpressReentry");
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = &unk_1E7D9ABC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Mercury decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Mercury decoder doesn't expect processEndOfTransaction"));
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
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 7, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (BOOL)IsIncompatibleApplet:(unsigned int)a3 sw:(unsigned __int16)a4
{
  BOOL result;
  BOOL v6;
  BOOL v8;
  BOOL v10;

  if ((a3 & 0xFFFFFBFF) == 0xA40000 && a4 == 27266)
    return 1;
  v6 = a3 == 11572480 && a4 == 27266;
  v8 = a3 != -2142240510 && a3 != 11568384 || a4 == 36864;
  result = 1;
  if (v8)
  {
    v10 = a3 == 8912896 && a4 != 36864;
    return v6 || v10;
  }
  return result;
}

+ (void)ApplyHackFor50863616:(id)a3 historyRecords:(id)a4 transceiver:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  NSObject *v39;
  void *v40;
  void *v41;
  char v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  int v59;
  char v60;
  _DWORD v61[2];
  uint8_t buf[4];
  NSObject *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  *(_DWORD *)((char *)v61 + 3) = 17826304;
  v61[0] = 41984;
  v60 = 40;
  v59 = 10137600;
  v58 = 0;
  objc_msgSend(v9, "transceiveBytesAndCheckSW:length:error:", v61, 7, &v58);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v58;
  v12 = v11;
  if (!v10 || v11)
  {
    v18 = v8;
    ATLLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v12;
      _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "Failed to select ADF: %@", buf, 0xCu);
    }

    v8 = v18;
    goto LABEL_20;
  }
  v57 = 0;
  objc_msgSend(v9, "transceiveBytesAndCheckSW:length:error:", &v59, 5, &v57);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v57;

  if (!v13 || v12)
  {
    ATLLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v12;
      _os_log_impl(&dword_1C3511000, v20, OS_LOG_TYPE_ERROR, "Failed to read 0xA8: %@", buf, 0xCu);
    }

    goto LABEL_19;
  }
  if (objc_msgSend(v13, "length") != 40)
  {
    ATLLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(v13, "length");
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = v21;
      _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_ERROR, "Ignoring wrong length on A8 %u", buf, 8u);
    }
    goto LABEL_19;
  }
  v14 = objc_msgSend(v13, "bytes");
  ATLLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(unsigned __int8 *)(v14 + 15);
    *(_DWORD *)buf = 67109120;
    LODWORD(v63) = v16;
    _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_DEFAULT, "Station status byte is 0x%02X", buf, 8u);
  }

  if (*(_BYTE *)(v14 + 15) == 1)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v17, "mutableCopy");

    if ((-[NSObject containsObject:](v12, "containsObject:", CFSTR("TransitMetro")) & 1) == 0)
    {
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject addObject:](v12, "addObject:", CFSTR("TransitMetro"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("TransactionInProgress"));
    }
LABEL_19:
    v10 = v13;
    goto LABEL_20;
  }
  v22 = DecodeBCD((char *)(v14 + 16), 0, 1);
  v23 = DecodeBCD((char *)(v14 + 16), 1, 1);
  v24 = DecodeBCD((char *)(v14 + 16), 2, 1);
  v52 = DecodeBCD((char *)(v14 + 16), 3, 1);
  v50 = DecodeBCD((char *)(v14 + 16), 4, 1);
  if (!objc_msgSend(v8, "count"))
    goto LABEL_21;
  v47 = v14;
  v48 = v13;
  v49 = v7;
  v25 = 0;
  v26 = 0;
  v27 = v22 + 2000;
  while (1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v25);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("TransactionTime"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      if (objc_msgSend(v28, "year") == v27
        && objc_msgSend(v29, "month") == v23
        && objc_msgSend(v29, "day") == v24
        && objc_msgSend(v29, "hour") == v52
        && objc_msgSend(v29, "minute") == v50)
      {
        break;
      }
    }

    v25 = ++v26;
    if (objc_msgSend(v8, "count") <= (unint64_t)v26)
    {
      v13 = v48;
      v7 = v49;
      goto LABEL_21;
    }
  }
  v46 = v9;
  v30 = -[NSObject mutableCopy](v12, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14 + 5, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("StartStation"));

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v47 + 21, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("EndStation"));

  v51 = v8;
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v30, v25);
  ATLLogObject();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v63) = v26;
    _os_log_impl(&dword_1C3511000, v33, OS_LOG_TYPE_DEFAULT, "Modified record %u", buf, 8u);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v34 = v30;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v54 != v37)
          objc_enumerationMutation(v34);
        v39 = *(NSObject **)(*((_QWORD *)&v53 + 1) + 8 * i);
        -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqual:", v41);

        if ((v42 & 1) == 0)
        {
          ATLLogObject();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v39);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v39);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v63 = v39;
            v64 = 2112;
            v65 = v44;
            v66 = 2112;
            v67 = v45;
            _os_log_impl(&dword_1C3511000, v43, OS_LOG_TYPE_DEFAULT, "%@ changed %@ -> %@", buf, 0x20u);

          }
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    }
    while (v36);
  }

  v10 = v48;
  v7 = v49;
  v8 = v51;
  v9 = v46;
LABEL_20:

  v13 = v10;
LABEL_21:

}

+ (BOOL)isSpecialBusErrorFor45299868:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v7;
  void *v8;
  char v9;
  BOOL v10;

  v7 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("9156000014020001")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", CFSTR("TransitBus"));
    if (a5)
      v10 = 0;
    else
      v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
