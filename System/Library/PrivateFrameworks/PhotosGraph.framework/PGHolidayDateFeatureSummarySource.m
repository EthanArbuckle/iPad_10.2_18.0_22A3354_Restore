@implementation PGHolidayDateFeatureSummarySource

- (PGHolidayDateFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGHolidayDateFeatureSummarySource *v12;
  PGHolidayDateFeatureSummarySource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGHolidayDateFeatureSummarySource;
  v12 = -[PGHolidayDateFeatureSummarySource init](&v15, sel_init);
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
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGHolidayDateSummarizedFeature *v16;
  void *v17;
  PGHolidayDateSummarizedFeature *v18;
  NSObject *loggingConnection;
  id v21;
  PGHolidayDateSummarizedFeature *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dateNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "celebratedHolidayNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      objc_msgSend(v5, "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v10 = +[PGCommonTitleUtility containsCelebrationForDateNodes:holidayName:titleGenerationContext:graph:](PGCommonTitleUtility, "containsCelebrationForDateNodes:holidayName:titleGenerationContext:graph:", v9, &v21, self->_titleGenerationContext, self->_graph);
      v11 = v21;

      if (v10)
      {
        if (v11)
        {
          +[PGGraphHolidayNodeCollection holidayNodesWithName:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithName:inGraph:", v11, self->_graph);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dateNodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "momentNodes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "collectionByIntersecting:", v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = [PGHolidayDateSummarizedFeature alloc];
          objc_msgSend(v15, "universalDateIntervals");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[PGHolidayDateSummarizedFeature initWithIntervalsPresent:isMandatoryForKeyAsset:holidayName:](v16, "initWithIntervalsPresent:isMandatoryForKeyAsset:holidayName:", v17, 0, v11);

          v22 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
          goto LABEL_11;
        }
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v5;
          _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "Date %@ contains celebration but holiday name is nil", buf, 0xCu);
        }
      }
      v8 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_10;
    }
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_11:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
