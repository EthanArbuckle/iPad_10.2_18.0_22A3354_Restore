@implementation RBSProcessExtensionPointPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExtension");

  if (v6)
  {
    -[RBSProcessStringPredicate identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionPointIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
