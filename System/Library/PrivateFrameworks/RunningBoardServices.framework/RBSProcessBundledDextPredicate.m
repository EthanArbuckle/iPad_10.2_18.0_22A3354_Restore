@implementation RBSProcessBundledDextPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  -[RBSProcessStringPredicate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dextContainingAppBundleID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 == (void *)v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v5 && v7)
      v9 = objc_msgSend(v5, "isEqual:", v7);
  }

  return v9;
}

@end
