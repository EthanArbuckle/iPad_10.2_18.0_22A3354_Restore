@implementation RCConfigurationFetchResult

- (RCConfigurationFetchResult)initWithTaskIdentifier:(id)a3 configurationDataByRequestKey:(id)a4 treatmentIDs:(id)a5 segmentSetIDs:(id)a6 error:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RCConfigurationFetchResult *v17;
  id v19;
  objc_super v20;

  v13 = a3;
  v19 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RCConfigurationFetchResult;
  v17 = -[RCConfigurationFetchResult init](&v20, sel_init);
  if (v17)
  {
    if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[RCConfigurationFetchResult initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:].cold.1();
    objc_storeStrong((id *)&v17->_taskIdentifier, a3);
    objc_storeStrong((id *)&v17->_configurationDataByRequestKey, a4);
    objc_storeStrong((id *)&v17->_treatmentIDs, a5);
    objc_storeStrong((id *)&v17->_segmentSetIDs, a6);
    objc_storeStrong((id *)&v17->_error, a7);
  }

  return v17;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_taskIdentifier, a3);
}

- (NSDictionary)configurationDataByRequestKey
{
  return self->_configurationDataByRequestKey;
}

- (void)setConfigurationDataByRequestKey:(id)a3
{
  objc_storeStrong((id *)&self->_configurationDataByRequestKey, a3);
}

- (NSArray)treatmentIDs
{
  return self->_treatmentIDs;
}

- (void)setTreatmentIDs:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentIDs, a3);
}

- (NSArray)segmentSetIDs
{
  return self->_segmentSetIDs;
}

- (void)setSegmentSetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_segmentSetIDs, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_configurationDataByRequestKey, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (void)initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:.cold.1()
{
  void *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "taskIdentifier");
  *(_DWORD *)buf = 136315906;
  v2 = "-[RCConfigurationFetchResult initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCConfigurationFetchResult.m";
  v5 = 1024;
  v6 = 33;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

}

@end
