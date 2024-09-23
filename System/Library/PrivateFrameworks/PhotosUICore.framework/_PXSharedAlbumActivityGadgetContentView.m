@implementation _PXSharedAlbumActivityGadgetContentView

- (void)layoutSubviews
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PXSharedAlbumActivityGadgetContentView;
  -[_PXSharedAlbumActivityGadgetContentView layoutSubviews](&v5, sel_layoutSubviews);
  -[_PXSharedAlbumActivityGadgetContentView layoutSubviewsHandler](self, "layoutSubviewsHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_PXSharedAlbumActivityGadgetContentView layoutSubviewsHandler](self, "layoutSubviewsHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (id)focusInfoChangeHandler
{
  return self->_focusInfoChangeHandler;
}

- (void)setFocusInfoChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (id)layoutSubviewsHandler
{
  return self->_layoutSubviewsHandler;
}

- (void)setLayoutSubviewsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (PXFocusInfo)focusInfo
{
  return self->_focusInfo;
}

- (void)setFocusInfo:(id)a3
{
  objc_storeStrong((id *)&self->_focusInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusInfo, 0);
  objc_storeStrong(&self->_layoutSubviewsHandler, 0);
  objc_storeStrong(&self->_focusInfoChangeHandler, 0);
}

@end
