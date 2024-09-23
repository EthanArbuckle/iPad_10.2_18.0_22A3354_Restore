@implementation SeosDecoder

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
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  int v59;
  __int16 v60;
  int v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((unint64_t)objc_msgSend(v10, "length") <= 1)
  {
    ATLLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v59 = objc_msgSend(v10, "length");
      _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid eventData length %u"), objc_msgSend(v10, "length"));
    v14 = (void *)v13;
    if (!a8)
      goto LABEL_33;
    v15 = *a8;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v17 = *MEMORY[0x1E0CB3388];
      v70[0] = *MEMORY[0x1E0CB2D50];
      v70[1] = v17;
      v71[0] = v13;
      v71[1] = v15;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v71;
      v20 = v70;
LABEL_7:
      v21 = 2;
LABEL_25:
      objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v16;
      v42 = 6;
LABEL_32:
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v42, v40);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
      v43 = 0;
      goto LABEL_34;
    }
    v72 = *MEMORY[0x1E0CB2D50];
    v73[0] = v13;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = v73;
    v20 = &v72;
    goto LABEL_24;
  }
  v22 = objc_retainAutorelease(v10);
  v23 = *(unsigned __int8 *)objc_msgSend(v22, "bytes");
  v24 = objc_retainAutorelease(v22);
  v25 = *(unsigned __int8 *)(objc_msgSend(v24, "bytes") + 1);
  if ((_DWORD)v25 == 1)
  {
    ATLLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_ERROR, "Legacy SEOS, punting", buf, 2u);
    }

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Legacy SEOS, punting"));
    v14 = (void *)v27;
    if (!a8)
      goto LABEL_33;
    v28 = *a8;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v30 = *MEMORY[0x1E0CB3388];
      v66[0] = *MEMORY[0x1E0CB2D50];
      v66[1] = v30;
      v67[0] = v27;
      v67[1] = v28;
      v31 = (void *)MEMORY[0x1E0C99D80];
      v32 = v67;
      v33 = v66;
      v34 = 2;
    }
    else
    {
      v68 = *MEMORY[0x1E0CB2D50];
      v69 = v27;
      v31 = (void *)MEMORY[0x1E0C99D80];
      v32 = &v69;
      v33 = &v68;
      v34 = 1;
    }
    objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v29;
    v42 = 2;
    goto LABEL_32;
  }
  if ((unint64_t)objc_msgSend(v24, "length") <= 9)
  {
    ATLLogObject();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v59 = objc_msgSend(v24, "length");
      _os_log_impl(&dword_1C3511000, v35, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid eventData length %u"), objc_msgSend(v24, "length"));
    v14 = (void *)v36;
    if (!a8)
      goto LABEL_33;
    v37 = *a8;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v38 = *MEMORY[0x1E0CB3388];
      v62[0] = *MEMORY[0x1E0CB2D50];
      v62[1] = v38;
      v63[0] = v36;
      v63[1] = v37;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v63;
      v20 = v62;
      goto LABEL_7;
    }
    v64 = *MEMORY[0x1E0CB2D50];
    v65 = v36;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v65;
    v20 = &v64;
LABEL_24:
    v21 = 1;
    goto LABEL_25;
  }
  if ((_DWORD)v23 == 1 && (_DWORD)v25 == 255)
  {
    +[SeosDecoder parseStartEvent:withApplet:error:](SeosDecoder, "parseStartEvent:withApplet:error:", v24, v11, a8);
    v39 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_DWORD)v23 != 2 || (_DWORD)v25 != 255)
    {
      ATLLogObject();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v59 = v23;
        v60 = 1024;
        v61 = v25;
        _os_log_impl(&dword_1C3511000, v45, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
      }

      v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid event type 0x%x version 0x%x"), v23, v25);
      v14 = (void *)v46;
      if (!a8)
        goto LABEL_33;
      v47 = *a8;
      v48 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v49 = *MEMORY[0x1E0CB3388];
        v54[0] = *MEMORY[0x1E0CB2D50];
        v54[1] = v49;
        v55[0] = v46;
        v55[1] = v47;
        v50 = (void *)MEMORY[0x1E0C99D80];
        v51 = v55;
        v52 = v54;
        v53 = 2;
      }
      else
      {
        v56 = *MEMORY[0x1E0CB2D50];
        v57 = v46;
        v50 = (void *)MEMORY[0x1E0C99D80];
        v51 = &v57;
        v52 = &v56;
        v53 = 1;
      }
      objc_msgSend(v50, "dictionaryWithObjects:forKeys:count:", v51, v52, v53);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v48;
      v42 = 3;
      goto LABEL_32;
    }
    +[SeosDecoder parseEndEvent:withApplet:error:](SeosDecoder, "parseEndEvent:withApplet:error:", v24, v11, a8);
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v39;
LABEL_34:

  return v43;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "SeosDecoder doesn't support GetState", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SeosDecoder doesn't support GetState"));
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v37[10];
  _QWORD v38[10];
  _QWORD v39[2];
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  int v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 10)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    if ((~*(_DWORD *)(v9 + 5) & 0xA580) == 0)
    {
      v37[0] = CFSTR("EventType");
      v37[1] = CFSTR("appletIdentifier");
      v38[0] = CFSTR("StartEvent");
      v38[1] = v8;
      v37[2] = CFSTR("Version");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + 1));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v10;
      v37[3] = CFSTR("command");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)(v9 + 5)));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v11;
      v37[4] = CFSTR("selectStatus");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v12;
      v37[5] = CFSTR("spIdentifier");
      +[SeosDecoder resolveServiceProvider:](SeosDecoder, "resolveServiceProvider:", *(unsigned __int8 *)(v9 + 9));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[6] = CFSTR("IgnoreRFEvents");
      v37[7] = CFSTR("DontWaitForEOT");
      v38[5] = v13;
      v38[6] = MEMORY[0x1E0C9AAB0];
      v38[7] = MEMORY[0x1E0C9AAB0];
      v38[8] = MEMORY[0x1E0C9AAA0];
      v37[8] = CFSTR("RequiresPowerCycle");
      v37[9] = CFSTR("DelayExpressReentry");
      v38[9] = &unk_1E7D9B310;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
      goto LABEL_21;
    }
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_DWORD *)(v9 + 5);
      *(_DWORD *)buf = 67109376;
      v44 = v25;
      v45 = 1024;
      v46 = 42368;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Unexpected cmd of StartEvent %u (exp) %u", buf, 0xEu);
    }

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected cmd of StartEvent %u (exp) %u"), *(unsigned int *)(v9 + 5), 42368);
    v10 = (void *)v26;
    if (a5)
    {
      v27 = *a5;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v29 = *MEMORY[0x1E0CB3388];
        v39[0] = *MEMORY[0x1E0CB2D50];
        v39[1] = v29;
        v40[0] = v26;
        v40[1] = v27;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = v40;
        v32 = v39;
        v33 = 2;
      }
      else
      {
        v41 = *MEMORY[0x1E0CB2D50];
        v42 = v26;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v42;
        v32 = &v41;
        v33 = 1;
      }
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v33);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v28;
      v35 = 3;
LABEL_19:
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v35, v11);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  else
  {
    ATLLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v44 = objc_msgSend(v7, "length");
      _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid eventData length %u"), objc_msgSend(v7, "length"));
    v10 = (void *)v16;
    if (a5)
    {
      v17 = *a5;
      v18 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v19 = *MEMORY[0x1E0CB3388];
        v47[0] = *MEMORY[0x1E0CB2D50];
        v47[1] = v19;
        v48[0] = v16;
        v48[1] = v17;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = v48;
        v22 = v47;
        v23 = 2;
      }
      else
      {
        v49 = *MEMORY[0x1E0CB2D50];
        v50[0] = v16;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = v50;
        v22 = &v49;
        v23 = 1;
      }
      objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v18;
      v35 = 6;
      goto LABEL_19;
    }
  }
  v14 = 0;
LABEL_21:

  return v14;
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
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  _BOOL4 v66;
  _BOOL8 v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  _QWORD v76[2];
  _QWORD v77[11];
  _QWORD v78[11];
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  void *v82;
  _QWORD v83[2];
  _QWORD v84[2];
  uint64_t v85;
  uint64_t v86;
  uint8_t v87[4];
  int v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  uint8_t v93[8];
  _QWORD v94[3];
  uint8_t buf[24];
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
  _QWORD v107[4];

  v107[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "length") > 0x30)
  {
    v18 = objc_retainAutorelease(v7);
    v19 = objc_msgSend(v18, "bytes");
    v20 = v19;
    v21 = *(unsigned __int16 *)(v19 + 40);
    if (v21 == 1 || v21 == 0x4000)
    {
      if ((*(unsigned __int16 *)(v19 + 42) | 0x2000) == 0x2002)
      {
        objc_msgSend(v18, "subdataWithRange:", 49, objc_msgSend(v18, "length") - 49);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = objc_msgSend(v11, "bytes");
        v76[1] = objc_msgSend(v11, "length");
        memset(buf, 0, sizeof(buf));
        v22 = DERDecodeItemCtx((uint64_t)v76, (unint64_t *)buf);
        if ((_DWORD)v22 || *(_QWORD *)buf != 0xE000000000000001)
        {
          ATLLogObject();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v93 = 67109376;
            *(_DWORD *)&v93[4] = v22;
            LOWORD(v94[0]) = 2048;
            *(_QWORD *)((char *)v94 + 2) = *(_QWORD *)buf;
            _os_log_impl(&dword_1C3511000, v46, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v93, 0x12u);
          }

          v47 = objc_alloc(MEMORY[0x1E0CB3940]);
          v48 = objc_msgSend(v47, "initWithFormat:", CFSTR("Failed to decode E1 tag %d or wrong tag 0x%llx"), v22, *(_QWORD *)buf);
          v49 = (void *)v48;
          if (a5)
          {
            v50 = *a5;
            v51 = (void *)MEMORY[0x1E0CB35C8];
            if (*a5)
            {
              v52 = *MEMORY[0x1E0CB3388];
              v89[0] = *MEMORY[0x1E0CB2D50];
              v89[1] = v52;
              v90[0] = v48;
              v90[1] = v50;
              v53 = (void *)MEMORY[0x1E0C99D80];
              v54 = v90;
              v55 = v89;
              v56 = 2;
            }
            else
            {
              v91 = *MEMORY[0x1E0CB2D50];
              v92 = v48;
              v53 = (void *)MEMORY[0x1E0C99D80];
              v54 = &v92;
              v55 = &v91;
              v56 = 1;
            }
            objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, v56);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v61);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_42;
        }
        *(_QWORD *)v93 = 0;
        v94[0] = 0;
        v23 = DERParseSequenceSpec((uint64_t)&buf[8], (uint64_t)&seosE1TLVSpec, (char *)v93, 0x10uLL);
        if ((_DWORD)v23)
        {
          v24 = v23;
          ATLLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v87 = 67109120;
            v88 = v24;
            _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v87, 8u);
          }

          v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E1 contents %d"), v24);
          v27 = (void *)v26;
          if (!a5)
          {
            v58 = 0;
LABEL_61:

            goto LABEL_43;
          }
          v28 = *a5;
          v29 = (void *)MEMORY[0x1E0CB35C8];
          if (*a5)
          {
            v30 = *MEMORY[0x1E0CB3388];
            v83[0] = *MEMORY[0x1E0CB2D50];
            v83[1] = v30;
            v84[0] = v26;
            v84[1] = v28;
            v31 = (void *)MEMORY[0x1E0C99D80];
            v32 = v84;
            v33 = v83;
            v34 = 2;
          }
          else
          {
            v85 = *MEMORY[0x1E0CB2D50];
            v86 = v26;
            v31 = (void *)MEMORY[0x1E0C99D80];
            v32 = &v86;
            v33 = &v85;
            v34 = 1;
          }
          objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v62);
          v58 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v94[0])
          {
            +[SeosDecoder resolveServiceProvider:](SeosDecoder, "resolveServiceProvider:", **(_BYTE **)v93);
            v57 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v57 = CFSTR("ABSENT");
          }
          v75 = v57;
          v80 = v57;
          v81 = CFSTR("State");
          v79 = CFSTR("SP");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = *(unsigned __int16 *)(v20 + 42) == 2;
          v66 = *(_WORD *)(v20 + 40) == 0x4000 && *(_WORD *)(v20 + 2) == 144;
          v77[0] = CFSTR("EventType");
          v77[1] = CFSTR("appletIdentifier");
          v78[0] = CFSTR("EndEvent");
          v78[1] = v8;
          v77[2] = CFSTR("Version");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v20 + 1));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = !v66 || !v64;
          v78[2] = v74;
          v77[3] = CFSTR("didError");
          if (v66 && v64)
            v68 = 64;
          else
            v68 = 256;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v78[3] = v69;
          v77[4] = CFSTR("command");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(*(_DWORD *)(v20 + 4)));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v78[4] = v70;
          v77[5] = CFSTR("status");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v20 + 2)) >> 16);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v78[5] = v71;
          v77[6] = CFSTR("result");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v68);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v78[6] = v72;
          v77[7] = CFSTR("informative");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v20 + 42)) >> 16);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v78[7] = v73;
          v78[8] = &unk_1E7D9B328;
          v77[8] = CFSTR("type");
          v77[9] = CFSTR("tlv");
          v77[10] = CFSTR("parsedInfo");
          v78[9] = v11;
          v78[10] = v62;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 11);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = (void *)v75;
        }

        goto LABEL_61;
      }
      ATLLogObject();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = *(unsigned __int16 *)(v20 + 42);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v41;
        _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "Unexpected Informative %d", buf, 8u);
      }

      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected Informative %d"), *(unsigned __int16 *)(v20 + 42));
      v11 = (void *)v42;
      if (!a5)
        goto LABEL_42;
      v43 = *a5;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v44 = *MEMORY[0x1E0CB3388];
        v96[0] = *MEMORY[0x1E0CB2D50];
        v96[1] = v44;
        v97[0] = v42;
        v97[1] = v43;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v97;
        v17 = v96;
        goto LABEL_29;
      }
      v98 = *MEMORY[0x1E0CB2D50];
      v99 = v42;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v99;
      v17 = &v98;
    }
    else
    {
      ATLLogObject();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = *(unsigned __int16 *)(v20 + 40);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v36;
        _os_log_impl(&dword_1C3511000, v35, OS_LOG_TYPE_ERROR, "Unexpected Transaction Status %d", buf, 8u);
      }

      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected Transaction Status %d"), *(unsigned __int16 *)(v20 + 40));
      v11 = (void *)v37;
      if (!a5)
        goto LABEL_42;
      v38 = *a5;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v39 = *MEMORY[0x1E0CB3388];
        v100[0] = *MEMORY[0x1E0CB2D50];
        v100[1] = v39;
        v101[0] = v37;
        v101[1] = v38;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v101;
        v17 = v100;
        goto LABEL_29;
      }
      v102 = *MEMORY[0x1E0CB2D50];
      v103 = v37;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v103;
      v17 = &v102;
    }
LABEL_40:
    v45 = 1;
    goto LABEL_41;
  }
  ATLLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v7, "length");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 49;
    _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "End event length %zu (exp) %zu", buf, 0x16u);
  }

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu (exp) %zu"), objc_msgSend(v7, "length"), 49);
  v11 = (void *)v10;
  if (!a5)
    goto LABEL_42;
  v12 = *a5;
  v13 = (void *)MEMORY[0x1E0CB35C8];
  if (!*a5)
  {
    v106 = *MEMORY[0x1E0CB2D50];
    v107[0] = v10;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v107;
    v17 = &v106;
    goto LABEL_40;
  }
  v14 = *MEMORY[0x1E0CB3388];
  v104[0] = *MEMORY[0x1E0CB2D50];
  v104[1] = v14;
  v105[0] = v10;
  v105[1] = v12;
  v15 = (void *)MEMORY[0x1E0C99D80];
  v16 = v105;
  v17 = v104;
LABEL_29:
  v45 = 2;
LABEL_41:
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v45);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v59);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_42:
  v58 = 0;
LABEL_43:

  return v58;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Supported");
  v8[1] = CFSTR("DelayExpressReentry");
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = &unk_1E7D9B310;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "SEOS decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SEOS decoder doesn't expect processEndOfTransaction"));
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

+ (id)resolveServiceProvider:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = &unk_1E7D9B340;
  v11[0] = CFSTR("HID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

@end
