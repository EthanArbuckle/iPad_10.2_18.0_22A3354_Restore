@implementation PKDashboardMessageView

- (PKDashboardMessageView)initWithFrame:(CGRect)a3
{
  PKDashboardMessageView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIButton *dismissButton;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  UILabel *labelTitle;
  UILabel *v22;
  void *v23;
  uint64_t v24;
  UILabel *labelSecondaryTitle;
  UILabel *v26;
  void *v27;
  uint64_t v28;
  UILabel *labelMessage;
  UILabel *v30;
  void *v31;
  uint64_t v32;
  UILabel *labelSecondaryMessage;
  UILabel *v34;
  void *v35;
  uint64_t v36;
  UIImageView *iconImageView;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  id location;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)PKDashboardMessageView;
  v3 = -[PKDashboardMessageView initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (void *)MEMORY[0x1E0DC3428];
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __40__PKDashboardMessageView_initWithFrame___block_invoke;
    v42 = &unk_1E3E62BD0;
    objc_copyWeak(&v43, &location);
    objc_msgSend(v4, "actionWithHandler:", &v39);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3520];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"), v39, v40, v41, v42);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1418]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithFont:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v7, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v3->_smallDevice = PKUIGetMinScreenWidthType() == 0;
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v12, v5);
    v13 = objc_claimAutoreleasedReturnValue();
    dismissButton = v3->_dismissButton;
    v3->_dismissButton = (UIButton *)v13;

    -[UIButton setAccessibilityIdentifier:](v3->_dismissButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    -[PKDashboardMessageView addSubview:](v3, "addSubview:", v3->_dismissButton);
    v15 = objc_alloc(MEMORY[0x1E0DC3990]);
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v20 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], v17, v18, v19);
    labelTitle = v3->_labelTitle;
    v3->_labelTitle = (UILabel *)v20;

    v22 = v3->_labelTitle;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    -[UILabel setAccessibilityIdentifier:](v3->_labelTitle, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKDashboardMessageView addSubview:](v3, "addSubview:", v3->_labelTitle);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v16, v17, v18, v19);
    labelSecondaryTitle = v3->_labelSecondaryTitle;
    v3->_labelSecondaryTitle = (UILabel *)v24;

    v26 = v3->_labelSecondaryTitle;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v26, "setTextColor:", v27);

    -[UILabel setAccessibilityIdentifier:](v3->_labelSecondaryTitle, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FF0]);
    -[PKDashboardMessageView addSubview:](v3, "addSubview:", v3->_labelSecondaryTitle);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v16, v17, v18, v19);
    labelMessage = v3->_labelMessage;
    v3->_labelMessage = (UILabel *)v28;

    v30 = v3->_labelMessage;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    -[UILabel setAccessibilityIdentifier:](v3->_labelMessage, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKDashboardMessageView addSubview:](v3, "addSubview:", v3->_labelMessage);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v16, v17, v18, v19);
    labelSecondaryMessage = v3->_labelSecondaryMessage;
    v3->_labelSecondaryMessage = (UILabel *)v32;

    v34 = v3->_labelSecondaryMessage;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v34, "setTextColor:", v35);

    -[UILabel setAccessibilityIdentifier:](v3->_labelSecondaryMessage, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE8]);
    -[PKDashboardMessageView addSubview:](v3, "addSubview:", v3->_labelSecondaryMessage);
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v16, v17, v18, v19);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v36;

    -[UIImageView setContentMode:](v3->_iconImageView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v3->_iconImageView, "setClipsToBounds:", 1);
    -[UIImageView _setContinuousCornerRadius:](v3->_iconImageView, "_setContinuousCornerRadius:", 4.0);
    -[PKDashboardMessageView addSubview:](v3, "addSubview:", v3->_iconImageView);
    -[PKDashboardMessageView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D58]);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__PKDashboardMessageView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "dismissButtonPressed:", v4);
}

- (void)updateWithMessage:(id)a3
{
  id v4;
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
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = a3;
  -[PKDashboardMessageView setType:](self, "setType:", objc_msgSend(v4, "type"));
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setTitle:](self, "setTitle:", v5);

  objc_msgSend(v4, "secondaryTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setSecondaryTitle:](self, "setSecondaryTitle:", v6);

  objc_msgSend(v4, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setMessage:withImage:](self, "setMessage:withImage:", v7, v8);

  objc_msgSend(v4, "secondaryMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setSecondaryMessage:](self, "setSecondaryMessage:", v9);

  objc_msgSend(v4, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setIconImage:](self, "setIconImage:", v10);

  objc_msgSend(v4, "imageBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setIconImageBackgroundColor:](self, "setIconImageBackgroundColor:", v11);

  -[PKDashboardMessageView setIconImageContentMode:](self, "setIconImageContentMode:", objc_msgSend(v4, "imageContentMode"));
  -[PKDashboardMessageView setImageOnTrailingEdge:](self, "setImageOnTrailingEdge:", objc_msgSend(v4, "imageOnTrailingEdge"));
  -[PKDashboardMessageView setImageRequestExtraLarge:](self, "setImageRequestExtraLarge:", objc_msgSend(v4, "imageRequestExtraLarge"));
  -[PKDashboardMessageView setStrokeImage:](self, "setStrokeImage:", objc_msgSend(v4, "strokeImage"));
  objc_msgSend(v4, "imageTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setIconImageTintColor:](self, "setIconImageTintColor:", v12);

  objc_msgSend(v4, "avatarContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageView setAvatarContact:](self, "setAvatarContact:", v13);

  objc_msgSend(v4, "actionOnDismiss");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v4;
  v16 = v14;
  v17 = v16;
  if (v16)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = ___ReportableActionOnDismissPressedForMessageWithAction_block_invoke;
    v19[3] = &unk_1E3E618A0;
    v21 = v16;
    v20 = v15;
    v18 = _Block_copy(v19);

  }
  else
  {
    v18 = 0;
  }

  -[PKDashboardMessageView setActionOnDismiss:](self, "setActionOnDismiss:", v18);
  -[PKDashboardMessageView _updateFonts](self, "_updateFonts");

}

- (void)setSmallDevice:(BOOL)a3
{
  self->_smallDevice = a3;
  -[PKDashboardMessageView _updateFonts](self, "_updateFonts");
}

- (void)_updateFonts
{
  UILabel *labelTitle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *labelSecondaryTitle;
  void *v9;
  void *v10;
  UILabel *labelMessage;
  void *v12;
  void *v13;
  void *v14;
  UILabel *labelSecondaryMessage;
  void *v16;
  id v17;

  labelTitle = self->_labelTitle;
  v4 = (void *)*MEMORY[0x1E0DC4B10];
  v5 = (void *)*MEMORY[0x1E0DC4A88];
  if (self->_smallDevice)
    v6 = (void *)*MEMORY[0x1E0DC4B10];
  else
    v6 = (void *)*MEMORY[0x1E0DC4A88];
  PKFontForDefaultDesign(v6, 0, 32770, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](labelTitle, "setFont:", v7);

  labelSecondaryTitle = self->_labelSecondaryTitle;
  if (self->_smallDevice)
    v9 = v4;
  else
    v9 = v5;
  PKFontForDefaultDesign(v9, 0, 32770, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](labelSecondaryTitle, "setFont:", v10);

  labelMessage = self->_labelMessage;
  v12 = (void *)*MEMORY[0x1E0DC4AB8];
  if (self->_smallDevice)
    v13 = (void *)*MEMORY[0x1E0DC4AB8];
  else
    v13 = v4;
  PKFontForDefaultDesign(v13, 0, self->_smallDevice << 15, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](labelMessage, "setFont:", v14);

  labelSecondaryMessage = self->_labelSecondaryMessage;
  if (self->_smallDevice)
    v16 = v12;
  else
    v16 = v4;
  PKFontForDefaultDesign(v16, 0, self->_smallDevice << 15, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](labelSecondaryMessage, "setFont:", v17);

}

- (void)prepareForReuse
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:", 0);
  -[PKDashboardMessageView setIconImageBackgroundColor:](self, "setIconImageBackgroundColor:", 0);
  -[PKDashboardMessageView setIconImageContentMode:](self, "setIconImageContentMode:", 1);
  -[PKDashboardMessageView setStrokeImage:](self, "setStrokeImage:", 0);
  -[UILabel setText:](self->_labelTitle, "setText:", 0);
  -[UILabel setText:](self->_labelSecondaryTitle, "setText:", 0);
  -[UILabel setText:](self->_labelMessage, "setText:", 0);
  -[UILabel setText:](self->_labelSecondaryMessage, "setText:", 0);
  -[UIButton setHidden:](self->_dismissButton, "setHidden:", 1);
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  NSString **p_title;
  id v6;

  p_title = &self->_title;
  objc_storeStrong((id *)&self->_title, a3);
  v6 = a3;
  -[UILabel setText:](self->_labelTitle, "setText:", *p_title);

  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSecondaryTitle:(id)a3
{
  NSString **p_secondaryTitle;
  id v6;

  p_secondaryTitle = &self->_secondaryTitle;
  objc_storeStrong((id *)&self->_secondaryTitle, a3);
  v6 = a3;
  -[UILabel setText:](self->_labelSecondaryTitle, "setText:", *p_secondaryTitle);

  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
  -[PKDashboardMessageView _updateMessageLabel](self, "_updateMessageLabel");
}

- (void)setMessageImage:(id)a3
{
  objc_storeStrong((id *)&self->_messageImage, a3);
  -[PKDashboardMessageView _updateMessageLabel](self, "_updateMessageLabel");
}

- (void)setMessage:(id)a3 withImage:(id)a4
{
  NSString *v6;
  UIImage *v7;
  NSString *message;
  NSString *v9;
  UIImage *messageImage;

  v6 = (NSString *)a3;
  v7 = (UIImage *)a4;
  message = self->_message;
  self->_message = v6;
  v9 = v6;

  messageImage = self->_messageImage;
  self->_messageImage = v7;

  -[PKDashboardMessageView _updateMessageLabel](self, "_updateMessageLabel");
}

- (void)_updateMessageLabel
{
  UIImage *messageImage;
  UILabel *labelMessage;
  UILabel *v5;
  void *v6;

  messageImage = self->_messageImage;
  labelMessage = self->_labelMessage;
  if (messageImage)
  {
    -[UILabel setText:](labelMessage, "setText:", 0);
    v5 = self->_labelMessage;
    -[PKDashboardMessageView _messageWithImageAttributedText](self, "_messageWithImageAttributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v5, "setAttributedText:", v6);

  }
  else
  {
    -[UILabel setAttributedText:](labelMessage, "setAttributedText:", 0);
    -[UILabel setText:](self->_labelMessage, "setText:", self->_message);
  }
  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_messageWithImageAttributedText
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!self->_messageImage)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v3, "setLineBreakMode:", 0);
  objc_msgSend(v3, "setFirstLineHeadIndent:", 0.0);
  v12 = *MEMORY[0x1E0DC1178];
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", self->_messageImage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendAttributedString:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(CFSTR(" "), "stringByAppendingString:", self->_message);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v4);
  objc_msgSend(v6, "appendAttributedString:", v10);

  return v6;
}

- (void)setSecondaryMessage:(id)a3
{
  NSString **p_secondaryMessage;
  id v6;

  p_secondaryMessage = &self->_secondaryMessage;
  objc_storeStrong((id *)&self->_secondaryMessage, a3);
  v6 = a3;
  -[UILabel setText:](self->_labelSecondaryMessage, "setText:", *p_secondaryMessage);

  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIconImage:(id)a3
{
  UIImage **p_iconImage;
  id v6;

  p_iconImage = &self->_iconImage;
  objc_storeStrong((id *)&self->_iconImage, a3);
  v6 = a3;
  -[UIImageView setImage:](self->_iconImageView, "setImage:", *p_iconImage);
  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", *p_iconImage == 0);

  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIconImageBackgroundColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_iconImageBackgroundColor, a3);
  v5 = a3;
  -[UIImageView setBackgroundColor:](self->_iconImageView, "setBackgroundColor:", v5);

}

- (void)setStrokeImage:(BOOL)a3
{
  double v4;
  void *v5;
  _BOOL4 strokeImage;
  uint64_t v7;
  void *v8;
  id v9;

  self->_strokeImage = a3;
  v4 = 0.0;
  if (a3)
    v4 = PKUIPixelLength();
  -[UIImageView layer](self->_iconImageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", v4);

  strokeImage = self->_strokeImage;
  if (self->_strokeImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v9, "CGColor");
  }
  else
  {
    v7 = 0;
  }
  -[UIImageView layer](self->_iconImageView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v7);

  if (strokeImage)
}

- (void)setIconImageContentMode:(int64_t)a3
{
  self->_iconImageContentMode = a3;
  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:");
}

- (void)setActionOnDismiss:(id)a3
{
  void *v4;
  id actionOnDismiss;
  const __CFString *v6;
  void *v7;
  id v8;

  v4 = _Block_copy(a3);
  actionOnDismiss = self->_actionOnDismiss;
  self->_actionOnDismiss = v4;

  -[UIButton configuration](self->_dismissButton, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_imageOnTrailingEdge)
    v6 = CFSTR("xmark.circle.fill");
  else
    v6 = CFSTR("xmark");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  -[UIButton setConfiguration:](self->_dismissButton, "setConfiguration:", v8);
  -[UIButton setHidden:](self->_dismissButton, "setHidden:", self->_actionOnDismiss == 0);
  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");

}

- (void)dismissButtonPressed:(id)a3
{
  void (**actionOnDismiss)(id, SEL, id);
  _BOOL8 v5;

  actionOnDismiss = (void (**)(id, SEL, id))self->_actionOnDismiss;
  if (actionOnDismiss)
  {
    actionOnDismiss[2](actionOnDismiss, a2, a3);
    v5 = self->_actionOnDismiss == 0;
  }
  else
  {
    v5 = 1;
  }
  -[UIButton setHidden:](self->_dismissButton, "setHidden:", v5);
}

- (void)setIconImageTintColor:(id)a3
{
  UIColor **p_iconImageTintColor;
  id v6;

  p_iconImageTintColor = &self->_iconImageTintColor;
  objc_storeStrong((id *)&self->_iconImageTintColor, a3);
  v6 = a3;
  -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", *p_iconImageTintColor);

  -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageView;
  -[PKDashboardMessageView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDashboardMessageView bounds](self, "bounds");
  -[PKDashboardMessageView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKDashboardMessageView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  int v10;
  int v11;
  int v12;
  _BOOL4 smallDevice;
  id actionOnDismiss;
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize v29;
  double v30;
  int v31;
  id v32;
  double v33;
  CGRectEdge v34;
  double v35;
  CGRect *p_slice;
  CGSize size;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGSize v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  double v55;
  double v56;
  int v57;
  CGRect *v58;
  CGFloat v59;
  CGFloat *p_y;
  uint64_t v61;
  CGSize *p_size;
  CGFloat v63;
  CGFloat *p_height;
  uint64_t v65;
  void *v66;
  CGFloat v67;
  UIButton *dismissButton;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGRect *v73;
  CGFloat v74;
  UILabel *labelTitle;
  UILabel *labelSecondaryTitle;
  UILabel *labelMessage;
  UILabel *labelSecondaryMessage;
  void *avatarView;
  UIButton *v80;
  double v81;
  double v82;
  double v83;
  CGRectEdge v84;
  double v85;
  double v86;
  CGRectEdge v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect slice;
  CGRect v94;
  CGRect v95;
  CGRect remainder;
  CGSize result;
  CGRect v98;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  v10 = -[PKDashboardMessageView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v10)
    v11 = 2;
  else
    v11 = 0;
  v87 = v11;
  if (v10)
    v12 = 0;
  else
    v12 = 2;
  v84 = v12;
  smallDevice = self->_smallDevice;
  actionOnDismiss = self->_actionOnDismiss;
  v15 = 1;
  if (self->_type == 3)
  {
    v16 = 1;
  }
  else
  {
    v15 = 2;
    v16 = IsAccessibilityCategory;
  }
  v17 = IsAccessibilityCategory;
  v18 = !IsAccessibilityCategory;
  if (IsAccessibilityCategory)
    v19 = 2 * (self->_type == 3);
  else
    v19 = v15;
  v20 = v16 ^ 1u;
  if (v18)
    v21 = self->_type == 3;
  else
    v21 = 2 * (self->_type == 3);
  -[UILabel setNumberOfLines:](self->_labelTitle, "setNumberOfLines:", v19);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelTitle, "setAdjustsFontSizeToFitWidth:", v20);
  -[UILabel setNumberOfLines:](self->_labelSecondaryTitle, "setNumberOfLines:", v19);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelSecondaryTitle, "setAdjustsFontSizeToFitWidth:", v20);
  -[UILabel setNumberOfLines:](self->_labelMessage, "setNumberOfLines:", v21);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelMessage, "setAdjustsFontSizeToFitWidth:", v20);
  -[UILabel setNumberOfLines:](self->_labelSecondaryMessage, "setNumberOfLines:", v21);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_labelSecondaryMessage, "setAdjustsFontSizeToFitWidth:", v20);
  if (smallDevice)
    v22 = 10.0;
  else
    v22 = 11.0;
  v23 = x + 14.0;
  v24 = y + v22;
  v25 = 27.0;
  if (!smallDevice)
    v25 = 25.0;
  v86 = width;
  v26 = width - v25;
  v27 = 20.0;
  if (!smallDevice)
    v27 = 22.0;
  v28 = height - v27;
  remainder.origin.x = x + 14.0;
  remainder.origin.y = y + v22;
  remainder.size.width = v26;
  remainder.size.height = v28;
  v29 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v94.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v94.size = v29;
  slice.origin = v94.origin;
  slice.size = v29;
  v92.origin = v94.origin;
  v92.size = v29;
  v91.origin = v94.origin;
  v91.size = v29;
  v30 = 30.0;
  if (!self->_smallDevice)
  {
    if (self->_imageOnTrailingEdge)
    {
      if (self->_imageRequestExtraLarge)
        v30 = 83.0;
      else
        v30 = 60.0;
    }
    else
    {
      v30 = 45.0;
    }
  }
  memset(&v95, 0, sizeof(v95));
  v31 = v17;
  v32 = actionOnDismiss;
  if (self->_iconImage && self->_iconImageView || (v33 = v22, self->_avatarContact))
  {
    if (self->_imageOnTrailingEdge)
      v34 = v84;
    else
      v34 = v87;
    if (self->_imageOnTrailingEdge)
      v35 = v30 + 17.0;
    else
      v35 = v30;
    if (v31)
    {
      CGRectDivide(*(CGRect *)&v23, &slice, &remainder, v30, CGRectMinYEdge);
      CGRectDivide(remainder, &v95, &remainder, 10.0, CGRectMinYEdge);
      CGRectDivide(slice, &slice, &v92, v35, v34);
      if (self->_imageOnTrailingEdge)
        p_slice = &slice;
      else
        p_slice = &v92;
      size = p_slice->size;
      v90.origin = p_slice->origin;
      v90.size = size;
      v38 = v90.origin.x;
      size.width = v90.origin.y;
      v39 = v90.size.width;
      v40 = v90.size.height;
      CGRectDivide(*(CGRect *)((char *)&size - 8), &v91, &v90, 17.0, v84);
      CGRectDivide(v91, &v91, &v90, 17.0, CGRectMinYEdge);
      v33 = v22 + v30 + 10.0;
    }
    else
    {
      CGRectDivide(*(CGRect *)&v23, &v94, &remainder, v35, v34);
      CGRectDivide(v94, &slice, &v92, 10.0, CGRectMinYEdge);
      CGRectDivide(v92, &slice, &v92, v30, CGRectMinYEdge);
      if (self->_imageOnTrailingEdge)
        v41 = 3.0;
      else
        v41 = 12.0;
      CGRectDivide(remainder, &v95, &remainder, v41, v34);
      v33 = v22;
    }
  }
  v83 = v33;
  v85 = v22;
  v90 = remainder;
  v42 = remainder.size;
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v44 = v43;
  -[UILabel sizeThatFits:](self->_labelSecondaryTitle, "sizeThatFits:", v42);
  v46 = v45;
  -[UILabel sizeThatFits:](self->_labelMessage, "sizeThatFits:", v42);
  v48 = v47;
  -[UILabel sizeThatFits:](self->_labelSecondaryMessage, "sizeThatFits:", v42);
  v50 = v49;
  v51 = v44 + 0.0;
  if (v44 <= 0.0)
    v51 = 0.0;
  if (v46 <= 0.0)
    v52 = -0.0;
  else
    v52 = v46;
  v53 = v51 + v52;
  v54 = v50 <= 0.0 && v48 <= 0.0;
  v55 = v48 + 3.0 + v50;
  if (v54)
    v55 = -0.0;
  v56 = v53 + v55;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v90 = v98;
  memset(&v89, 0, sizeof(v89));
  CGRectDivide(v98, &v89, &v90, v44 + v46, CGRectMinYEdge);
  if (actionOnDismiss)
    v57 = v31;
  else
    v57 = 1;
  if (v57 != 1)
  {
    if (self->_imageOnTrailingEdge)
      v58 = &v94;
    else
      v58 = &v89;
    p_y = &v89.origin.y;
    if (self->_imageOnTrailingEdge)
      p_y = &v94.origin.y;
    v61 = *(_QWORD *)p_y;
    p_size = &v89.size;
    if (self->_imageOnTrailingEdge)
      p_size = &v94.size;
    p_height = &v94.size.height;
    if (!self->_imageOnTrailingEdge)
      p_height = &v89.size.height;
    v65 = *(_QWORD *)p_height;
    v59 = v58->origin.x;
    v63 = p_size->width;
    CGRectDivide(*(CGRect *)(&v61 - 1), &v91, v58, 17.0, v84);
    if (!self->_isTemplateLayout)
    {
      v88 = v91;
      -[UILabel font](self->_labelTitle, "font");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lineHeight");
      CGRectDivide(v91, &v88, &v91, v67, CGRectMinYEdge);

      dismissButton = self->_dismissButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIButton setFrame:](dismissButton, "setFrame:");
    }
    if (self->_imageOnTrailingEdge)
    {
      v69 = v94.origin.x;
      v70 = v94.origin.y;
      v71 = v94.size.width;
      v72 = v94.size.height;
      v73 = &v94;
      v74 = 3.0;
    }
    else
    {
      v69 = v89.origin.x;
      v70 = v89.origin.y;
      v71 = v89.size.width;
      v72 = v89.size.height;
      v73 = &v89;
      v74 = 13.0;
    }
    CGRectDivide(*(CGRect *)&v69, &v91, v73, v74, v84);
    v32 = actionOnDismiss;
  }
  if (!self->_isTemplateLayout)
  {
    labelTitle = self->_labelTitle;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelTitle, "setFrame:");
    CGRectDivide(v89, &v95, &v89, v44, CGRectMinYEdge);
    labelSecondaryTitle = self->_labelSecondaryTitle;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelSecondaryTitle, "setFrame:");
  }
  CGRectDivide(v90, &v95, &v90, 3.0, CGRectMinYEdge);
  memset(&v88, 0, sizeof(v88));
  CGRectDivide(v90, &v88, &v90, v48 + v50, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    labelMessage = self->_labelMessage;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelMessage, "setFrame:");
    CGRectDivide(v88, &v95, &v88, v48, CGRectMinYEdge);
    labelSecondaryMessage = self->_labelSecondaryMessage;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelSecondaryMessage, "setFrame:");
    avatarView = self->_avatarView;
    if (avatarView || (avatarView = self->_iconImageView) != 0)
    {
      PKSizeAlignedInRect();
      objc_msgSend(avatarView, "setFrame:");
    }
    if (v32 && ((v31 ^ 1) & 1) == 0)
    {
      v80 = self->_dismissButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIButton setFrame:](v80, "setFrame:");
    }
  }
  v81 = v85 + v83 + v56;
  v82 = v86;
  result.height = v81;
  result.width = v82;
  return result;
}

- (void)setAvatarContact:(id)a3
{
  CNContact *v5;
  CNContact *v6;

  v5 = (CNContact *)a3;
  if (self->_avatarContact != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_avatarContact, a3);
    -[PKDashboardMessageView _updateAvatarView](self, "_updateAvatarView");
    v5 = v6;
  }

}

- (void)_updateAvatarView
{
  CNAvatarView *avatarView;
  CNAvatarView *v4;
  CNAvatarView *v5;
  void *v6;
  CNAvatarView *v7;
  CNAvatarView *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_avatarContact)
  {
    -[PKDashboardMessageView setIconImage:](self, "setIconImage:", 0);
    -[PKDashboardMessageView setIconImageTintColor:](self, "setIconImageTintColor:", 0);
    avatarView = self->_avatarView;
    if (!avatarView)
    {
      v4 = (CNAvatarView *)objc_msgSend(objc_alloc(getCNAvatarViewClass()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v5 = self->_avatarView;
      self->_avatarView = v4;

      -[CNAvatarView setUserInteractionEnabled:](self->_avatarView, "setUserInteractionEnabled:", 0);
      -[CNAvatarView setAsynchronousRendering:](self->_avatarView, "setAsynchronousRendering:", 1);
      -[CNAvatarView setShowsContactOnTap:](self->_avatarView, "setShowsContactOnTap:", 0);
      -[PKDashboardMessageView addSubview:](self, "addSubview:", self->_avatarView);
      avatarView = self->_avatarView;
    }
    v9[0] = self->_avatarContact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setContacts:](avatarView, "setContacts:", v6);

    -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v7 = self->_avatarView;
    if (v7)
    {
      -[CNAvatarView removeFromSuperview](v7, "removeFromSuperview");
      v8 = self->_avatarView;
      self->_avatarView = 0;

      -[PKDashboardMessageView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)smallDevice
{
  return self->_smallDevice;
}

- (double)leftContentInset
{
  return self->_leftContentInset;
}

- (void)setLeftContentInset:(double)a3
{
  self->_leftContentInset = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (UILabel)labelTitle
{
  return self->_labelTitle;
}

- (UILabel)labelSecondaryTitle
{
  return self->_labelSecondaryTitle;
}

- (UILabel)labelMessage
{
  return self->_labelMessage;
}

- (UILabel)labelSecondaryMessage
{
  return self->_labelSecondaryMessage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (NSString)message
{
  return self->_message;
}

- (UIImage)messageImage
{
  return self->_messageImage;
}

- (NSString)secondaryMessage
{
  return self->_secondaryMessage;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (BOOL)imageOnTrailingEdge
{
  return self->_imageOnTrailingEdge;
}

- (void)setImageOnTrailingEdge:(BOOL)a3
{
  self->_imageOnTrailingEdge = a3;
}

- (BOOL)imageRequestExtraLarge
{
  return self->_imageRequestExtraLarge;
}

- (void)setImageRequestExtraLarge:(BOOL)a3
{
  self->_imageRequestExtraLarge = a3;
}

- (UIColor)iconImageTintColor
{
  return self->_iconImageTintColor;
}

- (UIColor)iconImageBackgroundColor
{
  return self->_iconImageBackgroundColor;
}

- (BOOL)strokeImage
{
  return self->_strokeImage;
}

- (int64_t)iconImageContentMode
{
  return self->_iconImageContentMode;
}

- (UIImage)dismissImage
{
  return self->_dismissImage;
}

- (void)setDismissImage:(id)a3
{
  objc_storeStrong((id *)&self->_dismissImage, a3);
}

- (CNContact)avatarContact
{
  return self->_avatarContact;
}

- (id)actionOnDismiss
{
  return self->_actionOnDismiss;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong((id *)&self->_avatarContact, 0);
  objc_storeStrong((id *)&self->_dismissImage, 0);
  objc_storeStrong((id *)&self->_iconImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_iconImageTintColor, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_secondaryMessage, 0);
  objc_storeStrong((id *)&self->_messageImage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_labelSecondaryMessage, 0);
  objc_storeStrong((id *)&self->_labelMessage, 0);
  objc_storeStrong((id *)&self->_labelSecondaryTitle, 0);
  objc_storeStrong((id *)&self->_labelTitle, 0);
}

@end
