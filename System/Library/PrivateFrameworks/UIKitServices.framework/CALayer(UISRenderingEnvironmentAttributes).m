@implementation CALayer(UISRenderingEnvironmentAttributes)

- (id)_uis_renderingAttributes
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_uis_provideRenderingAttributes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
