@implementation STTimeAllowancesViewModel

- (STTimeAllowancesViewModel)init
{
  STTimeAllowancesViewModel *v2;
  STTimeAllowancesViewModel *v3;
  NSDictionary *allowancesByIdentifier;
  NSDictionary *v5;
  NSDictionary *pendingAskForTimeByIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STTimeAllowancesViewModel;
  v2 = -[STTimeAllowancesViewModel init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    allowancesByIdentifier = v2->_allowancesByIdentifier;
    v5 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    v2->_allowancesByIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

    pendingAskForTimeByIdentifier = v3->_pendingAskForTimeByIdentifier;
    v3->_pendingAskForTimeByIdentifier = v5;

  }
  return v3;
}

- (BOOL)allAllowancesEnabled
{
  return self->_allAllowancesEnabled;
}

- (void)setAllAllowancesEnabled:(BOOL)a3
{
  self->_allAllowancesEnabled = a3;
}

- (STDeviceBedtime)bedtime
{
  return self->_bedtime;
}

- (void)setBedtime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)allowancesByIdentifier
{
  return self->_allowancesByIdentifier;
}

- (void)setAllowancesByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (STAlwaysAllowList)alwaysAllowList
{
  return self->_alwaysAllowList;
}

- (void)setAlwaysAllowList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)pendingAskForTimeByIdentifier
{
  return self->_pendingAskForTimeByIdentifier;
}

- (void)setPendingAskForTimeByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAskForTimeByIdentifier, 0);
  objc_storeStrong((id *)&self->_alwaysAllowList, 0);
  objc_storeStrong((id *)&self->_allowancesByIdentifier, 0);
  objc_storeStrong((id *)&self->_bedtime, 0);
}

@end
