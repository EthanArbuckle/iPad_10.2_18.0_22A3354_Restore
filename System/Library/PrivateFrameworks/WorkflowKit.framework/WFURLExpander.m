@implementation WFURLExpander

+ (void)expandURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  WFAppTransportSecuredURL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setURL:", v8);
  objc_msgSend(v7, "setCompletionHandler:", v5);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__WFURLExpander_expandURL_completionHandler___block_invoke;
  block[3] = &unk_1E7AF94B0;
  v11 = v7;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __45__WFURLExpander_expandURL_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB37A8];
  -[WFURLExpander URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_setNonAppInitiated:", 1);
  v5 = (void *)MEMORY[0x1E0CB39F0];
  objc_msgSend(MEMORY[0x1E0CB39F8], "wf_defaultSessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionWithConfiguration:delegate:delegateQueue:", v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataTaskWithRequest:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)finishWithURL:(id)a3 error:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v19 = a3;
  v6 = a4;
  -[WFURLExpander completionHandler](self, "completionHandler");
  v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[WFURLExpander setCompletionHandler:](self, "setCompletionHandler:", 0);
  objc_msgSend(v19, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSuffix:", CFSTR("medium.com"));

  if (v9)
  {
    objc_msgSend(&unk_1E7B8DBF8, "arrayByAddingObject:", CFSTR("source"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &unk_1E7B8DBF8;
  }
  objc_msgSend(v19, "dc_queryDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObjectCommonWithArray:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v14, "removeObjectsForKeys:", v10);
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v19, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "dc_queryStringWithQueryDictionary:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setQuery:", v16);

    }
    else
    {
      objc_msgSend(v15, "setQuery:", 0);
    }
    objc_msgSend(v15, "URL");
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v18;
  }
  else
  {
    v17 = v19;
  }
  v20 = v17;
  v7[2](v7);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  void (**v9)(id, id);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v9 = (void (**)(id, id))a7;
  v10 = a6;
  v14 = (id)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  WFAppTransportSecuredURL();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setURL:", v12);

  objc_msgSend(v14, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFURLExpander setURL:](self, "setURL:", v13);

  v9[2](v9, v14);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v7;

  objc_msgSend(a4, "cancel", a3);
  -[WFURLExpander URL](self, "URL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFURLExpander finishWithURL:error:](self, "finishWithURL:error:", v7, 0);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  -[WFURLExpander finishWithURL:error:](self, "finishWithURL:error:", 0, a5);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
