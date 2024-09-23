@implementation NCNotificationListBaseContentView

- (NCNotificationListBaseContentView)initWithFrame:(CGRect)a3
{
  NCNotificationListBaseContentView *v3;
  NCNotificationListBaseContentView *v4;
  void *v5;
  uint64_t v6;
  NSString *preferredContentSizeCategory;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListBaseContentView;
  v3 = -[NCNotificationListBaseContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_adjustsFontForContentSizeCategory = 1;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    preferredContentSizeCategory = v4->_preferredContentSizeCategory;
    v4->_preferredContentSizeCategory = (NSString *)v6;

    -[NCNotificationListBaseContentView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (void)didMoveToWindow
{
  void *v3;

  -[NCNotificationListBaseContentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[NCNotificationListBaseContentView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;

  -[NCNotificationListBaseContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    -[NCNotificationListBaseContentView _updateTextAttributes](self, "_updateTextAttributes");
    -[NCNotificationListBaseContentView setNeedsLayout](self, "setNeedsLayout");
  }

  return v5 != NSOrderedSame;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  MTVisualStylingProvider *strokeVisualStylingProvider;
  objc_super v5;

  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
    return strokeVisualStylingProvider;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationListBaseContentView;
  -[NCNotificationListBaseContentView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FE20;
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

    -[NCNotificationListBaseContentView _visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "_visualStylingProviderDidChange:forCategory:outgoingProvider:", self->_strokeVisualStylingProvider, a4, v10);
    v6 = v11;
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

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v12, "image");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isSymbolImage"))
    v13 = v11;
  else
    v13 = 0;
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v12, a4, v13, v10);

}

- (unint64_t)_numberOfLinesForLabel:(id)a3 maximumNumberOfLines:(unint64_t)a4 inFrame:(CGRect)a5
{
  return objc_msgSend(a3, "unui_numberOfLinesInFrame:maximum:drawingContext:", a4, self->_drawingContext, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)_updateTextAttributesForLabel:(id)a3 withTextStyle:(id)a4 fontWeight:(double)a5 additionalTraits:(unsigned int)a6 maximumNumberOfLines:(unint64_t)a7
{
  id v11;
  void *v12;

  if (a3)
  {
    v11 = a3;
    -[NCNotificationListBaseContentView _preferredFont:textStyle:weight:additionalTraits:](self, "_preferredFont:textStyle:weight:additionalTraits:", 1, a4, 0, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(v11, "setNumberOfLines:", a7);
    -[NCNotificationListBaseContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
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

- (double)_sizeMeasuringHeightForLabel:(id)a3 withNumberOfLines:(unint64_t)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a3;
  objc_msgSend(v5, "unui_measuringHeightWithNumberOfLines:", a4);
  v7 = v6;
  objc_msgSend(v5, "unui_drawingHeightWithNumberOfLines:", a4);
  v9 = v8;

  return v7 + (v9 - v7) * 0.5;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
}

@end
