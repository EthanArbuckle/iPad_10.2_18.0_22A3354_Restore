@implementation NSObject(SystemAperturePrivate)

- (id)systemApertureElementContextPrivate
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "systemApertureElementContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "systemApertureElementContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)systemApertureHostedElementContext
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "systemApertureElementContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "systemApertureElementContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
