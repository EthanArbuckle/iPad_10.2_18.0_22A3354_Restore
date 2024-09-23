@implementation WFImgArrayCache

+ (id)imgArrayCacheWithArray:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:", a3);
}

- (WFImgArrayCache)initWithArray:(id)a3
{
  WFImgArrayCache *v3;
  WFImgArrayCache *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  int64_t *p_numberOfUnknownSizedImages;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)WFImgArrayCache;
  v3 = -[WFImgArrayCache init](&v23, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->numberOfUnknownSizedImages = 0;
    v5 = objc_opt_new();
    v4->numberOfKnownImagePixels = 0;
    v4->imageAlternativeDescriptions = (NSMutableString *)v5;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = __WFDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[WFImgArrayCache initWithArray:].cold.1(v16);
            return v4;
          }
          v11 = objc_msgSend(v10, "area");
          if (v11 == kWFImgDimensionUnknown)
            p_numberOfUnknownSizedImages = &v4->numberOfUnknownSizedImages;
          else
            p_numberOfUnknownSizedImages = &v4->numberOfKnownImagePixels;
          if (v11 == kWFImgDimensionUnknown)
            v13 = 1;
          else
            v13 = v11;
          *p_numberOfUnknownSizedImages += v13;
          v14 = (void *)objc_msgSend(v10, "alt");
          v15 = (void *)objc_msgSend(v10, "title");
          if (v14 && (objc_msgSend(v14, "isEqualToString:", &stru_24C583DA8) & 1) == 0)
            -[NSMutableString appendFormat:](v4->imageAlternativeDescriptions, "appendFormat:", CFSTR("%@\n"), v14);
          if (v15
            && (objc_msgSend(v15, "isEqualToString:", &stru_24C583DA8) & 1) == 0
            && (!v14 || (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0))
          {
            -[NSMutableString appendFormat:](v4->imageAlternativeDescriptions, "appendFormat:", CFSTR("%@\n"), v15);
          }
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
  return v4;
}

- (id)imageAlternativeDescriptions
{
  return self->imageAlternativeDescriptions;
}

- (int64_t)numberOfUnknownSizedImages
{
  return self->numberOfUnknownSizedImages;
}

- (int64_t)numberOfKnownImagePixels
{
  return self->numberOfKnownImagePixels;
}

- (void)dealloc
{
  NSMutableString *imageAlternativeDescriptions;
  objc_super v4;

  imageAlternativeDescriptions = self->imageAlternativeDescriptions;
  if (imageAlternativeDescriptions)

  v4.receiver = self;
  v4.super_class = (Class)WFImgArrayCache;
  -[WFImgArrayCache dealloc](&v4, sel_dealloc);
}

- (void)initWithArray:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[WFImgArrayCache initWithArray:]";
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "**** Warning %{public}s array doesn't contain WFImg objects", (uint8_t *)&v1, 0xCu);
}

@end
