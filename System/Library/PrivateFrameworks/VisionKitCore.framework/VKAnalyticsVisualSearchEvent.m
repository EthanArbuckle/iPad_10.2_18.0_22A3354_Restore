@implementation VKAnalyticsVisualSearchEvent

- (VKAnalyticsVisualSearchEvent)initWithType:(int64_t)a3 items:(id)a4 interactedItem:(id)a5 serverProcessingTime:(double)a6 customIdentifier:(id)a7
{
  id v12;
  id v13;
  VKAnalyticsVisualSearchEvent *v14;
  VKAnalyticsVisualSearchEvent *v15;
  BOOL v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VKAnalyticsVisualSearchEvent;
  v14 = -[VKAnalyticsEvent initWithCustomIdentifier:](&v19, sel_initWithCustomIdentifier_, a7);
  v15 = v14;
  if (v14)
  {
    v14->_eventType = a3;
    v14->_serverProcessingTime = a6;
    objc_storeStrong((id *)&v14->_interactedItem, a5);
    v17 = a6 == 0.0 && v15->_eventType == 2;
    v15->_serverResultWasCached = v17;
    -[VKAnalyticsVisualSearchEvent processItems:](v15, "processItems:", v12);
  }

  return v15;
}

- (id)eventKey
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[VKAnalyticsVisualSearchEvent eventType](self, "eventType");
  v3 = CFSTR("VisualSearchEvent.items.activated");
  if (v2 != 2)
    v3 = 0;
  if (v2 == 1)
    return CFSTR("VisualSearchEvent.items.hidden");
  else
    return (id)v3;
}

- (id)coreAnalyticsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  VKMUIStringForVKAnalyticsVisualSearchEventType(-[VKAnalyticsVisualSearchEvent eventType](self, "eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", CFSTR("eventType"), v4);

  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("automatedTest"));

  v7 = -[VKAnalyticsVisualSearchEvent eventType](self, "eventType");
  if (v7 == 2)
  {
    -[VKAnalyticsVisualSearchEvent itemDomain](self, "itemDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", CFSTR("domain"), v14);

    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[VKAnalyticsVisualSearchEvent serverProcessingTime](self, "serverProcessingTime");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", CFSTR("serverProcessingTime"), v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsVisualSearchEvent serverResultWasCached](self, "serverResultWasCached"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", CFSTR("serverResultWasCached"), v17);

    -[VKAnalyticsVisualSearchEvent itemDomain](self, "itemDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v3;
    v12 = CFSTR("domain");
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsVisualSearchEvent didInteractWithResultItem](self, "didInteractWithResultItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", CFSTR("didInteractWithItem"), v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsVisualSearchEvent itemCount](self, "itemCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", CFSTR("itemCount"), v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsVisualSearchEvent focalPointItemCount](self, "focalPointItemCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", CFSTR("focalPointItemCount"), v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsVisualSearchEvent itemCount](self, "itemCount")- -[VKAnalyticsVisualSearchEvent focalPointItemCount](self, "focalPointItemCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("nonFocalPointItemCount");
    v13 = v3;
LABEL_5:
    objc_msgSend(v13, "vk_addKey:forNonNilObject:", v12, v11);

  }
  return v3;
}

- (void)processItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[VKAnalyticsVisualSearchEvent setItemCount:](self, "setItemCount:", objc_msgSend(v4, "count"));
  v5 = objc_alloc(MEMORY[0x1E0CB3550]);
  objc_msgSend(v4, "vk_compactMap:", &__block_literal_global_18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);
  -[VKAnalyticsVisualSearchEvent setAllItemDomains:](self, "setAllItemDomains:", v7);

  v8 = objc_msgSend(v4, "vk_countOfObjectsPassingTest:", &__block_literal_global_47);
  -[VKAnalyticsVisualSearchEvent setFocalPointItemCount:](self, "setFocalPointItemCount:", v8);
}

id __45__VKAnalyticsVisualSearchEvent_processItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "domainInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __45__VKAnalyticsVisualSearchEvent_processItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "domainInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasFocalPoint");

  return v3;
}

- (int64_t)nonFocalPointItemCount
{
  int64_t v3;

  v3 = -[VKAnalyticsVisualSearchEvent itemCount](self, "itemCount");
  return v3 - -[VKAnalyticsVisualSearchEvent focalPointItemCount](self, "focalPointItemCount");
}

- (NSString)itemDomain
{
  void *v2;
  void *v3;
  void *v4;

  -[VKAnalyticsVisualSearchEvent interactedItem](self, "interactedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)itemHasFocalPoint
{
  void *v2;
  void *v3;
  char v4;

  -[VKAnalyticsVisualSearchEvent interactedItem](self, "interactedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasFocalPoint");

  return v4;
}

- (int64_t)type
{
  return 6;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[VKAnalyticsVisualSearchEvent allItemDomains](self, "allItemDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __43__VKAnalyticsVisualSearchEvent_description__block_invoke;
  v24[3] = &unk_1E9464220;
  v25 = v3;
  v26 = v4;
  v22 = v4;
  v5 = v3;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v24);
  v21 = (void *)MEMORY[0x1E0CB3940];
  v23.receiver = self;
  v23.super_class = (Class)VKAnalyticsVisualSearchEvent;
  -[VKAnalyticsVisualSearchEvent description](&v23, sel_description);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForVKAnalyticsVisualSearchEventType(-[VKAnalyticsVisualSearchEvent eventType](self, "eventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[VKAnalyticsVisualSearchEvent itemCount](self, "itemCount");
  v7 = -[VKAnalyticsVisualSearchEvent focalPointItemCount](self, "focalPointItemCount");
  v8 = -[VKAnalyticsVisualSearchEvent nonFocalPointItemCount](self, "nonFocalPointItemCount");
  VKMUIStringForBool(-[VKAnalyticsVisualSearchEvent didInteractWithResultItem](self, "didInteractWithResultItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsVisualSearchEvent itemDomain](self, "itemDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsVisualSearchEvent itemHasFocalPoint](self, "itemHasFocalPoint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsVisualSearchEvent serverProcessingTime](self, "serverProcessingTime");
  v13 = v12;
  VKMUIStringForBool(-[VKAnalyticsVisualSearchEvent serverResultWasCached](self, "serverResultWasCached"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ \n eventType: %@ \n itemCount: %lu \n focalPointItemCount: %ld \n nonFocalPointItemCount: %ld \n didInteractWithResultItem: %@ \n allDomains: \n %@itemDomain: %@ \n itemHasFocalPoint: %@ \n serverProcessingTime: %f \n serverResultWasCached: %@ \n automatedTest: %@ \n bundleIdentifier: %@ \n "), v20, v6, v19, v7, v8, v9, v5, v10, v11, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __43__VKAnalyticsVisualSearchEvent_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "appendFormat:", CFSTR("\t%@: %ld\n "), v4, objc_msgSend(v3, "countForObject:", v4));

}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (BOOL)didInteractWithResultItem
{
  return self->_didInteractWithResultItem;
}

- (void)setDidInteractWithResultItem:(BOOL)a3
{
  self->_didInteractWithResultItem = a3;
}

- (NSCountedSet)allItemDomains
{
  return self->_allItemDomains;
}

- (void)setAllItemDomains:(id)a3
{
  objc_storeStrong((id *)&self->_allItemDomains, a3);
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(int64_t)a3
{
  self->_itemCount = a3;
}

- (int64_t)focalPointItemCount
{
  return self->_focalPointItemCount;
}

- (void)setFocalPointItemCount:(int64_t)a3
{
  self->_focalPointItemCount = a3;
}

- (double)serverProcessingTime
{
  return self->_serverProcessingTime;
}

- (void)setServerProcessingTime:(double)a3
{
  self->_serverProcessingTime = a3;
}

- (BOOL)serverResultWasCached
{
  return self->_serverResultWasCached;
}

- (void)setServerResultWasCached:(BOOL)a3
{
  self->_serverResultWasCached = a3;
}

- (VKCVisualSearchResultItem)interactedItem
{
  return self->_interactedItem;
}

- (void)setInteractedItem:(id)a3
{
  objc_storeStrong((id *)&self->_interactedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactedItem, 0);
  objc_storeStrong((id *)&self->_allItemDomains, 0);
}

@end
