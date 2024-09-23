@implementation PXCapsuleButton

- (PXCapsuleButton)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCapsuleButton.m"), 33, CFSTR("%s is not available as initializer"), "-[PXCapsuleButton init]");

  abort();
}

- (PXCapsuleButton)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCapsuleButton.m"), 37, CFSTR("%s is not available as initializer"), "-[PXCapsuleButton initWithFrame:]");

  abort();
}

- (PXCapsuleButton)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCapsuleButton.m"), 41, CFSTR("%s is not available as initializer"), "-[PXCapsuleButton initWithCoder:]");

  abort();
}

- (PXCapsuleButton)initWithColor:(id)a3
{
  id v5;
  PXCapsuleButton *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *stateColorMap;
  void *v9;
  void *v10;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCapsuleButton.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("color"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXCapsuleButton;
  v6 = -[PXCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stateColorMap = v6->_stateColorMap;
    v6->_stateColorMap = v7;

    v6->_maxContentSizeCategory = (NSString *)*MEMORY[0x1E0DC48F0];
    -[PXCapsuleButton titleLabel](v6, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton _titleFont](v6, "_titleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    -[PXCapsuleButton setColor:forState:](v6, "setColor:forState:", v5, 0);
  }

  return v6;
}

- (void)setMaxContentSizeCategory:(id)a3
{
  void *v4;
  id v5;

  if (self->_maxContentSizeCategory != a3)
  {
    self->_maxContentSizeCategory = (NSString *)a3;
    -[PXCapsuleButton _titleFont](self, "_titleFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCapsuleButton titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

  }
}

- (void)setColor:(id)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *stateColorMap;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  stateColorMap = self->_stateColorMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](stateColorMap, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if ((id)v8 == v11)
    {

      goto LABEL_7;
    }
    v9 = self->_stateColorMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

    v7 = (void *)v8;
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](stateColorMap, "setObject:forKeyedSubscript:", 0, v7);
  }

  -[PXCapsuleButton _invalidateBackgroundColor](self, "_invalidateBackgroundColor");
LABEL_7:

}

- (id)colorForState:(unint64_t)a3
{
  NSMutableDictionary *stateColorMap;
  void *v4;
  void *v5;

  stateColorMap = self->_stateColorMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](stateColorMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCapsuleButton;
  -[PXCapsuleButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXCapsuleButton _invalidateCornerRadius](self, "_invalidateCornerRadius");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NSString *v14;
  _BOOL4 IsAccessibilityCategory;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXCapsuleButton titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCapsuleButton _titleFont](self, "_titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  -[PXCapsuleButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

  v16 = fmax(v10, 36.0) + 32.0;
  v17 = 34.0;
  if (!IsAccessibilityCategory)
    v17 = 28.0;
  v18 = fmax(v12 + 10.0, v17);

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)startLoadingAnimation
{
  void *v3;
  void *v4;
  double v5;
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  void *v9;
  double MidX;
  CGRect v11;
  CGRect v12;

  -[PXCapsuleButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setOpacity:", v5);

  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    v8 = self->_activityIndicatorView;
    self->_activityIndicatorView = v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_activityIndicatorView, "setColor:", v9);

    -[PXCapsuleButton bounds](self, "bounds");
    MidX = CGRectGetMidX(v11);
    -[PXCapsuleButton bounds](self, "bounds");
    -[UIActivityIndicatorView setCenter:](self->_activityIndicatorView, "setCenter:", MidX, CGRectGetMidY(v12));
    -[PXCapsuleButton addSubview:](self, "addSubview:", self->_activityIndicatorView);
    activityIndicatorView = self->_activityIndicatorView;
  }
  -[UIActivityIndicatorView startAnimating](activityIndicatorView, "startAnimating");
}

- (void)stopLoadingAnimation
{
  void *v3;
  double v4;
  id v5;

  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  -[PXCapsuleButton titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PXCapsuleButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXCapsuleButton;
    -[PXCapsuleButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[PXCapsuleButton _stateDidChange](self, "_stateDidChange");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PXCapsuleButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXCapsuleButton;
    -[PXCapsuleButton setSelected:](&v5, sel_setSelected_, v3);
    -[PXCapsuleButton _stateDidChange](self, "_stateDidChange");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PXCapsuleButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXCapsuleButton;
    -[PXCapsuleButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[PXCapsuleButton _stateDidChange](self, "_stateDidChange");
  }
}

- (id)_titleFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC1350];
  v3 = *MEMORY[0x1E0DC4B08];
  -[PXCapsuleButton maxContentSizeCategory](self, "maxContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v3, v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateBackgroundColor
{
  id v3;

  -[PXCapsuleButton colorForState:](self, "colorForState:", -[PXCapsuleButton state](self, "state"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCapsuleButton setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)_updateCornerRadius
{
  CGFloat v3;
  id v4;
  CGRect v5;

  -[PXCapsuleButton bounds](self, "bounds");
  v3 = CGRectGetHeight(v5) * 0.5;
  -[PXCapsuleButton layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

- (NSString)maxContentSizeCategory
{
  return self->_maxContentSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_stateColorMap, 0);
}

@end
