@implementation StockFetcher

- (StockFetcher)init
{
  SymbolValidator *v3;
  StockFetcher *v4;

  v3 = objc_alloc_init(SymbolValidator);
  v4 = -[StockFetcher initWithValidator:](self, "initWithValidator:", v3);

  return v4;
}

- (StockFetcher)initWithValidator:(id)a3
{
  id v5;
  StockFetcher *v6;
  StockFetcher *v7;
  StockFetcher *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StockFetcher;
  v6 = -[StockFetcher init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_validator, a3);
    -[SymbolValidator setDelegate:](v7->_validator, "setDelegate:", v7);
    v7->_timeoutDuration = 5.0;
    v8 = v7;
  }

  return v7;
}

- (void)fetchStockWithSymbol:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *, uint64_t))a4;
  -[StockFetcher completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[StockFetcher cleanUpAndReportResult:](self, "cleanUpAndReportResult:", 0);
  +[StockManager sharedManager](StockManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stockWithSymbol:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v6[2](v6, v9, 1);
  }
  else
  {
    -[StockFetcher setCompletionHandler:](self, "setCompletionHandler:", v6);
    -[StockFetcher attemptRemoteFetchOfStockWithSymbol:completionHandler:](self, "attemptRemoteFetchOfStockWithSymbol:completionHandler:", v10, v6);
  }

}

- (void)attemptRemoteFetchOfStockWithSymbol:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  -[SymbolValidator validateSymbol:withMaxResults:](self->_validator, "validateSymbol:withMaxResults:", a3, 1);
  v5 = (void *)MEMORY[0x24BDBCF40];
  -[StockFetcher timeoutDuration](self, "timeoutDuration");
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_remoteFetchTimedOut, 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[StockFetcher setTimeoutTimer:](self, "setTimeoutTimer:", v6);

}

- (void)remoteFetchTimedOut
{
  -[StockFetcher cleanUpAndReportResult:](self, "cleanUpAndReportResult:", 0);
}

- (void)cleanUpAndReportResult:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[StockFetcher completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[StockFetcher completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v5)[2](v5, v7, 0);

    -[StockFetcher setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[StockFetcher timeoutTimer](self, "timeoutTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[StockFetcher setTimeoutTimer:](self, "setTimeoutTimer:", 0);
}

- (void)symbolValidator:(id)a3 didValidateSymbols:(id)a4
{
  Stock *v5;
  id v6;

  objc_msgSend(a4, "firstObject", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[Stock initWithDictionary:]([Stock alloc], "initWithDictionary:", v6);
  -[StockFetcher cleanUpAndReportResult:](self, "cleanUpAndReportResult:", v5);

}

- (void)symbolValidator:(id)a3 didFailWithError:(id)a4
{
  -[StockFetcher cleanUpAndReportResult:](self, "cleanUpAndReportResult:", 0, a4);
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

- (SymbolValidator)validator
{
  return (SymbolValidator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValidator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

@end
