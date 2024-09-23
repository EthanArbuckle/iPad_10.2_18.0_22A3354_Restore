@implementation VSAppSettingsViewModelResult

- (VSAppSettingsViewModelResult)init
{
  VSAppSettingsViewModelResult *v2;
  VSAppSettingsViewModelResult *v3;
  NSArray *availableAppViewModels;
  NSArray *v5;
  NSArray *nonChannelAppViewModels;
  NSArray *subscribedAppViewModels;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VSAppSettingsViewModelResult;
  v2 = -[VSAppSettingsViewModelResult init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    availableAppViewModels = v2->_availableAppViewModels;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_availableAppViewModels = (NSArray *)MEMORY[0x24BDBD1A8];

    nonChannelAppViewModels = v3->_nonChannelAppViewModels;
    v3->_nonChannelAppViewModels = v5;

    subscribedAppViewModels = v3->_subscribedAppViewModels;
    v3->_subscribedAppViewModels = v5;

  }
  return v3;
}

- (NSArray)availableAppViewModels
{
  return self->_availableAppViewModels;
}

- (void)setAvailableAppViewModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)nonChannelAppViewModels
{
  return self->_nonChannelAppViewModels;
}

- (void)setNonChannelAppViewModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)subscribedAppViewModels
{
  return self->_subscribedAppViewModels;
}

- (void)setSubscribedAppViewModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedAppViewModels, 0);
  objc_storeStrong((id *)&self->_nonChannelAppViewModels, 0);
  objc_storeStrong((id *)&self->_availableAppViewModels, 0);
}

@end
