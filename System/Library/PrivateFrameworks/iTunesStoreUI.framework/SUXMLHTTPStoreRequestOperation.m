@implementation SUXMLHTTPStoreRequestOperation

- (SUXMLHTTPStoreRequestOperation)initWithRequestProperties:(id)a3
{
  id v4;
  SUXMLHTTPStoreRequestOperation *v5;
  uint64_t v6;
  SSURLRequestProperties *requestProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUXMLHTTPStoreRequestOperation;
  v5 = -[SUXMLHTTPStoreRequestOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestProperties = v5->_requestProperties;
    v5->_requestProperties = (SSURLRequestProperties *)v6;

  }
  return v5;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[SUXMLHTTPStoreRequestOperation lock](self, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[SUXMLHTTPStoreRequestOperation unlock](self, "unlock");
  v4 = (void *)MEMORY[0x220763634](v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[SUXMLHTTPStoreRequestOperation lock](self, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[SUXMLHTTPStoreRequestOperation unlock](self, "unlock");

}

- (void)run
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[SUXMLHTTPStoreRequestOperation loadedURLBagWithContext:returningError:](self, "loadedURLBagWithContext:returningError:", v3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x24BEC8C30]);
    objc_msgSend(v6, "setRequestProperties:", self->_requestProperties);
    objc_msgSend(v6, "setAuthenticationContext:", self->_authenticationContext);
    objc_msgSend(v6, "setDataProvider:", self->_dataProvider);
    v14 = v5;
    v7 = -[SUXMLHTTPStoreRequestOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v6, &v14);
    v8 = v14;

    objc_msgSend(v6, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v8;
  }
  else
  {
    v7 = 0;
    v11 = 0;
    v10 = 0;
  }
  -[SUXMLHTTPStoreRequestOperation outputBlock](self, "outputBlock");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, uint64_t, id, void *, void *))(v12 + 16))(v12, v7, v5, v11, v10);
    -[SUXMLHTTPStoreRequestOperation setOutputBlock:](self, "setOutputBlock:", 0);
  }

}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (ISDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong(&self->_outputBlock, 0);
}

@end
