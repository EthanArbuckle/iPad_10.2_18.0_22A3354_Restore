@implementation EventObserver

- (EventObserver)initWithObserver:(id)a3 bugTypes:(id)a4
{
  id v6;
  id v7;
  EventObserver *v8;
  EventObserver *v9;
  uint64_t v10;
  NSSet *bugTypes;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EventObserver;
  v8 = -[EventObserver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    bugTypes = v9->_bugTypes;
    v9->_bugTypes = (NSSet *)v10;

  }
  return v9;
}

- (BOOL)matches:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EventObserver observer](self, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)deliverEvent:(id)a3 on:(id)a4
{
  id v6;
  NSObject *v7;
  NSSet *bugTypes;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  bugTypes = self->_bugTypes;
  objc_msgSend(v6, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bugType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(bugTypes) = -[NSSet containsObject:](bugTypes, "containsObject:", v10);

  if ((_DWORD)bugTypes)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__EventObserver_deliverEvent_on___block_invoke;
    v11[3] = &unk_1E6160FE8;
    v11[4] = self;
    v12 = v6;
    dispatch_async(v7, v11);

  }
}

void __33__EventObserver_deliverEvent_on___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incidentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bugType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "didReceiveDiagnosticLog:ofType:details:", v3, v5, v6);

}

- (OSADiagnosticEventObserver)observer
{
  return (OSADiagnosticEventObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (NSSet)bugTypes
{
  return self->_bugTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bugTypes, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
