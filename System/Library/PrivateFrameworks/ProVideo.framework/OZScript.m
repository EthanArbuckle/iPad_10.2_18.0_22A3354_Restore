@implementation OZScript

- (OZScript)init
{
  OZScript *v2;
  JSContext *v3;
  uint64_t v5;
  objc_super v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)OZScript;
  v2 = -[OZScript init](&v6, sel_init);
  if (v2)
  {
    v3 = (JSContext *)objc_alloc_init(MEMORY[0x1E0CBE0F0]);
    v2->_context = v3;
    -[JSContext setExceptionHandler:](v3, "setExceptionHandler:", &__block_literal_global_84);
    -[JSContext setObject:forKeyedSubscript:](v2->_context, "setObject:forKeyedSubscript:", &__block_literal_global_3, CFSTR("print"));
    v5 = 0;
    v2->_paramRegex = (NSRegularExpression *)(id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\s*EXPORT\\s+(CHANNEL_(?:FLOAT|PERCENT|ANGLE|COLOR|POSITION|PADDING|TEXTURE_2D))\\s+var\\s+([a-zA-Z_][a-zA-Z_0-9]*)(.*)"), 0, &v5);
    if (v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("\\s*EXPORT\\s+(CHANNEL_(?:FLOAT|PERCENT|ANGLE|COLOR|POSITION|PADDING|TEXTURE_2D))\\s+var\\s+([a-zA-Z_][a-zA-Z_0-9]*)(.*)");
      _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[JavaScript] Could not create regex: %@", buf, 0xCu);
    }
    SCNExportJavaScriptModule(v2->_context);
    v2->_parameterDescriptors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_alertShown = 0;
  }
  return v2;
}

void __16__OZScript_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a3, "toString");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[JavaScript] %@", (uint8_t *)&v4, 0xCu);
  }
}

void __16__OZScript_init__block_invoke_1(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = a2;
    _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZScript;
  -[OZScript dealloc](&v3, sel_dealloc);
}

- (void)exportObject:(id)a3 as:(id)a4
{
  -[JSContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)objectWithName:(id)a3
{
  return -[JSContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", a3);
}

- (void)dispatch:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __21__OZScript_dispatch___block_invoke;
  v3[3] = &unk_1E657B770;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __21__OZScript_dispatch___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;

  v1 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(v1, "isUndefined");
  if ((result & 1) == 0)
    return objc_msgSend(v1, "callWithArguments:", 0);
  return result;
}

- (void)loadScriptWithURL:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_url = (NSURL *)objc_msgSend(a3, "copy");
  v8 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", a3, 134217984, &v8);
  v6 = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v6, "localizedDescription");
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error while processing script file: %@", buf, 0xCu);
    }
  }
  else
  {
    -[JSContext evaluateScript:](self->_context, "evaluateScript:", -[OZScript preprocess:](self, "preprocess:", v5));
  }
}

- (id)preprocess:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return &stru_1E65EDDA0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
  v8 = &stru_1E65EDDA0;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v8 = (__CFString *)-[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("%@\n"), -[OZScript process:](self, "process:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)));
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v6);
  return v8;
}

- (id)process:(id)a3
{
  id v3;
  NSTextCheckingResult *v5;
  NSTextCheckingResult *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OZShaderParameter *v18;
  uint8_t buf[16];

  v3 = a3;
  if (!objc_msgSend(a3, "containsString:", CFSTR("EXPORT")))
    return v3;
  v5 = -[NSRegularExpression firstMatchInString:options:range:](self->_paramRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[Script] Error parsing published parameter", buf, 2u);
    }
    return &stru_1E65EDDA0;
  }
  v6 = v5;
  v7 = -[NSTextCheckingResult rangeAtIndex:](v5, "rangeAtIndex:", 1);
  v9 = (void *)objc_msgSend(v3, "substringWithRange:", v7, v8);
  v10 = -[NSTextCheckingResult rangeAtIndex:](v6, "rangeAtIndex:", 2);
  v12 = objc_msgSend(v3, "substringWithRange:", v10, v11);
  v13 = -[NSTextCheckingResult rangeAtIndex:](v6, "rangeAtIndex:", 3);
  v15 = objc_msgSend(v3, "substringWithRange:", v13, v14);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_FLOAT")) & 1) != 0)
  {
    v16 = 0;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_PERCENT")) & 1) != 0)
  {
    v16 = 1;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_ANGLE")) & 1) != 0)
  {
    v16 = 4;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_COLOR")) & 1) != 0)
  {
    v16 = 2;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_POSITION")) & 1) != 0)
  {
    v16 = 3;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_PADDING")) & 1) != 0)
  {
    v16 = 5;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_TEXTURE_2D")))
  {
    v16 = 6;
  }
  else
  {
    v16 = 0;
  }
  v18 = -[OZShaderParameter initWithName:type:]([OZShaderParameter alloc], "initWithName:type:", v12, v16);
  -[NSMutableArray addObject:](self->_parameterDescriptors, "addObject:", v18);

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("var %@%@"), v12, v15);
}

- (NSURL)url
{
  return self->_url;
}

- (JSContext)context
{
  return self->_context;
}

- (NSMutableArray)parameterDescriptors
{
  return self->_parameterDescriptors;
}

- (NSRegularExpression)paramRegex
{
  return self->_paramRegex;
}

- (void)setParamRegex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)alertShown
{
  return self->_alertShown;
}

- (void)setAlertShown:(BOOL)a3
{
  self->_alertShown = a3;
}

@end
