@implementation PGMemoryMomentNodesWithBlockedFeatureCache

- (PGMemoryMomentNodesWithBlockedFeatureCache)initWithUserFeedbackCalculator:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGMemoryMomentNodesWithBlockedFeatureCache *v9;
  PGMemoryMomentNodesWithBlockedFeatureCache *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryMomentNodesWithBlockedFeatureCache;
  v9 = -[PGMemoryMomentNodesWithBlockedFeatureCache init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userFeedbackCalculator, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

- (PGMemoryMomentNodesWithBlockedFeatureCache)initWithUserFeedbackCalculator:(id)a3
{
  return -[PGMemoryMomentNodesWithBlockedFeatureCache initWithUserFeedbackCalculator:loggingConnection:](self, "initWithUserFeedbackCalculator:loggingConnection:", a3, MEMORY[0x1E0C81028]);
}

- (void)prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:(id)a3 progressReporter:(id)a4
{
  PGGraphMomentNodeCollection *v5;
  PGGraphMomentNodeCollection *momentNodesWithBlockedFeature;

  if (!self->_momentNodesWithBlockedFeature)
  {
    +[PGMemoryFeatureBlocking momentNodesWithBlockedFeatureInGraph:userFeedbackCalculator:loggingConnection:progressReporter:](PGMemoryFeatureBlocking, "momentNodesWithBlockedFeatureInGraph:userFeedbackCalculator:loggingConnection:progressReporter:", a3, self->_userFeedbackCalculator, self->_loggingConnection, a4);
    v5 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    momentNodesWithBlockedFeature = self->_momentNodesWithBlockedFeature;
    self->_momentNodesWithBlockedFeature = v5;

  }
}

- (id)momentNodesWithBlockedFeatureInGraph:(id)a3 progressReporter:(id)a4
{
  -[PGMemoryMomentNodesWithBlockedFeatureCache prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:progressReporter:](self, "prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:progressReporter:", a3, a4);
  return self->_momentNodesWithBlockedFeature;
}

- (PGGraphMomentNodeCollection)momentNodesWithBlockedFeature
{
  return self->_momentNodesWithBlockedFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeature, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
}

@end
