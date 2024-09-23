@implementation AtlasDecoder

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AtlasDecoder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance__singleton;
}

void __30__AtlasDecoder_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__singleton;
  sharedInstance__singleton = (uint64_t)v1;

}

- (id)getATLTimer
{
  return self->_timer;
}

- (AtlasDecoder)init
{
  AtlasDecoder *v2;
  NSMutableArray *v3;
  NSMutableArray *hciArray;
  ATLTimer *v5;
  void *v6;
  AtlasDecoder *v7;
  ATLTimer *v8;
  ATLTimer *timer;
  _QWORD v11[4];
  AtlasDecoder *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AtlasDecoder;
  v2 = -[AtlasDecoder init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hciArray = v2->_hciArray;
    v2->_hciArray = v3;

    v5 = [ATLTimer alloc];
    dispatch_get_global_queue(0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __20__AtlasDecoder_init__block_invoke;
    v11[3] = &unk_1E7D8A680;
    v7 = v2;
    v12 = v7;
    v8 = (ATLTimer *)-[ATLTimer initOnQueue:withTimerBlock:](v5, v6, v11);
    timer = v7->_timer;
    v7->_timer = v8;

    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v7);
  }
  return v2;
}

void __20__AtlasDecoder_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1C3511000, v2, OS_LOG_TYPE_DEBUG, "dispatching timer block", (uint8_t *)&v7, 2u);
  }

  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "generateEndEventFromHCI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[AppletTranslator getATLDelegate]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEBUG, "EndEvent sent %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v5, "notifyTransactionEvent:", v4);
  }

  objc_sync_exit(v3);
}

- (void)cleanup
{
  NSObject *v3;
  AtlasDecoder *v4;
  NSNumber *serviceProvider;
  NSString *appletAID;
  NSNumber *errorCode;
  NSData *transactionDetailRaw;
  uint8_t v9[16];

  ATLLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C3511000, v3, OS_LOG_TYPE_DEBUG, "Starting cleanup", v9, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeAllObjects](v4->_hciArray, "removeAllObjects");
  serviceProvider = v4->_serviceProvider;
  v4->_serviceProvider = 0;

  appletAID = v4->_appletAID;
  v4->_appletAID = 0;

  v4->_errorTransaction = 0;
  errorCode = v4->_errorCode;
  v4->_errorCode = 0;

  transactionDetailRaw = v4->_transactionDetailRaw;
  v4->_transactionDetailRaw = 0;

  -[ATLTimer stopTimer]((dispatch_source_t *)v4->_timer);
  objc_sync_exit(v4);

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
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  AtlasDecoder *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  int v55;
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!self->_appletAID)
    objc_storeStrong((id *)&self->_appletAID, a4);
  if ((unint64_t)objc_msgSend(v14, "length") > 1)
  {
    v25 = objc_retainAutorelease(v14);
    v26 = *(unsigned __int8 *)objc_msgSend(v25, "bytes");
    v27 = objc_retainAutorelease(v25);
    v28 = *(unsigned __int8 *)(objc_msgSend(v27, "bytes") + 1);
    if ((_DWORD)v28 != 7)
    {
      ATLLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v53 = v28;
        _os_log_impl(&dword_1C3511000, v31, OS_LOG_TYPE_ERROR, "Unsupported version %u", buf, 8u);
      }

      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported version %u"), v28);
      v21 = (void *)v32;
      if (a8)
      {
        v33 = *a8;
        v34 = (void *)MEMORY[0x1E0CB35C8];
        if (*a8)
        {
          v35 = *MEMORY[0x1E0CB3388];
          v56[0] = *MEMORY[0x1E0CB2D50];
          v56[1] = v35;
          v57[0] = v32;
          v57[1] = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
        }
        else
        {
          v58 = *MEMORY[0x1E0CB2D50];
          v59 = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v37);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_28;
    }
    v29 = self;
    objc_sync_enter(v29);
    if ((int)v26 <= 16)
    {
      if ((_DWORD)v26 == 1)
      {
        -[AtlasDecoder parseStartEvent:withApplet:error:](v29, "parseStartEvent:withApplet:error:", v27, v15, a8);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      if ((_DWORD)v26 == 2)
      {
        -[AtlasDecoder parseEndEvent:withApplet:error:](v29, "parseEndEvent:withApplet:error:", v27, v15, a8);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
    }
    else
    {
      switch((_DWORD)v26)
      {
        case 0x11:
          -[AtlasDecoder parseTransactionEvent:withApplet:error:](v29, "parseTransactionEvent:withApplet:error:", v27, v15, a8);
          v30 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case 0x12:
          -[AtlasDecoder parseDeselectEvent:withApplet:error:](v29, "parseDeselectEvent:withApplet:error:", v27, v15, a8);
          v30 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case 0x13:
          -[AtlasDecoder parseCommandEvent:withApplet:error:](v29, "parseCommandEvent:withApplet:error:", v27, v15, a8);
          v30 = objc_claimAutoreleasedReturnValue();
LABEL_33:
          v38 = (void *)v30;
          objc_sync_exit(v29);

          goto LABEL_34;
      }
    }
    objc_sync_exit(v29);

    ATLLogObject();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v53 = v26;
      v54 = 1024;
      v55 = 7;
      _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
    }

    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid event type 0x%x version 0x%x"), v26, 7);
    v42 = (void *)v41;
    if (a8)
    {
      v43 = *a8;
      v44 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v45 = *MEMORY[0x1E0CB3388];
        v48[0] = *MEMORY[0x1E0CB2D50];
        v48[1] = v45;
        v49[0] = v41;
        v49[1] = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
        v46 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = *MEMORY[0x1E0CB2D50];
        v51 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v47 = (void *)v46;
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v46);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_29;
  }
  ATLLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v53 = objc_msgSend(v14, "length");
    _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
  }

  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid eventData length %u"), objc_msgSend(v14, "length"));
  v21 = (void *)v20;
  if (a8)
  {
    v22 = *a8;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v24 = *MEMORY[0x1E0CB3388];
      v60[0] = *MEMORY[0x1E0CB2D50];
      v60[1] = v24;
      v61[0] = v20;
      v61[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    }
    else
    {
      v62 = *MEMORY[0x1E0CB2D50];
      v63[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 6, v36);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_28:

LABEL_29:
  v38 = 0;
LABEL_34:

  return v38;
}

- (id)parseCommandEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint8_t buf[4];
  id *v54;
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[2];
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  _QWORD v66[2];
  uint64_t v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") == 10)
  {
    v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (*(_BYTE *)(v10 + 1) == 7)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10 + 3, 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned __int16 *)(v10 + 8);
      v13 = objc_msgSend(v11, "u8:", 1);
      if (*(_BYTE *)(v10 + 2) == 1)
      {
        v36 = CFSTR("Contactless");
LABEL_31:
        v55[0] = CFSTR("EventType");
        v55[1] = CFSTR("appletIdentifier");
        v56[1] = v9;
        v56[2] = v36;
        v56[0] = CFSTR("CommandEvent");
        v55[2] = CFSTR("Interface");
        v55[3] = CFSTR("Version");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 1));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v56[3] = v49;
        v56[4] = v11;
        v55[4] = CFSTR("command");
        v55[5] = CFSTR("status");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", __rev16(v12));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v56[5] = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 6);
        a5 = (id *)objc_claimAutoreleasedReturnValue();

        ATLLogObject();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v54 = a5;
          _os_log_impl(&dword_1C3511000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        -[NSMutableArray addObject:](self->_hciArray, "addObject:", a5);
        goto LABEL_29;
      }
      if (!*(_BYTE *)(v10 + 2))
      {
        if (v13 == 142)
        {
          -[AtlasDecoder generateContactEndEvent:withDidError:](self, "generateContactEndEvent:withDidError:", v9, v12 != 144);
          a5 = (id *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        v36 = CFSTR("Contact");
        goto LABEL_31;
      }
      ATLLogObject();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = *(unsigned __int8 *)(v10 + 2);
        *(_DWORD *)buf = 67109120;
        LODWORD(v54) = v38;
        _os_log_impl(&dword_1C3511000, v37, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
      }

      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown interface type %u"), *(unsigned __int8 *)(v10 + 2));
      v40 = (void *)v39;
      if (a5)
      {
        v41 = *a5;
        v42 = (void *)MEMORY[0x1E0CB35C8];
        if (*a5)
        {
          v43 = *MEMORY[0x1E0CB3388];
          v57[0] = *MEMORY[0x1E0CB2D50];
          v57[1] = v43;
          v58[0] = v39;
          v58[1] = v41;
          v44 = (void *)MEMORY[0x1E0C99D80];
          v45 = v58;
          v46 = v57;
          v47 = 2;
        }
        else
        {
          v59 = *MEMORY[0x1E0CB2D50];
          v60 = v39;
          v44 = (void *)MEMORY[0x1E0C99D80];
          v45 = &v60;
          v46 = &v59;
          v47 = 1;
        }
        objc_msgSend(v44, "dictionaryWithObjects:forKeys:count:", v45, v46, v47);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v52);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_28:
      a5 = 0;
      goto LABEL_29;
    }
    ATLLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(unsigned __int8 *)(v10 + 1);
      *(_DWORD *)buf = 67109120;
      LODWORD(v54) = v24;
      _os_log_impl(&dword_1C3511000, v23, OS_LOG_TYPE_ERROR, "Command Event version %u", buf, 8u);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Command Event version %u"), *(unsigned __int8 *)(v10 + 1));
    v11 = (void *)v25;
    if (a5)
    {
      v26 = *a5;
      v27 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v28 = *MEMORY[0x1E0CB3388];
        v61[0] = *MEMORY[0x1E0CB2D50];
        v61[1] = v28;
        v62[0] = v25;
        v62[1] = v26;
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = v62;
        v31 = v61;
        v32 = 2;
      }
      else
      {
        v63 = *MEMORY[0x1E0CB2D50];
        v64 = v25;
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = &v64;
        v31 = &v63;
        v32 = 1;
      }
      objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v27;
      v35 = 3;
LABEL_27:
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v35, v33);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
  }
  else
  {
    ATLLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v54) = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid eventData length %u"), objc_msgSend(v8, "length"));
    v11 = (void *)v15;
    if (a5)
    {
      v16 = *a5;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v18 = *MEMORY[0x1E0CB3388];
        v65[0] = *MEMORY[0x1E0CB2D50];
        v65[1] = v18;
        v66[0] = v15;
        v66[1] = v16;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v66;
        v21 = v65;
        v22 = 2;
      }
      else
      {
        v67 = *MEMORY[0x1E0CB2D50];
        v68[0] = v15;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v68;
        v21 = &v67;
        v22 = 1;
      }
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v17;
      v35 = 6;
      goto LABEL_27;
    }
  }
LABEL_29:

  return a5;
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
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSData *v50;
  NSData *transactionDetailRaw;
  NSData *v52;
  NSData *v53;
  void *v54;
  NSNumber *v55;
  NSNumber *errorCode;
  uint64_t v57;
  NSObject *v58;
  NSNumber *v59;
  NSObject *v60;
  NSData *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *log;
  _QWORD v69[2];
  _QWORD v70[8];
  _QWORD v71[8];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  NSData *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[2];
  _QWORD v81[2];
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[2];
  _QWORD v85[2];
  uint64_t v86;
  _QWORD v87[4];

  v87[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "length") <= 2)
  {
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v73) = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid eventData length %u"), objc_msgSend(v8, "length"));
    v12 = (void *)v11;
    if (!a5)
      goto LABEL_60;
    v13 = *a5;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v15 = *MEMORY[0x1E0CB3388];
      v84[0] = *MEMORY[0x1E0CB2D50];
      v84[1] = v15;
      v85[0] = v11;
      v85[1] = v13;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v85;
      v18 = v84;
      v19 = 2;
    }
    else
    {
      v86 = *MEMORY[0x1E0CB2D50];
      v87[0] = v11;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v87;
      v18 = &v86;
      v19 = 1;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v14;
    v35 = 6;
LABEL_59:
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v35, v33);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_60:
    v38 = 0;
    goto LABEL_61;
  }
  v20 = objc_retainAutorelease(v8);
  v21 = objc_msgSend(v20, "bytes");
  v22 = v21;
  if (*(_BYTE *)(v21 + 1) != 7)
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(unsigned __int8 *)(v22 + 1);
      *(_DWORD *)buf = 67109120;
      LODWORD(v73) = v25;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Start Event version %u", buf, 8u);
    }

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start Event version %u"), *(unsigned __int8 *)(v22 + 1));
    v12 = (void *)v26;
    if (!a5)
      goto LABEL_60;
    v27 = *a5;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v29 = *MEMORY[0x1E0CB3388];
      v80[0] = *MEMORY[0x1E0CB2D50];
      v80[1] = v29;
      v81[0] = v26;
      v81[1] = v27;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = v81;
      v32 = v80;
LABEL_28:
      v44 = 2;
LABEL_58:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v44);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v28;
      v35 = 3;
      goto LABEL_59;
    }
    v82 = *MEMORY[0x1E0CB2D50];
    v83 = v26;
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v83;
    v32 = &v82;
LABEL_57:
    v44 = 1;
    goto LABEL_58;
  }
  if (*(_BYTE *)(v21 + 2))
  {
    if (*(_BYTE *)(v21 + 2) == 1)
    {
      v23 = CFSTR("Contactless");
      goto LABEL_19;
    }
    ATLLogObject();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = *(unsigned __int8 *)(v22 + 2);
      *(_DWORD *)buf = 67109120;
      LODWORD(v73) = v40;
      _os_log_impl(&dword_1C3511000, v39, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
    }

    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown interface type %u"), *(unsigned __int8 *)(v22 + 2));
    v12 = (void *)v41;
    if (!a5)
      goto LABEL_60;
    v42 = *a5;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v43 = *MEMORY[0x1E0CB3388];
      v76[0] = *MEMORY[0x1E0CB2D50];
      v76[1] = v43;
      v77[0] = v41;
      v77[1] = v42;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = v77;
      v32 = v76;
      goto LABEL_28;
    }
    v78 = *MEMORY[0x1E0CB2D50];
    v79 = v41;
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v79;
    v32 = &v78;
    goto LABEL_57;
  }
  v23 = CFSTR("Contact");
LABEL_19:
  v69[0] = v21 + 3;
  v69[1] = objc_msgSend(v20, "length") - 3;
  +[AtlasDecoder DecodeTransactionE1TLV:error:](AtlasDecoder, "DecodeTransactionE1TLV:error:", v69, a5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (a5)
  {
    v38 = 0;
    if (*a5 || !v36)
      goto LABEL_55;
LABEL_30:
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("recordData"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "sfi") == 8 || objc_msgSend(v45, "sfi") == 29)
    {
      objc_msgSend(v45, "content");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[AtlasDecoder decodeEventEntry:](AtlasDecoder, "decodeEventEntry:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("EventCode"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        +[AtlasDecoder formatTransitDetailRaw:](AtlasDecoder, "formatTransitDetailRaw:", v48);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = (NSData *)v49;
        if (v49)
        {
          transactionDetailRaw = self->_transactionDetailRaw;
          if (transactionDetailRaw)
          {
            if ((NSData *)v49 != transactionDetailRaw)
            {
              ATLLogObject();
              log = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                v52 = self->_transactionDetailRaw;
                *(_DWORD *)buf = 138412546;
                v73 = v52;
                v74 = 2112;
                v75 = v50;
                _os_log_impl(&dword_1C3511000, log, OS_LOG_TYPE_DEFAULT, "Inconsistent transaction details received during a single transaction %@ -> %@", buf, 0x16u);
              }

            }
          }
        }
        v53 = self->_transactionDetailRaw;
        self->_transactionDetailRaw = v50;

      }
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("EventResult"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("EventResult"));
        v55 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        errorCode = self->_errorCode;
        self->_errorCode = v55;

        v57 = -[NSNumber longLongValue](self->_errorCode, "longLongValue");
        if ((unint64_t)(v57 - 32) >= 2 && (unint64_t)(v57 - 131) >= 2)
          self->_errorTransaction = 1;
        ATLLogObject();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = self->_errorCode;
          *(_DWORD *)buf = 138412290;
          v73 = v59;
          _os_log_impl(&dword_1C3511000, v58, OS_LOG_TYPE_DEFAULT, "*** SpecialEvent written with ErrorCode = %@", buf, 0xCu);
        }

      }
    }
    ATLLogObject();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      v61 = self->_transactionDetailRaw;
      *(_DWORD *)buf = 138412290;
      v73 = v61;
      _os_log_impl(&dword_1C3511000, v60, OS_LOG_TYPE_DEBUG, "*** _transactionDetailRaw = %@", buf, 0xCu);
    }

    v70[0] = CFSTR("EventType");
    v70[1] = CFSTR("appletIdentifier");
    v71[1] = v9;
    v71[2] = v23;
    v71[0] = CFSTR("TransactionEvent");
    v70[2] = CFSTR("Interface");
    v70[3] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v22 + 1));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v62;
    v71[4] = &unk_1E7D9AAB8;
    v70[4] = CFSTR("spIdentifier");
    v70[5] = CFSTR("sfi");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v45, "sfi"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v71[5] = v63;
    v70[6] = CFSTR("recordId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v45, "recordId"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v71[6] = v64;
    v70[7] = CFSTR("recordContent");
    objc_msgSend(v45, "content");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v71[7] = v65;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    ATLLogObject();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v38;
      _os_log_impl(&dword_1C3511000, v66, OS_LOG_TYPE_DEBUG, "TransactionEvent %@", buf, 0xCu);
    }

    -[NSMutableArray addObject:](self->_hciArray, "addObject:", v38);
    goto LABEL_55;
  }
  if (v36)
    goto LABEL_30;
  v38 = 0;
LABEL_55:

LABEL_61:
  return v38;
}

- (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
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
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v38[9];
  _QWORD v39[9];
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") != 3)
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v53 = objc_msgSend(v8, "length");
      v54 = 2048;
      v55 = 3;
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "Start Event length %zu (exp %zu)", buf, 0x16u);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start Event length %zu (exp %zu)"), objc_msgSend(v8, "length"), 3);
    v15 = (void *)v14;
    if (!a5)
      goto LABEL_33;
    v16 = *a5;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (!*a5)
    {
      v50 = *MEMORY[0x1E0CB2D50];
      v51 = v14;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v51;
      v21 = &v50;
      goto LABEL_31;
    }
    v18 = *MEMORY[0x1E0CB3388];
    v48[0] = *MEMORY[0x1E0CB2D50];
    v48[1] = v18;
    v49[0] = v14;
    v49[1] = v16;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v49;
    v21 = v48;
LABEL_28:
    v35 = 2;
LABEL_32:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v36);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
    goto LABEL_33;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  v11 = v10;
  if (*(_BYTE *)(v10 + 1) != 7)
  {
    ATLLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(unsigned __int8 *)(v11 + 1);
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = v23;
      _os_log_impl(&dword_1C3511000, v22, OS_LOG_TYPE_ERROR, "Start Event version %u", buf, 8u);
    }

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start Event version %u"), *(unsigned __int8 *)(v11 + 1));
    v15 = (void *)v24;
    if (!a5)
      goto LABEL_33;
    v25 = *a5;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (!*a5)
    {
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = v24;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v47;
      v21 = &v46;
      goto LABEL_31;
    }
    v26 = *MEMORY[0x1E0CB3388];
    v44[0] = *MEMORY[0x1E0CB2D50];
    v44[1] = v26;
    v45[0] = v24;
    v45[1] = v25;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v45;
    v21 = v44;
    goto LABEL_28;
  }
  if (!*(_BYTE *)(v10 + 2))
  {
    v12 = CFSTR("Contact");
    goto LABEL_18;
  }
  if (*(_BYTE *)(v10 + 2) == 1)
  {
    v12 = CFSTR("Contactless");
LABEL_18:
    v38[0] = CFSTR("EventType");
    v38[1] = CFSTR("appletIdentifier");
    v39[1] = v9;
    v39[2] = v12;
    v39[0] = CFSTR("StartEvent");
    v38[2] = CFSTR("Interface");
    v38[3] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = CFSTR("IgnoreRFEvents");
    v38[5] = CFSTR("DontWaitForEOT");
    v39[5] = MEMORY[0x1E0C9AAB0];
    v39[6] = MEMORY[0x1E0C9AAB0];
    v39[3] = v27;
    v39[4] = MEMORY[0x1E0C9AAA0];
    v38[6] = CFSTR("RequiresPowerCycle");
    v38[7] = CFSTR("EoTCallbackExpected");
    v38[8] = CFSTR("DelayExpressReentry");
    v39[7] = MEMORY[0x1E0C9AAA0];
    v39[8] = &unk_1E7D9AAD0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    ATLLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (uint64_t)v15;
      _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    ATLLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_DEBUG, "Stopping currently running timer due to incoming SELECT", buf, 2u);
    }

    -[ATLTimer stopTimer]((dispatch_source_t *)self->_timer);
    -[NSMutableArray addObject:](self->_hciArray, "addObject:", a5);
    goto LABEL_33;
  }
  ATLLogObject();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = *(unsigned __int8 *)(v11 + 2);
    *(_DWORD *)buf = 67109120;
    LODWORD(v53) = v31;
    _os_log_impl(&dword_1C3511000, v30, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
  }

  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown interface type %u"), *(unsigned __int8 *)(v11 + 2));
  v15 = (void *)v32;
  if (a5)
  {
    v33 = *a5;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v34 = *MEMORY[0x1E0CB3388];
      v40[0] = *MEMORY[0x1E0CB2D50];
      v40[1] = v34;
      v41[0] = v32;
      v41[1] = v33;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v41;
      v21 = v40;
      goto LABEL_28;
    }
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = v32;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v43;
    v21 = &v42;
LABEL_31:
    v35 = 1;
    goto LABEL_32;
  }
LABEL_33:

  return a5;
}

- (id)parseDeselectEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
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
  NSObject *v26;
  int v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v41;
  _QWORD v42[8];
  _QWORD v43[8];
  _QWORD v44[2];
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") != 3)
  {
    ATLLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid eventData length %u"), objc_msgSend(v8, "length"));
    v18 = (void *)v17;
    if (!a5)
      goto LABEL_24;
    v19 = *a5;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v21 = *MEMORY[0x1E0CB3388];
      v48[0] = *MEMORY[0x1E0CB2D50];
      v48[1] = v21;
      v49[0] = v17;
      v49[1] = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v49;
      v24 = v48;
      v25 = 2;
    }
    else
    {
      v50 = *MEMORY[0x1E0CB2D50];
      v51[0] = v17;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v51;
      v24 = &v50;
      v25 = 1;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v20;
    v38 = 6;
    goto LABEL_23;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  if (!*(_BYTE *)(v10 + 2))
  {
LABEL_25:
    v13 = 0;
    goto LABEL_26;
  }
  v11 = v10;
  if (*(_BYTE *)(v10 + 2) != 1)
  {
    ATLLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = *(unsigned __int8 *)(v11 + 2);
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v27;
      _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
    }

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown interface type %u"), *(unsigned __int8 *)(v11 + 2));
    v18 = (void *)v28;
    if (!a5)
      goto LABEL_24;
    v29 = *a5;
    v30 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v31 = *MEMORY[0x1E0CB3388];
      v44[0] = *MEMORY[0x1E0CB2D50];
      v44[1] = v31;
      v45[0] = v28;
      v45[1] = v29;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = v45;
      v34 = v44;
      v35 = 2;
    }
    else
    {
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = v28;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = &v47;
      v34 = &v46;
      v35 = 1;
    }
    objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v30;
    v38 = 3;
LABEL_23:
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v38, v36);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
    goto LABEL_25;
  }
  v42[0] = CFSTR("EventType");
  v42[1] = CFSTR("appletIdentifier");
  v43[1] = v9;
  v43[2] = CFSTR("Contactless");
  v43[0] = CFSTR("DeselectEvent");
  v42[2] = CFSTR("Interface");
  v42[3] = CFSTR("Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = CFSTR("IgnoreRFEvents");
  v42[5] = CFSTR("DontWaitForEOT");
  v43[3] = v12;
  v43[4] = MEMORY[0x1E0C9AAB0];
  v43[5] = MEMORY[0x1E0C9AAB0];
  v43[6] = MEMORY[0x1E0C9AAA0];
  v42[6] = CFSTR("RequiresPowerCycle");
  v42[7] = CFSTR("DelayExpressReentry");
  v43[7] = &unk_1E7D9AAD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  ATLLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v13;
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  -[NSMutableArray addObject:](self->_hciArray, "addObject:", v13);
  ATLLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_DEBUG, "Starting 150 ms timer due to reception of DESELECT", buf, 2u);
  }

  -[ATLTimer startTimerWithDelay:]((uint64_t)self->_timer, 150.0);
LABEL_26:

  return v13;
}

- (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSNumber *errorCode;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[7];
  _QWORD v32[7];
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") == 2)
  {
    v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v11 = !self->_errorTransaction << 6;
    if (self->_errorTransaction)
    {
      ATLLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        errorCode = self->_errorCode;
        *(_DWORD *)buf = 138412290;
        v38 = (uint64_t)errorCode;
        _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_DEFAULT, "*** Error occurred during transaction. SpecialEvents ErrorCode = %@", buf, 0xCu);
      }

    }
    v31[0] = CFSTR("EventType");
    v31[1] = CFSTR("appletIdentifier");
    v32[0] = CFSTR("EndEvent");
    v32[1] = v9;
    v31[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v14;
    v32[3] = CFSTR("Contactless");
    v31[3] = CFSTR("Interface");
    v31[4] = CFSTR("didError");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_errorTransaction);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v15;
    v31[5] = CFSTR("result");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[6] = CFSTR("type");
    v32[5] = v16;
    v32[6] = &unk_1E7D9AAE8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    ATLLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = (uint64_t)v17;
      _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    -[NSMutableArray addObject:](self->_hciArray, "addObject:", v17);
  }
  else
  {
    ATLLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v38 = objc_msgSend(v8, "length");
      v39 = 2048;
      v40 = 2;
      _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "End event length %zu (exp) %zu", buf, 0x16u);
    }

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu (exp) %zu"), objc_msgSend(v8, "length"), 2);
    v21 = (void *)v20;
    if (a5)
    {
      v22 = *a5;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v33[0] = *MEMORY[0x1E0CB2D50];
        v33[1] = v24;
        v34[0] = v20;
        v34[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v34;
        v27 = v33;
        v28 = 2;
      }
      else
      {
        v35 = *MEMORY[0x1E0CB2D50];
        v36 = v20;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v36;
        v27 = &v35;
        v28 = 1;
      }
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v29);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }

  return v17;
}

- (id)generateEndEventFromHCI
{
  NSObject *v3;
  NSMutableArray *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSNumber *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSNumber *errorCode;
  NSData *v15;
  NSData *transactionDetailRaw;
  NSString *appletAID;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const __CFString *v29;
  NSData *v30;
  const __CFString *v31;
  void *v32;
  _QWORD v33[8];
  _QWORD v34[8];
  uint8_t buf[4];
  NSNumber *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v3, OS_LOG_TYPE_DEBUG, "Generating EndEventfromHCI ...", buf, 2u);
  }

  if (-[NSMutableArray count](self->_hciArray, "count"))
  {
    if (!self->_appletAID)
    {
      v22 = 0;
      return v22;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v4 = self->_hciArray;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v26;
      *(_QWORD *)&v6 = 138412290;
      v24 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v4);
          v10 = *(NSNumber **)(*((_QWORD *)&v25 + 1) + 8 * v9);
          ATLLogObject();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            v36 = v10;
            _os_log_impl(&dword_1C3511000, v11, OS_LOG_TYPE_DEBUG, "--> %@", buf, 0xCu);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v7);
    }

    v12 = !self->_errorTransaction << 6;
    if (self->_errorTransaction)
    {
      ATLLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        errorCode = self->_errorCode;
        *(_DWORD *)buf = 138412290;
        v36 = errorCode;
        _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_DEFAULT, "*** Error occurred during transaction. SpecialEvents ErrorCode = %@", buf, 0xCu);
      }

    }
    if (!self->_transactionDetailRaw)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", CFSTR("010000"));
      v15 = (NSData *)objc_claimAutoreleasedReturnValue();
      transactionDetailRaw = self->_transactionDetailRaw;
      self->_transactionDetailRaw = v15;

    }
    v33[0] = CFSTR("EventType");
    v33[1] = CFSTR("appletIdentifier");
    appletAID = self->_appletAID;
    v34[0] = CFSTR("EndEvent");
    v34[1] = appletAID;
    v33[2] = CFSTR("Version");
    v33[3] = CFSTR("Interface");
    v34[2] = &unk_1E7D9AB00;
    v34[3] = CFSTR("Contactless");
    v33[4] = CFSTR("didError");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_errorTransaction, v24, (_QWORD)v25);
    v18 = objc_claimAutoreleasedReturnValue();
    v34[4] = v18;
    v33[5] = CFSTR("result");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v19;
    v34[6] = &unk_1E7D9AAE8;
    v33[6] = CFSTR("type");
    v33[7] = CFSTR("parsedInfo");
    v29 = CFSTR("TypeDetailRaw");
    v30 = self->_transactionDetailRaw;
    v31 = CFSTR("Transaction");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[7] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ATLLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_DEFAULT, "HCI Array provided does not contain HCI events", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

- (id)generateContactEndEvent:(id)a3 withDidError:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSMutableArray *hciArray;
  NSObject *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[8];
  _QWORD v36[8];
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  ATLLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_DEBUG, "Generating Contact EndEvent ...", buf, 2u);
  }
  v26 = v6;

  hciArray = self->_hciArray;
  if (!hciArray || !-[NSMutableArray count](hciArray, "count"))
  {
    ATLLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_DEBUG, "HCI Array provided does not contain HCI events (data presumed cleared)", buf, 2u);
    }

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_hciArray;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        ATLLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v15;
          _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_DEBUG, "--> %@", buf, 0xCu);
        }

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", CFSTR("020000"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("EventType");
  v35[1] = CFSTR("appletIdentifier");
  v36[0] = CFSTR("EndEvent");
  v36[1] = v26;
  v35[2] = CFSTR("Version");
  v35[3] = CFSTR("Interface");
  v36[2] = &unk_1E7D9AB00;
  v36[3] = CFSTR("Contact");
  v35[4] = CFSTR("didError");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v18;
  v35[5] = CFSTR("result");
  if (v4)
    v19 = 0;
  else
    v19 = 64;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v20;
  v36[6] = &unk_1E7D9AB18;
  v35[6] = CFSTR("type");
  v35[7] = CFSTR("parsedInfo");
  v32 = v17;
  v33 = CFSTR("Transaction");
  v31 = CFSTR("TypeDetailRaw");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  ATLLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v23;
    _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_DEBUG, "EndEvent (Contact) %@", buf, 0xCu);
  }

  return v23;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Supported");
  v8[1] = CFSTR("DelayExpressReentry");
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = &unk_1E7D9AAD0;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Atlas decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Atlas decoder doesn't expect processEndOfTransaction"));
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

+ (id)DecodeTransactionE1TLV:(id *)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  AtlasRecordData *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
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
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  int v35;
  void *v36;
  void *v37;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  AtlasRecordData *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  int v49;
  uint8_t v50[40];
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v5 = DERDecodeItemCtx((uint64_t)a3, &v39);
  if ((_DWORD)v5 || v39 != 0xE000000000000001)
  {
    ATLLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v50 = 67109376;
      *(_DWORD *)&v50[4] = v5;
      *(_WORD *)&v50[8] = 2048;
      *(_QWORD *)&v50[10] = v39;
      _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v50, 0x12u);
    }

    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    v20 = objc_msgSend(v19, "initWithFormat:", CFSTR("Failed to decode E1 tag %d or wrong tag 0x%llx"), v5, v39);
    v21 = (void *)v20;
    if (!a4)
      goto LABEL_33;
    v22 = *a4;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    if (*a4)
    {
      v24 = *MEMORY[0x1E0CB3388];
      v55[0] = *MEMORY[0x1E0CB2D50];
      v55[1] = v24;
      v56[0] = v20;
      v56[1] = v22;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = v56;
      v27 = v55;
LABEL_20:
      v32 = 2;
LABEL_32:
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v37);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
      a4 = 0;
      return a4;
    }
    v57 = *MEMORY[0x1E0CB2D50];
    v58[0] = v20;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = v58;
    v27 = &v57;
LABEL_31:
    v32 = 1;
    goto LABEL_32;
  }
  if (!v41)
  {
    ATLLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "Missing E1 content", v50, 2u);
    }

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Missing E1 content"));
    v21 = (void *)v29;
    if (!a4)
      goto LABEL_33;
    v30 = *a4;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    if (*a4)
    {
      v31 = *MEMORY[0x1E0CB3388];
      v51[0] = *MEMORY[0x1E0CB2D50];
      v51[1] = v31;
      v52[0] = v29;
      v52[1] = v30;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = v52;
      v27 = v51;
      goto LABEL_20;
    }
    v53 = *MEMORY[0x1E0CB2D50];
    v54 = v29;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v54;
    v27 = &v53;
    goto LABEL_31;
  }
  memset(v50, 0, 32);
  v6 = DERParseSequenceSpec((uint64_t)&v40, (uint64_t)&AtlasTransactionEventE1ContentsSpec, (char *)v50, 0x20uLL);
  if ((_DWORD)v6)
  {
    v7 = v6;
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v49 = v7;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Failed to validate transaction event contents %d", buf, 8u);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to validate transaction event contents %d"), v7);
    v10 = (AtlasRecordData *)v9;
    if (a4)
    {
      v11 = *a4;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v13 = *MEMORY[0x1E0CB3388];
        v44[0] = *MEMORY[0x1E0CB2D50];
        v44[1] = v13;
        v45[0] = v9;
        v45[1] = v11;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v45;
        v16 = v44;
        v17 = 2;
      }
      else
      {
        v46 = *MEMORY[0x1E0CB2D50];
        v47 = v9;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v47;
        v16 = &v46;
        v17 = 1;
      }
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v36);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    v10 = objc_alloc_init(AtlasRecordData);
    -[AtlasRecordData setSfi:](v10, "setSfi:", **(_BYTE **)v50);
    -[AtlasRecordData setRecordId:](v10, "setRecordId:", *(unsigned __int8 *)(*(_QWORD *)v50 + 1));
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", &v50[16]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AtlasRecordData setContent:](v10, "setContent:", v33);

    if (-[AtlasRecordData sfi](v10, "sfi") >= 0x1F)
    {
      ATLLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = -[AtlasRecordData sfi](v10, "sfi");
        *(_DWORD *)buf = 67109120;
        v49 = v35;
        _os_log_impl(&dword_1C3511000, v34, OS_LOG_TYPE_DEFAULT, "Unexpected SFI (0x%02X) provided in TransactionEvent", buf, 8u);
      }

    }
    v42 = CFSTR("recordData");
    v43 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a4;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  _QWORD *v69;
  uint64_t *v70;
  uint64_t v71;
  void *v72;
  _QWORD *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  const __CFString *v106;
  void *v107;
  uint8_t buf[4];
  int v109;
  _QWORD v110[2];
  _QWORD v111[2];
  uint64_t v112;
  _QWORD v113[3];

  v13 = a9;
  v113[1] = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a7;
  v16 = a3;
  +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  SelectByNameCmd(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = 0;
  objc_msgSend(v17, "transceiveAndCheckSW:error:", v21, &v105);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v105;
  if (!v23)
  {
    v90 = v22;
    if (!v22)
    {
      ATLLogObject();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v61, OS_LOG_TYPE_ERROR, "No response to SELECT received", buf, 2u);
      }

      v62 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No response to SELECT received"));
      v63 = (void *)v62;
      if (a9)
      {
        v64 = v21;
        v65 = *a9;
        v66 = (void *)MEMORY[0x1E0CB35C8];
        if (*a9)
        {
          v67 = *MEMORY[0x1E0CB3388];
          v110[0] = *MEMORY[0x1E0CB2D50];
          v110[1] = v67;
          v111[0] = v62;
          v111[1] = v65;
          v68 = (void *)MEMORY[0x1E0C99D80];
          v69 = v111;
          v70 = v110;
          v71 = 2;
        }
        else
        {
          v112 = *MEMORY[0x1E0CB2D50];
          v113[0] = v62;
          v68 = (void *)MEMORY[0x1E0C99D80];
          v69 = v113;
          v70 = &v112;
          v71 = 1;
        }
        objc_msgSend(v68, "dictionaryWithObjects:forKeys:count:", v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 5, v72);
        *a9 = (id)objc_claimAutoreleasedReturnValue();

        v21 = v64;
      }

      v24 = 0;
      v13 = 0;
      goto LABEL_89;
    }
    v75 = v21;
    objc_msgSend(v22, "base64EncodedStringWithOptions:", 0);
    v25 = v22;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("answerSelectApplication"));

    -[AtlasDecoder getCardIdFromSelectResponse:](self, "getCardIdFromSelectResponse:", v25);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "asHexString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, CFSTR("cardId"));

    -[AtlasDecoder SelectRemoteTicketingCmd](self, "SelectRemoteTicketingCmd");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transceiveAndCheckSW:error:");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "base64EncodedStringWithOptions:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, CFSTR("answerSelectFileRT"));

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 7, 1, &v104);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v104;
    v80 = (void *)v30;
    if (v31)
    {
      ATLLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 7;
        _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_ERROR, "Failed to read Environment File SFI %d", buf, 8u);
      }

      v30 = (uint64_t)v80;
    }
    if (v30)
      objc_msgSend(v29, "addObject:", v30);
    v103 = v31;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 8, 3, &v103);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v103;

    if (v33)
    {
      ATLLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 8;
        _os_log_impl(&dword_1C3511000, v34, OS_LOG_TYPE_ERROR, "Failed to read Transaction History SFI %d", buf, 8u);
      }

    }
    if (v88)
      objc_msgSend(v29, "addObject:");
    v102 = v33;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 9, 4, &v102);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v102;

    if (v35)
    {
      ATLLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 9;
        _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_ERROR, "Failed to read Contracts File SFI %d", buf, 8u);
      }

    }
    if (v87)
      objc_msgSend(v29, "addObject:");
    v101 = v35;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 10, 1, &v101);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v101;

    if (v37)
    {
      ATLLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 10;
        _os_log_impl(&dword_1C3511000, v38, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }

    }
    if (v86)
      objc_msgSend(v29, "addObject:");
    v100 = v37;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 11, 1, &v100);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v100;

    if (v39)
    {
      ATLLogObject();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 11;
        _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }

    }
    if (v85)
      objc_msgSend(v29, "addObject:");
    v99 = v39;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 12, 1, &v99);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v99;

    if (v41)
    {
      ATLLogObject();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 12;
        _os_log_impl(&dword_1C3511000, v42, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }

    }
    if (v84)
      objc_msgSend(v29, "addObject:");
    v98 = v41;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 13, 1, &v98);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v98;

    if (v43)
    {
      ATLLogObject();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 13;
        _os_log_impl(&dword_1C3511000, v44, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }

    }
    if (v83)
      objc_msgSend(v29, "addObject:");
    v97 = v43;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 6, 4, &v97);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v97;

    if (v45)
    {
      ATLLogObject();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 6;
        _os_log_impl(&dword_1C3511000, v46, OS_LOG_TYPE_ERROR, "Failed to read Contract Extentions File SFI %d", buf, 8u);
      }

    }
    if (v82)
      objc_msgSend(v29, "addObject:");
    v91 = v29;
    v96 = v45;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 29, 3, &v96);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v96;

    if (v48)
    {
      ATLLogObject();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 29;
        _os_log_impl(&dword_1C3511000, v49, OS_LOG_TYPE_ERROR, "Failed to read Special Events File SFI %d", buf, 8u);
      }

    }
    v89 = v19;
    if (v47)
      objc_msgSend(v91, "addObject:", v47);
    v95 = v48;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 30, 1, &v95);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v95;

    if (v50)
    {
      ATLLogObject();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 30;
        _os_log_impl(&dword_1C3511000, v51, OS_LOG_TYPE_ERROR, "Failed to read Best Contracts SFI %d", buf, 8u);
      }

    }
    v76 = (void *)v47;
    v52 = v91;
    if (v81)
      objc_msgSend(v91, "addObject:");
    v94 = v50;
    -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 25, 1, &v94, a9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v94;

    if (v54)
    {
      ATLLogObject();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v109 = 25;
        _os_log_impl(&dword_1C3511000, v55, OS_LOG_TYPE_ERROR, "Failed to read All Counters SFI %d", buf, 8u);
      }

      v52 = v91;
    }
    if (v53)
      objc_msgSend(v52, "addObject:", v53);
    objc_msgSend(v89, "setObject:forKeyedSubscript:", v52, CFSTR("recordFiles"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v89, CFSTR("cardBinaryrecord"));
    v106 = CFSTR("cardImage");
    v107 = v18;
    v56 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v54;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v57, 1, &v93);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v93;

    if (v14)
    {
      v92 = v24;
      v59 = v14;
      +[OpaqueDataService serializedHPKEWithData:publicKey:scheme:error:](_TtC24AppletTranslationLibrary17OpaqueDataService, "serializedHPKEWithData:publicKey:scheme:error:", v58, v14, v15, &v92);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v92;

      if (v74)
      {
        v18 = v56;
        if (v60)
        {
          v24 = objc_retainAutorelease(v60);
          *v74 = v24;
        }
        else
        {
          v24 = 0;
        }
        v14 = v59;
        goto LABEL_85;
      }
      v24 = v60;
      v14 = v59;
    }
    else
    {
      v13 = v58;
    }
    v18 = v56;
LABEL_85:
    v21 = v75;

    v19 = v89;
LABEL_89:
    v22 = v90;
    goto LABEL_90;
  }
  v24 = v23;
  if (a9)
  {
    v24 = objc_retainAutorelease(v23);
    v13 = 0;
    *a9 = v24;
  }
LABEL_90:

  return v13;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return -[AtlasDecoder getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:](self, "getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:", a3, a4, a5, 0, 0, a6, a7);
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  AtlasDecoder *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int16 v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  AtlasDecoder *v69;
  id *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id obj;
  uint64_t v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  id v92;
  id v93;
  id v94;
  _QWORD v95[2];
  _QWORD v96[2];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SelectByNameCmd(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = 0;
  objc_msgSend(v10, "transceiveAndCheckSW:error:", v12, &v94);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v94;
  v15 = v14;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v15;
    -[AtlasDecoder readAndDecodeContracts:sfi:count:error:](self, "readAndDecodeContracts:sfi:count:error:", v10, 9, 4, &v93);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v93;

    v79 = v18;
    if (v19)
    {
      if (a7)
      {
        v19 = objc_retainAutorelease(v19);
        v20 = 0;
        *a7 = v19;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v21 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("ContractList"));

      v92 = 0;
      -[AtlasDecoder readAndDecodeHistory:sfi:count:error:](self, "readAndDecodeHistory:sfi:count:error:", v10, 8, 10, &v92);
      v22 = self;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v92;
      if (v24)
      {
        v19 = v24;
        if (a7)
        {
          v19 = objc_retainAutorelease(v24);
          v20 = 0;
          *a7 = v19;
        }
        else
        {
          v20 = 0;
        }
      }
      else
      {
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("TransactionHistory"));
        -[AtlasDecoder parseHistory:withContractList:](v22, "parseHistory:withContractList:", v23, v18);
        v76 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0;
        -[AtlasDecoder readAndDecodeBestContractList:sfi:error:](v22, "readAndDecodeBestContractList:sfi:error:", v10, 30, &v91);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v91;
        v75 = (void *)v25;
        if (v26)
        {
          v19 = v26;
          if (a7)
          {
            v19 = objc_retainAutorelease(v26);
            v20 = 0;
            *a7 = v19;
          }
          else
          {
            v20 = 0;
          }
          v59 = (void *)v76;
        }
        else
        {
          v69 = v22;
          v70 = a7;
          v71 = v17;
          v73 = v13;
          v74 = v12;
          v72 = v16;
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("BestContractList"));
          +[AtlasDecoder getUnvalidatableContracts:](AtlasDecoder, "getUnvalidatableContracts:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          ATLLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v100 = v27;
            _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_DEBUG, "unValidatableContracts: %@", buf, 0xCu);
          }

          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v29 = v79;
          obj = (id)objc_msgSend(v79, "copy");
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
          v77 = v27;
          if (v30)
          {
            v31 = v30;
            v32 = 0;
            v81 = *(_QWORD *)v88;
            do
            {
              v33 = 0;
              do
              {
                if (*(_QWORD *)v88 != v81)
                  objc_enumerationMutation(obj);
                v34 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v33);
                ++v32;
                ATLLogObject();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v100) = v32;
                  _os_log_impl(&dword_1C3511000, v35, OS_LOG_TYPE_DEBUG, "contractPointerId %d", buf, 8u);
                }

                ATLLogObject();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractBitmap"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v100 = v37;
                  _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_DEBUG, "ContractBitmap %@", buf, 0xCu);

                }
                ATLLogObject();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractStatus"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v100 = v39;
                  _os_log_impl(&dword_1C3511000, v38, OS_LOG_TYPE_DEBUG, "ContractStatus %@", buf, 0xCu);

                }
                ATLLogObject();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractTariff"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v100 = v41;
                  _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_DEBUG, "ContractTariff %@", buf, 0xCu);

                }
                ATLLogObject();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractCounters"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v100 = v43;
                  _os_log_impl(&dword_1C3511000, v42, OS_LOG_TYPE_DEBUG, "ContractCounters %@", buf, 0xCu);

                }
                ATLLogObject();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractValidityJourneysData"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v100 = v45;
                  _os_log_impl(&dword_1C3511000, v44, OS_LOG_TYPE_DEBUG, "ContractValidityJourneysData %@", buf, 0xCu);

                }
                objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractStatus"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "integerValue");

                if (v47 == 1
                  && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v32),
                      v48 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v27, "objectForKeyedSubscript:", v48),
                      v49 = (void *)objc_claimAutoreleasedReturnValue(),
                      v49,
                      v48,
                      !v49))
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractValidityJourneysData"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("ContractCounterStructure"));
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v51, "integerValue") == 12)
                  {
                    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ContractCounters"));
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("CounterContractCount"));
                    v53 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("CommutePlanIdentifier"));
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    +[AtlasDecoder amountDictionaryWithAmount:withIdentifier:usingAmountKey:usingCurrencyKey:usingExponentKey:usingIdentifierKey:](AtlasDecoder, "amountDictionaryWithAmount:withIdentifier:usingAmountKey:usingCurrencyKey:usingExponentKey:usingIdentifierKey:", v53, v54, CFSTR("Balance"), CFSTR("BalanceCurrency"), CFSTR("BalanceCurrencyExponent"), CFSTR("BalanceIdentifier"));
                    v55 = (void *)objc_claimAutoreleasedReturnValue();

                    v29 = v79;
                    objc_msgSend(v78, "addObject:", v55);
                    objc_msgSend(v79, "removeObject:", v34);

                    v27 = v77;
                  }

                }
                else
                {
                  objc_msgSend(v29, "removeObject:", v34);
                }
                ++v33;
              }
              while (v31 != v33);
              v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
              v31 = v56;
            }
            while (v56);
          }

          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v57 = v29;
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
          v17 = v71;
          v59 = (void *)v76;
          if (v58)
          {
            v60 = v58;
            v61 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v60; ++i)
              {
                if (*(_QWORD *)v84 != v61)
                  objc_enumerationMutation(v57);
                -[AtlasDecoder stripContract:](v69, "stripContract:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i));
              }
              v60 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
            }
            while (v60);
          }

          objc_msgSend(v71, "setObject:forKeyedSubscript:", v57, CFSTR("CommutePlans"));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v78, CFSTR("Balances"));
          v82 = 0;
          -[AtlasDecoder readAndDecodeEnvironment:sfi:error:](v69, "readAndDecodeEnvironment:sfi:error:", v10, 7, &v82);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v82;
          v19 = v64;
          if (v64)
          {
            v13 = v73;
            v12 = v74;
            v20 = 0;
            if (v70)
              *v70 = objc_retainAutorelease(v64);
          }
          else
          {
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("EnvApplicationEndDate"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v73;
            if (v65)
            {
              objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("EnvApplicationEndDate"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              +[AtlasDecoder getAbsoluteDateComponents:withTime:](AtlasDecoder, "getAbsoluteDateComponents:withTime:", v66, 0);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setObject:forKeyedSubscript:", v67, CFSTR("CardExpirationDate"));

            }
            v95[0] = CFSTR("State");
            v95[1] = CFSTR("TransactionHistory");
            v96[0] = v71;
            v96[1] = v76;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v74;
          }
          v16 = v72;

        }
      }

    }
    v15 = v19;
  }
  else if (a7)
  {
    v15 = objc_retainAutorelease(v14);
    v20 = 0;
    *a7 = v15;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)readAndDecodeContracts:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6
{
  unsigned int v6;
  uint64_t v7;
  id v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  __int128 v59;
  void *v61;
  AtlasDecoder *v62;
  unsigned int v63;
  unsigned int v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  _QWORD v77[2];
  _QWORD v78[2];
  uint64_t v79;
  _QWORD v80[3];

  v6 = a5;
  v7 = a4;
  v80[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v10;
  if (!v6)
  {
LABEL_43:
    v45 = v12;
    goto LABEL_59;
  }
  v13 = 0;
  *(_QWORD *)&v11 = 138412290;
  v59 = v11;
  v65 = (void *)v10;
  v66 = v9;
  v63 = v7;
  v64 = v6;
  v62 = self;
  while (1)
  {
    v14 = v13 + 1;
    v72 = 0;
    -[AtlasDecoder readRecord:sfi:index:recLength:error:](self, "readRecord:sfi:index:recLength:error:", v9, v7, (v13 + 1), 0, &v72, v59);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v72;
    v17 = v16;
    if (!v16)
      break;
    if (objc_msgSend(v16, "code") != 9)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v17);
LABEL_57:

      goto LABEL_58;
    }
    ATLLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v13 + 1;
      _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_DEFAULT, "Contract record %d not found (unexpected)", buf, 8u);
    }
LABEL_42:

    v13 = v14;
    if (v6 == v14)
      goto LABEL_43;
  }
  if (objc_msgSend(v15, "length") != 29)
  {
    ATLLogObject();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v46, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data", buf, 2u);
    }

    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Atlas record data"));
    v48 = (void *)v47;
    if (a6)
    {
      v49 = *a6;
      v50 = (void *)MEMORY[0x1E0CB35C8];
      if (*a6)
      {
        v51 = *MEMORY[0x1E0CB3388];
        v77[0] = *MEMORY[0x1E0CB2D50];
        v77[1] = v51;
        v78[0] = v47;
        v78[1] = v49;
        v52 = (void *)MEMORY[0x1E0C99D80];
        v53 = v78;
        v54 = v77;
        v55 = 2;
      }
      else
      {
        v79 = *MEMORY[0x1E0CB2D50];
        v80[0] = v47;
        v52 = (void *)MEMORY[0x1E0C99D80];
        v53 = v80;
        v54 = &v79;
        v55 = 1;
      }
      objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v57);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_57;
  }
  +[AtlasDecoder decodeContractStructureFF:](AtlasDecoder, "decodeContractStructureFF:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v13 + 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("ContractPointerNumber"));

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractValidityJourneysData"));
  v20 = objc_claimAutoreleasedReturnValue();
  v18 = v20;
  if (!v20)
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v13 + 1;
      v26 = v24;
      v27 = "No validityJourneysData provided for contract %d";
LABEL_16:
      _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 8u);
    }
LABEL_17:
    v22 = 0;
LABEL_18:

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractValidityStartDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractValidityStartTime"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractValidityEndDate"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractValidityEndTime"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    ATLLogObject();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v28;
      v75 = 2112;
      v76 = v29;
      _os_log_impl(&dword_1C3511000, v31, OS_LOG_TYPE_DEBUG, "Contract Start Date/Time: %@ / %@", buf, 0x16u);
    }

    ATLLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v30;
      v75 = 2112;
      v76 = (uint64_t)v70;
      _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_DEBUG, "Contract End Date/Time: %@ / %@", buf, 0x16u);
    }

    v68 = v22;
    v69 = v15;
    v67 = (void *)v30;
    if (objc_msgSend(v22, "integerValue") == 12)
    {
      v33 = (void *)v28;
      v34 = (void *)v29;
      +[AtlasDecoder getAbsoluteDateComponents:withTime:](AtlasDecoder, "getAbsoluteDateComponents:withTime:", v28, v29);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[AtlasDecoder getAbsoluteDateComponents:withTime:](AtlasDecoder, "getAbsoluteDateComponents:withTime:", v30, v70);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v22, "integerValue") == 3)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractCounters"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("CounterCounterValidityEndDate"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = v38;
        if (objc_msgSend(v38, "integerValue"))
        {
          +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:](AtlasDecoder, "getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:", v38, 0, &unk_1E7D9AB30);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          ATLLogObject();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            v74 = (uint64_t)v39;
            _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_DEBUG, "Overriding Contract Validity End from Counter: %@", buf, 0xCu);
          }
        }
        else
        {
          ATLLogObject();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            v74 = 0;
            _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_DEBUG, "Contract Validity End from Counter not yet set: %@", buf, 0xCu);
          }
          v39 = 0;
        }

        if (v28)
        {
          +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:](AtlasDecoder, "getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:", v28, v29, &unk_1E7D9AB18);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }
        v34 = (void *)v29;
        v33 = (void *)v28;

        goto LABEL_37;
      }
      v33 = (void *)v28;
      v34 = (void *)v29;
      +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:](AtlasDecoder, "getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:", v28, v29, &unk_1E7D9AB18);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:](AtlasDecoder, "getAbsoluteDateComponentsWithDefaultMinutes:withTime:withDefaultMinutes:", v30, v70, &unk_1E7D9AB30);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    v39 = (void *)v36;
LABEL_37:
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractTariff"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContractValidityZones"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[AtlasDecoder formatCommutePlanIdentifier:withTariffCode:withZoneList:](AtlasDecoder, "formatCommutePlanIdentifier:withTariffCode:withZoneList:", v18, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setObject:forKeyedSubscript:", v43, CFSTR("CommutePlanIdentifier"));
    if (v35)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v35, CFSTR("CommutePlanValidityStartDate"));
    v12 = v65;
    if (v39)
    {
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v39, CFSTR("CommutePlanValidityEndDate"));
      +[AtlasDecoder calculateCommutePlanUniqueId:withExpiry:](AtlasDecoder, "calculateCommutePlanUniqueId:withExpiry:", v43, v39);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v44, CFSTR("CommutePlanUniqueIdentifier"));

    }
    objc_msgSend(v65, "addObject:", v17);

    v9 = v66;
    v7 = v63;
    v6 = v64;
    self = v62;
    v15 = v69;
    goto LABEL_42;
  }
  -[NSObject valueForKey:](v20, "valueForKey:", CFSTR("ContractCounterStructure"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v13 + 1;
      v26 = v24;
      v27 = "No counterStructure provided for contract %d";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v22 = v21;
  v23 = objc_msgSend(v21, "integerValue");
  v71 = 0;
  -[AtlasDecoder readAndDecodeCounter:sfi:recNum:counterStructure:error:](self, "readAndDecodeCounter:sfi:recNum:counterStructure:error:", v9, (v13 + 10), 1, v23, &v71);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v71;
  if (!v25)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("ContractCounters"));
    goto LABEL_18;
  }
  v56 = v25;
  if (a6)
    *a6 = objc_retainAutorelease(v25);

LABEL_58:
  v45 = 0;
LABEL_59:

  return v45;
}

- (void)stripContract:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractBitmap"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractTariff"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractPointerNumber"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractValidityStartDate"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractValidityEndDate"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractValidityStartTime"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractValidityEndTime"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ContractValidityInfoBitmap"));

}

- (id)readAndDecodeHistory:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6
{
  unsigned int v6;
  uint64_t v7;
  id v9;
  id v10;
  unsigned __int8 v11;
  unint64_t v12;
  void *v13;
  void *v14;
  AtlasDecoder *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  void *v40;
  unsigned int v41;
  id v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[2];

  v6 = a5;
  v7 = a4;
  v50[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (!v6)
  {
LABEL_14:
    v25 = v40;
    v26 = v40;
    goto LABEL_26;
  }
  v11 = 0;
  v12 = 0x1EF8D8000uLL;
  v41 = v6;
  while (1)
  {
    v13 = v10;
    ++v11;
    v42 = v10;
    -[AtlasDecoder readRecord:sfi:index:recLength:error:](self, "readRecord:sfi:index:recLength:error:", v9, v7, v11, 0, &v42);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v42;

    if (!v10)
      break;
    if (objc_msgSend(v10, "code") != 9)
    {
      v25 = v40;
      if (a6)
        *a6 = objc_retainAutorelease(v10);
      goto LABEL_25;
    }
LABEL_13:

    if (v6 <= v11)
      goto LABEL_14;
  }
  if (objc_msgSend(v14, "length") == 29)
  {
    v15 = self;
    v16 = v7;
    v17 = v9;
    objc_msgSend((id)(v12 + 1776), "decodeEventEntry:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EventContractPointer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    v21 = objc_msgSend(v19, "unsignedIntValue");

    if ((v21 - 5) > 0xFFFFFFFB)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EventCode"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)(v20 + 1776), "getInternalEnRouteStatus:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("InternalEnRouteStatus"));

      objc_msgSend(v40, "addObject:", v18);
    }
    else
    {
      ATLLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v44 = v21;
        v45 = 2112;
        v46 = v18;
        _os_log_impl(&dword_1C3511000, v22, OS_LOG_TYPE_DEFAULT, "ContractPointer %d out of expected range [1,4] in %@. Skipping.", buf, 0x12u);
      }

    }
    v9 = v17;

    v12 = 0x1EF8D8000;
    v7 = v16;
    self = v15;
    v6 = v41;
    goto LABEL_13;
  }
  ATLLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data", buf, 2u);
  }

  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Atlas record data"));
  v29 = (void *)v28;
  v25 = v40;
  if (a6)
  {
    v30 = *a6;
    v31 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v32 = *MEMORY[0x1E0CB3388];
      v47[0] = *MEMORY[0x1E0CB2D50];
      v47[1] = v32;
      v48[0] = v28;
      v48[1] = v30;
      v33 = (void *)MEMORY[0x1E0C99D80];
      v34 = v48;
      v35 = v47;
      v36 = 2;
    }
    else
    {
      v49 = *MEMORY[0x1E0CB2D50];
      v50[0] = v28;
      v33 = (void *)MEMORY[0x1E0C99D80];
      v34 = v50;
      v35 = &v49;
      v36 = 1;
    }
    objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v37);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_25:

  v26 = 0;
LABEL_26:

  return v26;
}

- (id)parseHistory:(id)a3 withContractList:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
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
  __CFString *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  _BOOL4 v39;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  id v69;
  id v70;
  void *v71;
  unint64_t v72;
  void *v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v70 = a4;
  v71 = v5;
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v72 = v6;
  if (v6)
  {
    v7 = 0;
    v8 = 0x1EF8D8000uLL;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventDateStamp"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventTimeStamp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventServiceProvider"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventContractPointer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventSerialNumber"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)(v8 + 1776), "calculateTransactionSN:withTimeStamp:withEventCode:withSP:withContractPointer:withDifferentiator:", v11, v12, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("SerialNumber"));

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventCode"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[AtlasDecoder getInternalEnRouteStatus:](AtlasDecoder, "getInternalEnRouteStatus:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("InternalEnRouteStatus"));

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventCode"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[AtlasDecoder getTransitModality:](AtlasDecoder, "getTransitModality:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("TypeDetail"));

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventCode"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[AtlasDecoder formatTransitDetailRaw:](AtlasDecoder, "formatTransitDetailRaw:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("TypeDetailRaw"));

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("InternalEnRouteStatus"));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = v7 + 1;

      v26 = 1;
      if (v24 == CFSTR("CVPEnter") && v25 < v72)
      {
        objc_msgSend(v71, "objectAtIndexedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("EventCode"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "unsignedLongValue");

        v30 = v29 >> 4;
        v26 = 1;
        if (v30 != 1 && v30 != 4)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &AtlasCardReadBytes, 3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("TypeDetailRaw"));

          v26 = 0;
        }

      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToBytes:length:", &AtlasCardReadBytes, 3);

      if (v33)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("CardRead"), CFSTR("TypeDetail"));
        v26 = 0;
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E7D9AB48, CFSTR("CityCode"));
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventLocationId"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventLocationId"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "integerValue");

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InternalEnRouteStatus"));
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v37 == CFSTR("Enter"))
        {
          v39 = 1;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InternalEnRouteStatus"));
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v39 = v38 == CFSTR("CVPEnter");

        }
        if (v39 && v36)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithIntBE:", v36);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, CFSTR("StartStation"));

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InternalEnRouteStatus"));
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v41 == CFSTR("Exit"))
        {
          v43 = 1;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InternalEnRouteStatus"));
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v43 = v42 == CFSTR("CVPExit");

        }
        if (v43 && v36)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithIntBE:", v36);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v44, CFSTR("EndStation"));

        }
      }
      ++v7;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventDateStamp"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventTimeStamp"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[AtlasDecoder getAbsoluteDateComponents:withTime:](AtlasDecoder, "getAbsoluteDateComponents:withTime:", v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v47, CFSTR("TransactionTime"));

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventDataDateFirstStamp"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventDataDateFirstStamp"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventDataTimeFirstStamp"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[AtlasDecoder getAbsoluteDateComponents:withTime:](AtlasDecoder, "getAbsoluteDateComponents:withTime:", v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v51, CFSTR("FirstStampTime"));

      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EventContractPointer"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "unsignedIntValue") - 1;

      objc_msgSend(v70, "objectAtIndex:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ContractValidityJourneysData"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("ContractCounterStructure"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "unsignedIntValue");

      if (v57 == 12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("CommutePlanIdentifier"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[AtlasDecoder amountDictionaryWithAmount:withIdentifier:usingAmountKey:usingCurrencyKey:usingExponentKey:usingIdentifierKey:](AtlasDecoder, "amountDictionaryWithAmount:withIdentifier:usingAmountKey:usingCurrencyKey:usingExponentKey:usingIdentifierKey:", v58, v59, CFSTR("Amount"), CFSTR("AmountCurrency"), CFSTR("AmountCurrencyExponent"), CFSTR("AmountIdentifier"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v74[0] = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v9;
        v63 = v61;
        v64 = CFSTR("Amounts");
      }
      else
      {
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("CommutePlanIdentifier"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("CommutePlanValidityEndDate"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("CommutePlanUniqueIdentifier"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        +[AtlasDecoder commutePlanWithIdAndExpiry:withExpiry:withUniqueId:](AtlasDecoder, "commutePlanWithIdAndExpiry:withExpiry:withUniqueId:", v65, v66, v67);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v9;
        v63 = v61;
        v64 = CFSTR("CommutePlans");
      }
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, v64);

      objc_msgSend(v69, "addObject:", v9);
      v8 = 0x1EF8D8000;
    }
    while (v72 != v7);
  }

  return v69;
}

- (id)readAndDecodeBestContractList:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
  uint8_t v22[16];
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v23 = 0;
  -[AtlasDecoder readRecord:sfi:index:recLength:error:](self, "readRecord:sfi:index:recLength:error:", a3, a4, 1, 0, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "code") != 9)
  {
    if (a5)
    {
      v9 = 0;
      *a5 = objc_retainAutorelease(v8);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "length") != 29)
  {
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data", v22, 2u);
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Atlas record data"));
    v12 = (void *)v11;
    if (a5)
    {
      v13 = *a5;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v15 = *MEMORY[0x1E0CB3388];
        v24[0] = *MEMORY[0x1E0CB2D50];
        v24[1] = v15;
        v25[0] = v11;
        v25[1] = v13;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v25;
        v18 = v24;
        v19 = 2;
      }
      else
      {
        v26 = *MEMORY[0x1E0CB2D50];
        v27[0] = v11;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v27;
        v18 = &v26;
        v19 = 1;
      }
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
  if (!v6)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  +[AtlasDecoder decodeBestContractList:](AtlasDecoder, "decodeBestContractList:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v9;
}

- (id)readAndDecodeCounter:(id)a3 sfi:(unsigned __int8)a4 recNum:(unsigned __int8)a5 counterStructure:(unsigned __int8)a6 error:(id *)a7
{
  int v8;
  int v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  -[AtlasDecoder readRecord:sfi:index:recLength:error:](self, "readRecord:sfi:index:recLength:error:", a3, a4, a5, 0, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  v13 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "code") == 9)
    {
      ATLLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v38 = v10;
        v39 = 1024;
        v40 = v9;
        _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_DEFAULT, "Counter Structure Record not found: SFI 0x%02X Record 0x%02X", buf, 0xEu);
      }

      v15 = 0;
      v16 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_28;
    }
    if (a7)
    {
      v15 = 0;
      v16 = 0;
      *a7 = objc_retainAutorelease(v13);
      goto LABEL_28;
    }
LABEL_22:
    v15 = 0;
    v16 = 0;
    goto LABEL_28;
  }
  if (objc_msgSend(v11, "length") != 29)
  {
    ATLLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data (unexpected length)", buf, 2u);
    }

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Atlas record data (unexpected length)"));
    v21 = (void *)v20;
    if (a7)
    {
      v22 = *a7;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v33[0] = *MEMORY[0x1E0CB2D50];
        v33[1] = v24;
        v34[0] = v20;
        v34[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v34;
        v27 = v33;
        v28 = 2;
      }
      else
      {
        v35 = *MEMORY[0x1E0CB2D50];
        v36 = v20;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v36;
        v27 = &v35;
        v28 = 1;
      }
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v29);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
  if (v11)
  {
    objc_msgSend(v11, "subdataWithOffset:length:", 0, objc_msgSend(v11, "length"));
    v17 = objc_claimAutoreleasedReturnValue();

    if (v8 == 12)
    {
      +[AtlasDecoder decodeCounterStructure0C:](AtlasDecoder, "decodeCounterStructure0C:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v8 == 3)
    {
      +[AtlasDecoder decodeCounterStructure03:](AtlasDecoder, "decodeCounterStructure03:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ATLLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v38 = v8;
        _os_log_impl(&dword_1C3511000, v30, OS_LOG_TYPE_DEFAULT, "Unexpected counter structure %u", buf, 8u);
      }

      v18 = (void *)MEMORY[0x1E0C9AA70];
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  v15 = v18;
  v11 = (void *)v17;
  v16 = v15;
LABEL_28:

  return v16;
}

- (id)readAndDecodeEnvironment:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
  uint8_t v22[16];
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v23 = 0;
  -[AtlasDecoder readRecord:sfi:index:recLength:error:](self, "readRecord:sfi:index:recLength:error:", a3, a4, 1, 0, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  v8 = v7;
  if (!v7)
  {
    if (objc_msgSend(v6, "length") == 29)
    {
      +[AtlasDecoder decodeEnvironmentData:](AtlasDecoder, "decodeEnvironmentData:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data (unexpected length)", v22, 2u);
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode Atlas record data (unexpected length)"));
    v12 = (void *)v11;
    if (a5)
    {
      v13 = *a5;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v15 = *MEMORY[0x1E0CB3388];
        v24[0] = *MEMORY[0x1E0CB2D50];
        v24[1] = v15;
        v25[0] = v11;
        v25[1] = v13;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v25;
        v18 = v24;
        v19 = 2;
      }
      else
      {
        v26 = *MEMORY[0x1E0CB2D50];
        v27[0] = v11;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v27;
        v18 = &v26;
        v19 = 1;
      }
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if (!a5)
    goto LABEL_14;
  v9 = 0;
  *a5 = objc_retainAutorelease(v7);
LABEL_15:

  return v9;
}

- (id)readRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 recLength:(unsigned __int8)a6 error:(id *)a7
{
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
  void *v20;
  id v21;
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
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  __int16 v37;
  unsigned __int8 v38;
  char v39;
  unsigned __int8 v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  int v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint64_t v51;
  _QWORD v52[2];

  v8 = a4;
  v52[1] = *MEMORY[0x1E0C80C00];
  if (a4 < 0x1Fu)
  {
    v19 = a5;
    v37 = -19968;
    v38 = a5;
    v39 = (8 * a4) | 4;
    v40 = a6;
    v36 = 0;
    objc_msgSend(a3, "transceiveBytesAndCheckSW:length:inArray:keepingSW:error:", &v37, 5, &unk_1E7D9CE88, 1, &v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v36;
    v11 = v21;
    if (v21)
    {
      if (a7)
      {
        v22 = 0;
        *a7 = objc_retainAutorelease(v21);
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      if (objc_msgSend(v20, "u16BE:", objc_msgSend(v20, "length") - 2) != 27267)
      {
        objc_msgSend(v20, "subdataWithOffset:length:", 0, objc_msgSend(v20, "length") - 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      ATLLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v46 = v8;
        v47 = 1024;
        v48 = v19;
        _os_log_impl(&dword_1C3511000, v23, OS_LOG_TYPE_ERROR, "Warning: SFI 0x%02X Record 0x%02X not found", buf, 0xEu);
      }

      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Warning: SFI 0x%02X Record 0x%02X not found"), v8, v19);
      v25 = (void *)v24;
      if (a7)
      {
        v26 = *a7;
        v27 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v28 = *MEMORY[0x1E0CB3388];
          v41[0] = *MEMORY[0x1E0CB2D50];
          v41[1] = v28;
          v42[0] = v24;
          v42[1] = v26;
          v29 = (void *)MEMORY[0x1E0C99D80];
          v30 = v42;
          v31 = v41;
          v32 = 2;
        }
        else
        {
          v43 = *MEMORY[0x1E0CB2D50];
          v44 = v24;
          v29 = (void *)MEMORY[0x1E0C99D80];
          v30 = &v44;
          v31 = &v43;
          v32 = 1;
        }
        objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 9, v34);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v22 = 0;
    goto LABEL_24;
  }
  ATLLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v46 = v8;
    _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "Invalid SFI for read record 0x%X", buf, 8u);
  }

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid SFI for read record 0x%X"), v8);
  v11 = (void *)v10;
  if (a7)
  {
    v12 = *a7;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v14 = *MEMORY[0x1E0CB3388];
      v49[0] = *MEMORY[0x1E0CB2D50];
      v49[1] = v14;
      v50[0] = v10;
      v50[1] = v12;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v50;
      v17 = v49;
      v18 = 2;
    }
    else
    {
      v51 = *MEMORY[0x1E0CB2D50];
      v52[0] = v10;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v52;
      v17 = &v51;
      v18 = 1;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 6, v33);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = 0;
LABEL_25:

  return v22;
}

- (id)readPartnerRecords:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6
{
  unsigned int v7;
  uint64_t v8;
  id v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  _QWORD v25[2];

  v7 = a5;
  v8 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v20 = a6;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = v12;
      ++v13;
      v21 = v12;
      -[AtlasDecoder readRecord:sfi:index:recLength:error:](self, "readRecord:sfi:index:recLength:error:", v10, v8, v13, 0, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;

      if (v12)
      {
        if (objc_msgSend(v12, "code") != 9)
          break;
      }
      if (v15)
      {
        v24 = CFSTR("record");
        objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "addObject:", v17);
      }

      if (v7 <= v13)
        goto LABEL_10;
    }
    if (v20)
    {
      v12 = objc_retainAutorelease(v12);
      v18 = 0;
      *v20 = v12;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v12 = 0;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = CFSTR("sfi");
    v22[1] = CFSTR("recordData");
    v23[0] = v15;
    v23[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)SelectRemoteTicketingCmd
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &SelectRemoteTicketingCmd_cmdBytes, 7);
}

- (id)getCardIdFromSelectResponse:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  double v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13[2];

  v3 = objc_retainAutorelease(a3);
  v13[0] = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v4 = (unsigned __int8 *)objc_msgSend(v3, "length");

  v13[1] = v4;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  *(_QWORD *)&v5 = DERFindItem(v13, 0xC000000000000007, (uint64_t)&v10).n128_u64[0];
  v7 = v6;
  v8 = 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, v12, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (id)decodeEnvironmentBitMap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("EnvNetworkId");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isBitSet:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("EnvApplicationIssuerId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("EnvApplicationEndDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("EnvAuthenticator");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  v14[4] = CFSTR("EnvDataBitmap");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v4, "isBitSet:", 6);

  objc_msgSend(v9, "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)decodeEnvironmentDataBitMap:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("EnvDataCardStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isBitSet:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)decodeEnvironmentData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _DWORD v41[2];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "length") > 0x1C)
  {
    v8 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 0, 6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("EnvVersionNumber"));

    v10 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 6, 7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeEnvironmentBitMap:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("EnvBitmap"));

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EnvNetworkId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      v16 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 13, 24);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("EnvNetworkId"));

      v18 = 37;
    }
    else
    {
      v18 = 13;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EnvApplicationIssuerId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      v21 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v18, 8);
      v18 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v22, CFSTR("EnvApplicationIssuerId"));

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EnvApplicationEndDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v24)
    {
      v25 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v18, 14);
      v18 += 14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v26, CFSTR("EnvApplicationEndDate"));

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EnvAuthenticator"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if (v28)
    {
      v29 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v18, 16);
      v18 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v30, CFSTR("EnvAuthenticator"));

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EnvDataBitmap"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    if (v32)
    {
      v33 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v18, 2);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v34, CFSTR("EnvDataBitmap"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "decodeEnvironmentDataBitMap:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("EnvDataCardStatus"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v34) = objc_msgSend(v37, "BOOLValue");

      if ((_DWORD)v34)
      {
        v38 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v18 + 2, 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setValue:forKey:", v39, CFSTR("EnvDataCardStatus"));

      }
    }
    v7 = v5;

  }
  else
  {
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v41[0] = 67109120;
      v41[1] = objc_msgSend(v4, "length");
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_ERROR, "Invalid data length %u", (uint8_t *)v41, 8u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)decodeBestContractList:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unint64_t v24;
  NSObject *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length") == 29)
  {
    v4 = objc_msgSend(v3, "readBinaryValueAtBit:numberOfBits:", 0, 4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v25 = objc_claimAutoreleasedReturnValue();
    v5 = 0x1E0C99000uLL;
    if (v4)
    {
      v6 = 0;
      v7 = 4;
      v24 = v4;
      do
      {
        v8 = objc_msgSend(v3, "readBinaryValueAtBit:numberOfBits:", v7, 3, v24);
        v9 = objc_msgSend(v3, "readBinaryValueAtBit:numberOfBits:", v7 + 3, 4);
        v10 = objc_msgSend(v3, "readBinaryValueAtBit:numberOfBits:", v7 + 7, 8);
        v11 = objc_msgSend(v3, "readBinaryValueAtBit:numberOfBits:", v7 + 15, 4);
        v12 = objc_msgSend(v3, "readBinaryValueAtBit:numberOfBits:", v7 + 19, 5);
        v28[0] = CFSTR("BestContractBitmap");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v13;
        v28[1] = CFSTR("BestContractIssuer");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v14;
        v28[2] = CFSTR("BestContractType");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29[2] = v15;
        v28[3] = CFSTR("BestContractPriority");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29[3] = v16;
        v28[4] = CFSTR("BestContractPointer");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29[4] = v17;
        objc_msgSend(*(id *)(v5 + 3456), "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
        v18 = v5;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v25, "addObject:", v19);

        v5 = v18;
        v4 = v24;
        ++v6;
        v7 += 24;
      }
      while (v24 > v6);
    }
    v26[0] = CFSTR("BestContract");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = CFSTR("BestContractList");
    v27[0] = v20;
    v21 = v25;
    v27[1] = v25;
    objc_msgSend(*(id *)(v5 + 3456), "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ATLLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_1C3511000, v21, OS_LOG_TYPE_ERROR, "Invalid data length %u", buf, 8u);
    }
    v22 = 0;
  }

  return v22;
}

+ (id)decodeCounterStructure03:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 0, 10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("CounterContractCount"));

  v8 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 10, 14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("CounterCounterValidityEndDate"));

  return v5;
}

+ (id)decodeCounterStructure0C:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 0, 6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("CounterContractCount"));

  v8 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 6, 18);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("CounterCounterRelativeFirstStamp15Mn"));

  return v5;
}

+ (id)decodeContractStructureFF:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  int v74;
  uint64_t v75;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  uint64_t v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  void *v95;
  void *v96;
  int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  int v105;
  uint64_t v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  int v113;
  uint64_t v114;
  void *v115;
  void *v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  uint64_t v126;
  void *v127;
  void *v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  int v139;
  uint64_t v140;
  void *v141;
  void *v142;
  int v143;
  uint64_t v144;
  void *v145;
  void *v146;
  int v147;
  uint64_t v148;
  void *v149;
  void *v150;
  int v151;
  uint64_t v152;
  void *v153;
  void *v154;
  int v155;
  uint64_t v156;
  void *v157;
  void *v158;
  int v159;
  uint64_t v160;
  void *v161;
  void *v162;
  int v163;
  uint64_t v164;
  void *v165;
  void *v166;
  int v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  uint64_t v173;
  void *v174;
  int v175;
  void *v176;
  int v177;
  void *v178;
  int v179;
  void *v180;
  int v181;
  uint64_t v182;
  void *v183;
  void *v184;
  int v185;
  uint64_t v186;
  void *v187;
  id v188;
  void *v190;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 20;
  v7 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 0, 20);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeContractFFBitMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("ContractBitmap"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractNetworkId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "BOOLValue");

  if ((_DWORD)v8)
  {
    v12 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 20, 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("ContractNetworkId"));

    v6 = 44;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractProvider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    v16 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v6, 8);
    v6 += 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("ContractProvider"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractTariff"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
  {
    v20 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v6, 16);
    v6 += 16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v21, CFSTR("ContractTariff"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractSerialNumber"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (v23)
  {
    v24 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v6, 32);
    v6 += 32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v25, CFSTR("ContractSerialNumber"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractCustomerInfoBitmap"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v27)
  {
    v28 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v6, 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isBitSet:", 0);
    v31 = 8;
    if (!v30)
      v31 = 2;
    v6 += v31;
    if (objc_msgSend(v29, "isBitSet:", 1))
      v6 += 32;

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractPassengerInfoBitmap"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "BOOLValue");

  if (v33)
  {
    v34 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v6, 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isBitSet:", 0);
    v37 = 10;
    if (!v36)
      v37 = 2;
    v6 += v37;
    if (objc_msgSend(v35, "isBitSet:", 1))
      v6 += 8;

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractPayMethod"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLValue");

  if (v39)
    v40 = v6 + 11;
  else
    v40 = v6;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractServices"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "BOOLValue");

  if (v42)
    v40 += 16;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractPriceAmount"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "BOOLValue");

  if (v44)
    v40 += 16;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractPriceUnit"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "BOOLValue");

  if (v46)
    v40 += 16;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractRestrictionBitmap"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "BOOLValue");

  if (v48)
  {
    v49 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40, 7);
    v50 = v40 + 7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeContractRestrictionBitmap:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ContractRestrictStart"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "BOOLValue");

    if (v54)
    {
      v55 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40 + 7, 11);
      v50 = v40 + 18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v56, CFSTR("ContractRestrictStart"));

    }
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ContractRestrictEnd"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "BOOLValue");

    if (v58)
    {
      v59 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v50, 11);
      v50 += 11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v60, CFSTR("ContractRestrictEnd"));

    }
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ContractRestrictDay"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLValue");

    if (v62)
    {
      v63 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v50, 8);
      v50 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v64, CFSTR("ContractRestrictDay"));

    }
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ContractRestrictTimeCode"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "BOOLValue");

    if (v66)
    {
      v67 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v50, 8);
      v50 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v68, CFSTR("ContractRestrictTimeCode"));

    }
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ContractRestrictCode"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "BOOLValue");

    if (v70)
    {
      v71 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v50, 8);
      v50 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v72, CFSTR("ContractRestrictCode"));

    }
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ContractRestrictProduct"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "BOOLValue");

    if (v74)
    {
      v75 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v50, 16);
      v50 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v76, CFSTR("ContractRestrictProduct"));

    }
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ContractRestrictLocation"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "BOOLValue");

    if (v78)
    {
      v79 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v50, 16);
      v50 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v80, CFSTR("ContractRestrictLocation"));

    }
    v40 = v50;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractValidityInfoBitmap"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "BOOLValue");

  if (v82)
  {
    v83 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40, 9);
    v84 = v40 + 9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v85, CFSTR("ContractValidityInfoBitmap"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v83);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeContractValidityBitmap:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityStartDate"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "BOOLValue");

    if (v89)
    {
      v90 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40 + 9, 14);
      v84 = v40 + 23;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v91, CFSTR("ContractValidityStartDate"));

    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityStartTime"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "BOOLValue");

    if (v93)
    {
      v94 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 11);
      v84 += 11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v95, CFSTR("ContractValidityStartTime"));

    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityEndDate"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "BOOLValue");

    if (v97)
    {
      v98 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 14);
      v84 += 14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v99, CFSTR("ContractValidityEndDate"));

    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityEndTime"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "BOOLValue");

    if (v101)
    {
      v102 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 11);
      v84 += 11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v103, CFSTR("ContractValidityEndTime"));

    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityDuration"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "BOOLValue");

    if (v105)
    {
      v106 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 8);
      v84 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v107, CFSTR("ContractValidityDuration"));

    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityLimitDate"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "BOOLValue");

    if (v109)
    {
      v110 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 14);
      v84 += 14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v111, CFSTR("ContractValidityLimitDate"));

    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityZones"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v112, "BOOLValue");

    if (v113)
    {
      v114 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 8);
      v84 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v115, CFSTR("ContractValidityZones"));

    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractValidityJourneys"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v116, "BOOLValue");

    if (v117)
    {
      v118 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 16);
      v119 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84 + 1, 5);
      v120 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84 + 8, 8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v119);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "setValue:forKey:", v121, CFSTR("ContractCounterStructure"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v120);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "setValue:forKey:", v122, CFSTR("ContractCounterLastLoadCount"));

      v84 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v118);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v123, CFSTR("ContractValidityJourneys"));

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v190, CFSTR("ContractValidityJourneysData"));
    }
    objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("ContractPeriodJourneys"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v124, "BOOLValue");

    if (v125)
    {
      v126 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v84, 16);
      v84 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v127, CFSTR("ContractPeriodJourneys"));

    }
    v40 = v84;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractJourneyDataBitmap"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v128, "BOOLValue");

  if (v129)
  {
    v130 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40, 8);
    v131 = v40 + 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v130);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeContractJourneyDataBitmap:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v130);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v134, CFSTR("ContractJourneyDataBitmap"));

    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyOrigin"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v132) = objc_msgSend(v135, "BOOLValue");

    if ((_DWORD)v132)
    {
      v136 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40 + 8, 16);
      v131 = v40 + 24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v137, CFSTR("ContractJourneyOrigin"));

    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyDestination"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v138, "BOOLValue");

    if (v139)
    {
      v140 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v131, 16);
      v131 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v141, CFSTR("ContractJourneyDestination"));

    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyRouteNumbers"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v142, "BOOLValue");

    if (v143)
    {
      v144 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v131, 16);
      v131 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v145, CFSTR("ContractJourneyRouteNumbers"));

    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyRouteVariants"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v146, "BOOLValue");

    if (v147)
    {
      v148 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v131, 8);
      v131 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v149, CFSTR("ContractJourneyRouteVariants"));

    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyRun"));
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "BOOLValue");

    if (v151)
    {
      v152 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v131, 16);
      v131 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v152);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v153, CFSTR("ContractJourneyRun"));

    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyVia"));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend(v154, "BOOLValue");

    if (v155)
    {
      v156 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v131, 16);
      v131 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v157, CFSTR("ContractJourneyVia"));

    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyVia"));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend(v158, "BOOLValue");

    if (v159)
    {
      v160 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v131, 16);
      v131 += 16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v161, CFSTR("ContractJourneyDistance"));

    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("ContractJourneyInterchanges"));
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend(v162, "BOOLValue");

    if (v163)
    {
      v164 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v131, 8);
      v131 += 8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v165, CFSTR("ContractJourneyInterchanges"));

    }
    v40 = v131;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractSaleDataBitmap"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend(v166, "BOOLValue");

  if (v167)
  {
    v168 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40, 4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeContractSaleDataBitmap:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v170, "objectForKeyedSubscript:", CFSTR("ContractSaleDate"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v171, "BOOLValue");

    v173 = 18;
    if (!v172)
      v173 = 4;
    v40 += v173;
    objc_msgSend(v170, "objectForKeyedSubscript:", CFSTR("ContractSaleTime"));
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = objc_msgSend(v174, "BOOLValue");

    if (v175)
      v40 += 11;
    objc_msgSend(v170, "objectForKeyedSubscript:", CFSTR("ContractSaleAgent"));
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v176, "BOOLValue");

    if (v177)
      v40 += 8;
    objc_msgSend(v170, "objectForKeyedSubscript:", CFSTR("ContractSaleDevice"));
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend(v178, "BOOLValue");

    if (v179)
      v40 += 16;

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractStatus"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = objc_msgSend(v180, "BOOLValue");

  if (v181)
  {
    v182 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40, 8);
    v40 += 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v182);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v183, CFSTR("ContractStatus"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContractLoyaltyPoints"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = objc_msgSend(v184, "BOOLValue");

  if (v185)
  {
    v186 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v40, 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v187, CFSTR("ContractLoyaltyPoints"));

  }
  v188 = v5;

  return v188;
}

+ (id)decodeEventBitMap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[23];
  _QWORD v33[25];

  v33[23] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("EventNetworkId");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isBitSet:", 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  v32[1] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 2));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v30;
  v32[2] = CFSTR("EventResult");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 3));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v29;
  v32[3] = CFSTR("EventServiceProvider");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 4));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v28;
  v32[4] = CFSTR("EventNotOkCounter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 5));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v27;
  v32[5] = CFSTR("EventSerialNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 6));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v26;
  v32[6] = CFSTR("EventDestination");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 7));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v25;
  v32[7] = CFSTR("EventLocationId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 8));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v24;
  v32[8] = CFSTR("EventLocationGate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 9));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v23;
  v32[9] = CFSTR("EventDevice");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 10));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v22;
  v32[10] = CFSTR("EventRouteNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 11));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v21;
  v32[11] = CFSTR("EventRouteVariant");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 12));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v20;
  v32[12] = CFSTR("EventJourneyRun");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 13));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v19;
  v32[13] = CFSTR("EventVehicleId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 14));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[13] = v18;
  v32[14] = CFSTR("EventLocationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[14] = v17;
  v32[15] = CFSTR("EventJourneyInterchanges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 19));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[15] = v5;
  v32[16] = CFSTR("EventTotalJourneys");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 21));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[16] = v6;
  v32[17] = CFSTR("EventJourneyDistance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 22));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[17] = v7;
  v32[18] = CFSTR("EventPriceAmount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 23));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[18] = v8;
  v32[19] = CFSTR("EventPriceUnit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[19] = v9;
  v32[20] = CFSTR("EventContractPointer");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 25));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[20] = v10;
  v32[21] = CFSTR("EventAuthenticator");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 26));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[21] = v11;
  v32[22] = CFSTR("EventDataBitmap");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "isBitSet:", 27);

  objc_msgSend(v12, "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[22] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)decodeEventEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 0, 14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("EventDateStamp"));

  v8 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 14, 11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("EventTimeStamp"));

  v10 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 25, 28);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeEventBitMap:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("EventBitmap"));

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventCode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "BOOLValue");

  if ((_DWORD)v11)
  {
    v15 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", 53, 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("EventCode"));

    v17 = 61;
  }
  else
  {
    v17 = 53;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventResult"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
  {
    v20 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 8);
    v17 += 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("EventResult"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventServiceProvider"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (v23)
  {
    v24 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 8);
    v17 += 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("EventServiceProvider"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventNotOkCounter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v27)
  {
    v28 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 8);
    v17 += 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("EventNotOkCounter"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventSerialNumber"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");

  if (v31)
  {
    v32 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 24);
    v17 += 24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("EventSerialNumber"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventLocationId"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "BOOLValue");

  if (v35)
  {
    v36 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 16);
    v17 += 16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("EventLocationId"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventLocationGate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLValue");

  if (v39)
  {
    v40 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 8);
    v17 += 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("EventLocationGate"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventDevice"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "BOOLValue");

  if (v43)
  {
    v44 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 16);
    v17 += 16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("EventDevice"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventRouteNumber"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "BOOLValue");

  if (v47)
  {
    v48 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 16);
    v17 += 16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("EventRouteNumber"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventJourneyRun"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "BOOLValue");

  if (v51)
  {
    v52 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 16);
    v17 += 16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("EventJourneyRun"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventVehicleId"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "BOOLValue");

  if (v55)
  {
    v56 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 16);
    v17 += 16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("EventVehicleId"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventContractPointer"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "BOOLValue");

  if (v59)
  {
    v60 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 5);
    v17 += 5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, CFSTR("EventContractPointer"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventDataBitmap"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "BOOLValue");

  if (v63)
  {
    v64 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17, 5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, CFSTR("EventDataBitmap"));

    v66 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17 + 5, 14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("EventDataDateFirstStamp"));

    v68 = objc_msgSend(v4, "readBinaryValueAtBit:numberOfBits:", v17 + 19, 11);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, CFSTR("EventDataTimeFirstStamp"));

  }
  return v5;
}

+ (id)decodeContractFFBitMap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[17];
  _QWORD v27[19];

  v27[17] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("ContractNetworkId");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isBitSet:", 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  v26[1] = CFSTR("ContractProvider");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v24;
  v26[2] = CFSTR("ContractTariff");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 2));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v23;
  v26[3] = CFSTR("ContractSerialNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 3));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v26[4] = CFSTR("ContractCustomerInfoBitmap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 4));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  v26[5] = CFSTR("ContractPassengerInfoBitmap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 5));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v20;
  v26[6] = CFSTR("ContractPayMethod");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 8));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v19;
  v26[7] = CFSTR("ContractServices");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 9));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v18;
  v26[8] = CFSTR("ContractPriceAmount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 10));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v17;
  v26[9] = CFSTR("ContractPriceUnit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 11));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v5;
  v26[10] = CFSTR("ContractRestrictionBitmap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 12));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v6;
  v26[11] = CFSTR("ContractValidityInfoBitmap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 13));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v7;
  v26[12] = CFSTR("ContractJourneyDataBitmap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 14));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v8;
  v26[13] = CFSTR("ContractSaleDataBitmap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 15));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v9;
  v26[14] = CFSTR("ContractStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v10;
  v26[15] = CFSTR("ContractLoyaltyPoints");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 17));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v11;
  v26[16] = CFSTR("ContractAuthenticator");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "isBitSet:", 18);

  objc_msgSend(v12, "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)decodeContractValidityBitmap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[9];
  _QWORD v19[11];

  v19[9] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("ContractValidityStartDate");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isBitSet:", 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("ContractValidityStartTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("ContractValidityEndDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v6;
  v18[3] = CFSTR("ContractValidityEndTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v7;
  v18[4] = CFSTR("ContractValidityDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v8;
  v18[5] = CFSTR("ContractValidityLimitDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 5));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  v18[6] = CFSTR("ContractValidityZones");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v10;
  v18[7] = CFSTR("ContractValidityJourneys");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 7));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v11;
  v18[8] = CFSTR("ContractPeriodJourneys");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "isBitSet:", 8);

  objc_msgSend(v12, "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)decodeContractJourneyDataBitmap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[8];
  _QWORD v18[9];

  v18[8] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("ContractJourneyOrigin");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isBitSet:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v17[1] = CFSTR("ContractJourneyDestination");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  v17[2] = CFSTR("ContractJourneyRouteNumbers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = CFSTR("ContractJourneyRouteVariants");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("ContractJourneyRun");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v9;
  v17[5] = CFSTR("ContractJourneyVia");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 5));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v10;
  v17[6] = CFSTR("ContractJourneyDistance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 6));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v11;
  v17[7] = CFSTR("ContractJourneyInterchanges");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "isBitSet:", 7);

  objc_msgSend(v12, "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)decodeContractSaleDataBitmap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("ContractSaleDate");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isBitSet:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("ContractSaleTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("ContractSaleAgent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("ContractSaleDevice");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v4, "isBitSet:", 3);

  objc_msgSend(v8, "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)decodeContractRestrictionBitmap:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("ContractRestrictStart");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isBitSet:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("ContractRestrictEnd");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v16[2] = CFSTR("ContractRestrictDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v16[3] = CFSTR("ContractRestrictTimeCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  v16[4] = CFSTR("ContractRestrictCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  v16[5] = CFSTR("ContractRestrictProduct");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBitSet:", 5));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v10;
  v16[6] = CFSTR("ContractRestrictLocation");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v4, "isBitSet:", 6);

  objc_msgSend(v11, "numberWithBool:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
  v10 = &unk_1E7D9AAB8;
  v11[0] = CFSTR("ATLAS");
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

+ (id)getTransitModality:(id)a3
{
  uint64_t v3;
  id result;
  uint64_t v5;

  v3 = objc_msgSend(a3, "unsignedLongValue");
  if (v3 == 89)
    return CFSTR("TransitOther");
  v5 = v3 >> 4;
  result = CFSTR("TransitBus");
  switch(v5)
  {
    case 1:
      return result;
    case 2:
      goto LABEL_7;
    case 3:
      result = CFSTR("TransitMetro");
      break;
    case 4:
      result = CFSTR("TransitLightRail");
      break;
    case 5:
      result = CFSTR("TransitTrain");
      break;
    default:
      if (v5 == 14)
        return CFSTR("TransitOther");
LABEL_7:
      result = CFSTR("Transit");
      break;
  }
  return result;
}

+ (id)formatTransitDetailRaw:(id)a3
{
  unsigned __int8 v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = objc_msgSend(a3, "unsignedLongValue");
  v4 = (v3 & 0xF) - 2;
  if (v4 < 0xA && ((0x233u >> v4) & 1) != 0)
  {
    v7 = 0;
    v8 = 0;
    v6 = 4;
  }
  else
  {
    v6 = 1;
    v7 = 0;
    v8 = 0;
    switch(v3 >> 4)
    {
      case 1:
        v7 = 0;
        v8 = 2;
        break;
      case 2:
        break;
      case 3:
        v7 = 0;
        v8 = 1;
        break;
      case 4:
        v8 = 3;
        v7 = 4;
        break;
      case 5:
        v7 = 0;
        v8 = 3;
        break;
      default:
        v5 = v3 >> 4;
        v6 = 1;
        if (v5 == 14)
          v7 = 4;
        else
          v7 = 0;
        if (v5 == 14)
          v8 = 4;
        else
          v8 = 0;
        break;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendByte:", v6);
  objc_msgSend(v9, "appendByte:", v8);
  objc_msgSend(v9, "appendByte:", v7);
  return v9;
}

+ (id)getInternalEnRouteStatus:(id)a3
{
  unint64_t v3;

  v3 = (objc_msgSend(a3, "unsignedLongValue") & 0xF) - 1;
  if (v3 > 0xA)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E7D8A6A0 + v3);
}

+ (id)getAbsoluteDateComponents:(id)a3 withTime:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "intValue") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &unk_1E7D9AB90;
    }
    objc_msgSend(MEMORY[0x1E0C99D78], "dateWithYear:month:day:hour:minute:second:", 1997, 1, (int)objc_msgSend(v6, "intValue"), 0, (int)objc_msgSend(v7, "intValue"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCalendar:", v10);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v11);

    objc_msgSend(v9, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:", 3145852, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getAbsoluteDateComponentsWithDefaultMinutes:(id)a3 withTime:(id)a4 withDefaultMinutes:(id)a5
{
  if (!a4)
    a4 = a5;
  +[AtlasDecoder getAbsoluteDateComponents:withTime:](AtlasDecoder, "getAbsoluteDateComponents:withTime:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)formatCommutePlanIdentifier:(id)a3 withTariffCode:(id)a4 withZoneList:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ContractCounterStructure"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ContractCounterLastLoadCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v10, "integerValue");
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_msgSend(v8, "intValue");
  v15 = objc_msgSend(v9, "intValue");
  if (v12 == 3)
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%05d_%02X_%d"), v14, v15, objc_msgSend(v11, "intValue"));
  else
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%05d_%02X_1"), v14, v15, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)calculateTransactionSN:(id)a3 withTimeStamp:(id)a4 withEventCode:(id)a5 withSP:(id)a6 withContractPointer:(id)a7 withDifferentiator:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  void *v28;
  void *v29;
  id v31;

  v14 = &unk_1E7D9ABA8;
  if (a8)
    v14 = a8;
  v15 = v14;
  v31 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  +[HashHelper hashHelper]();
  v21 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addNumber:](v21, v20);
  v22 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v22, v19);
  v23 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v23, v18);
  v24 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v24, v17);
  v25 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v25, v16);
  v26 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v26, v15);
  v27 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper getHash](v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v28, "u32BE:", 0));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)calculateCommutePlanUniqueId:(id)a3 withExpiry:(id)a4
{
  id v5;
  id v6;
  char *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  +[HashHelper hashHelper]();
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addString:](v7, v6);
  v8 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addDateComponents:](v8, v5);
  v9 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper getHash](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "asHexString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)commutePlanWithIdAndExpiry:(id)a3 withExpiry:(id)a4 withUniqueId:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v22[0] = CFSTR("CommutePlanIdentifier");
    v22[1] = CFSTR("CommutePlanValidityEndDate");
    v23[0] = a3;
    v23[1] = a4;
    v22[2] = CFSTR("CommutePlanUniqueIdentifier");
    v23[2] = a5;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a5;
    v9 = a4;
    v10 = a3;
    v11 = v23;
    v12 = v22;
    v13 = v7;
    v14 = 3;
  }
  else
  {
    v20[0] = CFSTR("CommutePlanIdentifier");
    v20[1] = CFSTR("CommutePlanValidityEndDate");
    v21[0] = a3;
    v21[1] = a4;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v8 = 0;
    v16 = a4;
    v17 = a3;
    v11 = v21;
    v12 = v20;
    v13 = v15;
    v14 = 2;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v11, v12, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)amountDictionaryWithAmount:(id)a3 withIdentifier:(id)a4 usingAmountKey:(id)a5 usingCurrencyKey:(id)a6 usingExponentKey:(id)a7 usingIdentifierKey:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3598];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_msgSend(v19, "intValue");
  if (v20 >= 0)
    v21 = v20;
  else
    v21 = -v20;
  v22 = objc_msgSend(v19, "intValue");

  objc_msgSend(v13, "decimalNumberWithMantissa:exponent:isNegative:", v21, 0, v22 >> 31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = v16;
  v29[0] = v23;
  v29[1] = CFSTR("XXX");
  v29[2] = &unk_1E7D9AB90;
  v28[2] = v15;
  v28[3] = v14;
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "asHexString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)getUnvalidatableContracts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BestContractList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        ATLLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v10;
          _os_log_impl(&dword_1C3511000, v11, OS_LOG_TYPE_DEBUG, "contract -> %@", buf, 0xCu);
        }

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BestContractPriority"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        if ((v13 & 0xFCu) >= 0xCuLL)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BestContractPriority"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BestContractPointer"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transactionDetailRaw, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_appletAID, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_hciArray, 0);
}

@end
