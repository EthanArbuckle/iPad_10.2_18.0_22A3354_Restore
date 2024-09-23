@implementation ADAMSensorKitWriterFactory

+ (id)GetSensorKitWriterWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!objc_opt_class())
    goto LABEL_12;
  if (+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::once != -1)
    dispatch_once(&+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::once, &__block_literal_global_395);
  if (+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict)
  {
    objc_msgSend((id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend((id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict, "objectForKey:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if (v7)
      {
        v8 = (void *)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict;
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9700]), "initWithIdentifier:", v3);
        objc_msgSend(v8, "setObject:forKey:", v9, v3);

        if (ADAM::ADAMLogScope(void)::once != -1)
          dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
        if (ADAM::ADAMLogScope(void)::scope)
        {
          v10 = *(id *)ADAM::ADAMLogScope(void)::scope;
          if (!v10)
            goto LABEL_17;
        }
        else
        {
          v10 = (id)MEMORY[0x24BDACB70];
          v11 = MEMORY[0x24BDACB70];
        }
        v12 = v10;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict, "objectForKey:", v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 136315906;
          v16 = "ADAMSensorKitWriterFactory.mm";
          v17 = 1024;
          v18 = 60;
          v19 = 2112;
          v20 = v13;
          v21 = 2112;
          v22 = v3;
          _os_log_impl(&dword_216CFB000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created SRSensorWriter: [%@] for identifier: [%@]", (uint8_t *)&v15, 0x26u);

        }
      }
LABEL_17:
      objc_msgSend((id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict, "objectForKey:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_12:
    v4 = 0;
  }

  return v4;
}

+ (BOOL)IsMonitoringSiri
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (!objc_opt_class())
    return 0;
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:](ADAMSensorKitWriterFactory, "GetSensorKitWriterWithIdentifier:", *MEMORY[0x24BDE9738]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:](ADAMSensorKitWriterFactory, "GetSensorKitWriterWithIdentifier:", *MEMORY[0x24BDE9730]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:](ADAMSensorKitWriterFactory, "GetSensorKitWriterWithIdentifier:", *MEMORY[0x24BDE9728]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isMonitoring") & 1) != 0 || (objc_msgSend(v3, "isMonitoring") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isMonitoring");

  return v5;
}

+ (BOOL)IsMonitoringTelephony
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (!objc_opt_class())
    return 0;
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:](ADAMSensorKitWriterFactory, "GetSensorKitWriterWithIdentifier:", *MEMORY[0x24BDE9750]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:](ADAMSensorKitWriterFactory, "GetSensorKitWriterWithIdentifier:", *MEMORY[0x24BDE9748]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:](ADAMSensorKitWriterFactory, "GetSensorKitWriterWithIdentifier:", *MEMORY[0x24BDE9740]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isMonitoring") & 1) != 0 || (objc_msgSend(v3, "isMonitoring") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isMonitoring");

  return v5;
}

void __63__ADAMSensorKitWriterFactory_GetSensorKitWriterWithIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x24BDE9750], v1, *MEMORY[0x24BDE9748], v2, *MEMORY[0x24BDE9740], v3, *MEMORY[0x24BDE9738], v4, *MEMORY[0x24BDE9730], v5, *MEMORY[0x24BDE9728], 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict;
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict = v6;

}

@end
