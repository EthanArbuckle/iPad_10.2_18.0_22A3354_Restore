@implementation SASProximityMigrationTransferPreparationAction

+ (unint64_t)actionID
{
  return 9;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3;
  SASProximityMigrationTransferPreparationAction *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(SASProximityMigrationTransferPreparationAction);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SASProximityMigrationTransferPreparationAction setDeviceName:](v4, "setDeviceName:", v5);
  return v4;
}

- (id)requestPayload
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[SASProximityMigrationTransferPreparationAction deviceName](self, "deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v7 = CFSTR("deviceName");
  -[SASProximityMigrationTransferPreparationAction deviceName](self, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasResponse
{
  return 1;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
