@implementation SBSceneLayoutFrameCoordinateSpace

- (SBSceneLayoutFrameCoordinateSpace)initWithFrame:(CGRect)a3 withinCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBSceneLayoutFrameCoordinateSpace *v10;
  uint64_t v11;
  CALayer *contentLayer;
  uint64_t v13;
  CALayer *containerLayer;
  CALayer *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBSceneLayoutFrameCoordinateSpace;
  v10 = -[SBSceneLayoutCoordinateSpace initWithParentCoordinateSpace:](&v17, sel_initWithParentCoordinateSpace_, v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    contentLayer = v10->_contentLayer;
    v10->_contentLayer = (CALayer *)v11;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v13 = objc_claimAutoreleasedReturnValue();
    containerLayer = v10->_containerLayer;
    v10->_containerLayer = (CALayer *)v13;

    -[CALayer setFrame:](v10->_contentLayer, "setFrame:", x, y, width, height);
    v15 = v10->_containerLayer;
    objc_msgSend(v9, "bounds");
    -[CALayer setFrame:](v15, "setFrame:");
    -[CALayer addSublayer:](v10->_containerLayer, "addSublayer:", v10->_contentLayer);
  }

  return v10;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (a4)
    objc_msgSend(a4, "convertRect:toCoordinateSpace:", self->super._parentCoordinateSpace, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CALayer convertRect:toLayer:](self->_containerLayer, "convertRect:toLayer:", self->_contentLayer, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CALayer bounds](self->_contentLayer, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[CALayer convertRect:fromLayer:](self->_containerLayer, "convertRect:fromLayer:", self->_contentLayer, x, y, width, height);
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  if (v9)
  {
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", self->super._parentCoordinateSpace, v10, v11, v12, v13);
    v14 = v18;
    v15 = v19;
    v16 = v20;
    v17 = v21;
  }

  v22 = v14;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSceneLayoutFrameCoordinateSpace *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSceneLayoutFrameCoordinateSpace;
  v4 = a3;
  -[SBSceneLayoutCoordinateSpace descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SBSceneLayoutFrameCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __75__SBSceneLayoutFrameCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  CGRect v8;
  CGRect v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "frame");
  NSStringFromCGRect(v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("contentFrame"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "bounds");
  NSStringFromCGRect(v9);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("containerBounds"));

}

@end
