@implementation ICQRemoteUIDataLoader

- (ICQRemoteUIDataLoader)init
{
  ICQRemoteUIDataLoader *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSURLSession *session;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICQRemoteUIDataLoader;
  v2 = -[ICQRemoteUIDataLoader init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("ICQRemoteUILoaderSession"));
    objc_msgSend(v3, "set_appleIDContext:", v4);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v5;

  }
  return v2;
}

- (void)addHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/x-buddyml"), CFSTR("Accept"));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__ICQRemoteUIDataLoader_addHeadersForRequest_withCompletion___block_invoke;
  v11[3] = &unk_24E3F33A8;
  v13 = v7;
  v14 = v6;
  v12 = v5;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "icq_addHeadersForUpgradeWithCompletion:", v11);

}

uint64_t __61__ICQRemoteUIDataLoader_addHeadersForRequest_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "allHTTPHeaderFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(*(id *)(a1 + 32), "HTTPBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithData:encoding:", v5, 4);
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Request headers: %@, body (decoded from data): %@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)loadDataFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[ICQRemoteUIDataLoader loadDataFromURL:completion:]";
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s - server call to URL %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:cachePolicy:timeoutInterval:", v6, 1, 30.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke;
  v11[3] = &unk_24E3F33F8;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v7;
  v12 = v10;
  -[ICQRemoteUIDataLoader addHeadersForRequest:withCompletion:](self, "addHeadersForRequest:withCompletion:", v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2;
  v8[3] = &unk_24E3F33D0;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v4, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDelegate:", WeakRetained);
  objc_msgSend(v7, "resume");

}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_3(v9, v10);
LABEL_4:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_19;
  }
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v10 = v11;
  if (!v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_1(v10, v17, v18);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Received remoteUI Page data %@", (uint8_t *)&v19, 0xCu);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v12;
    _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Received remoteUI XML %@", (uint8_t *)&v19, 0xCu);
  }

  if (objc_msgSend(v12, "containsString:", CFSTR("forceRefresh=\"true\")))
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_2(v14);

    +[ICQPurchase clearCacheAndNotifyClients](ICQPurchase, "clearCacheAndNotifyClients");
    v15 = *(_QWORD *)(a1 + 32);
    ICQCreateError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

LABEL_19:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a7;
  v10 = a6;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[ICQRemoteUIDataLoader URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]";
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __97__ICQRemoteUIDataLoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v13[3] = &unk_24E3F3420;
  v14 = v9;
  v12 = v9;
  -[ICQRemoteUIDataLoader addHeadersForRequest:withCompletion:](self, "addHeadersForRequest:withCompletion:", v10, v13);

}

uint64_t __97__ICQRemoteUIDataLoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[ICQRemoteUIDataLoader loadDataFromURL:completion:]_block_invoke";
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a1, a3, "Received no data and no error in %s!", (uint8_t *)&v3);
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Unable to present upsell, user is already a subscriber! Asking CSF to refresh status", v1, 2u);
}

void __52__ICQRemoteUIDataLoader_loadDataFromURL_completion___block_invoke_2_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, v4, "Error making HTTP call to url: %@", (uint8_t *)&v5);

}

@end
