@implementation SBCornerPencilPanGestureSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCornerPencilPanGestureSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBCornerPencilPanGestureSettings setCornerHorizontalEdgeLength:](self, "setCornerHorizontalEdgeLength:", 30.0);
  -[SBCornerPencilPanGestureSettings setCornerVerticalEdgeLength:](self, "setCornerVerticalEdgeLength:", 30.0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Corner Horizontal Edge Length"), CFSTR("cornerHorizontalEdgeLength"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.0, 150.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Corner Vertical Edge Length"), CFSTR("cornerVerticalEdgeLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 150.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83070];
  v14[0] = v3;
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Basic Configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moduleWithTitle:contents:", CFSTR("Corner Swipe Gesture"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("idealSwipeUnitVector")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("cornerSwipeGestureEnabled")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("type")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("useNewCornerGestureHeuristics")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("idealSwipeDegrees")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("underSwipeForgivenessDegrees")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("overSwipeForgivenessDegrees")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("edgeProtectMode"));
  }

  return v4;
}

- (double)cornerHorizontalEdgeLength
{
  return self->_cornerHorizontalEdgeLength;
}

- (void)setCornerHorizontalEdgeLength:(double)a3
{
  self->_cornerHorizontalEdgeLength = a3;
}

- (double)cornerVerticalEdgeLength
{
  return self->_cornerVerticalEdgeLength;
}

- (void)setCornerVerticalEdgeLength:(double)a3
{
  self->_cornerVerticalEdgeLength = a3;
}

@end
