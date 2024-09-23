@implementation UIInterfaceActionVisualStyle

- (UIInterfaceActionVisualStyle)init
{
  UIInterfaceActionConcreteVisualStyle *v3;
  UIInterfaceActionVisualStyle *v4;

  v3 = objc_alloc_init(UIInterfaceActionConcreteVisualStyle);
  v4 = -[UIInterfaceActionVisualStyle initWithConcreteVisualStyle:](self, "initWithConcreteVisualStyle:", v3);

  return v4;
}

- (UIInterfaceActionVisualStyle)initWithConcreteVisualStyle:(id)a3
{
  id v5;
  UIInterfaceActionVisualStyle *v6;
  UIInterfaceActionVisualStyle *v7;
  UIInterfaceActionOverrideVisualStyle *visualStyleOverride;
  UIInterfaceActionGroupViewState *v9;
  UIInterfaceActionGroupViewState *groupViewState;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIInterfaceActionVisualStyle;
  v6 = -[UIInterfaceActionVisualStyle init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_concreteVisualStyle, a3);
    visualStyleOverride = v7->_visualStyleOverride;
    v7->_visualStyleOverride = 0;

    v9 = objc_alloc_init(UIInterfaceActionGroupViewState);
    groupViewState = v7->_groupViewState;
    v7->_groupViewState = v9;

  }
  return v7;
}

- (NSString)description
{
  UIInterfaceActionOverrideVisualStyle *visualStyleOverride;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  visualStyleOverride = self->_visualStyleOverride;
  if (visualStyleOverride)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", overridesStyle = %@"), visualStyleOverride);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E16EDF20;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionVisualStyle;
  -[UIInterfaceActionVisualStyle description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ concreteStyle = %@%@"), v6, self->_concreteVisualStyle, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    -[UIInterfaceActionVisualStyle groupViewState](self, "groupViewState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupViewState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[UIInterfaceActionVisualStyle concreteVisualStyle](self, "concreteVisualStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "concreteVisualStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[UIInterfaceActionGroupViewState copy](self->_groupViewState, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[UIInterfaceActionConcreteVisualStyleImpl copy](self->_concreteVisualStyle, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[UIInterfaceActionOverrideVisualStyle copy](self->_visualStyleOverride, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (id)copyWithGroupViewState:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (_QWORD *)-[UIInterfaceActionVisualStyle copy](self, "copy");
  objc_msgSend(v4, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[UIInterfaceActionVisualStyle defaultScreen](self, "defaultScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "copyWithScreen:", v7);

    v4 = (id)v8;
  }
  v9 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (void)setVisualStyleOverride:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIInterfaceActionOverrideVisualStyle isEqual:](self->_visualStyleOverride, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_visualStyleOverride, a3);
    -[UIInterfaceActionVisualStyle setConcreteVisualStyle:](self->_visualStyleOverride, "setConcreteVisualStyle:", self->_concreteVisualStyle);
  }

}

- (void)setConcreteVisualStyle:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIInterfaceActionConcreteVisualStyleImpl isEqual:](self->_concreteVisualStyle, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_concreteVisualStyle, a3);
    -[UIInterfaceActionVisualStyle setConcreteVisualStyle:](self->_visualStyleOverride, "setConcreteVisualStyle:", self->_concreteVisualStyle);
  }

}

+ (id)idiomSpecificStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v6 == -1)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "userInterfaceIdiom");

  }
  v17[0] = &unk_1E1A963F0;
  v18[0] = objc_opt_class();
  v17[1] = &unk_1E1A96408;
  v18[1] = objc_opt_class();
  v17[2] = &unk_1E1A96420;
  v18[2] = objc_opt_class();
  v17[3] = &unk_1E1A96438;
  v18[3] = objc_opt_class();
  v17[4] = &unk_1E1A96450;
  v18[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", v9);

  if (!v10)
    v10 = (id)objc_opt_class();
  objc_msgSend(v10, "styleForTraitCollection:presentationStyle:", v5, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[UIInterfaceActionConcreteVisualStyleFactory_iOS styleForTraitCollection:presentationStyle:](UIInterfaceActionConcreteVisualStyleFactory_iOS, "styleForTraitCollection:presentationStyle:", v5, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConcreteVisualStyle:", v11);
  objc_msgSend(v12, "groupViewState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copyWithTraitCollection:", v5);
  v15 = (void *)v12[1];
  v12[1] = v14;

  return v12;
}

- (id)_base_actionPropertiesAffectingLabelStyling
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E16EFC20;
  v3[1] = 0x1E16EFB40;
  v3[2] = 0x1E16EFBA0;
  v3[3] = 0x1E16EFBE0;
  v3[4] = 0x1E16EFC00;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_base_configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_titleTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[UIInterfaceActionVisualStyle actionClassificationLabelColorForViewState:](self, "actionClassificationLabelColorForViewState:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    -[UIInterfaceActionVisualStyle actionClassificationLabelFontForViewState:](self, "actionClassificationLabelFontForViewState:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v15);

    objc_msgSend(v8, "_setTextColorFollowsTintColor:", 1);
    objc_msgSend(v8, "setTintColor:", v14);

  }
  if (v12)
  {
    v16 = v12;
  }
  else
  {
    -[UIInterfaceActionVisualStyle actionTitleLabelColorForViewState:](self, "actionTitleLabelColorForViewState:", v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  -[UIInterfaceActionVisualStyle actionTitleLabelFontForViewState:](self, "actionTitleLabelFontForViewState:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFont:", v18);

  objc_msgSend(v30, "_setTextColorFollowsTintColor:", 1);
  objc_msgSend(v30, "setTintColor:", v17);
  LODWORD(v19) = 1053609165;
  objc_msgSend(v30, "_setHyphenationFactor:", v19);
  -[UIInterfaceActionVisualStyle actionTitleLabelCompositingFilterForViewState:](self, "actionTitleLabelCompositingFilterForViewState:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCompositingFilter:", v20);

  objc_msgSend(v30, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAllowsGroupBlending:", v20 == 0);

  objc_msgSend(v30, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAllowsGroupOpacity:", v20 == 0);

  objc_msgSend(v30, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preferredContentSizeCategory");
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v27))
  {
    objc_msgSend(v30, "setMinimumScaleFactor:", 1.0);
    objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v30, "setNumberOfLines:", 0);
    v28 = 0;
    v29 = 0;
  }
  else if (v8)
  {
    objc_msgSend(v30, "setMinimumScaleFactor:", 1.0);
    objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 0);
    v28 = 0;
    v29 = 4;
  }
  else
  {
    v28 = 1;
    objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 1);
    -[UIInterfaceActionVisualStyle actionTitleLabelMinimumScaleFactor](self, "actionTitleLabelMinimumScaleFactor");
    objc_msgSend(v30, "setMinimumScaleFactor:");
    v29 = 5;
  }
  objc_msgSend(v30, "setBaselineAdjustment:", v28);
  objc_msgSend(v30, "setLineBreakMode:", v29);

}

- (id)_base_actionPropertiesAffectingImageViewStyling
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E16EFBC0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_base_configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionVisualStyle actionImageViewTintColorForImageProperty:actionViewState:](self, "actionImageViewTintColorForImageProperty:actionViewState:", v9, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_11;
  objc_msgSend(v10, "_titleTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[UIInterfaceActionVisualStyle actionTitleLabelColorForViewState:](self, "actionTitleLabelColorForViewState:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  objc_msgSend(v8, "action");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_imageTintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_imageTintColor");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v23, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 != v21)
    {
      v11 = v15;
      goto LABEL_10;
    }
    objc_msgSend(v23, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tintColor");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v19;

LABEL_10:
LABEL_11:
  objc_msgSend(v23, "setTintColor:", v11);
  if (objc_msgSend(v10, "isEnabled"))
    v22 = 1;
  else
    v22 = 2;
  if (objc_msgSend(v23, "tintAdjustmentMode") != v22)
    objc_msgSend(v23, "setTintAdjustmentMode:", v22);

}

- (id)_styleForVisualProperties
{
  void *visualStyleOverride;

  visualStyleOverride = self->_visualStyleOverride;
  if (!visualStyleOverride)
    visualStyleOverride = self->_concreteVisualStyle;
  return visualStyleOverride;
}

- (id)defaultScreen
{
  void *v2;
  void *v3;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)maximumActionGroupContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumActionGroupContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)minimumActionContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumActionContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)horizontalImageContentSpacing
{
  void *v2;
  double v3;
  double v4;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "horizontalImageContentSpacing");
  v4 = v3;

  return v4;
}

- (double)verticalImageContentSpacing
{
  void *v2;
  double v3;
  double v4;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verticalImageContentSpacing");
  v4 = v3;

  return v4;
}

- (BOOL)allowsZeroSizedSectionSeparators
{
  void *v2;
  char v3;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsZeroSizedSectionSeparators");

  return v3;
}

- (double)actionSectionSpacing
{
  void *v2;
  double v3;
  double v4;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSectionSpacing");
  v4 = v3;

  return v4;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSequenceEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)contentCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentCornerRadius");
  v4 = v3;

  return v4;
}

- (UIEdgeInsets)contentMargin
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentMargin");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)selectByPressGestureRequired
{
  void *v2;
  char v3;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectByPressGestureRequired");

  return v3;
}

- (BOOL)selectionFeedbackEnabled
{
  void *v2;
  char v3;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectionFeedbackEnabled");

  return v3;
}

- (BOOL)selectByIndirectPointerTouchRequired
{
  void *v2;
  char v3;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectByIndirectPointerTouchRequired");

  return v3;
}

- (double)actionTitleLabelMinimumScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionTitleLabelMinimumScaleFactor");
  v4 = v3;

  return v4;
}

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionViewStateForAttachingToActionRepresentationView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newGroupBackgroundViewWithGroupViewState:", v4);

  return v6;
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newActionSeparatorViewForGroupViewState:", v4);

  return v6;
}

- (id)newSectionSeparatorViewForGroupViewState:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  _UIInterfaceActionBlankSeparatorView *v14;
  _UIInterfaceActionBlankSeparatorView *v15;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSectionSpacing");
  v7 = v6;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsZeroSizedSectionSeparators");

  if (v9)
    v10 = v7 >= 0.0;
  else
    v10 = v7 > 0.0;
  if (v10)
  {
    -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "newSectionSeparatorViewForGroupViewState:", v4);
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = objc_alloc_init(_UIInterfaceActionBlankSeparatorView);
    v15 = v14;

    -[_UIInterfaceActionBlankSeparatorView setConstantAxisDimension:](v15, "setConstantAxisDimension:", v7);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newActionBackgroundViewForViewState:", v4);

  return v6;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  v4 = a3;
  -[UIInterfaceActionVisualStyle fontForViewStateBlock](self, "fontForViewStateBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIInterfaceActionVisualStyle fontForViewStateBlock](self, "fontForViewStateBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
  }
  else
  {
    -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionTitleLabelFontForViewState:", v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionTitleLabelColorForViewState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionTitleLabelCompositingFilterForViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionTitleLabelCompositingFilterForViewState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionClassificationLabelFontForViewState:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  v4 = a3;
  -[UIInterfaceActionVisualStyle fontForViewStateBlock](self, "fontForViewStateBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIInterfaceActionVisualStyle fontForViewStateBlock](self, "fontForViewStateBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
  }
  else
  {
    -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionClassificationLabelFontForViewState:", v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionClassificationLabelColorForViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionClassificationLabelColorForViewState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionImageViewTintColorForImageProperty:actionViewState:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)actionSpacingForGroupViewState:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSpacingForGroupViewState:", v4);
  v7 = v6;

  return v7;
}

- (void)configureForPresentingGroupView:(id)a3 alongsideTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureForPresentingGroupView:alongsideTransitionCoordinator:", v7, v6);

}

- (void)configureForDismissingGroupView:(id)a3 alongsideTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureForDismissingGroupView:alongsideTransitionCoordinator:", v7, v6);

}

- (id)actionGroupPropertiesAffectingActionsScrollViewStyling
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionPropertiesAffectingImageViewStyling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureAttributesForActionScrollView:groupViewState:", v7, v6);

}

- (id)actionPropertiesAffectingLabelStyling
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionPropertiesAffectingLabelStyling");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  -[UIInterfaceActionVisualStyle _base_actionPropertiesAffectingLabelStyling](self, "_base_actionPropertiesAffectingLabelStyling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIInterfaceActionVisualStyle _base_configureAttributesForTitleLabel:classificationLabel:actionViewState:](self, "_base_configureAttributesForTitleLabel:classificationLabel:actionViewState:", v10, v9, v8);
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureAttributesForTitleLabel:classificationLabel:actionViewState:", v10, v9, v8);

}

- (id)actionPropertiesAffectingImageViewStyling
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionPropertiesAffectingImageViewStyling");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  -[UIInterfaceActionVisualStyle _base_actionPropertiesAffectingImageViewStyling](self, "_base_actionPropertiesAffectingImageViewStyling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIInterfaceActionVisualStyle _base_configureAttributesForImageView:imageProperty:actionViewState:](self, "_base_configureAttributesForImageView:imageProperty:actionViewState:", v10, v9, v8);
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureAttributesForImageView:imageProperty:actionViewState:", v10, v9, v8);

}

- (id)actionPropertiesAffectingActionRepresentationViewStyling
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionPropertiesAffectingActionRepresentationViewStyling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)configureAttributesForActionRepresentationView:(id)a3 actionViewState:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIInterfaceActionVisualStyle _styleForVisualProperties](self, "_styleForVisualProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureAttributesForActionRepresentationView:actionViewState:", v7, v6);

}

- (UIInterfaceActionGroupViewState)groupViewState
{
  return self->_groupViewState;
}

- (UIInterfaceActionConcreteVisualStyleImpl)concreteVisualStyle
{
  return self->_concreteVisualStyle;
}

- (id)fontForViewStateBlock
{
  return self->_fontForViewStateBlock;
}

- (void)setFontForViewStateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIInterfaceActionOverrideVisualStyle)visualStyleOverride
{
  return self->_visualStyleOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyleOverride, 0);
  objc_storeStrong(&self->_fontForViewStateBlock, 0);
  objc_storeStrong((id *)&self->_concreteVisualStyle, 0);
  objc_storeStrong((id *)&self->_groupViewState, 0);
}

- (id)defaultConcreteActionTitleLabelRegularFont
{
  void *v3;
  void *v4;

  +[UIInterfaceActionViewState viewStateRepresentingDefaultAction](UIInterfaceActionViewState, "viewStateRepresentingDefaultAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionConcreteVisualStyleImpl actionTitleLabelFontForViewState:](self->_concreteVisualStyle, "actionTitleLabelFontForViewState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultConcreteActionTitleLabelPreferredFont
{
  void *v3;
  void *v4;

  +[UIInterfaceActionViewState viewStateRepresentingPreferredAction](UIInterfaceActionViewState, "viewStateRepresentingPreferredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionConcreteVisualStyleImpl actionTitleLabelFontForViewState:](self->_concreteVisualStyle, "actionTitleLabelFontForViewState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
