@implementation PXPhotosSectionHeaderView

- (PXPhotosSectionHeaderView)initWithFrame:(CGRect)a3
{
  PXPhotosSectionHeaderView *v3;
  PXPhotosSectionHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosSectionHeaderView;
  v3 = -[PXPhotosSectionHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_style = 0;
    v3->_allowsPhotosDetailsInteraction = 1;
    v3->_backgroundStyle = 0;
    -[PXPhotosSectionHeaderView _updateBackgroundAnimated:](v3, "_updateBackgroundAnimated:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[PXPhotosSectionHeaderView setOpaque:](v4, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    -[PXPhotosSectionHeaderView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (void)setStyle:(int64_t)a3
{
  UILabel *titleLabel;
  UILabel *locationsLabel;
  UILabel *dateLabel;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    titleLabel = self->_titleLabel;
    self->_titleLabel = 0;

    -[UILabel removeFromSuperview](self->_locationsLabel, "removeFromSuperview");
    locationsLabel = self->_locationsLabel;
    self->_locationsLabel = 0;

    -[UILabel removeFromSuperview](self->_dateLabel, "removeFromSuperview");
    dateLabel = self->_dateLabel;
    self->_dateLabel = 0;

    -[PXPhotosSectionHeaderView _updateDisclosureIcon](self, "_updateDisclosureIcon");
    -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    -[PXPhotosSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
    -[PXPhotosSectionHeaderView _updateTitleLabel](self, "_updateTitleLabel");
    -[PXPhotosSectionHeaderView _updateLocationsLabelVisibility](self, "_updateLocationsLabelVisibility");
    -[PXPhotosSectionHeaderView _updateDateLabel](self, "_updateDateLabel");
    -[PXPhotosSectionHeaderView _updateDisclosureIcon](self, "_updateDisclosureIcon");
    -[PXPhotosSectionHeaderView _updateActionButton](self, "_updateActionButton");
  }
}

- (void)setBackgroundImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    -[PXPhotosSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
    v5 = v6;
  }

}

- (void)setBackgroundImageOverhang:(double)a3
{
  if (self->_backgroundImageOverhang != a3)
  {
    self->_backgroundImageOverhang = a3;
    -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundImageAlpha:(double)a3
{
  if (self->_backgroundImageAlpha != a3)
  {
    self->_backgroundImageAlpha = a3;
    -[PXPhotosSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
  }
}

- (void)setButtonSpec:(id)a3
{
  PXCuratedLibrarySectionHeaderLayoutSpec *v5;
  PXCuratedLibrarySectionHeaderLayoutSpec *v6;

  v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_buttonSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonSpec, a3);
    -[PXPhotosSectionHeaderView _updateActionButton](self, "_updateActionButton");
    v5 = v6;
  }

}

- (void)setWantsBackground:(BOOL)a3
{
  -[PXPhotosSectionHeaderView setWantsBackground:animated:](self, "setWantsBackground:animated:", a3, 0);
}

- (void)setWantsBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    -[PXPhotosSectionHeaderView _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", a4);
    -[PXPhotosSectionHeaderView _updateTitleLabel](self, "_updateTitleLabel");
    -[PXPhotosSectionHeaderView _updateLocationsLabelVisibility](self, "_updateLocationsLabelVisibility");
    -[PXPhotosSectionHeaderView _updateDateLabel](self, "_updateDateLabel");
    -[PXPhotosSectionHeaderView _updateDisclosureIcon](self, "_updateDisclosureIcon");
    -[PXPhotosSectionHeaderView _updateActionButton](self, "_updateActionButton");
  }
}

- (void)setSectionTitle:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  _QWORD v12[5];
  NSString *v13;

  v4 = (NSString *)a3;
  +[PXGridSettings sharedInstance](PXGridSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "simulateLongTitles");

  if (v6)
  {
    -[NSString px_stringByRepeating:](v4, "px_stringByRepeating:", 10);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (NSString *)v7;
  }
  v8 = self->_sectionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = v4;
    v11 = -[NSString isEqualToString:](v10, "isEqualToString:", v9);

    if (!v11)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __45__PXPhotosSectionHeaderView_setSectionTitle___block_invoke;
      v12[3] = &unk_1E5148D08;
      v12[4] = self;
      v13 = v10;
      -[PXPhotosSectionHeaderView performBatchUpdateOfDateDependentPropertiesWithBlock:](self, "performBatchUpdateOfDateDependentPropertiesWithBlock:", v12);

    }
  }

}

- (NSString)synthesizedSectionTitle
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = self->_sectionTitle;
  if (-[PXPhotosSectionHeaderView _usingDateAsTitle](self, "_usingDateAsTitle"))
  {
    if (self->_useYearOnlyForDefaultTitle)
      -[PXPhotosSectionHeaderView _dateRangeYearFormatter](self, "_dateRangeYearFormatter");
    else
      -[PXPhotosSectionHeaderView _dateRangeLongFormatter](self, "_dateRangeLongFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView sectionStartDate](self, "sectionStartDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PXPhotosSectionHeaderView sectionEndDate](self, "sectionEndDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromDate:toDate:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (NSString *)v7;
    }

  }
  return v3;
}

- (BOOL)_usingDateAsTitle
{
  return -[NSString length](self->_sectionTitle, "length") == 0;
}

- (void)performBatchUpdateOfDateDependentPropertiesWithBlock:(id)a3
{
  if (self->_performingBatchDateDependentUpdate)
  {
    self->_performingBatchDateDependentUpdate = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_performingBatchDateDependentUpdate = 1;
  }
  else
  {
    self->_dateDependentPropertiesDidChange = 0;
    self->_performingBatchDateDependentUpdate = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_performingBatchDateDependentUpdate = 0;
    if (self->_dateDependentPropertiesDidChange)
      -[PXPhotosSectionHeaderView _updateDateDependentLabels](self, "_updateDateDependentLabels");
  }
}

- (BOOL)useYearOnlyForDefaultTitle
{
  return self->_useYearOnlyForDefaultTitle;
}

- (void)setUseYearOnlyForDefaultTitle:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_useYearOnlyForDefaultTitle != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__PXPhotosSectionHeaderView_setUseYearOnlyForDefaultTitle___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXPhotosSectionHeaderView performBatchUpdateOfDateDependentPropertiesWithBlock:](self, "performBatchUpdateOfDateDependentPropertiesWithBlock:", v3);
  }
}

- (void)setSectionLocations:(id)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  +[PXGridSettings sharedInstance](PXGridSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "simulatedNumberOfLocations");

  if (v6 < 1)
  {
    v7 = v4;
  }
  else
  {
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PXGridSettings sharedInstance](PXGridSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "simulatedNumberOfLocations");

    if (v9 >= 1)
    {
      v10 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fake Location %li"), ++v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v7, "addObject:", v11);

      }
      while (v9 != v10);
    }

  }
  +[PXGridSettings sharedInstance](PXGridSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "simulateLongTitles");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v7;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v21 = 10;
          do
          {
            -[NSArray addObject:](v14, "addObject:", v20);
            --v21;
          }
          while (v21);
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
  else
  {
    v14 = v7;
  }
  if (v14 != self->_sectionLocations)
    objc_storeStrong((id *)&self->_sectionLocations, v14);
  -[PXPhotosSectionHeaderView _updateLocationsLabelVisibility](self, "_updateLocationsLabelVisibility");

}

- (void)setSectionStartDate:(id)a3 endDate:(id)a4
{
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  int v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  char v14;
  _QWORD v15[5];
  NSDate *v16;
  NSDate *v17;

  v6 = (NSDate *)a3;
  v7 = (NSDate *)a4;
  v8 = self->_sectionStartDate;
  if (v8 == v6)
  {

  }
  else
  {
    v9 = v8;
    v10 = -[NSDate isEqual:](v6, "isEqual:", v8);

    if (!v10)
    {
LABEL_7:
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __57__PXPhotosSectionHeaderView_setSectionStartDate_endDate___block_invoke;
      v15[3] = &unk_1E51457C8;
      v15[4] = self;
      v16 = v6;
      v17 = v7;
      -[PXPhotosSectionHeaderView performBatchUpdateOfDateDependentPropertiesWithBlock:](self, "performBatchUpdateOfDateDependentPropertiesWithBlock:", v15);

      goto LABEL_9;
    }
  }
  v11 = self->_sectionEndDate;
  if (v11 == v7)
  {

    goto LABEL_9;
  }
  v12 = v11;
  v13 = v7;
  v14 = -[NSDate isEqual:](v13, "isEqual:", v12);

  if ((v14 & 1) == 0)
    goto LABEL_7;
LABEL_9:

}

- (void)setShowsActionButton:(BOOL)a3
{
  if (self->_showsActionButton != a3)
  {
    self->_showsActionButton = a3;
    -[PXPhotosSectionHeaderView _updateActionButton](self, "_updateActionButton");
  }
}

- (void)setActionButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionButtonTitle = self->_actionButtonTitle;
      self->_actionButtonTitle = v6;

      -[PXPhotosSectionHeaderView _updateActionButton](self, "_updateActionButton");
    }
  }

}

- (void)setAllowsPhotosDetailsInteraction:(BOOL)a3
{
  if (self->_allowsPhotosDetailsInteraction != a3)
  {
    self->_allowsPhotosDetailsInteraction = a3;
    -[PXPhotosSectionHeaderView _updateDisclosureIcon](self, "_updateDisclosureIcon");
  }
}

- (void)setBackdropViewGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropViewGroupName;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_backdropViewGroupName) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    backdropViewGroupName = self->_backdropViewGroupName;
    self->_backdropViewGroupName = v4;

    -[PXPhotosSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName");
  }

}

- (void)setHighlightInsets:(UIEdgeInsets)a3
{
  self->_highlightInsets = a3;
  -[PXPhotosSectionHeaderView _updateHighlightView](self, "_updateHighlightView");
}

- (double)baselineToBottomSpacing
{
  NSString *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    v4 = 8.0;
  else
    v4 = 14.0;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");

  -[UILabel font](self->_titleLabel, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UILabel font](self->_titleLabel, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scaledValueForValue:", v4);
    PXFloatRoundToPixel();
    v4 = v8;

  }
  return v4;
}

- (void)_updateLabelsForTextStyle
{
  int v3;
  UILabel *titleLabel;
  uint64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "_hasAccessibilityLargeText");
  titleLabel = self->_titleLabel;
  if (v3)
  {
    -[UILabel setNumberOfLines:](titleLabel, "setNumberOfLines:", 2);
    -[UILabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 2);
    -[UILabel setNumberOfLines:](self->_locationsLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setLineBreakMode:](self->_locationsLabel, "setLineBreakMode:", 4);
  }
  else
  {
    -[UILabel setNumberOfLines:](titleLabel, "setNumberOfLines:", 1);
    -[UILabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
    -[UILabel setNumberOfLines:](self->_locationsLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setLineBreakMode:](self->_locationsLabel, "setLineBreakMode:", 5);
    if (-[PXPhotosSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v5 = 0;
    else
      v5 = 2;
    -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", v5);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXPhotosSectionHeaderView setWantsBackground:](self, "setWantsBackground:", objc_msgSend(v4, "floating"));

}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 1;
  -[PXPhotosSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName", a3, a4);
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  self->_inLayoutTransition = 0;
  -[PXPhotosSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName", a3, a4);
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)_handleActionButton:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "headerView:actionButtonPressed:", self, v7);

  }
}

- (void)_updateDateDependentLabels
{
  -[PXPhotosSectionHeaderView _updateTitleLabel](self, "_updateTitleLabel");
  -[PXPhotosSectionHeaderView _updateDateLabel](self, "_updateDateLabel");
}

- (void)_updateTitleLabel
{
  id *p_titleLabel;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *titleLabel;
  id v10;
  void *v11;
  id v12;

  -[PXPhotosSectionHeaderView synthesizedSectionTitle](self, "synthesizedSectionTitle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (-[PXPhotosSectionHeaderView style](self, "style") == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderView.m"), 480, CFSTR("Invalid header style."));

    }
    p_titleLabel = (id *)&self->_titleLabel;
    if (!self->_titleLabel)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      v6 = *p_titleLabel;
      *p_titleLabel = v5;

      objc_msgSend(*p_titleLabel, "setUserInteractionEnabled:", 0);
      _PXConfigurePhotoCollectionHeaderTitleLabel(*p_titleLabel, -[PXPhotosSectionHeaderView style](self, "style"));
      -[PXPhotosSectionHeaderView addSubview:](self, "addSubview:", *p_titleLabel);
    }
    if (-[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground")
      && -[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    objc_msgSend(*p_titleLabel, "setTextColor:", v7);

    titleLabel = *p_titleLabel;
    v10 = v12;
  }
  else
  {
    p_titleLabel = (id *)&self->_titleLabel;
    titleLabel = self->_titleLabel;
    v10 = 0;
  }
  objc_msgSend(titleLabel, "setText:", v10);
  objc_msgSend(*p_titleLabel, "setHidden:", v12 == 0);
  -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateDisclosureIcon
{
  _BOOL4 v3;
  UIImageView *disclosureIconView;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = -[PXPhotosSectionHeaderView allowsPhotosDetailsInteraction](self, "allowsPhotosDetailsInteraction");
  disclosureIconView = self->_disclosureIconView;
  if (v3)
  {
    if (!disclosureIconView)
    {
      _PXPhotoCollectionHeaderDisclosureIconForStyle(-[PXPhotosSectionHeaderView style](self, "style"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
        v7 = self->_disclosureIconView;
        self->_disclosureIconView = v6;

        -[PXPhotosSectionHeaderView addSubview:](self, "addSubview:", self->_disclosureIconView);
      }

      disclosureIconView = self->_disclosureIconView;
    }
    -[UIImageView setHidden:](disclosureIconView, "setHidden:", 0);
    -[PXPhotosSectionHeaderView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    if ((-[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground") || v9 == 2)
      && -[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    -[UIImageView setTintColor:](self->_disclosureIconView, "setTintColor:", v10);

  }
  else
  {
    -[UIImageView setHidden:](disclosureIconView, "setHidden:", 1);
  }
  -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLocationsLabelVisibility
{
  NSUInteger v4;
  UILabel **p_locationsLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *separatorLabel;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = -[NSArray count](self->_sectionLocations, "count");
  if (v4)
  {
    if (-[PXPhotosSectionHeaderView style](self, "style") == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderView.m"), 538, CFSTR("Invalid header style."));

    }
    p_locationsLabel = &self->_locationsLabel;
    if (!self->_locationsLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v7 = *p_locationsLabel;
      *p_locationsLabel = v6;

      -[PXPhotosSectionHeaderView addSubview:](self, "addSubview:", *p_locationsLabel);
      -[UILabel setUserInteractionEnabled:](*p_locationsLabel, "setUserInteractionEnabled:", 0);
      _PXConfigurePhotoCollectionHeaderLocationsLabel(*p_locationsLabel, -[PXPhotosSectionHeaderView style](self, "style"));
    }
    if (!self->_separatorLabel)
    {
      v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      separatorLabel = self->_separatorLabel;
      self->_separatorLabel = v8;

      -[PXPhotosSectionHeaderView addSubview:](self, "addSubview:", self->_separatorLabel);
      -[UILabel setUserInteractionEnabled:](self->_separatorLabel, "setUserInteractionEnabled:", 0);
      -[UILabel setText:](self->_separatorLabel, "setText:", CFSTR("·"));
      _PXConfigurePhotoCollectionHeaderLocationsLabel(self->_separatorLabel, -[PXPhotosSectionHeaderView style](self, "style"));
    }
    -[PXPhotosSectionHeaderView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");

    if ((-[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground") || v11 == 2)
      && -[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](*p_locationsLabel, "setTextColor:", v12);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](*p_locationsLabel, "setTextColor:", v14);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v13;
    -[UILabel setTextColor:](self->_separatorLabel, "setTextColor:", v13);

  }
  else
  {
    -[UILabel setText:](self->_locationsLabel, "setText:", 0);
    -[UILabel setHidden:](self->_locationsLabel, "setHidden:", 1);
    p_locationsLabel = &self->_separatorLabel;
  }
  -[UILabel setHidden:](*p_locationsLabel, "setHidden:", v4 == 0);
  -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateDateLabel
{
  UILabel *v4;
  UILabel *dateLabel;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_sectionStartDate && !-[PXPhotosSectionHeaderView _usingDateAsTitle](self, "_usingDateAsTitle"))
  {
    if (-[PXPhotosSectionHeaderView style](self, "style") == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderView.m"), 582, CFSTR("Invalid header style."));

    }
    if (!self->_dateLabel)
    {
      v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      dateLabel = self->_dateLabel;
      self->_dateLabel = v4;

      if (-[PXPhotosSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v6 = 0;
      else
        v6 = 2;
      -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", v6);
      -[UILabel setUserInteractionEnabled:](self->_dateLabel, "setUserInteractionEnabled:", 0);
      _PXConfigurePhotoCollectionHeaderDateLabel(self->_dateLabel, -[PXPhotosSectionHeaderView style](self, "style"));
      -[PXPhotosSectionHeaderView addSubview:](self, "addSubview:", self->_dateLabel);
    }
    -[PXPhotosSectionHeaderView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if ((-[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground") || v8 == 2)
      && -[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", v9);

    -[PXPhotosSectionHeaderView _dateRangeCompactFormatter](self, "_dateRangeCompactFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:toDate:", self->_sectionStartDate, self->_sectionEndDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setHidden:](self->_dateLabel, "setHidden:", 0);
    -[UILabel setText:](self->_dateLabel, "setText:", v12);

  }
  else
  {
    -[UILabel setText:](self->_dateLabel, "setText:", 0);
    -[UILabel setHidden:](self->_dateLabel, "setHidden:", 1);
  }
  -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateActionButton
{
  PXCuratedLibraryOverlayButton *v4;
  PXCuratedLibraryOverlayButton *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *actionButton;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  if (!self->_showsActionButton)
  {
    -[PXCuratedLibraryOverlayButton removeFromSuperview](self->_actionButton, "removeFromSuperview");
    actionButton = self->_actionButton;
    self->_actionButton = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (-[PXPhotosSectionHeaderView style](self, "style") == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionHeaderView.m"), 617, CFSTR("Invalid header style."));

  }
  if (!self->_actionButton)
  {
    v4 = objc_alloc_init(PXCuratedLibraryOverlayButton);
    v5 = self->_actionButton;
    self->_actionButton = v4;

    -[PXCuratedLibraryOverlayButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__handleActionButton_, 64);
    -[PXPhotosSectionHeaderView addSubview:](self, "addSubview:", self->_actionButton);
  }
  -[PXPhotosSectionHeaderView actionButtonTitle](self, "actionButtonTitle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[PXPhotosSectionHeaderView buttonSpec](self, "buttonSpec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PXPhotosSectionHeaderView actionButtonTitle](self, "actionButtonTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosSectionHeaderView buttonSpec](self, "buttonSpec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v9, v10);
      actionButton = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(actionButton, "setActionHandler:", &__block_literal_global_116558);
      -[PXPhotosSectionHeaderView traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceStyle");

      if ((-[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground") || v13 == 2)
        && -[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
      }
      else
      {
        -[PXPhotosSectionHeaderView tintColor](self, "tintColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 15;
      }
      objc_msgSend(actionButton, "setTintColor:", v14);

      objc_msgSend(actionButton, "setStyle:", v15);
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(actionButton, "setBackgroundColor:", v16);

      -[PXCuratedLibraryOverlayButton setUserData:](self->_actionButton, "setUserData:", actionButton);
      goto LABEL_15;
    }
  }
LABEL_16:
  -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  UIVisualEffectView *visualEffectView;
  void *v10;
  UIVisualEffectView *v11;
  UIVisualEffectView *v12;
  PXPhotosSectionHeaderView *v13;
  UIImageView *backgroundImageView;
  id v15;
  UIImageView *v16;
  UIImageView *v17;
  PXPhotosSectionHeaderView *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  UIVisualEffectView *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  v3 = a3;
  if (-[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle"))
    v5 = 0;
  else
    v5 = -[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground");
  if (-[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle") == 1)
  {
    -[PXPhotosSectionHeaderView backgroundImage](self, "backgroundImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = -[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  v8 = 552;
  visualEffectView = self->_visualEffectView;
  if (v5)
  {
    if (!visualEffectView)
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v10);
      v12 = self->_visualEffectView;
      self->_visualEffectView = v11;

      visualEffectView = self->_visualEffectView;
    }
    -[UIVisualEffectView superview](visualEffectView, "superview");
    v13 = (PXPhotosSectionHeaderView *)objc_claimAutoreleasedReturnValue();

    if (v13 != self)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke;
      v26[3] = &unk_1E5149198;
      v26[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v26);
    }
    -[UIVisualEffectView setHidden:](self->_visualEffectView, "setHidden:", 0);
    -[PXPhotosSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName");
  }
  else
  {
    -[UIVisualEffectView setHidden:](visualEffectView, "setHidden:", 1);
  }
  backgroundImageView = self->_backgroundImageView;
  if (v7)
  {
    if (!backgroundImageView)
    {
      v15 = objc_alloc(MEMORY[0x1E0DC3890]);
      v16 = (UIImageView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v17 = self->_backgroundImageView;
      self->_backgroundImageView = v16;

      backgroundImageView = self->_backgroundImageView;
    }
    -[UIImageView superview](backgroundImageView, "superview");
    v18 = (PXPhotosSectionHeaderView *)objc_claimAutoreleasedReturnValue();

    v19 = MEMORY[0x1E0C809B0];
    if (v18 != self)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_2;
      v25[3] = &unk_1E5149198;
      v25[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v25);
    }
    -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", 0);
    -[PXPhotosSectionHeaderView backgroundImage](self, "backgroundImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v20);

    if (v3)
    {
      -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:", 0.0);
      v24[0] = v19;
      v24[1] = 3221225472;
      v24[2] = __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_3;
      v24[3] = &unk_1E5149198;
      v24[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v24, 0.3);
    }
    else
    {
      -[PXPhotosSectionHeaderView backgroundImageAlpha](self, "backgroundImageAlpha");
      -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
    }
  }
  else
  {
    -[UIImageView setHidden:](backgroundImageView, "setHidden:", 1);
  }
  v21 = -[PXPhotosSectionHeaderView backgroundStyle](self, "backgroundStyle");
  switch(v21)
  {
    case 0uLL:
      goto LABEL_31;
    case 2uLL:
      -[UIVisualEffectView removeFromSuperview](self->_visualEffectView, "removeFromSuperview");
      v22 = self->_visualEffectView;
      self->_visualEffectView = 0;

LABEL_31:
      v8 = 560;
      goto LABEL_32;
    case 1uLL:
LABEL_32:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v8), "removeFromSuperview");
      v23 = *(Class *)((char *)&self->super.super.super.super.isa + v8);
      *(Class *)((char *)&self->super.super.super.super.isa + v8) = 0;

      break;
  }
}

- (void)_updateBackdropViewGroupName
{
  uint64_t v3;
  id v4;

  if (self->_inLayoutTransition || !-[PXPhotosSectionHeaderView wantsBackground](self, "wantsBackground"))
  {
    v3 = 0;
  }
  else
  {
    -[PXPhotosSectionHeaderView backdropViewGroupName](self, "backdropViewGroupName");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v3);

}

- (id)_dateRangeCompactFormatter
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)_dateRangeCompactFormatter_dateRangeFormatter;
  if (!_dateRangeCompactFormatter_dateRangeFormatter)
  {
    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_dateRangeCompactFormatter_dateRangeFormatter;
    _dateRangeCompactFormatter_dateRangeFormatter = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__dateRangeFormatterChanged_, *MEMORY[0x1E0D71D98], _dateRangeCompactFormatter_dateRangeFormatter);

    v3 = (void *)_dateRangeCompactFormatter_dateRangeFormatter;
  }
  return v3;
}

- (id)_dateRangeLongFormatter
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)_dateRangeLongFormatter_dateRangeFormatter;
  if (!_dateRangeLongFormatter_dateRangeFormatter)
  {
    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_dateRangeLongFormatter_dateRangeFormatter;
    _dateRangeLongFormatter_dateRangeFormatter = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__dateRangeFormatterChanged_, *MEMORY[0x1E0D71D98], _dateRangeLongFormatter_dateRangeFormatter);

    v3 = (void *)_dateRangeLongFormatter_dateRangeFormatter;
  }
  return v3;
}

- (id)_dateRangeYearFormatter
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)_dateRangeYearFormatter_yearDateFormatter;
  if (!_dateRangeYearFormatter_yearDateFormatter)
  {
    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 4);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_dateRangeYearFormatter_yearDateFormatter;
    _dateRangeYearFormatter_yearDateFormatter = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__dateRangeFormatterChanged_, *MEMORY[0x1E0D71D98], _dateRangeYearFormatter_yearDateFormatter);

    v3 = (void *)_dateRangeYearFormatter_yearDateFormatter;
  }
  return v3;
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  int64_t v4;
  void *v5;
  UILabel *titleLabel;
  void *v7;
  char v8;
  int v9;
  UILabel *dateLabel;
  void *v11;
  char v12;
  UILabel *locationsLabel;
  void *v14;
  char v15;
  UILabel *separatorLabel;
  void *v17;
  char v18;
  UIImageView **p_disclosureIconView;
  UIImageView *disclosureIconView;
  UIImageView *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;

  v4 = -[PXPhotosSectionHeaderView style](self, "style", a3);
  _PXPhotoCollectionHeaderTitleLabelFontForStyle(v4);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  _PXPhotoCollectionHeaderSubtitleFontForStyle(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  if (titleLabel
    && (-[UILabel font](titleLabel, "font"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v25),
        v7,
        (v8 & 1) == 0))
  {
    -[UILabel setFont:](self->_titleLabel, "setFont:", v25);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[UILabel font](dateLabel, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v5);

    if ((v12 & 1) == 0)
    {
      -[UILabel setFont:](self->_dateLabel, "setFont:", v5);
      v9 = 1;
    }
  }
  locationsLabel = self->_locationsLabel;
  if (locationsLabel)
  {
    -[UILabel font](locationsLabel, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v5);

    if ((v15 & 1) == 0)
    {
      -[UILabel setFont:](self->_locationsLabel, "setFont:", v5);
      v9 = 1;
    }
  }
  separatorLabel = self->_separatorLabel;
  if (separatorLabel)
  {
    -[UILabel font](separatorLabel, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", v5);

    if ((v18 & 1) == 0)
    {
      -[UILabel setFont:](self->_separatorLabel, "setFont:", v5);
      v9 = 1;
    }
  }
  if (!self->_actionButton)
  {
    p_disclosureIconView = &self->_disclosureIconView;
    disclosureIconView = self->_disclosureIconView;
    if (!disclosureIconView)
    {
      if (!v9)
        goto LABEL_21;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  -[PXPhotosSectionHeaderView _updateActionButton](self, "_updateActionButton");
  p_disclosureIconView = &self->_disclosureIconView;
  disclosureIconView = self->_disclosureIconView;
  if (disclosureIconView)
  {
LABEL_18:
    -[UIImageView removeFromSuperview](disclosureIconView, "removeFromSuperview");
    v21 = *p_disclosureIconView;
    *p_disclosureIconView = 0;

    -[PXPhotosSectionHeaderView _updateDisclosureIcon](self, "_updateDisclosureIcon");
  }
LABEL_19:
  -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  -[PXPhotosSectionHeaderView delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[PXPhotosSectionHeaderView delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "textSizeDidChangeForHeaderView:", self);

  }
LABEL_21:

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotosSectionHeaderView;
  v4 = a3;
  -[PXPhotosSectionHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  -[PXPhotosSectionHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7 && -[PXPhotosSectionHeaderView style](self, "style") != -1)
  {
    -[PXPhotosSectionHeaderView _updateDisclosureIcon](self, "_updateDisclosureIcon");
    -[PXPhotosSectionHeaderView _updateLocationsLabelVisibility](self, "_updateLocationsLabelVisibility");
    -[PXPhotosSectionHeaderView _updateDateLabel](self, "_updateDateLabel");
    -[PXPhotosSectionHeaderView _updateActionButton](self, "_updateActionButton");
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  _BOOL4 v6;

  objc_msgSend(a3, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotosSectionHeaderView allowLocationTapForTouch:](self, "allowLocationTapForTouch:", v5);

  if (v6)
    -[PXPhotosSectionHeaderView _setHighlightViewVisible:](self, "_setHighlightViewVisible:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  _BOOL4 v11;
  id WeakRetained;
  id v13;
  CGPoint v14;
  CGRect v15;

  v13 = a3;
  objc_msgSend(v13, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  v7 = v6;
  v9 = v8;

  -[PXPhotosSectionHeaderView bounds](self, "bounds");
  v14.x = v7;
  v14.y = v9;
  if (CGRectContainsPoint(v15, v14)
    && (objc_msgSend(v13, "anyObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[PXPhotosSectionHeaderView allowLocationTapForTouch:](self, "allowLocationTapForTouch:", v10),
        v10,
        v11))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didTapHeaderView:", self);

    -[PXPhotosSectionHeaderView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideHighlightView, 0, 1.0);
  }
  else
  {
    -[PXPhotosSectionHeaderView _hideHighlightView](self, "_hideHighlightView");
  }

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
  UIVisualEffectView *visualEffectView;
  double v12;
  double v13;
  double v14;
  double v15;

  -[PXPhotosSectionHeaderView _layoutSubviewsForCurentStyle](self, "_layoutSubviewsForCurentStyle");
  if (self->_highlightView)
  {
    -[PXPhotosSectionHeaderView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    visualEffectView = self->_visualEffectView;
    if (!visualEffectView || -[UIVisualEffectView isHidden](visualEffectView, "isHidden"))
    {
      -[PXPhotosSectionHeaderView highlightInsets](self, "highlightInsets");
      v4 = v4 + v12;
      v6 = v6 + v13;
      v8 = v8 - (v12 + v14);
      v10 = v10 - (v13 + v15);
    }
    -[UIView setFrame:](self->_highlightView, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)_layoutSubviewsForCurentStyle
{
  UILabel *locationsLabel;
  _BOOL4 v4;
  PXCuratedLibraryOverlayButton *actionButton;
  int v6;
  UIImageView *disclosureIconView;
  int v8;
  UILabel *dateLabel;
  int v10;
  int v11;
  int v12;
  int v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UILabel *v37;
  void *v38;
  double v39;
  double v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  CGFloat v56;
  double MaxX;
  double Width;
  UILabel *titleLabel;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  int v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat MinX;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  _BOOL4 v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  CGFloat v120;
  NSArray *sectionLocations;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  CGFloat v131;
  double v132;
  double v133;
  double v134;
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
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  CGFloat v166;
  double v167;
  CGFloat MaxY;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  CGFloat rect;
  double rect_16;
  double rect_24;
  double v190;
  double v191;
  id v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  CGFloat v199;
  double v200;
  double v201;
  _BOOL4 v202;
  CGFloat v203;
  double v204;
  CGFloat v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  _QWORD v216[6];
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;

  locationsLabel = self->_locationsLabel;
  v4 = locationsLabel
    && (-[UILabel isHidden](locationsLabel, "isHidden") & 1) == 0
    && -[NSArray count](self->_sectionLocations, "count") != 0;
  actionButton = self->_actionButton;
  if (actionButton)
    v6 = -[PXCuratedLibraryOverlayButton isHidden](actionButton, "isHidden") ^ 1;
  else
    v6 = 0;
  disclosureIconView = self->_disclosureIconView;
  if (disclosureIconView)
    v8 = -[UIImageView isHidden](disclosureIconView, "isHidden") ^ 1;
  else
    v8 = 0;
  dateLabel = self->_dateLabel;
  if (dateLabel)
    v10 = -[UILabel isHidden](dateLabel, "isHidden") ^ 1;
  else
    v10 = 0;
  v11 = objc_msgSend((id)objc_opt_class(), "_hasAccessibilityLargeText");
  v12 = v11;
  v202 = v4;
  if (v4)
    v13 = 1;
  else
    v13 = v10 | v11 & v6;
  -[PXPhotosSectionHeaderView _updateLabelsForTextStyle](self, "_updateLabelsForTextStyle");
  v14 = -[PXPhotosSectionHeaderView style](self, "style");
  -[PXPhotosSectionHeaderView contentInsets](self, "contentInsets");
  -[PXPhotosSectionHeaderView safeAreaInsets](self, "safeAreaInsets");
  UIEdgeInsetsMax();
  v214 = v15;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PXPhotosSectionHeaderView bounds](self, "bounds");
  v185 = v23;
  v186 = v22;
  v183 = v25;
  v184 = v24;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scale");

  -[PXPhotosSectionHeaderView bounds](self, "bounds");
  v175 = v28;
  v176 = v27;
  v173 = v30;
  v174 = v29;
  -[PXPhotosSectionHeaderView bounds](self, "bounds");
  v178 = v32;
  v179 = v31;
  v34 = v33;
  v172 = v35;
  -[PXPhotosSectionHeaderView backgroundImageOverhang](self, "backgroundImageOverhang");
  v171 = v36;
  -[UILabel font](self->_titleLabel, "font");
  v192 = (id)objc_claimAutoreleasedReturnValue();
  v37 = self->_dateLabel;
  v177 = v34;
  if (!v37)
    v37 = self->_locationsLabel;
  -[UILabel font](v37, "font");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 26.0;
  if (v14 == 1)
    v39 = 30.0;
  objc_msgSend(v192, "_scaledValueForValue:", v39);
  PXFloatRoundToPixel();
  v167 = v40;
  objc_msgSend(v38, "_scaledValueForValue:", 20.0);
  PXFloatRoundToPixel();
  v41 = (double *)MEMORY[0x1E0C9D648];
  v43 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v42 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v44 = v42;
  v213 = v43;
  if (v6)
  {
    -[PXCuratedLibraryOverlayButton sizeThatFits:](self->_actionButton, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v213 = v45;
  }
  v208 = v44;
  v47 = *v41;
  v46 = v41[1];
  v48 = v17 + v186;
  v49 = v214 + v185;
  v50 = v184 - (v17 + v21);
  v51 = v183 - (v214 + v19);
  v52 = v42;
  v211 = v43;
  if (v8)
  {
    -[UIImageView image](self->_disclosureIconView, "image");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "size");
    v43 = v54;
    v52 = v55;

    v49 = v214 + v185;
  }
  v180 = v52;
  v181 = v43;
  rect = v48;
  v217.origin.x = v48;
  v217.origin.y = v49;
  v194 = v50;
  v196 = v51;
  v217.size.width = v50;
  v56 = v49;
  v217.size.height = v51;
  MaxX = CGRectGetMaxX(v217);
  v218.origin.x = v47;
  v218.origin.y = v46;
  v218.size.width = v213;
  v218.size.height = v208;
  Width = CGRectGetWidth(v218);
  titleLabel = self->_titleLabel;
  v60 = 0.0;
  v215 = v46;
  v209 = v47;
  v210 = v42;
  if (titleLabel)
  {
    v61 = v42;
    v205 = v46;
    v207 = v211;
    v62 = v47;
    v182 = v46;
    if ((-[UILabel isHidden](titleLabel, "isHidden") & 1) == 0)
    {
      v63 = v56;
      if (v213 <= 0.0)
        v64 = 1;
      else
        v64 = v12;
      v65 = v213 + 16.0;
      v66 = 0.0;
      if (v64)
        v65 = 0.0;
      v67 = v194 - v65;
      if ((v8 & (v181 > 0.0)) != 0)
        v66 = v181 + 5.0;
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v67 - v66, v196);
      v69 = v68;
      v61 = v70;
      if (v13)
      {
        objc_msgSend(v192, "ascender");
        PXFloatRoundToPixel();
        v205 = v71;
      }
      else
      {
        -[PXPhotosSectionHeaderView bounds](self, "bounds");
        UIRectCenteredYInRect();
        v205 = v72;
        v69 = v73;
        v61 = v74;
      }
      v219.origin.x = rect;
      v219.origin.y = v63;
      v219.size.width = v194;
      v219.size.height = v196;
      MinX = CGRectGetMinX(v219);
      v62 = MinX;
      v182 = v46;
      v207 = v69;
      if (v8)
      {
        v76 = v205;
        v77 = v69;
        v78 = v61;
        v47 = CGRectGetMaxX(*(CGRect *)&MinX) + 5.0;
        -[UIImageView image](self->_disclosureIconView, "image");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "baselineOffsetFromBottom");
        v182 = v167 - v180 + v80;

      }
      v220.origin.x = v62;
      v220.origin.y = v205;
      v220.size.width = v69;
      v220.size.height = v61;
      v56 = v63;
      v60 = CGRectGetMaxY(v220) + 0.0;
    }
  }
  else
  {
    v61 = v42;
    v205 = v46;
    v207 = v211;
    v62 = v47;
    v182 = v46;
  }
  v193 = v62;
  v170 = v47;
  v81 = MaxX - Width;
  v191 = v61;
  if (!v6)
  {
    MaxY = v60;
    rect_16 = v81;
    v83 = v46;
    v82 = v205;
    goto LABEL_45;
  }
  if ((v12 & 1) != 0)
  {
    v221.origin.x = v62;
    v82 = v205;
    v221.size.width = v207;
    v221.origin.y = v205;
    v221.size.height = v61;
    v222.origin.x = CGRectGetMinX(v221);
    rect_16 = v222.origin.x;
    v222.origin.y = v60;
    v222.size.width = v213;
    v222.size.height = v208;
    v83 = v60;
    MaxY = CGRectGetMaxY(v222);
LABEL_45:
    v84 = v202;
    v85 = rect;
    v86 = v194;
    goto LABEL_49;
  }
  MaxY = v60;
  -[PXPhotosSectionHeaderView bounds](self, "bounds");
  UIRectCenteredYInRect();
  v87 = v56;
  v89 = v88;
  v199 = v90;
  v92 = v91;
  v94 = v93;
  v85 = rect;
  v223.origin.x = rect;
  v223.origin.y = v87;
  v223.size.width = v194;
  v223.size.height = v196;
  v95 = CGRectGetMaxX(v223);
  rect_16 = v89;
  v224.origin.x = v89;
  v56 = v87;
  v83 = v199;
  v224.origin.y = v199;
  v213 = v92;
  v224.size.width = v92;
  v208 = v94;
  v224.size.height = v94;
  v96 = CGRectGetMinX(v224);
  if (v95 >= v96)
    v95 = v96;
  v225.origin.x = rect;
  v225.origin.y = v56;
  v225.size.width = v194;
  v225.size.height = v196;
  v86 = v95 - CGRectGetMinX(v225);
  v82 = v205;
  v84 = v202;
LABEL_49:
  v200 = v83;
  if (v10)
  {
    -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", v86, v196);
    v99 = v98;
    if ((v12 & 1) != 0)
    {
      v100 = v97;
      v101 = MaxY;
    }
    else
    {
      objc_msgSend(v38, "ascender");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "scale");
      PXFloatRoundToPixel();
      v101 = v104;

      objc_msgSend(v38, "ascender");
      objc_msgSend(v38, "descender");
      PXFloatRoundToPixel();
      v100 = v105;
    }
    v226.origin.x = v209;
    v226.origin.y = v101;
    v226.size.width = v99;
    v226.size.height = v100;
    v102 = v101;
    MaxY = CGRectGetMaxY(v226);
  }
  else
  {
    v102 = v46;
    v100 = v210;
    v99 = v211;
  }
  v227.origin.x = v85;
  v227.origin.y = v56;
  v227.size.width = v86;
  v227.size.height = v196;
  v106 = CGRectGetMinX(v227);
  v169 = v99;
  v198 = v106;
  v201 = v102;
  if (v84)
  {
    -[UILabel font](self->_locationsLabel, "font");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0.0;
    v195 = v86;
    v166 = v100;
    if (((v12 | v10 ^ 1) & 1) != 0 || (v86 = v86 - v99, v99 <= 0.0))
    {
      v203 = v215;
      v115 = v210;
      v113 = v211;
    }
    else
    {
      v109 = v86 + -16.0;
      -[UILabel setHidden:](self->_separatorLabel, "setHidden:", 0);
      -[UILabel sizeThatFits:](self->_separatorLabel, "sizeThatFits:", v109, v196);
      v111 = v110;
      objc_msgSend(v107, "ascender");
      PXFloatRoundToPixel();
      v203 = v112;
      objc_msgSend(v107, "ascender");
      objc_msgSend(v107, "descender");
      v113 = v111;
      PXFloatRoundToPixel();
      v115 = v114;
      v86 = v109 - v111;
      v108 = 8.0;
    }
    v228.origin.x = v198;
    v228.origin.y = v102;
    v228.size.width = v99;
    v228.size.height = v166;
    v120 = CGRectGetMaxX(v228);
    sectionLocations = self->_sectionLocations;
    v117 = v108 + v120;
    v216[0] = MEMORY[0x1E0C809B0];
    v216[1] = 3221225472;
    v216[2] = __58__PXPhotosSectionHeaderView__layoutSubviewsForCurentStyle__block_invoke;
    v216[3] = &unk_1E5128890;
    v216[4] = self;
    -[NSArray px_localizedComposedStringThatFitsWidth:withMeasuringBlock:](sectionLocations, "px_localizedComposedStringThatFitsWidth:withMeasuringBlock:", v216, v86);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_locationsLabel, "setText:", v122);
    -[UILabel sizeThatFits:](self->_locationsLabel, "sizeThatFits:", v86, v196);
    v125 = v196;
    if (v86 >= v123)
      v126 = v123;
    else
      v126 = v86;
    rect_24 = v115;
    v190 = v113;
    if (v12)
    {
      v210 = v124;
      v127 = rect;
      v128 = v56;
      v129 = v195;
      v209 = CGRectGetMinX(*(CGRect *)(&v125 - 3));
      v82 = v205;
      v119 = v126;
      v100 = v166;
      v116 = v198;
      v118 = v203;
      v130 = MaxY;
    }
    else
    {
      objc_msgSend(v107, "ascender");
      PXFloatRoundToPixel();
      v131 = v115;
      v133 = v132;
      objc_msgSend(v107, "ascender");
      objc_msgSend(v107, "descender");
      PXFloatRoundToPixel();
      v210 = v134;
      v229.origin.x = v117;
      v118 = v203;
      v229.origin.y = v203;
      v229.size.width = v113;
      v229.size.height = v131;
      v209 = v108 + CGRectGetMaxX(v229);
      v82 = v205;
      v119 = v126;
      v130 = v133;
      v100 = v166;
      v116 = v198;
    }

    v215 = v130;
  }
  else
  {
    v116 = v106;
    -[UILabel setHidden:](self->_separatorLabel, "setHidden:", 0);
    v117 = v209;
    v118 = v215;
    v119 = v211;
    v190 = v211;
    rect_24 = v210;
  }
  v204 = v118;
  if (-[PXPhotosSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v193 = MEMORY[0x1A85CD2B8](v193, v82, v207, v191, v186, v185, v184, v183);
    v206 = v135;
    v207 = v136;
    v191 = v137;
    rect_16 = MEMORY[0x1A85CD2B8](rect_16, v200, v213, v208, v186, v185, v184, v183);
    v200 = v138;
    v213 = v139;
    v208 = v140;
    v209 = MEMORY[0x1A85CD2B8](v209, v215, v119, v210, v186, v185, v184, v183);
    v210 = v141;
    v215 = v142;
    v212 = v143;
    v197 = MEMORY[0x1A85CD2B8](v117, v118, v190, rect_24, v186, v185, v184, v183);
    v204 = v144;
    rect_24 = v146;
    v190 = v145;
    v198 = MEMORY[0x1A85CD2B8](v116, v201, v169, v100, v186, v185, v184, v183);
    v201 = v147;
    v149 = v148;
    v151 = v150;
    v82 = v206;
    v152 = MEMORY[0x1A85CD2B8](v170, v182, v181, v180, v186, v185, v184, v183);
    v154 = v153;
    v156 = v155;
    v158 = v157;
    v160 = v175;
    v159 = v176;
    v162 = v173;
    v161 = v174;
    v164 = v171;
    v163 = v172;
  }
  else
  {
    v160 = v175;
    v159 = v176;
    v162 = v173;
    v161 = v174;
    v164 = v171;
    v163 = v172;
    v158 = v180;
    v156 = v181;
    v212 = v119;
    v154 = v182;
    v197 = v117;
    v151 = v100;
    v149 = v169;
    v152 = v170;
  }
  v165 = v164 + v163;
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", v159, v160, v161, v162);
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v179, v178, v177, v165);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v193, v82, v207, v191);
  -[PXCuratedLibraryOverlayButton setFrame:](self->_actionButton, "setFrame:", rect_16, v200, v213, v208);
  -[UILabel setFrame:](self->_locationsLabel, "setFrame:", v209, v215, v212, v210);
  -[UILabel setFrame:](self->_separatorLabel, "setFrame:", v197, v204, v190, rect_24);
  -[UILabel setFrame:](self->_dateLabel, "setFrame:", v198, v201, v149, v151);
  -[UIImageView setFrame:](self->_disclosureIconView, "setFrame:", v152, v154, v156, v158);

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void)didEndDisplaying
{
  -[PXPhotosSectionHeaderView setBackdropViewGroupName:](self, "setBackdropViewGroupName:", 0);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderView;
  -[PXPhotosSectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  if (self->_visualEffectView)
    -[PXPhotosSectionHeaderView _updateBackdropViewGroupName](self, "_updateBackdropViewGroupName");
  self->_useYearOnlyForDefaultTitle = 0;
}

- (BOOL)allowLocationTapForTouch:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  BOOL v9;
  int v11;
  uint64_t v12;
  double MaxX;
  double v17;
  double v18;
  double v19;
  CGRect v20;

  v4 = a3;
  if (-[PXPhotosSectionHeaderView allowsPhotosDetailsInteraction](self, "allowsPhotosDetailsInteraction")
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0))
  {
    if ((-[PXCuratedLibraryOverlayButton isHidden](self->_actionButton, "isHidden") & 1) != 0
      || (-[PXCuratedLibraryOverlayButton frame](self->_actionButton, "frame"), CGRectIsEmpty(v20))
      || (objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory"),
          v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
          IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7),
          v7,
          IsAccessibilityCategory))
    {
      v9 = 1;
    }
    else
    {
      v11 = -[PXPhotosSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      -[PXCuratedLibraryOverlayButton frame](self->_actionButton, "frame");
      if (v11)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v12);
        v17 = 16.0;
      }
      else
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v12);
        v17 = -16.0;
      }
      v18 = MaxX + v17;
      objc_msgSend(v4, "locationInView:", self);
      if (v11)
        v9 = v19 >= v18;
      else
        v9 = v19 <= v18;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setHighlightViewVisible:(BOOL)a3
{
  if (self->_highlightViewVisible != a3)
  {
    self->_highlightViewVisible = a3;
    -[PXPhotosSectionHeaderView _updateHighlightView](self, "_updateHighlightView");
  }
}

- (void)_updateHighlightView
{
  _BOOL4 highlightViewVisible;
  UIView *highlightView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  UIView *v9;

  highlightViewVisible = self->_highlightViewVisible;
  highlightView = self->_highlightView;
  if (highlightViewVisible)
  {
    if (!highlightView)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v6 = self->_highlightView;
      self->_highlightView = v5;

      v7 = self->_highlightView;
      if (self->_visualEffectView)
      {
        -[PXPhotosSectionHeaderView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7);
      }
      else
      {
        -[PXPhotosSectionHeaderView addSubview:](self, "addSubview:", v7);
        -[PXPhotosSectionHeaderView sendSubviewToBack:](self, "sendSubviewToBack:", self->_highlightView);
      }
      -[UIView setAutoresizingMask:](self->_highlightView, "setAutoresizingMask:", 18);
      v9 = self->_highlightView;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.150000006);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v8);
      goto LABEL_9;
    }
  }
  else if (highlightView)
  {
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    v8 = self->_highlightView;
    self->_highlightView = 0;
LABEL_9:

  }
  -[PXPhotosSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_hideHighlightView
{
  -[PXPhotosSectionHeaderView _setHighlightViewVisible:](self, "_setHighlightViewVisible:", 0);
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (PXPhotosSectionHeaderViewDelegate)delegate
{
  return (PXPhotosSectionHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (double)backgroundImageOverhang
{
  return self->_backgroundImageOverhang;
}

- (double)backgroundImageAlpha
{
  return self->_backgroundImageAlpha;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)highlightInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_highlightInsets.top;
  left = self->_highlightInsets.left;
  bottom = self->_highlightInsets.bottom;
  right = self->_highlightInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (NSArray)sectionLocations
{
  return self->_sectionLocations;
}

- (NSDate)sectionStartDate
{
  return self->_sectionStartDate;
}

- (NSDate)sectionEndDate
{
  return self->_sectionEndDate;
}

- (BOOL)showsActionButton
{
  return self->_showsActionButton;
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)buttonSpec
{
  return self->_buttonSpec;
}

- (BOOL)allowsPhotosDetailsInteraction
{
  return self->_allowsPhotosDetailsInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonSpec, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_sectionEndDate, 0);
  objc_storeStrong((id *)&self->_sectionStartDate, 0);
  objc_storeStrong((id *)&self->_sectionLocations, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_disclosureIconView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_separatorLabel, 0);
  objc_storeStrong((id *)&self->_locationsLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

uint64_t __58__PXPhotosSectionHeaderView__layoutSubviewsForCurentStyle__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setText:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

uint64_t __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
  return objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
}

uint64_t __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560));
  return objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560));
}

uint64_t __55__PXPhotosSectionHeaderView__updateBackgroundAnimated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "backgroundImageAlpha");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:");
}

void __57__PXPhotosSectionHeaderView_setSectionStartDate_endDate___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 547) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 664), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 672), *(id *)(a1 + 48));
}

uint64_t __59__PXPhotosSectionHeaderView_setUseYearOnlyForDefaultTitle___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 576) = *(_BYTE *)(result + 40);
  return result;
}

void __45__PXPhotosSectionHeaderView_setSectionTitle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 547) = 1;
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 648);
  *(_QWORD *)(v3 + 648) = v2;

}

+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 1 || objc_msgSend(v3, "verticalSizeClass") == 1;

  return v4;
}

+ (BOOL)shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:(id)a3
{
  void *v4;
  id v5;
  NSString *v6;
  int v7;

  v4 = (void *)*MEMORY[0x1E0DC4730];
  v5 = a3;
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "shouldUsePhoneLayoutWithTraitCollection:", v5);

  if (v7)
    LOBYTE(v7) = UIContentSizeCategoryIsAccessibilityCategory(v6);

  return v7;
}

+ (BOOL)_hasAccessibilityLargeText
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:", v3);

  return (char)a1;
}

- (void)setClippingRect:(CGRect)a3
{
  id v5;

  if (!CGRectEqualToRect(a3, *MEMORY[0x1E0C9D5E0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumSectionHeaderLayoutProvider+iOS.m"), 440, CFSTR("Clipping isn't supported"));

  }
}

- (CGRect)clippingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D5E0];
  v3 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUserData:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlbumSectionHeaderLayoutProvider+iOS.m"), 448, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v18, v19);

    }
  }
  objc_getAssociatedObject(self, (const void *)UserDataAssociationKey_278811);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    objc_setAssociatedObject(self, (const void *)UserDataAssociationKey_278811, v5, (void *)3);
    objc_msgSend(v5, "weakLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView setDelegate:](self, "setDelegate:", v7);
    -[PXPhotosSectionHeaderView setStyle:](self, "setStyle:", objc_msgSend(v5, "headerStyle"));
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView setBackgroundStyle:](self, "setBackgroundStyle:", objc_msgSend(v8, "useGradientSectionHeaders"));

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__PXPhotosSectionHeaderView_PXGReusableView__setUserData___block_invoke;
    v20[3] = &unk_1E5148D08;
    v20[4] = self;
    v9 = v5;
    v21 = v9;
    -[PXPhotosSectionHeaderView performBatchUpdateOfDateDependentPropertiesWithBlock:](self, "performBatchUpdateOfDateDependentPropertiesWithBlock:", v20);
    objc_msgSend(v9, "locationNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView setSectionLocations:](self, "setSectionLocations:", v10);

    -[PXPhotosSectionHeaderView setContentInsets:](self, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
    -[PXPhotosSectionHeaderView setHighlightInsets:](self, "setHighlightInsets:", -7.5, 0.0, 2.0, 0.0);
    v11 = objc_msgSend(v9, "actionType") - 1;
    if (v11 > 3)
    {
      v12 = 0;
    }
    else
    {
      PXLocalizedStringFromTable(off_1E51443B8[v11], CFSTR("PhotosUICore"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PXPhotosSectionHeaderView setShowsActionButton:](self, "setShowsActionButton:", v12 != 0);
    -[PXPhotosSectionHeaderView setActionButtonTitle:](self, "setActionButtonTitle:", v12);
    -[PXPhotosSectionHeaderView setAllowsPhotosDetailsInteraction:](self, "setAllowsPhotosDetailsInteraction:", objc_msgSend(v9, "allowsPhotosDetailsInteraction"));
    objc_msgSend(v9, "backdropViewGroupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView setBackdropViewGroupName:](self, "setBackdropViewGroupName:", v13);

    objc_msgSend(v9, "gradientImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView setBackgroundImage:](self, "setBackgroundImage:", v14);

    objc_msgSend(v9, "gradientAlpha");
    -[PXPhotosSectionHeaderView setBackgroundImageAlpha:](self, "setBackgroundImageAlpha:");
    objc_msgSend(v9, "gradientOverhang");
    -[PXPhotosSectionHeaderView setBackgroundImageOverhang:](self, "setBackgroundImageOverhang:");
    objc_msgSend(v9, "buttonSpec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderView setButtonSpec:](self, "setButtonSpec:", v15);

    -[PXPhotosSectionHeaderView setBackgroundStyle:](self, "setBackgroundStyle:", objc_msgSend(v9, "backgroundStyle"));
    -[PXPhotosSectionHeaderView setWantsBackground:animated:](self, "setWantsBackground:animated:", objc_msgSend(v7, "wantsBackground"), objc_msgSend(v7, "scrollSpeedRegime") < 2);

  }
}

- (NSCopying)userData
{
  return (NSCopying *)objc_getAssociatedObject(self, (const void *)UserDataAssociationKey_278811);
}

void __58__PXPhotosSectionHeaderView_PXGReusableView__setUserData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSectionTitle:", v2);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSectionStartDate:endDate:", v5, v4);

}

@end
