@implementation TFFeedbackFormBaseCell

- (TFFeedbackFormBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TFFeedbackFormBaseCell *v4;
  TFFeedbackFormBaseCell *v5;
  UIView *topSeparator;
  UIView *bottomSeparator;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TFFeedbackFormBaseCell;
  v4 = -[TFFeedbackFormBaseCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    topSeparator = v4->_topSeparator;
    v4->_topSeparator = 0;

    bottomSeparator = v5->_bottomSeparator;
    v5->_bottomSeparator = 0;

  }
  return v5;
}

- (BOOL)isSelectable
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TFFeedbackFormBaseCell;
  -[TFFeedbackFormBaseCell layoutSubviews](&v21, sel_layoutSubviews);
  -[TFFeedbackFormBaseCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TFFeedbackFormBaseCell topSeparator](self, "topSeparator");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[TFFeedbackFormBaseCell topSeparator](self, "topSeparator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isHidden");

    if ((v14 & 1) == 0)
    {
      -[TFFeedbackFormBaseCell topSeparator](self, "topSeparator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormBaseCell _separatorFrameForTop:inLayoutBounds:](self, "_separatorFrameForTop:inLayoutBounds:", 1, v4, v6, v8, v10);
      objc_msgSend(v15, "setFrame:");

    }
  }
  -[TFFeedbackFormBaseCell bottomSeparator](self, "bottomSeparator");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[TFFeedbackFormBaseCell bottomSeparator](self, "bottomSeparator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isHidden");

    if ((v19 & 1) == 0)
    {
      -[TFFeedbackFormBaseCell bottomSeparator](self, "bottomSeparator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormBaseCell _separatorFrameForTop:inLayoutBounds:](self, "_separatorFrameForTop:inLayoutBounds:", 0, v4, v6, v8, v10);
      objc_msgSend(v20, "setFrame:");

    }
  }
}

- (void)applyContentsOfEntry:(id)a3
{
  -[TFFeedbackFormBaseCell doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)prepareSeparatorsForCellInSectionLocation:(int)a3
{
  -[TFFeedbackFormBaseCell _setupSeparatorViewsForAppearingInSectionLocation:](self, "_setupSeparatorViewsForAppearingInSectionLocation:", *(_QWORD *)&a3);
  -[TFFeedbackFormBaseCell setNeedsLayout](self, "setNeedsLayout");
}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)result inTraitEnvironment:(id)a6
{
  double v6;

  v6 = 44.0;
  result.height = v6;
  return result;
}

- (unint64_t)displayableDataType
{
  -[TFFeedbackFormBaseCell doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_setupSeparatorViewsForAppearingInSectionLocation:(int)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = a3 - 3;
  if (a3 == 4 || a3 == 2)
  {
    -[TFFeedbackFormBaseCell topSeparator](self, "topSeparator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[TFFeedbackFormBaseCell _createSeparatorSubview](self, "_createSeparatorSubview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormBaseCell setTopSeparator:](self, "setTopSeparator:", v6);

    }
    -[TFFeedbackFormBaseCell topSeparator](self, "topSeparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    -[TFFeedbackFormBaseCell topSeparator](self, "topSeparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "setHidden:", v9);

  -[TFFeedbackFormBaseCell bottomSeparator](self, "bottomSeparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v4 > 1)
  {
    v12 = 1;
  }
  else
  {

    if (!v13)
    {
      -[TFFeedbackFormBaseCell _createSeparatorSubview](self, "_createSeparatorSubview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackFormBaseCell setBottomSeparator:](self, "setBottomSeparator:", v11);

    }
    -[TFFeedbackFormBaseCell bottomSeparator](self, "bottomSeparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v12 = 0;
  }
  objc_msgSend(v10, "setHidden:", v12);

}

- (id)_createSeparatorSubview
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[TFFeedbackFormBaseCell addSubview:](self, "addSubview:", v3);
  return v3;
}

- (CGRect)_separatorFrameForTop:(BOOL)a3 inLayoutBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = 1.0 / v10;

  v12 = 0.0;
  if (!a3)
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v12 = CGRectGetMaxY(v17) - v11;
  }
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v13 = CGRectGetWidth(v18);
  v14 = 0.0;
  v15 = v12;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (TFFeedbackDataUpdateProxy)updateProxy
{
  return (TFFeedbackDataUpdateProxy *)objc_loadWeakRetained((id *)&self->_updateProxy);
}

- (void)setUpdateProxy:(id)a3
{
  objc_storeWeak((id *)&self->_updateProxy, a3);
}

- (UIView)topSeparator
{
  return self->_topSeparator;
}

- (void)setTopSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_topSeparator, a3);
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSeparator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_destroyWeak((id *)&self->_updateProxy);
}

@end
