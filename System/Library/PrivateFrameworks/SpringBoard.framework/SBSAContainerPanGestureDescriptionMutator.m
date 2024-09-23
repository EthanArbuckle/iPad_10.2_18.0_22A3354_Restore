@implementation SBSAContainerPanGestureDescriptionMutator

- (CGPoint)initialLocation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SBSAContainerPanGestureDescriptionMutator _containerPanGestureDescription](self, "_containerPanGestureDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initialLocation");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setInitialLocation:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[SBSAContainerPanGestureDescriptionMutator _containerPanGestureDescription](self, "_containerPanGestureDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setInitialLocation:", x, y);

}

- (CGPoint)translation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SBSAContainerPanGestureDescriptionMutator _containerPanGestureDescription](self, "_containerPanGestureDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "translation");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[SBSAContainerPanGestureDescriptionMutator _containerPanGestureDescription](self, "_containerPanGestureDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTranslation:", x, y);

}

- (id)_containerPanGestureDescription
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[SBSAGestureDescriptionMutator gestureDescription](self, "gestureDescription");
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
