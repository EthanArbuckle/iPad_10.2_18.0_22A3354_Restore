@implementation TCSCall

- (TCSCall)initWithCall:(id)a3
{
  id v4;
  TCSCall *v5;
  TCSCall *v6;
  char v7;
  void *v8;
  uint64_t v9;
  NSString *contactIdentifier;
  void *v11;
  uint64_t v12;
  NSString *handleValue;
  uint64_t v14;
  NSString *uniqueProxyIdentifier;
  uint64_t v16;
  NSDate *dateAnsweredOrDialed;
  uint64_t v18;
  NSDate *dateConnected;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TCSCall;
  v5 = -[TCSCall init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isNilCall = v4 == 0;
    v5->_isConnected = objc_msgSend(v4, "isConnected");
    v6->_isOutgoing = objc_msgSend(v4, "isOutgoing");
    if (objc_msgSend(v4, "tc_useUnderlyingRemoteUplinkMuted"))
      v7 = objc_msgSend(v4, "isRemoteUplinkMuted");
    else
      v7 = 1;
    v6->_isRemoteUplinkMuted = v7;
    objc_msgSend(v4, "contactIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v9;

    objc_msgSend(v4, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    handleValue = v6->_handleValue;
    v6->_handleValue = (NSString *)v12;

    v6->_status = objc_msgSend(v4, "status");
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    uniqueProxyIdentifier = v6->_uniqueProxyIdentifier;
    v6->_uniqueProxyIdentifier = (NSString *)v14;

    v6->_disconnectedReason = objc_msgSend(v4, "disconnectedReason");
    objc_msgSend(v4, "dateAnsweredOrDialed");
    v16 = objc_claimAutoreleasedReturnValue();
    dateAnsweredOrDialed = v6->_dateAnsweredOrDialed;
    v6->_dateAnsweredOrDialed = (NSDate *)v16;

    objc_msgSend(v4, "dateConnected");
    v18 = objc_claimAutoreleasedReturnValue();
    dateConnected = v6->_dateConnected;
    v6->_dateConnected = (NSDate *)v18;

  }
  return v6;
}

- (TCSCall)initWithURL:(id)a3
{
  id v4;
  TCSCall *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  uint64_t v40;
  NSString *contactIdentifier;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  int v46;
  const __CFString *v47;
  NSObject *v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)TCSCall;
  v5 = -[TCSCall init](&v55, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
    objc_msgSend(v6, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("tincan")) & 1) != 0)
    {
      objc_msgSend(v6, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("tcsCall"));

      if (v9)
      {
        v50 = v4;
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setNumberStyle:", 1);
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v6, "queryItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (!v12)
          goto LABEL_51;
        v13 = v12;
        v14 = *(_QWORD *)v52;
        while (1)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v52 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v16, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(CFSTR("conn"), "isEqualToString:", v17);

            if (v18)
            {
              objc_msgSend(v16, "value");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "numberFromString:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
                v21 = objc_msgSend(v20, "BOOLValue");
              else
                v21 = 0;
              v5->_isConnected = v21;
            }
            else
            {
              objc_msgSend(v16, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(CFSTR("out"), "isEqualToString:", v22);

              if (v23)
              {
                objc_msgSend(v16, "value");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "numberFromString:", v24);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                  v25 = objc_msgSend(v20, "BOOLValue");
                else
                  v25 = 0;
                v5->_isOutgoing = v25;
              }
              else
              {
                objc_msgSend(v16, "name");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(CFSTR("rUM"), "isEqualToString:", v26);

                if (v27)
                {
                  objc_msgSend(v16, "value");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "numberFromString:", v28);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v20)
                    v29 = objc_msgSend(v20, "BOOLValue");
                  else
                    v29 = 0;
                  v5->_isRemoteUplinkMuted = v29;
                }
                else
                {
                  objc_msgSend(v16, "name");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(CFSTR("stat"), "isEqualToString:", v30);

                  if (v31)
                  {
                    objc_msgSend(v16, "value");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "numberFromString:", v32);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v20)
                      v33 = objc_msgSend(v20, "intValue");
                    else
                      v33 = 0;
                    v5->_status = v33;
                  }
                  else
                  {
                    objc_msgSend(v16, "name");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(CFSTR("dR"), "isEqualToString:", v34);

                    if (v35)
                    {
                      objc_msgSend(v16, "value");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "numberFromString:", v36);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v20)
                        v37 = objc_msgSend(v20, "intValue");
                      else
                        v37 = 0;
                      v5->_disconnectedReason = v37;
                    }
                    else
                    {
                      objc_msgSend(v16, "name");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v39 = objc_msgSend(CFSTR("cID"), "isEqualToString:", v38);

                      if (v39)
                      {
                        objc_msgSend(v16, "value");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        v40 = objc_msgSend(v20, "length");
                        if (v40)
                        {
                          objc_msgSend(v16, "value");
                          v40 = objc_claimAutoreleasedReturnValue();
                        }
                        contactIdentifier = v5->_contactIdentifier;
                        v5->_contactIdentifier = (NSString *)v40;
                      }
                      else
                      {
                        objc_msgSend(v16, "name");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        v43 = objc_msgSend(CFSTR("hdl"), "isEqualToString:", v42);

                        if (v43)
                        {
                          objc_msgSend(v16, "value");
                          v20 = (void *)objc_claimAutoreleasedReturnValue();
                          v44 = objc_msgSend(v20, "length");
                          if (v44)
                          {
                            objc_msgSend(v16, "value");
                            v44 = objc_claimAutoreleasedReturnValue();
                          }
                          contactIdentifier = v5->_handleValue;
                          v5->_handleValue = (NSString *)v44;
                        }
                        else
                        {
                          objc_msgSend(v16, "name");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = objc_msgSend(CFSTR("uPI"), "isEqualToString:", v45);

                          if (!v46)
                            continue;
                          objc_msgSend(v16, "value");
                          v20 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v20, "length"))
                          {
                            objc_msgSend(v16, "value");
                            v47 = (const __CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v47 = &stru_24CFC2D40;
                          }
                          contactIdentifier = v5->_uniqueProxyIdentifier;
                          v5->_uniqueProxyIdentifier = &v47->isa;
                        }
                      }

                    }
                  }
                }
              }
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          if (!v13)
          {
LABEL_51:

            v4 = v50;
            goto LABEL_56;
          }
        }
      }
    }
    else
    {

    }
    _TCSInitializeLogging();
    v48 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSCall initWithURL:].cold.1((uint64_t)v4, v48);
    v5->_isNilCall = 1;
LABEL_56:

  }
  return v5;
}

- (void)setCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_callCenter, a3);
}

- (BOOL)isEqualToCall:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  char v27;
  int v29;
  int v30;
  char v31;
  int v32;
  int v33;
  char v34;
  char v35;
  BOOL v36;
  char v37;
  BOOL v38;
  char v39;
  BOOL v40;
  char v41;

  v7 = a3;
  if (!v7)
  {
    v11 = 0;
    goto LABEL_38;
  }
  v40 = -[TCSCall isConnected](self, "isConnected");
  v39 = objc_msgSend(v7, "isConnected");
  v38 = -[TCSCall isOutgoing](self, "isOutgoing");
  v37 = objc_msgSend(v7, "isOutgoing");
  v36 = -[TCSCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted");
  v35 = objc_msgSend(v7, "isRemoteUplinkMuted");
  -[TCSCall contactIdentifier](self, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "contactIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v41 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[TCSCall contactIdentifier](self, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v9, "isEqualToString:", v10);

  if (!v8)
    goto LABEL_8;
LABEL_9:

  -[TCSCall handleValue](self, "handleValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v7, "handleValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v34 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[TCSCall handleValue](self, "handleValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v13, "isEqualToString:", v14);

  if (!v12)
    goto LABEL_14;
LABEL_15:

  v33 = -[TCSCall status](self, "status");
  v32 = objc_msgSend(v7, "status");
  -[TCSCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v7, "uniqueProxyIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v31 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  -[TCSCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueProxyIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v16, "isEqualToString:", v17);

  if (!v15)
    goto LABEL_20;
LABEL_21:

  v30 = -[TCSCall disconnectedReason](self, "disconnectedReason");
  v29 = objc_msgSend(v7, "disconnectedReason");
  -[TCSCall dateAnsweredOrDialed](self, "dateAnsweredOrDialed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v7, "dateAnsweredOrDialed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v21 = 1;
LABEL_26:

      goto LABEL_27;
    }
  }
  -[TCSCall dateAnsweredOrDialed](self, "dateAnsweredOrDialed");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateAnsweredOrDialed");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToDate:", v20);

  if (!v18)
    goto LABEL_26;
LABEL_27:

  -[TCSCall dateConnected](self, "dateConnected");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v7, "dateConnected");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v25 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  -[TCSCall dateConnected](self, "dateConnected");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateConnected");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqualToDate:", v24);

  if (!v22)
    goto LABEL_32;
LABEL_33:

  v26 = v41 & ~(v40 ^ v39 | v38 ^ v37 | v36 ^ v35) & v34;
  if (v33 != v32)
    v26 = 0;
  v27 = v26 & v31;
  if (v30 != v29)
    v27 = 0;
  v11 = v27 & v21 & v25;
LABEL_38:

  return v11;
}

- (id)URL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[10];

  v43[8] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setNumberStyle:", 1);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setScheme:", CFSTR("tincan"));
  objc_msgSend(v4, "setHost:", CFSTR("tcsCall"));
  v5 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TCSCall isConnected](self, "isConnected"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemWithName:value:", CFSTR("conn"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v40;
  v6 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TCSCall isOutgoing](self, "isOutgoing"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("out"), v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v37;
  v7 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TCSCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("rUM"), v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v34;
  v8 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TCSCall status](self, "status"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryItemWithName:value:", CFSTR("stat"), v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v31;
  v9 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TCSCall disconnectedReason](self, "disconnectedReason"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryItemWithName:value:", CFSTR("dR"), v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v10;
  v11 = (void *)MEMORY[0x24BDD1838];
  -[TCSCall contactIdentifier](self, "contactIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_24CFC2D40;
  objc_msgSend(v11, "queryItemWithName:value:", CFSTR("cID"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v15;
  v16 = (void *)MEMORY[0x24BDD1838];
  -[TCSCall handleValue](self, "handleValue");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_24CFC2D40;
  objc_msgSend(v16, "queryItemWithName:value:", CFSTR("hdl"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v20;
  v21 = (void *)MEMORY[0x24BDD1838];
  -[TCSCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = &stru_24CFC2D40;
  objc_msgSend(v21, "queryItemWithName:value:", CFSTR("uPI"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v26);

  objc_msgSend(v4, "URL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)setUplinkMuted:(BOOL)a3 completion:(id)a4
{
  -[TCSCallCenter setUplinkMuted:for:completion:](self->_callCenter, "setUplinkMuted:for:completion:", a3, self, a4);
}

- (BOOL)isIncoming
{
  return !-[TCSCall isOutgoing](self, "isOutgoing");
}

- (BOOL)isActive
{
  return -[TCSCall status](self, "status") == 3
      || -[TCSCall status](self, "status") == 4
      || -[TCSCall status](self, "status") == 1;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isNilCall)
  {
    v4 = CFSTR(" (no call)>");
  }
  else
  {
    -[TCSCall handleValue](self, "handleValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" hdl=%@"), v5);

    -[TCSCall status](self, "status");
    TUStringForCallStatus();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" stat=%@"), v6);

    objc_msgSend(v3, "appendFormat:", CFSTR(" dR=%d"), -[TCSCall disconnectedReason](self, "disconnectedReason"));
    if (-[TCSCall status](self, "status") == 5 || -[TCSCall status](self, "status") == 6)
    {
      NSStringFromTUCallDisconnectedReason(-[TCSCall disconnectedReason](self, "disconnectedReason"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(":'%@'"), v7);

    }
    -[TCSCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" uPI=%@"), v8);

    -[TCSCall isConnected](self, "isConnected");
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" conn=%@"), v9);

    v10 = -[TCSCall isOutgoing](self, "isOutgoing");
    v11 = CFSTR("in");
    if (v10)
      v11 = CFSTR("out");
    objc_msgSend(v3, "appendFormat:", CFSTR(" dir=%@"), v11);
    -[TCSCall contactIdentifier](self, "contactIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" cID=%@"), v12);

    objc_msgSend(v3, "appendFormat:", CFSTR(" rUM=%d"), -[TCSCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
    v4 = CFSTR(">");
  }
  objc_msgSend(v3, "appendString:", v4);
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TCSCall *v4;
  BOOL v5;

  v4 = (TCSCall *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TCSCall isEqualToCall:](self, "isEqualToCall:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  v3 = -[TCSCall isConnected](self, "isConnected");
  v4 = v3 ^ -[TCSCall isOutgoing](self, "isOutgoing");
  v5 = v4 ^ -[TCSCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted");
  -[TCSCall contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[TCSCall handleValue](self, "handleValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[TCSCall status](self, "status");
  -[TCSCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v5;
  v13 = -[TCSCall disconnectedReason](self, "disconnectedReason");
  -[TCSCall dateAnsweredOrDialed](self, "dateAnsweredOrDialed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[TCSCall dateConnected](self, "dateConnected");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TCSCall)initWithCoder:(id)a3
{
  id v4;
  TCSCall *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *contactIdentifier;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *handleValue;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *uniqueProxyIdentifier;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDate *dateAnsweredOrDialed;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDate *dateConnected;

  v4 = a3;
  v5 = -[TCSCall init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_isConnected);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isConnected = objc_msgSend(v4, "decodeBoolForKey:", v6);

    NSStringFromSelector(sel_isOutgoing);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isOutgoing = objc_msgSend(v4, "decodeBoolForKey:", v7);

    NSStringFromSelector(sel_isRemoteUplinkMuted);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRemoteUplinkMuted = objc_msgSend(v4, "decodeBoolForKey:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_contactIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_handleValue);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    handleValue = v5->_handleValue;
    v5->_handleValue = (NSString *)v15;

    NSStringFromSelector(sel_status);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v4, "decodeIntForKey:", v17);

    v18 = objc_opt_class();
    NSStringFromSelector(sel_uniqueProxyIdentifier);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    uniqueProxyIdentifier = v5->_uniqueProxyIdentifier;
    v5->_uniqueProxyIdentifier = (NSString *)v20;

    NSStringFromSelector(sel_disconnectedReason);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disconnectedReason = objc_msgSend(v4, "decodeIntForKey:", v22);

    v23 = objc_opt_class();
    NSStringFromSelector(sel_dateAnsweredOrDialed);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    dateAnsweredOrDialed = v5->_dateAnsweredOrDialed;
    v5->_dateAnsweredOrDialed = (NSDate *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_dateConnected);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    dateConnected = v5->_dateConnected;
    v5->_dateConnected = (NSDate *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isConnected;
  id v5;
  void *v6;
  _BOOL8 isOutgoing;
  void *v8;
  _BOOL8 isRemoteUplinkMuted;
  void *v10;
  NSString *contactIdentifier;
  void *v12;
  NSString *handleValue;
  void *v14;
  uint64_t status;
  void *v16;
  NSString *uniqueProxyIdentifier;
  void *v18;
  uint64_t disconnectedReason;
  void *v20;
  NSDate *dateAnsweredOrDialed;
  void *v22;
  NSDate *dateConnected;
  id v24;

  isConnected = self->_isConnected;
  v5 = a3;
  NSStringFromSelector(sel_isConnected);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", isConnected, v6);

  isOutgoing = self->_isOutgoing;
  NSStringFromSelector(sel_isOutgoing);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", isOutgoing, v8);

  isRemoteUplinkMuted = self->_isRemoteUplinkMuted;
  NSStringFromSelector(sel_isRemoteUplinkMuted);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", isRemoteUplinkMuted, v10);

  contactIdentifier = self->_contactIdentifier;
  NSStringFromSelector(sel_contactIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, v12);

  handleValue = self->_handleValue;
  NSStringFromSelector(sel_handleValue);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", handleValue, v14);

  status = self->_status;
  NSStringFromSelector(sel_status);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt:forKey:", status, v16);

  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  NSStringFromSelector(sel_uniqueProxyIdentifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uniqueProxyIdentifier, v18);

  disconnectedReason = self->_disconnectedReason;
  NSStringFromSelector(sel_disconnectedReason);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt:forKey:", disconnectedReason, v20);

  dateAnsweredOrDialed = self->_dateAnsweredOrDialed;
  NSStringFromSelector(sel_dateAnsweredOrDialed);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", dateAnsweredOrDialed, v22);

  dateConnected = self->_dateConnected;
  NSStringFromSelector(sel_dateConnected);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", dateConnected, v24);

}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_isRemoteUplinkMuted;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)handleValue
{
  return self->_handleValue;
}

- (int)status
{
  return self->_status;
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (int)disconnectedReason
{
  return self->_disconnectedReason;
}

- (NSDate)dateAnsweredOrDialed
{
  return self->_dateAnsweredOrDialed;
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_dateAnsweredOrDialed, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_handleValue, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
}

- (void)initWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_21342E000, a2, OS_LOG_TYPE_ERROR, "Failed to parse URL %{private}@ into a TCSCall.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

@end
