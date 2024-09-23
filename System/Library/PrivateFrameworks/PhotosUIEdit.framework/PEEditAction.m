@implementation PEEditAction

- (BOOL)forceRunAsUnadjustedAsset
{
  return 0;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (PEEditActionAnalyticsEventBuilderDelegate)analyticsEventBuilderDelegate
{
  return (PEEditActionAnalyticsEventBuilderDelegate *)objc_loadWeakRetained((id *)&self->_analyticsEventBuilderDelegate);
}

- (void)setAnalyticsEventBuilderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsEventBuilderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsEventBuilderDelegate);
}

- (id)analyticsPayload
{
  return (id)MEMORY[0x24BDBD1B8];
}

@end
