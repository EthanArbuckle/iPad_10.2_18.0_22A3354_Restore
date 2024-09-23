@implementation PLBackgroundJobHighPrioritySearchIndexingWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForHighPrioritySearchIndexingWorker](PLBackgroundJobCriteria, "criteriaForHighPrioritySearchIndexingWorker");
}

- (signed)_jobType
{
  return 1;
}

@end
