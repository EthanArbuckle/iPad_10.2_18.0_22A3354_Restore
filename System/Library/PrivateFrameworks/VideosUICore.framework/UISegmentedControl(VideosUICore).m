@implementation UISegmentedControl(VideosUICore)

- (void)vuiSetAccessibilityIdentifier:()VideosUICore forSegment:
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "valueForKey:", CFSTR("_segments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") > a4)
  {
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", v8);

  }
}

@end
