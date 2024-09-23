@implementation TRIExperimentDeployment(TRITask)

- (id)shortDesc
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@.%d"), v3, objc_msgSend(a1, "deploymentId"));

  return v4;
}

- (id)taskTag
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "hasDeploymentId") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "deploymentId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v3, CFSTR("_"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)hasDeploymentId
{
  return objc_msgSend(a1, "deploymentId") != -1;
}

@end
