@implementation TUISmartGridDebugRenderModel

+ (id)renderModelWithSize:(CGSize)a3 columnSystem:(ColumnSystem *)a4 identifier:(id)a5 transform:(CGAffineTransform *)a6
{
  double height;
  double width;
  id v10;
  _TUISmartGridDebugLayerConfiguration *v11;
  TUIRenderModelLayer *v12;
  void *v13;
  void *v14;
  TUIRenderModelTransform *v15;
  __int128 v16;
  _OWORD v18[3];

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v11 = -[_TUISmartGridDebugLayerConfiguration initWithSize:columnSystem:]([_TUISmartGridDebugLayerConfiguration alloc], "initWithSize:columnSystem:", a4, width, height);
  v12 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v11, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tui_identifierByAppendingString:", CFSTR("debug")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUILayerContainerView renderModelWithLayerModel:identifier:](TUILayerContainerView, "renderModelWithLayerModel:identifier:", v12, v13));

  v15 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v14);
  -[TUIRenderModelTransform setSize:](v15, "setSize:", width, height);
  -[TUIRenderModelTransform setCenter:](v15, "setCenter:", width * 0.5, height * 0.5);
  v16 = *(_OWORD *)&a6->c;
  v18[0] = *(_OWORD *)&a6->a;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a6->tx;
  -[TUIRenderModelTransform setTransform:](v15, "setTransform:", v18);
  -[TUIRenderModelTransform setZIndex:](v15, "setZIndex:", 1000);

  return v15;
}

@end
