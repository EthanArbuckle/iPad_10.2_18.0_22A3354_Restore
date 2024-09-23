@implementation SlalomDecoder

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SlalomDecoder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance__singleton_0;
}

void __31__SlalomDecoder_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__singleton_0;
  sharedInstance__singleton_0 = (uint64_t)v1;

}

- (SlalomDecoder)init
{
  SlalomDecoder *v2;
  NSMutableArray *v3;
  NSMutableArray *hciArray;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SlalomDecoder;
  v2 = -[SlalomDecoder init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hciArray = v2->_hciArray;
    v2->_hciArray = v3;

    v2->_eotInProgress = 0;
    if ((+[AppletTranslator isInternalBuild]() & 1) != 0)
    {
      +[AppletTranslator userDefaults]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_debug = objc_msgSend(v5, "BOOLForKey:", CFSTR("debug.slalom"));

    }
    else
    {
      v2->_debug = 0;
    }
    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v2);
  }
  return v2;
}

- (void)cleanup
{
  NSNumber *serviceProvider;

  -[NSMutableArray removeAllObjects](self->_hciArray, "removeAllObjects");
  self->_eotInProgress = 0;
  serviceProvider = self->_serviceProvider;
  self->_serviceProvider = 0;

}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  _BYTE v66[10];
  id v67;
  __int16 v68;
  id v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (self->_eotInProgress)
    goto LABEL_28;
  if ((unint64_t)objc_msgSend(v14, "length") > 1)
  {
    v29 = objc_retainAutorelease(v14);
    v30 = *(unsigned __int8 *)objc_msgSend(v29, "bytes");
    v31 = objc_retainAutorelease(v29);
    v32 = *(unsigned __int8 *)(objc_msgSend(v31, "bytes") + 1);
    if ((_DWORD)v30 == 16 && (_DWORD)v32 == 1)
    {
      ATLLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v66 = v15;
        *(_WORD *)&v66[8] = 2112;
        v67 = v16;
        v68 = 2112;
        v69 = v17;
        _os_log_impl(&dword_1C3511000, v33, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
      }

      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No suitable decoder for AID %@ PID %@ MID %@"), v15, v16, v17);
      v21 = (void *)v34;
      if (!a8)
        goto LABEL_27;
      v35 = *a8;
      v36 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v37 = *MEMORY[0x1E0CB3388];
        v61[0] = *MEMORY[0x1E0CB2D50];
        v61[1] = v37;
        v62[0] = v34;
        v62[1] = v35;
        v38 = (void *)MEMORY[0x1E0C99D80];
        v39 = v62;
        v40 = v61;
        v41 = 2;
      }
      else
      {
        v63 = *MEMORY[0x1E0CB2D50];
        v64 = v34;
        v38 = (void *)MEMORY[0x1E0C99D80];
        v39 = &v64;
        v40 = &v63;
        v41 = 1;
      }
      objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v36;
      v45 = 2;
      goto LABEL_26;
    }
    if ((int)v30 > 16)
    {
      if ((_DWORD)v30 == 17)
      {
        -[SlalomDecoder parseTransactionEvent:withApplet:error:](self, "parseTransactionEvent:withApplet:error:", v31, v15, a8);
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      if ((_DWORD)v30 == 18)
      {
        -[SlalomDecoder parseDeselectEvent:withApplet:error:](self, "parseDeselectEvent:withApplet:error:", v31, v15, a8);
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
    }
    else
    {
      if ((_DWORD)v30 == 1)
      {
        -[SlalomDecoder parseStartEvent:withApplet:error:](self, "parseStartEvent:withApplet:error:", v31, v15, a8);
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      if ((_DWORD)v30 == 2)
      {
        -[SlalomDecoder parseEndEvent:withApplet:withTransceiver:error:](self, "parseEndEvent:withApplet:withTransceiver:error:", v31, v15, v18, a8);
        v42 = objc_claimAutoreleasedReturnValue();
LABEL_32:
        v46 = (void *)v42;
        goto LABEL_29;
      }
    }
    ATLLogObject();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v66 = v30;
      *(_WORD *)&v66[4] = 1024;
      *(_DWORD *)&v66[6] = v32;
      _os_log_impl(&dword_1C3511000, v48, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
    }

    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid event type 0x%x version 0x%x"), v30, v32);
    v21 = (void *)v49;
    if (!a8)
      goto LABEL_27;
    v50 = *a8;
    v51 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v52 = *MEMORY[0x1E0CB3388];
      v57[0] = *MEMORY[0x1E0CB2D50];
      v57[1] = v52;
      v58[0] = v49;
      v58[1] = v50;
      v53 = (void *)MEMORY[0x1E0C99D80];
      v54 = v58;
      v55 = v57;
      v56 = 2;
    }
    else
    {
      v59 = *MEMORY[0x1E0CB2D50];
      v60 = v49;
      v53 = (void *)MEMORY[0x1E0C99D80];
      v54 = &v60;
      v55 = &v59;
      v56 = 1;
    }
    objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, v56);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v51;
    v45 = 3;
    goto LABEL_26;
  }
  ATLLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v66 = objc_msgSend(v14, "length");
    _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
  }

  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Short eventData? %u"), objc_msgSend(v14, "length"));
  v21 = (void *)v20;
  if (!a8)
    goto LABEL_27;
  v22 = *a8;
  v23 = (void *)MEMORY[0x1E0CB35C8];
  if (*a8)
  {
    v24 = *MEMORY[0x1E0CB3388];
    v70[0] = *MEMORY[0x1E0CB2D50];
    v70[1] = v24;
    v71[0] = v20;
    v71[1] = v22;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = v71;
    v27 = v70;
    v28 = 2;
  }
  else
  {
    v72 = *MEMORY[0x1E0CB2D50];
    v73[0] = v20;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = v73;
    v27 = &v72;
    v28 = 1;
  }
  objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v23;
  v45 = 6;
LABEL_26:
  objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v45, v43);
  *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
LABEL_28:
  v46 = 0;
LABEL_29:

  return v46;
}

- (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  void *v46;
  uint8_t buf[4];
  void *v48;
  _QWORD v49[9];
  _QWORD v50[9];
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[22];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") == 22)
  {
    v10 = objc_retainAutorelease(v8);
    v11 = objc_msgSend(v10, "bytes");
    if (*(_BYTE *)(v11 + 1) == 7)
    {
      v55[0] = &unk_1E7D9ADB8;
      v55[1] = &unk_1E7D9ADD0;
      v56[0] = CFSTR("Contact");
      v56[1] = CFSTR("Contactless");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v11 + 2));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        *(_QWORD *)v65 = v11 + 3;
        *(_QWORD *)&v65[8] = objc_msgSend(v10, "length") - 3;
        v15 = -[SlalomDecoder DecodeStartE1TLV:error:](self, "DecodeStartE1TLV:error:", v65, a5);
        v49[0] = CFSTR("EventType");
        v49[1] = CFSTR("appletIdentifier");
        v50[0] = CFSTR("StartEvent");
        v50[1] = v9;
        v49[2] = CFSTR("Version");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v11 + 1));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v50[2] = v16;
        v50[3] = v14;
        v49[3] = CFSTR("Interface");
        v49[4] = CFSTR("IgnoreRFEvents");
        v50[4] = MEMORY[0x1E0C9AAA0];
        v50[5] = MEMORY[0x1E0C9AAB0];
        v49[5] = CFSTR("DontWaitForEOT");
        v49[6] = CFSTR("RequiresPowerCycle");
        v50[6] = MEMORY[0x1E0C9AAB0];
        v50[7] = MEMORY[0x1E0C9AAB0];
        v49[7] = CFSTR("EoTCallbackExpected");
        v49[8] = CFSTR("DelayExpressReentry");
        v50[8] = &unk_1E7D9ADE8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        ATLLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v17;
          _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_hciArray, "addObject:", v19);

      }
      else
      {
        ATLLogObject();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = *(unsigned __int8 *)(v11 + 2);
          *(_DWORD *)v65 = 67109120;
          *(_DWORD *)&v65[4] = v35;
          _os_log_impl(&dword_1C3511000, v34, OS_LOG_TYPE_ERROR, "Unknown interface type %u", v65, 8u);
        }

        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown interface type %u"), *(unsigned __int8 *)(v11 + 2));
        v37 = (void *)v36;
        if (a5)
        {
          v38 = *a5;
          v39 = (void *)MEMORY[0x1E0CB35C8];
          if (*a5)
          {
            v40 = *MEMORY[0x1E0CB3388];
            v51[0] = *MEMORY[0x1E0CB2D50];
            v51[1] = v40;
            v52[0] = v36;
            v52[1] = v38;
            v41 = (void *)MEMORY[0x1E0C99D80];
            v42 = v52;
            v43 = v51;
            v44 = 2;
          }
          else
          {
            v53 = *MEMORY[0x1E0CB2D50];
            v54 = v36;
            v41 = (void *)MEMORY[0x1E0C99D80];
            v42 = &v54;
            v43 = &v53;
            v44 = 1;
          }
          objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v46);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      goto LABEL_27;
    }
    ATLLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *(unsigned __int8 *)(v11 + 1);
      *(_DWORD *)v65 = 67109120;
      *(_DWORD *)&v65[4] = v29;
      _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "Start Event version %u", v65, 8u);
    }

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start Event version %u"), *(unsigned __int8 *)(v11 + 1));
    v12 = (void *)v30;
    if (a5)
    {
      v31 = *a5;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v32 = *MEMORY[0x1E0CB3388];
        v57[0] = *MEMORY[0x1E0CB2D50];
        v57[1] = v32;
        v58[0] = v30;
        v58[1] = v31;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v58;
        v27 = v57;
        goto LABEL_17;
      }
      v59 = *MEMORY[0x1E0CB2D50];
      v60 = v30;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v60;
      v27 = &v59;
      goto LABEL_25;
    }
  }
  else
  {
    ATLLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 134218240;
      *(_QWORD *)&v65[4] = objc_msgSend(v8, "length");
      *(_WORD *)&v65[12] = 2048;
      *(_QWORD *)&v65[14] = 22;
      _os_log_impl(&dword_1C3511000, v20, OS_LOG_TYPE_ERROR, "Start Event length %zu (exp %zu)", v65, 0x16u);
    }

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start Event length %zu (exp %zu)"), objc_msgSend(v8, "length"), 22);
    v12 = (void *)v21;
    if (a5)
    {
      v22 = *a5;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v61[0] = *MEMORY[0x1E0CB2D50];
        v61[1] = v24;
        v62[0] = v21;
        v62[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v62;
        v27 = v61;
LABEL_17:
        v33 = 2;
LABEL_26:
        objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v33);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v14);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

        goto LABEL_28;
      }
      v63 = *MEMORY[0x1E0CB2D50];
      v64 = v21;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v64;
      v27 = &v63;
LABEL_25:
      v33 = 1;
      goto LABEL_26;
    }
  }
LABEL_28:

  return 0;
}

- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withTransceiver:(id)a5 error:(id *)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  _BYTE v36[10];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "length") != 2)
  {
    ATLLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v36 = objc_msgSend(v7, "length");
      *(_WORD *)&v36[8] = 2048;
      v37 = 2;
      _os_log_impl(&dword_1C3511000, v20, OS_LOG_TYPE_ERROR, "End Event length %zu (exp %zu)", buf, 0x16u);
    }

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End Event length %zu (exp %zu)"), objc_msgSend(v7, "length"), 2);
    v13 = (void *)v21;
    if (!a6)
      goto LABEL_18;
    v22 = *a6;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v23 = *MEMORY[0x1E0CB3388];
      v31[0] = *MEMORY[0x1E0CB2D50];
      v31[1] = v23;
      v32[0] = v21;
      v32[1] = v22;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v32;
      v19 = v31;
      goto LABEL_13;
    }
    v33 = *MEMORY[0x1E0CB2D50];
    v34 = v21;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v34;
    v19 = &v33;
LABEL_16:
    v24 = 1;
    goto LABEL_17;
  }
  v8 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
  if (*(_BYTE *)(v8 + 1) != 7)
  {
    v9 = v8;
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(unsigned __int8 *)(v9 + 1);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v36 = v11;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = 7;
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "End Event version %u (exp %u)", buf, 0xEu);
    }

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End Event version %u (exp %u)"), *(unsigned __int8 *)(v9 + 1), 7);
    v13 = (void *)v12;
    if (!a6)
      goto LABEL_18;
    v14 = *a6;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v27[0] = *MEMORY[0x1E0CB2D50];
      v27[1] = v16;
      v28[0] = v12;
      v28[1] = v14;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v28;
      v19 = v27;
LABEL_13:
      v24 = 2;
LABEL_17:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = v12;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v30;
    v19 = &v29;
    goto LABEL_16;
  }
LABEL_19:

  return 0;
}

- (id)parseDeselectEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t *v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[2];
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  _BYTE v59[10];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") == 3)
  {
    v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (*(_BYTE *)(v10 + 1) == 7)
    {
      v48[0] = &unk_1E7D9ADB8;
      v48[1] = &unk_1E7D9ADD0;
      v49[0] = CFSTR("Contact");
      v49[1] = CFSTR("Contactless");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 2));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v42[0] = CFSTR("EventType");
        v42[1] = CFSTR("appletIdentifier");
        v43[0] = CFSTR("DeselectEvent");
        v43[1] = v9;
        v42[2] = CFSTR("Interface");
        v43[2] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        ATLLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v59 = v14;
          _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        -[NSMutableArray addObject:](self->_hciArray, "addObject:", v14);
      }
      else
      {
        ATLLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = *(unsigned __int8 *)(v10 + 2);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v59 = v31;
          _os_log_impl(&dword_1C3511000, v30, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
        }

        v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown interface type %u"), *(unsigned __int8 *)(v10 + 2));
        v14 = (void *)v32;
        if (a5)
        {
          v33 = *a5;
          v34 = (void *)MEMORY[0x1E0CB35C8];
          if (*a5)
          {
            v35 = *MEMORY[0x1E0CB3388];
            v44[0] = *MEMORY[0x1E0CB2D50];
            v44[1] = v35;
            v45[0] = v32;
            v45[1] = v33;
            v36 = (void *)MEMORY[0x1E0C99D80];
            v37 = v45;
            v38 = v44;
            v39 = 2;
          }
          else
          {
            v46 = *MEMORY[0x1E0CB2D50];
            v47 = v32;
            v36 = (void *)MEMORY[0x1E0C99D80];
            v37 = &v47;
            v38 = &v46;
            v39 = 1;
          }
          objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v40);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

      goto LABEL_30;
    }
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(unsigned __int8 *)(v10 + 1);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v59 = v25;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = 1;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Deselect Event version  %u (exp %u)", buf, 0xEu);
    }

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Deselect Event version  %u (exp %u)"), *(unsigned __int8 *)(v10 + 1), 1);
    v11 = (void *)v26;
    if (a5)
    {
      v27 = *a5;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v28 = *MEMORY[0x1E0CB3388];
        v50[0] = *MEMORY[0x1E0CB2D50];
        v50[1] = v28;
        v51[0] = v26;
        v51[1] = v27;
        v21 = (void *)MEMORY[0x1E0C99D80];
        v22 = v51;
        v23 = v50;
        goto LABEL_17;
      }
      v52 = *MEMORY[0x1E0CB2D50];
      v53 = v26;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v53;
      v23 = &v52;
      goto LABEL_25;
    }
  }
  else
  {
    ATLLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v59 = objc_msgSend(v8, "length");
      *(_WORD *)&v59[8] = 2048;
      v60 = 3;
      _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_ERROR, "Deselect Event length %zu (exp %zu)", buf, 0x16u);
    }

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Deselect Event length %zu (exp %zu)"), objc_msgSend(v8, "length"), 3);
    v11 = (void *)v17;
    if (a5)
    {
      v18 = *a5;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v20 = *MEMORY[0x1E0CB3388];
        v54[0] = *MEMORY[0x1E0CB2D50];
        v54[1] = v20;
        v55[0] = v17;
        v55[1] = v18;
        v21 = (void *)MEMORY[0x1E0C99D80];
        v22 = v55;
        v23 = v54;
LABEL_17:
        v29 = 2;
LABEL_26:
        objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v13);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
      v56 = *MEMORY[0x1E0CB2D50];
      v57 = v17;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v57;
      v23 = &v56;
LABEL_25:
      v29 = 1;
      goto LABEL_26;
    }
  }
LABEL_31:

  return 0;
}

- (id)parseTransactionEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  __CFString *v34;
  int v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[10];
  _QWORD v68[10];
  uint8_t v69[4];
  uint64_t v70;
  _BYTE v71[128];
  _QWORD v72[7];
  _QWORD v73[7];
  _QWORD v74[2];
  _QWORD v75[2];
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[2];
  _QWORD v85[2];
  uint64_t v86;
  uint64_t v87;
  _BYTE buf[22];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "length") > 2)
  {
    v19 = objc_retainAutorelease(v8);
    v20 = objc_msgSend(v19, "bytes");
    v21 = v20;
    if (*(_BYTE *)(v20 + 1) != 7)
    {
      ATLLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = *(unsigned __int8 *)(v21 + 1);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v37;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = 7;
        _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_ERROR, "Transaction Event version %u (exp %u)", buf, 0xEu);
      }

      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Transaction Event version %u (exp %u)"), *(unsigned __int8 *)(v21 + 1), 7);
      v12 = (void *)v38;
      if (!a5)
        goto LABEL_45;
      v39 = *a5;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v40 = *MEMORY[0x1E0CB3388];
        v80[0] = *MEMORY[0x1E0CB2D50];
        v80[1] = v40;
        v81[0] = v38;
        v81[1] = v39;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v81;
        v18 = v80;
        goto LABEL_27;
      }
      v82 = *MEMORY[0x1E0CB2D50];
      v83 = v38;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v83;
      v18 = &v82;
LABEL_43:
      v41 = 1;
      goto LABEL_44;
    }
    *(_QWORD *)buf = v20 + 3;
    *(_QWORD *)&buf[8] = objc_msgSend(v19, "length") - 3;
    -[SlalomDecoder DecodeTransactionE1TLV:error:](self, "DecodeTransactionE1TLV:error:", buf, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = &unk_1E7D9ADB8;
    v78[1] = &unk_1E7D9ADD0;
    v79[0] = CFSTR("Contact");
    v79[1] = CFSTR("Contactless");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v21 + 2));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v72[0] = CFSTR("EventType");
      v72[1] = CFSTR("appletIdentifier");
      v73[0] = CFSTR("TransactionEvent");
      v73[1] = v9;
      v72[2] = CFSTR("Version");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v21 + 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v73[2] = v26;
      v73[3] = v25;
      v61 = v25;
      v72[3] = CFSTR("Interface");
      v72[4] = CFSTR("type");
      v73[4] = &unk_1E7D9AE00;
      v72[5] = CFSTR("tlv");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", buf);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v73[5] = v27;
      v72[6] = CFSTR("parsedInfo");
      v28 = v22;
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v73[6] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 7);
      v60 = objc_claimAutoreleasedReturnValue();
      if (!v22)

      v62 = v23;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v29 = self->_hciArray;
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v30)
      {
        v31 = v30;
        v58 = v22;
        v59 = v9;
        v32 = *(_QWORD *)v64;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v64 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("EventType"));
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v34 == CFSTR("TransactionEvent"))
            {
              v35 = 0;
              goto LABEL_30;
            }
          }
          v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
          if (v31)
            continue;
          break;
        }
        v35 = 1;
LABEL_30:
        v22 = v58;
        v9 = v59;
      }
      else
      {
        v35 = 1;
      }

      v45 = (void *)v60;
      -[NSMutableArray addObject:](self->_hciArray, "addObject:", v60);
      ATLLogObject();
      v53 = objc_claimAutoreleasedReturnValue();
      v25 = v61;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v69 = 138412290;
        v70 = v60;
        _os_log_impl(&dword_1C3511000, v53, OS_LOG_TYPE_DEBUG, "%@", v69, 0xCu);
      }

      if (v35)
      {
        v67[0] = CFSTR("EventType");
        v67[1] = CFSTR("paymentMode");
        v68[0] = CFSTR("StartEvent");
        v68[1] = &unk_1E7D9AE18;
        v67[2] = CFSTR("appletIdentifier");
        v67[3] = CFSTR("Interface");
        v68[2] = v9;
        v68[3] = v61;
        v67[4] = CFSTR("Version");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v21 + 1));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v68[4] = v54;
        v68[5] = MEMORY[0x1E0C9AAA0];
        v67[5] = CFSTR("IgnoreRFEvents");
        v67[6] = CFSTR("DontWaitForEOT");
        v68[6] = MEMORY[0x1E0C9AAB0];
        v68[7] = MEMORY[0x1E0C9AAB0];
        v67[7] = CFSTR("RequiresPowerCycle");
        v67[8] = CFSTR("EoTCallbackExpected");
        v67[9] = CFSTR("DelayExpressReentry");
        v68[8] = MEMORY[0x1E0C9AAB0];
        v68[9] = &unk_1E7D9ADE8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 10);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v62;
LABEL_49:

        goto LABEL_50;
      }
      v55 = 0;
      v23 = v62;
    }
    else
    {
      ATLLogObject();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = *(unsigned __int8 *)(v21 + 2);
        *(_DWORD *)v69 = 67109120;
        LODWORD(v70) = v43;
        _os_log_impl(&dword_1C3511000, v42, OS_LOG_TYPE_ERROR, "Unknown interface type %u", v69, 8u);
      }

      v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown interface type %u"), *(unsigned __int8 *)(v21 + 2));
      v45 = (void *)v44;
      if (a5)
      {
        v46 = *a5;
        v47 = (void *)MEMORY[0x1E0CB35C8];
        if (*a5)
        {
          v48 = *MEMORY[0x1E0CB3388];
          v74[0] = *MEMORY[0x1E0CB2D50];
          v74[1] = v48;
          v75[0] = v44;
          v75[1] = v46;
          v49 = (void *)MEMORY[0x1E0C99D80];
          v50 = v75;
          v51 = v74;
          v52 = 2;
        }
        else
        {
          v76 = *MEMORY[0x1E0CB2D50];
          v77 = v44;
          v49 = (void *)MEMORY[0x1E0C99D80];
          v50 = &v77;
          v51 = &v76;
          v52 = 1;
        }
        objc_msgSend(v49, "dictionaryWithObjects:forKeys:count:", v50, v51, v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v54);
        v55 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      }
      v55 = 0;
    }
LABEL_50:

    goto LABEL_51;
  }
  ATLLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v8, "length");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 3;
    _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "Transaction Event length %zu (at least %zu)", buf, 0x16u);
  }

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Transaction Event length %zu (at least %zu)"), objc_msgSend(v8, "length"), 3);
  v12 = (void *)v11;
  if (!a5)
    goto LABEL_45;
  v13 = *a5;
  v14 = (void *)MEMORY[0x1E0CB35C8];
  if (!*a5)
  {
    v86 = *MEMORY[0x1E0CB2D50];
    v87 = v11;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v87;
    v18 = &v86;
    goto LABEL_43;
  }
  v15 = *MEMORY[0x1E0CB3388];
  v84[0] = *MEMORY[0x1E0CB2D50];
  v84[1] = v15;
  v85[0] = v11;
  v85[1] = v13;
  v16 = (void *)MEMORY[0x1E0C99D80];
  v17 = v85;
  v18 = v84;
LABEL_27:
  v41 = 2;
LABEL_44:
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v41);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v56);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_45:
  v55 = 0;
LABEL_51:

  return v55;
}

- (id)DecodeTransactionE1TLV:(id *)a3 error:(id *)a4
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
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  SlalomWriteOperation *v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t *v58;
  uint64_t *v59;
  NSObject *v60;
  uint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[2];
  _QWORD v92[2];
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[2];
  _QWORD v96[2];
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[2];
  _QWORD v100[2];
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[2];
  _QWORD v104[2];
  uint64_t v105;
  uint64_t v106;
  uint8_t buf[4];
  unint64_t v108;
  _QWORD v109[2];
  _QWORD v110[2];
  uint64_t v111;
  _QWORD v112[4];

  v112[1] = *MEMORY[0x1E0C80C00];
  v82 = 0;
  v83 = 0;
  v84 = 0;
  v6 = DERDecodeItemCtx((uint64_t)a3, &v82);
  if ((_DWORD)v6)
  {
    v7 = v6;
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v108) = v7;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event E1 %d", buf, 8u);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Transaction Event E1 %d"), v7);
    v10 = (void *)v9;
    if (a4)
    {
      v11 = *a4;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v13 = *MEMORY[0x1E0CB3388];
        v109[0] = *MEMORY[0x1E0CB2D50];
        v109[1] = v13;
        v110[0] = v9;
        v110[1] = v11;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v110;
        v16 = v109;
        v17 = 2;
      }
      else
      {
        v111 = *MEMORY[0x1E0CB2D50];
        v112[0] = v9;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v112;
        v16 = &v111;
        v17 = 1;
      }
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v45);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_32:
    v33 = 0;
    return v33;
  }
  if (v82 != 0xE000000000000001)
  {
    ATLLogObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v108 = v82;
      _os_log_impl(&dword_1C3511000, v34, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx", buf, 0xCu);
    }

    v35 = objc_alloc(MEMORY[0x1E0CB3940]);
    v80 = v82;
    v36 = objc_msgSend(v35, "initWithFormat:", CFSTR("Unexpected tag 0x%llx"));
    v37 = (void *)v36;
    if (a4)
    {
      v38 = *a4;
      v39 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v40 = *MEMORY[0x1E0CB3388];
        v103[0] = *MEMORY[0x1E0CB2D50];
        v103[1] = v40;
        v104[0] = v36;
        v104[1] = v38;
        v41 = (void *)MEMORY[0x1E0C99D80];
        v42 = v104;
        v43 = v103;
        v44 = 2;
      }
      else
      {
        v105 = *MEMORY[0x1E0CB2D50];
        v106 = v36;
        v41 = (void *)MEMORY[0x1E0C99D80];
        v42 = &v106;
        v43 = &v105;
        v44 = 1;
      }
      objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v46);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[SlalomDecoder DecodeTransactionE1TLV:error:]", 356, (uint64_t)a3->var0, a3->var1, CFSTR("E1 TLV data"), v47, v48, v80);
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v84;
  if ((int)v84 < 1)
  {
LABEL_20:
    v85[0] = CFSTR("OPRead");
    v85[1] = CFSTR("OPWrite");
    v32 = v81;
    v86[0] = v18;
    v86[1] = v81;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_64;
  }
  v20 = 0;
  v21 = v83;
  while (1)
  {
    if (v19 - v20 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      ATLLogObject();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v108 = (unint64_t)v50;
        _os_log_impl(&dword_1C3511000, v51, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event E1, length issue: %@", buf, 0xCu);
      }

      v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Transaction Event E1, length issue: %@"), v50);
      v53 = (void *)v52;
      if (!a4)
        goto LABEL_62;
      v54 = *a4;
      v55 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v56 = *MEMORY[0x1E0CB3388];
        v99[0] = *MEMORY[0x1E0CB2D50];
        v99[1] = v56;
        v100[0] = v52;
        v100[1] = v54;
        v57 = (void *)MEMORY[0x1E0C99D80];
        v58 = v100;
        v59 = v99;
        goto LABEL_54;
      }
      v101 = *MEMORY[0x1E0CB2D50];
      v102 = v52;
      v57 = (void *)MEMORY[0x1E0C99D80];
      v58 = &v102;
      v59 = &v101;
      goto LABEL_60;
    }
    v22 = (unsigned __int8 *)(v21 + v20);
    v23 = *v22;
    v24 = v20 + 2;
    if ((_DWORD)v23 != 194)
      break;
    if (v19 - (int)v24 <= 3)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      ATLLogObject();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v108 = (unint64_t)v50;
        _os_log_impl(&dword_1C3511000, v73, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event C2 tag, length issue: %@", buf, 0xCu);
      }

      v74 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Transaction Event C2 tag, length issue: %@"), v50);
      v53 = (void *)v74;
      if (!a4)
        goto LABEL_62;
      v75 = *a4;
      v55 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v76 = *MEMORY[0x1E0CB3388];
        v91[0] = *MEMORY[0x1E0CB2D50];
        v91[1] = v76;
        v92[0] = v74;
        v92[1] = v75;
        v57 = (void *)MEMORY[0x1E0C99D80];
        v58 = v92;
        v59 = v91;
LABEL_54:
        v77 = 2;
LABEL_61:
        objc_msgSend(v57, "dictionaryWithObjects:forKeys:count:", v58, v59, v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v79);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_62:
        goto LABEL_63;
      }
      v93 = *MEMORY[0x1E0CB2D50];
      v94 = v74;
      v57 = (void *)MEMORY[0x1E0C99D80];
      v58 = &v94;
      v59 = &v93;
LABEL_60:
      v77 = 1;
      goto LABEL_61;
    }
    v27 = v18;
    v28 = v22[1];
    v25 = objc_alloc_init(SlalomWriteOperation);
    v29 = *(unsigned __int16 *)(v24 + v21);
    v30 = *((unsigned __int16 *)v22 + 2);
    v31 = v20 + 6;
    -[SlalomWriteOperation setServiceCode:](v25, "setServiceCode:", v29);
    -[SlalomWriteOperation setBlockNumber:](v25, "setBlockNumber:", v30);
    if (v28 == 6)
    {
      -[SlalomWriteOperation setOffsets:](v25, "setOffsets:", bswap32(*(unsigned __int16 *)(v31 + v21)) >> 16);
      LODWORD(v31) = v20 + 8;
    }
    objc_msgSend(v81, "addObject:", v25);
    v20 = v31;
    v18 = v27;
LABEL_19:

    v19 = v84;
    if (v20 >= (int)v84)
      goto LABEL_20;
  }
  if ((_DWORD)v23 == 193)
  {
    if (v19 - (int)v24 <= 3)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      ATLLogObject();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v108 = (unint64_t)v50;
        _os_log_impl(&dword_1C3511000, v69, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event C1 tag, length issue: %@", buf, 0xCu);
      }

      v70 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Transaction Event C1 tag, length issue: %@"), v50);
      v53 = (void *)v70;
      if (!a4)
        goto LABEL_62;
      v71 = *a4;
      v55 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v72 = *MEMORY[0x1E0CB3388];
        v95[0] = *MEMORY[0x1E0CB2D50];
        v95[1] = v72;
        v96[0] = v70;
        v96[1] = v71;
        v57 = (void *)MEMORY[0x1E0C99D80];
        v58 = v96;
        v59 = v95;
        goto LABEL_54;
      }
      v97 = *MEMORY[0x1E0CB2D50];
      v98 = v70;
      v57 = (void *)MEMORY[0x1E0C99D80];
      v58 = &v98;
      v59 = &v97;
      goto LABEL_60;
    }
    v25 = objc_alloc_init(SlalomReadOperation);
    v26 = *(unsigned __int16 *)(v24 + v21);
    v20 += 6;
    -[SlalomWriteOperation setBlockNumber:](v25, "setBlockNumber:", *((unsigned __int16 *)v22 + 2));
    -[SlalomWriteOperation setServiceCode:](v25, "setServiceCode:", v26);
    objc_msgSend(v18, "addObject:", v25);
    goto LABEL_19;
  }
  ATLLogObject();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v108) = v23;
    _os_log_impl(&dword_1C3511000, v60, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event E1, tag received was not C0 or C1: %2X", buf, 8u);
  }

  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Transaction Event E1, tag received was not C0 or C1: %2X"), v23);
  v50 = (void *)v61;
  if (a4)
  {
    v62 = *a4;
    v63 = (void *)MEMORY[0x1E0CB35C8];
    if (*a4)
    {
      v64 = *MEMORY[0x1E0CB3388];
      v87[0] = *MEMORY[0x1E0CB2D50];
      v87[1] = v64;
      v88[0] = v61;
      v88[1] = v62;
      v65 = (void *)MEMORY[0x1E0C99D80];
      v66 = v88;
      v67 = v87;
      v68 = 2;
    }
    else
    {
      v89 = *MEMORY[0x1E0CB2D50];
      v90 = v61;
      v65 = (void *)MEMORY[0x1E0C99D80];
      v66 = &v90;
      v67 = &v89;
      v68 = 1;
    }
    objc_msgSend(v65, "dictionaryWithObjects:forKeys:count:", v66, v67, v68);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v78);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_63:

  v33 = 0;
  v32 = v81;
LABEL_64:

  return v33;
}

- (id)DecodeStartE1TLV:(id *)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSNumber *v45;
  NSNumber *serviceProvider;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void **v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  uint64_t v71;
  void *v72;
  uint8_t v73[4];
  void *v74;
  _QWORD v75[8];
  _QWORD v76[8];
  _QWORD v77[2];
  _QWORD v78[2];
  uint64_t v79;
  uint64_t v80;
  __int128 buf;
  __int128 v82;
  __int128 v83;
  _QWORD v84[2];
  _QWORD v85[2];
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[2];
  _QWORD v89[2];
  uint64_t v90;
  _QWORD v91[2];

  v91[1] = *MEMORY[0x1E0C80C00];
  v67 = 0;
  v68[0] = 0;
  v68[1] = 0;
  v7 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v67);
  if ((_DWORD)v7)
  {
    v8 = v7;
    ATLLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v8;
      _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "Failed to decode Start Event E1 %d", (uint8_t *)&buf, 8u);
    }

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Start Event E1 %d"), v8);
    v11 = (void *)v10;
    if (a4)
    {
      v12 = *a4;
      v13 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v14 = *MEMORY[0x1E0CB3388];
        v88[0] = *MEMORY[0x1E0CB2D50];
        v88[1] = v14;
        v89[0] = v10;
        v89[1] = v12;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v89;
        v17 = v88;
        v18 = 2;
      }
      else
      {
        v90 = *MEMORY[0x1E0CB2D50];
        v91[0] = v10;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v91;
        v17 = &v90;
        v18 = 1;
      }
      objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v41);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_39;
  }
  if (v67 == 0xE000000000000001)
  {
    v82 = 0u;
    v83 = 0u;
    buf = 0u;
    v19 = DERParseSequenceSpec((uint64_t)v68, (uint64_t)&startEventE1ContentSpec, (char *)&buf, 0x30uLL);
    if ((_DWORD)v19)
    {
      v20 = v19;
      ATLLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v73 = 67109120;
        LODWORD(v74) = v20;
        _os_log_impl(&dword_1C3511000, v21, OS_LOG_TYPE_ERROR, "Failed to decode Start Event E1 contents %d", v73, 8u);
      }

      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Start Event E1 contents %d"), v20);
      v11 = (void *)v22;
      if (!a4)
        goto LABEL_39;
      v23 = *a4;
      v24 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v25 = *MEMORY[0x1E0CB3388];
        v77[0] = *MEMORY[0x1E0CB2D50];
        v77[1] = v25;
        v78[0] = v22;
        v78[1] = v23;
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = v78;
        v28 = v77;
        v29 = 2;
      }
      else
      {
        v79 = *MEMORY[0x1E0CB2D50];
        v80 = v22;
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v80;
        v28 = &v79;
        v29 = 1;
      }
      objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v42);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = &unk_1E7D9ADD0;
    v75[1] = &unk_1E7D9AE30;
    v76[0] = CFSTR("Suica");
    v76[1] = CFSTR("QuicPay");
    v75[2] = &unk_1E7D9AE48;
    v75[3] = &unk_1E7D9AE60;
    v76[2] = CFSTR("iD");
    v76[3] = CFSTR("Octopus");
    v75[4] = &unk_1E7D9AE78;
    v75[5] = &unk_1E7D9AE90;
    v76[4] = CFSTR("Cross");
    v76[5] = CFSTR("Mogul");
    v75[6] = &unk_1E7D9AEA8;
    v75[7] = &unk_1E7D9AEC0;
    v76[6] = CFSTR("Gondola");
    v76[7] = CFSTR("Wildcat");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)&v83 + 1)
      && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)v83),
          v43 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v42, "objectForKeyedSubscript:", v43),
          v44 = (void *)objc_claimAutoreleasedReturnValue(),
          v43,
          v44))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)v83);
      v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      serviceProvider = self->_serviceProvider;
      self->_serviceProvider = v45;

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v44, CFSTR("SP"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)v83);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v47, CFSTR("SPRaw"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)buf);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v48, CFSTR("SystemCode"));

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (_QWORD)v82, 8);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "asHexString");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v50, CFSTR("IDm"));

    }
    else
    {
      ATLLogObject();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v83);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v73 = 138412290;
        v74 = v55;
        _os_log_impl(&dword_1C3511000, v54, OS_LOG_TYPE_ERROR, "Unknown SP identifier %@", v73, 0xCu);

      }
      v56 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v83);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v56, "initWithFormat:", CFSTR("Unknown SP identifier %@"), v57);

      if (!a4)
        goto LABEL_37;
      v58 = *a4;
      v59 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v60 = *MEMORY[0x1E0CB3388];
        v69[0] = *MEMORY[0x1E0CB2D50];
        v69[1] = v60;
        v70[0] = v44;
        v70[1] = v58;
        v61 = (void *)MEMORY[0x1E0C99D80];
        v62 = (void **)v70;
        v63 = v69;
        v64 = 2;
      }
      else
      {
        v71 = *MEMORY[0x1E0CB2D50];
        v72 = v44;
        v61 = (void *)MEMORY[0x1E0C99D80];
        v62 = &v72;
        v63 = &v71;
        v64 = 1;
      }
      objc_msgSend(v61, "dictionaryWithObjects:forKeys:count:", v62, v63, v64);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v49);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_37:
LABEL_38:

LABEL_39:
    return 0;
  }
  ATLLogObject();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v67;
    _os_log_impl(&dword_1C3511000, v30, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx", (uint8_t *)&buf, 0xCu);
  }

  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  v66 = v67;
  v32 = objc_msgSend(v31, "initWithFormat:", CFSTR("Unexpected tag 0x%llx"));
  v33 = (void *)v32;
  if (a4)
  {
    v34 = *a4;
    v35 = (void *)MEMORY[0x1E0CB35C8];
    if (*a4)
    {
      v36 = *MEMORY[0x1E0CB3388];
      v84[0] = *MEMORY[0x1E0CB2D50];
      v84[1] = v36;
      v85[0] = v32;
      v85[1] = v34;
      v37 = (void *)MEMORY[0x1E0C99D80];
      v38 = v85;
      v39 = v84;
      v40 = 2;
    }
    else
    {
      v86 = *MEMORY[0x1E0CB2D50];
      v87 = v32;
      v37 = (void *)MEMORY[0x1E0C99D80];
      v38 = &v87;
      v39 = &v86;
      v40 = 1;
    }
    objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, v40);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v51);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[SlalomDecoder DecodeStartE1TLV:error:]", 446, (uint64_t)a3->var0, a3->var1, CFSTR("E1 TLV data"), v52, v53, v66);
  return 0;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  $06D0163FE0D7AFE752A9F21F38483579 v63;
  uint64_t var1;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  int v83;
  int v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  _BOOL8 v97;
  _BOOL8 v98;
  void *v99;
  NSObject *v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  void *v112;
  id v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  void *v122;
  id v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t *v127;
  uint64_t *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  NSObject *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  unsigned __int8 v142;
  void *v143;
  void *v144;
  void *v145;
  unsigned int v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t i;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  NSObject *v164;
  uint64_t v165;
  id v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t *v170;
  uint64_t *v171;
  uint64_t v172;
  void *v173;
  int v174;
  void *v175;
  NSObject *v176;
  uint64_t v177;
  id v178;
  void *v179;
  uint64_t v180;
  void *v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t v185;
  _BOOL8 v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  NSObject *v194;
  uint64_t v195;
  void *v196;
  id v197;
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t *v201;
  uint64_t *v202;
  uint64_t v203;
  NSObject *v204;
  uint64_t v205;
  void *v206;
  id v207;
  void *v208;
  uint64_t v209;
  void *v210;
  uint64_t *v211;
  uint64_t *v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  unsigned __int8 v222;
  void *v223;
  void *v224;
  uint64_t v225;
  BOOL v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  unsigned int v234;
  void *v235;
  void *v236;
  id v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t j;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  NSObject *v249;
  uint64_t v250;
  void *v251;
  id v252;
  void *v253;
  uint64_t v254;
  void *v255;
  uint64_t *v256;
  uint64_t *v257;
  NSObject *v258;
  uint64_t v259;
  id v260;
  void *v261;
  uint64_t v262;
  void *v263;
  uint64_t *v264;
  uint64_t *v265;
  uint64_t v266;
  void *v267;
  NSObject *v268;
  uint64_t v269;
  void *v270;
  $391024036B902F3EE9BCB0FBA5EF777F v271;
  void *v272;
  id v273;
  unsigned int v274;
  void *v275;
  void *v276;
  void *v277;
  NSObject *v278;
  uint64_t v279;
  void *v280;
  id v281;
  void *v282;
  uint64_t v283;
  void *v284;
  uint64_t *v285;
  uint64_t *v286;
  uint64_t v287;
  void *v288;
  NSObject *v289;
  void *v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  int v299;
  void *v300;
  NSObject *v301;
  uint64_t v302;
  id v303;
  void *v304;
  uint64_t v305;
  void *v306;
  uint64_t *v307;
  uint64_t *v308;
  uint64_t v309;
  NSObject *v310;
  void *v311;
  id v312;
  void *v313;
  uint64_t v314;
  void *v315;
  void **v316;
  uint64_t *v317;
  uint64_t v318;
  void *v319;
  void *v320;
  NSObject *v321;
  void *v322;
  void *v323;
  void *v324;
  NSObject *v325;
  int v326;
  void *v327;
  void *v328;
  uint64_t v329;
  NSObject *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  unint64_t v336;
  uint64_t v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  uint64_t v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  NSObject *v347;
  uint64_t v348;
  id v349;
  uint64_t v350;
  NSObject *v351;
  uint64_t v352;
  void *v353;
  id v354;
  void *v355;
  uint64_t v356;
  void *v357;
  uint64_t *v358;
  uint64_t *v359;
  uint64_t v360;
  void *v361;
  NSObject *v362;
  uint64_t v363;
  id v364;
  uint64_t v365;
  uint64_t v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  id v372;
  id v373;
  id v374;
  id v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  id v381;
  id v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  id v392;
  id v393;
  id v394;
  id v395;
  void *v396;
  id v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  uint64_t v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  id v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  uint64_t v416;
  _QWORD v417[2];
  unsigned __int8 *v418[2];
  _QWORD v419[2];
  _QWORD v420[2];
  uint64_t v421;
  uint64_t v422;
  _QWORD v423[2];
  _QWORD v424[2];
  uint64_t v425;
  uint64_t v426;
  _QWORD v427[5];
  _QWORD v428[5];
  _BYTE v429[128];
  _QWORD v430[2];
  _QWORD v431[2];
  uint64_t v432;
  uint64_t v433;
  _QWORD v434[2];
  _QWORD v435[2];
  uint64_t v436;
  uint64_t v437;
  _QWORD v438[4];
  _QWORD v439[4];
  _QWORD v440[2];
  _QWORD v441[2];
  uint64_t v442;
  uint64_t v443;
  _QWORD v444[2];
  _QWORD v445[2];
  uint64_t v446;
  uint64_t v447;
  _QWORD v448[2];
  _QWORD v449[2];
  uint64_t v450;
  uint64_t v451;
  _BYTE v452[128];
  id v453;
  _QWORD v454[2];
  _QWORD v455[2];
  uint64_t v456;
  uint64_t v457;
  _QWORD v458[2];
  _QWORD v459[2];
  uint64_t v460;
  uint64_t v461;
  _QWORD v462[4];
  _QWORD v463[4];
  _QWORD v464[2];
  _QWORD v465[2];
  uint64_t v466;
  uint64_t v467;
  _QWORD v468[2];
  _QWORD v469[2];
  uint64_t v470;
  uint64_t v471;
  _QWORD v472[2];
  _QWORD v473[2];
  uint64_t v474;
  uint64_t v475;
  _QWORD v476[2];
  _QWORD v477[2];
  uint64_t v478;
  void *v479;
  _QWORD v480[2];
  _QWORD v481[2];
  uint64_t v482;
  uint64_t v483;
  uint8_t v484[4];
  int v485;
  __int16 v486;
  _BYTE v487[14];
  _QWORD v488[2];
  _QWORD v489[2];
  uint64_t v490;
  uint64_t v491;
  _QWORD v492[2];
  _QWORD v493[2];
  uint64_t v494;
  uint64_t v495;
  _QWORD v496[2];
  _QWORD v497[2];
  uint64_t v498;
  uint64_t v499;
  uint8_t buf[16];
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  _QWORD v507[2];
  _QWORD v508[2];
  uint64_t v509;
  _QWORD v510[4];

  v510[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SelectByNameCmd(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "transceiveAndCheckSW:error:", v17, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = v18;
    v418[0] = (unsigned __int8 *)objc_msgSend(v18, "bytes");
    v407 = v19;
    v418[1] = (unsigned __int8 *)objc_msgSend(v19, "length");
    v416 = 0;
    v417[0] = 0;
    v417[1] = 0;
    DERFindItem(v418, 0xA000000000000005, (uint64_t)&v416);
    if ((_DWORD)v20)
    {
      v21 = v20;
      v22 = v17;
      ATLLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v21;
        _os_log_impl(&dword_1C3511000, v23, OS_LOG_TYPE_ERROR, "Failed to find tag 'A5' in Slalom SELECT response, %d", buf, 8u);
      }

      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to find tag 'A5' in Slalom SELECT response, %d"), v21);
      v25 = (void *)v24;
      if (a7)
      {
        v26 = *a7;
        v27 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v28 = *MEMORY[0x1E0CB3388];
          v507[0] = *MEMORY[0x1E0CB2D50];
          v507[1] = v28;
          v508[0] = v24;
          v508[1] = v26;
          v29 = (void *)MEMORY[0x1E0C99D80];
          v30 = v508;
          v31 = v507;
          v32 = 2;
        }
        else
        {
          v509 = *MEMORY[0x1E0CB2D50];
          v510[0] = v24;
          v29 = (void *)MEMORY[0x1E0C99D80];
          v30 = v510;
          v31 = &v509;
          v32 = 1;
        }
        objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v32);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v47);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v33 = 0;
      v17 = v22;
LABEL_340:
      v18 = v407;
      goto LABEL_341;
    }
    v506 = 0u;
    v505 = 0u;
    v504 = 0u;
    v503 = 0u;
    v502 = 0u;
    v501 = 0u;
    *(_OWORD *)buf = 0u;
    v34 = DERParseSequenceSpec((uint64_t)v417, (uint64_t)&selectResponseA5ContentSpec, (char *)buf, 0x18uLL);
    if ((_DWORD)v34)
    {
      v35 = v34;
      v36 = v17;
      ATLLogObject();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v484 = 67109120;
        v485 = v35;
        _os_log_impl(&dword_1C3511000, v37, OS_LOG_TYPE_ERROR, "Failed to decode SELECT response contents %d", v484, 8u);
      }

      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode SELECT response contents %d"), v35);
      v39 = (void *)v38;
      if (a7)
      {
        v40 = *a7;
        v41 = (void *)MEMORY[0x1E0CB35C8];
        v17 = v36;
        if (*a7)
        {
          v42 = *MEMORY[0x1E0CB3388];
          v496[0] = *MEMORY[0x1E0CB2D50];
          v496[1] = v42;
          v497[0] = v38;
          v497[1] = v40;
          v43 = (void *)MEMORY[0x1E0C99D80];
          v44 = v497;
          v45 = v496;
          v46 = 2;
        }
        else
        {
          v498 = *MEMORY[0x1E0CB2D50];
          v499 = v38;
          v43 = (void *)MEMORY[0x1E0C99D80];
          v44 = &v499;
          v45 = &v498;
          v46 = 1;
        }
        objc_msgSend(v43, "dictionaryWithObjects:forKeys:count:", v44, v45, v46);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v67);
        v33 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_338;
      }
      v33 = 0;
      v17 = v36;
LABEL_339:

      goto LABEL_340;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v399 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *(unsigned __int8 *)v505;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v501);
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    v396 = v17;
    v397 = v14;
    switch((int)v48)
    {
      case 1:
      case 6:
      case 8:
        v392 = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v399, "setObject:forKeyedSubscript:", v49, CFSTR("NFServiceProviderID"));

        v50 = 0;
        v51 = 0;
        v52 = 0;
        v53 = 0;
        while (1)
        {
          v54 = v51;
          FelicaGetDataFileSystemCommand(2319, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            v55 = v15;
            objc_msgSend(v12, "transceiveAndCheckSW:error:", v51, a7);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v56)
            {
              v52 = 0;
              v33 = 0;
              v13 = v392;
              goto LABEL_127;
            }
            FeliCaGetBlockDataFromGetDataCommand(v56);
            v57 = objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              objc_msgSend(v406, "addObject:", v57);
              v53 = (void *)v57;
            }
            else
            {
              ATLLogObject();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v484 = 67109378;
                v485 = v50;
                v486 = 2112;
                *(_QWORD *)v487 = v56;
                _os_log_impl(&dword_1C3511000, v58, OS_LOG_TYPE_DEFAULT, "failed to get block for Suica history, blocknumber %04x with response %@", v484, 0x12u);
              }

              v53 = 0;
            }
            v52 = v56;
            v15 = v55;
          }
          if (++v50 == 20)
          {
            v55 = v15;
            if (objc_msgSend(v406, "count"))
            {
              +[HPHistoryDecoder parseSuicaHistoryBlocks:withIDm:](HPHistoryDecoder, "parseSuicaHistoryBlocks:withIDm:", v406, v398);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v399, "addEntriesFromDictionary:", v59);

              objc_msgSend(v399, "setObject:forKeyedSubscript:", &unk_1E7D9ADD0, CFSTR("NFServiceProviderID"));
              objc_msgSend(v398, "asHexString");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v399, "setObject:forKeyedSubscript:", v60, CFSTR("NFDPAN"));

              FelicaGetDataFileSystemCommand(4239, 0);
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              v13 = v392;
              if (!v61)
              {
                v33 = v52;
                goto LABEL_118;
              }
              objc_msgSend(v12, "transceiveAndCheckSW:error:", v61, a7);
              v33 = (id)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                FeliCaGetBlockDataFromGetDataCommand(v33);
                v62 = objc_claimAutoreleasedReturnValue();

                if (v62)
                {
                  v63 = ($06D0163FE0D7AFE752A9F21F38483579)+[HPHistoryDecoder getInOutStation:](HPHistoryDecoder, "getInOutStation:", v62);
                  var1 = v63.var1;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v63.var0);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v399, "setObject:forKeyedSubscript:", v65, CFSTR("NFInStation"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", var1);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v399, "setObject:forKeyedSubscript:", v66, CFSTR("NFInStationShinkansen"));

                  v53 = (void *)v62;
                }
                else
                {
                  v53 = 0;
                }
LABEL_118:
                FelicaGetDataFileSystemCommand(6219, 0);
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                if (v51)
                {
                  objc_msgSend(v12, "transceiveAndCheckSW:error:", v51, a7);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  v15 = v55;
                  if (!v52)
                    goto LABEL_316;
                  FeliCaGetBlockDataFromGetDataCommand(v52);
                  v185 = objc_claimAutoreleasedReturnValue();

                  if (v185)
                  {
                    v186 = +[HPHistoryDecoder getGreenCarTicketUsed:](HPHistoryDecoder, "getGreenCarTicketUsed:", v185);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v186);
                    v187 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v399, "setObject:forKeyedSubscript:", v187, CFSTR("NFTicketUsed"));

                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    v189 = (void *)v185;
                    v190 = v185;
                    v191 = v188;
                    objc_msgSend(v188, "addObject:", v190);
                    +[HPHistoryDecoder parseGreencarBlocks:](HPHistoryDecoder, "parseGreencarBlocks:", v191);
                    v192 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v192)
                    {
                      objc_msgSend(v399, "setObject:forKeyedSubscript:", v192, CFSTR("NFGreenCarTicket"));
                    }
                    else
                    {
                      v267 = v191;
                      ATLLogObject();
                      v268 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)v484 = 0;
                        _os_log_impl(&dword_1C3511000, v268, OS_LOG_TYPE_DEFAULT, "failed to parse GreenCar blocks", v484, 2u);
                      }

                      v191 = v267;
                    }

                  }
                  else
                  {
                    v189 = 0;
                  }
                }
                else
                {
                  v189 = v53;
                  v52 = v33;
                  v15 = v55;
                }
                FelicaGetDataFileSystemCommand(139, 0);
                v269 = objc_claimAutoreleasedReturnValue();

                if (!v269)
                {
                  v163 = 0;
                  v277 = v189;
                  goto LABEL_336;
                }
                objc_msgSend(v12, "transceiveAndCheckSW:error:", v269, a7);
                v162 = (void *)objc_claimAutoreleasedReturnValue();

                if (v162)
                {
                  v402 = v269;
                  FeliCaGetBlockDataFromGetDataCommand(v162);
                  v270 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v270)
                  {
                    v271 = +[HPHistoryDecoder getCommuterBalance:](HPHistoryDecoder, "getCommuterBalance:", v270);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(*(unint64_t *)&v271));
                    v272 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v399, "setObject:forKeyedSubscript:", v272, CFSTR("NFBalance"));

                    v273 = objc_retainAutorelease(v270);
                    v274 = *(unsigned __int8 *)(objc_msgSend(v273, "bytes") + 8);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v274 >> 4) & 1);
                    v275 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v399, "setObject:forKeyedSubscript:", v275, CFSTR("NFNotifyOnLowBalance"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v274 >> 5) & 1);
                    v276 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v399, "setObject:forKeyedSubscript:", v276, CFSTR("NFAllowBalanceUsageForCommute"));

                    v161 = v273;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[HPHistoryDecoder getIsDenyListed:](HPHistoryDecoder, "getIsDenyListed:", v273));
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v399, "setObject:forKeyedSubscript:", v160, CFSTR("NFBlacklisted"));
                    v163 = (void *)v402;
                    goto LABEL_195;
                  }
                  v277 = 0;
                  v52 = v162;
                  v163 = (void *)v402;
                  goto LABEL_336;
                }
                v52 = 0;
                v33 = 0;
                v53 = v189;
                v51 = (void *)v269;
LABEL_337:

                v17 = v396;
                v14 = v397;
                v67 = v398;
                v39 = v399;
LABEL_338:

                goto LABEL_339;
              }
              v52 = 0;
              v51 = v61;
            }
            else
            {
              ATLLogObject();
              v100 = objc_claimAutoreleasedReturnValue();
              v13 = v392;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v484 = 0;
                _os_log_impl(&dword_1C3511000, v100, OS_LOG_TYPE_ERROR, "Suica History failure: could not get a single history block. Aborting.", v484, 2u);
              }

              v101 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Suica History failure: could not get a single history block. Aborting."));
              v102 = (void *)v101;
              if (a7)
              {
                v103 = *a7;
                v104 = (void *)MEMORY[0x1E0CB35C8];
                if (*a7)
                {
                  v105 = *MEMORY[0x1E0CB3388];
                  v492[0] = *MEMORY[0x1E0CB2D50];
                  v492[1] = v105;
                  v493[0] = v101;
                  v493[1] = v103;
                  v106 = (void *)MEMORY[0x1E0C99D80];
                  v107 = v493;
                  v108 = v492;
                  v109 = 2;
                }
                else
                {
                  v494 = *MEMORY[0x1E0CB2D50];
                  v495 = v101;
                  v106 = (void *)MEMORY[0x1E0C99D80];
                  v107 = &v495;
                  v108 = &v494;
                  v109 = 1;
                }
                objc_msgSend(v106, "dictionaryWithObjects:forKeys:count:", v107, v108, v109);
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v193);
                *a7 = (id)objc_claimAutoreleasedReturnValue();

              }
              v33 = 0;
            }
LABEL_127:
            v15 = v55;
            goto LABEL_337;
          }
        }
      case 4:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", &unk_1E7D9AE90, CFSTR("SPRaw"));
        objc_msgSend(v78, "setObject:forKeyedSubscript:", CFSTR("Mogul"), CFSTR("SP"));
        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 21899, 0, v12, a7);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 21899, 1, v12, a7);
        v80 = objc_claimAutoreleasedReturnValue();
        v81 = (void *)v80;
        if (v79 && v80)
        {
          v393 = v13;
          +[MogulDecoder decodeCardID:](MogulDecoder, "decodeCardID:", v79);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v82, CFSTR("CardIdentifier"));
          v83 = +[MogulDecoder decodeEnableFlag:](MogulDecoder, "decodeEnableFlag:", v81);
          v84 = +[MogulDecoder decodeStatusFlag:](MogulDecoder, "decodeStatusFlag:", v81);
          v383 = v78;
          if (!v83 || (v84 & 0xFFFFFFFD) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v83 != 1);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setObject:forKeyedSubscript:", v135, CFSTR("CardDenyListed"));

          }
          else
          {
            objc_msgSend(v78, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CardDenyListed"));
          }
          v387 = v81;
          +[MogulDecoder decodeChargeAmountFlagValue:](MogulDecoder, "decodeChargeAmountFlagValue:", v81);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          if (v136)
            objc_msgSend(v78, "setObject:forKeyedSubscript:", v136, CFSTR("CardDefaultAAVSAmount"));

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 21911, 0, v12, a7);
          v138 = objc_claimAutoreleasedReturnValue();

          if (v138)
          {
            v79 = (void *)v138;
            +[MogulDecoder getPurseBalance:](MogulDecoder, "getPurseBalance:", v138);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v438[0] = CFSTR("BalanceIdentifier");
            v438[1] = CFSTR("Balance");
            v439[0] = CFSTR("Purse");
            v439[1] = v139;
            v438[2] = CFSTR("BalanceCurrency");
            v438[3] = CFSTR("BalanceCurrencyExponent");
            v439[2] = CFSTR("JPY");
            v439[3] = &unk_1E7D9ADB8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v439, v438, 4);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v401 = v137;
            objc_msgSend(v137, "addObject:", v140);

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = 0;
            v143 = 0;
            do
            {
              v144 = v143;
              +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 22095, v142, v12, a7);
              v143 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v143)
              {
                ATLLogObject();
                v194 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v484 = 0;
                  _os_log_impl(&dword_1C3511000, v194, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul history, invalid block", v484, 2u);
                }

                v195 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Mogul history, invalid block"));
                v196 = (void *)v195;
                v78 = v383;
                if (a7)
                {
                  v197 = *a7;
                  v198 = (void *)MEMORY[0x1E0CB35C8];
                  if (*a7)
                  {
                    v199 = *MEMORY[0x1E0CB3388];
                    v430[0] = *MEMORY[0x1E0CB2D50];
                    v430[1] = v199;
                    v431[0] = v195;
                    v431[1] = v197;
                    v200 = (void *)MEMORY[0x1E0C99D80];
                    v201 = v431;
                    v202 = v430;
                    v203 = 2;
                  }
                  else
                  {
                    v432 = *MEMORY[0x1E0CB2D50];
                    v433 = v195;
                    v200 = (void *)MEMORY[0x1E0C99D80];
                    v201 = &v433;
                    v202 = &v432;
                    v203 = 1;
                  }
                  objc_msgSend(v200, "dictionaryWithObjects:forKeys:count:", v201, v202, v203);
                  v320 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v198, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v320);
                  *a7 = (id)objc_claimAutoreleasedReturnValue();

                }
                goto LABEL_312;
              }
              +[MogulDecoder decodeTransactionHistoryEntry:](MogulDecoder, "decodeTransactionHistoryEntry:", v143);
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              if (v145)
                objc_msgSend(v141, "addObject:", v145);

              v146 = v142++;
            }
            while (v146 <= 3);
            objc_msgSend(v399, "setObject:forKeyedSubscript:", v141, CFSTR("TransactionHistory"));

            +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 22027, 0, v12, a7);
            v147 = objc_claimAutoreleasedReturnValue();

            +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 22027, 1, v12, a7);
            v148 = objc_claimAutoreleasedReturnValue();

            if (v147 && v148)
            {
              v378 = (void *)v148;
              v374 = v12;
              v388 = (void *)v147;
              +[MogulDecoder decodePointsData:andWith:](MogulDecoder, "decodePointsData:andWith:", v147, v148);
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = v149;
              if (v149)
              {
                v410 = 0u;
                v411 = 0u;
                v408 = 0u;
                v409 = 0u;
                v151 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v408, v429, 16);
                if (v151)
                {
                  v152 = v151;
                  v153 = *(_QWORD *)v409;
                  do
                  {
                    for (i = 0; i != v152; ++i)
                    {
                      if (*(_QWORD *)v409 != v153)
                        objc_enumerationMutation(v150);
                      v155 = *(void **)(*((_QWORD *)&v408 + 1) + 8 * i);
                      v427[0] = CFSTR("Balance");
                      objc_msgSend(v155, "balance");
                      v156 = (void *)objc_claimAutoreleasedReturnValue();
                      v428[0] = v156;
                      v428[1] = CFSTR("XXX");
                      v427[1] = CFSTR("BalanceCurrency");
                      v427[2] = CFSTR("BalanceCurrencyExponent");
                      v428[2] = &unk_1E7D9ADB8;
                      v427[3] = CFSTR("BalanceExpirationDate");
                      objc_msgSend(v155, "expiration");
                      v157 = (void *)objc_claimAutoreleasedReturnValue();
                      v428[3] = v157;
                      v427[4] = CFSTR("BalanceIdentifier");
                      objc_msgSend(v155, "name");
                      v158 = (void *)objc_claimAutoreleasedReturnValue();
                      v428[4] = v158;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v428, v427, 5);
                      v159 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v401, "addObject:", v159);

                    }
                    v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v408, v429, 16);
                  }
                  while (v152);
                }
              }

              v160 = v383;
              objc_msgSend(v383, "setObject:forKeyedSubscript:", v401, CFSTR("Balances"));
              objc_msgSend(v399, "setObject:forKeyedSubscript:", v383, CFSTR("State"));

              v161 = 0;
              v162 = 0;
              v163 = 0;
              v12 = v374;
              v13 = v393;
LABEL_195:

              v52 = v162;
              v277 = v161;
              goto LABEL_336;
            }
            ATLLogObject();
            v301 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v301, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1C3511000, v301, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul loyalty points, invalid blocks", v484, 2u);
            }

            v302 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Mogul loyalty points, invalid blocks"));
            v141 = (void *)v302;
            v79 = (void *)v147;
            if (a7)
            {
              v303 = *a7;
              v304 = (void *)MEMORY[0x1E0CB35C8];
              v78 = v383;
              if (*a7)
              {
                v305 = *MEMORY[0x1E0CB3388];
                v423[0] = *MEMORY[0x1E0CB2D50];
                v423[1] = v305;
                v424[0] = v302;
                v424[1] = v303;
                v306 = (void *)MEMORY[0x1E0C99D80];
                v307 = v424;
                v308 = v423;
                v309 = 2;
              }
              else
              {
                v425 = *MEMORY[0x1E0CB2D50];
                v426 = v302;
                v306 = (void *)MEMORY[0x1E0C99D80];
                v307 = &v426;
                v308 = &v425;
                v309 = 1;
              }
              objc_msgSend(v306, "dictionaryWithObjects:forKeys:count:", v307, v308, v309);
              v367 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v304, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v367);
              *a7 = (id)objc_claimAutoreleasedReturnValue();

              v387 = (void *)v148;
            }
            else
            {
              v387 = (void *)v148;
              v78 = v383;
            }
LABEL_312:
            v112 = v401;
          }
          else
          {
            v175 = v137;
            ATLLogObject();
            v176 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1C3511000, v176, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul purse balance, invalid block", v484, 2u);
            }

            v177 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Mogul purse balance, invalid block"));
            v141 = (void *)v177;
            if (a7)
            {
              v178 = *a7;
              v179 = (void *)MEMORY[0x1E0CB35C8];
              if (*a7)
              {
                v180 = *MEMORY[0x1E0CB3388];
                v434[0] = *MEMORY[0x1E0CB2D50];
                v434[1] = v180;
                v435[0] = v177;
                v435[1] = v178;
                v181 = (void *)MEMORY[0x1E0C99D80];
                v182 = v435;
                v183 = v434;
                v184 = 2;
              }
              else
              {
                v436 = *MEMORY[0x1E0CB2D50];
                v437 = v177;
                v181 = (void *)MEMORY[0x1E0C99D80];
                v182 = &v437;
                v183 = &v436;
                v184 = 1;
              }
              objc_msgSend(v181, "dictionaryWithObjects:forKeys:count:", v182, v183, v184);
              v319 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v319);
              *a7 = (id)objc_claimAutoreleasedReturnValue();

            }
            v79 = 0;
            v112 = v175;
          }
        }
        else
        {
          ATLLogObject();
          v110 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1C3511000, v110, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul card settings, invalid blocks", v484, 2u);
          }

          v111 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Mogul card settings, invalid blocks"));
          v112 = (void *)v111;
          if (!a7)
            goto LABEL_314;
          v387 = v81;
          v113 = *a7;
          v114 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v115 = *MEMORY[0x1E0CB3388];
            v440[0] = *MEMORY[0x1E0CB2D50];
            v440[1] = v115;
            v441[0] = v111;
            v441[1] = v113;
            v116 = (void *)MEMORY[0x1E0C99D80];
            v117 = v441;
            v118 = v440;
            v119 = 2;
          }
          else
          {
            v442 = *MEMORY[0x1E0CB2D50];
            v443 = v111;
            v116 = (void *)MEMORY[0x1E0C99D80];
            v117 = &v443;
            v118 = &v442;
            v119 = 1;
          }
          objc_msgSend(v116, "dictionaryWithObjects:forKeys:count:", v117, v118, v119);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v141);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }

        v81 = v387;
LABEL_314:

        goto LABEL_315;
      case 5:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:forKeyedSubscript:", &unk_1E7D9AE60, CFSTR("SPRaw"));
        FelicaGetDataFileSystemCommand(279, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v51)
        {
          v89 = 0;
          v53 = 0;
          v52 = 0;
          goto LABEL_76;
        }
        objc_msgSend(v12, "transceiveAndCheckSW:error:", v51, a7);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v86;
        if (!v86)
        {
          v89 = 0;
          v53 = 0;
          goto LABEL_300;
        }
        FeliCaGetBlockDataFromGetDataCommand(v86);
        v87 = objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          v53 = (void *)v87;
          +[OctopusDecoder getPurseBalance:](OctopusDecoder, "getPurseBalance:", v87);
          v88 = objc_claimAutoreleasedReturnValue();
          if (v88)
          {
            v89 = (void *)v88;
LABEL_76:
            FelicaGetDataFileSystemCommand(1800, 0);
            v130 = (void *)objc_claimAutoreleasedReturnValue();

            v376 = v89;
            if (!v130)
            {
              v131 = v52;
              goto LABEL_208;
            }
            objc_msgSend(v12, "transceiveAndCheckSW:error:", v130, a7);
            v131 = (void *)objc_claimAutoreleasedReturnValue();

            if (v131)
            {
              v132 = v130;
              FeliCaGetBlockDataFromGetDataCommand(v131);
              v133 = objc_claimAutoreleasedReturnValue();

              if (v133)
              {
                +[OctopusDecoder getLoyaltyBalance:](OctopusDecoder, "getLoyaltyBalance:", v133);
                v134 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "setObject:forKeyedSubscript:", v134, CFSTR("PointBalance"));
                v53 = (void *)v133;
              }
              else
              {
                ATLLogObject();
                v134 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v484 = 67109634;
                  v485 = 1800;
                  v486 = 1024;
                  *(_DWORD *)v487 = 0;
                  *(_WORD *)&v487[4] = 2112;
                  *(_QWORD *)&v487[6] = v131;
                  _os_log_impl(&dword_1C3511000, v134, OS_LOG_TYPE_DEFAULT, "Octopus Rewards : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                }
                v53 = 0;
              }

              v130 = v132;
LABEL_208:
              objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("PointBalance"));
              v288 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v288)
              {
                ATLLogObject();
                v289 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v484 = 0;
                  _os_log_impl(&dword_1C3511000, v289, OS_LOG_TYPE_DEFAULT, "failed to retrieved rewards", v484, 2u);
                }

              }
              v385 = v85;
              v290 = v131;
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v291 = objc_claimAutoreleasedReturnValue();
              FelicaGetDataFileSystemCommand(776, 0);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                v390 = (void *)v291;
                objc_msgSend(v12, "transceiveAndCheckSW:error:", v51, a7);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v52)
                {
                  v299 = 1;
                  v293 = v385;
                  v300 = v390;
                  goto LABEL_323;
                }
                FeliCaGetBlockDataFromGetDataCommand(v52);
                v292 = objc_claimAutoreleasedReturnValue();

                v293 = v385;
                if (!v292)
                {
                  ATLLogObject();
                  v310 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v310, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v484 = 67109634;
                    v485 = 776;
                    v486 = 1024;
                    *(_DWORD *)v487 = 0;
                    *(_WORD *)&v487[4] = 2112;
                    *(_QWORD *)&v487[6] = v52;
                    _os_log_impl(&dword_1C3511000, v310, OS_LOG_TYPE_ERROR, "Octopus Internal : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                  }

                  v311 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Octopus Internal : GET DATA for Service Code %d and block %d is invalid: %@"), 776, 0, v52);
                  if (a7)
                  {
                    v312 = *a7;
                    v313 = (void *)MEMORY[0x1E0CB35C8];
                    v373 = v311;
                    if (*a7)
                    {
                      v314 = *MEMORY[0x1E0CB3388];
                      v476[0] = *MEMORY[0x1E0CB2D50];
                      v476[1] = v314;
                      v477[0] = v311;
                      v477[1] = v312;
                      v315 = (void *)MEMORY[0x1E0C99D80];
                      v316 = (void **)v477;
                      v317 = v476;
                      v318 = 2;
                    }
                    else
                    {
                      v478 = *MEMORY[0x1E0CB2D50];
                      v479 = v311;
                      v315 = (void *)MEMORY[0x1E0C99D80];
                      v316 = &v479;
                      v317 = &v478;
                      v318 = 1;
                    }
                    objc_msgSend(v315, "dictionaryWithObjects:forKeys:count:", v316, v317, v318);
                    v344 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v313, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v344);
                    v298 = 0;
                    *a7 = (id)objc_claimAutoreleasedReturnValue();
                    v299 = 1;
                    v300 = v390;
                    goto LABEL_321;
                  }
                  v298 = 0;
                  v299 = 1;
                  v300 = v390;
                  goto LABEL_322;
                }
                +[OctopusDecoder getBaseDate:](OctopusDecoder, "getBaseDate:", v292);
                v294 = objc_claimAutoreleasedReturnValue();

                +[OctopusDecoder getNegativeValueLimit:](OctopusDecoder, "getNegativeValueLimit:", v292);
                v373 = (id)objc_claimAutoreleasedReturnValue();
                v403 = (void *)v292;
                +[OctopusDecoder getAAVSAmount:](OctopusDecoder, "getAAVSAmount:", v292);
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                v296 = v376;
                if (v295)
                {
                  v297 = v385;
                  objc_msgSend(v385, "setObject:forKeyedSubscript:", v295, CFSTR("CardDefaultAAVSAmount"));
                }
                else
                {
                  ATLLogObject();
                  v321 = objc_claimAutoreleasedReturnValue();
                  v297 = v385;
                  if (os_log_type_enabled(v321, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v484 = 0;
                    _os_log_impl(&dword_1C3511000, v321, OS_LOG_TYPE_DEFAULT, "failed to retrieved AAVS amount", v484, 2u);
                  }

                  v296 = v376;
                }

                if (v373 && v296)
                {
                  objc_msgSend(v296, "decimalNumberBySubtracting:");
                  v322 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v297, "setObject:forKeyedSubscript:", v322, CFSTR("Balance"));

                  *(_WORD *)v484 = 0;
                  +[ATLCurrency currencyCodeForNumber:exponentOut:](ATLCurrency, "currencyCodeForNumber:exponentOut:", 344, v484);
                  v323 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v323)
                  {
                    objc_msgSend(v297, "setObject:forKeyedSubscript:", v323, CFSTR("CardCurrency"));
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)v484);
                    v324 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v297, "setObject:forKeyedSubscript:", v324, CFSTR("CardCurrencyExponent"));

                    objc_msgSend(v297, "setObject:forKeyedSubscript:", &unk_1E7D9AED8, CFSTR("CardCurrencyCode"));
                  }

                  v298 = v403;
LABEL_250:
                  v391 = (void *)v294;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v380 = (void *)objc_claimAutoreleasedReturnValue();
                  v326 = 0;
                  v404 = v52;
                  v395 = v13;
                  v382 = v15;
                  while (1)
                  {
                    v327 = v51;
                    FelicaGetDataFileSystemCommand(1036, v326);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v51)
                    {
                      objc_msgSend(v12, "transceiveAndCheckSW:error:", v51, a7);
                      v328 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v328)
                      {
                        v52 = 0;
                        goto LABEL_278;
                      }
                      v404 = v328;
                      FeliCaGetBlockDataFromGetDataCommand(v328);
                      v329 = objc_claimAutoreleasedReturnValue();

                      if (v329)
                      {
                        +[OctopusDecoder parseTLOGBlock:withBaseDate:](OctopusDecoder, "parseTLOGBlock:withBaseDate:", v329, v391);
                        v330 = objc_claimAutoreleasedReturnValue();
                        if (v330)
                        {
                          objc_msgSend(v385, "objectForKeyedSubscript:", CFSTR("CardDefaultAAVSAmount"));
                          v331 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v385, "objectForKeyedSubscript:", CFSTR("Balance"));
                          v332 = (void *)objc_claimAutoreleasedReturnValue();
                          +[OctopusDecoder injectTLOGAAVS:withAAVSAmount:andBalance:](OctopusDecoder, "injectTLOGAAVS:withAAVSAmount:andBalance:", v330, v331, v332);
                          v333 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!+[OctopusDecoder filterHistoryEntry:](OctopusDecoder, "filterHistoryEntry:", v330))objc_msgSend(v380, "addObject:", v330);
                          if (v333)
                            objc_msgSend(v380, "addObject:", v333);

                          v13 = v395;
                          v15 = v382;
                        }
                      }
                      else
                      {
                        ATLLogObject();
                        v330 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v330, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v484 = 67109634;
                          v485 = 1036;
                          v486 = 1024;
                          *(_DWORD *)v487 = v326;
                          *(_WORD *)&v487[4] = 2112;
                          *(_QWORD *)&v487[6] = v328;
                          _os_log_impl(&dword_1C3511000, v330, OS_LOG_TYPE_DEFAULT, "Octopus TLOG : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                        }
                        v329 = 0;
                      }

                      v298 = (void *)v329;
                    }
                    if (++v326 == 10)
                    {
                      FelicaGetDataFileSystemCommand(520, 0);
                      v334 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v334)
                      {
                        v335 = v399;
                        v52 = v404;
                        v336 = 0x1E0C99000uLL;
LABEL_271:
                        v405 = v298;
                        FelicaGetDataFileSystemCommand(2312, 0);
                        v51 = (void *)objc_claimAutoreleasedReturnValue();

                        v300 = v391;
                        if (v51)
                        {
                          objc_msgSend(v12, "transceiveAndCheckSW:error:", v51, 0);
                          v341 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v341)
                          {
                            FeliCaGetBlockDataFromGetDataCommand(v341);
                            v342 = objc_claimAutoreleasedReturnValue();

                            if (v342)
                            {
                              if (+[OctopusDecoder getEnRouteStatus:](OctopusDecoder, "getEnRouteStatus:", v342))
                              {
                                objc_msgSend(*(id *)(v336 + 3560), "arrayWithObject:", CFSTR("TransitTrain"));
                                v343 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v385, "setObject:forKeyedSubscript:", v343, CFSTR("TransactionInProgress"));

                              }
                              v405 = (void *)v342;
                            }
                            else
                            {
                              v405 = 0;
                            }
                          }
                        }
                        else
                        {
                          v341 = v52;
                        }
                        v344 = v380;
                        objc_msgSend(v335, "setObject:forKeyedSubscript:", v380, CFSTR("TransactionHistory"));
                        v368 = v335;
                        v293 = v385;
                        objc_msgSend(v368, "setObject:forKeyedSubscript:", v385, CFSTR("State"));
                        v299 = 6;
                        v52 = v341;
                        v298 = v405;
                        goto LABEL_321;
                      }
                      objc_msgSend(v12, "transceiveAndCheckSW:error:", v334, a7);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();

                      v335 = v399;
                      v336 = 0x1E0C99000;
                      if (v52)
                      {
                        FeliCaGetBlockDataFromGetDataCommand(v52);
                        v337 = objc_claimAutoreleasedReturnValue();
                        v338 = v298;
                        v298 = (void *)v337;

                        if (v298)
                        {
                          v339 = v334;
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[OctopusDecoder isDenyListed:](OctopusDecoder, "isDenyListed:", v298));
                          v340 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v385, "setObject:forKeyedSubscript:", v340, CFSTR("CardDenyListed"));

                          v334 = v339;
                          goto LABEL_271;
                        }
                        ATLLogObject();
                        v351 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v351, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v484 = 67109634;
                          v485 = 520;
                          v486 = 1024;
                          *(_DWORD *)v487 = 0;
                          *(_WORD *)&v487[4] = 2112;
                          *(_QWORD *)&v487[6] = v52;
                          _os_log_impl(&dword_1C3511000, v351, OS_LOG_TYPE_ERROR, "Octopus Card Settings : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                        }
                        v51 = v334;

                        v352 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Octopus Card Settings : GET DATA for Service Code %d and block %d is invalid: %@"), 520, 0, v52);
                        v353 = (void *)v352;
                        v293 = v385;
                        if (a7)
                        {
                          v354 = *a7;
                          v355 = (void *)MEMORY[0x1E0CB35C8];
                          if (*a7)
                          {
                            v356 = *MEMORY[0x1E0CB3388];
                            v472[0] = *MEMORY[0x1E0CB2D50];
                            v472[1] = v356;
                            v473[0] = v352;
                            v473[1] = v354;
                            v357 = (void *)MEMORY[0x1E0C99D80];
                            v358 = v473;
                            v359 = v472;
                            v360 = 2;
                          }
                          else
                          {
                            v474 = *MEMORY[0x1E0CB2D50];
                            v475 = v352;
                            v357 = (void *)MEMORY[0x1E0C99D80];
                            v358 = &v475;
                            v359 = &v474;
                            v360 = 1;
                          }
                          objc_msgSend(v357, "dictionaryWithObjects:forKeys:count:", v358, v359, v360);
                          v369 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v355, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v369);
                          *a7 = (id)objc_claimAutoreleasedReturnValue();

                        }
                        v298 = 0;
                        v299 = 1;
LABEL_279:
                        v300 = v391;
                        v344 = v380;
LABEL_321:

                        v311 = v373;
LABEL_322:

                        v53 = v298;
LABEL_323:

                        if (v299 == 6)
                        {
                          v277 = v53;
                          v163 = v51;
                          goto LABEL_336;
                        }
LABEL_316:
                        v33 = 0;
                        goto LABEL_337;
                      }
                      v51 = v334;
LABEL_278:
                      v299 = 1;
                      v293 = v385;
                      goto LABEL_279;
                    }
                  }
                }
                v298 = v403;
              }
              else
              {
                v373 = 0;
                v52 = v290;
                v298 = v53;
                v294 = v291;
              }
              ATLLogObject();
              v325 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v325, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v484 = 0;
                _os_log_impl(&dword_1C3511000, v325, OS_LOG_TYPE_DEFAULT, "failed to retrieved negative value limit", v484, 2u);
              }

              goto LABEL_250;
            }
            v52 = 0;
            v51 = v130;
LABEL_300:

            goto LABEL_316;
          }
          ATLLogObject();
          v258 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1C3511000, v258, OS_LOG_TYPE_ERROR, "failed to retrieved balance", v484, 2u);
          }

          v259 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to retrieved balance"));
          v206 = (void *)v259;
          if (a7)
          {
            v381 = v15;
            v260 = *a7;
            v261 = (void *)MEMORY[0x1E0CB35C8];
            if (*a7)
            {
              v262 = *MEMORY[0x1E0CB3388];
              v488[0] = *MEMORY[0x1E0CB2D50];
              v488[1] = v262;
              v489[0] = v259;
              v489[1] = v260;
              v263 = (void *)MEMORY[0x1E0C99D80];
              v264 = v489;
              v265 = v488;
              v266 = 2;
            }
            else
            {
              v490 = *MEMORY[0x1E0CB2D50];
              v491 = v259;
              v263 = (void *)MEMORY[0x1E0C99D80];
              v264 = &v491;
              v265 = &v490;
              v266 = 1;
            }
            objc_msgSend(v263, "dictionaryWithObjects:forKeys:count:", v264, v265, v266);
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v345);
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v381;
LABEL_298:
            *a7 = v346;

          }
        }
        else
        {
          ATLLogObject();
          v204 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v484 = 67109634;
            v485 = 279;
            v486 = 1024;
            *(_DWORD *)v487 = 0;
            *(_WORD *)&v487[4] = 2112;
            *(_QWORD *)&v487[6] = v52;
            _os_log_impl(&dword_1C3511000, v204, OS_LOG_TYPE_ERROR, "Octopus Purse : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
          }

          v205 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Octopus Purse : GET DATA for Service Code %d and block %d is invalid: %@"), 279, 0, v52);
          v206 = (void *)v205;
          if (a7)
          {
            v207 = *a7;
            v208 = (void *)MEMORY[0x1E0CB35C8];
            if (*a7)
            {
              v209 = *MEMORY[0x1E0CB3388];
              v480[0] = *MEMORY[0x1E0CB2D50];
              v480[1] = v209;
              v481[0] = v205;
              v481[1] = v207;
              v210 = (void *)MEMORY[0x1E0C99D80];
              v211 = v481;
              v212 = v480;
              v213 = 2;
            }
            else
            {
              v482 = *MEMORY[0x1E0CB2D50];
              v483 = v205;
              v210 = (void *)MEMORY[0x1E0C99D80];
              v211 = &v483;
              v212 = &v482;
              v213 = 1;
            }
            objc_msgSend(v210, "dictionaryWithObjects:forKeys:count:", v211, v212, v213);
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v208, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v345);
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 0;
            goto LABEL_298;
          }
          v53 = 0;
        }

        v89 = 0;
        goto LABEL_300;
      case 7:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setObject:forKeyedSubscript:", &unk_1E7D9AEA8, CFSTR("SPRaw"));
        objc_msgSend(v90, "setObject:forKeyedSubscript:", CFSTR("Gondola"), CFSTR("SP"));
        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26575, 0, v12, a7);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26575, 1, v12, a7);
        v92 = objc_claimAutoreleasedReturnValue();
        v93 = (void *)v92;
        if (!v91 || !v92)
        {
          ATLLogObject();
          v120 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1C3511000, v120, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola S/N, invalid blocks", v484, 2u);
          }

          v121 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Gondola S/N, invalid blocks"));
          v122 = (void *)v121;
          if (!a7)
          {
            v174 = 1;
            goto LABEL_335;
          }
          v400 = v93;
          v123 = *a7;
          v124 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v125 = *MEMORY[0x1E0CB3388];
            v468[0] = *MEMORY[0x1E0CB2D50];
            v468[1] = v125;
            v469[0] = v121;
            v469[1] = v123;
            v126 = (void *)MEMORY[0x1E0C99D80];
            v127 = v469;
            v128 = v468;
            v129 = 2;
          }
          else
          {
            v470 = *MEMORY[0x1E0CB2D50];
            v471 = v121;
            v126 = (void *)MEMORY[0x1E0C99D80];
            v127 = &v471;
            v128 = &v470;
            v129 = 1;
          }
          objc_msgSend(v126, "dictionaryWithObjects:forKeys:count:", v127, v128, v129);
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v247);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          v174 = 1;
          goto LABEL_334;
        }
        +[GondolaDecoder decodeCardNumberFromBlock0:andBlock1:](GondolaDecoder, "decodeCardNumberFromBlock0:andBlock1:", v91, v92);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v384 = v90;
        objc_msgSend(v90, "setObject:forKeyedSubscript:", v94, CFSTR("CardIdentifier"));

        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26571, 0, v12, a7);
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26571, 1, v12, a7);
        v96 = objc_claimAutoreleasedReturnValue();

        v386 = v95;
        if (!v95 || !v96)
        {
          ATLLogObject();
          v164 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1C3511000, v164, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola Usage Flag and/or Effectiveness Flag, invalid blocks", v484, 2u);
          }

          v165 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Gondola Usage Flag and/or Effectiveness Flag, invalid blocks"));
          v122 = (void *)v165;
          v90 = v384;
          if (!a7)
          {
            v174 = 1;
            v93 = (void *)v96;
            v91 = v386;
            goto LABEL_335;
          }
          v166 = *a7;
          v167 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v168 = *MEMORY[0x1E0CB3388];
            v464[0] = *MEMORY[0x1E0CB2D50];
            v464[1] = v168;
            v465[0] = v165;
            v465[1] = v166;
            v169 = (void *)MEMORY[0x1E0C99D80];
            v170 = v465;
            v171 = v464;
            v172 = 2;
          }
          else
          {
            v466 = *MEMORY[0x1E0CB2D50];
            v467 = v165;
            v169 = (void *)MEMORY[0x1E0C99D80];
            v170 = &v467;
            v171 = &v466;
            v172 = 1;
          }
          objc_msgSend(v169, "dictionaryWithObjects:forKeys:count:", v170, v171, v172);
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v247);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          v174 = 1;
          v400 = (void *)v96;
          v91 = v386;
LABEL_334:

          v93 = v400;
LABEL_335:

          v277 = 0;
          v52 = 0;
          v163 = 0;
          v53 = 0;
          v51 = 0;
          v33 = 0;
          if (v174 != 6)
            goto LABEL_337;
LABEL_336:
          v33 = v399;
          v53 = v277;
          v51 = v163;
          goto LABEL_337;
        }
        v97 = +[GondolaDecoder isCardUsageFlag:](GondolaDecoder, "isCardUsageFlag:", v95);
        v400 = (void *)v96;
        v98 = +[GondolaDecoder isCardEffectiveFlag:](GondolaDecoder, "isCardEffectiveFlag:", v96);
        if (v97)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v98 ^ 1);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v384, "setObject:forKeyedSubscript:", v99, CFSTR("CardDenyListed"));

        }
        else
        {
          objc_msgSend(v384, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("CardDenyListed"));
        }
        if (self->_debug)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v97);
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v384, "setObject:forKeyedSubscript:", v214, CFSTR("CardActivated"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v98);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v384, "setObject:forKeyedSubscript:", v215, CFSTR("CardEffective"));

          objc_msgSend(MEMORY[0x1E0CB3940], "hexStringFromBytes:length:", (_QWORD)v506, 2);
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v384, "setObject:forKeyedSubscript:", v216, CFSTR("LifeCycleState"));

        }
        +[GondolaDecoder decodeEnrollmentDateAfterDelivery:](GondolaDecoder, "decodeEnrollmentDateAfterDelivery:", v96);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
        v217 = objc_claimAutoreleasedReturnValue();
        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26647, 0, v12, a7);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        v379 = (void *)v217;
        if (v91)
        {
          v377 = v122;
          v394 = v13;
          +[GondolaDecoder getPurseBalance:](GondolaDecoder, "getPurseBalance:", v91);
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          v462[0] = CFSTR("BalanceIdentifier");
          v462[1] = CFSTR("Balance");
          v463[0] = CFSTR("Purse");
          v463[1] = v218;
          v462[2] = CFSTR("BalanceCurrency");
          v462[3] = CFSTR("BalanceCurrencyExponent");
          v463[2] = CFSTR("JPY");
          v463[3] = &unk_1E7D9ADB8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v463, v462, 4);
          v219 = objc_claimAutoreleasedReturnValue();
          v220 = (void *)v217;
          v221 = (void *)v219;
          objc_msgSend(v220, "addObject:", v219);

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v389 = (void *)objc_claimAutoreleasedReturnValue();
          v222 = 0;
          v223 = v400;
          do
          {
            v224 = v91;
            +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26635, v222, v12, a7);
            v91 = (void *)objc_claimAutoreleasedReturnValue();

            +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26635, v222 | 1u, v12, a7);
            v225 = objc_claimAutoreleasedReturnValue();

            if (v91)
              v226 = v225 == 0;
            else
              v226 = 1;
            v400 = (void *)v225;
            if (v226)
            {
              ATLLogObject();
              v278 = objc_claimAutoreleasedReturnValue();
              v90 = v384;
              if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v484 = 0;
                _os_log_impl(&dword_1C3511000, v278, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola history, invalid blocks", v484, 2u);
              }

              v279 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Gondola history, invalid blocks"));
              v280 = (void *)v279;
              v13 = v394;
              if (a7)
              {
                v281 = *a7;
                v282 = (void *)MEMORY[0x1E0CB35C8];
                if (*a7)
                {
                  v283 = *MEMORY[0x1E0CB3388];
                  v454[0] = *MEMORY[0x1E0CB2D50];
                  v454[1] = v283;
                  v455[0] = v279;
                  v455[1] = v281;
                  v284 = (void *)MEMORY[0x1E0C99D80];
                  v285 = v455;
                  v286 = v454;
                  v287 = 2;
                }
                else
                {
                  v456 = *MEMORY[0x1E0CB2D50];
                  v457 = v279;
                  v284 = (void *)MEMORY[0x1E0C99D80];
                  v285 = &v457;
                  v286 = &v456;
                  v287 = 1;
                }
                objc_msgSend(v284, "dictionaryWithObjects:forKeys:count:", v285, v286, v287);
                v361 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v282, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v361);
                *a7 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_333;
            }
            +[GondolaDecoder decodeHistoryBlock1:andWithBlock2:](GondolaDecoder, "decodeHistoryBlock1:andWithBlock2:", v91, v225);
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("TopUp"));
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v228, "objectForKeyedSubscript:", CFSTR("Amount"));
            v229 = (void *)objc_claimAutoreleasedReturnValue();

            if (v229)
            {
              objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("TopUp"));
              v230 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v389, "addObject:", v230);

            }
            objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("Charge"));
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("Amount"));
            v232 = (void *)objc_claimAutoreleasedReturnValue();

            if (v232)
            {
              objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("Charge"));
              v233 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v389, "addObject:", v233);

            }
            v234 = v222;
            v222 += 2;
            v223 = v400;
          }
          while (v234 < 4);
          v375 = v12;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("SerialNumber"), 0);
          v372 = (id)objc_claimAutoreleasedReturnValue();
          v453 = v372;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v453, 1);
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v389, "sortedArrayUsingDescriptors:", v235);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v399, "setObject:forKeyedSubscript:", v236, CFSTR("TransactionHistory"));

          v414 = 0u;
          v415 = 0u;
          v412 = 0u;
          v413 = 0u;
          v237 = v389;
          v238 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v412, v452, 16);
          if (v238)
          {
            v239 = v238;
            v240 = *(_QWORD *)v413;
            do
            {
              for (j = 0; j != v239; ++j)
              {
                if (*(_QWORD *)v413 != v240)
                  objc_enumerationMutation(v237);
                v242 = *(void **)(*((_QWORD *)&v412 + 1) + 8 * j);
                objc_msgSend(v242, "objectForKey:", CFSTR("fakeTransactionId"));
                v243 = (void *)objc_claimAutoreleasedReturnValue();

                if (v243)
                {
                  objc_msgSend(v242, "objectForKeyedSubscript:", CFSTR("fakeTransactionId"));
                  v244 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v242, "setObject:forKeyedSubscript:", v244, CFSTR("SerialNumber"));

                  objc_msgSend(v242, "removeObjectForKey:", CFSTR("fakeTransactionId"));
                }
              }
              v239 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v412, v452, 16);
            }
            while (v239);
          }

          v12 = v375;
          +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26635, 7, v375, a7);
          v245 = (void *)objc_claimAutoreleasedReturnValue();

          if (v245)
          {
            +[GondolaDecoder decodeAutoTopUpAmount:](GondolaDecoder, "decodeAutoTopUpAmount:", v245);
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v394;
            v122 = v377;
            if ((int)objc_msgSend(v246, "intValue") >= 1)
              objc_msgSend(v399, "setObject:forKeyedSubscript:", v246, CFSTR("CardDefaultAAVSAmount"));

            +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26699, 0, v375, a7);
            v91 = (void *)objc_claimAutoreleasedReturnValue();

            if (v91)
            {
              v247 = v379;
              if (v377)
              {
                +[GondolaDecoder decodeLoyaltyPointBalancesAndExpiration:withActivationDate:](GondolaDecoder, "decodeLoyaltyPointBalancesAndExpiration:withActivationDate:", v91, v377);
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                if (v248)
                  objc_msgSend(v379, "addObjectsFromArray:", v248);

              }
              objc_msgSend(v384, "setObject:forKeyedSubscript:", v379, CFSTR("Balances"));
              v90 = v384;
              objc_msgSend(v399, "setObject:forKeyedSubscript:", v384, CFSTR("State"));
              v174 = 6;
              goto LABEL_334;
            }
            ATLLogObject();
            v362 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v362, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1C3511000, v362, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola loyalty balances, invalid block", v484, 2u);
            }

            v363 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Gondola loyalty balances, invalid block"));
            v251 = (void *)v363;
            v90 = v384;
            if (!a7)
              goto LABEL_332;
            v364 = *a7;
            v253 = (void *)MEMORY[0x1E0CB35C8];
            if (*a7)
            {
              v365 = *MEMORY[0x1E0CB3388];
              v444[0] = *MEMORY[0x1E0CB2D50];
              v444[1] = v365;
              v445[0] = v363;
              v445[1] = v364;
              v255 = (void *)MEMORY[0x1E0C99D80];
              v256 = v445;
              v257 = v444;
LABEL_309:
              v366 = 2;
LABEL_331:
              objc_msgSend(v255, "dictionaryWithObjects:forKeys:count:", v256, v257, v366);
              v370 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v253, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v370);
              *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_332:
              v91 = 0;
LABEL_333:
              v174 = 1;
              v247 = v379;
              goto LABEL_334;
            }
            v446 = *MEMORY[0x1E0CB2D50];
            v447 = v363;
            v255 = (void *)MEMORY[0x1E0C99D80];
            v256 = &v447;
            v257 = &v446;
          }
          else
          {
            ATLLogObject();
            v347 = objc_claimAutoreleasedReturnValue();
            v13 = v394;
            v122 = v377;
            if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1C3511000, v347, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola AAVS settings, invalid block", v484, 2u);
            }

            v348 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Gondola AAVS settings, invalid block"));
            v251 = (void *)v348;
            v90 = v384;
            if (!a7)
              goto LABEL_332;
            v349 = *a7;
            v253 = (void *)MEMORY[0x1E0CB35C8];
            if (*a7)
            {
              v350 = *MEMORY[0x1E0CB3388];
              v448[0] = *MEMORY[0x1E0CB2D50];
              v448[1] = v350;
              v449[0] = v348;
              v449[1] = v349;
              v255 = (void *)MEMORY[0x1E0C99D80];
              v256 = v449;
              v257 = v448;
              goto LABEL_309;
            }
            v450 = *MEMORY[0x1E0CB2D50];
            v451 = v348;
            v255 = (void *)MEMORY[0x1E0C99D80];
            v256 = &v451;
            v257 = &v450;
          }
        }
        else
        {
          ATLLogObject();
          v249 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1C3511000, v249, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola purse, invalid block", v484, 2u);
          }

          v250 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to retrieve Gondola purse, invalid block"));
          v251 = (void *)v250;
          v90 = v384;
          if (!a7)
            goto LABEL_332;
          v252 = *a7;
          v253 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v254 = *MEMORY[0x1E0CB3388];
            v458[0] = *MEMORY[0x1E0CB2D50];
            v458[1] = v254;
            v459[0] = v250;
            v459[1] = v252;
            v255 = (void *)MEMORY[0x1E0C99D80];
            v256 = v459;
            v257 = v458;
            goto LABEL_309;
          }
          v460 = *MEMORY[0x1E0CB2D50];
          v461 = v250;
          v255 = (void *)MEMORY[0x1E0C99D80];
          v256 = &v461;
          v257 = &v460;
        }
        v366 = 1;
        goto LABEL_331;
      default:
        ATLLogObject();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v484 = 67109120;
          v485 = v48;
          _os_log_impl(&dword_1C3511000, v68, OS_LOG_TYPE_ERROR, "Could not GET APPLET HISTORY: unknown Service Provider ID %d in SELECT Response", v484, 8u);
        }

        v69 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not GET APPLET HISTORY: unknown Service Provider ID %d in SELECT Response"), v48);
        v70 = (void *)v69;
        if (a7)
        {
          v71 = *a7;
          v72 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v73 = *MEMORY[0x1E0CB3388];
            v419[0] = *MEMORY[0x1E0CB2D50];
            v419[1] = v73;
            v420[0] = v69;
            v420[1] = v71;
            v74 = (void *)MEMORY[0x1E0C99D80];
            v75 = v420;
            v76 = v419;
            v77 = 2;
          }
          else
          {
            v421 = *MEMORY[0x1E0CB2D50];
            v422 = v69;
            v74 = (void *)MEMORY[0x1E0C99D80];
            v75 = &v422;
            v76 = &v421;
            v77 = 1;
          }
          objc_msgSend(v74, "dictionaryWithObjects:forKeys:count:", v75, v76, v77);
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v173);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_315:
        v53 = 0;
        v52 = 0;
        v51 = 0;
        goto LABEL_316;
    }
  }
  v33 = 0;
LABEL_341:

  return v33;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Supported");
  v8[1] = CFSTR("DelayExpressReentry");
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = &unk_1E7D9ADE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  __objc2_class **v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  unsigned __int16 v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[2];
  unsigned __int8 *v59[2];
  const __CFString *v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  uint64_t v65;
  uint8_t v66[4];
  int v67;
  uint8_t buf[16];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[2];
  _QWORD v80[2];
  uint64_t v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    self->_eotInProgress = 1;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EndOfTransactionCmd(v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v10, "transceive:error:", v13, 0);
    SelectByNameCmd(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "transceiveAndCheckSW:error:", v15, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = (unsigned __int8 *)objc_msgSend(v16, "bytes");
    v59[1] = (unsigned __int8 *)objc_msgSend(v16, "length");
    v57 = 0;
    v58[0] = 0;
    v58[1] = 0;
    DERFindItem(v59, 0xA000000000000005, (uint64_t)&v57);
    if ((_DWORD)v17)
    {
      v18 = v17;
      ATLLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "Failed to find tag 'A5' in Slalom SELECT response, %d", buf, 8u);
      }

      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to find tag 'A5' in Slalom SELECT response, %d"), v18);
      v21 = (void *)v20;
      if (!a7)
        goto LABEL_30;
      v22 = *a7;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v75[0] = *MEMORY[0x1E0CB2D50];
        v75[1] = v24;
        v76[0] = v20;
        v76[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v76;
        v27 = v75;
LABEL_19:
        v44 = 2;
LABEL_29:
        objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v44);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v50);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
        self->_eotInProgress = 0;
        -[NSMutableArray removeAllObjects](self->_hciArray, "removeAllObjects");
        v46 = 0;
LABEL_31:

        goto LABEL_32;
      }
      v77 = *MEMORY[0x1E0CB2D50];
      v78 = v20;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v78;
      v27 = &v77;
      goto LABEL_28;
    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    *(_OWORD *)buf = 0u;
    v38 = DERParseSequenceSpec((uint64_t)v58, (uint64_t)&selectResponseA5ContentSpec, (char *)buf, 0x18uLL);
    if ((_DWORD)v38)
    {
      v39 = v38;
      ATLLogObject();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v66 = 67109120;
        v67 = v39;
        _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "Failed to decode SELECT response contents %d", v66, 8u);
      }

      v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode SELECT response contents %d"), v39);
      v21 = (void *)v41;
      if (!a7)
        goto LABEL_30;
      v42 = *a7;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v43 = *MEMORY[0x1E0CB3388];
        v62[0] = *MEMORY[0x1E0CB2D50];
        v62[1] = v43;
        v63[0] = v41;
        v63[1] = v42;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v63;
        v27 = v62;
        goto LABEL_19;
      }
      v64 = *MEMORY[0x1E0CB2D50];
      v65 = v41;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v65;
      v27 = &v64;
LABEL_28:
      v44 = 1;
      goto LABEL_29;
    }
    v47 = *(unsigned __int8 *)v73;
    v48 = 0x1E0CB3000uLL;
    if ((_DWORD)v47 == 3)
    {
      v49 = &off_1E7D893A8;
    }
    else
    {
      if ((_DWORD)v47 != 2)
      {
        self->_eotInProgress = 0;
        -[NSMutableArray removeAllObjects](self->_hciArray, "removeAllObjects");
        goto LABEL_42;
      }
      v49 = &off_1E7D89490;
    }
    -[__objc2_class generateEndEventFromHCI:withTransceiver:](*v49, "generateEndEventFromHCI:withTransceiver:", self->_hciArray, v10);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeAllObjects](self->_hciArray, "removeAllObjects");
    if (v52)
    {
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("NFServiceProviderID"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("readOnly"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "intValue") == 1
        || objc_msgSend(v53, "intValue") == 4
        || objc_msgSend(v53, "intValue") == 5
        || objc_msgSend(v53, "intValue") == 8)
      {
        v55 = -4095;
      }
      else if (objc_msgSend(v54, "BOOLValue"))
      {
        v55 = -4094;
      }
      else
      {
        v55 = -4095;
      }

      v48 = 0x1E0CB3000;
      goto LABEL_43;
    }
LABEL_42:
    v60 = CFSTR("NFServiceProviderID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v47);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -4094;
LABEL_43:

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v11, CFSTR("appletIdentifier"));
    objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E7D9AE00, CFSTR("type"));
    objc_msgSend(*(id *)(v48 + 2024), "numberWithUnsignedShort:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v56, CFSTR("result"));

    objc_msgSend(v46, "setObject:forKeyedSubscript:", v52, CFSTR("felicaInfo"));
    self->_eotInProgress = 0;

    goto LABEL_31;
  }
  ATLLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "Transceiver is required to process End of Transaction method call.", buf, 2u);
  }

  v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Transceiver is required to process End of Transaction method call."));
  v30 = (void *)v29;
  if (a7)
  {
    v31 = *a7;
    v32 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v33 = *MEMORY[0x1E0CB3388];
      v79[0] = *MEMORY[0x1E0CB2D50];
      v79[1] = v33;
      v80[0] = v29;
      v80[1] = v31;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = v80;
      v36 = v79;
      v37 = 2;
    }
    else
    {
      v81 = *MEMORY[0x1E0CB2D50];
      v82[0] = v29;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = v82;
      v36 = &v81;
      v37 = 1;
    }
    objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, v37);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 4, v45);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[NSMutableArray removeAllObjects](self->_hciArray, "removeAllObjects");
  v46 = 0;
LABEL_32:

  return v46;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t *v96;
  uint64_t *v97;
  NSObject *v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  void *v105;
  id v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t v112;
  NSObject *v113;
  uint64_t v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t v121;
  NSObject *v122;
  uint64_t v123;
  id v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t v130;
  void *v131;
  NSObject *v132;
  uint64_t v133;
  id v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t *v138;
  uint64_t *v139;
  void *v140;
  NSObject *v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  _QWORD v155[2];
  unsigned __int8 *v156[2];
  _QWORD v157[2];
  _QWORD v158[2];
  uint64_t v159;
  uint64_t v160;
  _QWORD v161[2];
  _QWORD v162[2];
  uint64_t v163;
  uint64_t v164;
  _QWORD v165[2];
  _QWORD v166[2];
  uint64_t v167;
  uint64_t v168;
  _QWORD v169[2];
  _QWORD v170[2];
  uint64_t v171;
  uint64_t v172;
  _QWORD v173[2];
  _QWORD v174[2];
  uint64_t v175;
  uint64_t v176;
  _QWORD v177[2];
  _QWORD v178[2];
  uint64_t v179;
  uint64_t v180;
  _QWORD v181[2];
  _QWORD v182[2];
  uint64_t v183;
  uint64_t v184;
  _QWORD v185[2];
  _QWORD v186[2];
  uint64_t v187;
  uint64_t v188;
  _QWORD v189[2];
  _QWORD v190[2];
  uint64_t v191;
  uint64_t v192;
  _QWORD v193[2];
  _QWORD v194[2];
  uint64_t v195;
  uint64_t v196;
  uint8_t v197[4];
  int v198;
  __int128 buf;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _QWORD v206[2];
  _QWORD v207[2];
  uint64_t v208;
  _QWORD v209[4];

  v209[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SelectByNameCmd(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "transceiveAndCheckSW:error:", v11, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v156[0] = (unsigned __int8 *)objc_msgSend(v12, "bytes");
    v156[1] = (unsigned __int8 *)objc_msgSend(v13, "length");
    v154 = 0;
    v155[0] = 0;
    v155[1] = 0;
    DERFindItem(v156, 0xA000000000000005, (uint64_t)&v154);
    if ((_DWORD)v14)
    {
      v15 = v14;
      ATLLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v15;
        _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_ERROR, "Failed to find tag 'A5' in Slalom SELECT response, %d", (uint8_t *)&buf, 8u);
      }

      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to find tag 'A5' in Slalom SELECT response, %d"), v15);
      v18 = (void *)v17;
      if (a7)
      {
        v19 = *a7;
        v20 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v21 = *MEMORY[0x1E0CB3388];
          v206[0] = *MEMORY[0x1E0CB2D50];
          v206[1] = v21;
          v207[0] = v17;
          v207[1] = v19;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = v207;
          v24 = v206;
          v25 = 2;
        }
        else
        {
          v208 = *MEMORY[0x1E0CB2D50];
          v209[0] = v17;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = v209;
          v24 = &v208;
          v25 = 1;
        }
        objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v38);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_17;
    }
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    buf = 0u;
    v26 = DERParseSequenceSpec((uint64_t)v155, (uint64_t)&selectResponseA5ContentSpec, (char *)&buf, 0x18uLL);
    if ((_DWORD)v26)
    {
      v27 = v26;
      ATLLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v197 = 67109120;
        v198 = v27;
        _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "Failed to decode SELECT response contents %d", v197, 8u);
      }

      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode SELECT response contents %d"), v27);
      v30 = (void *)v29;
      if (a7)
      {
        v31 = *a7;
        v32 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v33 = *MEMORY[0x1E0CB3388];
          v193[0] = *MEMORY[0x1E0CB2D50];
          v193[1] = v33;
          v194[0] = v29;
          v194[1] = v31;
          v34 = (void *)MEMORY[0x1E0C99D80];
          v35 = v194;
          v36 = v193;
          v37 = 2;
        }
        else
        {
          v195 = *MEMORY[0x1E0CB2D50];
          v196 = v29;
          v34 = (void *)MEMORY[0x1E0C99D80];
          v35 = &v196;
          v36 = &v195;
          v37 = 1;
        }
        objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v32;
        v55 = 3;
LABEL_27:
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v55, v41);
        v39 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_110:

        goto LABEL_111;
      }
      goto LABEL_40;
    }
    v40 = *(unsigned __int8 *)v204;
    if ((_DWORD)v40 != 7)
    {
      if ((_DWORD)v40 == 4)
      {
        v30 = (void *)objc_opt_new();
        v41 = (void *)objc_opt_new();
        objc_msgSend(v41, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 21899, 0, v9, a7);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 21899, 1, v9, a7);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v43;
        if (v42 && v43)
        {
          +[MogulDecoder decodeCardID:](MogulDecoder, "decodeCardID:", v42);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "asHexString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v45, CFSTR("CardNumber"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", +[MogulDecoder decodeTopupFlag:](MogulDecoder, "decodeTopupFlag:", v44));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v46, CFSTR("TopUpFlag"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", +[MogulDecoder decodeTopupSettings:](MogulDecoder, "decodeTopupSettings:", v44));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v47, CFSTR("TopUpSettings"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[MogulDecoder decodeEnableFlag:](MogulDecoder, "decodeEnableFlag:", v44));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v48, CFSTR("EffectiveFlag"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", +[MogulDecoder decodeStatusFlag:](MogulDecoder, "decodeStatusFlag:", v44));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v49, CFSTR("StatusFlag"));

          +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 21911, 0, v9, a7);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            objc_msgSend(v50, "asHexString");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v51, CFSTR("BalanceBlock"));

            +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 22027, 1, v9, a7);
            v42 = v50;
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
            {
              objc_msgSend(v52, "asHexString");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v53, CFSTR("PointBlock"));

              objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v30, 1, a7);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v153 = v42;
              ATLLogObject();
              v122 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v197 = 0;
                _os_log_impl(&dword_1C3511000, v122, OS_LOG_TYPE_ERROR, "Failed to decode Mogul SP Opaque Data", v197, 2u);
              }

              v123 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Mogul SP Opaque Data"));
              v52 = (void *)v123;
              if (a7)
              {
                v124 = *a7;
                v125 = (void *)MEMORY[0x1E0CB35C8];
                if (*a7)
                {
                  v126 = *MEMORY[0x1E0CB3388];
                  v181[0] = *MEMORY[0x1E0CB2D50];
                  v181[1] = v126;
                  v182[0] = v123;
                  v182[1] = v124;
                  v127 = (void *)MEMORY[0x1E0C99D80];
                  v128 = v182;
                  v129 = v181;
                  v130 = 2;
                }
                else
                {
                  v183 = *MEMORY[0x1E0CB2D50];
                  v184 = v123;
                  v127 = (void *)MEMORY[0x1E0C99D80];
                  v128 = &v184;
                  v129 = &v183;
                  v130 = 1;
                }
                objc_msgSend(v127, "dictionaryWithObjects:forKeys:count:", v128, v129, v130);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v125, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v148);
                *a7 = (id)objc_claimAutoreleasedReturnValue();

              }
              v39 = 0;
              v42 = v153;
            }
          }
          else
          {
            ATLLogObject();
            v113 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v197 = 0;
              _os_log_impl(&dword_1C3511000, v113, OS_LOG_TYPE_ERROR, "Failed to decode Mogul SP Opaque Data", v197, 2u);
            }

            v114 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Mogul SP Opaque Data"));
            v52 = (void *)v114;
            if (a7)
            {
              v115 = *a7;
              v116 = (void *)MEMORY[0x1E0CB35C8];
              if (*a7)
              {
                v117 = *MEMORY[0x1E0CB3388];
                v185[0] = *MEMORY[0x1E0CB2D50];
                v185[1] = v117;
                v186[0] = v114;
                v186[1] = v115;
                v118 = (void *)MEMORY[0x1E0C99D80];
                v119 = v186;
                v120 = v185;
                v121 = 2;
              }
              else
              {
                v187 = *MEMORY[0x1E0CB2D50];
                v188 = v114;
                v118 = (void *)MEMORY[0x1E0C99D80];
                v119 = &v188;
                v120 = &v187;
                v121 = 1;
              }
              objc_msgSend(v118, "dictionaryWithObjects:forKeys:count:", v119, v120, v121);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v147);
              *a7 = (id)objc_claimAutoreleasedReturnValue();

            }
            v39 = 0;
            v42 = v44;
          }
        }
        else
        {
          ATLLogObject();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v197 = 0;
            _os_log_impl(&dword_1C3511000, v81, OS_LOG_TYPE_ERROR, "Failed to decode Mogul SP Opaque Data", v197, 2u);
          }

          v82 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Mogul SP Opaque Data"));
          v83 = (void *)v82;
          if (a7)
          {
            v84 = *a7;
            v152 = (void *)MEMORY[0x1E0CB35C8];
            if (*a7)
            {
              v85 = *MEMORY[0x1E0CB3388];
              v189[0] = *MEMORY[0x1E0CB2D50];
              v189[1] = v85;
              v190[0] = v82;
              v190[1] = v84;
              v86 = (void *)MEMORY[0x1E0C99D80];
              v87 = v190;
              v88 = v189;
              v89 = 2;
            }
            else
            {
              v191 = *MEMORY[0x1E0CB2D50];
              v192 = v82;
              v86 = (void *)MEMORY[0x1E0C99D80];
              v87 = &v192;
              v88 = &v191;
              v89 = 1;
            }
            objc_msgSend(v86, "dictionaryWithObjects:forKeys:count:", v87, v88, v89);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v131);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
          v39 = 0;
          v52 = v44;
        }

        goto LABEL_110;
      }
      ATLLogObject();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v197 = 67109120;
        v198 = v40;
        _os_log_impl(&dword_1C3511000, v72, OS_LOG_TYPE_ERROR, "No Opaque Data for TypeF provider %d", v197, 8u);
      }

      v73 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No Opaque Data for TypeF provider %d"), v40);
      v30 = (void *)v73;
      if (a7)
      {
        v74 = *a7;
        v75 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v76 = *MEMORY[0x1E0CB3388];
          v157[0] = *MEMORY[0x1E0CB2D50];
          v157[1] = v76;
          v158[0] = v73;
          v158[1] = v74;
          v77 = (void *)MEMORY[0x1E0C99D80];
          v78 = v158;
          v79 = v157;
          v80 = 2;
        }
        else
        {
          v159 = *MEMORY[0x1E0CB2D50];
          v160 = v73;
          v77 = (void *)MEMORY[0x1E0C99D80];
          v78 = &v160;
          v79 = &v159;
          v80 = 1;
        }
        objc_msgSend(v77, "dictionaryWithObjects:forKeys:count:", v78, v79, v80);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v75;
        v55 = 2;
        goto LABEL_27;
      }
LABEL_40:
      v39 = 0;
LABEL_111:

      goto LABEL_112;
    }
    v30 = (void *)objc_opt_new();
    +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26575, 0, v9, a7);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26575, 1, v9, a7);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      +[GondolaDecoder decodeCardNumberFromBlock0:andBlock1:](GondolaDecoder, "decodeCardNumberFromBlock0:andBlock1:", v56, v41);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "asHexString");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v58, CFSTR("CardNumber"));

      +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26647, 0, v9, a7);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        objc_msgSend(v59, "subdataWithOffset:length:", 0, 4);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "asHexString");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v61, CFSTR("Balance"));

        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26571, 1, v9, a7);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26571, 0, v9, a7);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v62 || !v63)
        {
          ATLLogObject();
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v197 = 0;
            _os_log_impl(&dword_1C3511000, v103, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
          }

          v104 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Gondola SP Opaque Data"));
          v105 = (void *)v104;
          if (a7)
          {
            v106 = *a7;
            v107 = (void *)MEMORY[0x1E0CB35C8];
            if (*a7)
            {
              v108 = *MEMORY[0x1E0CB3388];
              v169[0] = *MEMORY[0x1E0CB2D50];
              v169[1] = v108;
              v170[0] = v104;
              v170[1] = v106;
              v109 = (void *)MEMORY[0x1E0C99D80];
              v110 = v170;
              v111 = v169;
              v112 = 2;
            }
            else
            {
              v171 = *MEMORY[0x1E0CB2D50];
              v172 = v104;
              v109 = (void *)MEMORY[0x1E0C99D80];
              v110 = &v172;
              v111 = &v171;
              v112 = 1;
            }
            objc_msgSend(v109, "dictionaryWithObjects:forKeys:count:", v110, v111, v112);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v146);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_107;
        }
        objc_msgSend(v62, "subdataWithOffset:length:", 3, 3);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "asHexString");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v65, CFSTR("EntryDate"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[GondolaDecoder isCardUsageFlag:](GondolaDecoder, "isCardUsageFlag:", v63));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v66, CFSTR("UsageStartFlag"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v62, "u8:", 12));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v67, CFSTR("BrandApplicationStatus"));

        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26699, 0, v9, a7);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          objc_msgSend(v68, "asHexString");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v69, CFSTR("PointBlock"));

          +[SlalomDecoder getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:](SlalomDecoder, "getDataAndCheckFeliCaServiceCode:withBlockNumber:withTransceiver:withError:", 26635, 7, v9, a7);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v63)
          {
            objc_msgSend(v63, "subdataWithOffset:length:", 4, 5);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "asHexString");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v71, CFSTR("BitData9"));

            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v30, 1, a7);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_108:
            v41 = v62;
            goto LABEL_109;
          }
          ATLLogObject();
          v141 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v197 = 0;
            _os_log_impl(&dword_1C3511000, v141, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
          }

          v142 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Gondola SP Opaque Data"));
          v63 = (void *)v142;
          if (!a7)
          {
LABEL_107:
            v39 = 0;
            goto LABEL_108;
          }
          v143 = *a7;
          v135 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v144 = *MEMORY[0x1E0CB3388];
            v161[0] = *MEMORY[0x1E0CB2D50];
            v161[1] = v144;
            v162[0] = v142;
            v162[1] = v143;
            v137 = (void *)MEMORY[0x1E0C99D80];
            v138 = v162;
            v139 = v161;
            goto LABEL_92;
          }
          v163 = *MEMORY[0x1E0CB2D50];
          v164 = v142;
          v137 = (void *)MEMORY[0x1E0C99D80];
          v138 = &v164;
          v139 = &v163;
        }
        else
        {
          ATLLogObject();
          v132 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v197 = 0;
            _os_log_impl(&dword_1C3511000, v132, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
          }

          v133 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Gondola SP Opaque Data"));
          v63 = (void *)v133;
          if (!a7)
            goto LABEL_107;
          v134 = *a7;
          v135 = (void *)MEMORY[0x1E0CB35C8];
          if (*a7)
          {
            v136 = *MEMORY[0x1E0CB3388];
            v165[0] = *MEMORY[0x1E0CB2D50];
            v165[1] = v136;
            v166[0] = v133;
            v166[1] = v134;
            v137 = (void *)MEMORY[0x1E0C99D80];
            v138 = v166;
            v139 = v165;
LABEL_92:
            v145 = 2;
LABEL_106:
            objc_msgSend(v137, "dictionaryWithObjects:forKeys:count:", v138, v139, v145);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v149);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_107;
          }
          v167 = *MEMORY[0x1E0CB2D50];
          v168 = v133;
          v137 = (void *)MEMORY[0x1E0C99D80];
          v138 = &v168;
          v139 = &v167;
        }
        v145 = 1;
        goto LABEL_106;
      }
      ATLLogObject();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v197 = 0;
        _os_log_impl(&dword_1C3511000, v98, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
      }

      v99 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Gondola SP Opaque Data"));
      v63 = (void *)v99;
      if (!a7)
      {
LABEL_86:
        v39 = 0;
LABEL_109:

        goto LABEL_110;
      }
      v100 = *a7;
      v93 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v101 = *MEMORY[0x1E0CB3388];
        v173[0] = *MEMORY[0x1E0CB2D50];
        v173[1] = v101;
        v174[0] = v99;
        v174[1] = v100;
        v95 = (void *)MEMORY[0x1E0C99D80];
        v96 = v174;
        v97 = v173;
        goto LABEL_56;
      }
      v175 = *MEMORY[0x1E0CB2D50];
      v176 = v99;
      v95 = (void *)MEMORY[0x1E0C99D80];
      v96 = &v176;
      v97 = &v175;
    }
    else
    {
      ATLLogObject();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v197 = 0;
        _os_log_impl(&dword_1C3511000, v90, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
      }

      v91 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Gondola SP Opaque Data"));
      v63 = (void *)v91;
      if (!a7)
        goto LABEL_86;
      v92 = *a7;
      v93 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v94 = *MEMORY[0x1E0CB3388];
        v177[0] = *MEMORY[0x1E0CB2D50];
        v177[1] = v94;
        v178[0] = v91;
        v178[1] = v92;
        v95 = (void *)MEMORY[0x1E0C99D80];
        v96 = v178;
        v97 = v177;
LABEL_56:
        v102 = 2;
LABEL_85:
        objc_msgSend(v95, "dictionaryWithObjects:forKeys:count:", v96, v97, v102);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v140);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_86;
      }
      v179 = *MEMORY[0x1E0CB2D50];
      v180 = v91;
      v95 = (void *)MEMORY[0x1E0C99D80];
      v96 = &v180;
      v97 = &v179;
    }
    v102 = 1;
    goto LABEL_85;
  }
LABEL_17:
  v39 = 0;
LABEL_112:

  return v39;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  return -[SlalomDecoder getServiceProviderData:withPackage:withModule:withTransceiver:withError:](self, "getServiceProviderData:withPackage:withModule:withTransceiver:withError:", a3, a4, a5, a8, a9);
}

+ (id)getDataAndCheckFeliCaServiceCode:(unsigned __int16)a3 withBlockNumber:(unsigned __int8)a4 withTransceiver:(id)a5 withError:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v7 = a4;
  v8 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  FelicaGetDataFileSystemCommand(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "transceiveAndCheckSW:error:", v10, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      FeliCaGetBlockDataFromGetDataCommand(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ATLLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        v31 = v8;
        v32 = 1024;
        v33 = v7;
        v34 = 2112;
        v35 = 0;
        _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "FeliCa GET DATA for Service Code %d and block %d is invalid: %@", buf, 0x18u);
      }

      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FeliCa GET DATA for Service Code %d and block %d is invalid: %@"), v8, v7, 0);
      v16 = (void *)v15;
      if (a6)
      {
        v17 = *a6;
        v18 = (void *)MEMORY[0x1E0CB35C8];
        if (*a6)
        {
          v19 = *MEMORY[0x1E0CB3388];
          v26[0] = *MEMORY[0x1E0CB2D50];
          v26[1] = v19;
          v27[0] = v15;
          v27[1] = v17;
          v20 = (void *)MEMORY[0x1E0C99D80];
          v21 = v27;
          v22 = v26;
          v23 = 2;
        }
        else
        {
          v28 = *MEMORY[0x1E0CB2D50];
          v29 = v15;
          v20 = (void *)MEMORY[0x1E0C99D80];
          v21 = &v29;
          v22 = &v28;
          v23 = 1;
        }
        objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v24);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_hciArray, 0);
}

@end
