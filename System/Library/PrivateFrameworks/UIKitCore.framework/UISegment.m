@implementation UISegment

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  -[UIImageView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
  -[UISegment _updateTextColors](self, "_updateTextColors");
}

- (void)updateConstraints
{
  UIView *info;
  double width;
  double height;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat MaxX;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22.receiver = self;
  v22.super_class = (Class)UISegment;
  -[UIView updateConstraints](&v22, sel_updateConstraints);
  info = self->_info;
  if (info
    && !-[UIView translatesAutoresizingMaskIntoConstraints](info, "translatesAutoresizingMaskIntoConstraints")
    && !self->_infoConstraints)
  {
    width = self->_contentOffset.width;
    height = self->_contentOffset.height;
    -[_UISegmentedControlAppearanceStorage contentPositionOffsetForSegment:inMiniBar:](self->_appearanceStorage, "contentPositionOffsetForSegment:inMiniBar:", (((unint64_t)self->_segmentFlags >> 6) & 7) + 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "UIOffsetValue");
      width = width + v8;
      height = height + v9;
    }
    -[UISegment _contentRectForBounds:](self, "_contentRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    x = v23.origin.x;
    y = v23.origin.y;
    v12 = v23.size.width;
    v13 = v23.size.height;
    v21 = height + CGRectGetMinY(v23);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = v12;
    v24.size.height = v13;
    v14 = width + CGRectGetMinX(v24);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = v12;
    v25.size.height = v13;
    v15 = 100.0 - CGRectGetMaxY(v25) - height;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = v12;
    v26.size.height = v13;
    MaxX = CGRectGetMaxX(v26);
    v17 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_info, 9, 0, self, 9, 1.0, (v14 - (100.0 - MaxX - width)) * 0.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_info, 10, 0, self, 10, 1.0, (v21 - v15) * 0.5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

    -[UIView addConstraints:](self, "addConstraints:", v19);
    -[UISegment _setInfoConstraints:](self, "_setInfoConstraints:", v19);

  }
}

uint64_t __29__UISegment__updateHighlight__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setAlpha:", *(double *)(a1 + 40));
}

- (BOOL)isHighlighted
{
  return (*(_BYTE *)&self->_segmentFlags >> 3) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIView isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISegment;
    -[UIView setEnabled:](&v5, sel_setEnabled_, v3);
    -[UISegment _setEnabledAppearance:](self, "_setEnabledAppearance:", v3);
  }
}

- (void)_setEnabledAppearance:(BOOL)a3
{
  _BOOL4 v3;
  objc_class *v5;
  void *v6;
  double v7;
  int v8;
  UIView *v9;
  void *v10;
  UIView *info;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  v5 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) != 0)
  {
    if ((objc_msgSend(v14, "useSelectionIndicatorStyling") & 1) != 0)
    {
      if (!v3)
        goto LABEL_12;
    }
    else
    {
      v7 = 0.5;
      if (v3)
        v7 = 1.0;
      -[UIView setAlpha:](self->_info, "setAlpha:", v7);
      if (!v3)
        goto LABEL_12;
    }
  }
  else
  {
    if (!v3)
    {
LABEL_12:
      info = self->_info;
      -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_disabledColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](info, "setTintColor:", v12);

      goto LABEL_13;
    }
    -[UIView setEnabled:](self->_info, "setEnabled:", 1);
  }
  v8 = objc_msgSend(v14, "useSelectionIndicatorStyling");
  v9 = self->_info;
  if (v8)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v9, "setTintColor:", v10);
LABEL_13:

    goto LABEL_15;
  }
  -[UIView setTintColor:](self->_info, "setTintColor:", 0);
LABEL_15:
  -[UISegment _updateTextColors](self, "_updateTextColors");
  -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:](self->_appearanceStorage, "backgroundImageForState:isMini:", 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");

}

- (CGSize)_maximumTextSize
{
  double v3;
  double v4;
  double v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGSize result;

  v28 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)&self->_segmentFlags & 0x2000) != 0)
    v3 = 288.0;
  else
    v3 = 3.40282347e38;
  v5 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v6, objc_msgSend(v7, "userInterfaceIdiom"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = objc_msgSend(&unk_1E1A932C0, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(&unk_1E1A932C0);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "integerValue");
          v14 = objc_msgSend(v8, "useSelectionIndicatorStyling");
          if (v13 == 4)
            v15 = 1;
          else
            v15 = v14;
          -[UISegment _attributedTextForState:selected:forceSelectedAppearance:](self, "_attributedTextForState:selected:forceSelectedAppearance:", v13, v15, objc_msgSend(v8, "useSelectionIndicatorStyling"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "boundingRectWithSize:options:context:", 1, 0, v3, 3.40282347e38);
          if (v17 >= v5)
            v19 = v17;
          else
            v19 = v5;
          v5 = ceil(v19);
          if (v18 >= v4)
            v20 = v18;
          else
            v20 = v4;
          v4 = ceil(v20);
          if (objc_msgSend(v8, "useTVStyleFocusSelection"))
            v5 = v5 + 16.0;

        }
        v10 = objc_msgSend(&unk_1E1A932C0, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

  }
  v21 = v5;
  v22 = v4;
  result.height = v22;
  result.width = v21;
  return result;
}

+ (id)_backgroundImageWithStorage:(id)a3 mini:(BOOL)a4 state:(unint64_t)a5 position:(unsigned int)a6 drawMode:(unsigned int *)a7 isCustom:(BOOL *)a8 defaultBlock:(id)a9
{
  uint64_t v11;
  _BOOL8 v13;
  id v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void (**v42)(_QWORD);
  unsigned int *v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  int v47;

  v11 = *(_QWORD *)&a6;
  v13 = a4;
  v14 = a3;
  v15 = (void (**)(_QWORD))a9;
  objc_msgSend(v14, "backgroundImageForState:isMini:withFallback:", 0, v13, 1);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (a8)
    *a8 = v16 != 0;
  if (v16)
  {
    v43 = a7;
    if (a5)
    {
      objc_msgSend(v14, "backgroundImageForState:isMini:withFallback:", a5, v13, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;

        v21 = 0;
        v22 = 0;
        v17 = v20;
      }
      else
      {
        v22 = a5 == 2;
        v21 = a5 != 2;
      }

    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    v42 = v15;
    v25 = v17;
    v24 = v25;
  }
  else
  {
    v15[2](v15);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = 0;
    if (!v23)
    {
      v22 = 0;
      v40 = 0;
      if (!a7)
        goto LABEL_19;
      goto LABEL_18;
    }
    v25 = (id)v23;
    v42 = v15;
    v43 = a7;
    v22 = 0;
    v21 = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__UISegment__backgroundImageWithStorage_mini_state_position_drawMode_isCustom_defaultBlock___block_invoke;
  aBlock[3] = &unk_1E16C3130;
  v45 = v25;
  v26 = v14;
  v46 = v26;
  v47 = v11;
  v27 = v25;
  v28 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v26, "legacySuppressOptionsBackground");
  v38 = MEMORY[0x1E0C9AAA0];
  if (v30)
    v38 = MEMORY[0x1E0C9AAB0];
  __UIImageCacheKeyWithSentinel(v27, v31, v32, v33, v34, v35, v36, v37, v29, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _cachedImageForKey:fromBlock:](UIImage, "_cachedImageForKey:fromBlock:", v39, v28);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    v22 = 2;

  v15 = v42;
  a7 = v43;
  if (v43)
LABEL_18:
    *a7 = v22;
LABEL_19:

  return v40;
}

id __45__UISegment__updateBackgroundAndContentViews__block_invoke(uint64_t a1)
{
  int v2;
  _DWORD *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _DWORD *v17;
  uint64_t v18;

  if (objc_msgSend(*(id *)(a1 + 32), "useGeneratedImages"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "useSelectionIndicatorStyling");
    v3 = *(_DWORD **)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    if (v2)
    {
      objc_msgSend(v3, "bounds");
      v6 = v5;
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 40), "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_effectiveBackgroundTintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, 0, v9, v10, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 632) & 3, v6, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (v3[158] >> 2) & 1;
      objc_msgSend(v3, "bounds");
      v14 = v13;
      v16 = v15;
      v17 = *(_DWORD **)(a1 + 40);
      v18 = (v17[158] >> 3) & 1;
      objc_msgSend(v17, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", v12, 0, v18, v9, 0, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 632) & 3, v14, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_effectiveBackgroundTintColor
{
  id v2;
  void *v3;

  v2 = -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(v2, "transparentBackground") & 1) != 0)
      +[UIColor clearColor](UIColor, "clearColor");
    else
      objc_msgSend(v3, "_backgroundTintColor");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_updateBackgroundAndContentViews
{
  unint64_t v3;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _UISegmentedControlAppearanceStorage *appearanceStorage;
  id v10;
  void *v11;
  UISegmentBezelView *bezelView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  UIView *info;
  uint64_t v19;
  UISegmentBezelView *v20;
  _QWORD v21[4];
  id v22;
  UISegment *v23;
  objc_class *v24;
  char v25;
  unsigned int v26;

  v3 = -[UISegment _segmentState](self, "_segmentState");
  segmentFlags = self->_segmentFlags;
  v26 = 0;
  if ((*(_WORD *)&segmentFlags & 0x2000) != 0)
    v5 = 4;
  else
    v5 = (*(unsigned int *)&segmentFlags >> 6) & 7;
  v25 = 0;
  v6 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v6, objc_msgSend(v7, "userInterfaceIdiom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  appearanceStorage = self->_appearanceStorage;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__UISegment__updateBackgroundAndContentViews__block_invoke;
  v21[3] = &unk_1E16C3158;
  v10 = v8;
  v23 = self;
  v24 = v6;
  v22 = v10;
  +[UISegment _backgroundImageWithStorage:mini:state:position:drawMode:isCustom:defaultBlock:](UISegment, "_backgroundImageWithStorage:mini:state:position:drawMode:isCustom:defaultBlock:", appearanceStorage, 0, v3, v5, &v26, &v25, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  bezelView = self->_bezelView;
  if (bezelView)
  {
    -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentBezelView updateForSegment:inSegmentedControl:](bezelView, "updateForSegment:inSegmentedControl:", self, v13);

  }
  -[UISegment _effectiveBackgroundView](self, "_effectiveBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_segmentFlags + 1) & 0x20) != 0
    && (objc_msgSend(v10, "useSelectionIndicatorStyling") & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasBackdropView");

    if (v17)
      v15 = 0;
    else
      v15 = v11;
  }
  objc_msgSend(v14, "setImage:", v15);
  if ((objc_msgSend(v10, "useSelectionIndicatorStyling") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      info = self->_info;
      if (v11)
        v19 = objc_msgSend(v11, "_isInvisibleAndGetIsTranslucent:", 0);
      else
        v19 = 0;
      -[UIView _setWantsUnderlineForAccessibilityButtonShapesEnabled:](info, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", v19);
    }
  }
  -[UIImageView setDrawMode:](self, "setDrawMode:", v26);
  -[UISegment updateDividerViewForChangedSegment:](self, "updateDividerViewForChangedSegment:", self);
  -[UISegment _updateTextColors](self, "_updateTextColors");
  v20 = self->_bezelView;
  if (v20)
    -[UISegmentBezelView updateInfoView:forSegment:](v20, "updateInfoView:forSegment:", self->_info, self);
  -[UISegment _updateHighlight](self, "_updateHighlight");
  -[UISegment _updateSelectionIndicator](self, "_updateSelectionIndicator");
  -[UISegment _positionInfo](self, "_positionInfo");
  *(_DWORD *)&self->_segmentFlags &= ~0x1000u;

}

- (void)updateDividerViewForChangedSegment:(id)a3
{
  UISegment *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;
  char v10;
  UISegmentBezelView *bezelView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  UIImageView *v19;
  unint64_t rightSegmentState;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  void *v27;
  double v28;
  _BOOL4 v29;
  objc_class *v30;
  void *v31;
  void *v32;
  double v33;
  void (**v34)(_QWORD);
  double v35;
  void *v36;
  UIImageView *v37;
  double v38;
  double v39;
  double v40;
  int v41;
  void *v42;
  _QWORD aBlock[4];
  UIImageView *v44;
  double v45;
  char v46;

  v4 = (UISegment *)a3;
  v5 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dividerWidthForControlSize:", -[UISegment controlSize](self, "controlSize"));
  if (v8 != 0.0 || self->_bezelView)
  {
    if (v4)
      v9 = v4 == self;
    else
      v9 = 1;
    v10 = v9;
    if (!v9)
      self->_rightSegmentState = -[UISegment _segmentState](v4, "_segmentState");
    bezelView = self->_bezelView;
    if (bezelView)
    {
      -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentBezelView updateForSegment:inSegmentedControl:](bezelView, "updateForSegment:inSegmentedControl:", self, v12);

    }
    -[UISegment _effectiveBackgroundView](self, "_effectiveBackgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewWithTag:", -1030);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0;
    -[UISegment _dividerImageIsCustom:](self, "_dividerImageIsCustom:", &v46);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v17 = v16;
    objc_msgSend(v14, "subviews");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setImage:", v15);
    if (v46 || (objc_msgSend(v7, "useSelectionIndicatorStyling") & 1) == 0)
    {
      if (!v19)
      {
LABEL_45:
        -[UIView bounds](self, "bounds");
        v39 = v38;
        objc_msgSend(v15, "size");
        objc_msgSend(v14, "setFrame:", v39, 0.0, v40, v17);

        goto LABEL_46;
      }
      -[UIView removeFromSuperview](v19, "removeFromSuperview");
    }
    else
    {
      rightSegmentState = self->_rightSegmentState;
      segmentFlags = self->_segmentFlags;
      v22 = (rightSegmentState >> 2) & 1 | ((*(_BYTE *)&segmentFlags & 4) >> 2);
      v23 = rightSegmentState | ((*(_BYTE *)&segmentFlags & 8) >> 3);
      if ((*(_WORD *)&segmentFlags & 0x4000) == 0)
        LOBYTE(v23) = v22;
      if ((v10 & 1) != 0)
        v24 = 0;
      else
        v24 = *((_BYTE *)&v4->_segmentFlags + 2) & 1;
      v25 = v24 | ((*(unsigned int *)&segmentFlags & 0x10000) >> 16);
      if ((v23 & 1) != 0)
        v26 = 1;
      else
        v26 = v25;
      -[UISegment _effectiveSelectedSegmentTintColor](self, "_effectiveSelectedSegmentTintColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v27;
      if (v27)
      {
        objc_msgSend(v27, "alphaComponent");
        v29 = v28 != 0.0;
      }
      else
      {
        v29 = 1;
      }
      v30 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
      if (objc_msgSend(v7, "useGeneratedImages"))
      {
        -[UIView traitCollection](self, "traitCollection");
        v41 = v26;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class _modernDividerImageBackground:traitCollection:tintColor:size:](v30, "_modernDividerImageBackground:traitCollection:tintColor:size:", 0, v31, 0, *(_DWORD *)&self->_segmentFlags & 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v41;
      }
      else
      {
        v32 = 0;
      }
      if ((v26 & v29) != 0)
        v33 = 0.0;
      else
        v33 = 1.0;
      if (v19)
      {
        -[UIImageView setImage:](v19, "setImage:", v32);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __48__UISegment_updateDividerViewForChangedSegment___block_invoke;
        aBlock[3] = &unk_1E16B1888;
        v19 = v19;
        v44 = v19;
        v45 = v33;
        v34 = (void (**)(_QWORD))_Block_copy(aBlock);
        -[UIView alpha](v19, "alpha");
        if (v33 != v35)
        {
          if (objc_msgSend(v7, "animateSlidingSelectionByDefault")
            && +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled")
            && (-[UIView window](v19, "window"),
                v36 = (void *)objc_claimAutoreleasedReturnValue(),
                v36,
                v36))
          {
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327716, v34, 0, 0.41, 0.0);
          }
          else
          {
            v34[2](v34);
          }
        }

      }
      else
      {
        v37 = [UIImageView alloc];
        objc_msgSend(v14, "bounds");
        v19 = -[UIImageView initWithFrame:](v37, "initWithFrame:");
        -[UIView setAutoresizingMask:](v19, "setAutoresizingMask:", 18);
        -[UIImageView setImage:](v19, "setImage:", v32);
        -[UIView setAlpha:](v19, "setAlpha:", v33);
        objc_msgSend(v14, "insertSubview:atIndex:", v19, 0);
      }

    }
    goto LABEL_45;
  }
LABEL_46:

}

- (id)_effectiveBackgroundView
{
  objc_class *v3;
  void *v4;
  void *v5;
  UISegment *backgroundView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  UISegment *v10;

  v3 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "useSelectionIndicatorStyling")
    || (*((_BYTE *)&self->_segmentFlags + 1) & 0x20) != 0)
  {
    backgroundView = self;
  }
  else
  {
    backgroundView = (UISegment *)self->_backgroundView;
    if (!backgroundView)
    {
      v7 = [UIImageView alloc];
      -[UIView frame](self, "frame");
      v8 = -[UIImageView initWithFrame:](v7, "initWithFrame:");
      v9 = self->_backgroundView;
      self->_backgroundView = v8;

      backgroundView = (UISegment *)self->_backgroundView;
    }
  }
  v10 = backgroundView;

  return v10;
}

- (id)_dividerImageIsCustom:(BOOL *)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;

  v5 = -[UISegment _segmentState](self, "_segmentState");
  if (!-[UISegment _effectiveDisableShadow](self, "_effectiveDisableShadow"))
  {
    -[_UISegmentedControlAppearanceStorage anyDividerImageForMini:](self->_appearanceStorage, "anyDividerImageForMini:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (a3)
      *a3 = v7 != 0;
    if (v7)
    {
      -[_UISegmentedControlAppearanceStorage dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:](self->_appearanceStorage, "dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:", v5, self->_rightSegmentState, 0, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v5 && !v9)
      {
        -[_UISegmentedControlAppearanceStorage dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:](self->_appearanceStorage, "dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:", v5, v5, 0, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v10)
        v11 = v10;
      else
        v11 = v8;
      v12 = v11;

      v13 = v12;
      v6 = v13;
    }
    else
    {
      v14 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
      -[UIView traitCollection](self, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      UISegmentedControlStyleProviderForIdiom(v14, objc_msgSend(v15, "userInterfaceIdiom"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v13, "useGeneratedImages"))
      {
        v6 = 0;
        goto LABEL_17;
      }
      -[UIView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegment _effectiveBackgroundTintColor](self, "_effectiveBackgroundTintColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class _modernDividerImageBackground:traitCollection:tintColor:size:](v14, "_modernDividerImageBackground:traitCollection:tintColor:size:", 1, v10, v16, *(_DWORD *)&self->_segmentFlags & 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:

    return v6;
  }
  v6 = 0;
  *a3 = 1;
  return v6;
}

- (void)_updateTextColors
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  UIView *v4;
  objc_class *v5;
  void *v6;
  id v7;

  segmentFlags = self->_segmentFlags;
  if ((*(_DWORD *)&segmentFlags & 0x40000) == 0)
  {
    if ((*(_BYTE *)&segmentFlags & 0x20) != 0)
    {
      v5 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
      -[UIView traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "useSelectionIndicatorStyling") & 1) == 0
        && (objc_msgSend(v7, "useTVStyleFocusSelection") & 1) == 0)
      {
        goto LABEL_8;
      }
    }
    else
    {
      v4 = self->_info;
      -[UISegment _attributedTextForState:selected:forceSelectedAppearance:](self, "_attributedTextForState:selected:forceSelectedAppearance:", -[UISegment _segmentState](self, "_segmentState"), (*(_DWORD *)&self->_segmentFlags >> 2) & 1, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView setAttributedText:](v4, "setAttributedText:");

    }
    -[UISegment updateMasking](self, "updateMasking");
LABEL_8:

  }
}

- (BOOL)_effectiveDisableShadow
{
  void *v2;
  char v3;

  -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transparentBackground");

  return v3;
}

- (id)_contentViewIfNeeded
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  UIVisualEffectView *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v1 = a1;
  if (a1)
  {
    -[UISegment _floatingContentView](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v1 = v2;
LABEL_20:

      return v1;
    }
    v4 = (void *)objc_msgSend(v1, "_segmentedControlClass");
    objc_msgSend(v1, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v4, objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "selectedSegmentContentDefaultVibrancyEffect");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unselectedSegmentContentDefaultVibrancyEffect");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v1[70];
    if (!(v7 | v8))
    {
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v1[70], "removeFromSuperview");
          v10 = v1[70];
          v1[70] = 0;

        }
      }
      v1 = 0;
      goto LABEL_19;
    }
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __24__UISegment__effectView__block_invoke;
        v17[3] = &unk_1E16B47A8;
        v17[4] = v1;
        v18 = (id)v7;
        v19 = (id)v8;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);

LABEL_18:
        v1 = (id *)v1[70];
LABEL_19:

        goto LABEL_20;
      }
      v11 = v1[70];
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v11, "removeFromSuperview");
    v12 = [UIVisualEffectView alloc];
    if (((_DWORD)v1[79] & 4) != 0)
      v13 = v7;
    else
      v13 = v8;
    v14 = -[UIVisualEffectView initWithEffect:](v12, "initWithEffect:", v13);
    v15 = v1[70];
    v1[70] = (id)v14;

    objc_msgSend(v1, "addSubview:", v1[70]);
    goto LABEL_18;
  }
  return v1;
}

- (id)_floatingContentView
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _UIFloatingContentView *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_msgSend(a1, "_segmentedControlClass");
    objc_msgSend(v1, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v2, objc_msgSend(v3, "userInterfaceIdiom"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "useTVStyleFocusSelection"))
    {
      v1 = 0;
LABEL_10:

      return v1;
    }
    if (v1[70])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_9:
        v1 = (id *)v1[70];
        goto LABEL_10;
      }
      v5 = v1[70];
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v5, "removeFromSuperview");
    v6 = [_UIFloatingContentView alloc];
    v7 = -[_UIFloatingContentView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = v1[70];
    v1[70] = (id)v7;

    v9 = v1[70];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__UISegment__floatingContentView__block_invoke;
    v12[3] = &unk_1E16B1B28;
    v13 = v9;
    v10 = v9;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v12);
    objc_msgSend(v1, "addSubview:", v1[70]);

    goto LABEL_9;
  }
  return v1;
}

- (void)updateMasking
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL8 v6;
  int v7;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  UIView *v13;
  unint64_t v14;
  void *v15;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v16;
  _BOOL4 v17;
  void *v18;
  unint64_t v19;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:withFallback:](self->_appearanceStorage, "backgroundImageForState:isMini:withFallback:", 0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v4, objc_msgSend(v5, "userInterfaceIdiom"));
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!-[UISegment isSelected](self, "isSelected"))
    {
LABEL_3:
      v6 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    if ((objc_msgSend(v32, "useSelectionIndicatorStyling") & 1) != 0)
    {
      v7 = 0;
      v6 = 0;
      goto LABEL_13;
    }
    if (!-[UISegment isSelected](self, "isSelected") && (*((_BYTE *)&self->_segmentFlags + 1) & 8) == 0)
      goto LABEL_3;
  }
  if (!-[UISegment isMomentary](self, "isMomentary") || -[UISegment isSelected](self, "isSelected"))
  {
    v7 = 1;
    v6 = 1;
    goto LABEL_13;
  }
  v6 = -[UISegment isHighlighted](self, "isHighlighted");
LABEL_12:
  v7 = 1;
LABEL_13:
  segmentFlags = self->_segmentFlags;
  if ((*(_DWORD *)&segmentFlags & 0x40000) != 0)
    goto LABEL_53;
  if ((*(_BYTE *)&segmentFlags & 0x20) != 0)
  {
    v13 = self->_info;
    v12 = v13;
    if (v7)
    {
      -[UIView _setMasksTemplateImages:](v13, "_setMasksTemplateImages:", v6);
    }
    else
    {
      v14 = -[UISegment _segmentState](self, "_segmentState");
      -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_segmentFlags;
      if ((*(_BYTE *)&v16 & 4) != 0)
      {
        v19 = +[UIControl _primaryStateForState:](UIControl, "_primaryStateForState:", v14);
        v20 = self->_segmentFlags;
        v21 = *(_BYTE *)&v20 & 4;
        if ((*(_WORD *)&v20 & 0x4000) != 0)
          v21 = *(_BYTE *)&v20 & 8;
        v17 = v21 == 0;
        if ((*(_BYTE *)&v20 & 4) != 0)
          v14 = 0;
        else
          v14 = v19;
      }
      else
      {
        v17 = (~*(_DWORD *)&v16 & 0x4008) != 0;
      }
      if (v17)
        v22 = v14;
      else
        v22 = 4;
      -[UISegment _stateTextAttibutes:segmentState:](self, "_stateTextAttibutes:segmentState:", v15, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)off_1E1678D98;
      objc_msgSend(v23, "valueForKey:", *(_QWORD *)off_1E1678D98);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        goto LABEL_41;
      objc_msgSend(v15, "valueForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        goto LABEL_41;
      if (-[UIView isEnabled](self, "isEnabled"))
      {
        v26 = 1;
      }
      else
      {
        -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v27, "isEnabled") ^ 1;

      }
      objc_msgSend(v32, "fontColorForSegment:enabled:selected:state:", self, v26, (*(_DWORD *)&self->_segmentFlags >> 2) & 1, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
LABEL_41:
        objc_msgSend(v12, "setTintColor:", v25);
      }
      else
      {
        +[UIColor labelColor](UIColor, "labelColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTintColor:", v31);

      }
    }
    if (objc_msgSend(v32, "useTVStyleFocusSelection"))
    {
      if (-[UIView isFocused](self, "isFocused"))
      {
        v28 = 8;
      }
      else if (-[UISegment _hasSelectedColor](self, "_hasSelectedColor"))
      {
        if (-[UISegment isSelected](self, "isSelected"))
          v28 = 4;
        else
          v28 = 0;
      }
      else
      {
        v28 = 0;
      }
      -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTintColor:", v30);

    }
    goto LABEL_52;
  }
  if (v6)
    LODWORD(v6) = !-[UISegment _hasSelectedColor](self, "_hasSelectedColor");
  -[UIView layer](self->_info, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "compositingFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v6 == v11)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    -[UIView layer](self->_info, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompositingFilter:", v12);

    if (v6)
LABEL_52:

  }
LABEL_53:

}

- (id)_attributedTextForState:(unint64_t)a3 selected:(BOOL)a4 forceSelectedAppearance:(BOOL)a5
{
  _BOOL8 v7;
  UIView *v10;
  uint64_t v11;
  unint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  int v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIView *v44;

  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) != 0)
    return 0;
  v7 = a4;
  v10 = self->_info;
  -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v44 = v10;
  if (v7)
  {
    v12 = +[UIControl _primaryStateForState:](UIControl, "_primaryStateForState:", a3);
    a3 = 0;
  }
  else
  {
    v12 = a3;
  }
  v13 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v13, objc_msgSend(v14, "userInterfaceIdiom"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v15;
  if (objc_msgSend(v15, "useSelectionIndicatorStyling"))
  {
    -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:withFallback:](self->_appearanceStorage, "backgroundImageForState:isMini:withFallback:", 4, 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v12 = 4;
      if (!a5)
      {
        segmentFlags = self->_segmentFlags;
        if ((*(_WORD *)&segmentFlags & 0x4000) != 0)
          v18 = (*(unsigned int *)&segmentFlags >> 3) & 1;
        else
          v18 = v7;
        if (v18)
          v12 = 4;
        else
          v12 = a3;
      }
    }
  }
  v19 = (void *)v11;
  -[UISegment _stateTextAttibutes:segmentState:](self, "_stateTextAttibutes:segmentState:", v11, v12);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  v42 = (void *)v20;
  if (-[UIView isEnabled](self, "isEnabled"))
  {
    v22 = 1;
  }
  else
  {
    -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "isEnabled") ^ 1;

  }
  -[UIView traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class _fontForTraitCollection:size:selected:](v21, "_fontForTraitCollection:size:selected:", v24, -[UISegment controlSize](self, "controlSize"), v12 == 4);
  v25 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "fontColorForSegment:enabled:selected:state:", self, v22, v7, v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView text](v44, "text");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  v29 = &stru_1E16EDF20;
  if (v27)
    v29 = (__CFString *)v27;
  v30 = v29;

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v30);
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = v32;
  if ((*((_BYTE *)&self->_segmentFlags + 1) & 0x20) != 0)
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "useSelectionIndicatorStyling") && v7)
    {
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
      v38 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v38;
    }
    v34 = (void *)v25;
    v39 = *(_QWORD *)off_1E1678D90;
    objc_msgSend(v33, "setObject:forKey:", v37, *(_QWORD *)off_1E1678D90);
    v40 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v40, "setObject:forKey:", v37, v39);

    v41 = (void *)objc_msgSend(v42, "mutableCopy");
    objc_msgSend(v41, "setObject:forKey:", v37, v39);

    v36 = v41;
    v19 = v40;
    v35 = v43;
    if (!v26)
      goto LABEL_30;
  }
  else
  {
    v34 = (void *)v25;
    if (v25)
      objc_msgSend(v32, "setObject:forKey:", v25, *(_QWORD *)off_1E1678D90);
    v36 = v42;
    v35 = v43;
    if (!v26)
      goto LABEL_30;
  }
  objc_msgSend(v33, "setObject:forKey:", v26, *(_QWORD *)off_1E1678D98);
LABEL_30:
  objc_msgSend(v31, "setAttributes:range:", v33, 0, -[__CFString length](v30, "length"));
  if (v19)
    objc_msgSend(v31, "addAttributes:range:", v19, 0, -[__CFString length](v30, "length"));
  if (v36 && (objc_msgSend(v36, "isEqualToDictionary:", v19) & 1) == 0)
    objc_msgSend(v31, "addAttributes:range:", v36, 0, -[__CFString length](v30, "length"));

  return v31;
}

- (unint64_t)_segmentState
{
  unint64_t v3;
  id v4;

  v3 = *(_DWORD *)&self->_segmentFlags & 4 | (*(_DWORD *)&self->_segmentFlags >> 3) & 1u;
  if (-[UIView isFocused](self, "isFocused"))
    v3 |= 8uLL;
  v4 = -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  if (v4 && !objc_msgSend(v4, "isEnabled") || !-[UIView isEnabled](self, "isEnabled"))
    v3 |= 2uLL;
  return v3;
}

- (Class)_segmentedControlClass
{
  id v2;

  v2 = -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  return (Class)(id)objc_opt_class();
}

- (id)_parentSegmentedControl
{
  UISegment *v3;

  while (1)
  {
    -[UIView superview](self, "superview");
    self = (UISegment *)objc_claimAutoreleasedReturnValue();

    if (!self)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = self;
      return self;
    }
  }
  return self;
}

- (id)_stateTextAttibutes:(id)a3 segmentState:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    v10 = v6;
    goto LABEL_6;
  }
  -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a4 == 5 && !v8)
  {
    -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = v10;
  }

  return v9;
}

- (CGRect)_contentRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  double v18;
  double v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_class *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  objc_class *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISegmentedControlAppearanceStorage dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:](self->_appearanceStorage, "dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:", 0, 0, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "alignmentRectInsets");
    segmentFlags = self->_segmentFlags;
    v13 = -0.0;
    if (((*(unsigned int *)&segmentFlags >> 6) & 6) == 0)
      v13 = v10;
    v14 = width + v13;
    if (((*(unsigned int *)&segmentFlags >> 6) & 7) - 1 > 1)
    {
      width = v14;
    }
    else
    {
      x = x - v11;
      width = v11 + v14;
    }
  }
  -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:](self->_appearanceStorage, "backgroundImageForState:isMini:", 0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15
    && (v16 = (void *)v15,
        v17 = -[_UISegmentedControlAppearanceStorage legacySuppressOptionsBackground](self->_appearanceStorage, "legacySuppressOptionsBackground"), v16, !v17))
  {
    -[UISegment _paddingInsets](self, "_paddingInsets");
    if ((*(_DWORD *)&self->_segmentFlags & 0x1C0) == 0x40)
    {
      v24 = 0.0;
      v22 = 0.0;
    }
    x = x + v22;
    v19 = v24 + v22;
    width = width - v19;
    y = y + v21;
    v18 = v21 + v23;
    height = height - v18;
    v20 = 1;
  }
  else
  {
    v18 = x + 1.0;
    v19 = width + -2.0;
    v20 = 0;
    if ((*(_DWORD *)&self->_segmentFlags & 0x1C0) == 0xC0)
    {
      x = x + 1.0;
      width = width + -2.0;
    }
  }
  v25 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass", v18, v19);
  -[UIView traitCollection](self, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v25, objc_msgSend(v26, "userInterfaceIdiom"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "limitInternalLayoutAndInteractionToDefaultHeight"))
  {
    v28 = -[UISegment controlSize](self, "controlSize");
    -[UIView traitCollection](self, "traitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "defaultHeightForControlSize:traitCollection:", v28, v29);
    height = v30;

  }
  v31 = -[UISegment controlSize](self, "controlSize");
  v32 = (*(_DWORD *)&self->_segmentFlags >> 6) & 7;
  -[UIView traitCollection](self, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentInsetsForControlSize:position:bounds:traitCollection:", v31, v32, v33, x, y, width, height);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  if (v37 == 0.0 && v35 == 0.0 && v41 == 0.0 && v39 == 0.0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !dyld_program_sdk_at_least())
      y = y + -1.0;
    if ((v20 & 1) == 0 && (*(_DWORD *)&self->_segmentFlags & 0x40020) == 0)
    {
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v27, "defaultTextContentPaddingWidth");
        v43 = v42;
        v55.origin.x = x;
        v55.origin.y = y;
        v55.size.width = width;
        v55.size.height = height;
        v56 = CGRectInset(v55, v43, 0.0);
        x = v56.origin.x;
        y = v56.origin.y;
        width = v56.size.width;
        height = v56.size.height;
        if ((-[objc_class isMemberOfClass:](-[UISegment _segmentedControlClass](self, "_segmentedControlClass"), "isMemberOfClass:", objc_opt_class()) & 1) == 0)
        {
          v44 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
          -[UIView traitCollection](self, "traitCollection");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class _sectionIndicatorInsetForTraitCollection:size:](v44, "_sectionIndicatorInsetForTraitCollection:size:", v45, -[UISegment controlSize](self, "controlSize"));
          v47 = v46;

          -[UIView traitCollection](self, "traitCollection");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          +[UISegmentedControl _sectionIndicatorInsetForTraitCollection:size:](UISegmentedControl, "_sectionIndicatorInsetForTraitCollection:size:", v48, -[UISegment controlSize](self, "controlSize"));
          v50 = v49;

          if (v47 > v50)
          {
            v57.origin.x = x;
            v57.origin.y = y;
            v57.size.width = width;
            v57.size.height = height;
            v58 = CGRectInset(v57, v47 - v50 + v47 - v50, 0.0);
            x = v58.origin.x;
            y = v58.origin.y;
            width = v58.size.width;
            height = v58.size.height;
          }
        }
      }
    }
  }
  else
  {
    x = x + v37;
    width = width - (v41 + v37);
    y = y + v35;
    height = height - (v35 + v39);
  }

  v51 = x;
  v52 = y;
  v53 = width;
  v54 = height;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (int)controlSize
{
  return *(_DWORD *)&self->_segmentFlags & 3;
}

- (void)setObjectValue:(id)a3
{
  id v3;
  unint64_t v5;
  UIView *info;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  UIView *v21;
  UIView *v22;
  uint64_t v23;
  void *v24;
  UIView *v25;
  void *v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  UIView *v32;
  id *p_objectValue;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  char isKindOfClass;
  int v36;
  UIImageView *v37;
  UIView *v38;
  UIView *v39;
  _BOOL4 v40;
  double v41;
  UIView *v42;
  _BOOL4 v43;
  double v44;
  void *v45;
  id v46;
  UISegmentLabel *v47;
  UIView *v48;
  char v49;
  UIView *v50;
  id v51;
  objc_class *v52;
  void *v53;
  void *v54;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v55;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  _OWORD v62[16];
  _QWORD v63[4];
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v3 = a3;
  v75 = *MEMORY[0x1E0C80C00];
  v5 = (unint64_t)a3;
  info = self->_info;
  if (!(v5 | (unint64_t)info) || !-[UIView _wantsAutolayout](info, "_wantsAutolayout"))
  {
    v60 = 0;
    v61 = 0;
    goto LABEL_43;
  }
  -[UISegment _invalidateInfoConstraints](self, "_invalidateInfoConstraints");
  v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(-[UISegment _parentSegmentedControl](self, "_parentSegmentedControl"), "superview");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v57 = v3;
    v58 = (void *)v5;
    while (1)
    {
      -[UIView _layoutEngine](self, "_layoutEngine", v57, v58);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isDescendantOfView:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_41;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v59 = v8;
      objc_msgSend(v8, "constraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (!v13)
        goto LABEL_40;
      v14 = v13;
      v15 = *(_QWORD *)v67;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v67 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v16);
          v18 = objc_msgSend(v17, "firstAttribute");
          if ((v18 - 11) > 1)
          {
            v21 = 0;
LABEL_18:
            v23 = objc_msgSend(v17, "secondAttribute");
            if ((v23 - 11) > 1)
            {
              v22 = 0;
            }
            else
            {
              if (v17)
                v24 = (void *)objc_msgSend((id)objc_msgSend(v17, "secondItem"), "_referenceView");
              else
                v24 = 0;
              v25 = v24;
              -[UIView _viewForLoweringBaselineLayoutAttribute:](v25, "_viewForLoweringBaselineLayoutAttribute:", v23);
              v22 = (UIView *)objc_claimAutoreleasedReturnValue();

              v21 = v25;
            }

            if (v22 != self->_info)
              goto LABEL_27;
            goto LABEL_24;
          }
          if (v17)
            v19 = (void *)objc_msgSend((id)objc_msgSend(v17, "firstItem"), "_referenceView");
          else
            v19 = 0;
          v20 = v19;
          objc_msgSend(v20, "_viewForLoweringBaselineLayoutAttribute:", v18);
          v21 = (UIView *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_18;
          v22 = v21;
          if (v21 != self->_info)
            goto LABEL_18;
LABEL_24:
          objc_msgSend(v61, "addObject:", v17);
          objc_msgSend(v17, "container");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_variant_has_internal_diagnostics())
          {
            if (!v26)
            {
              __UIFaultDebugAssertLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v71 = v59;
                v72 = 2112;
                v73 = v17;
                _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "Impossible! Constraint from view's constraints list that doesn't have a container. view = %@; constraint = %@",
                  buf,
                  0x16u);
              }

            }
          }
          else if (!v26)
          {
            v28 = setObjectValue____s_category;
            if (!setObjectValue____s_category)
            {
              v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v28, (unint64_t *)&setObjectValue____s_category);
            }
            v29 = *(NSObject **)(v28 + 8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v71 = v59;
              v72 = 2112;
              v73 = v17;
              _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Impossible! Constraint from view's constraints list that doesn't have a container. view = %@; constraint = %@",
                buf,
                0x16u);
            }
          }
          objc_msgSend(v60, "addObject:", v26);
          objc_msgSend(v17, "setActive:", 0);

LABEL_27:
          ++v16;
        }
        while (v14 != v16);
        v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        v14 = v30;
      }
      while (v30);
LABEL_40:

      objc_msgSend(v59, "superview");
      v31 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v31;
      if (!v31)
      {
LABEL_41:

        v3 = v57;
        v5 = (unint64_t)v58;
        break;
      }
    }
  }
LABEL_43:
  -[UIView removeFromSuperview](self->_info, "removeFromSuperview");
  if (!v5 || (*(_DWORD *)&self->_segmentFlags & 0x40000) == 0)
  {
    v32 = self->_info;
    self->_info = 0;

  }
  p_objectValue = &self->_objectValue;
  if (self->_objectValue != (id)v5)
    objc_storeStrong(&self->_objectValue, v3);
  if (v5)
  {
    segmentFlags = self->_segmentFlags;
    if ((*(_DWORD *)&segmentFlags & 0x40000) != 0)
    {
      self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFFFFDF);
      v42 = self->_info;
      v43 = -[UIView isEnabled](self, "isEnabled");
      v44 = 0.5;
      if (v43)
        v44 = 1.0;
      -[UIView setAlpha:](v42, "setAlpha:", v44);
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v36 = 32;
      else
        v36 = 0;
      self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFDF | v36);
      if ((isKindOfClass & 1) == 0)
      {
        v47 = objc_alloc_init(UISegmentLabel);
        v48 = self->_info;
        self->_info = &v47->super.super;

        -[UIView setContentMode:](self->_info, "setContentMode:", 0);
        objc_opt_class();
        v49 = objc_opt_isKindOfClass();
        v50 = self->_info;
        v51 = *p_objectValue;
        if ((v49 & 1) != 0)
          -[UIView setAttributedText:](v50, "setAttributedText:", v51);
        else
          -[UIView setText:](v50, "setText:", v51);
        -[UISegment _updateTextColors](self, "_updateTextColors");
        -[UIView setEnabled:](self->_info, "setEnabled:", -[UIView isEnabled](self, "isEnabled"));
        -[UIView sizeToFit](self->_info, "sizeToFit");
        -[UIView setAdjustsFontSizeToFitWidth:](self->_info, "setAdjustsFontSizeToFitWidth:", (*(_DWORD *)&self->_segmentFlags & 0x8200) != 0);
        v56 = self->_segmentFlags;
        if ((*(_BYTE *)&v56 & 4) != 0)
        {
          self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v56 & 0xFFFFFFFB);
          -[UISegment setSelected:](self, "setSelected:", 1);
        }
LABEL_61:
        -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addSubview:", self->_info);

        if (objc_msgSend(v61, "count"))
        {
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __28__UISegment_setObjectValue___block_invoke;
          v63[3] = &unk_1E16B1B50;
          v64 = v61;
          v65 = v60;
          v46 = -[UIView _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary");
          if (v46)
            objc_msgSend(v46, "withAutomaticOptimizationDisabled:", v63);
          else
            __28__UISegment_setObjectValue___block_invoke((uint64_t)v63);

        }
        v52 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
        -[UIView traitCollection](self, "traitCollection");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        UISegmentedControlStyleProviderForIdiom(v52, objc_msgSend(v53, "userInterfaceIdiom"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "useSelectionIndicatorStyling")
          && (v55 = self->_segmentFlags, (*(_BYTE *)&v55 & 8) != 0))
        {

          if ((*(_WORD *)&v55 & 0x4000) == 0)
            goto LABEL_72;
          -[UISegment _highlightSelectionInfoTransform](self, "_highlightSelectionInfoTransform");
          -[UIView layer](self->_info, "layer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v62[4] = v62[12];
          v62[5] = v62[13];
          v62[6] = v62[14];
          v62[7] = v62[15];
          v62[0] = v62[8];
          v62[1] = v62[9];
          v62[2] = v62[10];
          v62[3] = v62[11];
          objc_msgSend(v53, "setTransform:", v62);
        }
        else
        {

        }
LABEL_72:
        -[UIView setNeedsLayout](self, "setNeedsLayout");
        goto LABEL_73;
      }
      v37 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", *p_objectValue);
      v38 = self->_info;
      self->_info = &v37->super;

      v39 = self->_info;
      v40 = -[UIView isEnabled](self, "isEnabled");
      v41 = 0.5;
      if (v40)
        v41 = 1.0;
      -[UIView setAlpha:](v39, "setAlpha:", v41);
      -[UIView _setDefaultRenderingMode:](self->_info, "_setDefaultRenderingMode:", 2);
    }
    -[UISegment updateMasking](self, "updateMasking");
    goto LABEL_61;
  }
LABEL_73:

}

- (id)_effectiveContentView
{
  id *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    -[UISegment _contentViewIfNeeded](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentView");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = v1;
    v1 = v5;

  }
  return v1;
}

uint64_t __48__UISegment_updateDividerViewForChangedSegment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

id __92__UISegment__backgroundImageWithStorage_mini_state_position_drawMode_isCustom_defaultBlock___block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(id *)(a1 + 32);
  if (!objc_msgSend(*(id *)(a1 + 32), "_isResizable")
    || objc_msgSend(*(id *)(a1 + 40), "legacySuppressOptionsBackground"))
  {
    objc_msgSend(*(id *)(a1 + 32), "size");
    v4 = floor((v3 + -1.0) * 0.5);
    objc_msgSend(*(id *)(a1 + 32), "_stretchableImageWithCapInsets:", 0.0, v4, 0.0, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  v6 = *(int *)(a1 + 48);
  if (v6 <= 4 && ((0x17u >> v6) & 1) != 0)
  {
    objc_msgSend(v2, "_resizableImageWithCapMask:", dword_18667ABB8[v6]);
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v7;
  }
  objc_msgSend(v2, "imageWithRenderingMode:", objc_msgSend(*(id *)(a1 + 32), "renderingMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setSelected:(BOOL)a3
{
  int v4;

  if (((((*(_DWORD *)&self->_segmentFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFFB | v4);
    -[UISegment _evaluateHighlight](self, "_evaluateHighlight");
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
    -[UISegment updateMasking](self, "updateMasking");
  }
}

- (void)setSelectionIndicatorDragged:(BOOL)a3
{
  -[UISegment _setSelectionIndicatorDragged:animated:](self, "_setSelectionIndicatorDragged:animated:", a3, 0);
}

- (void)_setSelectionIndicatorDragged:(BOOL)a3 animated:(BOOL)a4
{
  int v5;
  objc_class *v6;
  void *v7;
  id v8;

  if (((((*(_DWORD *)&self->_segmentFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 0x4000;
    else
      v5 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFBFFF | v5);
    v6 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v6, objc_msgSend(v7, "userInterfaceIdiom"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "useSelectionIndicatorStyling"))
      -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");

  }
}

- (void)updateForAppearance:(id)a3
{
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_appearanceStorage, a3);
  self->_rightSegmentState = 0;
  -[UISegment _barHeight](self, "_barHeight");
  -[UISegment setFrame:](self, "setFrame:", 0.0, 0.0, 0.0, v5);
  -[UISegment objectValue](self, "objectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegment setObjectValue:](self, "setObjectValue:", v6);

  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) == 0)
    -[UIView setEnabled:](self->_info, "setEnabled:", -[UIView isEnabled](self, "isEnabled"));
  -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");

}

- (id)objectValue
{
  return self->_objectValue;
}

- (CGSize)contentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if ((*((_BYTE *)&self->_segmentFlags + 2) & 4) != 0)
  {
    -[UIView intrinsicContentSize](self->_info, "intrinsicContentSize");
LABEL_7:
    v5 = v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = *MEMORY[0x1E0C9D820];
      goto LABEL_8;
    }
    -[UISegment _maximumTextSize](self, "_maximumTextSize");
    goto LABEL_7;
  }
  -[UIView image](self->_info, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;

LABEL_8:
  -[UISegment _barHeight](self, "_barHeight");
  v8 = v7;
  v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)_barHeight
{
  objc_class *v3;
  _UISegmentedControlAppearanceStorage *appearanceStorage;
  void *v5;
  double v6;
  double v7;

  if ((*((_BYTE *)&self->_segmentFlags + 1) & 0x80) != 0)
  {
    -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_barHeight");
  }
  else
  {
    v3 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    appearanceStorage = self->_appearanceStorage;
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = segmentBarHeight(v3, appearanceStorage, (uint64_t)v5, *(_DWORD *)&self->_segmentFlags & 3);
  }
  v7 = v6;

  return v7;
}

- (void)setMomentary:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_segmentFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 1024;
    else
      v3 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFBFF | v3);
    -[UISegment _updateTextColors](self, "_updateTextColors");
  }
}

- (UISegment)initWithInfo:(id)a3 size:(int)a4 barStyle:(int64_t)a5 tintColor:(id)a6 appearanceStorage:(id)a7 position:(unsigned int)a8 autosizeText:(BOOL)a9 adjustsForContentSizeCategory:(BOOL)a10 customInfoView:(id)a11 traitCollection:(id)a12
{
  char v12;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  UISegment *v22;
  UISegment *v23;
  int v24;
  int v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v12 = a8;
  v15 = *(_QWORD *)&a4;
  v17 = a3;
  v18 = a7;
  v19 = a11;
  v20 = a12;
  v21 = segmentBarHeight(-[UISegment _segmentedControlClass](self, "_segmentedControlClass"), v18, (uint64_t)v20, v15);

  v31.receiver = self;
  v31.super_class = (Class)UISegment;
  v22 = -[UIImageView initWithFrame:](&v31, sel_initWithFrame_, 0.0, 0.0, 0.0, v21);
  v23 = v22;
  if (v22)
  {
    v22->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v22->_segmentFlags & 0xFFFFFFFC | v15 & 3);
    v22->_barStyle = a5;
    objc_storeStrong((id *)&v22->_appearanceStorage, a7);
    if (a9)
      v24 = 512;
    else
      v24 = 0;
    if (a10)
      v25 = 0x8000;
    else
      v25 = 0;
    v26 = v24 & 0xFFFFFE3F | ((v12 & 7) << 6) | v25 | *(_DWORD *)&v23->_segmentFlags & 0xFFFF7C3F;
    v23->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)v26;
    if (v19)
    {
      v23->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(v26 | 0x40000);
      objc_storeStrong((id *)&v23->_info, a11);
    }
    -[UIView setOpaque:](v23, "setOpaque:", 0);
    -[UISegment setEnabled:](v23, "setEnabled:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UISegment setAction:](v23, "setAction:", v17);
      -[UIMenuElement image](v23->_action, "image");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        -[UISegment setObjectValue:](v23, "setObjectValue:", v27);
      }
      else
      {
        -[UIMenuElement title](v23->_action, "title");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegment setObjectValue:](v23, "setObjectValue:", v28);

      }
    }
    else
    {
      -[UISegment setAction:](v23, "setAction:", 0);
      -[UISegment setObjectValue:](v23, "setObjectValue:", v17);
    }
    -[UIView layer](v23, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setEdgeAntialiasingMask:", 12);

  }
  return v23;
}

- (void)setAction:(id)a3
{
  id v4;
  UIAction *v5;
  UIAction *v6;
  BOOL v7;
  UIAction *v8;
  UIAction *action;
  UIAction *v10;
  UIAction *v11;

  v4 = a3;
  v5 = self->_action;
  v6 = (UIAction *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    action = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIAction isEqual:](v5, "isEqual:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    -[UIAction _immutableCopy](v8, "_immutableCopy");
    v10 = (UIAction *)objc_claimAutoreleasedReturnValue();
    action = self->_action;
    self->_action = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)_finishInitialSegmentSetup
{
  objc_class *v3;
  void *v4;
  void *v5;
  UISegmentBezelView *v6;
  UISegmentBezelView *bezelView;
  UISegmentBezelView *v8;
  double v9;
  CGFloat v10;
  double v11;

  v3 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createSegmentBezelView");
  v6 = (UISegmentBezelView *)objc_claimAutoreleasedReturnValue();
  bezelView = self->_bezelView;
  self->_bezelView = v6;

  v8 = self->_bezelView;
  if (v8)
  {
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v8, 0);
    -[UISegmentBezelView contentOffsetForSegment:](self->_bezelView, "contentOffsetForSegment:", self);
    v10 = v9 + self->_contentOffset.height;
    self->_contentOffset.width = v11 + self->_contentOffset.width;
    self->_contentOffset.height = v10;
  }
  *(_DWORD *)&self->_segmentFlags |= 0x1000u;
  -[UISegment insertDividerView](self, "insertDividerView");
  -[UISegment _updateTextColors](self, "_updateTextColors");
  -[UIImageView _setAnimatesContents:](self, "_setAnimatesContents:", 1);
}

- (void)insertDividerView
{
  void *v3;
  UIImageView *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  unint64_t rightSegmentState;
  int v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  UIImageView *v24;
  UIImageView *v25;
  double v26;
  void *v27;
  char v28;

  v28 = 0;
  -[UISegment _dividerImageIsCustom:](self, "_dividerImageIsCustom:", &v28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v3);
    -[UIView setTag:](v4, "setTag:", -1030);
    v5 = 1.0;
    if ((*(_DWORD *)&self->_segmentFlags & 0x10) == 0)
      v5 = 0.0;
    -[UIView setAlpha:](v4, "setAlpha:", v5);
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView setEnabled:](v4, "setEnabled:", 0);
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 1);
    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEdgeAntialiasingMask:", 12);

    -[UIView frame](v4, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIView bounds](self, "bounds");
    -[UIImageView setFrame:](v4, "setFrame:", v13 + v14, v8, v10, v12);
    v15 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v15, objc_msgSend(v16, "userInterfaceIdiom"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28 && objc_msgSend(v17, "useSelectionIndicatorStyling"))
    {
      rightSegmentState = self->_rightSegmentState;
      v19 = (rightSegmentState >> 2) & 1 | ((*(_DWORD *)&self->_segmentFlags & 4u) >> 2);
      v20 = rightSegmentState | ((*(_DWORD *)&self->_segmentFlags & 8u) >> 3);
      if ((*(_DWORD *)&self->_segmentFlags & 0x4000) != 0)
        v21 = v20;
      else
        v21 = v19;
      if (objc_msgSend(v17, "useGeneratedImages"))
      {
        -[UIView traitCollection](self, "traitCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class _modernDividerImageBackground:traitCollection:tintColor:size:](v15, "_modernDividerImageBackground:traitCollection:tintColor:size:", 0, v22, 0, *(_DWORD *)&self->_segmentFlags & 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = 0;
      }
      v24 = [UIImageView alloc];
      -[UIView bounds](v4, "bounds");
      v25 = -[UIImageView initWithFrame:](v24, "initWithFrame:");
      -[UIView setAutoresizingMask:](v25, "setAutoresizingMask:", 18);
      -[UIImageView setImage:](v25, "setImage:", v23);
      v26 = 1.0;
      if ((v21 & 1) != 0)
        v26 = 0.0;
      -[UIView setAlpha:](v25, "setAlpha:", v26);
      -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", v25, 0);

    }
    -[UISegment _effectiveBackgroundView](self, "_effectiveBackgroundView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v4);

  }
}

- (void)setSegmentPosition:(unsigned int)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;

  segmentFlags = self->_segmentFlags;
  if (((*(unsigned int *)&segmentFlags >> 6) & 7) != a3)
  {
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFFFE3F | ((a3 & 7) << 6));
    -[UISegment _invalidateInfoConstraints](self, "_invalidateInfoConstraints");
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  -[UIImageView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
}

- (void)setNeedsBackgroundAndContentViewUpdate
{
  *(_DWORD *)&self->_segmentFlags |= 0x1000u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowDivider:(BOOL)a3
{
  int v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (((((*(_DWORD *)&self->_segmentFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFEF | v4);
    -[UISegment _effectiveBackgroundView](self, "_effectiveBackgroundView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewWithTag:", -1030);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1.0;
    if ((*(_DWORD *)&self->_segmentFlags & 0x10) == 0)
      v7 = 0.0;
    objc_msgSend(v5, "setAlpha:", v7);

  }
}

- (UIView)badgeView
{
  return (UIView *)self->_badgeView;
}

- (double)_idealWidth
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_class *v9;
  void *v10;
  double v11;
  double v12;

  width = self->_width;
  if (width <= 0.0)
  {
    -[UISegment contentSize](self, "contentSize");
    v5 = v4;
    v6 = self->_contentOffset.width;
    if (v6 <= 0.0)
    {
      -[UISegment _paddingInsets](self, "_paddingInsets");
      v6 = v7 + v8;
    }
    width = v5 + v6;
  }
  v9 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class _cornerRadiusForTraitCollection:size:](v9, "_cornerRadiusForTraitCollection:size:", v10, -[UISegment controlSize](self, "controlSize"));
  v12 = v11;

  return fmax(v12 + v12, width);
}

- (UIEdgeInsets)_paddingInsets
{
  void *v3;
  double v4;
  double v5;
  objc_class *v6;
  void *v7;
  void *v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:withFallback:](self->_appearanceStorage, "backgroundImageForState:isMini:withFallback:", 0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (v3
    && !-[_UISegmentedControlAppearanceStorage legacySuppressOptionsBackground](self->_appearanceStorage, "legacySuppressOptionsBackground"))
  {
    v5 = 0.0;
    if (objc_msgSend(v3, "_isResizable"))
    {
      objc_msgSend(v3, "capInsets");
      v5 = v11;
      v4 = v12;
    }
  }
  else
  {
    v5 = 0.0;
  }
  v6 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v6, objc_msgSend(v7, "userInterfaceIdiom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "defaultContentPaddingWidth");
  v10 = (*(_DWORD *)&self->_segmentFlags >> 6) & 7;
  switch(v10)
  {
    case 2:
      goto LABEL_11;
    case 1:
      v4 = v9;
LABEL_11:
      v5 = v9;
      break;
    case 0:
      v4 = v9;
      break;
  }
  if (v9 >= v5)
    v5 = v9;
  if (v9 >= v4)
    v4 = v9;

  v13 = 0.0;
  v14 = 0.0;
  v15 = v5;
  v16 = v4;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

- (BOOL)isHovered
{
  return *((_BYTE *)&self->_segmentFlags + 2) & 1;
}

- (void)_invalidateInfoConstraints
{
  UIView *info;

  if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) != 0)
  {
    info = self->_info;
    if (info)
    {
      if (!-[UIView translatesAutoresizingMaskIntoConstraints](info, "translatesAutoresizingMaskIntoConstraints"))
      {
        if (self->_infoConstraints)
          -[UIView removeConstraints:](self, "removeConstraints:");
        -[UISegment _setInfoConstraints:](self, "_setInfoConstraints:", 0);
        -[UIView _setNeedsUpdateConstraints](self, "_setNeedsUpdateConstraints");
      }
    }
  }
}

- (void)layoutSubviews
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  if ((*((_BYTE *)&self->_segmentFlags + 1) & 0x10) == 0)
    -[UISegment _positionInfo](self, "_positionInfo");
  if (self->_bezelView)
  {
    v3 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "limitInternalLayoutAndInteractionToDefaultHeight") & 1) != 0)
    {
      v6 = -[UISegment controlSize](self, "controlSize");
      -[UIView traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultHeightForControlSize:traitCollection:", v6, v7);

    }
    else
    {
      -[UIView bounds](self, "bounds");
    }
    -[UIView bounds](self, "bounds");
    -[UISegmentBezelView setFrame:](self->_bezelView, "setFrame:", 0.0, 0.0);

  }
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UISegment _contentViewIfNeeded]((id *)&self->super.super.super.super.isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[UISegment _updateBackgroundAndContentViewsIfNeeded](self, "_updateBackgroundAndContentViewsIfNeeded");
  v17.receiver = self;
  v17.super_class = (Class)UISegment;
  -[UIImageView layoutSubviews](&v17, sel_layoutSubviews);
}

- (void)_updateBackgroundAndContentViewsIfNeeded
{
  if ((*((_BYTE *)&self->_segmentFlags + 1) & 0x10) != 0)
    -[UISegment _updateBackgroundAndContentViews](self, "_updateBackgroundAndContentViews");
}

- (void)_updateHighlight
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  void (**v12)(_QWORD);
  _QWORD v13[6];

  v3 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "useSelectionIndicatorStyling")
    && objc_msgSend(v5, "animateSlidingSelectionByDefault"))
  {
    -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:withFallback:](self->_appearanceStorage, "backgroundImageForState:isMini:withFallback:", 1, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = *(_DWORD *)&self->_segmentFlags & 0x400C;
        -[UIView traitCollection](self, "traitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "userInterfaceStyle") == 2;

        v11 = dbl_186679260[v10];
        if (v8 != 8)
          v11 = 1.0;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __29__UISegment__updateHighlight__block_invoke;
        v13[3] = &unk_1E16B1888;
        v13[4] = self;
        *(double *)&v13[5] = v11;
        v12 = (void (**)(_QWORD))_Block_copy(v13);
        if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v12, 0, 0.47, 0.0);
        else
          v12[2](v12);

      }
    }
  }

}

- (void)_updateSelectionIndicator
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  int v8;
  int v9;
  void *v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  UISegment *v16;
  uint64_t v17;
  BOOL v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  objc_class *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  objc_class *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _OWORD v66[9];

  v3 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "useSelectionIndicatorStyling"))
    goto LABEL_45;
  if (!+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled")
    || (*((_BYTE *)&self->_segmentFlags + 1) & 0x20) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(v5, "animateSlidingSelectionByDefault");
  }
  segmentFlags = self->_segmentFlags;
  if ((*(_WORD *)&segmentFlags & 0x4000) != 0)
    v8 = 8;
  else
    v8 = 4;
  v9 = v8 & *(_DWORD *)&segmentFlags;
  -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:withFallback:](self->_appearanceStorage, "backgroundImageForState:isMini:withFallback:", 0, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v61 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v62 = v12;
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v63 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v64 = v13;
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v57 = *MEMORY[0x1E0CD2610];
    v58 = v14;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v59 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v60 = v15;
    v53 = v61;
    v54 = v12;
    v55 = v63;
    v56 = v13;
    v49 = v57;
    v50 = v14;
    v51 = v59;
    v52 = v15;
    v16 = self;
    v17 = 1;
LABEL_42:
    -[UISegment _updateSelectionToTransform:infoTransform:hideSelection:shouldAnimate:](v16, "_updateSelectionToTransform:infoTransform:hideSelection:shouldAnimate:", &v57, &v49, v17, v6);
    goto LABEL_45;
  }
  v18 = (*(_DWORD *)&self->_segmentFlags & 0x30000) != 0x10000 && (*(_DWORD *)&self->_segmentFlags & 0x2400) == 0;
  if (v18 && !_AXSReduceMotionEnabled())
  {
    -[UISegment _removeSelectionIndicator](self, "_removeSelectionIndicator");
  }
  else
  {
    if (!self->_selectionIndicatorView)
    {
      -[UISegment _insertSelectionView](self, "_insertSelectionView");
      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[UISegment _effectiveDisableShadow](self, "_effectiveDisableShadow");
      v20 = -[UISegment _effectiveUseDynamicShadow](self, "_effectiveUseDynamicShadow");
      -[UIView traitCollection](self, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegment _effectiveSelectedSegmentTintColor](self, "_effectiveSelectedSegmentTintColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "useGeneratedImages") & 1) != 0)
      {
        -[UIView bounds](self->_selectionImageView, "bounds");
        -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v3, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v19 | v20, 0, v21, v22, *(_DWORD *)&self->_segmentFlags & 3, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      -[UIImageView setImage:](self->_selectionImageView, "setImage:", v25);
      if (v20)
      {
        if (!v19
          && -[objc_class _useShadowForSelectedTintColor:traitCollection:](v3, "_useShadowForSelectedTintColor:traitCollection:", v22, v21))
        {
          -[UISegment _updateDynamicShadow:animated:](self, "_updateDynamicShadow:animated:", 1, 0);
        }
      }
      else
      {
        -[UIView layer](self->_selectionImageView, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v34) = 0;
        objc_msgSend(v33, "setShadowOpacity:", v34);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_38;
      if ((objc_msgSend(v5, "useGeneratedImages") & 1) != 0)
      {
        v26 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
        -[UIView bounds](self->_selectionImageView, "bounds");
        v28 = v27;
        v30 = v29;
        -[UIView traitCollection](self, "traitCollection");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISegment _effectiveSelectedSegmentTintColor](self, "_effectiveSelectedSegmentTintColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v26, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v31, v32, *(_DWORD *)&self->_segmentFlags & 3, v28, v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }
      -[UIImageView setImage:](self->_selectionImageView, "setImage:", v21);
      -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "viewWithTag:", -2030);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v22, "bounds");
          v43 = v42;
          v45 = v44;
          -[UIView traitCollection](self, "traitCollection");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[UISegment _effectiveSelectedSegmentTintColor](self, "_effectiveSelectedSegmentTintColor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v3, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v46, v47, *(_DWORD *)&self->_segmentFlags & 3, v43, v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "setImage:", v48);
        }
      }
    }

  }
LABEL_38:
  if ((~*(_DWORD *)&self->_segmentFlags & 0x4008) != 0)
  {
    v37 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v61 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v62 = v37;
    v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v63 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v64 = v38;
    v39 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v57 = *MEMORY[0x1E0CD2610];
    v58 = v39;
    v40 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v59 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v60 = v40;
    v53 = v61;
    v54 = v37;
    v55 = v63;
    v56 = v38;
    v49 = v57;
    v50 = v39;
    v51 = v59;
    v52 = v40;
    v16 = self;
    v17 = 0;
    goto LABEL_42;
  }
  v35 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    -[objc_class _highlightSelectionTransformForTraitCollection:](v35, "_highlightSelectionTransformForTraitCollection:", v36);
  else
    memset(v66, 0, 128);
  -[UISegment _highlightSelectionInfoTransform](self, "_highlightSelectionInfoTransform");
  -[UISegment _updateSelectionToTransform:infoTransform:hideSelection:shouldAnimate:](self, "_updateSelectionToTransform:infoTransform:hideSelection:shouldAnimate:", v66, v65, 0, v6);

LABEL_45:
}

- (void)_positionInfo
{
  UIView *info;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGRect v39;

  info = self->_info;
  if (!info
    || -[UIView translatesAutoresizingMaskIntoConstraints](info, "translatesAutoresizingMaskIntoConstraints")
    || !self->_infoConstraints)
  {
    -[UIView sizeToFit](self->_info, "sizeToFit");
    -[UISegment contentRect](self, "contentRect");
    v5 = v4;
    v7 = v6;
    -[UIView sizeThatFits:](self->_info, "sizeThatFits:", v4, v6);
    -[UIView setSize:](self->_info, "setSize:");
    -[UIView frame](self->_info, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    if ((*((_BYTE *)&self->_segmentFlags + 1) & 0x82) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIView textSize](self->_info, "textSize");
        if (v16 >= v5)
          v13 = v5;
        else
          v13 = v16;
      }
    }
    if (v13 > v5)
      v13 = v5;
    if (v15 > v7)
      v15 = v7;
    v17 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v17, objc_msgSend(v18, "userInterfaceIdiom"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v19, "useSelectionIndicatorStyling")
      || !objc_msgSend(v19, "animateSlidingSelectionByDefault")
      || (v39.origin.x = v9, v39.origin.y = v11, v39.size.width = v13, v39.size.height = v15, CGRectIsEmpty(v39))
      || (~*(_DWORD *)&self->_segmentFlags & 0x4008) != 0)
    {
      v22 = 0;
    }
    else
    {
      v20 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
      -[UIView traitCollection](self, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        -[objc_class _highlightSelectionTransformForTraitCollection:](v20, "_highlightSelectionTransformForTraitCollection:", v21);
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
      }
      CA_CGRectApplyTransform();
      v15 = v30;

      v22 = 1;
    }
    -[_UISegmentedControlAppearanceStorage contentPositionOffsetForSegment:inMiniBar:](self->_appearanceStorage, "contentPositionOffsetForSegment:inMiniBar:", (((unint64_t)self->_segmentFlags >> 6) & 7) + 1, 0, v31, v32, v33, v34, v35, v36, v37, v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "UIOffsetValue");
    if (v22)
      -[objc_class _selectionOffsetAdjustmentForSegment:](-[UISegment _segmentedControlClass](self, "_segmentedControlClass"), "_selectionOffsetAdjustmentForSegment:", self);
    UIRoundToViewScale(self);
    v26 = v25;
    UIRoundToViewScale(self);
    v28 = v27;
    UICeilToViewScale(self);
    -[UIView setFrame:](self->_info, "setFrame:", v26, v28, v29, v15);

  }
}

- (CGRect)contentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView bounds](self, "bounds");
  -[UISegment _contentRectForBounds:](self, "_contentRectForBounds:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_updateSelectionToTransform:(CATransform3D *)a3 infoTransform:(CATransform3D *)a4 hideSelection:(BOOL)a5 shouldAnimate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
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
  int v28;
  int v29;
  int v30;
  double v31;
  objc_class *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  BOOL v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  UIView *selectionIndicatorView;
  UIImageView *selectionImageView;
  float v54;
  objc_class *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  void *v71;
  objc_class *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  double v90;
  _OWORD v91[8];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _OWORD v100[8];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _OWORD v109[8];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _OWORD v118[8];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _OWORD v127[8];
  _OWORD v128[8];
  _OWORD v129[8];
  _OWORD v130[8];
  CATransform3D b;
  CATransform3D a;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;

  v6 = a6;
  v7 = a5;
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  -[UIView layer](self->_selectionImageView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_selectionImageView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "presentationLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "transform");
    }
    else
    {
      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
    }

  }
  else if (v13)
  {
    objc_msgSend(v13, "transform");
  }
  else
  {
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
  }

  v148 = 0u;
  v147 = 0u;
  v146 = 0u;
  v145 = 0u;
  v144 = 0u;
  v143 = 0u;
  v142 = 0u;
  v141 = 0u;
  -[UIView layer](self->_info, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentationLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_info, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    objc_msgSend(v19, "presentationLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "transform");
    }
    else
    {
      v148 = 0u;
      v147 = 0u;
      v146 = 0u;
      v145 = 0u;
      v144 = 0u;
      v143 = 0u;
      v142 = 0u;
      v141 = 0u;
    }

  }
  else if (v19)
  {
    objc_msgSend(v19, "transform");
  }
  else
  {
    v148 = 0u;
    v147 = 0u;
    v146 = 0u;
    v145 = 0u;
    v144 = 0u;
    v143 = 0u;
    v142 = 0u;
    v141 = 0u;
  }

  -[UIView layer](self->_selectionImageView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentationLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_selectionImageView, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    objc_msgSend(v25, "presentationLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "opacity");
    v29 = v28;

  }
  else
  {
    objc_msgSend(v25, "opacity");
    v29 = v30;
  }

  v140 = 0u;
  v139 = 0u;
  if (v7)
    v31 = 0.0;
  else
    v31 = 1.0;
  v138 = 0uLL;
  v137 = 0uLL;
  v136 = 0uLL;
  v135 = 0uLL;
  v134 = 0uLL;
  v133 = 0uLL;
  if (v7)
  {
    v32 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      -[objc_class _hiddenSelectionTransformForTraitCollection:](v32, "_hiddenSelectionTransformForTraitCollection:", v33);
    }
    else
    {
      v140 = 0u;
      v139 = 0u;
      v138 = 0u;
      v137 = 0u;
      v136 = 0u;
      v135 = 0u;
      v134 = 0u;
      v133 = 0u;
    }

  }
  else
  {
    v34 = *(_OWORD *)&a3->m33;
    v137 = *(_OWORD *)&a3->m31;
    v138 = v34;
    v35 = *(_OWORD *)&a3->m43;
    v139 = *(_OWORD *)&a3->m41;
    v140 = v35;
    v36 = *(_OWORD *)&a3->m13;
    v133 = *(_OWORD *)&a3->m11;
    v134 = v36;
    v37 = *(_OWORD *)&a3->m23;
    v135 = *(_OWORD *)&a3->m21;
    v136 = v37;
  }
  -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "viewWithTag:", -2030);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_33;
  -[UIView layer](self->_info, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
    objc_msgSend(v40, "transform");
  else
    memset(&a, 0, sizeof(a));
  v42 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&b.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&b.m33 = v42;
  v43 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&b.m43 = v43;
  v44 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&b.m13 = v44;
  v45 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&b.m23 = v45;
  v46 = CATransform3DEqualToTransform(&a, &b);

  if (!v46)
  {
    v55 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    v130[4] = v145;
    v130[5] = v146;
    v130[6] = v147;
    v130[7] = v148;
    v130[0] = v141;
    v130[1] = v142;
    v130[2] = v143;
    v130[3] = v144;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v130, "{CATransform3D=dddddddddddddddd}");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *(_OWORD *)&a4->m33;
    v129[4] = *(_OWORD *)&a4->m31;
    v129[5] = v57;
    v58 = *(_OWORD *)&a4->m43;
    v129[6] = *(_OWORD *)&a4->m41;
    v129[7] = v58;
    v59 = *(_OWORD *)&a4->m13;
    v129[0] = *(_OWORD *)&a4->m11;
    v129[1] = v59;
    v60 = *(_OWORD *)&a4->m23;
    v129[2] = *(_OWORD *)&a4->m21;
    v129[3] = v60;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v129, "{CATransform3D=dddddddddddddddd}");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class _selectionPopAnimationForKey:fromValue:toValue:](v55, "_selectionPopAnimationForKey:fromValue:toValue:", CFSTR("transform"), v56, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "setDelegate:", self);
    -[UIView layer](self->_selectionImageView, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    v128[4] = v153;
    v128[5] = v154;
    v128[6] = v155;
    v128[7] = v156;
    v128[0] = v149;
    v128[1] = v150;
    v128[2] = v151;
    v128[3] = v152;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v128, "{CATransform3D=dddddddddddddddd}");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = *(_OWORD *)&a3->m33;
    v127[4] = *(_OWORD *)&a3->m31;
    v127[5] = v66;
    v67 = *(_OWORD *)&a3->m43;
    v127[6] = *(_OWORD *)&a3->m41;
    v127[7] = v67;
    v68 = *(_OWORD *)&a3->m13;
    v127[0] = *(_OWORD *)&a3->m11;
    v127[1] = v68;
    v69 = *(_OWORD *)&a3->m23;
    v127[2] = *(_OWORD *)&a3->m21;
    v127[3] = v69;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v127, "{CATransform3D=dddddddddddddddd}");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class _selectionPopAnimationForKey:fromValue:toValue:](v64, "_selectionPopAnimationForKey:fromValue:toValue:", CFSTR("transform"), v65, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addAnimation:forKey:", v71, CFSTR("SelectionScale"));

    v72 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    v54 = v31;
    LODWORD(v73) = v29;
    *(float *)&v74 = v54;
    -[objc_class _selectionOpacityAnimationFromValue:toValue:](v72, "_selectionOpacityAnimationFromValue:toValue:", v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v7)
      objc_msgSend(v75, "setDelegate:", self);
    -[UIView layer](self->_info, "layer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addAnimation:forKey:", v62, CFSTR("InfoScale"));

    -[UIView layer](self->_selectionImageView, "layer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addAnimation:forKey:", v76, CFSTR("SelectionOpacity"));

    if (v39)
    {
      objc_msgSend(v39, "layer");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "addAnimation:forKey:", v76, CFSTR("SelectionOpacity"));

    }
  }
  else
  {
LABEL_33:
    if (self->_selectionIndicatorView && v7)
    {
      v47 = *(_OWORD *)&a3->m33;
      v123 = *(_OWORD *)&a3->m31;
      v124 = v47;
      v48 = *(_OWORD *)&a3->m43;
      v125 = *(_OWORD *)&a3->m41;
      v126 = v48;
      v49 = *(_OWORD *)&a3->m13;
      v119 = *(_OWORD *)&a3->m11;
      v120 = v49;
      v50 = *(_OWORD *)&a3->m23;
      v121 = *(_OWORD *)&a3->m21;
      v122 = v50;
      -[UIView layer](self->_info, "layer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v118[4] = v123;
      v118[5] = v124;
      v118[6] = v125;
      v118[7] = v126;
      v118[0] = v119;
      v118[1] = v120;
      v118[2] = v121;
      v118[3] = v122;
      objc_msgSend(v51, "setTransform:", v118);

      -[UIView removeFromSuperview](self->_selectionIndicatorView, "removeFromSuperview");
      selectionIndicatorView = self->_selectionIndicatorView;
      self->_selectionIndicatorView = 0;

      selectionImageView = self->_selectionImageView;
      self->_selectionImageView = 0;

      if (v39)
        objc_msgSend(v39, "removeFromSuperview");
      goto LABEL_44;
    }
    v54 = v31;
  }
  v80 = *(_OWORD *)&a4->m33;
  v114 = *(_OWORD *)&a4->m31;
  v115 = v80;
  v81 = *(_OWORD *)&a4->m43;
  v116 = *(_OWORD *)&a4->m41;
  v117 = v81;
  v82 = *(_OWORD *)&a4->m13;
  v110 = *(_OWORD *)&a4->m11;
  v111 = v82;
  v83 = *(_OWORD *)&a4->m23;
  v112 = *(_OWORD *)&a4->m21;
  v113 = v83;
  -[UIView layer](self->_info, "layer");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v114;
  v109[5] = v115;
  v109[6] = v116;
  v109[7] = v117;
  v109[0] = v110;
  v109[1] = v111;
  v109[2] = v112;
  v109[3] = v113;
  objc_msgSend(v84, "setTransform:", v109);

  v105 = v137;
  v106 = v138;
  v107 = v139;
  v108 = v140;
  v101 = v133;
  v102 = v134;
  v103 = v135;
  v104 = v136;
  -[UIView layer](self->_selectionImageView, "layer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v105;
  v100[5] = v106;
  v100[6] = v107;
  v100[7] = v108;
  v100[0] = v101;
  v100[1] = v102;
  v100[2] = v103;
  v100[3] = v104;
  objc_msgSend(v85, "setTransform:", v100);

  -[UIView layer](self->_selectionImageView, "layer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v87 = v54;
  objc_msgSend(v86, "setOpacity:", v87);

  if (v39)
  {
    v96 = v137;
    v97 = v138;
    v98 = v139;
    v99 = v140;
    v92 = v133;
    v93 = v134;
    v94 = v135;
    v95 = v136;
    objc_msgSend(v39, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v91[4] = v96;
    v91[5] = v97;
    v91[6] = v98;
    v91[7] = v99;
    v91[0] = v92;
    v91[1] = v93;
    v91[2] = v94;
    v91[3] = v95;
    objc_msgSend(v88, "setTransform:", v91);

    objc_msgSend(v39, "layer");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v90 = v54;
    objc_msgSend(v89, "setOpacity:", v90);

  }
LABEL_44:

}

- (void)_removeSelectionIndicator
{
  UIView *selectionIndicatorView;
  UIView *v4;
  UIImageView *selectionImageView;

  selectionIndicatorView = self->_selectionIndicatorView;
  if (selectionIndicatorView)
  {
    -[UIView removeFromSuperview](selectionIndicatorView, "removeFromSuperview");
    v4 = self->_selectionIndicatorView;
    self->_selectionIndicatorView = 0;

    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = 0;

  }
}

- (UISegment)initWithCoder:(id)a3
{
  id v4;
  UISegment *v5;
  UISegment *v6;
  void *v7;
  void *v8;
  float v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  v5 = -[UIImageView initWithCoder:](&v13, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentsCenter:", 0.0, 0.0, 1.0, 1.0);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISegmentInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegment setObjectValue:](v6, "setObjectValue:", v8);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UISegmentWidth"));
    v6->_width = v9;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UISegmentContentOffset"));
    v6->_contentOffset.width = v10;
    v6->_contentOffset.height = v11;
    v6->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v6->_segmentFlags & 0xFFFFFFFC | objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISegmentSize")) & 3);
    v6->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v6->_segmentFlags & 0xFFFFFE3F | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISegmentPosition")) & 7) << 6));
    -[UISegment _finishInitialSegmentSetup](v6, "_finishInitialSegmentSetup");
  }

  return v6;
}

- (id)_effectiveSelectedSegmentTintColor
{
  void *v2;
  void *v3;

  -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedSegmentTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_effectiveUseDynamicShadow
{
  void *v2;
  char v3;

  -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_useDynamicShadow");

  return v3;
}

- (id)_effectiveVisualEffect
{
  void *v2;
  void *v3;

  -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__selectedSegmentVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_tintColorArchivingKey
{
  return CFSTR("UISegmentTintColor");
}

- (id)_encodableSubviews
{
  void *v2;
  void *v3;

  -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISegment;
  -[UIView _populateArchivedSubviews:](&v7, sel__populateArchivedSubviews_, v4);
  if (self->_info)
    objc_msgSend(v4, "removeObject:");
  -[UISegment _effectiveBackgroundView](self, "_effectiveBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewWithTag:", -1030);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "removeObject:", v6);
  if (self->_infoContentView)
    objc_msgSend(v4, "removeObject:");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double width;
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  -[UIImageView image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView highlightedImage](self, "highlightedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView removeFromSuperview](self->_selectionIndicatorView, "removeFromSuperview");
  -[UIImageView setImage:](self, "setImage:", 0);
  -[UIImageView setHighlightedImage:](self, "setHighlightedImage:", 0);
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  -[UIImageView encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  -[UIImageView setImage:](self, "setImage:", v5);
  -[UIImageView setHighlightedImage:](self, "setHighlightedImage:", v6);
  -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:below:", self->_selectionIndicatorView, self->_info);

  -[UISegment objectValue](self, "objectValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "string");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UISegmentInfo"));
  width = self->_width;
  if (width != 0.0)
  {
    *(float *)&width = width;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UISegmentWidth"), width);
  }
  if (self->_contentOffset.width != 0.0 || self->_contentOffset.height != 0.0)
    objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("UISegmentContentOffset"));
  objc_msgSend(v4, "encodeInteger:forKey:", 5, CFSTR("UISegmentStyle"));
  segmentFlags = self->_segmentFlags;
  if ((*(_BYTE *)&segmentFlags & 3) != 0)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    segmentFlags = self->_segmentFlags;
  }
  v12 = (*(unsigned int *)&segmentFlags >> 6) & 7;
  if ((_DWORD)v12)
    objc_msgSend(v4, "encodeInteger:forKey:", v12, CFSTR("UISegmentPosition"));

}

- (void)dealloc
{
  objc_super v3;

  -[UISegment setObjectValue:](self, "setObjectValue:", 0);
  -[UIView removeFromSuperview](self->_badgeView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  -[UIImageView dealloc](&v3, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISegment;
  -[UIImageView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[UISegment _updateTextColors](self, "_updateTextColors");
}

- (id)_dividerImage
{
  return -[UISegment _dividerImageIsCustom:](self, "_dividerImageIsCustom:", 0);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UIImageView *selectionImageView;
  UIView *selectionIndicatorView;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a4;
  v6 = a3;
  if ((*(_BYTE *)&self->_segmentFlags & 0xC) != 0)
  {
    if (!v4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v11 = v6;
  -[UIView removeFromSuperview](self->_selectionIndicatorView, "removeFromSuperview");
  selectionImageView = self->_selectionImageView;
  self->_selectionImageView = 0;

  selectionIndicatorView = self->_selectionIndicatorView;
  self->_selectionIndicatorView = 0;

  -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewWithTag:", -2030);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v10, "removeFromSuperview");

  v6 = v11;
  if (v4)
  {
LABEL_7:
    if ((*(_BYTE *)&self->_segmentFlags & 8) == 0)
    {
      v12 = v6;
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      v6 = v12;
    }
  }
LABEL_9:

}

- (void)_updateDynamicShadow:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  objc_class *v7;
  UIView *selectionIndicatorView;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  v7 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  selectionIndicatorView = self->_selectionIndicatorView;
  -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = -[objc_class _updateDynamicShadowView:withAnimationDelegate:useDynamicShadow:animated:](v7, "_updateDynamicShadowView:withAnimationDelegate:useDynamicShadow:animated:", selectionIndicatorView, v9, v5, v4);

  if ((_DWORD)v4)
  {
    -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setAnimatingOutDynamicShdaow:", 1);

  }
}

- (void)_insertSelectionView
{
  objc_class *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_class *v22;
  void *v23;
  void *v24;
  UIVisualEffectView *v25;
  UIView *selectionIndicatorView;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  UIImageView *v32;
  void *v33;
  UIImageView *v34;
  UIImageView *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UIImageView *v40;
  UIImageView *selectionImageView;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  UISegment *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;

  v3 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = *(_DWORD *)&self->_segmentFlags & 3;
  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class _selectionFrameForBounds:size:traitCollection:accessibilityView:](v3, "_selectionFrameForBounds:size:traitCollection:accessibilityView:", v12, v13, (*(_DWORD *)&self->_segmentFlags >> 13) & 1, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UISegment _effectiveVisualEffect](self, "_effectiveVisualEffect");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v22, objc_msgSend(v24, "userInterfaceIdiom"));
  v43 = (id)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v30 = -[UISegment _effectiveDisableShadow](self, "_effectiveDisableShadow");
    v31 = -[UISegment _effectiveUseDynamicShadow](self, "_effectiveUseDynamicShadow");
    -[UIView traitCollection](self, "traitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegment _effectiveSelectedSegmentTintColor](self, "_effectiveSelectedSegmentTintColor");
    v32 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "useGeneratedImages"))
    {
      -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v22, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v30 | v31, 0, v29, v32, *(_DWORD *)&self->_segmentFlags & 3, v19, v21);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    v40 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v33);
    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = v40;

    objc_storeStrong((id *)&self->_selectionIndicatorView, self->_selectionImageView);
    if (!v30
      && -[objc_class _useShadowForSelectedTintColor:traitCollection:](v22, "_useShadowForSelectedTintColor:traitCollection:", v32, v29))
    {
      -[UISegment _updateDynamicShadow:animated:](self, "_updateDynamicShadow:animated:", 1, 0);
    }

    goto LABEL_20;
  }
  v25 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v23);
  selectionIndicatorView = self->_selectionIndicatorView;
  self->_selectionIndicatorView = &v25->super;

  -[UIView setAutoresizingMask:](self->_selectionIndicatorView, "setAutoresizingMask:", 18);
  if (objc_msgSend(v43, "useGeneratedImages"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegment _effectiveSelectedSegmentTintColor](self, "_effectiveSelectedSegmentTintColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v22, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v27, v28, *(_DWORD *)&self->_segmentFlags & 3, v19, v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  v34 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v29);
  v35 = self->_selectionImageView;
  self->_selectionImageView = v34;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView contentView](self->_selectionIndicatorView, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", self->_selectionImageView);

  }
  else
  {
    -[UIView setMaskView:](self->_selectionIndicatorView, "setMaskView:", self->_selectionImageView);
  }
  if (objc_msgSend(v43, "hasShadowWithSelectedSegmentEffect", v43)
    && objc_msgSend(v43, "useGeneratedImages"))
  {
    objc_msgSend(v43, "createSelectedSegmentEffectShadowView");
    v32 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      -[UIView traitCollection](self, "traitCollection");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegment _effectiveSelectedSegmentTintColor](self, "_effectiveSelectedSegmentTintColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v22, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v37, v38, *(_DWORD *)&self->_segmentFlags & 3, v19, v21);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v29);
    }
    -[UIView setTag:](v32, "setTag:", -2030);
    -[UIView setAutoresizingMask:](v32, "setAutoresizingMask:", 18);
LABEL_20:

  }
  -[UIView setAutoresizingMask:](self->_selectionImageView, "setAutoresizingMask:", 18);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __33__UISegment__insertSelectionView__block_invoke;
  v44[3] = &unk_1E16BDF18;
  v48 = v15;
  v49 = v17;
  v50 = v19;
  v51 = v21;
  v45 = 0;
  v46 = self;
  v47 = v23;
  v42 = v23;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v44);

}

void __33__UISegment__insertSelectionView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  _OWORD v15[8];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[8];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "_segmentedControlClass");
    objc_msgSend(*(id *)(a1 + 40), "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "_hiddenSelectionTransformForTraitCollection:", v4);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
    }
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v29;
    v24[5] = v30;
    v24[6] = v31;
    v24[7] = v32;
    v24[0] = v25;
    v24[1] = v26;
    v24[2] = v27;
    v24[3] = v28;
    objc_msgSend(v5, "setTransform:", v24);

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 0;
    objc_msgSend(v6, "setOpacity:", v7);

    -[UISegment _effectiveContentView](*(id **)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSubview:below:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 512));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "setFrame:");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 536), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "_segmentedControlClass");
  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "_hiddenSelectionTransformForTraitCollection:", v10);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 536), "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v20;
  v15[5] = v21;
  v15[6] = v22;
  v15[7] = v23;
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  v15[3] = v19;
  objc_msgSend(v11, "setTransform:", v15);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 536), "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 0;
  objc_msgSend(v12, "setOpacity:", v13);

  -[UISegment _effectiveContentView](*(id **)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertSubview:below:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 528), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 512));

}

- (CATransform3D)_highlightSelectionInfoTransform
{
  objc_class *v5;
  void *v6;
  CATransform3D *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGFloat v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CATransform3D v17;
  CATransform3D v18;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  v5 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[objc_class _highlightSelectionTransformForTraitCollection:](v5, "_highlightSelectionTransformForTraitCollection:", v6);
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  if ((*((_BYTE *)&self->_segmentFlags + 1) & 0x20) == 0)
  {
    -[objc_class _selectionOffsetAdjustmentForSegment:](-[UISegment _segmentedControlClass](self, "_segmentedControlClass"), "_selectionOffsetAdjustmentForSegment:", self);
    v8 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v17.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v17.m33 = v8;
    v9 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v17.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v17.m43 = v9;
    v10 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v17.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v17.m13 = v10;
    v11 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v17.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v17.m23 = v11;
    result = CATransform3DTranslate(&v18, &v17, v12, 0.0, 0.0);
    v13 = *(_OWORD *)&v18.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v18.m31;
    *(_OWORD *)&retstr->m33 = v13;
    v14 = *(_OWORD *)&v18.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v18.m41;
    *(_OWORD *)&retstr->m43 = v14;
    v15 = *(_OWORD *)&v18.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v18.m11;
    *(_OWORD *)&retstr->m13 = v15;
    v16 = *(_OWORD *)&v18.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v18.m21;
    *(_OWORD *)&retstr->m23 = v16;
  }
  return result;
}

- (BOOL)_hasSelectedColor
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)off_1E1678D98);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setWasSelected:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_segmentFlags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 2048;
    else
      v3 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFF7FF | v3);
    -[UISegment updateMasking](self, "updateMasking");
  }
}

- (void)setUsesAXTextSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFDFFF | v3);
}

- (id)disabledTextColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  -[_UISegmentedControlAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)off_1E1678D98;
  v5 = objc_msgSend(v3, "containsObject:", *(_QWORD *)off_1E1678D98);

  if (v5)
  {
    objc_msgSend(v2, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
  }
}

- (void)setTintColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  -[UIView setTintColor:](&v3, sel_setTintColor_, a3);
}

- (void)setAutosizeText:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  int v4;
  uint64_t v6;
  UIView *v7;

  segmentFlags = self->_segmentFlags;
  if (a3)
    v4 = 512;
  else
    v4 = 0;
  self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFFFDFF | v4);
  if ((*(_DWORD *)&segmentFlags & 0x40020) == 0)
  {
    v6 = a3 | ((unsigned __int16)(*(_WORD *)&segmentFlags & 0x8000) >> 15);
    v7 = self->_info;
    -[UIView setAdjustsFontSizeToFitWidth:](v7, "setAdjustsFontSizeToFitWidth:", v6);
    -[UISegment _positionInfo](self, "_positionInfo");

  }
}

- (void)setAdjustsForContentSizeCategory:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  int v4;
  uint64_t v6;
  UIView *v7;

  segmentFlags = self->_segmentFlags;
  if (a3)
    v4 = 0x8000;
  else
    v4 = 0;
  self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFF7FFF | v4);
  if ((*(_DWORD *)&segmentFlags & 0x40020) == 0)
  {
    v6 = a3 | ((unsigned __int16)(*(_WORD *)&segmentFlags & 0x200) >> 9);
    v7 = self->_info;
    -[UIView setAdjustsFontSizeToFitWidth:](v7, "setAdjustsFontSizeToFitWidth:", v6);
    -[UISegment _positionInfo](self, "_positionInfo");

  }
}

- (BOOL)isSelected
{
  return (*(_BYTE *)&self->_segmentFlags >> 2) & 1;
}

- (void)setSelected:(BOOL)a3 highlighted:(BOOL)a4
{
  int v5;
  int v6;

  if (((((*(_DWORD *)&self->_segmentFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a4)
      v5 = 8;
    else
      v5 = 0;
    if (a3)
      v6 = 4;
    else
      v6 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(v5 | v6 | *(_DWORD *)&self->_segmentFlags & 0xFFFFFFF3);
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
    -[UISegment updateMasking](self, "updateMasking");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[UISegment _setHighlighted:animated:](self, "_setHighlighted:animated:", a3, 0);
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  int v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (((((*(_DWORD *)&self->_segmentFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    v4 = a4;
    v5 = a3;
    if (a3)
      v7 = 8;
    else
      v7 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFF7 | v7);
    v8 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v8, objc_msgSend(v9, "userInterfaceIdiom"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "useTVStyleFocusSelection"))
    {
      if (v5)
        v10 = 9;
      else
        v10 = 8;
      -[UISegment _floatingContentView]((id *)&self->super.super.super.super.isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setControlState:animated:", v10, v4);

    }
    -[UISegment _evaluateHighlight](self, "_evaluateHighlight");
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");

  }
}

- (BOOL)isSelectionIndicatorDragged
{
  return (*((unsigned __int8 *)&self->_segmentFlags + 1) >> 6) & 1;
}

- (void)setHovered:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  int v4;
  _QWORD v5[5];

  segmentFlags = self->_segmentFlags;
  if (((((*(_DWORD *)&segmentFlags & 0x10000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x10000;
    else
      v4 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFEFFFF | v4);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __24__UISegment_setHovered___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }
}

uint64_t __24__UISegment_setHovered___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSelectionIndicator");
}

- (BOOL)isAnimatingSelectionIndicator
{
  return (*((unsigned __int8 *)&self->_segmentFlags + 2) >> 1) & 1;
}

- (void)setAnimatingSelectionIndicator:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags;
  int v5;
  objc_class *v6;
  void *v7;
  id v8;

  segmentFlags = self->_segmentFlags;
  if (((((*(_DWORD *)&segmentFlags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 0x20000;
    else
      v5 = 0;
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFDFFFF | v5);
    v6 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v6, objc_msgSend(v7, "userInterfaceIdiom"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "useSelectionIndicatorStyling"))
      -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");

  }
}

- (NSString)badgeValue
{
  return self->_badgeValue;
}

- (void)setBadgeValue:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *badgeValue;
  _UIBadgeView *badgeView;
  _UIBadgeView *v9;
  _UIBadgeView *v10;
  NSString *v11;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_badgeValue != v4)
  {
    v11 = v4;
    v6 = (NSString *)-[NSString copy](v4, "copy");
    badgeValue = self->_badgeValue;
    self->_badgeValue = v6;

    badgeView = self->_badgeView;
    if (self->_badgeValue)
    {
      if (badgeView)
      {
        -[_UIBadgeView setText:](badgeView, "setText:");
LABEL_9:
        v5 = v11;
        goto LABEL_10;
      }
      v10 = -[_UIBadgeView initWithText:]([_UIBadgeView alloc], "initWithText:", self->_badgeValue);
      v9 = self->_badgeView;
      self->_badgeView = v10;
LABEL_8:

      goto LABEL_9;
    }
    v5 = v11;
    if (badgeView)
    {
      -[UIView removeFromSuperview](badgeView, "removeFromSuperview");
      v9 = self->_badgeView;
      self->_badgeView = 0;
      goto LABEL_8;
    }
  }
LABEL_10:

}

- (BOOL)_isContainedInHostedFocusSystem
{
  return 1;
}

- (BOOL)isRightSelected
{
  return (LOBYTE(self->_rightSegmentState) >> 2) & 1;
}

- (BOOL)isRightHighlighted
{
  return self->_rightSegmentState & 1;
}

- (BOOL)isMomentary
{
  return (*((unsigned __int8 *)&self->_segmentFlags + 1) >> 2) & 1;
}

- (void)setControlSize:(int)a3
{
  if ((*(_DWORD *)&self->_segmentFlags & 3) != a3)
  {
    self->_segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFFC | a3 & 3);
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
    -[UISegment _invalidateInfoConstraints](self, "_invalidateInfoConstraints");
  }
}

- (BOOL)showDivider
{
  return (*(_BYTE *)&self->_segmentFlags >> 4) & 1;
}

- (void)animateAdd:(BOOL)a3
{
  UIView *info;
  double v4;

  info = self->_info;
  v4 = 1.0;
  if (a3)
    v4 = 0.0;
  -[UIView setAlpha:](info, "setAlpha:", v4);
}

- (void)animateRemoveForWidth:(double)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[UIView frame](self->_info, "frame");
  -[UIView setFrame:](self->_info, "setFrame:", v5 + a3);
  -[UIView setAlpha:](self->_info, "setAlpha:", 0.0);
  if ((*(_BYTE *)&self->_segmentFlags & 0x10) != 0)
  {
    -[UISegment _effectiveBackgroundView](self, "_effectiveBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewWithTag:", -1030);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIView bounds](self, "bounds");
    objc_msgSend(v15, "setFrame:", v14 + v13 * 0.5 + a3, v8, v10, v12);

  }
}

- (void)removeFromSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
}

- (void)_positionInfoWithoutAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__UISegment__positionInfoWithoutAnimation__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

uint64_t __42__UISegment__positionInfoWithoutAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_positionInfo");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  -[UIImageView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
    -[UISegment setNeedsBackgroundAndContentViewUpdate](self, "setNeedsBackgroundAndContentViewUpdate");
}

- (unsigned)segmentPosition
{
  return (*(_DWORD *)&self->_segmentFlags >> 6) & 7;
}

- (id)label
{
  UIView *info;

  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) != 0)
    return 0;
  info = self->_info;
  if (!info)
    return 0;
  else
    return info;
}

- (void)setContentOffset:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_contentOffset;
  UISegmentBezelView *bezelView;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  p_contentOffset = &self->_contentOffset;
  if (a3.width != self->_contentOffset.width || a3.height != self->_contentOffset.height)
    -[UISegment _invalidateInfoConstraints](self, "_invalidateInfoConstraints");
  p_contentOffset->width = width;
  p_contentOffset->height = height;
  bezelView = self->_bezelView;
  if (bezelView)
  {
    -[UISegmentBezelView contentOffsetForSegment:](bezelView, "contentOffsetForSegment:", self);
    p_contentOffset->height = v10 + p_contentOffset->height + v9;
  }
  if (self->_info)
    -[UISegment _positionInfo](self, "_positionInfo");
}

- (void)setRequestedScaleFactor:(double)a3
{
  if (self->_requestedScaleFactor != a3)
  {
    self->_requestedScaleFactor = a3;
    if (self->_info)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UISegment _positionInfo](self, "_positionInfo");
    }
  }
}

unint64_t __28__UISegment_setObjectValue___block_invoke(uint64_t a1)
{
  unint64_t result;
  __int128 v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    v4 = 0;
    *(_QWORD *)&v3 = 138412290;
    v10 = v3;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isActive"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v10;
            v12 = v5;
            _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "This is a UIKit bug. Constraint should have been deactivated when baseline view was removed from superview. cn = %@", buf, 0xCu);
          }

        }
        else
        {
          v7 = __segmentedControlIdiomsToStyleProviders_block_invoke___s_category;
          if (!__segmentedControlIdiomsToStyleProviders_block_invoke___s_category)
          {
            v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v7, (unint64_t *)&__segmentedControlIdiomsToStyleProviders_block_invoke___s_category);
          }
          v8 = *(NSObject **)(v7 + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v10;
            v12 = v5;
            _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "This is a UIKit bug. Constraint should have been deactivated when baseline view was removed from superview. cn = %@", buf, 0xCu);
          }
        }
      }
      if (objc_msgSend(v5, "isActive"))
      {
        objc_msgSend(v5, "_containerGeometryDidChange");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addConstraint:", v5);

      }
      ++v4;
      result = objc_msgSend(*(id *)(a1 + 32), "count");
    }
    while (v4 < result);
  }
  return result;
}

- (void)_forceInfoDisplay
{
  id v3;

  -[UISegment _updateBackgroundAndContentViews](self, "_updateBackgroundAndContentViews");
  -[UIView layer](self->_info, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayIfNeeded");

}

uint64_t __24__UISegment__effectView__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 40;
  if ((*(_DWORD *)(v1 + 632) & 4) == 0)
    v2 = 48;
  return objc_msgSend(*(id *)(v1 + 560), "setEffect:", *(_QWORD *)(a1 + v2));
}

void __33__UISegment__floatingContentView__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setFocusedSizeIncrease:", 4.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowRadius:", 16.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowExpansion:", 35.0, 25.0);
  objc_msgSend(*(id *)(a1 + 32), "focusAnimationConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnfocusingBaseDuration:", 0.1);

}

- (void)_updateFloatingContentControlState:(unint64_t)a3 context:(id)a4 withAnimationCoordinator:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v9;
  void *v10;
  void *v11;
  _UISegmentedControlContentView *infoContentView;
  id v13;

  v6 = a6;
  v13 = a5;
  v9 = -[UISegment _segmentedControlClass](self, "_segmentedControlClass");
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v9, objc_msgSend(v10, "userInterfaceIdiom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "useTVStyleFocusSelection"))
  {
    infoContentView = self->_infoContentView;
    if (infoContentView)
    {
      if (v13)
        -[_UISegmentedControlContentView setControlState:withAnimationCoordinator:](infoContentView, "setControlState:withAnimationCoordinator:", a3, v13);
      else
        -[_UISegmentedControlContentView setControlState:animated:](infoContentView, "setControlState:animated:", a3, v6);
    }
  }

}

- (id)parentFocusEnvironment
{
  void *v2;
  void *v3;

  -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_internalFocusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UISegment *v12;
  UISegment *v13;
  _BOOL4 v14;
  UISegment *v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UISegment;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v17, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, v7);
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  UISegmentedControlStyleProviderForIdiom(-[UISegment _segmentedControlClass](self, "_segmentedControlClass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 == 3 || objc_msgSend(v10, "useTVStyleFocusSelection"))
  {
    if (objc_msgSend(v11, "useTVStyleFocusSelection"))
    {
      objc_msgSend(v6, "nextFocusedItem");
      v12 = (UISegment *)objc_claimAutoreleasedReturnValue();
      if (v12 == self)
      {

      }
      else
      {
        v13 = v12;
        v14 = -[UISegment isHighlighted](self, "isHighlighted");

        if (v14)
          -[UISegment setHighlighted:](self, "setHighlighted:", 0);
      }
      objc_msgSend(v6, "nextFocusedItem");
      v15 = (UISegment *)objc_claimAutoreleasedReturnValue();
      v16 = 8 * (v15 == self);

      -[UISegment _updateFloatingContentControlState:context:withAnimationCoordinator:animated:](self, "_updateFloatingContentControlState:context:withAnimationCoordinator:animated:", v16, v6, v7, 1);
    }
    -[UISegment _updateTextColors](self, "_updateTextColors");
    -[UISegment _updateBackgroundAndContentViews](self, "_updateBackgroundAndContentViews");
  }

}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  -[UISegment _floatingContentView]((id *)&self->super.super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UISegment _floatingContentView]((id *)&self->super.super.super.super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preferredConfigurationForFocusAnimation:inContext:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISegment;
    -[UIView _preferredConfigurationForFocusAnimation:inContext:](&v11, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)focusEffect
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  -[UISegment _parentSegmentedControl](self, "_parentSegmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cornerRadiusForTraitCollection:size:", v5, -[UISegment controlSize](self, "controlSize"));
  v7 = v6;

  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v3, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cornerCurve");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", v17, v9, v11, v13, v15, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setReferenceView:", v3);
  return v18;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  UISegment *v6;
  UISegment *v7;
  UISegment *v8;
  uint64_t v9;

  v5 = a4;
  v6 = self;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[UIView superview](v8, "superview");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (UISegment *)v9;
      if (!v9)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = v7;
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  UISegment *v4;
  UISegment *v5;
  UISegment *v6;
  uint64_t v7;

  v4 = self;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[UIView superview](v6, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (UISegment *)v7;
      if (!v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = v5;
  }
  return v6;
}

- (BOOL)useBlockyMagnificationInClassic
{
  return 0;
}

- (id)viewForLastBaselineLayout
{
  objc_super v3;

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x800) == 0)
    return self->_info;
  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  -[UIView viewForLastBaselineLayout](&v3, sel_viewForLastBaselineLayout);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  -[UIView sizeThatFits:](self->_info, "sizeThatFits:", a3.width);
  -[UIView _baselineOffsetsAtSize:](self->_info, "_baselineOffsetsAtSize:");
  v6 = v5;
  -[_UISegmentedControlAppearanceStorage contentPositionOffsetForSegment:inMiniBar:](self->_appearanceStorage, "contentPositionOffsetForSegment:inMiniBar:", (((unint64_t)self->_segmentFlags >> 6) & 7) + 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "UIOffsetValue");
  UIRoundToViewScale(self);
  v10 = v9;
  -[UIView alignmentRectInsets](self->_info, "alignmentRectInsets");
  v12 = v6 + v10 + v11;

  v13 = v12;
  v14 = height - v12;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (NSArray)_infoConstraints
{
  return self->_infoConstraints;
}

- (void)_setInfoConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (UIAction)action
{
  return self->_action;
}

- (double)requestedScaleFactor
{
  return self->_requestedScaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_infoConstraints, 0);
  objc_storeStrong(&self->_objectValue, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_infoContentView, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_bezelView, 0);
  objc_storeStrong((id *)&self->_selectionImageView, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
