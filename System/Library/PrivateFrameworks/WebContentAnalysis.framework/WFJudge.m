@implementation WFJudge

+ (id)defaultLSMMapPath
{
  id result;
  id v3;

  result = (id)defaultLSMMapPath_result;
  if (!defaultLSMMapPath_result)
  {
    defaultLSMMapPath_result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/WebContentAnalysis.framework")), "pathForResource:ofType:", CFSTR("content_filter_map3"), 0);
    v3 = (id)defaultLSMMapPath_result;
    return (id)defaultLSMMapPath_result;
  }
  return result;
}

+ (id)defaultJudge
{
  id v2;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (gDefaultJudge)
  {
    v2 = (id)gDefaultJudge;
    return (id)gDefaultJudge;
  }
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = 0;
  v6 = objc_msgSend(a1, "defaultLSMMapPath");
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v11))
    v7 = v11 == 0;
  else
    v7 = 0;
  if (v7)
  {
    gDefaultJudge = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMap:", +[WFLSMMap mapFromFilePath:](WFLSMScoreNormalizedMap, "mapFromFilePath:", v6));
    v9 = __WFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(a1, "defaultLSMMapPath");
      *(_DWORD *)buf = 136446466;
      v13 = "+[WFJudge defaultJudge]";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_20CD6C000, v9, OS_LOG_TYPE_INFO, "%{public}s map:%@", buf, 0x16u);
    }
    return (id)gDefaultJudge;
  }
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    +[WFJudge defaultJudge].cold.1((uint64_t)a1, v6, v8);
  return 0;
}

- (WFJudge)initWithMap:(id)a3
{
  return -[WFJudge initWithMap:systemContentWhitelist:](self, "initWithMap:systemContentWhitelist:", a3, +[WFSystemContentWhitelist defaultSystemWhitelist](WFSystemContentWhitelist, "defaultSystemWhitelist"));
}

- (WFJudge)initWithMap:(id)a3 systemContentWhitelist:(id)a4
{
  WFJudge *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFJudge;
  v6 = -[WFJudge init](&v8, sel_init);
  if (v6)
  {
    v6->map = (WFLSMMap *)a3;
    v6->whitelist = (WFSystemContentWhitelist *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFJudge;
  -[WFJudge dealloc](&v3, sel_dealloc);
}

- (id)_pronounceOnWebpage:(id)a3
{
  id v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;

  v5 = (id)objc_opt_new();
  if (objc_msgSend(a3, "selfRestricted"))
  {
    objc_msgSend(v5, "setRestricted:", 1);
    objc_msgSend(v5, "setEvidence:", 3);
    v6 = CFSTR("SELF-RESTRICTED");
LABEL_9:
    objc_msgSend(v5, "setMessage:", v6);
    return v5;
  }
  v17 = 0;
  v16 = 0;
  if (!objc_msgSend(a3, "isWorthAnalyzingWithEvidence:message:", &v17, &v16))
  {
LABEL_8:
    objc_msgSend(v5, "setRestricted:", 0);
    objc_msgSend(v5, "setEvidence:", v17);
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Page not analyzed: %@"), v16);
    goto LABEL_9;
  }
  v7 = objc_msgSend(a3, "URLString");
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    if (v8)
    {
      v9 = v8;
      if (-[WFSystemContentWhitelist isURLWhitelisted:](self->whitelist, "isURLWhitelisted:", v8))
      {
        v17 = 1;
        v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("URL (%@) is known-clean"), v9);
        goto LABEL_8;
      }
    }
  }
  v11 = -[WFLSMMap evaluate:](self->map, "evaluate:", objc_msgSend(a3, "plainText"));
  v12 = objc_msgSend(v11, "isRestricted");
  if ((_DWORD)v12)
    v13 = CFSTR("RESTRICTED");
  else
    v13 = CFSTR(" Allowed  ");
  v14 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v13);
  v15 = v14;
  if (v16)
    objc_msgSend(v14, "appendFormat:", CFSTR(" %@"), v16);
  objc_msgSend(v5, "setMessage:", v15);
  objc_msgSend(v5, "setRestricted:", v12);
  objc_msgSend(v5, "setLSMEvaluationResult:", v11);
  objc_msgSend(v5, "setEvidence:", 0);
  return v5;
}

- (id)pronounceOnPageContent:(id)a3 pageURL:(id)a4 debugPage:(id *)a5 pageTitle:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v13;
  const __CFString *v14;

  if (a3)
  {
    v9 = +[WFWebPageDecorator webPageWithString:URLString:](WFWebPageToFilterText, "webPageWithString:URLString:", a3, a4, a5);
    v10 = v9;
    if (a6)
      *a6 = (id)objc_msgSend(v9, "pageTitle");
    if (v10)
    {
      v11 = -[WFJudge _pronounceOnWebpage:](self, "_pronounceOnWebpage:", v10);
      objc_msgSend(v11, "setURL:", a4);
      return v11;
    }
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = CFSTR("Allowed, nil webpage");
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = CFSTR("Allowed, nil pageContentString");
  }
  return +[WFVerdict verdictWithRestriction:URL:evidence:LSMEvaluationResult:message:](WFVerdict, "verdictWithRestriction:URL:evidence:LSMEvaluationResult:message:", 0, a4, 2, 0, objc_msgSend(v13, "stringWithFormat:", v14, a4, a5, a6));
}

- (id)pronounceOnPageContent:(id)a3 pageURL:(id)a4 whitelistUserPreferences:(id)a5 debugPage:(id *)a6 pageTitle:(id *)a7
{
  id v10;
  int v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  unsigned __int8 v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v10 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v22 = 1;
  if (a5)
  {
    v12 = objc_msgSend(a5, "filterEnabled", a3, a4, a5, a6);
    if (v12)
      LOBYTE(v12) = objc_msgSend(a5, "whitelistEnabled");
    v22 = v12;
    v13 = (id)objc_msgSend(a5, "pronounceOnPageURLString:shouldFilter:", a4, &v22);
  }
  else
  {
    v13 = 0;
  }
  v14 = __WFDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v13;
    _os_log_impl(&dword_20CD6C000, v14, OS_LOG_TYPE_INFO, "whitelistVerdict: %@", buf, 0xCu);
  }
  if (v10)
    v10 = +[WFWebPageDecorator webPageWithString:URLString:](WFWebPageToFilterText, "webPageWithString:URLString:", v10, a4);
  if (a7)
    *a7 = (id)objc_msgSend(v10, "pageTitle");
  if (objc_msgSend(a4, "hasPrefix:", CFSTR("https://")))
  {
    if (objc_msgSend(a5, "alwaysAllowHTTPS"))
    {
      v15 = CFSTR("Always allow HTTPS");
LABEL_15:
      v16 = a4;
      v17 = 10;
      return +[WFVerdict verdictWithRestriction:URL:evidence:LSMEvaluationResult:message:](WFVerdict, "verdictWithRestriction:URL:evidence:LSMEvaluationResult:message:", 0, v16, v17, 0, v15);
    }
    if (v13
      && (objc_msgSend(a5, "whitelistEnabled") & 1) == 0
      && (!objc_msgSend(a5, "filterEnabled") || objc_msgSend(v13, "evidence") != 8))
    {
      objc_msgSend(v13, "setMessage:", CFSTR("https url but user has no whitelist restrictions"));
      v15 = CFSTR("user has no whitelist restrictions");
      goto LABEL_15;
    }
  }
  else
  {
    v18 = v22;
    v19 = __WFDefaultLog();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (!v13 || v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CD6C000, v19, OS_LOG_TYPE_INFO, "LSM analyzer used to evaluate page content", buf, 2u);
      }
      if (!v10)
      {
        v15 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Allowed, NULL pageContentString"));
        v16 = a4;
        v17 = 2;
        return +[WFVerdict verdictWithRestriction:URL:evidence:LSMEvaluationResult:message:](WFVerdict, "verdictWithRestriction:URL:evidence:LSMEvaluationResult:message:", 0, v16, v17, 0, v15);
      }
      v13 = -[WFJudge _pronounceOnWebpage:](self, "_pronounceOnWebpage:", v10);
      objc_msgSend(v13, "setURL:", a4);
    }
    else if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CD6C000, v19, OS_LOG_TYPE_INFO, "URL found in white/black list, no need to use the LSM analyzer...", buf, 2u);
    }
  }
  return v13;
}

+ (void)defaultJudge
{
  objc_class *v5;
  int v6;
  NSString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  v6 = 138412546;
  v7 = NSStringFromClass(v5);
  v8 = 2112;
  v9 = a2;
  _os_log_fault_impl(&dword_20CD6C000, a3, OS_LOG_TYPE_FAULT, "**** %@ -defaultJudge: LSM map was not found in %@", (uint8_t *)&v6, 0x16u);
}

@end
