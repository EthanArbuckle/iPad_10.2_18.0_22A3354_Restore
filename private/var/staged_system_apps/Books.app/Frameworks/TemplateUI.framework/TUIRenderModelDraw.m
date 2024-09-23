@implementation TUIRenderModelDraw

- (unint64_t)kind
{
  return 1;
}

- (TUIRenderModelDraw)initWithDraw:(id)a3 erasableInsets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v10;
  TUIRenderModelDraw *v11;
  TUIRenderModelDraw *v12;
  objc_super v14;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIRenderModelDraw;
  v11 = -[TUIRenderModelDraw init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_draw, a3);
    v12->_eraseableInsets.top = top;
    v12->_eraseableInsets.left = left;
    v12->_eraseableInsets.bottom = bottom;
    v12->_eraseableInsets.right = right;
    v12->_size = CGSizeZero;
  }

  return v12;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  TUIRenderModelDraw *draw;
  __int128 v5;
  _OWORD v6[3];

  draw = self->_draw;
  v5 = *(_OWORD *)&a4->c;
  v6[0] = *(_OWORD *)&a4->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->tx;
  -[TUIRenderModelDraw appendResourcesToCollector:transform:](draw, "appendResourcesToCollector:transform:", a3, v6);
}

- (void)drawInContext:(CGContext *)a3
{
  -[TUIRenderModelDraw drawInContext:](self->_draw, "drawInContext:", a3);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGFloat v6;
  CGFloat v7;

  objc_msgSend(a3, "bounds");
  CGContextTranslateCTM(a4, v6, v7);
  -[TUIRenderModelDraw drawInContext:](self->_draw, "drawInContext:", a4);
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  return self == a3;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelDraw identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUIRenderModelDraw)draw
{
  return self->_draw;
}

- (UIEdgeInsets)eraseableInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_eraseableInsets.top;
  left = self->_eraseableInsets.left;
  bottom = self->_eraseableInsets.bottom;
  right = self->_eraseableInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draw, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_renderBlock, 0);
}

@end
