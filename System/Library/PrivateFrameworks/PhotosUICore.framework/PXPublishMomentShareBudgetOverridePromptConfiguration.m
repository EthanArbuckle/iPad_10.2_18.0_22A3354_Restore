@implementation PXPublishMomentShareBudgetOverridePromptConfiguration

- (PXPublishMomentShareBudgetOverridePromptConfiguration)initWithUseWLAN:(BOOL)a3 networkType:(unint64_t)a4 assetCount:(unint64_t)a5 deviceModel:(id)a6
{
  id v10;
  PXPublishMomentShareBudgetOverridePromptConfiguration *v11;
  PXPublishMomentShareBudgetOverridePromptConfiguration *v12;
  uint64_t v13;
  NSString *deviceModel;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PXPublishMomentShareBudgetOverridePromptConfiguration;
  v11 = -[PXPublishMomentShareBudgetOverridePromptConfiguration init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_useWLAN = a3;
    v11->_networkType = a4;
    v11->_assetCount = a5;
    v13 = objc_msgSend(v10, "copy");
    deviceModel = v12->_deviceModel;
    v12->_deviceModel = (NSString *)v13;

  }
  return v12;
}

- (BOOL)useWLAN
{
  return self->_useWLAN;
}

- (void)setUseWLAN:(BOOL)a3
{
  self->_useWLAN = a3;
}

- (unint64_t)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(unint64_t)a3
{
  self->_networkType = a3;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
