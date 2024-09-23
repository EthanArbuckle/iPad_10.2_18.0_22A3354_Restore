@implementation PPContactNameRecordLoadingDelegate

- (PPContactNameRecordLoadingDelegate)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPContactNameRecordLoadingDelegate;
  return -[PPRecordLoadingDelegate initWithName:](&v4, sel_initWithName_, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPContactNameRecordLoadingDelegate;
  -[PPRecordLoadingDelegate description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)recordLoadingSetup
{
  uint64_t (**contactNameRecordsSetup)(void);

  contactNameRecordsSetup = (uint64_t (**)(void))self->_contactNameRecordsSetup;
  if (contactNameRecordsSetup)
    LOBYTE(contactNameRecordsSetup) = contactNameRecordsSetup[2]();
  return contactNameRecordsSetup;
}

- (unsigned)recordLoadingHandler:(id)a3
{
  uint64_t (**contactNameRecordsHandler)(id, id);

  contactNameRecordsHandler = (uint64_t (**)(id, id))self->_contactNameRecordsHandler;
  if (contactNameRecordsHandler)
    LOBYTE(contactNameRecordsHandler) = contactNameRecordsHandler[2](contactNameRecordsHandler, a3);
  return contactNameRecordsHandler;
}

- (void)recordLoadingCompletion
{
  void (**contactNameRecordsCompletion)(void);

  contactNameRecordsCompletion = (void (**)(void))self->_contactNameRecordsCompletion;
  if (contactNameRecordsCompletion)
    contactNameRecordsCompletion[2]();
}

- (unsigned)recentRecordLoadingSetup
{
  uint64_t (**recentContactNameRecordsSetup)(void);

  recentContactNameRecordsSetup = (uint64_t (**)(void))self->_recentContactNameRecordsSetup;
  if (recentContactNameRecordsSetup)
    LOBYTE(recentContactNameRecordsSetup) = recentContactNameRecordsSetup[2]();
  return recentContactNameRecordsSetup;
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  uint64_t (**recentContactNameRecordsHandler)(id, id);

  recentContactNameRecordsHandler = (uint64_t (**)(id, id))self->_recentContactNameRecordsHandler;
  if (recentContactNameRecordsHandler)
    LOBYTE(recentContactNameRecordsHandler) = recentContactNameRecordsHandler[2](recentContactNameRecordsHandler, a3);
  return recentContactNameRecordsHandler;
}

- (void)recentRecordLoadingCompletion
{
  void (**recentContactNameRecordsCompletion)(void);

  recentContactNameRecordsCompletion = (void (**)(void))self->_recentContactNameRecordsCompletion;
  if (recentContactNameRecordsCompletion)
    recentContactNameRecordsCompletion[2]();
}

- (void)resetRecordData
{
  void (**resetContactNameRecordData)(void);

  resetContactNameRecordData = (void (**)(void))self->_resetContactNameRecordData;
  if (resetContactNameRecordData)
    resetContactNameRecordData[2]();
}

- (id)contactNameRecordsSetup
{
  return self->_contactNameRecordsSetup;
}

- (void)setContactNameRecordsSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)contactNameRecordsHandler
{
  return self->_contactNameRecordsHandler;
}

- (void)setContactNameRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)contactNameRecordsCompletion
{
  return self->_contactNameRecordsCompletion;
}

- (void)setContactNameRecordsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)recentContactNameRecordsSetup
{
  return self->_recentContactNameRecordsSetup;
}

- (void)setRecentContactNameRecordsSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)recentContactNameRecordsHandler
{
  return self->_recentContactNameRecordsHandler;
}

- (void)setRecentContactNameRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)recentContactNameRecordsCompletion
{
  return self->_recentContactNameRecordsCompletion;
}

- (void)setRecentContactNameRecordsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)resetContactNameRecordData
{
  return self->_resetContactNameRecordData;
}

- (void)setResetContactNameRecordData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetContactNameRecordData, 0);
  objc_storeStrong(&self->_recentContactNameRecordsCompletion, 0);
  objc_storeStrong(&self->_recentContactNameRecordsHandler, 0);
  objc_storeStrong(&self->_recentContactNameRecordsSetup, 0);
  objc_storeStrong(&self->_contactNameRecordsCompletion, 0);
  objc_storeStrong(&self->_contactNameRecordsHandler, 0);
  objc_storeStrong(&self->_contactNameRecordsSetup, 0);
}

@end
