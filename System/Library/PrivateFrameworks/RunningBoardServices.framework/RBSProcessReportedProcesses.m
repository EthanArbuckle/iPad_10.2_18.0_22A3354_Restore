@implementation RBSProcessReportedProcesses

- (BOOL)matchesProcess:(id)a3
{
  return objc_msgSend(a3, "isReported");
}

+ (id)reportedPredicate
{
  RBSProcessReportedProcesses *v2;
  void *v3;

  v2 = objc_alloc_init(RBSProcessReportedProcesses);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
