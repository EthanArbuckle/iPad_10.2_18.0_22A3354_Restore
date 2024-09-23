@implementation SBSceneLayoutCoordinateSpace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentCoordinateSpace, 0);
}

+ (id)coordinateSpaceForFrame:(CGRect)a3 withinCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  SBSceneLayoutFrameCoordinateSpace *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = -[SBSceneLayoutFrameCoordinateSpace initWithFrame:withinCoordinateSpace:]([SBSceneLayoutFrameCoordinateSpace alloc], "initWithFrame:withinCoordinateSpace:", v8, x, y, width, height);

  return v9;
}

+ (id)coordinateSpaceForInterfaceOrientation:(int64_t)a3 withReferenceCoordinateSpace:(id)a4 inOrientation:(int64_t)a5
{
  id v7;
  SBSceneLayoutOrientationCoordinateSpace *v8;

  v7 = a4;
  v8 = -[SBSceneLayoutOrientationCoordinateSpace initWithInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:]([SBSceneLayoutOrientationCoordinateSpace alloc], "initWithInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", a3, v7, a5);

  return v8;
}

- (SBSceneLayoutCoordinateSpace)initWithParentCoordinateSpace:(id)a3
{
  id v5;
  SBSceneLayoutCoordinateSpace *v6;
  SBSceneLayoutCoordinateSpace *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneLayoutCoordinateSpace;
  v6 = -[SBSceneLayoutCoordinateSpace init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parentCoordinateSpace, a3);

  return v7;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[SBSceneLayoutCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[SBSceneLayoutCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutCoordinateSpace.m"), 61, CFSTR("don't use the base implementation"));

  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutCoordinateSpace.m"), 66, CFSTR("don't use the base implementation"));

  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)bounds
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneLayoutCoordinateSpace.m"), 71, CFSTR("don't use the base implementation"));

  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (NSString)description
{
  return (NSString *)-[SBSceneLayoutCoordinateSpace descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSceneLayoutCoordinateSpace succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneLayoutCoordinateSpace descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
