@implementation PXTapToRadarGadget

- (unint64_t)gadgetType
{
  return 6;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 60.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXTapToRadarGadget;
  -[PXTapToRadarGadget layoutSubviews](&v14, sel_layoutSubviews);
  -[PXTapToRadarGadget tapToRadarButton](self, "tapToRadarButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", CFSTR("File Radar (Apple Internal)"), 0);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__tapToRadarTapped_, 64);
    -[PXTapToRadarGadget addSubview:](self, "addSubview:", v4);
    -[PXTapToRadarGadget setTapToRadarButton:](self, "setTapToRadarButton:", v4);

  }
  -[PXTapToRadarGadget bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXTapToRadarGadget tapToRadarButton](self, "tapToRadarButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)_tapToRadarTapped:(id)a3
{
  id v4;

  -[PXTapToRadarGadget delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadget:didChange:", self, 16);

}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)tapToRadarButton
{
  return self->_tapToRadarButton;
}

- (void)setTapToRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

@end
