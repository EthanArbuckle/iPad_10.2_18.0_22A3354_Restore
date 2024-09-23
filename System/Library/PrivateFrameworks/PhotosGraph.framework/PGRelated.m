@implementation PGRelated

- (id)_initWithGraphMatchingResult:(id)a3 highlight:(id)a4 moments:(id)a5 needsDebugInfo:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  char *v13;
  id *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  objc_super v28;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PGRelated;
  v13 = -[PGRelated init](&v28, sel_init);
  v14 = (id *)v13;
  if (v13)
  {
    v13[9] = 1;
    v13[8] = v11 == 0;
    *(_OWORD *)(v13 + 104) = xmmword_1CA8ED900;
    objc_storeStrong((id *)v13 + 3, a4);
    objc_storeStrong(v14 + 4, a5);
    objc_msgSend(v10, "keywords");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v14[5];
    v14[5] = (id)v15;

    objc_msgSend(v10, "score");
    v14[6] = v17;
    objc_msgSend(v10, "score");
    v14[7] = v18;
    objc_msgSend(v10, "localStartDate");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v14[11];
    v14[11] = (id)v19;

    objc_msgSend(v10, "localEndDate");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v14[12];
    v14[12] = (id)v21;

    objc_msgSend(v10, "event");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v14[15];
    v14[15] = (id)v23;

    if (v6)
    {
      objc_msgSend(v10, "debugDescription");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v14[2];
      v14[2] = (id)v25;

    }
    objc_msgSend(v14, "setGraphSchemaVersion:", 615);
    objc_msgSend(v14, "setRelatedAlgorithmsVersion:", 4);
  }

  return v14;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 memory:(id)a4 needsDebugInfo:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  char *v10;
  PGRelated *v11;
  uint64_t v12;
  NSDictionary *keywords;
  double v14;
  double v15;
  uint64_t v16;
  NSDate *localStartDate;
  uint64_t v18;
  NSDate *localEndDate;
  uint64_t v20;
  PGGraphRelatableEvent *eventNode;
  uint64_t v22;
  NSString *debugDescription;
  objc_super v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PGRelated;
  v10 = -[PGRelated init](&v25, sel_init);
  v11 = (PGRelated *)v10;
  if (v10)
  {
    *(_OWORD *)(v10 + 104) = xmmword_1CA8ED900;
    objc_storeStrong((id *)v10 + 16, a4);
    objc_msgSend(v8, "keywords");
    v12 = objc_claimAutoreleasedReturnValue();
    keywords = v11->_keywords;
    v11->_keywords = (NSDictionary *)v12;

    objc_msgSend(v8, "score");
    v11->_score = v14;
    objc_msgSend(v8, "score");
    v11->_matchingScore = v15;
    objc_msgSend(v8, "localStartDate");
    v16 = objc_claimAutoreleasedReturnValue();
    localStartDate = v11->_localStartDate;
    v11->_localStartDate = (NSDate *)v16;

    objc_msgSend(v8, "localEndDate");
    v18 = objc_claimAutoreleasedReturnValue();
    localEndDate = v11->_localEndDate;
    v11->_localEndDate = (NSDate *)v18;

    objc_msgSend(v8, "event");
    v20 = objc_claimAutoreleasedReturnValue();
    eventNode = v11->_eventNode;
    v11->_eventNode = (PGGraphRelatableEvent *)v20;

    if (v5)
    {
      objc_msgSend(v8, "debugDescription");
      v22 = objc_claimAutoreleasedReturnValue();
      debugDescription = v11->_debugDescription;
      v11->_debugDescription = (NSString *)v22;

    }
    -[PGRelated setGraphSchemaVersion:](v11, "setGraphSchemaVersion:", 615);
    -[PGRelated setRelatedAlgorithmsVersion:](v11, "setRelatedAlgorithmsVersion:", 4);
  }

  return v11;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 assetCollection:(id)a4 needsDebugInfo:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PGRelated *v10;
  PGRelated *v11;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "assetCollectionType") == 3)
  {
    v10 = -[PGRelated initWithGraphMatchingResult:moment:needsDebugInfo:](self, "initWithGraphMatchingResult:moment:needsDebugInfo:", v8, v9, v5);
LABEL_7:
    self = v10;
    v11 = self;
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "assetCollectionType") == 6)
  {
    v10 = -[PGRelated initWithGraphMatchingResult:highlight:needsDebugInfo:](self, "initWithGraphMatchingResult:highlight:needsDebugInfo:", v8, v9, v5);
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "assetCollectionType") == 4)
  {
    v10 = -[PGRelated initWithGraphMatchingResult:memory:needsDebugInfo:](self, "initWithGraphMatchingResult:memory:needsDebugInfo:", v8, v9, v5);
    goto LABEL_7;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = 138412290;
    v16 = v9;
    _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Unsupported asset collection type for asset collection: %@", (uint8_t *)&v15, 0xCu);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 highlight:(id)a4 needsDebugInfo:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id *v9;
  PGRelated *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  int64_t v17;
  int v19;
  unint64_t v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[PGRelated _initWithGraphMatchingResult:highlight:moments:needsDebugInfo:](self, "_initWithGraphMatchingResult:highlight:moments:needsDebugInfo:", v8, a4, 0, v5);
  v10 = (PGRelated *)v9;
  if (!v9)
    goto LABEL_15;
  if (objc_msgSend(v9[3], "type") == 1
    || -[PHPhotosHighlight type](v10->_highlight, "type") == 4)
  {
    v11 = 0;
LABEL_5:
    v10->_memoryTripTitleType = v11;
    goto LABEL_6;
  }
  if (-[PHPhotosHighlight type](v10->_highlight, "type") == 2)
  {
    v11 = 1;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v8, "contextItemForRelatedType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "criteria");
  v14 = v13;
  if (v13 < 0xC && ((0xFFDu >> v13) & 1) != 0)
  {
    v17 = qword_1CA8EC818[v13];
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 134217984;
      v20 = v14;
      _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Unsupported asset collection type for asset collection: %@", (uint8_t *)&v19, 0xCu);
    }

    v17 = 0;
  }
  v10->_dateMatchingType = v17;

LABEL_15:
  return v10;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 moment:(id)a4 needsDebugInfo:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PGRelated *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  id v20;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PGRelated _initWithGraphMatchingResult:highlight:moments:needsDebugInfo:](self, "_initWithGraphMatchingResult:highlight:moments:needsDebugInfo:", v8, 0, v11, v5);

    if (!v12)
      goto LABEL_12;
  }
  else
  {
    v12 = -[PGRelated _initWithGraphMatchingResult:highlight:moments:needsDebugInfo:](self, "_initWithGraphMatchingResult:highlight:moments:needsDebugInfo:", v8, 0, MEMORY[0x1E0C9AA60], v5);
    if (!v12)
      goto LABEL_12;
  }
  objc_msgSend(v8, "contextItemForRelatedType:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "criteria");
  v15 = v14;
  if (v14 < 0xC && ((0xFFDu >> v14) & 1) != 0)
  {
    v18 = qword_1CA8EC818[v14];
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v15;
      _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Unsupported asset collection type for asset collection: %@", buf, 0xCu);
    }

    v18 = 0;
  }
  v12->_dateMatchingType = v18;

LABEL_12:
  return v12;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 moments:(id)a4 tripMemoryTitleType:(unint64_t)a5 tripMomentNodes:(id)a6 titleGenerationContext:(id)a7 needsDebugInfo:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  PGRelated *v16;
  PGRelated *v17;
  PGTripMemoryTitleGenerator *v18;
  void *v19;
  uint64_t v20;
  NSString *title;
  void *v22;
  uint64_t v23;
  NSString *subtitle;
  void *v25;

  v8 = a8;
  v14 = a6;
  v15 = a7;
  v16 = -[PGRelated _initWithGraphMatchingResult:highlight:moments:needsDebugInfo:](self, "_initWithGraphMatchingResult:highlight:moments:needsDebugInfo:", a3, 0, a4, v8);
  v17 = v16;
  if (v16)
  {
    v16->_shouldGenerateTitle = 0;
    v16->_memoryTripTitleType = a5;
    v18 = -[PGTripMemoryTitleGenerator initWithMomentNodes:type:titleGenerationContext:]([PGTripMemoryTitleGenerator alloc], "initWithMomentNodes:type:titleGenerationContext:", v14, a5, v15);
    -[PGTitleGenerator title](v18, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = objc_claimAutoreleasedReturnValue();
    title = v17->_title;
    v17->_title = (NSString *)v20;

    -[PGTitleGenerator subtitle](v18, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = objc_claimAutoreleasedReturnValue();
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v23;

    -[PGTitleGenerator title](v18, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_titleCategory = objc_msgSend(v25, "category");

  }
  return v17;
}

- (PGRelated)initWithMoment:(id)a3 needsDebugInfo:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char *v7;
  PGRelated *v8;
  uint64_t v9;
  NSArray *moments;
  NSDictionary *keywords;
  uint64_t v17;
  NSDate *localStartDate;
  uint64_t v19;
  NSDate *localEndDate;
  uint64_t v21;
  NSString *debugDescription;
  objc_super v24;
  _QWORD v25[2];

  v4 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PGRelated;
  v7 = -[PGRelated init](&v24, sel_init);
  v8 = (PGRelated *)v7;
  if (v7)
  {
    *((_WORD *)v7 + 4) = 257;
    *(_OWORD *)(v7 + 104) = xmmword_1CA8ED900;
    *((_QWORD *)v7 + 10) = 0;
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    moments = v8->_moments;
    v8->_moments = (NSArray *)v9;

    keywords = v8->_keywords;
    v8->_keywords = (NSDictionary *)MEMORY[0x1E0C9AA70];

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v8->_score = _Q0;
    objc_msgSend(v6, "localStartDate");
    v17 = objc_claimAutoreleasedReturnValue();
    localStartDate = v8->_localStartDate;
    v8->_localStartDate = (NSDate *)v17;

    objc_msgSend(v6, "localEndDate");
    v19 = objc_claimAutoreleasedReturnValue();
    localEndDate = v8->_localEndDate;
    v8->_localEndDate = (NSDate *)v19;

    if (v4)
    {
      -[PGRelated description](v8, "description");
      v21 = objc_claimAutoreleasedReturnValue();
      debugDescription = v8->_debugDescription;
      v8->_debugDescription = (NSString *)v21;

    }
    -[PGRelated setGraphSchemaVersion:](v8, "setGraphSchemaVersion:", 615);
    -[PGRelated setRelatedAlgorithmsVersion:](v8, "setRelatedAlgorithmsVersion:", 4);
  }

  return v8;
}

- (PGRelated)initWithHighlight:(id)a3 needsDebugInfo:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  char *v8;
  PGRelated *v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *keywords;
  uint64_t v18;
  NSDate *localStartDate;
  uint64_t v20;
  NSDate *localEndDate;
  uint64_t v22;
  NSString *debugDescription;
  objc_super v25;

  v4 = a4;
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGRelated;
  v8 = -[PGRelated init](&v25, sel_init);
  v9 = (PGRelated *)v8;
  if (v8)
  {
    *((_WORD *)v8 + 4) = 256;
    *(_OWORD *)(v8 + 104) = xmmword_1CA8ED900;
    v10 = objc_msgSend(v7, "titleCategory");
    v11 = 6;
    if (v10)
      v11 = v10;
    v9->_titleCategory = v11;
    objc_storeStrong((id *)&v9->_highlight, a3);
    keywords = v9->_keywords;
    v9->_keywords = (NSDictionary *)MEMORY[0x1E0C9AA70];

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_score = _Q0;
    objc_msgSend(v7, "localStartDate");
    v18 = objc_claimAutoreleasedReturnValue();
    localStartDate = v9->_localStartDate;
    v9->_localStartDate = (NSDate *)v18;

    objc_msgSend(v7, "localEndDate");
    v20 = objc_claimAutoreleasedReturnValue();
    localEndDate = v9->_localEndDate;
    v9->_localEndDate = (NSDate *)v20;

    if (v4)
    {
      -[PGRelated description](v9, "description");
      v22 = objc_claimAutoreleasedReturnValue();
      debugDescription = v9->_debugDescription;
      v9->_debugDescription = (NSString *)v22;

    }
    -[PGRelated setGraphSchemaVersion:](v9, "setGraphSchemaVersion:", 615);
    -[PGRelated setRelatedAlgorithmsVersion:](v9, "setRelatedAlgorithmsVersion:", 4);
  }

  return v9;
}

- (PGRelated)initWithMemory:(id)a3 needsDebugInfo:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  char *v8;
  PGRelated *v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *keywords;
  uint64_t v18;
  NSDate *localStartDate;
  uint64_t v20;
  NSDate *localEndDate;
  uint64_t v22;
  NSString *debugDescription;
  objc_super v25;

  v4 = a4;
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGRelated;
  v8 = -[PGRelated init](&v25, sel_init);
  v9 = (PGRelated *)v8;
  if (v8)
  {
    *((_WORD *)v8 + 4) = 256;
    *(_OWORD *)(v8 + 104) = xmmword_1CA8ED900;
    v10 = objc_msgSend(v7, "titleCategory");
    v11 = 6;
    if (v10)
      v11 = v10;
    v9->_titleCategory = v11;
    objc_storeStrong((id *)&v9->_memory, a3);
    keywords = v9->_keywords;
    v9->_keywords = (NSDictionary *)MEMORY[0x1E0C9AA70];

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_score = _Q0;
    objc_msgSend(v7, "startDate");
    v18 = objc_claimAutoreleasedReturnValue();
    localStartDate = v9->_localStartDate;
    v9->_localStartDate = (NSDate *)v18;

    objc_msgSend(v7, "endDate");
    v20 = objc_claimAutoreleasedReturnValue();
    localEndDate = v9->_localEndDate;
    v9->_localEndDate = (NSDate *)v20;

    if (v4)
    {
      -[PGRelated description](v9, "description");
      v22 = objc_claimAutoreleasedReturnValue();
      debugDescription = v9->_debugDescription;
      v9->_debugDescription = (NSString *)v22;

    }
    -[PGRelated setGraphSchemaVersion:](v9, "setGraphSchemaVersion:", 615);
    -[PGRelated setRelatedAlgorithmsVersion:](v9, "setRelatedAlgorithmsVersion:", 4);
  }

  return v9;
}

- (void)_generateTitleWithHighlightNode:(id)a3 referenceDateInterval:(id)a4 titleGenerationContext:(id)a5
{
  id v8;
  id v9;
  PHPhotosHighlight *highlight;
  uint64_t v11;
  int64_t v12;
  PGTripMemoryTitleGenerator *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *title;
  NSString *v23;
  NSString *subtitle;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  highlight = self->_highlight;
  if (highlight && self->_shouldGenerateTitle)
  {
    v11 = -[PHPhotosHighlight titleCategory](highlight, "titleCategory");
    v12 = 6;
    if (v11)
      v12 = v11;
    self->_titleCategory = v12;
    if (MEMORY[0x1CAA4E40C](-[PHPhotosHighlight type](self->_highlight, "type")))
    {
      v13 = -[PGTripMemoryTitleGenerator initWithHighlightNode:titleGenerationContext:]([PGTripMemoryTitleGenerator alloc], "initWithHighlightNode:titleGenerationContext:", v25, v9);
      -[PGTitleGenerator title](v13, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGTitleGenerator subtitle](v13, "subtitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (self->_dateMatchingType)
    {
      v13 = -[PGTitleGeneratorDateMatching initWithType:referenceDateInterval:highlightNode:titleGenerationContext:]([PGTitleGeneratorDateMatching alloc], "initWithType:referenceDateInterval:highlightNode:titleGenerationContext:", self->_dateMatchingType, v8, v25, v9);
      -[PGTitleGenerator title](v13, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
    }
    else
    {
      v13 = -[PGCollectionTitleGenerator initWithCollection:titleGenerationContext:]([PGCollectionTitleGenerator alloc], "initWithCollection:titleGenerationContext:", v25, v9);
      -[PGTripMemoryTitleGenerator titleTuple](v13, "titleTuple");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "subtitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      self->_titleCategory = objc_msgSend(v20, "category");

    }
    if (v15)
    {
      v21 = v15;
    }
    else
    {
      -[PHPhotosHighlight localizedSubtitle](self->_highlight, "localizedSubtitle");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    title = self->_title;
    self->_title = v21;

    if (v17)
    {
      v23 = v17;
    }
    else
    {
      -[PHPhotosHighlight localizedTitle](self->_highlight, "localizedTitle");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    subtitle = self->_subtitle;
    self->_subtitle = v23;

  }
}

- (void)_generateTitleWithMomentNodes:(id)a3 keyAsset:(id)a4 referenceDateInterval:(id)a5 titleGenerationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PGTitleGenerator *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *title;
  void *v19;
  NSString *v20;
  NSString *subtitle;
  void *v22;
  PGTitleGenerator *v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [PGTitleGenerator alloc];
  -[NSArray firstObject](self->_moments, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](v14, "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", v13, v11, v12, 0, v15, self->_dateMatchingType, v10);

  -[PGTitleGenerator title](v23, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v17;

  -[PGTitleGenerator subtitle](v23, "subtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitle = self->_subtitle;
  self->_subtitle = v20;

  -[PGTitleGenerator title](v23, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_titleCategory = objc_msgSend(v22, "category");

}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRelated title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PGRelated title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PHRelatedSuggestedTitleKey"));

  }
  -[PGRelated subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PGRelated subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PHRelatedSuggestedSubtitleKey"));

  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PGRelated score](self, "score");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("PHRelatedScoreKey"));

  -[PGRelated keywords](self, "keywords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("PHRelatedKeywordsKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PGRelated graphSchemaVersion](self, "graphSchemaVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("PHRelatedGraphSchemaVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PGRelated relatedAlgorithmsVersion](self, "relatedAlgorithmsVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("PHRelatedRelatedAlgorithmsVersion"));

  -[PGRelated highlight](self, "highlight");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("PHRelatedHighlightIdentifierKey"));

  -[PGRelated memory](self, "memory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("PHRelatedMemoryIdentifierKey"));

  -[PGRelated moments](self, "moments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueForKey:", CFSTR("localIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("PHRelatedMomentIdentifiersKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PGRelated titleCategory](self, "titleCategory"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("PHRelatedTitleCategoryKey"));

  return (NSDictionary *)v3;
}

- (unsigned)graphSchemaVersion
{
  return HIWORD(self->_aggregatedVersions);
}

- (void)setGraphSchemaVersion:(unsigned __int16)a3
{
  HIWORD(self->_aggregatedVersions) = a3;
}

- (unsigned)relatedAlgorithmsVersion
{
  return self->_aggregatedVersions;
}

- (void)setRelatedAlgorithmsVersion:(unsigned __int16)a3
{
  LOWORD(self->_aggregatedVersions) = a3;
}

- (void)_addKeywordsFromKeywords:(id)a3
{
  NSDictionary *keywords;
  id v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  _QWORD v10[4];
  NSDictionary *v11;

  keywords = self->_keywords;
  v5 = a3;
  v6 = (void *)-[NSDictionary mutableCopy](keywords, "mutableCopy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__PGRelated__addKeywordsFromKeywords___block_invoke;
  v10[3] = &unk_1E842F880;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = self->_keywords;
  self->_keywords = v7;
  v9 = v7;

}

- (void)_addKeywords:(id)a3 forRelatedType:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGRelated _addKeywordsFromKeywords:](self, "_addKeywordsFromKeywords:", v9);
}

- (NSString)debugDescription
{
  return self->_debugDescription;
}

- (void)setDebugDescription:(id)a3
{
  objc_storeStrong((id *)&self->_debugDescription, a3);
}

- (PHPhotosHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (NSArray)moments
{
  return self->_moments;
}

- (void)setMoments:(id)a3
{
  objc_storeStrong((id *)&self->_moments, a3);
}

- (NSDictionary)keywords
{
  return self->_keywords;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)matchingScore
{
  return self->_matchingScore;
}

- (void)setMatchingScore:(double)a3
{
  self->_matchingScore = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (void)setTitleCategory:(int64_t)a3
{
  self->_titleCategory = a3;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (unsigned)aggregatedVersions
{
  return self->_aggregatedVersions;
}

- (unint64_t)memoryTripTitleType
{
  return self->_memoryTripTitleType;
}

- (void)setMemoryTripTitleType:(unint64_t)a3
{
  self->_memoryTripTitleType = a3;
}

- (int64_t)dateMatchingType
{
  return self->_dateMatchingType;
}

- (void)setDateMatchingType:(int64_t)a3
{
  self->_dateMatchingType = a3;
}

- (BOOL)isGeneratingTitleBasedOnKeyAsset
{
  return self->_generateTitleBasedOnKeyAsset;
}

- (void)setGenerateTitleBasedOnKeyAsset:(BOOL)a3
{
  self->_generateTitleBasedOnKeyAsset = a3;
}

- (BOOL)shouldGenerateTitle
{
  return self->_shouldGenerateTitle;
}

- (void)setShouldGenerateTitle:(BOOL)a3
{
  self->_shouldGenerateTitle = a3;
}

- (PGGraphRelatableEvent)eventNode
{
  return self->_eventNode;
}

- (void)setEventNode:(id)a3
{
  objc_storeStrong((id *)&self->_eventNode, a3);
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_eventNode, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_moments, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
}

void __38__PGRelated__addKeywordsFromKeywords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v10);
  }

}

@end
