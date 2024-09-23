@implementation SiriUITextTemplateView

- (SiriUITextTemplateView)initWithDataSource:(id)a3
{
  SiriUITextTemplateView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUITextTemplateView;
  v3 = -[SiriUILabelStackTemplateView initWithDataSource:](&v5, sel_initWithDataSource_, a3);
  -[SiriUITextTemplateView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIButton *disclosureButton;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)SiriUITextTemplateView;
  -[SiriUITextTemplateView layoutSubviews](&v9, sel_layoutSubviews);
  -[SiriUITextTemplateView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  disclosureButton = self->_disclosureButton;
  v8 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[UIButton setFrame:](disclosureButton, "setFrame:", 0.0, 0.0, v8, CGRectGetHeight(v11));
}

- (void)setupDisclosureIndicator
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *chevronView;
  double v9;

  v3 = objc_alloc(MEMORY[0x24BDF6AE8]);
  v4 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterGlyphColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriui_semiTransparentChevronImageWithColor:allowNaturalLayout:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v6);
  chevronView = self->_chevronView;
  self->_chevronView = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_chevronView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_chevronView, "setContentMode:", 4);
  -[SiriUILabelStackTemplateView insertTrailingView:withMargins:](self, "insertTrailingView:withMargins:", self->_chevronView, 0.0, -7.0, 0.0, 0.0);
  LODWORD(v9) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_chevronView, "setContentHuggingPriority:forAxis:", 0, v9);
}

- (void)_setupDisclosureButton
{
  UIButton *v3;
  UIButton *disclosureButton;
  id v5;

  v3 = (UIButton *)objc_alloc_init(MEMORY[0x24BDF6880]);
  disclosureButton = self->_disclosureButton;
  self->_disclosureButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_disclosureButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriUITextTemplateView addSubview:](self, "addSubview:", self->_disclosureButton);
  v5 = (id)-[UIButton siriui_pinToSuperviewWithEdgeInsets:](self->_disclosureButton, "siriui_pinToSuperviewWithEdgeInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
}

- (void)addTargetForDisclosure:(id)a3 action:(SEL)a4
{
  -[UIButton addTarget:action:forControlEvents:](self->_disclosureButton, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)removeTargetForDisclosure:(id)a3 action:(SEL)a4
{
  -[UIButton removeTarget:action:forControlEvents:](self->_disclosureButton, "removeTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)layoutDetailText
{
  void *v3;
  void *v4;
  uint64_t v5;
  UILabel *v6;
  UILabel *detailTextLabel;
  double v8;
  double v9;
  UILabel *v10;
  void *v11;
  void *v12;

  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    if (!self->_detailTextLabel)
    {
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredBodyLabel");
      v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
      detailTextLabel = self->_detailTextLabel;
      self->_detailTextLabel = v6;

      -[UILabel setUseSecondaryTextColor](self->_detailTextLabel, "setUseSecondaryTextColor");
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v8) = 1144750080;
      -[UILabel setContentHuggingPriority:forAxis:](self->_detailTextLabel, "setContentHuggingPriority:forAxis:", 0, v8);
      LODWORD(v9) = 1132068864;
      -[UILabel setContentCompressionResistancePriority:forAxis:](self->_detailTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v9);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v10 = self->_detailTextLabel;
      -[SiriUIBaseTemplateView dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v10, "setText:", v12);

      -[UILabel sizeToFit](self->_detailTextLabel, "sizeToFit");
      -[SiriUILabelStackTemplateView insertTrailingView:withMargins:](self, "insertTrailingView:withMargins:", self->_detailTextLabel, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    }
  }
}

- (void)reloadData
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUITextTemplateView;
  -[SiriUILabelStackTemplateView reloadData](&v5, sel_reloadData);
  -[SiriUITextTemplateView layoutDetailText](self, "layoutDetailText");
  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsDisclosureIndicator");

  if (v4)
  {
    -[SiriUITextTemplateView setupDisclosureIndicator](self, "setupDisclosureIndicator");
    -[SiriUITextTemplateView _setupDisclosureButton](self, "_setupDisclosureButton");
  }
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabel, a3);
}

- (UIButton)disclosureButton
{
  return self->_disclosureButton;
}

- (void)setDisclosureButton:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureButton, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
}

@end
