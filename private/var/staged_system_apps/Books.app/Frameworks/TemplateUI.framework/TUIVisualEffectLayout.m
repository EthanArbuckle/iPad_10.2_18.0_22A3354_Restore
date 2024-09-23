@implementation TUIVisualEffectLayout

- (TUIVisualEffectLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIVisualEffectLayout *v5;
  TUIVisualEffectLayout *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIVisualEffectLayout;
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
  void *v6;
  _TUIVisualEffectBoxStyler *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a3 < 4)
    return 0;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v7 = -[_TUIVisualEffectBoxStyler initWithBlurStyle:]([_TUIVisualEffectBoxStyler alloc], "initWithBlurStyle:", objc_msgSend(v6, "blurStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStyledView renderModelWithStyle:identifier:](TUIStyledView, "renderModelWithStyle:identifier:", v7, v9));

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v5);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v10, "setSize:", v12, v14);
  return v10;
}

@end
