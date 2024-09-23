@implementation ObserverShim

- (ObserverShim)initWithObserver:(id)a3
{
  id v4;
  ObserverShim *v5;
  ObserverShim *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ObserverShim;
  v5 = -[ObserverShim init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_observer, v4);

  return v6;
}

- (BOOL)matches:(id)a3
{
  OSADiagnosticObserver **p_observer;
  id v4;
  id WeakRetained;

  p_observer = &self->_observer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_observer);

  return WeakRetained == v4;
}

- (void)didReceiveDiagnosticLog:(id)a3 ofType:(id)a4 details:(id)a5
{
  OSADiagnosticObserver **p_observer;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_observer = &self->_observer;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_observer);
  objc_msgSend(WeakRetained, "willWriteDiagnosticLog:logId:logInfo:", v9, v10, v8);

}

- (void)didWriteDiagnosticLog:(id)a3 ofType:(id)a4 toPath:(id)a5
{
  OSADiagnosticObserver **p_observer;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_observer = &self->_observer;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_observer);
  objc_msgSend(WeakRetained, "didWriteDiagnosticLog:logId:logFilePath:logInfo:error:", v9, v10, v8, MEMORY[0x1E0C9AA70], 0);

}

- (void)failedToWriteDiagnosticLog:(id)a3 ofType:(id)a4 error:(id)a5
{
  OSADiagnosticObserver **p_observer;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_observer = &self->_observer;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_observer);
  objc_msgSend(WeakRetained, "didWriteDiagnosticLog:logId:logFilePath:logInfo:error:", v9, v10, 0, MEMORY[0x1E0C9AA70], v8);

}

- (OSADiagnosticObserver)observer
{
  return (OSADiagnosticObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
