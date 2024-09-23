@implementation WLRequest

- (void)request:(id)a3 redirect:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  id location;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTLSMinimumSupportedProtocolVersion:", 771);
  objc_msgSend(v7, "setTLSMaximumSupportedProtocolVersion:", 772);
  objc_msgSend(v7, "setHTTPMaximumConnectionsPerHost:", 1);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1840];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestWithURL:cachePolicy:timeoutInterval:", v10, 1, 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __30__WLRequest_request_redirect___block_invoke;
  v13[3] = &unk_24E149138;
  objc_copyWeak(&v14, &location);
  v15 = a4;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v11, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __30__WLRequest_request_redirect___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__WLRequest_request_redirect___block_invoke_2;
  block[3] = &unk_24E149110;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v18 = *(_BYTE *)(a1 + 40);
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v17);
}

void __30__WLRequest_request_redirect___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "sessionDidFinish:response:error:redirect:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

}

- (void)sessionDidFinish:(id)a3 response:(id)a4 error:(id)a5 redirect:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  _BOOL8 v14;
  id WeakRetained;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a6;
  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    v14 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WLRequest"), 1, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  WeakRetained = v10;
  v16 = objc_msgSend(WeakRetained, "statusCode");
  if (!v6 || (unint64_t)(v16 - 301) > 1)
  {
    v14 = (unint64_t)(v16 - 200) < 0x64;
    if ((unint64_t)(v16 - 200) >= 0x64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WLRequest"), 3, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    if (!v13)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "allHeaderFields");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("Location"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WLRequest"), 2, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    v14 = 0;
    if (!v13)
    {
LABEL_11:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "requestDidFinish:", v14);
      goto LABEL_12;
    }
LABEL_10:
    _WLLog();

    goto LABEL_11;
  }
  -[WLRequest request:redirect:](self, "request:redirect:", v18, 1);

LABEL_12:
}

- (WLRequestDelegate)delegate
{
  return (WLRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
