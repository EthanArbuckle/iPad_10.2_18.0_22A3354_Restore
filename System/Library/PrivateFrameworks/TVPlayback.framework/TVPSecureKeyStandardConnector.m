@implementation TVPSecureKeyStandardConnector

- (TVPSecureKeyStandardConnector)init
{
  TVPSecureKeyStandardConnector *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVPSecureKeyStandardConnector;
  v2 = -[TVPSecureKeyStandardConnector init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 5);
  }
  return v2;
}

- (id)secureKeyStandardLoader:(id)a3 requestForFetchingDataFromURL:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BDD16B0];
  v5 = a4;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", v5);

  objc_msgSend(v6, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v6, "setTimeoutInterval:", 30.0);
  return v6;
}

- (id)secureKeyStandardLoader:(id)a3 requestForPostingData:(id)a4 toURL:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x24BDD16B0];
  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithURL:", v7);

  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setHTTPBody:", v8);

  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v9, "setTimeoutInterval:", 30.0);
  return v9;
}

- (void)secureKeyStandardLoader:(id)a3 sendAsynchronousRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURLRequest:", v9);
  objc_msgSend(v11, "setITunesStoreRequest:", 1);
  objc_initWeak(&location, v11);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke;
  v14[3] = &unk_24F15D6C0;
  v12 = v10;
  v15 = v12;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "setOutputBlock:", v14);
  -[TVPSecureKeyStandardConnector operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke_2;
  v9[3] = &unk_24F15D698;
  v12 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __99__TVPSecureKeyStandardConnector_secureKeyStandardLoader_sendAsynchronousRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "URLResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, v4, *(_QWORD *)(a1 + 40));

}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
