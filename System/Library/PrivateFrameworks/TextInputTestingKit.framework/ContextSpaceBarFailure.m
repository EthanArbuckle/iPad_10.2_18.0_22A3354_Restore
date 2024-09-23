@implementation ContextSpaceBarFailure

- (BOOL)doesMatchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "corrected");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24FD49B78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "intended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_24FD49B78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    objc_msgSend(v3, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "hasSuffix:", CFSTR(" ")) ^ 1;

  }
  return v8;
}

@end
