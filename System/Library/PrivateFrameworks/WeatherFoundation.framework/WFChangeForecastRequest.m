@implementation WFChangeForecastRequest

- (WFChangeForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WFChangeForecastRequest *v8;
  uint64_t v9;
  WFLocation *location;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFChangeForecastRequest;
  v8 = -[WFTask init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    location = v8->_location;
    v8->_location = (WFLocation *)v9;

    v11 = MEMORY[0x212BE2990](v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v11;

  }
  return v8;
}

- (void)startWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFChangeForecastRequest location](self, "location");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTask identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forecast:forLocation:locale:taskIdentifier:", 512, v7, v5, v6);

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
  -[WFChangeForecastRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFChangeForecastRequest completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changeForecasts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v6)[2](v6, v7, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)WFChangeForecastRequest;
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
  -[WFChangeForecastRequest completionHandler](self, "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFChangeForecastRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (WFLocation)location
{
  return self->_location;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
