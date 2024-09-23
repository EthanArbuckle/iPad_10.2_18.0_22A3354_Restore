@implementation RBSProcessBundleIdentifierPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[RBSProcessStringPredicate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "embeddedApplicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(v5, "isEqualToString:", v7);
  }
  else
  {
    objc_msgSend(v4, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v10);

  }
  return v8;
}

@end
