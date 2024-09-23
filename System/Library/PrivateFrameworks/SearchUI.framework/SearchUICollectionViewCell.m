@implementation SearchUICollectionViewCell

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t *v35;
  void *v36;
  void *v37;
  int v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  int64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  int v50;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell tlk_updateForAppearance:](&v51, sel_tlk_updateForAppearance_, v4);
  v5 = -[SearchUICollectionViewCell sectionBackgroundStyle](self, "sectionBackgroundStyle");
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionType");

  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fillsBackgroundWithContent");

  if (v5 != 5)
  {
    v50 = v9;
    -[SearchUICollectionViewCell rowModel](self, "rowModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SearchUICollectionViewCell sectionBackgroundStyle](self, "sectionBackgroundStyle");
    v19 = v18;
    v23 = ((unint64_t)(v5 - 1) < 2 || v18 == 3 || v17 != 0) && v5 != 4;
    -[SearchUICollectionViewCell backgroundPlatterView](self, "backgroundPlatterView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setColor:", v17);

    objc_msgSend(v16, "backgroundImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell backgroundPlatterView](self, "backgroundPlatterView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundImage:", v25);

    if (v23)
      -[SearchUICollectionViewCell backgroundPlatterView](self, "backgroundPlatterView");
    else
      -[SearchUICollectionViewCell dummyBackgroundView](self, "dummyBackgroundView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell setBackgroundView:](self, "setBackgroundView:", v30);

    if (v5 == 2)
      v31 = 0.0;
    else
      v31 = 1.0;
    -[SearchUICollectionViewCell backgroundView](self, "backgroundView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAlpha:", v31);

    objc_msgSend(v16, "cardSection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = TLKSnippetModernizationEnabled();

      if (v34)
      {
        v35 = &SearchUIHeroCardSectionViewCornerRadiusForLeadingTrailingView;
        if (v7 != 3)
          v35 = &SearchUIHeroCardSectionViewCornerRadius;
        v15 = *(double *)v35;
        goto LABEL_44;
      }
    }
    else
    {

    }
    objc_msgSend(v16, "identifyingResult");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.other:show_more"));

    if (v38)
    {
      if (objc_msgSend(MEMORY[0x1E0DBDA48], "isLargePhone"))
        v39 = 13.5;
      else
        v39 = 12.2778;
      v40 = (void *)MEMORY[0x1E0DBD9B0];
      -[SearchUICollectionViewCell contentView](self, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "deviceScaledRoundedValue:forView:", v41, v39);
      v15 = v42;

      goto LABEL_44;
    }
    if (v19 == 3)
    {
      +[SearchUIAutoLayout roundedItemCornerRadius](SearchUIAutoLayout, "roundedItemCornerRadius");
    }
    else
    {
      if (((v23 | v50) & 1) == 0)
      {
        -[SearchUICollectionViewCell rowModel](self, "rowModel");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v44, "hasCustomCornerRounding") & 1) == 0)
        {

          v15 = 0.0;
          goto LABEL_44;
        }
        v45 = -[SearchUICollectionViewCell sectionBackgroundStyle](self, "sectionBackgroundStyle");

        v15 = 0.0;
        if (v45 != 4)
        {
LABEL_44:

          goto LABEL_45;
        }
      }
      +[SearchUIAutoLayout sectionCornerRadius](SearchUIAutoLayout, "sectionCornerRadius");
    }
    v15 = v43;
    goto LABEL_44;
  }
  -[SearchUICollectionViewCell dummyBackgroundView](self, "dummyBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell setBackgroundView:](self, "setBackgroundView:", v10);

  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v7 == 3)
  {
    +[SearchUIAutoLayout sectionCornerRadius](SearchUIAutoLayout, "sectionCornerRadius");
    v15 = v14;
  }
  else
  {
    -[SearchUICollectionViewCell rowModel](self, "rowModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cardSection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & (v7 == 1)) != 0)
      v15 = 15.0;
    else
      v15 = 4.0;
  }
LABEL_45:
  -[SearchUICollectionViewCell updateCornerRadius:](self, "updateCornerRadius:", v15);
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v46, "hasCustomCornerRounding") & 1) != 0)
  {
    -[SearchUICollectionViewCell rowModel](self, "rowModel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell setMaskedCorners:](self, "setMaskedCorners:", objc_msgSend(v47, "cornerMask"));

  }
  else
  {
    -[SearchUICollectionViewCell setMaskedCorners:](self, "setMaskedCorners:", SearchUIDefaultCornerMask);
  }

  -[SearchUICollectionViewCell traitCollection](self, "traitCollection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "userInterfaceIdiom");

  if (v49 == 3)
    -[SearchUICollectionViewCell setMaskedCorners:](self, "setMaskedCorners:", SearchUIDefaultCornerMask);
  -[SearchUICollectionViewCell updateFocusStyleWithAppearance:](self, "updateFocusStyleWithAppearance:", v4);

}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (SearchUIBackgroundColorView)backgroundPlatterView
{
  SearchUIBackgroundColorView *backgroundPlatterView;
  SearchUIBackgroundColorView *v4;
  SearchUIBackgroundColorView *v5;

  backgroundPlatterView = self->_backgroundPlatterView;
  if (!backgroundPlatterView)
  {
    v4 = (SearchUIBackgroundColorView *)objc_opt_new();
    -[SearchUIBackgroundColorView setDelegate:](v4, "setDelegate:", self);
    v5 = self->_backgroundPlatterView;
    self->_backgroundPlatterView = v4;

    backgroundPlatterView = self->_backgroundPlatterView;
  }
  return backgroundPlatterView;
}

- (void)updateCornerMasks
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;

  v3 = -[SearchUICollectionViewCell maskedCorners](self, "maskedCorners");
  -[SearchUICollectionViewCell layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", v3);

  v5 = -[SearchUICollectionViewCell maskedCorners](self, "maskedCorners");
  -[SearchUICollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", v5);

  v8 = -[SearchUICollectionViewCell maskedCorners](self, "maskedCorners");
  -[SearchUICollectionViewCell backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaskedCorners:", v8);

  v11 = -[SearchUICollectionViewCell maskedCorners](self, "maskedCorners");
  -[SearchUICollectionViewCell dummyBackgroundView](self, "dummyBackgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaskedCorners:", v11);

  v14 = -[SearchUICollectionViewCell maskedCorners](self, "maskedCorners");
  -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMaskedCorners:", v14);

  v17 = -[SearchUICollectionViewCell maskedCorners](self, "maskedCorners");
  -[SearchUICollectionViewCell backgroundPlatterView](self, "backgroundPlatterView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMaskedCorners:", v17);

}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (UIView)dummyBackgroundView
{
  UIView *dummyBackgroundView;
  UIView *v4;
  UIView *v5;

  dummyBackgroundView = self->_dummyBackgroundView;
  if (!dummyBackgroundView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_dummyBackgroundView;
    self->_dummyBackgroundView = v4;

    dummyBackgroundView = self->_dummyBackgroundView;
  }
  return dummyBackgroundView;
}

- (int64_t)sectionBackgroundStyle
{
  return self->_sectionBackgroundStyle;
}

- (void)updateFocusStyleWithAppearance:(id)a3
{
  void *v4;
  double v5;
  double x;
  double v7;
  double y;
  double v9;
  double width;
  double v11;
  double height;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  SearchUICollectionViewCell *v17;
  SearchUICollectionViewCell *v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  int v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  id v65;
  CGRect v66;
  CGRect v67;

  v65 = a3;
  -[SearchUICollectionViewCell backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  x = v5;
  y = v7;
  width = v9;
  height = v11;

  switch(-[SearchUICollectionViewCell resolvedFocusStyle](self, "resolvedFocusStyle"))
  {
    case 3:
      +[SearchUIFocusStyleUtilities secondaryHaloProminence](SearchUIFocusStyleUtilities, "secondaryHaloProminence");
      +[SearchUIAutoLayout selectionBorderWidth](SearchUIAutoLayout, "selectionBorderWidth");
      v14 = v13;
      -[SearchUICollectionViewCell highlightReferenceView](self, "highlightReferenceView");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (SearchUICollectionViewCell *)v15;
      else
        v17 = self;
      v18 = v17;

      if (-[SearchUICollectionViewCell highlightFrameMatchesHighlightView](self, "highlightFrameMatchesHighlightView"))
      {
        -[SearchUICollectionViewCell bounds](v18, "bounds");
        -[SearchUICollectionViewCell convertRect:toView:](v18, "convertRect:toView:", self);
      }
      else
      {
        -[SearchUICollectionViewCell highlightFrame](self, "highlightFrame");
      }
      v33 = v19;
      v34 = v20;
      v35 = v21;
      v36 = v22;
      if (CGRectEqualToRect(*(CGRect *)&v19, *MEMORY[0x1E0C9D648]))
      {
        -[SearchUICollectionViewCell bounds](self, "bounds");
        v33 = v37;
        v34 = v38;
        v35 = v39;
        v36 = v40;
      }
      v66.origin.x = v33;
      v66.origin.y = v34;
      v66.size.width = v35;
      v66.size.height = v36;
      v67 = CGRectInset(v66, -v14, -v14);
      x = v67.origin.x;
      y = v67.origin.y;
      width = v67.size.width;
      height = v67.size.height;
      -[SearchUICollectionViewCell highlightFrameCornerRadius](self, "highlightFrameCornerRadius");
      v42 = v41;
      -[SearchUICollectionViewCell layer](v18, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "cornerRadius");
      v45 = v44;

      if (v42 >= v45)
        v46 = v42;
      else
        v46 = v45;
      v47 = v14 + v46;
      -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "layer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setCornerRadius:", v47);

      -[SearchUICollectionViewCell layer](v18, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "cornerCurve");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setCornerCurve:", v51);

      -[SearchUICollectionViewCell layer](v18, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "maskedCorners");
      -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setMaskedCorners:", v55);

      v24 = 0;
      v23 = 1;
      break;
    case 4:
      -[SearchUICollectionViewCell rowModel](self, "rowModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v25, "isTappable") ^ 1;

      if (height * 0.5 <= 36.0)
        v26 = height * 0.5;
      else
        v26 = 36.0;
      -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_setContinuousCornerRadius:", v26);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.921568627, 1.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBackgroundColor:", v28);

      -[SearchUICollectionViewCell setMaskedCorners:](self, "setMaskedCorners:", SearchUIDefaultCornerMask);
      if (-[SearchUICollectionViewCell isSelected](self, "isSelected")
        && (-[SearchUICollectionViewCell rowModel](self, "rowModel"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            v31 = objc_msgSend(v30, "isTappable"),
            v30,
            v31))
      {
        objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithVibrancyEnabled:isDark:", objc_msgSend(v65, "isVibrant"), 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "overrideAppearanceForView:", self);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DBD910], "disableAppearanceOverrideForView:", self);
      }
      goto LABEL_17;
    case 5:
    case 6:
      goto LABEL_8;
    case 7:
      -[SearchUICollectionViewCell animateFocusScaleDownEffectIsHighlighted:isSelected:appearance:](self, "animateFocusScaleDownEffectIsHighlighted:isSelected:appearance:", -[SearchUICollectionViewCell isHighlighted](self, "isHighlighted"), -[SearchUICollectionViewCell isSelected](self, "isSelected"), v65);
LABEL_8:
      v23 = 0;
      v24 = 1;
      break;
    default:
      v24 = 0;
LABEL_17:
      v23 = 0;
      break;
  }
  -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setFrame:", x, y, width, height);

  -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setHidden:", v24);

  v60 = +[SearchUIFocusStyleUtilities secondaryHaloProminence](SearchUIFocusStyleUtilities, "secondaryHaloProminence");
  -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setProminence:", v60);

  v62 = 0.0;
  if (v23)
  {
    +[SearchUIAutoLayout selectionBorderWidth](SearchUIAutoLayout, "selectionBorderWidth");
    v62 = v63;
  }
  -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setBorderWidth:", v62);

}

- (int64_t)resolvedFocusStyle
{
  return self->_resolvedFocusStyle;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
  -[SearchUICollectionViewCell updateCornerMasks](self, "updateCornerMasks");
}

- (void)updateCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  -[SearchUICollectionViewCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  -[SearchUICollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", a3);

  -[SearchUICollectionViewCell backgroundPlatterView](self, "backgroundPlatterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContinuousCornerRadius:", a3);

  -[SearchUICollectionViewCell dummyBackgroundView](self, "dummyBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", a3);

  -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "borderWidth");
  v10 = v9 + a3;
  -[SearchUICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setContinuousCornerRadius:", v10);

  -[SearchUICollectionViewCell updateCornerMasks](self, "updateCornerMasks");
}

- (BOOL)_appliesLayoutAttributesMaskingToReusableView
{
  void *v2;
  void *v3;
  char isKindOfClass;

  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  int v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "isForcingHeight");
  objc_msgSend(v4, "frame");
  v8.receiver = self;
  v8.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell preferredLayoutAttributesFittingAttributes:](&v8, sel_preferredLayoutAttributesFittingAttributes_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v6, "frame");
    objc_msgSend(v6, "setFrame:");
  }
  return v6;
}

- (void)applyLayoutAttributes:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell applyLayoutAttributes:](&v5, sel_applyLayoutAttributes_, a3);
  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell updateFocusStyleWithAppearance:](self, "updateFocusStyleWithAppearance:", v4);

}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (SearchUICollectionViewCell)initWithFrame:(CGRect)a3
{
  SearchUICollectionViewCell *v3;
  SearchUICollectionViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUICollectionViewCell;
  v3 = -[SearchUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SearchUICollectionViewCell layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    v6 = (void *)objc_opt_new();
    -[SearchUICollectionViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v6);

    -[SearchUICollectionViewCell setMaskedCorners:](v4, "setMaskedCorners:", SearchUIDefaultCornerMask);
    -[SearchUICollectionViewCell setSearchui_focusStyle:](v4, "setSearchui_focusStyle:", 0);
  }
  return v4;
}

- (void)setSearchui_focusStyle:(int64_t)a3
{
  int64_t v5;

  v5 = -[SearchUICollectionViewCell resolvedFocusStyle](self, "resolvedFocusStyle");
  if (!a3 || v5 != a3)
  {
    if (!a3)
      a3 = +[SearchUIFocusStyleUtilities bestFocusStyleForCell:](SearchUIFocusStyleUtilities, "bestFocusStyleForCell:", self);
    -[SearchUICollectionViewCell setResolvedFocusStyle:](self, "setResolvedFocusStyle:", a3);
    -[SearchUICollectionViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setResolvedFocusStyle:(int64_t)a3
{
  self->_resolvedFocusStyle = a3;
}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[5];

  v8 = a3;
  -[SearchUICollectionViewCell dragSource](self, "dragSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SearchUICollectionViewCell dragSource](self, "dragSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDragObject:", v8);
  }
  else
  {
    -[SearchUICollectionViewCell delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIDragSource dragSourceForView:dragObject:feedbackDelegate:](SearchUIDragSource, "dragSourceForView:dragObject:feedbackDelegate:", self, v8, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell setDragSource:](self, "setDragSource:", v6);

  }
  -[SearchUICollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", 0);
  -[SearchUICollectionViewCell setRowModel:](self, "setRowModel:", v8);
  -[SearchUICollectionViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SearchUICollectionViewCell_updateWithRowModel___block_invoke;
  block[3] = &unk_1EA1F62F0;
  block[4] = self;
  if (updateWithRowModel__onceToken != -1)
    dispatch_once(&updateWithRowModel__onceToken, block);
  if (updateWithRowModel__safeToUpdateMasking)
  {
    -[SearchUICollectionViewCell _layoutAttributes](self, "_layoutAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell _updateMaskingUsingAttributes:](self, "_updateMaskingUsingAttributes:", v7);

  }
  -[SearchUICollectionViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");

}

- (void)setSfSeparatorStyle:(int)a3
{
  self->_sfSeparatorStyle = a3;
}

- (void)setSectionBackgroundStyle:(int64_t)a3
{
  if (self->_sectionBackgroundStyle != a3)
  {
    self->_sectionBackgroundStyle = a3;
    -[SearchUICollectionViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setRowModel:(id)a3
{
  objc_storeStrong((id *)&self->_rowModel, a3);
}

- (void)setDragSource:(id)a3
{
  objc_storeStrong((id *)&self->_dragSource, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[SearchUICollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SearchUICollectionViewCell sizingView](self, "sizingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[SearchUICollectionViewCell bounds](self, "bounds");
  -[CALayer setFrame:](self->_linkLayer, "setFrame:");
}

- (UIView)sizingView
{
  return self->_sizingView;
}

- (SearchUIDragSource)dragSource
{
  return self->_dragSource;
}

- (SearchUIFeedbackDelegateInternal)delegate
{
  return (SearchUIFeedbackDelegateInternal *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUICollectionViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (UIViewController)embeddedViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 944, 1);
}

uint64_t __49__SearchUICollectionViewCell_updateWithRowModel___block_invoke()
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = objc_opt_respondsToSelector();
  else
    result = 0;
  updateWithRowModel__safeToUpdateMasking = result & 1;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[SearchUICollectionViewCell useSystemSizing](self, "useSystemSizing"))
  {
    v20.receiver = self;
    v20.super_class = (Class)SearchUICollectionViewCell;
    *(float *)&v10 = a4;
    *(float *)&v11 = a5;
    -[SearchUICollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
    width = v13;
  }
  else
  {
    -[SearchUICollectionViewCell sizingView](self, "sizingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4 == 1000.0)
    {
      objc_msgSend(v14, "effectiveLayoutSizeFittingSize:", width, 0.0);
    }
    else
    {
      objc_msgSend(v14, "effectiveLayoutSizeFittingSize:", 1000.0, 1000.0);
      width = v17;
    }
    v18 = v16;

    if (v18 == 0.0)
      v12 = 1.0;
    else
      v12 = v18;
  }
  v19 = width;
  result.height = v12;
  result.width = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUICollectionViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUICollectionViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUICollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell setHighlighted:](&v5, sel_setHighlighted_, a3);
  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell updateFocusStyleWithAppearance:](self, "updateFocusStyleWithAppearance:", v4);

}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell setSelected:](&v5, sel_setSelected_, a3);
  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell updateFocusStyleWithAppearance:](self, "updateFocusStyleWithAppearance:", v4);

}

- (void)animateFocusScaleDownEffectIsHighlighted:(BOOL)a3 isSelected:(BOOL)a4 appearance:(id)a5
{
  _BOOL4 v5;
  int v6;
  id v8;
  uint64_t v9;
  void *v10;
  SearchUICollectionViewCell *v11;
  SearchUICollectionViewCell *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  SearchUICollectionViewCell *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char isKindOfClass;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  SearchUICollectionViewCell *v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  _QWORD v72[5];
  char v73;
  _QWORD v74[5];
  char v75;
  CGAffineTransform v76;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[SearchUICollectionViewCell highlightReferenceView](self, "highlightReferenceView");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (SearchUICollectionViewCell *)v9;
  else
    v11 = self;
  v12 = v11;

  v13 = v6 | v5;
  if ((v6 | v5) == 1)
  {
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)objc_opt_new();
      -[SearchUICollectionViewCell setSelectedOverlayView:](self, "setSelectedOverlayView:", v15);

      -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidden:", 1);

    }
  }
  if (v12)
    -[SearchUICollectionViewCell transform](v12, "transform");
  else
    memset(&v76, 0, sizeof(v76));
  v17 = CGAffineTransformIsIdentity(&v76) ^ v6;
  -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13 ^ objc_msgSend(v19, "isHidden");

  }
  else
  {
    v20 = v13 ^ 1;
  }

  if ((v17 & v20 & 1) == 0)
  {
    v67 = v8;
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "superview");
    v22 = (SearchUICollectionViewCell *)objc_claimAutoreleasedReturnValue();

    if (v22 != v12)
    {
      -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeFromSuperview");

      -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewCell addSubview:](v12, "addSubview:", v24);

    }
    -[SearchUICollectionViewCell bounds](v12, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    -[SearchUICollectionViewCell layer](v12, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "cornerRadius");
    v36 = v35;
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setCornerRadius:", v36);

    -[SearchUICollectionViewCell layer](v12, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "cornerCurve");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerCurve:", v40);

    -[SearchUICollectionViewCell layer](v12, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "maskedCorners");
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layer");
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v46, "setMaskedCorners:", v44);

    objc_msgSend(v67, "colorForProminence:", 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell rowModel](self, "rowModel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "cardSection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v46) = objc_opt_isKindOfClass();

    if ((v46 & 1) != 0)
    {
      -[SearchUICollectionViewCell rowModel](self, "rowModel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "cardSection");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v51, "useAppIconMetrics"))
      {
        objc_msgSend(v51, "thumbnail");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "colorWithAlphaComponent:", 0.25);
          v55 = objc_claimAutoreleasedReturnValue();

          v47 = (void *)v55;
        }
      }

    }
    v8 = v67;
    -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setBackgroundColor:", v47);

    if (v13)
    {
      -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isHidden");

      if (v58)
      {
        -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setHidden:", 0);

        -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setAlpha:", 0.0);

        -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewCell bringSubviewToFront:](self, "bringSubviewToFront:", v61);

      }
    }
    v62 = 0.25;
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithDuration:bounce:", 0.25, 0.35);
    v64 = MEMORY[0x1E0C809B0];
    v74[0] = MEMORY[0x1E0C809B0];
    if (((v20 | v17 ^ 1) & ~v6) == 0)
      v62 = 0.0;
    v74[1] = 3221225472;
    v74[2] = __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke;
    v74[3] = &unk_1EA1F6318;
    v74[4] = self;
    v75 = v13;
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_2;
    v72[3] = &unk_1EA1F6340;
    v72[4] = self;
    v73 = v13;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v74, v72, 0.2, v62);
    if ((v17 & 1) == 0)
    {
      memset(&v71, 0, sizeof(v71));
      if (v6)
      {
        CGAffineTransformMakeScale(&v71, 0.9, 0.9);
      }
      else
      {
        v65 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v71.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v71.c = v65;
        *(_OWORD *)&v71.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v63, 0.0);
      -[SearchUICollectionViewCell setSelectionAnimator:](self, "setSelectionAnimator:", v66);
      v68[0] = v64;
      v68[1] = 3221225472;
      v68[2] = __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_3;
      v68[3] = &unk_1EA1F6368;
      v69 = v12;
      v70 = v71;
      objc_msgSend(v66, "addAnimations:", v68);
      objc_msgSend(v66, "startAnimationAfterDelay:", v62);

    }
  }

}

void __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "selectedOverlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_2(uint64_t a1)
{
  _BOOL8 v1;
  id v2;

  v1 = *(_BYTE *)(a1 + 40) == 0;
  objc_msgSend(*(id *)(a1 + 32), "selectedOverlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", v1);

}

uint64_t __93__SearchUICollectionViewCell_animateFocusScaleDownEffectIsHighlighted_isSelected_appearance___block_invoke_3(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

- (id)focusEffect
{
  void *v3;

  if (-[SearchUICollectionViewCell resolvedFocusStyle](self, "resolvedFocusStyle") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC37D8], "effect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContainerView:", self);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  if (-[SearchUICollectionViewCell useSystemSizing](self, "useSystemSizing")
    && (-[SearchUICollectionViewCell rowModel](self, "rowModel"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "cardSection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = +[SnippetUIUtilities supportsConfigurationForCardSection:](SnippetUIUtilities, "supportsConfigurationForCardSection:", v9), v9, v8, !v10))
  {
    v36.receiver = self;
    v36.super_class = (Class)SearchUICollectionViewCell;
    -[SearchUICollectionViewCell _preferredSeparatorInsetsForProposedInsets:](&v36, sel__preferredSeparatorInsetsForProposedInsets_, top, leading, bottom, trailing);
    top = v28;
    leading = v29;
    bottom = v30;
    trailing = v31;
  }
  else
  {
    v11 = -[SearchUICollectionViewCell sfSeparatorStyle](self, "sfSeparatorStyle");
    if ((_DWORD)v11 != 1)
    {
      v12 = v11;
      -[SearchUICollectionViewCell contentView](self, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[SearchUICollectionViewCell sizingView](self, "sizingView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

      -[SearchUICollectionViewCell sizingView](self, "sizingView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layoutIfNeeded");

      -[SearchUICollectionViewCell leadingView](self, "leadingView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewCell leadingTextView](self, "leadingTextView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUICardSectionView separatorInsetsForStyle:cellView:leadingView:leadingTextView:](SearchUICardSectionView, "separatorInsetsForStyle:cellView:leadingView:leadingTextView:", v12, self, v24, v25);
      leading = v26;
      trailing = v27;

      -[SearchUICollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
  v32 = top;
  v33 = leading;
  v34 = bottom;
  v35 = trailing;
  result.trailing = v35;
  result.bottom = v34;
  result.leading = v33;
  result.top = v32;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  SearchUICollectionViewCell *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v21, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  -[SearchUICollectionViewCell focusEffect](self, "focusEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (!v7)
  {
    objc_msgSend(v6, "nextFocusedView");
    v11 = (SearchUICollectionViewCell *)objc_claimAutoreleasedReturnValue();

    if (v11 == self)
    {
      if ((isKindOfClass & 1) == 0)
        -[SearchUICollectionViewCell setSelected:](self, "setSelected:", 1);
      -[SearchUICollectionViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
      -[SearchUICollectionViewCell delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[SearchUICollectionViewCell delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewCell rowModel](self, "rowModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifyingResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewCell rowModel](self, "rowModel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cardSection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "didUpdateKeyboardFocusToResult:cardSection:", v16, v18);

      }
    }
    else
    {
      -[SearchUICollectionViewCell setSelected:](self, "setSelected:", 0);
    }
  }
  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUICollectionViewCell setHighlighted:](self, "setHighlighted:", 0);
    objc_msgSend(v6, "nextFocusedView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewCell viewForForcedFocus](self, "viewForForcedFocus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == v20)
      -[SearchUICollectionViewCell setupManualFocus](self, "setupManualFocus");
    else
      -[SearchUICollectionViewCell removeManualFocus](self, "removeManualFocus");
  }

}

- (BOOL)isExpandable
{
  return 0;
}

- (BOOL)needsInternalFocus
{
  return 0;
}

- (BOOL)setupManualFocus
{
  return 0;
}

- (void)addLinkLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SearchUICollectionViewCell linkLayer](self, "linkLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    -[SearchUICollectionViewCell linkLayer](self, "linkLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceSublayer:with:", v7, v8);

  }
  else
  {
    objc_msgSend(v5, "addSublayer:", v8);
  }

  -[SearchUICollectionViewCell setLinkLayer:](self, "setLinkLayer:", v8);
}

- (int64_t)_focusItemDeferralMode
{
  return 2;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previouslyFocusedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[SearchUICollectionViewCell delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[SearchUICollectionViewCell delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didUpdateKeyboardFocusToResult:cardSection:", 0, 0);

    }
    v7 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SearchUICollectionViewCell;
    v7 = -[SearchUICollectionViewCell shouldUpdateFocusInContext:](&v12, sel_shouldUpdateFocusInContext_, v4);
  }

  return v7;
}

- (NSArray)visibleResults
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (BOOL)highlightFrameMatchesHighlightView
{
  return 1;
}

- (CGRect)highlightFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)highlightFrameCornerRadius
{
  return -1.0;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SearchUICollectionViewCell *v8;
  SearchUICollectionViewCell *v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchUICollectionViewCell;
  -[SearchUICollectionViewCell prepareForReuse](&v13, sel_prepareForReuse);
  -[SearchUICollectionViewCell selectionAnimator](self, "selectionAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SearchUICollectionViewCell selectionAnimator](self, "selectionAnimator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAnimation:", 1);

    -[SearchUICollectionViewCell selectionAnimator](self, "selectionAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishAnimationAtPosition:", 2);

    -[SearchUICollectionViewCell setSelectionAnimator:](self, "setSelectionAnimator:", 0);
  }
  -[SearchUICollectionViewCell _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  -[SearchUICollectionViewCell highlightReferenceView](self, "highlightReferenceView");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (SearchUICollectionViewCell *)v6;
  else
    v8 = self;
  v9 = v8;

  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v12[0] = *MEMORY[0x1E0C9BAA8];
  v12[1] = v10;
  v12[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[SearchUICollectionViewCell setTransform:](v9, "setTransform:", v12);
  -[SearchUICollectionViewCell selectedOverlayView](self, "selectedOverlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  +[SearchUIAppEntityAnnotator resetAnnotationForView:](SearchUIAppEntityAnnotator, "resetAnnotationForView:", self);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DBD9B0], "tappableControlViewForPoint:inView:withEvent:", self, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUICollectionViewCell;
    -[SearchUICollectionViewCell hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (BOOL)useSystemSizing
{
  return self->_useSystemSizing;
}

- (void)setUseSystemSizing:(BOOL)a3
{
  self->_useSystemSizing = a3;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)leadingTextView
{
  return self->_leadingTextView;
}

- (int)sfSeparatorStyle
{
  return self->_sfSeparatorStyle;
}

- (CALayer)linkLayer
{
  return self->_linkLayer;
}

- (void)setLinkLayer:(id)a3
{
  self->_linkLayer = (CALayer *)a3;
}

- (_UIConstraintBasedLayoutHostingView)hostedSnippetUIView
{
  return self->_hostedSnippetUIView;
}

- (void)setHostedSnippetUIView:(id)a3
{
  objc_storeStrong((id *)&self->_hostedSnippetUIView, a3);
}

- (UIView)viewForForcedFocus
{
  return (UIView *)objc_getProperty(self, a2, 952, 1);
}

- (void)setDummyBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_dummyBackgroundView, a3);
}

- (void)setBackgroundPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlatterView, a3);
}

- (UIView)selectedOverlayView
{
  return self->_selectedOverlayView;
}

- (void)setSelectedOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOverlayView, a3);
}

- (UIViewPropertyAnimator)selectionAnimator
{
  return self->_selectionAnimator;
}

- (void)setSelectionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_selectionAnimator, 0);
  objc_storeStrong((id *)&self->_selectedOverlayView, 0);
  objc_storeStrong((id *)&self->_backgroundPlatterView, 0);
  objc_storeStrong((id *)&self->_dummyBackgroundView, 0);
  objc_storeStrong((id *)&self->_viewForForcedFocus, 0);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
  objc_storeStrong((id *)&self->_hostedSnippetUIView, 0);
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sizingView, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end
