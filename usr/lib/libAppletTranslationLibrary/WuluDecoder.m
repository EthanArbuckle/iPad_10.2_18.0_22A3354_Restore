@implementation WuluDecoder

+ (id)getInstance
{
  if (getInstance_onceToken != -1)
    dispatch_once(&getInstance_onceToken, &__block_literal_global_0);
  return (id)getInstance_inst;
}

void __26__WuluDecoder_getInstance__block_invoke()
{
  WuluDecoder *v0;
  void *v1;

  v0 = objc_alloc_init(WuluDecoder);
  v1 = (void *)getInstance_inst;
  getInstance_inst = (uint64_t)v0;

}

- (WuluDecoder)init
{
  WuluDecoder *v2;
  WuluDecoder *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WuluDecoder;
  v2 = -[WuluDecoder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->decoderState = 0;
    if ((+[AppletTranslator isInternalBuild]() & 1) != 0)
    {
      +[AppletTranslator userDefaults]();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3->debug = objc_msgSend(v4, "BOOLForKey:", CFSTR("debug.wulu"));

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
  v9[1] = &unk_1E7D9A8D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v11 = a3;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SelectByNameCmd(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transceiveAndCheckSW:error:", v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[WuluReaderContext readAllFiles:appletPID:debug:error:](WuluReaderContext, "readAllFiles:appletPID:debug:error:", v11, v12, self->debug, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[WuluDecoder getAppletStateAndHistory:withError:](self, "getAppletStateAndHistory:withError:", v16, a7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TransactionHistory"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[WuluDecoder setTimer:history:](self, "setTimer:history:", v11, v19);

      }
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)getAppletStateAndHistory:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WuluDecoder getState:](self, "getState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WuluDecoder getHistory:state:error:](self, "getHistory:state:error:", v6, v7, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[WuluDecoder adjustHistory:](self, "adjustHistory:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WuluDecoder adjustState:history:ctx:](self, "adjustState:history:ctx:", v7, v10, v6);
    v13[0] = CFSTR("State");
    v13[1] = CFSTR("TransactionHistory");
    v14[0] = v7;
    v14[1] = v10;
    v13[2] = CFSTR("ATLInternal");
    v14[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)getState:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  _QWORD v42[9];
  _QWORD v43[11];

  v43[9] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(v3, "file15");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = DecodeBCD((char *)objc_msgSend(v5, "bytes"), 24, 2);
  objc_msgSend(v3, "file15");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = DecodeBCD((char *)objc_msgSend(v7, "bytes"), 26, 1);
  objc_msgSend(v3, "file15");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "dateWithYear:month:day:", v6, v8, DecodeBCD((char *)objc_msgSend(v9, "bytes"), 27, 1));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "file17");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(objc_msgSend(v11, "bytes") + 6)) >> 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "file15");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subdataWithRange:", 10, 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "file1A");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstWhere:", &__block_literal_global_361);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "data");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (*(_BYTE *)(objc_msgSend(v18, "bytes") + 14) == 1)
    {

LABEL_5:
      objc_msgSend(v15, "addObject:", CFSTR("TransitMetro"));
      goto LABEL_6;
    }
    objc_msgSend(v17, "data");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = *(unsigned __int8 *)(objc_msgSend(v19, "bytes") + 14);

    if (v20 == 3)
      goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v3, "file1A");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstWhere:", &__block_literal_global_362);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22
    && (objc_msgSend(v22, "data"),
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
        v24 = *(unsigned __int8 *)(objc_msgSend(v23, "bytes") + 14),
        v23,
        v24 == 1))
  {
    objc_msgSend(v15, "addObject:", CFSTR("TransitBus"));
  }
  else
  {
    objc_msgSend(v3, "file1E");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstWhere:", &__block_literal_global_363);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v26, "data");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (*(_BYTE *)objc_msgSend(v27, "bytes") == 3)
      {
        objc_msgSend(v26, "data");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "u8:", 9);

        if (v29 == 2)
          objc_msgSend(v15, "addObject:", CFSTR("TransitBus"));
      }
      else
      {

      }
    }

  }
  objc_msgSend(v3, "file1A");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstWhere:", &__block_literal_global_364);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v31, "data");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = *(unsigned __int8 *)(objc_msgSend(v32, "bytes") + 14);

    if (v33 == 1)
      objc_msgSend(v15, "addObject:", CFSTR("TransitTrain"));
  }
  objc_msgSend(v3, "overdraft");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "unsignedIntValue");

  v36 = (void *)MEMORY[0x1E0CB3598];
  if (v35)
    objc_msgSend(v3, "overdraft");
  else
    objc_msgSend(v3, "balance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "decimalNumberWithMantissa:exponent:isNegative:", objc_msgSend(v37, "unsignedIntegerValue"), 4294967294, v35 != 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = CFSTR("Balance");
  v42[1] = CFSTR("SP");
  v43[0] = v38;
  v43[1] = CFSTR("UNKNOWN");
  v42[2] = CFSTR("SPRaw");
  v42[3] = CFSTR("CardExpirationDate");
  v43[2] = v12;
  v43[3] = v41;
  v42[4] = CFSTR("CardIdentifier");
  v42[5] = CFSTR("CardCurrency");
  v43[4] = v14;
  v43[5] = CFSTR("CNY");
  v42[6] = CFSTR("CardCurrencyCode");
  v42[7] = CFSTR("CardCurrencyExponent");
  v43[6] = &unk_1E7D9A8F0;
  v43[7] = &unk_1E7D9A908;
  v42[8] = CFSTR("TransactionInProgress");
  v43[8] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

BOOL __24__WuluDecoder_getState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "number") == 1;
}

BOOL __24__WuluDecoder_getState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "number") == 2;
}

BOOL __24__WuluDecoder_getState___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "number") == 1;
}

BOOL __24__WuluDecoder_getState___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "number") == 14;
}

- (id)getHistory:(id)a3 state:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  __int128 v33;
  id v34;
  WuluDecoder *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  _QWORD v41[4];
  __int16 v42;
  _QWORD v43[4];
  __int16 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  unsigned int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "file18");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v7;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v7, "file18");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v12)
  {
    v14 = v12;
    v40 = *(_QWORD *)v46;
    *(_QWORD *)&v13 = 67109120;
    v33 = v13;
    v36 = v10;
    v37 = v7;
    v35 = self;
    do
    {
      v15 = 0;
      v38 = v14;
      do
      {
        if (*(_QWORD *)v46 != v40)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
        objc_msgSend(v16, "data", v33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WuluDecoder parseFile18:](self, "parseFile18:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "unsignedIntegerValue") == 2)
          {
            objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("TopUp"), CFSTR("TypeDetail"));
          }
          else
          {
            objc_msgSend(v16, "data");
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v21 = bswap32(*(unsigned __int16 *)objc_msgSend(v20, "bytes")) >> 16;

            objc_msgSend(v11, "file1E");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = MEMORY[0x1E0C809B0];
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __38__WuluDecoder_getHistory_state_error___block_invoke;
            v43[3] = &__block_descriptor_34_e20_B16__0__WuluRecord_8l;
            v44 = v21;
            objc_msgSend(v22, "firstWhere:", v43);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "file1A");
            v25 = v11;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = v23;
            v41[1] = 3221225472;
            v41[2] = __38__WuluDecoder_getHistory_state_error___block_invoke_2;
            v41[3] = &__block_descriptor_34_e20_B16__0__WuluRecord_8l;
            v42 = v21;
            objc_msgSend(v26, "firstWhere:", v41);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v28 = v25;
              self = v35;
              -[WuluDecoder parseTransit:file1E:file1A:ctx:state:into:](v35, "parseTransit:file1E:file1A:ctx:state:into:", v16, v24, v27, v28, v34, v18);
            }
            else
            {
              ATLLogObject();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_DEBUG, "No matching 0x1E entry found, parsing as basic", buf, 2u);
              }

              self = v35;
            }
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v38;
            if (!v30)
            {
              ATLLogObject();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v33;
                v50 = v21;
                _os_log_impl(&dword_1C3511000, v31, OS_LOG_TYPE_DEFAULT, "Transit details were incomplete for SN 0x%x", buf, 8u);
              }

              objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("Purchase"), CFSTR("TypeDetail"));
            }

            v10 = v36;
            v11 = v37;
          }
          objc_msgSend(v10, "addObject:", v18);

        }
        ++v15;
      }
      while (v14 != v15);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v14);
  }

  return v10;
}

BOOL __38__WuluDecoder_getHistory_state_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "associatedSerialNumber") == *(unsigned __int16 *)(a1 + 32);
}

BOOL __38__WuluDecoder_getHistory_state_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "associatedSerialNumber") == *(unsigned __int16 *)(a1 + 32);
}

- (id)parseFile18:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  unsigned int v24;
  uint64_t v25;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  unsigned __int16 *v32;
  void *v33;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D78];
  v8 = objc_retainAutorelease(v5);
  v9 = DecodeBCD((const unsigned __int8 *)(objc_msgSend(v8, "bytes") + 16), 2);
  v10 = objc_retainAutorelease(v8);
  v11 = DecodeBCD((const unsigned __int8 *)(objc_msgSend(v10, "bytes") + 18), 1);
  v12 = objc_retainAutorelease(v10);
  v13 = DecodeBCD((const unsigned __int8 *)(objc_msgSend(v12, "bytes") + 19), 1);
  v14 = objc_retainAutorelease(v12);
  v15 = DecodeBCD((const unsigned __int8 *)(objc_msgSend(v14, "bytes") + 20), 1);
  v16 = objc_retainAutorelease(v14);
  v17 = DecodeBCD((const unsigned __int8 *)(objc_msgSend(v16, "bytes") + 21), 1);
  v18 = objc_retainAutorelease(v16);
  objc_msgSend(v7, "dateWithYear:month:day:hour:minute:second:", v9, v11, v13, v15, v17, DecodeBCD((const unsigned __int8 *)(objc_msgSend(v18, "bytes") + 22), 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("TransactionTime"));

  v20 = objc_retainAutorelease(v18);
  v21 = *(unsigned __int8 *)(objc_msgSend(v20, "bytes") + 9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("TypeDetailRaw"));

  v23 = objc_retainAutorelease(v20);
  v24 = *(_DWORD *)(objc_msgSend(v23, "bytes") + 5);
  v25 = bswap32(v24);
  v27 = (_DWORD)v21 == 2 && v24 != 0;
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v25, 4294967294, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("Amount"));

  objc_msgSend(v23, "subdataWithRange:", 10, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("TerminalIdentifier"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_retainAutorelease(v23);
  v32 = (unsigned __int16 *)objc_msgSend(v31, "bytes");

  objc_msgSend(v30, "numberWithUnsignedInt:", -[WuluDecoder convertAppletSNtoWalletSN:txnTypeIdentifier:](self, "convertAppletSNtoWalletSN:txnTypeIdentifier:", bswap32(*v32) >> 16, v21));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("SerialNumber"));

  return v6;
}

- (void)parseTransit:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  os_log_type_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v14 = a4;
  v15 = a5;
  v44 = a6;
  v43 = a7;
  v16 = a8;
  objc_msgSend(v14, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subdataWithOffset:length:", 32, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v18, "u16BE:", 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("CityCode"));

  objc_msgSend(v14, "data");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = bswap32(*(_DWORD *)(objc_msgSend(v20, "bytes") + 21));

  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v21, 4294967294, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("FinalBalance"));

  objc_msgSend(v14, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "u8:", 9);

  -[WuluDecoder resolveTransitModality:](self, "resolveTransitModality:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("TypeDetail"));

  objc_msgSend(v14, "data");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = *(unsigned __int8 *)objc_msgSend(v26, "bytes");

  if (v27 == 3)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithInt:", objc_msgSend(v29, "intValue") | (v27 << 8));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("TypeDetailRaw"));

  +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("cityRules"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "asHexString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = objc_msgSend(v34, "unsignedIntValue");
    switch(v35)
    {
      case 1:
        v36 = v45;
        -[WuluDecoder parseTransitKepler:file1E:file1A:into:](self, "parseTransitKepler:file1E:file1A:into:", v45, v14, v15, v16);
        goto LABEL_10;
      case 2:
        v36 = v45;
        -[WuluDecoder parseTransitApollo:file1E:file1A:into:](self, "parseTransitApollo:file1E:file1A:into:", v45, v14, v15, v16);
        goto LABEL_10;
      case 3:
        v36 = v45;
        -[WuluDecoder parseTransitPioneer:file1E:file1A:into:](self, "parseTransitPioneer:file1E:file1A:into:", v45, v14, v15, v16);
        goto LABEL_10;
      case 4:
        v37 = v44;
        v36 = v45;
        v42 = v43;
        -[WuluDecoder parseTransitGalileo:file1E:file1A:ctx:state:into:](self, "parseTransitGalileo:file1E:file1A:ctx:state:into:", v45, v14, v15, v44, v43, v16);
        goto LABEL_12;
      case 5:
      case 7:
        v37 = v44;
        v36 = v45;
        -[WuluDecoder parseTransitSettingBased:file1E:file1A:ctx:into:](self, "parseTransitSettingBased:file1E:file1A:ctx:into:", v45, v14, v15, v44, v16);
        goto LABEL_11;
      case 6:
        v36 = v45;
        -[WuluDecoder parseTransitNoLocal:file1E:file1A:into:](self, "parseTransitNoLocal:file1E:file1A:into:", v45, v14, v15, v16);
        goto LABEL_10;
      default:
        if (v35 == 99)
        {
          v37 = v44;
          v36 = v45;
          v42 = v43;
          -[WuluDecoder parseUnreliable1ECities:file1E:file1A:ctx:state:into:](self, "parseUnreliable1ECities:file1E:file1A:ctx:state:into:", v45, v14, v15, v44, v43, v16);
          goto LABEL_12;
        }
        ATLLogObject();
        v38 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          goto LABEL_9;
        *(_DWORD *)buf = 138412290;
        v47 = v34;
        v39 = "Configuration gave us unknown rule type %@";
        v40 = v38;
        v41 = OS_LOG_TYPE_ERROR;
        break;
    }
  }
  else
  {
    ATLLogObject();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v47 = v18;
    v39 = "Configuration does not define city rules for city code %@";
    v40 = v38;
    v41 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1C3511000, v40, v41, v39, buf, 0xCu);
LABEL_9:

  v36 = v45;
LABEL_10:
  v37 = v44;
LABEL_11:
  v42 = v43;
LABEL_12:

}

- (void)parseTransitApollo:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  id v21;
  int v22;
  _BOOL4 v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v8, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "u8:", 9);

  objc_msgSend(v8, "data");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = *(unsigned __int8 *)objc_msgSend(v13, "bytes");

  if (v12 == 2)
  {
    objc_msgSend(v8, "data");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 10;
    v18 = 2;
LABEL_3:
    -[NSObject subdataWithOffset:length:](v15, "subdataWithOffset:length:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("StartStation");
LABEL_4:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v20);

LABEL_5:
    goto LABEL_6;
  }
  if (v9 && v12 == 1)
  {
    if (objc_msgSend(v9, "number") == 1)
    {
      objc_msgSend(v9, "data");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = *(unsigned __int8 *)(objc_msgSend(v21, "bytes") + 14);

      v24 = v14 == 8 && v22 == 2;
      if (v14 == 6 && v22 == 1)
      {
        objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
LABEL_23:
        objc_msgSend(v9, "data");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = 38;
        v18 = 5;
        goto LABEL_3;
      }
      if (v14 == 3)
        goto LABEL_23;
      if (v14 == 4)
        v24 = 1;
      if (v24)
      {
        objc_msgSend(v9, "data");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "subdataWithOffset:length:", 38, 5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("StartStation"));

        objc_msgSend(v9, "data");
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject subdataWithOffset:length:](v16, "subdataWithOffset:length:", 46, 5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("EndStation");
        goto LABEL_4;
      }
      if (v14 == 8)
      {
        objc_msgSend(v9, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "u8:", 99);

        if (v31)
        {
          objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("TransitMetroUpgrade"), CFSTR("TypeDetail"));
          objc_msgSend(v10, "removeObjectForKey:", CFSTR("IgnoreReason"));
        }
        goto LABEL_6;
      }
      ATLLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      v32 = 67109632;
      v33 = objc_msgSend(v9, "associatedSerialNumber");
      v34 = 1024;
      v35 = v14;
      v36 = 1024;
      v37 = 1;
      v25 = "SN 0x%x with type %d but modality %d";
      v26 = v16;
      v27 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      ATLLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v32 = 67109632;
      v33 = objc_msgSend(v9, "associatedSerialNumber");
      v34 = 1024;
      v35 = 1;
      v36 = 1024;
      v37 = objc_msgSend(v9, "number");
      v25 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      v26 = v16;
      v27 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1C3511000, v26, v27, v25, (uint8_t *)&v32, 0x14u);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)parseTransitKepler:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  int v17;
  _BOOL4 v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  v10 = a4;
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "u8:", 9);

  objc_msgSend(v10, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = *(unsigned __int8 *)objc_msgSend(v14, "bytes");

  if (v8 && v12 == 1)
  {
    if (objc_msgSend(v8, "number") == 1)
    {
      objc_msgSend(v8, "data");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = *(unsigned __int8 *)(objc_msgSend(v16, "bytes") + 14);

      v18 = v15 == 8;
      if (v17 != 4)
        v18 = 0;
      if (v15 == 8 && v17 == 3)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
LABEL_14:
        objc_msgSend(v8, "data");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "subdataWithOffset:length:", 85, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "mutableCopy");

        objc_msgSend(v8, "data");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "subdataWithOffset:length:", 35, 8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendData:", v27);

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("StartStation"));
        goto LABEL_15;
      }
      if (v15 == 3)
        goto LABEL_14;
      if (v15 == 4)
        v18 = 1;
      if (v18)
      {
        objc_msgSend(v8, "data");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "subdataWithOffset:length:", 85, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

        objc_msgSend(v8, "data");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "subdataWithOffset:length:", 35, 8);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "appendData:", v32);

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("StartStation"));
        objc_msgSend(v8, "data");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "subdataWithOffset:length:", 86, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "mutableCopy");

        objc_msgSend(v8, "data");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "subdataWithOffset:length:", 43, 8);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "appendData:", v37);

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, CFSTR("EndStation"));
        goto LABEL_15;
      }
      ATLLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v38 = 67109632;
      v39 = objc_msgSend(v8, "associatedSerialNumber");
      v40 = 1024;
      v41 = v15;
      v42 = 1024;
      v43 = 1;
      v20 = "SN 0x%x with type %d but modality %d";
      v21 = v19;
      v22 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      ATLLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_15;
      }
      v38 = 67109632;
      v39 = objc_msgSend(v8, "associatedSerialNumber");
      v40 = 1024;
      v41 = 1;
      v42 = 1024;
      v43 = objc_msgSend(v8, "number");
      v20 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      v21 = v19;
      v22 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1C3511000, v21, v22, v20, (uint8_t *)&v38, 0x14u);
    goto LABEL_12;
  }
LABEL_15:

}

- (void)parseTransitPioneer:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  v10 = a4;
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "u8:", 9);

  objc_msgSend(v10, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = *(unsigned __int8 *)objc_msgSend(v14, "bytes");

  if (!v8 || v12 != 14 && v12 != 1)
    goto LABEL_25;
  if (objc_msgSend(v8, "number") != 1 && objc_msgSend(v8, "number") != 14)
  {
    ATLLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v39 = 67109632;
      v40 = objc_msgSend(v8, "associatedSerialNumber");
      v41 = 1024;
      v42 = v12;
      v43 = 1024;
      v44 = objc_msgSend(v8, "number");
      v26 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      v27 = v25;
      v28 = OS_LOG_TYPE_ERROR;
LABEL_23:
      _os_log_impl(&dword_1C3511000, v27, v28, v26, (uint8_t *)&v39, 0x14u);
    }
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v8, "data");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = *(unsigned __int8 *)(objc_msgSend(v16, "bytes") + 14);

  v18 = v15 == 8;
  if (v17 != 4)
    v18 = 0;
  if (v15 != 8 || v17 != 3)
  {
    if (v15 == 3)
      goto LABEL_12;
    if (v15 == 4)
      v18 = 1;
    if (v18)
    {
      objc_msgSend(v8, "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "subdataWithOffset:length:", 85, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");

      objc_msgSend(v8, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "subdataWithOffset:length:", 35, 8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "appendData:", v33);

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("StartStation"));
      objc_msgSend(v8, "data");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "subdataWithOffset:length:", 86, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "mutableCopy");

      objc_msgSend(v8, "data");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "subdataWithOffset:length:", 43, 8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "appendData:", v38);

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("EndStation"));
      goto LABEL_25;
    }
    ATLLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 67109632;
      v40 = objc_msgSend(v8, "associatedSerialNumber");
      v41 = 1024;
      v42 = v15;
      v43 = 1024;
      v44 = v12;
      v26 = "SN 0x%x with type %d but modality %d";
      v27 = v25;
      v28 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
LABEL_12:
  objc_msgSend(v8, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subdataWithOffset:length:", 85, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v8, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "subdataWithOffset:length:", 35, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendData:", v23);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("StartStation"));
  objc_msgSend(v8, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v24, "u8:", 100);

  if ((_DWORD)v23 == 11)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("TransitMetroUpgrade"), CFSTR("TypeDetail"));
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("IgnoreReason"));
  }

LABEL_25:
}

- (void)parseTransitGalileo:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  int v24;
  NSObject *v25;
  char v26;
  id v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  const __CFString *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  int v48;
  const char *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint32_t v52;
  int v53;
  const __CFString *v54;
  id v55;
  _BOOL4 v56;
  _BOOL4 v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  int v76;
  _BOOL4 v77;
  NSObject *v78;
  int v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  int v95;
  int v96;
  void *v97;
  _QWORD v98[4];
  NSObject *v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  __int16 v103;
  uint8_t buf[4];
  _BYTE v105[10];
  __int16 v106;
  int v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a4;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SPRaw"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "u8:", 9);

  objc_msgSend(v18, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_retainAutorelease(v22);
  v24 = *(unsigned __int8 *)objc_msgSend(v23, "bytes");

  if (v21 == 1)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CityCode"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v19, "isEqualToNumber:", v25);

    if ((v26 & 1) != 0)
    {
      if (objc_msgSend(v15, "localRecordFormat") == 1)
      {
        v94 = v13;
        objc_msgSend(v13, "data");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v28 = bswap32(*(unsigned __int16 *)objc_msgSend(v27, "bytes")) >> 16;

        objc_msgSend(v15, "localRecords");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = MEMORY[0x1E0C809B0];
        v102[0] = MEMORY[0x1E0C809B0];
        v102[1] = 3221225472;
        v102[2] = __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke;
        v102[3] = &__block_descriptor_34_e20_B16__0__WuluRecord_8l;
        v103 = v28;
        objc_msgSend(v29, "firstWhere:", v102);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "localRecords");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v100[0] = v30;
        v100[1] = 3221225472;
        v100[2] = __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_2;
        v100[3] = &unk_1E7D8A3D8;
        v33 = v31;
        v101 = v33;
        objc_msgSend(v32, "firstWhere:", v100);
        v34 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "localRecords");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v30;
        v98[1] = 3221225472;
        v98[2] = __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_3;
        v98[3] = &unk_1E7D8A3D8;
        v36 = v33;
        v99 = v36;
        objc_msgSend(v35, "firstWhere:", v98);
        v37 = objc_claimAutoreleasedReturnValue();

        if (!v36 || !(v34 | v37))
        {
          ATLLogObject();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3511000, v38, OS_LOG_TYPE_ERROR, "Missing mandatory records.", buf, 2u);
          }

          v13 = v94;
          goto LABEL_70;
        }
        v53 = -[NSObject sfi](v36, "sfi");
        v90 = v37;
        if (v53 == 20)
        {
          objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("TransitTrain"), CFSTR("TypeDetail"));
          v13 = v94;
        }
        else
        {
          v13 = v94;
          if (v53 == 19)
          {
            v54 = CFSTR("TransitTrainMaglev");
          }
          else
          {
            if (v53 != 17)
            {
              ATLLogObject();
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                v79 = -[NSObject sfi](v36, "sfi");
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v105 = v79;
                _os_log_impl(&dword_1C3511000, v78, OS_LOG_TYPE_ERROR, "Metro in 1E but local SFI %d not in the list.", buf, 8u);
              }

              goto LABEL_62;
            }
            v54 = CFSTR("TransitMetro");
          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v54, CFSTR("TypeDetail"), v37);
        }
LABEL_62:
        v97 = (void *)v34;
        objc_msgSend((id)v34, "data", v90);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "subdataWithOffset:length:", 6, 2);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "copy");

        v93 = (void *)v82;
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v82, CFSTR("StartStation"));
        v83 = (void *)MEMORY[0x1E0CB37E8];
        -[NSObject data](v36, "data");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "numberWithUnsignedChar:", objc_msgSend(v84, "u8:", 0));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v82) = objc_msgSend(&unk_1E7D9CD98, "containsObject:", v85);

        if ((_DWORD)v82)
        {
          objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
          v86 = v91;
          v87 = v93;
        }
        else
        {
          objc_msgSend(v91, "data");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "subdataWithOffset:length:", 6, 2);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = (void *)objc_msgSend(v89, "copy");

          v86 = v91;
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v87, CFSTR("EndStation"));
        }

        goto LABEL_70;
      }
      ATLLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v49 = "Galileo Metro: The local file format is not extended format with associated SN.";
        v50 = v36;
        v51 = OS_LOG_TYPE_ERROR;
        v52 = 2;
LABEL_30:
        _os_log_impl(&dword_1C3511000, v50, v51, v49, buf, v52);
        goto LABEL_70;
      }
      goto LABEL_70;
    }
    if (!v14)
    {
      ATLLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v105 = objc_msgSend(v13, "number");
        v49 = "No 1A associated with this metro transaction, an old transaction, pass. %d";
        v50 = v36;
        v51 = OS_LOG_TYPE_DEFAULT;
        v52 = 8;
        goto LABEL_30;
      }
LABEL_70:

      goto LABEL_71;
    }
    v39 = objc_msgSend(v14, "number");
    if (v39 != 1)
    {
      if (v39 != 2)
      {
        ATLLogObject();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v105 = objc_msgSend(v14, "associatedSerialNumber");
          *(_WORD *)&v105[4] = 1024;
          *(_DWORD *)&v105[6] = 1;
          v106 = 1024;
          v107 = objc_msgSend(v14, "number");
          v49 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
          v50 = v36;
          v51 = OS_LOG_TYPE_ERROR;
          v52 = 20;
          goto LABEL_30;
        }
        goto LABEL_70;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "removeObject:", CFSTR("TransitBus"));

      objc_msgSend(v14, "data");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "subdataWithOffset:length:", 26, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "u8:", 0);

      v44 = CFSTR("TransitMetro");
      if (v43 == 34)
        v44 = CFSTR("TransitTrain");
      if (v43 == 144)
        v45 = CFSTR("TransitTrainMaglev");
      else
        v45 = v44;
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v45, CFSTR("TypeDetail"));
      ATLLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "data");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "subdataWithOffset:length:", 26, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v105 = v47;
        _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_DEFAULT, "1A-02 associated with this metro transaction, special type. %@", buf, 0xCu);

      }
    }
    if (v24 == 8 || v24 == 3)
    {
      objc_msgSend(v14, "data");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (*(_BYTE *)(-[NSObject bytes](v25, "bytes") + 14) == 1)
      {
        v48 = 1;
      }
      else
      {
        objc_msgSend(v14, "data");
        v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v56 = *(unsigned __int8 *)(objc_msgSend(v55, "bytes") + 14) == 3;

        v48 = v56;
      }
    }
    else
    {
      v48 = 0;
    }
    switch(v24)
    {
      case 8:
        goto LABEL_40;
      case 4:
        goto LABEL_41;
      case 3:
LABEL_40:

        if (v24 == 8)
        {
LABEL_41:
          objc_msgSend(v14, "data");
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          if (*(_BYTE *)(-[NSObject bytes](v25, "bytes") + 14) == 2)
          {
            v57 = 1;
          }
          else
          {
            objc_msgSend(v14, "data");
            v95 = v48;
            v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v57 = *(unsigned __int8 *)(objc_msgSend(v58, "bytes") + 14) == 4;

            v48 = v95;
          }
          goto LABEL_45;
        }
        break;
    }
    v57 = 0;
LABEL_45:
    if (v24 == 8 || v24 == 4)

    if (v48)
    {
      objc_msgSend(v14, "data");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "subdataWithOffset:length:", 26, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v60, "mutableCopy");

      objc_msgSend(v14, "data");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "subdataWithOffset:length:", 42, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject appendData:](v36, "appendData:", v62);

      objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("StartStation"));
      v63 = CFSTR("EnRoute");
      v64 = CFSTR("IgnoreReason");
      v65 = v17;
    }
    else
    {
      if (!v57)
      {
        ATLLogObject();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v96 = objc_msgSend(v14, "associatedSerialNumber");
          objc_msgSend(v14, "data");
          v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v76 = *(unsigned __int8 *)(objc_msgSend(v75, "bytes") + 14);
          if (v76 == 1)
          {
            v77 = 1;
          }
          else
          {
            objc_msgSend(v14, "data");
            v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v77 = *(unsigned __int8 *)(objc_msgSend(v92, "bytes") + 14) == 3;
          }
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v105 = v96;
          *(_WORD *)&v105[4] = 1024;
          *(_DWORD *)&v105[6] = v24;
          v106 = 1024;
          v107 = v77;
          _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_ERROR, "Galileo Metro: SN 0x%x with type %d, 1A entry type %d", buf, 0x14u);
          if (v76 != 1)

        }
        goto LABEL_70;
      }
      objc_msgSend(v14, "data");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "subdataWithOffset:length:", 26, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)objc_msgSend(v67, "mutableCopy");

      objc_msgSend(v14, "data");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "subdataWithOffset:length:", 42, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "appendData:", v70);

      objc_msgSend(v17, "setObject:forKeyedSubscript:", v68, CFSTR("StartStation"));
      objc_msgSend(v14, "data");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "subdataWithOffset:length:", 34, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v72, "mutableCopy");

      objc_msgSend(v14, "data");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "subdataWithOffset:length:", 50, 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject appendData:](v36, "appendData:", v74);

      v64 = CFSTR("EndStation");
      v65 = v17;
      v63 = (const __CFString *)v36;
    }
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v63, v64);
    goto LABEL_70;
  }
LABEL_71:

}

BOOL __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(v3, "associatedSerialNumber") == *(unsigned __int16 *)(a1 + 32))
    v4 = objc_msgSend(v3, "number") == 3 || objc_msgSend(v3, "number") == 6;
  else
    v4 = 0;

  return v4;
}

BOOL __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "number") == 1 || objc_msgSend(v3, "number") == 4)
  {
    v4 = objc_msgSend(v3, "sfi");
    v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "sfi");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "number") == 2 || objc_msgSend(v3, "number") == 5)
  {
    v4 = objc_msgSend(v3, "sfi");
    v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "sfi");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)parseTransitSettingBased:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 into:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  id v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint32_t v51;
  void *v52;
  id v53;
  int v54;
  NSObject *v55;
  void *v56;
  int v57;
  id v58;
  id v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  WuluDecoder *v83;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  _BOOL4 v88;
  void *v89;
  WuluDecoder *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  uint8_t buf[4];
  _BYTE v101[10];
  __int16 v102;
  int v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v13, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "u8:", 9);

  objc_msgSend(v13, "data");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = *(unsigned __int8 *)objc_msgSend(v19, "bytes");

  if (v18 == 1)
  {
    if (v14)
    {
      if (objc_msgSend(v14, "number") == 1)
      {
        v94 = v16;
        v97 = v12;
        objc_msgSend(v13, "data");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "subdataWithOffset:length:", 32, 2);
        v22 = objc_claimAutoreleasedReturnValue();

        +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("defaultLogSettings"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject asHexString](v22, "asHexString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x1E0C99D50];
        v96 = v26;
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("metroEntryStationCode"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dataWithHexString:", v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v90 = self;
        v92 = (void *)v29;
        -[WuluDecoder getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:](self, "getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:", v14, v29, CFSTR("00"), CFSTR("00"), v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "data");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (*(_BYTE *)(objc_msgSend(v31, "bytes") + 14) == 1)
        {

          v16 = v94;
LABEL_20:
          v46 = v30;
          if (v30)
          {
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("StartStation"));
            v12 = v97;
          }
          else
          {
            ATLLogObject();
            v55 = objc_claimAutoreleasedReturnValue();
            v12 = v97;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3511000, v55, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
            }

          }
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Amount"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "intValue");

          if (!v57)
            objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
          v43 = v92;
          goto LABEL_64;
        }
        objc_msgSend(v14, "data");
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v54 = *(unsigned __int8 *)(objc_msgSend(v53, "bytes") + 14);

        v16 = v94;
        if (v54 == 3)
          goto LABEL_20;
        objc_msgSend(v14, "data");
        v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (*(_BYTE *)(objc_msgSend(v58, "bytes") + 14) == 2)
        {

        }
        else
        {
          objc_msgSend(v14, "data");
          v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v60 = *(unsigned __int8 *)(objc_msgSend(v59, "bytes") + 14);

          if (v60 != 4)
          {
            ATLLogObject();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v101 = objc_msgSend(v14, "associatedSerialNumber");
              *(_WORD *)&v101[4] = 1024;
              *(_DWORD *)&v101[6] = v20;
              v102 = 1024;
              v103 = 1;
              _os_log_impl(&dword_1C3511000, v76, OS_LOG_TYPE_DEFAULT, "SN 0x%x with type %d but modality %d", buf, 0x14u);
            }

            v43 = v92;
            v12 = v97;
            v46 = v30;
            goto LABEL_64;
          }
        }
        if (v30)
        {
          objc_msgSend(v94, "setObject:forKeyedSubscript:", v30, CFSTR("StartStation"));
        }
        else
        {
          ATLLogObject();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3511000, v72, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
          }

        }
        v12 = v97;
        v73 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("metroExitStationCode"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "dataWithHexString:", v74);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[WuluDecoder getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:](v90, "getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:", v14, v43, CFSTR("00"), CFSTR("00"), v22);
        v46 = (id)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v94, "setObject:forKeyedSubscript:", v46, CFSTR("EndStation"));
        }
        else
        {
          ATLLogObject();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3511000, v75, OS_LOG_TYPE_ERROR, "Failed to get end station code", buf, 2u);
          }

          v46 = 0;
        }
LABEL_64:

        goto LABEL_65;
      }
      ATLLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_65:

        goto LABEL_66;
      }
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v101 = objc_msgSend(v14, "associatedSerialNumber");
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = 1;
      v102 = 1024;
      v103 = objc_msgSend(v14, "number");
      v48 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      v49 = v22;
      v50 = OS_LOG_TYPE_ERROR;
      v51 = 20;
LABEL_16:
      _os_log_impl(&dword_1C3511000, v49, v50, v48, buf, v51);
      goto LABEL_65;
    }
    objc_msgSend(v15, "localRecords");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33 != 3)
    {
      ATLLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "localRecords");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v101 = objc_msgSend(v52, "count");
        _os_log_impl(&dword_1C3511000, v22, OS_LOG_TYPE_DEFAULT, "Only %lu records retrived, expecting 3.", buf, 0xCu);

      }
      goto LABEL_65;
    }
    objc_msgSend(v15, "localRecords");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v22 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      ATLLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_65;
      *(_WORD *)buf = 0;
      v48 = "No local log retrived.";
      v49 = v22;
      v50 = OS_LOG_TYPE_DEFAULT;
      v51 = 2;
      goto LABEL_16;
    }
    if (objc_msgSend(v15, "localRecordFormat") == 1)
    {
      objc_msgSend(v12, "data");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v36 = bswap32(*(unsigned __int16 *)objc_msgSend(v35, "bytes"));

      if (-[NSObject associatedSerialNumber](v22, "associatedSerialNumber") != HIWORD(v36))
      {
        ATLLogObject();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3511000, v71, OS_LOG_TYPE_DEFAULT, "Local log is not updated in the latest transaction.", buf, 2u);
        }

        goto LABEL_65;
      }
    }
    v98 = v12;
    objc_msgSend(v15, "file17");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "subdataWithRange:", 6, 2);
    v95 = v15;
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("localLogSettings"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "asHexString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v42;
    v44 = v38;
    v15 = v95;

    v99 = 0;
    v96 = v44;
    v45 = -[WuluDecoder isMetroEntry:cityCode:setting:error:](self, "isMetroEntry:cityCode:setting:error:", v95, v44, v43, &v99);
    v46 = v99;
    if (v46)
    {
      ATLLogObject();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v101 = v96;
        _os_log_impl(&dword_1C3511000, v47, OS_LOG_TYPE_ERROR, "Entry information is not obtained correctly for city %@.", buf, 0xCu);
      }
      v12 = v98;
      goto LABEL_63;
    }
    v88 = v45;
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("stationCodeSwapByteOrdering"));
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("stationCodeConvertFormat"));
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)MEMORY[0x1E0C99D50];
    v89 = v43;
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("metroEntryStationCode"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "dataWithHexString:", v64);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v95, "localRecords");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectAtIndexedSubscript:", 1);
    v66 = objc_claimAutoreleasedReturnValue();

    if (!v66)
    {
      v91 = (void *)v62;
      v47 = v61;
      ATLLogObject();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v77, OS_LOG_TYPE_DEFAULT, "No local entry log retrived.", buf, 2u);
      }
      v66 = 0;
      v68 = v93;
      v12 = v98;
      v46 = 0;
      v78 = v77;
      v67 = v91;
      goto LABEL_62;
    }
    v87 = v61;
    -[WuluDecoder getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:](self, "getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:", v66, v93, v61, v62, v96);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:");
    v67 = (void *)v62;
    if (v88)
    {
      v68 = v93;
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Amount"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "intValue");

      if (!v70)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
    }
    else
    {
      v79 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("metroExitStationCode"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "dataWithHexString:", v80);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v95, "localRecords");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "objectAtIndexedSubscript:", 2);
      v82 = objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        v83 = self;
        v47 = v87;
        -[WuluDecoder getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:](v83, "getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:", v82, v68, v87, v67, v96);
        v84 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setObject:forKeyedSubscript:", v84, CFSTR("EndStation"));
        v78 = (void *)v84;
        v66 = v82;
        v12 = v98;
        v46 = 0;
LABEL_62:

        v22 = v66;
        v43 = v89;
LABEL_63:

        goto LABEL_64;
      }
      ATLLogObject();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v85, OS_LOG_TYPE_DEFAULT, "No local exit log retrived.", buf, 2u);
      }

      v66 = 0;
    }
    v12 = v98;
    v46 = 0;
    v78 = v86;
    v47 = v87;
    goto LABEL_62;
  }
LABEL_66:

}

- (void)parseTransitNoLocal:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  int v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  unint64_t v36;
  id v37;
  int v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  WuluDecoder *v47;
  void *v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "u8:", 9);

  objc_msgSend(v9, "data");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = *(unsigned __int8 *)objc_msgSend(v14, "bytes");

  if (v10 && v13 == 1)
  {
    if (objc_msgSend(v10, "number") != 1)
    {
      ATLLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        v50 = objc_msgSend(v10, "associatedSerialNumber");
        v51 = 1024;
        v52 = 1;
        v53 = 1024;
        v54 = objc_msgSend(v10, "number");
        _os_log_impl(&dword_1C3511000, v17, OS_LOG_TYPE_ERROR, "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d", buf, 0x14u);
      }
      goto LABEL_19;
    }
    objc_msgSend(v9, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subdataWithOffset:length:", 32, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("defaultLogSettings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject asHexString](v17, "asHexString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("metroEntryStationCode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dataWithHexString:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)v24;
    -[WuluDecoder getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:](self, "getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:", v10, v24, CFSTR("00"), CFSTR("00"), v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (*(_BYTE *)(objc_msgSend(v26, "bytes") + 14) == 1)
    {

    }
    else
    {
      v47 = self;
      objc_msgSend(v10, "data");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = v21;
      v29 = *(unsigned __int8 *)(objc_msgSend(v27, "bytes") + 14);

      v30 = v29 == 3;
      v21 = v28;
      if (!v30)
      {
        objc_msgSend(v10, "data");
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (*(_BYTE *)(objc_msgSend(v35, "bytes") + 14) == 2)
        {

          v36 = 0x1E0C99000;
        }
        else
        {
          objc_msgSend(v10, "data");
          v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v38 = *(unsigned __int8 *)(objc_msgSend(v37, "bytes") + 14);

          v30 = v38 == 4;
          v21 = v28;
          v36 = 0x1E0C99000uLL;
          if (!v30)
          {
            ATLLogObject();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              v50 = objc_msgSend(v10, "associatedSerialNumber");
              v51 = 1024;
              v52 = v15;
              v53 = 1024;
              v54 = 1;
              _os_log_impl(&dword_1C3511000, v45, OS_LOG_TYPE_DEFAULT, "SN 0x%x with type %d but modality %d", buf, 0x14u);
            }

            goto LABEL_17;
          }
        }
        if (v25)
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("StartStation"));
          v39 = v48;
        }
        else
        {
          ATLLogObject();
          v40 = objc_claimAutoreleasedReturnValue();
          v39 = v48;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
          }

        }
        v41 = *(void **)(v36 + 3408);
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("metroExitStationCode"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "dataWithHexString:", v42);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        -[WuluDecoder getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:](v47, "getStationCode:codeSetting:swapByteOrdering:convertFormat:cityCode:", v10, v34, CFSTR("00"), CFSTR("00"), v17);
        v43 = objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v43, CFSTR("EndStation"));
          v25 = (void *)v43;
        }
        else
        {
          ATLLogObject();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3511000, v44, OS_LOG_TYPE_ERROR, "Failed to get end station code", buf, 2u);
          }

          v25 = 0;
        }
        goto LABEL_18;
      }
    }
    if (v25)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("StartStation"));
    }
    else
    {
      ATLLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v31, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
      }

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Amount"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "intValue");

    if (!v33)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("EnRoute"), CFSTR("IgnoreReason"));
LABEL_17:
    v34 = v48;
LABEL_18:

LABEL_19:
  }

}

- (void)parseUnreliable1ECities:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8
{
  id v8;

  v8 = a8;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Purchase"), CFSTR("TypeDetail"));
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("IgnoreReason"));

}

- (id)getStationCode:(id)a3 codeSetting:(id)a4 swapByteOrdering:(id)a5 convertFormat:(id)a6 cityCode:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  char *v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v12, "u8:", 0);
  v17 = objc_msgSend(v12, "u8:", 1);
  objc_msgSend(v11, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19 >= v17 + (unint64_t)v16)
  {
    objc_msgSend(v11, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "subdataWithRange:", v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isEqualToString:", CFSTR("01")))
    {
      v23 = (void *)MEMORY[0x1E0C99D50];
      v24 = objc_retainAutorelease(v21);
      objc_msgSend(v23, "dataWithReversedBytes:length:", objc_msgSend(v24, "bytes"), v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("01")))
    {
      v41 = v13;
      v25 = v15;
      MEMORY[0x1E0C80A78]();
      v27 = (char *)&v40 - v26;
      if (v17)
      {
        for (i = 0; i != v17; ++i)
        {
          objc_msgSend(v21, "encodeBCDAtOffset:length:", i, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v27[i] = objc_msgSend(v29, "unsignedCharValue");

        }
      }
LABEL_18:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, v17);
      v34 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v34;
      v15 = v25;
      v13 = v41;
      goto LABEL_22;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("03")))
    {
      objc_msgSend(v21, "encodeBCD");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("02")))
      {
        v41 = v13;
        v25 = v15;
        MEMORY[0x1E0C80A78]();
        v27 = (char *)&v40 - v31;
        if (v17)
        {
          for (j = 0; j != v17; ++j)
          {
            objc_msgSend(v21, "decodeBCDAtOffset:length:", j, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v27[j] = objc_msgSend(v33, "unsignedCharValue");

          }
        }
        goto LABEL_18;
      }
      if (!objc_msgSend(v14, "isEqualToString:", CFSTR("04")))
        goto LABEL_22;
      objc_msgSend(v21, "decodeBCD");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = v30;
    v36 = objc_msgSend(v30, "unsignedLongValue");

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithLongBE:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "subdataWithOffset:length:", 8 - v17, v17);
    v38 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v38;
    goto LABEL_22;
  }
  ATLLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v15;
    _os_log_impl(&dword_1C3511000, v20, OS_LOG_TYPE_ERROR, "City %@ local log's station code offset too big.", buf, 0xCu);
  }

  v21 = 0;
LABEL_22:

  return v21;
}

- (void)adjustState:(id)a3 history:(id)a4 ctx:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CityCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataWithShortBE:", objc_msgSend(v12, "unsignedShortValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asHexString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cityRules"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WuluDecoder removeEnRouteForSingleTapBusGuangdong:transaction:cityCode:](self, "removeEnRouteForSingleTapBusGuangdong:transaction:cityCode:", v18, v10, v17);
  }
  -[WuluDecoder removeUnreliable1EEntryFlag:ctx:](self, "removeUnreliable1EEntryFlag:ctx:", v18, v9);
  -[WuluDecoder setMetroEntryWithLocalLog:ctx:](self, "setMetroEntryWithLocalLog:ctx:", v18, v9);
  -[WuluDecoder setGalileoJinshanMaglevNonlocal:ctx:](self, "setGalileoJinshanMaglevNonlocal:ctx:", v18, v9);

}

- (void)removeEnRouteForSingleTapBusGuangdong:(id)a3 transaction:(id)a4 cityCode:(id)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "unsignedIntValue") == 1)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v10 == CFSTR("TransitBus"))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IgnoreReason"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", CFSTR("TransitBus"));

        }
      }
    }
  }

}

- (void)setMetroEntryWithLocalLog:(id)a3 ctx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", CFSTR("TransitMetro")) & 1) == 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SPRaw"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithShortBE:", objc_msgSend(v9, "unsignedShortValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", CFSTR("2900"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToData:", v11);

    if (v12)
    {
      objc_msgSend(v7, "localRecords");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filter:", &__block_literal_global_389);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && objc_msgSend(v14, "count"))
      {
        v30 = v10;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        if (!v16)
          goto LABEL_19;
        v17 = v16;
        v18 = *(_QWORD *)v33;
        while (1)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "sfi");
            switch(v20)
            {
              case 17:
                v21 = CFSTR("TransitMetro");
                break;
              case 20:
                v21 = CFSTR("TransitTrain");
                break;
              case 19:
                v21 = CFSTR("TransitTrainMaglev");
                break;
              default:
                continue;
            }
            objc_msgSend(v8, "addObject:", v21);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          if (!v17)
          {
LABEL_19:

            v10 = v30;
            goto LABEL_28;
          }
        }
      }

    }
    else
    {
      v22 = v9;
      +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("localLogSettings"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asHexString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = 0;
      v27 = -[WuluDecoder isMetroEntry:cityCode:setting:error:](self, "isMetroEntry:cityCode:setting:error:", v7, v10, v26, &v31);
      v28 = v31;
      if (v28)
      {
        ATLLogObject();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v10;
          _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_ERROR, "Entry information is not obtained correctly for city %@.", buf, 0xCu);
        }

        v9 = v22;
      }
      else
      {
        v9 = v22;
        if (v27)
          objc_msgSend(v8, "addObject:", CFSTR("TransitMetro"));
      }

    }
LABEL_28:

  }
}

uint64_t __45__WuluDecoder_setMetroEntryWithLocalLog_ctx___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  if (objc_msgSend(v2, "number") == 3 || objc_msgSend(v2, "number") == 6)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithUnsignedChar:", objc_msgSend(v4, "u8:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(&unk_1E7D9CDB0, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setGalileoJinshanMaglevNonlocal:(id)a3 ctx:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;

  v21 = a3;
  objc_msgSend(a4, "file1A");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstWhere:", &__block_literal_global_392);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subdataWithOffset:length:", 15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("2900"));

  if (v10)
  {
    objc_msgSend(v6, "data");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (*(_BYTE *)(objc_msgSend(v11, "bytes") + 14) == 1)
    {

    }
    else
    {
      objc_msgSend(v6, "data");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = *(unsigned __int8 *)(objc_msgSend(v12, "bytes") + 14);

      if (v13 != 3)
        goto LABEL_11;
    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", CFSTR("TransitBus"));

    objc_msgSend(v6, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subdataWithOffset:length:", 26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "u8:", 0);

    if (v17 == 34)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("TransitTrain");
    }
    else
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == 144)
      {
        v19 = v18;
        v20 = CFSTR("TransitTrainMaglev");
      }
      else
      {
        v19 = v18;
        v20 = CFSTR("TransitMetro");
      }
    }
    objc_msgSend(v18, "addObject:", v20);

  }
LABEL_11:

}

BOOL __51__WuluDecoder_setGalileoJinshanMaglevNonlocal_ctx___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "number") == 2;
}

- (void)removeUnreliable1EEntryFlag:(id)a3 ctx:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  int v34;
  NSObject *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD v45[4];
  int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "file1E");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstWhere:", &__block_literal_global_393);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v42 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v48;
    v39 = v8;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v8);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TransitMetro")) & 1) != 0)
        {
          v11 = 1;
        }
        else
        {
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TransitBus")) & 1) == 0)
          {
            ATLLogObject();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v10;
              _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_DEFAULT, "Unreliable city only has bus and metro, skip processing for type %@.", buf, 0xCu);
            }
            goto LABEL_36;
          }
          v11 = 2;
        }
        objc_msgSend(v6, "file1A");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_395;
        v45[3] = &__block_descriptor_36_e20_B16__0__WuluRecord_8l;
        v46 = v11;
        objc_msgSend(v12, "firstWhere:", v45);
        v13 = objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_31;
        -[NSObject data](v13, "data");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (*(_BYTE *)(objc_msgSend(v14, "bytes") + 14) != 1)
        {
          -[NSObject data](v13, "data");
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          if (*(_BYTE *)(objc_msgSend(v15, "bytes") + 14) != 3)
          {
            -[NSObject data](v13, "data");
            v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v34 = *(unsigned __int8 *)(objc_msgSend(v33, "bytes") + 14);

            if (v34 != 1)
            {
LABEL_31:
              if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TransitMetro")) & 1) != 0)
                goto LABEL_36;
              v17 = v38;
              if (v17)
              {
LABEL_17:
                v18 = v6;
                objc_msgSend(v17, "data");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "subdataWithOffset:length:", 32, 2);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("cityRules"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "asHexString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v24, "intValue") == 99)
                {
                  ATLLogObject();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v52 = v10;
                    v53 = 2112;
                    v54 = v20;
                    _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_DEFAULT, "%@ entry flag removed as city code %@ in unreliable 1E city list.", buf, 0x16u);
                  }

                  objc_msgSend(v40, "removeObject:", v10);
                }

                v6 = v18;
                v8 = v39;
                goto LABEL_36;
              }
              goto LABEL_33;
            }
            goto LABEL_15;
          }

        }
LABEL_15:
        if (-[NSObject associatedSerialNumber](v13, "associatedSerialNumber"))
        {
          objc_msgSend(v6, "file1E");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_397;
          v43[3] = &unk_1E7D8A3D8;
          v44 = v13;
          objc_msgSend(v16, "firstWhere:", v43);
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (v17)
            goto LABEL_17;
LABEL_33:
          ATLLogObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = -[NSObject associatedSerialNumber](v13, "associatedSerialNumber");
            *(_DWORD *)buf = 138412546;
            v52 = v10;
            v53 = 1024;
            LODWORD(v54) = v36;
            _os_log_impl(&dword_1C3511000, v35, OS_LOG_TYPE_DEFAULT, "Associated 1E record for %@ with associated SN = %u cannot be found, remove the entry flag.", buf, 0x12u);
          }

          objc_msgSend(v40, "removeObject:", v10);
          goto LABEL_36;
        }
        -[NSObject data](v13, "data");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "subdataWithOffset:length:", 15, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("cityRules"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "asHexString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "intValue") == 99)
        {
          ATLLogObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v52 = v10;
            v53 = 2112;
            v54 = v27;
            _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_DEFAULT, "%@ entry flag removed as city code %@ in unreliable city list and 1A's associated SN is 0.", buf, 0x16u);
          }

          objc_msgSend(v40, "removeObject:", v10);
        }

LABEL_36:
      }
      v42 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v42);
  }

}

BOOL __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "number") == 1;
}

BOOL __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_395(uint64_t a1, void *a2)
{
  return *(_DWORD *)(a1 + 32) == objc_msgSend(a2, "number");
}

BOOL __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_397(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "associatedSerialNumber");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "associatedSerialNumber");
}

- (id)adjustHistory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CityCode"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataWithShortBE:", objc_msgSend(v12, "unsignedShortValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "asHexString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cityRules"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[WuluDecoder removeDoubleMetroTapGuangdong:history:cityCode:](self, "removeDoubleMetroTapGuangdong:history:cityCode:", v10, v5, v17);
        -[WuluDecoder addFakeBusTxnGuangdong:history:cityCode:](self, "addFakeBusTxnGuangdong:history:cityCode:", v10, v5, v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)removeDoubleMetroTapGuangdong:(id)a3 history:(id)a4 cityCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  __int16 v19;
  __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && objc_msgSend(v10, "unsignedIntValue") == 1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Amount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "intValue"))
    {

    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v13 == CFSTR("TransitMetro"))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (unsigned __int16)objc_msgSend(v14, "intValue") >> 8;

        -[WuluDecoder findNextCappPuchaseEntry:history:](self, "findNextCappPuchaseEntry:history:", v8, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "intValue");

          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v20 == CFSTR("TransitMetro") && (v19 & 0xFF00) == 0x300 && ((v21 = v15, v15 == 3) || v15 == 6))
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CityCode"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CityCode"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "isEqualToNumber:", v23);

            if (v24)
            {
              objc_msgSend(v9, "removeObject:", v8);
              ATLLogObject();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = 138412802;
                v28 = v26;
                v29 = 1024;
                v30 = v21;
                v31 = 1024;
                v32 = 3;
                _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_DEFAULT, "SN %@ with type=%d, next transaction type=%d, both modality are metro, remove this transaction.", (uint8_t *)&v27, 0x18u);

              }
            }
          }
          else
          {

          }
        }

      }
    }
  }

}

- (void)addFakeBusTxnGuangdong:(id)a3 history:(id)a4 cityCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "unsignedIntValue") == 1)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "intValue");

      if ((v13 & 0xFF00) == 0x300)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v14 == CFSTR("TransitBus"))
        {
          -[WuluDecoder findNextCappPuchaseEntry:history:](self, "findNextCappPuchaseEntry:history:", v8, v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("TypeDetailRaw"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "intValue");

            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TypeDetail"));
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v19 != CFSTR("TransitBus") || (v18 & 0xFF00) == 0x300)
            {
              v20 = (void *)objc_msgSend(v8, "mutableCopy");
              objc_msgSend(v20, "removeObjectForKey:", CFSTR("IgnoreReason"));
              v21 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "numberWithInt:", objc_msgSend(v22, "intValue") + 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("SerialNumber"));

              objc_msgSend(v9, "insertObject:atIndex:", v20, objc_msgSend(v9, "indexOfObject:", v8));
              ATLLogObject();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = 138412546;
                v28 = v25;
                v29 = 2112;
                v30 = v26;
                _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_DEFAULT, "SN %@, previous transaction != bus or is an entry at %@, add a fake tap-out.", (uint8_t *)&v27, 0x16u);

              }
            }
          }

        }
      }
    }
  }

}

- (id)findNextCappPuchaseEntry:(id)a3 history:(id)a4
{
  id v6;
  void *v7;
  __int16 v8;
  void *v9;
  _QWORD v11[5];
  __int16 v12;

  v6 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WuluDecoder convertWalletSNtoAppletSN:](self, "convertWalletSNtoAppletSN:", v7) + 1;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__WuluDecoder_findNextCappPuchaseEntry_history___block_invoke;
  v11[3] = &unk_1E7D8A480;
  v11[4] = self;
  v12 = v8;
  objc_msgSend(v6, "firstWhere:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __48__WuluDecoder_findNextCappPuchaseEntry_history___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  _BOOL8 v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");
  v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "convertAppletSNtoWalletSN:txnTypeIdentifier:", *(unsigned __int16 *)(a1 + 40), 9);

  return v5;
}

- (id)resolveTransitModality:(unsigned __int8)a3
{
  if ((a3 - 1) > 0xD)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E7D8A4A0 + (char)(a3 - 1));
}

- (BOOL)isMetroEntry:(id)a3 cityCode:(id)a4 setting:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void **v44;
  uint64_t *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  NSObject *v56;
  int v57;
  int v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t *v63;
  uint64_t *v64;
  NSObject *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  void *v71;
  id v73;
  _QWORD v74[2];
  _QWORD v75[2];
  uint64_t v76;
  void *v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  _BYTE v85[10];
  int v86;
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
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    v73 = v9;
    v13 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("localRecordSfi"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataWithHexString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "u8:", 0);

    v17 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("localRecordId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataWithHexString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "u8:", 0);

    v21 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("metroInStationOffset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dataWithHexString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "u8:", 0);

    v25 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("metroInStationValue"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dataWithHexString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "u8:", 0);

    ATLLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v79 = v10;
      v80 = 1024;
      v81 = v16;
      v82 = 1024;
      v83 = v20;
      _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_DEFAULT, "City %@ local record %02X(%02X) is being checked for enroute.", buf, 0x18u);
    }

    objc_msgSend(v9, "localRecords");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      if (objc_msgSend(v31, "sfi") == (_DWORD)v16
        && objc_msgSend(v31, "number") == (_DWORD)v20)
      {
        objc_msgSend(v31, "data");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "length");

        if (v33 >= v24)
        {
          objc_msgSend(v31, "data");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v39, "u8:", v24) == v28;
        }
        else
        {
          ATLLogObject();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v31, "data");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "length");
            *(_DWORD *)buf = 138413314;
            v79 = v10;
            v80 = 1024;
            v81 = v16;
            v82 = 1024;
            v83 = v20;
            v84 = 2048;
            *(_QWORD *)v85 = v36;
            *(_WORD *)&v85[8] = 1024;
            v86 = v24;
            _os_log_impl(&dword_1C3511000, v34, OS_LOG_TYPE_ERROR, "City %@ local record %02X(%02X) was expected but not enough data provided. (actual length = %lu, expected minimum %u).", buf, 0x28u);

          }
          v37 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v31, "data");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("City %@ local record %02X(%02X) was expected but not enough data provided. (actual length = %lu, expected minimum %u)."), v10, v16, v20, objc_msgSend(v38, "length"), v24);

          if (a6)
          {
            v40 = *a6;
            v41 = (void *)MEMORY[0x1E0CB35C8];
            if (*a6)
            {
              v42 = *MEMORY[0x1E0CB3388];
              v74[0] = *MEMORY[0x1E0CB2D50];
              v74[1] = v42;
              v75[0] = v39;
              v75[1] = v40;
              v43 = (void *)MEMORY[0x1E0C99D80];
              v44 = (void **)v75;
              v45 = v74;
              v46 = 2;
            }
            else
            {
              v76 = *MEMORY[0x1E0CB2D50];
              v77 = v39;
              v43 = (void *)MEMORY[0x1E0C99D80];
              v44 = &v77;
              v45 = &v76;
              v46 = 1;
            }
            objc_msgSend(v43, "dictionaryWithObjects:forKeys:count:", v44, v45, v46);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v73;
            goto LABEL_36;
          }
          v70 = 0;
        }
        v9 = v73;
        goto LABEL_38;
      }
      ATLLogObject();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = objc_msgSend(v31, "sfi");
        v58 = objc_msgSend(v31, "number");
        *(_DWORD *)buf = 138413314;
        v79 = v10;
        v80 = 1024;
        v81 = v16;
        v82 = 1024;
        v83 = v20;
        v84 = 1024;
        *(_DWORD *)v85 = v57;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v58;
        _os_log_impl(&dword_1C3511000, v56, OS_LOG_TYPE_ERROR, "City %@ local record %02X(%02X) was expected but got %02X(%02X)", buf, 0x24u);
      }

      v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("City %@ local record %02X(%02X) was expected but got %02X(%02X)"), v10, v16, v20, objc_msgSend(v31, "sfi"), objc_msgSend(v31, "number"));
      v39 = (void *)v59;
      if (!a6)
        goto LABEL_37;
      v60 = *a6;
      v41 = (void *)MEMORY[0x1E0CB35C8];
      if (*a6)
      {
        v61 = *MEMORY[0x1E0CB3388];
        v87[0] = *MEMORY[0x1E0CB2D50];
        v87[1] = v61;
        v88[0] = v59;
        v88[1] = v60;
        v62 = (void *)MEMORY[0x1E0C99D80];
        v63 = v88;
        v64 = v87;
LABEL_28:
        v69 = 2;
LABEL_35:
        objc_msgSend(v62, "dictionaryWithObjects:forKeys:count:", v63, v64, v69);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v71);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
        v70 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v89 = *MEMORY[0x1E0CB2D50];
      v90 = v59;
      v62 = (void *)MEMORY[0x1E0C99D80];
      v63 = &v90;
      v64 = &v89;
    }
    else
    {
      ATLLogObject();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v10;
        _os_log_impl(&dword_1C3511000, v65, OS_LOG_TYPE_ERROR, "City %@ local record is missing.", buf, 0xCu);
      }

      v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("City %@ local record is missing."), v10);
      v39 = (void *)v66;
      if (!a6)
        goto LABEL_37;
      v67 = *a6;
      v41 = (void *)MEMORY[0x1E0CB35C8];
      if (*a6)
      {
        v68 = *MEMORY[0x1E0CB3388];
        v91[0] = *MEMORY[0x1E0CB2D50];
        v91[1] = v68;
        v92[0] = v66;
        v92[1] = v67;
        v62 = (void *)MEMORY[0x1E0C99D80];
        v63 = v92;
        v64 = v91;
        goto LABEL_28;
      }
      v93 = *MEMORY[0x1E0CB2D50];
      v94 = v66;
      v62 = (void *)MEMORY[0x1E0C99D80];
      v63 = &v94;
      v64 = &v93;
    }
    v69 = 1;
    goto LABEL_35;
  }
  ATLLogObject();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3511000, v47, OS_LOG_TYPE_ERROR, "No setting.", buf, 2u);
  }

  v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No setting."));
  v31 = (void *)v48;
  if (a6)
  {
    v49 = *a6;
    v50 = (void *)MEMORY[0x1E0CB35C8];
    if (*a6)
    {
      v51 = *MEMORY[0x1E0CB3388];
      v95[0] = *MEMORY[0x1E0CB2D50];
      v95[1] = v51;
      v96[0] = v48;
      v96[1] = v49;
      v52 = (void *)MEMORY[0x1E0C99D80];
      v53 = v96;
      v54 = v95;
      v55 = 2;
    }
    else
    {
      v97 = *MEMORY[0x1E0CB2D50];
      v98[0] = v48;
      v52 = (void *)MEMORY[0x1E0C99D80];
      v53 = v98;
      v54 = &v97;
      v55 = 1;
    }
    objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, v55);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v39);
    v70 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  v70 = 0;
LABEL_39:

  return v70;
}

- (unsigned)convertWalletSNtoAppletSN:(id)a3
{
  return objc_msgSend(a3, "intValue") >> 1;
}

- (unsigned)convertAppletSNtoWalletSN:(unsigned __int16)a3 txnTypeIdentifier:(unsigned int)a4
{
  return (2 * a3) | (a4 << 17);
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
  NSObject *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if ((unint64_t)objc_msgSend(v11, "length") <= 1)
  {
    ATLLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v43 = objc_msgSend(v11, "length");
      _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Short eventData? %u"), objc_msgSend(v11, "length"));
    v15 = (void *)v14;
    if (!a8)
      goto LABEL_25;
    v16 = *a8;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (*a8)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v38[0] = *MEMORY[0x1E0CB2D50];
      v38[1] = v18;
      v39[0] = v14;
      v39[1] = v16;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v39;
      v21 = v38;
LABEL_7:
      v22 = 2;
LABEL_24:
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 6, v32);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_25:
LABEL_26:
      v27 = 0;
      goto LABEL_27;
    }
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = v14;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v41;
    v21 = &v40;
    goto LABEL_23;
  }
  v23 = objc_retainAutorelease(v11);
  v24 = *(unsigned __int8 *)objc_msgSend(v23, "bytes");
  switch((_DWORD)v24)
  {
    case 0x12:
      ATLLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_DEFAULT, "Deselect event, nothing to do here", buf, 2u);
      }

      goto LABEL_26;
    case 2:
      -[WuluDecoder parseEndEvent:withApplet:withError:](self, "parseEndEvent:withApplet:withError:", v23, v12, a8);
      v25 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[WuluDecoder parseStartEvent:withApplet:withError:](self, "parseStartEvent:withApplet:withError:", v23, v12, a8);
      v25 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      ATLLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v43 = v24;
        _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "Unknown event type %u", buf, 8u);
      }

      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown event type %u"), v24);
      v15 = (void *)v29;
      if (!a8)
        goto LABEL_25;
      v30 = *a8;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v31 = *MEMORY[0x1E0CB3388];
        v34[0] = *MEMORY[0x1E0CB2D50];
        v34[1] = v31;
        v35[0] = v29;
        v35[1] = v30;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v35;
        v21 = v34;
        goto LABEL_7;
      }
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = v29;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v37;
      v21 = &v36;
LABEL_23:
      v22 = 1;
      goto LABEL_24;
  }
  v27 = (void *)v25;
LABEL_27:

  return v27;
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
  v35[8] = &unk_1E7D9A8D8;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[12];
  _QWORD v53[12];
  __int128 buf;
  _QWORD v55[2];
  _QWORD v56[2];
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
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
      goto LABEL_29;
    v13 = *a5;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v15 = *MEMORY[0x1E0CB3388];
      v59[0] = *MEMORY[0x1E0CB2D50];
      v59[1] = v15;
      v60[0] = v11;
      v60[1] = v13;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v60;
      v18 = v59;
      v19 = 2;
    }
    else
    {
      v61 = *MEMORY[0x1E0CB2D50];
      v62[0] = v11;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v62;
      v18 = &v61;
      v19 = 1;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    v38 = 3;
LABEL_28:
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("ATL"), v38, v36);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
    v42 = 0;
    goto LABEL_32;
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
      goto LABEL_29;
    v29 = *a5;
    v30 = (void *)MEMORY[0x1E0CB35C8];
    if (*a5)
    {
      v31 = *MEMORY[0x1E0CB3388];
      v55[0] = *MEMORY[0x1E0CB2D50];
      v55[1] = v31;
      v56[0] = v28;
      v56[1] = v29;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = v56;
      v34 = v55;
      v35 = 2;
    }
    else
    {
      v57 = *MEMORY[0x1E0CB2D50];
      v58 = v28;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = &v58;
      v34 = &v57;
      v35 = 1;
    }
    objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v30;
    v38 = 6;
    goto LABEL_28;
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
  objc_msgSend(v20, "subdataWithRange:", 9, objc_msgSend(v20, "length") - 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = objc_msgSend(v12, "bytes");
  *((_QWORD *)&buf + 1) = objc_msgSend(v12, "length");
  -[WuluDecoder DecodeEndE1TLV:error:](self, "DecodeEndE1TLV:error:", &buf, a5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 && !*a5)
  {
    v52[0] = CFSTR("EventType");
    v52[1] = CFSTR("appletIdentifier");
    v53[0] = CFSTR("EndEvent");
    v53[1] = v9;
    v52[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v22 + 1));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v51;
    v52[3] = CFSTR("Interface");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v22 + 2));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v50;
    v52[4] = CFSTR("didError");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40 != 144);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v49;
    v52[5] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(v39));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v43;
    v52[6] = CFSTR("status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", __rev16(v40));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v44;
    v52[7] = CFSTR("result");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (v40 == 144) << 6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v45;
    v53[8] = &unk_1E7D9A998;
    v52[8] = CFSTR("informative");
    v52[9] = CFSTR("type");
    v53[9] = &unk_1E7D9A9B0;
    v52[10] = CFSTR("ReadOperationInfo");
    objc_msgSend(v41, "objectForKeyedSubscript:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53[10] = v46;
    v52[11] = CFSTR("WriteOperationInfo");
    objc_msgSend(v41, "objectForKeyedSubscript:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53[11] = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 12);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }

LABEL_32:
  return v42;
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
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[WuluDecoder DecodeEndE1TLV:error:]", 1387, (uint64_t)a3->var0, a3->var1, CFSTR("E1 TLV data"), v44, v45, v48);
    goto LABEL_27;
  }
  *(_OWORD *)buf = 0u;
  v58 = (DERItem)0;
  v18 = DERParseSequenceSpec((uint64_t)v50, (uint64_t)&EndEventE1ContentSpec, (char *)buf, 0x20uLL);
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Wulu decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Wulu decoder doesn't expect processEndOfTransaction"));
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

- (id)setTimer:(id)a3 history:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint32_t v31;
  id v33;
  uint8_t buf[4];
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    if (!v8)
    {
      ATLLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v11, OS_LOG_TYPE_DEFAULT, "No history found.", buf, 2u);
      }
      v25 = 0;
      goto LABEL_34;
    }
    v9 = v8;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CityCode"));
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      ATLLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v13, OS_LOG_TYPE_DEFAULT, "No city code in the last history record.", buf, 2u);
      }
      v25 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TerminalIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();

    if (v9 >= 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CityCode"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TerminalIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        ATLLogObject();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v28 = "No terminal id in transaction.";
          v29 = v26;
          v30 = OS_LOG_TYPE_ERROR;
          v31 = 2;
          goto LABEL_30;
        }
LABEL_31:

        v25 = 0;
LABEL_32:

LABEL_33:
LABEL_34:

        goto LABEL_35;
      }
      if (objc_msgSend(v15, "isEqualToNumber:", v11)
        && (-[NSObject isEqualToData:](v13, "isEqualToData:", v17) & 1) == 0)
      {
        ATLLogObject();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          v28 = "Same city city code = %@ and same on terminal, ignore the timer set.";
          v29 = v26;
          v30 = OS_LOG_TYPE_DEFAULT;
          v31 = 12;
          goto LABEL_30;
        }
        goto LABEL_31;
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithShortBE:", (unsigned __int16)-[NSObject intValue](v11, "intValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("timerScript"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asHexString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_13;
    ATLLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = -[NSObject intValue](v11, "intValue");
      _os_log_impl(&dword_1C3511000, v21, OS_LOG_TYPE_DEFAULT, "No available timer for %02X, use the default one.", buf, 8u);
    }

    +[AppletConfigurationData getWuluSettings](AppletConfigurationData, "getWuluSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("timerScript"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("default"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
LABEL_13:
      if (objc_msgSend(v17, "count") == 3)
      {
        ATLLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_DEFAULT, "Set timer for city code = %@.", buf, 0xCu);
        }

        v33 = 0;
        objc_msgSend(v5, "applyScript:error:", v17, &v33);
        v25 = v33;
        goto LABEL_32;
      }
    }
    ATLLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v27;
      v28 = "No available timer or timers count %u != 3";
      v29 = v26;
      v30 = OS_LOG_TYPE_ERROR;
      v31 = 8;
LABEL_30:
      _os_log_impl(&dword_1C3511000, v29, v30, v28, buf, v31);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  v25 = 0;
LABEL_35:

  return v25;
}

- (void)cleanup
{
  self->decoderState = 0;
}

@end
