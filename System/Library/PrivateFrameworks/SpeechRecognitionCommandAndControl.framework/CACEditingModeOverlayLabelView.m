@implementation CACEditingModeOverlayLabelView

- (CACEditingModeOverlayLabelView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  CACEditingModeOverlayLabelView *v5;
  uint64_t v6;
  UILabel *labelView;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  v16.receiver = self;
  v16.super_class = (Class)CACEditingModeOverlayLabelView;
  v5 = -[CACEditingModeOverlayLabelView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 0.0, 0.0, width, height);
  labelView = v5->_labelView;
  v5->_labelView = (UILabel *)v6;

  -[UILabel setTextAlignment:](v5->_labelView, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5->_labelView, "setTextColor:", v8);

  -[CACEditingModeOverlayLabelView addSubview:](v5, "addSubview:", v5->_labelView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACEditingModeOverlayLabelView setBackgroundColor:](v5, "setBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "CGColor");
  -[CACEditingModeOverlayLabelView layer](v5, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v11);

  -[CACEditingModeOverlayLabelView layer](v5, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", 1.0);

  -[CACEditingModeOverlayLabelView layer](v5, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", 8.0);

  return v5;
}

- (void)setLabel:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  -[UILabel setText:](self->_labelView, "setText:", v5);

}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
