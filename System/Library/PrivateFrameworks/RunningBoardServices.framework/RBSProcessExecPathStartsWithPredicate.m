@implementation RBSProcessExecPathStartsWithPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "executablePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(v4, "bundle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "executablePath"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    -[RBSProcessStringPredicate identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hasPrefix:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
