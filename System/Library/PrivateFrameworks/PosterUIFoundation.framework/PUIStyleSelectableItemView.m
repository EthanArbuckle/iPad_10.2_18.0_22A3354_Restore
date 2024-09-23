@implementation PUIStyleSelectableItemView

- (PUIStyleSelectableItemView)initWithFrame:(CGRect)a3
{
  PUIStyleSelectableItemView *v3;
  CGPath *Mutable;
  CGFloat v5;
  CGFloat v6;
  PUIShapeView *v7;
  void *v8;
  id v9;
  id v10;
  PUIShapeView *selectionView;
  PUIShapeView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  objc_super v35;
  void *v36;
  _QWORD v37[6];
  CGRect v38;
  CGRect v39;

  v37[4] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)PUIStyleSelectableItemView;
  v3 = -[PUIStyleSelectableItemView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    Mutable = CGPathCreateMutable();
    -[PUIStyleSelectableItemView intrinsicContentSize](v3, "intrinsicContentSize");
    v38.size.width = v5;
    v38.size.height = v6;
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v39 = CGRectInset(v38, 1.0, 1.0);
    CGPathAddEllipseInRect(Mutable, 0, v39);
    v7 = objc_alloc_init(PUIShapeView);
    -[PUIShapeView shapeLayer](v7, "shapeLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPath:", Mutable);
    objc_msgSend(v8, "setLineWidth:", 3.0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = v8;
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v10, "CGColor"));

    -[PUIShapeView setHidden:](v7, "setHidden:", 1);
    -[PUIShapeView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIStyleSelectableItemView addSubview:](v3, "addSubview:", v7);
    selectionView = v3->_selectionView;
    v3->_selectionView = v7;
    v12 = v7;

    CGPathRelease(Mutable);
    v26 = (void *)MEMORY[0x24BDD1628];
    -[PUIShapeView topAnchor](v12, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleSelectableItemView topAnchor](v3, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v29;
    -[PUIShapeView leadingAnchor](v12, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleSelectableItemView leadingAnchor](v3, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v13;
    -[PUIShapeView trailingAnchor](v12, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleSelectableItemView trailingAnchor](v3, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v16;
    -[PUIShapeView bottomAnchor](v12, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleSelectableItemView bottomAnchor](v3, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v20);

    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __44__PUIStyleSelectableItemView_initWithFrame___block_invoke;
    v33[3] = &unk_25154BC68;
    v34 = v32;
    v23 = v32;
    v24 = (id)-[PUIStyleSelectableItemView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v22, v33);

  }
  return v3;
}

void __44__PUIStyleSelectableItemView_initWithFrame___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setFillColor:", objc_msgSend(v5, "CGColor"));

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  if (self->_selected != a3)
  {
    v3 = a3;
    self->_selected = a3;
    -[PUIStyleSelectableItemView selectionView](self, "selectionView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", !v3);

  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PUIShapeView)selectionView
{
  return self->_selectionView;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
}

@end
