@implementation WebCoreStatistics

+ (id)statistics
{
  return +[WebCache statistics](WebCache, "statistics");
}

+ (unint64_t)javaScriptObjectsCount
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE v7[8];

  v2 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (*MEMORY[0x1E0DD1108])
  {
    MEMORY[0x1D82A33BC](v7);
    v3 = *v2;
    if (!*v2)
      goto LABEL_5;
  }
  else
  {
    v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1D82A33BC](v7, v4);
    v3 = *v2;
    if (!*v2)
LABEL_5:
      v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  v5 = JSC::Heap::objectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1D82A33C8](v7);
  return v5;
}

+ (unint64_t)javaScriptGlobalObjectsCount
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE v7[8];

  v2 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (*MEMORY[0x1E0DD1108])
  {
    MEMORY[0x1D82A33BC](v7);
    v3 = *v2;
    if (!*v2)
      goto LABEL_5;
  }
  else
  {
    v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1D82A33BC](v7, v4);
    v3 = *v2;
    if (!*v2)
LABEL_5:
      v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  v5 = JSC::Heap::globalObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1D82A33C8](v7);
  return v5;
}

+ (unint64_t)javaScriptProtectedObjectsCount
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE v7[8];

  v2 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (*MEMORY[0x1E0DD1108])
  {
    MEMORY[0x1D82A33BC](v7);
    v3 = *v2;
    if (!*v2)
      goto LABEL_5;
  }
  else
  {
    v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1D82A33BC](v7, v4);
    v3 = *v2;
    if (!*v2)
LABEL_5:
      v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  v5 = JSC::Heap::protectedObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1D82A33C8](v7);
  return v5;
}

+ (unint64_t)javaScriptProtectedGlobalObjectsCount
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE v7[8];

  v2 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (*MEMORY[0x1E0DD1108])
  {
    MEMORY[0x1D82A33BC](v7);
    v3 = *v2;
    if (!*v2)
      goto LABEL_5;
  }
  else
  {
    v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1D82A33BC](v7, v4);
    v3 = *v2;
    if (!*v2)
LABEL_5:
      v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  v5 = JSC::Heap::protectedGlobalObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1D82A33C8](v7);
  return v5;
}

+ (id)javaScriptProtectedObjectTypeCounts
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CFTypeRef v6;
  uint64_t *v8;
  CFTypeRef cf;
  _BYTE v10[8];

  v2 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (*MEMORY[0x1E0DD1108])
  {
    MEMORY[0x1D82A33BC](v10);
    v3 = *v2;
    if (*v2)
      goto LABEL_6;
  }
  else
  {
    v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1D82A33BC](v10, v4);
    v3 = *v2;
    if (*v2)
      goto LABEL_6;
  }
  v3 = WebCore::commonVMSlow((WebCore *)v3);
LABEL_6:
  JSC::Heap::protectedObjectTypeCounts((JSC::Heap *)(v3 + 192));
  createNSCountedSet((uint64_t *)&cf, v8);
  v6 = (id)CFMakeCollectable(cf);
  if (v8)
  {
    if (*v8)
      WTF::fastFree((WTF *)(*v8 - 16), v5);
    WTF::fastFree((WTF *)v8, v5);
  }
  MEMORY[0x1D82A33C8](v10);
  return (id)v6;
}

+ (id)javaScriptObjectTypeCounts
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CFTypeRef v6;
  uint64_t *v8;
  CFTypeRef cf;
  _BYTE v10[8];

  v2 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (*MEMORY[0x1E0DD1108])
  {
    MEMORY[0x1D82A33BC](v10);
    v3 = *v2;
    if (*v2)
      goto LABEL_6;
  }
  else
  {
    v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1D82A33BC](v10, v4);
    v3 = *v2;
    if (*v2)
      goto LABEL_6;
  }
  v3 = WebCore::commonVMSlow((WebCore *)v3);
LABEL_6:
  JSC::Heap::objectTypeCounts((JSC::Heap *)(v3 + 192));
  createNSCountedSet((uint64_t *)&cf, v8);
  v6 = (id)CFMakeCollectable(cf);
  if (v8)
  {
    if (*v8)
      WTF::fastFree((WTF *)(*v8 - 16), v5);
    WTF::fastFree((WTF *)v8, v5);
  }
  MEMORY[0x1D82A33C8](v10);
  return (id)v6;
}

+ (void)garbageCollectJavaScriptObjects
{
  WebCore::GCController *v2;

  v2 = (WebCore::GCController *)WebCore::GCController::singleton((WebCore::GCController *)a1);
  WebCore::GCController::garbageCollectNow(v2);
}

+ (void)garbageCollectJavaScriptObjectsOnAlternateThreadForDebugging:(BOOL)a3
{
  WebCore::GCController *v3;

  v3 = (WebCore::GCController *)WebCore::GCController::singleton((WebCore::GCController *)a1);
  WebCore::GCController::garbageCollectOnAlternateThreadForDebugging(v3);
}

+ (void)setJavaScriptGarbageCollectorTimerEnabled:(BOOL)a3
{
  WebCore::GCController *v3;

  v3 = (WebCore::GCController *)WebCore::GCController::singleton((WebCore::GCController *)a1);
  WebCore::GCController::setJavaScriptGarbageCollectorTimerEnabled(v3);
}

+ (unint64_t)iconPageURLMappingCount
{
  return 0;
}

+ (unint64_t)iconRetainedPageURLCount
{
  return 0;
}

+ (unint64_t)iconRecordCount
{
  return 0;
}

+ (unint64_t)iconsWithDataCount
{
  return 0;
}

+ (unint64_t)cachedFontDataCount
{
  WebCore::FontCache *v2;

  v2 = (WebCore::FontCache *)WebCore::FontCache::forCurrentThread((WebCore::FontCache *)a1);
  return WebCore::FontCache::fontCount(v2);
}

+ (unint64_t)cachedFontDataInactiveCount
{
  WebCore::FontCache *v2;

  v2 = (WebCore::FontCache *)WebCore::FontCache::forCurrentThread((WebCore::FontCache *)a1);
  return WebCore::FontCache::inactiveFontCount(v2);
}

+ (void)purgeInactiveFontData
{
  WebCore::FontCache *v2;

  v2 = (WebCore::FontCache *)WebCore::FontCache::forCurrentThread((WebCore::FontCache *)a1);
  WebCore::FontCache::purgeInactiveFontData(v2);
}

+ (unint64_t)glyphPageCount
{
  return *MEMORY[0x1E0DD5C28];
}

+ (BOOL)shouldPrintExceptions
{
  WebCore::PageConsoleClient *v2;
  char shouldPrintExceptions;
  _BYTE v5[8];

  if (!*MEMORY[0x1E0DD1108])
    WebCore::commonVMSlow((WebCore *)a1);
  v2 = (WebCore::PageConsoleClient *)MEMORY[0x1D82A33BC](v5);
  shouldPrintExceptions = WebCore::PageConsoleClient::shouldPrintExceptions(v2);
  MEMORY[0x1D82A33C8](v5);
  return shouldPrintExceptions;
}

+ (void)setShouldPrintExceptions:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE v4[8];

  v3 = a3;
  if (!*MEMORY[0x1E0DD1108])
    WebCore::commonVMSlow((WebCore *)a1);
  MEMORY[0x1D82A33BC](v4);
  WebCore::PageConsoleClient::setShouldPrintExceptions((WebCore::PageConsoleClient *)v3);
  MEMORY[0x1D82A33C8](v4);
}

+ (void)emptyCache
{
  +[WebCache empty](WebCache, "empty");
}

+ (void)setCacheDisabled:(BOOL)a3
{
  +[WebCache setDisabled:](WebCache, "setDisabled:", a3);
}

+ (id)memoryStatistics
{
  WebCore *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  JSC *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v2 = (WebCore *)WTF::fastMallocStatistics((WTF *)a1);
  v3 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (!*MEMORY[0x1E0DD1108])
    WebCore::commonVMSlow(v2);
  MEMORY[0x1D82A33BC](v13);
  v4 = *v3;
  if (!*v3)
    v4 = WebCore::commonVMSlow(0);
  v5 = JSC::Heap::size((JSC::Heap *)(v4 + 192));
  v6 = *v3;
  if (!*v3)
    v6 = WebCore::commonVMSlow(0);
  v7 = (JSC *)JSC::Heap::capacity((JSC::Heap *)(v6 + 192));
  v8 = JSC::globalMemoryStatistics(v7);
  v10 = v9;
  v17[0] = CFSTR("FastMallocReservedVMBytes");
  v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v14);
  v17[1] = CFSTR("FastMallocCommittedVMBytes");
  v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
  v17[2] = CFSTR("FastMallocFreeListBytes");
  v18[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v16);
  v17[3] = CFSTR("JavaScriptHeapSize");
  v18[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v5);
  v17[4] = CFSTR("JavaScriptFreeSize");
  v18[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (char *)v7 - v5);
  v17[5] = CFSTR("JavaScriptStackSize");
  v18[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v8);
  v17[6] = CFSTR("JavaScriptJITSize");
  v18[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v10);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  MEMORY[0x1D82A33C8](v13);
  return v11;
}

+ (int)cachedPageCount
{
  _QWORD *v2;

  v2 = (_QWORD *)WebCore::BackForwardCache::singleton((WebCore::BackForwardCache *)a1);
  if (*v2)
    return *(_DWORD *)(*v2 - 12);
  else
    return 0;
}

+ (int)cachedFrameCount
{
  WebCore::BackForwardCache *v2;

  v2 = (WebCore::BackForwardCache *)WebCore::BackForwardCache::singleton((WebCore::BackForwardCache *)a1);
  return WebCore::BackForwardCache::frameCount(v2);
}

+ (int)autoreleasedPageCount
{
  return 0;
}

+ (unint64_t)javaScriptNoGCAllowedObjectsCount
{
  return 0;
}

+ (unint64_t)javaScriptReferencedObjectsCount
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE v7[8];

  v2 = (uint64_t *)MEMORY[0x1E0DD1108];
  if (*MEMORY[0x1E0DD1108])
  {
    MEMORY[0x1D82A33BC](v7);
    v3 = *v2;
    if (!*v2)
      goto LABEL_5;
  }
  else
  {
    v4 = WebCore::commonVMSlow((WebCore *)a1);
    MEMORY[0x1D82A33BC](v7, v4);
    v3 = *v2;
    if (!*v2)
LABEL_5:
      v3 = WebCore::commonVMSlow((WebCore *)v3);
  }
  v5 = JSC::Heap::protectedObjectCount((JSC::Heap *)(v3 + 192));
  MEMORY[0x1D82A33C8](v7);
  return v5;
}

@end
