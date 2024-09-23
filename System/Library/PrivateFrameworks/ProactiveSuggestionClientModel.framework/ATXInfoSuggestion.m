@implementation ATXInfoSuggestion

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v4 = -[NSString hash](self->_widgetBundleIdentifier, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_widgetKind, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_criterion, "hash");
  v7 = self->_layouts - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = -[NSString hash](self->_suggestionIdentifier, "hash") - v7 + 32 * v7;
  return -[NSDictionary hash](self->_metadata, "hash") - v8 + 32 * v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATXInfoSuggestion;
  -[ATXInfoSuggestion dealloc](&v4, sel_dealloc);
}

- (ATXInfoSuggestion)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  ATXInfoSuggestion *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  ATXInfoSuggestion *v45;
  void *v46;
  void *v47;
  void *v49;
  void *context;
  void *v51;
  NSObject *obj;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXInfoSuggestion initWithProto:].cold.7((uint64_t)self, v5);
      v12 = 0;
      goto LABEL_42;
    }
    v5 = v4;
    -[NSObject appBundleIdentifier](v5, "appBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject widgetBundleIdentifier](v5, "widgetBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject criterion](v5, "criterion");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v6 || !v7 || !v8)
    {
      __atxlog_handle_gi();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXInfoSuggestion initWithProto:].cold.6();
      v12 = 0;
      goto LABEL_41;
    }
    -[NSObject archivedIntent](v5, "archivedIntent");
    v54 = v7;
    v55 = v6;
    obj = objc_claimAutoreleasedReturnValue();
    v53 = v9;
    if (obj)
    {
      __atxlog_handle_gi();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[ATXInfoSuggestion initWithProto:].cold.5();
      v11 = 0;
    }
    else
    {
      if (!-[NSObject hasArchivedIntentDescription](v5, "hasArchivedIntentDescription"))
      {
        v51 = 0;
LABEL_28:
        -[NSObject archivedMetadata](v5, "archivedMetadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = 0x1E0CB3000uLL;
        if (v21)
        {
          v23 = MEMORY[0x1AF421DC4]();
          v49 = (void *)MEMORY[0x1E0CB3710];
          context = (void *)v23;
          v24 = (void *)MEMORY[0x1AF421DC4]();
          v25 = objc_alloc(MEMORY[0x1E0C99E60]);
          v26 = objc_opt_class();
          v27 = objc_opt_class();
          v28 = objc_opt_class();
          v29 = objc_opt_class();
          v30 = objc_opt_class();
          v31 = (void *)objc_msgSend(v25, "initWithObjects:", v26, v27, v28, v29, v30, objc_opt_class(), 0);
          objc_autoreleasePoolPop(v24);
          -[NSObject archivedMetadata](v5, "archivedMetadata");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
          objc_msgSend(v49, "unarchivedObjectOfClasses:fromData:error:", v31, v32, &v56);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v56;

          objc_autoreleasePoolPop(context);
          if (v34)
          {
            __atxlog_handle_gi();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[ATXInfoSuggestion initWithProto:].cold.1();

          }
          v22 = 0x1E0CB3000;
        }
        else
        {
          v33 = 0;
        }
        if (-[NSObject hasRelevanceScore](v5, "hasRelevanceScore"))
        {
          v36 = *(void **)(v22 + 2024);
          -[NSObject relevanceScore](v5, "relevanceScore");
          objc_msgSend(v36, "numberWithDouble:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = 0;
        }
        -[NSObject widgetKind](v5, "widgetKind");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[NSObject layouts](v5, "layouts");
        -[NSObject suggestionIdentifier](v5, "suggestionIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0C99D68];
        -[NSObject startDate](v5, "startDate");
        objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0C99D68];
        -[NSObject endDate](v5, "endDate");
        objc_msgSend(v43, "dateWithTimeIntervalSinceReferenceDate:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[ATXInfoSuggestion initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:](self, "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", v55, v54, v38, v53, v39, v40, v42, v44, 0, v33, v37);

        if (v45)
        {
          -[NSObject clientModelId](v5, "clientModelId");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXInfoSuggestion setClientModelId:](v45, "setClientModelId:", v46);

          -[ATXInfoSuggestion setConfidenceLevel:](v45, "setConfidenceLevel:", -[NSObject confidenceLevel](v5, "confidenceLevel"));
          -[NSObject sourceIdentifier](v5, "sourceIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXInfoSuggestion setSourceIdentifier:](v45, "setSourceIdentifier:", v47);

          objc_storeStrong((id *)&v45->_intentProtoData, obj);
          objc_storeStrong((id *)&v45->_intentDescription, v51);
        }
        self = v45;

        v12 = self;
        v7 = v54;
        v6 = v55;
        v13 = obj;
        v9 = v53;
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      __atxlog_handle_gi();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ATXInfoSuggestion initWithProto:].cold.4();

      v15 = (void *)MEMORY[0x1AF421DC4]();
      v16 = (void *)MEMORY[0x1E0CB3710];
      v17 = objc_opt_class();
      -[NSObject archivedIntentDescription](v5, "archivedIntentDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0;
      objc_msgSend(v16, "unarchivedObjectOfClass:fromData:error:", v17, v18, &v57);
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = v57;

      objc_autoreleasePoolPop(v15);
      __atxlog_handle_gi();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v10)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[ATXInfoSuggestion initWithProto:].cold.3();
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[ATXInfoSuggestion initWithProto:].cold.2();
      }

    }
    v51 = (void *)v11;

    goto LABEL_28;
  }
  v12 = 0;
LABEL_43:

  return v12;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setConfidenceLevel:(int64_t)a3
{
  self->_confidenceLevel = a3;
}

- (void)setClientModelId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (ATXInfoSuggestion)initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 metadata:(id)a12 relevanceScore:(id)a13
{
  return (ATXInfoSuggestion *)-[ATXInfoSuggestion _initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:intentDescription:metadata:relevanceScore:](self, "_initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:intentDescription:metadata:relevanceScore:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12, a13);
}

- (id)_initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 intentDescription:(id)a12 metadata:(id)a13 relevanceScore:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  ATXInfoSuggestion *v26;
  uint64_t v27;
  NSString *appBundleIdentifier;
  uint64_t v29;
  NSString *widgetBundleIdentifier;
  uint64_t v31;
  NSString *widgetKind;
  uint64_t v33;
  NSString *criterion;
  uint64_t v35;
  NSString *suggestionIdentifier;
  uint64_t v37;
  INIntent *intent;
  uint64_t v39;
  NSDictionary *metadata;
  void *v41;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v18 = a3;
  v19 = a4;
  v48 = a5;
  v20 = a6;
  v21 = a8;
  v47 = a9;
  v22 = v21;
  v46 = a10;
  v23 = a11;
  v45 = a12;
  v24 = a13;
  v25 = a14;
  v49.receiver = self;
  v49.super_class = (Class)ATXInfoSuggestion;
  v26 = -[ATXInfoSuggestion init](&v49, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v18, "copy");
    appBundleIdentifier = v26->_appBundleIdentifier;
    v26->_appBundleIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    widgetBundleIdentifier = v26->_widgetBundleIdentifier;
    v26->_widgetBundleIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v48, "copy");
    widgetKind = v26->_widgetKind;
    v26->_widgetKind = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    criterion = v26->_criterion;
    v26->_criterion = (NSString *)v33;

    v26->_layouts = a7;
    v35 = objc_msgSend(v22, "copy");
    suggestionIdentifier = v26->_suggestionIdentifier;
    v26->_suggestionIdentifier = (NSString *)v35;

    objc_storeStrong((id *)&v26->_startDate, a9);
    objc_storeStrong((id *)&v26->_endDate, a10);
    v37 = objc_msgSend(v23, "copy");
    intent = v26->_intent;
    v26->_intent = (INIntent *)v37;

    objc_storeStrong((id *)&v26->_intentDescription, a12);
    v39 = objc_msgSend(v24, "copy");
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v39;

    objc_storeStrong((id *)&v26->_relevanceScore, a14);
    objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "registerObserver:", v26);

  }
  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_relevanceScore, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_intentProtoData, 0);
}

- (ATXInfoSuggestion)initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intentDescription:(id)a11 metadata:(id)a12 relevanceScore:(id)a13
{
  return (ATXInfoSuggestion *)-[ATXInfoSuggestion _initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:intentDescription:metadata:relevanceScore:](self, "_initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:intentDescription:metadata:relevanceScore:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11, a12, a13);
}

- (ATXInfoSuggestion)initWithData:(id)a3
{
  id v4;
  void *v5;
  ATXInfoSuggestion *v6;
  id v7;
  ATXInfoSuggestion *v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF421DC4]();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
  v6 = (ATXInfoSuggestion *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  objc_autoreleasePoolPop(v5);
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestion initWithData:].cold.1();

  }
  return v6;
}

- (BOOL)isFallback
{
  return -[NSString hasPrefix:](self->_criterion, "hasPrefix:", CFSTR("ATXFallback"));
}

- (id)dictionaryRepresentation
{
  return -[ATXInfoSuggestion _dictionaryRepresentationAvoidingLoadingIntentIfPossible:](self, "_dictionaryRepresentationAvoidingLoadingIntentIfPossible:", 0);
}

- (id)_dictionaryRepresentationAvoidingLoadingIntentIfPossible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_appBundleIdentifier, CFSTR("app"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_widgetBundleIdentifier, CFSTR("widget"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_widgetKind, CFSTR("kind"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_criterion, CFSTR("criterion"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_suggestionIdentifier, CFSTR("suggID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_clientModelId, CFSTR("clientModelId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_layouts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("layouts"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_endDate, CFSTR("endDate"));
  -[ATXCustomIntentDescription description](self->_intentDescription, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("intentDescription"));

  if (self->_intentDescription && v3)
  {
    __atxlog_handle_gi();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ATXInfoSuggestion _dictionaryRepresentationAvoidingLoadingIntentIfPossible:].cold.1();
  }
  else
  {
    -[ATXInfoSuggestion intent](self, "intent");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject description](v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("intent"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_metadata, CFSTR("meta"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_sourceIdentifier, CFSTR("src"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_confidenceLevel);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("confLevel"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_relevanceScore, CFSTR("relevanceScore"));
  return v5;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXInfoSuggestion _dictionaryRepresentationAvoidingLoadingIntentIfPossible:](self, "_dictionaryRepresentationAvoidingLoadingIntentIfPossible:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionWithLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSString *appBundleIdentifier;
  NSString *widgetBundleIdentifier;
  NSString *widgetKind;
  NSString *criterion;
  unint64_t layouts;
  NSString *suggestionIdentifier;
  NSDate *endDate;
  NSDate *startDate;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  appBundleIdentifier = self->_appBundleIdentifier;
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  widgetKind = self->_widgetKind;
  criterion = self->_criterion;
  layouts = self->_layouts;
  suggestionIdentifier = self->_suggestionIdentifier;
  startDate = self->_startDate;
  endDate = self->_endDate;
  -[ATXInfoSuggestion intent](self, "intent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v15, "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", appBundleIdentifier, widgetBundleIdentifier, widgetKind, criterion, layouts, suggestionIdentifier, startDate, endDate, v12, self->_metadata, self->_relevanceScore);

  objc_msgSend(v13, "setSourceIdentifier:", self->_sourceIdentifier);
  objc_msgSend(v13, "setConfidenceLevel:", self->_confidenceLevel);
  objc_msgSend(v13, "setClientModelId:", self->_clientModelId);
  return v13;
}

- (id)copyByReplacingIntentWithIndexingHash
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[ATXInfoSuggestion intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "atx_indexingHash");

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", self->_appBundleIdentifier, self->_widgetBundleIdentifier, self->_widgetKind, self->_criterion, self->_layouts, self->_suggestionIdentifier, self->_startDate, self->_endDate, 0, self->_metadata, self->_relevanceScore);
  objc_msgSend(v5, "setSourceIdentifier:", self->_sourceIdentifier);
  objc_msgSend(v5, "setConfidenceLevel:", self->_confidenceLevel);
  objc_msgSend(v5, "setClientModelId:", self->_clientModelId);
  objc_msgSend(v5, "setIntentIndexingHash:", v4);
  return v5;
}

- (id)data
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = (void *)MEMORY[0x1AF421DC4](self, a2);
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  objc_autoreleasePoolPop(v3);
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    __atxlog_handle_gi();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestion data].cold.1();

  }
  return v4;
}

- (ATXInfoSuggestion)initWithProactiveSuggestion:(id)a3
{
  id v4;
  ATXInfoSuggestion *v5;
  void *v6;
  void *v7;
  ATXInfoSuggestion *v8;
  NSObject *v9;

  v4 = a3;
  v5 = [ATXInfoSuggestion alloc];
  objc_msgSend(v4, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "executable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXInfoSuggestion initWithData:](v5, "initWithData:", v7);

  if (!v8)
  {
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXInfoSuggestion initWithProactiveSuggestion:].cold.1();

  }
  return v8;
}

+ (id)proactiveSuggestionForInfoSuggestion:(id)a3 withClientModelId:(id)a4 clientModelVersion:(id)a5 rawScore:(double)a6 confidenceCategory:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  ATXProactiveSuggestionClientModelSpecification *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  ATXProactiveSuggestion *v22;
  void *v23;
  ATXProactiveSuggestionScoreSpecification *v24;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a4;
  v15 = -[ATXProactiveSuggestionClientModelSpecification initWithClientModelId:clientModelVersion:engagementResetPolicy:]([ATXProactiveSuggestionClientModelSpecification alloc], "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v14, v13, 1);

  objc_msgSend(a1, "_executableSpecificationForInfoSuggestion:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_6:
    v22 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v12, "appBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v19 = objc_msgSend(v18, "containsObject:", v17);

  if (v19)
  {
    __atxlog_handle_gi();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "appBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "+[ATXInfoSuggestion proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:]";
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_1AA841000, v20, OS_LOG_TYPE_DEFAULT, "%s: BundleId: %@ is disabled to show suggestions on home screen", (uint8_t *)&v26, 0x16u);

    }
    goto LABEL_6;
  }
  objc_msgSend(a1, "_uiSpecForInfoSuggestion:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = -[ATXProactiveSuggestionScoreSpecification initWithRawScore:suggestedConfidenceCategory:]([ATXProactiveSuggestionScoreSpecification alloc], "initWithRawScore:suggestedConfidenceCategory:", a7, a6);
    v22 = -[ATXProactiveSuggestion initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:]([ATXProactiveSuggestion alloc], "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v15, v16, v23, v24);

  }
  else
  {
    v22 = 0;
  }

LABEL_11:
  return v22;
}

+ (id)_executableSpecificationForInfoSuggestion:(id)a3
{
  id v3;
  ATXProactiveSuggestionExecutableSpecification *v4;
  void *v5;
  void *v6;
  ATXProactiveSuggestionExecutableSpecification *v7;

  v3 = a3;
  v4 = [ATXProactiveSuggestionExecutableSpecification alloc];
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXProactiveSuggestionExecutableSpecification initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:](v4, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v3, v5, v6, 3);

  return v7;
}

+ (id)_uiSpecForInfoSuggestion:(id)a3
{
  id v3;
  void *v4;
  ATXProactiveSuggestionUISpecification *v5;
  void *v6;
  ATXProactiveSuggestionUISpecification *v7;
  uint64_t v9;

  v3 = a3;
  +[ATXProactiveSuggestionLayoutConfig layoutConfigurationsForLayoutOptions:](ATXProactiveSuggestionLayoutConfig, "layoutConfigurationsForLayoutOptions:", objc_msgSend(v3, "layouts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = [ATXProactiveSuggestionUISpecification alloc];
    objc_msgSend(v3, "widgetBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v9) = 0;
    v7 = -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:](v5, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v6, 0, 0, v4, 0, 1, v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)infoSuggestionFromProactiveSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "executableSpecification"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "executableType"),
        v5,
        v6 == 3))
  {
    objc_msgSend(v4, "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableClassString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      __atxlog_handle_gi();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[ATXInfoSuggestion infoSuggestionFromProactiveSuggestion:].cold.2();
      v13 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v4, "executableSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executableObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      __atxlog_handle_gi();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[ATXInfoSuggestion infoSuggestionFromProactiveSuggestion:].cold.1();
LABEL_11:

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXInfoSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (id)_safeDecodeObjectOfClass:(Class)a3 allowedClasses:(id)a4 forKey:(id)a5 withCoder:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  objc_msgSend(v10, "decodeObjectOfClasses:forKey:", a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInfoSuggestion _verifyAndReturnDecodedObject:ofClass:forKey:withCoder:](self, "_verifyAndReturnDecodedObject:ofClass:forKey:withCoder:", v12, a3, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "decodeObjectOfClass:forKey:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInfoSuggestion _verifyAndReturnDecodedObject:ofClass:forKey:withCoder:](self, "_verifyAndReturnDecodedObject:ofClass:forKey:withCoder:", v10, a3, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_verifyAndReturnDecodedObject:(id)a3 ofClass:(Class)a4 forKey:(id)a5 withCoder:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (!v8)
  {
    objc_msgSend(v10, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      __atxlog_handle_gi();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXInfoSuggestion _verifyAndReturnDecodedObject:ofClass:forKey:withCoder:].cold.1(v11, v12);
      goto LABEL_9;
    }
LABEL_10:
    v18 = v8;
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" maps to unexpected class"), v9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0CB2D50];
  v21[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("ATXInfoSuggestion"), -1, v14);

  objc_msgSend(v11, "failWithError:", v15);
  __atxlog_handle_gi();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ATXInfoSuggestion _verifyAndReturnDecodedObject:ofClass:forKey:withCoder:].cold.2();

LABEL_9:
  v18 = 0;
LABEL_11:

  return v18;
}

- (ATXInfoSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXInfoSuggestion *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  ATXInfoSuggestion *v14;
  ATXInfoSuggestion *v15;
  uint64_t v16;
  NSString *suggestionIdentifier;
  uint64_t v18;
  NSDate *startDate;
  uint64_t v20;
  NSDate *endDate;
  uint64_t v22;
  INIntent *intent;
  void *v24;
  void *v25;
  uint64_t v26;
  INIntent *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSDictionary *metadata;
  uint64_t v40;
  NSString *sourceIdentifier;
  uint64_t v42;
  NSString *clientModelId;
  uint64_t v44;
  NSNumber *relevanceScore;
  NSObject *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  objc_super v55;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](self, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("app"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](self, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("widget"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](self, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("kind"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](self, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("criterion"), v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v7 && v8 && v9 && v10)
    {
      v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layouts"));
      if (v12)
      {
        v13 = v12;
        v55.receiver = self;
        v55.super_class = (Class)ATXInfoSuggestion;
        v14 = -[ATXInfoSuggestion init](&v55, sel_init);
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_appBundleIdentifier, v7);
          objc_storeStrong((id *)&v15->_widgetBundleIdentifier, v8);
          v54 = v9;
          objc_storeStrong((id *)&v15->_widgetKind, v9);
          objc_storeStrong((id *)&v15->_criterion, v11);
          v15->_layouts = v13;
          -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("suggID"), v4);
          v16 = objc_claimAutoreleasedReturnValue();
          suggestionIdentifier = v15->_suggestionIdentifier;
          v15->_suggestionIdentifier = (NSString *)v16;

          -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("startDate"), v4);
          v18 = objc_claimAutoreleasedReturnValue();
          startDate = v15->_startDate;
          v15->_startDate = (NSDate *)v18;

          -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("endDate"), v4);
          v20 = objc_claimAutoreleasedReturnValue();
          endDate = v15->_endDate;
          v15->_endDate = (NSDate *)v20;

          -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("intent"), v4);
          v22 = objc_claimAutoreleasedReturnValue();
          intent = v15->_intent;
          v15->_intent = (INIntent *)v22;

          if (!v15->_intent)
          {
            -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("intentDescription"), v4);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "createIntent");
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = v15->_intent;
              v15->_intent = (INIntent *)v26;

              if (!v15->_intent)
              {
                v28 = v11;
                __atxlog_handle_gi();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                  -[ATXInfoSuggestion initWithCoder:].cold.2();

                v11 = v28;
              }
            }

          }
          v30 = objc_opt_class();
          v52 = (void *)MEMORY[0x1E0C99E60];
          v53 = v30;
          v51 = objc_opt_class();
          v50 = objc_opt_class();
          v31 = v11;
          v32 = objc_opt_class();
          v33 = v8;
          v34 = v7;
          v35 = objc_opt_class();
          v36 = objc_opt_class();
          v49 = v35;
          v7 = v34;
          v8 = v33;
          v48 = v32;
          v11 = v31;
          objc_msgSend(v52, "setWithObjects:", v51, v50, v48, v49, v36, objc_opt_class(), 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXInfoSuggestion _safeDecodeObjectOfClass:allowedClasses:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:allowedClasses:forKey:withCoder:", v53, v37, CFSTR("meta"), v4);
          v38 = objc_claimAutoreleasedReturnValue();
          metadata = v15->_metadata;
          v15->_metadata = (NSDictionary *)v38;

          -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("src"), v4);
          v40 = objc_claimAutoreleasedReturnValue();
          sourceIdentifier = v15->_sourceIdentifier;
          v15->_sourceIdentifier = (NSString *)v40;

          v15->_confidenceLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("confLevel"));
          -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("clientModelId"), v4);
          v42 = objc_claimAutoreleasedReturnValue();
          clientModelId = v15->_clientModelId;
          v15->_clientModelId = (NSString *)v42;

          -[ATXInfoSuggestion _safeDecodeObjectOfClass:forKey:withCoder:](v15, "_safeDecodeObjectOfClass:forKey:withCoder:", objc_opt_class(), CFSTR("relevanceScore"), v4);
          v44 = objc_claimAutoreleasedReturnValue();
          relevanceScore = v15->_relevanceScore;
          v15->_relevanceScore = (NSNumber *)v44;

          v9 = v54;
        }
        self = v15;
        v6 = self;
        goto LABEL_23;
      }
      __atxlog_handle_gi();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[ATXInfoSuggestion initWithCoder:].cold.1();
    }
    else
    {
      __atxlog_handle_gi();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[ATXInfoSuggestion initWithCoder:].cold.3();
    }

    v6 = 0;
LABEL_23:

    goto LABEL_24;
  }
  self = -[ATXInfoSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  v6 = self;
LABEL_24:

  return v6;
}

- (void)handleMemoryPressure
{
  ATXInfoSuggestion *v2;
  NSObject *v3;
  NSData *intentProtoData;
  uint8_t v5[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_intentProtoData && v2->_intent)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AA841000, v3, OS_LOG_TYPE_DEFAULT, "Purging intent proto data due to memory pressure", v5, 2u);
    }

    intentProtoData = v2->_intentProtoData;
    v2->_intentProtoData = 0;

  }
  objc_sync_exit(v2);

}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXInfoSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXInfoSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBInfoSuggestion *v5;
  ATXInfoSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBInfoSuggestion initWithData:]([ATXPBInfoSuggestion alloc], "initWithData:", v4);

    self = -[ATXInfoSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (INIntent)intent
{
  ATXInfoSuggestion *v2;
  INIntent *intent;
  INIntent *v4;
  ATXCustomIntentDescription *intentDescription;
  uint64_t v7;
  INIntent *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSData *intentProtoData;
  uint64_t v16;
  id v17;
  INIntent *v18;
  NSObject *v19;
  id v20;

  v2 = self;
  objc_sync_enter(v2);
  intent = v2->_intent;
  if (intent)
    goto LABEL_2;
  intentDescription = v2->_intentDescription;
  if (intentDescription)
  {
    -[ATXCustomIntentDescription createIntent](intentDescription, "createIntent");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v2->_intent;
    v2->_intent = (INIntent *)v7;

    intent = v2->_intent;
    if (intent)
    {
LABEL_2:
      v4 = intent;
      goto LABEL_3;
    }
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXInfoSuggestion intent].cold.3((uint64_t)v2, v9, v10);

  }
  if (v2->_intentProtoData)
  {
    __atxlog_handle_gi();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXInfoSuggestion intent].cold.2();

    v12 = (void *)MEMORY[0x1AF421DC4]();
    v13 = (void *)MEMORY[0x1E0CB3710];
    v14 = objc_opt_class();
    intentProtoData = v2->_intentProtoData;
    v20 = 0;
    objc_msgSend(v13, "unarchivedObjectOfClass:fromData:error:", v14, intentProtoData, &v20);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v20;
    v18 = v2->_intent;
    v2->_intent = (INIntent *)v16;

    if (v17)
    {
      __atxlog_handle_gi();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ATXInfoSuggestion intent].cold.1();

    }
    v4 = v2->_intent;

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v4 = 0;
  }
LABEL_3:
  objc_sync_exit(v2);

  return v4;
}

- (id)proto
{
  void *v3;
  uint64_t v4;
  void *v5;
  ATXCustomIntentDescription *intentDescription;
  void *v7;
  id v8;
  NSObject *v9;
  ATXInfoSuggestion *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSDictionary *metadata;
  void *v20;
  id v21;
  NSObject *v22;
  NSNumber *relevanceScore;
  id v25;
  id v26;
  id v27;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAppBundleIdentifier:", self->_appBundleIdentifier);
  objc_msgSend(v3, "setWidgetBundleIdentifier:", self->_widgetBundleIdentifier);
  objc_msgSend(v3, "setWidgetKind:", self->_widgetKind);
  objc_msgSend(v3, "setCriterion:", self->_criterion);
  objc_msgSend(v3, "setLayouts:", self->_layouts);
  objc_msgSend(v3, "setSuggestionIdentifier:", self->_suggestionIdentifier);
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setStartDate:");
  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setEndDate:");
  objc_msgSend(v3, "setClientModelId:", self->_clientModelId);
  objc_msgSend(v3, "setConfidenceLevel:", self->_confidenceLevel);
  v4 = objc_msgSend(v3, "setSourceIdentifier:", self->_sourceIdentifier);
  if (self->_intentDescription)
  {
    v5 = (void *)MEMORY[0x1AF421DC4](v4);
    intentDescription = self->_intentDescription;
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", intentDescription, 1, &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;
    objc_msgSend(v3, "setArchivedIntentDescription:", v7);

    if (v8)
    {
      __atxlog_handle_gi();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXInfoSuggestion proto].cold.3();

    }
    objc_autoreleasePoolPop(v5);
  }
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_intentProtoData)
  {
    objc_msgSend(v3, "setArchivedIntent:");
  }
  else if (!self->_intentDescription)
  {
    -[ATXInfoSuggestion intent](v10, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1AF421DC4]();
      v13 = (void *)MEMORY[0x1E0CB36F8];
      -[ATXInfoSuggestion intent](v10, "intent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v26;
      objc_msgSend(v3, "setArchivedIntent:", v15);

      objc_autoreleasePoolPop(v12);
      if (v16)
      {
        __atxlog_handle_gi();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[ATXInfoSuggestion proto].cold.2();

      }
    }
  }
  objc_sync_exit(v10);

  if (v10->_metadata)
  {
    v18 = (void *)MEMORY[0x1AF421DC4]();
    metadata = v10->_metadata;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", metadata, 1, &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25;
    objc_msgSend(v3, "setArchivedMetadata:", v20);

    objc_autoreleasePoolPop(v18);
    if (v21)
    {
      __atxlog_handle_gi();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ATXInfoSuggestion proto].cold.1();

    }
  }
  relevanceScore = v10->_relevanceScore;
  if (relevanceScore)
  {
    -[NSNumber doubleValue](relevanceScore, "doubleValue");
    objc_msgSend(v3, "setRelevanceScore:");
  }
  else
  {
    objc_msgSend(v3, "setHasRelevanceScore:", 0);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXInfoSuggestion *v4;
  ATXInfoSuggestion *v5;
  BOOL v6;

  v4 = (ATXInfoSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXInfoSuggestion isEqualToATXInfoSuggestion:](self, "isEqualToATXInfoSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXInfoSuggestion:(id)a3
{
  void *v3;
  id v5;
  NSString *appBundleIdentifier;
  void *v7;
  void *widgetBundleIdentifier;
  void *v9;
  NSString *widgetKind;
  NSString *v11;
  int v12;
  char v13;
  NSString *criterion;
  void *v16;
  int64_t confidenceLevel;
  unint64_t layouts;
  NSString *suggestionIdentifier;
  uint64_t v20;
  _BOOL4 v21;
  void *intentIndexingHash;
  uint64_t v23;
  void *v24;
  void *v25;
  ATXCustomIntentDescription *intentDescription;
  ATXCustomIntentDescription *v27;
  int v28;
  NSDate *startDate;
  uint64_t v30;
  double v31;
  NSDate *endDate;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  NSDictionary *metadata;
  uint64_t v39;
  NSNumber *relevanceScore;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSNumber *v51;
  int v52;
  void *v53;
  uint64_t v54;
  NSDictionary *v55;
  int v56;
  void *v57;
  void *v58;
  NSDate *v59;
  int v60;
  void *v61;
  void *v62;
  NSDate *v63;
  int v64;
  void *v65;
  NSString *v66;

  v5 = a3;
  appBundleIdentifier = self->_appBundleIdentifier;
  objc_msgSend(v5, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](appBundleIdentifier, "isEqualToString:", v7))
    goto LABEL_11;
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  objc_msgSend(v5, "widgetBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(widgetBundleIdentifier, "isEqualToString:", v9))
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  widgetKind = self->_widgetKind;
  v11 = widgetKind;
  if (!widgetKind)
  {
    objc_msgSend(v5, "widgetKind");
    widgetBundleIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    if (!widgetBundleIdentifier)
    {
      v12 = 0;
      goto LABEL_15;
    }
    v11 = self->_widgetKind;
  }
  objc_msgSend(v5, "widgetKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](v11, "isEqualToString:", v3))
  {

    if (!widgetKind)
    goto LABEL_10;
  }
  v12 = 1;
LABEL_15:
  criterion = self->_criterion;
  objc_msgSend(v5, "criterion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](criterion, "isEqualToString:", v16)
    || (confidenceLevel = self->_confidenceLevel, confidenceLevel != objc_msgSend(v5, "confidenceLevel"))
    || (layouts = self->_layouts, layouts != objc_msgSend(v5, "layouts")))
  {

    v21 = 0;
    if ((v12 & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  suggestionIdentifier = self->_suggestionIdentifier;
  v66 = suggestionIdentifier;
  if (!suggestionIdentifier)
  {
    objc_msgSend(v5, "suggestionIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v61 = 0;
      v64 = 0;
      goto LABEL_45;
    }
    v61 = (void *)v20;
    suggestionIdentifier = self->_suggestionIdentifier;
  }
  objc_msgSend(v5, "suggestionIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](suggestionIdentifier, "isEqualToString:"))
  {
    v21 = 0;
    goto LABEL_99;
  }
  v64 = 1;
LABEL_45:
  startDate = self->_startDate;
  v63 = startDate;
  if (!startDate)
  {
    objc_msgSend(v5, "startDate");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      v57 = 0;
      v60 = 0;
      goto LABEL_52;
    }
    v57 = (void *)v30;
    startDate = self->_startDate;
  }
  objc_msgSend(v5, "startDate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceDate:](startDate, "timeIntervalSinceDate:");
  if (fabs(v31) >= 1.0)
  {
    v21 = 0;
    goto LABEL_96;
  }
  v60 = 1;
LABEL_52:
  endDate = self->_endDate;
  v59 = endDate;
  if (!endDate)
  {
    objc_msgSend(v5, "endDate");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v53 = 0;
      v56 = 0;
      goto LABEL_64;
    }
    v53 = (void *)v33;
    endDate = self->_endDate;
  }
  objc_msgSend(v5, "endDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceDate:](endDate, "timeIntervalSinceDate:");
  if (fabs(v34) >= 1.0)
  {
    v21 = 0;
    goto LABEL_93;
  }
  v56 = 1;
LABEL_64:
  metadata = self->_metadata;
  v55 = metadata;
  if (!metadata)
  {
    objc_msgSend(v5, "metadata");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v50 = 0;
      v52 = 0;
      goto LABEL_77;
    }
    v50 = (void *)v39;
    metadata = self->_metadata;
  }
  objc_msgSend(v5, "metadata");
  v54 = objc_claimAutoreleasedReturnValue();
  if (!-[NSDictionary isEqualToDictionary:](metadata, "isEqualToDictionary:"))
  {
    v21 = 0;
LABEL_89:
    v46 = (void *)v54;
    goto LABEL_90;
  }
  v52 = 1;
LABEL_77:
  relevanceScore = self->_relevanceScore;
  if (!relevanceScore)
  {
    objc_msgSend(v5, "relevanceScore");
    v45 = objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      v47 = 0;
      v21 = 1;
      goto LABEL_88;
    }
    v47 = (void *)v45;
    if (!self->_relevanceScore)
    {
      v21 = 0;
      goto LABEL_88;
    }
  }
  v51 = relevanceScore;
  objc_msgSend(v5, "relevanceScore");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v49 = (void *)v41;
    -[NSNumber doubleValue](self->_relevanceScore, "doubleValue");
    v43 = v42;
    objc_msgSend(v5, "relevanceScore");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "doubleValue");
    v21 = vabdd_f64(v43, v44) < 0.00000011920929;

  }
  else
  {
    v21 = 0;
  }
  if (!v51)
  {
LABEL_88:

    if ((v52 & 1) == 0)
      goto LABEL_91;
    goto LABEL_89;
  }
  v46 = (void *)v54;
  if (v52)
LABEL_90:

LABEL_91:
  if (v55)
  {
    if (!v56)
      goto LABEL_94;
    goto LABEL_93;
  }

  if ((v56 & 1) != 0)
LABEL_93:

LABEL_94:
  if (v59)
  {
    if (!v60)
      goto LABEL_97;
    goto LABEL_96;
  }

  if ((v60 & 1) != 0)
LABEL_96:

LABEL_97:
  if (v63)
  {
    if (!v64)
      goto LABEL_100;
    goto LABEL_99;
  }

  if ((v64 & 1) != 0)
LABEL_99:

LABEL_100:
  if (!v66)

  if (v12)
LABEL_24:

LABEL_25:
  if (!widgetKind)
  {

    if (v21)
      goto LABEL_29;
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }

  if (!v21)
    goto LABEL_12;
LABEL_29:
  intentIndexingHash = (void *)self->_intentIndexingHash;
  if (intentIndexingHash)
  {
LABEL_30:
    if (objc_msgSend(v5, "intentIndexingHash"))
    {
      v23 = objc_msgSend(v5, "intentIndexingHash");
    }
    else
    {
      objc_msgSend(v5, "intent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v25, "atx_indexingHash");

    }
    v13 = intentIndexingHash == (void *)v23;
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "intentIndexingHash"))
  {
    intentIndexingHash = (void *)self->_intentIndexingHash;
    if (!intentIndexingHash)
    {
      -[ATXInfoSuggestion intent](self, "intent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      intentIndexingHash = (void *)objc_msgSend(v24, "atx_indexingHash");

    }
    goto LABEL_30;
  }
  intentDescription = self->_intentDescription;
  v27 = intentDescription;
  if (!intentDescription)
  {
    objc_msgSend(v5, "intentDescription");
    intentIndexingHash = (void *)objc_claimAutoreleasedReturnValue();
    if (!intentIndexingHash)
    {
      v28 = 0;
      goto LABEL_59;
    }
    v27 = self->_intentDescription;
  }
  objc_msgSend(v5, "intentDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXCustomIntentDescription isEqual:](v27, "isEqual:", v9))
  {
    v28 = 1;
LABEL_59:
    -[ATXInfoSuggestion intent](self, "intent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 || (objc_msgSend(v5, "intent"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ATXInfoSuggestion intent](self, "intent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "intent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v36, "atx_isEqualToIntent:", v37);

      if (v35)
        goto LABEL_72;
    }
    else
    {
      v13 = 1;
    }

LABEL_72:
    if (!v28)
      goto LABEL_74;
    goto LABEL_73;
  }
  v13 = 0;
LABEL_73:

LABEL_74:
  if (!intentDescription)

LABEL_13:
  return v13;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)widgetBundleIdentifier
{
  return self->_widgetBundleIdentifier;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (int64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (NSNumber)relevanceScore
{
  return self->_relevanceScore;
}

- (unint64_t)layouts
{
  return self->_layouts;
}

- (void)setLayouts:(unint64_t)a3
{
  self->_layouts = a3;
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (void)setSuggestionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (ATXCustomIntentDescription)intentDescription
{
  return self->_intentDescription;
}

- (int64_t)intentIndexingHash
{
  return self->_intentIndexingHash;
}

- (void)setIntentIndexingHash:(int64_t)a3
{
  self->_intentIndexingHash = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)initWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "error deserializing info suggestion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_dictionaryRepresentationAvoidingLoadingIntentIfPossible:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "Avoiding loading full intent for info suggestion dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)data
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "error serializing info suggestion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithProactiveSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1AA841000, v0, v1, "Error converting ATXProactiveSuggestion to ATXInfoSuggestion.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)infoSuggestionFromProactiveSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Found nil ATXInfoSuggestion from ATXProactiveSuggestion with executable type Widget", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)infoSuggestionFromProactiveSuggestion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "executableClassString is not ATXInfoSuggestion for ATXProactiveSuggestion with executable type Widget", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyAndReturnDecodedObject:(void *)a1 ofClass:(NSObject *)a2 forKey:withCoder:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1AA841000, a2, OS_LOG_TYPE_ERROR, "ATXInfoSuggestion: error initWithCoder: %@", v4, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

- (void)_verifyAndReturnDecodedObject:ofClass:forKey:withCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "ATXInfoSuggestion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1AA841000, v0, v1, "ATXInfoSuggestion decoding: no applicable layouts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_8(&dword_1AA841000, v1, (uint64_t)v1, "ATXInfoSuggestion: could not make intent for %@: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1AA841000, v0, v1, "ATXInfoSuggestion decoding: appBundleID, widgetBundleID, widgetKind, and criterion must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Could not unarchive metadata for info suggestion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithProto:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1AA841000, v0, OS_LOG_TYPE_DEBUG, "Unarchived intent description: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithProto:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Could not unarchive intent description: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithProto:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "No intent proto data, but we have an intent description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "Located intent proto data but not loading it just yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1AA841000, v0, v1, "ATXInfoSuggestion decoding: appBundleID, widgetBundleID, and criterion must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a1 .cold.7(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", v5, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

- (void)intent
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_8(&dword_1AA841000, a2, a3, "ATXInfoSuggestion: could not make intent for %@: %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)proto
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, v0, v1, "Could not archive intent description: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
