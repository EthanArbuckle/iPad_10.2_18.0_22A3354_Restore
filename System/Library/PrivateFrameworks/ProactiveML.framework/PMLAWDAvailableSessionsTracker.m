@implementation PMLAWDAvailableSessionsTracker

- (PMLAWDAvailableSessionsTracker)init
{
  void *v3;
  PMLAWDAvailableSessionsTracker *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2B20]), "initWithComponentId:", 86);
  v4 = -[PMLAWDAvailableSessionsTracker initWithAWDConnection:](self, "initWithAWDConnection:", v3);

  return v4;
}

- (PMLAWDAvailableSessionsTracker)initWithAWDConnection:(id)a3
{
  id v5;
  void *v6;
  PMLAWDAvailableSessionsTracker *v7;
  objc_super v9;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)PMLAWDAvailableSessionsTracker;
  v7 = -[PMLAWDBaseTracker initWithModel:](&v9, sel_initWithModel_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_awdServerConnection, a3);

  return v7;
}

- (void)setAWDMetricQueryDelegate:(id)a3
{
  id v5;
  id WeakRetained;
  AWDServerConnection *awdServerConnection;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLAWDAvailableSessionsTracker.m"), 41, CFSTR("AWD metric query delegate can only be set once"));

  }
  objc_storeWeak((id *)&self->_delegate, v5);
  location = 0;
  objc_initWeak(&location, self);
  awdServerConnection = self->_awdServerConnection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__PMLAWDAvailableSessionsTracker_setAWDMetricQueryDelegate___block_invoke;
  v9[3] = &unk_24D3DBEA8;
  objc_copyWeak(&v10, &location);
  -[AWDServerConnection registerQueriableMetric:callback:](awdServerConnection, "registerQueriableMetric:callback:", 5636103, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)reportStatsToAWD
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "availableSessionsStatsReportedToAWD");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLAWDAvailableSessionsTracker.m"), 54, CFSTR("Missing delegate to handle AWD metric request."));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdServerConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __60__PMLAWDAvailableSessionsTracker_setAWDMetricQueryDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reportStatsToAWD");

}

@end
