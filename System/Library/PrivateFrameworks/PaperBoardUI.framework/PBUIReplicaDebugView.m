@implementation PBUIReplicaDebugView

+ (id)debugFont
{
  if (debugFont_onceToken != -1)
    dispatch_once(&debugFont_onceToken, &__block_literal_global_2);
  return (id)debugFont___font;
}

void __33__PBUIReplicaDebugView_debugFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "_preferredFontDescriptorWithTextStyle:design:weight:", *MEMORY[0x1E0CEB540], *MEMORY[0x1E0CEB4F0], *MEMORY[0x1E0CEB5F0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v2, 0.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)debugFont___font;
  debugFont___font = v0;

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

- (PBUIReplicaDebugView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PBUIReplicaDebugView *v7;
  PBUIReplicaDebugView *v8;
  uint64_t v9;
  UIView *borderView;
  uint64_t v11;
  UILabel *labelView;
  UILabel *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)PBUIReplicaDebugView;
  v7 = -[PBUIReplicaDebugView initWithFrame:](&v19, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_labelViewNeedsLayout = 0;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", x, y, width, height);
    borderView = v8->_borderView;
    v8->_borderView = (UIView *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", x, y, width, height);
    labelView = v8->_labelView;
    v8->_labelView = (UILabel *)v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_borderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = v8->_labelView;
    objc_msgSend((id)objc_opt_class(), "debugFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setNumberOfLines:](v8->_labelView, "setNumberOfLines:", 1);
    -[UIView layer](v8->_borderView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    -[UIView layer](v8->_borderView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBorderWidth:", 15.0);

    -[PBUIReplicaDebugView addSubview:](v8, "addSubview:", v8->_borderView);
    -[PBUIReplicaDebugView addSubview:](v8, "addSubview:", v8->_labelView);
  }
  return v8;
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_labelView, "setText:", a3);
  self->_labelViewNeedsLayout = 1;
  -[PBUIReplicaDebugView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return -[UILabel text](self->_labelView, "text");
}

- (void)setColor:(id)a3
{
  id v4;
  UIColor **p_color;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_color = &self->_color;
  objc_storeStrong((id *)&self->_color, v4);
  if (!v7)

  -[UIView layer](self->_borderView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", -[UIColor CGColor](*p_color, "CGColor"));

}

- (void)layoutSubviews
{
  UIView *borderView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UILabel *labelView;

  borderView = self->_borderView;
  -[PBUIReplicaDebugView bounds](self, "bounds");
  -[UIView setFrame:](borderView, "setFrame:");
  if (self->_labelViewNeedsLayout)
  {
    self->_labelViewNeedsLayout = 0;
    -[UILabel sizeToFit](self->_labelView, "sizeToFit");
  }
  -[PBUIReplicaDebugView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[PBUIReplicaDebugView safeAreaInsets](self, "safeAreaInsets");
  v9 = v5 + v8;
  v11 = v7 + v10;
  labelView = self->_labelView;
  -[UILabel frame](labelView, "frame");
  -[UILabel setFrame:](labelView, "setFrame:", v9, v11);
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
