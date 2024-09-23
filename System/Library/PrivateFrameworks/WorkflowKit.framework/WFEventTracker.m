@implementation WFEventTracker

- (WFEventTracker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFEventTracker;
  return -[WFEventTracker init](&v3, sel_init);
}

- (void)trackEvent:(id)a3
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  getWFEventTrackerLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  getWFEventTrackerLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    v28 = (char *)objc_opt_class();
    v10 = v28;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TrackEvent", "event=%{signpost.description:attribute}@", buf, 0xCu);

  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEventTracker.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  v11 = (void *)objc_opt_class();
  if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEventTracker.m"), 43, CFSTR("Invalid event tracking attempted with eventClass: %@"), objc_opt_class());

  }
  objc_msgSend(v5, "coreAnalyticsKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  getWFEventTrackerLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      objc_msgSend(v5, "coreAnalyticsKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serializableEvent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v28 = "-[WFEventTracker trackEvent:]";
      v29 = 2114;
      v30 = v15;
      v31 = 2114;
      v32 = v17;
      v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_INFO, "%s Logging event to CoreAnalytics %{public}@ using key %{public}@ %{public}@", buf, 0x2Au);

    }
    objc_msgSend(v5, "coreAnalyticsKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    AnalyticsSendEventLazy();

    v14 = v26;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    v20 = (void *)objc_opt_class();
    *(_DWORD *)buf = 136315394;
    v28 = "-[WFEventTracker trackEvent:]";
    v29 = 2114;
    v30 = v20;
    v21 = v20;
    _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Unable to log event %{public}@ - invalid key", buf, 0x16u);

  }
  getWFEventTrackerLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v23, OS_SIGNPOST_INTERVAL_END, v7, "TrackEvent", ", buf, 2u);
  }

}

uint64_t __29__WFEventTracker_trackEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
}

+ (id)sharedTracker
{
  if (sharedTracker_onceToken != -1)
    dispatch_once(&sharedTracker_onceToken, &__block_literal_global_37163);
  return (id)sharedTracker_eventTracker;
}

void __31__WFEventTracker_sharedTracker__block_invoke()
{
  WFEventTracker *v0;
  void *v1;

  v0 = objc_alloc_init(WFEventTracker);
  v1 = (void *)sharedTracker_eventTracker;
  sharedTracker_eventTracker = (uint64_t)v0;

}

@end
