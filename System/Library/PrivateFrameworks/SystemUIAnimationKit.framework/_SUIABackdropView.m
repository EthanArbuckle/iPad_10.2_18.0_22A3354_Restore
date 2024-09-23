@implementation _SUIABackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_self();
}

- (id)backdropLayer
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[_SUIABackdropView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

@end
