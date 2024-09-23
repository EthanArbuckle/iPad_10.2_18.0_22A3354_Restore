@implementation WFTemperatureUnitRequest

- (WFTemperatureUnitRequest)initWithResultHandler:(id)a3
{
  id v4;
  WFTemperatureUnitRequest *v5;
  WFTemperatureUnitRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFTemperatureUnitRequest;
  v5 = -[WFTask init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[WFTemperatureUnitRequest setResultHandler:](v5, "setResultHandler:", v4);

  return v6;
}

- (BOOL)requiresResponse
{
  return 1;
}

- (void)startWithService:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFTask identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temperatureUnitWithIdentifier:", v5);

}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFTemperatureUnitRequest resultHandler](self, "resultHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WFTemperatureUnitRequest resultHandler](self, "resultHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[WFTemperatureUnitRequest resultHandler](self, "resultHandler");
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v4, "temperatureUnit");
        objc_msgSend(v4, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *))v7)[2](v7, v8, v9);

      }
      v10.receiver = self;
      v10.super_class = (Class)WFTemperatureUnitRequest;
      -[WFTask handleResponse:](&v10, sel_handleResponse_, v4);
    }
  }

}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[WFTemperatureUnitRequest resultHandler](self, "resultHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFTemperatureUnitRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (void)handleCancellation
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id resultHandler;
  objc_super v7;

  -[WFTemperatureUnitRequest resultHandler](self, "resultHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFTemperatureUnitRequest resultHandler](self, "resultHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
  resultHandler = self->_resultHandler;
  self->_resultHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)WFTemperatureUnitRequest;
  -[WFTask handleCancellation](&v7, sel_handleCancellation);
}

- (void)cleanup
{
  objc_super v3;

  -[WFTemperatureUnitRequest setResultHandler:](self, "setResultHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFTemperatureUnitRequest;
  -[WFTask cleanup](&v3, sel_cleanup);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
