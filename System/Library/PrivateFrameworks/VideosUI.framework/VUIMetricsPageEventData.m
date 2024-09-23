@implementation VUIMetricsPageEventData

- (void)setPageType:(id)a3
{
  objc_storeStrong((id *)&self->_pageType, a3);
}

- (void)setPageId:(id)a3
{
  objc_storeStrong((id *)&self->_pageId, a3);
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (NSString)pageType
{
  return self->_pageType;
}

- (NSString)pageId
{
  return self->_pageId;
}

- (id)generateMetricsDataDictionary
{
  const __CFString *pageType;
  const __CFString *pageId;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  pageType = &stru_1E9FF3598;
  v9[0] = CFSTR("pageId");
  v9[1] = CFSTR("pageType");
  pageId = (const __CFString *)self->_pageId;
  if (!pageId)
    pageId = &stru_1E9FF3598;
  if (self->_pageType)
    pageType = (const __CFString *)self->_pageType;
  v10[0] = pageId;
  v10[1] = pageType;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventData)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
    v7 = objc_msgSend(v6, "copy");

    v5 = (void *)v7;
  }
  return v5;
}

- (NSDictionary)eventData
{
  return self->_eventData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
}

+ (id)createWithPageId:(id)a3 andPageType:(id)a4 andEventData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setPageId:", v10);

  objc_msgSend(v11, "setPageType:", v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "setEventData:", v8);

  return v11;
}

+ (id)createWithMetricsData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "mutableCopy");

  v11[0] = CFSTR("pageId");
  v11[1] = CFSTR("pageType");
  v11[2] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsForKeys:", v8);

  objc_msgSend(a1, "createWithPageId:andPageType:andEventData:", v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)createWithPageType:(id)a3
{
  return (id)objc_msgSend(a1, "createWithPageId:andPageType:andEventData:", a3, a3, 0);
}

@end
