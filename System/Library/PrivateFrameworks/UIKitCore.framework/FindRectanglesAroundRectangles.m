@implementation FindRectanglesAroundRectangles

BOOL __FindRectanglesAroundRectangles_block_invoke(CGRect *a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  CGRect v6;

  objc_msgSend(a2, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v4 = CGRectIntersectsRect(v6, a1[1]);

  return v4;
}

@end
