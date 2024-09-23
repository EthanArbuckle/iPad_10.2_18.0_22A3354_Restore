@implementation _PLPillAccessoryWrapperView

- (_PLPillAccessoryWrapperView)initWithManagedSubview:(id)a3
{
  id v4;
  _PLPillAccessoryWrapperView *v5;
  _PLPillAccessoryWrapperView *v6;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v5 = -[_PLPillAccessoryWrapperView initWithFrame:](self, "initWithFrame:");
  v6 = v5;
  if (v5)
    -[_PLPillAccessoryWrapperView addSubview:](v5, "addSubview:", v4);

  return v6;
}

- (_PLPillAccessoryWrapperView)initWithFrame:(CGRect)a3
{
  _PLPillAccessoryWrapperView *v3;
  _PLPillAccessoryWrapperView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PLPillAccessoryWrapperView;
  v3 = -[_PLPillAccessoryWrapperView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_PLPillAccessoryWrapperView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 20.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)addSubview:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_PLPillAccessoryWrapperView subviews](self, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPillContentView.m"), 596, CFSTR("This class only manages a single subview"));

  }
  v19.receiver = self;
  v19.super_class = (Class)_PLPillAccessoryWrapperView;
  -[_PLPillAccessoryWrapperView addSubview:](&v19, sel_addSubview_, v5);
  -[_PLPillAccessoryWrapperView intrinsicContentSize](self, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;
  -[_PLPillAccessoryWrapperView widthAnchor](self, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PLPillAccessoryWrapperView heightAnchor](self, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3718];
  v20[0] = v13;
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v17);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PLPillAccessoryWrapperView;
  -[_PLPillAccessoryWrapperView layoutSubviews](&v7, sel_layoutSubviews);
  -[_PLPillAccessoryWrapperView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PLPillAccessoryWrapperView bounds](self, "bounds");
  objc_msgSend(v4, "sizeThatFits:", v5, v6);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  objc_msgSend(v4, "setFrame:", 0);

}

@end
