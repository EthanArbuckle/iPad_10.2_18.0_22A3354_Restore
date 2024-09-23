@implementation HitTestFailure

- (BOOL)doesMatchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "inserted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24FD49B78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "intended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", &stru_24FD49B78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v5, "isEqualToString:", v7);
  return (char)v6;
}

@end
