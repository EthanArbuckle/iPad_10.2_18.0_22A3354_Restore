@implementation PXHUDVisualizationView

- (PXHUDVisualizationView)initWithFrame:(CGRect)a3
{
  PXHUDVisualizationView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXHUDVisualizationView;
  v3 = -[PXHUDVisualizationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1438]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v6);

    -[PXHUDVisualizationView addSubview:](v3, "addSubview:", v3->_titleLabel);
    PXHUDCenterViewInSuperview(v3->_titleLabel);
  }
  return v3;
}

- (void)_updateTitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
