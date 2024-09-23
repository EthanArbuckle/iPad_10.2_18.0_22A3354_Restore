@implementation SUSettingsStatefulUIManagerFSMParam

- (SUSettingsStatefulUIManagerFSMParam)initWithRetriesCount:(unsigned __int8)a3
{
  SUSettingsStatefulUIManagerFSMParam *v4;
  SUSettingsStatefulUIManagerFSMParam *v5;
  objc_super v6;
  unsigned __int8 v7;
  SEL v8;
  SUSettingsStatefulUIManagerFSMParam *v9;

  v8 = a2;
  v7 = a3;
  v9 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSettingsStatefulUIManagerFSMParam;
  v5 = -[SUSettingsStatefulUIManagerFSMParam init](&v6, sel_init);
  v9 = v5;
  objc_storeStrong((id *)&v9, v5);
  if (v5)
    -[SUSettingsStatefulUIManagerFSMParam setRetries:](v9, "setRetries:", v7);
  v4 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v4;
}

- (SUSettingsScanResults)refreshScanResults
{
  return self->_refreshScanResults;
}

- (void)setRefreshScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_refreshScanResults, a3);
}

- (SUSettingsFullScanResults)fullScanResults
{
  return self->_fullScanResults;
}

- (void)setFullScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_fullScanResults, a3);
}

- (unint64_t)refreshPreviousState
{
  return self->_refreshPreviousState;
}

- (void)setRefreshPreviousState:(unint64_t)a3
{
  self->_refreshPreviousState = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unsigned)retries
{
  return self->_retries;
}

- (void)setRetries:(unsigned __int8)a3
{
  self->_retries = a3;
}

- (BOOL)refreshHasAnyChanges
{
  return self->_refreshHasAnyChanges;
}

- (void)setRefreshHasAnyChanges:(BOOL)a3
{
  self->_refreshHasAnyChanges = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fullScanResults, 0);
  objc_storeStrong((id *)&self->_refreshScanResults, 0);
}

@end
