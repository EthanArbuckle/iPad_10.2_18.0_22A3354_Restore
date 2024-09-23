@implementation PUImportCustomViewBarButton

- (PUImportCustomViewBarButton)initWithCustomView:(id)a3
{
  id v5;
  PUImportCustomViewBarButton *v6;
  PUImportCustomViewBarButton *v7;
  id *p_customView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUImportCustomViewBarButton;
  v6 = -[PUImportCustomViewBarButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_customView = (id *)&v6->_customView;
    objc_storeStrong((id *)&v6->_customView, a3);
    objc_msgSend(*p_customView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUImportCustomViewBarButton addSubview:](v7, "addSubview:", *p_customView);
  }

  return v7;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUImportCustomViewBarButton;
  -[PUImportCustomViewBarButton updateConstraints](&v16, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_customView, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportCustomViewBarButton topAnchor](self, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[UIView leftAnchor](self->_customView, "leftAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportCustomViewBarButton leftAnchor](self, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[UIView bottomAnchor](self->_customView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportCustomViewBarButton bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  -[UIView rightAnchor](self->_customView, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportCustomViewBarButton rightAnchor](self, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PUImportCustomViewBarButton customView](self, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)sizeToFit
{
  id v2;

  -[PUImportCustomViewBarButton customView](self, "customView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeToFit");

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUImportCustomViewBarButton customView](self, "customView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  id v2;

  -[PUImportCustomViewBarButton customView](self, "customView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateIntrinsicContentSize");

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportCustomViewBarButton;
  -[PUImportCustomViewBarButton setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PUImportCustomViewBarButton_setHighlighted___block_invoke;
  v5[3] = &unk_1E58AAD68;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.2);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[PUImportCustomViewBarButton customAccessibilityLabel](self, "customAccessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUImportCustomViewBarButton customAccessibilityLabel](self, "customAccessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUImportCustomViewBarButton customView](self, "customView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (UIView)customView
{
  return self->_customView;
}

- (NSString)customAccessibilityLabel
{
  return self->_customAccessibilityLabel;
}

- (void)setCustomAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

void __46__PUImportCustomViewBarButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.4;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "customView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

@end
