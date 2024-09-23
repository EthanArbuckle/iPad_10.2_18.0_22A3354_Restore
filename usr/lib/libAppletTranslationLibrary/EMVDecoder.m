@implementation EMVDecoder

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v45[2];
  _QWORD v46[2];
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  int v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if ((unint64_t)objc_msgSend(v11, "length") <= 2)
  {
    ATLLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v50 = objc_msgSend(v11, "length");
      _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Short eventData? %u"), objc_msgSend(v11, "length"));
    v16 = (void *)v15;
    if (!a8)
      goto LABEL_32;
    v17 = *a8;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v19 = *MEMORY[0x1E0CB3388];
      v53[0] = *MEMORY[0x1E0CB2D50];
      v53[1] = v19;
      v54[0] = v15;
      v54[1] = v17;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = v54;
      v22 = v53;
      v23 = 2;
    }
    else
    {
      v55 = *MEMORY[0x1E0CB2D50];
      v56[0] = v15;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = v56;
      v22 = &v55;
      v23 = 1;
    }
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v18;
    v43 = 6;
LABEL_31:
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v43, v41);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
    v31 = 0;
    goto LABEL_33;
  }
  v24 = objc_retainAutorelease(v11);
  v25 = *(unsigned __int8 *)objc_msgSend(v24, "bytes");
  v26 = objc_retainAutorelease(v24);
  v27 = *(unsigned __int8 *)(objc_msgSend(v26, "bytes") + 1);
  if ((_DWORD)v25 == 2)
  {
    if ((_DWORD)v27 != 6 && (_DWORD)v27 != 1)
      goto LABEL_22;
    +[EMVDecoder parseEndEvent:withApplet:withModule:withLegacy:error:](EMVDecoder, "parseEndEvent:withApplet:withModule:withLegacy:error:", v26, v12, v13, (_DWORD)v27 == 1, a8);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_DWORD)v25 != 1 || ((_DWORD)v27 != 6 ? (v28 = (_DWORD)v27 == 1) : (v28 = 1), !v28))
    {
LABEL_22:
      ATLLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v50 = v25;
        v51 = 1024;
        v52 = v27;
        _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
      }

      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid event type 0x%x version 0x%x"), v25, v27);
      v16 = (void *)v33;
      if (!a8)
        goto LABEL_32;
      v34 = *a8;
      v35 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v36 = *MEMORY[0x1E0CB3388];
        v45[0] = *MEMORY[0x1E0CB2D50];
        v45[1] = v36;
        v46[0] = v33;
        v46[1] = v34;
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = v46;
        v39 = v45;
        v40 = 2;
      }
      else
      {
        v47 = *MEMORY[0x1E0CB2D50];
        v48 = v33;
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = &v48;
        v39 = &v47;
        v40 = 1;
      }
      objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v35;
      v43 = 3;
      goto LABEL_31;
    }
    +[EMVDecoder parseStartEvent:withApplet:error:](EMVDecoder, "parseStartEvent:withApplet:error:", v26, v12, a8);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v29;
LABEL_33:

  return v31;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "EMVDecoder doesn't support GetState", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("EMVDecoder doesn't support GetState"));
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

+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 4)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v22[0] = CFSTR("EventType");
    v22[1] = CFSTR("appletIdentifier");
    v23[0] = CFSTR("StartEvent");
    v23[1] = v8;
    v22[2] = CFSTR("selectStatus");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = CFSTR("IgnoreRFEvents");
    v22[4] = CFSTR("DontWaitForEOT");
    v23[2] = v10;
    v23[3] = MEMORY[0x1E0C9AAA0];
    v23[4] = MEMORY[0x1E0C9AAA0];
    v23[5] = MEMORY[0x1E0C9AAA0];
    v22[5] = CFSTR("RequiresPowerCycle");
    v22[6] = CFSTR("DelayExpressReentry");
    v23[6] = &unk_1E7D9AA70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v29 = objc_msgSend(v7, "length");
      v30 = 2048;
      v31 = 4;
      _os_log_impl(&dword_1C3511000, v11, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
    }

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start event length %zu (exp) %zu"), objc_msgSend(v7, "length"), 4);
    v10 = (void *)v12;
    if (a5)
    {
      v13 = *a5;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v15 = *MEMORY[0x1E0CB3388];
        v24[0] = *MEMORY[0x1E0CB2D50];
        v24[1] = v15;
        v25[0] = v12;
        v25[1] = v13;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v25;
        v18 = v24;
        v19 = 2;
      }
      else
      {
        v26 = *MEMORY[0x1E0CB2D50];
        v27 = v12;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = &v27;
        v18 = &v26;
        v19 = 1;
      }
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }

  return a5;
}

+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 withModule:(id)a5 withLegacy:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  id v23;
  unsigned __int16 *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL8 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unsigned int v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  _BOOL4 v52;
  id *v53;
  id v54;
  id v55;
  unsigned __int16 v56;
  __int128 buf;
  _QWORD v58[6];
  _QWORD v59[6];
  _QWORD v60[2];
  _QWORD v61[2];
  uint64_t v62;
  _QWORD v63[4];

  v8 = a6;
  v63[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if ((unint64_t)objc_msgSend(v11, "length") > 0x29)
  {
    v52 = v8;
    v53 = a7;
    v54 = v11;
    v23 = objc_retainAutorelease(v11);
    v24 = (unsigned __int16 *)objc_msgSend(v23, "bytes");
    v25 = (void *)MEMORY[0x1E0C99E08];
    v58[0] = CFSTR("EventType");
    v58[1] = CFSTR("appletIdentifier");
    v59[0] = CFSTR("EndEvent");
    v59[1] = v12;
    v55 = v12;
    v58[2] = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v24[1]) >> 16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v26;
    v58[3] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v24[2]) >> 16);
    v27 = v13;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v28;
    v58[4] = CFSTR("transactionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24 + 3, 32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "asHexString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59[4] = v30;
    v58[5] = CFSTR("informative");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v24[20]) >> 16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59[5] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryWithDictionary:", v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v27;
    v56 = -1;
    v33 = v24[1];
    v34 = v33 != 144;
    if ((unint64_t)objc_msgSend(v23, "length") < 0x2B)
      goto LABEL_15;
    objc_msgSend(v23, "subdataWithRange:", 42, objc_msgSend(v23, "length") - 42);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = objc_msgSend(v35, "bytes");
    *((_QWORD *)&buf + 1) = objc_msgSend(v35, "length");
    +[EMVDecoder DecodeEndE1TLV:withModule:withLegacy:withType:withTransactionStatus:error:](EMVDecoder, "DecodeEndE1TLV:withModule:withLegacy:withType:withTransactionStatus:error:", &buf, v27, v52, &v56, v33 == 144, v53);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {

      v49 = 0;
      goto LABEL_22;
    }
    v37 = (void *)v36;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("Transaction"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, CFSTR("tlv"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v38, CFSTR("parsedInfo"));
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Amount"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Amount"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v40, CFSTR("amount"));

    }
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Currency"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Currency"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v42, CFSTR("currency"));

    }
    if (v56 - 1 >= 0xFFFE)
    {
LABEL_15:
      v44 = bswap32(v24[19]);
      v43 = HIWORD(v44);
      v34 = (v44 & 0xFEFF0000) == 0 || v33 != 144;
    }
    else
    {
      v43 = 0xFFFFLL;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v46, CFSTR("didError"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v56);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v47, CFSTR("type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v43);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v48, CFSTR("result"));

    v49 = v16;
LABEL_22:
    v11 = v54;
    v12 = v55;
    goto LABEL_26;
  }
  ATLLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v11, "length");
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
  }

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu"), objc_msgSend(v11, "length"));
  v16 = (void *)v15;
  if (a7)
  {
    v17 = *a7;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v60[0] = *MEMORY[0x1E0CB2D50];
      v60[1] = *MEMORY[0x1E0CB3388];
      v61[0] = v15;
      v61[1] = v17;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v61;
      v21 = v60;
      v22 = 2;
    }
    else
    {
      v62 = *MEMORY[0x1E0CB2D50];
      v63[0] = v15;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v63;
      v21 = &v62;
      v22 = 1;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v50);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v49 = 0;
LABEL_26:

  return v49;
}

+ (id)DecodeEndE1TLV:(id *)a3 withModule:(id)a4 withLegacy:(BOOL)a5 withType:(unsigned __int16 *)a6 withTransactionStatus:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint8_t v88[8];
  DERSize v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[2];
  _QWORD v93[2];
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[2];
  _QWORD v97[2];
  uint64_t v98;
  uint64_t v99;
  _QWORD v100[2];
  _QWORD v101[2];
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[2];
  _QWORD v105[2];
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[2];
  _QWORD v109[2];
  uint64_t v110;
  uint64_t v111;
  uint8_t buf[4];
  int v113;
  DERItem v114[2];
  unsigned __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  unsigned __int128 v121;
  unsigned __int128 v122;
  __int128 v123;
  __int128 v124;
  unsigned __int128 v125;
  unsigned __int128 v126;
  __int128 v127;
  _QWORD v128[2];
  _QWORD v129[2];
  uint64_t v130;
  uint64_t v131;
  _QWORD v132[2];
  _QWORD v133[2];
  uint64_t v134;
  _QWORD v135[3];

  v9 = a7;
  v135[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v89 = 0;
  v90 = 0;
  v91 = 0;
  v14 = DERDecodeItemCtx((uint64_t)a3, &v89);
  if ((_DWORD)v14 || v89 != 0xE000000000000001)
  {
    ATLLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v114[0].data) = 67109376;
      HIDWORD(v114[0].data) = v14;
      LOWORD(v114[0].length) = 2048;
      *(DERSize *)((char *)&v114[0].length + 2) = v89;
      _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", (uint8_t *)v114, 0x12u);
    }

    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    v29 = objc_msgSend(v28, "initWithFormat:", CFSTR("Failed to decode E1 tag %d or wrong tag 0x%llx"), v14, v89);
    v30 = (void *)v29;
    if (!a8)
      goto LABEL_25;
    v31 = *a8;
    v32 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v33 = *MEMORY[0x1E0CB3388];
      v132[0] = *MEMORY[0x1E0CB2D50];
      v132[1] = v33;
      v133[0] = v29;
      v133[1] = v31;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = v133;
      v36 = v132;
LABEL_15:
      v37 = 2;
LABEL_24:
      objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v42);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    v134 = *MEMORY[0x1E0CB2D50];
    v135[0] = v29;
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = v135;
    v36 = &v134;
LABEL_23:
    v37 = 1;
    goto LABEL_24;
  }
  if (v91)
  {
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v115 = 0u;
    memset(v114, 0, sizeof(v114));
    v15 = DERParseSequenceSpec((uint64_t)&v90, (uint64_t)&e1EndEventContentSpec, (char *)v114, 0xF0uLL);
    if ((_DWORD)v15)
    {
      v16 = v15;
      ATLLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v113 = v16;
        _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", buf, 8u);
      }

      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E1 contents %d"), v16);
      v19 = (void *)v18;
      if (!a8)
        goto LABEL_99;
      v20 = *a8;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v22 = *MEMORY[0x1E0CB3388];
        v108[0] = *MEMORY[0x1E0CB2D50];
        v108[1] = v22;
        v109[0] = v18;
        v109[1] = v20;
        v23 = (void *)MEMORY[0x1E0C99D80];
        v24 = v109;
        v25 = v108;
        v26 = 2;
      }
      else
      {
        v110 = *MEMORY[0x1E0CB2D50];
        v111 = v18;
        v23 = (void *)MEMORY[0x1E0C99D80];
        v24 = &v111;
        v25 = &v110;
        v26 = 1;
      }
      objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v64);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_71;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)buf = 0;
    if (*((_QWORD *)&v115 + 1))
    {
      v43 = DecodeBCD((const DERItem *)&v115);
      +[ATLCurrency currencyCodeForNumber:exponentOut:](ATLCurrency, "currencyCodeForNumber:exponentOut:", v43, buf);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v44, CFSTR("Currency"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)buf);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v45, CFSTR("CurrencyExponent"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v46, CFSTR("CurrencyCode"));

      }
    }
    if (v114[1].length)
    {
      v47 = DecodeBCD(&v114[1]);
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v47, (__int16)-*(_WORD *)buf, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v48, CFSTR("Amount"));

    }
    if (!a5 && !v114[0].length && v9)
    {
      ATLLogObject();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v88 = 0;
        _os_log_impl(&dword_1C3511000, v49, OS_LOG_TYPE_ERROR, "Missing mandatory local validation tag", v88, 2u);
      }

      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing mandatory local validation tag"));
      v51 = (void *)v50;
      if (!a8)
        goto LABEL_70;
      v52 = *a8;
      v53 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v54 = *MEMORY[0x1E0CB3388];
        v104[0] = *MEMORY[0x1E0CB2D50];
        v104[1] = v54;
        v105[0] = v50;
        v105[1] = v52;
        v55 = (void *)MEMORY[0x1E0C99D80];
        v56 = v105;
        v57 = v104;
LABEL_40:
        v58 = 2;
LABEL_69:
        objc_msgSend(v55, "dictionaryWithObjects:forKeys:count:", v56, v57, v58);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v68);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_70:
LABEL_71:
        a8 = 0;
LABEL_99:

        goto LABEL_100;
      }
      v106 = *MEMORY[0x1E0CB2D50];
      v107 = v50;
      v55 = (void *)MEMORY[0x1E0C99D80];
      v56 = &v107;
      v57 = &v106;
      goto LABEL_68;
    }
    if (v114[0].length)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", ReadU16BE(v114));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v59, CFSTR("LocalValidation"));

    }
    if (a6 && *((_QWORD *)&v116 + 1))
      *a6 = *(unsigned __int8 *)v116;
    if (*((_QWORD *)&v117 + 1))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v117);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v60, CFSTR("MerchantNameAndLocation"));

    }
    if (+[EMVDecoder isArgon:](EMVDecoder, "isArgon:", v13))
    {
      if (*((_QWORD *)&v126 + 1))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", ReadU16BE((const DERItem *)&v126));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v61, CFSTR("MerchantCategoryCode"));

      }
      if (!*((_QWORD *)&v127 + 1))
        goto LABEL_98;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v127);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("MCII");
      goto LABEL_97;
    }
    if (+[EMVDecoder isHelium:](EMVDecoder, "isHelium:", v13))
    {
      if (*((_QWORD *)&v118 + 1))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v118);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v65, CFSTR("CDI"));

      }
      else if (v9)
      {
        ATLLogObject();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v88 = 0;
          _os_log_impl(&dword_1C3511000, v71, OS_LOG_TYPE_ERROR, "Missing mandatory CDI tag", v88, 2u);
        }

        v72 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing mandatory CDI tag"));
        v51 = (void *)v72;
        if (!a8)
          goto LABEL_70;
        v73 = *a8;
        v53 = (void *)MEMORY[0x1E0CB35C8];
        if (*a8)
        {
          v74 = *MEMORY[0x1E0CB3388];
          v100[0] = *MEMORY[0x1E0CB2D50];
          v100[1] = v74;
          v101[0] = v72;
          v101[1] = v73;
          v55 = (void *)MEMORY[0x1E0C99D80];
          v56 = v101;
          v57 = v100;
          goto LABEL_40;
        }
        v102 = *MEMORY[0x1E0CB2D50];
        v103 = v72;
        v55 = (void *)MEMORY[0x1E0C99D80];
        v56 = &v103;
        v57 = &v102;
LABEL_68:
        v58 = 1;
        goto LABEL_69;
      }
      if (*((_QWORD *)&v119 + 1))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v119);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v75, CFSTR("AIDPersonalized"));

      }
      if (*((_QWORD *)&v120 + 1))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v120);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v76, CFSTR("MAID"));

      }
      if (*((_QWORD *)&v121 + 1))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", ReadU16BE((const DERItem *)&v121));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v77, CFSTR("MSC"));

      }
      if (*((_QWORD *)&v122 + 1))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ReadS32BE((const DERItem *)&v122));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = CFSTR("TerminalTypeQualifiers");
LABEL_97:
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v62, v63);

      }
LABEL_98:
      a8 = v19;
      goto LABEL_99;
    }
    if (+[EMVDecoder isNeon:](EMVDecoder, "isNeon:", v13))
    {
      if (*((_QWORD *)&v123 + 1))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v123);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v66, CFSTR("IssuerApplicationData"));

      }
      if (*((_QWORD *)&v124 + 1))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v124);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v67, CFSTR("MobileCVMResults"));

      }
      if (!*((_QWORD *)&v125 + 1))
        goto LABEL_98;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ReadS32BE((const DERItem *)&v125));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("EnhancedContactlessReaderCapabilities");
      goto LABEL_97;
    }
    if (+[EMVDecoder isXenon:](EMVDecoder, "isXenon:", v13))
    {
      if (*((_QWORD *)&v122 + 1))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ReadS32BE((const DERItem *)&v122));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v69, CFSTR("TerminalTypeQualifiers"));

      }
      if (*((_QWORD *)&v126 + 1))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", ReadU16BE((const DERItem *)&v126));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v70, CFSTR("MerchantCategoryCode"));

      }
    }
    else
    {
      if (!+[EMVDecoder isLuau:](EMVDecoder, "isLuau:", v13))
        goto LABEL_98;
      if (*((_QWORD *)&v118 + 1))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v118);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v78, CFSTR("CDI"));

        if (!*((_QWORD *)&v123 + 1))
        {
          if (v9)
          {
            ATLLogObject();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v88 = 0;
              _os_log_impl(&dword_1C3511000, v84, OS_LOG_TYPE_ERROR, "Missing mandatory IAD tag", v88, 2u);
            }

            v85 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing mandatory IAD tag"));
            v51 = (void *)v85;
            if (!a8)
              goto LABEL_70;
            v86 = *a8;
            v53 = (void *)MEMORY[0x1E0CB35C8];
            if (*a8)
            {
              v87 = *MEMORY[0x1E0CB3388];
              v92[0] = *MEMORY[0x1E0CB2D50];
              v92[1] = v87;
              v93[0] = v85;
              v93[1] = v86;
              v55 = (void *)MEMORY[0x1E0C99D80];
              v56 = v93;
              v57 = v92;
              goto LABEL_40;
            }
            v94 = *MEMORY[0x1E0CB2D50];
            v95 = v85;
            v55 = (void *)MEMORY[0x1E0C99D80];
            v56 = &v95;
            v57 = &v94;
            goto LABEL_68;
          }
          goto LABEL_98;
        }
LABEL_96:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v123);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = CFSTR("IssuerApplicationData");
        goto LABEL_97;
      }
      if (v9)
      {
        ATLLogObject();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v88 = 0;
          _os_log_impl(&dword_1C3511000, v80, OS_LOG_TYPE_ERROR, "Missing mandatory CVS tag", v88, 2u);
        }

        v81 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing mandatory CVS tag"));
        v51 = (void *)v81;
        if (!a8)
          goto LABEL_70;
        v82 = *a8;
        v53 = (void *)MEMORY[0x1E0CB35C8];
        if (*a8)
        {
          v83 = *MEMORY[0x1E0CB3388];
          v96[0] = *MEMORY[0x1E0CB2D50];
          v96[1] = v83;
          v97[0] = v81;
          v97[1] = v82;
          v55 = (void *)MEMORY[0x1E0C99D80];
          v56 = v97;
          v57 = v96;
          goto LABEL_40;
        }
        v98 = *MEMORY[0x1E0CB2D50];
        v99 = v81;
        v55 = (void *)MEMORY[0x1E0C99D80];
        v56 = &v99;
        v57 = &v98;
        goto LABEL_68;
      }
    }
    if (!*((_QWORD *)&v123 + 1))
      goto LABEL_98;
    goto LABEL_96;
  }
  if (!v9)
  {
    a8 = (id *)MEMORY[0x1E0C9AA70];
    goto LABEL_100;
  }
  ATLLogObject();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v114[0].data) = 0;
    _os_log_impl(&dword_1C3511000, v38, OS_LOG_TYPE_ERROR, "Missing E1 content", (uint8_t *)v114, 2u);
  }

  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing E1 content"));
  v30 = (void *)v39;
  if (a8)
  {
    v40 = *a8;
    v32 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v41 = *MEMORY[0x1E0CB3388];
      v128[0] = *MEMORY[0x1E0CB2D50];
      v128[1] = v41;
      v129[0] = v39;
      v129[1] = v40;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = v129;
      v36 = v128;
      goto LABEL_15;
    }
    v130 = *MEMORY[0x1E0CB2D50];
    v131 = v39;
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = &v131;
    v36 = &v130;
    goto LABEL_23;
  }
LABEL_25:

  a8 = 0;
LABEL_100:

  return a8;
}

+ (BOOL)isEMV:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[EMVDecoder isArgon:](EMVDecoder, "isArgon:", v3)
    || +[EMVDecoder isHelium:](EMVDecoder, "isHelium:", v3)
    || +[EMVDecoder isNeon:](EMVDecoder, "isNeon:", v3)
    || +[EMVDecoder isXenon:](EMVDecoder, "isXenon:", v3)
    || +[EMVDecoder isLuau:](EMVDecoder, "isLuau:", v3)
    || +[EMVDecoder isPoke:](EMVDecoder, "isPoke:", v3)
    || +[EMVDecoder isEMVLegacy:](EMVDecoder, "isEMVLegacy:", v3);

  return v4;
}

+ (BOOL)isArgon:(id)a3
{
  return objc_msgSend(&unk_1E7D9CDC8, "containsObject:", a3);
}

+ (BOOL)isHelium:(id)a3
{
  return objc_msgSend(&unk_1E7D9CDE0, "containsObject:", a3);
}

+ (BOOL)isNeon:(id)a3
{
  return objc_msgSend(&unk_1E7D9CDF8, "containsObject:", a3);
}

+ (BOOL)isXenon:(id)a3
{
  return objc_msgSend(&unk_1E7D9CE10, "containsObject:", a3);
}

+ (BOOL)isLuau:(id)a3
{
  return objc_msgSend(&unk_1E7D9CE28, "containsObject:", a3);
}

+ (BOOL)isPoke:(id)a3
{
  return objc_msgSend(&unk_1E7D9CE40, "containsObject:", a3);
}

+ (BOOL)isEMVLegacy:(id)a3
{
  return objc_msgSend(&unk_1E7D9CE58, "containsObject:", a3);
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Supported");
  v8[1] = CFSTR("DelayExpressReentry");
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = &unk_1E7D9AA70;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "EMV decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("EMV decoder doesn't expect processEndOfTransaction"));
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

@end
