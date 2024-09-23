@implementation UISegmentedControl

uint64_t __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAlpha:(double)a3
{
  _BOOL4 v5;
  double v6;
  objc_super v8;

  v5 = -[UIControl isEnabled](self, "isEnabled");
  v6 = 0.5;
  if (a3 < 0.5 || v5)
    v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISegmentedControl;
  -[UIView setAlpha:](&v8, sel_setAlpha_, v6);
}

- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state
{
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UISegmentedControl _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", attributes);
  if (state == 4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_segments;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "updateMasking", (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id appearanceStorage;
  _UISegmentedControlAppearanceStorage *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6)
  {
    if (!appearanceStorage)
    {
      v8 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(self->_appearanceStorage, "textAttributesForState:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v11 | v10)
  {
    if ((objc_msgSend((id)v11, "isEqualToDictionary:", v10) & 1) == 0)
    {
      objc_msgSend(self->_appearanceStorage, "setTextAttributes:forState:", v11, a4);
      -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
    }
  }

}

- (void)_setNeedsAppearanceUpdate
{
  *(_DWORD *)&self->_segmentedControlFlags |= 0x800u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

+ (id)_modernBackgroundSelected:(BOOL)a3 shadow:(int64_t)a4 maximumSize:(CGSize)a5 highlighted:(BOOL)a6 traitCollection:(id)a7 tintColor:(id)a8 size:(int)a9
{
  uint64_t v9;
  _BOOL8 v11;
  double height;
  double width;
  _BOOL8 v14;
  id v16;
  id v17;
  CGColor *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int64_t v38;
  _UISegmentedControlCacheKey *v39;
  double v40;
  _UISegmentedControlCacheKey *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  int v46;
  void *v47;
  char v48;
  _QWORD *ContextStack;
  CGContext *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  id v65;
  CGColor *v66;
  _QWORD *v67;
  CGContext *v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  uint64_t v73;
  id v75;
  CGSize v77;
  CGRect v78;

  v9 = *(_QWORD *)&a9;
  v11 = a6;
  height = a5.height;
  width = a5.width;
  v14 = a3;
  v16 = a7;
  v17 = a8;
  if (qword_1ECD7A188 != -1)
    dispatch_once(&qword_1ECD7A188, &__block_literal_global_685);
  v18 = (CGColor *)objc_msgSend(a1, "_backgroundPrimaryColorSelected:highlighted:traitCollection:tintColor:", v14, v11, v16, v17);
  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(v16, "userInterfaceIdiom"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "useSelectionIndicatorStyling");
  objc_msgSend(a1, "_cornerRadiusForTraitCollection:size:", v16, v9);
  v22 = v21;
  objc_msgSend(a1, "_sectionIndicatorInsetForTraitCollection:size:", v16, v9);
  v24 = v23;
  objc_msgSend(a1, "_sectionIndicatorOverflowForTraitCollection:size:", v16, v9);
  v26 = v24 + v25;
  if (v20 & v14)
    v27 = v24;
  else
    v27 = 0.0;
  v28 = v22 - v27;
  v29 = objc_msgSend(v19, "usesContinuousCurveCorners");
  v30 = ceil(v28 * 1.528665);
  if (!v29)
    v30 = v28;
  if ((v14 || v11) & v20)
    v31 = v26;
  else
    v31 = 0.0;
  v32 = v31 + v30;
  v33 = 2.0;
  if (!(v20 ^ 1 | v14))
    v33 = 1.0;
  v34 = ceil(v28) + v31;
  v35 = width * v33 * 0.5;
  if (v32 < v35)
    v35 = v32;
  if (v34 >= v35)
    v36 = v34;
  else
    v36 = v35;
  if (v32 >= height * 0.5)
    v32 = height * 0.5;
  if (v34 >= v32)
    v37 = v34;
  else
    v37 = v32;
  if ((unint64_t)a4 < 3 && v14)
    v38 = a4 + 1;
  else
    v38 = 0;
  v39 = [_UISegmentedControlCacheKey alloc];
  objc_msgSend(v16, "displayScale");
  v41 = -[_UISegmentedControlCacheKey initWithCornerRadius:capSize:scale:state:primaryColor:](v39, "initWithCornerRadius:capSize:scale:state:primaryColor:", v38, v18, v22, v36, v37, v40);
  objc_msgSend((id)qword_1ECD7A180, "objectForKey:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    v75 = v17;
    v43 = v36 + v36 + 1.0;
    v44 = v37 + v37 + 1.0;
    objc_msgSend(v16, "displayScale");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v43, v44, v45);
    v46 = objc_msgSend(v19, "useSelectionIndicatorStyling");
    v47 = v19;
    v48 = v46;
    if (v46)
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v50 = 0;
      else
        v50 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      v60 = &qword_1ECD7A000;
      CGContextSetFillColorWithColor(v50, v18);
      v64 = 0.0;
      if (v14)
      {
        if (a4 != 1 && CGColorGetAlpha(v18) >= 1.0)
        {
          +[UIColor _controlShadowColor](UIColor, "_controlShadowColor");
          v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v66 = (CGColor *)objc_msgSend(v65, "CGColor");

          v67 = GetContextStack(0);
          if (*(int *)v67 < 1)
            v68 = 0;
          else
            v68 = (CGContext *)v67[3 * (*(_DWORD *)v67 - 1) + 1];
          v77.width = 0.0;
          v77.height = 2.5;
          CGContextSetShadowWithColor(v68, v77, 6.0, v66);
        }
        v78.origin.x = 0.0;
        v78.origin.y = 0.0;
        v78.size.width = v36 + v36 + 1.0;
        v78.size.height = v37 + v37 + 1.0;
        *(CGRect *)&v64 = CGRectInset(v78, v26, v26);
        v43 = v70;
        v44 = v71;
      }
      else
      {
        v69 = 0.0;
      }
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v64, v69, v43, v44, v28);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "fill");
      if (a4 == 2 && v14)
        objc_msgSend(v62, "fillWithBlendMode:alpha:", 16, 1.0);
      goto LABEL_49;
    }
    objc_msgSend(a1, "_lineWidthForTraitCollection:size:", v16, v9);
    v52 = v51;
    +[UIColor blackColor](UIColor, "blackColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "set");

    v54 = 0.0;
    v55 = 0.0;
    if (!v14)
    {
      v56 = v36 + v36 + 1.0;
      v57 = v37 + v37 + 1.0;
      *(CGRect *)&v54 = CGRectInset(*(CGRect *)&v54, v52 * 0.5, v52 * 0.5);
      v43 = v58;
      v44 = v59;
      v22 = v22 - v52 * 0.5;
    }
    v60 = &qword_1ECD7A000;
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v54, v55, v43, v44, v22);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (!v14)
    {
      objc_msgSend(v61, "setLineWidth:", v52);
      objc_msgSend(v62, "stroke");
      if (!v11)
      {
LABEL_49:

        _UIGraphicsGetImageFromCurrentImageContext(0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        objc_msgSend(v72, "resizableImageWithCapInsets:", v37, v36, v37, v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v48 & 1) == 0)
        {
          objc_msgSend(v42, "imageWithRenderingMode:", 2);
          v73 = objc_claimAutoreleasedReturnValue();

          v42 = (void *)v73;
        }
        v19 = v47;
        if (v42)
          objc_msgSend((id)v60[48], "setObject:forKey:", v42, v41);
        v17 = v75;
        goto LABEL_54;
      }
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "set");

    }
    objc_msgSend(v62, "fill");
    goto LABEL_49;
  }
LABEL_54:

  return v42;
}

+ (CGColor)_backgroundPrimaryColorSelected:(BOOL)a3 highlighted:(BOOL)a4 traitCollection:(id)a5 tintColor:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  CGColor *v15;

  v7 = a4;
  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (!v8)
  {
    if (v7)
    {
      +[UIColor _controlHighlightColor](UIColor, "_controlHighlightColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (!v10)
    {
      +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v12 = v10;
    goto LABEL_8;
  }
  if (v10)
    goto LABEL_7;
  +[UIColor _controlForegroundColor](UIColor, "_controlForegroundColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = v12;
  objc_msgSend(v12, "resolvedColorWithTraitCollection:", v9);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (CGColor *)objc_msgSend(v14, "CGColor");

  return v15;
}

- (BOOL)transparentBackground
{
  return *((_BYTE *)&self->_segmentedControlFlags + 1) & 1;
}

+ (double)_sectionIndicatorOverflowForTraitCollection:(id)a3 size:(int)a4
{
  void *v4;
  double v5;

  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(a3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "useTVStyleFocusSelection"))
    v5 = 0.0;
  else
    v5 = 3.0;

  return v5;
}

+ (id)_fontForTraitCollection:(id)a3 size:(int)a4 selected:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  _BOOL8 v9;
  void *v10;
  _UISegmentedControlFontCacheKey *v11;
  void *v12;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (qword_1ECD7A1A8 != -1)
    dispatch_once(&qword_1ECD7A1A8, &__block_literal_global_690);
  v9 = objc_msgSend(v8, "legibilityWeight") == 1;
  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(v8, "userInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UISegmentedControlFontCacheKey initWithStyleProvider:size:selected:bold:]([_UISegmentedControlFontCacheKey alloc], "initWithStyleProvider:size:selected:bold:", v10, v6, v5, v9);
  objc_msgSend((id)qword_1ECD7A1A0, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v10, "fontForControlSize:selected:", v6, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD7A1A0, "setObject:forKey:", v12, v11);
  }

  return v12;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  v4 = *(_QWORD *)&a4;
  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(a3, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionIndicatorInsetForControlSize:", v4);
  v7 = v6;

  return v7;
}

- (BOOL)hasBackdropView
{
  return (*((unsigned __int8 *)&self->_segmentedControlFlags + 3) >> 1) & 1;
}

- (id)_backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UISegmentedControl;
  -[UIControl _didMoveFromWindow:toWindow:](&v10, sel__didMoveFromWindow_toWindow_, a3, v6);
  if (v6)
  {
    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    objc_msgSend(v7, "setRasterizationScale:");

    v9 = -[UISegmentedControl _internalFocusSystem](self, "_internalFocusSystem");
  }

}

- (void)_setSelectedSegmentIndex:(int64_t)a3 notify:(BOOL)a4 animate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  unint64_t selectedSegment;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  UISegmentedControl *v28;
  id v29;
  int64_t v30;
  BOOL v31;

  v5 = a5;
  v6 = a4;
  if (-[NSMutableArray count](self->_segments, "count") > a3
    && -[UISegmentedControl _shouldSelectSegmentAtIndex:](self, "_shouldSelectSegmentAtIndex:", a3))
  {
    -[UISegmentedControl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedSegmentIndex"));
    if (self->_selectedSegment == a3)
    {
      if ((*(_BYTE *)&self->_segmentedControlFlags & 4) != 0 && v6)
        -[UISegmentedControl _emitValueChanged](self, "_emitValueChanged");
    }
    else
    {
      v9 = (void *)objc_opt_class();
      -[UIView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UISegmentedControlStyleProviderForIdiom(v9, objc_msgSend(v10, "userInterfaceIdiom"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      selectedSegment = self->_selectedSegment;
      if ((selectedSegment & 0x8000000000000000) != 0
        || selectedSegment >= -[NSMutableArray count](self->_segments, "count"))
      {
        v13 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", self->_selectedSegment);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke;
      aBlock[3] = &unk_1E16BFD20;
      v15 = v13;
      v27 = v15;
      v28 = self;
      v31 = v5;
      v30 = a3;
      v16 = v11;
      v29 = v16;
      v17 = _Block_copy(aBlock);
      v18 = v17;
      if (v5)
      {
        v21 = v14;
        v22 = 3221225472;
        v23 = __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke_2;
        v24 = &unk_1E16B3FD8;
        v25 = v15;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327685, v18, &v21, 0.2, 0.0);
        v19 = v25;
      }
      else
      {
        (*((void (**)(void *))v17 + 2))(v17);
        objc_msgSend(v15, "setWasSelected:", 0);
        -[UIControl pointerInteraction](self, "pointerInteraction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "invalidate");
      }

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      if (v6 && ((*(_BYTE *)&self->_segmentedControlFlags & 8) == 0 || self->_selectedSegment != -1))
        -[UISegmentedControl _emitValueChanged](self, "_emitValueChanged", v21, v22, v23, v24);
      if (objc_msgSend(v16, "useSelectionIndicatorStyling", v21, v22, v23, v24)
        && !-[UISegmentedControl _disableSlidingControl](self, "_disableSlidingControl"))
      {
        -[UIView setNeedsLayout](self, "setNeedsLayout");
      }
      if ((*(_BYTE *)&self->_segmentedControlFlags & 8) == 0)
      {
        -[UISegmentedControl _internalFocusSystem](self, "_internalFocusSystem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setNeedsFocusUpdate");

      }
    }
    -[UISegmentedControl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedSegmentIndex"));
  }
}

- (_UIHostedFocusSystem)_internalFocusSystem
{
  void *v3;
  _UIHostedFocusSystem *internalFocusSystem;
  _UIHostedFocusSystem *v5;
  _UIHostedFocusSystem *v6;
  _UIHostedFocusSystem *v7;

  -[UIView _focusSystem](self, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    internalFocusSystem = self->_internalFocusSystem;
    if (!internalFocusSystem)
    {
      v5 = -[_UIHostedFocusSystem _initWithHostEnvironment:]([_UIHostedFocusSystem alloc], "_initWithHostEnvironment:", self);
      v6 = self->_internalFocusSystem;
      self->_internalFocusSystem = v5;

      -[_UIHostedFocusSystem setDelegate:](self->_internalFocusSystem, "setDelegate:", self);
      -[UIFocusSystem _setEnabled:](self->_internalFocusSystem, "_setEnabled:", -[UIView isFocused](self, "isFocused"));
      -[UIFocusSystem setNeedsFocusUpdate](self->_internalFocusSystem, "setNeedsFocusUpdate");
      internalFocusSystem = self->_internalFocusSystem;
    }
    v7 = internalFocusSystem;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "setWasSelected:", 1);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 512);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v4 = objc_msgSend(*(id *)(v2 + 504), "count");
    v2 = *(_QWORD *)(a1 + 40);
    if (v3 < v4)
    {
      objc_msgSend((id)v2, "_setSelected:forSegmentAtIndex:forceInfoDisplay:", 0, *(unsigned int *)(v2 + 512), *(unsigned __int8 *)(a1 + 64));
      v2 = *(_QWORD *)(a1 + 40);
    }
  }
  *(_QWORD *)(v2 + 512) = *(_QWORD *)(a1 + 56);
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 40) + 512) & 0x8000000000000000) == 0)
  {
    v5 = objc_msgSend(*(id *)(a1 + 48), "useSelectionIndicatorStyling");
    v6 = *(_QWORD *)(a1 + 40);
    if (v5 && (*(_BYTE *)(v6 + 618) & 4) == 0)
    {
      objc_msgSend(*(id *)(v6 + 504), "objectAtIndex:", *(_QWORD *)(v6 + 512));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "bringSubviewToFront:", v7);

      v6 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend((id)v6, "_setSelected:forSegmentAtIndex:forceInfoDisplay:", 1, *(unsigned int *)(v6 + 512), *(unsigned __int8 *)(a1 + 64));
    if ((objc_msgSend(*(id *)(a1 + 48), "useSelectionIndicatorStyling") & 1) == 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(v8 + 512);
      if (v9 >= 1)
      {
        objc_msgSend(*(id *)(v8 + 504), "objectAtIndex:", v9 - 1);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:", v10);

      }
    }
  }
}

- (BOOL)_shouldSelectSegmentAtIndex:(int64_t)a3
{
  return 1;
}

- (void)_setSelected:(BOOL)a3 forSegmentAtIndex:(int)a4 forceInfoDisplay:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  uint64_t v8;
  id v9;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectionIndicatorDragged:", (*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1);
  objc_msgSend(v9, "setSelected:", v6);
  -[UISegmentedControl _updateDividerImageForSegmentAtIndex:](self, "_updateDividerImageForSegmentAtIndex:", v8);
  if (v5)
    objc_msgSend(v9, "_forceInfoDisplay");

}

- (void)_resetForAppearanceChange
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)&self->_segmentedControlFlags &= ~0x800u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_segments;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "updateForAppearance:", self->_appearanceStorage, (_QWORD)v9);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  if (-[NSMutableArray count](self->_segments, "count"))
  {
    v8 = 0;
    do
      -[UISegmentedControl _updateDividerImageForSegmentAtIndex:](self, "_updateDividerImageForSegmentAtIndex:", v8++, (_QWORD)v9);
    while (-[NSMutableArray count](self->_segments, "count") > v8);
  }
  if ((*(_DWORD *)&self->_segmentedControlFlags & 0x60) == 0x20)
    -[UISegmentedControl sizeToFit](self, "sizeToFit");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", (_QWORD)v9);
}

- (void)_updateDividerImageForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  if (a3)
  {
    -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3 - 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_segments, "count") - 1 <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    v7 = v6;
  else
    v7 = v11;
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0)
    v8 = v11;
  else
    v8 = v6;
  v9 = v7;
  v10 = v8;
  if (v10)
    objc_msgSend(v5, "updateDividerViewForChangedSegment:", v10);
  objc_msgSend(v5, "updateDividerViewForChangedSegment:", v5);
  objc_msgSend(v9, "setSelectionIndicatorDragged:", (*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1);
  objc_msgSend(v9, "updateDividerViewForChangedSegment:", v5);

}

uint64_t __36__UISegmentedControl_layoutSubviews__block_invoke(uint64_t a1, void *a2, int a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;

  v3 = *(_DWORD *)(a1 + 32);
  if (v3 - 1 == a3)
    v4 = 2;
  else
    v4 = 1;
  if (!a3)
    v4 = 0;
  if (v3 == 1)
    v5 = 3;
  else
    v5 = v4;
  return objc_msgSend(a2, "setSegmentPosition:", v5);
}

- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)segment animated:(BOOL)animated
{
  -[UISegmentedControl _insertSegment:withInfo:animated:](self, "_insertSegment:withInfo:animated:", segment, title, animated);
}

- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment
{
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *v11;

  v6 = title;
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectValue");
  v8 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v11 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (v9 && v8)
    {
      v10 = -[NSString isEqual:](v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v7, "setObjectValue:", v11);
    if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
      -[UISegmentedControl sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
LABEL_11:

}

+ (double)_defaultHeightForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  double v8;
  double v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultHeightForControlSize:traitCollection:", v4, v6);
  v9 = v8;

  return v9;
}

uint64_t __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_createAndAddSegmentAtIndex:position:withInfo:");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 512);
  if (v4 >= *(int *)(a1 + 48))
  {
    objc_msgSend((id)v3, "selectSegment:", (v4 + 1));
    v3 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v3 + 616) & 0x20) != 0)
  {
    objc_msgSend((id)v3, "sizeToFit");
    v3 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v3, "invalidateIntrinsicContentSize");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (id)_createAndAddSegmentAtIndex:(int)a3 position:(unsigned int)a4 withInfo:(id)a5
{
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  UISegmentedControl *v11;
  UIView *backdropView;
  UISegmentedControl *v13;
  UISegmentedControl *v14;

  -[UISegmentedControl _createSegmentAtIndex:position:withInfo:](self, "_createSegmentAtIndex:position:withInfo:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray count](self->_segments, "count");
  if (v8 >= a3)
    v9 = a3;
  else
    v9 = v8;
  v10 = v9;
  -[NSMutableArray insertObject:atIndex:](self->_segments, "insertObject:atIndex:", v7, v9);
  v11 = self;
  backdropView = v11->_backdropView;
  if (backdropView)
  {
    if ((*((_BYTE *)&v11->_segmentedControlFlags + 3) & 4) != 0)
      -[UIView contentView](backdropView, "contentView");
    else
      -[UIView viewWithTag:](v11, "viewWithTag:", -2031);
    v13 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v11;
  }
  v14 = v13;

  -[UIView insertSubview:atIndex:](v14, "insertSubview:atIndex:", v7, v10);
  objc_msgSend(v7, "_finishInitialSegmentSetup");
  -[UIView setNeedsLayout](v11, "setNeedsLayout");
  return v7;
}

- (id)_createSegmentAtIndex:(int)a3 position:(unsigned int)a4 withInfo:(id)a5
{
  id v7;
  uint64_t v8;
  int64_t barStyle;
  void *v10;
  id appearanceStorage;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  int v13;
  int v14;
  void *v15;
  UISegment *v16;
  uint64_t v18;
  UISegment *v19;
  void *v20;
  void *v22;

  v7 = a5;
  v22 = v7;
  if ((*((_BYTE *)&self->_segmentedControlFlags + 2) & 0x40) != 0)
  {
    -[UISegmentedControl _createInfoViewForSegmentAtIndex:item:](self, "_createInfoViewForSegmentAtIndex:item:", a3, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v19 = [UISegment alloc];
  v8 = *(_DWORD *)&self->_segmentedControlFlags & 3;
  barStyle = self->_barStyle;
  -[UIView tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  appearanceStorage = self->_appearanceStorage;
  segmentedControlFlags = self->_segmentedControlFlags;
  v13 = (*(unsigned int *)&segmentedControlFlags >> 7) & 1;
  v14 = (*(unsigned int *)&segmentedControlFlags >> 14) & 1;
  -[UIView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v18) = v14;
  LOBYTE(v18) = v13;
  v16 = -[UISegment initWithInfo:size:barStyle:tintColor:appearanceStorage:position:autosizeText:adjustsForContentSizeCategory:customInfoView:traitCollection:](v19, "initWithInfo:size:barStyle:tintColor:appearanceStorage:position:autosizeText:adjustsForContentSizeCategory:customInfoView:traitCollection:", v22, v8, barStyle, v10, appearanceStorage, a4, v18, v20, v15);

  -[UISegment setMomentary:](v16, "setMomentary:", (*(_DWORD *)&self->_segmentedControlFlags >> 3) & 1);
  return v16;
}

- (void)layoutSubviews
{
  UISegmentedControl *v2;
  UIView *backdropView;
  UISegmentedControl *v4;
  UISegmentedControl *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double innerSegmentSpacing;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  NSMutableArray *v22;
  void *v23;
  uint64_t v24;
  double *v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double *v30;
  double *v31;
  double v32;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  id *v48;
  id *v49;
  double v50;
  unsigned int v51;
  uint64_t v52;
  id v53;
  BOOL v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  id v60;
  id *v61;
  id *v62;
  void *v63;
  uint64_t v64;
  int64_t selectedSegment;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t highlightedSegment;
  void *v72;
  NSMutableArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double MaxX;
  CGFloat v99;
  double MinY;
  UIView *v101;
  void *v102;
  void *v103;
  void *v104;
  UIView *selectionIndicatorView;
  int64_t hoveredSegment;
  int64_t v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  id v112;
  double v113;
  UISegmentedControl *v114;
  int v115;
  _QWORD rect[5];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  id v121;
  double v122;
  _QWORD v123[5];
  _BYTE v124[128];
  uint64_t v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v125 = *MEMORY[0x1E0C80C00];
  v2 = self;
  backdropView = v2->_backdropView;
  if (backdropView)
  {
    if ((*((_BYTE *)&v2->_segmentedControlFlags + 3) & 4) != 0)
      -[UIView contentView](backdropView, "contentView");
    else
      -[UIView viewWithTag:](v2, "viewWithTag:", -2031);
    v4 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v2;
  }
  v5 = v4;

  if ((*((_BYTE *)&v2->_segmentedControlFlags + 1) & 8) != 0)
    -[UISegmentedControl _resetForAppearanceChange](v2, "_resetForAppearanceChange");
  -[UISegmentedControl bounds](v2, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v2->_appearanceStorage, "anyDividerImageForMini:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "size");
    innerSegmentSpacing = v16;
  }
  else
  {
    if ((*((_BYTE *)&v2->_segmentedControlFlags + 1) & 0x20) != 0)
    {
      innerSegmentSpacing = v2->_innerSegmentSpacing;
    }
    else
    {
      v18 = (void *)objc_opt_class();
      -[UIView traitCollection](v2, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_dividerWidthForTraitCollection:size:", v19, -[UISegmentedControl controlSize](v2, "controlSize"));
      innerSegmentSpacing = v20;

    }
    v16 = 0.0;
  }
  v113 = v16;
  v21 = -[NSMutableArray count](v2->_segments, "count");
  v22 = v2->_segments;
  if ((*((_DWORD *)&v2->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    -[NSMutableArray reverseObjectEnumerator](v2->_segments, "reverseObjectEnumerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (NSMutableArray *)v24;
  }
  v111 = v9;
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __36__UISegmentedControl_layoutSubviews__block_invoke;
  v123[3] = &__block_descriptor_40_e26_v32__0__UISegment_8Q16_B24l;
  v123[4] = v21;
  -[NSMutableArray enumerateObjectsUsingBlock:](v22, "enumerateObjectsUsingBlock:", v123);
  v25 = (double *)malloc_type_malloc(8 * v21, 0x100004000313F17uLL);
  v26 = (double)v21;
  rect[0] = v21 - 1;
  v27 = v11 - innerSegmentSpacing * (double)(v21 - 1);
  if (v21 < 1)
  {
    v29 = 0.0;
  }
  else
  {
    v28 = 0;
    v29 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", v28);
      v30 = (double *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = v30[71];
      if (v32 <= 0.0)
      {
        objc_msgSend(v30, "_idealWidth");
        v29 = v29 + v32;
      }
      else
      {
        v27 = v27 - v32;
        v26 = v26 + -1.0;
      }
      v25[v28] = v32;

      ++v28;
    }
    while (v21 != v28);
  }
  segmentedControlFlags = v2->_segmentedControlFlags;
  v34 = (void *)objc_opt_class();
  -[UIView traitCollection](v2, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v34, objc_msgSend(v35, "userInterfaceIdiom"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v36, "useSelectionIndicatorStyling");

  v114 = v2;
  if (v21 < 1)
  {
    v112 = 0;
  }
  else
  {
    v37 = 0;
    v38 = v27 / v29;
    v39 = 0.0;
    v40 = v27 / v26;
    do
    {
      -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", v37);
      v41 = (double *)objc_claimAutoreleasedReturnValue();
      if (v41[71] == 0.0)
      {
        if ((*(_WORD *)&segmentedControlFlags & 0x200) != 0)
        {
          v44 = v38 * v25[v37];
          v45 = floor(v44);
          v43 = ceil(v113 + v44);
          if (v37 < rect[0])
            v43 = v45;
        }
        else
        {
          v42 = floor(v40 + v39);
          v43 = ceil(v40 + v39);
          if (v37 < rect[0])
            v43 = v42;
          v39 = v40 - v43;
        }
        v25[v37] = v43;
      }

      ++v37;
    }
    while (v21 != v37);
    v110 = v15;
    v46 = 0;
    v112 = 0;
    v47 = 1.0;
    do
    {
      -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", v46);
      v48 = (id *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      v50 = floor(v7 + v25[v46]);
      if ((_DWORD)v21 - 1 == (_DWORD)v46)
        v51 = 2;
      else
        v51 = 1;
      if (!(_DWORD)v46)
        v51 = 0;
      if ((_DWORD)v21 == 1)
        v52 = 3;
      else
        v52 = v51;
      objc_msgSend(v48, "setSegmentPosition:", v52);
      objc_msgSend(v49, "setFrame:", v7, v111, v50 - v7, v13);
      v53 = v49[65];
      if (v53)
      {
        -[UIView insertSubview:atIndex:](v5, "insertSubview:atIndex:", v53, v46);
        objc_msgSend(v49, "frame");
        objc_msgSend(v53, "setFrame:");
      }
      v54 = (*(_DWORD *)&v2->_segmentedControlFlags & 0x4080) != 0
         && (*(_DWORD *)&v2->_segmentedControlFlags & 0x1000) == 0;
      if (v54)
      {
        objc_msgSend(v49, "label");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55
          && (objc_msgSend(v55, "setAssociatedLabel:", 0),
              objc_msgSend(v49, "_positionInfo"),
              objc_msgSend(v56, "_actualScaleFactor"),
              v58 = v57,
              objc_msgSend(v56, "transform"),
              v59 = v58 * v122,
              v58 * v122 < v47))
        {
          v60 = v56;

          v112 = v60;
        }
        else
        {
          v59 = v47;
        }

        v47 = v59;
      }
      if (v53)
        v61 = (id *)v53;
      else
        v61 = v49;
      v62 = v61;
      objc_msgSend(v62, "viewWithTag:", -1030);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "frame");
      objc_msgSend(v63, "setFrame:");
      if (v115)
      {
        v64 = v46 + 1;
      }
      else
      {
        selectedSegment = v2->_selectedSegment;
        v64 = v46 + 1;
        if (v46 != selectedSegment && v64 != selectedSegment)
          -[UIView sendSubviewToBack:](v5, "sendSubviewToBack:", v49);
      }
      objc_msgSend(v49, "setShowDivider:", v46 < rect[0]);
      v7 = innerSegmentSpacing + v50;

      v46 = v64;
      v54 = v64 == v21;
      v2 = v114;
    }
    while (!v54);
    if (v47 < 1.0)
    {
      v120[0] = MEMORY[0x1E0C809B0];
      v120[1] = 3221225472;
      v120[2] = __36__UISegmentedControl_layoutSubviews__block_invoke_2;
      v120[3] = &unk_1E16C31C0;
      v112 = v112;
      v121 = v112;
      -[NSMutableArray enumerateObjectsUsingBlock:](v22, "enumerateObjectsUsingBlock:", v120);

    }
    v15 = v110;
  }
  free(v25);
  if ((v2->_selectedSegment & 0x8000000000000000) == 0 && (*((_BYTE *)&v2->_segmentedControlFlags + 2) & 4) == 0)
  {
    -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](v5, "bringSubviewToFront:", v67);

  }
  if ((v115 & 1) != 0)
  {
    if ((*(_DWORD *)&v2->_segmentedControlFlags & 0x40010) != 0x10)
      goto LABEL_89;
  }
  else
  {
    v68 = v2->_selectedSegment;
    if (v68 >= 1)
    {
      -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", v68 - 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bringSubviewToFront:](v5, "bringSubviewToFront:", v69);

    }
    if ((*(_DWORD *)&v2->_segmentedControlFlags & 0x40010) != 0x10)
      goto LABEL_87;
  }
  if ((v2->_highlightedSegment & 0x8000000000000000) == 0)
  {
    -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](v5, "bringSubviewToFront:", v70);

  }
  if ((v115 & 1) == 0)
  {
    highlightedSegment = v2->_highlightedSegment;
    if (highlightedSegment >= 1)
    {
      -[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", highlightedSegment - 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bringSubviewToFront:](v5, "bringSubviewToFront:", v72);

    }
LABEL_87:
    if (v2->_removedSegment)
      -[UIView sendSubviewToBack:](v5, "sendSubviewToBack:");
  }
LABEL_89:
  v118 = 0u;
  v119 = 0u;
  *(_OWORD *)&rect[3] = 0u;
  v117 = 0u;
  v73 = v22;
  v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &rect[3], v124, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v117 != v76)
          objc_enumerationMutation(v73);
        v78 = *(void **)(rect[4] + 8 * i);
        objc_msgSend(v78, "badgeView");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v79;
        if (v79)
        {
          objc_msgSend(v79, "superview");
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v81)
            -[UIView addSubview:](v5, "addSubview:", v80);
          objc_msgSend(v78, "frame");
          v83 = v82;
          *(double *)rect = v82;
          v85 = v84;
          v87 = v86;
          v89 = v88;
          objc_msgSend(v80, "frame");
          v91 = v90;
          v93 = v92;
          v95 = v94;
          v97 = v96;
          v126.origin.x = v83;
          v126.origin.y = v85;
          v126.size.width = v87;
          v126.size.height = v89;
          MaxX = CGRectGetMaxX(v126);
          v127.origin.x = v91;
          v127.origin.y = v93;
          v127.size.width = v95;
          v127.size.height = v97;
          v99 = ceil(MaxX - CGRectGetWidth(v127) * 0.5 + -6.0);
          *(_QWORD *)&v128.origin.x = rect[0];
          v128.origin.y = v85;
          v128.size.width = v87;
          v128.size.height = v89;
          MinY = CGRectGetMinY(v128);
          v129.origin.x = v99;
          v129.origin.y = v93;
          v129.size.width = v95;
          v129.size.height = v97;
          objc_msgSend(v80, "setFrame:", v99, ceil(MinY - CGRectGetHeight(v129) * 0.5 + 6.0), v95, v97);
          -[UIView bringSubviewToFront:](v5, "bringSubviewToFront:", v80);
        }

      }
      v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &rect[3], v124, 16);
    }
    while (v75);
  }

  if (v114->_focusedSegment)
    -[UIView bringSubviewToFront:](v5, "bringSubviewToFront:");
  v101 = v114->_backdropView;
  if (v101)
  {
    if ((*((_BYTE *)&v114->_segmentedControlFlags + 3) & 4) == 0)
    {
      -[UIView viewWithTag:](v114, "viewWithTag:", -2031);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView sendSubviewToBack:](v114, "sendSubviewToBack:", v102);

      v101 = v114->_backdropView;
    }
    -[UIView sendSubviewToBack:](v114, "sendSubviewToBack:", v101);
  }
  if (v115)
  {
    v103 = (void *)objc_opt_class();
    -[UIView traitCollection](v114, "traitCollection");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "_cornerRadiusForTraitCollection:size:", v104, -[UISegmentedControl controlSize](v114, "controlSize"));
    -[UIView _setCornerRadius:](v5, "_setCornerRadius:");

    -[UISegmentedControl _updateSelectionIndicator](v114, "_updateSelectionIndicator");
    selectionIndicatorView = v114->_selectionIndicatorView;
    if (selectionIndicatorView)
    {
      hoveredSegment = v114->_hoveredSegment;
      if (hoveredSegment == -1 || (v107 = v114->_selectedSegment, v107 == -1) || v107 == hoveredSegment)
      {
        -[UIView insertSubview:atIndex:](v5, "insertSubview:atIndex:", selectionIndicatorView, -[NSMutableArray count](v114->_segments, "count"));
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](v114->_segments, "objectAtIndexedSubscript:");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView insertSubview:below:](v5, "insertSubview:below:", selectionIndicatorView, v108);

      }
      -[UIView viewWithTag:](v5, "viewWithTag:", -2030);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      if (v109)
        -[UIView insertSubview:belowSubview:](v5, "insertSubview:belowSubview:", v109, v114->_selectionIndicatorView);

    }
  }
  rect[1] = v114;
  rect[2] = UISegmentedControl;
  objc_msgSendSuper2((objc_super *)&rect[1], sel_layoutSubviews);

}

- (CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if ((~*(_DWORD *)&self->_segmentedControlFlags & 0x820) == 0)
    -[UISegmentedControl _resetForAppearanceChange](self, "_resetForAppearanceChange");
  v7.receiver = self;
  v7.super_class = (Class)UISegmentedControl;
  -[UIView bounds](&v7, sel_bounds);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int)controlSize
{
  return *(_DWORD *)&self->_segmentedControlFlags & 3;
}

- (void)_updateSelectionIndicator
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  int64_t selectionIndicatorSegment;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  UIView *highlightIndicatorView;
  UIView *selectionIndicatorView;
  UIImageView *selectionImageView;
  UISegmentedControl *v25;
  UIView *v26;
  UISegmentedControl *v27;
  UISegmentedControl *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  UISegmentedControl *v36;
  UIView *backdropView;
  UISegmentedControl *v38;
  void *v39;
  void *v40;
  double v41;
  UISegmentedControl *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;

  v3 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "useSelectionIndicatorStyling"))
  {
    v56 = 0;
    v6 = -[UISegmentedControl _segmentIndexToHighlight:](self, "_segmentIndexToHighlight:", &v56);
    v7 = 0;
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      -[UIView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v7 = objc_msgSend(v5, "animateSlidingSelectionByDefault");
      else
        v7 = 0;

    }
    selectionIndicatorSegment = self->_selectionIndicatorSegment;
    self->_selectionIndicatorSegment = v6;
    if (v6 == -1)
    {
      v11 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "size");
        if (v12 > 0.0)
        {
          objc_msgSend(v11, "size");
          if (v13 > 0.0
            && (v6 != selectionIndicatorSegment
             || !objc_msgSend(v11, "isHovered")
             || objc_msgSend(v11, "isAnimatingSelectionIndicator")))
          {
            if (self->_selectionIndicatorView)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if ((objc_msgSend(v5, "useGeneratedImages") & 1) != 0)
                {
                  v14 = (void *)objc_opt_class();
                  -[UIView bounds](self->_selectionImageView, "bounds");
                  v16 = v15;
                  v18 = v17;
                  -[UIView traitCollection](self, "traitCollection");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v19, v20, *(_DWORD *)&self->_segmentedControlFlags & 3, v16, v18);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v21 = 0;
                }
                -[UIImageView setImage:](self->_selectionImageView, "setImage:", v21);
                v36 = self;
                backdropView = v36->_backdropView;
                if (backdropView)
                {
                  if ((*((_BYTE *)&v36->_segmentedControlFlags + 3) & 4) != 0)
                    -[UIView contentView](backdropView, "contentView");
                  else
                    -[UIView viewWithTag:](v36, "viewWithTag:", -2031);
                  v38 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v38 = v36;
                }
                v42 = v38;

                -[UIView viewWithTag:](v42, "viewWithTag:", -2030);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (v43)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v53 = (void *)objc_opt_class();
                    objc_msgSend(v43, "bounds");
                    v45 = v44;
                    v47 = v46;
                    -[UIView traitCollection](v36, "traitCollection");
                    v55 = v21;
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UISegmentedControl selectedSegmentTintColor](v36, "selectedSegmentTintColor");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v48, v49, *(_DWORD *)&v36->_segmentedControlFlags & 3, v45, v47);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();

                    v21 = v55;
                    objc_msgSend(v43, "setImage:", v50);

                  }
                }

              }
              else
              {
                v30 = -[UISegmentedControl transparentBackground](self, "transparentBackground");
                v31 = -[UISegmentedControl _useDynamicShadow](self, "_useDynamicShadow");
                -[UIView traitCollection](self, "traitCollection");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = v30;
                v54 = v32;
                if ((objc_msgSend(v5, "useGeneratedImages") & 1) != 0)
                {
                  v51 = (void *)objc_opt_class();
                  -[UIView bounds](self->_selectionImageView, "bounds");
                  objc_msgSend(v51, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v30 | v31, 0, v21, v32, *(_DWORD *)&self->_segmentedControlFlags & 3, v33, v34);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v35 = 0;
                }
                -[UIImageView setImage:](self->_selectionImageView, "setImage:", v35);
                if (v31)
                {
                  if (!v52
                    && objc_msgSend((id)objc_opt_class(), "_useShadowForSelectedTintColor:traitCollection:", v32, v21))
                  {
                    -[UISegmentedControl _updateDynamicShadow:animated:](self, "_updateDynamicShadow:animated:", 1, 0);
                  }
                }
                else
                {
                  -[UIView layer](self->_selectionImageView, "layer");
                  v39 = v21;
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v41) = 0;
                  objc_msgSend(v40, "setShadowOpacity:", v41);

                  v21 = v39;
                  v32 = v54;
                }

              }
            }
            else
            {
              -[UISegmentedControl _insertSelectionViewForSegment:](self, "_insertSelectionViewForSegment:", v11);
              v7 = 0;
            }
            -[UISegmentedControl _updateSelectionToSegment:highlight:shouldAnimate:sameSegment:](self, "_updateSelectionToSegment:highlight:shouldAnimate:sameSegment:", v11, v56, v7, v6 == selectionIndicatorSegment);
LABEL_28:

            goto LABEL_29;
          }
        }
      }
    }
    -[UIView removeFromSuperview](self->_highlightIndicatorView, "removeFromSuperview");
    highlightIndicatorView = self->_highlightIndicatorView;
    self->_highlightIndicatorView = 0;

    -[UIView removeFromSuperview](self->_selectionIndicatorView, "removeFromSuperview");
    selectionIndicatorView = self->_selectionIndicatorView;
    self->_selectionIndicatorView = 0;

    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = 0;

    v25 = self;
    v26 = v25->_backdropView;
    if (v26)
    {
      if ((*((_BYTE *)&v25->_segmentedControlFlags + 3) & 4) != 0)
        -[UIView contentView](v26, "contentView");
      else
        -[UIView viewWithTag:](v25, "viewWithTag:", -2031);
      v27 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = v25;
    }
    v28 = v27;

    -[UIView viewWithTag:](v28, "viewWithTag:", -2030);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(v29, "removeFromSuperview");

    goto LABEL_28;
  }
LABEL_29:

}

- (void)_updateSelectionToSegment:(id)a3 highlight:(BOOL)a4 shouldAnimate:(BOOL)a5 sameSegment:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _QWORD *v9;
  UIImageView **p_selectionImageView;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double *v62;
  UISegmentedControl *v63;
  UIView *backdropView;
  UISegmentedControl *v65;
  UISegmentedControl *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  _BOOL8 v76;
  UIImageView *v77;
  double v78;
  double v79;
  UIImageView *highlightImageView;
  void *v81;
  UIImageView *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  CGFloat v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  BOOL v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  UIImageView *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  CATransform3D v159;
  CATransform3D v160;
  CATransform3D v161;
  CATransform3D v162;
  _QWORD v163[4];
  _QWORD v164[4];
  CATransform3D v165;
  _OWORD v166[8];
  _QWORD v167[4];
  _QWORD v168[4];
  _QWORD v169[2];
  _QWORD v170[2];
  CATransform3D v171;
  _OWORD v172[8];
  CATransform3D a;
  CATransform3D v174;
  CATransform3D b;
  _QWORD v176[4];
  UIImageView *v177;
  _OWORD v178[8];
  CATransform3D v179;
  CATransform3D v180;
  CATransform3D v181;
  CATransform3D v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  CGRect v191;
  CGRect v192;

  v6 = a5;
  v7 = a4;
  v9 = a3;
  v190 = 0u;
  v189 = 0u;
  v188 = 0u;
  v187 = 0u;
  v186 = 0u;
  v185 = 0u;
  v184 = 0u;
  v183 = 0u;
  p_selectionImageView = &self->_selectionImageView;
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
      v190 = 0u;
      v189 = 0u;
      v188 = 0u;
      v187 = 0u;
      v186 = 0u;
      v185 = 0u;
      v184 = 0u;
      v183 = 0u;
    }

  }
  else if (v13)
  {
    objc_msgSend(v13, "transform");
  }
  else
  {
    v190 = 0u;
    v189 = 0u;
    v188 = 0u;
    v187 = 0u;
    v186 = 0u;
    v185 = 0u;
    v184 = 0u;
    v183 = 0u;
  }

  -[UIView layer](*p_selectionImageView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentationLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](*p_selectionImageView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    objc_msgSend(v19, "presentationLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "position");
    v23 = v22;
    v25 = v24;

  }
  else
  {
    objc_msgSend(v19, "position");
    v23 = v26;
    v25 = v27;
  }

  -[UIView layer](*p_selectionImageView, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "presentationLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](*p_selectionImageView, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29)
  {
    objc_msgSend(v30, "presentationLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    v156 = v34;
    v157 = v33;
    v154 = v36;
    v155 = v35;

  }
  else
  {
    objc_msgSend(v30, "bounds");
    v156 = v38;
    v157 = v37;
    v154 = v40;
    v155 = v39;
  }

  -[UIView _backing_outermostLayer](v9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "position");
  v43 = v42;
  v45 = v44;

  v46 = (void *)objc_opt_class();
  -[UIView _backing_outermostLayer](v9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v56 = -[UISegmentedControl controlSize](self, "controlSize");
  -[UIView traitCollection](self, "traitCollection");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_selectionFrameForBounds:size:traitCollection:accessibilityView:", v56, v57, 0, v49, v51, v53, v55);
  v59 = v58;
  v61 = v60;

  v62 = (double *)MEMORY[0x1E0C9D538];
  v63 = self;
  backdropView = v63->_backdropView;
  if (backdropView)
  {
    if ((*((_BYTE *)&v63->_segmentedControlFlags + 3) & 4) != 0)
      -[UIView contentView](backdropView, "contentView");
    else
      -[UIView viewWithTag:](v63, "viewWithTag:", -2031);
    v65 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = v63;
  }
  v66 = v65;
  v67 = *v62;
  v68 = v62[1];

  -[UIView viewWithTag:](v66, "viewWithTag:", -2030);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UISegmentedControl _animateHighlightingSelectionByDefault](v63, "_animateHighlightingSelectionByDefault"))
  {
    if (v7 && a6
      || (-[UISegmentedControl _updateHighlightToPosition:bounds:highlight:](v63, "_updateHighlightToPosition:bounds:highlight:", v7, v43, v45, v67, v68, v59, v61), v7))
    {
      if (objc_msgSend(v9, "isHighlighted"))
      {
        -[UIView center](v63->_highlightImageView, "center");
        v71 = v70;
        v73 = v72;
        -[UIView center](*p_selectionImageView, "center");
        v76 = v73 == v75 && v71 == v74;
      }
      else
      {
        v76 = 1;
      }
      -[UIImageView setHidden:](v63->_highlightImageView, "setHidden:", v76);
      goto LABEL_77;
    }
    -[UIView layer](*p_selectionImageView, "layer");
    v77 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    -[UIView position](v77, "position");
    if (v79 != v43 || v78 != v45)
    {
      highlightImageView = v63->_highlightImageView;

      if (!highlightImageView)
        goto LABEL_43;
      v153 = *p_selectionImageView;
      objc_storeStrong((id *)p_selectionImageView, v63->_highlightImageView);
      -[UIImageView setHidden:](*p_selectionImageView, "setHidden:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIView contentView](v63->_selectionIndicatorView, "contentView");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "addSubview:", *p_selectionImageView);

      }
      v82 = v63->_highlightImageView;
      v63->_highlightImageView = 0;

      -[UIView layer](*p_selectionImageView, "layer");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "animationKeys");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "containsObject:", CFSTR("HighlightScaleUp"));

      if (v85)
      {
        memset(&v182, 0, sizeof(v182));
        -[UIView layer](*p_selectionImageView, "layer");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "presentationLayer");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v87;
        if (v87)
          objc_msgSend(v87, "transform");
        else
          memset(&v182, 0, sizeof(v182));

        v181 = v182;
        objc_msgSend(v69, "layer");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v180 = v181;
        objc_msgSend(v89, "setTransform:", &v180);

        objc_msgSend(v69, "layer");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (void *)objc_opt_class();
        v179 = v182;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v179, "{CATransform3D=dddddddddddddddd}");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        v178[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        v178[5] = v92;
        v93 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        v178[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        v178[7] = v93;
        v94 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        v178[0] = *MEMORY[0x1E0CD2610];
        v178[1] = v94;
        v95 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        v178[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        v178[3] = v95;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v178, "{CATransform3D=dddddddddddddddd}");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "_highlightPinchAnimationForKey:fromValue:toValue:", CFSTR("transform"), v91, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "addAnimation:forKey:", v97, CFSTR("ShadowScale"));

      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v98 = (void *)MEMORY[0x1E0CD28B0];
      v176[0] = MEMORY[0x1E0C809B0];
      v176[1] = 3221225472;
      v176[2] = __84__UISegmentedControl__updateSelectionToSegment_highlight_shouldAnimate_sameSegment___block_invoke;
      v176[3] = &unk_1E16B1B28;
      v177 = v153;
      v77 = v153;
      objc_msgSend(v98, "setCompletionBlock:", v176);
      objc_msgSend((id)objc_opt_class(), "_selectionFadeAnimationForKey:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A976F8, &unk_1E1A97710);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](v77, "layer");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "addAnimation:forKey:", v99, CFSTR("SelectionFadeOut"));

      -[UIView layer](v77, "layer");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v102) = 0;
      objc_msgSend(v101, "setOpacity:", v102);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }

  }
LABEL_43:
  memset(&v182, 0, sizeof(v182));
  if (v9)
  {
    if (!v7)
    {
      v107 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v182.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v182.m33 = v107;
      v108 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v182.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v182.m43 = v108;
      v109 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v182.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v182.m13 = v109;
      v110 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v111 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      goto LABEL_57;
    }
    v103 = (void *)objc_opt_class();
    -[UIView traitCollection](v63, "traitCollection");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
      objc_msgSend(v103, "_highlightSelectionTransformForTraitCollection:", v104);
    else
      memset(&v182, 0, sizeof(v182));

LABEL_56:
    objc_msgSend((id)objc_opt_class(), "_selectionOffsetAdjustmentForSegment:", v9);
    v174 = v182;
    CATransform3DTranslate(&b, &v174, v112, 0.0, 0.0);
    *(_OWORD *)&v182.m31 = *(_OWORD *)&b.m31;
    *(_OWORD *)&v182.m33 = *(_OWORD *)&b.m33;
    *(_OWORD *)&v182.m41 = *(_OWORD *)&b.m41;
    *(_OWORD *)&v182.m43 = *(_OWORD *)&b.m43;
    *(_OWORD *)&v182.m11 = *(_OWORD *)&b.m11;
    *(_OWORD *)&v182.m13 = *(_OWORD *)&b.m13;
    v110 = *(_OWORD *)&b.m21;
    v111 = *(_OWORD *)&b.m23;
LABEL_57:
    *(_OWORD *)&v182.m21 = v110;
    *(_OWORD *)&v182.m23 = v111;
    if (!v6)
      goto LABEL_75;
    goto LABEL_58;
  }
  v105 = (void *)objc_opt_class();
  -[UIView traitCollection](v63, "traitCollection");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105)
    objc_msgSend(v105, "_hiddenSelectionTransformForTraitCollection:", v106);
  else
    memset(&v182, 0, sizeof(v182));

  if (v7)
    goto LABEL_56;
  if (!v6)
    goto LABEL_75;
LABEL_58:
  -[UIView layer](*p_selectionImageView, "layer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v113;
  if (v113)
    objc_msgSend(v113, "transform");
  else
    memset(&a, 0, sizeof(a));
  b = v182;
  if (!CATransform3DEqualToTransform(&a, &b))
    goto LABEL_68;
  if (a6)
  {
LABEL_74:

    goto LABEL_75;
  }
  -[UIView layer](*p_selectionImageView, "layer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "position");
  if (v117 != v43 || v116 != v45)
  {

LABEL_68:
LABEL_69:
    -[UIView layer](*p_selectionImageView, "layer");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = (void *)objc_opt_class();
    v172[4] = v187;
    v172[5] = v188;
    v172[6] = v189;
    v172[7] = v190;
    v172[0] = v183;
    v172[1] = v184;
    v172[2] = v185;
    v172[3] = v186;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v172, "{CATransform3D=dddddddddddddddd}");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v182;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v171, "{CATransform3D=dddddddddddddddd}");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "_selectionPopAnimationForKey:fromValue:toValue:", CFSTR("transform"), v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "addAnimation:forKey:", v124, CFSTR("SelectionScale"));

    v125 = (void *)objc_opt_class();
    v170[0] = v23;
    v170[1] = v25;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v170, "{CGPoint=dd}");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v169 = v43;
    *(double *)&v169[1] = v45;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v169, "{CGPoint=dd}");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "_selectionPopAnimationForKey:fromValue:toValue:", CFSTR("position"), v126, v127);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a6 && objc_msgSend(v9, "isHovered"))
    {
      *(_DWORD *)&v63->_segmentedControlFlags |= 0x20000u;
      -[UIControl pointerInteraction](v63, "pointerInteraction");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "invalidate");

      objc_msgSend(v114, "setDelegate:", v63);
      objc_msgSend(v9, "setAnimatingSelectionIndicator:", 1);
    }
    -[UIView layer](*p_selectionImageView, "layer");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "addAnimation:forKey:", v114, CFSTR("SelectionPosition"));

    -[UIView layer](*p_selectionImageView, "layer");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = (void *)objc_opt_class();
    v168[0] = v157;
    v168[1] = v156;
    v168[2] = v155;
    v168[3] = v154;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v168, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v167 = v67;
    *(double *)&v167[1] = v68;
    *(double *)&v167[2] = v59;
    *(double *)&v167[3] = v61;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v167, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "_selectionPopAnimationForKey:fromValue:toValue:", CFSTR("bounds"), v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "addAnimation:forKey:", v134, CFSTR("SelectionBounds"));

    if (v69)
    {
      objc_msgSend(v69, "layer");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = (void *)objc_opt_class();
      v166[4] = v187;
      v166[5] = v188;
      v166[6] = v189;
      v166[7] = v190;
      v166[0] = v183;
      v166[1] = v184;
      v166[2] = v185;
      v166[3] = v186;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v166, "{CATransform3D=dddddddddddddddd}");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = v182;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v165, "{CATransform3D=dddddddddddddddd}");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "_selectionPopAnimationForKey:fromValue:toValue:", CFSTR("transform"), v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "addAnimation:forKey:", v139, CFSTR("SelectionScale"));

      objc_msgSend(v69, "layer");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "addAnimation:forKey:", v114, CFSTR("SelectionPosition"));

      objc_msgSend(v69, "layer");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = (void *)objc_opt_class();
      v164[0] = v157;
      v164[1] = v156;
      v164[2] = v155;
      v164[3] = v154;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v164, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)v163 = v67;
      *(double *)&v163[1] = v68;
      *(double *)&v163[2] = v59;
      *(double *)&v163[3] = v61;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v163, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "_selectionPopAnimationForKey:fromValue:toValue:", CFSTR("bounds"), v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "addAnimation:forKey:", v145, CFSTR("SelectionBounds"));

    }
    goto LABEL_74;
  }
  -[UIView layer](*p_selectionImageView, "layer");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "bounds");
  v192.origin.x = v67;
  v192.origin.y = v68;
  v192.size.width = v59;
  v192.size.height = v61;
  v119 = CGRectEqualToRect(v191, v192);

  if (!v119)
    goto LABEL_69;
LABEL_75:
  -[UIView layer](*p_selectionImageView, "layer");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setPosition:", v43, v45);

  -[UIView layer](*p_selectionImageView, "layer");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setBounds:", v67, v68, v59, v61);

  v162 = v182;
  -[UIView layer](*p_selectionImageView, "layer");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v162;
  objc_msgSend(v148, "setTransform:", &v161);

  if (v69)
  {
    objc_msgSend(v69, "layer");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "setPosition:", v43, v45);

    objc_msgSend(v69, "layer");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setBounds:", v67, v68, v59, v61);

    v160 = v182;
    objc_msgSend(v69, "layer");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = v160;
    objc_msgSend(v151, "setTransform:", &v159);

  }
LABEL_77:

}

+ (CGRect)_selectionFrameForBounds:(CGRect)a3 size:(int)a4 traitCollection:(id)a5 accessibilityView:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!a6)
  {
    objc_msgSend(a1, "_sectionIndicatorOverflowForTraitCollection:size:", a5, *(_QWORD *)&a4);
    v11 = -v10;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectInset(v20, v11, v11);
    v12 = v21.origin.x;
    v13 = v21.origin.y;
    v14 = v21.size.width;
    v15 = v21.size.height;
    if (!CGRectIsNull(v21))
    {
      x = v12;
      y = v13;
      width = v14;
      height = v15;
    }
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (int64_t)_segmentIndexToHighlight:(BOOL *)a3
{
  int64_t result;
  uint64_t selectedSegment;

  if (-[UISegmentedControl _disableSlidingControl](self, "_disableSlidingControl"))
  {
    *a3 = 0;
    return -1;
  }
  else if (((*((_BYTE *)&self->_segmentedControlFlags + 1) & 0x10) != 0
          || -[UISegmentedControl _animateHighlightingSelectionByDefault](self, "_animateHighlightingSelectionByDefault"))&& (result = self->_highlightedSegment, (result & 0x8000000000000000) == 0))
  {
    *a3 = 1;
  }
  else
  {
    selectedSegment = self->_selectedSegment;
    *a3 = 0;
    if (selectedSegment < 0)
      return -1;
    else
      return selectedSegment;
  }
  return result;
}

- (BOOL)_animateHighlightingSelectionByDefault
{
  void *v4;
  void *v5;
  void *v6;

  if ((*((_BYTE *)&self->_segmentedControlFlags + 2) & 0x10) == 0)
    return 0;
  v4 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v4, objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "animateHighlightingSelectionByDefault");
  return (char)v5;
}

- (BOOL)_disableSlidingControl
{
  BOOL v3;
  void *v4;

  if (-[UISegmentedControl isMomentary](self, "isMomentary") || _AXSReduceMotionEnabled())
    return 1;
  objc_msgSend(self->_appearanceStorage, "backgroundImageForState:isMini:withFallback:", 0, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)isMomentary
{
  return (*(_BYTE *)&self->_segmentedControlFlags >> 3) & 1;
}

- (UIColor)selectedSegmentTintColor
{
  return self->_selectedSegmentTintColor;
}

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  v4 = *(_QWORD *)&a4;
  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(a3, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerRadiusForControlSize:", v4);
  v7 = v6;

  return v7;
}

+ (id)_modernDividerImageBackground:(BOOL)a3 traitCollection:(id)a4 tintColor:(id)a5 size:(int)a6
{
  uint64_t v6;
  _BOOL8 v8;
  id v10;
  id v11;
  CGColor *v12;
  _UISegmentedControlCacheKey *v13;
  _UISegmentedControlCacheKey *v14;
  UIImage *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  _QWORD *ContextStack;
  CGContext *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  CGRect v36;

  v6 = *(_QWORD *)&a6;
  v8 = a3;
  v10 = a4;
  v11 = a5;
  if (qword_1ECD7A198 != -1)
    dispatch_once(&qword_1ECD7A198, &__block_literal_global_688);
  v12 = (CGColor *)objc_msgSend(a1, "_dividerPrimaryColorBackground:traitCollection:tintColor:", v8, v10, v11);
  v13 = [_UISegmentedControlCacheKey alloc];
  objc_msgSend(v10, "displayScale");
  v14 = -[_UISegmentedControlCacheKey initWithSize:scale:primaryColor:background:](v13, "initWithSize:scale:primaryColor:background:", v6, v12, v8);
  objc_msgSend((id)qword_1ECD7A190, "objectForKey:", v14);
  v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(a1, "_dividerWidthForTraitCollection:size:", v10, v6);
    v17 = v16;
    UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(v10, "userInterfaceIdiom"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 >= 0.0001)
    {
      if (objc_msgSend(v18, "useSelectionIndicatorStyling"))
      {
        if ((_DWORD)v6 == 1)
          v20 = 5.0;
        else
          v20 = 7.0;
        v21 = v20 + v20 + v17 + 1.0;
        objc_msgSend(v10, "displayScale");
        _UIGraphicsBeginImageContextWithOptions(0, 0, v17, v21, v22);
        ContextStack = GetContextStack(0);
        if (*(int *)ContextStack < 1)
          v24 = 0;
        else
          v24 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        v28 = v17 * 0.5;
        CGContextSetFillColorWithColor(v24, v12);
        v29 = 0;
        v30 = 0;
        if (v8)
        {
          UIRectFillUsingOperation(1, 0.0, 0.0, v17, v21);
        }
        else
        {
          v31 = v17;
          v32 = v20 + v20 + v17 + 1.0;
          v36 = CGRectInset(*(CGRect *)&v29, 0.0, v20);
          +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height, v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "fill");

        }
        _UIGraphicsGetImageFromCurrentImageContext(0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        objc_msgSend(v34, "resizableImageWithCapInsets:", v20 + v28, 0.0, v20 + v28, 0.0);
        v15 = (UIImage *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_21;
      }
      else
      {
        _UIGraphicsBeginImageContextWithOptions(0, 0, v17, 1.0, 0.0);
        +[UIColor blackColor](UIColor, "blackColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "set");

        UIRectFillUsingOperation(1, 0.0, 0.0, v17, 1.0);
        _UIGraphicsGetImageFromCurrentImageContext(0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        objc_msgSend(v26, "imageWithRenderingMode:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = -[UIImage _initWithOtherImage:]([_UISegmentedControlDividerImage alloc], "_initWithOtherImage:", v27);
        if (!v15)
          goto LABEL_21;
      }
    }
    else
    {
      v15 = objc_alloc_init(UIImage);
      if (!v15)
        goto LABEL_21;
    }
    objc_msgSend((id)qword_1ECD7A190, "setObject:forKey:", v15, v14);
LABEL_21:

  }
  return v15;
}

+ (CGColor)_dividerPrimaryColorBackground:(BOOL)a3 traitCollection:(id)a4 tintColor:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  CGColor *v12;
  void *v13;
  id v14;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(v8, "userInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "useSelectionIndicatorStyling"))
  {
    if (v6)
    {
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[UIColor systemFillColor](UIColor, "systemFillColor");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
    objc_msgSend(v11, "resolvedColorWithTraitCollection:", v8);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (CGColor *)objc_msgSend(v14, "CGColor");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (double)_lineWidthForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  v4 = *(_QWORD *)&a4;
  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(a3, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dividerWidthForControlSize:", v4);
  v7 = v6;

  return v7;
}

- (void)_insertSelectionViewForSegment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIVisualEffectView *v26;
  UIView *selectionIndicatorView;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  _BOOL4 v33;
  UIImageView *v34;
  void *v35;
  UIImageView *v36;
  UIImageView *selectionImageView;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UISegmentedControl *v43;
  UIView *backdropView;
  UISegmentedControl *v45;
  UIImageView *v46;
  UIImageView *v47;
  UISegmentedControl *v48;
  UIView *v49;
  UISegmentedControl *v50;
  UISegmentedControl *v51;
  id v52;

  v52 = a3;
  v4 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v4, objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  objc_msgSend(v52, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[UISegmentedControl controlSize](self, "controlSize");
  -[UIView traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_selectionFrameForBounds:size:traitCollection:accessibilityView:", v16, v17, 1, v9, v11, v13, v15);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  if (self->_selectedSegmentVisualEffect)
  {
    v26 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", self->_selectedSegmentVisualEffect);
    selectionIndicatorView = self->_selectionIndicatorView;
    self->_selectionIndicatorView = &v26->super;

    -[UISegmentedControl bounds](self, "bounds");
    -[UIView setFrame:](self->_selectionIndicatorView, "setFrame:");
    -[UIView setAutoresizingMask:](self->_selectionIndicatorView, "setAutoresizingMask:", 18);
    if (objc_msgSend(v6, "useGeneratedImages"))
    {
      v28 = (void *)objc_opt_class();
      -[UIView traitCollection](self, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v29, v30, *(_DWORD *)&self->_segmentedControlFlags & 3, v23, v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = 0;
    }
    v36 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v31);
    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = v36;

    -[UIImageView setFrame:](self->_selectionImageView, "setFrame:", v19, v21, v23, v25);
    objc_msgSend(v52, "center");
    -[UIImageView setCenter:](self->_selectionImageView, "setCenter:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView contentView](self->_selectionIndicatorView, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSubview:", self->_selectionImageView);

    }
    else
    {
      -[UIView setMaskView:](self->_selectionIndicatorView, "setMaskView:", self->_selectionImageView);
    }
    if (!objc_msgSend(v6, "hasShadowWithSelectedSegmentEffect")
      || !objc_msgSend(v6, "useGeneratedImages"))
    {
      goto LABEL_26;
    }
    objc_msgSend(v6, "createSelectedSegmentEffectShadowView");
    v34 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      v39 = (void *)objc_opt_class();
      -[UIView traitCollection](self, "traitCollection");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v40, v41, *(_DWORD *)&self->_segmentedControlFlags & 3, v23, v25);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v31);
    }
    -[UIView setTag:](v34, "setTag:", -2030);
    -[UIView setAutoresizingMask:](v34, "setAutoresizingMask:", 18);
    -[UIImageView setFrame:](v34, "setFrame:", v19, v21, v23, v25);
    v43 = self;
    backdropView = v43->_backdropView;
    if (backdropView)
    {
      if ((*((_BYTE *)&v43->_segmentedControlFlags + 3) & 4) != 0)
        -[UIView contentView](backdropView, "contentView");
      else
        -[UIView viewWithTag:](v43, "viewWithTag:", -2031);
      v45 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = v43;
    }
    v35 = v45;

    objc_msgSend(v35, "addSubview:", v34);
  }
  else
  {
    v32 = -[UISegmentedControl transparentBackground](self, "transparentBackground");
    v33 = -[UISegmentedControl _useDynamicShadow](self, "_useDynamicShadow");
    -[UIView traitCollection](self, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
    v34 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "useGeneratedImages"))
    {
      objc_msgSend((id)objc_opt_class(), "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v32 | v33, 0, v31, v34, *(_DWORD *)&self->_segmentedControlFlags & 3, v23, v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    v46 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v35);
    v47 = self->_selectionImageView;
    self->_selectionImageView = v46;

    -[UIImageView setFrame:](self->_selectionImageView, "setFrame:", v19, v21, v23, v25);
    objc_storeStrong((id *)&self->_selectionIndicatorView, self->_selectionImageView);
    if (!v32
      && objc_msgSend((id)objc_opt_class(), "_useShadowForSelectedTintColor:traitCollection:", v34, v31))
    {
      -[UISegmentedControl _updateDynamicShadow:animated:](self, "_updateDynamicShadow:animated:", 1, 0);
    }
  }

LABEL_26:
  v48 = self;
  v49 = v48->_backdropView;
  if (v49)
  {
    if ((*((_BYTE *)&v48->_segmentedControlFlags + 3) & 4) != 0)
      -[UIView contentView](v49, "contentView");
    else
      -[UIView viewWithTag:](v48, "viewWithTag:", -2031);
    v50 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = v48;
  }
  v51 = v50;

  -[UIView insertSubview:atIndex:](v51, "insertSubview:atIndex:", v48->_selectionIndicatorView, -[NSMutableArray count](v48->_segments, "count"));
}

- (BOOL)_useDynamicShadow
{
  return (*(_DWORD *)&self->_segmentedControlFlags & 0x58000) != 0;
}

+ (BOOL)_useShadowForSelectedTintColor:(id)a3 traitCollection:(id)a4
{
  return CGColorGetAlpha((CGColorRef)objc_msgSend(a1, "_backgroundPrimaryColorSelected:highlighted:traitCollection:tintColor:", 1, 0, a4, a3)) >= 1.0;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
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
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  int v18;
  double v19;
  double v20;
  double *v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  -[UISegmentedControl frame](self, "frame", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((*((_BYTE *)&self->_segmentedControlFlags + 1) & 8) != 0)
    -[UISegmentedControl _resetForAppearanceChange](self, "_resetForAppearanceChange");
  v12 = -[NSMutableArray count](self->_segments, "count");
  objc_msgSend(self->_appearanceStorage, "anyDividerImageForMini:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    -[UIView traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISegmentedControl _dividerWidthForTraitCollection:size:](UISegmentedControl, "_dividerWidthForTraitCollection:size:", v26, -[UISegmentedControl controlSize](self, "controlSize"));
    v16 = v27;

    if (v12)
      goto LABEL_5;
LABEL_15:
    v28 = *MEMORY[0x1E0C9D820];
    goto LABEL_19;
  }
  objc_msgSend(v13, "size");
  v16 = v15;
  if (!v12)
    goto LABEL_15;
LABEL_5:
  if ((*((_BYTE *)&self->_segmentedControlFlags + 1) & 2) != 0)
  {
    v29 = 0;
    v25 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_idealWidth");
      v25 = v25 + v31;

      ++v29;
    }
    while (v12 != v29);
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0.0;
    v20 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v17);
      v21 = (double *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = v21[71];
      if (v23 == 0.0)
      {
        objc_msgSend(v21, "_idealWidth");
        if (v20 < v24)
          v20 = v24;
      }
      else
      {
        v19 = v19 + v23;
        ++v18;
      }

      ++v17;
    }
    while (v12 != v17);
    v25 = v19 + v20 * (double)(unint64_t)(v12 - v18);
  }
  v28 = v16 * (double)(unint64_t)(v12 - 1) + v25;
LABEL_19:
  -[UISegmentedControl _barHeight](self, "_barHeight");
  v33 = v32;
  -[UISegmentedControl setFrame:](self, "setFrame:", v5, v7, v9, v11);

  v34 = v28;
  v35 = v33;
  result.height = v35;
  result.width = v34;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  BOOL v10;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISegmentedControl frame](self, "frame");
  v10 = height == v9 && width == v8;
  v12.receiver = self;
  v12.super_class = (Class)UISegmentedControl;
  -[UIView setFrame:](&v12, sel_setFrame_, x, y, width, height);
  segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(_BYTE *)&segmentedControlFlags & 0x40) == 0)
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFDF);
  if (!v10)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if ((~*(_DWORD *)&self->_segmentedControlFlags & 0x820) == 0)
    -[UISegmentedControl _resetForAppearanceChange](self, "_resetForAppearanceChange");
  v7.receiver = self;
  v7.super_class = (Class)UISegmentedControl;
  -[UIView frame](&v7, sel_frame);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)_barHeight
{
  void *v3;
  id appearanceStorage;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  if ((*((_BYTE *)&self->_segmentedControlFlags + 1) & 0x40) != 0)
  {
    -[UISegmentedControl titleTextAttributesForState:](self, "titleTextAttributesForState:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v5 = v8;
    }
    else
    {
      v10 = (void *)objc_opt_class();
      -[UIView traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_fontForTraitCollection:size:selected:", v11, -[UISegmentedControl controlSize](self, "controlSize"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "lineHeight");
    UICeilToViewScale(self);
  }
  else
  {
    v3 = (void *)objc_opt_class();
    appearanceStorage = self->_appearanceStorage;
    -[UIView traitCollection](self, "traitCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = segmentBarHeight(v3, appearanceStorage, (uint64_t)v5, *(_DWORD *)&self->_segmentedControlFlags & 3);
  }
  v12 = v6;

  return v12;
}

- (void)_updateDynamicShadow:(BOOL)a3 animated:(BOOL)a4
{
  if (objc_msgSend((id)objc_opt_class(), "_updateDynamicShadowView:withAnimationDelegate:useDynamicShadow:animated:", self->_selectionIndicatorView, self, a3, a4))*(_DWORD *)&self->_segmentedControlFlags |= 0x10000u;
}

+ (BOOL)_updateDynamicShadowView:(id)a3 withAnimationDelegate:(id)a4 useDynamicShadow:(BOOL)a5 animated:(BOOL)a6
{
  uint64_t v6;
  _BOOL4 v7;
  id v9;
  id v10;
  char v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  double v40;
  double v41;
  double *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  float v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  _QWORD v70[3];
  _QWORD v71[4];

  LODWORD(v6) = a6;
  v7 = a5;
  v71[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
    v11 = v6;
  else
    v11 = 1;
  if (!v7)
  {
    if ((v11 & 1) != 0)
    {
      if (!v9)
        goto LABEL_22;
    }
    else
    {
      objc_msgSend(v9, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shadowOpacity");
      v38 = v37;

      if (v38 == 0.0)
        goto LABEL_22;
    }
    +[UIColor _controlShadowColor](UIColor, "_controlShadowColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "alphaComponent");
    v41 = v40;

    v42 = (double *)MEMORY[0x1E0C9D820];
    if ((_DWORD)v6)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOpacity"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setDuration:", 0.41);
      v44 = *MEMORY[0x1E0CD3048];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setTimingFunction:", v45);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setToValue:", v46);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowRadius"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setDuration:", 0.41);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTimingFunction:", v48);

      objc_msgSend(v47, "setToValue:", &unk_1E1A95690);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOffset"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setDuration:", 0.41);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v44);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setTimingFunction:", v50);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 0.0, 2.5);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setToValue:", v51);

      objc_msgSend(v9, "layer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "presentationLayer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "shadowOpacity");
      v55 = v54;

      if (v55 == 0.0)
      {
        objc_msgSend(v43, "setFromValue:", &unk_1E1A95670);
        objc_msgSend(v47, "setFromValue:", &unk_1E1A95680);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", *v42, v42[1]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setFromValue:", v56);

      }
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setDuration:", 0.41);
      v70[0] = v43;
      v70[1] = v47;
      v70[2] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setAnimations:", v58);

      objc_msgSend(v57, "setDelegate:", v10);
      objc_msgSend(v9, "layer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addAnimation:forKey:", v57, CFSTR("ShadowAnimation"));

    }
    objc_msgSend(v9, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v41;
    *(float *)&v62 = v60;
    objc_msgSend(v61, "setShadowOpacity:", v62);

    objc_msgSend(v9, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setShadowRadius:", 3.0);

    v64 = *v42;
    v65 = v42[1];
    objc_msgSend(v9, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setShadowOffset:", v64, v65);
    goto LABEL_25;
  }
  if ((v11 & 1) != 0)
  {
    if (!v9)
      goto LABEL_22;
    goto LABEL_12;
  }
  objc_msgSend(v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shadowOpacity");
  v14 = v13;

  if (v14 == 0.0)
  {
LABEL_12:
    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOpacity"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDuration:", 0.41);
      v16 = *MEMORY[0x1E0CD3048];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTimingFunction:", v17);

      objc_msgSend(v15, "setToValue:", &unk_1E1A95670);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowRadius"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDuration:", 0.41);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTimingFunction:", v19);

      objc_msgSend(v18, "setToValue:", &unk_1E1A95680);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOffset"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDuration:", 0.41);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTimingFunction:", v21);

      v22 = *MEMORY[0x1E0C9D820];
      v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", *MEMORY[0x1E0C9D820], v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setToValue:", v24);

      objc_msgSend(v9, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentationLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "shadowOpacity");
      v28 = v27;

      if (v28 == 0.0)
      {
        v29 = (void *)MEMORY[0x1E0CB37E8];
        +[UIColor _controlShadowColor](UIColor, "_controlShadowColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "alphaComponent");
        objc_msgSend(v29, "numberWithDouble:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFromValue:", v31);

        objc_msgSend(v18, "setFromValue:", &unk_1E1A95690);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 0.0, 2.5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setFromValue:", v32);

      }
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v15;
      v71[1] = v18;
      v71[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAnimations:", v34);

      objc_msgSend(v9, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addAnimation:forKey:", v33, CFSTR("ShadowAnimation"));

    }
    else
    {
      v22 = *MEMORY[0x1E0C9D820];
      v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    objc_msgSend(v9, "layer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v68) = 1025758986;
    objc_msgSend(v67, "setShadowOpacity:", v68);

    objc_msgSend(v9, "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "setShadowRadius:", 2.30769231);

    objc_msgSend(v9, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setShadowOffset:", v22, v23);
    LOBYTE(v6) = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_22:
  LOBYTE(v6) = 0;
LABEL_26:

  return v6;
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
  -[UISegmentedControl _setSelectedSegmentIndex:notify:](self, "_setSelectedSegmentIndex:notify:", selectedSegmentIndex, 0);
}

- (void)_setSelectedSegmentIndex:(int64_t)a3 notify:(BOOL)a4
{
  -[UISegmentedControl _setSelectedSegmentIndex:notify:animate:](self, "_setSelectedSegmentIndex:notify:animate:", a3, a4, 0);
}

+ (CATransform3D)_hiddenSelectionTransformForTraitCollection:(SEL)a3
{
  CGFloat v5;
  CATransform3D *result;
  id v7;

  UISegmentedControlStyleProviderForIdiom(a2, objc_msgSend(a4, "userInterfaceIdiom"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "segmentHidingFinalScaleFactor");
  CATransform3DMakeScale(retstr, v5, v5, 1.0);

  return result;
}

- (void)setWidth:(CGFloat)width forSegmentAtIndex:(NSUInteger)segment
{
  CGFloat *v6;
  CGFloat *v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
  v6 = (CGFloat *)objc_claimAutoreleasedReturnValue();
  if (v6[71] != width)
  {
    v7 = v6;
    v6[71] = width;
    if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
      -[UISegmentedControl sizeToFit](self, "sizeToFit");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v6 = v7;
  }

}

- (NSUInteger)numberOfSegments
{
  return -[NSMutableArray count](self->_segments, "count");
}

- (void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment
{
  _BOOL8 v5;
  int v7;
  void *v8;
  id v9;

  v5 = enabled;
  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", segment);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "isEnabled");
  objc_msgSend(v9, "setEnabled:", v5);
  if (v7 != v5)
  {
    objc_msgSend(self->_appearanceStorage, "anyDividerImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[UISegmentedControl _updateDividerImageForSegmentAtIndex:](self, "_updateDividerImageForSegmentAtIndex:", segment);
  }
  if (!v5 && self->_selectedSegment == segment)
    -[UISegmentedControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", -1);

}

- (void)_setInterSegmentSpacing:(double)a3
{
  self->_innerSegmentSpacing = a3;
  *(_DWORD *)&self->_segmentedControlFlags |= 0x2000u;
}

- (void)_setAlwaysEmitValueChanged:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFFFB | v3);
}

- (UISegmentedControl)initWithItems:(NSArray *)items
{
  NSArray *v4;
  UISegmentedControl *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v16;

  v4 = items;
  if (dyld_program_sdk_at_least())
  {
    v16.receiver = self;
    v16.super_class = (Class)UISegmentedControl;
    v5 = -[UIControl initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UISegmentedControl __initWithFrameCommonOperations](v5, "__initWithFrameCommonOperations");
    if (!v5)
      goto LABEL_17;
  }
  else
  {
    v5 = -[UISegmentedControl initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    if (!v5)
      goto LABEL_17;
  }
  v5->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v5->_segmentedControlFlags & 0xFFFFFFDC | 0x20);
  v6 = -[NSArray count](v4, "count");
  v7 = v6;
  if (v6 >= 1)
  {
    v8 = 0;
    v9 = (v6 - 1);
    v10 = v6;
    do
    {
      if (v9 == v8)
        v11 = 2;
      else
        v11 = 1;
      if (!v8)
        v11 = 0;
      if (v7 == 1)
        v12 = 3;
      else
        v12 = v11;
      -[NSArray objectAtIndex:](v4, "objectAtIndex:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[UISegmentedControl _createAndAddSegmentAtIndex:position:withInfo:](v5, "_createAndAddSegmentAtIndex:position:withInfo:", v8, v12, v13);

      ++v8;
    }
    while (v10 != v8);
  }
  -[UISegmentedControl sizeToFit](v5, "sizeToFit");
LABEL_17:

  return v5;
}

- (UISegmentedControl)initWithFrame:(CGRect)frame
{
  UISegmentedControl *v3;
  UISegmentedControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISegmentedControl;
  v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
    -[UISegmentedControl __initWithFrameCommonOperations](v3, "__initWithFrameCommonOperations");
  return v4;
}

- (void)__initWithFrameCommonOperations
{
  NSMutableArray *v3;
  NSMutableArray *segments;
  void *v5;
  void *v6;
  id v7;

  -[UISegmentedControl _commonSegmentedControlInit](self, "_commonSegmentedControlInit");
  -[UISegmentedControl _installVisualStyleDefaults](self, "_installVisualStyleDefaults");
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  segments = self->_segments;
  self->_segments = v3;

  v5 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "useTVStyleFocusSelection"))
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", &__block_literal_global_151);

}

- (void)_installVisualStyleDefaults
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  UIVisualEffect *v13;
  UIVisualEffect *v14;
  UIVisualEffect *v15;
  char v16;
  void *v17;
  UIView *selectionIndicatorView;
  UIView *v19;
  UIImageView *selectionImageView;
  UISegmentedControl *v21;
  UIView *backdropView;
  UISegmentedControl *v23;
  UISegmentedControl *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  UIView *v33;
  UIView **p_backdropView;
  UIView *v35;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  UIView *v37;
  UIVisualEffectView *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  uint64_t v49;
  void *v50;
  int v51;
  int v52;
  int v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "hasTransparentBackgroundByDefault");
  v7 = v6;
  if (v6)
    -[UISegmentedControl setTransparentBackground:](self, "setTransparentBackground:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "apportionsSegmentWidthsByContentByDefault"))
  {
    -[UISegmentedControl setApportionsSegmentWidthsByContent:](self, "setApportionsSegmentWidthsByContent:", 1);
  }
  objc_msgSend(v5, "defaultBackgroundTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !self->_backgroundTintColor)
    -[UISegmentedControl _setBackgroundTintColor:](self, "_setBackgroundTintColor:", v8);
  if (objc_msgSend(v5, "supportsDynamicTypeByDefault"))
    -[UISegmentedControl setAdjustsForContentSizeCategory:](self, "setAdjustsForContentSizeCategory:", 1);
  objc_msgSend(v5, "defaultInterSegmentSpacing");
  if (v9 != 0.0)
    -[UISegmentedControl _setInterSegmentSpacing:](self, "_setInterSegmentSpacing:");
  objc_msgSend(v5, "selectedSegmentDefaultVibrancyEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedSegmentDefaultBlurEffect");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_segmentedControlFlags + 2) & 0x20) == 0)
  {
    if (v10)
      v11 = v10;
    else
      v11 = v58;
    v12 = v11;
    v13 = self->_selectedSegmentVisualEffect;
    v14 = (UIVisualEffect *)v12;
    v15 = v14;
    if (v13 != v14)
    {
      if (v14 && v13)
      {
        v16 = -[UIVisualEffect isEqual:](v13, "isEqual:", v14);

        if ((v16 & 1) != 0)
          goto LABEL_42;
      }
      else
      {

      }
      v17 = v8;
      objc_storeStrong((id *)&self->_selectedSegmentVisualEffect, v11);
      selectionIndicatorView = self->_selectionIndicatorView;
      if (selectionIndicatorView)
      {
        -[UIView removeFromSuperview](selectionIndicatorView, "removeFromSuperview");
        v19 = self->_selectionIndicatorView;
        self->_selectionIndicatorView = 0;

        selectionImageView = self->_selectionImageView;
        self->_selectionImageView = 0;

        v21 = self;
        backdropView = v21->_backdropView;
        if (backdropView)
        {
          if ((*((_BYTE *)&self->_segmentedControlFlags + 3) & 4) != 0)
            -[UIView contentView](backdropView, "contentView");
          else
            -[UIView viewWithTag:](v21, "viewWithTag:", -2031);
          v23 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = v21;
        }
        v24 = v23;

        -[UIView viewWithTag:](v24, "viewWithTag:", -2030);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          objc_msgSend(v25, "removeFromSuperview");

      }
      v26 = v10;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v27 = self->_segments;
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v68 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "_removeSelectionIndicator");
          }
          v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
        }
        while (v29);
      }

      -[UISegmentedControl _setNeedsBackgroundAndContentViewUpdate](self, "_setNeedsBackgroundAndContentViewUpdate");
      v8 = v17;
      v10 = v26;
      goto LABEL_42;
    }

LABEL_42:
  }
  if ((v7 & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v32 = 0;
  }
  else
  {
    objc_msgSend(v5, "backgroundBlurEffect");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "createBackdropView");
  v33 = (UIView *)objc_claimAutoreleasedReturnValue();
  p_backdropView = &self->_backdropView;
  v35 = self->_backdropView;
  self->_backdropView = v33;

  segmentedControlFlags = self->_segmentedControlFlags;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFDFFFFFF | ((self->_backdropView != 0) << 25));
  if (self->_backdropView)
  {
    v55 = v32;
    v56 = v10;
    v57 = v8;
    v37 = [UIView alloc];
    -[UISegmentedControl bounds](self, "bounds");
    v38 = -[UIView initWithFrame:](v37, "initWithFrame:");
    -[UIView setTag:](v38, "setTag:", -2031);
    -[UIView setAutoresizingMask:](v38, "setAutoresizingMask:", 18);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    -[UIView subviews](self, "subviews");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v64 != v42)
            objc_enumerationMutation(v39);
          -[UIView addSubview:](v38, "addSubview:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v41);
    }

    -[UIView setClipsToBounds:](v38, "setClipsToBounds:", -[UIView clipsToBounds](self, "clipsToBounds"));
    -[UIView _cornerRadius](self, "_cornerRadius");
    -[UIVisualEffectView _setCornerRadius:](v38, "_setCornerRadius:");
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v38, 0);
    -[UISegmentedControl bounds](self, "bounds");
    -[UIView setFrame:](*p_backdropView, "setFrame:");
    -[UIView setAutoresizingMask:](*p_backdropView, "setAutoresizingMask:", 18);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backdropView, 0);
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
    -[UIView _setCornerRadius:](self, "_setCornerRadius:", 0.0);
  }
  else
  {
    if (!v32)
      goto LABEL_66;
    v56 = v10;
    v57 = v8;
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags | 0x6000000);
    -[UISegmentedControl setTransparentBackground:](self, "setTransparentBackground:", 1);
    v55 = v32;
    v38 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v32);
    objc_storeStrong((id *)&self->_backdropView, v38);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    -[UIView subviews](self, "subviews");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v60 != v47)
            objc_enumerationMutation(v44);
          v49 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
          -[UIVisualEffectView contentView](v38, "contentView");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addSubview:", v49);

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      }
      while (v46);
    }

    -[UISegmentedControl bounds](self, "bounds");
    -[UIView setFrame:](*p_backdropView, "setFrame:");
    -[UIView setAutoresizingMask:](*p_backdropView, "setAutoresizingMask:", 18);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backdropView, 0);
  }
  v32 = v55;

  v10 = v56;
  v8 = v57;
LABEL_66:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v51 = 0x80000;
  else
    v51 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFF7FFFF | v51);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v52 = 0x100000;
  else
    v52 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFEFFFFF | v52);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v53 = 0x1000000;
  else
    v53 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFEFFFFFF | v53);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v54 = 0x800000;
  else
    v54 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFF7FFFFF | v54);

}

- (void)_commonSegmentedControlInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILongPressGestureRecognizer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  IMP MethodImplementation;
  objc_class *v15;
  id v16;

  -[UIView setOpaque:](self, "setOpaque:", 0);
  self->_highlightedSegment = -1;
  self->_selectedSegment = -1;
  self->_hoveredSegment = -1;
  -[UIControl pointerInteraction](self, "pointerInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  v4 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v4, objc_msgSend(v5, "userInterfaceIdiom"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  self->_enabledAlpha = 1.0;
  if (objc_msgSend(v16, "useSelectionIndicatorStyling"))
  {
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
    v6 = (void *)objc_opt_class();
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cornerRadiusForTraitCollection:size:", v7, -[UISegmentedControl controlSize](self, "controlSize"));
    -[UIView _setCornerRadius:](self, "_setCornerRadius:");

  }
  else
  {
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
  }
  v8 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__axLongPressHandler_);
  -[UISegmentedControl setAxLongPressGestureRecognizer:](self, "setAxLongPressGestureRecognizer:", v8);

  -[UISegmentedControl axLongPressGestureRecognizer](self, "axLongPressGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumPressDuration:", 0.15);

  -[UISegmentedControl axLongPressGestureRecognizer](self, "axLongPressGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowableMovement:", 50.0);

  -[UISegmentedControl _updateAxLongPressGestureRecognizer](self, "_updateAxLongPressGestureRecognizer");
  if (objc_msgSend(v16, "useTVStyleFocusSelection"))
  {
    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 4.5);

    -[UIView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  }
  v13 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v13, sel__createInfoViewForSegmentAtIndex_item_);
  v15 = (objc_class *)objc_opt_class();
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFBFFFFF | ((MethodImplementation != class_getMethodImplementation(v15, sel__createInfoViewForSegmentAtIndex_item_)) << 22));

}

- (UILongPressGestureRecognizer)axLongPressGestureRecognizer
{
  return self->_axLongPressGestureRecognizer;
}

- (void)setAxLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_axLongPressGestureRecognizer, a3);
}

- (void)_updateAxLongPressGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v5)
    || (*((_BYTE *)&self->_segmentedControlFlags + 1) & 0x40) != 0)
  {

    goto LABEL_6;
  }
  v6 = objc_msgSend(v8, "supportsAXPopover");

  if (!v6)
  {
LABEL_6:
    -[UISegmentedControl axLongPressGestureRecognizer](self, "axLongPressGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", v7);
    goto LABEL_7;
  }
  -[UISegmentedControl axLongPressGestureRecognizer](self, "axLongPressGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", v7);
LABEL_7:

}

- (void)sizeToFit
{
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  objc_super v4;

  segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(_BYTE *)&segmentedControlFlags & 0x40) == 0)
  {
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags | 0x40);
    v4.receiver = self;
    v4.super_class = (Class)UISegmentedControl;
    -[UIView sizeToFit](&v4, sel_sizeToFit);
    *(_DWORD *)&self->_segmentedControlFlags &= ~0x40u;
  }
}

void __60__UISegmentedControl__fontForTraitCollection_size_selected___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1ECD7A1A0;
  qword_1ECD7A1A0 = (uint64_t)v0;

}

void __110__UISegmentedControl__modernBackgroundSelected_shadow_maximumSize_highlighted_traitCollection_tintColor_size___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1ECD7A180;
  qword_1ECD7A180 = (uint64_t)v0;

}

- (void)_insertSegment:(int)a3 withInfo:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  _QWORD v32[5];
  id v33;
  _QWORD aBlock[5];
  id v35;
  int v36;
  int v37;

  v5 = a5;
  v8 = a4;
  v9 = -[NSMutableArray count](self->_segments, "count");
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  if (v9 >= a3)
    v12 = a3;
  else
    v12 = v9;
  aBlock[2] = __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke;
  aBlock[3] = &unk_1E16B1C28;
  aBlock[4] = self;
  v36 = v12;
  v37 = v9;
  v13 = v8;
  v35 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v15 = v14;
  if (v5)
  {
    v14[2](v14);
    -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "animateAdd:", 1);
    v17 = __OFSUB__(v12, 1);
    v18 = (v12 - 1);
    if ((int)v18 < 0 == v17)
    {
      objc_msgSend(v16, "frame");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "frame");
      v28 = v26 + v27;

      objc_msgSend(v16, "setFrame:", v28, v20, v22, v24);
    }
    if (v10 > a3)
      objc_msgSend(v16, "setShowDivider:", 1);
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_2;
    v32[3] = &unk_1E16B1B50;
    v32[4] = self;
    v33 = v16;
    v29 = v16;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v32, 0, 0.25, 0.0);

  }
  else
  {
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_3;
    v30[3] = &unk_1E16B1BF8;
    v31 = v14;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
    v29 = v31;
  }

}

- (void)setTransparentBackground:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_segmentedControlFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 256;
    else
      v3 = 0;
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFEFF | v3);
    -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
  }
}

- (void)setApportionsSegmentWidthsByContent:(BOOL)apportionsSegmentWidthsByContent
{
  int v4;

  if (apportionsSegmentWidthsByContent)
    v4 = 512;
  else
    v4 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFDFF | v4);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setSelectedSegmentTintColor:(UIColor *)selectedSegmentTintColor
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  BOOL v8;
  UIColor *v9;

  v5 = selectedSegmentTintColor;
  v6 = self->_selectedSegmentTintColor;
  v7 = v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIColor isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_selectedSegmentTintColor, selectedSegmentTintColor);
    -[UISegmentedControl _setNeedsBackgroundAndContentViewUpdate](self, "_setNeedsBackgroundAndContentViewUpdate");
  }
LABEL_9:

}

- (void)_setSelectedSegmentVibrancyEffect:(id)a3
{
  id v5;
  UIVisualEffect *v6;
  UIVisualEffect *v7;
  UIVisualEffect *v8;
  char v9;
  UIView *selectionIndicatorView;
  UIView *v11;
  UIImageView *selectionImageView;
  UISegmentedControl *v13;
  UIView *backdropView;
  UISegmentedControl *v15;
  UISegmentedControl *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *(_DWORD *)&self->_segmentedControlFlags |= 0x200000u;
  v6 = self->_selectedSegmentVisualEffect;
  v7 = (UIVisualEffect *)v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = -[UIVisualEffect isEqual:](v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_selectedSegmentVisualEffect, a3);
    selectionIndicatorView = self->_selectionIndicatorView;
    if (selectionIndicatorView)
    {
      -[UIView removeFromSuperview](selectionIndicatorView, "removeFromSuperview");
      v11 = self->_selectionIndicatorView;
      self->_selectionIndicatorView = 0;

      selectionImageView = self->_selectionImageView;
      self->_selectionImageView = 0;

      v13 = self;
      backdropView = v13->_backdropView;
      if (backdropView)
      {
        if ((*((_BYTE *)&self->_segmentedControlFlags + 3) & 4) != 0)
          -[UIView contentView](backdropView, "contentView");
        else
          -[UIView viewWithTag:](v13, "viewWithTag:", -2031);
        v15 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v13;
      }
      v16 = v15;

      -[UIView viewWithTag:](v16, "viewWithTag:", -2030);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        objc_msgSend(v17, "removeFromSuperview");

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = self->_segments;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "_removeSelectionIndicator", (_QWORD)v23);
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v20);
    }

    -[UISegmentedControl _setNeedsBackgroundAndContentViewUpdate](self, "_setNeedsBackgroundAndContentViewUpdate");
  }
LABEL_26:

}

- (void)_setNeedsBackgroundAndContentViewUpdate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_segments;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setNeedsBackgroundAndContentViewUpdate", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  BOOL v10;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISegmentedControl bounds](self, "bounds");
  v10 = height == v9 && width == v8;
  v12.receiver = self;
  v12.super_class = (Class)UISegmentedControl;
  -[UIView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(_BYTE *)&segmentedControlFlags & 0x40) == 0)
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFDF);
  if (!v10)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
}

void __83__UISegmentedControl__modernDividerImageBackground_traitCollection_tintColor_size___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1ECD7A190;
  qword_1ECD7A190 = (uint64_t)v0;

}

- (id)_viewForLoweringBaselineLayoutAttribute:(int)a3
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)UISegmentedControl;
  -[UIView _viewForLoweringBaselineLayoutAttribute:](&v17, sel__viewForLoweringBaselineLayoutAttribute_, *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "translatesAutoresizingMaskIntoConstraints"))
  {
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_segments;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "viewForLastBaselineLayout", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
  return v5;
}

+ (void)_registerStyleProvider:(id)a3 forIdiom:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)_MergedGlobals_57_0;
    if (!_MergedGlobals_57_0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)_MergedGlobals_57_0;
      _MergedGlobals_57_0 = v6;

      v5 = (void *)_MergedGlobals_57_0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, v8);

  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("selectedSegmentIndex")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___UISegmentedControl;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (double)_defaultHeight
{
  void *v3;
  double v4;
  double v5;

  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultHeightForTraitCollection:size:", v3, 0);
  v5 = v4;

  return v5;
}

+ (double)defaultHeightForStyle:(int64_t)a3 size:(int)a4
{
  uint64_t v4;
  void *v6;
  double v7;
  double v8;

  v4 = *(_QWORD *)&a4;
  +[UITraitCollection _fallbackTraitCollection]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultHeightForTraitCollection:size:", v6, v4);
  v8 = v7;

  return v8;
}

+ (double)defaultHeightForStyle:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultHeightForTraitCollection:size:", v4, 0);
  v6 = v5;

  return v6;
}

- (BOOL)apportionsSegmentWidthsByContent
{
  return (*((unsigned __int8 *)&self->_segmentedControlFlags + 1) >> 1) & 1;
}

void __53__UISegmentedControl___initWithFrameCommonOperations__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceForTraitCollection:](UISegmentedControl, "appearanceForTraitCollection:", v0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceForTraitCollection:](UISegmentedControl, "appearanceForTraitCollection:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.05);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v4);

}

- (UISegmentedControl)initWithFrame:(CGRect)frame actions:(NSArray *)actions
{
  double height;
  double width;
  double y;
  double x;
  NSArray *v9;
  UISegmentedControl *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  id v20;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  v9 = actions;
  v10 = -[UISegmentedControl initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = v12;
    if (v12 >= 1)
    {
      v14 = 0;
      v15 = (v12 - 1);
      v16 = v12;
      do
      {
        if (v15 == v14)
          v17 = 2;
        else
          v17 = 1;
        if (!v14)
          v17 = 0;
        if (v13 == 1)
          v18 = 3;
        else
          v18 = v17;
        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[UISegmentedControl _createAndAddSegmentAtIndex:position:withInfo:](v10, "_createAndAddSegmentAtIndex:position:withInfo:", v14, v18, v19);

        ++v14;
      }
      while (v16 != v14);
    }

  }
  return v10;
}

- (id)_tintColorArchivingKey
{
  return CFSTR("UISegmentedControlTintColor");
}

- (UISegmentedControl)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UISegmentedControl *v5;
  UISegmentedControl *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = coder;
  v20.receiver = self;
  v20.super_class = (Class)UISegmentedControl;
  v5 = -[UIControl initWithCoder:](&v20, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UISegmentedControl _commonSegmentedControlInit](v5, "_commonSegmentedControlInit");
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIMomentary")))
      v7 = 8;
    else
      v7 = 0;
    v6->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFFF7 | v7);
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISegmentedControlAlwaysEmitValueChanged")))
      v8 = 4;
    else
      v8 = 0;
    v6->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFFFB | v8);
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIUseProportionalWidthSegments")))
      v9 = 512;
    else
      v9 = 0;
    v6->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFDFF | v9);
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISegments"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    v12 = v11;
    if (!v11)
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_storeStrong((id *)&v6->_segments, v12);
    if (!v11)

    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAutosizeToFitSegments")))
      v13 = 32;
    else
      v13 = 0;
    v6->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&v6->_segmentedControlFlags & 0xFFFFFFDF | v13);
    -[UISegmentedControl setControlSize:](v6, "setControlSize:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISegmentedControlSize")));
    v14 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISelectedSegmentIndex"));
    if ((v14 & 0x8000000000000000) != 0 || (v15 = v14, v14 >= -[NSMutableArray count](v6->_segments, "count")))
      v15 = -1;
    -[UISegmentedControl _setSelectedSegmentIndex:notify:animate:](v6, "_setSelectedSegmentIndex:notify:animate:", v15, 0, 0);
    -[UISegmentedControl _setEnabled:forcePropagateToSegments:](v6, "_setEnabled:forcePropagateToSegments:", -[UIControl isEnabled](v6, "isEnabled"), 1);
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISpringLoaded")))
      -[UISegmentedControl setSpringLoaded:](v6, "setSpringLoaded:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISpringLoaded")));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISegmentedControlSelectedSegmentTintColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl setSelectedSegmentTintColor:](v6, "setSelectedSegmentTintColor:", v16);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISegmentedControlSelectedSegmentVibrancyEffect"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl _setSelectedSegmentVibrancyEffect:](v6, "_setSelectedSegmentVibrancyEffect:", v17);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISegmentedControlBackgroundTintColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl _setBackgroundTintColor:](v6, "_setBackgroundTintColor:", v18);

    -[UISegmentedControl _installVisualStyleDefaults](v6, "_installVisualStyleDefaults");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  $05538722D7BB7C1D427C07F59A9C38BA v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISegmentedControl;
  -[UIControl encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  segmentedControlFlags = self->_segmentedControlFlags;
  if ((*(_BYTE *)&segmentedControlFlags & 8) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIMomentary"));
    segmentedControlFlags = self->_segmentedControlFlags;
  }
  if ((*(_BYTE *)&segmentedControlFlags & 4) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISegmentedControlAlwaysEmitValueChanged"));
  if (-[NSMutableArray count](self->_segments, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_segments, CFSTR("UISegments"));
  v6 = self->_segmentedControlFlags;
  if ((*(_BYTE *)&v6 & 3) != 0)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    v6 = self->_segmentedControlFlags;
  }
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAutosizeToFitSegments"));
    v6 = self->_segmentedControlFlags;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIUseProportionalWidthSegments"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_selectedSegment, CFSTR("UISelectedSegmentIndex"));
  if (-[UISegmentedControl isSpringLoaded](self, "isSpringLoaded"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISpringLoaded"));
  -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UISegmentedControlSelectedSegmentTintColor"));

  }
  -[UISegmentedControl _selectedSegmentVibrancyEffect](self, "_selectedSegmentVibrancyEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UISegmentedControl _selectedSegmentVibrancyEffect](self, "_selectedSegmentVibrancyEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UISegmentedControlSelectedSegmentVibrancyEffect"));

  }
  -[UISegmentedControl _backgroundTintColor](self, "_backgroundTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UISegmentedControl _backgroundTintColor](self, "_backgroundTintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UISegmentedControlBackgroundTintColor"));

  }
}

- (void)dealloc
{
  objc_super v3;

  -[UISegmentedControl removeAllSegments](self, "removeAllSegments");
  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControl;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UISegmentedControl;
  -[UIView traitCollectionDidChange:](&v21, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v5 != v7)
  {
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 != -1 && objc_msgSend(v4, "userInterfaceIdiom") != -1)
      -[UISegmentedControl _installVisualStyleDefaults](self, "_installVisualStyleDefaults");
  }
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v11)
    -[UISegmentedControl _setNeedsBackgroundAndContentViewUpdate](self, "_setNeedsBackgroundAndContentViewUpdate");
  -[UIView traitCollection](self, "traitCollection");
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v4)
    {
      v13 = v12[13];
      v14 = v4[13];

      if (v13 == v14)
        goto LABEL_13;
    }
    else
    {

    }
    -[UISegmentedControl _updateAxLongPressGestureRecognizer](self, "_updateAxLongPressGestureRecognizer");
  }
LABEL_13:
  -[UIView traitCollection](self, "traitCollection");
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v4)
    {
      v16 = v15[15];
      v17 = v4[15];

      if (v16 == v17)
        goto LABEL_19;
    }
    else
    {

    }
    -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
  }
LABEL_19:
  if ((*((_BYTE *)&self->_segmentedControlFlags + 2) & 8) != 0)
  {
    v18 = (void *)objc_opt_class();
    -[UIView traitCollection](self, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v18, objc_msgSend(v19, "userInterfaceIdiom"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "updateSegmentedControl:fromTraitCollection:", self, v4);
  }

}

- (void)_setSegmentedControlAppearance:(id *)a3
{
  id appearanceStorage;
  _UISegmentedControlAppearanceStorage *v6;
  id v7;

  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v6 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
    v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  objc_msgSend(appearanceStorage, "setDetail:", a3);
  -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
}

- (void)_setAppearanceIsTiled:(BOOL)a3 leftCapWidth:(unint64_t)a4 rightCapWidth:(unint64_t)a5
{
  _BOOL8 v7;
  id appearanceStorage;
  _UISegmentedControlAppearanceStorage *v10;
  id v11;

  v7 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v10 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
    v11 = self->_appearanceStorage;
    self->_appearanceStorage = v10;

    appearanceStorage = self->_appearanceStorage;
  }
  objc_msgSend(appearanceStorage, "setIsTiled:leftCapWidth:rightCapWidth:", v7, a4, a5);
  -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
}

- (UISegmentedControlStyle)segmentedControlStyle
{
  return 5;
}

- (void)_setControlSize:(int)a3 andInvalidate:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  segmentedControlFlags = self->_segmentedControlFlags;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFFC | a3 & 3);
  if ((*(_BYTE *)&segmentedControlFlags & 0x20) != 0)
  {
    -[UISegmentedControl sizeToFit](self, "sizeToFit");
  }
  else
  {
    -[UISegmentedControl frame](self, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UISegmentedControl _barHeight](self, "_barHeight");
    -[UISegmentedControl setFrame:](self, "setFrame:", v9, v11, v13, v14);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_segments;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setControlSize:", v5, (_QWORD)v20);
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

  if (v4)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setControlSize:(int)a3
{
  if ((*(_DWORD *)&self->_segmentedControlFlags & 3) != a3)
    -[UISegmentedControl _setControlSize:andInvalidate:](self, "_setControlSize:andInvalidate:");
}

- (int64_t)segmentControlStyle
{
  return 0;
}

- (void)setMomentary:(BOOL)momentary
{
  int v3;
  NSMutableArray *segments;
  _QWORD v5[4];
  BOOL v6;

  if (((((*(_DWORD *)&self->_segmentedControlFlags & 8) == 0) ^ momentary) & 1) == 0)
  {
    if (momentary)
      v3 = 8;
    else
      v3 = 0;
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFFF7 | v3);
    segments = self->_segments;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35__UISegmentedControl_setMomentary___block_invoke;
    v5[3] = &__block_descriptor_33_e15_v32__0_8Q16_B24l;
    v6 = momentary;
    -[NSMutableArray enumerateObjectsUsingBlock:](segments, "enumerateObjectsUsingBlock:", v5);
  }
}

uint64_t __35__UISegmentedControl_setMomentary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMomentary:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_setAutosizeText:(BOOL)a3
{
  int v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((((*(_DWORD *)&self->_segmentedControlFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 128;
    else
      v4 = 0;
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFF7F | v4);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_segments;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setAutosizeText:", (*(_DWORD *)&self->_segmentedControlFlags >> 7) & 1, (_QWORD)v10);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setBarStyle:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_segments;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setBarStyle:", self->_barStyle, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (void)setAdjustsForContentSizeCategory:(BOOL)a3
{
  int v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((((*(_DWORD *)&self->_segmentedControlFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x4000;
    else
      v4 = 0;
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFBFFF | v4);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_segments;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setAdjustsForContentSizeCategory:", (*(_DWORD *)&self->_segmentedControlFlags >> 14) & 1, (_QWORD)v10);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
    -[UISegmentedControl _updateAxLongPressGestureRecognizer](self, "_updateAxLongPressGestureRecognizer");
  }
}

- (BOOL)adjustsForContentSizeCategory
{
  return (*((unsigned __int8 *)&self->_segmentedControlFlags + 1) >> 6) & 1;
}

- (void)_setAnimatingOutDynamicShdaow:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFEFFFF | v3);
}

- (BOOL)_animatingOutDynamicShadow
{
  return *((_BYTE *)&self->_segmentedControlFlags + 2) & 1;
}

- (BOOL)_usesNewAnimations
{
  return 0;
}

- (void)insertSegmentWithImage:(UIImage *)image atIndex:(NSUInteger)segment animated:(BOOL)animated
{
  -[UISegmentedControl _insertSegment:withInfo:animated:](self, "_insertSegment:withInfo:animated:", segment, image, animated);
}

- (void)insertSegmentWithAction:(UIAction *)action atIndex:(NSUInteger)segment animated:(BOOL)animated
{
  _BOOL8 v5;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  UIAction *v11;

  v5 = animated;
  v11 = action;
  -[UIAction identifier](v11, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UISegmentedControl segmentIndexForActionIdentifier:](self, "segmentIndexForActionIdentifier:", v8);

  if (v9 == segment)
  {
    -[UISegmentedControl _setAction:forSegmentAtIndex:](self, "_setAction:forSegmentAtIndex:", v11, segment);

  }
  else
  {
    -[UISegmentedControl _insertSegment:withInfo:animated:](self, "_insertSegment:withInfo:animated:", segment, v11, v5);

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 <= segment)
        v10 = v9;
      else
        v10 = v9 + 1;
      -[UISegmentedControl removeSegmentAtIndex:animated:](self, "removeSegmentAtIndex:animated:", v10, v5);
    }
  }
}

- (void)_insertSegmentWithAttributedTitle:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  -[UISegmentedControl _insertSegment:withInfo:animated:](self, "_insertSegment:withInfo:animated:", a4, a3, a5);
}

- (id)_accessibilitySegmentItemAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_segments, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  NSUInteger selectedSegment;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  NSUInteger v16;
  BOOL v17;
  BOOL v18;

  v4 = animated;
  if (segment < (int)-[NSMutableArray count](self->_segments, "count"))
  {
    v7 = -[NSMutableArray count](self->_segments, "count") - 1;
    -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", segment);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_selectedSegment == segment)
      -[UISegmentedControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", -1);
    if (!v4)
      objc_msgSend(v8, "removeFromSuperview");
    -[NSMutableArray removeObjectAtIndex:](self->_segments, "removeObjectAtIndex:", segment);
    selectedSegment = self->_selectedSegment;
    if (selectedSegment > segment)
      -[UISegmentedControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", selectedSegment - 1);
    if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
      -[UISegmentedControl sizeToFit](self, "sizeToFit");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if (v4)
    {
      v10 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke;
      v14[3] = &unk_1E16B66F0;
      v14[4] = self;
      v17 = segment == 0;
      v15 = v8;
      v16 = segment;
      v18 = v7 == segment;
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke_2;
      v12[3] = &unk_1E16B3FD8;
      v11 = v15;
      v13 = v11;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v14, v12, 0.25, 0.0);
      if (!segment || v7 == segment)
        -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v11);

    }
    -[UISegmentedControl setRemovedSegment:](self, "setRemovedSegment:", 0);

  }
}

void __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke(uint64_t a1)
{
  double v2;
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
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v6 = v4;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "animateRemoveForWidth:", v4 * -0.5 + 5.0);
  }
  else
  {
    v7 = v2;
    v8 = v3;
    v9 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "objectAtIndex:", *(_QWORD *)(a1 + 48) - 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v12 = v10 + v11 + v6 * -0.5 - v7;
    if (!*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 40), "setFrame:", v7 + v12, v8, v6, v9);
      v12 = 0.0;
    }
    objc_msgSend(*(id *)(a1 + 40), "animateRemoveForWidth:", v12);

  }
}

uint64_t __52__UISegmentedControl_removeSegmentAtIndex_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)removeAllSegments
{
  self->_selectedSegment = -1;
  self->_highlightedSegment = -1;
  self->_hoveredSegment = -1;
  -[NSMutableArray makeObjectsPerformSelector:](self->_segments, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[NSMutableArray removeAllObjects](self->_segments, "removeAllObjects");
}

- (NSString)titleForSegmentAtIndex:(NSUInteger)segment
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v5 = v6;
  }
  v7 = v5;

  return (NSString *)v7;
}

- (void)_setAction:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAction:", v16);
  objc_msgSend(v16, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v16, "title");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v6, "objectValue");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (v11 && v10)
    {
      v13 = objc_msgSend(v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    objc_msgSend(v16, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "setObjectValue:", v14);
    }
    else
    {
      objc_msgSend(v16, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObjectValue:", v15);

    }
    if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
      -[UISegmentedControl sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
LABEL_17:

}

- (void)setAction:(UIAction *)action forSegmentAtIndex:(NSUInteger)segment
{
  void *v7;
  NSInteger v8;
  void *v10;
  UIAction *v11;

  v11 = action;
  -[UIAction identifier](v11, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UISegmentedControl segmentIndexForActionIdentifier:](self, "segmentIndexForActionIdentifier:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v8 != segment)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISegmentedControl.m"), 4181, CFSTR("Attempting to set the action of segment at index %lu with an action whose identifier is the same as the segment at index %lu (action=%@). Identifiers are required to be unique."), segment, v8, v11);

  }
  -[UISegmentedControl _setAction:forSegmentAtIndex:](self, "_setAction:forSegmentAtIndex:", v11, segment);

}

- (UIAction)actionForSegmentAtIndex:(NSUInteger)segment
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->_segments, "count") <= segment)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIAction *)v6;
}

- (NSInteger)segmentIndexForActionIdentifier:(UIActionIdentifier)actionIdentifier
{
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSInteger v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = actionIdentifier;
  v5 = -[NSMutableArray count](self->_segments, "count");
  if (v5 < 1)
  {
LABEL_6:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
          break;
      }
      if (v6 == ++v7)
        goto LABEL_6;
    }
  }

  return v7;
}

- (void)_setAttributedTitle:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  id v11;

  v6 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v11 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (v9 && v8)
    {
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v7, "setObjectValue:", v11);
    if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
      -[UISegmentedControl sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
LABEL_11:

}

- (id)_attributedTitleForSegmentAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)setImage:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment
{
  UIImage *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  BOOL v10;
  UIImage *v11;

  v6 = image;
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectValue");
  v8 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v11 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (v9 && v8)
    {
      v10 = -[UIImage isEqual:](v8, "isEqual:", v9);

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v7, "setObjectValue:", v11);
    if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
      -[UISegmentedControl sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
LABEL_11:

}

- (UIImage)imageForSegmentAtIndex:(NSUInteger)segment
{
  void *v3;
  void *v4;
  void *v5;
  UIImage *v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (CGFloat)widthForSegmentAtIndex:(NSUInteger)segment
{
  double *v3;
  double v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  v4 = v3[71];

  return v4;
}

- (void)setContentOffset:(CGSize)offset forSegmentAtIndex:(NSUInteger)segment
{
  double height;
  double width;
  double *v8;
  void *v10;
  double *v11;

  height = offset.height;
  width = offset.width;
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
  v8 = (double *)objc_claimAutoreleasedReturnValue();
  if (width != v8[72] || height != v8[73])
  {
    v11 = v8;
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentOffset:", width, height);

    if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
      -[UISegmentedControl sizeToFit](self, "sizeToFit");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v8 = v11;
  }

}

- (CGSize)contentOffsetForSegmentAtIndex:(NSUInteger)segment
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", segment);
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  v4 = v3[72];
  v5 = v3[73];

  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)isEnabledForSegmentAtIndex:(NSUInteger)segment
{
  void *v3;
  char v4;

  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", segment);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (NSInteger)selectedSegmentIndex
{
  return self->_selectedSegment;
}

uint64_t __62__UISegmentedControl__setSelectedSegmentIndex_notify_animate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWasSelected:", 0);
}

- (void)_emitValueChanged
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "useSelectionIndicatorStyling") & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__UISegmentedControl__emitValueChanged__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v6);
  }
  else
  {
    -[UISegmentedControl _sendValueChanged](self, "_sendValueChanged");
  }

}

uint64_t __39__UISegmentedControl__emitValueChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendValueChanged");
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)_sendValueChanged
{
  unint64_t selectedSegment;
  void *v4;
  void *v5;

  selectedSegment = self->_selectedSegment;
  if ((selectedSegment & 0x8000000000000000) == 0
    && selectedSegment < -[NSMutableArray count](self->_segments, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", self->_selectedSegment);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[UIControl sendAction:](self, "sendAction:", v5);

  }
  -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_animateContentChangeWithAnimations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 4, self, v7, v6, 1.06 / UIAnimationDragCoefficient(), 0.0);

}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v4;
  float v5;
  float v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 0.6);
  objc_msgSend(v4, "setStiffness:", 350.0);
  objc_msgSend(v4, "setDamping:", 23.0);
  objc_msgSend(v4, "setVelocity:", 0.0);
  v5 = UIAnimationDragCoefficient();
  objc_msgSend(v4, "speed");
  *(float *)&v7 = v6 / v5;
  objc_msgSend(v4, "setSpeed:", v7);
  return v4;
}

- (void)_setSelected:(BOOL)a3 highlighted:(BOOL)a4 forSegmentAtIndex:(int)a5 forceInfoDisplay:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v10;
  id v11;

  v6 = a6;
  v7 = a4;
  v8 = a3;
  v10 = a5;
  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectionIndicatorDragged:", (*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1);
  objc_msgSend(v11, "setSelected:highlighted:", v8, v7);
  -[UISegmentedControl _updateDividerImageForSegmentAtIndex:](self, "_updateDividerImageForSegmentAtIndex:", v10);
  if (v6)
    objc_msgSend(v11, "_forceInfoDisplay");

}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (id)viewForLastBaselineLayout
{
  void *v2;
  void *v3;
  objc_super v5;

  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x800) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISegmentedControl;
    -[UIView viewForLastBaselineLayout](&v5, sel_viewForLastBaselineLayout);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray lastObject](self->_segments, "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "viewForLastBaselineLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  width = a3.width;
  -[NSMutableArray lastObject](self->_segments, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UISegmentedControl alignmentRectInsets](self, "alignmentRectInsets");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "_baselineOffsetsAtSize:", width, height + v7 + v9);
    v12 = v11 - v8;
    v14 = v13 - v10;
  }
  else
  {
    v12 = 2.22507386e-308;
    v14 = 2.22507386e-308;
  }

  v15 = v12;
  v16 = v14;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  id appearanceStorage;
  _BOOL8 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;
  UIEdgeInsets result;

  appearanceStorage = self->_appearanceStorage;
  v4 = self->_barStyle == 2 && (*(_DWORD *)&self->_segmentedControlFlags & 3) == 1;
  objc_msgSend(appearanceStorage, "backgroundImageForState:isMini:withFallback:", 0, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "alignmentRectInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v15 = (void *)objc_opt_class();
    -[UIView traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v15, objc_msgSend(v16, "userInterfaceIdiom"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_barStyle > 2uLL)
    {
      v40.receiver = self;
      v40.super_class = (Class)UISegmentedControl;
      -[UIView alignmentRectInsets](&v40, sel_alignmentRectInsets);
      v8 = v32;
      v10 = v33;
      v12 = v34;
      v14 = v35;
    }
    else
    {
      v18 = -[UISegmentedControl controlSize](self, "controlSize");
      -[UISegmentedControl bounds](self, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[UIView traitCollection](self, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alignmentInsetsForControlSize:bounds:traitCollection:", v18, v27, v20, v22, v24, v26);
      v8 = v28;
      v10 = v29;
      v12 = v30;
      v14 = v31;

    }
  }

  v36 = v8;
  v37 = v10;
  v38 = v12;
  v39 = v14;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

+ (CATransform3D)_highlightSelectionTransformForTraitCollection:(SEL)a3
{
  CGFloat v5;
  CATransform3D *result;
  id v7;

  UISegmentedControlStyleProviderForIdiom(a2, objc_msgSend(a4, "userInterfaceIdiom"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "segmentSelectionScaleFactor");
  CATransform3DMakeScale(retstr, v5, v5, 1.0);

  return result;
}

+ (id)_selectionPopAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;

  v7 = (void *)MEMORY[0x1E0CD2848];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMass:", 1.0);
  objc_msgSend(v10, "setStiffness:", 503.551245);
  objc_msgSend(v10, "setDamping:", 44.8798951);
  objc_msgSend(v10, "setDuration:", 0.411544483);
  *(float *)&v11 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v10, "setSpeed:", v11);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v10, "setFromValue:", v9);

  objc_msgSend(v10, "setToValue:", v8);
  return v10;
}

+ (id)_selectionOpacityAnimationFromValue:(float)a3 toValue:(float)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMass:", 1.0);
  objc_msgSend(v6, "setStiffness:", 2741.55678);
  objc_msgSend(v6, "setDamping:", 209.43951);
  objc_msgSend(v6, "setDuration:", 0.176376207);
  *(float *)&v7 = 1.0 / UIAnimationDragCoefficient();
  objc_msgSend(v6, "setSpeed:", v7);
  if (a4 == 0.0)
    objc_msgSend(v6, "setBeginTime:", CACurrentMediaTime() + 0.1);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v9);

  *(float *)&v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v11);

  return v6;
}

+ (id)_highlightPinchAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CD2710];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDuration:", 0.5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimingFunction:", v11);

  objc_msgSend(v10, "setFromValue:", v9);
  objc_msgSend(v10, "setToValue:", v8);

  return v10;
}

+ (id)_selectionFadeAnimationForKey:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CD2848];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMass:", 0.2);
  objc_msgSend(v10, "setStiffness:", 100.0);
  objc_msgSend(v10, "setDamping:", 10.0);
  objc_msgSend(v10, "setDuration:", 0.5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimingFunction:", v11);

  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v10, "setFromValue:", v9);

  objc_msgSend(v10, "setToValue:", v8);
  return v10;
}

+ (double)_selectionOffsetAdjustmentForSegment:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;

  v4 = a3;
  if (!objc_msgSend(v4, "segmentPosition")
    || (v5 = 0.0, objc_msgSend(v4, "segmentPosition") == 2))
  {
    objc_msgSend(v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_sectionIndicatorOverflowForTraitCollection:size:", v6, objc_msgSend(v4, "controlSize"));
    v8 = v7 + v7;

    objc_msgSend(v4, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(v9, "userInterfaceIdiom"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "segmentSelectionScaleFactor");
    v12 = (1.0 - v11) * 0.5;
    objc_msgSend(v4, "frame");
    v14 = v12 * (v8 + v13);
    objc_msgSend(v4, "frame");
    v5 = v14 - v12 * (v8 + v15);
    v16 = objc_msgSend(v4, "segmentPosition");
    v17 = 0.0;
    if (!v16)
      v17 = -v5;
    if (v16 != 2)
      v5 = v17;

  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char isKindOfClass;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  void *v9;
  unint64_t selectedSegment;
  UIView *selectionIndicatorView;
  UIImageView *selectionImageView;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  segmentedControlFlags = self->_segmentedControlFlags;
  if ((isKindOfClass & 1) != 0)
  {
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFEFFFF);
    if (v4)
    {
      -[UISegmentedControl _updateSelectionIndicator](self, "_updateSelectionIndicator");
      if (self->_selectedSegment != -1)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_updateSelectionIndicator");
LABEL_13:

      }
    }
  }
  else
  {
    self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFDFFFF);
    -[UIControl pointerInteraction](self, "pointerInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    selectedSegment = self->_selectedSegment;
    if ((selectedSegment & 0x8000000000000000) == 0
      && selectedSegment < -[NSMutableArray count](self->_segments, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", self->_selectedSegment);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isAnimatingSelectionIndicator")
        && objc_msgSend(v15, "isHovered"))
      {
        -[UIView removeFromSuperview](self->_selectionIndicatorView, "removeFromSuperview");
        selectionIndicatorView = self->_selectionIndicatorView;
        self->_selectionIndicatorView = 0;

        selectionImageView = self->_selectionImageView;
        self->_selectionImageView = 0;

        -[UIView viewWithTag:](self, "viewWithTag:", -2030);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
          objc_msgSend(v13, "removeFromSuperview");

      }
      objc_msgSend(v15, "setAnimatingSelectionIndicator:", 0);
      goto LABEL_13;
    }
  }
}

uint64_t __84__UISegmentedControl__updateSelectionToSegment_highlight_shouldAnimate_sameSegment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_updateHighlightToPosition:(CGPoint)a3 bounds:(CGRect)a4 highlight:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  UIImageView *highlightImageView;
  UIImageView *v14;
  UIImageView *v15;
  UIImageView *v16;
  void *v17;
  UIImageView *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CATransform3D v35;
  CATransform3D v36;
  CATransform3D v37;
  _OWORD v38[8];
  CATransform3D v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v5 = a5;
  if (a5)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v11 = a3.y;
    v12 = a3.x;
    highlightImageView = self->_highlightImageView;
    if (!highlightImageView)
    {
      v14 = [UIImageView alloc];
      -[UIView frame](self->_selectionImageView, "frame");
      v15 = -[UIImageView initWithFrame:](v14, "initWithFrame:");
      v16 = self->_highlightImageView;
      self->_highlightImageView = v15;

      -[UIImageView image](self->_selectionImageView, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_highlightImageView, "setImage:", v17);

      -[UISegmentedControl _insertHighlightView](self, "_insertHighlightView");
      highlightImageView = self->_highlightImageView;
    }
    -[UIImageView setCenter:](highlightImageView, "setCenter:", v12, v11);
    -[UIImageView setBounds:](self->_highlightImageView, "setBounds:", x, y, width, height);
  }
  v18 = self->_highlightImageView;
  if (v18)
  {
    -[UIView layer](v18, "layer", a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "animationKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("HighlightScaleUp"));

    if ((v21 & 1) == 0)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      -[UIView layer](self->_highlightImageView, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "transform");
      }
      else
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
      }

      memset(&v39, 0, sizeof(v39));
      if (v5)
      {
        CATransform3DMakeScale(&v39, 0.98, 0.98, 1.0);
        v24 = CFSTR("HighlightScaleDown");
      }
      else
      {
        v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        *(_OWORD *)&v39.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        *(_OWORD *)&v39.m33 = v25;
        v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        *(_OWORD *)&v39.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        *(_OWORD *)&v39.m43 = v26;
        v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        *(_OWORD *)&v39.m11 = *MEMORY[0x1E0CD2610];
        *(_OWORD *)&v39.m13 = v27;
        v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        *(_OWORD *)&v39.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        *(_OWORD *)&v39.m23 = v28;
        v24 = CFSTR("HighlightScaleUp");
      }
      -[UIView layer](self->_highlightImageView, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_opt_class();
      v38[4] = v44;
      v38[5] = v45;
      v38[6] = v46;
      v38[7] = v47;
      v38[0] = v40;
      v38[1] = v41;
      v38[2] = v42;
      v38[3] = v43;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v38, "{CATransform3D=dddddddddddddddd}");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v39;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v37, "{CATransform3D=dddddddddddddddd}");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_highlightPinchAnimationForKey:fromValue:toValue:", CFSTR("transform"), v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addAnimation:forKey:", v33, v24);

      v36 = v39;
      -[UIView layer](self->_highlightImageView, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v36;
      objc_msgSend(v34, "setTransform:", &v35);

    }
  }
}

- (void)_insertHighlightView
{
  void *v3;
  void *v4;
  void *v5;
  UIVisualEffect *selectedSegmentVisualEffect;
  UIVisualEffect *v7;
  UIVisualEffect *v8;
  UIVisualEffect *v9;
  char v10;
  id *p_highlightIndicatorView;
  UIView *highlightIndicatorView;
  void *v13;
  UIVisualEffectView *v14;
  id v15;
  UISegmentedControl *v16;
  UIView *backdropView;
  UISegmentedControl *v18;
  UISegmentedControl *v19;
  id v20;

  v3 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v20, "highlightedSegmentDefaultVibrancyEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      selectedSegmentVisualEffect = self->_selectedSegmentVisualEffect;
      v7 = v5;
      v8 = selectedSegmentVisualEffect;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (!v8)
        {

LABEL_16:
          p_highlightIndicatorView = (id *)&self->_highlightIndicatorView;
          highlightIndicatorView = self->_highlightIndicatorView;
          if (highlightIndicatorView)
            goto LABEL_13;
          v14 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v7);
          v15 = *p_highlightIndicatorView;
          *p_highlightIndicatorView = v14;

          -[UISegmentedControl bounds](self, "bounds");
          objc_msgSend(*p_highlightIndicatorView, "setFrame:");
          objc_msgSend(*p_highlightIndicatorView, "setAutoresizingMask:", 18);
          v16 = self;
          backdropView = v16->_backdropView;
          if (backdropView)
          {
            if ((*((_BYTE *)&v16->_segmentedControlFlags + 3) & 4) != 0)
              -[UIView contentView](backdropView, "contentView");
            else
              -[UIView viewWithTag:](v16, "viewWithTag:", -2031);
            v18 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = v16;
          }
          v19 = v18;

          -[UIView addSubview:](v19, "addSubview:", *p_highlightIndicatorView);
LABEL_12:
          highlightIndicatorView = (UIView *)*p_highlightIndicatorView;
LABEL_13:
          -[UIView contentView](highlightIndicatorView, "contentView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addSubview:", self->_highlightImageView);

          goto LABEL_14;
        }
        v10 = -[UIVisualEffect isEqual:](v7, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_16;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_highlightIndicatorView = (id *)&self->_selectionIndicatorView;
    goto LABEL_12;
  }
LABEL_14:

}

void __36__UISegmentedControl_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && v3 != *(void **)(a1 + 32))
  {
    v4 = v3;
    objc_msgSend(v3, "setAssociatedLabel:");
    v3 = v4;
  }

}

- (BOOL)shouldTrack
{
  return (*(_BYTE *)&self->_segmentedControlFlags & 8) == 0;
}

- (void)_setHighlightedSegmentHighlighted:(BOOL)a3
{
  unint64_t highlightedSegment;
  _BOOL8 v5;
  void *v6;

  highlightedSegment = self->_highlightedSegment;
  if ((highlightedSegment & 0x8000000000000000) == 0)
  {
    v5 = a3;
    if (highlightedSegment < -[NSMutableArray count](self->_segments, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", self->_highlightedSegment);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelectionIndicatorDragged:", (*(_DWORD *)&self->_segmentedControlFlags >> 12) & 1);
      objc_msgSend(v6, "setHighlighted:", v5);
      -[UISegmentedControl _updateDividerImageForSegmentAtIndex:](self, "_updateDividerImageForSegmentAtIndex:", self->_highlightedSegment);

    }
  }
  -[UISegmentedControl _updateSelectionIndicator](self, "_updateSelectionIndicator", a3);
}

- (void)_highlightSegment:(int64_t)a3
{
  int64_t highlightedSegment;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;

  highlightedSegment = self->_highlightedSegment;
  if (highlightedSegment != a3)
  {
    if (highlightedSegment != -1)
      -[UISegmentedControl _setHighlightedSegmentHighlighted:](self, "_setHighlightedSegmentHighlighted:", 0);
    segmentedControlFlags = self->_segmentedControlFlags;
    if ((*(_BYTE *)&segmentedControlFlags & 0x10) != 0 && self->_highlightedSegment != -1)
      self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xF7FFFFFF | ((self->_selectedSegment != a3) << 27));
    self->_highlightedSegment = a3;
    if (a3 != -1)
      -[UISegmentedControl _setHighlightedSegmentHighlighted:](self, "_setHighlightedSegmentHighlighted:", 1);
    -[UISegmentedControl _updateSelectionIndicator](self, "_updateSelectionIndicator");
  }
}

- (void)_setHoverOnSegment:(int64_t)a3 hovered:(BOOL)a4
{
  _BOOL8 v6;
  void *v7;

  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = a4;
    if (-[NSMutableArray count](self->_segments, "count") > (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHovered:", v6);
      -[UISegmentedControl _updateDividerImageForSegmentAtIndex:](self, "_updateDividerImageForSegmentAtIndex:", a3);

    }
  }
  if (self->_selectedSegment == a3)
    -[UISegmentedControl _updateSelectionIndicator](self, "_updateSelectionIndicator");
}

- (void)hoverOffSegment:(int64_t)a3
{
  -[UISegmentedControl _setHoverOnSegment:hovered:](self, "_setHoverOnSegment:hovered:", a3, 0);
}

- (void)hoverOnSegment:(int64_t)a3
{
  -[UISegmentedControl _setHoverOnSegment:hovered:](self, "_setHoverOnSegment:hovered:", a3, 1);
}

- (id)_feedbackGenerator
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;

  if ((*((_BYTE *)&self->_segmentedControlFlags + 2) & 0x80) != 0)
  {
    objc_getAssociatedObject(self, sel__feedbackGenerator);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v4 = (void *)objc_opt_class();
      -[UIView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      UISegmentedControlStyleProviderForIdiom(v4, objc_msgSend(v5, "userInterfaceIdiom"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "feedbackGeneratorForSegmentedControl:", self);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(self, sel__feedbackGenerator, v2, (void *)1);

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGPoint v13;
  CGRect v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v7, objc_msgSend(v8, "userInterfaceIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mostlyInsideMargin");
  v11 = v10;
  -[UISegmentedControl bounds](self, "bounds");
  v15 = CGRectInset(v14, -v11, -v11);
  v13.x = x;
  v13.y = y;
  LOBYTE(self) = CGRectContainsPoint(v15, v13);

  return (char)self;
}

- (id)_segmentAtIndex:(int)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSMutableArray count](self->_segments, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)_closestSegmentIndexAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  uint64_t v7;
  int v8;
  float v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  float v16;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v6 = -[NSMutableArray count](self->_segments, "count");
  if (!v6)
    return -1;
  v7 = 0;
  v8 = -1;
  v9 = 1000000.0;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v18.x = x;
    v18.y = y;
    if (CGRectContainsPoint(v19, v18))
      break;
    objc_msgSend(v10, "frame");
    UIDistanceBetweenPointAndRect(x, y, v11, v12, v13, v14);
    v16 = v15;
    if (v9 > v16)
    {
      v9 = v16;
      v8 = v7;
    }

    if (v6 == ++v7)
      return v8;
  }

  return v7;
}

- (void)_tapSegmentAtPoint:(CGPoint)a3 touchDown:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  int v9;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  void *v11;
  void *v12;
  void *v13;
  int64_t highlightedSegment;
  void *v15;
  id v16;

  v4 = a4;
  v6 = -[UISegmentedControl _closestSegmentIndexAtPoint:](self, "_closestSegmentIndexAtPoint:", a3.x, a3.y);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isUserInteractionEnabled");

    segmentedControlFlags = self->_segmentedControlFlags;
    if (v9)
    {
      if ((*(_BYTE *)&segmentedControlFlags & 0x10) != 0)
      {
        v11 = (void *)objc_opt_class();
        -[UIView traitCollection](self, "traitCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        UISegmentedControlStyleProviderForIdiom(v11, objc_msgSend(v12, "userInterfaceIdiom"));
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "animateSlidingSelectionByDefault"))
        {
          if (!-[UISegmentedControl _disableSlidingControl](self, "_disableSlidingControl") && v4)
          {
            self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFEFFF | ((self->_selectedSegment == v7) << 12));
            if (self->_hoveredSegment != -1)
            {
              -[UIControl pointerInteraction](self, "pointerInteraction");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "invalidate");

              -[UISegmentedControl _setHoverOnSegment:hovered:](self, "_setHoverOnSegment:hovered:", self->_selectedSegment, 0);
            }
          }
        }
        highlightedSegment = self->_highlightedSegment;
        if (highlightedSegment == v7)
        {
          -[UISegmentedControl _setHighlightedSegmentHighlighted:](self, "_setHighlightedSegmentHighlighted:", 1);
        }
        else
        {
          if (self->_hoveredSegment == highlightedSegment)
          {
            -[UIControl pointerInteraction](self, "pointerInteraction");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "invalidate");

          }
          -[UISegmentedControl _highlightSegment:](self, "_highlightSegment:", v7);
        }

      }
      else
      {
        self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFFF);
        -[UISegmentedControl _setSelectedSegmentIndex:notify:animate:](self, "_setSelectedSegmentIndex:notify:animate:", v7, 1, 1);
        if ((*(_BYTE *)&self->_segmentedControlFlags & 8) != 0)
          -[UISegmentedControl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__clearSelectedSegment, 0, 0.2);
      }
    }
    else
    {
      self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFEF);
    }
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  int v21;
  void *v22;
  id v23;

  v23 = a4;
  v5 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "useTVStyleFocusSelection") & 1) == 0)
  {
    v8 = v23;
    if (objc_msgSend(v8, "_buttonMask"))
    {
      v9 = objc_msgSend(v8, "_buttonMask");

      if ((v9 & 1) == 0)
        goto LABEL_16;
    }
    else
    {

    }
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    objc_msgSend(v8, "_firstTouchForView:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", self);
    v12 = v11;
    v14 = v13;
    if (!objc_msgSend(v7, "limitInternalLayoutAndInteractionToDefaultHeight")
      || (v15 = -[UISegmentedControl controlSize](self, "controlSize"),
          -[UIView traitCollection](self, "traitCollection"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "defaultHeightForControlSize:traitCollection:", v15, v16),
          v18 = v17,
          v16,
          v14 <= v18))
    {
      v19 = -[UISegmentedControl shouldTrack](self, "shouldTrack");
      segmentedControlFlags = self->_segmentedControlFlags;
      if (v19)
        v21 = 16;
      else
        v21 = 0;
      self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFFFEF | v21);
      if ((*(_DWORD *)&segmentedControlFlags & 0x1000000) != 0)
      {
        objc_msgSend(v7, "setActiveSegmentControl:", self);
        objc_msgSend(v7, "touchesBegan");
        objc_msgSend(v7, "setActiveSegmentControl:", 0);
      }
      else
      {
        -[UISegmentedControl _feedbackGenerator](self, "_feedbackGenerator");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pressedDown");

      }
      *(_DWORD *)&self->_segmentedControlFlags &= ~0x8000000u;
      -[UISegmentedControl _tapSegmentAtPoint:touchDown:](self, "_tapSegmentAtPoint:touchDown:", 1, v12, v14);
    }

  }
LABEL_16:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a4;
  v5 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "useTVStyleFocusSelection") & 1) == 0 && (*(_BYTE *)&self->_segmentedControlFlags & 0x10) != 0)
  {
    objc_msgSend(v13, "_firstTouchForView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", self);
    v11 = v9;
    v12 = v10;
    if ((*((_BYTE *)&self->_segmentedControlFlags + 1) & 0x10) != 0
      || -[UISegmentedControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v13, v9, v10))
    {
      -[UISegmentedControl _tapSegmentAtPoint:touchDown:](self, "_tapSegmentAtPoint:touchDown:", 0, v11, v12);
    }
    else
    {
      -[UISegmentedControl _setHighlightedSegmentHighlighted:](self, "_setHighlightedSegmentHighlighted:", 0);
    }

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  void *v9;
  $05538722D7BB7C1D427C07F59A9C38BA v10;
  void *v11;
  id v12;

  v12 = a4;
  v5 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "useTVStyleFocusSelection") & 1) == 0)
  {
    segmentedControlFlags = self->_segmentedControlFlags;
    if ((*(_BYTE *)&segmentedControlFlags & 0x10) != 0)
    {
      self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFEF);
      objc_msgSend(v12, "_firstTouchForView:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", self);
      if ((*(_WORD *)&segmentedControlFlags & 0x1000) != 0
        || -[UISegmentedControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v12))
      {
        -[UISegmentedControl _setSelectedSegmentIndex:notify:animate:](self, "_setSelectedSegmentIndex:notify:animate:", self->_highlightedSegment, 1, 1);
      }
      v10 = self->_segmentedControlFlags;
      if ((*(_DWORD *)&v10 & 0x1000000) != 0)
      {
        objc_msgSend(v7, "setActiveSegmentControl:", self);
        objc_msgSend(v7, "touchesEnded");
        objc_msgSend(v7, "setActiveSegmentControl:", 0);
      }
      else if ((*(_DWORD *)&v10 & 0x8000000) != 0)
      {
        -[UISegmentedControl _feedbackGenerator](self, "_feedbackGenerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pressedUp");

        *(_DWORD *)&self->_segmentedControlFlags &= ~0x8000000u;
      }
      -[UISegmentedControl _highlightSegment:](self, "_highlightSegment:", -1);

    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  $05538722D7BB7C1D427C07F59A9C38BA segmentedControlFlags;
  id v8;

  v5 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v5, objc_msgSend(v6, "userInterfaceIdiom"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "useTVStyleFocusSelection") & 1) == 0)
  {
    segmentedControlFlags = self->_segmentedControlFlags;
    if ((*(_BYTE *)&segmentedControlFlags & 0x10) != 0)
    {
      self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&segmentedControlFlags & 0xFFFFEFEF);
      -[UISegmentedControl _highlightSegment:](self, "_highlightSegment:", -1);
    }
  }

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UISegmentedControl _shouldConsumeEventWithPresses:](self, "_shouldConsumeEventWithPresses:", v6))
  {
    -[UISegment _setHighlighted:animated:](self->_focusedSegment, "_setHighlighted:animated:", 1, 1);
    -[UISegmentedControl _selectFocusedSegment](self, "_selectFocusedSegment");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    -[UIResponder pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[UISegmentedControl _shouldConsumeEventWithPresses:](self, "_shouldConsumeEventWithPresses:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    -[UIResponder pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UISegmentedControl _shouldConsumeEventWithPresses:](self, "_shouldConsumeEventWithPresses:", v6))
  {
    -[UISegment _setHighlighted:animated:](self->_focusedSegment, "_setHighlighted:animated:", 0, 1);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    -[UIResponder pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UISegmentedControl _shouldConsumeEventWithPresses:](self, "_shouldConsumeEventWithPresses:", v6))
  {
    -[UISegmentedControl setSelectedSegment:](self, "setSelectedSegment:", -[NSMutableArray indexOfObject:](self->_segments, "indexOfObject:", self->_focusedSegment));
    -[UISegment _setHighlighted:animated:](self->_focusedSegment, "_setHighlighted:animated:", 0, 1);
    if ((*(_BYTE *)&self->_segmentedControlFlags & 8) != 0)
      -[UISegmentedControl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__clearSelectedSegment, 0, 0.2);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISegmentedControl;
    -[UIResponder pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (BOOL)_shouldConsumeEventWithPresses:(id)a3
{
  int v4;

  v4 = _UIPressesContainsPressType(a3, 4);
  if (v4)
    LOBYTE(v4) = -[UIView isEnabled](self->_focusedSegment, "isEnabled");
  return v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  double x;
  double y;
  double width;
  double height;
  _UISegmentedControlSegmentHoverIdentifier *v20;
  CGRect v22;
  CGRect v23;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v9, objc_msgSend(v10, "userInterfaceIdiom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "useSelectionIndicatorStyling"))
    goto LABEL_8;
  if ((*(_DWORD *)&self->_segmentedControlFlags & 0x21000) == 0)
  {
    objc_msgSend(v7, "location");
    v13 = -[UISegmentedControl _closestSegmentIndexAtPoint:](self, "_closestSegmentIndexAtPoint:");
    if ((v13 & 0x80000000) == 0)
    {
      v14 = v13;
      -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isUserInteractionEnabled"))
      {
        objc_msgSend(v15, "frame");
        v23 = CGRectInset(v22, -1.0, 0.0);
        x = v23.origin.x;
        y = v23.origin.y;
        width = v23.size.width;
        height = v23.size.height;
        v20 = -[_UISegmentedControlSegmentHoverIdentifier initWithIndex:selected:]([_UISegmentedControlSegmentHoverIdentifier alloc], "initWithIndex:selected:", v14, self->_selectedSegment == v14);
        +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v20, x, y, width, height);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }

    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v12 = v8;
LABEL_9:

  return v12;
}

- (id)_pointerEffectWithPreview:(void *)a3 forSegment:(uint64_t)a4 selected:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  if (a1)
  {
    v8 = a2;
    v9 = (void *)objc_opt_class();
    objc_msgSend(a1, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UISegmentedControlStyleProviderForIdiom(v9, objc_msgSend(v10, "userInterfaceIdiom"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (void *)objc_msgSend(v11, "pointerEffectClassForSegment:selected:", v7, a4);
    else
      v12 = (void *)objc_opt_class();
    objc_msgSend(v12, "effectWithPreview:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  UITargetedPreview *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UIPreviewTarget *v42;
  void *v43;
  UITargetedPreview *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  int v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "index");
    if (v9 < 0)
    {
      v54 = 0;
    }
    else
    {
      v10 = v9;
      -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_class();
      -[UIView traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cornerRadiusForTraitCollection:size:", v13, -[UISegmentedControl controlSize](self, "controlSize"));
      v15 = v14;

      v16 = (void *)objc_opt_class();
      -[UIView traitCollection](self, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_sectionIndicatorInsetForTraitCollection:size:", v17, -[UISegmentedControl controlSize](self, "controlSize"));
      v19 = v18;

      objc_msgSend(v11, "bounds");
      x = v20;
      y = v21;
      width = v22;
      height = v23;
      if ((*((_BYTE *)&self->_segmentedControlFlags + 1) & 0x20) != 0)
      {
        v73 = CGRectInset(*(CGRect *)&v20, self->_innerSegmentSpacing * -0.5, 0.0);
        x = v73.origin.x;
        y = v73.origin.y;
        width = v73.size.width;
        height = v73.size.height;
      }
      v28 = v15 - v19;
      if (v10 == self->_selectedSegment)
      {
        v74.origin.x = x;
        v74.origin.y = y;
        v74.size.width = width;
        v74.size.height = height;
        v75 = CGRectInset(v74, v19, v19);
        v29 = v75.origin.x;
        v30 = v75.origin.y;
        v31 = v75.size.width;
        v32 = v75.size.height;
        -[UIView superview](self, "superview");
        v33 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
        if (-[UITargetedPreview clipsToBounds](v33, "clipsToBounds"))
        {
          -[UITargetedPreview superview](v33, "superview");
          v34 = objc_claimAutoreleasedReturnValue();

          v33 = (UITargetedPreview *)v34;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UITargetedPreview superview](v33, "superview");
          v35 = objc_claimAutoreleasedReturnValue();

          v33 = (UITargetedPreview *)v35;
        }
        objc_msgSend(v11, "frame");
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v33, v37 + v36 * 0.5, v39 + v38 * 0.5);
        v42 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v33, v40, v41);
        v43 = (void *)objc_opt_new();
        v44 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", v11, v43, v42);
        -[UISegmentedControl _pointerEffectWithPreview:forSegment:selected:](self, v44, v11, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "convertRect:toView:", v33, v29, v30, v31, v32);
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v53 = v52;

      }
      else
      {
        v55 = (void *)objc_opt_class();
        -[UIView traitCollection](self, "traitCollection");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "_dividerWidthForTraitCollection:size:", v56, -[UISegmentedControl controlSize](self, "controlSize"));
        v58 = v57;

        v59 = objc_msgSend(v11, "segmentPosition");
        if (v59 == 3)
        {
          v62 = v19;
        }
        else
        {
          v60 = v19 - v58;
          if (v59 == 2)
          {
            x = x - v58;
            width = width - v60;
            v62 = 0.0;
          }
          else
          {
            v61 = width - v60;
            if (v59)
            {
              v62 = -v58;
            }
            else
            {
              x = v19 + x;
              width = v61;
              v62 = 0.0;
            }
          }
        }
        v76.origin.x = x;
        v76.origin.y = y;
        v76.size.width = width;
        v76.size.height = height;
        v77 = CGRectInset(v76, v62, v19);
        v63 = v77.origin.x;
        v64 = v77.origin.y;
        v65 = v77.size.width;
        v66 = v77.size.height;
        v33 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v11);
        -[UISegmentedControl _pointerEffectWithPreview:forSegment:selected:](self, v33, v11, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "convertRect:toView:", self, v63, v64, v65, v66);
        v47 = v67;
        v49 = v68;
        v51 = v69;
        v53 = v70;
      }

      +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v47, v49, v51, v53, v28);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v45, v71);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[UIPointerStyle hiddenPointerStyle](UIPointerStyle, "hiddenPointerStyle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v54;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  int64_t v18;
  _QWORD v19[6];
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke;
  v23[3] = &unk_1E16B1B28;
  v23[4] = self;
  objc_msgSend(v8, "addAnimations:", v23);
  if (!-[UISegmentedControl transparentBackground](self, "transparentBackground"))
  {
    -[UISegmentedControl _selectedSegmentVibrancyEffect](self, "_selectedSegmentVibrancyEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      v11 = (void *)objc_opt_class();
      -[UISegmentedControl selectedSegmentTintColor](self, "selectedSegmentTintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "_useShadowForSelectedTintColor:traitCollection:", v12, v13);

      if ((_DWORD)v11)
      {
        if (self->_selectedSegment != -1)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
          v21[0] = v9;
          v21[1] = 3221225472;
          v21[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_2;
          v21[3] = &unk_1E16B1B28;
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v14 = v22;
          objc_msgSend(v8, "addAnimations:", v21);

        }
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_3;
        v20[3] = &unk_1E16B1B28;
        v20[4] = self;
        objc_msgSend(v8, "addAnimations:", v20);
      }
    }
  }
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "index");
    self->_hoveredSegment = v18;
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_4;
    v19[3] = &unk_1E16B1888;
    v19[4] = self;
    v19[5] = v18;
    objc_msgSend(v8, "addAnimations:", v19);

  }
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 616) |= 0x8000u;
  return result;
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateDynamicShadow:animated:", 1, 1);
  return objc_msgSend(*(id *)(a1 + 32), "_updateSelectionIndicator");
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDynamicShadow:animated:", 1, 1);
}

uint64_t __66__UISegmentedControl_pointerInteraction_willEnterRegion_animator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hoverOnSegment:", *(_QWORD *)(a1 + 40));
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[5];
  void (**v19)(_QWORD);
  uint64_t v20;
  _QWORD v21[5];
  _QWORD aBlock[5];
  id v23;
  _QWORD v24[5];

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke;
  v24[3] = &unk_1E16B1B28;
  v24[4] = self;
  objc_msgSend(v8, "addAnimations:", v24);
  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_2;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v10 = v8;
  v23 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "index");
    v16 = v15;
    if (self->_hoveredSegment == v15)
      self->_hoveredSegment = -1;
    if (v15 == self->_selectedSegment)
    {
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_5;
      v21[3] = &unk_1E16B1B28;
      v21[4] = self;
      objc_msgSend(v10, "addAnimations:", v21);
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_6;
      v18[3] = &unk_1E16C31E8;
      v18[4] = self;
      v20 = v16;
      v19 = v11;
      objc_msgSend(v10, "addCompletion:", v18);

    }
    else
    {
      if ((*((_BYTE *)&self->_segmentedControlFlags + 2) & 4) == 0)
        v11[2](v11);
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_7;
      v17[3] = &unk_1E16B1888;
      v17[4] = self;
      v17[5] = v16;
      objc_msgSend(v10, "addAnimations:", v17);
    }

  }
  else
  {
    v11[2](v11);
  }

}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 616) &= ~0x8000u;
  return result;
}

void __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  if ((objc_msgSend(*(id *)(a1 + 32), "transparentBackground") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_selectedSegmentVibrancyEffect");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {

    }
    else
    {
      v3 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "selectedSegmentTintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v3) = objc_msgSend(v3, "_useShadowForSelectedTintColor:traitCollection:", v4, v5);

      if ((_DWORD)v3)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = MEMORY[0x1E0C809B0];
        if (*(_QWORD *)(v6 + 512) != -1)
        {
          objc_msgSend(*(id *)(v6 + 504), "objectAtIndexedSubscript:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = *(void **)(a1 + 40);
          v13[0] = v7;
          v13[1] = 3221225472;
          v13[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_3;
          v13[3] = &unk_1E16B1B28;
          v14 = v8;
          v10 = v8;
          objc_msgSend(v9, "addAnimations:", v13);

          v6 = *(_QWORD *)(a1 + 32);
        }
        v11 = *(void **)(a1 + 40);
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_4;
        v12[3] = &unk_1E16B1B28;
        v12[4] = v6;
        objc_msgSend(v11, "addAnimations:", v12);
      }
    }
  }
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateDynamicShadow:animated:", 0, 1);
  return objc_msgSend(*(id *)(a1 + 32), "_updateSelectionIndicator");
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDynamicShadow:animated:", 0, 1);
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_5(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 616) |= 0x40000u;
  return result;
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_6(_QWORD *a1, int a2)
{
  uint64_t result;

  *(_DWORD *)(a1[4] + 616) &= ~0x40000u;
  result = a1[4];
  if (a2 && *(_QWORD *)(result + 536) != a1[6])
  {
    objc_msgSend((id)result, "hoverOffSegment:");
    result = a1[4];
  }
  if ((*(_BYTE *)(result + 617) & 0x80) == 0)
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  return result;
}

uint64_t __65__UISegmentedControl_pointerInteraction_willExitRegion_animator___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hoverOffSegment:", *(_QWORD *)(a1 + 40));
}

- (BOOL)useBlockyMagnificationInClassic
{
  return 0;
}

- (void)_setEnabled:(BOOL)a3 forcePropagateToSegments:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  _BOOL4 v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  double enabledAlpha;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = -[UIControl isEnabled](self, "isEnabled");
  v8 = v7;
  if (!v5 && v7)
  {
    -[UIView alpha](self, "alpha");
    self->_enabledAlpha = v9;
  }
  v26.receiver = self;
  v26.super_class = (Class)UISegmentedControl;
  -[UIControl setEnabled:](&v26, sel_setEnabled_, v5);
  v10 = v8 ^ v5;
  if (v8 != v5 || v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_segments;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (v5)
            v17 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "isEnabled", (_QWORD)v22);
          else
            v17 = 1;
          objc_msgSend(v16, "_setEnabledAppearance:", v17, (_QWORD)v22);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v13);
    }

    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShouldRasterize:", v5 ^ 1);

  }
  if (v10)
  {
    if (v5)
    {
      enabledAlpha = self->_enabledAlpha;
    }
    else
    {
      -[UIView alpha](self, "alpha");
      v21 = v20;
      enabledAlpha = 0.5;
      if (v21 <= 0.5)
        return;
    }
    -[UISegmentedControl setAlpha:](self, "setAlpha:", enabledAlpha, (_QWORD)v22);
  }
}

- (void)setEnabled:(BOOL)a3
{
  -[UISegmentedControl _setEnabled:forcePropagateToSegments:](self, "_setEnabled:forcePropagateToSegments:", a3, 0);
}

- (BOOL)_alwaysEmitValueChanged
{
  return (*(_BYTE *)&self->_segmentedControlFlags >> 2) & 1;
}

- (id)_selectedSegmentVibrancyEffect
{
  if ((*((_BYTE *)&self->_segmentedControlFlags + 2) & 0x20) != 0)
    return self->_selectedSegmentVisualEffect;
  else
    return 0;
}

- (id)__selectedSegmentVisualEffect
{
  return self->_selectedSegmentVisualEffect;
}

- (void)_setBackgroundTintColor:(id)a3
{
  id v5;
  UIColor *v6;
  UIColor *v7;
  BOOL v8;
  UIColor *v9;

  v5 = a3;
  v6 = self->_backgroundTintColor;
  v7 = (UIColor *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIColor isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_backgroundTintColor, a3);
    -[UISegmentedControl _setNeedsBackgroundAndContentViewUpdate](self, "_setNeedsBackgroundAndContentViewUpdate");
  }
LABEL_9:

}

- (double)_interSegmentSpacing
{
  return self->_innerSegmentSpacing;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  UISegmentedControl *v5;
  uint64_t v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
  if (v5 != self
    && objc_msgSend(v4, "_isGestureType:", 0)
    && objc_msgSend(v4, "numberOfTouchesRequired") == 1)
  {
    v6 = objc_msgSend(v4, "numberOfTapsRequired");

    if (v6 == 1)
      goto LABEL_15;
  }
  else
  {

  }
  if (!objc_msgSend(v4, "_isGestureType:", 8)
    || (unint64_t)objc_msgSend(v4, "minimumNumberOfTouches") > 1)
  {
    goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_segmentedControlFlags & 0x10) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_14;
  }
  if (-[UISegmentedControl shouldTrack](self, "shouldTrack")
    && (objc_msgSend(v4, "locationInView:", self), -[UIView pointInside:withEvent:](self, "pointInside:withEvent:", 0)))
  {
    objc_msgSend(v4, "translationInView:", self);
    v9 = fabs(v7) <= fabs(v8);
  }
  else
  {
LABEL_13:
    v9 = 1;
  }
LABEL_14:

  return v9;
}

- (void)_axLongPressHandler:(id)a3
{
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  UIAccessibilityLargeTextSegmentedViewController *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    -[UISegmentedControl axLongPressGestureRecognizer](self, "axLongPressGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isEqual:", v6);

    if (v7)
    {
      -[UISegmentedControl axLongPressGestureRecognizer](self, "axLongPressGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "state");

      if (v9 == 1)
      {
        v10 = -[UIAccessibilityLargeTextSegmentedViewController initWithSegmentedControl:segments:delegate:]([UIAccessibilityLargeTextSegmentedViewController alloc], "initWithSegmentedControl:segments:delegate:", self, self->_segments, self);
        -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

      }
    }
  }

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  objc_super v8;

  v3 = (void *)objc_opt_class();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UISegmentedControlStyleProviderForIdiom(v3, objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)UISegmentedControl;
  if (-[UIControl canBecomeFocused](&v8, sel_canBecomeFocused)
    && -[UISegmentedControl _hasEnabledSegment](self, "_hasEnabledSegment"))
  {
    if (objc_msgSend(v5, "useTVStyleFocusSelection"))
      v6 = !-[UIView isFocused](self, "isFocused");
    else
      LOBYTE(v6) = 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_viewToAddFocusLayer
{
  UISegment *v4;
  UISegment *v5;
  UISegment *v6;
  UISegment *focusedSegment;

  if (!self->_focusedSegment)
  {
    if (self->_selectedSegment < 0
      || (-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:"),
          v4 = (UISegment *)objc_claimAutoreleasedReturnValue(),
          v5 = self->_focusedSegment,
          self->_focusedSegment = v4,
          v5,
          !self->_focusedSegment))
    {
      if (-[NSMutableArray count](self->_segments, "count"))
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", 0);
        v6 = (UISegment *)objc_claimAutoreleasedReturnValue();
        focusedSegment = self->_focusedSegment;
        self->_focusedSegment = v6;

      }
    }
  }
  return self->_focusedSegment;
}

- (id)_defaultFocusEffect
{
  return 0;
}

- (void)_diagnoseFocusabilityForReport:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[UISegmentedControl _hasEnabledSegment](self, "_hasEnabledSegment"))
  {
    +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("This segmented control does not have any enabled segments. Segmented controls must have at least one enabled segment in order to be focusable."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addIssue:", v4);

  }
}

- (BOOL)_hasEnabledSegment
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_segments;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isEnabled", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_selectFocusedSegment
{
  UISegment *v3;
  UISegment *v4;
  BOOL v5;
  uint64_t v6;
  UISegment *v7;

  v3 = self->_focusedSegment;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    v5 = -[UISegment isSelected](v3, "isSelected");
    v4 = v7;
    if (!v5)
    {
      -[UISegmentedControl _cancelDelayedFocusAction](self, "_cancelDelayedFocusAction");
      v6 = -[NSMutableArray indexOfObject:](self->_segments, "indexOfObject:", v7);
      v4 = v7;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[UISegmentedControl _setSelectedSegmentIndex:notify:animate:](self, "_setSelectedSegmentIndex:notify:animate:", v6, 1, 1);
        v4 = v7;
      }
    }
  }

}

+ (BOOL)_selectFocusedSegmentAfterFocusUpdateForTraitCollection:(id)a3
{
  void *v3;
  char v4;

  UISegmentedControlStyleProviderForIdiom(a1, objc_msgSend(a3, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useTVStyleFocusSelection");

  return v4;
}

- (void)_sendDelayedFocusActionIfNecessary
{
  void *v3;
  _BOOL4 v4;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[UISegmentedControl _selectFocusedSegmentAfterFocusUpdateForTraitCollection:](UISegmentedControl, "_selectFocusedSegmentAfterFocusUpdateForTraitCollection:", v3);

  if (v4)
  {
    -[UISegmentedControl _cancelDelayedFocusAction](self, "_cancelDelayedFocusAction");
    -[UISegmentedControl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__selectFocusedSegment, 0, 0.31);
  }
}

- (void)_cancelDelayedFocusAction
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__selectFocusedSegment, 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISegmentedControl;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v6, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  -[UISegmentedControl _internalFocusSystem](self, "_internalFocusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setEnabled:", -[UIView isFocused](self, "isFocused"));
  objc_msgSend(v5, "setNeedsFocusUpdate");

}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISegmentedControl;
  -[UIView focusItemsInRect:](&v8, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__UISegmentedControl_focusItemsInRect___block_invoke;
  v7[3] = &unk_1E16C3210;
  v7[4] = self;
  objc_msgSend(v4, "bs_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__UISegmentedControl_focusItemsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "containsObject:", a2) ^ 1;
}

- (BOOL)_focusSystem:(id)a3 containsChildOfHostEnvironment:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_preferredFocusEnvironmentsForFocusSystem:(id)a3
{
  int64_t selectedSegment;
  NSMutableArray *segments;
  void *v6;
  NSMutableArray *v7;

  selectedSegment = self->_selectedSegment;
  segments = self->_segments;
  if (selectedSegment < 0)
  {
    v7 = segments;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](segments, "objectAtIndexedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_segments, "mutableCopy");
    -[NSMutableArray removeObject:](v7, "removeObject:", v6);
    -[NSMutableArray insertObject:atIndex:](v7, "insertObject:atIndex:", v6, 0);

  }
  return v7;
}

- (id)_focusSystem:(id)a3 focusItemsInRect:(CGRect)a4
{
  return self->_segments;
}

- (void)_focusSystem:(id)a3 didFinishUpdatingFocusInContext:(id)a4
{
  UISegment *v5;
  UISegment *focusedSegment;

  objc_msgSend(a4, "nextFocusedItem", a3);
  v5 = (UISegment *)objc_claimAutoreleasedReturnValue();
  focusedSegment = self->_focusedSegment;
  self->_focusedSegment = v5;

  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UISegmentedControl _sendDelayedFocusActionIfNecessary](self, "_sendDelayedFocusActionIfNecessary");
}

- (void)_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v8;
  id appearanceStorage;
  _UISegmentedControlAppearanceStorage *v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  appearanceStorage = self->_appearanceStorage;
  v13 = v8;
  if (v8)
  {
    if (!appearanceStorage)
    {
      v10 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      v11 = self->_appearanceStorage;
      self->_appearanceStorage = v10;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  objc_msgSend(appearanceStorage, "backgroundImageForState:isMini:", a4, a5 == 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v12 != v13)
  {
    objc_msgSend(self->_appearanceStorage, "setBackgroundImage:forState:isMini:", v13, a4, a5 == 1);
    -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
    v8 = v13;
  }
LABEL_7:

}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  UIImage *v8;
  UIImage *v9;

  v8 = backgroundImage;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    v9 = v8;
    -[UISegmentedControl _setBackgroundImage:forState:barMetrics:](self, "_setBackgroundImage:forState:barMetrics:", v8, state, barMetrics);
    goto LABEL_5;
  }
  if ((setBackgroundImage_forState_barMetrics__didWarn & 1) == 0)
  {
    setBackgroundImage_forState_barMetrics__didWarn = 1;
    v9 = v8;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UISegmentedControl", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
LABEL_5:
    v8 = v9;
  }

}

- (UIImage)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    objc_msgSend(self->_appearanceStorage, "backgroundImageForState:isMini:", state, barMetrics == UIBarMetricsCompact);
    return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((backgroundImageForState_barMetrics__didWarn & 1) == 0)
    {
      backgroundImageForState_barMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, state, "UISegmentedControl", CFSTR("background image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return (UIImage *)0;
  }
}

- (void)_setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 barMetrics:(int64_t)a6
{
  id v10;
  id appearanceStorage;
  _UISegmentedControlAppearanceStorage *v12;
  id v13;
  id v14;
  id v15;

  v10 = a3;
  appearanceStorage = self->_appearanceStorage;
  v15 = v10;
  if (v10)
  {
    if (!appearanceStorage)
    {
      v12 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      v13 = self->_appearanceStorage;
      self->_appearanceStorage = v12;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  objc_msgSend(appearanceStorage, "dividerImageForLeftSegmentState:rightSegmentState:isMini:", a4, a5, a6 == 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  if (v14 != v15)
  {
    objc_msgSend(self->_appearanceStorage, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", v15, a4, a5, a6 == 1);
    -[UISegmentedControl _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
    v10 = v15;
  }
LABEL_7:

}

- (void)setDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics
{
  UIImage *v10;
  UIImage *v11;

  v10 = dividerImage;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    v11 = v10;
    -[UISegmentedControl _setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:](self, "_setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", v10, leftState, rightState, barMetrics);
    goto LABEL_5;
  }
  if ((setDividerImage_forLeftSegmentState_rightSegmentState_barMetrics__didWarn & 1) == 0)
  {
    setDividerImage_forLeftSegmentState_rightSegmentState_barMetrics__didWarn = 1;
    v11 = v10;
    NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), "UISegmentedControl", CFSTR("divider image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
LABEL_5:
    v10 = v11;
  }

}

- (UIImage)dividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    objc_msgSend(self->_appearanceStorage, "dividerImageForLeftSegmentState:rightSegmentState:isMini:", leftState, rightState, barMetrics == UIBarMetricsCompact);
    return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((dividerImageForLeftSegmentState_rightSegmentState_barMetrics__didWarn & 1) == 0)
    {
      dividerImageForLeftSegmentState_rightSegmentState_barMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, leftState, rightState, "UISegmentedControl", CFSTR("divider image"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return (UIImage *)0;
  }
}

- (NSDictionary)titleTextAttributesForState:(UIControlState)state
{
  return (NSDictionary *)objc_msgSend(self->_appearanceStorage, "textAttributesForState:", state);
}

- (void)_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  id appearanceStorage;
  _UISegmentedControlAppearanceStorage *v9;
  id v10;
  double v11;
  id v12;

  appearanceStorage = self->_appearanceStorage;
  if (a3 != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      v9 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
      v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

      appearanceStorage = self->_appearanceStorage;
    }
    objc_msgSend(appearanceStorage, "backgroundPositionAdjustmentForBarMetrics:", a4);
    if (v11 != a3)
    {
      objc_msgSend(self->_appearanceStorage, "setBackgroundPositionAdjustment:forBarMetrics:", a4, a3);
      -[UIView superview](self, "superview");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsLayout");

    }
  }
}

- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  double result;

  objc_msgSend(self->_appearanceStorage, "backgroundPositionAdjustmentForBarMetrics:", a3);
  return result;
}

- (void)setContentPositionAdjustment:(UIOffset)adjustment forSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics
{
  double vertical;
  double horizontal;
  id appearanceStorage;
  _UISegmentedControlAppearanceStorage *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(barMetrics - 101) <= 1)
  {
    if ((setContentPositionAdjustment_forSegmentType_barMetrics__didWarn & 1) == 0)
    {
      setContentPositionAdjustment_forSegmentType_barMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, leftCenterRightOrAlone, adjustment.horizontal, adjustment.vertical, "UISegmentedControl", CFSTR("segment content position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return;
  }
  vertical = adjustment.vertical;
  horizontal = adjustment.horizontal;
  appearanceStorage = self->_appearanceStorage;
  if (appearanceStorage)
    goto LABEL_8;
  if (adjustment.horizontal != 0.0 || adjustment.vertical != 0.0)
  {
    v11 = objc_alloc_init(_UISegmentedControlAppearanceStorage);
    v12 = self->_appearanceStorage;
    self->_appearanceStorage = v11;

    appearanceStorage = self->_appearanceStorage;
LABEL_8:
    objc_msgSend(appearanceStorage, "contentPositionOffsetForSegment:inMiniBar:noFallback:", leftCenterRightOrAlone, barMetrics == UIBarMetricsCompact, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "UIOffsetValue");
    }
    else
    {
      v15 = 0.0;
      v16 = 0.0;
    }
    if (horizontal == v15 && vertical == v16)
    {
LABEL_29:

      return;
    }
    v26 = v14;
    v18 = self->_appearanceStorage;
    *(double *)v31 = horizontal;
    *(double *)&v31[1] = vertical;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v31, "{UIOffset=dd}");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentPositionOffset:forSegment:inMiniBar:", v19, leftCenterRightOrAlone, barMetrics == UIBarMetricsCompact);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = self->_segments;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (!v21)
      goto LABEL_28;
    v22 = v21;
    v23 = *(_QWORD *)v28;
LABEL_17:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v23)
        objc_enumerationMutation(v20);
      v25 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v24);
      if (*(_QWORD *)(v25 + 552))
      {
        if (leftCenterRightOrAlone == UISegmentedControlSegmentAny)
          goto LABEL_25;
      }
      else
      {
        objc_storeStrong((id *)(v25 + 552), self->_appearanceStorage);
        if (leftCenterRightOrAlone == UISegmentedControlSegmentAny)
          goto LABEL_25;
      }
      if ((((unint64_t)*(unsigned int *)(v25 + 632) >> 6) & 7) + 1 == leftCenterRightOrAlone)
      {
LABEL_25:
        objc_msgSend((id)v25, "_positionInfoWithoutAnimation");
        objc_msgSend((id)v25, "_invalidateInfoConstraints");
      }
      if (v22 == ++v24)
      {
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (!v22)
        {
LABEL_28:

          v14 = v26;
          goto LABEL_29;
        }
        goto LABEL_17;
      }
    }
  }
}

- (UIOffset)contentPositionAdjustmentForSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIOffset result;

  if ((unint64_t)(barMetrics - 101) > 1)
  {
    objc_msgSend(self->_appearanceStorage, "contentPositionOffsetForSegment:inMiniBar:", leftCenterRightOrAlone, barMetrics == UIBarMetricsCompact);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "UIOffsetValue");
      v4 = v8;
      v5 = v9;
    }
    else
    {
      v4 = 0.0;
      v5 = 0.0;
    }

  }
  else
  {
    v4 = 0.0;
    if ((contentPositionAdjustmentForSegmentType_barMetrics__didWarn & 1) == 0)
    {
      contentPositionAdjustmentForSegmentType_barMetrics__didWarn = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, leftCenterRightOrAlone, "UISegmentedControl", CFSTR("segment content position adjustment"), "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    v5 = 0.0;
  }
  v10 = v4;
  v11 = v5;
  result.vertical = v11;
  result.horizontal = v10;
  return result;
}

- (id)_badgeValueForSegmentAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setBadgeValue:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  NSMutableArray *segments;
  id v7;
  id v8;

  segments = self->_segments;
  v7 = a3;
  -[NSMutableArray objectAtIndex:](segments, "objectAtIndex:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBadgeValue:", v7);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_createInfoViewForSegmentAtIndex:(unint64_t)a3 item:(id)a4
{
  return 0;
}

uint64_t __55__UISegmentedControl__insertSegment_withInfo_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "animateAdd:", 0);
}

- (void)_clearSelectedSegment
{
  if ((*(_BYTE *)&self->_segmentedControlFlags & 8) != 0)
    -[UISegmentedControl selectSegment:](self, "selectSegment:", 0xFFFFFFFFLL);
}

- (id)_uiktest_labelsWithState:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_segments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "_segmentState", (_QWORD)v15) == a3)
        {
          objc_msgSend(v11, "_segmentLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_uiktest_segmentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3);
}

- (void)setSpringLoaded:(BOOL)a3
{
  -[UIView _setSpringLoaded:interactionInitializer:](self, a3, &__block_literal_global_692);
}

UISpringLoadedInteraction *__38__UISegmentedControl_setSpringLoaded___block_invoke()
{
  UISpringLoadedInteraction *v0;
  void *v1;
  void *v2;
  UISpringLoadedInteraction *v3;

  v0 = [UISpringLoadedInteraction alloc];
  v1 = (void *)objc_opt_new();
  v2 = (void *)objc_opt_new();
  v3 = -[UISpringLoadedInteraction initWithInteractionBehavior:interactionEffect:activationHandler:](v0, "initWithInteractionBehavior:interactionEffect:activationHandler:", v1, v2, &__block_literal_global_697_0);

  return v3;
}

void __38__UISegmentedControl_setSpringLoaded___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(a2, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v9);
  v6 = v5;
  v8 = v7;

  objc_msgSend(v9, "_tapSegmentAtPoint:touchDown:", 0, v6, v8);
}

- (UIView)removedSegment
{
  return self->_removedSegment;
}

- (void)setRemovedSegment:(id)a3
{
  objc_storeStrong((id *)&self->_removedSegment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_internalFocusSystem, 0);
  objc_storeStrong((id *)&self->_selectedSegmentVisualEffect, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_selectedSegmentTintColor, 0);
  objc_storeStrong(&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_focusedSegment, 0);
  objc_storeStrong((id *)&self->_removedSegment, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_highlightImageView, 0);
  objc_storeStrong((id *)&self->_highlightIndicatorView, 0);
  objc_storeStrong((id *)&self->_selectionImageView, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorView, 0);
}

- (id)infoViewForSegment:(int64_t)a3
{
  id *v3;
  id v4;

  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = v3[64];

  return v4;
}

+ (double)defaultHeight
{
  return 44.0;
}

- (UISegmentedControl)initWithFrame:(CGRect)a3 withStyle:(int64_t)a4 withItems:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  UISegmentedControl *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  id v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v11 = -[UISegmentedControl initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v11)
  {
    v12 = objc_msgSend(v10, "count");
    v13 = v12;
    if (v12 >= 1)
    {
      v14 = 0;
      v15 = (v12 - 1);
      v16 = v12;
      do
      {
        if (v15 == v14)
          v17 = 2;
        else
          v17 = 1;
        if (!v14)
          v17 = 0;
        if (v13 == 1)
          v18 = 3;
        else
          v18 = v17;
        objc_msgSend(v10, "objectAtIndex:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[UISegmentedControl _createAndAddSegmentAtIndex:position:withInfo:](v11, "_createAndAddSegmentAtIndex:position:withInfo:", v14, v18, v19);

        ++v14;
      }
      while (v16 != v14);
    }
  }

  return v11;
}

- (void)setAlwaysNotifiesDelegateOfSegmentClicks:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_segmentedControlFlags = ($05538722D7BB7C1D427C07F59A9C38BA)(*(_DWORD *)&self->_segmentedControlFlags & 0xFFFFFFFB | v3);
}

- (void)setImagePadding:(CGSize)a3 forSegment:(unint64_t)a4
{
  double height;
  double width;
  void *v7;

  height = a3.height;
  width = a3.width;
  -[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:", width, height);

  if ((*(_BYTE *)&self->_segmentedControlFlags & 0x20) != 0)
    -[UISegmentedControl sizeToFit](self, "sizeToFit");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)selectSegment:(int)a3
{
  -[UISegmentedControl setSelectedSegment:](self, "setSelectedSegment:", a3);
}

- (void)addSegmentWithTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self, "insertSegmentWithTitle:atIndex:animated:", v4, -[UISegmentedControl numberOfSegments](self, "numberOfSegments"), 0);

}

- (void)insertSegment:(unint64_t)a3 withTitle:(id)a4 animated:(BOOL)a5
{
  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self, "insertSegmentWithTitle:atIndex:animated:", a4, a3, a5);
}

- (void)insertSegment:(unint64_t)a3 withImage:(id)a4 animated:(BOOL)a5
{
  -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self, "insertSegmentWithImage:atIndex:animated:", a4, a3, a5);
}

- (void)setWidth:(float)a3 forSegment:(unint64_t)a4
{
  -[UISegmentedControl setWidth:forSegmentAtIndex:](self, "setWidth:forSegmentAtIndex:", a4, a3);
}

- (float)widthForSegment:(unint64_t)a3
{
  double v3;

  -[UISegmentedControl widthForSegmentAtIndex:](self, "widthForSegmentAtIndex:", a3);
  return v3;
}

@end
