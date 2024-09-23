@implementation TRICKOperationGroupFactory

+ (id)groupForExperimentId:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("experiment-%@"), v3);

  objc_msgSend(v4, "setName:", v5);
  return v4;
}

+ (id)groupForRolloutId:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("rollout-%@"), v3);

  objc_msgSend(v4, "setName:", v5);
  return v4;
}

+ (id)groupForBMLTId:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("bmlt-%@"), v3);

  objc_msgSend(v4, "setName:", v5);
  return v4;
}

+ (id)groupForDownloadOptions:(id)a3
{
  void *v4;

  objc_msgSend(a3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(a1, "groupForScheduledFetch");
  else
    objc_msgSend(a1, "groupForUserInitiatedFetch");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)groupForScheduledFetch
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setName:", CFSTR("Periodic"));
  return v2;
}

+ (id)groupForUserInitiatedFetch
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setName:", CFSTR("UserActionExplicit"));
  return v2;
}

@end
