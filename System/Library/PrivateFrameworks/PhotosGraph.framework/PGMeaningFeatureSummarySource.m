@implementation PGMeaningFeatureSummarySource

- (PGMeaningFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGMeaningFeatureSummarySource *v12;
  PGMeaningFeatureSummarySource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningFeatureSummarySource;
  v12 = -[PGMeaningFeatureSummarySource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
  }

  return v13;
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PGMeaningSummarizedFeature *v13;
  void *v14;
  PGMeaningSummarizedFeature *v15;
  void *v16;
  _BOOL4 v17;
  PGMeaningSummarizedFeature *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "temporarySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGHighlightTitleGenerator commonMeaningLabelForTitleUsingMomentNodes:](PGHighlightTitleGenerator, "commonMeaningLabelForTitleUsingMomentNodes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (!v8)
    goto LABEL_8;
  if (!+[PGUserDefaults isAlwaysShowingHolidayCalendarEvents](PGUserDefaults, "isAlwaysShowingHolidayCalendarEvents"))
  {
    v17 = +[PGUserDefaults isShowingHolidayCalendarEvents](PGUserDefaults, "isShowingHolidayCalendarEvents");
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("HolidayEvent")) || v17)
      goto LABEL_5;
LABEL_8:
    v16 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_9;
  }
  objc_msgSend(v6, "isEqualToString:", CFSTR("HolidayEvent"));
LABEL_5:
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v9, self->_graph);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "momentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionByIntersecting:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PGMeaningSummarizedFeature alloc];
  objc_msgSend(v12, "universalDateIntervals");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGMeaningSummarizedFeature initWithIntervalsPresent:isMandatoryForKeyAsset:meaningLabel:](v13, "initWithIntervalsPresent:isMandatoryForKeyAsset:meaningLabel:", v14, 0, v6);

  v19 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
