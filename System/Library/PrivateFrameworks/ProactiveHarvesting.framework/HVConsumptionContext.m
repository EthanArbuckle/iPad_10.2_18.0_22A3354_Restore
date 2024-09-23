@implementation HVConsumptionContext

- (BMIdentifiableContentEvent)content
{
  return self->_content;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (HVConsumptionContext)initWithContent:(id)a3 contentProtection:(id)a4 scheduledTaskShouldContinueBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  HVConsumptionContext *v12;
  HVConsumptionContext *v13;
  uint64_t v14;
  id scheduledTaskShouldContinueBlock;
  id v16;
  uint64_t v17;
  _PASLazyResult *cachedParser;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HVConsumptionContext;
  v12 = -[HVConsumptionContext init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_content, a3);
    objc_storeStrong((id *)&v13->_contentProtection, a4);
    v14 = MEMORY[0x22074FF64](v11);
    scheduledTaskShouldContinueBlock = v13->_scheduledTaskShouldContinueBlock;
    v13->_scheduledTaskShouldContinueBlock = (id)v14;

    location = 0;
    objc_initWeak(&location, v13);
    v16 = objc_alloc(MEMORY[0x24BE7A608]);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __91__HVConsumptionContext_initWithContent_contentProtection_scheduledTaskShouldContinueBlock___block_invoke;
    v20[3] = &unk_24DD7E5D0;
    objc_copyWeak(&v21, &location);
    v17 = objc_msgSend(v16, "initWithBlock:", v20);
    cachedParser = v13->_cachedParser;
    v13->_cachedParser = (_PASLazyResult *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (BOOL)shouldContinue
{
  uint64_t (**scheduledTaskShouldContinueBlock)(id, SEL);
  NSObject *v4;
  uint8_t v5[16];

  scheduledTaskShouldContinueBlock = (uint64_t (**)(id, SEL))self->_scheduledTaskShouldContinueBlock;
  if (!scheduledTaskShouldContinueBlock
    || (scheduledTaskShouldContinueBlock[2](scheduledTaskShouldContinueBlock, a2) & 1) != 0)
  {
    return 1;
  }
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVConsumptionContext: _scheduledTaskShouldContinueBlock returned NO", v5, 2u);
  }

  return 0;
}

- (id)_parseHtmlContentIfAvailable
{
  BMIdentifiableContentEvent *v3;
  void *v4;
  HVHtmlParser *v5;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint8_t v11[16];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self->_content;
    -[BMIdentifiableContentEvent htmlContent](v3, "htmlContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[HVHtmlParser initWithData:encoding:]([HVHtmlParser alloc], "initWithData:encoding:", v4, 4);
    }
    else
    {
      hv_default_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVConsumptionContext<BMMailContentEvent>: unable to fetch HTML content, will parse plaintext converted to HTML", v11, 2u);
      }

      -[BMIdentifiableContentEvent textContent](v3, "textContent");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
        v8 = &stru_24DD7F8A8;
      v10 = (void *)-[__CFString mutableCopy](v8, "mutableCopy");

      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
        2,
        0,
        objc_msgSend(v10, "length"));
      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
        2,
        0,
        objc_msgSend(v10, "length"));
      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("<br>"), 2, 0, objc_msgSend(v10, "length"));
      v5 = -[HVHtmlParser initWithString:]([HVHtmlParser alloc], "initWithString:", v10);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (HVHtmlParser)htmlParser
{
  return (HVHtmlParser *)-[_PASLazyResult result](self->_cachedParser, "result");
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = objc_opt_class();
  -[BMIdentifiableContentEvent uniqueId](self->_content, "uniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<HVConsumptionContext c:%@ u:%@ p:%@>"), v4, v5, self->_contentProtection);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_cachedParser, 0);
  objc_storeStrong(&self->_scheduledTaskShouldContinueBlock, 0);
}

id __91__HVConsumptionContext_initWithContent_contentProtection_scheduledTaskShouldContinueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    __assert_rtn("-[HVConsumptionContext initWithContent:contentProtection:scheduledTaskShouldContinueBlock:]_block_invoke", "HVConsumptionContext.m", 32, "strongSelf");
  v2 = WeakRetained;
  objc_msgSend(WeakRetained, "_parseHtmlContentIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
