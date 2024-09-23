@implementation CopernicusDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_0 != -1)
    dispatch_once(&getInstance_onceToken_0, &__block_literal_global_1);
  return (id)getInstance_inst_0;
}

void __32__CopernicusDecoder_getInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getInstance_inst_0;
  getInstance_inst_0 = v0;

}

- (CopernicusDecoder)init
{
  CopernicusDecoder *v2;
  CopernicusDecoder *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CopernicusDecoder;
  v2 = -[CopernicusDecoder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CopernicusDecoder setEndPointIdentifier:](v2, "setEndPointIdentifier:", 0);
    -[CopernicusDecoder setState:](v3, "setState:", 0);
    -[CopernicusDecoder setTransactionType:](v3, "setTransactionType:", 0xFFFFFFFFLL);
    v4 = (void *)objc_opt_new();
    -[CopernicusDecoder setStepUpData:](v3, "setStepUpData:", v4);

    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v3);
  }
  return v3;
}

- (void)cleanup
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (-[CopernicusDecoder state](self, "state"))
  {
    ATLLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = -[CopernicusDecoder state](self, "state");
      _os_log_impl(&dword_1C3511000, v3, OS_LOG_TYPE_INFO, "Clearing non-idle Copernicus state %d", (uint8_t *)v5, 8u);
    }

    -[CopernicusDecoder setEndPointIdentifier:](self, "setEndPointIdentifier:", 0);
    -[CopernicusDecoder setState:](self, "setState:", 0);
    -[CopernicusDecoder setTransactionType:](self, "setTransactionType:", 0xFFFFFFFFLL);
    -[CopernicusDecoder stepUpData](self, "stepUpData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

  }
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v46;
  unsigned int v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  unsigned __int16 v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  unsigned int v66;
  __int16 v67;
  int v68;
  _QWORD v69[2];
  _QWORD v70[2];
  uint64_t v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if ((unint64_t)objc_msgSend(v11, "length") <= 1)
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v66 = objc_msgSend(v11, "length");
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Short eventData? %u"), objc_msgSend(v11, "length"));
    v15 = (void *)v14;
    if (!a8)
      goto LABEL_26;
    v16 = *a8;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v69[0] = *MEMORY[0x1E0CB2D50];
      v69[1] = *MEMORY[0x1E0CB3388];
      v70[0] = v14;
      v70[1] = v16;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v70;
      v20 = v69;
      v21 = 2;
    }
    else
    {
      v71 = *MEMORY[0x1E0CB2D50];
      v72[0] = v14;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = v72;
      v20 = &v71;
      v21 = 1;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v17;
    v43 = 6;
LABEL_25:
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v43, v41);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
LABEL_27:
    v44 = 0;
    goto LABEL_28;
  }
  v22 = objc_msgSend(v11, "u8:", 0);
  v23 = objc_msgSend(v11, "u8:", 1);
  if ((v23 - 18) <= 0xFDu)
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v66 = v23;
      v67 = 1024;
      v68 = v22;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Decoder only support version 0x10 and 0x11 of HCI event, got version=0x%02X with eventType=0x%02X", buf, 0xEu);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Decoder only support version 0x10 and 0x11 of HCI event, got version=0x%02X with eventType=0x%02X"), v23, v22);
    v15 = (void *)v25;
    if (!a8)
      goto LABEL_26;
    v26 = *a8;
    v27 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
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
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v27;
    v43 = 3;
    goto LABEL_25;
  }
  if ((_DWORD)v22 == 23 && (unint64_t)objc_msgSend(v11, "length") >= 4)
  {
    v56 = 0;
    objc_msgSend(v11, "subdataWithRange:", 2, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "getBytes:length:", &v56, 2);

    ATLLogObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v66 = bswap32(v56) >> 16;
      v35 = "Fatal Copernicus Error: 0x%04X";
      v36 = v34;
      v37 = OS_LOG_TYPE_ERROR;
      v38 = 8;
LABEL_40:
      _os_log_impl(&dword_1C3511000, v36, v37, v35, buf, v38);
    }
LABEL_41:

    goto LABEL_27;
  }
  ATLLogObject();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v66 = v22;
    v67 = 1024;
    v68 = -[CopernicusDecoder state](self, "state");
    _os_log_impl(&dword_1C3511000, v39, OS_LOG_TYPE_DEFAULT, "Received event 0x%02X in state %d", buf, 0xEu);
  }

  switch(-[CopernicusDecoder state](self, "state"))
  {
    case 0u:
      -[CopernicusDecoder handleEventInIdle:eventVersion:eventData:appletAID:error:](self, "handleEventInIdle:eventVersion:eventData:appletAID:error:", v22, v23, v11, v12, a8);
      v40 = objc_claimAutoreleasedReturnValue();
      break;
    case 1u:
      -[CopernicusDecoder handleEventInStandard:eventData:appletAID:error:](self, "handleEventInStandard:eventData:appletAID:error:", v22, v11, v12, a8);
      v40 = objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      -[CopernicusDecoder handleEventInFast:eventData:appletAID:error:](self, "handleEventInFast:eventData:appletAID:error:", v22, v11, v12, a8);
      v40 = objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
    case 4u:
      -[CopernicusDecoder handleEventInDummy:eventData:appletAID:error:](self, "handleEventInDummy:eventData:appletAID:error:", v22, v11, v12, a8);
      v40 = objc_claimAutoreleasedReturnValue();
      break;
    case 5u:
      ATLLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_WORD *)buf = 0;
      v35 = "Transaction already ended . . .";
      v36 = v34;
      v37 = OS_LOG_TYPE_DEFAULT;
      v38 = 2;
      goto LABEL_40;
    default:
      ATLLogObject();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = -[CopernicusDecoder state](self, "state");
        *(_DWORD *)buf = 67109120;
        v66 = v47;
        _os_log_impl(&dword_1C3511000, v46, OS_LOG_TYPE_ERROR, "Invalid state %d", buf, 8u);
      }

      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid state %d"), -[CopernicusDecoder state](self, "state"));
      v15 = (void *)v48;
      if (!a8)
        goto LABEL_26;
      v49 = *a8;
      v50 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v51 = *MEMORY[0x1E0CB3388];
        v57[0] = *MEMORY[0x1E0CB2D50];
        v57[1] = v51;
        v58[0] = v48;
        v58[1] = v49;
        v52 = (void *)MEMORY[0x1E0C99D80];
        v53 = v58;
        v54 = v57;
        v55 = 2;
      }
      else
      {
        v59 = *MEMORY[0x1E0CB2D50];
        v60 = v48;
        v52 = (void *)MEMORY[0x1E0C99D80];
        v53 = &v60;
        v54 = &v59;
        v55 = 1;
      }
      objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, v55);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v50;
      v43 = 8;
      goto LABEL_25;
  }
  v44 = (void *)v40;
LABEL_28:

  return v44;
}

- (id)handleEventInIdle:(unsigned __int8)a3 eventVersion:(unsigned __int8)a4 eventData:(id)a5 appletAID:(id)a6 error:(id *)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  NSObject *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  int v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  _QWORD v64[2];
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[10];
  _QWORD v69[10];
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  uint64_t v73;
  uint8_t buf[4];
  _BYTE v75[20];
  __int16 v76;
  int v77;
  uint64_t v78;

  v9 = a4;
  v10 = a3;
  v78 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = 0;
  switch((int)v10)
  {
    case 1:
    case 2:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 15:
      goto LABEL_62;
    case 3:
    case 4:
      if ((_DWORD)v10 == 4)
        v24 = 3;
      else
        v24 = 4;
      -[CopernicusDecoder setState:](self, "setState:", v24);
      if ((_DWORD)v9 != 17)
      {
        if ((_DWORD)v9 == 16)
        {
          if (objc_msgSend(v12, "length") == 31)
          {
            v25 = objc_msgSend(objc_retainAutorelease(v12), "bytes") + 2;
            v26 = (void *)MEMORY[0x1E0C99D50];
LABEL_35:
            objc_msgSend(v26, "dataWithBytes:length:", v25, 20);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "asHexString");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[CopernicusDecoder setEndPointIdentifier:](self, "setEndPointIdentifier:", v46);

            goto LABEL_61;
          }
          ATLLogObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_60;
LABEL_55:
          objc_msgSend(v12, "asHexString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v75 = v47;
          v48 = "No endpoint to retrieve: %@";
          v49 = v17;
          v50 = 12;
          goto LABEL_56;
        }
        ATLLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "asHexString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v75 = v9;
          *(_WORD *)&v75[4] = 2112;
          *(_QWORD *)&v75[6] = v47;
          v48 = "Unexpected event version %d for event %@";
          v49 = v17;
          v50 = 18;
LABEL_56:
          _os_log_impl(&dword_1C3511000, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);

        }
LABEL_60:

        goto LABEL_61;
      }
      if (objc_msgSend(v12, "length") != 32)
      {
        if (objc_msgSend(v12, "length") == 40)
        {
          v56 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
          ATLLogObject();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = *(unsigned __int8 *)(v56 + 39);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v75 = v58;
            _os_log_impl(&dword_1C3511000, v57, OS_LOG_TYPE_DEFAULT, "Reason for endpoint not found: %d", buf, 8u);
          }

          if (*(_BYTE *)(v56 + 39) != 4)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v56 + 2, 20);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "asHexString");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[CopernicusDecoder setEndPointIdentifier:](self, "setEndPointIdentifier:", v60);

          }
          ATLLogObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v61 = *(unsigned __int8 *)(v56 + 39);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v75 = v61;
            v37 = "Reason for endpoint not found: %d";
LABEL_24:
            _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_DEFAULT, v37, buf, 8u);
          }
          goto LABEL_60;
        }
        ATLLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_55;
        goto LABEL_60;
      }
      v42 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
      ATLLogObject();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = *(unsigned __int8 *)(v42 + 31);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v75 = v44;
        _os_log_impl(&dword_1C3511000, v43, OS_LOG_TYPE_DEFAULT, "Reason for endpoint not found: %d", buf, 8u);
      }

      if (*(_BYTE *)(v42 + 31) != 4)
      {
        v26 = (void *)MEMORY[0x1E0C99D50];
        v25 = v42 + 2;
        goto LABEL_35;
      }
LABEL_61:
      v14 = 0;
LABEL_62:

      return v14;
    case 5:
    case 6:
    case 7:
      if ((unint64_t)objc_msgSend(v12, "length") > 0x17)
      {
        v27 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
        v28 = bswap32(*(unsigned __int16 *)(v27 + 22));
        v29 = HIWORD(v28);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27 + 2, 20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "asHexString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CopernicusDecoder setEndPointIdentifier:](self, "setEndPointIdentifier:", v31);

        if ((_DWORD)v10 == 6)
          v32 = 2;
        else
          v32 = 1;
        -[CopernicusDecoder setState:](self, "setState:", v32);
        -[CopernicusDecoder setTransactionType:](self, "setTransactionType:", BYTE2(v28));
        v33 = &unk_1E7D9A9C8;
        if (!+[CopernicusDecoder isHomeAID:](CopernicusDecoder, "isHomeAID:", v13)
          && !+[CopernicusDecoder isHydraAID:](CopernicusDecoder, "isHydraAID:", v13))
        {
          v33 = &unk_1E7D9A9E0;
        }
        v68[0] = CFSTR("EventType");
        v68[1] = CFSTR("appletIdentifier");
        v69[0] = CFSTR("StartEvent");
        v69[1] = v13;
        v69[2] = &unk_1E7D9A9F8;
        v68[2] = CFSTR("selectStatus");
        v68[3] = CFSTR("command");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v34;
        v68[4] = CFSTR("endPointIdentifier");
        -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v69[4] = v35;
        v68[5] = CFSTR("BackgroundTransaction");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CopernicusDecoder transactionType](self, "transactionType") == 5);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v69[5] = v36;
        v69[6] = MEMORY[0x1E0C9AAB0];
        v68[6] = CFSTR("IgnoreRFEvents");
        v68[7] = CFSTR("DontWaitForEOT");
        v69[7] = MEMORY[0x1E0C9AAB0];
        v69[8] = MEMORY[0x1E0C9AAA0];
        v68[8] = CFSTR("RequiresPowerCycle");
        v68[9] = CFSTR("DelayExpressReentry");
        v69[9] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_62;
      }
      ATLLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v75 = v10;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v9;
        *(_WORD *)&v75[10] = 2048;
        *(_QWORD *)&v75[12] = 24;
        v76 = 1024;
        v77 = objc_msgSend(v12, "length");
        _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_ERROR, "Event type %d with version 0x%x expected length at least 0x%lx, got 0x%x", buf, 0x1Eu);
      }

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Event type %d with version 0x%x expected length at least 0x%lx, got 0x%x"), v10, v9, 24, objc_msgSend(v12, "length"));
      v17 = v16;
      if (!a7)
        goto LABEL_60;
      v18 = *a7;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v20 = *MEMORY[0x1E0CB3388];
        v70[0] = *MEMORY[0x1E0CB2D50];
        v70[1] = v20;
        v71[0] = v16;
        v71[1] = v18;
        v21 = (void *)MEMORY[0x1E0C99D80];
        v22 = v71;
        v23 = v70;
        goto LABEL_43;
      }
      v72 = *MEMORY[0x1E0CB2D50];
      v73 = v16;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v73;
      v23 = &v72;
      goto LABEL_58;
    case 14:
      if (objc_msgSend(v12, "length") == 23)
      {
        v38 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v38 + 2, 20);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "asHexString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[CopernicusDecoder setEndPointIdentifier:](self, "setEndPointIdentifier:", v40);

        if ((*(_BYTE *)(v38 + 22) & 1) != 0)
          v41 = 3;
        else
          v41 = 4;
        -[CopernicusDecoder setState:](self, "setState:", v41);
        goto LABEL_61;
      }
      ATLLogObject();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v75 = 23;
        *(_WORD *)&v75[8] = 1024;
        *(_DWORD *)&v75[10] = objc_msgSend(v12, "length");
        _os_log_impl(&dword_1C3511000, v51, OS_LOG_TYPE_ERROR, "Event type 0x0E expected length 0x%lx got 0x%x", buf, 0x12u);
      }

      v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Event type 0x0E expected length 0x%lx got 0x%x"), 23, objc_msgSend(v12, "length"));
      v17 = v52;
      if (a7)
      {
        v53 = *a7;
        v19 = (void *)MEMORY[0x1E0CB35C8];
        if (*a7)
        {
          v54 = *MEMORY[0x1E0CB3388];
          v64[0] = *MEMORY[0x1E0CB2D50];
          v64[1] = v54;
          v65[0] = v52;
          v65[1] = v53;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = v65;
          v23 = v64;
LABEL_43:
          v55 = 2;
        }
        else
        {
          v66 = *MEMORY[0x1E0CB2D50];
          v67 = v52;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = &v67;
          v23 = &v66;
LABEL_58:
          v55 = 1;
        }
        objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, v55);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v62);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_60;
    default:
      ATLLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v75 = v10;
      v37 = "Unknown event type 0x%02X, ignoring";
      goto LABEL_24;
  }
}

- (id)handleEventInStandard:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6
{
  int v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _DWORD v16[2];
  uint64_t v17;

  v8 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = 0;
  switch(v8)
  {
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
    case 14:
    case 15:
      break;
    case 2:
      -[CopernicusDecoder handleControlFlow:appletAID:error:](self, "handleControlFlow:appletAID:error:", v10, v11, a6);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8:
      -[CopernicusDecoder handleFailureWithImmediateExit:appletAID:error:](self, "handleFailureWithImmediateExit:appletAID:error:", 8, v11, a6);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 10:
      -[CopernicusDecoder handleApplicationSpecific:appletAID:error:](self, "handleApplicationSpecific:appletAID:error:", v10, v11, a6);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 11:
      -[CopernicusDecoder handleFailure:appletAID:error:](self, "handleFailure:appletAID:error:", 11, v11, a6);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 13:
      -[CopernicusDecoder handleMessageInExchange:appletAID:error:](self, "handleMessageInExchange:appletAID:error:", v10, v11, a6);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = (void *)v13;
      break;
    default:
      ATLLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 67109120;
        v16[1] = v8;
        _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%02X, ignoring", (uint8_t *)v16, 8u);
      }

      v12 = 0;
      break;
  }

  return v12;
}

- (id)handleEventInFast:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6
{
  int v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _DWORD v18[2];
  _QWORD v19[9];
  _QWORD v20[10];

  v8 = a3;
  v20[9] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = 0;
  switch(v8)
  {
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 13:
    case 14:
      goto LABEL_2;
    case 2:
      -[CopernicusDecoder handleControlFlow:appletAID:error:](self, "handleControlFlow:appletAID:error:", v10, v11, a6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 8:
      -[CopernicusDecoder handleFailureWithImmediateExit:appletAID:error:](self, "handleFailureWithImmediateExit:appletAID:error:", 8, v11, a6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 11:
      if (+[CopernicusDecoder isAutomotiveAID:](CopernicusDecoder, "isAutomotiveAID:", v11))
      {
        -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CopernicusDecoder setState:](self, "setState:", 5);
        v19[0] = CFSTR("EventType");
        v19[1] = CFSTR("appletIdentifier");
        v20[0] = CFSTR("EndEvent");
        v20[1] = v11;
        v19[2] = CFSTR("didError");
        v19[3] = CFSTR("command");
        v20[2] = &unk_1E7D9A9E0;
        v20[3] = &unk_1E7D9AA10;
        v19[4] = CFSTR("endPointIdentifier");
        v19[5] = CFSTR("informative");
        v20[4] = v15;
        v20[5] = &unk_1E7D9A9E0;
        v19[6] = CFSTR("BackgroundTransaction");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CopernicusDecoder transactionType](self, "transactionType") == 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20[6] = v16;
        v20[7] = &unk_1E7D9AA28;
        v19[7] = CFSTR("ptaTransactionMode");
        v19[8] = CFSTR("result");
        v20[8] = &unk_1E7D9AA40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[CopernicusDecoder handleFailure:appletAID:error:](self, "handleFailure:appletAID:error:", 11, v11, a6);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v12 = (void *)v14;
      }
LABEL_2:

      return v12;
    case 15:
      v12 = 0;
      self->_state = 1;
      goto LABEL_2;
    default:
      ATLLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 67109120;
        v18[1] = v8;
        _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%02X, ignoring", (uint8_t *)v18, 8u);
      }

      v12 = 0;
      goto LABEL_2;
  }
}

- (id)handleEventInDummy:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  NSObject *v14;
  _DWORD v15[2];
  uint64_t v16;

  v8 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (v8 > 0xF)
  {
LABEL_7:
    ATLLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109120;
      v15[1] = v8;
      _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%02X, ignoring", (uint8_t *)v15, 8u);
    }

    goto LABEL_3;
  }
  if (((1 << v8) & 0xE6FE) == 0)
  {
    if (((1 << v8) & 0x900) != 0)
    {
      -[CopernicusDecoder handleFailureWithImmediateExit:appletAID:error:](self, "handleFailureWithImmediateExit:appletAID:error:", v8, v11, a6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    goto LABEL_7;
  }
LABEL_3:
  v12 = 0;
LABEL_4:

  return v12;
}

- (id)handleControlFlow:(id)a3 appletAID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  void *v19;
  id v20;
  uint64_t v21;
  unsigned int v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  _BOOL4 v42;
  void *v43;
  id v44;
  _QWORD v45[11];
  _QWORD v46[11];
  _QWORD v47[2];
  _QWORD v48[2];
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  _BYTE buf[18];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "length") <= 3)
  {
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = 4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "Event type 0x02 expected length 0x%lx got 0x%x", buf, 0x12u);
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Event type 0x02 expected length 0x%lx got 0x%x"), 4, objc_msgSend(v8, "length"));
    v12 = v11;
    if (!a5)
      goto LABEL_31;
    v13 = *a5;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v15 = *MEMORY[0x1E0CB3388];
      v51[0] = *MEMORY[0x1E0CB2D50];
      v51[1] = v15;
      v52[0] = v11;
      v52[1] = v13;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v52;
      v18 = v51;
LABEL_17:
      v27 = 2;
LABEL_30:
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v27);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v39);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_31:
      v37 = 0;
      goto LABEL_32;
    }
    v53 = *MEMORY[0x1E0CB2D50];
    v54 = v11;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v54;
    v18 = &v53;
    goto LABEL_29;
  }
  -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    ATLLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v23, OS_LOG_TYPE_ERROR, "Control flow with no endPointIdentifier?!", buf, 2u);
    }

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Control flow with no endPointIdentifier?!"));
    v12 = v24;
    if (!a5)
      goto LABEL_31;
    v25 = *a5;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v26 = *MEMORY[0x1E0CB3388];
      v47[0] = *MEMORY[0x1E0CB2D50];
      v47[1] = v26;
      v48[0] = v24;
      v48[1] = v25;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v48;
      v18 = v47;
      goto LABEL_17;
    }
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = v24;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v50;
    v18 = &v49;
LABEL_29:
    v27 = 1;
    goto LABEL_30;
  }
  v20 = objc_retainAutorelease(v8);
  v21 = objc_msgSend(v20, "bytes");
  v22 = *(unsigned __int8 *)(v21 + 2);
  if (v22 >= 2)
  {
    ATLLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(unsigned __int8 *)(v21 + 2);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v28;
      _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring CF with P1 0x%X", buf, 8u);
    }
    goto LABEL_31;
  }
  v41 = v20;
  v42 = *(_BYTE *)(v21 + 2)
     && -[CopernicusDecoder state](self, "state") == 1
     && +[CopernicusDecoder isAutomotiveAID:](CopernicusDecoder, "isAutomotiveAID:", v9);
  -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v29 = -[CopernicusDecoder state](self, "state");
  -[CopernicusDecoder setState:](self, "setState:", 5);
  v45[0] = CFSTR("EventType");
  v45[1] = CFSTR("appletIdentifier");
  v46[0] = CFSTR("EndEvent");
  v46[1] = v9;
  v45[2] = CFSTR("didError");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22 == 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v43;
  v46[3] = &unk_1E7D9AA58;
  v45[3] = CFSTR("command");
  v45[4] = CFSTR("endPointIdentifier");
  v46[4] = v12;
  v45[5] = CFSTR("informative");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", __rev16(*(unsigned __int16 *)(v21 + 2)));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v30;
  v45[6] = CFSTR("BackgroundTransaction");
  v44 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CopernicusDecoder transactionType](self, "transactionType") == 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v31;
  v45[7] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (v22 != 0) << 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v32;
  v45[8] = CFSTR("ptaTransactionMode");
  if (v29 == 2)
    v33 = 1;
  else
    v33 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v34;
  v46[9] = MEMORY[0x1E0C9AAA0];
  v45[9] = CFSTR("DontWaitForEOT");
  v45[10] = CFSTR("ForceExpressExit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v42);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[10] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  v9 = v44;
  if (+[CopernicusDecoder isHomeAID:](CopernicusDecoder, "isHomeAID:", v44)
    && (unint64_t)objc_msgSend(v41, "length") >= 5)
  {
    v38 = objc_retainAutorelease(v41);
    *(_QWORD *)buf = objc_msgSend(v38, "bytes") + 4;
    *(_QWORD *)&buf[8] = objc_msgSend(v38, "length") - 4;
    -[CopernicusDecoder parseHomeSpecificCFParameters:into:](self, "parseHomeSpecificCFParameters:into:", buf, v37);
  }
LABEL_32:

  return v37;
}

- (id)handleFailureWithImmediateExit:(unsigned __int8)a3 appletAID:(id)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  unsigned __int16 v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v7 = a4;
  if (self->_state - 3 > 1)
  {
    v9 = 0;
  }
  else
  {
    -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -4091;
    else
      v9 = -4089;

  }
  v10 = 1;
  if (-[CopernicusDecoder state](self, "state") != 3)
  {
    if (-[CopernicusDecoder state](self, "state") == 2)
      v10 = 1;
    else
      v10 = 2;
  }
  v11 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CopernicusDecoder transactionType](self, "transactionType") == 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", CFSTR("EndEvent"), CFSTR("EventType"), &unk_1E7D9AA28, CFSTR("ForceExpressExit"), v7, CFSTR("appletIdentifier"), &unk_1E7D9AA28, CFSTR("didError"), v12, CFSTR("command"), v13, CFSTR("result"), v14, CFSTR("BackgroundTransaction"), v15, CFSTR("ptaTransactionMode"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("endPointIdentifier"));

  }
  if ((_DWORD)v5 == 11)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("DontWaitForEOT"));
  -[CopernicusDecoder setState:](self, "setState:", 5);

  return v16;
}

- (id)handleFailure:(unsigned __int8)a3 appletAID:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  unsigned __int16 v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  _QWORD v28[9];
  _QWORD v29[9];
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((_DWORD)v6 == 11)
      v10 = -4096;
    else
      v10 = -1;
    v11 = 1;
    if (-[CopernicusDecoder state](self, "state") != 3)
    {
      if (-[CopernicusDecoder state](self, "state") == 2)
        v11 = 1;
      else
        v11 = 2;
    }
    -[CopernicusDecoder setState:](self, "setState:", 5);
    v28[0] = CFSTR("EventType");
    v28[1] = CFSTR("appletIdentifier");
    v29[0] = CFSTR("EndEvent");
    v29[1] = v8;
    v29[2] = &unk_1E7D9AA28;
    v28[2] = CFSTR("didError");
    v28[3] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v12;
    v28[4] = CFSTR("endPointIdentifier");
    -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v13;
    v29[5] = &unk_1E7D9A9E0;
    v28[5] = CFSTR("informative");
    v28[6] = CFSTR("BackgroundTransaction");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CopernicusDecoder transactionType](self, "transactionType") == 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[6] = v14;
    v28[7] = CFSTR("ptaTransactionMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[7] = v15;
    v28[8] = CFSTR("result");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[8] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
    goto LABEL_19;
  }
  ATLLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v35 = v6;
    _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_ERROR, "Failure %d with no endpoint identifier?", buf, 8u);
  }

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failure %d with no endpoint identifier?"), v6);
  v12 = (void *)v19;
  if (a5)
  {
    v20 = *a5;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v22 = *MEMORY[0x1E0CB3388];
      v30[0] = *MEMORY[0x1E0CB2D50];
      v30[1] = v22;
      v31[0] = v19;
      v31[1] = v20;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v31;
      v25 = v30;
      v26 = 2;
    }
    else
    {
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = v19;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = &v33;
      v25 = &v32;
      v26 = 1;
    }
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v13);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (id)handleApplicationSpecific:(id)a3 appletAID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
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
  id v25;
  uint64_t v26;
  NSMutableDictionary *stepUpData;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  int v33;
  int v34;
  void *v35;
  _BYTE buf[18];
  __int16 v38;
  int v39;
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ATLLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v20, OS_LOG_TYPE_ERROR, "Application Specific with no endpoint identifier?", buf, 2u);
    }

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Application Specific with no endpoint identifier?"));
    v13 = (void *)v21;
    if (!a5)
      goto LABEL_27;
    v22 = *a5;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v23 = *MEMORY[0x1E0CB3388];
      v46[0] = *MEMORY[0x1E0CB2D50];
      v46[1] = v23;
      v47[0] = v21;
      v47[1] = v22;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v47;
      v19 = v46;
      goto LABEL_13;
    }
    v48 = *MEMORY[0x1E0CB2D50];
    v49[0] = v21;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = v49;
    v19 = &v48;
LABEL_25:
    v24 = 1;
    goto LABEL_26;
  }
  if ((unint64_t)objc_msgSend(v8, "length") <= 3)
  {
    ATLLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1C3511000, v11, OS_LOG_TYPE_ERROR, "Event Application Specific too small %u", buf, 8u);
    }

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Event Application Specific too small %u"), objc_msgSend(v8, "length"));
    v13 = (void *)v12;
    if (!a5)
      goto LABEL_27;
    v14 = *a5;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v42[0] = *MEMORY[0x1E0CB2D50];
      v42[1] = v16;
      v43[0] = v12;
      v43[1] = v14;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v43;
      v19 = v42;
LABEL_13:
      v24 = 2;
LABEL_26:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v24);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v35);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
LABEL_28:
      v30 = 0;
      goto LABEL_29;
    }
    v44 = *MEMORY[0x1E0CB2D50];
    v45 = v12;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v45;
    v19 = &v44;
    goto LABEL_25;
  }
  v25 = objc_retainAutorelease(v8);
  v26 = objc_msgSend(v25, "bytes");
  if (!+[CopernicusDecoder supportsStepUp:](CopernicusDecoder, "supportsStepUp:", v9)
    || *(_BYTE *)(v26 + 2) != 64
    || *(unsigned __int8 *)(v26 + 3) != 160)
  {
    ATLLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(unsigned __int8 *)(v26 + 2);
      v34 = *(unsigned __int8 *)(v26 + 3);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v33;
      v38 = 1024;
      v39 = v34;
      _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_DEFAULT, "Not interested in Application Specific for AID %@ P1 0x%X P2 0x%X", buf, 0x18u);
    }

    goto LABEL_28;
  }
  -[CopernicusDecoder setState:](self, "setState:", 5);
  v40[0] = CFSTR("EventType");
  v40[1] = CFSTR("StepUpReaderData");
  stepUpData = self->_stepUpData;
  v41[0] = CFSTR("StepUpRequested");
  v41[1] = stepUpData;
  v41[2] = v9;
  v40[2] = CFSTR("appletIdentifier");
  v40[3] = CFSTR("endPointIdentifier");
  -[CopernicusDecoder endPointIdentifier](self, "endPointIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  if (+[CopernicusDecoder isHomeAID:](CopernicusDecoder, "isHomeAID:", v9)
    && (unint64_t)objc_msgSend(v25, "length") >= 5)
  {
    v31 = objc_retainAutorelease(v25);
    *(_QWORD *)buf = objc_msgSend(v31, "bytes") + 4;
    *(_QWORD *)&buf[8] = objc_msgSend(v31, "length") - 4;
    -[CopernicusDecoder parseHomeSpecificCFParameters:into:](self, "parseHomeSpecificCFParameters:into:", buf, v30);
  }
LABEL_29:

  return v30;
}

- (id)handleMessageInExchange:(id)a3 appletAID:(id)a4 error:(id *)a5
{
  id v7;
  unsigned __int8 *v8;
  id v9;
  int v10;
  int v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  unsigned __int8 *v16[2];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (+[CopernicusDecoder supportsStepUp:](CopernicusDecoder, "supportsStepUp:", a4)
    && (unint64_t)objc_msgSend(v7, "length") >= 3)
  {
    v8 = (unsigned __int8 *)(objc_msgSend(v7, "length") - 3);
    v9 = objc_retainAutorelease(v7);
    v16[0] = (unsigned __int8 *)(objc_msgSend(v9, "bytes") + 2);
    v16[1] = v8;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__CopernicusDecoder_handleMessageInExchange_appletAID_error___block_invoke;
    v14[3] = &unk_1E7D8A550;
    v14[4] = self;
    v15 = v9;
    v10 = DERDecodeSequenceWithBlock(v16, (uint64_t)v14);
    if (v10)
    {
      v11 = v10;
      ATLLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v18 = v11;
        _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_ERROR, "Failed to decode contents of EXCHANGE %d", buf, 8u);
      }

    }
  }

  return 0;
}

uint64_t __61__CopernicusDecoder_handleMessageInExchange_appletAID_error___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*a2 != 0xC000000000000000)
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v10 = *a2;
    v13 = 134217984;
    v14 = v10;
    v6 = "Ignoring exchange tag 0x%llx";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
    v9 = 12;
    goto LABEL_10;
  }
  if (a2[2] != 32)
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v11 = a2[2];
    v13 = 134217984;
    v14 = v11;
    v6 = "StepUp -- invalid length %zx for shared secret";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", 4, 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v4, CFSTR("SharedSecret"));

  ATLLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    v6 = "StepUp - got shared secret over exchange";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 2;
LABEL_10:
    _os_log_impl(&dword_1C3511000, v7, v8, v6, (uint8_t *)&v13, v9);
  }
LABEL_11:

  return 0;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "CopernicusDecoder doesn't support GetState", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CopernicusDecoder doesn't support GetState"));
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

+ (BOOL)isCopernicus:(id)a3
{
  return objc_msgSend(CFSTR("A000000704D011500000000002000000"), "isEqualToString:", a3);
}

+ (BOOL)isAutomotiveAID:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("A000000809434343444B417631"));
}

+ (BOOL)isHomeAID:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("A0000008580101"));
}

+ (BOOL)isHydraAID:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("A0000008580201"));
}

+ (BOOL)supportsStepUp:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[CopernicusDecoder isHomeAID:](CopernicusDecoder, "isHomeAID:", v3)
    || +[CopernicusDecoder isHydraAID:](CopernicusDecoder, "isHydraAID:", v3);

  return v4;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = &unk_1E7D9A9C8;
  if (!+[CopernicusDecoder isHomeAID:](CopernicusDecoder, "isHomeAID:", v7)
    && !+[CopernicusDecoder isHydraAID:](CopernicusDecoder, "isHydraAID:", v7))
  {
    v8 = &unk_1E7D9A9E0;
  }
  v11[0] = CFSTR("Supported");
  v11[1] = CFSTR("DelayExpressReentry");
  v12[0] = MEMORY[0x1E0C9AAB0];
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Copernicus decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Copernicus decoder doesn't expect processEndOfTransaction"));
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

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (NSString)endPointIdentifier
{
  return self->_endPointIdentifier;
}

- (void)setEndPointIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endPointIdentifier, a3);
}

- (unsigned)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unsigned int)a3
{
  self->_transactionType = a3;
}

- (NSMutableDictionary)stepUpData
{
  return self->_stepUpData;
}

- (void)setStepUpData:(id)a3
{
  objc_storeStrong((id *)&self->_stepUpData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepUpData, 0);
  objc_storeStrong((id *)&self->_endPointIdentifier, 0);
}

- (void)parseHomeSpecificCFParameters:(id *)a3 into:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, _QWORD *);
  void *v16;
  CopernicusDecoder *v17;
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __62__CopernicusDecoder_Home__parseHomeSpecificCFParameters_into___block_invoke;
  v16 = &unk_1E7D8A550;
  v17 = self;
  v7 = v6;
  v18 = v7;
  v8 = DERDecodeSequenceWithBlock((unsigned __int8 **)a3, (uint64_t)&v13);
  if (v8)
  {
    v9 = v8;
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithDERItem:", a3, v13, v14, v15, v16, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "asHexString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v20 = v9;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "Failed to parse additional HomeKit data (%d) - %@", buf, 0x12u);

    }
  }

}

uint64_t __62__CopernicusDecoder_Home__parseHomeSpecificCFParameters_into___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;

  if (*a2 == 0x400000000000000DLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stringFromASCIIBytes:", a2 + 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(void **)(a1 + 40);
      v5 = CFSTR("HomeKitModel");
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (*a2 == 0x400000000000000CLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stringFromASCIIBytes:", a2 + 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(void **)(a1 + 40);
      v5 = CFSTR("HomeKitManufacturer");
LABEL_7:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 0;
}

- (id)_stringFromASCIIBytes:(id *)a3
{
  unint64_t var1;
  char *var0;
  int v5;

  var1 = a3->var1;
  if (!var1)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3->var0, a3->var1, 1);
  var0 = a3->var0;
  while (1)
  {
    v5 = *var0++;
    if (v5 < 0)
      break;
    if (!--var1)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3->var0, a3->var1, 1);
  }
  return 0;
}

@end
