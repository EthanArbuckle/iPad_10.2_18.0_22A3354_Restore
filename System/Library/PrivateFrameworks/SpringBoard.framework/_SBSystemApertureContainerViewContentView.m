@implementation _SBSystemApertureContainerViewContentView

- (UIView)contentView
{
  void *v2;
  void *v3;

  -[_SBSystemApertureContainerViewContentView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sbsa_onlyObjectOrNilAssert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setContentView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v14 = a3;
  -[_SBSystemApertureContainerViewContentView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_msgSend(v4, "removeFromSuperview");
    -[_SBSystemApertureContainerViewContentView addSubview:](self, "addSubview:", v14);
    -[_SBSystemApertureContainerViewContentView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60___SBSystemApertureContainerViewContentView_setContentView___block_invoke;
    v15[3] = &unk_1E8EA25E0;
    v16 = v14;
    v17 = v6;
    v18 = v8;
    v19 = v10;
    v20 = v12;
    objc_msgSend(v13, "performWithoutAnimation:", v15);

  }
}

- (void)setBounds:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)_SBSystemApertureContainerViewContentView;
  -[_SBSystemApertureContainerViewContentView setBounds:](&v18, sel_setBounds_);
  -[_SBSystemApertureContainerViewContentView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  memset(&v17, 0, sizeof(v17));
  if (v4)
    objc_msgSend(v4, "transform");
  BSRectWithSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v17;
  CGAffineTransformInvert(&v16, &v15);
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  CGRectApplyAffineTransform(v19, &v16);
  -[_SBSystemApertureContainerViewContentView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  UIRectRoundToScale();
  objc_msgSend(v5, "setBounds:");

  UIRectGetCenter();
  objc_msgSend(v5, "setCenter:");

}

@end
