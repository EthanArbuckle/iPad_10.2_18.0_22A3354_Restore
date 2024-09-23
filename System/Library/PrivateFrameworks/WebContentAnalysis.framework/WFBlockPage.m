@implementation WFBlockPage

- (id)initNoOveridePageWithUsername:(id)a3
{
  return -[WFBlockPage _initWithUsername:fileName:](self, "_initWithUsername:fileName:", a3, CFSTR("blockpage-nooverride"));
}

- (WFBlockPage)initWithUsername:(id)a3 overridesAllowded:(BOOL)a4
{
  WFBlockPage *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSURL *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WFBlockPage;
  v6 = -[WFBlockPage init](&v22, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = PreferredLanguageForUserName((uint64_t)a3);
    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = CFSTR("English");
    v6->preferredLanguage = (NSString *)v9;
    v10 = CFSTR("blockpage");
    if (!a4)
      v10 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-nooverride"), CFSTR("blockpage"));
    v11 = objc_msgSend(v7, "URLForResource:withExtension:subdirectory:localization:", v10, CFSTR("html"), 0, v9);
    v6->pageTemplateURL = (NSURL *)v11;
    if (!v11)
    {
      v12 = __WFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WFBlockPage initWithUsername:overridesAllowded:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    v20 = v6->pageTemplateURL;
  }
  return v6;
}

- (id)_initWithUsername:(id)a3 fileName:(id)a4
{
  WFBlockPage *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSURL *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)WFBlockPage;
  v6 = -[WFBlockPage init](&v21, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = PreferredLanguageForUserName((uint64_t)a3);
    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = CFSTR("English");
    v6->preferredLanguage = (NSString *)v9;
    v10 = objc_msgSend(v7, "URLForResource:withExtension:subdirectory:localization:", a4, CFSTR("html"), 0, v9);
    v6->pageTemplateURL = (NSURL *)v10;
    if (!v10)
    {
      v11 = __WFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[WFBlockPage _initWithUsername:fileName:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v19 = v6->pageTemplateURL;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFBlockPage;
  -[WFBlockPage dealloc](&v3, sel_dealloc);
}

- (id)_blockpage
{
  NSURL *pageTemplateURL;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  pageTemplateURL = self->pageTemplateURL;
  if (!pageTemplateURL)
    return 0;
  v12 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", pageTemplateURL, 4, &v12);
  if (!v3)
  {
    v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[WFBlockPage _blockpage].cold.1((uint64_t)&v12, v4, v5, v6, v7, v8, v9, v10);
  }
  return v3;
}

- (id)_fileContentWithName:(id)a3 extension:(id)a4
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:subdirectory:localization:", a3, a4, 0, self->preferredLanguage);
  if (v5)
  {
    v16 = 0;
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v5, 4, &v16);
    if (!v6)
    {
      v7 = __WFDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[WFBlockPage _fileContentWithName:extension:].cold.2((uint64_t)a3, &v16, v7);
    }
  }
  else
  {
    v8 = __WFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WFBlockPage _fileContentWithName:extension:].cold.1((uint64_t)a3, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
  return v6;
}

- (id)_css
{
  return -[WFBlockPage _fileContentWithName:extension:](self, "_fileContentWithName:extension:", CFSTR("blockpage_style"), CFSTR("css"));
}

- (id)page
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  v3 = -[WFBlockPage _blockpage](self, "_blockpage");
  if (v3)
  {
    v4 = v3;
    if (self->userVisibleURLString)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = objc_msgSend(v5, "_lp_simplifiedDisplayString");
      else
        v6 = objc_msgSend(v5, "absoluteString");
      v4 = (void *)objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("USER_VISIBLE_RESTRICTED_URL_NO_LOC"), v6);
    }
    if (self->formActionURLString)
      v4 = (void *)objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UNBLOCK_URL_NO_LOC"));
    v8 = -[WFBlockPage _css](self, "_css");
    if (v8)
      return (id)objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("INCLUDE_CSS_FILE_NO_LOC"), v8);
  }
  else
  {
    v7 = __WFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WFBlockPage page].cold.1(v7);
    return 0;
  }
  return v4;
}

- (NSURL)pageTemplateURL
{
  return self->pageTemplateURL;
}

- (NSString)userVisibleURLString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserVisibleURLString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)formActionURLString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFormActionURLString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)initWithUsername:(uint64_t)a3 overridesAllowded:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "**** Error %{public}s: pageTemplateURL is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithUsername:(uint64_t)a3 fileName:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a1, a3, "**** Error %{public}s: pageTemplateURL is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_blockpage
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a2, a3, "**** error loading block page: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_fileContentWithName:(uint64_t)a3 extension:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_20CD6C000, a2, a3, "**** error loading %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_fileContentWithName:(os_log_t)log extension:.cold.2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "**** error loading:%@ error:%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

- (void)page
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "**** ERROR block page is nil", v1, 2u);
}

@end
