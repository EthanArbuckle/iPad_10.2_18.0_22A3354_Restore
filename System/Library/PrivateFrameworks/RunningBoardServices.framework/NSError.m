@implementation NSError

- (BOOL)rbs_isServiceDenied
{
  _BOOL8 v1;
  void *v2;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    objc_msgSend(a1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("RBSServiceErrorDomain")))
      v1 = objc_msgSend((id)v1, "code") == 1;
    else
      v1 = 0;

  }
  return v1;
}

@end
