@implementation PXForYouFooterGadget

- (PXForYouFooterGadget)initWithViewModel:(id)a3
{
  id v4;
  PXForYouFooterGadget *v5;
  PXPhotosGlobalFooterView *v6;
  PXPhotosGlobalFooterView *footerView;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXForYouFooterGadget;
  v5 = -[PXForYouFooterGadget init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(PXPhotosGlobalFooterView);
    footerView = v5->_footerView;
    v5->_footerView = v6;

    -[PXPhotosGlobalFooterView setViewModel:](v5->_footerView, "setViewModel:", v4);
  }

  return v5;
}

- (unint64_t)gadgetType
{
  return 16;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXForYouFooterGadget contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sizeThatFits:", width, height);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXPhotosGlobalFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

@end
