@implementation SBReachabilityGestureShouldActivate

void __SBReachabilityGestureShouldActivate_block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "exclusionTrapezoidSettings");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "portraitTrapezoidBaseHeight");
  v2 = v1;
  objc_msgSend(v10, "portraitTrapezoidHeight");
  v4 = v3;
  objc_msgSend(v10, "portraitTrapezoidAdjacentXDistanceFromEdge");
  v6 = v5;
  objc_msgSend(v10, "portraitTrapezoidOpposingXDistanceFromEdge");
  +[SBFluidSwitcherGestureExclusionTrapezoid exclusionTrapezoidWithBaseHeight:trapezoidHeight:adjacentBaseXDistanceFromEdge:opposingBaseXDistanceFromEdge:allowHorizontalSwipesOutsideTrapezoid:](SBFluidSwitcherGestureExclusionTrapezoid, "exclusionTrapezoidWithBaseHeight:trapezoidHeight:adjacentBaseXDistanceFromEdge:opposingBaseXDistanceFromEdge:allowHorizontalSwipesOutsideTrapezoid:", 0, v2, v4, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)SBReachabilityGestureShouldActivate_reachabilityExclusionTrapezoid;
  SBReachabilityGestureShouldActivate_reachabilityExclusionTrapezoid = v8;

}

@end
