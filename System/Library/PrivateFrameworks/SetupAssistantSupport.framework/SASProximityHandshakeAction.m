@implementation SASProximityHandshakeAction

+ (unint64_t)actionID
{
  return 2;
}

- (SASProximityHandshakeAction)init
{
  SASProximityHandshakeAction *v2;
  SASProximityHandshake *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SASProximityHandshakeAction;
  v2 = -[SASProximityHandshakeAction init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SASProximityHandshake);
    -[SASProximityHandshakeAction setHandshake:](v2, "setHandshake:", v3);

  }
  return v2;
}

- (BOOL)hasResponse
{
  return 1;
}

- (void)setResponseFromData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v21;
  if (!v10)
  {
    +[SASLogging facility](SASLogging, "facility");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1D45FD000, v12, OS_LOG_TYPE_DEFAULT, "Failed to unarchive handshake response payload: %@", buf, 0xCu);
    }

  }
  v13 = (void *)MEMORY[0x1E0CB3710];
  v14 = objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("handshake"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  objc_msgSend(v13, "unarchivedObjectOfClass:fromData:error:", v14, v15, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;

  -[SASProximityHandshakeAction setHandshake:](self, "setHandshake:", v16);
  -[SASProximityHandshakeAction handshake](self, "handshake");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    +[SASLogging facility](SASLogging, "facility");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_1D45FD000, v19, OS_LOG_TYPE_DEFAULT, "Failed to unarchive handshake: %@", buf, 0xCu);
    }

  }
}

- (id)responsePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;
  id v15;
  const __CFString *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SASProximityHandshakeAction handshake](self, "handshake");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadInformation");

  v4 = (void *)MEMORY[0x1E0CB36F8];
  -[SASProximityHandshakeAction handshake](self, "handshake");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v6)
  {
    v16 = CFSTR("handshake");
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (v9)
    {
      v11 = v9;
    }
    else
    {
      +[SASLogging facility](SASLogging, "facility");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        _os_log_impl(&dword_1D45FD000, v12, OS_LOG_TYPE_DEFAULT, "Failed to archive handshake response payload: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_1D45FD000, v8, OS_LOG_TYPE_DEFAULT, "Failed to archive handshake: %@", buf, 0xCu);
    }
    v9 = 0;
    v10 = v7;
  }

  return v9;
}

- (SASProximityHandshake)handshake
{
  return (SASProximityHandshake *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHandshake:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handshake, 0);
}

@end
