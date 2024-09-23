@implementation MifareDecoder

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v10;
  id v11;
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
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  int v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((unint64_t)objc_msgSend(v10, "length") > 1)
  {
    v22 = objc_msgSend(v10, "u8:", 0);
    v23 = objc_msgSend(v10, "u8:", 1);
    v24 = v23;
    switch((_DWORD)v22)
    {
      case 0x10:
        if ((v23 - 3) <= 1)
        {
          +[MifareDecoder ParseTimeoutEventNative:withApplet:error:](MifareDecoder, "ParseTimeoutEventNative:withApplet:error:", v10, v11, a8);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        if ((_DWORD)v23 == 255)
        {
          +[MifareDecoder ParseTimeoutEventISO:withApplet:error:](MifareDecoder, "ParseTimeoutEventISO:withApplet:error:", v10, v11, a8);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        break;
      case 2:
        if ((v23 - 3) <= 1)
        {
          +[MifareDecoder parseEndEvent:withApplet:error:](MifareDecoder, "parseEndEvent:withApplet:error:", v10, v11, a8);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        if ((_DWORD)v23 == 240)
        {
          +[MifareDecoder ParseEndEventShort:withApplet:error:](MifareDecoder, "ParseEndEventShort:withApplet:error:", v10, v11, a8);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        if ((_DWORD)v23 == 255)
        {
          +[MifareDecoder parseEndEventISO:withApplet:error:](MifareDecoder, "parseEndEventISO:withApplet:error:", v10, v11, a8);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        break;
      case 1:
        if ((v23 - 3) <= 1)
        {
          +[MifareDecoder parseStartEventNative:withApplet:error:](MifareDecoder, "parseStartEventNative:withApplet:error:", v10, v11, a8);
          v25 = objc_claimAutoreleasedReturnValue();
LABEL_35:
          v38 = (void *)v25;
          goto LABEL_36;
        }
        if ((_DWORD)v23 == 255)
        {
          +[MifareDecoder parseStartEventISO:withApplet:error:](MifareDecoder, "parseStartEventISO:withApplet:error:", v10, v11, a8);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        break;
    }
    ATLLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v45 = v22;
      v46 = 1024;
      v47 = v24;
      _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
    }

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid event type 0x%x version 0x%x"), v22, v24);
    v14 = (void *)v30;
    if (!a8)
      goto LABEL_33;
    v31 = *a8;
    v32 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v33 = *MEMORY[0x1E0CB3388];
      v40[0] = *MEMORY[0x1E0CB2D50];
      v40[1] = v33;
      v41[0] = v30;
      v41[1] = v31;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = v41;
      v36 = v40;
      v37 = 2;
    }
    else
    {
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = v30;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = &v43;
      v36 = &v42;
      v37 = 1;
    }
    objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v32;
    v28 = 3;
    goto LABEL_32;
  }
  ATLLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v45 = objc_msgSend(v10, "length");
    _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
  }

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Short eventData? %u"), objc_msgSend(v10, "length"));
  v14 = (void *)v13;
  if (!a8)
    goto LABEL_33;
  v15 = *a8;
  v16 = (void *)MEMORY[0x1E0CB35C8];
  if (*a8)
  {
    v17 = *MEMORY[0x1E0CB3388];
    v48[0] = *MEMORY[0x1E0CB2D50];
    v48[1] = v17;
    v49[0] = v13;
    v49[1] = v15;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = v49;
    v20 = v48;
    v21 = 2;
  }
  else
  {
    v50 = *MEMORY[0x1E0CB2D50];
    v51[0] = v13;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = v51;
    v20 = &v50;
    v21 = 1;
  }
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v16;
  v28 = 6;
LABEL_32:
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v28, v26);
  *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
  v38 = 0;
LABEL_36:

  return v38;
}

+ (id)parseStartEventNative:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  _QWORD v27[10];
  _QWORD v28[10];
  _QWORD v29[2];
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 7)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v27[0] = CFSTR("EventType");
    v27[1] = CFSTR("appletIdentifier");
    v28[0] = CFSTR("StartEvent");
    v28[1] = v8;
    v27[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v10;
    v27[3] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v9 + 4)) >> 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v11;
    v27[4] = CFSTR("selectStatus");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v12;
    v27[5] = CFSTR("spIdentifier");
    +[MifareDecoder getServiceProvider:](MifareDecoder, "getServiceProvider:", *(unsigned __int8 *)(v9 + 6));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v13;
    v28[6] = MEMORY[0x1E0C9AAB0];
    v27[6] = CFSTR("IgnoreRFEvents");
    v27[7] = CFSTR("DontWaitForEOT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[MifareDecoder getDontWaitForEOT:](MifareDecoder, "getDontWaitForEOT:", *(unsigned __int8 *)(v9 + 6)));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[7] = v14;
    v28[8] = MEMORY[0x1E0C9AAA0];
    v27[8] = CFSTR("RequiresPowerCycle");
    v27[9] = CFSTR("DelayExpressReentry");
    +[MifareDecoder getEmReentryDelayMs:](MifareDecoder, "getEmReentryDelayMs:", *(unsigned __int8 *)(v9 + 6));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[9] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  ATLLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v34 = objc_msgSend(v7, "length");
    v35 = 2048;
    v36 = 7;
    _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
  }

  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start event length %zu (exp) %zu"), objc_msgSend(v7, "length"), 7);
  v10 = (void *)v18;
  if (a5)
  {
    v19 = *a5;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v21 = *MEMORY[0x1E0CB3388];
      v29[0] = *MEMORY[0x1E0CB2D50];
      v29[1] = v21;
      v30[0] = v18;
      v30[1] = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v30;
      v24 = v29;
      v25 = 2;
    }
    else
    {
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = v18;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v32;
      v24 = &v31;
      v25 = 1;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v11);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

+ (id)parseStartEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  _QWORD v27[10];
  _QWORD v28[10];
  _QWORD v29[2];
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 10)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v27[0] = CFSTR("EventType");
    v27[1] = CFSTR("appletIdentifier");
    v28[0] = CFSTR("StartEvent");
    v28[1] = v8;
    v27[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v10;
    v27[3] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)(v9 + 5)));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v11;
    v27[4] = CFSTR("selectStatus");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v12;
    v27[5] = CFSTR("spIdentifier");
    +[MifareDecoder getServiceProvider:](MifareDecoder, "getServiceProvider:", *(unsigned __int8 *)(v9 + 9));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v13;
    v28[6] = MEMORY[0x1E0C9AAB0];
    v27[6] = CFSTR("IgnoreRFEvents");
    v27[7] = CFSTR("DontWaitForEOT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[MifareDecoder getDontWaitForEOT:](MifareDecoder, "getDontWaitForEOT:", *(unsigned __int8 *)(v9 + 9)));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[7] = v14;
    v28[8] = MEMORY[0x1E0C9AAA0];
    v27[8] = CFSTR("RequiresPowerCycle");
    v27[9] = CFSTR("DelayExpressReentry");
    +[MifareDecoder getEmReentryDelayMs:](MifareDecoder, "getEmReentryDelayMs:", *(unsigned __int8 *)(v9 + 9));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[9] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  ATLLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v34 = objc_msgSend(v7, "length");
    v35 = 2048;
    v36 = 10;
    _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
  }

  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start event length %zu (exp) %zu"), objc_msgSend(v7, "length"), 10);
  v10 = (void *)v18;
  if (a5)
  {
    v19 = *a5;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v21 = *MEMORY[0x1E0CB3388];
      v29[0] = *MEMORY[0x1E0CB2D50];
      v29[1] = v21;
      v30[0] = v18;
      v30[1] = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v30;
      v24 = v29;
      v25 = 2;
    }
    else
    {
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = v18;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v32;
      v24 = &v31;
      v25 = 1;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v11);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
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
  id v19;
  uint64_t v20;
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
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[11];
  _QWORD v56[11];
  _QWORD v57[2];
  _QWORD v58[2];
  const __CFString *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  uint8_t v65[4];
  int v66;
  _QWORD v67[2];
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  uint8_t v71[8];
  _QWORD v72[3];
  __int128 buf;
  uint64_t v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint64_t v77;
  _QWORD v78[4];

  v78[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "length") <= 0x2D)
  {
    ATLLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v7, "length");
      _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu"), objc_msgSend(v7, "length"));
    v11 = (void *)v10;
    if (a5)
    {
      v12 = *a5;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v14 = *MEMORY[0x1E0CB3388];
        v75[0] = *MEMORY[0x1E0CB2D50];
        v75[1] = v14;
        v76[0] = v10;
        v76[1] = v12;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v76;
        v17 = v75;
        v18 = 2;
      }
      else
      {
        v77 = *MEMORY[0x1E0CB2D50];
        v78[0] = v10;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v78;
        v17 = &v77;
        v18 = 1;
      }
      objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v39);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_29;
  }
  v19 = objc_retainAutorelease(v7);
  v20 = objc_msgSend(v19, "bytes");
  objc_msgSend(v19, "subdataWithRange:", 46, objc_msgSend(v19, "length") - 46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = objc_msgSend(v11, "bytes");
  v54[1] = objc_msgSend(v11, "length");
  buf = 0uLL;
  v74 = 0;
  v21 = DERDecodeItemCtx((uint64_t)v54, (unint64_t *)&buf);
  if ((_DWORD)v21 || (_QWORD)buf != 0xE000000000000001)
  {
    ATLLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v71 = 67109376;
      *(_DWORD *)&v71[4] = v21;
      LOWORD(v72[0]) = 2048;
      *(_QWORD *)((char *)v72 + 2) = buf;
      _os_log_impl(&dword_1C3511000, v33, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v71, 0x12u);
    }

    v34 = objc_alloc(MEMORY[0x1E0CB3940]);
    v35 = objc_msgSend(v34, "initWithFormat:", CFSTR("Failed to decode E1 tag %d or wrong tag 0x%llx"), v21, (_QWORD)buf);
    v26 = (void *)v35;
    if (!a5)
      goto LABEL_28;
    v36 = *a5;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v37 = *MEMORY[0x1E0CB3388];
      v67[0] = *MEMORY[0x1E0CB2D50];
      v67[1] = v37;
      v68[0] = v35;
      v68[1] = v36;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = v68;
      v32 = v67;
      goto LABEL_20;
    }
    v69 = *MEMORY[0x1E0CB2D50];
    v70 = v35;
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v70;
    v32 = &v69;
LABEL_26:
    v38 = 1;
    goto LABEL_27;
  }
  *(_QWORD *)v71 = 0;
  v72[0] = 0;
  v22 = DERParseSequenceSpec((uint64_t)&buf + 8, (uint64_t)&mifareE1TLVSpec, (char *)v71, 0x10uLL);
  if ((_DWORD)v22)
  {
    v23 = v22;
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 67109120;
      v66 = v23;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v65, 8u);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E1 contents %d"), v23);
    v26 = (void *)v25;
    if (!a5)
      goto LABEL_28;
    v27 = *a5;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v29 = *MEMORY[0x1E0CB3388];
      v61[0] = *MEMORY[0x1E0CB2D50];
      v61[1] = v29;
      v62[0] = v25;
      v62[1] = v27;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = v62;
      v32 = v61;
LABEL_20:
      v38 = 2;
LABEL_27:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v38);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v50);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_28:
LABEL_29:
      v49 = 0;
      goto LABEL_30;
    }
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = v25;
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v64;
    v32 = &v63;
    goto LABEL_26;
  }
  *(_WORD *)v65 = -1;
  v40 = +[MifareDecoder didTransactionError:withParameters:withTransactionResult:](MifareDecoder, "didTransactionError:withParameters:withTransactionResult:", **(_BYTE **)v71, v20, v65);
  v59 = CFSTR("State");
  v57[0] = CFSTR("SP");
  +[MifareDecoder getServiceProvider:](MifareDecoder, "getServiceProvider:", **(_BYTE **)v71);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = CFSTR("SPRaw");
  v58[0] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", **(_BYTE **)v71);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v55[0] = CFSTR("EventType");
  v55[1] = CFSTR("appletIdentifier");
  v56[0] = CFSTR("EndEvent");
  v56[1] = v8;
  v55[2] = CFSTR("Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v20 + 1));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v53;
  v55[3] = CFSTR("didError");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v44;
  v55[4] = CFSTR("command");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v20 + 3)) >> 16);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v45;
  v55[5] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v20 + 2));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v46;
  v55[6] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)v65);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v47;
  v55[7] = CFSTR("informative");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v20 + 39)) >> 16);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v48;
  v56[8] = &unk_1E7D9AD70;
  v55[8] = CFSTR("type");
  v55[9] = CFSTR("tlv");
  v55[10] = CFSTR("parsedInfo");
  v56[9] = v11;
  v56[10] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 11);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
  return v49;
}

+ (id)parseEndEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
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
  id v19;
  uint64_t v20;
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
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[11];
  _QWORD v56[11];
  _QWORD v57[2];
  _QWORD v58[2];
  const __CFString *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  uint8_t v65[4];
  int v66;
  _QWORD v67[2];
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  uint8_t v71[8];
  _QWORD v72[3];
  __int128 buf;
  uint64_t v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint64_t v77;
  _QWORD v78[4];

  v78[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "length") <= 0x30)
  {
    ATLLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v7, "length");
      _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu"), objc_msgSend(v7, "length"));
    v11 = (void *)v10;
    if (a5)
    {
      v12 = *a5;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v14 = *MEMORY[0x1E0CB3388];
        v75[0] = *MEMORY[0x1E0CB2D50];
        v75[1] = v14;
        v76[0] = v10;
        v76[1] = v12;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v76;
        v17 = v75;
        v18 = 2;
      }
      else
      {
        v77 = *MEMORY[0x1E0CB2D50];
        v78[0] = v10;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v78;
        v17 = &v77;
        v18 = 1;
      }
      objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v39);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_29;
  }
  v19 = objc_retainAutorelease(v7);
  v20 = objc_msgSend(v19, "bytes");
  objc_msgSend(v19, "subdataWithRange:", 49, objc_msgSend(v19, "length") - 49);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = objc_msgSend(v11, "bytes");
  v54[1] = objc_msgSend(v11, "length");
  buf = 0uLL;
  v74 = 0;
  v21 = DERDecodeItemCtx((uint64_t)v54, (unint64_t *)&buf);
  if ((_DWORD)v21 || (_QWORD)buf != 0xE000000000000001)
  {
    ATLLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v71 = 67109376;
      *(_DWORD *)&v71[4] = v21;
      LOWORD(v72[0]) = 2048;
      *(_QWORD *)((char *)v72 + 2) = buf;
      _os_log_impl(&dword_1C3511000, v33, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v71, 0x12u);
    }

    v34 = objc_alloc(MEMORY[0x1E0CB3940]);
    v35 = objc_msgSend(v34, "initWithFormat:", CFSTR("Failed to decode E1 tag %d or wrong tag 0x%llx"), v21, (_QWORD)buf);
    v26 = (void *)v35;
    if (!a5)
      goto LABEL_28;
    v36 = *a5;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v37 = *MEMORY[0x1E0CB3388];
      v67[0] = *MEMORY[0x1E0CB2D50];
      v67[1] = v37;
      v68[0] = v35;
      v68[1] = v36;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = v68;
      v32 = v67;
      goto LABEL_20;
    }
    v69 = *MEMORY[0x1E0CB2D50];
    v70 = v35;
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v70;
    v32 = &v69;
LABEL_26:
    v38 = 1;
    goto LABEL_27;
  }
  *(_QWORD *)v71 = 0;
  v72[0] = 0;
  v22 = DERParseSequenceSpec((uint64_t)&buf + 8, (uint64_t)&mifareE1TLVSpec, (char *)v71, 0x10uLL);
  if ((_DWORD)v22)
  {
    v23 = v22;
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 67109120;
      v66 = v23;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v65, 8u);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E1 contents %d"), v23);
    v26 = (void *)v25;
    if (!a5)
      goto LABEL_28;
    v27 = *a5;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v29 = *MEMORY[0x1E0CB3388];
      v61[0] = *MEMORY[0x1E0CB2D50];
      v61[1] = v29;
      v62[0] = v25;
      v62[1] = v27;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = v62;
      v32 = v61;
LABEL_20:
      v38 = 2;
LABEL_27:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v38);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v50);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_28:
LABEL_29:
      v49 = 0;
      goto LABEL_30;
    }
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = v25;
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v64;
    v32 = &v63;
    goto LABEL_26;
  }
  *(_WORD *)v65 = -1;
  v40 = +[MifareDecoder didTransactionError:withISOParameters:withTransactionResult:](MifareDecoder, "didTransactionError:withISOParameters:withTransactionResult:", **(_BYTE **)v71, v20, v65);
  v59 = CFSTR("State");
  v57[0] = CFSTR("SP");
  +[MifareDecoder getServiceProvider:](MifareDecoder, "getServiceProvider:", **(_BYTE **)v71);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = CFSTR("SPRaw");
  v58[0] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", **(_BYTE **)v71);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v55[0] = CFSTR("EventType");
  v55[1] = CFSTR("appletIdentifier");
  v56[0] = CFSTR("EndEvent");
  v56[1] = v8;
  v55[2] = CFSTR("Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v20 + 1));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v53;
  v55[3] = CFSTR("didError");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v44;
  v55[4] = CFSTR("command");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)(v20 + 4)));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v45;
  v55[5] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v20 + 2)) >> 16);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v46;
  v55[6] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)v65);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v47;
  v55[7] = CFSTR("informative");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v20 + 42)) >> 16);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v48;
  v56[8] = &unk_1E7D9AD70;
  v55[8] = CFSTR("type");
  v55[9] = CFSTR("tlv");
  v55[10] = CFSTR("parsedInfo");
  v56[9] = v11;
  v56[10] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 11);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
  return v49;
}

+ (id)ParseEndEventShort:(id)a3 withApplet:(id)a4 error:(id *)a5
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
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 3)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v23[0] = CFSTR("EndEvent");
    v22[0] = CFSTR("EventType");
    v22[1] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = CFSTR("appletIdentifier");
    v22[3] = CFSTR("didError");
    v23[1] = v10;
    v23[2] = v8;
    v23[3] = MEMORY[0x1E0C9AAA0];
    v23[4] = &unk_1E7D9AD88;
    v22[4] = CFSTR("result");
    v22[5] = CFSTR("type");
    v23[5] = &unk_1E7D9AD70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ATLLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v29 = objc_msgSend(v7, "length");
      _os_log_impl(&dword_1C3511000, v11, OS_LOG_TYPE_ERROR, "End event length %zu", buf, 0xCu);
    }

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu"), objc_msgSend(v7, "length"));
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

+ (id)ParseTimeoutEventNative:(id)a3 withApplet:(id)a4 error:(id *)a5
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
  uint64_t v22;
  _QWORD v24[8];
  _QWORD v25[8];
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 8)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v25[0] = CFSTR("EndEvent");
    v24[0] = CFSTR("EventType");
    v24[1] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    v25[2] = v8;
    v24[2] = CFSTR("appletIdentifier");
    v24[3] = CFSTR("didError");
    v25[3] = MEMORY[0x1E0C9AAB0];
    v24[4] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v9 + 4)) >> 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v11;
    v24[5] = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[5] = v12;
    v25[6] = &unk_1E7D9ADA0;
    v24[6] = CFSTR("result");
    v24[7] = CFSTR("type");
    v25[7] = &unk_1E7D9AD70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  ATLLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v31 = objc_msgSend(v7, "length");
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "event length %zu", buf, 0xCu);
  }

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("event length %zu"), objc_msgSend(v7, "length"));
  v10 = (void *)v15;
  if (a5)
  {
    v16 = *a5;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v26[0] = *MEMORY[0x1E0CB2D50];
      v26[1] = v18;
      v27[0] = v15;
      v27[1] = v16;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v27;
      v21 = v26;
      v22 = 2;
    }
    else
    {
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = v15;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v29;
      v21 = &v28;
      v22 = 1;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v11);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (id)ParseTimeoutEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5
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
  uint64_t v22;
  _QWORD v24[8];
  _QWORD v25[8];
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 11)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v25[0] = CFSTR("EndEvent");
    v24[0] = CFSTR("EventType");
    v24[1] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    v25[2] = v8;
    v24[2] = CFSTR("appletIdentifier");
    v24[3] = CFSTR("didError");
    v25[3] = MEMORY[0x1E0C9AAB0];
    v24[4] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)(v9 + 5)));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v11;
    v24[5] = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v9 + 3)) >> 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[5] = v12;
    v25[6] = &unk_1E7D9ADA0;
    v24[6] = CFSTR("result");
    v24[7] = CFSTR("type");
    v25[7] = &unk_1E7D9AD70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  ATLLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v31 = objc_msgSend(v7, "length");
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "event length %zu", buf, 0xCu);
  }

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("event length %zu"), objc_msgSend(v7, "length"));
  v10 = (void *)v15;
  if (a5)
  {
    v16 = *a5;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v26[0] = *MEMORY[0x1E0CB2D50];
      v26[1] = v18;
      v27[0] = v15;
      v27[1] = v16;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v27;
      v21 = v26;
      v22 = 2;
    }
    else
    {
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = v15;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v29;
      v21 = &v28;
      v22 = 1;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v11);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[MifareDecoder getSPID:withApplet:withError:](MifareDecoder, "getSPID:withApplet:withError:", v11, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    +[MifareDecoder getAppletStateAndHistory:withTransceiver:withApplet:withPackage:withModule:withError:](MifareDecoder, "getAppletStateAndHistory:withTransceiver:withApplet:withPackage:withModule:withError:", objc_msgSend(v15, "unsignedCharValue"), v11, v12, v13, v14, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MifareDecoder getSPID:withApplet:withError:](MifareDecoder, "getSPID:withApplet:withError:", v10, v9, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v15[0] = CFSTR("Supported");
    v15[1] = CFSTR("DelayExpressReentry");
    v16[0] = MEMORY[0x1E0C9AAB0];
    +[MifareDecoder getEmReentryDelayMs:](MifareDecoder, "getEmReentryDelayMs:", objc_msgSend(v11, "unsignedCharValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Mifare decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Mifare decoder doesn't expect processEndOfTransaction"));
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

- (BOOL)supportsPlasticCardMode:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  uint64_t v14;

  v7 = a3;
  v14 = 0;
  +[MifareDecoder getSPID:withApplet:withError:](MifareDecoder, "getSPID:withApplet:withError:", v7, a4, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v14)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (v10)
  {
    v12 = 0;
  }
  else
  {
    +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", objc_msgSend(v8, "unsignedCharValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend((id)objc_opt_class(), "supportsPlasticCardMode:withTransceiver:", objc_msgSend(v9, "unsignedCharValue"), v7);

  }
  return v12;
}

+ (id)getSPID:(id)a3 withApplet:(id)a4 withError:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint8_t v27[8];
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SelectByNameCmd(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "transceiveAndCheckSW:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &getSPID_withApplet_withError__getDataSpid, 6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transceiveAndCheckSW:error:", v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "length") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v13, "u8:", 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        goto LABEL_16;
      }
      ATLLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_ERROR, "Invalid response length to GET DATA SPID != 1", v27, 2u);
      }

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid response length to GET DATA SPID != 1"));
      v17 = (void *)v16;
      if (a5)
      {
        v18 = *a5;
        v19 = (void *)MEMORY[0x1E0CB35C8];
        if (*a5)
        {
          v20 = *MEMORY[0x1E0CB3388];
          v28[0] = *MEMORY[0x1E0CB2D50];
          v28[1] = v20;
          v29[0] = v16;
          v29[1] = v18;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = v29;
          v23 = v28;
          v24 = 2;
        }
        else
        {
          v30 = *MEMORY[0x1E0CB2D50];
          v31[0] = v16;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = v31;
          v23 = &v30;
          v24 = 1;
        }
        objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v25);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v14 = 0;
    goto LABEL_15;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

+ (id)getSubDecoder:(unsigned __int8)a3
{
  __int16 v3;
  _BOOL4 v4;
  __objc2_class **v5;
  id v6;
  void *v7;

  if (getSubDecoder__currentSPId != a3)
  {
    v3 = a3;
    v4 = +[HerculesDecoder canDecodeSPId:](HerculesDecoder, "canDecodeSPId:");
    v5 = off_1E7D89398;
    if (v4)
      v5 = off_1E7D893A0;
    v6 = objc_alloc_init(*v5);
    v7 = (void *)getSubDecoder__currentSubDecoder;
    getSubDecoder__currentSubDecoder = (uint64_t)v6;

    getSubDecoder__currentSPId = v3;
  }
  return (id)getSubDecoder__currentSubDecoder;
}

+ (id)getServiceProvider:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getServiceProvider:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getEmReentryDelayMs:(unsigned __int8)a3
{
  void *v3;
  void *v4;

  +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getEmReentryDelayMs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)getDontWaitForEOT:(unsigned __int8)a3
{
  void *v3;
  char v4;

  +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "getDontWaitForEOT");

  return v4;
}

+ (BOOL)didTransactionError:(unsigned __int8)a3 withISOParameters:(id *)a4 withTransactionResult:(unsigned __int16 *)a5
{
  _BYTE v6[43];
  __int16 v7;
  unsigned __int8 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  *(_WORD *)&v6[37] = a4->var5;
  v7 = *(_WORD *)a4->var8;
  v8 = a4->var8[2];
  return +[MifareDecoder didTransactionError:withParameters:withTransactionResult:](MifareDecoder, "didTransactionError:withParameters:withTransactionResult:", a3, v6, a5);
}

+ (BOOL)didTransactionError:(unsigned __int8)a3 withParameters:(id *)a4 withTransactionResult:(unsigned __int16 *)a5
{
  void *v7;

  +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend((id)objc_opt_class(), "didTransactionError:withTransactionResult:", a4, a5);

  return (char)a5;
}

+ (id)getAppletStateAndHistory:(unsigned __int8)a3 withTransceiver:(id)a4 withApplet:(id)a5 withPackage:(id)a6 withModule:(id)a7 withError:(id *)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getAppletStateAndHistory:withApplet:withPackage:withModule:withError:", v16, v15, v14, v13, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  uint8_t buf[16];
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[2];

  v14 = a9;
  v40[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v36 = 0;
  +[MifareDecoder getSPID:withApplet:withError:](MifareDecoder, "getSPID:withApplet:withError:", v20, v15, &v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v36;
  if (v22 || !v21)
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Service Provider Opaque Data for Mifare not supported when SPID not available.", buf, 2u);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Service Provider Opaque Data for Mifare not supported when SPID not available."));
    v23 = (void *)v25;
    if (a9)
    {
      v26 = *a9;
      v34 = (void *)MEMORY[0x1E0CB35C8];
      if (*a9)
      {
        v27 = *MEMORY[0x1E0CB3388];
        v37[0] = *MEMORY[0x1E0CB2D50];
        v37[1] = v27;
        v38[0] = v25;
        v38[1] = v26;
        v28 = (void *)MEMORY[0x1E0C99D80];
        v29 = v38;
        v30 = v37;
        v31 = 2;
      }
      else
      {
        v39 = *MEMORY[0x1E0CB2D50];
        v40[0] = v25;
        v28 = (void *)MEMORY[0x1E0C99D80];
        v29 = v40;
        v30 = &v39;
        v31 = 1;
      }
      objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v32);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
    }
  }
  else
  {
    +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", objc_msgSend(v21, "unsignedCharValue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:", v15, v16, v17, v18, v19, v20, a9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return -[MifareDecoder getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:](self, "getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:", a3, a4, a5, 0, 0, a6, a7);
}

@end
