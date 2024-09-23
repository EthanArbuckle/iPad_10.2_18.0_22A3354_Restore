@implementation WFWidgetConfigurationHostCardView

- (WFWidgetConfigurationHostCardView)initWithRequest:(id)a3
{
  WFWidgetConfigurationHostCardView *v3;
  WFWidgetConfigurationHostCardView *v4;
  WFWidgetConfigurationHostCardView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationHostCardView;
  v3 = -[WFWidgetConfigurationCardView initWithRequest:contentView:](&v7, sel_initWithRequest_contentView_, a3, 0);
  v4 = v3;
  if (v3)
  {
    -[WFWidgetConfigurationHostCardView startLoading](v3, "startLoading");
    v5 = v4;
  }

  return v4;
}

- (void)startLoading
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v3, "startAnimating");
  -[WFWidgetConfigurationCardView setContentView:stretchToFit:](self, "setContentView:stretchToFit:", v3, 0);

}

- (void)showMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BEBD708]);
  WFLocalizedStringFromTable(CFSTR("Unable to Load"), CFSTR("WidgetConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v5);

  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[WFWidgetConfigurationCardView setContentView:stretchToFit:](self, "setContentView:stretchToFit:", v7, 0);
}

@end
