@implementation SBContinuousExposeAutoLayoutConfiguration

- (SBContinuousExposeAutoLayoutConfiguration)initWithContainerBounds:(CGRect)a3 screenScale:(double)a4 dockHeightWithBottomEdgePadding:(double)a5 chamoisLayoutAttributes:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  SBContinuousExposeAutoLayoutConfiguration *v16;
  void *v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeAutoLayoutConfiguration;
  v16 = -[SBContinuousExposeAutoLayoutConfiguration init](&v19, sel_init);
  if (v16)
  {
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("SBContinuousExposeAutoLayoutConfiguration.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("chamoisLayoutAttributes"));

    }
    v16->_containerBounds.origin.x = x;
    v16->_containerBounds.origin.y = y;
    v16->_containerBounds.size.width = width;
    v16->_containerBounds.size.height = height;
    v16->_screenScale = a4;
    v16->_dockHeightWithBottomEdgePadding = a5;
    objc_storeStrong((id *)&v16->_chamoisLayoutAttributes, a6);
  }

  return v16;
}

- (CGRect)containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerBounds.origin.x;
  y = self->_containerBounds.origin.y;
  width = self->_containerBounds.size.width;
  height = self->_containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (double)dockHeightWithBottomEdgePadding
{
  return self->_dockHeightWithBottomEdgePadding;
}

- (SBSwitcherChamoisLayoutAttributes)chamoisLayoutAttributes
{
  return self->_chamoisLayoutAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chamoisLayoutAttributes, 0);
}

@end
