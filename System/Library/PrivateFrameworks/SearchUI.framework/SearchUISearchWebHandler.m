@implementation SearchUISearchWebHandler

- (id)destinationPunchout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D8C5E0];
  objc_msgSend((id)objc_opt_class(), "webSearchURLForQueryString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)webSearchURLForQueryString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v12;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99EA0];
    v4 = a3;
    objc_msgSend(v3, "_sf_safariSharedDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__SearchUISearchWebHandler_webSearchURLForQueryString___block_invoke;
      block[3] = &unk_1EA1F62F0;
      v12 = v5;
      if (webSearchURLForQueryString__onceToken != -1)
        dispatch_once(&webSearchURLForQueryString__onceToken, block);

    }
    objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultSearchEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchURLForUserTypedString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t __55__SearchUISearchWebHandler_webSearchURLForQueryString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  v3 = (void *)webSearchURLForQueryString__safariObserver;
  webSearchURLForQueryString__safariObserver = v2;

  return objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", webSearchURLForQueryString__safariObserver, *MEMORY[0x1E0CD5938], 3, 0);
}

@end
