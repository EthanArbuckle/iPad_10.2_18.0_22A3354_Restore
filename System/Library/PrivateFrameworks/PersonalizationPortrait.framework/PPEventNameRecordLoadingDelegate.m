@implementation PPEventNameRecordLoadingDelegate

- (PPEventNameRecordLoadingDelegate)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPEventNameRecordLoadingDelegate;
  return -[PPRecordLoadingDelegate initWithName:](&v4, sel_initWithName_, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPEventNameRecordLoadingDelegate;
  -[PPRecordLoadingDelegate description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)recordLoadingSetup
{
  uint64_t (**eventNameRecordsSetup)(void);

  eventNameRecordsSetup = (uint64_t (**)(void))self->_eventNameRecordsSetup;
  if (eventNameRecordsSetup)
    LOBYTE(eventNameRecordsSetup) = eventNameRecordsSetup[2]();
  return eventNameRecordsSetup;
}

- (unsigned)recordLoadingHandler:(id)a3
{
  uint64_t (**eventNameRecordsHandler)(id, id);

  eventNameRecordsHandler = (uint64_t (**)(id, id))self->_eventNameRecordsHandler;
  if (eventNameRecordsHandler)
    LOBYTE(eventNameRecordsHandler) = eventNameRecordsHandler[2](eventNameRecordsHandler, a3);
  return eventNameRecordsHandler;
}

- (void)recordLoadingCompletion
{
  void (**eventNameRecordsCompletion)(void);

  eventNameRecordsCompletion = (void (**)(void))self->_eventNameRecordsCompletion;
  if (eventNameRecordsCompletion)
    eventNameRecordsCompletion[2]();
}

- (unsigned)recentRecordLoadingSetup
{
  uint64_t (**recentEventNameRecordsSetup)(void);

  recentEventNameRecordsSetup = (uint64_t (**)(void))self->_recentEventNameRecordsSetup;
  if (recentEventNameRecordsSetup)
    LOBYTE(recentEventNameRecordsSetup) = recentEventNameRecordsSetup[2]();
  return recentEventNameRecordsSetup;
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  uint64_t (**recentEventNameRecordsHandler)(id, id);

  recentEventNameRecordsHandler = (uint64_t (**)(id, id))self->_recentEventNameRecordsHandler;
  if (recentEventNameRecordsHandler)
    LOBYTE(recentEventNameRecordsHandler) = recentEventNameRecordsHandler[2](recentEventNameRecordsHandler, a3);
  return recentEventNameRecordsHandler;
}

- (void)recentRecordLoadingCompletion
{
  void (**recentEventNameRecordsCompletion)(void);

  recentEventNameRecordsCompletion = (void (**)(void))self->_recentEventNameRecordsCompletion;
  if (recentEventNameRecordsCompletion)
    recentEventNameRecordsCompletion[2]();
}

- (void)resetRecordData
{
  void (**resetEventNameRecordData)(void);

  resetEventNameRecordData = (void (**)(void))self->_resetEventNameRecordData;
  if (resetEventNameRecordData)
    resetEventNameRecordData[2]();
}

- (id)eventNameRecordsSetup
{
  return self->_eventNameRecordsSetup;
}

- (void)setEventNameRecordsSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)eventNameRecordsHandler
{
  return self->_eventNameRecordsHandler;
}

- (void)setEventNameRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)eventNameRecordsCompletion
{
  return self->_eventNameRecordsCompletion;
}

- (void)setEventNameRecordsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)recentEventNameRecordsSetup
{
  return self->_recentEventNameRecordsSetup;
}

- (void)setRecentEventNameRecordsSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)recentEventNameRecordsHandler
{
  return self->_recentEventNameRecordsHandler;
}

- (void)setRecentEventNameRecordsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)recentEventNameRecordsCompletion
{
  return self->_recentEventNameRecordsCompletion;
}

- (void)setRecentEventNameRecordsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)resetEventNameRecordData
{
  return self->_resetEventNameRecordData;
}

- (void)setResetEventNameRecordData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetEventNameRecordData, 0);
  objc_storeStrong(&self->_recentEventNameRecordsCompletion, 0);
  objc_storeStrong(&self->_recentEventNameRecordsHandler, 0);
  objc_storeStrong(&self->_recentEventNameRecordsSetup, 0);
  objc_storeStrong(&self->_eventNameRecordsCompletion, 0);
  objc_storeStrong(&self->_eventNameRecordsHandler, 0);
  objc_storeStrong(&self->_eventNameRecordsSetup, 0);
}

@end
