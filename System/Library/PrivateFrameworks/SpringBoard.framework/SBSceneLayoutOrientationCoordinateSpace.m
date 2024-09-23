@implementation SBSceneLayoutOrientationCoordinateSpace

- (SBSceneLayoutOrientationCoordinateSpace)initWithInterfaceOrientation:(int64_t)a3 withReferenceCoordinateSpace:(id)a4 inOrientation:(int64_t)a5
{
  SBSceneLayoutOrientationCoordinateSpace *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSceneLayoutOrientationCoordinateSpace;
  result = -[SBSceneLayoutCoordinateSpace initWithParentCoordinateSpace:](&v8, sel_initWithParentCoordinateSpace_, a4);
  if (result)
  {
    result->_orientation = a3;
    result->_referenceOrientation = a5;
  }
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  id v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v5 = a4;
  -[UICoordinateSpace bounds](self->super._parentCoordinateSpace, "bounds");
  _UIWindowConvertRectFromOrientationToOrientation();
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  if (v5)
  {
    objc_msgSend(v5, "convertRect:fromCoordinateSpace:", self->super._parentCoordinateSpace, v6, v7, v8, v9);
    v10 = v14;
    v11 = v15;
    v12 = v16;
    v13 = v17;
  }

  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
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
  -[UICoordinateSpace bounds](self->super._parentCoordinateSpace, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  _UIWindowConvertRectFromOrientationToOrientation();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)bounds
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat Width;
  CGFloat Height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[UICoordinateSpace bounds](self->super._parentCoordinateSpace, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  Width = v6;
  if ((unint64_t)(self->_orientation - 3) <= 1)
  {
    Height = CGRectGetHeight(*(CGRect *)&v3);
    v16.origin.x = v7;
    v16.origin.y = v8;
    v16.size.width = v9;
    v16.size.height = Width;
    Width = CGRectGetWidth(v16);
    v8 = 0.0;
    v9 = Height;
    v7 = 0.0;
  }
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = Width;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
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
  SBSceneLayoutOrientationCoordinateSpace *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSceneLayoutOrientationCoordinateSpace;
  v4 = a3;
  -[SBSceneLayoutCoordinateSpace descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__SBSceneLayoutOrientationCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __81__SBSceneLayoutOrientationCoordinateSpace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  const __CFString *v6;
  CGRect v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  NSStringFromCGRect(v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("bounds"));

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  switch(v5)
  {
    case 1:
      v6 = CFSTR("UIInterfaceOrientationPortrait");
      break;
    case 3:
      v6 = CFSTR("UIInterfaceOrientationLandscapeRight");
      break;
    case 4:
      v6 = CFSTR("UIInterfaceOrientationLandscapeLeft");
      break;
    case 2:
      v6 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
      break;
    default:
      v6 = 0;
      break;
  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v6, CFSTR("interfaceOrientation"));
}

@end
