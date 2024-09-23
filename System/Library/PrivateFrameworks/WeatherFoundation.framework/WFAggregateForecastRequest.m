@implementation WFAggregateForecastRequest

- (WFAggregateForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFAggregateForecastRequest *v9;
  WFAggregateForecastRequest *v10;
  WFAggregateForecastRequest *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAggregateForecastRequest;
    v10 = -[WFTask init](&v13, sel_init);
    v11 = v10;
    if (v10)
    {
      -[WFAggregateForecastRequest setLocation:](v10, "setLocation:", v6);
      -[WFAggregateForecastRequest setCompletionHandler:](v11, "setCompletionHandler:", v8);
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[WFAggregateForecastRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAggregateForecastRequest completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forecasts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v6)[2](v6, v7, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)WFAggregateForecastRequest;
  -[WFTask handleResponse:](&v9, sel_handleResponse_, v4);

}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[WFAggregateForecastRequest completionHandler](self, "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFAggregateForecastRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (void)handleCancellation
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  objc_super v6;

  -[WFAggregateForecastRequest completionHandler](self, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFAggregateForecastRequest completionHandler](self, "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)WFAggregateForecastRequest;
  -[WFTask handleCancellation](&v6, sel_handleCancellation);
}

- (void)cleanup
{
  objc_super v3;

  -[WFAggregateForecastRequest setCompletionHandler:](self, "setCompletionHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFAggregateForecastRequest;
  -[WFTask cleanup](&v3, sel_cleanup);
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
