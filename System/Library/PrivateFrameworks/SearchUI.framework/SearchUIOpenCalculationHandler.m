@implementation SearchUIOpenCalculationHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setNumberStyle:", 1);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setScheme:", CFSTR("calc"));
  objc_msgSend(v14, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHost:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  objc_msgSend(v14, "input");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUISearchWebHandler webSearchURLForQueryString:](SearchUISearchWebHandler, "webSearchURLForQueryString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "addObject:", v11);
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v12, "setUrls:", v13);

  +[SearchUIUtilities openPunchout:](SearchUIUtilities, "openPunchout:", v12);
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)itemProvider
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB36C8]);
  -[SearchUICommandHandler command](self, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "output");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObject:", v5);

  return v6;
}

@end
