@implementation PGMeaningfulEventAggregationMemoryTitleGenerator

- (PGMeaningfulEventAggregationMemoryTitleGenerator)initWithMeaning:(unint64_t)a3 features:(id)a4 meaningfulEvents:(id)a5 titleGenerationContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PGMeaningfulEventAggregationMemoryTitleGenerator *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "_momentNodesFromMeaningfulEvents:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PGMeaningfulEventAggregationMemoryTitleGenerator;
  v15 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v17, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, v14, 0, 0, 0, 0, 0, v13);

  if (v15)
  {
    v15->_meaning = a3;
    objc_storeStrong((id *)&v15->_features, a4);
    objc_storeStrong((id *)&v15->_meaningfulEvents, a5);
    v15->_unreliableMeaningRatioThresholdForSpecificTitle = 1.0;
  }

  return v15;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  PGSpecBasedTitleGenerator *v6;
  void *v7;
  NSSet *features;
  void *v9;
  PGSpecBasedTitleGenerator *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSSet *v15;
  int v16;
  void *v17;
  __int16 v18;
  NSSet *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  -[PGMeaningfulEventAggregationMemoryTitleGenerator _meaningLabelForTitle](self, "_meaningLabelForTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PGSpecBasedTitleGenerator alloc];
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  features = self->_features;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PGSpecBasedTitleGenerator initWithMomentNodes:features:meaningLabel:isAggregation:titleGenerationContext:](v6, "initWithMomentNodes:features:meaningLabel:isAggregation:titleGenerationContext:", v7, features, v5, 1, v9);

  -[PGSpecBasedTitleGenerator title](v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningfulEventAggregationMemoryTitleGenerator _subtitle](self, "_subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_features;
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v15;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Title for meaningful aggregation nil (meaning: \"%@\", features: %@. Please press \"Provide Feedback\" from Memory Detail View.", (uint8_t *)&v16, 0x16u);
    }

  }
  if (v4)
    v4[2](v4, v11, v12);

}

- (id)_subtitle
{
  PGTimeTitleOptions *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v3, "setMomentNodes:", v4);

  -[PGTimeTitleOptions setAllowedFormats:](v3, "setAllowedFormats:", 20);
  -[PGTimeTitleOptions setFilterDates:](v3, "setFilterDates:", 0);
  -[PGTitleGenerator locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setLocale:](v3, "setLocale:", v5);

  -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setFeaturedYearNodes:](v3, "setFeaturedYearNodes:", v6);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v7, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_meaningLabelForTitle
{
  return +[PGMeaningAggregationMemoryGenerator mostSpecificLabelForMeaning:](PGMeaningAggregationMemoryGenerator, "mostSpecificLabelForMeaning:", self->_meaning);
}

- (unint64_t)meaning
{
  return self->_meaning;
}

- (NSSet)features
{
  return self->_features;
}

- (NSSet)meaningfulEvents
{
  return self->_meaningfulEvents;
}

- (double)unreliableMeaningRatioThresholdForSpecificTitle
{
  return self->_unreliableMeaningRatioThresholdForSpecificTitle;
}

- (void)setUnreliableMeaningRatioThresholdForSpecificTitle:(double)a3
{
  self->_unreliableMeaningRatioThresholdForSpecificTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningfulEvents, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

+ (id)_momentNodesFromMeaningfulEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "eventCollection", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "eventMomentNodes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "temporarySet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
