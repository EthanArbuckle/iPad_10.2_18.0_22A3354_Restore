@implementation SiriUISettingTemplateView

- (SiriUISettingTemplateView)initWithDataSource:(id)a3
{
  SiriUISettingTemplateView *v3;
  UILabel *v4;
  UILabel *textLabel;
  UILabel *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriUISettingTemplateView;
  v3 = -[SiriUIBaseTemplateView initWithDataSource:](&v9, sel_initWithDataSource_, a3);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v4;

    v6 = v3->_textLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[SiriUISettingTemplateView addSubview:](v3, "addSubview:", v3->_textLabel);
  }
  return v3;
}

- (double)desiredHeight
{
  return 44.0;
}

- (void)reloadData
{
  void *v3;
  UILabel *textLabel;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUISettingTemplateView;
  -[SiriUIBaseTemplateView reloadData](&v6, sel_reloadData);
  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  textLabel = self->_textLabel;
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](textLabel, "setText:", v5);

  -[SiriUISettingTemplateView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)SiriUISettingTemplateView;
  -[SiriUISettingTemplateView layoutSubviews](&v13, sel_layoutSubviews);
  -[SiriUISettingTemplateView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "templatedContentMargins");

  v12 = -[SiriUISettingTemplateView semanticContentAttribute](self, "semanticContentAttribute");
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v8, v10);
  if (v12 == 4)
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    CGRectGetWidth(v14);
  }
  UIRectCenteredYInRect();
  -[UILabel setFrame:](self->_textLabel, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
