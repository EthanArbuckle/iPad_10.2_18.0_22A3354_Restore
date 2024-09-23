@implementation ADAMSRSensorWriter

- (ADAMSRSensorWriter)initWithSensorType:(int)a3 bundleIdentifier:(id)a4
{
  id v4;
  id v7;
  ADAMSRSensorWriter *v8;
  uint64_t v9;
  SRSensorWriter *writer;
  SRSensorWriter *v11;
  id v12;
  NSObject *v13;
  id v14;
  unsigned __int8 v15;
  NSObject *v16;
  SRSensorWriter *v17;
  _QWORD v19[4];
  ADAMSRSensorWriter *v20;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  ADAMSRSensorWriter *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ADAMSRSensorWriter;
  v8 = -[ADAMSRSensorWriter init](&v22, sel_init);
  if (!v8)
    goto LABEL_21;
  if (a3 <= 5)
    v4 = **((id **)&unk_24D616648 + a3);
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:](ADAMSensorKitWriterFactory, "GetSensorKitWriterWithIdentifier:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  writer = v8->_writer;
  v8->_writer = (SRSensorWriter *)v9;

  v11 = v8->_writer;
  v12 = v4;
  if (!v11)
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v13 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v13)
        goto LABEL_14;
    }
    else
    {
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "ADAMSensorKitWriterFactory.mm";
      v25 = 1024;
      v26 = 22;
      v27 = 2112;
      *(_QWORD *)v28 = v12;
      _os_log_impl(&dword_216CFB000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to create SRWriter for %@", buf, 0x1Cu);
    }

  }
LABEL_14:

  if (a3 > 2)
  {
    v17 = v8->_writer;
    if (v17)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __58__ADAMSRSensorWriter_initWithSensorType_bundleIdentifier___block_invoke;
      v19[3] = &unk_24D616628;
      v20 = v8;
      v21 = v7;
      -[SRSensorWriter bundleEligibility:completion:](v17, "bundleEligibility:completion:", v21, v19);

    }
  }
  else
  {
    v8->_isBundleIdentifierEligible = 1;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v16 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "ADAMSRSensorWriter.mm";
      v25 = 1024;
      v26 = 64;
      v27 = 1040;
      *(_DWORD *)v28 = 18;
      *(_WORD *)&v28[4] = 2080;
      *(_QWORD *)&v28[6] = "ADAMSRSensorWriter]";
      v29 = 2048;
      v30 = v8;
      _os_log_impl(&dword_216CFB000, v16, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] No bundle identifier check for Siri use case", buf, 0x2Cu);
    }
  }

LABEL_21:
  return v8;
}

- (BOOL)isValidSRSensorWriterPresent
{
  return self->_writer != 0;
}

- (BOOL)isMonitoring
{
  SRSensorWriter *writer;

  writer = self->_writer;
  if (writer)
    LOBYTE(writer) = -[SRSensorWriter isMonitoring](writer, "isMonitoring");
  return (char)writer;
}

- (BOOL)provideSample:(id)a3 error:(id *)a4
{
  id v6;
  SRSensorWriter *writer;
  char v8;

  v6 = a3;
  writer = self->_writer;
  if (writer)
    v8 = -[SRSensorWriter provideSample:error:](writer, "provideSample:error:", v6, a4);
  else
    v8 = 0;

  return v8;
}

- (BOOL)provideSample:(id)a3 continuousTimestamp:(unint64_t)a4 error:(id *)a5
{
  id v8;
  SRSensorWriter *writer;
  char v10;

  v8 = a3;
  writer = self->_writer;
  if (writer)
    v10 = -[SRSensorWriter provideSample:continuousTimestamp:error:](writer, "provideSample:continuousTimestamp:error:", v8, a4, a5);
  else
    v10 = 0;

  return v10;
}

- (BOOL)isBundleIdentifierEligible
{
  return self->_isBundleIdentifierEligible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
}

void __58__ADAMSRSensorWriter_initWithSensorType_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (a2 != 1 || v5)
  {
    *(_BYTE *)(v7 + 18) = 0;
    if (!a2)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v13 = ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(void **)(a1 + 40);
        v20 = 136316418;
        v21 = "ADAMSRSensorWriter.mm";
        v22 = 1024;
        v23 = 81;
        v24 = 1040;
        v25 = 18;
        v26 = 2080;
        v27 = "ADAMSRSensorWriter]";
        v28 = 2048;
        v29 = v14;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_216CFB000, v13, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] Bundle identifier %@ is not eligible", (uint8_t *)&v20, 0x36u);
      }
    }
    if (v6)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v17 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "debugDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 136316418;
        v21 = "ADAMSRSensorWriter.mm";
        v22 = 1024;
        v23 = 86;
        v24 = 1040;
        v25 = 18;
        v26 = 2080;
        v27 = "ADAMSRSensorWriter]";
        v28 = 2048;
        v29 = v18;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] Error getting bundle identifier eligibility from SensorKit: %@", (uint8_t *)&v20, 0x36u);

      }
    }
  }
  else
  {
    *(_BYTE *)(v7 + 18) = 1;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v9 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v20 = 136316418;
      v21 = "ADAMSRSensorWriter.mm";
      v22 = 1024;
      v23 = 74;
      v24 = 1040;
      v25 = 18;
      v26 = 2080;
      v27 = "ADAMSRSensorWriter]";
      v28 = 2048;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_216CFB000, v9, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] Bundle identifier %@ is eligible", (uint8_t *)&v20, 0x36u);
    }
  }

}

@end
