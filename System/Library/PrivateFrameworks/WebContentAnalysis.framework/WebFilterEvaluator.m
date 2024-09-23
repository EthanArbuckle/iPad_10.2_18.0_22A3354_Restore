@implementation WebFilterEvaluator

+ (BOOL)isManagedSession
{
  return _WebFilterIsActive();
}

+ (id)sharedBloomFilter
{
  if (sharedBloomFilter_once != -1)
    dispatch_once(&sharedBloomFilter_once, &__block_literal_global_0);
  return (id)sharedBloomFilter__bloomFilter;
}

void __39__WebFilterEvaluator_sharedBloomFilter__block_invoke()
{
  NSObject *v0;

  sharedBloomFilter__bloomFilter = objc_opt_new();
  v0 = __WFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __39__WebFilterEvaluator_sharedBloomFilter__block_invoke_cold_1();
}

- (id)debugPageForPageWithData:(id)a3 forURL:(id)a4 debugString:(id)a5
{
  return (id)ComposeDebugPageSimple(a3, objc_msgSend(a4, "absoluteString"), a5);
}

- (id)blockPageForPageWithTitle:(id)a3 origURL:(id)a4
{
  NSString *v7;
  WFUserSettings *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  WFBlockPage *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[5];

  v7 = NSUserName();
  v8 = -[WFUserSettings initWithUserName:]([WFUserSettings alloc], "initWithUserName:", v7);
  v9 = __WFDefaultLog();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[WebFilterEvaluator blockPageForPageWithTitle:origURL:].cold.4((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
    v17 = -[WFBlockPage initWithUsername:overridesAllowded:]([WFBlockPage alloc], "initWithUsername:overridesAllowded:", v7, -[WFUserSettings overridesAllowed](v8, "overridesAllowed"));

    -[WFBlockPage setFormActionURLString:](v17, "setFormActionURLString:", CFSTR("x-apple-content-filter://unblock"));
    -[WFBlockPage setUserVisibleURLString:](v17, "setUserVisibleURLString:", objc_msgSend(a4, "absoluteString"));
    v18 = -[WFBlockPage page](v17, "page");

    if (!v18)
      v18 = CFSTR("<html> <head><title>Error composing block page</title></head> <body>Error composing block page</body> </html>");
    if (!-[WebFilterEvaluator remoteViewController](self, "remoteViewController"))
    {
      v19 = (void *)objc_opt_class();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke;
      v29[3] = &unk_24C583B58;
      v29[4] = self;
      objc_msgSend(v19, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("WFServicePINEntryNavigationController"), CFSTR("com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI"), v29);
      v20 = __WFDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[WebFilterEvaluator blockPageForPageWithTitle:origURL:].cold.3(self, v20);
    }
    v21 = __WFDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[WebFilterEvaluator blockPageForPageWithTitle:origURL:].cold.2((uint64_t)v18, v21, v22, v23, v24, v25, v26, v27);
    return (id)-[__CFString dataUsingEncoding:](v18, "dataUsingEncoding:", 4);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WebFilterEvaluator blockPageForPageWithTitle:origURL:].cold.1((uint64_t)a3, (uint64_t)a4, v10);
    return 0;
  }
}

uint64_t __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t result;

  v6 = __WFDefaultLog();
  if (!a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_3();
      if (!a3)
        goto LABEL_13;
      goto LABEL_7;
    }
LABEL_6:
    if (!a3)
      goto LABEL_13;
    goto LABEL_7;
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    goto LABEL_6;
  __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_4();
  if (!a3)
  {
LABEL_13:
    result = objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
    if (!result)
      return objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", a2);
    return result;
  }
LABEL_7:
  v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_2();
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

+ (id)createWithResponse:(id)a3
{
  if (!_WebFilterIsActive())
    return 0;
  if ((_gWebFilterActivated & 1) == 0)
    _gWebFilterActivated = 1;
  return -[WebFilterEvaluator initWithResponse:]([WebFilterEvaluator alloc], "initWithResponse:", a3);
}

- (WebFilterEvaluator)initWithResponse:(id)a3
{
  WebFilterEvaluator *v4;
  WebFilterEvaluator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebFilterEvaluator;
  v4 = -[WebFilterEvaluator init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_filterState = 2;
    v4->_buffer = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v5->_url = (NSURL *)(id)objc_msgSend(a3, "URL");
    v5->_completion = &__block_literal_global_25;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebFilterEvaluator;
  -[WebFilterEvaluator dealloc](&v3, sel_dealloc);
}

- (id)addData:(id)a3
{
  NSUInteger v5;
  unint64_t v6;
  WFUserSettings *v7;
  NSMutableData *buffer;
  NSURL **p_url;
  NSString *v10;
  int v11;
  uint64_t v12;
  id v13;
  NSString *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSURL *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  NSURL *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  NSString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[NSMutableData appendData:](self->_buffer, "appendData:");
    if (!(-[NSMutableData length](self->_buffer, "length") >> 15))
      return (id)objc_msgSend(MEMORY[0x24BDBCE50], "data");
  }
  v5 = -[NSMutableData length](self->_buffer, "length");
  if (v5)
  {
    v6 = v5;
    v7 = -[WFUserSettings initWithUserName:]([WFUserSettings alloc], "initWithUserName:", NSUserName());
    self->_filterState = 3;
    if (v6 <= 0x8000)
      buffer = self->_buffer;
    else
      buffer = (NSMutableData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData bytes](self->_buffer, "bytes"), 0x8000, 0);
    p_url = &self->_url;
    v10 = -[NSString lowercaseString](-[NSURL scheme](self->_url, "scheme"), "lowercaseString");
    v11 = -[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("https"))
       || -[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("http"));
    v12 = -[NSURL absoluteString](*p_url, "absoluteString");
    v13 = +[WFWebPageDecorator webPageWithData:URLString:](WFWebPageToFilterText, "webPageWithData:URLString:", buffer, v12);
    v14 = (NSString *)objc_msgSend(v13, "pageTitle");
    if (!v14)
    {
      v15 = __WFDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[WebFilterEvaluator addData:].cold.13();
      v14 = -[NSURL host](*p_url, "host");
    }
    self->_pageTitle = (NSString *)-[NSString copy](v14, "copy");
    if (!_WebFilterIsActive())
    {
      self->_filterState = 0;
      v20 = __WFDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[WebFilterEvaluator addData:].cold.1((uint64_t)v14, v20, v21, v22, v23, v24, v25, v26);
      return self->_buffer;
    }
    if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("https"))
      && -[WFUserSettings alwaysAllowHTTPS](v7, "alwaysAllowHTTPS"))
    {
      self->_filterState = 0;
      v16 = __WFDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[WebFilterEvaluator addData:].cold.2();
      return self->_buffer;
    }
    if (v11
      && -[WFUserSettings contentFilterOverriddenBlackListContainsURL:](v7, "contentFilterOverriddenBlackListContainsURL:", v12))
    {
      v17 = WFDebugLevel();
      v18 = *p_url;
      if (v17 == 1)
        v19 = -[WebFilterEvaluator debugPageForPageWithData:forURL:debugString:](self, "debugPageForPageWithData:forURL:debugString:", self->_buffer, v18, CFSTR("URL was on content filter blacklist"));
      else
        v19 = -[WebFilterEvaluator blockPageForPageWithTitle:origURL:](self, "blockPageForPageWithTitle:origURL:", self->_pageTitle, v18);
      v29 = v19;
      -[NSMutableData setLength:](self->_buffer, "setLength:", 0);
      self->_filterState = 1;
      v30 = __WFDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[WebFilterEvaluator addData:].cold.3();
      return v29;
    }
    if (-[NSString isEqualToString:](-[NSURL pathExtension](*p_url, "pathExtension"), "isEqualToString:", CFSTR("pdf")))
    {
      self->_filterState = 0;
      v27 = __WFDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v43 = 138477827;
        v44 = v14;
        _os_log_impl(&dword_20CD6C000, v27, OS_LOG_TYPE_INFO, "WebFilterEvaluator:addData: '%{private}@' is not blocked: All PDFs are allowed", (uint8_t *)&v43, 0xCu);
      }
      return self->_buffer;
    }
    if (v11)
    {
      if (-[WFUserSettings contentFilterEnabled](v7, "contentFilterEnabled"))
      {
        if (-[WFUserSettings autoWhitelistContainsURL:](v7, "autoWhitelistContainsURL:", *p_url))
        {
          v28 = __WFDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[WebFilterEvaluator addData:].cold.7();
        }
        else if (-[WFUserSettings contentFilterOverriddenWhiteListContainsURL:withAppleAllowList:](v7, "contentFilterOverriddenWhiteListContainsURL:withAppleAllowList:", v12, objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "sharedBloomFilter"), "appleAllowList")))
        {
          v31 = __WFDefaultLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[WebFilterEvaluator addData:].cold.8();
        }
        else if (v13)
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "sharedBloomFilter"), "shouldBlock:", self->_url))
          {
            if (WFDebugLevel() == 1)
            {
              v32 = -[WebFilterEvaluator debugPageForPageWithData:forURL:debugString:](self, "debugPageForPageWithData:forURL:debugString:", self->_buffer, self->_url, CFSTR("URL is explicit"));
            }
            else
            {
              v41 = __WFDefaultLog();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                -[WebFilterEvaluator addData:].cold.11();
              v32 = -[WebFilterEvaluator blockPageForPageWithTitle:origURL:](self, "blockPageForPageWithTitle:origURL:", self->_pageTitle, self->_url);
            }
            v29 = v32;
            -[NSMutableData setLength:](self->_buffer, "setLength:", 0);
            self->_filterState = 1;
            v42 = __WFDefaultLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              -[WebFilterEvaluator addData:].cold.10();
            return v29;
          }
          v34 = __WFDefaultLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            -[WebFilterEvaluator addData:].cold.12();
        }
        else
        {
          v33 = __WFDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[WebFilterEvaluator addData:].cold.9();
        }
      }
      if (-[WFUserSettings whiteListEnabled](v7, "whiteListEnabled"))
      {
        if (!-[WFUserSettings whiteListContainsURL:](v7, "whiteListContainsURL:", v12)
          && !-[WFUserSettings autoWhitelistContainsURL:](v7, "autoWhitelistContainsURL:", *p_url))
        {
          v37 = WFDebugLevel();
          v38 = *p_url;
          if (v37 == 1)
            v39 = -[WebFilterEvaluator debugPageForPageWithData:forURL:debugString:](self, "debugPageForPageWithData:forURL:debugString:", self->_buffer, v38, CFSTR("URL was on content filter blacklist"));
          else
            v39 = -[WebFilterEvaluator blockPageForPageWithTitle:origURL:](self, "blockPageForPageWithTitle:origURL:", self->_pageTitle, v38);
          v29 = v39;
          -[NSMutableData setLength:](self->_buffer, "setLength:", 0);
          self->_filterState = 1;
          v40 = __WFDefaultLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            -[WebFilterEvaluator addData:].cold.6();
          return v29;
        }
        v35 = __WFDefaultLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[WebFilterEvaluator addData:].cold.5();
      }
    }
    v36 = __WFDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[WebFilterEvaluator addData:].cold.4();
  }
  self->_filterState = 0;
  return self->_buffer;
}

- (id)dataComplete
{
  return -[WebFilterEvaluator addData:](self, "addData:", 0);
}

- (int)filterState
{
  NSObject *v3;
  uint64_t v4;

  v3 = __WFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[WebFilterEvaluator filterState].cold.1((uint64_t)self, v3, v4);
  return self->_filterState;
}

- (BOOL)wasBlocked
{
  return self->_filterState == 1;
}

- (void)attemptUnblockWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke;
  v3[3] = &unk_24C583BC0;
  v3[4] = a3;
  -[WebFilterEvaluator unblockWithCompletion:](self, "unblockWithCompletion:", v3);
}

uint64_t __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;

  if (a3)
  {
    v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unblockWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[6];

  if (a3)
    self->_completion = (id)objc_msgSend(a3, "copy");
  if (-[WebFilterEvaluator wasBlocked](self, "wasBlocked"))
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "rootViewController");
    v5 = (void *)objc_opt_class();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__WebFilterEvaluator_unblockWithCompletion___block_invoke;
    v7[3] = &unk_24C583C58;
    v7[4] = self;
    v7[5] = v4;
    objc_msgSend(v5, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("WFServicePINEntryNavigationController"), CFSTR("com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI"), v7);
  }
  else
  {
    v6 = __WFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[WebFilterEvaluator unblockWithCompletion:].cold.1();
    (*((void (**)(void))self->_completion + 2))();
  }
}

uint64_t __44__WebFilterEvaluator_unblockWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v10[4];
  __int128 v11;
  void *v12;

  v6 = __WFDefaultLog();
  if (!a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_3();
      if (a3)
        goto LABEL_7;
      goto LABEL_13;
    }
LABEL_6:
    if (a3)
      goto LABEL_7;
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", a2);
    objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(a2, "setURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(a2, "setPageTitle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_41;
    v10[3] = &unk_24C583C30;
    v11 = *(_OWORD *)(a1 + 32);
    v12 = a2;
    return objc_msgSend(a2, "getIsPINPresentWithCompletion:", v10);
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    goto LABEL_6;
  __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_4();
  if (!a3)
    goto LABEL_13;
LABEL_7:
  v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_2();
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_41(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  NSObject *v5;
  void *v7;
  _QWORD v8[5];

  if (a3)
  {
    v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_2();
    v5 = __WFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1();
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  }
  else if (a2)
  {
    return objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 48), 1, &__block_literal_global_43);
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2;
    v8[3] = &unk_24C583C08;
    v8[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v7, "permitURLWithCompletion:", v8);
  }
}

uint64_t __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;

  v4 = __WFDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2_cold_2(a2, v4, v5);
    if (!a2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  }
  else if (!a2)
  {
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  }
  v6 = __WFDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t filterState;

  filterState = self->_filterState;
  if (filterState <= 3 && filterState != 1)
  {
    NSLog(CFSTR("WebContentFilter: WARNING!  You shouldn't serialize the WebFilterEvaluator object when it's in any state other than kWFEStateBlocked because the website's data are not serialized with the object."), a2);
    filterState = self->_filterState;
  }
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", filterState), CFSTR("WebContentFilterStateKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_url, CFSTR("WebContentFilterURLKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_pageTitle, CFSTR("WebContentFilterPageTitleKey"));
}

- (WebFilterEvaluator)initWithCoder:(id)a3
{
  WebFilterEvaluator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebFilterEvaluator;
  v4 = -[WebFilterEvaluator init](&v6, sel_init);
  if (v4)
  {
    v4->_filterState = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebContentFilterStateKey")), "unsignedIntegerValue");
    v4->_url = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebContentFilterURLKey"));
    v4->_pageTitle = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebContentFilterPageTitleKey"));
  }
  return v4;
}

- (void)userEnteredCorrectPIN
{
  WFRemotePINEntryViewController *v3;
  _QWORD v4[5];

  v3 = -[WebFilterEvaluator remoteViewController](self, "remoteViewController");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke;
  v4[3] = &unk_24C583C80;
  v4[4] = self;
  -[WFRemotePINEntryViewController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1, v4);
}

uint64_t __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = __WFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (void)userDidCancel
{
  WFRemotePINEntryViewController *v3;
  _QWORD v4[5];

  v3 = -[WebFilterEvaluator remoteViewController](self, "remoteViewController");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__WebFilterEvaluator_userDidCancel__block_invoke;
  v4[3] = &unk_24C583C80;
  v4[4] = self;
  -[WFRemotePINEntryViewController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1, v4);
}

uint64_t __35__WebFilterEvaluator_userDidCancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = __WFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_2();
  if (objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFPINEntryErrorDomain"), 2, 0))
  {
    v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_1(v3);
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFPINEntryErrorDomain"), 2, 0));
}

- ($115C4C562B26FF47E01F9F4EA65B5887)browserAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setBrowserAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_browserAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_browserAuditToken.val = v3;
}

- (WFRemotePINEntryViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

void __39__WebFilterEvaluator_sharedBloomFilter__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_20CD6C000, v0, v1, "WebFilterEvaluator: WCR starting up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)blockPageForPageWithTitle:(os_log_t)log origURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136446723;
  v4 = "-[WebFilterEvaluator blockPageForPageWithTitle:origURL:]";
  v5 = 2113;
  v6 = a1;
  v7 = 2113;
  v8 = a2;
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "**** Error %{public}s: nil block page for title %{private}@, URL %{private}@", (uint8_t *)&v3, 0x20u);
}

- (void)blockPageForPageWithTitle:(uint64_t)a3 origURL:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CD6C000, a2, a3, "Generated block page: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_4_0();
}

- (void)blockPageForPageWithTitle:(void *)a1 origURL:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "remoteViewController");
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_20CD6C000, a2, OS_LOG_TYPE_DEBUG, "WFRemotePINEntryViewController is %s", v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)blockPageForPageWithTitle:(uint64_t)a3 origURL:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CD6C000, a2, a3, "blockPageForPageWithTitle got settings for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(&dword_20CD6C000, v0, v1, "%{public}s completion: error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_6();
  v3 = "NO";
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, v1, "%{public}s completion: unblocked==%s", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CD6C000, v0, v1, "WFRemotePINEntryViewController is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__WebFilterEvaluator_blockPageForPageWithTitle_origURL___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_20CD6C000, v0, v1, "WFRemotePINEntryViewController created", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a2, a3, "WebFilterEvaluator:addData: '%@' is not blocked: Web Filter is disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: always allow HTTPS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is restricted: blacklisted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: '%{private}@' at %{private}@ is not blocked", v1);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: On pure whitelist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is blocked: Not on pure whitelist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: auto-whitelisted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: %{private}@ is not blocked: whitelisted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: %{private}@ skipped content filter: nil webpageContentString and/or webpage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.10()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: %{private}@ is blocked: '%{private}@' is explicit", v1);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.11()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: Getting block page for %{private}@ with title %{private}@", v1);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.12()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, (uint64_t)v0, "WebFilterEvaluator:addData: %{private}@ is not blocked: '%{private}@' is not explicit", v1);
  OUTLINED_FUNCTION_4_0();
}

- (void)addData:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CD6C000, v0, v1, "WebFilterEvaluator:addData: Could not find webpage title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)filterState
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 136446466;
  v5 = "-[WebFilterEvaluator filterState]";
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, a2, a3, "%{public}s: filter state result %ld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4_0();
}

void __51__WebFilterEvaluator_attemptUnblockWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(&dword_20CD6C000, v0, v1, "%{public}s error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)unblockWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_6();
  v3 = "NO";
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, v1, "%{public}s completion: unblocked==%s", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

void __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(&dword_20CD6C000, v0, v1, "%{public}s completion: error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_6();
  v3 = "NO";
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, v1, "%{public}s completion: unblocked==%s", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

void __44__WebFilterEvaluator_unblockWithCompletion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v3 = "YES";
  else
    v3 = "NO";
  v4 = 136446466;
  v5 = "-[WebFilterEvaluator unblockWithCompletion:]_block_invoke_2";
  v6 = 2080;
  v7 = v3;
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, a2, a3, "%{public}s completion: unblocked==%s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4_0();
}

void __43__WebFilterEvaluator_userEnteredCorrectPIN__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_6();
  v3 = "YES";
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, v1, "%{public}s completion: unblocked==%s", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

void __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_1(NSObject *a1)
{
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFPINEntryErrorDomain"), 2, 0);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_20CD6C000, a1, OS_LOG_TYPE_ERROR, "%{public}s completion: error: %@", (uint8_t *)v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __35__WebFilterEvaluator_userDidCancel__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[3];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_6();
  v3 = "NO";
  OUTLINED_FUNCTION_2_1(&dword_20CD6C000, v0, v1, "%{public}s completion: unblocked==%s", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

@end
