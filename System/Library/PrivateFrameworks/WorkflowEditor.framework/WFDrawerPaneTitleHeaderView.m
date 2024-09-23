@implementation WFDrawerPaneTitleHeaderView

- (WFDrawerPaneTitleHeaderView)initWithTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  WFDrawerPaneTitleHeaderView *v7;
  WFDrawerPaneTitleHeaderView *v8;
  WFDrawerPaneTitleHeaderView *v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend((id)objc_opt_class(), "drawerCategoryTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setText:", v4);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BEBDF08]);
  v11.receiver = self;
  v11.super_class = (Class)WFDrawerPaneTitleHeaderView;
  v7 = -[WFDrawerPaneCustomTitleHeaderView initWithTitleView:](&v11, sel_initWithTitleView_, v5);
  v8 = v7;
  if (v7)
  {
    -[WFDrawerPaneTitleHeaderView setTitle:](v7, "setTitle:", v4);
    v9 = v8;
  }

  return v8;
}

- (void)setTitle:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[WFDrawerPaneCustomTitleHeaderView titleView](self, "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)drawerCategoryTitleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithLegibilityWeight:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", *MEMORY[0x24BEBE240], *MEMORY[0x24BEBE070], v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
