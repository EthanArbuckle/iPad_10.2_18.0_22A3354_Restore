@implementation RBSProcessPredicateLaunchServicesProcesses

- (BOOL)matchesProcess:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isApplication");

  return v4;
}

@end
