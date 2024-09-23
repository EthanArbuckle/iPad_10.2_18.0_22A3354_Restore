@implementation RBSProcessLaunchdJobLabelPredicate

- (BOOL)matchesProcess:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasConsistentLaunchdJob");
  -[RBSProcessStringPredicate identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "consistentLaunchdJobLabel");
  else
    objc_msgSend(v4, "applicationJobLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  return v8;
}

@end
