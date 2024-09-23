@implementation TUIGradientLayout

- (TUIGradientLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIGradientLayout *v5;
  TUIGradientLayout *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIGradientLayout;
  v5 = -[TUILayout initWithModel:parent:controller:](&v8, "initWithModel:parent:controller:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[TUILayout setSpecifiedWidthComputeInherited:](v5, "setSpecifiedWidthComputeInherited:", 1);
    -[TUILayout setSpecifiedHeightComputeInherited:](v6, "setSpecifiedHeightComputeInherited:", 1);
  }
  return v6;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5;
  _TUIGradientStyler *v6;
  _TUIGradientContainerLayerConfig *v7;
  TUIRenderModelLayer *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a4;
  v6 = -[_TUIGradientStyler initWithLayout:]([_TUIGradientStyler alloc], "initWithLayout:", self);
  v7 = -[_TUIGradientContainerLayerConfig initWithStyle:]([_TUIGradientContainerLayerConfig alloc], "initWithStyle:", v6);
  v8 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  -[TUIRenderModelLayer setIdentifier:](v8, "setIdentifier:", v10);

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v5);
  v12 = v11;
  v14 = v13;

  -[TUIRenderModelLayer setSize:](v8, "setSize:", v12, v14);
  return v8;
}

@end
