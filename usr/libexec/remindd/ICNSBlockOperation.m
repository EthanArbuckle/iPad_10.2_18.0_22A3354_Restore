@implementation ICNSBlockOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

- (BOOL)canCoalesceWithOperation:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNSBlockOperation name](self, "name"));
  v6 = 0;
  if (v5 && v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNSBlockOperation name](self, "name"));
    v6 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  if ((-[ICNSBlockOperation isFinished](self, "isFinished") & 1) != 0
    || (-[ICNSBlockOperation isExecuting](self, "isExecuting") & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = v6 & ~-[ICNSBlockOperation isCancelled](self, "isCancelled");
  }

  return v8;
}

- (BOOL)isProcessObjectsForContextDidSaveOperation
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNSBlockOperation name](self, "name"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNSBlockOperation name](self, "name"));
    v5 = objc_msgSend(v4, "isEqualToString:", ICNSBlockOperationNameProcessObjectsForContextDidSave);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
