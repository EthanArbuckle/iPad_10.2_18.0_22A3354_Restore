@implementation MapCachedPageRenderer

- (MapCachedPageRenderer)init
{
  MapCachedPageRenderer *v2;
  NSCache *v3;
  NSCache *printAreaToPrintInfoCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapCachedPageRenderer;
  v2 = -[MapPageRenderer init](&v6, "init");
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    printAreaToPrintInfoCache = v2->_printAreaToPrintInfoCache;
    v2->_printAreaToPrintInfoCache = v3;

  }
  return v2;
}

- (NSString)currentCacheKey
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  -[MapCachedPageRenderer headerHeight](self, "headerHeight");
  v4 = v3;
  -[MapCachedPageRenderer footerHeight](self, "footerHeight");
  v6 = v5;
  -[MapCachedPageRenderer paperRect](self, "paperRect");
  v7 = NSStringFromCGRect(v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[MapCachedPageRenderer printableRect](self, "printableRect");
  v9 = NSStringFromCGRect(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f_%.2f_%@_%@"), v4, v6, v8, v10));

  return (NSString *)v11;
}

- (id)currentPrintInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer currentCacheKey](self, "currentCacheKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_printAreaToPrintInfoCache, "objectForKey:", v3));
  if (!v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MapCachedPageRenderer computeCurrentPrintInfo](self, "computeCurrentPrintInfo"));
    if (v5)
    {
      v4 = (void *)v5;
      -[NSCache setObject:forKey:](self->_printAreaToPrintInfoCache, "setObject:forKey:", v5, v3);
    }
    else
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpectedly could not generate print info for key: %@"), v3));
        *(_DWORD *)buf = 136316162;
        v14 = "-[MapCachedPageRenderer currentPrintInfo]";
        v15 = 2080;
        v16 = "MapCachedPageRenderer.m";
        v17 = 1024;
        v18 = 37;
        v19 = 2080;
        v20 = "printingInfo != nil";
        v21 = 2112;
        v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v10 = sub_1004318FC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v4 = 0;
    }
  }

  return v4;
}

- (id)computeCurrentPrintInfo
{
  return 0;
}

- (NSCache)printAreaToPrintInfoCache
{
  return self->_printAreaToPrintInfoCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printAreaToPrintInfoCache, 0);
}

@end
