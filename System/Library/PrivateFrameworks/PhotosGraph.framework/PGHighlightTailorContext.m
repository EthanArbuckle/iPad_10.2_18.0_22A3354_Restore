@implementation PGHighlightTailorContext

- (PGHighlightTailorContext)initWithPhotoLibrary:(id)a3 graph:(id)a4 serviceManager:(id)a5 loggingConnection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGHighlightTailorContext *v15;
  PGHighlightTailorContext *v16;
  PGNeighborScoreComputer *v17;
  PGNeighborScoreComputer *neighborScoreComputer;
  uint64_t v19;
  CLSCurationContext *curationContext;
  PGTitleGenerationContext *v21;
  PGTitleGenerationContext *titleGenerationContext;
  void *v23;
  double v24;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PGHighlightTailorContext;
  v15 = -[PGHighlightTailorContext init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a3);
    v17 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v16->_neighborScoreComputer;
    v16->_neighborScoreComputer = v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v16->_photoLibrary);
    curationContext = v16->_curationContext;
    v16->_curationContext = (CLSCurationContext *)v19;

    objc_storeStrong((id *)&v16->_loggingConnection, a6);
    v21 = -[PGTitleGenerationContext initWithGraph:serviceManager:]([PGTitleGenerationContext alloc], "initWithGraph:serviceManager:", v12, v13);
    titleGenerationContext = v16->_titleGenerationContext;
    v16->_titleGenerationContext = v21;

    objc_msgSend(v12, "infoNode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topTierAestheticScore");
    v16->_topTierAestheticScore = v24;

    objc_storeStrong((id *)&v16->_graph, a4);
  }

  return v16;
}

- (id)initForTesting
{
  PGHighlightTailorContext *v2;
  PGNeighborScoreComputer *v3;
  PGNeighborScoreComputer *neighborScoreComputer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGHighlightTailorContext;
  v2 = -[PGHighlightTailorContext init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v2->_neighborScoreComputer;
    v2->_neighborScoreComputer = v3;

  }
  return v2;
}

- (PGLocationFeatureSummarySource)locationFeatureSummarySource
{
  PGLocationFeatureSummarySource *locationFeatureSummarySource;
  PGLocationFeatureSummarySource *v4;
  PGLocationFeatureSummarySource *v5;

  locationFeatureSummarySource = self->_locationFeatureSummarySource;
  if (!locationFeatureSummarySource)
  {
    v4 = -[PGLocationFeatureSummarySource initWithLoggingConnection:titleGenerationContext:graph:]([PGLocationFeatureSummarySource alloc], "initWithLoggingConnection:titleGenerationContext:graph:", self->_loggingConnection, self->_titleGenerationContext, self->_graph);
    v5 = self->_locationFeatureSummarySource;
    self->_locationFeatureSummarySource = v4;

    locationFeatureSummarySource = self->_locationFeatureSummarySource;
  }
  return locationFeatureSummarySource;
}

- (PGMeaningFeatureSummarySource)meaningFeatureSummarySource
{
  PGMeaningFeatureSummarySource *meaningFeatureSummarySource;
  PGMeaningFeatureSummarySource *v4;
  PGMeaningFeatureSummarySource *v5;

  meaningFeatureSummarySource = self->_meaningFeatureSummarySource;
  if (!meaningFeatureSummarySource)
  {
    v4 = -[PGMeaningFeatureSummarySource initWithLoggingConnection:titleGenerationContext:graph:]([PGMeaningFeatureSummarySource alloc], "initWithLoggingConnection:titleGenerationContext:graph:", self->_loggingConnection, self->_titleGenerationContext, self->_graph);
    v5 = self->_meaningFeatureSummarySource;
    self->_meaningFeatureSummarySource = v4;

    meaningFeatureSummarySource = self->_meaningFeatureSummarySource;
  }
  return meaningFeatureSummarySource;
}

- (PGBusinessLocationFeatureSummarySource)businessFeatureSummarySource
{
  PGBusinessLocationFeatureSummarySource *businessFeatureSummarySource;
  PGBusinessLocationFeatureSummarySource *v4;
  PGBusinessLocationFeatureSummarySource *v5;

  businessFeatureSummarySource = self->_businessFeatureSummarySource;
  if (!businessFeatureSummarySource)
  {
    v4 = -[PGBusinessLocationFeatureSummarySource initWithLoggingConnection:titleGenerationContext:graph:]([PGBusinessLocationFeatureSummarySource alloc], "initWithLoggingConnection:titleGenerationContext:graph:", self->_loggingConnection, self->_titleGenerationContext, self->_graph);
    v5 = self->_businessFeatureSummarySource;
    self->_businessFeatureSummarySource = v4;

    businessFeatureSummarySource = self->_businessFeatureSummarySource;
  }
  return businessFeatureSummarySource;
}

- (PGPublicEventFeatureSummarySource)publicEventFeatureSummarySource
{
  PGPublicEventFeatureSummarySource *publicEventFeatureSummarySource;
  PGPublicEventFeatureSummarySource *v4;
  PGPublicEventFeatureSummarySource *v5;

  publicEventFeatureSummarySource = self->_publicEventFeatureSummarySource;
  if (!publicEventFeatureSummarySource)
  {
    v4 = -[PGPublicEventFeatureSummarySource initWithLoggingConnection:titleGenerationContext:graph:]([PGPublicEventFeatureSummarySource alloc], "initWithLoggingConnection:titleGenerationContext:graph:", self->_loggingConnection, self->_titleGenerationContext, self->_graph);
    v5 = self->_publicEventFeatureSummarySource;
    self->_publicEventFeatureSummarySource = v4;

    publicEventFeatureSummarySource = self->_publicEventFeatureSummarySource;
  }
  return publicEventFeatureSummarySource;
}

- (PGHolidayDateFeatureSummarySource)holidayDateFeatureSummarySource
{
  PGHolidayDateFeatureSummarySource *holidayDateFeatureSummarySource;
  PGHolidayDateFeatureSummarySource *v4;
  PGHolidayDateFeatureSummarySource *v5;

  holidayDateFeatureSummarySource = self->_holidayDateFeatureSummarySource;
  if (!holidayDateFeatureSummarySource)
  {
    v4 = -[PGHolidayDateFeatureSummarySource initWithLoggingConnection:titleGenerationContext:graph:]([PGHolidayDateFeatureSummarySource alloc], "initWithLoggingConnection:titleGenerationContext:graph:", self->_loggingConnection, self->_titleGenerationContext, self->_graph);
    v5 = self->_holidayDateFeatureSummarySource;
    self->_holidayDateFeatureSummarySource = v4;

    holidayDateFeatureSummarySource = self->_holidayDateFeatureSummarySource;
  }
  return holidayDateFeatureSummarySource;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 16, 1);
}

- (PGNeighborScoreComputer)neighborScoreComputer
{
  return (PGNeighborScoreComputer *)objc_getProperty(self, a2, 24, 1);
}

- (CLSCurationContext)curationContext
{
  return (CLSCurationContext *)objc_getProperty(self, a2, 32, 1);
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (PGTitleGenerationContext)titleGenerationContext
{
  return (PGTitleGenerationContext *)objc_getProperty(self, a2, 48, 1);
}

- (double)topTierAestheticScore
{
  return self->_topTierAestheticScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayDateFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_publicEventFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_businessFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_meaningFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_locationFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
