@implementation SBFluidSwitcherGestureExclusionTrapezoid

+ (SBFluidSwitcherGestureExclusionTrapezoid)exclusionTrapezoidWithBaseHeight:(double)a3 trapezoidHeight:(double)a4 adjacentBaseXDistanceFromEdge:(double)a5 opposingBaseXDistanceFromEdge:(double)a6 allowHorizontalSwipesOutsideTrapezoid:(BOOL)a7
{
  _BOOL8 v7;
  SBFluidSwitcherGestureExclusionTrapezoid *v12;

  v7 = a7;
  v12 = objc_alloc_init(SBFluidSwitcherGestureExclusionTrapezoid);
  -[SBFluidSwitcherGestureExclusionTrapezoid setBaseHeight:](v12, "setBaseHeight:", a3);
  -[SBFluidSwitcherGestureExclusionTrapezoid setTrapezoidHeight:](v12, "setTrapezoidHeight:", a4);
  -[SBFluidSwitcherGestureExclusionTrapezoid setAdjacentBaseXDistanceFromEdge:](v12, "setAdjacentBaseXDistanceFromEdge:", a5);
  -[SBFluidSwitcherGestureExclusionTrapezoid setOpposingBaseXDistanceFromEdge:](v12, "setOpposingBaseXDistanceFromEdge:", a6);
  -[SBFluidSwitcherGestureExclusionTrapezoid setAllowHorizontalSwipesOutsideTrapezoid:](v12, "setAllowHorizontalSwipesOutsideTrapezoid:", v7);
  return v12;
}

- (id)debugView
{
  _SBFluidSwitcherGestureExclusionTrapezoidDebugView *v3;
  void *v4;

  v3 = objc_alloc_init(_SBFluidSwitcherGestureExclusionTrapezoidDebugView);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBFluidSwitcherGestureExclusionTrapezoidDebugView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[_SBFluidSwitcherGestureExclusionTrapezoidDebugView bs_setHitTestingDisabled:](v3, "bs_setHitTestingDisabled:", 1);
  -[_SBFluidSwitcherGestureExclusionTrapezoidDebugView setExclusionTrapezoid:](v3, "setExclusionTrapezoid:", self);
  return v3;
}

- (BOOL)shouldBeginGestureAtStartingPoint:(CGPoint)a3 velocity:(CGPoint)a4 bounds:(CGRect)a5
{
  double adjacentBaseXDistanceFromEdge;
  double opposingBaseXDistanceFromEdge;

  if (fabs(a4.x) > fabs(a4.y) && self->_allowHorizontalSwipesOutsideTrapezoid)
    return 1;
  if (a3.x > a5.size.width * 0.5)
    a3.x = a5.size.width - a3.x;
  adjacentBaseXDistanceFromEdge = self->_adjacentBaseXDistanceFromEdge;
  if (a3.x >= adjacentBaseXDistanceFromEdge
    && ((opposingBaseXDistanceFromEdge = self->_opposingBaseXDistanceFromEdge, a3.x >= opposingBaseXDistanceFromEdge)
     || a3.y >= a5.size.height
              - (self->_baseHeight
               + self->_trapezoidHeight
               / (opposingBaseXDistanceFromEdge - adjacentBaseXDistanceFromEdge)
               * (a3.x - adjacentBaseXDistanceFromEdge))))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

- (double)baseHeight
{
  return self->_baseHeight;
}

- (void)setBaseHeight:(double)a3
{
  self->_baseHeight = a3;
}

- (double)trapezoidHeight
{
  return self->_trapezoidHeight;
}

- (void)setTrapezoidHeight:(double)a3
{
  self->_trapezoidHeight = a3;
}

- (double)adjacentBaseXDistanceFromEdge
{
  return self->_adjacentBaseXDistanceFromEdge;
}

- (void)setAdjacentBaseXDistanceFromEdge:(double)a3
{
  self->_adjacentBaseXDistanceFromEdge = a3;
}

- (double)opposingBaseXDistanceFromEdge
{
  return self->_opposingBaseXDistanceFromEdge;
}

- (void)setOpposingBaseXDistanceFromEdge:(double)a3
{
  self->_opposingBaseXDistanceFromEdge = a3;
}

- (BOOL)allowHorizontalSwipesOutsideTrapezoid
{
  return self->_allowHorizontalSwipesOutsideTrapezoid;
}

- (void)setAllowHorizontalSwipesOutsideTrapezoid:(BOOL)a3
{
  self->_allowHorizontalSwipesOutsideTrapezoid = a3;
}

@end
