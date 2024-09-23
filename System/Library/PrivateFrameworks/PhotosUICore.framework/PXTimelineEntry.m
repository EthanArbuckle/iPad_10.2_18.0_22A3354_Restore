@implementation PXTimelineEntry

- (PXTimelineEntry)initWithMemory:(id)a3 andMemoryKeyAsset:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PXTimelineEntry *v22;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(v9, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("photos://memory?identifier=%@&source=widget"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CD1658];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relevanceScoreForMemory:atDate:", v9, v14);
  v16 = v15;

  +[PXProactiveSuggester proactiveCriterionForMemory:](PXProactiveSuggester, "proactiveCriterionForMemory:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedSubtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "localIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:](self, "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", v18, v19, v20, v21, v12, 0, v16, 0, v17, 0, 0);

  }
  else
  {
    v22 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:](self, "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", v18, v19, v20, &stru_1E5149688, v12, 0, v16, 0, v17, 0, 0);
  }

  return v22;
}

- (PXTimelineEntry)initWithFeaturedPhoto:(id)a3 andFeaturedPhotoKeyAsset:(id)a4
{
  return -[PXTimelineEntry initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:suggestedCrop:](self, "initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:suggestedCrop:", a3, a4, 0);
}

- (PXTimelineEntry)initWithFeaturedPhoto:(id)a3 andFeaturedPhotoKeyAsset:(id)a4 suggestedCrop:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXTimelineEntry *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos://featuredPhoto?identifier=%@&source=widget"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXProactiveSuggester proactiveCriterionForFeaturedPhoto:](PXProactiveSuggester, "proactiveCriterionForFeaturedPhoto:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:](self, "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", 0, 0, v16, v17, v14, 1, 0.0, 0, v15, v8, 0);
  return v18;
}

- (PXTimelineEntry)initWithAlbumFeaturedPhoto:(id)a3 localAlbumIdentifier:(id)a4 andFeaturedPhotoKeyAsset:(id)a5 suggestedCrop:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PXTimelineEntry *v21;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a5, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "uuidFromLocalIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "uuidFromLocalIdentifier:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos://asset?uuid=%@&albumuuid=%@&oneUp=1&source=widget"), v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXProactiveSuggester proactiveCriterionForFeaturedPhoto:](PXProactiveSuggester, "proactiveCriterionForFeaturedPhoto:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:](self, "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", 0, 0, v20, v13, v18, 2, 0.0, v11, v19, v10, 0);
  return v21;
}

- (PXTimelineEntry)initWithTitle:(id)a3 subtitle:(id)a4 localIdentifier:(id)a5 assetLocalIdentifier:(id)a6 deeplink:(id)a7 contentType:(unint64_t)a8 sourceIdentifier:(id)a9 relevanceScore:(double)a10 proactiveCriterion:(id)a11 suggestedCrop:(id)a12 rejectReason:(unint64_t)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  PXTimelineEntry *v26;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSString *subtitle;
  uint64_t v31;
  NSString *localIdentifier;
  uint64_t v33;
  NSString *assetLocalIdentifier;
  uint64_t v35;
  NSURL *deeplink;
  uint64_t v37;
  NSString *sourceIdentifier;
  id v41;
  objc_super v42;

  v41 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a9;
  v24 = a11;
  v25 = a12;
  v42.receiver = self;
  v42.super_class = (Class)PXTimelineEntry;
  v26 = -[PXTimelineEntry init](&v42, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v41, "copy");
    title = v26->_title;
    v26->_title = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    subtitle = v26->_subtitle;
    v26->_subtitle = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    localIdentifier = v26->_localIdentifier;
    v26->_localIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    assetLocalIdentifier = v26->_assetLocalIdentifier;
    v26->_assetLocalIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    deeplink = v26->_deeplink;
    v26->_deeplink = (NSURL *)v35;

    v26->_contentType = a8;
    v37 = objc_msgSend(v23, "copy");
    sourceIdentifier = v26->_sourceIdentifier;
    v26->_sourceIdentifier = (NSString *)v37;

    v26->_relevanceScore = a10;
    objc_storeStrong((id *)&v26->_proactiveCriterion, a11);
    objc_storeStrong((id *)&v26->_suggestedCrop, a12);
    v26->_rejectReason = a13;
  }

  return v26;
}

- (id)_initWithTimelineEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PXTimelineEntry *v15;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetLocalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deeplink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "contentType");
  objc_msgSend(v3, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relevanceScore");
  v11 = v10;
  objc_msgSend(v3, "proactiveCriterion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestedCrop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "rejectReason");

  v15 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:](self, "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", v17, v4, v5, v6, v7, v8, v11, v9, v12, v13, v14);
  return v15;
}

- (void)setStartTime:(id)a3
{
  NSDate *v4;
  NSDate *startTime;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  startTime = self->_startTime;
  self->_startTime = v4;

}

- (void)setEndTime:(id)a3
{
  NSDate *v4;
  NSDate *endTime;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  endTime = self->_endTime;
  self->_endTime = v4;

}

- (id)_localTimeFormatter
{
  if (_localTimeFormatter_onceToken != -1)
    dispatch_once(&_localTimeFormatter_onceToken, &__block_literal_global_62942);
  return (id)_localTimeFormatter_localTimeFormatter;
}

- (id)_utcTimeFormatter
{
  if (_utcTimeFormatter_onceToken != -1)
    dispatch_once(&_utcTimeFormatter_onceToken, &__block_literal_global_186);
  return (id)_utcTimeFormatter_utcTimeFormatter;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  -[PXTimelineEntry _localTimeFormatter](self, "_localTimeFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineEntry startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineEntry endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ <%p>:\n"), v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringFromDate:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" StartTime (Local Time): %@\n"), v10);

  objc_msgSend(v3, "stringFromDate:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" EndTime (Local Time): %@\n"), v11);

  objc_msgSend(v9, "appendFormat:", CFSTR(" StartTime(UTC): %@\n"), v4);
  objc_msgSend(v9, "appendFormat:", CFSTR(" EndTime(UTC): %@\n"), v5);
  +[PXTimelineEntry descriptionForTimelineContentType:](PXTimelineEntry, "descriptionForTimelineContentType:", -[PXTimelineEntry contentType](self, "contentType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" ContentType: %@\n"), v12);

  -[PXTimelineEntry sourceIdentifier](self, "sourceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" SourceIdentifier: %@\n"), v13);

  -[PXTimelineEntry title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" Title: %@\n"), v15);

  -[PXTimelineEntry subtitle](self, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" Subtitle: %@\n"), v17);

  -[PXTimelineEntry localIdentifier](self, "localIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" LocalIdentifier: %@\n"), v18);

  -[PXTimelineEntry assetLocalIdentifier](self, "assetLocalIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" AssetLocalIdentifier: %@\n"), v19);

  -[PXTimelineEntry deeplink](self, "deeplink");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" Deeplink: %@\n"), v20);

  -[PXTimelineEntry relevanceScore](self, "relevanceScore");
  objc_msgSend(v9, "appendFormat:", CFSTR(" RelevanceScore: %f\n"), v21);
  -[PXTimelineEntry proactiveCriterion](self, "proactiveCriterion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" ProactiveCriterion: %@\n"), v22);

  -[PXTimelineEntry suggestedCrop](self, "suggestedCrop");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" SuggestedCrop: %@\n"), v23);

  +[PXTimelineEntry descriptionForRejectReason:](PXTimelineEntry, "descriptionForRejectReason:", -[PXTimelineEntry rejectReason](self, "rejectReason"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" RejectReason: %@\n"), v24);

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  -[PXTimelineEntry _localTimeFormatter](self, "_localTimeFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineEntry _utcTimeFormatter](self, "_utcTimeFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineEntry startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineEntry endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ <%p>:\n"), v10, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("id"));

  objc_msgSend(v3, "stringFromDate:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("StartTime (Local Time)"));

  objc_msgSend(v3, "stringFromDate:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("EndTime (Local Time)"));

  objc_msgSend(v4, "stringFromDate:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("StartTime(UTC)"));

  objc_msgSend(v4, "stringFromDate:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("EndTime(UTC)"));

  +[PXTimelineEntry descriptionForTimelineContentType:](PXTimelineEntry, "descriptionForTimelineContentType:", -[PXTimelineEntry contentType](self, "contentType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("ContentType"));

  -[PXTimelineEntry sourceIdentifier](self, "sourceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("SourceIdentifier"));

  -[PXTimelineEntry title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("Title"));

  -[PXTimelineEntry subtitle](self, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("Subtitle"));

  -[PXTimelineEntry localIdentifier](self, "localIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("LocalIdentifier"));

  -[PXTimelineEntry assetLocalIdentifier](self, "assetLocalIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("AssetLocalIdentifier"));

  -[PXTimelineEntry deeplink](self, "deeplink");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "absoluteString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("Deeplink"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[PXTimelineEntry relevanceScore](self, "relevanceScore");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("RelevanceScore"));

  -[PXTimelineEntry proactiveCriterion](self, "proactiveCriterion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("ProactiveCriterion"));

  -[PXTimelineEntry suggestedCrop](self, "suggestedCrop");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("SuggestedCrop"));

  +[PXTimelineEntry descriptionForRejectReason:](PXTimelineEntry, "descriptionForRejectReason:", -[PXTimelineEntry rejectReason](self, "rejectReason"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("RejectReason"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXTimelineEntry *v4;
  uint64_t v5;
  char v6;
  PXTimelineEntry *v7;
  void *v8;
  void *v9;

  v4 = (PXTimelineEntry *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[PXTimelineEntry localIdentifier](self, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXTimelineEntry localIdentifier](v7, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v8, "isEqualToString:", v9);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXTimelineEntry localIdentifier](self, "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PXTimelineEntry _initWithTimelineEntry:](+[PXTimelineEntry allocWithZone:](PXTimelineEntry, "allocWithZone:", a3), "_initWithTimelineEntry:", self);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (NSURL)deeplink
{
  return self->_deeplink;
}

- (PXTimelineCrop)suggestedCrop
{
  return self->_suggestedCrop;
}

- (void)setSuggestedCrop:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedCrop, a3);
}

- (NSString)proactiveCriterion
{
  return self->_proactiveCriterion;
}

- (void)setProactiveCriterion:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveCriterion, a3);
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (unint64_t)rejectReason
{
  return self->_rejectReason;
}

- (void)setRejectReason:(unint64_t)a3
{
  self->_rejectReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveCriterion, 0);
  objc_storeStrong((id *)&self->_suggestedCrop, 0);
  objc_storeStrong((id *)&self->_deeplink, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

void __36__PXTimelineEntry__utcTimeFormatter__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_utcTimeFormatter_utcTimeFormatter;
  _utcTimeFormatter_utcTimeFormatter = (uint64_t)v0;

  objc_msgSend((id)_utcTimeFormatter_utcTimeFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_utcTimeFormatter_utcTimeFormatter, "setTimeZone:", v2);

}

uint64_t __38__PXTimelineEntry__localTimeFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_localTimeFormatter_localTimeFormatter;
  _localTimeFormatter_localTimeFormatter = (uint64_t)v0;

  return objc_msgSend((id)_localTimeFormatter_localTimeFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

+ (id)emptyWidgetURLForContentType:(unint64_t)a3 sourceIdentifier:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = v5;
  if (a3 < 2)
  {
    v7 = PLIsFeaturedContentAllowed();
    v8 = (void *)MEMORY[0x1E0C99E98];
    if (v7)
      v9 = CFSTR("photos://contentmode?id=forYou");
    else
      v9 = CFSTR("photos://contentmode?id=photos");
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    if (!v5)
    {
      v8 = (void *)MEMORY[0x1E0C99E98];
      v9 = CFSTR("photos://contentmode?id=albums");
LABEL_10:
      objc_msgSend(v8, "URLWithString:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CD13B8], "uuidFromLocalIdentifier:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos://album?uuid=%@"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
LABEL_11:

  return v13;
}

+ (id)placeholderEntryForContentType:(unint64_t)a3
{
  PXTimelineEntry *v5;
  void *v6;
  PXTimelineEntry *v7;

  v5 = [PXTimelineEntry alloc];
  objc_msgSend(a1, "emptyWidgetURLForContentType:sourceIdentifier:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:](v5, "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", CFSTR("---------------"), CFSTR("-------"), &stru_1E5149688, &stru_1E5149688, v6, a3, 0.0, 0, 0, 0, 0);

  return v7;
}

+ (id)fallbackEntryForContentType:(unint64_t)a3 size:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "fallbackEntryForContentType:sourceIdentifier:size:", a3, 0, a4);
}

+ (id)fallbackEntryForContentType:(unint64_t)a3 sourceIdentifier:(id)a4 size:(unint64_t)a5
{
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  PXTimelineEntry *v14;

  v8 = a4;
  if (a3 == 2 || PLIsFeaturedContentAllowed())
  {
    if (a5 - 1 >= 3)
    {
      if (a5)
      {
        v12 = 0;
        goto LABEL_12;
      }
      v9 = CFSTR("PXTimelineNoContentTitleWrapped");
      v10 = CFSTR("PXTimelineNoAlbumContentTitleWrapped");
    }
    else
    {
      v9 = CFSTR("PXTimelineNoContentTitle");
      v10 = CFSTR("PXTimelineNoAlbumContentTitle");
    }
    if (a3 == 2)
      v11 = (__CFString *)v10;
    else
      v11 = (__CFString *)v9;
  }
  else
  {
    v11 = CFSTR("PXTimelineDisabledContentTitle");
  }
  PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  objc_msgSend(a1, "emptyWidgetURLForContentType:sourceIdentifier:", a3, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:]([PXTimelineEntry alloc], "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", v12, 0, &stru_1E5149688, &stru_1E5149688, v13, a3, 0.0, v8, 0, 0, 0);

  return v14;
}

+ (id)fallbackEntryForAlbumNotFoundWithLocalIdentifier:(id)a3 size:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  PXTimelineEntry *v9;

  v6 = a3;
  if (a4 > 3)
  {
    v7 = 0;
  }
  else
  {
    PXLocalizedStringFromTable(off_1E511EEA0[a4], CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "emptyWidgetURLForContentType:sourceIdentifier:", 2, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:]([PXTimelineEntry alloc], "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", v7, 0, &stru_1E5149688, &stru_1E5149688, v8, 2, 0.0, v6, 0, 0, 0);

  return v9;
}

+ (id)privacyDisclosureEntryForContentType:(unint64_t)a3
{
  void *v5;
  void *v6;
  PXTimelineEntry *v7;

  PXLocalizedStringFromTable(CFSTR("PXTimelinePrivacyDisclosureRequired"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emptyWidgetURLForContentType:sourceIdentifier:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXTimelineEntry initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:]([PXTimelineEntry alloc], "initWithTitle:subtitle:localIdentifier:assetLocalIdentifier:deeplink:contentType:sourceIdentifier:relevanceScore:proactiveCriterion:suggestedCrop:rejectReason:", v5, CFSTR("-------"), &stru_1E5149688, &stru_1E5149688, v6, a3, 0.0, 0, 0, 0, 0);

  return v7;
}

+ (id)descriptionForTimelineContentType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Memory");
  if (a3 == 1)
    v3 = CFSTR("Featured Photo");
  if (a3 == 2)
    return CFSTR("Album");
  else
    return (id)v3;
}

+ (id)descriptionForRejectReason:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("None");
  else
    return off_1E511EEC0[a3 - 1];
}

@end
