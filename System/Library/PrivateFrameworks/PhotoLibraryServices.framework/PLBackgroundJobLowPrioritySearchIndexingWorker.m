@implementation PLBackgroundJobLowPrioritySearchIndexingWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForLowPrioritySearchWorker](PLBackgroundJobCriteria, "criteriaForLowPrioritySearchWorker");
}

- (BOOL)_supportsIndexRebuild
{
  return 1;
}

- (signed)_jobType
{
  return 2;
}

@end
