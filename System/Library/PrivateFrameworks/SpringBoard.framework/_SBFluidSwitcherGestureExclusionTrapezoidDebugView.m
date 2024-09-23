@implementation _SBFluidSwitcherGestureExclusionTrapezoidDebugView

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_SBFluidSwitcherGestureExclusionTrapezoidDebugView;
  -[_SBFluidSwitcherGestureExclusionTrapezoidDebugView drawRect:](&v21, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_exclusionTrapezoid)
  {
    -[_SBFluidSwitcherGestureExclusionTrapezoidDebugView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    -[SBFluidSwitcherGestureExclusionTrapezoid baseHeight](self->_exclusionTrapezoid, "baseHeight");
    v9 = v8;
    -[SBFluidSwitcherGestureExclusionTrapezoid trapezoidHeight](self->_exclusionTrapezoid, "trapezoidHeight");
    v11 = v10;
    -[SBFluidSwitcherGestureExclusionTrapezoid adjacentBaseXDistanceFromEdge](self->_exclusionTrapezoid, "adjacentBaseXDistanceFromEdge");
    v13 = v12;
    -[SBFluidSwitcherGestureExclusionTrapezoid opposingBaseXDistanceFromEdge](self->_exclusionTrapezoid, "opposingBaseXDistanceFromEdge");
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7 - v9;
    objc_msgSend(v16, "moveToPoint:", v13, v17);
    v18 = v17 - v11;
    objc_msgSend(v16, "addLineToPoint:", v15, v18);
    objc_msgSend(v16, "addLineToPoint:", v5 - v15, v18);
    objc_msgSend(v16, "addLineToPoint:", v5 - v13, v17);
    objc_msgSend(v16, "closePath");
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v13, v17, v5 + v13 * -2.0, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendPath:", v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 0.3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFill");

    objc_msgSend(v16, "fill");
  }
}

- (SBFluidSwitcherGestureExclusionTrapezoid)exclusionTrapezoid
{
  return self->_exclusionTrapezoid;
}

- (void)setExclusionTrapezoid:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionTrapezoid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionTrapezoid, 0);
}

@end
