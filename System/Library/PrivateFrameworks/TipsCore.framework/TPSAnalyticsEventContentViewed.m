@implementation TPSAnalyticsEventContentViewed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)resetSessionViewNumber
{
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", &unk_1E39784D0, CFSTR("new_content_viewed"));
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", &unk_1E39784D0, CFSTR("collection_viewed"));
}

+ (BOOL)updateSessionViewNumber
{
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3 - *(double *)&_lastContentViewedRef;
  if (v3 - *(double *)&_lastContentViewedRef > 300.0)
    objc_msgSend(a1, "resetSessionViewNumber");
  return v4 > 300.0;
}

- (TPSAnalyticsEventContentViewed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventContentViewed *v5;
  uint64_t v6;
  NSString *contentID;
  uint64_t v8;
  NSString *collectionID;
  uint64_t v10;
  NSString *correlationID;
  uint64_t v12;
  NSString *clientConditionID;
  uint64_t v14;
  NSString *viewMethod;
  uint64_t v16;
  NSString *viewMode;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentViewed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_ID"));
    v8 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client_condition"));
    v12 = objc_claimAutoreleasedReturnValue();
    clientConditionID = v5->_clientConditionID;
    v5->_clientConditionID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("view_src"));
    v14 = objc_claimAutoreleasedReturnValue();
    viewMethod = v5->_viewMethod;
    v5->_viewMethod = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v16 = objc_claimAutoreleasedReturnValue();
    viewMode = v5->_viewMode;
    v5->_viewMode = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrer"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)_appReferrer;
    _appReferrer = v18;

  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 viewMethod:(id)a7 viewMode:(id)a8
{
  id v15;
  id v16;
  id v17;
  TPSAnalyticsEventContentViewed *v18;
  id *p_isa;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)TPSAnalyticsEventContentViewed;
  v18 = -[TPSAnalyticsEvent initWithDate:](&v24, sel_initWithDate_, 0);
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 7, a6);
    objc_storeStrong(p_isa + 8, a7);
    objc_storeStrong(p_isa + 9, a8);
  }

  return p_isa;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 widgetType:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAnalyticsEventContentViewed *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentViewed;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v21, sel_initWithDate_, 0);
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentID, a3);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 7, a6);
    objc_storeStrong(p_isa + 10, a7);
  }

  return p_isa;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 widgetType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContentID:collectionID:correlationID:clientConditionID:widgetType:", v16, v15, v14, v13, v12);

  return v17;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 viewMethod:(id)a7 viewMode:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentViewed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientConditionID, CFSTR("client_condition"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_viewMethod, CFSTR("view_src"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_viewMode, CFSTR("mode"));
  objc_msgSend(v4, "encodeObject:forKey:", _appReferrer, CFSTR("referrer"));

}

- (BOOL)isWidget
{
  return -[NSString isEqualToString:](self->_viewMode, "isEqualToString:", CFSTR("widget"));
}

- (id)eventName
{
  _BOOL4 v2;
  const __CFString *v3;

  v2 = -[TPSAnalyticsEventContentViewed isWidget](self, "isWidget");
  v3 = CFSTR("content_viewed");
  if (v2)
    v3 = CFSTR("content_viewed_in_widget");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)log
{
  uint64_t v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  _lastContentViewedRef = v3;
  v4.receiver = self;
  v4.super_class = (Class)TPSAnalyticsEventContentViewed;
  -[TPSAnalyticsEvent log](&v4, "log");
}

+ (void)incrementSessionViewNumberForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", v4, v3);

}

- (NSNumber)sessionViewNumber
{
  return (NSNumber *)+[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("new_content_viewed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  const __CFString *v5;
  int *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_contentID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientConditionID, CFSTR("client_condition"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("u65_flag"));

  if (-[TPSAnalyticsEventContentViewed isWidget](self, "isWidget"))
  {
    v5 = CFSTR("widget_type");
    v6 = &OBJC_IVAR___TPSAnalyticsEventContentViewed__widgetType;
  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_viewMethod, CFSTR("view_src"));
    v5 = CFSTR("mode");
    v6 = &OBJC_IVAR___TPSAnalyticsEventContentViewed__viewMode;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(Class *)((char *)&self->super.super.isa + *v6), v5);
  if (_appReferrer)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", _appReferrer, CFSTR("referrer"));
  return v3;
}

+ (void)setAppReferrer:(id)a3
{
  objc_storeStrong((id *)&_appReferrer, a3);
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_storeStrong((id *)&self->_correlationID, a3);
}

- (NSString)clientConditionID
{
  return self->_clientConditionID;
}

- (void)setClientConditionID:(id)a3
{
  objc_storeStrong((id *)&self->_clientConditionID, a3);
}

- (NSString)viewMethod
{
  return self->_viewMethod;
}

- (void)setViewMethod:(id)a3
{
  objc_storeStrong((id *)&self->_viewMethod, a3);
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(id)a3
{
  objc_storeStrong((id *)&self->_viewMode, a3);
}

- (NSString)widgetType
{
  return self->_widgetType;
}

- (void)setWidgetType:(id)a3
{
  objc_storeStrong((id *)&self->_widgetType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetType, 0);
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_viewMethod, 0);
  objc_storeStrong((id *)&self->_clientConditionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
