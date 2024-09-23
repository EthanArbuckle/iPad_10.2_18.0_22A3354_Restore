@implementation TLKTextAreaView

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  TLKStackView *v13;
  void *v14;
  void *v15;
  TLKStackView *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[TLKTextAreaView setTitleContainer:](self, "setTitleContainer:", v3);

  -[TLKTextAreaView titleContainer](self, "titleContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v4);

  v5 = (void *)objc_opt_new();
  -[TLKTextAreaView setDetailFieldAndFootnoteStackView:](self, "setDetailFieldAndFootnoteStackView:", v5);

  -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAxis:", 1);

  -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArrangedSubviewRemovalPolicy:", 1);

  -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setArrangedSubviewAdditionPolicy:", 1);

  v9 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithArrangedSubviews:", v11);

  objc_msgSend(v12, "setSpacing:", 10.0);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v12);
  -[TLKTextAreaView setDetailFieldFootnoteAndAccessoryStackView:](self, "setDetailFieldFootnoteAndAccessoryStackView:", v12);
  v13 = [TLKStackView alloc];
  -[TLKTextAreaView titleContainer](self, "titleContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NUIContainerStackView initWithArrangedSubviews:](v13, "initWithArrangedSubviews:", v15);

  -[TLKStackView setDelegate:](v16, "setDelegate:", self);
  -[TLKStackView setAlignment:forView:inAxis:](v16, "setAlignment:forView:inAxis:", 0, v12, 0);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v16);
  v17 = (void *)objc_opt_new();
  -[TLKTextAreaView setDetailsFields:](self, "setDetailsFields:", v17);

  v18 = (void *)objc_opt_new();
  -[TLKTextAreaView setBulletFields:](self, "setBulletFields:", v18);

  return v16;
}

- (void)setBannerText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKRichText *v10;

  v10 = (TLKRichText *)a3;
  if (self->_bannerText != v10)
  {
    objc_storeStrong((id *)&self->_bannerText, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setTopText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKRichText *v10;

  v10 = (TLKRichText *)a3;
  if (self->_topText != v10)
  {
    objc_storeStrong((id *)&self->_topText, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKRichText *v10;

  v10 = (TLKRichText *)a3;
  if (self->_title != v10)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setTruncateTitleMiddle:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_truncateTitleMiddle != a3)
  {
    self->_truncateTitleMiddle = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setSecondaryTitle:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKRichText *v10;

  v10 = (TLKRichText *)a3;
  if (self->_secondaryTitle != v10)
  {
    objc_storeStrong((id *)&self->_secondaryTitle, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setSecondaryTitleImage:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKImage *v10;

  v10 = (TLKImage *)a3;
  if (self->_secondaryTitleImage != v10)
  {
    objc_storeStrong((id *)&self->_secondaryTitleImage, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setSecondaryTitleIsDetached:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_secondaryTitleIsDetached != a3)
  {
    self->_secondaryTitleIsDetached = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setDetailTexts:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;

  v10 = (NSArray *)a3;
  if (self->_detailTexts != v10)
  {
    objc_storeStrong((id *)&self->_detailTexts, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setFootnote:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKRichText *v10;

  v10 = (TLKRichText *)a3;
  if (self->_footnote != v10)
  {
    objc_storeStrong((id *)&self->_footnote, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setFootnoteButtonText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_footnoteButtonText != v10)
  {
    objc_storeStrong((id *)&self->_footnoteButtonText, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setUseCompactMode:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_useCompactMode != a3)
  {
    self->_useCompactMode = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setAccessoryView:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIView *v10;

  v10 = (UIView *)a3;
  if (self->_accessoryView != v10)
  {
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)propertiesDidChange
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  _BOOL4 v34;
  int v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;

  if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
    v3 = -[TLKTextAreaView useCompactMode](self, "useCompactMode") ^ 1;
  else
    v3 = 1;
  -[TLKView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", v3);

  -[TLKView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "axis"))
    v6 = 1;
  else
    v6 = 5;
  -[TLKView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlignment:", v6);

  -[TLKView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "axis"))
    v9 = 1;
  else
    v9 = 5;
  -[TLKView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlignment:", v9);

  -[TLKTextAreaView topTextField](self, "topTextField");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaView topText](self, "topText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && !v42)
  {
    v42 = (id)objc_opt_new();
    objc_msgSend(v42, "setProminence:", 1);
    +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AA0], 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFont:", v12);

    objc_msgSend(v42, "setScaleIconsToFont:", 1);
    -[TLKView contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertArrangedSubview:atIndex:", v42, 0);

    -[TLKView contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 2.5);
    objc_msgSend(v14, "setCustomSpacing:afterView:", v42);

    -[TLKTextAreaView setTopTextField:](self, "setTopTextField:", v42);
  }
  -[TLKTextAreaView topText](self, "topText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setRichText:", v15);

  -[TLKTextAreaView topText](self, "topText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", v16 == 0);

  -[TLKTextAreaView titleContainer](self, "titleContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaView title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaView secondaryTitle](self, "secondaryTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaView secondaryTitleImage](self, "secondaryTitleImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateResultWithTitle:secondaryTitle:image:detached:useCompactMode:truncateMiddle:", v18, v19, v20, -[TLKTextAreaView secondaryTitleIsDetached](self, "secondaryTitleIsDetached"), -[TLKTextAreaView useCompactMode](self, "useCompactMode"), -[TLKTextAreaView truncateTitleMiddle](self, "truncateTitleMiddle"));

  -[TLKView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaView secondaryTitle](self, "secondaryTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaView titleContainer](self, "titleContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlignment:forView:inAxis:", v22 == 0, v23, 0);

  -[TLKTextAreaView updateBannerBadge](self, "updateBannerBadge");
  -[TLKTextAreaView updateDetails](self, "updateDetails");
  -[TLKTextAreaView updateFootnote](self, "updateFootnote");
  -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrangedSubviews");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  if ((unint64_t)objc_msgSend(v25, "count") >= 2)
  {
    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TLKTextAreaView accessoryView](self, "accessoryView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 != v27)
  {
    if (v26)
    {
      -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeArrangedSubview:", v26);

    }
    if (v27)
    {
      objc_msgSend(v27, "setCustomAlignmentRectInsets:", -2.0, 0.0, 0.0, 0.0);
      -[TLKTextAreaView insertDetailsStackViewIfNeeded](self, "insertDetailsStackViewIfNeeded");
      -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addArrangedSubview:", v27);

    }
  }
  -[TLKTextAreaView detailsFields](self, "detailsFields");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 3.0;
  if (!+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    v32 = 1.0;
    if (TLKBiggerSuggestionsLayoutEnabled())
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 1.5);
      v32 = v33;
    }
  }
  v34 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
  v35 = TLKSnippetModernizationEnabled();
  if (v34)
  {
    if (v35)
      v36 = 2.0;
    else
      v36 = 3.0;
  }
  else
  {
    v36 = 1.0;
    if (v35)
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 1.7);
      v36 = v37;
    }
  }
  -[TLKView contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TLKTextAreaView useCompactMode](self, "useCompactMode"))
  {
    if (+[TLKUtilities isHiddenView:](TLKUtilities, "isHiddenView:", v31))
      v32 = 5.0;
    else
      v32 = v36;
  }
  -[TLKTextAreaView titleContainer](self, "titleContainer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCustomSpacing:afterView:", v39, v32);

  -[TLKTextAreaView updateDetailFieldStackViewVisibility](self, "updateDetailFieldStackViewVisibility");
  if (-[TLKTextAreaView isAccessoryViewBottomAligned](self, "isAccessoryViewBottomAligned"))
    v40 = 4;
  else
    v40 = 1;
  -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAlignment:", v40);

}

- (void)updateBannerBadge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[TLKTextAreaView bannerText](self, "bannerText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[TLKTextAreaView bannerBadgeView](self, "bannerBadgeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (void *)objc_opt_new();
      -[TLKTextAreaView setBannerBadgeView:](self, "setBannerBadgeView:", v4);

      -[TLKView contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKTextAreaView bannerBadgeView](self, "bannerBadgeView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertArrangedSubview:atIndex:", v6, 0);

      -[TLKView contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKTextAreaView bannerBadgeView](self, "bannerBadgeView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCustomSpacing:afterView:", v8, 4.0);

      -[TLKTextAreaView bannerBadgeView](self, "bannerBadgeView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v9);

    }
  }
  -[TLKTextAreaView bannerBadgeView](self, "bannerBadgeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AA0], TLKSnippetModernizationEnabled() ^ 1, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:font:customInsetSize:badge:", v13, v11, 1, 4.0, 2.0);

  -[TLKTextAreaView bannerBadgeView](self, "bannerBadgeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v13 == 0);

}

- (void)insertDetailsStackViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[TLKTextAreaView detailFieldStackView](self, "detailFieldStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[TLKTextAreaView setDetailFieldStackView:](self, "setDetailFieldStackView:", v4);

    -[TLKTextAreaView detailFieldStackView](self, "detailFieldStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setArrangedSubviewRemovalPolicy:", 1);

    -[TLKTextAreaView detailFieldStackView](self, "detailFieldStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setArrangedSubviewAdditionPolicy:", 1);

    -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[TLKTextAreaView detailFieldStackView](self, "detailFieldStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertArrangedSubview:atIndex:", v7, 0);

  }
}

- (void)updateDetails
{
  TLKTextAreaView *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  double v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  TLKLabel *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  TLKLabel *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
  _BOOL4 v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t i;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void **p_cache;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  TLKTextAreaView *v79;
  id v80;
  void **v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  unint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v2 = self;
  v118 = *MEMORY[0x1E0C80C00];
  -[TLKTextAreaView detailTexts](self, "detailTexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    goto LABEL_38;
  v101 = 0;
  v4 = 0;
  v5 = (void *)*MEMORY[0x1E0DC4B10];
  v99 = *MEMORY[0x1E0DC4A90];
  v6 = (void *)*MEMORY[0x1E0DC4AA0];
  v97 = -1;
  do
  {
    -[TLKTextAreaView insertDetailsStackViewIfNeeded](v2, "insertDetailsStackViewIfNeeded");
    -[TLKTextAreaView detailsFields](v2, "detailsFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v4 >= v8)
    {
      v10 = (void *)objc_opt_new();
      -[TLKTextAreaView detailsFields](v2, "detailsFields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);
    }
    else
    {
      -[TLKTextAreaView detailsFields](v2, "detailsFields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "setUseCompactMode:", -[TLKTextAreaView useCompactMode](v2, "useCompactMode"));
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
      objc_msgSend(v11, "setMaxLines:", 1);
    objc_msgSend(v10, "setRichText:", v11);
    if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
    {
      if (TLKBiggerSuggestionsLayoutEnabled())
        v12 = v5;
      else
        v12 = v6;
      v13 = v12;
      if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
      {
        -[TLKTextAreaView titleContainer](v2, "titleContainer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "titleFont");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", v13, TLKSnippetModernizationEnabled() ^ 1, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (TLKSnippetModernizationEnabled())
      {
        if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
          +[TLKFontUtilities cachedFontForMacTextStyle:](TLKFontUtilities, "cachedFontForMacTextStyle:", v99);
        else
          +[TLKFontUtilities cachedFontForTextStyle:](TLKFontUtilities, "cachedFontForTextStyle:", v5);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[TLKFontUtilities shortFootnoteFont](TLKFontUtilities, "shortFootnoteFont");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v16;
    }
    objc_msgSend(v10, "setFont:", v15);
    if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
    {
      objc_msgSend(v11, "stars");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
      }
      else
      {
        objc_msgSend(v11, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20 < v101)
        {
LABEL_29:
          objc_msgSend(v11, "stars");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            *(float *)&v22 = 1000.0;
          else
            *(float *)&v22 = 750.0;
          objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v22);

          v23 = objc_msgSend(v3, "count");
          LODWORD(v24) = 1132068864;
          if (v4 != v23 - 1)
            *(float *)&v24 = 1000.0;
          objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 0, v24);
          goto LABEL_35;
        }
        objc_msgSend(v11, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v18, "length");
        v97 = v4;
      }

      goto LABEL_29;
    }
LABEL_35:

    ++v4;
  }
  while (v4 < objc_msgSend(v3, "count"));
  if (v97 > 0)
  {
    -[TLKTextAreaView detailsFields](v2, "detailsFields");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v97);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 1132068864;
    objc_msgSend(v26, "setContentCompressionResistancePriority:forAxis:", 0, v27);

  }
LABEL_38:
  v28 = (void *)objc_opt_new();
  if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
      v29 = 2;
    else
      v29 = 1;
  }
  else
  {
    v29 = 1;
  }
  v98 = v28;
  if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    -[TLKTextAreaView detailTexts](v2, "detailTexts");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v30, "count"))
      goto LABEL_49;
    v31 = -[TLKTextAreaView useCompactMode](v2, "useCompactMode");

    v28 = v98;
    if (v31)
    {
      -[TLKTextAreaView hyphenField](v2, "hyphenField");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        v33 = -[TLKLabel initWithProminence:]([TLKLabel alloc], "initWithProminence:", v29);
        -[TLKTextAreaView setHyphenField:](v2, "setHyphenField:", v33);

        -[TLKTextAreaView hyphenField](v2, "hyphenField");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setText:", CFSTR("—"));

      }
      -[TLKTextAreaView hyphenField](v2, "hyphenField");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "addObject:", v35);

      -[TLKTextAreaView hyphenField](v2, "hyphenField");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v30);
LABEL_49:

      v28 = v98;
    }
  }
  v100 = (void *)objc_opt_new();
  -[TLKTextAreaView detailsFields](v2, "detailsFields");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    v38 = 0;
    do
    {
      v39 = objc_msgSend(v3, "count");
      -[TLKTextAreaView detailsFields](v2, "detailsFields");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "setHidden:", v38 >= v39);
      if (v38 < v39)
      {
        objc_msgSend(v41, "setProminence:", v29);
        objc_msgSend(v100, "addObject:", v41);
        objc_msgSend(v28, "addObject:", v41);
        if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
        {
          if (v38 != objc_msgSend(v3, "count") - 1)
          {
            -[TLKTextAreaView bulletFields](v2, "bulletFields");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "count");

            if (v38 >= v43)
            {
              v45 = -[TLKLabel initWithProminence:]([TLKLabel alloc], "initWithProminence:", v29);
              objc_msgSend(v41, "font");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[TLKLabel setFont:](v45, "setFont:", v46);

              -[TLKLabel setText:](v45, "setText:", CFSTR("·"));
              +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v45);
              -[TLKTextAreaView bulletFields](v2, "bulletFields");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v45);
            }
            else
            {
              objc_msgSend(0, "setProminence:", v29);
              -[TLKTextAreaView bulletFields](v2, "bulletFields");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectAtIndexedSubscript:", v38);
              v45 = (TLKLabel *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v28, "addObject:", v45);
          }
        }
      }

      ++v38;
      -[TLKTextAreaView detailsFields](v2, "detailsFields");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

    }
    while (v38 < v48);
  }
  -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView", v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setArrangedSubviews:", v28);

  -[TLKTextAreaView updateDetailFieldStackViewVisibility](v2, "updateDetailFieldStackViewVisibility");
  v50 = -[TLKTextAreaView useCompactMode](v2, "useCompactMode") ^ 1;
  -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAxis:", v50);

  if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
    v52 = 5;
  else
    v52 = 1;
  -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setAlignment:", v52);

  v54 = TLKSnippetModernizationEnabled();
  v55 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
  v56 = 2.0;
  if (v55)
    v57 = 0.0;
  else
    v57 = 2.0;
  if (!v55)
    v56 = 0.0;
  if (v54)
    v58 = v57;
  else
    v58 = v56;
  if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
    v59 = 3.0;
  else
    v59 = v58;
  -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setSpacing:", v59);

  if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v61 = v28;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v111, v117, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v112;
      v65 = *MEMORY[0x1E0CFAA78];
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v112 != v64)
            objc_enumerationMutation(v61);
          v67 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i);
          -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setCustomSpacing:afterView:", v67, v65);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v111, v117, 16);
      }
      while (v63);
    }

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v69 = v61;
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
    if (v70)
    {
      v71 = v70;
      v72 = 0;
      v73 = *(_QWORD *)v108;
      p_cache = TLKFontUtilities.cache;
      do
      {
        v75 = 0;
        v102 = v71;
        do
        {
          v76 = v72;
          if (*(_QWORD *)v108 != v73)
            objc_enumerationMutation(v69);
          v77 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v75);
          if ((objc_msgSend(v77, "isHidden") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v77, "richText");
              v78 = v73;
              v79 = v2;
              v80 = v69;
              v81 = p_cache;
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "icons");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = objc_msgSend(v83, "count");

              p_cache = v81;
              v69 = v80;
              v2 = v79;
              v73 = v78;
              v71 = v102;
              if (v84 == 1)
              {
                -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "setCustomSpacing:afterView:", v76, v58);

                -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "setCustomSpacing:afterView:", v77, 3.0);

              }
            }
          }
          v72 = v77;

          ++v75;
        }
        while (v71 != v75);
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
      }
      while (v71);
    }
    else
    {
      v72 = 0;
    }

  }
  else
  {
    v72 = 0;
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v87 = v100;
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v89; ++j)
      {
        if (*(_QWORD *)v104 != v90)
          objc_enumerationMutation(v87);
        v92 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        if (-[TLKTextAreaView useCompactMode](v2, "useCompactMode"))
        {
          objc_msgSend(v92, "viewForLastBaselineLayout");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v92, "alignmentForView:inAxis:", v93, 1);

          if (v94 == -1)
            v94 = objc_msgSend(v92, "alignment");
        }
        else
        {
          v94 = -1;
        }
        -[TLKTextAreaView detailFieldStackView](v2, "detailFieldStackView");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setAlignment:forView:inAxis:", v94, v92, 1);

      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    }
    while (v89);
  }

}

- (void)updateDetailFieldStackViewVisibility
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;

  -[TLKTextAreaView detailFieldStackView](self, "detailFieldStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleArrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (-[TLKTextAreaView useCompactMode](self, "useCompactMode"))
      v5 = -[TLKTextAreaView isHorizontallyCompressed](self, "isHorizontallyCompressed");
    else
      v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  -[TLKTextAreaView detailFieldStackView](self, "detailFieldStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleArrangedSubviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;
  -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleArrangedSubviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;
  -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12);

}

- (void)performBatchUpdates:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  TLKTextAreaView *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __39__TLKTextAreaView_performBatchUpdates___block_invoke;
  v5[3] = &unk_1E5C06DF0;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)TLKTextAreaView;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[TLKView performBatchUpdates:](&v4, sel_performBatchUpdates_, v5);

}

uint64_t __39__TLKTextAreaView_performBatchUpdates___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "internalTextFieldsInBatchUpdate:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "internalTextFieldsInBatchUpdate:", 0);
}

- (void)internalTextFieldsInBatchUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TLKTextAreaView detailsFields](self, "detailsFields", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    if (v3)
      v8 = 1;
    else
      v8 = -1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "observer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "batchUpdateCount") + v8;
        objc_msgSend(v10, "observer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBatchUpdateCount:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)updateFootnote
{
  void *v2;
  void *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL8 v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[5];
  id v48;

  -[TLKTextAreaView footnote](self, "footnote");
  v46 = objc_claimAutoreleasedReturnValue();
  -[TLKTextAreaView footnoteButtonText](self, "footnoteButtonText");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v46;
  if (v46 | v5)
  {
    -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      -[TLKTextAreaView setFootnoteContainer:](self, "setFootnoteContainer:", v8);

      -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlignment:", 5);

      v10 = (void *)objc_opt_new();
      -[TLKTextAreaView setFootnoteLabel:](self, "setFootnoteLabel:", v10);
      -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addArrangedSubview:", v10);

      -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addArrangedSubview:", v13);

    }
    v14 = TLKBiggerSuggestionsLayoutEnabled();
    v15 = (id *)MEMORY[0x1E0DC4B10];
    if (!v14)
      v15 = (id *)MEMORY[0x1E0DC4AA0];
    v16 = *v15;
    if (-[TLKTextAreaView useCompactMode](self, "useCompactMode"))
      +[TLKFontUtilities cachedFontForTextStyle:](TLKFontUtilities, "cachedFontForTextStyle:", v16);
    else
      objc_msgSend((id)objc_opt_class(), "footNoteLabelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTextAreaView footnoteLabel](self, "footnoteLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v17);

    if (v5)
    {
      -[TLKTextAreaView footnoteButton](self, "footnoteButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = (void *)objc_opt_new();
        -[TLKTextAreaView buttonDelegate](self, "buttonDelegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTarget:action:", v21, sel_footnoteButtonPressed);

        objc_msgSend(v20, "setProminence:", 3);
        objc_msgSend(v20, "setMatchesHeightForAlignmentRectWithIntrinsicContentSize:", 1);
        if (+[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR"))
          v22 = 2;
        else
          v22 = 0;
        objc_msgSend(v20, "titleLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTextAlignment:", v22);

        +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v20);
        -[TLKTextAreaView setFootnoteButton:](self, "setFootnoteButton:", v20);
        -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKTextAreaView footnoteButton](self, "footnoteButton");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addArrangedSubview:", v3);

      }
    }
    -[TLKTextAreaView footnoteButton](self, "footnoteButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v17);

    -[TLKTextAreaView footnoteButton](self, "footnoteButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      if (v5)
      {
        -[TLKTextAreaView buttonDelegate](self, "buttonDelegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[TLKTextAreaView buttonDelegate](self, "buttonDelegate");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          -[TLKTextAreaView footnoteButton](self, "footnoteButton");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v2, "configureMenuForFootnoteButton:", v3);
          v27 = 1;
        }
        else
        {
          v27 = 0;
          v26 = 0;
        }
      }
      else
      {
        v27 = 0;
        v26 = 0;
      }
      -[TLKTextAreaView footnoteButton](self, "footnoteButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setShowsMenuAsPrimaryAction:", v26);

      if (v27)
      {

      }
      if (v5)

    }
    -[TLKTextAreaView footnoteButton](self, "footnoteButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTitle:", v5);

    -[TLKTextAreaView footnoteLabel](self, "footnoteLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __33__TLKTextAreaView_updateFootnote__block_invoke;
    v47[3] = &unk_1E5C06D50;
    v47[4] = self;
    v48 = (id)v46;
    objc_msgSend(v30, "performBatchUpdates:", v47);

    -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAlignment:forView:inAxis:", v5 == 0, v32, 0);

    if (-[TLKTextAreaView useCompactMode](self, "useCompactMode"))
      v33 = 1;
    else
      v33 = 2;
    -[TLKTextAreaView footnoteLabel](self, "footnoteLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setProminence:", v33);

    v35 = 1.0;
    if (!-[TLKTextAreaView useCompactMode](self, "useCompactMode"))
    {
      if (TLKSnippetModernizationEnabled())
        v35 = 3.0;
      else
        v35 = 4.0;
    }
    -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTextAreaView detailFieldStackView](self, "detailFieldStackView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCustomSpacing:afterView:", v37, v35);

    v6 = (void *)v46;
  }
  v38 = objc_msgSend(v6, "hasContent") ^ 1;
  -[TLKTextAreaView footnoteLabel](self, "footnoteLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setHidden:", v38);

  v40 = objc_msgSend((id)v5, "length") == 0;
  -[TLKTextAreaView footnoteButton](self, "footnoteButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHidden:", v40);

  -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "visibleArrangedSubviews");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count") == 0;
  -[TLKTextAreaView footnoteContainer](self, "footnoteContainer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setHidden:", v44);

}

void __33__TLKTextAreaView_updateFootnote__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRichText:", v1);

}

+ (id)footNoteLabelFont
{
  void *v2;
  _QWORD *v3;

  if (!TLKSnippetModernizationEnabled())
  {
    v3 = (_QWORD *)MEMORY[0x1E0DC4AA0];
LABEL_6:
    +[TLKFontUtilities cachedFontForTextStyle:](TLKFontUtilities, "cachedFontForTextStyle:", *v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (!+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DC4AB8];
    goto LABEL_6;
  }
  +[TLKFontUtilities cachedFontForMacTextStyle:](TLKFontUtilities, "cachedFontForMacTextStyle:", *MEMORY[0x1E0DC4A98]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

- (id)viewForFirstBaselineLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[TLKView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    while (1)
    {
      objc_msgSend(v3, "viewForFirstBaselineLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 == v3)
        break;
      objc_msgSend(v3, "viewForFirstBaselineLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
      }
      objc_opt_class();
      v3 = v5;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return v5;
    }
  }
  v5 = v3;
  return v5;
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[TLKView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    while (1)
    {
      objc_msgSend(v3, "viewForLastBaselineLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 == v3)
        break;
      objc_msgSend(v3, "viewForLastBaselineLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[TLKTextAreaView detailFieldFootnoteAndAccessoryStackView](self, "detailFieldFootnoteAndAccessoryStackView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        -[TLKTextAreaView detailFieldAndFootnoteStackView](self, "detailFieldAndFootnoteStackView");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
      }
      objc_opt_class();
      v3 = v5;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return v5;
    }
  }
  v5 = v3;
  return v5;
}

- (id)detailsStrings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TLKTextAreaView detailsFields](self, "detailsFields", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isHidden") & 1) == 0)
        {
          objc_msgSend(v9, "attributedString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)titleLabelString
{
  void *v2;
  void *v3;

  -[TLKTextAreaView titleContainer](self, "titleContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabelString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)secondaryTitleLabelString
{
  void *v2;
  void *v3;

  -[TLKTextAreaView titleContainer](self, "titleContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTitleLabelString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footnoteLabelString
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[TLKTextAreaView footnoteLabel](self, "footnoteLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[TLKTextAreaView footnoteLabel](self, "footnoteLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (TLKTextAreaViewDelegate)buttonDelegate
{
  return (TLKTextAreaViewDelegate *)objc_loadWeakRetained((id *)&self->_buttonDelegate);
}

- (void)setButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonDelegate, a3);
}

- (TLKRichText)bannerText
{
  return self->_bannerText;
}

- (TLKRichText)topText
{
  return self->_topText;
}

- (TLKRichText)title
{
  return self->_title;
}

- (BOOL)truncateTitleMiddle
{
  return self->_truncateTitleMiddle;
}

- (TLKRichText)secondaryTitle
{
  return self->_secondaryTitle;
}

- (TLKImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (BOOL)secondaryTitleIsDetached
{
  return self->_secondaryTitleIsDetached;
}

- (NSArray)detailTexts
{
  return self->_detailTexts;
}

- (TLKRichText)footnote
{
  return self->_footnote;
}

- (NSString)footnoteButtonText
{
  return self->_footnoteButtonText;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isAccessoryViewBottomAligned
{
  return self->_isAccessoryViewBottomAligned;
}

- (void)setIsAccessoryViewBottomAligned:(BOOL)a3
{
  self->_isAccessoryViewBottomAligned = a3;
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (TLKEmbossedLabel)bannerBadgeView
{
  return self->_bannerBadgeView;
}

- (void)setBannerBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerBadgeView, a3);
}

- (TLKRichTextField)topTextField
{
  return self->_topTextField;
}

- (void)setTopTextField:(id)a3
{
  objc_storeStrong((id *)&self->_topTextField, a3);
}

- (TLKTitleContainerView)titleContainer
{
  return self->_titleContainer;
}

- (void)setTitleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_titleContainer, a3);
}

- (NUIContainerStackView)detailFieldFootnoteAndAccessoryStackView
{
  return self->_detailFieldFootnoteAndAccessoryStackView;
}

- (void)setDetailFieldFootnoteAndAccessoryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_detailFieldFootnoteAndAccessoryStackView, a3);
}

- (NUIContainerStackView)detailFieldAndFootnoteStackView
{
  return self->_detailFieldAndFootnoteStackView;
}

- (void)setDetailFieldAndFootnoteStackView:(id)a3
{
  objc_storeStrong((id *)&self->_detailFieldAndFootnoteStackView, a3);
}

- (NUIContainerStackView)detailFieldStackView
{
  return self->_detailFieldStackView;
}

- (void)setDetailFieldStackView:(id)a3
{
  objc_storeStrong((id *)&self->_detailFieldStackView, a3);
}

- (NSMutableArray)detailsFields
{
  return self->_detailsFields;
}

- (void)setDetailsFields:(id)a3
{
  objc_storeStrong((id *)&self->_detailsFields, a3);
}

- (NSMutableArray)bulletFields
{
  return self->_bulletFields;
}

- (void)setBulletFields:(id)a3
{
  objc_storeStrong((id *)&self->_bulletFields, a3);
}

- (TLKLabel)hyphenField
{
  return self->_hyphenField;
}

- (void)setHyphenField:(id)a3
{
  objc_storeStrong((id *)&self->_hyphenField, a3);
}

- (TLKRichTextField)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
}

- (TLKTextButton)footnoteButton
{
  return self->_footnoteButton;
}

- (void)setFootnoteButton:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteButton, a3);
}

- (NUIContainerStackView)footnoteContainer
{
  return self->_footnoteContainer;
}

- (void)setFootnoteContainer:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteContainer, a3);
}

- (BOOL)disableAllObservers
{
  return self->_disableAllObservers;
}

- (void)setDisableAllObservers:(BOOL)a3
{
  self->_disableAllObservers = a3;
}

- (BOOL)isHorizontallyCompressed
{
  return self->_isHorizontallyCompressed;
}

- (void)setIsHorizontallyCompressed:(BOOL)a3
{
  self->_isHorizontallyCompressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteContainer, 0);
  objc_storeStrong((id *)&self->_footnoteButton, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_hyphenField, 0);
  objc_storeStrong((id *)&self->_bulletFields, 0);
  objc_storeStrong((id *)&self->_detailsFields, 0);
  objc_storeStrong((id *)&self->_detailFieldStackView, 0);
  objc_storeStrong((id *)&self->_detailFieldAndFootnoteStackView, 0);
  objc_storeStrong((id *)&self->_detailFieldFootnoteAndAccessoryStackView, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_topTextField, 0);
  objc_storeStrong((id *)&self->_bannerBadgeView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_footnoteButtonText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_detailTexts, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
}

@end
