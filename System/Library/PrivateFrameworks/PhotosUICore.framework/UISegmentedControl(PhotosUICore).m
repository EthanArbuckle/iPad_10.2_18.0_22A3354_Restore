@implementation UISegmentedControl(PhotosUICore)

- (double)px_minimumSegmentWidth
{
  void *v1;
  double v2;
  double v3;

  objc_getAssociatedObject(a1, sel_px_minimumSegmentWidth);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (void)px_setMinimumSegmentWidth:()PhotosUICore
{
  id v4;

  if (px_setMinimumSegmentWidth__onceToken != -1)
    dispatch_once(&px_setMinimumSegmentWidth__onceToken, &__block_literal_global_262646);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_px_minimumSegmentWidth, v4, (void *)1);

}

- (double)_pxswizzled_sizeThatFits:()PhotosUICore
{
  double v2;
  double v3;
  double v4;
  double v5;
  unint64_t v6;

  objc_msgSend(a1, "_pxswizzled_sizeThatFits:");
  v3 = v2;
  objc_msgSend(a1, "px_minimumSegmentWidth");
  if (v4 > 0.0)
  {
    v5 = v4;
    v6 = objc_msgSend(a1, "numberOfSegments");
    if (v3 < v5 * (double)v6)
      return v5 * (double)v6;
  }
  return v3;
}

+ (double)px_defaultMinimumSegmentWidth
{
  return 80.0;
}

@end
