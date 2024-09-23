@implementation WFLSMMap

+ (id)mapWithMap:(__LSMMap *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMap:", a3);
}

+ (id)mapFromURL:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMapFromURL:", a3);
}

+ (id)mapFromFilePath:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMapFromFilePath:", a3);
}

- (WFLSMMap)initWithMap:(__LSMMap *)a3
{
  WFLSMMap *v4;
  WFLSMMap *v5;
  CFDictionaryRef Properties;
  double v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  float v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)WFLSMMap;
  v4 = -[WFLSMMap init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    -[WFLSMMap _setMap:](v4, "_setMap:", a3);
    Properties = LSMMapGetProperties(a3);
    if (Properties
      && (v8 = -[__CFDictionary objectForKey:](Properties, "objectForKey:", CFSTR("Explicit Threshold"))) != 0)
    {
      v9 = (void *)v8;
      -[WFLSMMap setThreshold:](v5, "setThreshold:", v8);
      v10 = __WFDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "floatValue");
        *(_DWORD *)buf = 134217984;
        v16 = v11;
        _os_log_impl(&dword_20CD6C000, v10, OS_LOG_TYPE_INFO, "Threshold from LSM map: %f", buf, 0xCu);
      }
    }
    else
    {
      LODWORD(v7) = 1058977874;
      -[WFLSMMap setThreshold:](v5, "setThreshold:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7));
      v12 = __WFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WFLSMMap initWithMap:].cold.1(v12);
    }
  }
  return v5;
}

- (WFLSMMap)initWithMapFromURL:(id)a3
{
  BOOL v5;
  NSObject *v6;
  LSMMapRef v7;
  LSMMapRef v8;
  WFLSMMap *v9;
  NSObject *v10;
  char v12;

  v12 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v12))v5 = v12 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = __WFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WFLSMMap initWithMapFromURL:].cold.2();
    return 0;
  }
  v7 = LSMMapCreateFromURL((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFURLRef)a3, 0);
  if (!v7)
  {
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WFLSMMap initWithMapFromURL:].cold.1();
    return 0;
  }
  v8 = v7;
  v9 = -[WFLSMMap initWithMap:](self, "initWithMap:", v7);
  CFRelease(v8);
  return v9;
}

- (WFLSMMap)initWithMapFromFilePath:(id)a3
{
  return -[WFLSMMap initWithMapFromURL:](self, "initWithMapFromURL:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3));
}

- (__LSMMap)_map
{
  return self->map;
}

- (void)_setMap:(__LSMMap *)a3
{
  __LSMMap *map;

  CFRetain(a3);
  map = self->map;
  if (map)
    CFRelease(map);
  self->map = a3;
}

- (__LSMText)_createLSMTextFromString:(id)a3
{
  __LSMText *v4;
  __LSMText *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  v4 = LSMTextCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], self->map);
  if (!v4)
  {
    v7 = __WFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WFLSMMap _createLSMTextFromString:].cold.1();
    return 0;
  }
  v5 = v4;
  if (a3)
  {
    if (LSMTextAddWords(v4, (CFStringRef)a3, 0, 0))
    {
      v6 = __WFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[WFLSMMap _createLSMTextFromString:].cold.3();
      return 0;
    }
  }
  else
  {
    v8 = __WFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WFLSMMap _createLSMTextFromString:].cold.2();
  }
  return v5;
}

- (int64_t)numberOfCategories
{
  return LSMMapGetCategoryCount(self->map);
}

- (id)evaluate:(id)a3
{
  __LSMText *v4;
  LSMResultRef v5;
  NSObject *v6;
  WFLSMResult *v7;

  v4 = -[WFLSMMap _createLSMTextFromString:](self, "_createLSMTextFromString:", a3);
  v5 = LSMResultCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], self->map, v4, -[WFLSMMap numberOfCategories](self, "numberOfCategories"), 0);
  CFRelease(v4);
  if (!v5)
  {
    v6 = __WFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WFLSMMap evaluate:].cold.1();
  }
  v7 = +[WFLSMResult LSMResultWithLSMResultRef:threshold:](WFLSMResult, "LSMResultWithLSMResultRef:threshold:", v5, -[WFLSMMap threshold](self, "threshold"));
  if (v5)
    CFRelease(v5);
  return v7;
}

- (id)wordDump:(id)a3
{
  __LSMText *v4;
  __CFWriteStream *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[WFLSMMap _createLSMTextFromString:](self, "_createLSMTextFromString:", a3);
  v5 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFAllocatorRef)*MEMORY[0x24BDBD240]);
  CFWriteStreamOpen(v5);
  LSMMapWriteToStream(self->map, v4, v5, 0);
  CFWriteStreamClose(v5);
  v6 = (void *)CFWriteStreamCopyProperty(v5, (CFStreamPropertyKey)*MEMORY[0x24BDBD5B8]);
  CFRelease(v5);
  CFRelease(v4);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v6, "bytes"));

  v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet")), "mutableCopy");
  objc_msgSend(v8, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "reverseObjectEnumerator"), "allObjects"), "componentsJoinedByString:", CFSTR("\n"));
}

- (void)dealloc
{
  __LSMMap *map;
  objc_super v4;

  map = self->map;
  if (map)
    CFRelease(map);
  v4.receiver = self;
  v4.super_class = (Class)WFLSMMap;
  -[WFLSMMap dealloc](&v4, sel_dealloc);
}

- (NSNumber)threshold
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setThreshold:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)initWithMap:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "*** WFLSMMap initWithMap: unable to retrieve threshold from map file.", v1, 2u);
}

- (void)initWithMapFromURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_20CD6C000, v0, v1, "**** WFLSMMap initWithMapFromURL:%@ an error occurred loading the map", v2);
}

- (void)initWithMapFromURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_20CD6C000, v0, v1, "**** WFLSMMap initWithMapFromURL:%@ file doesn't exist", v2);
}

- (void)_createLSMTextFromString:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20CD6C000, v0, v1, "**** %@: Couldn't create text", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_createLSMTextFromString:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20CD6C000, v0, v1, "**** %@: Couldn't create text because the strippedContent is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_createLSMTextFromString:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20CD6C000, v0, v1, "**** %@: LSMTextAddWords failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)evaluate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_4(), "description");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20CD6C000, v0, v1, "**** %@: LSMResultCreate failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
