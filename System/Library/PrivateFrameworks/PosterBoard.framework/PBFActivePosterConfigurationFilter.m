@implementation PBFActivePosterConfigurationFilter

- (BOOL)shouldIncludePosterConfiguration:(id)a3 inSwitcherConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  uuidForPosterConfiguration(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  uuidForPosterConfiguration(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

@end
