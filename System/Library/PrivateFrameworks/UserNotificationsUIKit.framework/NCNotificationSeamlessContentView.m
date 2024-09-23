@implementation NCNotificationSeamlessContentView

- (NCNotificationSeamlessContentView)initWithFrame:(CGRect)a3
{
  NCNotificationSeamlessContentView *v3;
  NCNotificationSeamlessContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSeamlessContentView;
  v3 = -[NCNotificationSeamlessContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NCNotificationSeamlessContentView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("ShortLook.Platter.Content.Seamless"));
    v4->_adjustsFontForContentSizeCategory = 1;
  }
  return v4;
}

- (void)setURLInteractionEnabled:(BOOL)a3
{
  NCTextSupporting *secondaryTextElement;

  if (self->_URLInteractionEnabled != a3)
  {
    self->_URLInteractionEnabled = a3;
    -[NCTextSupporting removeFromSuperview](self->_secondaryTextElement, "removeFromSuperview");
    -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryTextElement, 0, 0, self->_strokeVisualStylingProvider);
    secondaryTextElement = self->_secondaryTextElement;
    self->_secondaryTextElement = 0;

    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextMenusEnabled:(BOOL)a3
{
  if (self->_textMenusEnabled != a3)
  {
    self->_textMenusEnabled = a3;
    -[UILabel nc_setMenuEnabled:](self->_primaryTextLabel, "nc_setMenuEnabled:");
    -[UILabel nc_setMenuEnabled:](self->_primarySubtitleTextLabel, "nc_setMenuEnabled:", self->_textMenusEnabled);
    -[UILabel nc_setMenuEnabled:](self->_importantTextLabel, "nc_setMenuEnabled:", self->_textMenusEnabled);
    -[NCTextSupporting nc_setMenuEnabled:](self->_secondaryTextElement, "nc_setMenuEnabled:", self->_textMenusEnabled);
    -[UILabel nc_setMenuEnabled:](self->_primaryContentSummaryLabel, "nc_setMenuEnabled:", self->_textMenusEnabled);
    -[UILabel nc_setMenuEnabled:](self->_secondaryContentSummaryLabel, "nc_setMenuEnabled:", self->_textMenusEnabled);
  }
}

- (void)setThumbnailAlignedWithSecondaryText:(BOOL)a3
{
  if (self->_thumbnailAlignedWithSecondaryText != a3)
  {
    self->_thumbnailAlignedWithSecondaryText = a3;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)primaryText
{
  return -[UILabel text](self->_primaryTextLabel, "text");
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *primaryTextLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  id v11;

  v11 = a3;
  -[NCNotificationSeamlessContentView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    primaryTextLabel = self->_primaryTextLabel;
    if (v11)
    {
      if (!primaryTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_primaryTextLabel;
        self->_primaryTextLabel = v8;

        -[UILabel setAccessibilityIdentifier:](self->_primaryTextLabel, "setAccessibilityIdentifier:", CFSTR("NotificationTitle"));
        -[UILabel nc_setMenuEnabled:](self->_primaryTextLabel, "nc_setMenuEnabled:", self->_textMenusEnabled);
        -[UILabel setLineBreakMode:](self->_primaryTextLabel, "setLineBreakMode:", 4);
        -[NCNotificationSeamlessContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_primaryTextLabel);
        -[NCNotificationSeamlessContentView _updateTextAttributesForPrimaryTextLabel](self, "_updateTextAttributesForPrimaryTextLabel");
        -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryTextLabel, 0, self->_strokeVisualStylingProvider, 0);
        v6 = v11;
        primaryTextLabel = self->_primaryTextLabel;
      }
      -[UILabel setText:](primaryTextLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](primaryTextLabel, "removeFromSuperview");
      v10 = self->_primaryTextLabel;
      self->_primaryTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v11;
  }

}

- (NSString)primarySubtitleText
{
  return -[UILabel text](self->_primarySubtitleTextLabel, "text");
}

- (void)setPrimarySubtitleText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *primarySubtitleTextLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  id v11;

  v11 = a3;
  -[NCNotificationSeamlessContentView primarySubtitleText](self, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if (v11)
    {
      if (!primarySubtitleTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_primarySubtitleTextLabel;
        self->_primarySubtitleTextLabel = v8;

        -[UILabel nc_setMenuEnabled:](self->_primarySubtitleTextLabel, "nc_setMenuEnabled:", self->_textMenusEnabled);
        -[UILabel setAccessibilityIdentifier:](self->_primarySubtitleTextLabel, "setAccessibilityIdentifier:", CFSTR("NotificationSubtitle"));
        -[UILabel setLineBreakMode:](self->_primarySubtitleTextLabel, "setLineBreakMode:", 4);
        -[NCNotificationSeamlessContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_primarySubtitleTextLabel);
        -[NCNotificationSeamlessContentView _updateTextAttributesForPrimarySubtitleTextLabel](self, "_updateTextAttributesForPrimarySubtitleTextLabel");
        -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primarySubtitleTextLabel, 0, self->_strokeVisualStylingProvider, 0);
        v6 = v11;
        primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
      }
      -[UILabel setText:](primarySubtitleTextLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](primarySubtitleTextLabel, "removeFromSuperview");
      v10 = self->_primarySubtitleTextLabel;
      self->_primarySubtitleTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v11;
  }

}

- (NSAttributedString)secondaryText
{
  return (NSAttributedString *)-[NCTextSupporting attributedText](self->_secondaryTextElement, "attributedText");
}

- (void)setSecondaryText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  NCTextSupporting *secondaryTextElement;
  void *v8;
  id v9;

  v9 = a3;
  -[NCNotificationSeamlessContentView secondaryText](self, "secondaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  v6 = v9;
  if ((v5 & 1) == 0)
  {
    secondaryTextElement = self->_secondaryTextElement;
    if (v9)
    {
      if (!secondaryTextElement)
      {
        -[NCNotificationSeamlessContentView _configureSecondaryTextElementIfNecessary](self, "_configureSecondaryTextElementIfNecessary");
        secondaryTextElement = self->_secondaryTextElement;
      }
      -[NCTextSupporting textColor](secondaryTextElement, "textColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCTextSupporting setAttributedText:](self->_secondaryTextElement, "setAttributedText:", v9);
      -[NCTextSupporting setTextColor:](self->_secondaryTextElement, "setTextColor:", v8);
      -[NCNotificationSeamlessContentView _updateTextAttributesForSecondaryTextElement](self, "_updateTextAttributesForSecondaryTextElement");
    }
    else
    {
      -[NCTextSupporting removeFromSuperview](secondaryTextElement, "removeFromSuperview");
      v8 = self->_secondaryTextElement;
      self->_secondaryTextElement = 0;
    }

    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v9;
  }

}

- (void)setContentSummaryText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _BOOL4 IsAccessibilityCategory;
  id *v9;
  id v10;
  UILabel *primaryContentSummaryLabel;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  UILabel *v18;
  void *v19;
  UILabel *secondaryContentSummaryLabel;
  void *v21;
  UILabel *v22;
  UILabel *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];

  v4 = a3;
  -[NCNotificationSeamlessContentView contentSummaryText](self, "contentSummaryText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if ((v6 & 1) != 0)
  {
    v7 = v4;
  }
  else
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v9 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v9 = (id *)MEMORY[0x1E0DC4B10];
    v10 = *v9;
    -[NCNotificationSeamlessContentView _updateAttributedString:withTextStyle:additionalTraits:](self, "_updateAttributedString:withTextStyle:additionalTraits:", v4, v10, 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_contentSummaryText, v7);
    primaryContentSummaryLabel = self->_primaryContentSummaryLabel;
    if (v7)
    {
      if (!primaryContentSummaryLabel)
        -[NCNotificationSeamlessContentView _configureContentSummaryTextElementsIfNecessary](self, "_configureContentSummaryTextElementsIfNecessary");
      v12 = (void *)objc_msgSend(v7, "mutableCopy");
      v13 = (void *)objc_msgSend(v7, "mutableCopy");
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      v28[3] = 0x7FFFFFFFFFFFFFFFLL;
      v14 = objc_msgSend(v7, "length");
      v15 = *MEMORY[0x1E0DC10F8];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __59__NCNotificationSeamlessContentView_setContentSummaryText___block_invoke;
      v24[3] = &unk_1E8D1BD20;
      v16 = v12;
      v25 = v16;
      v27 = v28;
      v17 = v13;
      v26 = v17;
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v14, 0, v24);
      v18 = self->_primaryContentSummaryLabel;
      v19 = (void *)objc_msgSend(v16, "copy");
      -[UILabel setAttributedText:](v18, "setAttributedText:", v19);

      secondaryContentSummaryLabel = self->_secondaryContentSummaryLabel;
      v21 = (void *)objc_msgSend(v17, "copy");
      -[UILabel setAttributedText:](secondaryContentSummaryLabel, "setAttributedText:", v21);

      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_strokeVisualStylingProvider, "automaticallyUpdateView:withStyle:", self->_primaryContentSummaryLabel, 0);
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_strokeVisualStylingProvider, "automaticallyUpdateView:withStyle:", self->_secondaryContentSummaryLabel, 1);

      _Block_object_dispose(v28, 8);
    }
    else
    {
      -[UILabel removeFromSuperview](primaryContentSummaryLabel, "removeFromSuperview");
      v22 = self->_primaryContentSummaryLabel;
      self->_primaryContentSummaryLabel = 0;

      -[UILabel removeFromSuperview](self->_secondaryContentSummaryLabel, "removeFromSuperview");
      v23 = self->_secondaryContentSummaryLabel;
      self->_secondaryContentSummaryLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

void __59__NCNotificationSeamlessContentView_setContentSummaryText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  if (v14)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v14, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithTintColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v10);

    v11 = *MEMORY[0x1E0DC10F8];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC10F8], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v11, v7, a3, a4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  else
  {
    v12 = *(void **)(a1 + 40);
    v13 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttribute:value:range:", v13, v7, a3, a4);
  }

}

- (id)_updateAttributedString:(id)a3 withTextStyle:(id)a4 additionalTraits:(unsigned int)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  unsigned int v21;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = *MEMORY[0x1E0DC1138];
  v12 = objc_msgSend(v9, "length");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__NCNotificationSeamlessContentView__updateAttributedString_withTextStyle_additionalTraits___block_invoke;
  v18[3] = &unk_1E8D1BD48;
  v18[4] = self;
  v19 = v8;
  v21 = a5;
  v13 = v10;
  v20 = v13;
  v14 = v8;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0x100000, v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

void __92__NCNotificationSeamlessContentView__updateAttributedString_withTextStyle_additionalTraits___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(a2, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13C0]);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1458]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    v12 = v11;
  }
  else
  {
    v12 = *MEMORY[0x1E0DC1440];
  }
  objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1138];
  objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", *MEMORY[0x1E0DC1138], a3, a4);
  objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", v14, v13, a3, a4);

}

- (NSString)importantText
{
  return -[UILabel text](self->_importantTextLabel, "text");
}

- (void)setImportantText:(id)a3
{
  void *v4;
  char v5;
  UILabel *importantTextLabel;
  id v7;

  v7 = a3;
  -[NCNotificationSeamlessContentView importantText](self, "importantText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      -[NCNotificationSeamlessContentView _configureImportantTextLabelIfNecessary](self, "_configureImportantTextLabelIfNecessary");
      -[UILabel setText:](self->_importantTextLabel, "setText:", v7);
    }
    else
    {
      -[UILabel removeFromSuperview](self->_importantTextLabel, "removeFromSuperview");
      importantTextLabel = self->_importantTextLabel;
      self->_importantTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)importantAttributedText
{
  return -[UILabel attributedText](self->_importantTextLabel, "attributedText");
}

- (void)setImportantAttributedText:(id)a3
{
  void *v4;
  char v5;
  UILabel *importantTextLabel;
  id v7;

  v7 = a3;
  -[NCNotificationSeamlessContentView importantAttributedText](self, "importantAttributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      -[NCNotificationSeamlessContentView _configureImportantTextLabelIfNecessary](self, "_configureImportantTextLabelIfNecessary");
      -[UILabel setAttributedText:](self->_importantTextLabel, "setAttributedText:", v7);
    }
    else
    {
      -[UILabel removeFromSuperview](self->_importantTextLabel, "removeFromSuperview");
      importantTextLabel = self->_importantTextLabel;
      self->_importantTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIImageConfiguration)importantTextImageConfiguration
{
  void *v2;
  _BOOL4 IsAccessibilityCategory;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3888];
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
  v4 = (_QWORD *)MEMORY[0x1E0DC4A88];
  if (!IsAccessibilityCategory)
    v4 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  objc_msgSend(v2, "configurationWithTextStyle:scale:", *v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithPaletteColors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationByApplyingConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageConfiguration *)v11;
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  MTVisualStylingProvider *importantTextVisualStylingProvider;

  importantTextVisualStylingProvider = self->_importantTextVisualStylingProvider;
  if (importantTextVisualStylingProvider)
    return importantTextVisualStylingProvider;
  -[NCNotificationSeamlessContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  return (MTVisualStylingProvider *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setImportantTextVisualStylingProvider:(id)a3
{
  void *v5;
  UILabel *importantTextLabel;
  void *v7;
  id v8;

  v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[NCNotificationSeamlessContentView importantTextVisualStylingProvider](self, "importantTextVisualStylingProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isAutomaticallyUpdatingView:", self->_importantTextLabel) & 1) == 0)
    {

      v5 = 0;
    }
    objc_storeStrong((id *)&self->_importantTextVisualStylingProvider, a3);
    importantTextLabel = self->_importantTextLabel;
    -[NCNotificationSeamlessContentView importantTextVisualStylingProvider](self, "importantTextVisualStylingProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", importantTextLabel, 1, v7, v5);

  }
}

- (void)setInlineAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UIAction *v7;
  UIAction *inlineAction;
  void *v9;
  UIButton *inlineActionButton;
  UIButton *v11;
  UIButton *v12;
  UIButton *v13;
  id v14;

  v14 = a3;
  -[NCNotificationSeamlessContentView inlineAction](self, "inlineAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  v6 = v14;
  if ((v5 & 1) == 0)
  {
    v7 = (UIAction *)objc_msgSend(v14, "copy");
    inlineAction = self->_inlineAction;
    self->_inlineAction = v7;

    -[UIAction title](self->_inlineAction, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    inlineActionButton = self->_inlineActionButton;
    if (v9)
    {
      if (!inlineActionButton)
      {
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
        v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
        v12 = self->_inlineActionButton;
        self->_inlineActionButton = v11;

        -[UIButton addAction:forControlEvents:](self->_inlineActionButton, "addAction:forControlEvents:", self->_inlineAction, 64);
        -[NCNotificationSeamlessContentView _adjustInlineActionButtonBackgroundColor](self, "_adjustInlineActionButtonBackgroundColor");
        -[UIButton _setContinuousCornerRadius:](self->_inlineActionButton, "_setContinuousCornerRadius:", 6.0);
        -[UIButton setContentHorizontalAlignment:](self->_inlineActionButton, "setContentHorizontalAlignment:", 3);
        -[NCNotificationSeamlessContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_inlineActionButton);
        -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_inlineActionButton, 0, self->_strokeVisualStylingProvider, 0);
      }
      -[NCNotificationSeamlessContentView _updateTextAttributesForInlineActionButton](self, "_updateTextAttributesForInlineActionButton");
    }
    else
    {
      -[UIButton removeFromSuperview](inlineActionButton, "removeFromSuperview");
      v13 = self->_inlineActionButton;
      self->_inlineActionButton = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v14;
  }

}

- (NSString)footerText
{
  return -[UILabel text](self->_footerTextLabel, "text");
}

- (void)setFooterText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *footerTextLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  id v11;

  v11 = a3;
  -[NCNotificationSeamlessContentView footerText](self, "footerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    footerTextLabel = self->_footerTextLabel;
    if (v11)
    {
      if (!footerTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_footerTextLabel;
        self->_footerTextLabel = v8;

        -[UILabel setLineBreakMode:](self->_footerTextLabel, "setLineBreakMode:", 4);
        -[NCNotificationSeamlessContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_footerTextLabel);
        -[NCNotificationSeamlessContentView _updateTextAttributesForFooterTextLabel](self, "_updateTextAttributesForFooterTextLabel");
        -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_footerTextLabel, 1, self->_strokeVisualStylingProvider, 0);
        v6 = v11;
        footerTextLabel = self->_footerTextLabel;
      }
      -[UILabel setText:](footerTextLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](footerTextLabel, "removeFromSuperview");
      v10 = self->_footerTextLabel;
      self->_footerTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v11;
  }

}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    date = self->_date;
    self->_date = v4;

    -[NCNotificationSeamlessContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    -[NCNotificationSeamlessContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    -[NCNotificationSeamlessContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHideDate:(BOOL)a3
{
  if (self->_hideDate != a3)
  {
    self->_hideDate = a3;
    -[NCNotificationSeamlessContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSTimeZone *)objc_msgSend(v6, "copy");
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    -[NCNotificationSeamlessContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
}

- (void)setBadgedIconView:(id)a3
{
  NCBadgedIconView **p_badgedIconView;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_badgedIconView = &self->_badgedIconView;
  v6 = BSEqualObjects();
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    -[NCBadgedIconView removeFromSuperview](*p_badgedIconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      -[NCNotificationSeamlessContentView addSubview:](self, "addSubview:");
      -[NCNotificationSeamlessContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCBadgedIconView updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](*p_badgedIconView, "updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", 0, v8, v8);

    }
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
    v7 = v9;
  }

}

- (UIImage)thumbnail
{
  return -[UIImageView image](self->_thumbnailImageView, "image");
}

- (void)setThumbnail:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UIImageView *v7;
  UIImageView *thumbnailImageView;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;
  id v12;

  v12 = a3;
  -[NCNotificationSeamlessContentView thumbnail](self, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    if (v12 && !self->_thumbnailImageView)
    {
      v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      thumbnailImageView = self->_thumbnailImageView;
      self->_thumbnailImageView = v7;

      -[UIImageView setContentMode:](self->_thumbnailImageView, "setContentMode:", 1);
      -[UIImageView _setContinuousCornerRadius:](self->_thumbnailImageView, "_setContinuousCornerRadius:", 6.0);
      -[UIImageView setClipsToBounds:](self->_thumbnailImageView, "setClipsToBounds:", 1);
      -[NCNotificationSeamlessContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
      -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_thumbnailImageView);
      v6 = v12;
    }
    -[UIImageView setImage:](self->_thumbnailImageView, "setImage:", v6);
    -[NCNotificationSeamlessContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSeamlessContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", self->_thumbnailImageView, 0, v9, v9);
    if (!v12)
    {
      v10 = self->_thumbnailImageView;
      if (v10)
      {
        -[UIImageView removeFromSuperview](v10, "removeFromSuperview");
        v11 = self->_thumbnailImageView;
        self->_thumbnailImageView = 0;

      }
    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");

    v6 = v12;
  }

}

- (void)setPrimaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_primaryTextMaximumNumberOfLines != a3)
  {
    self->_primaryTextMaximumNumberOfLines = a3;
    -[NCNotificationSeamlessContentView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    self->_hasUpdatedContent = 1;
  }
}

- (void)setPrimarySubtitleTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_primarySubtitleTextMaximumNumberOfLines != a3)
  {
    self->_primarySubtitleTextMaximumNumberOfLines = a3;
    -[NCNotificationSeamlessContentView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    self->_hasUpdatedContent = 1;
  }
}

- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_secondaryTextMaximumNumberOfLines != a3)
  {
    self->_secondaryTextMaximumNumberOfLines = a3;
    -[NCNotificationSeamlessContentView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    self->_hasUpdatedContent = 1;
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCNotificationSeamlessContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  else
    objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC13C0];
  v14 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setAlignContentToBottom:(BOOL)a3
{
  if (self->_alignContentToBottom != a3)
  {
    self->_alignContentToBottom = a3;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  __int128 v6;
  CGSize result;

  v6 = *MEMORY[0x1E0C9D820];
  BSRectWithSize();
  -[NCNotificationSeamlessContentView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", &v6);
  v5 = *((double *)&v6 + 1);
  v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSeamlessContentView;
  -[NCNotificationSeamlessContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationSeamlessContentView bounds](self, "bounds");
  if (CGRectGetWidth(v4) > 0.0)
  {
    -[NCNotificationSeamlessContentView bounds](self, "bounds");
    -[NCNotificationSeamlessContentView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", 0);
    if (self->_hasUpdatedContent)
    {
      -[UIView pl_performCrossFadeIfNecessary](self->_crossfadingContentView, "pl_performCrossFadeIfNecessary");
      self->_hasUpdatedContent = 0;
    }
  }
}

- (void)didMoveToWindow
{
  void *v3;

  -[NCNotificationSeamlessContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[NCNotificationSeamlessContentView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSeamlessContentView;
  -[NCNotificationSeamlessContentView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[NCNotificationSeamlessContentView _adjustInlineActionButtonBackgroundColor](self, "_adjustInlineActionButtonBackgroundColor");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  -[NCNotificationSeamlessContentView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  return 1;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  MTVisualStylingProvider *strokeVisualStylingProvider;
  objc_super v5;

  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
    return strokeVisualStylingProvider;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSeamlessContentView;
  -[NCNotificationSeamlessContentView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FD60;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *strokeVisualStylingProvider;
  MTVisualStylingProvider *v8;
  MTVisualStylingProvider *v9;
  MTVisualStylingProvider *v10;
  MTVisualStylingProvider *v11;

  v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    v11 = v6;
    v8 = v6;
    v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    v10 = strokeVisualStylingProvider;

    -[NCNotificationSeamlessContentView _visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "_visualStylingProviderDidChange:forCategory:outgoingProvider:", self->_strokeVisualStylingProvider, a4, v10);
    v6 = v11;
  }

}

- (void)dateLabelDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  id WeakRetained;

  -[BSUIDateLabel sizeToFit](self->_dateLabel, "sizeToFit", a3);
  -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  -[NCNotificationSeamlessContentView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[NCNotificationSeamlessContentView contentSummaryText](self, "contentSummaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v5)
  {
    v8 = -[UILabel numberOfLines](self->_primaryTextLabel, "numberOfLines");
  }
  else
  {
    if (!v7)
      return;
    v8 = -[UILabel nc_numberOfLines](self->_primaryContentSummaryLabel, "nc_numberOfLines");
  }
  if (v8 != 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "didInvalidateSizeFromNotificationSeamlessContentView:", self);

  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v9;
  id WeakRetained;

  v9 = a4;
  if (!a6 && self->_secondaryTextElement == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "notificationSeamlessContentView:requestsInteractionWithURL:", self, v9);

  }
  return 0;
}

- (void)_configureCrossfadingContentViewIfNecessary
{
  NCMaterialCrossFadingView *v3;
  UIView *v4;
  UIView *crossfadingContentView;

  if (!self->_crossfadingContentView)
  {
    v3 = [NCMaterialCrossFadingView alloc];
    -[NCNotificationSeamlessContentView bounds](self, "bounds");
    v4 = -[NCMaterialCrossFadingView initWithFrame:](v3, "initWithFrame:");
    crossfadingContentView = self->_crossfadingContentView;
    self->_crossfadingContentView = v4;

    -[UIView setAccessibilityIdentifier:](self->_crossfadingContentView, "setAccessibilityIdentifier:", CFSTR("ShortLook.Platter.Content.Seamless.CrossFade"));
    -[NCNotificationSeamlessContentView addSubview:](self, "addSubview:", self->_crossfadingContentView);
    -[UIView setAutoresizingMask:](self->_crossfadingContentView, "setAutoresizingMask:", 18);
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (void)_updateVisualStylingOfImageView:(id)a3 ifSymbolImageWithStyle:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (a3)
  {
    v10 = a6;
    v11 = a5;
    v12 = a3;
    objc_msgSend(v12, "image");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isSymbolImage"))
      v13 = v11;
    else
      v13 = 0;
    -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v12, a4, v13, v10);

  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  NCBadgedIconView *badgedIconView;
  id v8;
  id v9;

  badgedIconView = self->_badgedIconView;
  v8 = a5;
  v9 = a3;
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", badgedIconView, 0, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryTextLabel, 0, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primarySubtitleTextLabel, 0, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryTextElement, 0, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryContentSummaryLabel, 0, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryContentSummaryLabel, 1, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_inlineActionButton, 0, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_footerTextLabel, 1, v9, v8);
  -[NCNotificationSeamlessContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", self->_thumbnailImageView, 0, v9, v8);

}

- (CGRect)_textFrameForBounds:(CGRect)a3 ignoreBadgedIconView:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[NCNotificationSeamlessContentView isHorizontalMarginPaddingDisabled](self, "isHorizontalMarginPaddingDisabled"))
    v10 = 0.0;
  else
    v10 = 14.0;
  if (!a4 && self->_badgedIconView)
    v10 = v10 + 50.0;
  if (-[NCNotificationSeamlessContentView isHorizontalMarginPaddingDisabled](self, "isHorizontalMarginPaddingDisabled"))
    v11 = 0.0;
  else
    v11 = 17.0;
  if (-[NCNotificationSeamlessContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v12 = v11;
  else
    v12 = v10;
  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  UIFloorToScale();
  v15 = v14;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v16 = CGRectGetWidth(v28) - v10 - v11;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v17 = CGRectGetHeight(v29);
  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayScale");
  UIFloorToScale();
  v20 = v17 - v19;
  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayScale");
  UIFloorToScale();
  v23 = v20 - v22;

  v24 = v12;
  v25 = v15;
  v26 = v16;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  uint64_t v6;
  _BOOL8 IsAccessibilityCategory;
  void *v8;
  uint64_t v9;
  void (**v10)(void *, BSUIDateLabel *);
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  BSUIDateLabel *dateLabel;
  char v17;
  _QWORD *p_x;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MinX;
  double MaxX;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  CGFloat v37;
  _QWORD *v38;
  CGFloat v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CGFloat v44;
  CGFloat MinY;
  unint64_t v46;
  double (**v47)(void *, UILabel *, uint64_t);
  void *v48;
  char v49;
  BOOL v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  BOOL v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  BOOL v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  BOOL v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void (**v93)(void *, BSUIDateLabel *);
  void *v94;
  CGFloat MaxY;
  double *v96;
  CGFloat v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  BOOL v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t secondaryTextMaximumNumberOfLines;
  double v113;
  __n128 v114;
  __n128 v115;
  __n128 v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  BOOL v131;
  CGFloat v132;
  double v133;
  CGFloat v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  NCTextSupporting *secondaryTextElement;
  unint64_t v147;
  uint64_t v148;
  double v149;
  double v150;
  double v151;
  NCTextSupporting *v152;
  uint64_t v153;
  NCTextSupporting *v154;
  NCTextSupporting *v155;
  NCTextSupporting *v156;
  double v157;
  NCTextSupporting *v158;
  uint64_t v159;
  void *v160;
  id v161;
  double v162;
  double v163;
  void *v164;
  void *v165;
  BOOL v166;
  double v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  BOOL v176;
  double v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  double v182;
  double v183;
  void *v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  _BOOL4 v197;
  double v198;
  void *v199;
  double v200;
  double v201;
  double v202;
  void *v203;
  BOOL v204;
  double v205;
  double v206;
  double v207;
  double v208;
  void *v209;
  double v210;
  double v211;
  double v212;
  void *v213;
  double v214;
  double v215;
  double v216;
  int v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  void *v223;
  double v224;
  double v225;
  double v226;
  CGFloat v227;
  CGFloat v228;
  double v229;
  id v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t i;
  uint64_t v234;
  uint64_t v235;
  BOOL v236;
  id v237;
  double (**v238)(double, __n128, __n128, __n128, double, double, double, double);
  CGFloat v239;
  CGFloat v240;
  CGFloat v241;
  void (**v242)(void);
  CGFloat rect;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  CGSize *v249;
  int v250;
  __int128 v251;
  id v252;
  double x;
  double y;
  _BOOL4 v255;
  __int128 v256;
  void (**v257)(void *, BSUIDateLabel *);
  double width;
  double height;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  _QWORD v264[5];
  void (**v265)(void *, BSUIDateLabel *);
  double v266;
  double v267;
  uint64_t v268;
  uint64_t v269;
  _QWORD v270[5];
  void (**v271)(void *, BSUIDateLabel *);
  double v272;
  double v273;
  uint64_t v274;
  uint64_t v275;
  _QWORD v276[5];
  void (**v277)(void *, BSUIDateLabel *);
  double v278;
  double v279;
  double v280;
  double v281;
  _QWORD v282[5];
  void (**v283)(void *, BSUIDateLabel *);
  uint64_t *v284;
  CGFloat v285;
  double v286;
  CGFloat v287;
  CGFloat v288;
  BOOL v289;
  _QWORD v290[5];
  void (**v291)(void *, BSUIDateLabel *);
  double v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  _QWORD v296[5];
  void (**v297)(void *, BSUIDateLabel *);
  uint64_t *v298;
  _QWORD v299[5];
  void (**v300)(void *, BSUIDateLabel *);
  double v301;
  double v302;
  double v303;
  double v304;
  _QWORD v305[5];
  void (**v306)(void *, BSUIDateLabel *);
  double v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  _QWORD v311[10];
  BOOL v312;
  char v313;
  _QWORD v314[5];
  id v315;
  _QWORD *v316;
  uint64_t *v317;
  uint64_t *v318;
  double v319;
  double v320;
  double v321;
  double v322;
  _QWORD v323[3];
  char v324;
  _QWORD v325[4];
  char v326;
  _QWORD v327[5];
  char v328;
  uint64_t v329;
  CGRect *v330;
  uint64_t v331;
  const char *v332;
  __int128 v333;
  __int128 v334;
  _QWORD v335[5];
  void (**v336)(void *, BSUIDateLabel *);
  uint64_t *v337;
  uint64_t *v338;
  double v339;
  double v340;
  double v341;
  double v342;
  char v343;
  BOOL v344;
  uint64_t v345;
  CGRect *v346;
  uint64_t v347;
  const char *v348;
  __int128 v349;
  __int128 v350;
  uint64_t v351;
  CGRect *v352;
  uint64_t v353;
  const char *v354;
  __int128 v355;
  __int128 v356;
  _QWORD aBlock[6];
  char v358;
  uint64_t v359;
  double *v360;
  uint64_t v361;
  uint64_t v362;
  _BYTE v363[128];
  uint64_t v364;
  CGRect v365;
  CGRect v366;
  CGRect v367;
  CGRect v368;
  CGRect v369;
  CGRect v370;
  CGRect v371;
  CGRect v372;
  CGRect v373;
  CGRect v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;

  width = a3.size.width;
  height = a3.size.height;
  x = a3.origin.x;
  y = a3.origin.y;
  v364 = *MEMORY[0x1E0C80C00];
  -[NCNotificationSeamlessContentView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  v249 = a4;
  v6 = a4 == 0;
  v250 = -[NCNotificationSeamlessContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v235 = v9;

  v359 = 0;
  v360 = (double *)&v359;
  v361 = 0x2020000000;
  v362 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke;
  aBlock[3] = &unk_1E8D1BD98;
  v358 = v6;
  aBlock[5] = &v359;
  aBlock[4] = self;
  v10 = (void (**)(void *, BSUIDateLabel *))_Block_copy(aBlock);
  v255 = -[NCNotificationSeamlessContentView alignContentToBottom](self, "alignContentToBottom");
  -[NCNotificationSeamlessContentView _textFrameForBounds:ignoreBadgedIconView:](self, "_textFrameForBounds:ignoreBadgedIconView:", 0, x, y, width, height);
  v240 = v12;
  v241 = v11;
  v239 = v13;
  rect = v14;
  v351 = 0;
  v352 = (CGRect *)&v351;
  v353 = 0x4010000000;
  v354 = "";
  v15 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v256 = *MEMORY[0x1E0C9D648];
  v355 = *MEMORY[0x1E0C9D648];
  v251 = v15;
  v356 = v15;
  -[NCNotificationSeamlessContentView _configureDateLabelIfNecessary](self, "_configureDateLabelIfNecessary");
  dateLabel = self->_dateLabel;
  if (dateLabel)
    v17 = IsAccessibilityCategory;
  else
    v17 = 1;
  if ((v17 & 1) != 0)
    goto LABEL_17;
  -[BSUIDateLabel sizeThatFits:](dateLabel, "sizeThatFits:", width, height);
  BSRectWithSize();
  p_x = (_QWORD *)&v352->origin.x;
  v352[1].origin.x = v19;
  p_x[5] = v20;
  p_x[6] = v21;
  p_x[7] = v22;
  v24 = v240;
  v23 = v241;
  v25 = v239;
  v26 = rect;
  if (v250)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v23);
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v23);
    MinX = MaxX - CGRectGetWidth(v352[1]);
  }
  v352[1].origin.x = MinX;
  if (v255
    && (-[NCNotificationSeamlessContentView thumbnail](self, "thumbnail"),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v365.origin.x = x;
    v365.origin.y = y;
    v365.size.width = width;
    v365.size.height = height;
    v31 = CGRectGetHeight(v365);
    -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "displayScale");
    UIFloorToScale();
    v352[1].origin.y = v31 - v33 - CGRectGetHeight(v352[1]);

    v6 = 0;
  }
  else
  {
    -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "displayScale");
    UIFloorToScale();
    v352[1].origin.y = v30 + 2.0;

    if (!v255)
      goto LABEL_14;
  }

LABEL_14:
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0DC4920], self->_preferredContentSizeCategory) == NSOrderedDescending)
  {
    -[NCNotificationSeamlessContentView _dateLabelFont](self, "_dateLabelFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "displayScale");
    UIFloorToScale();
    objc_msgSend(v34, "_scaledValueForValue:", v36 + 2.0);
    v352[1].origin.y = v37;

  }
  UIRectIntegralWithScale();
  v38 = (_QWORD *)&v352->origin.x;
  v352[1].origin.x = v39;
  v38[5] = v40;
  v38[6] = v41;
  v38[7] = v42;
  v10[2](v10, self->_dateLabel);
LABEL_17:
  -[NCNotificationSeamlessContentView thumbnail](self, "thumbnail");
  v43 = objc_claimAutoreleasedReturnValue();

  v345 = 0;
  v346 = (CGRect *)&v345;
  v347 = 0x4010000000;
  v348 = "";
  v349 = v256;
  v350 = v251;
  v335[0] = MEMORY[0x1E0C809B0];
  v335[1] = 3221225472;
  v335[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_3;
  v335[3] = &unk_1E8D1BDC0;
  v343 = v250;
  v337 = &v345;
  v335[4] = self;
  v339 = x;
  v340 = y;
  v341 = width;
  v342 = height;
  v338 = &v351;
  v344 = v255;
  v257 = v10;
  v336 = v257;
  v242 = (void (**)(void))_Block_copy(v335);
  if (v43 && !self->_thumbnailAlignedWithSecondaryText && !CGRectIsEmpty(v352[1]))
    v242[2]();
  v329 = 0;
  v330 = (CGRect *)&v329;
  v331 = 0x4010000000;
  v332 = "";
  v333 = 0u;
  v334 = 0u;
  v366.origin.x = v241;
  v366.origin.y = v240;
  v366.size.width = v239;
  v366.size.height = rect;
  v44 = CGRectGetMinX(v366);
  v367.origin.x = v241;
  v367.origin.y = v240;
  v367.size.width = v239;
  v367.size.height = rect;
  MinY = CGRectGetMinY(v367);
  v368.origin.x = v241;
  v368.origin.y = v240;
  v368.size.width = v239;
  v368.size.height = rect;
  *(double *)&v46 = CGRectGetWidth(v368);
  *(CGFloat *)&v333 = v44;
  *((CGFloat *)&v333 + 1) = MinY;
  v334 = v46;
  v327[0] = MEMORY[0x1E0C809B0];
  v327[1] = 3221225472;
  v327[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_4;
  v327[3] = &unk_1E8D1BDE8;
  v328 = v250;
  v327[4] = &v329;
  v47 = (double (**)(void *, UILabel *, uint64_t))_Block_copy(v327);
  v325[0] = MEMORY[0x1E0C809B0];
  v325[1] = 3221225472;
  v325[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_5;
  v325[3] = &__block_descriptor_33_e104__CGRect__CGPoint_dd__CGSize_dd__72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  v326 = v250;
  v48 = _Block_copy(v325);
  if (self->_dateLabel)
    v49 = IsAccessibilityCategory;
  else
    v49 = 1;
  if ((v49 & 1) != 0)
  {
    v50 = 0;
  }
  else
  {
    -[NCNotificationSeamlessContentView primaryText](self, "primaryText");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "length"))
    {
      v50 = 0;
    }
    else
    {
      -[NCNotificationSeamlessContentView primarySubtitleText](self, "primarySubtitleText");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_msgSend(v52, "length") | v43) == 0;

    }
  }
  v323[0] = 0;
  v323[1] = v323;
  v323[2] = 0x2020000000;
  if (self->_date)
    v53 = IsAccessibilityCategory;
  else
    v53 = 1;
  v236 = v50;
  v324 = v53 | v50;
  v314[0] = MEMORY[0x1E0C809B0];
  v314[1] = 3221225472;
  v314[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_6;
  v314[3] = &unk_1E8D1BE30;
  v319 = x;
  v320 = y;
  v321 = width;
  v322 = height;
  v314[4] = self;
  v316 = v323;
  v237 = v48;
  v315 = v237;
  v317 = &v351;
  v318 = &v345;
  v54 = _Block_copy(v314);
  v311[0] = MEMORY[0x1E0C809B0];
  v311[1] = 3221225472;
  v311[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_7;
  v311[3] = &unk_1E8D1BE58;
  v312 = v255;
  *(double *)&v311[6] = x;
  *(double *)&v311[7] = y;
  *(double *)&v311[8] = width;
  *(double *)&v311[9] = height;
  v311[4] = self;
  v311[5] = &v351;
  v313 = v250;
  v238 = (double (**)(double, __n128, __n128, __n128, double, double, double, double))_Block_copy(v311);
  if (v249)
  {
    v252 = 0;
  }
  else
  {
    v252 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

  }
  -[NCNotificationSeamlessContentView importantText](self, "importantText");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "length") == 0;

  if (!v56)
  {
    (*((void (**)(void *, _QWORD, _QWORD))v54 + 2))(v54, 0, 0);
    v57 = v47[2](v47, self->_importantTextLabel, 1);
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v305[0] = MEMORY[0x1E0C809B0];
    v305[1] = 3221225472;
    v305[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_8;
    v305[3] = &unk_1E8D1BE80;
    v306 = v257;
    v305[4] = self;
    v307 = v57;
    v308 = v59;
    v309 = v61;
    v310 = v63;
    v64 = _Block_copy(v305);
    objc_msgSend(v252, "addObject:", v64);

  }
  -[NCNotificationSeamlessContentView contentSummaryText](self, "contentSummaryText");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "length");

  -[NCNotificationSeamlessContentView primaryText](self, "primaryText");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "length");

  if (v68)
  {
    -[NCNotificationSeamlessContentView importantText](self, "importantText");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v69, "length"))
      v70 = v43 == 0;
    else
      v70 = 1;
    v71 = !v70;
    v72 = (*((double (**)(void *, uint64_t, _QWORD))v54 + 2))(v54, v71, 0);
    v74 = v73;
    v76 = v75;
    v78 = v77;

    v79 = ((double (*)(double (**)(void *, UILabel *, uint64_t), UILabel *, BOOL, double, double, double, double))v47[2])(v47, self->_primaryTextLabel, !v255, v72, v74, v76, v78);
    v247 = v80;
    v248 = v79;
    v245 = v81;
    v246 = v82;
    if (!v249 && v255)
    {
      v369.origin.x = x;
      v369.origin.y = y;
      v369.size.width = width;
      v369.size.height = height;
      v83 = CGRectGetHeight(v369);
      -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "displayScale");
      UIFloorToScale();
      v86 = v85;
      v370.size.width = v247;
      v370.origin.x = v248;
      v370.origin.y = v245;
      v370.size.height = v246;
      v87 = CGRectGetHeight(v370);

      if (self->_secondaryTextElement)
        v88 = 1;
      else
        v88 = v66 != 0;
      if (v88)
      {
        v245 = v83 - v86 - v87;
      }
      else
      {
        UIRectCenteredXInRect();
        v247 = v90;
        v248 = v89;
        v245 = v91;
        v246 = v92;
      }
    }
    v299[0] = MEMORY[0x1E0C809B0];
    v299[1] = 3221225472;
    v299[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_10;
    v299[3] = &unk_1E8D1BE80;
    v93 = v257;
    v300 = v93;
    v299[4] = self;
    v301 = v248;
    v302 = v245;
    v303 = v247;
    v304 = v246;
    v94 = _Block_copy(v299);
    objc_msgSend(v252, "addObject:", v94);

    if (v43 && self->_thumbnailAlignedWithSecondaryText)
    {
      v242[2]();
      v371.size.width = v247;
      v371.origin.x = v248;
      v371.origin.y = v245;
      v371.size.height = v246;
      MaxY = CGRectGetMaxY(v371);
      v96 = &v346->origin.x;
      v346[1].origin.y = MaxY;
      ((void (*)(void (**)(void *, BSUIDateLabel *), UIImageView *, double, CGFloat, double, double))v93[2])(v93, self->_thumbnailImageView, v96[4], MaxY, v96[6], v96[7]);
    }

  }
  else
  {
    v247 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v248 = *MEMORY[0x1E0C9D648];
    v245 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v246 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (IsAccessibilityCategory && self->_date)
  {
    (*((void (**)(void *, BOOL, _QWORD))v54 + 2))(v54, v43 != 0, 0);
    v97 = v47[2](v47, (UILabel *)self->_dateLabel, 1);
    v98 = (_QWORD *)&v352->origin.x;
    v352[1].origin.x = v97;
    v98[5] = v99;
    v98[6] = v100;
    v98[7] = v101;
    v296[0] = MEMORY[0x1E0C809B0];
    v296[1] = 3221225472;
    v296[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_11;
    v296[3] = &unk_1E8D1BEA8;
    v297 = v257;
    v296[4] = self;
    v298 = &v351;
    v102 = _Block_copy(v296);
    objc_msgSend(v252, "addObject:", v102);

  }
  if (v43 && CGRectIsEmpty(v346[1]))
    v242[2]();
  -[NCNotificationSeamlessContentView primarySubtitleText](self, "primarySubtitleText");
  v103 = objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend((id)v103, "length") == 0;

  if (!v104)
  {
    (*((void (**)(void *, BOOL, _BOOL8))v54 + 2))(v54, v43 != 0, IsAccessibilityCategory);
    v105 = v47[2](v47, self->_primarySubtitleTextLabel, 1);
    v107 = v106;
    v109 = v108;
    v111 = v110;
    v290[0] = MEMORY[0x1E0C809B0];
    v290[1] = 3221225472;
    v290[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_12;
    v290[3] = &unk_1E8D1BE80;
    v291 = v257;
    v290[4] = self;
    v292 = v105;
    v293 = v107;
    v294 = v109;
    v295 = v111;
    v103 = (uint64_t)_Block_copy(v290);
    objc_msgSend(v252, "addObject:", v103);

  }
  if (v66)
  {
    if (v255)
      secondaryTextMaximumNumberOfLines = 1;
    else
      secondaryTextMaximumNumberOfLines = self->_secondaryTextMaximumNumberOfLines;
    v103 = 448;
    -[UILabel nc_setNumberOfLines:](self->_primaryContentSummaryLabel, "nc_setNumberOfLines:", secondaryTextMaximumNumberOfLines);
    -[UILabel nc_setNumberOfLines:](self->_secondaryContentSummaryLabel, "nc_setNumberOfLines:", secondaryTextMaximumNumberOfLines);
    (*((void (**)(void *, BOOL, _BOOL8))v54 + 2))(v54, v43 != 0, IsAccessibilityCategory);
    v113 = v47[2](v47, self->_primaryContentSummaryLabel, 1);
    v117 = v113;
    v118 = v114.n128_f64[0];
    v119 = v115.n128_f64[0];
    v120 = v116.n128_f64[0];
    if (!v249)
    {
      if (v68)
      {
        v117 = v238[2](v113, v114, v115, v116, v248, v245, v247, v246);
        v118 = v121;
        v119 = v122;
        v120 = v123;
      }
      else if (v255)
      {
        v372.origin.x = x;
        v372.origin.y = y;
        v372.size.width = width;
        v372.size.height = height;
        v124 = CGRectGetHeight(v372);
        -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "displayScale");
        UIFloorToScale();
        v127 = v126;
        v373.origin.x = v117;
        v373.origin.y = v118;
        v373.size.width = v119;
        v373.size.height = v120;
        v128 = CGRectGetHeight(v373);

        v118 = v124 - v127 - v128;
      }
    }
    v282[0] = MEMORY[0x1E0C809B0];
    v282[1] = 3221225472;
    v282[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_13;
    v282[3] = &unk_1E8D1BED0;
    v283 = v257;
    v282[4] = self;
    v285 = v117;
    v286 = v118;
    v287 = v119;
    v288 = v120;
    v289 = v236;
    v284 = &v351;
    v129 = _Block_copy(v282);
    objc_msgSend(v252, "addObject:", v129);

  }
  -[NCNotificationSeamlessContentView secondaryText](self, "secondaryText");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "length") == 0;

  if (!v131)
  {
    v132 = (*((double (**)(void *, BOOL, _BOOL8))v54 + 2))(v54, v43 != 0, IsAccessibilityCategory);
    v134 = v133;
    v136 = v135;
    v138 = v137;
    v103 = 440;
    v139 = v47[2](v47, (UILabel *)self->_secondaryTextElement, 1);
    v141 = v140;
    v143 = v142;
    v145 = v144;
    secondaryTextElement = self->_secondaryTextElement;
    if (v255)
    {
      if (-[NCTextSupporting nc_numberOfLines](secondaryTextElement, "nc_numberOfLines") != 1)
      {
        v147 = 1;
LABEL_81:
        -[NCTextSupporting nc_setNumberOfLines:](self->_secondaryTextElement, "nc_setNumberOfLines:", v147);
      }
    }
    else
    {
      v148 = -[NCTextSupporting nc_numberOfLines](secondaryTextElement, "nc_numberOfLines");
      v147 = self->_secondaryTextMaximumNumberOfLines;
      if (v148 != v147)
        goto LABEL_81;
    }
    if (!v249)
    {
      v139 = ((double (*)(double, double, double, double, double, double, double, double))v238[2])(v139, v141, v143, v145, v248, v245, v247, v246);
      v141 = v149;
      v143 = v150;
      v145 = v151;
      v152 = self->_secondaryTextElement;
      v153 = objc_opt_class();
      v154 = v152;
      if (v153)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v155 = v154;
        else
          v155 = 0;
      }
      else
      {
        v155 = 0;
      }
      v156 = v155;

      if (v156)
      {
        -[NCTextSupporting sizeThatFits:](v156, "sizeThatFits:", v136, v138);
        v244 = v157;
        v158 = self->_secondaryTextElement;
        v159 = objc_opt_class();
        v103 = v158;
        if (v159)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v160 = (void *)v103;
          else
            v160 = 0;
        }
        else
        {
          v160 = 0;
        }
        v161 = v160;

        v374.origin.x = v132;
        v374.origin.y = v134;
        v374.size.width = v136;
        v374.size.height = v138;
        CGRectGetWidth(v374);
        BSRectWithSize();
        objc_msgSend(v161, "textRectForBounds:limitedToNumberOfLines:", 0);
        v163 = v162;

        self->_truncatingSecondaryText = round(v163) > round(v244);
      }

    }
    v276[0] = MEMORY[0x1E0C809B0];
    v276[1] = 3221225472;
    v276[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_14;
    v276[3] = &unk_1E8D1BE80;
    v277 = v257;
    v276[4] = self;
    v278 = v139;
    v279 = v141;
    v280 = v143;
    v281 = v145;
    v164 = _Block_copy(v276);
    objc_msgSend(v252, "addObject:", v164);

  }
  -[UIAction title](self->_inlineAction, "title");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(v165, "length") == 0;

  if (!v166)
  {
    (*((void (**)(void *, BOOL, _BOOL8))v54 + 2))(v54, v43 != 0, IsAccessibilityCategory);
    v167 = v47[2](v47, (UILabel *)self->_inlineActionButton, 0);
    v169 = v168;
    v171 = v170;
    v330[1].size.height = v330[1].size.height + 8.0;
    v173 = v172 + 8.0;
    v270[0] = MEMORY[0x1E0C809B0];
    v270[1] = 3221225472;
    v270[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_15;
    v270[3] = &unk_1E8D1BE80;
    v270[4] = self;
    v271 = v257;
    v272 = v167;
    v273 = v173;
    v274 = v169;
    v275 = v171;
    v174 = _Block_copy(v270);
    objc_msgSend(v252, "addObject:", v174);

  }
  -[NCNotificationSeamlessContentView footerText](self, "footerText");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v175, "length") == 0;

  if (!v176)
  {
    (*((void (**)(void *, BOOL, _BOOL8))v54 + 2))(v54, v43 != 0, IsAccessibilityCategory);
    v177 = v47[2](v47, self->_footerTextLabel, 1);
    v179 = v178;
    v181 = v180;
    v330[1].size.height = v330[1].size.height + 2.0;
    v183 = v182 + 2.0;
    v264[0] = MEMORY[0x1E0C809B0];
    v264[1] = 3221225472;
    v264[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_16;
    v264[3] = &unk_1E8D1BE80;
    v264[4] = self;
    v265 = v257;
    v266 = v177;
    v267 = v183;
    v268 = v179;
    v269 = v181;
    v184 = _Block_copy(v264);
    objc_msgSend(v252, "addObject:", v184);

  }
  if (v250)
  {
    v375.origin.x = x;
    v375.origin.y = y;
    v375.size.width = width;
    v375.size.height = height;
    CGRectGetWidth(v375);
  }
  -[NCNotificationSeamlessContentView isHorizontalMarginPaddingDisabled](self, "isHorizontalMarginPaddingDisabled");
  UIRectCenteredYInRectScale();
  v186 = v185;
  v188 = v187;
  v190 = v189;
  v192 = v191;
  if (-[NCBadgedIconView isFeaturingSymbol](self->_badgedIconView, "isFeaturingSymbol", 0))
  {
    BSRectWithSize();
    v234 = 0;
    UIRectCenteredIntegralRectScale();
    v186 = v193;
    v188 = v194;
    v190 = v195;
    v192 = v196;
  }
  if (v249)
    v197 = 0;
  else
    v197 = v255;
  if (v197)
  {
    -[NCNotificationSeamlessContentView bounds](self, "bounds");
    v198 = CGRectGetHeight(v376);
    -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "displayScale");
    UIFloorToScale();
    v201 = v200;
    v377.origin.x = v186;
    v377.origin.y = v188;
    v377.size.width = v190;
    v377.size.height = v192;
    v202 = CGRectGetHeight(v377);

    if (v188 < v198 - v201 - v202)
      v188 = v198 - v201 - v202;
  }
  if (IsAccessibilityCategory)
  {
    if (!CGRectIsEmpty(v352[1]))
    {
      v378.size.width = v247;
      v378.origin.x = v248;
      v378.origin.y = v245;
      v378.size.height = v246;
      v379 = CGRectUnion(v378, v352[1]);
      v247 = v379.size.width;
      v248 = v379.origin.x;
      v245 = v379.origin.y;
      v246 = v379.size.height;
    }
    -[NCNotificationSeamlessContentView importantText](self, "importantText", v234);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = objc_msgSend(v203, "length") == 0;

    if (!v204)
    {
      -[UILabel frame](self->_importantTextLabel, "frame");
      v384.size.width = v247;
      v384.origin.x = v248;
      v384.origin.y = v245;
      v384.size.height = v246;
      CGRectUnion(v380, v384);
    }
    v234 = v235;
    UIRectCenteredYInRectScale();
    v186 = v205;
    v188 = v206;
    v190 = v207;
    v192 = v208;
  }
  ((void (*)(void (**)(void *, BSUIDateLabel *), NCBadgedIconView *, double, double, double, double))v257[2])(v257, self->_badgedIconView, v186, v188, v190, v192);
  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "displayScale");
  UIFloorToScale();
  v211 = v210;
  v212 = CGRectGetHeight(v330[1]);
  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "displayScale");
  UIFloorToScale();
  v215 = v214;

  if (self->_date && !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory))
  {
    -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "displayScale");
    UIFloorToScale();
    v219 = v218;
    -[NCNotificationSeamlessContentView _dateLabelFont](self, "_dateLabelFont");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "lineHeight");
    -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v43, "displayScale");
    UICeilToScale();
    v221 = v220;
    -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
    v103 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v103, "displayScale");
    UIFloorToScale();
    v216 = v219 + 2.0 + v221 + v222;
    v217 = 1;
  }
  else if (self->_thumbnailAlignedWithSecondaryText)
  {
    v216 = CGRectGetMinY(v346[1]);
    v217 = 0;
  }
  else
  {
    v217 = 0;
    v216 = 14.0;
  }
  -[NCNotificationSeamlessContentView thumbnail](self, "thumbnail", v234);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  if (v223)
    v224 = 32.0;
  else
    v224 = 0.0;

  if (v217)
  {

  }
  v225 = v211 + v212 + v215;
  v226 = v216 + v224 + 14.0;
  if (v249)
  {
    v381.origin.x = x;
    v381.origin.y = y;
    v381.size.width = width;
    v381.size.height = height;
    CGRectGetWidth(v381);
    UISizeRoundToScale();
    v249->width = v227;
    v249->height = v228;
  }
  else
  {
    if (!v255 && fmax(v226, 66.0) > v225)
    {
      UIRectCenteredYInRectScale();
      v229 = CGRectGetMinY(v382);
      v383.origin.x = v241;
      v383.origin.y = v240;
      v383.size.width = v239;
      v383.size.height = rect;
      v360[3] = v229 - CGRectGetMinY(v383);
    }
    v262 = 0u;
    v263 = 0u;
    v260 = 0u;
    v261 = 0u;
    v230 = v252;
    v231 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v260, v363, 16);
    if (v231)
    {
      v232 = *(_QWORD *)v261;
      do
      {
        for (i = 0; i != v231; ++i)
        {
          if (*(_QWORD *)v261 != v232)
            objc_enumerationMutation(v230);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v260 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v260 + 1) + 8 * i));
        }
        v231 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v260, v363, 16);
      }
      while (v231);
    }

  }
  _Block_object_dispose(v323, 8);

  _Block_object_dispose(&v329, 8);
  _Block_object_dispose(&v345, 8);
  _Block_object_dispose(&v351, 8);

  _Block_object_dispose(&v359, 8);
}

void __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  double v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;

  v11 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    v12 = a4 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v17 = v11;
    objc_msgSend(v11, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 == *(void **)(*(_QWORD *)(a1 + 32) + 416))
    {

    }
    else
    {
      objc_msgSend(v17, "frame");
      v15 = CGRectEqualToRect(v24, *MEMORY[0x1E0C9D648]);

      if (!v15)
      {
        objc_msgSend(v17, "setFrame:", a3, v12, a5, a6);
LABEL_7:
        v11 = v17;
        goto LABEL_8;
      }
    }
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_2;
    v18[3] = &unk_1E8D1BD70;
    v19 = v17;
    v20 = a3;
    v21 = v12;
    v22 = a5;
    v23 = a6;
    objc_msgSend(v16, "performWithoutAnimation:", v18);

    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  double v8;
  double Width;
  double v10;
  int v11;
  double v12;
  double MaxY;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  double Height;
  void *v19;
  double v20;
  double v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  BSRectWithSize();
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if (*(_BYTE *)(a1 + 96))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "isHorizontalMarginPaddingDisabled");
    v8 = 17.0;
    if (v7)
      v8 = 0.0;
  }
  else
  {
    Width = CGRectGetWidth(*(CGRect *)(a1 + 64));
    v10 = Width - CGRectGetWidth(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
    v11 = objc_msgSend(*(id *)(a1 + 32), "isHorizontalMarginPaddingDisabled");
    v12 = 17.0;
    if (v11)
      v12 = 0.0;
    v8 = v10 - v12;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v8;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 488))
  {
    MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");
    UIFloorToScale();
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = MaxY + v15;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0x402C000000000000;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(double *)(v16 + 40);
  if (*(_BYTE *)(a1 + 97))
  {
    Height = CGRectGetHeight(*(CGRect *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayScale");
    UIFloorToScale();
    v21 = Height - v20 + -32.0;

    if (v17 < v21)
      v17 = v21;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(double *)(v16 + 40) = v17;
  UIRectIntegralWithScale();
  v22 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v22[4] = v23;
  v22[5] = v24;
  v22[6] = v25;
  v22[7] = v26;
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
}

double __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_4(uint64_t a1, void *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v23;
  CGRect v24;

  objc_msgSend(a2, "sizeThatFits:", a6, a7);
  v23.origin.x = a4;
  v23.origin.y = a5;
  v23.size.width = a6;
  v23.size.height = a7;
  CGRectGetWidth(v23);
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (a3)
    CGRectGetMinX(*(CGRect *)&v13);
  else
    CGRectGetMinX(*(CGRect *)&v13);
  CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  UIRectIntegralWithScale();
  v18 = v17;
  v24.origin.x = v17;
  v24.origin.y = v19;
  v24.size.width = v20;
  v24.size.height = v21;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v24);
  return v18;
}

CGFloat __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_5(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGRect v16;
  CGRect v17;

  v16.origin.x = a6;
  v16.origin.y = a7;
  v16.size.width = a8;
  v16.size.height = a9;
  CGRectGetWidth(v16);
  if (*(_BYTE *)(a1 + 32))
  {
    v17.origin.x = a6;
    v17.origin.y = a7;
    v17.size.width = a8;
    v17.size.height = a9;
    return CGRectGetMaxX(v17) + 10.0;
  }
  return a2;
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_textFrameForBounds:ignoreBadgedIconView:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (a2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_7(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double Height;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  if (*(_BYTE *)(a1 + 80))
  {
    Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayScale");
    UIFloorToScale();
    v20 = Height - v19;
    v32 = a2;
    v35.origin.x = a2;
    v35.origin.y = a3;
    v35.size.width = a4;
    v35.size.height = a5;
    v21 = CGRectGetHeight(v35);

    v33 = a6;
    v36.origin.x = a6;
    v36.origin.y = a7;
    v36.size.width = a8;
    v36.size.height = a9;
    v22 = a4 - (CGRectGetWidth(v36) + 5.0);
    objc_msgSend(*(id *)(a1 + 32), "thumbnail");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0.0;
    if (!v23)
      v24 = CGRectGetWidth(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)) + 10.0;
    v25 = v20 - v21;
    v26 = v22 - v24;

    v27 = fmax(v26, 0.0);
    v28 = v33;
    v29 = a7;
    v30 = a8;
    v31 = a9;
    if (*(_BYTE *)(a1 + 81))
    {
      CGRectGetMinX(*(CGRect *)&v28);
      v37.origin.x = v32;
      v37.origin.y = v25;
      v37.size.width = v27;
      v37.size.height = a5;
      CGRectGetWidth(v37);
    }
    else
    {
      CGRectGetMaxX(*(CGRect *)&v28);
    }
  }
}

void __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_9;
  v8 = &unk_1E8D1BE80;
  v3 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v4 = *(_OWORD *)(a1 + 64);
  v11 = *(_OWORD *)(a1 + 48);
  v12 = v4;
  objc_msgSend(v2, "performWithoutAnimation:", &v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0, v5, v6, v7, v8);

}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_11(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(a1[5] + 16))(a1[5], *(_QWORD *)(a1[4] + 488), *(double *)(*(_QWORD *)(a1[6] + 8) + 32), *(double *)(*(_QWORD *)(a1[6] + 8) + 40), *(double *)(*(_QWORD *)(a1[6] + 8) + 48), *(double *)(*(_QWORD *)(a1[6] + 8) + 56));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_13(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  double v5;
  double v6;

  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  result = (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  if (*(_BYTE *)(a1 + 88))
  {
    v3 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "_firstBaselineOffsetFromTop");
    v5 = v3 + v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "_firstBaselineOffsetFromTop");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v5 - v6;
    return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  }
  return result;
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (unint64_t)_importantTextMaximumNumberOfLines
{
  return !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
}

- (unint64_t)_footerTextMaximumNumberOfLines
{
  return !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
}

- (void)_updateTextAttributesForPrimaryTextLabel
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  UILabel *primaryTextLabel;
  id v6;
  void *v7;

  if (self->_primaryTextLabel)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4B10];
    primaryTextLabel = self->_primaryTextLabel;
    v6 = *v4;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v6, 0, *MEMORY[0x1E0DC1448]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](primaryTextLabel, "setFont:", v7);
    -[UILabel setNumberOfLines:](self->_primaryTextLabel, "setNumberOfLines:", self->_primaryTextMaximumNumberOfLines);
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForPrimarySubtitleTextLabel
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  UILabel *primarySubtitleTextLabel;
  id v6;
  void *v7;

  if (self->_primarySubtitleTextLabel)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4B10];
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    v6 = *v4;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v6, 0, *MEMORY[0x1E0DC1448]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](primarySubtitleTextLabel, "setFont:", v7);
    -[UILabel setNumberOfLines:](self->_primarySubtitleTextLabel, "setNumberOfLines:", self->_primarySubtitleTextMaximumNumberOfLines);
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForSecondaryTextElement
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  NCTextSupporting *secondaryTextElement;
  id v6;
  void *v7;

  if (self->_secondaryTextElement)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4B10];
    secondaryTextElement = self->_secondaryTextElement;
    v6 = *v4;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v6, 0x8000, *MEMORY[0x1E0DC1440]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCTextSupporting setFont:](secondaryTextElement, "setFont:", v7);
    -[NCTextSupporting nc_setNumberOfLines:](self->_secondaryTextElement, "nc_setNumberOfLines:", self->_secondaryTextMaximumNumberOfLines);
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForContentSummaryTextLabel
{
  if (self->_primaryContentSummaryLabel)
    -[NCNotificationSeamlessContentView setContentSummaryText:](self, "setContentSummaryText:", self->_contentSummaryText);
}

- (void)_updateTextAttributesForImportantTextLabel
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  UILabel *importantTextLabel;
  id v6;
  void *v7;

  if (self->_importantTextLabel)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4AB8];
    importantTextLabel = self->_importantTextLabel;
    v6 = *v4;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v6, 0, *MEMORY[0x1E0DC1448]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](importantTextLabel, "setFont:", v7);
    -[UILabel setNumberOfLines:](self->_importantTextLabel, "setNumberOfLines:", -[NCNotificationSeamlessContentView _importantTextMaximumNumberOfLines](self, "_importantTextMaximumNumberOfLines"));
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForInlineActionButton
{
  void *v3;
  void *v4;
  _BOOL4 IsAccessibilityCategory;
  id *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[UIAction title](self->_inlineAction, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[UIButton configuration](self->_inlineActionButton, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v6 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v6 = (id *)MEMORY[0x1E0DC4B10];
    v7 = *v6;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v7, 0, *MEMORY[0x1E0DC1448]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    v13 = *MEMORY[0x1E0DC1138];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v3, v10);

    objc_msgSend(v4, "setAttributedTitle:", v11);
    objc_msgSend(v4, "setContentInsets:", 8.0, 22.0, 8.0, 22.0);
    objc_msgSend(v4, "setButtonSize:", 0);
    -[UIButton setConfiguration:](self->_inlineActionButton, "setConfiguration:", v4);
    -[UIButton titleLabel](self->_inlineActionButton, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineBreakMode:", 4);

    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_updateTextAttributesForFooterTextLabel
{
  _BOOL4 IsAccessibilityCategory;
  id *v4;
  UILabel *footerTextLabel;
  id v6;
  void *v7;

  if (self->_footerTextLabel)
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    v4 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v4 = (id *)MEMORY[0x1E0DC4AB8];
    footerTextLabel = self->_footerTextLabel;
    v6 = *v4;
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, v6, 0, *MEMORY[0x1E0DC1440]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](footerTextLabel, "setFont:", v7);
    -[UILabel setNumberOfLines:](self->_footerTextLabel, "setNumberOfLines:", -[NCNotificationSeamlessContentView _footerTextMaximumNumberOfLines](self, "_footerTextMaximumNumberOfLines"));
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForDateLabel
{
  BSUIDateLabel *dateLabel;
  void *v4;

  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[NCNotificationSeamlessContentView _dateLabelPreferredFont](self, "_dateLabelPreferredFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIDateLabel setFont:](dateLabel, "setFont:", v4);

    -[BSUIDateLabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
    -[BSUIDateLabel setLineBreakMode:](self->_dateLabel, "setLineBreakMode:", 3);
    self->_hasUpdatedContent = 1;
    -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  NSString *preferredContentSizeCategory;

  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  -[NCNotificationSeamlessContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;

  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  -[NCNotificationSeamlessContentView _updateTextAttributesForPrimaryTextLabel](self, "_updateTextAttributesForPrimaryTextLabel");
  -[NCNotificationSeamlessContentView _updateTextAttributesForPrimarySubtitleTextLabel](self, "_updateTextAttributesForPrimarySubtitleTextLabel");
  -[NCNotificationSeamlessContentView _updateTextAttributesForSecondaryTextElement](self, "_updateTextAttributesForSecondaryTextElement");
  -[NCNotificationSeamlessContentView _updateTextAttributesForContentSummaryTextLabel](self, "_updateTextAttributesForContentSummaryTextLabel");
  -[NCNotificationSeamlessContentView _updateTextAttributesForImportantTextLabel](self, "_updateTextAttributesForImportantTextLabel");
  -[NCNotificationSeamlessContentView _updateTextAttributesForInlineActionButton](self, "_updateTextAttributesForInlineActionButton");
  -[NCNotificationSeamlessContentView _updateTextAttributesForFooterTextLabel](self, "_updateTextAttributesForFooterTextLabel");
  -[NCNotificationSeamlessContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
}

- (void)_updateTextAttributesIfNecessary
{
  if (-[NCNotificationSeamlessContentView _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[NCNotificationSeamlessContentView _updateTextAttributes](self, "_updateTextAttributes");
}

- (void)_configureImportantTextLabelIfNecessary
{
  UILabel *v3;
  UILabel *importantTextLabel;
  UILabel *v5;
  void *v6;

  if (!self->_importantTextLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    importantTextLabel = self->_importantTextLabel;
    self->_importantTextLabel = v3;

    -[UILabel nc_setMenuEnabled:](self->_importantTextLabel, "nc_setMenuEnabled:", self->_textMenusEnabled);
    -[UILabel setLineBreakMode:](self->_importantTextLabel, "setLineBreakMode:", 4);
    -[NCNotificationSeamlessContentView addSubview:](self, "addSubview:", self->_importantTextLabel);
    -[NCNotificationSeamlessContentView _updateTextAttributesForImportantTextLabel](self, "_updateTextAttributesForImportantTextLabel");
    v5 = self->_importantTextLabel;
    -[NCNotificationSeamlessContentView importantTextVisualStylingProvider](self, "importantTextVisualStylingProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v5, 1, v6, 0);

    -[UILabel setAlpha:](self->_importantTextLabel, "setAlpha:", 0.0);
  }
}

- (void)_configureSecondaryLabelIfNecessary
{
  id v3;
  NCTextSupporting *secondaryTextElement;

  if (!self->_secondaryTextElement)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v3, "_setTextAlignmentFollowsWritingDirection:", 1);
    objc_msgSend(v3, "setLineBreakMode:", 4);
    objc_msgSend(v3, "nc_setMenuEnabled:", self->_textMenusEnabled);
    objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("NotificationBody"));
    secondaryTextElement = self->_secondaryTextElement;
    self->_secondaryTextElement = (NCTextSupporting *)v3;

  }
}

- (void)_configureSecondaryTextViewIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NCTextSupporting *secondaryTextElement;

  if (!self->_secondaryTextElement)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
    objc_msgSend(v3, "nc_setMenuEnabled:", self->_textMenusEnabled);
    objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v3, "setEditable:", 0);
    objc_msgSend(v3, "setSelectable:", 1);
    objc_msgSend(v3, "setDataDetectorTypes:", 3);
    objc_msgSend(v3, "_setInteractiveTextSelectionDisabled:", 1);
    objc_msgSend(v3, "setScrollEnabled:", 0);
    objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(v3, "textContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLineFragmentPadding:", 0.0);

    objc_msgSend(v3, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineBreakMode:", 4);

    objc_msgSend(v3, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSynchronizesAlignmentToDirection:", 1);

    objc_msgSend(v3, "layoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLimitsLayoutForSuspiciousContents:", 1);

    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("NotificationBody"));
    secondaryTextElement = self->_secondaryTextElement;
    self->_secondaryTextElement = (NCTextSupporting *)v3;

  }
}

- (void)_configureSecondaryTextElementIfNecessary
{
  NCTextSupporting *secondaryTextElement;
  void *v4;

  if (!self->_secondaryTextElement)
  {
    if (self->_URLInteractionEnabled)
      -[NCNotificationSeamlessContentView _configureSecondaryTextViewIfNecessary](self, "_configureSecondaryTextViewIfNecessary");
    else
      -[NCNotificationSeamlessContentView _configureSecondaryLabelIfNecessary](self, "_configureSecondaryLabelIfNecessary");
    secondaryTextElement = self->_secondaryTextElement;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCTextSupporting setBackgroundColor:](secondaryTextElement, "setBackgroundColor:", v4);

    -[NCTextSupporting setContentMode:](self->_secondaryTextElement, "setContentMode:", 4);
    -[NCNotificationSeamlessContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
    -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_secondaryTextElement);
    -[NCNotificationSeamlessContentView _updateTextAttributesForSecondaryTextElement](self, "_updateTextAttributesForSecondaryTextElement");
    -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryTextElement, 0, self->_strokeVisualStylingProvider, 0);
  }
}

- (void)_configureContentSummaryTextElementsIfNecessary
{
  UILabel *v3;
  UILabel *primaryContentSummaryLabel;
  UILabel *v5;
  UILabel *secondaryContentSummaryLabel;

  if (!self->_primaryContentSummaryLabel)
  {
    -[NCNotificationSeamlessContentView _createContentSummaryLabel](self, "_createContentSummaryLabel");
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    primaryContentSummaryLabel = self->_primaryContentSummaryLabel;
    self->_primaryContentSummaryLabel = v3;

    -[UILabel setAccessibilityIdentifier:](self->_primaryContentSummaryLabel, "setAccessibilityIdentifier:", CFSTR("ContentSummary"));
    -[NCNotificationSeamlessContentView _createContentSummaryLabel](self, "_createContentSummaryLabel");
    v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
    secondaryContentSummaryLabel = self->_secondaryContentSummaryLabel;
    self->_secondaryContentSummaryLabel = v5;

    -[NCNotificationSeamlessContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
    -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_primaryContentSummaryLabel);
    -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_secondaryContentSummaryLabel);
    -[NCNotificationSeamlessContentView _updateTextAttributesForContentSummaryTextLabel](self, "_updateTextAttributesForContentSummaryTextLabel");
    -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryContentSummaryLabel, 0, self->_strokeVisualStylingProvider, 0);
    -[NCNotificationSeamlessContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryContentSummaryLabel, 1, self->_strokeVisualStylingProvider, 0);
  }
}

- (id)_createContentSummaryLabel
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ContentSummary"));
  objc_msgSend(v3, "_setTextAlignmentFollowsWritingDirection:", 1);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  objc_msgSend(v3, "nc_setMenuEnabled:", self->_textMenusEnabled);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setContentMode:", 4);
  return v3;
}

- (id)_dateLabelFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BSUIDateLabel font](self->_dateLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NCNotificationSeamlessContentView _dateLabelPreferredFont](self, "_dateLabelPreferredFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_dateLabelPreferredFont
{
  return (id)objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x1E0DC4AB8], 0, *MEMORY[0x1E0DC1440]);
}

- (void)_configureDateLabelIfNecessary
{
  if (!self->_dateLabel)
  {
    if (self->_date)
      -[NCNotificationSeamlessContentView _configureDateLabel](self, "_configureDateLabel");
  }
}

- (void)_configureDateLabel
{
  void *v3;
  BSUIDateLabel *v4;
  BSUIDateLabel *dateLabel;
  MTVisualStylingProvider *strokeVisualStylingProvider;

  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", self->_date, 0, self->_timeZone, self->_dateAllDay, self->_dateFormatStyle);
  v4 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
  dateLabel = self->_dateLabel;
  self->_dateLabel = v4;

  -[BSUIDateLabel setDelegate:](self->_dateLabel, "setDelegate:", self);
  -[BSUIDateLabel setHidden:](self->_dateLabel, "setHidden:", self->_hideDate);
  -[NCNotificationSeamlessContentView addSubview:](self, "addSubview:", self->_dateLabel);
  -[NCNotificationSeamlessContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](strokeVisualStylingProvider, "automaticallyUpdateView:withStyle:", self->_dateLabel, 1);
}

- (void)_adjustInlineActionButtonBackgroundColor
{
  UIButton *inlineActionButton;
  void *v4;
  void *v5;
  id v6;

  inlineActionButton = self->_inlineActionButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", dbl_1CFD91710[objc_msgSend(v4, "userInterfaceStyle") == 2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](inlineActionButton, "setBackgroundColor:", v5);

}

- (void)_recycleDateLabel
{
  id v3;

  -[BSUIDateLabel setDelegate:](self->_dateLabel, "setDelegate:", 0);
  -[BSUIDateLabel setHidden:](self->_dateLabel, "setHidden:", 0);
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_strokeVisualStylingProvider, "stopAutomaticallyUpdatingView:", self->_dateLabel);
  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recycleLabel:", self->_dateLabel);

}

- (void)_tearDownDateLabel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__NCNotificationSeamlessContentView__tearDownDateLabel__block_invoke;
  v2[3] = &unk_1E8D1B568;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __55__NCNotificationSeamlessContentView__tearDownDateLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_recycleDateLabel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 488);
    *(_QWORD *)(v3 + 488) = 0;

  }
}

- (NSAttributedString)contentSummaryText
{
  return self->_contentSummaryText;
}

- (UIAction)inlineAction
{
  return self->_inlineAction;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (BOOL)hideDate
{
  return self->_hideDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (unint64_t)primaryTextMaximumNumberOfLines
{
  return self->_primaryTextMaximumNumberOfLines;
}

- (unint64_t)primarySubtitleTextMaximumNumberOfLines
{
  return self->_primarySubtitleTextMaximumNumberOfLines;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return self->_secondaryTextMaximumNumberOfLines;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (BOOL)alignContentToBottom
{
  return self->_alignContentToBottom;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (NCNotificationSeamlessContentViewDelegate)delegate
{
  return (NCNotificationSeamlessContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isURLInteractionEnabled
{
  return self->_URLInteractionEnabled;
}

- (BOOL)areTextMenusEnabled
{
  return self->_textMenusEnabled;
}

- (BOOL)isTruncatingSecondaryText
{
  return self->_truncatingSecondaryText;
}

- (BOOL)isThumbnailAlignedWithSecondaryText
{
  return self->_thumbnailAlignedWithSecondaryText;
}

- (BOOL)isHorizontalMarginPaddingDisabled
{
  return self->_horizontalMarginPaddingDisabled;
}

- (void)setHorizontalMarginPaddingDisabled:(BOOL)a3
{
  self->_horizontalMarginPaddingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_inlineAction, 0);
  objc_storeStrong((id *)&self->_importantTextVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_contentSummaryText, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_inlineActionButton, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_importantTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryContentSummaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryContentSummaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextElement, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_crossfadingContentView, 0);
}

@end
