@implementation PKPaymentMoreInformationViewController

- (PKPaymentMoreInformationViewController)initWithContext:(int64_t)a3
{
  PKPaymentMoreInformationViewController *v4;
  PKPaymentMoreInformationViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMoreInformationViewController;
  v4 = -[PKPaymentMoreInformationViewController init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v4, sel_doneButtonTapped);
    -[PKPaymentMoreInformationViewController navigationItem](v5, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

  }
  return v5;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentMoreInformationViewController;
  -[PKPaymentMoreInformationViewController loadView](&v3, sel_loadView);
  -[PKPaymentMoreInformationViewController setupViewAndScrollView](self, "setupViewAndScrollView");
  -[PKPaymentMoreInformationViewController setupTitleLabel](self, "setupTitleLabel");
  -[PKPaymentMoreInformationViewController setupSubtitleLabel](self, "setupSubtitleLabel");
  -[PKPaymentMoreInformationViewController setupBusinessChatButton](self, "setupBusinessChatButton");
  -[PKPaymentMoreInformationViewController setupDetailTextView](self, "setupDetailTextView");
}

- (void)setupViewAndScrollView
{
  void *v3;
  id v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  id v7;

  -[PKPaymentMoreInformationViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v3);

  v4 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v5 = (UIScrollView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  objc_msgSend(v7, "addSubview:", self->_scrollView);
}

- (void)setupTitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = self->_titleLabel;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC4938], 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", self->_detailTitle);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_titleLabel);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
}

- (void)setupSubtitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *subtitleLabel;
  UILabel *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v4;

  v6 = self->_subtitleLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B60], (NSString *)*MEMORY[0x1E0DC4938]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", self->_detailSubtitle);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_subtitleLabel);
  -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
}

- (void)setupBusinessChatButton
{
  void *v3;
  NSString *businessChatButtonTitle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *businessChatButton;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (-[PKPaymentMoreInformationViewController _shouldShowBusinessChatButton](self, "_shouldShowBusinessChatButton"))
  {
    v3 = (void *)MEMORY[0x1E0DC3520];
    businessChatButtonTitle = self->_businessChatButtonTitle;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pkui_plainConfigurationWithTitle:font:", businessChatButtonTitle, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0DC3428];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __65__PKPaymentMoreInformationViewController_setupBusinessChatButton__block_invoke;
    v14 = &unk_1E3E62BD0;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "actionWithHandler:", &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v6, v8, v11, v12, v13, v14);
    v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
    businessChatButton = self->_businessChatButton;
    self->_businessChatButton = v9;

    -[UIButton setConfigurationUpdateHandler:](self->_businessChatButton, "setConfigurationUpdateHandler:", &__block_literal_global_161);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_businessChatButton);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __65__PKPaymentMoreInformationViewController_setupBusinessChatButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_businessChatButtonTapped");

}

void __65__PKPaymentMoreInformationViewController_setupBusinessChatButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setTextAlignment:", 1);
}

- (void)setupDetailTextView
{
  id v3;
  UITextView *v4;
  UITextView *detailTextView;
  UITextView *v6;
  void *v7;
  UITextView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  detailTextView = self->_detailTextView;
  self->_detailTextView = v4;

  v6 = self->_detailTextView;
  PKAttributedStringCreateProvisioningBulletedParagraph(self->_detailBody, (void *)*MEMORY[0x1E0DC4938]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](v6, "setAttributedText:", v7);

  -[UITextView setDataDetectorTypes:](self->_detailTextView, "setDataDetectorTypes:", 3);
  -[UITextView setDelegate:](self->_detailTextView, "setDelegate:", self);
  -[UITextView setTextContainerInset:](self->_detailTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[UITextView setEditable:](self->_detailTextView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_detailTextView, "setSelectable:", 1);
  -[UITextView _setInteractiveTextSelectionDisabled:](self->_detailTextView, "_setInteractiveTextSelectionDisabled:", 1);
  v8 = self->_detailTextView;
  v11 = *MEMORY[0x1E0DC1140];
  if (PKPaymentSetupContextIsBridge())
    BPSBridgeTintColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setLinkTextAttributes:](v8, "setLinkTextAttributes:", v10);

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_detailTextView);
  -[UITextView setAccessibilityIdentifier:](self->_detailTextView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double MaxY;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[PKPaymentMoreInformationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v5 + -48.0, 1.79769313e308);
  v9 = v8;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 24.0, 30.0, v5 + -48.0, v8);
  v21.origin.x = 24.0;
  v21.origin.y = 30.0;
  v21.size.width = v5 + -48.0;
  v21.size.height = v9;
  v10 = CGRectGetMaxY(v21) + 20.0;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v5 + -48.0, 1.79769313e308);
  v12 = v11;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 24.0, v10, v5 + -48.0, v11);
  v22.origin.x = 24.0;
  v22.origin.y = v10;
  v22.size.width = v5 + -48.0;
  v22.size.height = v12;
  v13 = CGRectGetMaxY(v22) + 30.0;
  -[UITextView sizeThatFits:](self->_detailTextView, "sizeThatFits:", v5 + -48.0, 1.79769313e308);
  v15 = v14;
  -[UITextView setFrame:](self->_detailTextView, "setFrame:", 24.0, v13, v5 + -48.0, v14);
  v23.origin.x = 24.0;
  v23.origin.y = v13;
  v23.size.width = v5 + -48.0;
  v23.size.height = v15;
  MaxY = CGRectGetMaxY(v23);
  if (self->_businessChatButton)
  {
    v24.origin.x = 24.0;
    v24.origin.y = v13;
    v24.size.width = v5 + -48.0;
    v24.size.height = v15;
    v17 = CGRectGetMaxY(v24) + 20.0;
    -[UIButton sizeThatFits:](self->_businessChatButton, "sizeThatFits:", v5 + -20.0, 1.79769313e308);
    PKFloatCeilToPixel();
    v19 = v18;
    -[UIButton setFrame:](self->_businessChatButton, "setFrame:", 10.0, v17, v5 + -20.0, v18);
    v25.origin.x = 10.0;
    v25.origin.y = v17;
    v25.size.width = v5 + -20.0;
    v25.size.height = v19;
    MaxY = CGRectGetMaxY(v25);
  }
  v20 = MaxY + 20.0;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, 0.0, v5, v7);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v20);
}

- (void)doneButtonTapped
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKPaymentMoreInformationViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 9, 0);
  }
  else
  {
    -[PKPaymentMoreInformationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_businessChatButtonTapped
{
  PKBusinessChatController *v3;
  PKBusinessChatController *businessChatController;
  PKBuinessChatApplyContext *v5;
  PKBusinessChatController *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_businessChatController)
  {
    v3 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v3;

  }
  v5 = -[PKBuinessChatApplyContext initWithIdentifier:intent:]([PKBuinessChatApplyContext alloc], "initWithIdentifier:intent:", self->_businessChatIdentifier, PKBusinessChatApplyIntentFromString(self->_businessChatIntentName));
  objc_initWeak(&location, self);
  v6 = self->_businessChatController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke;
  v7[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v8, &location);
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v6, "openBusinessChatWithContext:completion:", v5, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __67__PKPaymentMoreInformationViewController__businessChatButtonTapped__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

      WeakRetained = v5;
    }
  }

}

- (BOOL)_shouldShowBusinessChatButton
{
  return -[NSString length](self->_businessChatIdentifier, "length")
      && -[NSString length](self->_businessChatButtonTitle, "length")
      && -[NSString length](self->_businessChatIntentName, "length")
      && +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  char IsSetupAssistant;
  id WeakRetained;
  char v10;
  id v11;

  v7 = a4;
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  if ((IsSetupAssistant & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "moreInformationViewController:didInteractWithURL:", self, v7);

    }
  }

  return IsSetupAssistant ^ 1;
}

- (PKPaymentMoreInformationViewControllerDelegate)delegate
{
  return (PKPaymentMoreInformationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSString)detailSubtitle
{
  return self->_detailSubtitle;
}

- (void)setDetailSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSString)detailBody
{
  return self->_detailBody;
}

- (void)setDetailBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSString)businessChatButtonTitle
{
  return self->_businessChatButtonTitle;
}

- (void)setBusinessChatButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSString)businessChatIntentName
{
  return self->_businessChatIntentName;
}

- (void)setBusinessChatIntentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatIntentName, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_businessChatButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailBody, 0);
  objc_storeStrong((id *)&self->_detailSubtitle, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_businessChatButton, 0);
  objc_storeStrong((id *)&self->_detailTextView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
