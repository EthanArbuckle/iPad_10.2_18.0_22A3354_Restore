@implementation PLAccessoryAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccessoryAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Accessory");
  objc_msgSend(a1, "entryEventPointDefinitionsReceivedPush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointDefinitionsReceivedPush
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8652DD0;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("Connected");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("EndpointType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("AccessoryType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLAccessoryAgent)init
{
  PLAccessoryAgent *v3;
  objc_super v5;

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 7))
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAccessoryAgent;
    self = -[PLAgent init](&v5, sel_init);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccessoryAgent setConnectedEndpoints:](self, "setConnectedEndpoints:", v3);

  objc_msgSend(MEMORY[0x1E0D153A0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccessoryAgent setAccConnectionInfo:](self, "setAccConnectionInfo:", v4);

  -[PLAccessoryAgent accConnectionInfo](self, "accConnectionInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerDelegate:", self);

}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4
{
  NSObject *v4;
  uint8_t v5[16];

  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Accessory connected", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", CFSTR("PLCAAccessoryAttachedNotification"), 0, 0);
}

- (void)accessoryConnectionDetached:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "Accessory disconnected", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", CFSTR("PLCAAccessoryDetachedNotification"), 0, 0);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v9 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    v25 = v13;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEFAULT, "Accessory attached: %@, %@, %@", (uint8_t *)&v24, 0x20u);
  }

  if ((v9 - 14) >= 0xFFFFFFFE)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("EndpointType"));

    v17 = *MEMORY[0x1E0D153C8];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D153C8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("AccessoryType"));

    -[PLAccessoryAgent connectedEndpoints](self, "connectedEndpoints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v11);

    +[PLOperator entryKeyForType:andName:](PLAccessoryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Accessory"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v20);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Connected"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("EndpointType"));

    objc_msgSend(v12, "objectForKeyedSubscript:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("AccessoryType"));

    -[PLOperator logEntry:](self, "logEntry:", v21);
  }

}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEFAULT, "Accessory detached: %@, %@", (uint8_t *)&v16, 0x16u);
  }

  -[PLAccessoryAgent connectedEndpoints](self, "connectedEndpoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[PLOperator entryKeyForType:andName:](PLAccessoryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Accessory"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Connected"));
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EndpointType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("EndpointType"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AccessoryType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("AccessoryType"));

    -[PLOperator logEntry:](self, "logEntry:", v12);
    -[PLAccessoryAgent connectedEndpoints](self, "connectedEndpoints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v6);

  }
  else
  {
    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "Accessory property does not exist: %@", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (ACCConnectionInfo)accConnectionInfo
{
  return (ACCConnectionInfo *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccConnectionInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)connectedEndpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnectedEndpoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedEndpoints, 0);
  objc_storeStrong((id *)&self->_accConnectionInfo, 0);
}

@end
