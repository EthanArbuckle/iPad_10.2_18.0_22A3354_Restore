@implementation SPCoreSpotlightIndexerTask

- (SPCoreSpotlightIndexerTask)initWithIndexJob:(id)a3 indexers:(id)a4
{
  id v7;
  id v8;
  SPCoreSpotlightIndexerTask *v9;
  SPCoreSpotlightIndexerTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPCoreSpotlightIndexerTask;
  v9 = -[SPCoreSpotlightIndexerTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_job, a3);
    objc_storeStrong((id *)&v10->_indexers, a4);
  }

  return v10;
}

- (CSIndexJob)job
{
  return self->_job;
}

- (NSArray)indexers
{
  return self->_indexers;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (NSArray)completedBundleIDs
{
  return self->_completedBundleIDs;
}

- (void)setCompletedBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_completedBundleIDs, a3);
}

- (unint64_t)dataMigrationStage
{
  return self->_dataMigrationStage;
}

- (void)setDataMigrationStage:(unint64_t)a3
{
  self->_dataMigrationStage = a3;
}

- (BOOL)shouldResumeOnFailure
{
  return self->_shouldResumeOnFailure;
}

- (void)setShouldResumeOnFailure:(BOOL)a3
{
  self->_shouldResumeOnFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_indexers, 0);
  objc_storeStrong((id *)&self->_job, 0);
}

@end
