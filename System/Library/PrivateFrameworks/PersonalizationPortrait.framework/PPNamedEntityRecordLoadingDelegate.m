@implementation PPNamedEntityRecordLoadingDelegate

- (PPNamedEntityRecordLoadingDelegate)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPNamedEntityRecordLoadingDelegate;
  return -[PPRecordLoadingDelegate initWithName:](&v4, sel_initWithName_, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityRecordLoadingDelegate;
  -[PPRecordLoadingDelegate description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)recordLoadingSetup
{
  uint64_t (**namedEntityRecordsSetup)(void);

  namedEntityRecordsSetup = (uint64_t (**)(void))self->_namedEntityRecordsSetup;
  if (namedEntityRecordsSetup)
    LOBYTE(namedEntityRecordsSetup) = namedEntityRecordsSetup[2]();
  return namedEntityRecordsSetup;
}

- (unsigned)recordLoadingHandler:(id)a3
{
  uint64_t (**namedEntityRecordsHandler)(id, id);

  namedEntityRecordsHandler = (uint64_t (**)(id, id))self->_namedEntityRecordsHandler;
  if (namedEntityRecordsHandler)
    LOBYTE(namedEntityRecordsHandler) = namedEntityRecordsHandler[2](namedEntityRecordsHandler, a3);
  return namedEntityRecordsHandler;
}

- (void)recordLoadingCompletion
{
  void (**namedEntityRecordsCompletion)(void);

  namedEntityRecordsCompletion = (void (**)(void))self->_namedEntityRecordsCompletion;
  if (namedEntityRecordsCompletion)
    namedEntityRecordsCompletion[2]();
}

- (unsigned)recentRecordLoadingSetup
{
  uint64_t (**recentNamedEntityRecordsSetup)(void);

  recentNamedEntityRecordsSetup = (uint64_t (**)(void))self->_recentNamedEntityRecordsSetup;
  if (recentNamedEntityRecordsSetup)
    LOBYTE(recentNamedEntityRecordsSetup) = recentNamedEntityRecordsSetup[2]();
  return recentNamedEntityRecordsSetup;
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  uint64_t (**recentNamedEntityRecordsHandler)(id, id);

  recentNamedEntityRecordsHandler = (uint64_t (**)(id, id))self->_recentNamedEntityRecordsHandler;
  if (recentNamedEntityRecordsHandler)
    LOBYTE(recentNamedEntityRecordsHandler) = recentNamedEntityRecordsHandler[2](recentNamedEntityRecordsHandler, a3);
  return recentNamedEntityRecordsHandler;
}

- (void)recentRecordLoadingCompletion
{
  void (**recentNamedEntityRecordsCompletion)(void);

  recentNamedEntityRecordsCompletion = (void (**)(void))self->_recentNamedEntityRecordsCompletion;
  if (recentNamedEntityRecordsCompletion)
    recentNamedEntityRecordsCompletion[2]();
}

- (void)resetRecordData
{
  void (**resetNamedEntityRecordData)(void);

  resetNamedEntityRecordData = (void (**)(void))self->_resetNamedEntityRecordData;
  if (resetNamedEntityRecordData)
    resetNamedEntityRecordData[2]();
}

- (id)namedEntityRecordsSetup
{
  return self->_namedEntityRecordsSetup;
}

- (void)setNamedEntityRecordsSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)namedEntityRecordsHandler
{
  return self->_namedEntityRecordsHandler;
}

- (void)setNamedEntityRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)namedEntityRecordsCompletion
{
  return self->_namedEntityRecordsCompletion;
}

- (void)setNamedEntityRecordsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)recentNamedEntityRecordsSetup
{
  return self->_recentNamedEntityRecordsSetup;
}

- (void)setRecentNamedEntityRecordsSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)recentNamedEntityRecordsHandler
{
  return self->_recentNamedEntityRecordsHandler;
}

- (void)setRecentNamedEntityRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)recentNamedEntityRecordsCompletion
{
  return self->_recentNamedEntityRecordsCompletion;
}

- (void)setRecentNamedEntityRecordsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)resetNamedEntityRecordData
{
  return self->_resetNamedEntityRecordData;
}

- (void)setResetNamedEntityRecordData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetNamedEntityRecordData, 0);
  objc_storeStrong(&self->_recentNamedEntityRecordsCompletion, 0);
  objc_storeStrong(&self->_recentNamedEntityRecordsHandler, 0);
  objc_storeStrong(&self->_recentNamedEntityRecordsSetup, 0);
  objc_storeStrong(&self->_namedEntityRecordsCompletion, 0);
  objc_storeStrong(&self->_namedEntityRecordsHandler, 0);
  objc_storeStrong(&self->_namedEntityRecordsSetup, 0);
}

@end
