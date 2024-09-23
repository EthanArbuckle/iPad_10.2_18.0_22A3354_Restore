@implementation PXHUDBoxedValueVisualizationView

- (PXHUDBoxedValueVisualizationView)initWithFrame:(CGRect)a3
{
  PXHUDBoxedValueVisualizationView *v3;
  UILabel *v4;
  UILabel *titleAndValueLabel;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXHUDBoxedValueVisualizationView;
  v3 = -[PXHUDBoxedValueVisualizationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleAndValueLabel = v3->_titleAndValueLabel;
    v3->_titleAndValueLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleAndValueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1438]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleAndValueLabel, "setFont:", v6);

    -[PXHUDBoxedValueVisualizationView addSubview:](v3, "addSubview:", v3->_titleAndValueLabel);
    PXHUDCenterViewInSuperview(v3->_titleAndValueLabel);
  }
  return v3;
}

- (void)_updateTitleAndValueLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleAndValueLabel, "setText:", v8);

  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleAndValueLabel, "setTextColor:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleAndValueLabel, 0);
}

@end
