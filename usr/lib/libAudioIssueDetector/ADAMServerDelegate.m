@implementation ADAMServerDelegate

- (ADAMServerDelegate)initWithConnection:(id)a3 andErrorCode:(int64_t)a4
{
  ADAMServerDelegate *v6;
  ADAMServerDelegate *v7;
  NSString *clientName;
  NSMutableDictionary *dataTypeStatus;
  NSMutableDictionary *configs;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  objc_super v16;
  id location;

  objc_initWeak(&location, a3);
  v16.receiver = self;
  v16.super_class = (Class)ADAMServerDelegate;
  v6 = -[ADAMServerDelegate init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    clientName = v6->_clientName;
    v6->_clientName = 0;

    if (a4)
    {
      objc_storeWeak((id *)&v7->_connection, 0);
      dataTypeStatus = v7->_dataTypeStatus;
      v7->_dataTypeStatus = 0;

      configs = v7->_configs;
      v7->_configs = 0;
    }
    else
    {
      v11 = objc_loadWeakRetained(&location);
      -[ADAMServerDelegate setupConnection:](v7, "setupConnection:", v11);

      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v13 = v7->_dataTypeStatus;
      v7->_dataTypeStatus = v12;

      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      configs = v7->_configs;
      v7->_configs = v14;
    }

    v7->_error_code = a4;
    v7->_lock._os_unfair_lock_opaque = 0;
  }
  objc_destroyWeak(&location);
  return v7;
}

- (void)startListeningToAudioSampleWithIdentifier:(id)a3 type:(unsigned int)a4 withReply:(id)a5
{
  uint64_t v6;
  void (**v8)(id, _QWORD);
  NSString *v9;
  NSString *clientName;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  void *v14;
  id v15;
  NSMutableDictionary *dataTypeStatus;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v6 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, a3);
  v8 = (void (**)(id, _QWORD))a5;
  if (-[ADAMServerDelegate verifyInvariantsWithReply:](self, "verifyInvariantsWithReply:", v8))
  {
    if (!self->_clientName)
    {
      v9 = (NSString *)objc_loadWeakRetained(&location);
      clientName = self->_clientName;
      self->_clientName = v9;

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKey:](self->_dataTypeStatus, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13 || (objc_msgSend(v13, "BOOLValue") & 1) == 0)
    {
      dataTypeStatus = self->_dataTypeStatus;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](dataTypeStatus, "setObject:forKey:", v17, v11);

      os_unfair_lock_unlock(&self->_lock);
      if (!v14)
        -[ADAMServerDelegate registerDelegate:](self, "registerDelegate:", v6);
LABEL_18:
      if (ADAM::ADAMLogScope(void)::once != -1)
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
      if (ADAM::ADAMLogScope(void)::scope)
      {
        v22 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v22)
        {
LABEL_27:
          v8[2](v8, 0);

          goto LABEL_28;
        }
      }
      else
      {
        v22 = (id)MEMORY[0x24BDACB70];
        v23 = MEMORY[0x24BDACB70];
      }
      v24 = v22;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = objc_loadWeakRetained(&location);
        +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v29 = "ADAMServerDelegate.mm";
        v30 = 1024;
        v31 = 85;
        v32 = 2112;
        v33 = v25;
        v34 = 2112;
        v35 = v26;
        _os_log_impl(&dword_216CFB000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d [start] recording for a new client: %@ with type: %@", buf, 0x26u);

      }
      goto LABEL_27;
    }
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15)
      {
LABEL_17:
        os_unfair_lock_unlock(p_lock);
        goto LABEL_18;
      }
    }
    else
    {
      v15 = (id)MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    v19 = v15;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_loadWeakRetained(&location);
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v29 = "ADAMServerDelegate.mm";
      v30 = 1024;
      v31 = 75;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_216CFB000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d client %@ is already listening to type: %@", buf, 0x26u);

    }
    goto LABEL_17;
  }
LABEL_28:

  objc_destroyWeak(&location);
}

- (void)stopListeningToAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 withReply:(id)a5
{
  uint64_t v5;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSString *clientName;
  id v15;
  __CFString *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v5 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD))a5;
  if (-[ADAMServerDelegate verifyInvariantsWithReply:](self, "verifyInvariantsWithReply:", v7))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKey:](self->_dataTypeStatus, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataTypeStatus, "setObject:forKeyedSubscript:", v10, v8);

    }
    os_unfair_lock_unlock(&self->_lock);
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v11 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v11)
      {
LABEL_18:
        v7[2](v7, 0);

        goto LABEL_19;
      }
    }
    else
    {
      v11 = (id)MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    v13 = v11;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      clientName = self->_clientName;
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v9, "stringValue");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = CFSTR("nil");
      }
      v17 = 136316162;
      v18 = "ADAMServerDelegate.mm";
      v19 = 1024;
      v20 = 104;
      v21 = 2112;
      v22 = clientName;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_216CFB000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d [stop] recording for client: %@ with dataType: %@, previous status: %@", (uint8_t *)&v17, 0x30u);
      if (v9)

    }
    goto LABEL_18;
  }
LABEL_19:

}

- (void)startMeasuringAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 withConfiguration:(id)a5 andReply:(id)a6
{
  uint64_t v8;
  id v10;
  void (**v11)(id, _QWORD);
  NSString *v12;
  NSString *clientName;
  NSMutableDictionary *configs;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  ADAM::AudioDataAnalysisManager *v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  NSString *v27;
  void *v28;
  void *v29;
  id v30;
  id location;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v8 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, a3);
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  if (-[ADAMServerDelegate verifyInvariantsWithReply:](self, "verifyInvariantsWithReply:", v11))
  {
    if (!self->_clientName)
    {
      v12 = (NSString *)objc_loadWeakRetained(&location);
      clientName = self->_clientName;
      self->_clientName = v12;

    }
    if (v10)
    {
      os_unfair_lock_lock(&self->_lock);
      configs = self->_configs;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v10, 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](configs, "setObject:forKey:", v15, v16);

      os_unfair_lock_unlock(&self->_lock);
    }
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v17 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v17)
        goto LABEL_15;
    }
    else
    {
      v17 = (id)MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    v19 = v17;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = self->_clientName;
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v33 = "ADAMServerDelegate.mm";
      v34 = 1024;
      v35 = 122;
      v36 = 2112;
      v37 = v20;
      v38 = 2112;
      v39 = v21;
      _os_log_impl(&dword_216CFB000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d [start] measuring audio sample for client: %@ with data type: %@", buf, 0x26u);

    }
LABEL_15:
    v22 = (ADAM::AudioDataAnalysisManager *)-[ADAMServerDelegate datatypeSupportsONOFF:](self, "datatypeSupportsONOFF:", v8);
    if ((v22 & 1) != 0)
    {
      ADAM::AudioDataAnalysisManager::instance(v22);
      if (ADAM::ADAMLogScope(void)::once != -1)
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
      if (ADAM::ADAMLogScope(void)::scope)
      {
        v23 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v23)
        {
LABEL_35:
          v11[2](v11, 0);
          goto LABEL_36;
        }
      }
      else
      {
        v23 = MEMORY[0x24BDACB70];
        v30 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "AudioDataAnalysisManager.cpp";
        v34 = 1024;
        v35 = 411;
        v36 = 1024;
        LODWORD(v37) = v8;
        _os_log_impl(&dword_216CFB000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d EAE type %u does not support enabling", buf, 0x18u);
      }

      goto LABEL_35;
    }
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v24 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v24)
      {
LABEL_30:
        -[ADAMServerDelegate describeErrorCode:](self, "describeErrorCode:", 560950886);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADAMServerDelegate errorWithCode:andReason:](self, "errorWithCode:andReason:", 560950886, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v11)[2](v11, v29);

        goto LABEL_36;
      }
    }
    else
    {
      v24 = (id)MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v8);
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v33 = "ADAMServerDelegate.mm";
      v34 = 1024;
      v35 = 125;
      v36 = 2112;
      v37 = v27;
      _os_log_impl(&dword_216CFB000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d datatype %@ cannot be turned ON", buf, 0x1Cu);

    }
    goto LABEL_30;
  }
LABEL_36:

  objc_destroyWeak(&location);
}

- (void)stopMeasuringAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 andReply:(id)a5
{
  uint64_t v5;
  void (**v7)(id, _QWORD);
  id v8;
  id v9;
  NSObject *v10;
  NSString *clientName;
  void *v12;
  ADAM::AudioDataAnalysisManager *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v5 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD))a5;
  if (-[ADAMServerDelegate verifyInvariantsWithReply:](self, "verifyInvariantsWithReply:", v7))
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v8 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      v8 = (id)MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    v10 = v8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      clientName = self->_clientName;
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136315906;
      v23 = "ADAMServerDelegate.mm";
      v24 = 1024;
      v25 = 140;
      v26 = 2112;
      v27 = clientName;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_216CFB000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d [stop] measuring audio sample for client: %@ with data type: %@", (uint8_t *)&v22, 0x26u);

    }
LABEL_11:
    v13 = (ADAM::AudioDataAnalysisManager *)-[ADAMServerDelegate datatypeSupportsONOFF:](self, "datatypeSupportsONOFF:", v5);
    if ((v13 & 1) != 0)
    {
      ADAM::AudioDataAnalysisManager::instance(v13);
      if (ADAM::ADAMLogScope(void)::once != -1)
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
      if (ADAM::ADAMLogScope(void)::scope)
      {
        v14 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v14)
        {
LABEL_31:
          v7[2](v7, 0);
          goto LABEL_32;
        }
      }
      else
      {
        v14 = MEMORY[0x24BDACB70];
        v21 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315650;
        v23 = "AudioDataAnalysisManager.cpp";
        v24 = 1024;
        v25 = 440;
        v26 = 1024;
        LODWORD(v27) = v5;
        _os_log_impl(&dword_216CFB000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d EAE type %u does not support disabling", (uint8_t *)&v22, 0x18u);
      }

      goto LABEL_31;
    }
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15)
      {
LABEL_26:
        -[ADAMServerDelegate describeErrorCode:](self, "describeErrorCode:", 560950886);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADAMServerDelegate errorWithCode:andReason:](self, "errorWithCode:andReason:", 560950886, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v7)[2](v7, v20);

        goto LABEL_32;
      }
    }
    else
    {
      v15 = (id)MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v5);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v22 = 136315650;
      v23 = "ADAMServerDelegate.mm";
      v24 = 1024;
      v25 = 143;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d datatype %@ cannot be turned OFF", (uint8_t *)&v22, 0x1Cu);

    }
    goto LABEL_26;
  }
LABEL_32:

}

- (void)configureAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 configuration:(id)a5 withReply:(id)a6
{
  uint64_t v8;
  id v10;
  void (**v11)(id, _QWORD);
  NSString *v12;
  NSString *clientName;
  ADAM::AudioDataAnalysisManager *v14;
  ADAM::AudioDataAnalysisManager *v15;
  id v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *configs;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void **v27;
  void **v28;
  void **v29;
  void **v30;
  void **v31;
  id v32;
  void *__p[2];
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v8 = *(_QWORD *)&a4;
  v43 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&v32, a3);
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  if (-[ADAMServerDelegate verifyInvariantsWithReply:](self, "verifyInvariantsWithReply:", v11))
  {
    if (!self->_clientName)
    {
      v12 = (NSString *)objc_loadWeakRetained(&v32);
      clientName = self->_clientName;
      self->_clientName = v12;

    }
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v14 = (ADAM::AudioDataAnalysisManager *)*(id *)ADAM::ADAMLogScope(void)::scope;
      v15 = v14;
      if (!v14)
        goto LABEL_13;
    }
    else
    {
      v15 = (ADAM::AudioDataAnalysisManager *)MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = self->_clientName;
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v36 = "ADAMServerDelegate.mm";
      v37 = 1024;
      v38 = 163;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v19;
      _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d [configure] audio sample for client: %@ with data type: %@", buf, 0x26u);

    }
LABEL_13:
    if (v10)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      configs = self->_configs;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v10, 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](configs, "setObject:forKey:", v22, v23);

      os_unfair_lock_unlock(p_lock);
    }
    ADAM::AudioDataAnalysisManager::instance(v14);
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v24 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v24)
      {
LABEL_40:
        v11[2](v11, 0);
        goto LABEL_41;
      }
    }
    else
    {
      v24 = (id)MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "____");
      if (v34 >= 0)
        v27 = __p;
      else
        v27 = (void **)__p[0];
      *((_BYTE *)v27 + 3) = v8;
      if (v34 >= 0)
        v28 = __p;
      else
        v28 = (void **)__p[0];
      *((_BYTE *)v28 + 2) = BYTE1(v8);
      if (v34 >= 0)
        v29 = __p;
      else
        v29 = (void **)__p[0];
      *((_BYTE *)v29 + 1) = BYTE2(v8);
      if (v34 >= 0)
        v30 = __p;
      else
        v30 = (void **)__p[0];
      *(_BYTE *)v30 = BYTE3(v8);
      if (v34 >= 0)
        v31 = __p;
      else
        v31 = (void **)__p[0];
      *(_DWORD *)buf = 136315650;
      v36 = "AudioDataAnalysisManager.cpp";
      v37 = 1024;
      v38 = 468;
      v39 = 2080;
      v40 = v31;
      _os_log_impl(&dword_216CFB000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d type %s does not support configuring inside ADAM", buf, 0x1Cu);
      if (v34 < 0)
        operator delete(__p[0]);
    }

    goto LABEL_40;
  }
LABEL_41:

  objc_destroyWeak(&v32);
}

- (void)setupConnection:(id)a3
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  objc_storeWeak((id *)&self->_connection, v4);

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__ADAMServerDelegate_setupConnection___block_invoke;
  v10[3] = &unk_24D6157F8;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "setInvalidationHandler:", v10);

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __38__ADAMServerDelegate_setupConnection___block_invoke_6;
  v8[3] = &unk_24D6157F8;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  v7 = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(v7, "setInterruptionHandler:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)sendAudioSample:(id)a3 withType:(unsigned int)a4 metadata:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[5];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (-[ADAMServerDelegate isActive:](self, "isActive:", v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__ADAMServerDelegate_sendAudioSample_withType_metadata___block_invoke;
    v12[3] = &unk_24D615820;
    v12[4] = self;
    objc_msgSend(WeakRetained, "remoteObjectProxyWithErrorHandler:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "receiveAudioSample:type:metadata:", v8, v6, v9);

  }
}

- (void)sendAudioSample:(id)a3
{
  id v4;
  NSMutableDictionary *configs;
  void *v6;
  void *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  if (-[ADAMServerDelegate isActive:](self, "isActive:", objc_msgSend(v4, "type")))
  {
    if (objc_msgSend(v4, "type") == 1751213428)
    {
      os_unfair_lock_lock(&self->_lock);
      configs = self->_configs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1751213428);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](configs, "objectForKey:", v6);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1751215219);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(&self->_lock);
      if (v9 && objc_msgSend(v9, "BOOLValue"))
      {
        objc_msgSend(v4, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("_ADAFMetadataKeyIsLoud"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (objc_msgSend(v11, "BOOLValue") & 1) == 0)
        {

          goto LABEL_10;
        }

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__ADAMServerDelegate_sendAudioSample___block_invoke;
    v12[3] = &unk_24D615820;
    v12[4] = self;
    objc_msgSend(WeakRetained, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "receiveAudioSample:", v4);
LABEL_10:

  }
}

- (void)getCurrentConfigurationForAudioSampleType:(unsigned int)a3 withReply:(id)a4
{
  ADAM::AudioDataAnalysisManager *v4;

  v4 = (ADAM::AudioDataAnalysisManager *)a4;
  ADAM::AudioDataAnalysisManager::instance(v4);
  (*((void (**)(ADAM::AudioDataAnalysisManager *, _QWORD))v4 + 2))(v4, 0);

}

- (void)isMeasurementOnForAudioSampleType:(unsigned int)a3 withReply:(id)a4
{
  uint64_t v4;
  ADAM::AudioDataAnalysisManager *v6;
  ADAM::AudioDataAnalysisManager *v7;
  void (**v8)(id, _QWORD);

  v4 = *(_QWORD *)&a3;
  v8 = (void (**)(id, _QWORD))a4;
  v6 = (ADAM::AudioDataAnalysisManager *)-[ADAMServerDelegate isActive:](self, "isActive:", v4);
  v7 = v6;
  if ((v6 & 1) == 0)
    ADAM::AudioDataAnalysisManager::instance(v6);
  ((void (**)(id, ADAM::AudioDataAnalysisManager *))v8)[2](v8, v7);

}

- (BOOL)isActive:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *dataTypeStatus;
  void *v7;
  void *v8;
  char v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataTypeStatus = self->_dataTypeStatus;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataTypeStatus, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v8)
    v9 = objc_msgSend(v8, "BOOLValue");
  else
    v9 = 0;

  return v9;
}

- (id)getClientName
{
  return self->_clientName;
}

- (void)deactivateAll
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_dataTypeStatus;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataTypeStatus, "setObject:forKeyedSubscript:", v9, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)registerDelegate:(unsigned int)a3
{
  ADAM::AudioDataAnalysisManager *inited;
  id v5;
  uint64_t v6;
  void *v7;
  std::mutex *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id location;

  inited = (ADAM::AudioDataAnalysisManager *)objc_initWeak(&v15, self);
  ADAM::AudioDataAnalysisManager::instance(inited);
  v5 = objc_loadWeakRetained(&v15);
  objc_initWeak(&location, v5);
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (std::mutex *)(qword_253D976D0 + 24);
  std::mutex::lock((std::mutex *)(qword_253D976D0 + 24));
  objc_msgSend(*(id *)(qword_253D976D0 + 16), "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(qword_253D976D0 + 16), "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(&location);
    objc_msgSend(v10, "addObject:", v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBCEB8];
    v13 = objc_loadWeakRetained(&location);
    objc_msgSend(v12, "arrayWithObject:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(qword_253D976D0 + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v10, v11);
  }

  std::mutex::unlock(v8);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v15);
}

- (void)unregisterDelegate
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  int v19;
  ADAM::AudioDataAnalysisManager *v20;
  char *v21;
  uint64_t v22;
  std::mutex *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  os_unfair_lock_s *lock;
  ADAMServerDelegate *val;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id location;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  val = self;
  v4 = self->_dataTypeStatus;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  lock = p_lock;
  v6 = 0;
  v7 = 0;
  if (v5)
  {
    v8 = 0;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v4);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "unsignedIntegerValue", lock, val, (_QWORD)v30);
        v12 = v11;
        if (v7 >= v8)
        {
          v13 = (v7 - v6) >> 2;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 62)
            std::vector<ADAMAudioDataAnalysisType>::__throw_length_error[abi:ne180100]();
          if ((v8 - v6) >> 1 > v14)
            v14 = (v8 - v6) >> 1;
          if ((unint64_t)(v8 - v6) >= 0x7FFFFFFFFFFFFFFCLL)
            v15 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v15 = v14;
          if (v15)
          {
            if (v15 >> 62)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v16 = (char *)operator new(4 * v15);
          }
          else
          {
            v16 = 0;
          }
          v17 = &v16[4 * v13];
          *(_DWORD *)v17 = v12;
          v18 = v17 + 4;
          while (v7 != v6)
          {
            v19 = *((_DWORD *)v7 - 1);
            v7 -= 4;
            *((_DWORD *)v17 - 1) = v19;
            v17 -= 4;
          }
          v8 = &v16[4 * v15];
          if (v6)
            operator delete(v6);
          v6 = v17;
          v7 = v18;
        }
        else
        {
          *(_DWORD *)v7 = v11;
          v7 += 4;
        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  if (v6 != v7)
  {
    v21 = v6;
    do
    {
      v22 = *(unsigned int *)v21;
      ADAM::AudioDataAnalysisManager::instance(v20);
      objc_initWeak(&location, val);
      v23 = (std::mutex *)(qword_253D976D0 + 24);
      std::mutex::lock((std::mutex *)(qword_253D976D0 + 24));
      v24 = *(void **)(qword_253D976D0 + 16);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_loadWeakRetained(&location);
      objc_msgSend(v26, "removeObject:", v27);

      std::mutex::unlock(v23);
      objc_destroyWeak(&location);
      v21 += 4;
    }
    while (v21 != v7);
  }
  if (v6)
    operator delete(v6);
}

- (BOOL)datatypeSupportsONOFF:(unsigned int)a3
{
  return a3 == 1702260324;
}

- (id)DatatypeTo4CC:(unsigned int)a3
{
  _BYTE v4[5];

  v4[4] = 0;
  v4[2] = BYTE1(a3);
  v4[3] = a3;
  v4[1] = BYTE2(a3);
  v4[0] = HIBYTE(a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)errorWithCode:(int64_t)a3 andReason:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("AudioDataAnalysisManager(ADAM)"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)verifyInvariantsWithReply:(id)a3
{
  void (**v4)(id, void *);
  int64_t error_code;
  void *v6;
  void *v7;
  BOOL v8;
  id WeakRetained;

  v4 = (void (**)(id, void *))a3;
  error_code = self->_error_code;
  if (error_code)
  {
    -[ADAMServerDelegate describeErrorCode:](self, "describeErrorCode:", self->_error_code);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADAMServerDelegate errorWithCode:andReason:](self, "errorWithCode:andReason:", error_code, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

    if (WeakRetained)
    {
      v8 = 1;
      goto LABEL_6;
    }
    -[ADAMServerDelegate describeErrorCode:](self, "describeErrorCode:", 560164457);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADAMServerDelegate errorWithCode:andReason:](self, "errorWithCode:andReason:", 560164457, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);
  }

  v8 = 0;
LABEL_6:

  return v8;
}

- (id)describeErrorCode:(int64_t)a3
{
  if (a3 <= 560295539)
  {
    if (!a3)
      return CFSTR("No Error");
    if (a3 == 560164457)
      return CFSTR("Invalid connection");
  }
  else
  {
    switch(a3)
    {
      case 560295540:
        return CFSTR("Missing Entitlements");
      case 560950886:
        return CFSTR("data type does not support on/off");
      case 1969974894:
        return CFSTR("Unknown Client");
    }
  }
  return CFSTR("Unknown Error");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configs, 0);
  objc_storeStrong((id *)&self->_dataTypeStatus, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_destroyWeak((id *)&self->_connection);
}

void __38__ADAMServerDelegate_sendAudioSample___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v4 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = 136315906;
    v8 = "ADAMServerDelegate.mm";
    v9 = 1024;
    v10 = 226;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_216CFB000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d connection to %@ failed: %@", (uint8_t *)&v7, 0x26u);
  }

LABEL_10:
}

void __56__ADAMServerDelegate_sendAudioSample_withType_metadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v4 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = 136315906;
    v8 = "ADAMServerDelegate.mm";
    v9 = 1024;
    v10 = 199;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_216CFB000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d connection to %@ failed: %@", (uint8_t *)&v7, 0x26u);
  }

LABEL_10:
}

void __38__ADAMServerDelegate_setupConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v2 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v2)
      goto LABEL_10;
  }
  else
  {
    v2 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v8 = 136315650;
    v9 = "ADAMServerDelegate.mm";
    v10 = 1024;
    v11 = 183;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_216CFB000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d client connection invalidated: %@", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deactivateAll");

  v7 = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "unregisterDelegate");

}

void __38__ADAMServerDelegate_setupConnection___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v2 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v2)
      goto LABEL_10;
  }
  else
  {
    v2 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v8 = 136315650;
    v9 = "ADAMServerDelegate.mm";
    v10 = 1024;
    v11 = 189;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_216CFB000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d client connection interrupted: %@", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deactivateAll");

  v7 = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "unregisterDelegate");

}

@end
