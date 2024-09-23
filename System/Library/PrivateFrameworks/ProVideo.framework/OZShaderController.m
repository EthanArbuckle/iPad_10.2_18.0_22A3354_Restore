@implementation OZShaderController

- (OZShaderController)initWithURL:(id)a3
{
  OZShaderController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OZShaderController;
  v4 = -[OZShaderController init](&v6, sel_init);
  if (v4)
  {
    v4->_parameters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[OZShaderController initRegex](v4, "initRegex");
    -[OZShaderController loadShaderWithURL:](v4, "loadShaderWithURL:", a3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZShaderController;
  -[OZShaderController dealloc](&v3, sel_dealloc);
}

- (void)initRegex
{
  self->_paramRegex = (NSRegularExpression *)(id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\s*EXPORT\\s+(CHANNEL_(?:FLOAT|PERCENT|ANGLE|COLOR|POSITION|PADDING|TEXTURE_2D|TRANSFORM))\\s+(float[1-4]?|texture2d<float>|float4x4)\\s+([a-zA-Z_][a-zA-Z_0-9]*)(.*)"), 0, 0);
  self->_functionRegex = (NSRegularExpression *)(id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\s*(?:vertex|fragment)\\s+(?:[a-zA-Z_][a-zA-Z_0-9]*)\\s+([a-zA-Z_][a-zA-Z_0-9]*)"), 0, 0);
}

- (void)loadShaderWithURL:(id)a3
{
  NSString *v5;
  NSString *v6;
  NSString *v7;
  MTLDevice *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_url = (NSURL *)objc_msgSend(a3, "copy");
  v5 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", a3, 134217984, 0);
  self->_shader = v5;
  if (v5)
  {
    v6 = -[OZShaderController preprocess:](self, "preprocess:", v5);
    self->_shader = v6;
    v7 = v6;
    if (self->_shader)
    {
      v8 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      self->_device = v8;
      v11 = 0;
      self->_library = (MTLLibrary *)-[MTLDevice newLibraryWithSource:options:error:](v8, "newLibraryWithSource:options:error:", self->_shader, 0, &v11);
      v9 = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_msgSend(v9, "localizedDescription");
          *(_DWORD *)buf = 138412290;
          v13 = v10;
          _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[Shader] Error while processing script file: %@", buf, 0xCu);
        }
      }
    }
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
      v8 = (__CFString *)-[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("%@\n"), -[OZShaderController process:](self, "process:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)));
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  OZShaderParameter *v21;
  uint8_t buf[16];

  v3 = a3;
  if (!objc_msgSend(a3, "containsString:", CFSTR("EXPORT")))
  {
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("vertex")))
    {
      self->_vertexFunctionName = (NSString *)-[OZShaderController functionNameFromLine:](self, "functionNameFromLine:", v3);
    }
    else if (objc_msgSend(v3, "hasPrefix:", CFSTR("fragment")))
    {
      self->_fragmentFunctionName = (NSString *)-[OZShaderController functionNameFromLine:](self, "functionNameFromLine:", v3);
    }
    return v3;
  }
  v5 = -[NSRegularExpression firstMatchInString:options:range:](self->_paramRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[Shader] Error parsing published parameter", buf, 2u);
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
  v16 = -[NSTextCheckingResult rangeAtIndex:](v6, "rangeAtIndex:", 4);
  v18 = objc_msgSend(v3, "substringWithRange:", v16, v17);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_FLOAT")) & 1) != 0)
  {
    v19 = 0;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_PERCENT")) & 1) != 0)
  {
    v19 = 1;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_ANGLE")) & 1) != 0)
  {
    v19 = 4;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_COLOR")) & 1) != 0)
  {
    v19 = 2;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_POSITION")) & 1) != 0)
  {
    v19 = 3;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_PADDING")) & 1) != 0)
  {
    v19 = 5;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_TEXTURE_2D")) & 1) != 0)
  {
    v19 = 6;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("CHANNEL_TRANSFORM")))
  {
    v19 = 7;
  }
  else
  {
    v19 = 0;
  }
  v21 = -[OZShaderParameter initWithName:type:]([OZShaderParameter alloc], "initWithName:type:", v15, v19);
  -[NSMutableArray addObject:](self->_parameters, "addObject:", v21);

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@%@"), v12, v15, v18);
}

- (id)functionNameFromLine:(id)a3
{
  id result;
  uint64_t v5;
  uint64_t v6;

  result = -[NSRegularExpression firstMatchInString:options:range:](self->_functionRegex, "firstMatchInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  if (result)
  {
    v5 = objc_msgSend(result, "rangeAtIndex:", 1);
    return (id)objc_msgSend(a3, "substringWithRange:", v5, v6);
  }
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (NSString)vertexFunctionName
{
  return self->_vertexFunctionName;
}

- (NSString)fragmentFunctionName
{
  return self->_fragmentFunctionName;
}

- (NSString)shader
{
  return self->_shader;
}

- (void)setShader:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSRegularExpression)paramRegex
{
  return self->_paramRegex;
}

- (void)setParamRegex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSRegularExpression)functionRegex
{
  return self->_functionRegex;
}

- (void)setFunctionRegex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
