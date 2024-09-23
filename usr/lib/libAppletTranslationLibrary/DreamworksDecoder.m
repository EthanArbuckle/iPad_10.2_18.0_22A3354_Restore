@implementation DreamworksDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_4 != -1)
    dispatch_once(&getInstance_onceToken_4, &__block_literal_global_10);
  return (id)getInstance_inst_3;
}

void __32__DreamworksDecoder_getInstance__block_invoke()
{
  DreamworksDecoder *v0;
  void *v1;

  v0 = objc_alloc_init(DreamworksDecoder);
  v1 = (void *)getInstance_inst_3;
  getInstance_inst_3 = (uint64_t)v0;

}

- (DreamworksDecoder)init
{
  DreamworksDecoder *v2;
  DreamworksDecoder *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DreamworksDecoder;
  v2 = -[DreamworksDecoder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->decoderState = 0;
    if ((+[AppletTranslator isInternalBuild]() & 1) != 0)
    {
      +[AppletTranslator userDefaults]();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3->debug = objc_msgSend(v4, "BOOLForKey:", CFSTR("debug.dreamworks"));

    }
    else
    {
      v3->debug = 0;
    }
  }
  return v3;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Supported");
  v8[1] = CFSTR("DelayExpressReentry");
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = &unk_1E7D9B2C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SelectByNameCmd(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "transceiveAndCheckSW:error:", v12, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[DreamworksReaderContext readAllFiles:debug:error:](DreamworksReaderContext, "readAllFiles:debug:error:", v10, self->debug, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[DreamworksDecoder getAppletStateAndHistory:withError:](self, "getAppletStateAndHistory:withError:", v14, a7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)getAppletStateAndHistory:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[DreamworksDecoder getState:](self, "getState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DreamworksDecoder getHistory:state:error:](self, "getHistory:state:error:", v6, v7, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v12[0] = CFSTR("State");
    v12[1] = CFSTR("TransactionHistory");
    v13[0] = v7;
    v13[1] = v8;
    v12[2] = CFSTR("ATLInternal");
    v13[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
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
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[4];
  void *v28;
  _QWORD v29[6];
  _QWORD v30[8];

  v30[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(v4, "filePurseInfo");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = DecodeBCD((char *)objc_msgSend(v6, "bytes"), 25, 2);
  objc_msgSend(v4, "filePurseInfo");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = DecodeBCD((char *)objc_msgSend(v8, "bytes"), 27, 1);
  objc_msgSend(v4, "filePurseInfo");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "dateWithYear:month:day:", v7, v9, DecodeBCD((char *)objc_msgSend(v10, "bytes"), 28, 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filePurseInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subdataWithRange:", 8, 8);
  v22 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileTrans");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __30__DreamworksDecoder_getState___block_invoke;
  v25[3] = &unk_1E7D8AF50;
  v25[4] = self;
  objc_msgSend(v13, "firstWhere:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && objc_msgSend(v14, "isIn"))
    objc_msgSend(v12, "addObject:", CFSTR("TransitMetro"));
  v29[0] = CFSTR("Balances");
  v26[0] = CFSTR("BalanceCurrency");
  v26[1] = CFSTR("BalanceCurrencyExponent");
  v27[0] = CFSTR("KRW");
  v27[1] = &unk_1E7D9B2E0;
  v26[2] = CFSTR("Balance");
  v15 = (void *)MEMORY[0x1E0CB3598];
  objc_msgSend(v4, "balance", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "decimalNumberWithMantissa:exponent:isNegative:", objc_msgSend(v16, "unsignedIntValue"), 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = CFSTR("BalanceIdentifier");
  v27[2] = v17;
  v27[3] = CFSTR("PurseBalance");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = CFSTR("Taiji");
  v29[1] = CFSTR("SP");
  v29[2] = CFSTR("SPRaw");
  v30[2] = &unk_1E7D9B2E0;
  v30[3] = v24;
  v30[4] = v23;
  v29[3] = CFSTR("CardExpirationDate");
  v29[4] = CFSTR("CardIdentifier");
  v29[5] = CFSTR("TransactionInProgress");
  v30[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

BOOL __30__DreamworksDecoder_getState___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "resolveTransitModality:", objc_msgSend(a2, "vehicleType"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == CFSTR("TransitMetro");

  return v3;
}

- (id)getHistory:(id)a3 state:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  NSObject *v27;
  __int128 v29;
  void *v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  int v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "filePurse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = v5;
  objc_msgSend(v5, "filePurse");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v34;
    *(_QWORD *)&v10 = 67109120;
    v29 = v10;
LABEL_3:
    v13 = 0;
    while (2)
    {
      if (*(_QWORD *)v34 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "trt");
      v17 = v16;
      v19 = (v16 == 64 || v16 == 2) && objc_msgSend(v14, "amount") != 0;
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", objc_msgSend(v14, "amount"), 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("Amount"));

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithLongBE:", objc_msgSend(v14, "idSam"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("TerminalIdentifier"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "seqnum"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("SerialNumber"));

      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", objc_msgSend(v14, "balance"), 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("FinalBalance"));

      switch(v17)
      {
        case 1:
          objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Purchase"), CFSTR("TypeDetail"));
          objc_msgSend(v30, "fileTrans");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[DreamworksDecoder parseTransit:fileTrans:into:](self, "parseTransit:fileTrans:into:", v14, v24, v15);

          goto LABEL_23;
        case 2:
          v25 = v15;
          v26 = CFSTR("TopUp");
          goto LABEL_22;
        case 3:
          v25 = v15;
          v26 = CFSTR("PurchaseRefundReturn");
          goto LABEL_22;
        case 4:
          v25 = v15;
          v26 = CFSTR("TopUpCancel");
          goto LABEL_22;
        default:
          if (v17 == 64)
          {
            v25 = v15;
            v26 = CFSTR("PurchaseRefund");
LABEL_22:
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("TypeDetail"));
          }
          else
          {
            ATLLogObject();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v38 = v17;
              _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "TRT not recognized (%d).", buf, 8u);
            }

          }
LABEL_23:
          objc_msgSend(v8, "addObject:", v15);

          if (v11 != ++v13)
            continue;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (!v11)
            goto LABEL_25;
          goto LABEL_3;
      }
    }
  }
LABEL_25:

  -[DreamworksDecoder adjustSN:](self, "adjustSN:", v8);
  return v8;
}

- (void)parseTransit:(id)a3 fileTrans:(id)a4 into:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v8 = a3;
  v9 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __49__DreamworksDecoder_parseTransit_fileTrans_into___block_invoke;
  v20[3] = &unk_1E7D8AF50;
  v10 = v8;
  v21 = v10;
  objc_msgSend(a4, "filter:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    if (v12 != 1)
    {
      objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_370);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    objc_msgSend(v11, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "datetime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("TransactionTime"));

    -[DreamworksDecoder resolveTransitModality:](self, "resolveTransitModality:", objc_msgSend(v14, "vehicleType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("TypeDetail"));

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithShortBE:", objc_msgSend(v14, "vehicleType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("TypeDetailRaw"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v18 == CFSTR("TransitMetro"))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithIntBE:", objc_msgSend(v14, "stationCode"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("EndStation"));

    }
  }

}

BOOL __49__DreamworksDecoder_parseTransit_fileTrans_into___block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "seqnum");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "seqnum");
}

uint64_t __49__DreamworksDecoder_parseTransit_fileTrans_into___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "number");
  if (v6 <= objc_msgSend(v5, "number"))
  {
    v8 = objc_msgSend(v4, "number");
    if (v8 >= objc_msgSend(v5, "number"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)adjustSN:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") << 8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("SerialNumber"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
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
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if ((unint64_t)objc_msgSend(v11, "length") <= 1)
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = objc_msgSend(v11, "length");
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Short eventData? %u"), objc_msgSend(v11, "length"));
    v15 = (void *)v14;
    if (!a8)
      goto LABEL_19;
    v16 = *a8;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v41[0] = *MEMORY[0x1E0CB2D50];
      v41[1] = v18;
      v42[0] = v14;
      v42[1] = v16;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v42;
      v21 = v41;
LABEL_7:
      v22 = 2;
LABEL_18:
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 6, v27);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_25:
      v28 = 0;
      goto LABEL_26;
    }
    v43 = *MEMORY[0x1E0CB2D50];
    v44[0] = v14;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v44;
    v21 = &v43;
    goto LABEL_17;
  }
  v23 = objc_retainAutorelease(v11);
  v24 = *(unsigned __int8 *)objc_msgSend(v23, "bytes");
  if (v24 > 4)
  {
    if ((_DWORD)v24 == 5)
    {
      ATLLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v23, "asHexString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v29;
        _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_DEFAULT, "State change event, nothing to do here. %@", buf, 0xCu);

      }
    }
    else
    {
      if ((_DWORD)v24 != 18)
        goto LABEL_27;
      ATLLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_INFO, "Deselect event, nothing to do here", buf, 2u);
      }
    }

    goto LABEL_25;
  }
  if ((_DWORD)v24 == 1)
  {
    -[DreamworksDecoder parseStartEvent:withApplet:withError:](self, "parseStartEvent:withApplet:withError:", v23, v12, a8);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if ((_DWORD)v24 != 2)
  {
LABEL_27:
    ATLLogObject();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v24;
      _os_log_impl(&dword_1C3511000, v31, OS_LOG_TYPE_ERROR, "Unknown event type %u", buf, 8u);
    }

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown event type %u"), v24);
    v15 = (void *)v32;
    if (!a8)
      goto LABEL_19;
    v33 = *a8;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v34 = *MEMORY[0x1E0CB3388];
      v35[0] = *MEMORY[0x1E0CB2D50];
      v35[1] = v34;
      v36[0] = v32;
      v36[1] = v33;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v36;
      v21 = v35;
      goto LABEL_7;
    }
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = v32;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v38;
    v21 = &v37;
LABEL_17:
    v22 = 1;
    goto LABEL_18;
  }
  -[DreamworksDecoder parseEndEvent:withApplet:withError:](self, "parseEndEvent:withApplet:withError:", v23, v12, a8);
  v25 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v28 = (void *)v25;
LABEL_26:

  return v28;
}

- (id)parseStartEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t decoderState;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
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
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[9];
  _QWORD v35[9];
  _QWORD v36[2];
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") != 5)
  {
    ATLLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v45 = objc_msgSend(v8, "length");
      v46 = 2048;
      v47 = 5;
      _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_ERROR, "Start event length %u expected %lu", buf, 0x12u);
    }

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start event length %u expected %lu"), objc_msgSend(v8, "length"), 5);
    v14 = v17;
    if (!a5)
      goto LABEL_29;
    v18 = *a5;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v20 = *MEMORY[0x1E0CB3388];
      v40[0] = *MEMORY[0x1E0CB2D50];
      v40[1] = v20;
      v41[0] = v17;
      v41[1] = v18;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = v41;
      v23 = v40;
LABEL_17:
      v29 = 2;
LABEL_27:
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 6, v32);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = v17;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = &v43;
    v23 = &v42;
LABEL_26:
    v29 = 1;
    goto LABEL_27;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  v11 = v10;
  if (*(_BYTE *)(v10 + 1) != 8)
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(unsigned __int8 *)(v11 + 1);
      *(_DWORD *)buf = 67109120;
      v45 = v25;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Start event got unexpected version 0x%x", buf, 8u);
    }

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start event got unexpected version 0x%x"), *(unsigned __int8 *)(v11 + 1));
    v14 = v26;
    if (!a5)
      goto LABEL_29;
    v27 = *a5;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v28 = *MEMORY[0x1E0CB3388];
      v36[0] = *MEMORY[0x1E0CB2D50];
      v36[1] = v28;
      v37[0] = v26;
      v37[1] = v27;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = v37;
      v23 = v36;
      goto LABEL_17;
    }
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = v26;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = &v39;
    v23 = &v38;
    goto LABEL_26;
  }
  if (!*(_BYTE *)(v10 + 2))
  {
    ATLLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Dropping Start event over contact";
      goto LABEL_21;
    }
LABEL_28:
    a5 = 0;
    goto LABEL_29;
  }
  decoderState = self->decoderState;
  ATLLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (decoderState == 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Dropping Start event because already started";
LABEL_21:
      _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v14, OS_LOG_TYPE_INFO, "Got CL Start Event, setting state to Active", buf, 2u);
  }

  self->decoderState = 1;
  +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, self);
  v34[0] = CFSTR("EventType");
  v34[1] = CFSTR("appletIdentifier");
  v35[0] = CFSTR("StartEvent");
  v35[1] = v9;
  v34[2] = CFSTR("Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v11 + 1));
  v14 = objc_claimAutoreleasedReturnValue();
  v35[2] = v14;
  v34[3] = CFSTR("Interface");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v11 + 2));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v30;
  v34[4] = CFSTR("selectStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v11 + 3)) >> 16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = CFSTR("IgnoreRFEvents");
  v34[6] = CFSTR("DontWaitForEOT");
  v35[4] = v31;
  v35[5] = MEMORY[0x1E0C9AAB0];
  v35[6] = MEMORY[0x1E0C9AAB0];
  v35[7] = MEMORY[0x1E0C9AAA0];
  v34[7] = CFSTR("RequiresPowerCycle");
  v34[8] = CFSTR("DelayExpressReentry");
  v35[8] = &unk_1E7D9B2C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 9);
  a5 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_29:
  return a5;
}

- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5
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
  unint64_t decoderState;
  NSObject *v24;
  NSObject *v25;
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
  unsigned int v39;
  unsigned int v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[12];
  _QWORD v56[12];
  __int128 buf;
  _QWORD v58[2];
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "length") <= 8)
  {
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event length %zu"), objc_msgSend(v8, "length"));
    v12 = (void *)v11;
    if (!a5)
      goto LABEL_36;
    v13 = *a5;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v15 = *MEMORY[0x1E0CB3388];
      v62[0] = *MEMORY[0x1E0CB2D50];
      v62[1] = v15;
      v63[0] = v11;
      v63[1] = v13;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v63;
      v18 = v62;
      v19 = 2;
    }
    else
    {
      v64 = *MEMORY[0x1E0CB2D50];
      v65[0] = v11;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v65;
      v18 = &v64;
      v19 = 1;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    v38 = 3;
LABEL_35:
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v38, v36);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_36:
    v45 = 0;
    goto LABEL_39;
  }
  v20 = objc_retainAutorelease(v8);
  v21 = objc_msgSend(v20, "bytes");
  v22 = v21;
  if (*(_BYTE *)(v21 + 1) != 8)
  {
    ATLLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = *(unsigned __int8 *)(v22 + 1);
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v27;
      _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_ERROR, "End event got unexpected version 0x%x", (uint8_t *)&buf, 8u);
    }

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("End event got unexpected version 0x%x"), *(unsigned __int8 *)(v22 + 1));
    v12 = (void *)v28;
    if (!a5)
      goto LABEL_36;
    v29 = *a5;
    v30 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v31 = *MEMORY[0x1E0CB3388];
      v58[0] = *MEMORY[0x1E0CB2D50];
      v58[1] = v31;
      v59[0] = v28;
      v59[1] = v29;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = v59;
      v34 = v58;
      v35 = 2;
    }
    else
    {
      v60 = *MEMORY[0x1E0CB2D50];
      v61 = v28;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = &v61;
      v34 = &v60;
      v35 = 1;
    }
    objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v30;
    v38 = 6;
    goto LABEL_35;
  }
  if (*(_BYTE *)(v21 + 2) == 1)
  {
    decoderState = self->decoderState;
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (decoderState == 1)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_DEFAULT, "Got CL End Event, setting state to Idle", (uint8_t *)&buf, 2u);
      }

      self->decoderState = 0;
      +[AppletTranslator deregisterForCleanup:]((uint64_t)AppletTranslator, self);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_ERROR, "End event in IDLE state?!", (uint8_t *)&buf, 2u);
      }

    }
  }
  v39 = *(_DWORD *)(v22 + 5);
  v40 = *(unsigned __int16 *)(v22 + 3);
  if (v40 == 144 || (v40 == 33642 ? (v41 = (*(_DWORD *)(v22 + 5) & 0xFF00) == 45568) : (v41 = 0), v41))
  {
    v43 = 0;
    v42 = 64;
  }
  else
  {
    v42 = 0;
    v43 = 1;
  }
  objc_msgSend(v20, "subdataWithRange:", 9, objc_msgSend(v20, "length") - 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = objc_msgSend(v12, "bytes");
  *((_QWORD *)&buf + 1) = objc_msgSend(v12, "length");
  -[DreamworksDecoder DecodeEndE1TLV:error:](self, "DecodeEndE1TLV:error:", &buf, a5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44 && !*a5)
  {
    v55[0] = CFSTR("EventType");
    v55[1] = CFSTR("appletIdentifier");
    v56[0] = CFSTR("EndEvent");
    v56[1] = v9;
    v55[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v22 + 1));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v54;
    v55[3] = CFSTR("Interface");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v22 + 2));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v53;
    v55[4] = CFSTR("didError");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v52;
    v55[5] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(v39));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v46;
    v55[6] = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v40) >> 16);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v47;
    v55[7] = CFSTR("result");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v42);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v48;
    v56[8] = &unk_1E7D9B2E0;
    v55[8] = CFSTR("informative");
    v55[9] = CFSTR("type");
    v56[9] = &unk_1E7D9B2F8;
    v55[10] = CFSTR("ReadOperationInfo");
    objc_msgSend(v44, "objectForKeyedSubscript:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v56[10] = v49;
    v55[11] = CFSTR("WriteOperationInfo");
    objc_msgSend(v44, "objectForKeyedSubscript:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v56[11] = v50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }

LABEL_39:
  return v45;
}

- (id)DecodeEndE1TLV:(id *)a3 error:(id *)a4
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
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
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
  uint64_t v44;
  uint64_t v45;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  uint8_t v55[4];
  int v56;
  uint8_t buf[16];
  DERItem v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint64_t v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50[0] = 0;
  v50[1] = 0;
  v6 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v49);
  if ((_DWORD)v6)
  {
    v7 = v6;
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Failed to decode End Event E1 %d", buf, 8u);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode End Event E1 %d"), v7);
    v10 = (void *)v9;
    if (a4)
    {
      v11 = *a4;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v13 = *MEMORY[0x1E0CB3388];
        v63[0] = *MEMORY[0x1E0CB2D50];
        v63[1] = v13;
        v64[0] = v9;
        v64[1] = v11;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v64;
        v16 = v63;
        v17 = 2;
      }
      else
      {
        v65 = *MEMORY[0x1E0CB2D50];
        v66[0] = v9;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v66;
        v16 = &v65;
        v17 = 1;
      }
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v41);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_27:
    a4 = 0;
    return a4;
  }
  if (v49 != 0xE000000000000001)
  {
    ATLLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v49;
      _os_log_impl(&dword_1C3511000, v30, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx", buf, 0xCu);
    }

    v31 = objc_alloc(MEMORY[0x1E0CB3940]);
    v48 = v49;
    v32 = objc_msgSend(v31, "initWithFormat:", CFSTR("Unexpected tag 0x%llx"));
    v33 = (void *)v32;
    if (a4)
    {
      v34 = *a4;
      v35 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v36 = *MEMORY[0x1E0CB3388];
        v59[0] = *MEMORY[0x1E0CB2D50];
        v59[1] = v36;
        v60[0] = v32;
        v60[1] = v34;
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = v60;
        v39 = v59;
        v40 = 2;
      }
      else
      {
        v61 = *MEMORY[0x1E0CB2D50];
        v62 = v32;
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = &v62;
        v39 = &v61;
        v40 = 1;
      }
      objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v43);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[DreamworksDecoder DecodeEndE1TLV:error:]", 420, (uint64_t)a3->var0, a3->var1, CFSTR("E1 TLV data"), v44, v45, v48);
    goto LABEL_27;
  }
  *(_OWORD *)buf = 0u;
  v58 = (DERItem)0;
  v18 = DERParseSequenceSpec((uint64_t)v50, (uint64_t)&DreamworksEndEventE1ContentSpec, (char *)buf, 0x20uLL);
  if ((_DWORD)v18)
  {
    v19 = v18;
    ATLLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v55 = 67109120;
      v56 = v19;
      _os_log_impl(&dword_1C3511000, v20, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v55, 8u);
    }

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode E1 contents %d"), v19);
    v22 = (void *)v21;
    if (a4)
    {
      v23 = *a4;
      v24 = (void *)MEMORY[0x1E0CB35C8];
      if (*a4)
      {
        v25 = *MEMORY[0x1E0CB3388];
        v51[0] = *MEMORY[0x1E0CB2D50];
        v51[1] = v25;
        v52[0] = v21;
        v52[1] = v23;
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = v52;
        v28 = v51;
        v29 = 2;
      }
      else
      {
        v53 = *MEMORY[0x1E0CB2D50];
        v54 = v21;
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v54;
        v28 = &v53;
        v29 = 1;
      }
      objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, v29);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v47);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  a4 = (id *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)&buf[8])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ReadS32BE((const DERItem *)buf));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v42, CFSTR("ReadOperationInfo"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ReadS32BE(&v58));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v22, CFSTR("WriteOperationInfo"));
LABEL_31:

  }
  return a4;
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Dreamworks decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Dreamworks decoder doesn't expect processEndOfTransaction"));
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

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SelectByNameCmd(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transceiveAndCheckSW:error:", v13, a9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithIntBE:", 2163278080);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithIntBE:", 12582912);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transceiveAndGetAllData:withGetMoreData:withMoreDataSW:withError:", v15, v16, 24832, a9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return -[DreamworksDecoder getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:](self, "getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:", a3, a4, a5, 0, 0, a6, a7);
}

- (id)resolveTransitModality:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  +[AppletConfigurationData getDreamworksSettings](AppletConfigurationData, "getDreamworksSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dreamworksMetroTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("TransitMetro");
  }
  else
  {
    +[AppletConfigurationData getDreamworksSettings](AppletConfigurationData, "getDreamworksSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dreamworksBusTypeRanges"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      v8 = CFSTR("TransitBus");
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0, (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "unsignedIntValue") <= v3)
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntValue");

            if (v19 >= v3)
              goto LABEL_14;
          }
          else
          {

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }
    v8 = CFSTR("Transit");
LABEL_14:

  }
  return (id)v8;
}

- (void)cleanup
{
  NSObject *v3;
  uint8_t v4[16];

  ATLLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C3511000, v3, OS_LOG_TYPE_INFO, "cleanup", v4, 2u);
  }

  self->decoderState = 0;
}

@end
