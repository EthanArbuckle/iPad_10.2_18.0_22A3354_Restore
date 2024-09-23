@implementation SBReadOnlyDefaultIconModelStore

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)loadCurrentIconState:(id *)a3
{
  void *v4;
  void *v5;

  +[SBDefaultIconModelStore sharedInstance](SBDefaultIconModelStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadCurrentIconState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)loadDesiredIconState:(id *)a3
{
  void *v4;
  void *v5;

  +[SBDefaultIconModelStore sharedInstance](SBDefaultIconModelStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadDesiredIconState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
