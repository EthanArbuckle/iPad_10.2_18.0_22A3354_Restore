@implementation REMCDSharee

+ (BOOL)shouldSyncToCloud
{
  return 0;
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMSharee cdEntityName](REMSharee, "cdEntityName");
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDSharee list](self, "list"));
  v6 = objc_msgSend(v5, "isConnectedToAccountObject:", v4);

  return v6;
}

- (void)debug_lowLevelRemoveFromParent
{
  -[REMCDSharee setList:](self, "setList:", 0);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDSharee"));
}

@end
