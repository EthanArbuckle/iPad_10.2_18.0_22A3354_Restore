@implementation SiriUISelectionTemplateView

- (SiriUISelectionTemplateView)initWithDataSource:(id)a3
{
  SiriUISelectionTemplateView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImageView *checkmarkImageView;
  uint64_t v10;
  UIButton *selectionButton;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriUISelectionTemplateView;
  v3 = -[SiriUISettingTemplateView initWithDataSource:](&v13, sel_initWithDataSource_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageFlippedForRightToLeftLayoutDirection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v7);
    checkmarkImageView = v3->_checkmarkImageView;
    v3->_checkmarkImageView = (UIImageView *)v8;

    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    selectionButton = v3->_selectionButton;
    v3->_selectionButton = (UIButton *)v10;

    -[SiriUISelectionTemplateView addSubview:](v3, "addSubview:", v3->_checkmarkImageView);
    -[SiriUISelectionTemplateView addSubview:](v3, "addSubview:", v3->_selectionButton);
    -[SiriUISelectionTemplateView reloadData](v3, "reloadData");

  }
  return v3;
}

- (void)reloadData
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUISelectionTemplateView;
  -[SiriUISettingTemplateView reloadData](&v4, sel_reloadData);
  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHidden:](self->_checkmarkImageView, "setHidden:", objc_msgSend(v3, "selected") ^ 1);

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
  void *v11;
  uint64_t v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)SiriUISelectionTemplateView;
  -[SiriUISettingTemplateView layoutSubviews](&v13, sel_layoutSubviews);
  -[SiriUISelectionTemplateView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "templatedContentMargins");

  v12 = -[SiriUISelectionTemplateView semanticContentAttribute](self, "semanticContentAttribute");
  -[UIImageView sizeThatFits:](self->_checkmarkImageView, "sizeThatFits:", v8, v10);
  if (v12 != 4)
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    CGRectGetWidth(v14);
    -[UIImageView frame](self->_checkmarkImageView, "frame");
    CGRectGetWidth(v15);
  }
  UIRectCenteredYInRect();
  -[UIImageView setFrame:](self->_checkmarkImageView, "setFrame:");
  -[UIButton setFrame:](self->_selectionButton, "setFrame:", v4, v6, v8, v10);
}

- (void)addTargetForSelectionEvent:(id)a3 action:(SEL)a4
{
  -[UIButton addTarget:action:forControlEvents:](self->_selectionButton, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)removeTargetForSelectionEvent:(id)a3 action:(SEL)a4
{
  -[UIButton removeTarget:action:forControlEvents:](self->_selectionButton, "removeTarget:action:forControlEvents:", a3, a4, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionButton, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end
