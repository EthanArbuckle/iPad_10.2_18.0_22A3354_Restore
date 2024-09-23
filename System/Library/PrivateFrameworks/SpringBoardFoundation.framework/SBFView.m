@implementation SBFView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[SBFView animatedLayerProperties](self, "animatedLayerProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFView;
    v7 = -[SBFView _shouldAnimatePropertyWithKey:](&v9, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v7;
}

- (NSArray)animatedLayerProperties
{
  return self->animatedLayerProperties;
}

- (void)didMoveToWindow
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFView;
  -[SBFView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[SBFView didMoveToWindowHandler](self, "didMoveToWindowHandler");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBFView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, SBFView *, void *))v3)[2](v3, self, v4);

  }
}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  if (self->_intrinsicContentSize.width != a3.width || self->_intrinsicContentSize.height != a3.height)
  {
    self->_intrinsicContentSize = a3;
    -[SBFView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setAnimatedLayerProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicContentSize.width;
  height = self->_intrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)didMoveToWindowHandler
{
  return self->_didMoveToWindowHandler;
}

- (void)setDidMoveToWindowHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didMoveToWindowHandler, 0);
  objc_storeStrong((id *)&self->animatedLayerProperties, 0);
}

@end
