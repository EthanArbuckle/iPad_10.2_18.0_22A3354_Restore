@implementation CALayer(Configuration)

- (uint64_t)_configureUsingLayer:()Configuration
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "contentsGravity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setContentsGravity:", v5);

  objc_msgSend(a1, "setNeedsDisplayOnBoundsChange:", objc_msgSend(v4, "needsDisplayOnBoundsChange"));
  objc_msgSend(v4, "contentsFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setContentsFormat:", v6);

  objc_msgSend(a1, "setContentsMultiplyColor:", objc_msgSend(v4, "contentsMultiplyColor"));
  objc_msgSend(v4, "contentsScale");
  v8 = v7;

  return objc_msgSend(a1, "setContentsScale:", v8);
}

@end
