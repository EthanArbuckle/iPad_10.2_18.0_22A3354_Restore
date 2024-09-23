@implementation PXGHostingLayerVisibilityInfo

- (PXGHostingLayerVisibilityInfo)init
{
  PXGHostingLayerVisibilityInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGHostingLayerVisibilityInfo;
  result = -[PXGHostingLayerVisibilityInfo init](&v3, sel_init);
  if (result)
    result->_isVisible = 1;
  return result;
}

- (void)setIsVisible:(BOOL)a3
{
  id v4;

  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    -[PXGHostingLayerVisibilityInfo delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostingLayerVisibilityInfoDidChange:", self);

  }
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (PXGHostingLayerVisibilityInfoDelegate)delegate
{
  return (PXGHostingLayerVisibilityInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
