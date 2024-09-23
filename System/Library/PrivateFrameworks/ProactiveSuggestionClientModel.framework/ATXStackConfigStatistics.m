@implementation ATXStackConfigStatistics

- (ATXStackConfigStatistics)initWithBuilder:(id)a3
{
  id v4;
  ATXStackConfigStatistics *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *widgetBundleId;
  uint64_t v13;
  NSString *widgetKind;
  uint64_t v15;
  NSString *containerBundleIdentifier;
  uint64_t v17;
  NSDate *timestamp;
  ATXStackConfigStatistics *v19;
  NSObject *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ATXStackConfigStatistics;
  v5 = -[ATXStackConfigStatistics init](&v22, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "widgetBundleId");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "widgetKind");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(v4, "widgetFamily");

      if (v10)
      {
        objc_msgSend(v4, "widgetBundleId");
        v11 = objc_claimAutoreleasedReturnValue();
        widgetBundleId = v5->_widgetBundleId;
        v5->_widgetBundleId = (NSString *)v11;

        objc_msgSend(v4, "widgetKind");
        v13 = objc_claimAutoreleasedReturnValue();
        widgetKind = v5->_widgetKind;
        v5->_widgetKind = (NSString *)v13;

        objc_msgSend(v4, "containerBundleIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        containerBundleIdentifier = v5->_containerBundleIdentifier;
        v5->_containerBundleIdentifier = (NSString *)v15;

        v5->_widgetFamily = objc_msgSend(v4, "widgetFamily");
        objc_msgSend(v4, "timestamp");
        v17 = objc_claimAutoreleasedReturnValue();
        timestamp = v5->_timestamp;
        v5->_timestamp = (NSDate *)v17;

        v5->_countOfSmartStacksWithWidget = objc_msgSend(v4, "countOfSmartStacksWithWidget");
        v5->_countOfNonSmartStacksWithWidget = objc_msgSend(v4, "countOfNonSmartStacksWithWidget");
        v5->_countOfStandaloneWidgets = objc_msgSend(v4, "countOfStandaloneWidgets");
        v5->_countOfWidgetsWithUnknownStackKind = objc_msgSend(v4, "countOfWidgetsWithUnknownStackKind");
LABEL_6:
        v19 = v5;
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  __atxlog_handle_timeline();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[ATXStackConfigStatistics initWithBuilder:].cold.1(v4, v20);

  v19 = 0;
LABEL_11:

  return v19;
}

+ (id)stackConfigStatisticsWithWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 withBlock:(id)a7
{
  void (**v11)(id, ATXStackConfigStatisticsBuilder *);
  id v12;
  id v13;
  id v14;
  ATXStackConfigStatisticsBuilder *v15;
  void *v16;

  v11 = (void (**)(id, ATXStackConfigStatisticsBuilder *))a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[ATXStackConfigStatisticsBuilder initWithWidgetBundleId:widgetKind:containerBundleIdentifier:widgetFamily:]([ATXStackConfigStatisticsBuilder alloc], "initWithWidgetBundleId:widgetKind:containerBundleIdentifier:widgetFamily:", v14, v13, v12, a6);

  v11[2](v11, v15);
  -[ATXStackConfigStatisticsBuilder build](v15, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_widgetBundleId, CFSTR("WidgetBundleId"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_widgetKind, CFSTR("WidgetKind"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_containerBundleIdentifier, CFSTR("WidgetContainerBundleIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_widgetFamily);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("WidgetFamily"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_countOfSmartStacksWithWidget);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("countOfSmartStacksWithWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_countOfNonSmartStacksWithWidget);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("countOfNonSmartStacksWithWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_countOfStandaloneWidgets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("countOfStandaloneWidgets"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_countOfWidgetsWithUnknownStackKind);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("countOfWidgetsWithUnknownStackKind"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_timestamp, CFSTR("timestamp"));
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXStackConfigStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionWithLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)countOfSmartStacksWithWidget
{
  return self->_countOfSmartStacksWithWidget;
}

- (int64_t)countOfNonSmartStacksWithWidget
{
  return self->_countOfNonSmartStacksWithWidget;
}

- (int64_t)countOfStandaloneWidgets
{
  return self->_countOfStandaloneWidgets;
}

- (int64_t)countOfWidgetsWithUnknownStackKind
{
  return self->_countOfWidgetsWithUnknownStackKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
}

- (void)initWithBuilder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "widgetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widgetKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 2048;
  v11 = objc_msgSend(a1, "widgetFamily");
  _os_log_error_impl(&dword_1AA841000, a2, OS_LOG_TYPE_ERROR, "Error initializing ATXStackConfigStatistics; %@, %@ and %ld must be non-null",
    (uint8_t *)&v6,
    0x20u);

}

@end
