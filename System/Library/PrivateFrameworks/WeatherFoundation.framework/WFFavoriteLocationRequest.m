@implementation WFFavoriteLocationRequest

- (WFFavoriteLocationRequest)initWithResultHandler:(id)a3
{
  id v4;
  WFFavoriteLocationRequest *v5;
  uint64_t v6;
  id resultHandler;
  WFFavoriteLocationRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFavoriteLocationRequest;
  v5 = -[WFTask init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    resultHandler = v5->_resultHandler;
    v5->_resultHandler = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)startWithService:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD, void *);

  -[WFFavoriteLocationRequest resultHandler](self, "resultHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFFavoriteLocationRequest resultHandler](self, "resultHandler");
    v6 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v5);

  }
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
  -[WFFavoriteLocationRequest resultHandler](self, "resultHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFFavoriteLocationRequest resultHandler](self, "resultHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "favoriteLocations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v6)[2](v6, v7, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)WFFavoriteLocationRequest;
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
  -[WFFavoriteLocationRequest resultHandler](self, "resultHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFFavoriteLocationRequest;
  -[WFTask handleError:forResponseIdentifier:](&v9, sel_handleError_forResponseIdentifier_, v7, v6);

}

- (void)handleCancellation
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  objc_super v6;

  -[WFFavoriteLocationRequest resultHandler](self, "resultHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFFavoriteLocationRequest resultHandler](self, "resultHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)WFFavoriteLocationRequest;
  -[WFTask handleCancellation](&v6, sel_handleCancellation);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
