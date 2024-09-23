@implementation PPXPCNamedEntityStoreQueryMonitorSession

- (PPXPCNamedEntityStoreQueryMonitorSession)initWithMonitoringHelper:(id)a3
{
  id v5;
  PPXPCNamedEntityStoreQueryMonitorSession *v6;
  PPXPCNamedEntityStoreQueryMonitorSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPXPCNamedEntityStoreQueryMonitorSession;
  v6 = -[PPXPCNamedEntityStoreQueryMonitorSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_monitoringHelper, a3);
    -[PPXPCNamedEntityStoreQueryMonitorSession setLastCallDate](v7, "setLastCallDate");
  }

  return v7;
}

- (id)lastCallDate
{
  return self->_lastCallDate;
}

- (void)setLastCallDate
{
  NSDate *v3;
  NSDate *lastCallDate;

  v3 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -10.0);
  lastCallDate = self->_lastCallDate;
  self->_lastCallDate = v3;

}

- (id)monitoringHelper
{
  return self->_monitoringHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCallDate, 0);
  objc_storeStrong((id *)&self->_monitoringHelper, 0);
}

@end
