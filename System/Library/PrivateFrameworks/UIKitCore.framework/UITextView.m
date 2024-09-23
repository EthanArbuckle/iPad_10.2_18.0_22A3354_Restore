@implementation UITextView

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextView;
  -[UIScrollView _didMoveFromWindow:toWindow:](&v13, sel__didMoveFromWindow_toWindow_, v6, v7);
  if (v7 && dyld_program_sdk_at_least())
  {
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");
    objc_msgSend(v6, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == objc_msgSend(v10, "userInterfaceIdiom"))
    {

    }
    else
    {
      objc_msgSend(v7, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if (v12 == 3)
        -[UITextView _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", 1);
    }
  }

}

- (void)_setMultilineContextWidth:(double)a3
{
  self->_multilineContextWidth = a3;
}

- (double)_preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
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
  _QWORD v12[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __24__UITextView_setBounds___block_invoke;
  v12[3] = &unk_1E16B20D8;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[UITextView _setFrameOrBounds:fromOldRect:settingAction:](self, "_setFrameOrBounds:fromOldRect:settingAction:", v12, x, y, width, height, v8, v9, v10, v11);
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  BOOL v12;
  UIUserInterfaceLayoutDirection v13;
  BOOL v14;
  double v15;
  void *v16;
  _UITextViewRestorableScrollPosition *v17;
  _UITextViewRestorableScrollPosition *scrollPosition;
  objc_super v19;

  y = a3.y;
  x = a3.x;
  -[UIScrollView contentOffset](self, "contentOffset");
  v7 = v6;
  v9 = v8;
  v19.receiver = self;
  v19.super_class = (Class)UITextView;
  -[UIScrollView setContentOffset:](&v19, sel_setContentOffset_, x, y);
  if (x != v7 || y != v9)
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_SingleLineTextViewAdjustsForHorizontalContentOffset, (uint64_t)CFSTR("SingleLineTextViewAdjustsForHorizontalContentOffset")) & 1) == 0)
    {
      v11 = vabdd_f64(x, v7);
      v12 = !byte_1EDDA8364 || v11 <= 0.00000011920929;
      if (!v12
        && -[NSTextContainer maximumNumberOfLines](self->_textContainer, "maximumNumberOfLines", v11) == 1
        && -[UIView clipsToBounds](self, "clipsToBounds"))
      {
        v13 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
        v14 = x <= 0.00000011920929;
        if (v13)
          v14 = x >= -0.00000011920929;
        if (!v14)
        {
          UIRoundToViewScale(self);
          self->_horizontalTextContainerGeometryAdjustment = v15;
          -[UITextView _updateTextContainerSizeAndSizeToFit](self, "_updateTextContainerSizeAndSizeToFit");
          -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
        }
      }
    }
    -[_UITextContainerView canvasView](self->_containerView, "canvasView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewportBoundsDidChange");

  }
  if (!self->_scrollPositionDontRecordCount)
  {
    -[UITextView _restorableScrollPosition](self, "_restorableScrollPosition");
    v17 = (_UITextViewRestorableScrollPosition *)objc_claimAutoreleasedReturnValue();
    scrollPosition = self->_scrollPosition;
    self->_scrollPosition = v17;

    self->_offsetFromScrollPosition = 0.0;
  }
}

- (id)_restorableScrollPosition
{
  return +[_UITextViewRestorableScrollPosition restorableScrollPositionForTextView:](_UITextViewRestorableScrollPosition, "restorableScrollPositionForTextView:", self);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;
  char v5;
  objc_super v7;

  if (sel_insertTextSuggestion_ != a3 || (*((_BYTE *)&self->_tvFlags + 3) & 2) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    if (-[UITextView respondsToSelector:](&v7, sel_respondsToSelector_, a3))
      v5 = 1;
    else
      v5 = objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3);
  }
  else
  {
    -[UIScrollView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

- (NSTextLayoutManager)textLayoutManager
{
  void *v2;
  void *v3;

  -[UITextView textContainer](self, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTextLayoutManager *)v3;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _UITextSizeCache *intrinsicSizeCache;
  _UITextSizeCache *v22;
  _UITextSizeCache *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  _QWORD v28[5];
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[3];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIViewDebugSignposts, (uint64_t)CFSTR("UIViewDebugSignposts"));
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __39__UITextView__intrinsicSizeWithinSize___block_invoke;
  v31[3] = &unk_1E16E7148;
  v31[4] = self;
  if ((v6 & 1) != 0 || !byte_1ECD75E44)
  {
    v34 = 0;
    v32 = 0u;
    v33 = 0u;
  }
  else
  {
    v37 = 0u;
    memset(v38, 0, sizeof(v38));
    v36 = 0u;
    __39__UITextView__intrinsicSizeWithinSize___block_invoke((uint64_t)v31, (uint64_t)&v36);
    if ((_DWORD)v36)
      kdebug_trace();
    v32 = *(_OWORD *)((char *)v38 + 8);
    v33 = *(_OWORD *)((char *)&v38[1] + 8);
    v34 = *((_QWORD *)&v38[2] + 1);
  }
  -[UIView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();

  v35 = *MEMORY[0x1E0C9D820];
  if ((*((_BYTE *)&self->_tvFlags + 1) & 4) == 0
    || !-[_UITextSizeCache getSize:baselineInfo:forTargetSize:isMultiline:](self->_intrinsicSizeCache, "getSize:baselineInfo:forTargetSize:isMultiline:", &v35, 0, 1, width, height))
  {
    -[UITextView _containerSizeForBoundsSize:allowingOverflow:](self, "_containerSizeForBoundsSize:allowingOverflow:", -[UITextView _allowsOverflowForIntrinsicSizeCalculation](self, "_allowsOverflowForIntrinsicSizeCalculation"), width, height);
    *(_QWORD *)&v35 = v9;
    *((_QWORD *)&v35 + 1) = v10;
    *(_QWORD *)&v36 = 0;
    *((_QWORD *)&v36 + 1) = &v36;
    *(_QWORD *)&v37 = 0x3010000000;
    *((_QWORD *)&v37 + 1) = &unk_18685B0AF;
    v38[0] = v35;
    if (-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager"))
    {
      v30[0] = v7;
      v30[1] = 3221225472;
      v30[2] = __39__UITextView__intrinsicSizeWithinSize___block_invoke_2;
      v30[3] = &unk_1E16E6E90;
      v30[4] = &v36;
      -[UITextView _performTextKit1LayoutCalculation:inSize:](self, "_performTextKit1LayoutCalculation:inSize:", v30, v35);
    }
    else
    {
      v28[0] = v7;
      v28[1] = 3221225472;
      v28[2] = __39__UITextView__intrinsicSizeWithinSize___block_invoke_3;
      v28[3] = &unk_1E16E6EB8;
      v29 = v35;
      v28[4] = &v36;
      -[UITextView _performTextKit2LayoutCalculation:inSize:](self, "_performTextKit2LayoutCalculation:inSize:", v28, v35);
    }
    -[_UITextContainerView textContainerInset](self->_containerView, "textContainerInset");
    v13 = *((_QWORD *)&v36 + 1);
    v14 = v11 + v12 + *(double *)(*((_QWORD *)&v36 + 1) + 40);
    *(double *)(*((_QWORD *)&v36 + 1) + 32) = v15 + v16 + *(double *)(*((_QWORD *)&v36 + 1) + 32);
    *(double *)(v13 + 40) = v14;
    UICeilToViewScale(self);
    v18 = v17;
    UICeilToViewScale(self);
    v20 = v19;
    *(double *)&v35 = v18;
    *((double *)&v35 + 1) = v19;
    if ((*((_BYTE *)&self->_tvFlags + 1) & 4) != 0)
    {
      intrinsicSizeCache = self->_intrinsicSizeCache;
      if (!intrinsicSizeCache)
      {
        v22 = (_UITextSizeCache *)objc_opt_new();
        v23 = self->_intrinsicSizeCache;
        self->_intrinsicSizeCache = v22;

        intrinsicSizeCache = self->_intrinsicSizeCache;
        v20 = *((double *)&v35 + 1);
        v18 = *(double *)&v35;
      }
      -[_UITextSizeCache addSize:baselineInfo:forTargetSize:](intrinsicSizeCache, "addSize:baselineInfo:forTargetSize:", 0, v18, v20, width, height);
    }
    _Block_object_dispose(&v36, 8);
  }
  if (kdebug_is_enabled())
  {
    -[UIScrollView description](self, "description");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "UTF8String");
    kdebug_trace_string();

    -[UIView superview](self, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

  }
  if ((_DWORD)v32)
    kdebug_trace();
  v27 = *((double *)&v35 + 1);
  v26 = *(double *)&v35;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)_performTextKit2LayoutCalculation:(id)a3 inSize:(CGSize)a4
{
  double height;
  double width;
  NSTextContainer *textContainer;
  void (**v8)(id, void *, void *);
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  height = a4.height;
  width = a4.width;
  textContainer = self->_textContainer;
  v8 = (void (**)(id, void *, void *))a3;
  -[NSTextContainer textLayoutManager](textContainer, "textLayoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView textContainer](self, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v16 = 0uLL;
  v17 = 0;
  -[UITextView _saveSizeBeforeLayoutCalculation:](self, "_saveSizeBeforeLayoutCalculation:", v10);
  objc_msgSend(v9, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (width != v12)
    objc_msgSend(v10, "setTextView:", 0);
  -[UITextView _configureForLayoutCalculation:inSize:](self, "_configureForLayoutCalculation:inSize:", v10, width, height);
  objc_msgSend(v9, "ensureLayoutForBounds:", 0.0, 0.0, width, height);
  v8[2](v8, v9, v10);

  v14 = v16;
  v15 = v17;
  -[UITextView _restoreSize:afterLayoutCalculation:](self, "_restoreSize:afterLayoutCalculation:", &v14, v10);
  if (width != v12)
    objc_msgSend(v10, "setTextView:", self->_containerView);
  objc_msgSend(v9, "setDelegate:", v13);

}

void __39__UITextView__intrinsicSizeWithinSize___block_invoke_3(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v5, "ensureLayoutForBounds:", 0.0, 0.0, v3, v4);
  objc_msgSend(v5, "ui_contentSizeForLastContainerView");
  v7 = v6;
  v9 = v8;

  v10 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 8);
  *(_QWORD *)(v10 + 32) = v7;
  *(_QWORD *)(v10 + 40) = v9;
}

- ($BB3B25BBC364C7D98808033881F79914)_saveSizeBeforeLayoutCalculation:(SEL)a3
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  $BB3B25BBC364C7D98808033881F79914 *result;

  *(_QWORD *)&retstr->var0 = 0;
  retstr->var2.width = 0.0;
  retstr->var2.height = 0.0;
  v5 = a4;
  retstr->var0 = objc_msgSend(v5, "widthTracksTextView");
  retstr->var1 = objc_msgSend(v5, "heightTracksTextView");
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  retstr->var2.width = v7;
  retstr->var2.height = v9;
  return result;
}

- (void)_restoreSize:(id *)a3 afterLayoutCalculation:(id)a4
{
  _BOOL8 var0;
  id v6;

  var0 = a3->var0;
  v6 = a4;
  objc_msgSend(v6, "setWidthTracksTextView:", var0);
  objc_msgSend(v6, "setHeightTracksTextView:", a3->var1);
  objc_msgSend(v6, "setSize:", a3->var2.width, a3->var2.height);

}

- (void)_configureForLayoutCalculation:(id)a3 inSize:(CGSize)a4
{
  double height;
  double width;
  id v6;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "setWidthTracksTextView:", 0);
  objc_msgSend(v6, "setHeightTracksTextView:", 0);
  objc_msgSend(v6, "setSize:", width, height);

}

void __107__UITextView__commonInitWithTextContainer_decoding_editable_selectable_draggable_textLayoutManagerEnabled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2776), "backgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

- (CGSize)intrinsicContentSize
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v3 = -[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  v4 = -1.0;
  v5 = -1.0;
  if (v3)
    goto LABEL_21;
  if (dyld_program_sdk_at_least() && (*(_QWORD *)&self->super.super._viewFlags & 0x4000000000000) != 0)
  {
    -[UITextView font](self, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineHeight");
    UICeilToViewScale(self);
    v11 = v13;
    v10 = 65536.0;

  }
  else
  {
    -[UITextView _currentPreferredMaxLayoutWidth](self, "_currentPreferredMaxLayoutWidth");
    if (v6 <= 0.0)
      v6 = 3.40282347e38;
    -[UITextView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", v6);
    v10 = v9;
    v11 = v7;
  }
  if (v10 > 0.0)
  {
    v14 = 3.40282347e38;
    if (v10 < 3.40282347e38)
      goto LABEL_12;
  }
  v14 = 0.0;
  if (v11 <= 0.0)
  {
    v8 = 0.0;
    v7 = 0.0;
    goto LABEL_13;
  }
  v8 = 0.0;
  v7 = 0.0;
  if (v11 < 3.40282347e38)
  {
LABEL_12:
    -[UITextView alignmentRectInsets](self, "alignmentRectInsets", v14, v7, v8);
    v7 = v15 + v16;
  }
LABEL_13:
  if (v10 <= 0.0)
    v7 = 0.0;
  v5 = v10 - v7;
  v4 = -1.0;
  if (v10 >= 3.40282347e38)
    v5 = -1.0;
  if (v11 < 3.40282347e38)
  {
    if (v11 <= 0.0)
      v4 = v11;
    else
      v4 = v11 - (v14 + v8);
  }
LABEL_21:
  v17 = v5;
  result.height = v4;
  result.width = v17;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  v3 = -[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  v4 = 0.0;
  if (v3)
  {
    v5 = 0.0;
  }
  else
  {
    v5 = 0.0;
    if ((*((_BYTE *)&self->_tvFlags + 1) & 0x40) != 0)
    {
      -[UITextView _applicableContentOutsetsFromFonts](self);
      v4 = fmax(v6 - self->_unadjustedTextContainerInset.left, 0.0);
      v5 = fmax(v7 - self->_unadjustedTextContainerInset.right, 0.0);
    }
  }
  v8 = 0.0;
  v9 = 0.0;
  result.right = v5;
  result.bottom = v9;
  result.left = v4;
  result.top = v8;
  return result;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  _BOOL4 v6;
  int v7;
  objc_super v8;

  v3 = a3;
  v5 = -[UITextView _needsDoubleUpdateConstraintsPass](self, "_needsDoubleUpdateConstraintsPass");
  v6 = -[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  -[UIScrollView setScrollEnabled:](&v8, sel_setScrollEnabled_, v3);
  if (v6 != v3)
  {
    -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
    -[UITextView _updateContainerTileAndSizingFlags](self, "_updateContainerTileAndSizingFlags");
    -[UITextView _resyncContainerFrameForNonAutolayout](self, "_resyncContainerFrameForNonAutolayout");
    if (v3)
    {
      -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
      *(_OWORD *)&self->_textContainerInsetAdjustment.top = 0u;
      *(_OWORD *)&self->_textContainerInsetAdjustment.bottom = 0u;
      *(_QWORD *)&self->_tvFlags &= 0xFFFFFFFFFFFF9FFFLL;
    }
    else
    {
      if (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_LabelDisableDefaultClipping, (uint64_t)CFSTR("LabelDisableDefaultClipping")))v7 = dyld_program_sdk_at_least();
      else
        v7 = byte_1ECD75E7C != 0;
      -[UIView setClipsToBounds:](self, "setClipsToBounds:", v7 ^ 1u);
    }
  }
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(_QWORD *)&self->super.super._viewFlags & 0x20000000000000) != 0
      && !-[UIScrollView isScrollEnabled](self, "isScrollEnabled")
      && (*(_BYTE *)&self->_tvFlags & 8) == 0;
}

- (void)_resyncContainerFrameForNonAutolayoutDeferringSizeToFit:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double width;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _BOOL4 v54;
  double v55;
  double v56;
  double height;
  double v58;
  double v59;
  double v60;
  double v61;
  _QWORD v62[5];
  CGRect v63;
  CGRect v64;
  CGRect v65;

  -[UIView frame](self->_containerView, "frame");
  v58 = v5;
  v59 = v6;
  v61 = v7;
  v9 = v8;
  -[UITextView visibleRectIgnoringKeyboard](self, "visibleRectIgnoringKeyboard");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v60 = v9;
  if (-[UITextView _freezeTextContainerSize](self, "_freezeTextContainerSize"))
  {
    width = self->_beforeFreezingFrameSize.width;
    height = self->_beforeFreezingFrameSize.height;
    v63.origin.x = v11;
    v63.origin.y = v13;
    v63.size.width = v15;
    v63.size.height = v17;
    v56 = CGRectGetWidth(v63)
        - width
        - (self->_duringFreezingTextContainerInset.right
         - self->_beforeFreezingTextContainerInset.right);
  }
  else
  {
    v64.origin.x = v11;
    v64.origin.y = v13;
    v64.size.width = v15;
    v64.size.height = v17;
    width = CGRectGetWidth(v64);
    if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled"))
    {
      v56 = 0.0;
      height = v9;
    }
    else
    {
      v56 = 0.0;
      v65.origin.x = v11;
      v65.origin.y = v13;
      v65.size.width = v15;
      v65.size.height = v17;
      height = CGRectGetHeight(v65);
    }
  }
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UIView bounds](self, "bounds");
  v28 = v27 - (v22 + v26);
  v55 = v20;
  v30 = v29 - (v20 + v24);
  -[_UITextContainerView minSize](self->_containerView, "minSize");
  v32 = v31;
  -[UIView convertSize:fromView:](self->_containerView, "convertSize:fromView:", self, v28, v30);
  v34 = v33;
  v36 = v35;
  if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled"))
    v37 = 0.0;
  else
    v37 = v36;
  -[_UITextContainerView minSize](self->_containerView, "minSize");
  v40 = v39 != v37 || v38 != v32;
  if (v40)
    -[_UITextContainerView setMinSize:](self->_containerView, "setMinSize:", v32, v37);
  v41 = -[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  if (v41)
    v42 = 1.79769313e308;
  else
    v42 = v34;
  if (v41)
    v36 = 1.79769313e308;
  -[_UITextContainerView maxSize](self->_containerView, "maxSize");
  if (v44 != v42 || v43 != v36)
  {
    -[_UITextContainerView setMaxSize:](self->_containerView, "setMaxSize:", v42, v36);
    v40 = 1;
  }
  if (-[NSTextContainer layoutOrientation](self->_textContainer, "layoutOrientation"))
  {
    v47 = v59;
    v46 = v60;
    v48 = v56;
    if (-[NSTextContainer layoutOrientation](self->_textContainer, "layoutOrientation") == 1)
    {
      -[UIView bounds](self, "bounds");
      v50 = v49 - v24 - v55;
      v51 = height;
      if (v50 < height)
        v51 = v50;
      v52 = v61;
    }
    else
    {
      v52 = v61;
      v51 = height;
    }
  }
  else
  {
    -[UIView bounds](self, "bounds");
    if (v53 - v22 - v26 < width)
      width = v53 - v22 - v26;
    v46 = v60;
    v52 = v61;
    v47 = v59;
    v48 = v56;
    v51 = height;
  }
  if ((_UIRectEquivalentToRectWithAccuracy(v48, v47, width, v51, v58, v47, v52, v46, 0.00000011920929) & 1) != 0)
  {
LABEL_38:
    if (!v40)
      goto LABEL_41;
    goto LABEL_39;
  }
  -[_UITextContainerView setFrame:](self->_containerView, "setFrame:", v48, v47, width, v51);
  if (!v40)
  {
    v54 = vabdd_f64(v51, v46) >= 0.00000011920929;
    v40 = vabdd_f64(width, v52) >= 0.00000011920929 || v54;
    goto LABEL_38;
  }
LABEL_39:
  if (!a3)
    -[UITextView _updateTextContainerSizeAndSizeToFit](self, "_updateTextContainerSizeAndSizeToFit");
LABEL_41:
  if (self->_unfreezingTextContainerSize)
  {
    -[UITextInteractionAssistant updateDisplayedSelection](self->_interactionAssistant, "updateDisplayedSelection");
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __70__UITextView__resyncContainerFrameForNonAutolayoutDeferringSizeToFit___block_invoke;
    v62[3] = &unk_1E16B1B28;
    v62[4] = self;
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v62);
  }
}

- (BOOL)_freezeTextContainerSize
{
  return -[_UITextContainerView _freezeTextContainerSize](self->_containerView, "_freezeTextContainerSize");
}

- (CGRect)visibleRectIgnoringKeyboard
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[UIScrollView contentOffset](self, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[UIView frame](self, "frame");
  v9 = v4;
  v10 = v6;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)_updateTextContainerSizeAndSizeToFit
{
  _BOOL8 v3;
  double v4;
  double v5;

  v3 = (-[UIScrollView isScrollEnabled](self, "isScrollEnabled") || (dyld_program_sdk_at_least() & 1) == 0)
    && -[UITextView _allowsOverflowForIntrinsicSizeCalculation](self, "_allowsOverflowForIntrinsicSizeCalculation");
  -[UIView bounds](self, "bounds");
  -[UITextView _containerSizeForBoundsSize:allowingOverflow:](self, "_containerSizeForBoundsSize:allowingOverflow:", v3, v4, v5);
  -[NSTextContainer setSize:](self->_textContainer, "setSize:");
  -[_UITextContainerView sizeToFit](self->_containerView, "sizeToFit");
}

- (void)_updateContainerTileAndSizingFlags
{
  _BOOL4 v3;
  int v4;
  void *v5;
  NSTextContainer **p_textContainer;
  uint64_t v7;
  _UITextContainerView *containerView;
  uint64_t v9;
  void *v10;

  v3 = -[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  v4 = -[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager");
  if (v3)
  {
    if (v4)
    {
      -[_UITextLayoutController layoutManager](self->_textLayoutController, "layoutManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllowsNonContiguousLayout:", 1);

    }
    p_textContainer = &self->_textContainer;
    v7 = -[NSTextContainer layoutOrientation](self->_textContainer, "layoutOrientation");
    containerView = self->_containerView;
    if (v7)
    {
      -[_UITextContainerView setVerticallyResizable:](containerView, "setVerticallyResizable:", 0);
      -[_UITextContainerView setHorizontallyResizable:](self->_containerView, "setHorizontallyResizable:", 1);
      -[NSTextContainer setHeightTracksTextView:](*p_textContainer, "setHeightTracksTextView:", 1);
      v9 = 0;
    }
    else
    {
      v9 = 1;
      -[_UITextContainerView setVerticallyResizable:](containerView, "setVerticallyResizable:", 1);
      -[_UITextContainerView setHorizontallyResizable:](self->_containerView, "setHorizontallyResizable:", 0);
      -[NSTextContainer setHeightTracksTextView:](*p_textContainer, "setHeightTracksTextView:", 0);
    }
  }
  else
  {
    if (v4)
    {
      -[_UITextLayoutController layoutManager](self->_textLayoutController, "layoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAllowsNonContiguousLayout:", 0);

    }
    -[_UITextContainerView setVerticallyResizable:](self->_containerView, "setVerticallyResizable:", 0);
    -[_UITextContainerView setHorizontallyResizable:](self->_containerView, "setHorizontallyResizable:", 0);
    p_textContainer = &self->_textContainer;
    if (-[NSTextContainer layoutOrientation](self->_textContainer, "layoutOrientation"))
    {
      -[NSTextContainer setHeightTracksTextView:](*p_textContainer, "setHeightTracksTextView:", 1);
      v9 = dyld_program_sdk_at_least();
    }
    else
    {
      -[NSTextContainer setHeightTracksTextView:](*p_textContainer, "setHeightTracksTextView:", dyld_program_sdk_at_least());
      v9 = 1;
    }
  }
  -[NSTextContainer setWidthTracksTextView:](*p_textContainer, "setWidthTracksTextView:", v9);
}

- (void)_resyncContainerFrameForNonAutolayout
{
  -[UITextView _resyncContainerFrameForNonAutolayoutDeferringSizeToFit:](self, "_resyncContainerFrameForNonAutolayoutDeferringSizeToFit:", 0);
}

- (BOOL)_allowsOverflowForIntrinsicSizeCalculation
{
  double v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  -[UIView bounds](self, "bounds");
  if (v3 != 0.0
    || (-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager") & 1) != 0)
  {
    return 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *(_QWORD *)off_1E1678F98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextView textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_ui_resolvedTextAlignmentForParagraphStyle:", v6);

  v9 = -[_UITextContainerView layoutOrientation](self->_containerView, "layoutOrientation");
  return v9 || v8 == 0;
}

- (UIFont)font
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *(_QWORD *)off_1E1678D90);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
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
  _QWORD v12[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __23__UITextView_setFrame___block_invoke;
  v12[3] = &unk_1E16B20D8;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[UITextView _setFrameOrBounds:fromOldRect:settingAction:](self, "_setFrameOrBounds:fromOldRect:settingAction:", v12, x, y, width, height, v8, v9, v10, v11);
}

- (void)_setFrameOrBounds:(CGRect)a3 fromOldRect:(CGRect)a4 settingAction:(id)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  void (**v14)(_QWORD);
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void (**v22)(_QWORD);
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  _QWORD aBlock[15];
  char v33;
  BOOL v34;
  char v35;
  _QWORD v36[6];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v14 = (void (**)(_QWORD))a5;
  if (-[UITextView _freezeTextContainerSize](self, "_freezeTextContainerSize"))
  {
    v14[2](v14);
    -[UITextView _resyncContainerFrameForNonAutolayoutDeferringSizeToFit:](self, "_resyncContainerFrameForNonAutolayoutDeferringSizeToFit:", 1);
    -[UITextInteractionAssistant updateDisplayedSelection](self->_interactionAssistant, "updateDisplayedSelection");
  }
  else
  {
    if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled") && vabdd_f64(v10, width) >= 2.22044605e-16)
    {
      v16 = -[UITextView _visibleRangeWithLayout:](self, "_visibleRangeWithLayout:", 0);
      v25 = v24;
      v29 = v24;
      if (-[UITextView isEditing](self, "isEditing"))
      {
        v26 = -[UITextView selectedRange](self, "selectedRange");
        v15 = v26 < v16 + v25 && v16 < v26 + v27;
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
      v29 = 0;
      v16 = 0;
    }
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v17 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke;
      v36[3] = &unk_1E16E7120;
      v36[4] = self;
      v18 = _UITextLayoutSizeWillShrink(v36, width, height, v10, v9);
    }
    else
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 0;
    }
    -[UIView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "needsLayoutOnGeometryChange");

    if ((_DWORD)v18)
    {
      -[UIView layer](self, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNeedsLayoutOnGeometryChange:", 0);

    }
    v14[2](v14);
    -[UITextView _resyncContainerFrameForNonAutolayoutDeferringSizeToFit:](self, "_resyncContainerFrameForNonAutolayoutDeferringSizeToFit:", v18);
    aBlock[0] = v17;
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_2;
    aBlock[3] = &unk_1E16E6DF0;
    v33 = v18;
    aBlock[4] = self;
    *(CGFloat *)&aBlock[5] = v12;
    *(CGFloat *)&aBlock[6] = v11;
    *(double *)&aBlock[7] = v10;
    *(double *)&aBlock[8] = v9;
    *(CGFloat *)&aBlock[9] = x;
    *(CGFloat *)&aBlock[10] = y;
    *(double *)&aBlock[11] = width;
    *(double *)&aBlock[12] = height;
    aBlock[13] = v16;
    aBlock[14] = v29;
    v34 = v15;
    v35 = v20;
    v22 = (void (**)(_QWORD))_Block_copy(aBlock);
    v23 = v22;
    if ((_DWORD)v18)
    {
      v30[0] = v17;
      v30[1] = 3221225472;
      v30[2] = __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_3;
      v30[3] = &unk_1E16B1BF8;
      v31 = v22;
      +[UIViewAnimationState _addSystemPostAnimationAction:](UIViewAnimationState, "_addSystemPostAnimationAction:", v30);

    }
    else
    {
      v22[2](v22);
    }
    if (!-[UIView _wantsAutolayout](self, "_wantsAutolayout")
      && (*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0
      && (v10 != width || v9 != height))
    {
      self->_lastBaselineOffsetFromBottom = 0.0;
      self->_firstBaselineOffsetFromTop = 0.0;
    }

  }
}

void __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (*(_BYTE *)(a1 + 120))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setNeedsTextLayout");
    objc_msgSend(*(id *)(a1 + 32), "_updateTextContainerSizeAndSizeToFit");
  }
  if (*(double *)(a1 + 56) > *(double *)(a1 + 88) || *(double *)(a1 + 64) > *(double *)(a1 + 96))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2688), "usesTiledViews");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 2096);
    if (v2)
    {
      objc_msgSend(v3, "setNeedsLayout");
    }
    else
    {
      objc_msgSend(v3, "canvasView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "viewportBoundsDidChange");

    }
  }
  if (*(_QWORD *)(a1 + 112))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_contentOffsetForScrollToVisible:", *(_QWORD *)(a1 + 104), 1);
    objc_msgSend(v5, "setContentOffset:");
    if (*(_BYTE *)(a1 + 121))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2152) |= 1uLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayoutOnGeometryChange:", *(unsigned __int8 *)(a1 + 122));

}

- (void)setNeedsDisplay
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double x;
  double y;
  double width;
  double height;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29.receiver = self;
  v29.super_class = (Class)UITextView;
  -[UIView setNeedsDisplay](&v29, sel_setNeedsDisplay);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v33.origin.x = v21;
  v33.origin.y = v22;
  v33.size.width = v23;
  v33.size.height = v24;
  v30.origin.x = v13;
  v30.origin.y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  v31 = CGRectIntersection(v30, v33);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;

  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (!CGRectIsEmpty(v32))
    -[_UITextContainerView setNeedsDisplayInRect:](self->_containerView, "setNeedsDisplayInRect:", x, y, width, height);
}

id __23__UITextView_setFrame___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UITextView;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_commonInitWithTextContainer:(id)a3 decoding:(BOOL)a4 editable:(BOOL)a5 selectable:(BOOL)a6 draggable:(BOOL)a7 textLayoutManagerEnabled:(BOOL)a8
{
  uint64_t v8;
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL4 v12;
  _UITextViewVisualStyle *v15;
  _UITextViewVisualStyle *visualStyle;
  UITextView *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  int v21;
  UITextView *v22;
  uint64_t v23;
  _UITextLayoutController *textLayoutController;
  void *v25;
  void *v26;
  uint64_t v27;
  _UITextLayoutView *layoutView;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  _UITextViewContentPadding *v34;
  _UITextViewContentPadding *topContentPadding;
  _UITextViewContentPadding *v36;
  _UITextViewContentPadding *bottomContentPadding;
  id WeakRetained;
  void *v39;
  id v40;
  _UITextStorageDraggableGeometry *v41;
  _UITextStorageDraggableGeometry *geometry;
  uint64_t v43;
  UITextDragDropSupport *textDragDropSupport;
  objc_class *v45;
  objc_method *InstanceMethod;
  IMP Implementation;
  objc_class *v48;
  objc_method *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  _QWORD v55[5];

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v54 = a3;
  +[_UITextViewVisualStyle inferredVisualStyle](_UITextViewVisualStyle, "inferredVisualStyle");
  v15 = (_UITextViewVisualStyle *)objc_claimAutoreleasedReturnValue();
  visualStyle = self->_visualStyle;
  self->_visualStyle = v15;

  v17 = self;
  if (qword_1ECD793A8 != -1)
    dispatch_once(&qword_1ECD793A8, &__block_literal_global_2135);
  if ((dyld_program_sdk_at_least() & 1) == 0 && qword_1ECD793B8 != -1)
    dispatch_once(&qword_1ECD793B8, &__block_literal_global_2142);
  if (_MergedGlobals_63)
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD793A0, "objectForKeyedSubscript:", qword_1ECD793B0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    v8 = v8 & ~v21;
  }

  v22 = v17;
  if ((dyld_program_sdk_at_least() & 1) == 0 && qword_1ECD793D0 != -1)
    dispatch_once(&qword_1ECD793D0, &__block_literal_global_2150);
  if (byte_1ECD79379 && (objc_opt_isKindOfClass() & 1) != 0)
  {

    if (v54 && !v22->_textLayoutController)
    {
      +[_UITextLayoutControllerBase layoutControllerWithTextView:textContainer:]((uint64_t)_UITextLayoutControllerBase, v22, v54);
      v23 = objc_claimAutoreleasedReturnValue();
      textLayoutController = v22->_textLayoutController;
      v22->_textLayoutController = (_UITextLayoutController *)v23;

      objc_storeStrong((id *)&v22->_textContainer, a3);
      -[_UITextLayoutController textStorage](v22->_textLayoutController, "textStorage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView _assignTextStorageCheckingForOverrides:]((uint64_t)v22, v25);

    }
  }
  else
  {

    -[UITextView _setUpWithTextContainer:textLayoutManagerEnabled:](v22, "_setUpWithTextContainer:textLayoutManagerEnabled:", v54, v8);
  }
  -[UITextView _setupDefaultStyleEffectConfiguration](v22, "_setupDefaultStyleEffectConfiguration");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v22, sel__textStorageDidProcessEditing_, *(_QWORD *)off_1E16791A8, v22->_textStorage);
  objc_msgSend(v26, "addObserver:selector:name:object:", v22, sel__keyboardDidShow_, CFSTR("UIKeyboardDidShowNotification"), 0);
  -[UITextView _installContainerViewAtIndex:](v22, "_installContainerViewAtIndex:", 0);
  -[UIView setClipsToBounds:](v22, "setClipsToBounds:", 1);
  v27 = objc_opt_new();
  layoutView = v22->_layoutView;
  v22->_layoutView = (_UITextLayoutView *)v27;

  -[_UITextLayoutView setDelegate:](v22->_layoutView, "setDelegate:", v22);
  -[UIView insertSubview:atIndex:](v22, "insertSubview:atIndex:", v22->_layoutView, 0);
  v29 = 8.0;
  if (dyld_program_sdk_at_least())
  {
    -[UIView traitCollection](v22, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "userInterfaceIdiom") == 6)
      v29 = 2.0;
    else
      v29 = 8.0;

  }
  -[UITextView setMarginTop:](v22, "setMarginTop:", (unint64_t)v29);
  -[UIView bounds](v22, "bounds");
  v32 = v31;
  -[UIView bounds](v22, "bounds");
  -[UIScrollView setContentSize:](v22, "setContentSize:", v32, v33 - v29);
  v34 = -[_UITextViewContentPadding initWithDelegate:]([_UITextViewContentPadding alloc], "initWithDelegate:", v22);
  topContentPadding = v22->_topContentPadding;
  v22->_topContentPadding = v34;

  v36 = -[_UITextViewContentPadding initWithDelegate:]([_UITextViewContentPadding alloc], "initWithDelegate:", v22);
  bottomContentPadding = v22->_bottomContentPadding;
  v22->_bottomContentPadding = v36;

  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v22->_inputController);

    if (!WeakRetained)
    {
      -[_UITextLayoutControllerBase textInputController]((UITextInputController *)v22->_textLayoutController);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v22->_inputController, v39);

      v40 = objc_loadWeakRetained((id *)&v22->_inputController);
      objc_msgSend(v40, "setDelegate:", v22);

    }
  }
  v22->_defaultTextPreviewOptions = 0;
  v41 = -[_UITextStorageDraggableGeometry initWithView:textStorage:]([_UITextStorageDraggableGeometry alloc], "initWithView:textStorage:", v22, v22->_textStorage);
  geometry = v22->_geometry;
  v22->_geometry = v41;

  if (v9)
  {
    +[UITextDragDropSupport installTextDragDropOnView:](UITextDragDropSupport, "installTextDragDropOnView:", v22);
    v43 = objc_claimAutoreleasedReturnValue();
    textDragDropSupport = v22->_textDragDropSupport;
    v22->_textDragDropSupport = (UITextDragDropSupport *)v43;

  }
  v45 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v45, sel_insertTextSuggestion_);
  Implementation = method_getImplementation(InstanceMethod);
  v48 = (objc_class *)objc_opt_class();
  v49 = class_getInstanceMethod(v48, sel_insertTextSuggestion_);
  v22->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&v22->_tvFlags & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)(Implementation != method_getImplementation(v49)) << 25));
  -[UITextView setEditable:](v22, "setEditable:", v11);
  if (!v11)
    -[UITextView setSelectable:](v22, "setSelectable:", v10);
  -[UITextView _setShowsEditMenu:](v22, "_setShowsEditMenu:", 1);
  if (!v12)
  {
    -[UITextView setScrollEnabled:](v22, "setScrollEnabled:", 1);
    -[UIScrollView setBounces:](v22, "setBounces:", 1);
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __107__UITextView__commonInitWithTextContainer_decoding_editable_selectable_draggable_textLayoutManagerEnabled___block_invoke;
    v55[3] = &unk_1E16B1B28;
    v55[4] = v22;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v55);
  }
  objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView _setTypingAttributesTextColor:](v22, "_setTypingAttributesTextColor:", v50);

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIView traitCollection](v22, "traitCollection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "userInterfaceIdiom");

    if (v52 == 6)
    {
      -[UIView _setContinuousCornerRadius:](v22, "_setContinuousCornerRadius:", 4.5);
      -[UITextView setTextContainerInset:](v22, "setTextContainerInset:", 16.0, 16.0, 16.0, 16.0);
    }
  }
  -[UITextView _updateContainerTileAndSizingFlags](v22, "_updateContainerTileAndSizingFlags");
  if (!-[UIScrollView isScrollEnabled](v22, "isScrollEnabled"))
    -[UITextView invalidateIntrinsicContentSize](v22, "invalidateIntrinsicContentSize");
  objc_msgSend(v26, "addObserver:selector:name:object:", v22, sel__textContainerSizeDidChange_, CFSTR("_UITextContainerViewSizeDidChange"), v22->_containerView);
  v22->_canShowTextFormattingOptions = _os_feature_enabled_impl();
  if (dyld_program_sdk_at_least())
  {
    v53 = (void *)objc_opt_new();
    -[UITextView setTextFormattingConfiguration:](v22, "setTextFormattingConfiguration:", v53);

  }
}

- (void)_ensureUpToDateTextContainerInsetAndNotifyIfNecessary
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
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  id v38;
  CGRect v39;
  CGRect v40;

  if (!a1)
    return;
  objc_msgSend(*(id *)(a1 + 2096), "textContainerInset");
  v6 = v5;
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v10 = fmax(*(double *)(a1 + 2320), *(double *)(a1 + 2352));
  v11 = fmax(*(double *)(a1 + 2328), *(double *)(a1 + 2360));
  v12 = fmax(*(double *)(a1 + 2336), *(double *)(a1 + 2368));
  v13 = fmax(*(double *)(a1 + 2344), *(double *)(a1 + 2376));
  v14 = *(double *)(a1 + 2384) >= 0.0 ? v11 : *(double *)(a1 + 2384);
  v15 = v14 == v2 && v10 == v6;
  v16 = v15 && v13 == v4;
  if (v16 && v12 == v3)
    return;
  v18 = objc_msgSend((id)a1, "isScrollEnabled");
  if ((*(_QWORD *)(a1 + 104) & 0x400000000000000) != 0)
  {
    objc_msgSend((id)a1, "bounds");
    v36 = v28;
    v37 = v27;
    v34 = v30;
    v35 = v29;
    v38 = 0;
    v23 = 1;
LABEL_23:
    v32 = *MEMORY[0x1E0C9D820];
    v33 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_24;
  }
  objc_msgSend((id)a1, "superview");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "bounds");
  v36 = v22;
  v37 = v21;
  v23 = v38 == 0;
  if (v38)
    v24 = v18;
  else
    v24 = 1;
  v34 = v20;
  v35 = v19;
  if ((v24 & 1) != 0)
    goto LABEL_23;
  objc_msgSend((id)a1, "sizeThatFits:", v19, v20);
  v32 = v25;
  v33 = v26;
  v23 = 0;
LABEL_24:
  objc_msgSend(*(id *)(a1 + 2096), "setTextContainerInset:", v10, v14, v12, v13);
  if ((v18 & 1) == 0)
  {
    objc_msgSend((id)a1, "_updateBaselineInformationDependentOnBounds");
    v31 = *(_QWORD *)(a1 + 104);
    if (v23)
    {
      if ((v31 & 0x400000000000000) != 0
        && (objc_msgSend((id)a1, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
      {
        objc_msgSend((id)a1, "invalidateIntrinsicContentSize");
      }
    }
    else if ((v31 & 0x8000000000000000) == 0)
    {
      if (vabdd_f64(v10 + v12, v6 + v8) > 2.22044605e-16)
      {
        v39.origin.y = v36;
        v39.origin.x = v37;
        v39.size.height = v34;
        v39.size.width = v35;
        if (vabdd_f64(CGRectGetHeight(v39), v33) <= 2.22044605e-16)
          goto LABEL_35;
      }
      if (vabdd_f64(v13 + v14, v7 + v9) > 2.22044605e-16)
      {
        v40.origin.y = v36;
        v40.origin.x = v37;
        v40.size.height = v34;
        v40.size.width = v35;
        if (vabdd_f64(CGRectGetWidth(v40), v32) <= 2.22044605e-16)
LABEL_35:
          objc_msgSend(v38, "setNeedsLayout");
      }
    }
  }

}

- (void)_setTypingAttributesTextColor:(id)a3
{
  UITextInputController **p_inputController;
  id v5;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_addToTypingAttributes:value:", *(_QWORD *)off_1E1678D98, v5);

  -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](self, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
}

- (void)setEditable:(BOOL)editable
{
  _BOOL8 v3;
  uint64_t v5;

  if (((((*(_BYTE *)&self->_tvFlags & 2) == 0) ^ editable) & 1) == 0)
  {
    v3 = editable;
    -[UITextView resignFirstResponder](self, "resignFirstResponder");
    v5 = 2;
    if (!v3)
      v5 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFFFFDLL | v5);
    if (v3 && !-[UITextView isSelectable](self, "isSelectable"))
    {
      -[UITextView setSelectable:](self, "setSelectable:", 1);
    }
    else
    {
      -[UITextView _updateSelectionGestures](self, "_updateSelectionGestures");
      if (-[UITextView _shouldStartDataDetectors](self, "_shouldStartDataDetectors"))
        -[UITextView _startDataDetectors](self, "_startDataDetectors");
      else
        -[UITextView _resetDataDetectorsResults](self, "_resetDataDetectorsResults");
    }
    -[_UITextContainerView setNeedsDisplay](self->_containerView, "setNeedsDisplay");
    -[_UITextLayoutController setEditable:](self->_textLayoutController, "setEditable:", v3);
  }
}

- (void)setSelectable:(BOOL)selectable
{
  _BOOL4 v4;
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags;

  v4 = selectable
    && -[UITextView _totalNumberOfTextViewsInLayoutManager](self, "_totalNumberOfTextViewsInLayoutManager") < 2;
  tvFlags = self->_tvFlags;
  if (((*(_DWORD *)&tvFlags >> 5) & 1) != v4)
  {
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&tvFlags & 0xFFFFFFFFFFFFFFDFLL | (32 * v4));
    -[UITextView resignFirstResponder](self, "resignFirstResponder");
    if (!-[UITextView isTextDragActive](self, "isTextDragActive"))
      -[UITextView _updateSelectableInteractions](self, "_updateSelectableInteractions");
    if (-[UITextView _shouldStartDataDetectors](self, "_shouldStartDataDetectors"))
      -[UITextView _startDataDetectors](self, "_startDataDetectors");
    else
      -[UITextView _resetDataDetectorsResults](self, "_resetDataDetectorsResults");
  }
}

- (void)setMarginTop:(unint64_t)a3
{
  self->_unadjustedTextContainerInset.top = (double)a3;
  self->_unadjustedTextContainerInset.bottom = (double)a3;
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
}

- (void)_setupDefaultStyleEffectConfiguration
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;

  if (dyld_program_sdk_at_least())
  {
    -[_UITextLayoutController styleEffectConfiguration](self->_textLayoutController, "styleEffectConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D1A6E8]);
      -[UIView traitCollection](self, "traitCollection");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[UITraitCollection _styleEffectAppearanceName](v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAppearanceName:", v5);

      -[_UITextLayoutController setStyleEffectConfiguration:](self->_textLayoutController, "setStyleEffectConfiguration:", v6);
    }
  }
}

- (void)_setUpWithTextContainer:(id)a3 textLayoutManagerEnabled:(BOOL)a4
{
  -[UITextView _configureWithTextContainer:layoutManager:textLayoutManagerEnabled:](self, "_configureWithTextContainer:layoutManager:textLayoutManagerEnabled:", a3, 0, a4);
}

- (void)_setShowsEditMenu:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)_installContainerViewAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _UITextContainerView *v14;
  _UITextContainerView *containerView;
  void *v16;
  CGSize v17;
  id v18;

  -[_UITextLayoutController usedRectForTextContainer:](self->_textLayoutController, "usedRectForTextContainer:", self->_textContainer);
  v6 = v5;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");
    v9 = 8.0;
    if (v8 == 6)
      v9 = 2.0;
    v10 = ceil(v6 + v9);

  }
  else
  {
    v10 = ceil(v6 + 8.0);
  }
  -[UIView bounds](self, "bounds");
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v14 = -[UITextView _newContainerViewWithFrame:textContainer:textLayoutController:](self, "_newContainerViewWithFrame:textContainer:textLayoutController:", self->_textContainer, self->_textLayoutController, 0.0, 0.0, v12, fmax(v10, v13));
  containerView = self->_containerView;
  self->_containerView = v14;

  +[UIColor clearColor](UIColor, "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextContainerView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v16);

  v17 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_frameOfTrailingWhitespace.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_frameOfTrailingWhitespace.size = v17;
  -[UITextView _contentView](self, "_contentView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertSubview:atIndex:", self->_containerView, a3);

}

- (id)_newContainerViewWithFrame:(CGRect)a3 textContainer:(id)a4 textLayoutController:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  _UITextContainerView *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = a4;
  v13 = -[_UITextContainerView initWithFrame:textLayoutController:textContainer:delegate:]([_UITextContainerView alloc], "initWithFrame:textLayoutController:textContainer:delegate:", v11, v12, self, x, y, width, height);

  -[_UITextContainerView setVerticallyResizable:](v13, "setVerticallyResizable:", -[UIScrollView isScrollEnabled](self, "isScrollEnabled"));
  -[_UITextContainerView setMaxSize:](v13, "setMaxSize:", 1.79769313e308, 1.79769313e308);
  if (_UITextViewAllowSelectionContainerInTextLayoutCanvas())
    -[_UITextContainerView setTextEmphasisBackgroundView:withTextView:](v13, "setTextEmphasisBackgroundView:withTextView:", self->_textEmphasisBackgroundView, self);
  return v13;
}

- (void)_configureWithTextContainer:(id)a3 layoutManager:(id)a4 textLayoutManagerEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  id v11;
  _UITextLayoutController *v12;
  _UITextLayoutController *v13;
  void *v14;
  void *v15;
  id v16;
  _UITextKit2LayoutController *v17;
  _UITextLayoutController *textLayoutController;
  NSTextContainer *v19;
  NSTextContainer *textContainer;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _UITextEmphasisBackgroundView *textEmphasisBackgroundView;
  _UITextEmphasisBackgroundView *v26;
  _UITextContainerView *containerView;
  int v28;
  _UITextEmphasisBackgroundView *v29;
  void *v30;
  id obj;

  v5 = a5;
  obj = a3;
  v9 = a4;
  v10 = obj;
  v11 = v9;
  if (!obj)
  {
    v10 = -[UITextView _newTextContainer](self, "_newTextContainer");
LABEL_7:
    obj = v10;
    if (self->_textStorage)
    {
      if (v5)
      {
LABEL_9:
        v16 = objc_alloc_init((Class)off_1E1679D40);
        objc_msgSend(v16, "setTextStorage:", self->_textStorage);
        v17 = -[_UITextKit2LayoutController initWithTextView:textContentStorage:textContainer:]([_UITextKit2LayoutController alloc], "initWithTextView:textContentStorage:textContainer:", self, v16, obj);
        textLayoutController = self->_textLayoutController;
        self->_textLayoutController = (_UITextLayoutController *)v17;

        -[_UITextLayoutController firstTextContainer](self->_textLayoutController, "firstTextContainer");
        v19 = (NSTextContainer *)objc_claimAutoreleasedReturnValue();
        textContainer = self->_textContainer;
        self->_textContainer = v19;

        -[UITextView _createTextEmphasisBackgroundViewIfNeeded](self, "_createTextEmphasisBackgroundViewIfNeeded");
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v21 = objc_alloc_init((Class)off_1E1679D80);
      -[UITextView _assignTextStorageCheckingForOverrides:]((uint64_t)self, v21);

      v10 = obj;
      if (v5)
        goto LABEL_9;
    }
    objc_storeStrong((id *)&self->_textContainer, v10);
    v16 = -[UITextView _newTextKit1LayoutControllerWithTextContainer:layoutManager:textStorage:](self, "_newTextKit1LayoutControllerWithTextContainer:layoutManager:textStorage:", self->_textContainer, v11, self->_textStorage);
    objc_storeStrong((id *)&self->_textLayoutController, v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)off_1E167E218;
    objc_msgSend(v16, "layoutManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__observedTextViewDidChange_, v23, v24);

    textEmphasisBackgroundView = self->_textEmphasisBackgroundView;
    if (textEmphasisBackgroundView)
    {
      -[UIView removeFromSuperview](textEmphasisBackgroundView, "removeFromSuperview");
      v26 = self->_textEmphasisBackgroundView;
      self->_textEmphasisBackgroundView = 0;

    }
    goto LABEL_13;
  }
  if (self->_textLayoutController)
    goto LABEL_7;
  +[_UITextLayoutControllerBase layoutControllerWithTextView:textContainer:]((uint64_t)_UITextLayoutControllerBase, self, obj);
  v12 = (_UITextLayoutController *)objc_claimAutoreleasedReturnValue();
  v13 = self->_textLayoutController;
  self->_textLayoutController = v12;

  objc_storeStrong((id *)&self->_textContainer, a3);
  -[_UITextLayoutController textStorage](self->_textLayoutController, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView _assignTextStorageCheckingForOverrides:]((uint64_t)self, v14);

  if (v5)
  {
    objc_msgSend(obj, "textLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[UITextView _createTextEmphasisBackgroundViewIfNeeded](self, "_createTextEmphasisBackgroundViewIfNeeded");
  }
LABEL_14:
  containerView = self->_containerView;
  if (containerView)
  {
    if (v5 && (v28 = _UITextViewAllowSelectionContainerInTextLayoutCanvas(), containerView = self->_containerView, v28))
    {
      -[_UITextContainerView setSelectionContainerView:](containerView, "setSelectionContainerView:", self->_selectionContainerView);
      -[UITextView _createTextEmphasisBackgroundViewIfNeeded](self, "_createTextEmphasisBackgroundViewIfNeeded");
      v29 = self->_textEmphasisBackgroundView;
    }
    else
    {
      -[_UITextContainerView setSelectionContainerView:](containerView, "setSelectionContainerView:", 0);
      v29 = 0;
    }
    -[_UITextContainerView setTextEmphasisBackgroundView:withTextView:](self->_containerView, "setTextEmphasisBackgroundView:withTextView:", v29, self);
  }
  objc_opt_self();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextStorage _setIntentResolver:](self->_textStorage, "_setIntentResolver:", v30);

}

+ (id)_defaultTextColor
{
  void *v2;
  void *v3;
  void *v4;

  +[_UITextAttributeDefaults _unspecifiedDefaults](_UITextAttributeDefaults, "_unspecifiedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_currentPreferredMaxLayoutWidth
{
  double result;

  if ((*(_BYTE *)&self->_tvFlags & 8) != 0)
    return self->_preferredMaxLayoutWidth;
  result = 0.0;
  if ((*(_QWORD *)&self->super.super._viewFlags & 0x4000000000000) == 0)
    return self->_preferredMaxLayoutWidth;
  return result;
}

- (BOOL)_isInteractiveTextSelectionDisabled
{
  if ((*(_BYTE *)&self->_tvFlags & 0x10) != 0)
    return 1;
  if (-[UITextView isSelectable](self, "isSelectable"))
    return 0;
  return -[UITextView _delegatesAllowingLinkInteraction](self, "_delegatesAllowingLinkInteraction");
}

- (BOOL)isSelectable
{
  return (*(_BYTE *)&self->_tvFlags >> 5) & 1;
}

- (BOOL)resignFirstResponder
{
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags;
  UITextView *v4;
  UITextView *v5;
  _BOOL4 v6;
  objc_super v8;

  tvFlags = self->_tvFlags;
  if ((*(_BYTE *)&tvFlags & 4) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(unint64_t *)&tvFlags | 4);
    v4 = self;
    v5 = v4;
    if (!v4->_textFormattingShouldSkipHidingOnResignFirstResponder)
    {
      v4->_textFormattingShouldSkipRestoringFirstResponderWhenFinished = 1;
      -[UITextView _prepareForTextFormattingRestorationIfNeeded](v4, "_prepareForTextFormattingRestorationIfNeeded");
      -[UITextView _hideTextFormattingOptions:](v5, "_hideTextFormattingOptions:", 0);
    }
    v5->_textFormattingShouldSkipHidingOnResignFirstResponder = 0;
    v8.receiver = v5;
    v8.super_class = (Class)UITextView;
    v6 = -[UIResponder resignFirstResponder](&v8, sel_resignFirstResponder);
    if (v6)
      -[UITextView _cleanUpForResignFirstResponder]((id *)&v5->super.super.super.super.isa);
    *(_QWORD *)&self->_tvFlags &= ~4uLL;

  }
  return v6;
}

id __24__UITextView_setBounds___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UITextView;
  return objc_msgSendSuper2(&v2, sel_setBounds_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (unint64_t)_totalNumberOfTextViewsInLayoutManager
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UITextLayoutController textContainers](self->_textLayoutController, "textContainers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "textView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          ++v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_resetDataDetectorsResults
{
  id v3;

  if (sDataDetectorsUIFrameworkLoaded == 1)
  {
    objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetResultsForContainer:", self);

  }
}

- (void)_stopSuppressingKeyboardForTextFormatting:(id)a3
{
  id textFormattingKeyboardSuppressionAssertion;

  textFormattingKeyboardSuppressionAssertion = self->_textFormattingKeyboardSuppressionAssertion;
  self->_textFormattingKeyboardSuppressionAssertion = 0;

}

- (void)_dismissTextFormattingControllerIfNeededWithAnimation:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UITextView _isTextFormattingControllerPresented](self, "_isTextFormattingControllerPresented"))
  {
    -[UIViewController dismissViewControllerAnimated:completion:](self->_textFormattingViewController, "dismissViewControllerAnimated:completion:", v3, 0);
  }
  else if (self->_textFormattingViewController)
  {
    -[UITextView _textFormattingDidDisappear:](self, "_textFormattingDidDisappear:");
  }
  -[UITextView _stopSuppressingKeyboardForTextFormatting:](self, "_stopSuppressingKeyboardForTextFormatting:", 0);
}

- (id)_newTextContainer
{
  id v3;
  double v4;

  v3 = objc_alloc((Class)off_1E1679D30);
  -[UIView bounds](self, "bounds");
  return (id)objc_msgSend(v3, "initWithSize:", v4, 1.79769313e308);
}

- (BOOL)isEditable
{
  return (*(_BYTE *)&self->_tvFlags >> 1) & 1;
}

- (BOOL)isEditing
{
  _BOOL4 v3;

  v3 = -[UIView isFirstResponder](self, "isFirstResponder");
  if (v3)
    LOBYTE(v3) = -[UITextView isEditable](self, "isEditable");
  return v3;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITextView;
  -[UIView tintColorDidChange](&v10, sel_tintColorDidChange);
  -[UITextView _textInputTraits](self, "_textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setColorsToMatchTintColor:", v4);

  if (-[UITextView isEditing](self, "isEditing"))
  {
    v5 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "traitCollectionDidChange");
    else
      objc_msgSend(v6, "updateRenderConfigForCurrentResponder");

    -[UITextView updateSelection](self, "updateSelection");
  }
  if (!self->_linkTextAttributes
    && (-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager") & 1) == 0)
  {
    -[UIView tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((objc_msgSend(v8, "isEqual:", self->_cachedTintColor) & 1) == 0)
      {
        objc_storeStrong((id *)&self->_cachedTintColor, v9);
        -[UITextView _invalidateLayoutForLinkAttributesChange:](self, "_invalidateLayoutForLinkAttributesChange:", 1);
      }
    }

  }
}

- (void)_invalidateLayoutForLinkAttributesChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[UITextView _shouldInvalidateLayoutForLinkAttributesChange](self, "_shouldInvalidateLayoutForLinkAttributesChange"))
  {
    -[_UITextLayoutController documentRange](self->_textLayoutController, "documentRange");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager") & 1) == 0)
    {
      -[_UITextContainerView canvasView](self->_containerView, "canvasView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLayoutFragmentViewsNeedDisplay:", v3);

    }
    -[_UITextLayoutController invalidateLayoutForRange:](self->_textLayoutController, "invalidateLayoutForRange:", v6);
    if (-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager"))-[_UITextContainerView setNeedsDisplay](self->_containerView, "setNeedsDisplay");

  }
}

- (BOOL)_shouldInvalidateLayoutForLinkAttributesChange
{
  void *v3;
  NSTextStorage *textStorage;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[_UITextLayoutController documentRange](self->_textLayoutController, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if ((objc_msgSend(v3, "isEmpty") & 1) == 0)
  {
    textStorage = self->_textStorage;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke;
    v7[3] = &unk_1E16B7418;
    v7[4] = &v8;
    -[NSTextStorage coordinateReading:](textStorage, "coordinateReading:", v7);
  }
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
  {
    -[UITextView _textInputTraits](self, "_textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    -[UITextView forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_textInputTraits
{
  UITextInputController **p_inputController;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  UITextInputTraits *v9;
  UITextInputTraits *textInputTraits;
  UITextInputTraits *v11;
  UITextInputTraits *v12;

  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v5 = objc_opt_respondsToSelector();

  v6 = objc_loadWeakRetained((id *)p_inputController);
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "_textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    if (v7)
    {
      v9 = (UITextInputTraits *)objc_loadWeakRetained((id *)p_inputController);
    }
    else
    {
      textInputTraits = self->_textInputTraits;
      if (!textInputTraits)
      {
        +[UITextInputTraits defaultTextInputTraits](UITextInputTraits, "defaultTextInputTraits");
        v11 = (UITextInputTraits *)objc_claimAutoreleasedReturnValue();
        v12 = self->_textInputTraits;
        self->_textInputTraits = v11;

        textInputTraits = self->_textInputTraits;
      }
      v9 = textInputTraits;
    }
    v8 = v9;
  }
  return v8;
}

- (CGRect)_rectForScrollToVisible:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  _UITextLayoutController *textLayoutController;
  double v15;
  double x;
  double y;
  double width;
  double height;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
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
  double v36;
  CGRect v37;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[UITextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    if (!length)
    {
      if (location >= v7)
      {
        length = 1;
      }
      else
      {
        -[UITextView textStorage](self, "textStorage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        location = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", location);
        length = v10;

      }
    }
    if (length + location >= v7)
    {
      -[UITextView textStorage](self, "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      location = objc_msgSend(v12, "rangeOfComposedCharacterSequenceAtIndex:", v7 - 1);
      length = v13;

    }
  }
  else
  {
    location = 0;
    length = 0;
  }
  textLayoutController = self->_textLayoutController;
  -[UITextView _adjustedTextContainerInset]((double *)self);
  -[_UITextLayoutController unionRectForCharacterRange:bottomInset:](textLayoutController, "unionRectForCharacterRange:bottomInset:", location, length, v15);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  if (CGRectIsNull(v37))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (width <= 0.0)
    width = 1.0;
  -[NSTextContainer textContainerOrigin](self->_textContainer, "textContainerOrigin");
  v21 = x + v20;
  v23 = y + v22;
  -[NSTextContainer textView](self->_textContainer, "textView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v24, v21, v23, width, height);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v33 = v26;
  v34 = v28;
  v35 = v30;
  v36 = v32;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (double)_adjustedTextContainerInset
{
  double v2;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "textContainerInset");
  return fmax(v2, a1[294]);
}

- (UIEdgeInsets)textContainerInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_unadjustedTextContainerInset.top;
  left = self->_unadjustedTextContainerInset.left;
  bottom = self->_unadjustedTextContainerInset.bottom;
  right = self->_unadjustedTextContainerInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)_containerSizeForBoundsSize:(CGSize)a3 allowingOverflow:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[_UITextContainerView textContainerInset](self->_containerView, "textContainerInset");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = 1.79769313e308;
  if (width <= 1.79769313e308)
    v17 = width;
  else
    v17 = 1.79769313e308;
  if (height <= 1.79769313e308)
    v16 = height;
  -[UIView convertSize:toView:](self, "convertSize:toView:", self->_containerView, v17, v16);
  v20 = v18;
  v21 = v19;
  if (v4)
  {
    if (v18 == 0.0 || -[_UITextContainerView layoutOrientation](self->_containerView, "layoutOrientation") == 1)
    {
      v21 = v21 - (v9 + v13);
      v20 = 1.79769313e308;
    }
    if (v21 == 0.0 || !-[_UITextContainerView layoutOrientation](self->_containerView, "layoutOrientation"))
    {
      v20 = v20 - (v11 + v15);
      v21 = 1.79769313e308;
    }
  }
  else
  {
    v20 = v18 - (v11 + v15);
    v21 = v19 - (v9 + v13);
  }
  if (v20 < 1.79769313e308)
    v20 = v20 + fabs(self->_horizontalTextContainerGeometryAdjustment);
  v22 = 0.0;
  if (v21 >= 0.0)
    v23 = v21;
  else
    v23 = 0.0;
  if (v20 >= 0.0)
    v22 = v20;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UITextView;
  -[UIView _prepareForFirstIntrinsicContentSizeCalculation](&v2, sel__prepareForFirstIntrinsicContentSizeCalculation);
}

- (double)_multilineContextWidth
{
  return self->_multilineContextWidth;
}

- (UITextInputDelegate)inputDelegate
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputDelegate *)v3;
}

- (int64_t)textDragOptions
{
  return self->_textDragOptions;
}

- (id)_textGeometry
{
  return self->_geometry;
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

- (BOOL)_mightHaveInteractableItems
{
  return 1;
}

- (UITextRange)selectedTextRange
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextRange *)v3;
}

- (UITextRange)markedTextRange
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextRange *)v3;
}

- (UIView)textInputView
{
  return (UIView *)self->_containerView;
}

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  return 0;
}

void __22__UITextView_setFont___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "length");
  v4 = *(_QWORD *)off_1E1678D90;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "addAttribute:value:range:", v4, *(_QWORD *)(a1 + 40), 0, v3);
  else
    objc_msgSend(v5, "removeAttribute:range:", v4, 0, v3);

}

void __28__UITextView__setTextColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)off_1E1678D98;
  v5 = a2;
  v4 = objc_msgSend(v5, "length");
  if (v2)
    objc_msgSend(v5, "addAttribute:value:range:", v3, v2, 0, v4);
  else
    objc_msgSend(v5, "removeAttribute:range:", v3, 0, v4);

}

- (void)_updateSelectionGestures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[UITextView isSelectable](self, "isSelectable"))
  {
    if (-[UITextView isTextDragActive](self, "isTextDragActive")
      || -[UITextView isTextDropActive](self, "isTextDropActive"))
    {
      if (-[UIView isFirstResponder](self, "isFirstResponder"))
      {
        -[UITextView interactionAssistant](self, "interactionAssistant");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "deactivateSelection");

      }
      -[UITextView interactionAssistant](self, "interactionAssistant");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clearGestureRecognizers:", 1);

      -[UITextView interactionAssistant](self, "interactionAssistant");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_editMenuAssistant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hideSelectionCommands");

    }
    else
    {
      if (-[UIView isFirstResponder](self, "isFirstResponder"))
      {
        -[UITextView interactionAssistant](self, "interactionAssistant");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "activateSelection");

      }
      -[UITextView interactionAssistant](self, "interactionAssistant");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGestureRecognizers");
    }
  }
  else
  {
    -[UITextView interactionAssistant](self, "interactionAssistant");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearGestureRecognizers:", 1);
  }

}

- (BOOL)isTextDragActive
{
  return -[UITextDragDropSupport isDragActive](self->_textDragDropSupport, "isDragActive");
}

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  double top;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v21;

  right = textContainerInset.right;
  bottom = textContainerInset.bottom;
  left = textContainerInset.left;
  top = textContainerInset.top;
  self->_unadjustedTextContainerInset = textContainerInset;
  if (-[UITextView _freezeTextContainerSize](self, "_freezeTextContainerSize"))
  {
    self->_duringFreezingTextContainerInset.top = top;
    self->_duringFreezingTextContainerInset.left = left;
    self->_duringFreezingTextContainerInset.bottom = bottom;
    self->_duringFreezingTextContainerInset.right = right;
  }
  else
  {
    if (self->_scrollPosition)
    {
      v8 = fmax(top, self->_textContainerInsetAdjustment.top);
      -[_UITextContainerView textContainerInset](self->_containerView, "textContainerInset");
      self->_offsetFromScrollPosition = self->_offsetFromScrollPosition + v9 - v8;
    }
    -[_UITextContainerView textContainer](self->_containerView, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v12 = v11;
    v14 = v13;

    -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
    -[_UITextContainerView textContainer](self->_containerView, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    v19 = v18;

    if (v12 != v17 || v14 != v19)
      -[UITextView _invalidateContainerViewSize](self, "_invalidateContainerViewSize");
    if ((*(_BYTE *)&self->_tvFlags & 0x20) != 0)
    {
      -[UITextView interactionAssistant](self, "interactionAssistant");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNeedsSelectionDisplayUpdate");

    }
  }
}

- (id)selectionContainerView
{
  void *v3;
  UIView *v4;
  UIView *v5;
  UIView *selectionContainerView;
  void *v7;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    if (self)
    {
      -[UITextView _existingSelectionContainerView]((id *)&self->super.super.super.super.isa);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        v4 = [UIView alloc];
        v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        selectionContainerView = self->_selectionContainerView;
        self->_selectionContainerView = v5;

        -[UITextView _placeSelectionContainerView]((id *)&self->super.super.super.super.isa);
      }
    }
    -[UITextView _existingSelectionContainerView]((id *)&self->super.super.super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextView textInputView](self, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  -[UIScrollView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[UITextView _setNeedsTextLayout](self, "_setNeedsTextLayout");
}

- (void)_setNeedsTextLayout
{
  UITextView *v3;

  -[UIView superview](self->_layoutView, "superview");
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();

  if (v3 != self)
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_layoutView, 0);
  -[UIView setNeedsLayout](self->_layoutView, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  -[UIScrollView layoutSubviews](&v3, sel_layoutSubviews);
  -[UITextView _layoutText](self, "_layoutText");
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](self->_selectionContainerView, "setFrame:");
  -[_UITextViewSearchableObject layoutManagedSubviews](self->_searchableObject, "layoutManagedSubviews");
}

- (void)updateSelection
{
  id v2;

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsSelectionDisplayUpdate");

}

- (UITextInteractionAssistant)interactionAssistant
{
  return self->_interactionAssistant;
}

- (void)_layoutText
{
  $CAC7BB7223AC380D8D33E5BCBA12464E *p_tvFlags;

  p_tvFlags = &self->_tvFlags;
  if ((*((_BYTE *)&self->_tvFlags + 1) & 1) != 0)
  {
    -[_UITextContainerView sizeToFit](self->_containerView, "sizeToFit");
    *(_QWORD *)&self->_tvFlags &= ~0x100uLL;
  }
  -[UITextView _resyncContainerFrameForNonAutolayout](self, "_resyncContainerFrameForNonAutolayout");
  if ((*((_BYTE *)p_tvFlags + 1) & 2) == 0)
    -[UITextView _scrollToSelectionIfNeeded](self, "_scrollToSelectionIfNeeded");
  -[UITextView _layoutPlaceholder](self, "_layoutPlaceholder");
  if ((-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager") & 1) == 0)
    -[UITextView updateSelection](self, "updateSelection");
}

- (void)_scrollToSelectionIfNeeded
{
  double v3;
  double v4;

  if ((*(_BYTE *)&self->_tvFlags & 1) != 0)
  {
    if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled")
      && -[UITextView isEditing](self, "isEditing")
      && -[UITextView _isSelectionVisible](self, "_isSelectionVisible"))
    {
      -[UIScrollView _contentOffsetAnimationDuration](self, "_contentOffsetAnimationDuration");
      v4 = v3;
      -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", 0.1);
      -[UITextView scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
      -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v4);
    }
    else if (-[UITextView _shouldScrollEnclosingScrollView](self, "_shouldScrollEnclosingScrollView"))
    {
      -[UITextView _scrollSelectionToVisibleInContainingScrollView](self, "_scrollSelectionToVisibleInContainingScrollView");
    }
    *(_QWORD *)&self->_tvFlags &= ~1uLL;
  }
}

- (void)_layoutPlaceholder
{
  UILabel *placeholderLabel;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double horizontalTextContainerGeometryAdjustment;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t rect;
  CGFloat recta;
  double v46;
  CGRect v47;

  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel && !-[UIView isHidden](placeholderLabel, "isHidden"))
  {
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", self->_placeholderLabel);
    -[UITextView textLayoutController](self, "textLayoutController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extraLineFragmentRect");
    v6 = v5;
    v8 = v7;
    rect = v9;
    v11 = v10;

    -[UITextView font](self, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ascender");
    v14 = v8 + v13;

    -[UITextView textContainerInset](self, "textContainerInset");
    v46 = v14 + fmax(v15, self->_textContainerInsetAdjustment.top);
    -[UITextView textContainerInset](self, "textContainerInset");
    v17 = fmax(v16, self->_textContainerInsetAdjustment.top);
    v19 = fmax(v18, self->_textContainerInsetAdjustment.left);
    v21 = fmax(v20, self->_textContainerInsetAdjustment.bottom);
    v23 = fmax(v22, self->_textContainerInsetAdjustment.right);
    if (self->_horizontalTextContainerGeometryAdjustment >= 0.0)
      horizontalTextContainerGeometryAdjustment = v19;
    else
      horizontalTextContainerGeometryAdjustment = self->_horizontalTextContainerGeometryAdjustment;
    -[UITextView textContainer](self, "textContainer", rect);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lineFragmentPadding");
    v27 = horizontalTextContainerGeometryAdjustment + v26;

    -[UITextView textContainer](self, "textContainer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lineFragmentPadding");
    v30 = v23 + v29;

    v31 = v6 + v27;
    -[UITextView textContainer](self, "textContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "size");
    v34 = v33;
    v47.origin.x = v6;
    v47.origin.y = v8;
    v47.size.width = recta;
    v47.size.height = v11;
    v35 = v30 + v34 - CGRectGetMaxX(v47);

    -[UIView bounds](self, "bounds");
    v37 = v31 + v36;
    v39 = v38 - (v31 + v35);
    v41 = v40 - (v17 + v21);
    -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", v39, 0.0);
    if (v41 >= v42)
      v41 = v42;
    -[UILabel _firstBaselineOffsetFromTop](self->_placeholderLabel, "_firstBaselineOffsetFromTop");
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v37, v46 - v43, v39, v41);
  }
}

- (BOOL)isTextDropActive
{
  return -[UITextDragDropSupport isDropActive](self->_textDragDropSupport, "isDropActive");
}

- (void)_invalidateContainerViewSize
{
  *(_QWORD *)&self->_tvFlags |= 0x100uLL;
  -[UITextView _setNeedsTextLayout](self, "_setNeedsTextLayout");
}

- (void)_setTextColor:(id)a3
{
  id v4;
  NSTextStorage *textStorage;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  textStorage = self->_textStorage;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__UITextView__setTextColor___block_invoke;
  v7[3] = &unk_1E16E6408;
  v8 = v4;
  v6 = v4;
  -[NSTextStorage coordinateEditing:](textStorage, "coordinateEditing:", v7);
  -[UITextView _setTypingAttributesTextColor:](self, "_setTypingAttributesTextColor:", v6);
  -[_UITextContainerView setNeedsDisplay](self->_containerView, "setNeedsDisplay");

}

- (void)_textContainerSizeDidChange:(id)a3
{
  -[UITextView _updateContentSize](self, "_updateContentSize", a3);
  -[UITextView _updateTextFormattingControllerPresentationSource](self, "_updateTextFormattingControllerPresentationSource");
}

- (void)_updateContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  int64_t contentSizeUpdateSeqNo;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _UITextViewRestorableScrollPosition *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int64_t v27;
  double v28;
  double v29;
  double v31;
  double v32;
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
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _UITextViewRestorableScrollPosition *scrollTarget;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _UITextViewRestorableScrollPosition *WeakRetained;

  -[UIView frame](self->_containerView, "frame");
  v4 = v3;
  v6 = v5;
  v7 = -[_UITextContainerView layoutOrientation](self->_containerView, "layoutOrientation");
  if (v7 == 1)
  {
    -[_UITextViewContentPadding currentValue](self->_bottomContentPadding, "currentValue");
    v4 = v4 + v9;
  }
  else if (!v7)
  {
    -[_UITextViewContentPadding currentValue](self->_bottomContentPadding, "currentValue");
    v6 = v6 + v8;
  }
  -[UIScrollView contentSize](self, "contentSize");
  v12 = vabdd_f64(v11, v4);
  v13 = vabdd_f64(v10, v6) < 0.00000011920929 && v12 < 0.00000011920929;
  if (v13 || -[UIScrollView _isScrollingToTop](self, "_isScrollingToTop", v12))
  {
    if ((*((_BYTE *)&self->_tvFlags + 1) & 1) == 0)
      -[UITextView _updateFrameOfTrailingWhitespace:](self, "_updateFrameOfTrailingWhitespace:", v4, v6);
  }
  else
  {
    ++self->_contentSizeUpdateSeqNo;
    ++self->_scrollPositionDontRecordCount;
    contentSizeUpdateSeqNo = self->_contentSizeUpdateSeqNo;
    WeakRetained = self->_scrollPosition;
    if ((-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      -[UIScrollView contentSize](self, "contentSize");
      v15 = v16 == v4;
    }
    -[UIScrollView setContentSize:](self, "setContentSize:", v4, v6);
    -[UITextView _updateFrameOfTrailingWhitespace:](self, "_updateFrameOfTrailingWhitespace:", v4, v6);
    -[UIScrollView contentOffset](self, "contentOffset");
    v19 = v18;
    v20 = WeakRetained;
    if (WeakRetained)
    {
      v21 = -[_UITextViewRestorableScrollPosition range](WeakRetained, "range");
      -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", v21, v22);
      v20 = WeakRetained;
    }
    v23 = v17;
    v24 = v18;
    -[_UITextViewRestorableScrollPosition offsetWithinLine](v20, "offsetWithinLine");
    v26 = v24 + v25 + self->_offsetFromScrollPosition;
    v27 = self->_contentSizeUpdateSeqNo;
    if (v27 == contentSizeUpdateSeqNo)
    {
      -[UIScrollView _adjustedContentOffsetForContentOffset:](self, "_adjustedContentOffsetForContentOffset:", v23, v26);
      v23 = v28;
      v26 = v29;
      v27 = self->_contentSizeUpdateSeqNo;
      if (v27 == contentSizeUpdateSeqNo && !v15)
      {
        -[NSTextContainer textContainerOrigin](self->_textContainer, "textContainerOrigin");
        v59 = v32;
        v60 = v31;
        -[NSTextContainer textView](self->_textContainer, "textView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v33, v23, v26);
        v58 = v34;
        v36 = v35;

        -[UIView bounds](self, "bounds");
        v38 = v37;
        v40 = v39;
        v42 = v41;
        v44 = v43;
        -[NSTextContainer textView](self->_textContainer, "textView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView convertRect:toView:](self, "convertRect:toView:", v45, v38, v40, v42, v44);
        v47 = v46;
        v49 = v48;

        -[_UITextLayoutController ensureLayoutForBounds:inTextContainer:](self->_textLayoutController, "ensureLayoutForBounds:inTextContainer:", self->_textContainer, v58 - v60, v36 - v59, v47, v49);
        v27 = self->_contentSizeUpdateSeqNo;
      }
    }
    if (v27 == contentSizeUpdateSeqNo && vabdd_f64(v19, v26) >= 0.5)
    {
      -[UITextView _setContentOffsetWithoutRecordingScrollPosition:](self, "_setContentOffsetWithoutRecordingScrollPosition:", v23, v26);
      scrollTarget = self->_scrollTarget;
      if (scrollTarget)
      {
        v51 = -[_UITextViewRestorableScrollPosition range](scrollTarget, "range");
        -[UITextView _contentOffsetForScrollToVisible:](self, "_contentOffsetForScrollToVisible:", v51, v52);
        v54 = v53;
        v56 = v55;
        -[_UITextViewRestorableScrollPosition offsetWithinLine](self->_scrollTarget, "offsetWithinLine");
        -[UIScrollView _updateScrollAnimationForChangedTargetOffset:](self, "_updateScrollAnimationForChangedTargetOffset:", v54, v56 + v57);
      }
      -[_UITextLayoutController resetTextViewportLayoutControllerLayoutForPosition:](self->_textLayoutController, "resetTextViewportLayoutControllerLayoutForPosition:", 0, *(_QWORD *)&v58);
      --self->_scrollPositionDontRecordCount;

      WeakRetained = (_UITextViewRestorableScrollPosition *)objc_loadWeakRetained((id *)&self->_inputController);
      -[_UITextViewRestorableScrollPosition _selectionGeometryChanged](WeakRetained, "_selectionGeometryChanged");
    }
    else
    {
      --self->_scrollPositionDontRecordCount;
    }

  }
}

- (void)_syncTypingAttributesToTextContainerAttributesForExtraLineFragment
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextView textContainer](self, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesForExtraLineFragment");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v5 && (objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
  {
    -[UITextView textContainer](self, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributesForExtraLineFragment:", v7);

  }
}

- (_NSRange)_visibleRangeWithLayout:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _UITextLayoutController *textLayoutController;
  void *v23;
  void *v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  _NSRange result;

  v3 = a3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[NSTextContainer textView](self->_textContainer, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  textLayoutController = self->_textLayoutController;
  -[UITextView textContainer](self, "textContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutController textRangeForBounds:inTextContainer:layoutIfNeeded:](textLayoutController, "textRangeForBounds:inTextContainer:layoutIfNeeded:", v23, v3, v15, v17, v19, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:", v24);
  v27 = v26;

  v28 = v25;
  v29 = v27;
  result.length = v29;
  result.location = v28;
  return result;
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (BOOL)_documentRangeEqualToViewportRange
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;

  -[_UITextLayoutController viewportRangeForTextContainer:](self->_textLayoutController, "viewportRangeForTextContainer:", self->_textContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutController documentRange](self->_textLayoutController, "documentRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v6 = v4;
    v7 = v6;
    if (v5 == v6)
    {
      v8 = 1;
    }
    else if (v6)
    {
      v8 = objc_msgSend(v5, "isEqual:", v6);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateFrameOfTrailingWhitespace:(CGSize)a3
{
  double height;
  CGFloat width;
  CGFloat x;
  CGFloat v7;
  CGFloat MaxY;
  CGFloat MinX;
  CGSize v10;
  CGRect v11;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  if (-[NSTextStorage length](self->_textStorage, "length"))
  {
    -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", -[NSTextStorage length](self->_textStorage, "length"), 0);
    x = v11.origin.x;
    v7 = v11.size.height;
    MaxY = CGRectGetMaxY(v11);
    v12.origin.x = x;
    v12.origin.y = MaxY;
    v12.size.width = width;
    v12.size.height = v7;
    MinX = CGRectGetMinX(v12);
    self->_frameOfTrailingWhitespace.origin.x = x;
    self->_frameOfTrailingWhitespace.origin.y = MaxY;
    self->_frameOfTrailingWhitespace.size.width = width;
    self->_frameOfTrailingWhitespace.size.height = height - MinX;
  }
  else
  {
    v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_frameOfTrailingWhitespace.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_frameOfTrailingWhitespace.size = v10;
  }
}

- (void)_disableTiledViews
{
  -[_UITextLayoutController setUsesTiledViews:](self->_textLayoutController, "setUsesTiledViews:", 0);
}

- (void)setAttributedPlaceholder:(id)a3
{
  id v5;
  UILabel *placeholderLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (self->_overriddenPlaceholder)
  {
    objc_storeStrong((id *)&self->_overriddenPlaceholder, a3);
  }
  else
  {
    placeholderLabel = self->_placeholderLabel;
    if (!placeholderLabel)
    {
      v7 = [UILabel alloc];
      v8 = -[UILabel initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v9 = self->_placeholderLabel;
      self->_placeholderLabel = v8;

      -[UITextView font](self, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_placeholderLabel, "setFont:", v10);

      +[UIColor systemGrayColor](UIColor, "systemGrayColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_placeholderLabel, "setTextColor:", v11);

      -[UILabel setNumberOfLines:](self->_placeholderLabel, "setNumberOfLines:", 0);
      -[UILabel setAdjustsFontForContentSizeCategory:](self->_placeholderLabel, "setAdjustsFontForContentSizeCategory:", -[UITextView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
      -[UITextView _contentView](self, "_contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_placeholderLabel);

      v5 = v13;
      placeholderLabel = self->_placeholderLabel;
    }
    -[UILabel setAttributedText:](placeholderLabel, "setAttributedText:", v5);
    -[UITextView _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  }

}

- (void)_updatePlaceholderVisibility
{
  UILabel *placeholderLabel;
  _BOOL4 v4;
  void *v5;

  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    v4 = -[UIView isHidden](placeholderLabel, "isHidden");
    -[UITextView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setHidden:](self->_placeholderLabel, "setHidden:", objc_msgSend(v5, "length") != 0);

    if (v4 && !-[UIView isHidden](self->_placeholderLabel, "isHidden"))
      -[UITextView _setNeedsTextLayout](self, "_setNeedsTextLayout");
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UITextView;
  -[UIScrollView traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (!v4 || v5[13] != v4[13] || v5[15] != v4[15]))
    -[UITextView _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", objc_msgSend(v5, "legibilityWeight") != objc_msgSend(v4, "legibilityWeight"));
  objc_msgSend(v6, "typesettingLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typesettingLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    -[UITextView _adjustFontForTypesettingLanguage](self, "_adjustFontForTypesettingLanguage");
  v10 = objc_msgSend(v6, "userInterfaceStyle");
  if (v10 != objc_msgSend(v4, "userInterfaceStyle"))
  {
    -[UITextView _updateTextEffectsConfigurationIfNeeded](self, "_updateTextEffectsConfigurationIfNeeded");
    v11 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      objc_msgSend(v12, "traitCollectionDidChange");
    else
      objc_msgSend(v12, "updateRenderConfigForCurrentResponder");

  }
}

- (void)_adjustFontForTypesettingLanguage
{
  void *v3;
  void *v4;
  void *v5;
  const __CTFont *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id WeakRetained;
  NSTextStorage *textStorage;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  -[UITextView text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView _resolvedTypesettingLanguage:](self, "_resolvedTypesettingLanguage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView font](self, "font");
  v6 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  -[UIFont _fontAdjustedForTypesettingLanguage:](v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[UITextView font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (v8 && v7)
  {
    -[UITextView font](self, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqual:", v7) ^ 1;

  }
  v23 = v9;
  if (*((_BYTE *)v21 + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(WeakRetained, "_addToTypingAttributes:value:", *(_QWORD *)off_1E1678D90, v7);

    -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](self, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
  }
  textStorage = self->_textStorage;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __47__UITextView__adjustFontForTypesettingLanguage__block_invoke;
  v17 = &unk_1E16E6430;
  v13 = v4;
  v18 = v13;
  v19 = &v20;
  -[NSTextStorage coordinateEditing:](textStorage, "coordinateEditing:", &v14);
  if (*((_BYTE *)v21 + 24))
    -[UITextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v14, v15, v16, v17);

  _Block_object_dispose(&v20, 8);
}

- (void)setFont:(UIFont *)font
{
  UIFont *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSTextStorage *textStorage;
  UIFont *v14;
  id v15;
  id WeakRetained;
  id v17;
  id v18;
  void *v19;
  char v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _QWORD v43[4];
  UIFont *v44;
  id v45;

  v4 = font;
  if (-[UIView _shouldNotifyGeometryObserversForBaselineChanges](self, "_shouldNotifyGeometryObserversForBaselineChanges")|| (*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
  {
    -[UITextView font](self, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  -[UITextView text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView _resolvedTypesettingLanguage:](self, "_resolvedTypesettingLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIFont _fontAdjustedForTypesettingLanguage:]((CTFontRef)v4, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v4;
  v12 = v11;

  textStorage = self->_textStorage;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __22__UITextView_setFont___block_invoke;
  v43[3] = &unk_1E16B6830;
  v14 = v4;
  v44 = v14;
  v15 = v12;
  v45 = v15;
  -[NSTextStorage coordinateEditing:](textStorage, "coordinateEditing:", v43);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "_addToTypingAttributes:value:", *(_QWORD *)off_1E1678D90, v14);

  -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](self, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
  v17 = v15;
  v18 = v6;
  v19 = v18;
  if (v17 == v18)
  {

  }
  else
  {
    if (v18 && v17)
    {
      v20 = objc_msgSend(v17, "isEqual:", v18);

      if ((v20 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

    }
    self->_textContainerInsetAdjustment.top = -[UITextView _applicableContentOutsetsFromFonts](self);
    self->_textContainerInsetAdjustment.left = v21;
    self->_textContainerInsetAdjustment.bottom = v22;
    self->_textContainerInsetAdjustment.right = v23;
    -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
    if (v5)
    {
      if (!-[UIView _wantsAutolayout](self, "_wantsAutolayout")
        && (*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
      {
        self->_lastBaselineOffsetFromBottom = 0.0;
        self->_firstBaselineOffsetFromTop = 0.0;
      }
      if (-[UIView _shouldNotifyGeometryObserversForBaselineChanges](self, "_shouldNotifyGeometryObserversForBaselineChanges"))
      {
        v42 = 0;
        v41 = 0u;
        v40 = 0u;
        v39 = 0u;
        v38 = 0u;
        v37 = 0u;
        v36 = 0u;
        v35 = 0u;
        v34 = 0u;
        v33 = 0u;
        v32 = 0u;
        v31 = 0u;
        v30 = 0u;
        v29 = 0u;
        v28 = 0u;
        v27 = 2048;
        -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v27);
      }
      if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 2) != 0)
      {
        -[UIView superview](self, "superview");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24 && (*(_QWORD *)(v24 + 104) & 0x8000000000000000) == 0)
        {
          -[UIView superview](self, "superview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setNeedsLayout");

        }
      }
    }
  }
LABEL_26:

}

- (id)_resolvedTypesettingLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITextView _wantsContentAwareTypesettingLanguage](self, "_wantsContentAwareTypesettingLanguage")
    && objc_msgSend(v4, "length")
    && (v7 = (void *)CTFontCopyTallestTextStyleLanguageForString()) != 0)
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v5, "typesettingLanguage");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v9;
  }

  return v8;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[NSTextStorage string](self->_textStorage, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (BOOL)_wantsContentAwareTypesettingLanguage
{
  return *((unsigned __int8 *)&self->_tvFlags + 1) >> 7;
}

- (double)_applicableContentOutsetsFromFonts
{
  double v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!a1)
    return 0.0;
  v2 = 0.0;
  if ((a1[269] & 0x6000) != 0 && (objc_msgSend(a1, "isScrollEnabled") & 1) == 0)
  {
    objc_msgSend(a1, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UILabel _tooBigChars]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4);

    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = (void *)a1[260];
      objc_msgSend(a1, "font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v6, v7, a1);

    }
  }
  return 0.0 - v2;
}

- (BOOL)_implementsEditMenu
{
  void *v2;
  char v3;

  -[UIScrollView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (UITextView)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
  double height;
  double width;
  double y;
  double x;
  NSTextContainer *v9;
  UITextView *v10;
  objc_super v12;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  v9 = textContainer;
  v12.receiver = self;
  v12.super_class = (Class)UITextView;
  v10 = -[UIScrollView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v10)
    -[UITextView _commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:](v10, "_commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:", v9, 0, 1, 1, 1, objc_msgSend((id)objc_opt_class(), "_isTextLayoutManagerEnabled"));

  return v10;
}

- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4 textLayoutManagerEnabled:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  UITextView *v12;
  UITextView *v13;
  objc_super v15;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UITextView;
  v12 = -[UIScrollView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    -[UITextView _commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:](v12, "_commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:", v11, 0, 0, 0, 0, v5);
    -[UITextView setScrollEnabled:](v13, "setScrollEnabled:", 0);
  }

  return v13;
}

+ (BOOL)_isTextLayoutManagerEnabled
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if ((_os_feature_enabled_impl() & 1) != 0 || (v2 = dyld_program_sdk_at_least()) != 0)
      LOBYTE(v2) = 1;
  }
  return v2;
}

- (BOOL)_wantsBaselineUpdatingFollowingConstraintsPass
{
  if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) != 0)
    return !-[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  else
    return 0;
}

- (void)_updateSelectableInteractions
{
  UITextInteractionAssistant *interactionAssistant;
  void *v4;
  UITextInputTraits *v5;
  UITextInteractionAssistant *v6;
  UITextInteractionAssistant *v7;
  void *v8;
  UITextInputTraits *v9;
  void *textInputTraits;
  id WeakRetained;
  UITextInteractionAssistant *v12;
  UITextInteractionAssistant *v13;
  UITextInteractionAssistant *v14;
  void *v15;

  interactionAssistant = self->_interactionAssistant;
  if (interactionAssistant)
    -[UITextInteractionAssistant clearGestureRecognizers:](interactionAssistant, "clearGestureRecognizers:", 0);
  if ((*(_BYTE *)&self->_tvFlags & 0x20) != 0)
  {
    v6 = -[UITextInteractionAssistant initWithView:]([UITextInteractionAssistant alloc], "initWithView:", self);
    v7 = self->_interactionAssistant;
    self->_interactionAssistant = v6;

    -[UITextView tokenizer](self, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[UITextInputTraits defaultTextInputTraits](UITextInputTraits, "defaultTextInputTraits");
      v9 = (UITextInputTraits *)objc_claimAutoreleasedReturnValue();
      textInputTraits = self->_textInputTraits;
      self->_textInputTraits = v9;
    }
    else
    {
      -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_inputController, v15);

      textInputTraits = objc_loadWeakRetained((id *)&self->_inputController);
      objc_msgSend(textInputTraits, "setDelegate:", self);
    }

  }
  else
  {
    -[UITextView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("editable"));
    *(_QWORD *)&self->_tvFlags &= ~2uLL;
    -[UITextView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("editable"));
    -[UITextView tokenizer](self, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = self->_textInputTraits;
      self->_textInputTraits = 0;

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
      objc_msgSend(WeakRetained, "setDelegate:", 0);

      objc_storeWeak((id *)&self->_inputController, 0);
    }
    if (!-[UITextView _delegatesAllowingLinkInteraction](self, "_delegatesAllowingLinkInteraction"))
    {
      v14 = self->_interactionAssistant;
      self->_interactionAssistant = 0;

      return;
    }
    v12 = -[UITextInteractionAssistant initWithView:textInteractionMode:]([UITextInteractionAssistant alloc], "initWithView:textInteractionMode:", self, 1002);
    v13 = self->_interactionAssistant;
    self->_interactionAssistant = v12;

  }
  -[UITextInteractionAssistant setGestureRecognizers](self->_interactionAssistant, "setGestureRecognizers");
}

- (UITextInputTokenizer)tokenizer
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "tokenizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputTokenizer *)v3;
}

- (void)setLinkTextAttributes:(NSDictionary *)linkTextAttributes
{
  NSDictionary *v4;
  NSDictionary *v5;

  v4 = (NSDictionary *)-[NSDictionary copy](linkTextAttributes, "copy");
  v5 = self->_linkTextAttributes;
  self->_linkTextAttributes = v4;

  -[UITextView _invalidateLayoutForLinkAttributesChange:](self, "_invalidateLayoutForLinkAttributesChange:", 0);
}

- (UITextView)initWithFrame:(CGRect)a3
{
  return -[UITextView initWithFrame:textContainer:](self, "initWithFrame:textContainer:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  if (dyld_program_sdk_at_least())
    -[UIView setContentMode:](self->_containerView, "setContentMode:", a3);
  v5.receiver = self;
  v5.super_class = (Class)UITextView;
  -[UIView setContentMode:](&v5, sel_setContentMode_, a3);
}

- (void)_updateBaselineInformationDependentOnBounds
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  double firstBaselineOffsetFromTop;
  double lastBaselineOffsetFromBottom;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;

  -[UITextView textLayoutController](self, "textLayoutController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "documentRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEmpty") & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v14, "textContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
    goto LABEL_7;
  v6 = -[UIView _wantsAutolayout](self, "_wantsAutolayout");
  if (!v6)
  {
    v3 = 0;
    goto LABEL_9;
  }
  -[UIView _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_9:
    _UIBaselineLayoutBoundsConsultingContentSizeConstraints(self);
    firstBaselineOffsetFromTop = self->_firstBaselineOffsetFromTop;
    lastBaselineOffsetFromBottom = self->_lastBaselineOffsetFromBottom;
    -[UITextView _baselineOffsetsAtSize:](self, "_baselineOffsetsAtSize:", v9, v10);
    if (firstBaselineOffsetFromTop != v11 || lastBaselineOffsetFromBottom != v12)
    {
      self->_firstBaselineOffsetFromTop = v11;
      self->_lastBaselineOffsetFromBottom = v12;
      if (v6)
        -[UIView _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
    }
  }
LABEL_2:

LABEL_7:
}

- (_UITextLayoutController)textLayoutController
{
  return self->_textLayoutController;
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UITextView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (BOOL)_shouldStartDataDetectors
{
  return -[UITextView dataDetectorTypes](self, "dataDetectorTypes")
      && !-[UITextView isEditable](self, "isEditable")
      && -[UITextView isSelectable](self, "isSelectable");
}

- (UIDataDetectorTypes)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (CGRect)visibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[UITextView visibleRectIgnoringKeyboard](self, "visibleRectIgnoringKeyboard");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[UITextView isEditing](self, "isEditing"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtractKeyboardFrameFromRect:inView:", self, v4, v6, v8, v10);
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;

  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)_updateTextFormattingControllerPresentationSource
{
  uint64_t v3;
  void *v4;
  UITextView *v5;
  UITextFormattingViewController *textFormattingViewController;
  void *v7;
  UITextView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MidY;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat MidX;
  void *v44;
  double v45;
  UITextView *v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  -[UIView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (UITextView *)v3;
  else
    v5 = self;
  v46 = v5;

  textFormattingViewController = self->_textFormattingViewController;
  if (!textFormattingViewController
    || -[UIViewController isBeingDismissed](textFormattingViewController, "isBeingDismissed"))
  {
    goto LABEL_23;
  }
  -[UIViewController popoverPresentationController](self->_textFormattingViewController, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceView");
  v8 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if (v8 != v46)
  {
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  -[UIViewController popoverPresentationController](self->_textFormattingViewController, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceRect");
  if (!CGRectEqualToRect(v47, *MEMORY[0x1E0C9D628]))
  {

    v8 = v46;
    goto LABEL_21;
  }
  v10 = -[UITextView selectedRange](self, "selectedRange");
  v12 = v10 + v11;
  -[UITextView textStorage](self, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v12 <= v14)
  {
    -[UIViewController preferredContentSize](self->_textFormattingViewController, "preferredContentSize");
    v16 = v15;
    v18 = v17;
    -[UIResponder _textInteraction](self, "_textInteraction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assistantDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_editMenuAssistant");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_editMenuTargetRect");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[UIView convertRect:toView:](self, "convertRect:toView:", v46, v23, v25, v27, v29);
    v31 = v30;
    MidY = v32;
    v35 = v34;
    v37 = v36;
    -[UIView window](self, "window");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v40 = v39;
    v42 = v41;

    if (v40 - v35 + -40.0 < v16 && v42 - v37 + -40.0 < v18)
    {
      v48.origin.x = v31;
      v48.origin.y = MidY;
      v48.size.width = v35;
      v48.size.height = v37;
      MidX = CGRectGetMidX(v48);
      v49.origin.x = v31;
      v49.origin.y = MidY;
      v49.size.width = v35;
      v49.size.height = v37;
      MidY = CGRectGetMidY(v49);
      v35 = 1.0;
      v31 = MidX;
      v37 = 1.0;
    }
    if ((v31 != *MEMORY[0x1E0C9D538] || MidY != *(double *)(MEMORY[0x1E0C9D538] + 8))
      && (v35 != *MEMORY[0x1E0C9D820] || v37 != *(double *)(MEMORY[0x1E0C9D820] + 8)))
    {
      -[UITextFormattingViewController configuration](self->_textFormattingViewController, "configuration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "_isTextAnimationsConfiguration"))
        v45 = -6.0;
      else
        v45 = -10.0;

      -[UIViewController popoverPresentationController](self->_textFormattingViewController, "popoverPresentationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v50.origin.x = v31;
      v50.origin.y = MidY;
      v50.size.width = v35;
      v50.size.height = v37;
      v51 = CGRectInset(v50, -10.0, v45);
      objc_msgSend(v7, "setSourceRect:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
      goto LABEL_22;
    }
  }
LABEL_23:

}

- (NSRange)selectedRange
{
  id WeakRetained;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "selectedRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (UIColor)textColor
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *(_QWORD *)off_1E1678D98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

void __47__UITextView__adjustFontForTypesettingLanguage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__UITextView__adjustFontForTypesettingLanguage__block_invoke_2;
  v8[3] = &unk_1E16B15F8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v9 = v5;
  v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, v8);

}

- (void)_setInteractiveTextSelectionDisabled:(BOOL)a3
{
  uint64_t v4;

  v4 = 16;
  if (!a3)
    v4 = 0;
  self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFFFEFLL | v4);
  if (a3 && -[UITextView isEditable](self, "isEditable"))
  {
    -[UITextView setEditable:](self, "setEditable:", 0);
  }
  else
  {
    -[UITextView resignFirstResponder](self, "resignFirstResponder");
    -[UITextView _updateSelectionGestures](self, "_updateSelectionGestures");
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  UITextInteractionAssistant *interactionAssistant;
  UIFindInteraction *findInteraction;
  objc_super v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *(_QWORD *)off_1E167E218;
  v8[1] = CFSTR("_UITextContainerViewSizeDidChange");
  v8[2] = *(_QWORD *)off_1E16791A8;
  v8[3] = CFSTR("UIKeyboardDidShowNotification");
  v8[4] = CFSTR("UIKeyboardDidChangeFrameNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  interactionAssistant = self->_interactionAssistant;
  self->_interactionAssistant = 0;

  findInteraction = self->_findInteraction;
  self->_findInteraction = 0;

  v7.receiver = self;
  v7.super_class = (Class)UITextView;
  -[UIScrollView dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_textDropDelegate);
  objc_destroyWeak((id *)&self->_textDragDelegate);
  objc_storeStrong((id *)&self->_textAssistantManager, 0);
  objc_storeStrong((id *)&self->_searchableObject, 0);
  objc_storeStrong((id *)&self->_findInteraction, 0);
  objc_storeStrong((id *)&self->_textInteractableItemCache, 0);
  objc_storeStrong((id *)&self->_customRenderController, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_destroyWeak((id *)&self->_pasteDelegate);
  objc_storeStrong((id *)&self->_textEmphasisBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_bottomContentPadding, 0);
  objc_storeStrong((id *)&self->_topContentPadding, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_textDragDropSupport, 0);
  objc_storeStrong(&self->_textFormattingKeyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_textFormattingRestorationConfiguration, 0);
  objc_storeStrong((id *)&self->_textFormattingConfiguration, 0);
  objc_storeStrong((id *)&self->_textFormattingViewController, 0);
  objc_storeStrong((id *)&self->_cuiCatalog, 0);
  objc_storeStrong((id *)&self->_intrinsicSizeCache, 0);
  objc_storeStrong((id *)&self->_siriParameters, 0);
  objc_storeStrong((id *)&self->_characterStreamingManager, 0);
  objc_storeStrong((id *)&self->_linkTextAttributes, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_activeAnimatedPlaceholder, 0);
  objc_storeStrong((id *)&self->_animatedPlaceholderSupport, 0);
  objc_storeStrong((id *)&self->_overriddenPlaceholder, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_scrollPosition, 0);
  objc_storeStrong((id *)&self->_scrollTarget, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_interactionAssistant, 0);
  objc_destroyWeak((id *)&self->_inputController);
  objc_destroyWeak(&self->_inputDelegate);
  objc_storeStrong((id *)&self->_layoutView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_cachedTintColor, 0);
}

uint64_t __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v3 = *(_QWORD *)off_1E1678EB8;
  v5 = a2;
  v4 = objc_msgSend(v5, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__UITextView__shouldInvalidateLayoutForLinkAttributesChange__block_invoke_2;
  v6[3] = &unk_1E16B6338;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v6);

}

- (void)setTextDropDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textDropDelegate, a3);
}

- (void)setTextDragDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textDragDelegate, a3);
}

- (void)setPasteDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pasteDelegate, a3);
}

- (void)setMaxTileHeight:(double)a3
{
  -[_UITextLayoutController setMaxTileHeight:](self->_textLayoutController, "setMaxTileHeight:", a3);
}

- (void)setInputAccessoryView:(UIView *)inputAccessoryView
{
  objc_setProperty_atomic(self, a2, inputAccessoryView, 2272);
}

- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled
{
  _UITextViewSearchableObject *v4;
  _UITextViewSearchableObject *searchableObject;
  UIFindInteraction *findInteraction;
  UIFindInteraction *v7;
  UIFindInteraction *v8;
  _UITextViewSearchableObject *v9;
  UIFindInteraction *v10;

  if (self->_findInteractionEnabled != findInteractionEnabled)
  {
    self->_findInteractionEnabled = findInteractionEnabled;
    if (findInteractionEnabled)
    {
      if (!self->_searchableObject)
      {
        v4 = -[_UITextViewSearchableObject initWithTextView:]([_UITextViewSearchableObject alloc], "initWithTextView:", self);
        searchableObject = self->_searchableObject;
        self->_searchableObject = v4;

      }
      findInteraction = self->_findInteraction;
      if (!findInteraction)
      {
        v7 = -[UIFindInteraction initWithSessionDelegate:]([UIFindInteraction alloc], "initWithSessionDelegate:", self);
        v8 = self->_findInteraction;
        self->_findInteraction = v7;

        findInteraction = self->_findInteraction;
      }
      -[UIView addInteraction:](self, "addInteraction:", findInteraction);
    }
    else
    {
      -[UIView removeInteraction:](self, "removeInteraction:", self->_findInteraction);
      v9 = self->_searchableObject;
      self->_searchableObject = 0;

      v10 = self->_findInteraction;
      self->_findInteraction = 0;

    }
  }
}

- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes
{
  if (self->_dataDetectorTypes != dataDetectorTypes)
  {
    self->_dataDetectorTypes = dataDetectorTypes;
    -[UITextView _resetDataDetectorsResults](self, "_resetDataDetectorsResults");
    if (-[UITextView _shouldStartDataDetectors](self, "_shouldStartDataDetectors"))
      -[UITextView _startDataDetectors](self, "_startDataDetectors");
  }
}

- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = allowsEditingTextAttributes;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "setAllowsEditingTextAttributes:", v3);

}

- (NSDictionary)linkTextAttributes
{
  NSDictionary *linkTextAttributes;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  linkTextAttributes = self->_linkTextAttributes;
  if (linkTextAttributes)
    return linkTextAttributes;
  -[UIView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UIView _normalInheritedTintColor](self, "_normalInheritedTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIView tintAdjustmentMode](self, "tintAdjustmentMode") == UIViewTintAdjustmentModeDimmed)
    {
      v10 = 0.0;
      v11 = 0.0;
      objc_msgSend(v6, "getWhite:alpha:", &v11, &v10);
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v11, v10 * 0.8);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextView.m"), 5866, CFSTR("Unable to derive tintColor!"));

      v6 = 0;
    }
  }
  v12 = *(_QWORD *)off_1E1678D98;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (id)bottomContentPadding
{
  return self->_bottomContentPadding;
}

- (void)adjustedContentInsetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  -[UIScrollView adjustedContentInsetDidChange](&v3, sel_adjustedContentInsetDidChange);
  -[UITextView _resyncContainerFrameForNonAutolayoutDeferringSizeToFit:](self, "_resyncContainerFrameForNonAutolayoutDeferringSizeToFit:", 1);
}

- (void)_textViewContentPaddingDidChange:(id)a3
{
  if (self->_bottomContentPadding == a3)
    -[UITextView _updateContentSize](self, "_updateContentSize");
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  if (-[UITextView isSelectable](self, "isSelectable", a3) && -[UIView isFirstResponder](self, "isFirstResponder"))
    *(_QWORD *)&self->_tvFlags |= 1uLL;
  if (!-[UIScrollView isScrollEnabled](self, "isScrollEnabled"))
    -[UITextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UITextView _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  -[UITextView _invalidateContainerViewSize](self, "_invalidateContainerViewSize");
  -[UITextView _updateTextFormattingController](self, "_updateTextFormattingController");
}

- (void)_startDataDetectors
{
  id v3;

  objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startURLificationForContainer:detectedTypes:", self, -[UITextView _effectiveDataDetectorTypes](self, "_effectiveDataDetectorTypes"));

}

- (void)_setAllowedTypingAttributes:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_setAllowedTypingAttributes:", v4);

}

- (id)_getDelegateZoomView
{
  _UITextContainerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITextView;
  -[UIScrollView _getDelegateZoomView](&v5, sel__getDelegateZoomView);
  v3 = (_UITextContainerView *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = self->_containerView;
  return v3;
}

- (CGRect)_frameOfTrailingWhitespace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameOfTrailingWhitespace.origin.x;
  y = self->_frameOfTrailingWhitespace.origin.y;
  width = self->_frameOfTrailingWhitespace.size.width;
  height = self->_frameOfTrailingWhitespace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)_effectiveDataDetectorTypes
{
  UIDataDetectorTypes v3;
  unint64_t result;

  v3 = -[UITextView dataDetectorTypes](self, "dataDetectorTypes");
  result = -[UITextView dataDetectorTypes](self, "dataDetectorTypes");
  if (v3 == -1)
    return result & 0x1FF;
  return result;
}

- (id)_containerView
{
  return self->_containerView;
}

- (id)_allowedTypingAttributes
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "_allowedTypingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)_intelligenceBaseClass
{
  sub_1851F9080(0, &qword_1EDD8AE00);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  id v5;
  UITextView *v6;

  v5 = a4;
  v6 = self;
  _sSo10UITextViewC5UIKitE27_intelligenceCollectContent2in9collectorySo6CGRectV_21UIIntelligenceSupport0J16ElementCollectorCtF_0((uint64_t)v5);

}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (id)largeContentTitle
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  objc_super v8;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetLargeContentTitle");

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextView;
    -[UIView largeContentTitle](&v8, sel_largeContentTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextView attributedText](self, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (id)_animatedPlaceholderSupport
{
  _UITextViewAnimatedPlaceholderSupport *animatedPlaceholderSupport;
  _UITextViewAnimatedPlaceholderSupport *v4;
  _UITextViewAnimatedPlaceholderSupport *v5;

  animatedPlaceholderSupport = self->_animatedPlaceholderSupport;
  if (!animatedPlaceholderSupport)
  {
    v4 = -[_UITextViewAnimatedPlaceholderSupport initWithTextView:]([_UITextViewAnimatedPlaceholderSupport alloc], "initWithTextView:", self);
    v5 = self->_animatedPlaceholderSupport;
    self->_animatedPlaceholderSupport = v4;

    animatedPlaceholderSupport = self->_animatedPlaceholderSupport;
  }
  return animatedPlaceholderSupport;
}

- (void)insertAnimatedTextPlaceholder
{
  id v3;

  -[UITextView endOfDocument](self, "endOfDocument");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView insertAnimatedTextPlaceholderAtLocation:numLines:](self, "insertAnimatedTextPlaceholderAtLocation:numLines:", v3, 0.0);

}

- (void)replaceAnimatedTextPlaceholderWith:(id)a3
{
  id v4;
  id v5;

  if (self->_activeAnimatedPlaceholder)
  {
    v4 = a3;
    -[UITextView _animatedPlaceholderSupport](self, "_animatedPlaceholderSupport");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replacePlaceholder:withText:", self->_activeAnimatedPlaceholder, v4);

  }
}

- (void)removeAnimatedTextPlaceholders
{
  void *v3;
  _UITextViewAnimatedPlaceholderIdentifier *activeAnimatedPlaceholder;

  if (self->_activeAnimatedPlaceholder)
  {
    -[UITextView _animatedPlaceholderSupport](self, "_animatedPlaceholderSupport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removePlaceholder:", self->_activeAnimatedPlaceholder);

    activeAnimatedPlaceholder = self->_activeAnimatedPlaceholder;
    self->_activeAnimatedPlaceholder = 0;

  }
}

- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4
{
  id v6;
  _UITextViewAnimatedPlaceholderIdentifier *v7;
  _UITextViewAnimatedPlaceholderIdentifier *activeAnimatedPlaceholder;
  id v9;

  v6 = a3;
  -[UITextView removeAnimatedTextPlaceholders](self, "removeAnimatedTextPlaceholders");
  -[UITextView _animatedPlaceholderSupport](self, "_animatedPlaceholderSupport");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertLoadingPlaceholderAtLocation:lines:", v6, a4);
  v7 = (_UITextViewAnimatedPlaceholderIdentifier *)objc_claimAutoreleasedReturnValue();

  activeAnimatedPlaceholder = self->_activeAnimatedPlaceholder;
  self->_activeAnimatedPlaceholder = v7;

}

- (id)_activityItemsConfigurationAtLocation:(CGPoint)a3
{
  UIActivityItemsConfiguration *v4;
  void *v5;
  void *v6;
  UIActivityItemsConfiguration *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = [UIActivityItemsConfiguration alloc];
  -[UITextView selectedText](self, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIActivityItemsConfiguration initWithObjects:](v4, "initWithObjects:", v6);

  return v7;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  objc_super v22;

  v4 = delegate;
  -[UIScrollView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6 = objc_opt_respondsToSelector();
    v7 = 0x1000000;
    if ((v6 & 1) == 0)
      v7 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFEFFFFFFLL | v7);
    v8 = objc_opt_respondsToSelector();
    v9 = 0x4000000;
    if ((v8 & 1) == 0)
      v9 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFBFFFFFFLL | v9);
    v10 = objc_opt_respondsToSelector();
    v11 = 0x8000000;
    if ((v10 & 1) == 0)
      v11 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFF7FFFFFFLL | v11);
    v12 = objc_opt_respondsToSelector();
    v13 = 0x10000000;
    if ((v12 & 1) == 0)
      v13 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFEFFFFFFFLL | v13);
    v14 = objc_opt_respondsToSelector();
    v15 = 0x20000000;
    if ((v14 & 1) == 0)
      v15 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFDFFFFFFFLL | v15);
    v16 = objc_opt_respondsToSelector();
    v17 = 0x40000000;
    if ((v16 & 1) == 0)
      v17 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFBFFFFFFFLL | v17);
    v18 = objc_opt_respondsToSelector();
    v19 = 0x80000000;
    if ((v18 & 1) == 0)
      v19 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFF7FFFFFFFLL | v19);
    v20 = objc_opt_respondsToSelector();
    v21 = 0x100000000;
    if ((v20 & 1) == 0)
      v21 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFEFFFFFFFFLL | v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)UITextView;
  -[UIScrollView setDelegate:](&v22, sel_setDelegate_, v4);

}

- (id)_newTextKit1LayoutControllerWithTextContainer:(id)a3 layoutManager:(id)a4 textStorage:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_UITextKit1LayoutController initWithTextView:textContainer:layoutManager:textStorage:]((id *)[_UITextKit1LayoutController alloc], self, v10, v9, v8);

  -[_UITextKit1LayoutController originalLayoutManager](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsNonContiguousLayout:", 1);

  return v11;
}

- (void)_createTextEmphasisBackgroundViewIfNeeded
{
  _UITextEmphasisBackgroundView *v3;
  _UITextEmphasisBackgroundView *textEmphasisBackgroundView;

  if (!self->_textEmphasisBackgroundView)
  {
    if (_UITextViewAllowSelectionContainerInTextLayoutCanvas())
    {
      v3 = -[_UITextEmphasisBackgroundView initWithTextView:]([_UITextEmphasisBackgroundView alloc], "initWithTextView:", self);
      textEmphasisBackgroundView = self->_textEmphasisBackgroundView;
      self->_textEmphasisBackgroundView = v3;

      -[UIView setHidden:](self->_textEmphasisBackgroundView, "setHidden:", 1);
    }
  }
}

- (void)_assignTextStorageCheckingForOverrides:(uint64_t)a1
{
  objc_class *v4;
  void (*MethodImplementation)(void);
  objc_class *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 2080), a2);
    *(_QWORD *)(a1 + 2152) &= ~0x200000000uLL;
    if ((objc_msgSend(*(id *)(a1 + 2080), "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      v4 = (objc_class *)objc_opt_class();
      MethodImplementation = class_getMethodImplementation(v4, sel_replaceCharactersInRange_withAttributedString_);
      v6 = (objc_class *)objc_opt_class();
      *(_QWORD *)(a1 + 2152) = *(_QWORD *)(a1 + 2152) & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(class_getMethodImplementation(v6, sel_replaceCharactersInRange_withAttributedString_) != MethodImplementation) << 33);
    }
  }

}

- (BOOL)_reconfigureWithLayoutManager:(id)a3 triggeredByLayoutManagerAccess:(BOOL)a4 triggeringSelector:(SEL)a5
{
  _BOOL4 v5;
  id v7;
  _UITextLayoutController *textLayoutController;
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags;
  BOOL v10;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  v7 = a3;
  textLayoutController = self->_textLayoutController;
  if (!textLayoutController
    || (-[_UITextLayoutController canAccessLayoutManager](textLayoutController, "canAccessLayoutManager") & 1) != 0
    || (tvFlags = self->_tvFlags, (*(_WORD *)&tvFlags & 0x1000) != 0))
  {
    v10 = 0;
  }
  else
  {
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(unint64_t *)&tvFlags | 0x1000);
    _UITextViewEnablingCompatibilityMode(self, v5);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__UITextView__reconfigureWithLayoutManager_triggeredByLayoutManagerAccess_triggeringSelector___block_invoke;
    v12[3] = &unk_1E16B1B50;
    v12[4] = self;
    v13 = v7;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);

    v10 = 1;
  }

  return v10;
}

void __94__UITextView__reconfigureWithLayoutManager_triggeredByLayoutManagerAccess_triggeringSelector___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[UITextView _adjustedTextContainerInset](*(double **)(a1 + 32));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("_UITextContainerViewSizeDidChange"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2096));
  objc_msgSend(*(id *)(a1 + 32), "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2096));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2096), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "_configureWithTextContainer:layoutManager:textLayoutManagerEnabled:", v2, *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_installContainerViewAtIndex:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2096), "setTextContainerInset:", v3, v5, v7, v9);
  -[UITextView _placeSelectionContainerView](*(id **)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2080), "setEnsuresFixingAttributes:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2080), "fixAttributesInRange:", 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2080), "length"));
  objc_msgSend(*(id *)(a1 + 32), "_updateContentSize");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 2120));

  if (WeakRetained)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(v14 + 2688);
    v16 = objc_loadWeakRetained((id *)(v14 + 2120));
    objc_msgSend(v16, "setTextLayoutController:", v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateContainerTileAndSizingFlags");
  if ((objc_msgSend(*(id *)(a1 + 32), "isScrollEnabled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
  objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__textContainerSizeDidChange_, CFSTR("_UITextContainerViewSizeDidChange"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2096));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2152) &= ~0x1000uLL;
}

- (id)_placeSelectionContainerView
{
  id *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;

  if (result)
  {
    v1 = result;
    if (result[332])
    {
      objc_msgSend(result, "textContainer");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "textLayoutManager");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = (void *)v3;
        v5 = _UITextViewAllowSelectionContainerInTextLayoutCanvas();

        if (v5)
        {
          objc_msgSend(v1[332], "removeFromSuperview");
          return (id *)objc_msgSend(v1[262], "setSelectionContainerView:", v1[332]);
        }
      }
      else
      {

      }
      objc_msgSend(v1[262], "setSelectionContainerView:", 0);
      objc_msgSend(v1, "insertSubview:belowSubview:", v1[332], v1[262]);
      return (id *)objc_msgSend(v1, "setNeedsLayout");
    }
  }
  return result;
}

- (int64_t)_encodedTextKitFlavor
{
  return self->_textKitCodingFlavor;
}

- (void)_setEncodedTextKitFlavor:(int64_t)a3
{
  if (self->_textKitCodingFlavor != a3)
    self->_textKitCodingFlavor = a3;
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4
{
  _BOOL8 v4;
  UITextView *v5;
  UITextView *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  v5 = -[UIScrollView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[UITextView _commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:](v5, "_commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:", 0, 0, 1, 1, 1, v4);
  return v6;
}

+ (UITextView)textViewUsingTextLayoutManager:(BOOL)usingTextLayoutManager
{
  _BOOL8 v3;
  id v4;

  v3 = usingTextLayoutManager;
  v4 = objc_alloc((Class)a1);
  return (UITextView *)(id)objc_msgSend(v4, "_initWithFrame:textLayoutManagerEnabled:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[UITextView initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:](self, "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", v9, objc_msgSend((id)objc_opt_class(), "_isTextLayoutManagerEnabled"), x, y, width, height);

  return v10;
}

- (UITextView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UITextView *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = coder;
  v21.receiver = self;
  v21.super_class = (Class)UITextView;
  v5 = -[UIScrollView initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_46;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIEditable")))
    v6 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIEditable"));
  else
    v6 = 1;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISelectable")))
    v7 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISelectable"));
  else
    v7 = 1;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextViewTextKitCodingFlavor")))
    -[UITextView _setEncodedTextKitFlavor:](v5, "_setEncodedTextKitFlavor:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextViewTextKitCodingFlavor")));
  v8 = objc_msgSend((id)objc_opt_class(), "_isTextLayoutManagerEnabled");
  v9 = -[UITextView _encodedTextKitFlavor](v5, "_encodedTextKitFlavor");
  if (v9 == 2)
    v10 = 1;
  else
    v10 = v8;
  if (v9 == 1)
    v11 = 0;
  else
    v11 = v10;
  -[UITextView _commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:](v5, "_commonInitWithTextContainer:decoding:editable:selectable:draggable:textLayoutManagerEnabled:", 0, 1, v6, v7, 1, v11);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAllowsEditingTextAttributes")))
    -[UITextView setAllowsEditingTextAttributes:](v5, "setAllowsEditingTextAttributes:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAllowsEditingTextAttributes")));
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAdjustsFontForContentSizeCategory")))
    -[UITextView setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAdjustsFontForContentSizeCategory")));
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIFont")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIFont"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v5, "setFont:", v12);

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextColor")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITextColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v5, "setTextColor:", v13);

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextAlignment")))
    -[UITextView setTextAlignment:](v5, "setTextAlignment:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextAlignment")));
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAttributedText")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIAttributedText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](v5, "setAttributedText:", v14);
LABEL_30:

    goto LABEL_31;
  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIText")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setText:](v5, "setText:", v14);
    goto LABEL_30;
  }
LABEL_31:
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIFindInteractionEnabled")))
    -[UITextView setFindInteractionEnabled:](v5, "setFindInteractionEnabled:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIFindInteractionEnabled")));
  -[UITextView setDataDetectorTypes:](v5, "setDataDetectorTypes:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIDataDetectorTypes")));
  -[UITextView _textInputTraits](v5, "_textInputTraits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutocapitalizationType:", 2);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAutocapitalizationType")))
    objc_msgSend(v15, "setAutocapitalizationType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIAutocapitalizationType")));
  objc_msgSend(v15, "setAutocorrectionType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIAutocorrectionType")));
  objc_msgSend(v15, "setSpellCheckingType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISpellCheckingType")));
  objc_msgSend(v15, "setKeyboardType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIKeyboardType")));
  objc_msgSend(v15, "setKeyboardAppearance:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIKeyboardAppearance")));
  objc_msgSend(v15, "setReturnKeyType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIReturnKeyType")));
  objc_msgSend(v15, "setEnablesReturnKeyAutomatically:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIEnablesReturnKeyAutomatically")));
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITextContentType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextContentType:", v16);

  objc_msgSend(v15, "setSmartInsertDeleteType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextSmartInsertDeleteType")));
  objc_msgSend(v15, "setSmartQuotesType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextSmartQuotesType")));
  objc_msgSend(v15, "setSmartDashesType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextSmartDashesType")));
  objc_msgSend(v15, "setInlinePredictionType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextInlinePredictionType")));
  objc_msgSend(v15, "setMathExpressionCompletionType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextMathExpressionCompletionType")));
  objc_msgSend(v15, "setAllowsTextAnimationsType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextAllowsTextAnimationsType")));
  objc_msgSend(v15, "setWritingToolsBehavior:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIWritingToolsBehavior")));
  v17 = CFSTR("UIAllowedWritingToolsResultOptions");
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAllowedWritingToolsResultOptions"))
    || (v17 = CFSTR("UIWritingToolsAllowedInputOptions"),
        -[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIWritingToolsAllowedInputOptions"))))
  {
    objc_msgSend(v15, "setAllowedWritingToolsResultOptions:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v17));
  }
  objc_msgSend(v15, "setSecureTextEntry:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISecureTextEntry")));
  if (!-[UIScrollView isScrollEnabled](v5, "isScrollEnabled")
    && -[_UITextLayoutController canAccessLayoutManager](v5->_textLayoutController, "canAccessLayoutManager"))
  {
    -[_UITextLayoutController layoutManager](v5->_textLayoutController, "layoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsNonContiguousLayout:", 0);

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextViewUsesStandardTextScaling")))
    -[UITextView setUsesStandardTextScaling:](v5, "setUsesStandardTextScaling:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UITextViewUsesStandardTextScaling")));
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UILetterformAwareSizingRule")))
    v5->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&v5->_tvFlags & 0xFFFFFFFFFFFFBFFFLL | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UILetterformAwareSizingRule")) & 1) << 14));
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITextHighlightAttributes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextHighlightAttributes:](v5, "setTextHighlightAttributes:", v19);

LABEL_46:
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UITextView;
  -[UIScrollView encodeWithCoder:](&v22, sel_encodeWithCoder_, v4);
  -[UITextView attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UIText"));

    -[UITextView attributedText](self, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIAttributedText"));

  }
  if (-[UITextView allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UITextView allowsEditingTextAttributes](self, "allowsEditingTextAttributes"), CFSTR("UIAllowsEditingTextAttributes"));
  if (-[UITextView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAdjustsFontForContentSizeCategory"));
  -[UITextView font](self, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UITextView font](self, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIFont"));

  }
  -[UITextView textColor](self, "textColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UITextView textColor](self, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UITextColor"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", *(_QWORD *)off_1E1678F98);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = objc_msgSend(v15, "alignment");
  else
    v16 = 4;
  objc_msgSend(v4, "encodeInteger:forKey:", v16, CFSTR("UITextAlignment"));

  if (!-[UITextView isEditable](self, "isEditable"))
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIEditable"));
  if (-[UITextView dataDetectorTypes](self, "dataDetectorTypes"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UITextView dataDetectorTypes](self, "dataDetectorTypes"), CFSTR("UIDataDetectorTypes"));
  if (!-[UITextView isSelectable](self, "isSelectable"))
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UISelectable"));
  if (-[UITextView isFindInteractionEnabled](self, "isFindInteractionEnabled"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIFindInteractionEnabled"));
  -[UITextView _textInputTraits](self, "_textInputTraits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "autocapitalizationType") != 2)
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "autocapitalizationType"), CFSTR("UIAutocapitalizationType"));
  if (objc_msgSend(v17, "autocorrectionType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "autocorrectionType"), CFSTR("UIAutocorrectionType"));
  if (objc_msgSend(v17, "spellCheckingType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "spellCheckingType"), CFSTR("UISpellCheckingType"));
  if (objc_msgSend(v17, "keyboardType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "keyboardType"), CFSTR("UIKeyboardType"));
  if (objc_msgSend(v17, "keyboardAppearance"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "keyboardAppearance"), CFSTR("UIKeyboardAppearance"));
  if (objc_msgSend(v17, "returnKeyType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "returnKeyType"), CFSTR("UIReturnKeyType"));
  if (objc_msgSend(v17, "enablesReturnKeyAutomatically"))
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v17, "enablesReturnKeyAutomatically"), CFSTR("UIEnablesReturnKeyAutomatically"));
  if (objc_msgSend(v17, "isSecureTextEntry"))
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v17, "isSecureTextEntry"), CFSTR("UISecureTextEntry"));
  objc_msgSend(v17, "textContentType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v17, "textContentType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("UITextContentType"));

  }
  if (objc_msgSend(v17, "smartInsertDeleteType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "smartInsertDeleteType"), CFSTR("UITextSmartInsertDeleteType"));
  if (objc_msgSend(v17, "smartQuotesType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "smartQuotesType"), CFSTR("UITextSmartQuotesType"));
  if (objc_msgSend(v17, "smartDashesType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "smartDashesType"), CFSTR("UITextSmartDashesType"));
  if (objc_msgSend(v17, "inlinePredictionType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "inlinePredictionType"), CFSTR("UITextInlinePredictionType"));
  if (objc_msgSend(v17, "mathExpressionCompletionType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "mathExpressionCompletionType"), CFSTR("UITextMathExpressionCompletionType"));
  if (objc_msgSend(v17, "allowsTextAnimationsType"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "allowsTextAnimationsType"), CFSTR("UITextAllowsTextAnimationsType"));
  if (objc_msgSend(v17, "writingToolsBehavior"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "writingToolsBehavior"), CFSTR("UIWritingToolsBehavior"));
  if (objc_msgSend(v17, "allowedWritingToolsResultOptions"))
    objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v17, "allowedWritingToolsResultOptions"), CFSTR("UIAllowedWritingToolsResultOptions"));
  if (-[UITextView usesStandardTextScaling](self, "usesStandardTextScaling"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UITextView usesStandardTextScaling](self, "usesStandardTextScaling"), CFSTR("UITextViewUsesStandardTextScaling"));
  if (-[UITextView _encodedTextKitFlavor](self, "_encodedTextKitFlavor") >= 1)
    objc_msgSend(v4, "encodeInteger:forKey:", -[UITextView _encodedTextKitFlavor](self, "_encodedTextKitFlavor"), CFSTR("UITextViewTextKitCodingFlavor"));
  if ((*((_BYTE *)&self->_tvFlags + 1) & 0x40) != 0)
    objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("UILetterformAwareSizingRule"));
  -[UITextView textHighlightAttributes](self, "textHighlightAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[UITextView textHighlightAttributes](self, "textHighlightAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("UITextHighlightAttributes"));

  }
}

- (void)_populateArchivedSubviews:(id)a3
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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UITextView;
  -[UIScrollView _populateArchivedSubviews:](&v15, sel__populateArchivedSubviews_, v4);
  if (self->_containerView)
    objc_msgSend(v4, "removeObject:");
  -[UITextView interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_legacySelectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "removeObject:", v6);
    objc_msgSend(v6, "rangeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startGrabber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dotView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v4, "removeObject:", v9);
    objc_msgSend(v6, "rangeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endGrabber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_dotView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v4, "removeObject:", v12);

  }
  if (self->_layoutView)
    objc_msgSend(v4, "removeObject:");
  -[UITextView interactionAssistant](self, "interactionAssistant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_selectionViewManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_filterArchivedSubviews:", v4);

}

- (NSLayoutManager)layoutManager
{
  -[UITextView _reconfigureWithLayoutManager:triggeredByLayoutManagerAccess:triggeringSelector:](self, "_reconfigureWithLayoutManager:triggeredByLayoutManagerAccess:triggeringSelector:", 0, 1, a2);
  return (NSLayoutManager *)-[_UITextKit1LayoutController originalLayoutManager]((id *)self->_textLayoutController);
}

- (id)_inputController
{
  return objc_loadWeakRetained((id *)&self->_inputController);
}

- (void)setInputView:(UIView *)inputView
{
  UIView *v5;
  UIView *v6;

  v5 = inputView;
  if (self->_inputView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inputView, inputView);
    v5 = v6;
  }

}

- (UIView)inputAccessoryView
{
  UIView *inputAccessoryView;
  objc_super v4;

  inputAccessoryView = self->_inputAccessoryView;
  if (inputAccessoryView)
    return inputAccessoryView;
  v4.receiver = self;
  v4.super_class = (Class)UITextView;
  -[UIResponder inputAccessoryView](&v4, sel_inputAccessoryView);
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_ownsInputAccessoryView
{
  objc_super v3;

  if (self->_inputAccessoryView)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)UITextView;
  return -[UIResponder _ownsInputAccessoryView](&v3, sel__ownsInputAccessoryView);
}

- (NSAttributedString)attributedText
{
  UITextInputController **p_inputController;
  id WeakRetained;
  id v5;
  void *v6;

  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_inputController);
    objc_msgSend(v5, "filteredAttributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[NSTextStorage copy](self->_textStorage, "copy");
  }
  return (NSAttributedString *)v6;
}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _UITextLayoutController *textLayoutController;
  uint64_t v9;
  void *v10;
  id v11;

  length = a4.length;
  location = a4.location;
  -[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", a4.location, a4.length);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  textLayoutController = self->_textLayoutController;
  v9 = *(_QWORD *)off_1E16790E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutController addAnnotationAttribute:value:forRange:](textLayoutController, "addAnnotationAttribute:value:forRange:", v9, v10, v11);

  -[_UITextLayoutController boundingRectForCharacterRange:](self->_textLayoutController, "boundingRectForCharacterRange:", location, length);
  -[UITextView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");

}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  NSAttributedString *v4;
  void *v5;
  int v6;
  unint64_t v7;
  UITextView *v8;
  NSAttributedString *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSAttributedString *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _UITextLayoutController *v25;
  void *v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  NSTextStorage *textStorage;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  _UITextLayoutController *v46;
  void *v47;
  unint64_t v48;
  _QWORD v49[5];
  _QWORD v50[4];
  NSAttributedString *v51;
  _QWORD v52[5];
  id v53;
  NSAttributedString *v54;
  _QWORD v55[4];
  NSAttributedString *v56;
  id v57;
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;

  v4 = attributedText;
  if (+[UIDictationUtilities shouldLogCorrectionInfoForCurrentBundleId](UIDictationUtilities, "shouldLogCorrectionInfoForCurrentBundleId"))
  {
    if (!v4
      || (-[NSAttributedString string](v4, "string"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E16EDF20),
          v5,
          v6))
    {
      +[UIDictationController logCorrectionStatisticsForDelegate:reason:](UIDictationController, "logCorrectionStatisticsForDelegate:reason:", self, 25);
    }
  }
  if ((-[NSTextStorage isEqualToAttributedString:](self->_textStorage, "isEqualToAttributedString:", v4) & 1) == 0)
  {
    if (!v4)
      v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
    v7 = -[NSAttributedString length](v4, "length");
    v8 = self;
    v9 = v4;
    if (qword_1ECD793E0 != -1)
      dispatch_once(&qword_1ECD793E0, &__block_literal_global_2151);
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    -[UITextView textLayoutController](v8, "textLayoutController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "canAccessLayoutManager") & 1) != 0)
    {

    }
    else
    {
      v11 = dyld_program_sdk_at_least();

      if ((v11 & 1) == 0 && qword_1ECD793F8 != -1)
        dispatch_once(&qword_1ECD793F8, &__block_literal_global_2164);
    }
    v12 = MEMORY[0x1E0C809B0];
    if (byte_1ECD7937A)
    {
      if (!qword_1ECD793F0)
      {
        objc_msgSend((id)qword_1ECD793D8, "objectForKeyedSubscript:", qword_1ECD793E8);
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        qword_1ECD793F0 = (uint64_t)NSClassFromString(v13);

      }
      v14 = -[NSAttributedString length](v9, "length");
      v15 = *(_QWORD *)off_1E1678C48;
      v58[0] = v12;
      v58[1] = 3221225472;
      v58[2] = ___downgradeToTextKit1IfNecessary_block_invoke_3;
      v58[3] = &unk_1E16E6C58;
      v58[4] = &v59;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v9, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v14, 0, v58);
    }
    if (*((_BYTE *)v60 + 24))
    {
      -[UITextView layoutManager](v8, "layoutManager");

    }
    _Block_object_dispose(&v59, 8);

    -[NSAttributedString string](v9, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView _resolvedTypesettingLanguage:](v8, "_resolvedTypesettingLanguage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[_UITextLayoutController canAccessLayoutManager](v8->_textLayoutController, "canAccessLayoutManager") & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      v18 = dyld_program_sdk_at_least() ^ 1;
      if ((v18 & 1) != 0)
        goto LABEL_26;
    }
    if (!v17)
    {
      v19 = v9;
LABEL_32:
      if (-[_UITextLayoutController canAccessLayoutManager](v8->_textLayoutController, "canAccessLayoutManager"))
      {
        v25 = v8->_textLayoutController;
        -[_UITextLayoutController layoutManager](v25, "layoutManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "allowsNonContiguousLayout") && v7)
        {
          if (v7 < 5)
            goto LABEL_44;
          v46 = v25;
          v47 = v17;
          v27 = 0;
          v28 = 0;
          v48 = v7;
          v29 = v7 / 5;
          v30 = *(_QWORD *)off_1E1678D90;
          v31 = 0.0;
          v32 = 5;
          do
          {
            -[NSAttributedString attribute:atIndex:effectiveRange:](v19, "attribute:atIndex:effectiveRange:", v30, v27, 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v33)
            {
              objc_msgSend(v33, "pointSize");
              if (v35 > 0.0)
              {
                v36 = 0.0;
                if (objc_msgSend(v34, "isSystemFont"))
                {
                  objc_msgSend(v34, "_leading");
                  v36 = v37;
                }
                objc_msgSend(v26, "defaultLineHeightForFont:", v34);
                v31 = (v31 * (double)v28 + v36 + v38) / (double)(v28 + 1);
                ++v28;
              }
            }

            v27 += v29;
            --v32;
          }
          while (v32);
          v7 = v48;
          v17 = v47;
          v25 = v46;
          if (v31 <= 0.0)
          {
LABEL_44:
            objc_msgSend(off_1E167A828, "defaultFontSize");
            objc_msgSend(off_1E167A828, "systemFontOfSize:");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "defaultLineHeightForFont:", v39);
            v31 = v40;

          }
          objc_msgSend(v26, "_setGlyphsPerLineEstimate:offsetPerLineEstimate:", 0, v31);
          v12 = MEMORY[0x1E0C809B0];
        }

      }
      textStorage = self->_textStorage;
      v50[0] = v12;
      v50[1] = 3221225472;
      v50[2] = __32__UITextView_setAttributedText___block_invoke_3;
      v50[3] = &unk_1E16E6408;
      v4 = v19;
      v51 = v4;
      -[NSTextStorage coordinateEditing:](textStorage, "coordinateEditing:", v50);
      v8->_textContainerInsetAdjustment.top = -[UITextView _applicableContentOutsetsFromFonts](v8);
      v8->_textContainerInsetAdjustment.left = v42;
      v8->_textContainerInsetAdjustment.bottom = v43;
      v8->_textContainerInsetAdjustment.right = v44;
      -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)v8);
      if ((-[_UITextLayoutController canAccessLayoutManager](v8->_textLayoutController, "canAccessLayoutManager") & 1) == 0)
        -[UITextView _layoutText](v8, "_layoutText");
      v45 = *(_QWORD *)off_1E16790E0;
      v49[0] = v12;
      v49[1] = 3221225472;
      v49[2] = __32__UITextView_setAttributedText___block_invoke_4;
      v49[3] = &unk_1E16E6DC8;
      v49[4] = v8;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v4, "enumerateAttribute:inRange:options:usingBlock:", v45, 0, -[NSAttributedString length](v4, "length"), 0, v49);
      -[_UITextContainerView setNeedsDisplay](v8->_containerView, "setNeedsDisplay");
      -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](v8, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
      -[UITextView setSelectedRange:](v8, "setSelectedRange:", v7, 0);
      if (-[UITextView _shouldStartDataDetectors](v8, "_shouldStartDataDetectors"))
        -[UITextView _startDataDetectors](v8, "_startDataDetectors");
      -[_UITextInteractableItemCache invalidate](v8->_textInteractableItemCache, "invalidate");

      goto LABEL_52;
    }
LABEL_26:
    v19 = (NSAttributedString *)-[NSAttributedString mutableCopy](v9, "mutableCopy");
    -[NSAttributedString beginEditing](v19, "beginEditing");
    if (v18)
    {
      objc_msgSend((id)objc_opt_class(), "_defaultFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)off_1E1678D90;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __32__UITextView_setAttributedText___block_invoke;
      v55[3] = &unk_1E16E6D78;
      v56 = v19;
      v57 = v20;
      v22 = v20;
      v23 = v21;
      v12 = MEMORY[0x1E0C809B0];
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v56, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v7, 0, v55);

    }
    if (v17 && objc_msgSend(v17, "length"))
    {
      v24 = *(_QWORD *)off_1E1678D90;
      v52[0] = v12;
      v52[1] = 3221225472;
      v52[2] = __32__UITextView_setAttributedText___block_invoke_2;
      v52[3] = &unk_1E16E6DA0;
      v52[4] = v8;
      v53 = v17;
      v54 = v19;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v54, "enumerateAttribute:inRange:options:usingBlock:", v24, 0, v7, 0, v52);

    }
    -[NSAttributedString endEditing](v19, "endEditing");

    goto LABEL_32;
  }
LABEL_52:

}

uint64_t __32__UITextView_setAttributedText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, *(_QWORD *)(result + 40), a3, a4);
  return result;
}

void __32__UITextView_setAttributedText___block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  const __CTFont *v7;
  void *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  const __CTFont *v11;
  const __CTFont *v12;
  char v13;
  const __CTFont *v14;

  v7 = a2;
  v14 = v7;
  if (v7)
  {
    -[UIFont _fontAdjustedForTypesettingLanguage:](v7, a1[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(a1[4], "font");
    v9 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
    -[UIFont _fontAdjustedForTypesettingLanguage:](v9, a1[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
  }
  v10 = v8;
  v11 = v14;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (v14)
    {
      v13 = -[__CTFont isEqual:](v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    objc_msgSend(a1[6], "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v10, a3, a4);
  }
LABEL_12:

}

uint64_t __32__UITextView_setAttributedText___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAttributedString:", *(_QWORD *)(a1 + 32));
}

uint64_t __32__UITextView_setAttributedText___block_invoke_4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addTextAlternativesDisplayStyle:toRange:", objc_msgSend(a2, "isLowConfidence"), a3, a4);
  return result;
}

- (void)_observedTextViewDidChange:(id)a3
{
  if (-[UITextView _totalNumberOfTextViewsInLayoutManager](self, "_totalNumberOfTextViewsInLayoutManager", a3) >= 2)
    -[UITextView setSelectable:](self, "setSelectable:", 0);
}

- (void)_setContentOffsetWithoutRecordingScrollPosition:(CGPoint)a3
{
  ++self->_scrollPositionDontRecordCount;
  -[UITextView setContentOffset:](self, "setContentOffset:", a3.x, a3.y);
  --self->_scrollPositionDontRecordCount;
}

- (id)topContentPadding
{
  return self->_topContentPadding;
}

- (void)_scrollViewWillEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  self->_scrollEndDraggingVelocity = a3;
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  _BOOL8 v3;
  double y;
  double v6;
  double v7;
  int *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  objc_super v15;

  v3 = a3;
  if (a3)
  {
    y = self->_scrollEndDraggingVelocity.y;
    if (y >= 0.0)
    {
      if (y > 0.0)
      {
        -[UIView bounds](self, "bounds");
        v10 = v9;
        -[UIScrollView contentOffset](self, "contentOffset");
        v12 = v10 + v11;
        -[UITextView _containerView](self, "_containerView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bounds");
        v7 = v12 - v14;

        if (v7 > 0.0)
        {
          v8 = &OBJC_IVAR___UITextView__bottomContentPadding;
          goto LABEL_8;
        }
      }
    }
    else
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      if (v6 < 0.0)
      {
        v7 = -v6;
        v8 = &OBJC_IVAR___UITextView__topContentPadding;
LABEL_8:
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v8), "increaseToValue:", v7);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)UITextView;
  -[UIScrollView _scrollViewDidEndDraggingWithDeceleration:](&v15, sel__scrollViewDidEndDraggingWithDeceleration_, v3);
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _UITextViewRestorableScrollPosition *scrollTarget;
  BOOL v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  _UITextLayoutController *textLayoutController;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  NSRange v24;
  NSRange v25;

  v4 = a4;
  v6 = a3;
  scrollTarget = self->_scrollTarget;
  if (scrollTarget)
    v8 = !v4;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = -[UITextView _visibleRangeWithLayout:](self, "_visibleRangeWithLayout:", 1);
    v11 = v10;
    v25.location = -[_UITextViewRestorableScrollPosition range](self->_scrollTarget, "range");
    v25.length = v12;
    v24.location = v9;
    v24.length = v11;
    v13 = NSUnionRange(v24, v25);
    textLayoutController = self->_textLayoutController;
    -[_UITextLayoutController textRangeForCharacterRange:](textLayoutController, "textRangeForCharacterRange:", v13.location, v13.length);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextLayoutController ensureLayoutForRange:](textLayoutController, "ensureLayoutForRange:", v15);

    v16 = -[_UITextViewRestorableScrollPosition range](self->_scrollTarget, "range");
    -[UITextView _contentOffsetForScrollToVisible:](self, "_contentOffsetForScrollToVisible:", v16, v17);
    v19 = v18;
    v21 = v20;
    -[_UITextViewRestorableScrollPosition offsetWithinLine](self->_scrollTarget, "offsetWithinLine");
    -[UITextView setContentOffset:](self, "setContentOffset:", v19, v21 + v22);
    scrollTarget = self->_scrollTarget;
  }
  self->_scrollTarget = 0;

  v23.receiver = self;
  v23.super_class = (Class)UITextView;
  -[UIScrollView _scrollViewAnimationEnded:finished:](&v23, sel__scrollViewAnimationEnded_finished_, v6, v4);

}

uint64_t __70__UITextView__resyncContainerFrameForNonAutolayoutDeferringSizeToFit___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 2488) = 0;
  return result;
}

- (void)_sizingRuleWillChangeShouldClearInsetEdges:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  double width;
  double height;
  double v8;
  double v9;
  CGRect v10;

  if (!a1)
    return;
  if ((objc_msgSend((id)a1, "isScrollEnabled") & 1) == 0)
  {
    if ((*(_QWORD *)(a1 + 104) & 0x400000000000000) != 0)
      goto LABEL_8;
    objc_msgSend((id)a1, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend((id)a1, "bounds");
      width = v10.size.width;
      height = v10.size.height;
      v8 = CGRectGetHeight(v10);
      objc_msgSend((id)a1, "sizeThatFits:", width, height);
      if (v8 == v9)
        objc_msgSend(v5, "setNeedsLayout");
      goto LABEL_11;
    }
    if ((*(_QWORD *)(a1 + 104) & 0x400000000000000) != 0)
    {
LABEL_8:
      if ((objc_msgSend((id)a1, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
        objc_msgSend((id)a1, "invalidateIntrinsicContentSize");
    }
    v5 = 0;
LABEL_11:

  }
  if (a2)
  {
    if (a2 == 15)
    {
      *(_OWORD *)(a1 + 2352) = 0u;
      *(_OWORD *)(a1 + 2368) = 0u;
    }
    else
    {
      *(_QWORD *)(a1 + 2352) = 0;
      *(_QWORD *)(a1 + 2368) = 0;
    }
  }
}

- (void)setSizingRule:(int64_t)a3
{
  BOOL v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  if (((*(_QWORD *)&self->_tvFlags >> 14) & 1) != a3)
  {
    v4 = a3 == 1;
    if (a3 == 1)
      v5 = 0;
    else
      v5 = 15;
    -[UITextView _sizingRuleWillChangeShouldClearInsetEdges:]((uint64_t)self, v5);
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)v4 << 14));
    self->_textContainerInsetAdjustment.top = -[UITextView _applicableContentOutsetsFromFonts](self);
    self->_textContainerInsetAdjustment.left = v6;
    self->_textContainerInsetAdjustment.bottom = v7;
    self->_textContainerInsetAdjustment.right = v8;
  }
}

- (int64_t)sizingRule
{
  return (*(_QWORD *)&self->_tvFlags >> 14) & 1;
}

- (void)_setExtremeSizingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  v3 = a3;
  if (-[UITextView _isExtremeSizingEnabled](self, "_isExtremeSizingEnabled") != a3)
  {
    if (v3)
      v5 = 0;
    else
      v5 = 5;
    if (v3)
      v6 = 0x2000;
    else
      v6 = 0;
    -[UITextView _sizingRuleWillChangeShouldClearInsetEdges:]((uint64_t)self, v5);
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFDFFFLL | v6);
    self->_textContainerInsetAdjustment.top = -[UITextView _applicableContentOutsetsFromFonts](self);
    self->_textContainerInsetAdjustment.left = v7;
    self->_textContainerInsetAdjustment.bottom = v8;
    self->_textContainerInsetAdjustment.right = v9;
  }
}

- (BOOL)_isExtremeSizingEnabled
{
  return (*((unsigned __int8 *)&self->_tvFlags + 1) >> 5) & 1;
}

- (void)_scrollToCaretIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double (**v7)(_QWORD);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
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
  void *v38;
  _QWORD aBlock[5];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isCaret");

  if (v6)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__UITextView__scrollToCaretIfNeeded__block_invoke;
    aBlock[3] = &unk_1E16CAF00;
    aBlock[4] = self;
    v7 = (double (**)(_QWORD))_Block_copy(aBlock);
    if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled"))
    {
      if (-[UITextView isEditing](self, "isEditing"))
      {
        v8 = v7[2](v7);
        v10 = v9;
        v12 = v11;
        v14 = v13;
        -[UIView bounds](self, "bounds");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
        v24 = v18 + v23;
        v27 = v20 - (v25 + v26);
        v40.size.height = v22 - (v23 + v28);
        v40.origin.x = v16 + v25;
        v40.origin.y = v24;
        v40.size.width = v27;
        v42.origin.x = v8;
        v42.origin.y = v10;
        v42.size.width = v12;
        v42.size.height = v14;
        if (!CGRectContainsRect(v40, v42))
        {
          -[UIScrollView _contentOffsetAnimationDuration](self, "_contentOffsetAnimationDuration");
          v30 = v29;
          -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", 0.1);
          -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), v8, v10, v12, v14);
          -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v30);
        }
      }
      else if (-[UITextView _shouldScrollEnclosingScrollView](self, "_shouldScrollEnclosingScrollView"))
      {
        v31 = v7[2](v7);
        v33 = v32;
        v35 = v34;
        v37 = v36;
        -[UIView _scroller](self, "_scroller");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "bounds");
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v38);
        v43.origin.x = v31;
        v43.origin.y = v33;
        v43.size.width = v35;
        v43.size.height = v37;
        if (!CGRectContainsRect(v41, v43))
          -[UITextView _scrollRect:toVisibleInContainingScrollView:](self, "_scrollRect:toVisibleInContainingScrollView:", 0, v31, v33, v35, v37);

      }
    }

  }
}

double __36__UITextView__scrollToCaretIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2096), "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caretRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", *(_QWORD *)(a1 + 32), v6, v8, v10, v12);
  v15 = v14;

  return v15;
}

- (BOOL)_isSelectionVisible
{
  void *v2;
  void *v3;
  char v4;

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_selectionViewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isVisible");

  return v4;
}

uint64_t __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_containerSizeForBoundsSize:allowingOverflow:", 0);
}

uint64_t __58__UITextView__setFrameOrBounds_fromOldRect_settingAction___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)UITextView;
  -[UIView setNeedsDisplayInRect:](&v27, sel_setNeedsDisplayInRect_);
  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v31.origin.x = v18;
  v31.origin.y = v19;
  v31.size.width = v20;
  v31.size.height = v21;
  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  v29 = CGRectIntersection(v28, v31);
  v22 = v29.origin.x;
  v23 = v29.origin.y;
  v24 = v29.size.width;
  v25 = v29.size.height;

  v30.origin.x = v22;
  v30.origin.y = v23;
  v30.size.width = v24;
  v30.size.height = v25;
  if (!CGRectIsEmpty(v30))
  {
    -[_UITextContainerView canvasView](self->_containerView, "canvasView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNeedsDisplayInRect:", v22, v23, v24, v25);

  }
}

- (void)_resetUsesExplicitPreferredMaxLayoutWidth
{
  int v3;

  v3 = -[UITextView _needsDoubleUpdateConstraintsPass](self, "_needsDoubleUpdateConstraintsPass");
  *(_QWORD *)&self->_tvFlags &= ~8uLL;
  self->_preferredMaxLayoutWidth = 0.0;
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v3);
  -[UITextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_setPreferredMaxLayoutWidth:(double)a3
{
  BOOL v5;
  int v6;

  v5 = a3 != 0.0;
  v6 = -[UITextView _needsDoubleUpdateConstraintsPass](self, "_needsDoubleUpdateConstraintsPass");
  self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFFFF7 | (8 * v5));
  if (self->_preferredMaxLayoutWidth != a3)
  {
    self->_preferredMaxLayoutWidth = a3;
    if (!-[UIScrollView isScrollEnabled](self, "isScrollEnabled"))
      -[UITextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v6);
}

- (double)_firstBaselineOffsetFromTop
{
  void *v5;

  if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextView.m"), 2561, CFSTR("%s only valid when using auto layout"), "-[UITextView _firstBaselineOffsetFromTop]");

  }
  return self->_firstBaselineOffsetFromTop;
}

- (double)_baselineOffsetFromBottom
{
  void *v5;

  if ((*(_QWORD *)&self->super.super._viewFlags & 0x400000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextView.m"), 2567, CFSTR("%s only valid when using auto layout"), "-[UITextView _baselineOffsetFromBottom]");

  }
  return self->_lastBaselineOffsetFromBottom;
}

- (double)_internalFirstBaselineOffsetFromTop
{
  if (!-[UIView _wantsAutolayout](self, "_wantsAutolayout")
    && self->_firstBaselineOffsetFromTop == 0.0
    && self->_lastBaselineOffsetFromBottom == 0.0)
  {
    -[UITextView _updateBaselineInformationDependentOnBounds](self, "_updateBaselineInformationDependentOnBounds");
  }
  return self->_firstBaselineOffsetFromTop;
}

- (double)_internalLastBaselineOffsetFromBottom
{
  if (!-[UIView _wantsAutolayout](self, "_wantsAutolayout")
    && self->_firstBaselineOffsetFromTop == 0.0
    && self->_lastBaselineOffsetFromBottom == 0.0)
  {
    -[UITextView _updateBaselineInformationDependentOnBounds](self, "_updateBaselineInformationDependentOnBounds");
  }
  return self->_lastBaselineOffsetFromBottom;
}

- (BOOL)_hasBaseline
{
  return 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double width;
  int has_internal_diagnostics;
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD aBlock[6];
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  width = a3.width;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  tvFlags = self->_tvFlags;
  if (has_internal_diagnostics)
  {
    if ((*(_WORD *)&tvFlags & 0x4000) == 0)
    {
      -[UITextView alignmentRectInsets](self, "alignmentRectInsets");
      if (v26 != 0.0 || v23 != 0.0 || v25 != 0.0 || v24 != 0.0)
      {
        __UIFaultDebugAssertLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "Text View not expected to have alignmnetRectInsets.", buf, 2u);
        }

      }
    }
  }
  else if ((*(_WORD *)&tvFlags & 0x4000) == 0)
  {
    -[UITextView alignmentRectInsets](self, "alignmentRectInsets");
    if (v11 != 0.0 || v8 != 0.0 || v10 != 0.0 || v9 != 0.0)
    {
      v12 = _baselineOffsetsAtSize____s_category_0;
      if (!_baselineOffsetsAtSize____s_category_0)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&_baselineOffsetsAtSize____s_category_0);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Text View not expected to have alignmnetRectInsets.", buf, 2u);
      }
    }
  }
  *(_QWORD *)buf = 0;
  v32 = buf;
  v33 = 0x3010000000;
  v34 = &unk_18685B0AF;
  v35 = xmmword_186684A70;
  -[_UITextLayoutController documentRange](self->_textLayoutController, "documentRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEmpty");

  if ((v15 & 1) == 0)
  {
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__UITextView__baselineOffsetsAtSize___block_invoke;
    aBlock[3] = &unk_1E16BC3A0;
    aBlock[4] = self;
    aBlock[5] = buf;
    v17 = _Block_copy(aBlock);
    if (-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager"))
    {
      v29[0] = v16;
      v29[1] = 3221225472;
      v29[2] = __37__UITextView__baselineOffsetsAtSize___block_invoke_2;
      v29[3] = &unk_1E16E6E18;
      v18 = v29;
      v29[4] = v17;
      -[UITextView _performTextKit1LayoutCalculation:inSize:](self, "_performTextKit1LayoutCalculation:inSize:", v29, width, height);
    }
    else
    {
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __37__UITextView__baselineOffsetsAtSize___block_invoke_3;
      v28[3] = &unk_1E16E6E40;
      v18 = v28;
      v28[4] = v17;
      -[UITextView _performTextKit2LayoutCalculation:inSize:](self, "_performTextKit2LayoutCalculation:inSize:", v28, width, height);
    }

  }
  v19 = *((double *)v32 + 4);
  v20 = *((double *)v32 + 5);
  _Block_object_dispose(buf, 8);
  v21 = v19;
  v22 = v20;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

void __37__UITextView__baselineOffsetsAtSize___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_inputController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[336];
  objc_msgSend(v8, "typingAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textContainerOrigin");
  -[_UITextLayoutControllerBase baselineCalculatorForView:typingAttributes:usesLineFragmentOrigin:fallbackTextContainerOrigin:](v3, v2, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstBaselineOffsetFromTop");
  objc_msgSend(v5, "lastBaselineOffsetFromBottom");
  UIRoundToViewScale(*(void **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v6;
  UIRoundToViewScale(*(void **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v7;

}

uint64_t __37__UITextView__baselineOffsetsAtSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__UITextView__baselineOffsetsAtSize___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performTextKit1LayoutCalculation:(id)a3 inSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  CGFloat v15;
  CGFloat v16;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[UITextView layoutManager](self, "layoutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView textContainer](self, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__UITextView__performTextKit1LayoutCalculation_inSize___block_invoke;
  v12[3] = &unk_1E16E6E68;
  v15 = width;
  v16 = height;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v11, "coordinateAccess:", v12);

}

void __55__UITextView__performTextKit1LayoutCalculation_inSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "size");
  v6 = v5;
  v13 = 0uLL;
  v14 = 0;
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_msgSend(v7, "_saveSizeBeforeLayoutCalculation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
    objc_msgSend(*(id *)(a1 + 40), "setTextView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_configureForLayoutCalculation:inSize:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (objc_msgSend(v3, "allowsNonContiguousLayout"))
    objc_msgSend(v3, "ensureLayoutForTextContainer:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v13;
  v12 = v14;
  objc_msgSend(v9, "_restoreSize:afterLayoutCalculation:", &v11, v10);
  if (v4 != v6)
    objc_msgSend(*(id *)(a1 + 40), "setTextView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2096));
  objc_msgSend(v3, "setDelegate:", v8);

}

void __39__UITextView__intrinsicSizeWithinSize___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  objc_class *v4;
  const char *Name;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  strncpy((char *)&v8, Name, 0x18uLL);
  *(_DWORD *)a2 = 91;
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 32) = v9;
  *(_DWORD *)(a2 + 40) = 92;
  *(_QWORD *)(a2 + 48) = v6;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = v6;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a2 + 72) = v7;

}

void __39__UITextView__intrinsicSizeWithinSize___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "allowsNonContiguousLayout"))
    objc_msgSend(v9, "ensureLayoutForTextContainer:", v5);
  objc_msgSend(v9, "glyphRangeForTextContainer:", v5);
  objc_msgSend(v9, "usedRectForTextContainer:", v5);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;

}

- (id)_layoutDebuggingTitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UITextView text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UITextView attributedText](self, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)invalidateIntrinsicContentSize
{
  -[_UITextSizeCache removeAllSizes](self->_intrinsicSizeCache, "removeAllSizes");
  -[UIView _invalidateIntrinsicContentSizeNeedingLayout:](self, "_invalidateIntrinsicContentSizeNeedingLayout:", (*(_QWORD *)&self->super.super._viewFlags & 0x4000000000000) == 0);
}

- (void)_scrollRect:(CGRect)a3 toVisibleInContainingScrollView:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  id v10;
  CGRect v11;
  CGRect v12;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView _scroller](self, "_scroller");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromView:", self, x, y, width, height);
  v12 = CGRectInset(v11, 0.0, -4.0);
  objc_msgSend(v10, "scrollRectToVisible:animated:", v4, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);

}

- (void)_scrollSelectionToVisibleInContainingScrollView:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[UITextView selectedRange](self, "selectedRange");
  -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", v5, v6);
  -[UITextView _scrollRect:toVisibleInContainingScrollView:](self, "_scrollRect:toVisibleInContainingScrollView:", v3);
}

- (void)_scrollSelectionToVisibleInContainingScrollView
{
  -[UITextView _scrollSelectionToVisibleInContainingScrollView:](self, "_scrollSelectionToVisibleInContainingScrollView:", 0);
}

- (void)_keyboardDidShow:(id)a3
{
  if (-[UIView isFirstResponder](self, "isFirstResponder", a3))
  {
    if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled"))
      -[UITextView scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
    else
      -[UITextView _scrollSelectionToVisibleInContainingScrollView:](self, "_scrollSelectionToVisibleInContainingScrollView:", 1);
  }
}

- (BOOL)_shouldScrollEnclosingScrollView
{
  void *v3;
  int v4;

  if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled") || !-[UITextView isEditing](self, "isEditing"))
  {
    LOBYTE(v4) = 0;
  }
  else if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isSettingFirstResponder") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)_shouldCollectAsKeyView
{
  _BOOL4 v3;

  v3 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  if (v3)
    LOBYTE(v3) = -[UITextView isEditable](self, "isEditable");
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  id WeakRetained;
  char v7;

  -[UIView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[UIView _containedInAbsoluteResponderChain](self, "_containedInAbsoluteResponderChain");

    if (!v5)
      return 0;
  }
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((*(_BYTE *)&self->_tvFlags & 2) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(WeakRetained, "textViewShouldBeginEditing:", self);
  else
    v7 = 1;

  return v7;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  UITextView *v5;
  char v6;
  char v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  if (+[UIResponder _currentChangeIntent](UIResponder, "_currentChangeIntent") == 1
    && -[UITextView _shouldBecomeEditableUponFocus](self, "_shouldBecomeEditableUponFocus")
    || +[UIResponder _currentChangeIntent](UIResponder, "_currentChangeIntent") == 2
    && -[UITextView _shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment](self, "_shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment"))
  {
    -[UITextView setEditable:](self, "setEditable:", 1);
  }
  -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    if (objc_msgSend(v4, "isOnScreen"))
      goto LABEL_12;
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "responder");
  v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v7 = objc_msgSend(v4, "isOnScreen");

    if ((v7 & 1) != 0)
      goto LABEL_12;
    goto LABEL_14;
  }

LABEL_12:
  objc_msgSend(v4, "_beginIgnoringReloadInputViews");
  v6 = 1;
LABEL_15:
  v14.receiver = self;
  v14.super_class = (Class)UITextView;
  v3 = -[UIView becomeFirstResponder](&v14, sel_becomeFirstResponder);
  v8 = -[UITextView isEditable](self, "isEditable");
  if (v3)
  {
    v9 = v8;
    if (v8)
    {
      -[UITextView _resetDataDetectorsResults](self, "_resetDataDetectorsResults");
      -[UITextView _textInputTraits](self, "_textInputTraits");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setColorsToMatchTintColor:", v11);

      if ((v6 & 1) == 0)
        -[UITextView _notifyDidBeginEditing](self, "_notifyDidBeginEditing");
      -[_UITextContainerView canvasView](self->_containerView, "canvasView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "isEditingDidChange");

      if (-[UITextView shouldAutoscrollAboveBottom](self, "shouldAutoscrollAboveBottom"))
        -[UITextView updateAutoscrollAboveBottom](self, "updateAutoscrollAboveBottom");
    }
    -[UITextView _updateSelectionGestures](self, "_updateSelectionGestures");
    if (!-[UITextView isTextDropActive](self, "isTextDropActive") && (*(_BYTE *)&self->_tvFlags & 0x10) == 0)
    {
      -[UITextInteractionAssistant setSelectionDisplayVisible:](self->_interactionAssistant, "setSelectionDisplayVisible:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
      -[UITextInteractionAssistant activateSelection](self->_interactionAssistant, "activateSelection");
      self->_forceSelectionDisplayForTextFormatting = 0;
    }
    if (-[UIScrollView isProgrammaticScrollEnabled](self, "isProgrammaticScrollEnabled"))
      *(_QWORD *)&self->_tvFlags |= 1uLL;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v4, "_endIgnoringReloadInputViews");
      -[UIResponder reloadInputViews](self, "reloadInputViews");
      if (v9)
        -[UITextView _notifyDidBeginEditing](self, "_notifyDidBeginEditing");
    }
  }
  else if ((v6 & 1) != 0 && objc_msgSend(v4, "_endIgnoringReloadInputViews"))
  {
    objc_msgSend(v4, "forceReloadInputViews");
  }

  return v3;
}

- (BOOL)canResignFirstResponder
{
  id WeakRetained;
  char v4;

  if (!-[UITextView isEditing](self, "isEditing"))
    return 1;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "textViewShouldEndEditing:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_cleanUpForResignFirstResponder
{
  void *v2;
  id WeakRetained;

  if (a1)
  {
    if ((objc_msgSend(a1, "_preserveSelectionDisplayForTextFormatting") & 1) == 0)
    {
      objc_msgSend(a1[266], "setSelectionDisplayVisible:", 0);
      objc_msgSend(a1[266], "deactivateSelection");
    }
    objc_msgSend(a1, "_startDataDetectorsIfNeeded");
    if (objc_msgSend(a1, "isEditable"))
    {
      objc_msgSend(a1, "_notifyDidEndEditing");
      objc_msgSend(a1[262], "canvasView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "isEditingDidChange");

      if (objc_msgSend(a1, "shouldAutoscrollAboveBottom"))
        objc_msgSend(a1, "updateAutoscrollAboveBottom");
    }
    objc_msgSend(a1, "_updateSelectionGestures");
    WeakRetained = objc_loadWeakRetained(a1 + 265);
    objc_msgSend(WeakRetained, "didEndEditing");

  }
}

- (BOOL)_finishResignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITextView;
  v3 = -[UIResponder _finishResignFirstResponder](&v5, sel__finishResignFirstResponder);
  if (v3 && (*(_BYTE *)&self->_tvFlags & 4) == 0)
    -[UITextView _cleanUpForResignFirstResponder]((id *)&self->super.super.super.super.isa);
  return v3;
}

- (void)_notifyDidBeginEditing
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "textViewDidBeginEditing:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UITextViewTextDidBeginEditingNotification"), self);

}

- (void)_notifyDidEndEditing
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "textViewDidEndEditing:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UITextViewTextDidEndEditingNotification"), self);

}

- (BOOL)allowsEditingTextAttributes
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "allowsEditingTextAttributes");

  return v3;
}

- (BOOL)usesTiledViews
{
  return -[_UITextLayoutController usesTiledViews](self->_textLayoutController, "usesTiledViews");
}

- (void)setUsesTiledViews:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (dyld_program_sdk_at_least())
  {
    if (setUsesTiledViews__once != -1)
      dispatch_once(&setUsesTiledViews__once, &__block_literal_global_578);
  }
  else
  {
    -[_UITextLayoutController setUsesTiledViews:](self->_textLayoutController, "setUsesTiledViews:", v3);
  }
}

void __32__UITextView_setUsesTiledViews___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UISiriTrackingAttribute_block_invoke___s_category;
  if (!_UISiriTrackingAttribute_block_invoke___s_category)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UISiriTrackingAttribute_block_invoke___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "-setUsesTiledViews: is no longer supported on iOS 13. Tiling is always on. If you explicitly need to disable tiling, use -_disableTiledViews", v2, 2u);
  }
}

- (double)maxTileHeight
{
  double result;

  -[_UITextLayoutController maxTileHeight](self->_textLayoutController, "maxTileHeight");
  return result;
}

- (BOOL)tiledViewsDrawAsynchronously
{
  void *v2;
  void *v3;
  char v4;

  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "drawsAsynchronously");

  return v4;
}

- (void)setTiledViewsDrawAsynchronously:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDrawsAsynchronously:", v3);

}

- (void)setCustomRenderController:(id)a3
{
  NSCustomTextRendering *v5;
  id *p_customRenderController;
  NSCustomTextRendering *customRenderController;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  NSCustomTextRendering *v26;

  v5 = (NSCustomTextRendering *)a3;
  p_customRenderController = (id *)&self->_customRenderController;
  customRenderController = self->_customRenderController;
  if (customRenderController != v5)
  {
    v26 = v5;
    *p_customRenderController = 0;

    objc_storeStrong((id *)&self->_customRenderController, a3);
    objc_msgSend(*p_customRenderController, "setDelegate:", self);
    v8 = objc_opt_respondsToSelector();
    v9 = 0x10000;
    if ((v8 & 1) == 0)
      v9 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFEFFFFLL | v9);
    v10 = objc_opt_respondsToSelector();
    v11 = 0;
    if ((v10 & 1) != 0)
    {
      v12 = objc_opt_respondsToSelector();
      v11 = 0x400000;
      if ((v12 & 1) == 0)
        v11 = 0;
    }
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFBFFFFFLL | v11);
    v13 = objc_opt_respondsToSelector();
    v14 = 0x800000;
    if ((v13 & 1) == 0)
      v14 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFF7FFFFFLL | v14);
    v15 = objc_opt_respondsToSelector();
    v16 = 0x20000;
    if ((v15 & 1) == 0)
      v16 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFDFFFFLL | v16);
    v17 = objc_opt_respondsToSelector();
    v18 = 0x40000;
    if ((v17 & 1) == 0)
      v18 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFBFFFFLL | v18);
    v19 = objc_opt_respondsToSelector();
    v20 = 0x80000;
    if ((v19 & 1) == 0)
      v20 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFF7FFFFLL | v20);
    v21 = objc_opt_respondsToSelector();
    v22 = 0x100000;
    if ((v21 & 1) == 0)
      v22 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFEFFFFFLL | v22);
    v23 = objc_opt_respondsToSelector();
    v24 = 0x200000;
    if ((v23 & 1) == 0)
      v24 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFDFFFFFLL | v24);
    -[_UITextContainerView canvasView](self->_containerView, "canvasView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "flushFragmentViews");

    v5 = v26;
  }

}

- (void)setAllowsTextAnimations:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_allowsTextAnimations != a3)
  {
    v3 = a3;
    self->_allowsTextAnimations = a3;
    -[UITextView textLayoutManager](self, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("requiresCTLineRef"));

    -[UITextView _textInputTraits](self, "_textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
      v9 = 2;
    else
      v9 = 1;
    objc_msgSend(v7, "setAllowsTextAnimationsType:", v9);

    if (self->_allowsTextAnimations)
    {
      UITextAnimationsNewRenderController();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setCustomRenderController:](self, "setCustomRenderController:", v10);

    }
    else
    {
      -[UITextView setCustomRenderController:](self, "setCustomRenderController:", 0);
    }
    if (v3)
    {
      -[_UITextContainerView canvasView](self->_containerView, "canvasView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configureCustomTextRenderer");

    }
    -[_UITextContainerView canvasView](self->_containerView, "canvasView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

  }
}

+ (BOOL)supportsDynamicallyTogglingAllowsTextAnimations
{
  return 1;
}

- (CGRect)_customRenderBounds
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  if ((*((_BYTE *)&self->_tvFlags + 2) & 0x80) != 0)
  {
    -[NSCustomTextRendering customTextBounds](self->_customRenderController, "customTextBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UITextView textContainerInset](self, "textContainerInset");
    v16 = v15;
    v18 = v17;
    v20 = -v19;
    v3 = v8 - v17;
    v4 = v10 - v16;
    v5 = v12 - (-v21 - v18);
    v6 = v14 - (v20 - v16);
  }
  else
  {
    -[UIView bounds](self, "bounds");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_setCustomRenderDisplayLink:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSCustomTextRendering setExternalDisplayLink:](self->_customRenderController, "setExternalDisplayLink:", v4);

}

- (_NSCustomTextRenderingDisplayLink)_customRenderDisplayLink
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSCustomTextRendering externalDisplayLink](self->_customRenderController, "externalDisplayLink");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (_NSCustomTextRenderingDisplayLink *)v3;
}

- (BOOL)_customRenderControllerPermitsTextSegmentEnumeration
{
  return *((_BYTE *)&self->_tvFlags + 2) & 1;
}

- (BOOL)_customRenderControllerPermitsSetTextDidEditRange
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 2) & 1;
}

- (BOOL)_customRenderControllerCanCheckFragmentsValid
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 1) & 1;
}

- (BOOL)_customRenderControllerCanConvertPointToTextAnimationsCoordinateSpace
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 3) & 1;
}

- (BOOL)_customRenderControllerCanConvertPointToRenderSpace
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 4) & 1;
}

- (BOOL)_customRenderControllerCanConvertPointFromRenderSpace
{
  return (*((unsigned __int8 *)&self->_tvFlags + 2) >> 5) & 1;
}

- (CGPoint)_convertPointFromRenderSpace:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UITextView customRenderController](self, "customRenderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && -[UITextView _customRenderControllerCanConvertPointFromRenderSpace](self, "_customRenderControllerCanConvertPointFromRenderSpace"))
  {
    objc_msgSend(v6, "convertPointFromRenderSpace:", x, y);
    x = v7;
    y = v8;
  }

  v9 = x;
  v10 = y;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)_convertPointToRenderSpace:(CGPoint)a3 textRange:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UITextView customRenderController](self, "customRenderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[UITextView _customRenderControllerCanConvertPointToRenderSpace](self, "_customRenderControllerCanConvertPointToRenderSpace"))
    {
      objc_msgSend(v7, "_asNSTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertPointToRenderSpace:textRange:", v9, x, y);
    }
    else
    {
      if (!-[UITextView _customRenderControllerCanConvertPointToTextAnimationsCoordinateSpace](self, "_customRenderControllerCanConvertPointToTextAnimationsCoordinateSpace"))
      {
        objc_msgSend(v8, "convertPointToTextAnimationsCoordinateSpace:", x, y);
        x = v12;
        y = v13;
        goto LABEL_8;
      }
      objc_msgSend(v7, "_asNSTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertPointToTextAnimationsCoordinateSpace:textRange:", v9, x, y);
    }
    x = v10;
    y = v11;

  }
LABEL_8:

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)_animatorForTextAnimation:(id)a3
{
  if ((*((_BYTE *)&self->_tvFlags + 2) & 0x40) == 0)
    return 0;
  -[NSCustomTextRendering animatorForTextAnimation:](self->_customRenderController, "animatorForTextAnimation:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_animatorForTextAnimation:(id)a3 notify:(id)a4
{
  if ((*((_BYTE *)&self->_tvFlags + 2) & 0x40) == 0)
    return 0;
  -[NSCustomTextRendering animatorForTextAnimation:notify:](self->_customRenderController, "animatorForTextAnimation:notify:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addGhostedRange:(id)a3
{
  if (a3)
    -[_UITextLayoutController addGhostedRange:](self->_textLayoutController, "addGhostedRange:");
}

- (void)removeAllGhostedRanges
{
  -[_UITextLayoutController removeAllGhostedRanges](self->_textLayoutController, "removeAllGhostedRanges");
}

- (void)addInvisibleRange:(id)a3
{
  -[_UITextLayoutController addInvisibleRange:](self->_textLayoutController, "addInvisibleRange:", a3);
}

- (void)removeInvisibleRange:(id)a3
{
  -[_UITextLayoutController removeInvisibleRange:](self->_textLayoutController, "removeInvisibleRange:", a3);
}

- (BOOL)shouldPresentSheetsInAWindowLayeredAboveTheKeyboard
{
  return (*(_BYTE *)&self->_tvFlags >> 6) & 1;
}

- (BOOL)_shouldShowEditMenu
{
  _BOOL4 v3;

  v3 = -[UITextView _showsEditMenu](self, "_showsEditMenu");
  if (v3)
    LOBYTE(v3) = !-[UITextView _shouldSuppressEditMenuForTextFormatting](self, "_shouldSuppressEditMenuForTextFormatting");
  return v3;
}

- (void)setShouldPresentSheetsInAWindowLayeredAboveTheKeyboard:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setNeedsFrameUpdateForSurface:(id)a3
{
  id v3;

  -[_UITextContainerView canvasView](self->_containerView, "canvasView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_setNeedsFrameUpdateForCustomRendering
{
  void *v3;
  void *v4;
  id v5;

  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[UIScrollView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_tvFlags + 3) & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v4, "_textViewDidChangeCustomRenderBounds:", self);
    v4 = v5;
  }

}

- (void)_setNeedsLayoutForInteraction
{
  id v2;

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeTextRangeAdjustment");

}

- (void)_willDrawContentOfSurface:(id)a3 withBlock:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = (void (**)(_QWORD))a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v10 = _willDrawContentOfSurface_withBlock____s_category;
    if (!_willDrawContentOfSurface_withBlock____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_willDrawContentOfSurface_withBlock____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v12, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v7);

  v8 = (void *)_UISetCurrentFallbackEnvironment(self);
  v5[2](v5);

  _UIRestorePreviousFallbackEnvironment(v8);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v6);

}

- (void)_showTextFormattingOptions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UITextView _configurationForTextFormattingOptions](self, "_configurationForTextFormattingOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[UITextView _prepareForTextFormattingControllerPresentationWithConfiguration:sender:](self, "_prepareForTextFormattingControllerPresentationWithConfiguration:sender:", v4, v5);

}

- (void)_showTextFormattingAnimationOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  if (self->_allowsTextAnimations)
  {
    v12 = v4;
    -[UIResponder _endWritingTools](self, "_endWritingTools");
    -[UITextView _supportedAnimationNamesForTextFormatting](self, "_supportedAnimationNamesForTextFormatting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView _supportedAnimationTitlesForTextFormatting](self, "_supportedAnimationTitlesForTextFormatting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView _supportedAnimationAccessibilityHintsForTextFormatting](self, "_supportedAnimationAccessibilityHintsForTextFormatting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextFormattingViewControllerConfiguration _forTextAnimationsUIWithSupportedAnimationNames:titles:accessibilityHints:](UITextFormattingViewControllerConfiguration, "_forTextAnimationsUIWithSupportedAnimationNames:titles:accessibilityHints:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIView isFirstResponder](self, "isFirstResponder")
      && (-[UIView traitCollection](self, "traitCollection"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "userInterfaceIdiom"),
          v9,
          !v10))
    {
      +[UISubstituteKeyboardSession sharedSession](UITextFormattingKeyboardSession, "sharedSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "showForResponder:sender:", self, self);

      -[UITextView _updateTextFormattingController](self, "_updateTextFormattingController");
    }
    else
    {
      -[UITextView _prepareForTextFormattingControllerPresentationWithConfiguration:sender:](self, "_prepareForTextFormattingControllerPresentationWithConfiguration:sender:", v8, v12);
    }

    v4 = v12;
  }

}

- (void)_hideTextFormattingOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UIView traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom"))
  {

  }
  else
  {
    +[UISubstituteKeyboardSession activeSession](UITextFormattingKeyboardSession, "activeSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[UISubstituteKeyboardSession activeSession](UITextFormattingKeyboardSession, "activeSession");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hideForResponder:", self);

      return;
    }
  }
  if (self->_textFormattingViewController)
    -[UITextView _dismissTextFormattingControllerIfNeededWithAnimation:](self, "_dismissTextFormattingControllerIfNeededWithAnimation:", 1);
}

- (id)_configurationForTextFormattingOptions
{
  return self->_textFormattingConfiguration;
}

- (id)_descriptorForTextFormattingOptions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UITextFormattingViewControllerFormattingDescriptor *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  UITextFormattingViewControllerFormattingDescriptor *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  NSTextStorage *textStorage;
  void *v36;
  id v37;
  id obj;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__210;
  v59 = __Block_byref_object_dispose__210;
  v60 = 0;
  -[UITextView _configurationForTextFormattingOptions](self, "_configurationForTextFormattingOptions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[UITextView selectedRange](self, "selectedRange");
  v5 = v4;
  if (v4 && (v6 = v3, v3 + v4 <= (unint64_t)-[NSTextStorage length](self->_textStorage, "length")))
  {
    v30 = -[UITextFormattingViewControllerFormattingDescriptor initWithString:range:]([UITextFormattingViewControllerFormattingDescriptor alloc], "initWithString:range:", self->_textStorage, v6, v5);
    v31 = (void *)v56[5];
    v56[5] = (uint64_t)v30;

    objc_msgSend(v40, "formattingStyles");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v40, "formattingStyles");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count") == 0;

      if (!v34)
      {
        textStorage = self->_textStorage;
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __49__UITextView__descriptorForTextFormattingOptions__block_invoke;
        v52[3] = &unk_1E16E6A00;
        v53 = v40;
        v54 = &v55;
        -[NSTextStorage enumerateAttributesInRange:options:usingBlock:](textStorage, "enumerateAttributesInRange:options:usingBlock:", v6, v5, 0, v52);
        v14 = v53;
LABEL_28:

      }
    }
  }
  else
  {
    v7 = [UITextFormattingViewControllerFormattingDescriptor alloc];
    -[UITextView typingAttributes](self, "typingAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UITextFormattingViewControllerFormattingDescriptor initWithAttributes:](v7, "initWithAttributes:", v8);
    v10 = (void *)v56[5];
    v56[5] = v9;

    objc_msgSend(v40, "formattingStyles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v40, "formattingStyles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count") == 0;

      if (!v13)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v40, "formattingStyles");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        if (v15)
        {
          obj = v14;
          v42 = *(_QWORD *)v49;
          while (2)
          {
            v41 = v15;
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v49 != v42)
                objc_enumerationMutation(obj);
              v43 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              objc_msgSend(v43, "attributes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "allKeys");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v45;
                do
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v45 != v21)
                      objc_enumerationMutation(v19);
                    v23 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
                    -[UITextView typingAttributes](self, "typingAttributes");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "valueForKey:", v23);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v25)
                    {
                      -[UITextView typingAttributes](self, "typingAttributes");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "valueForKey:", v23);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "setValue:forKey:", v27, v23);

                    }
                  }
                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
                }
                while (v20);
              }

              objc_msgSend(v43, "attributes");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "isEqualToDictionary:", v17);

              if (v29)
              {
                objc_msgSend(v43, "styleKey");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v56[5], "setFormattingStyleKey:", v36);

                goto LABEL_27;
              }

            }
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
            if (v15)
              continue;
            break;
          }
LABEL_27:
          v14 = obj;
        }
        goto LABEL_28;
      }
    }
  }
  v37 = (id)v56[5];

  _Block_object_dispose(&v55, 8);
  return v37;
}

void __49__UITextView__descriptorForTextFormattingOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = a1;
  objc_msgSend(*(id *)(a1 + 32), "formattingStyles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "attributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v6, "valueForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                objc_msgSend(v6, "valueForKey:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setValue:forKey:", v18, v16);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v13);
        }

        objc_msgSend(v8, "attributes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToDictionary:", v9);

        if (v20)
        {
          objc_msgSend(v8, "styleKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v22 + 40) + 8) + 40), "setFormattingStyleKey:", v21);

          *a5 = 1;
          goto LABEL_20;
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v26)
        continue;
      break;
    }
  }
LABEL_20:

}

- (id)_disabledComponentsForTextFormattingOptions
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = -[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager");
  v3 = (void *)MEMORY[0x1E0C99E60];
  if (!v2)
    return (id)objc_opt_new();
  v7[0] = CFSTR("UITextFormattingViewControllerListStylesComponent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_supportedAnimationNamesForTextFormatting
{
  return 0;
}

- (id)_supportedAnimationTitlesForTextFormatting
{
  return 0;
}

- (id)_supportedAnimationAccessibilityHintsForTextFormatting
{
  return 0;
}

- (BOOL)_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded
{
  return 1;
}

- (void)setTextFormattingConfiguration:(id)a3
{
  UITextFormattingViewControllerConfiguration *v4;
  UITextFormattingViewControllerConfiguration *textFormattingConfiguration;

  v4 = (UITextFormattingViewControllerConfiguration *)objc_msgSend(a3, "copy");
  textFormattingConfiguration = self->_textFormattingConfiguration;
  self->_textFormattingConfiguration = v4;

}

- (UITextFormattingViewControllerConfiguration)textFormattingConfiguration
{
  return self->_textFormattingConfiguration;
}

- (BOOL)_areDefaultTextFormattingAffordancesAvailable
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!self->_canShowTextFormattingOptions)
    return 0;
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") != 6
    && -[UITextView isEditable](self, "isEditable")
    && -[UITextView isSelectable](self, "isSelectable")
    && -[UITextView allowsEditingTextAttributes](self, "allowsEditingTextAttributes"))
  {
    -[UITextView _configurationForTextFormattingOptions](self, "_configurationForTextFormattingOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[UITextView _supportedAnimationNamesForTextFormatting](self, "_supportedAnimationNamesForTextFormatting");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 == 0;

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

- (BOOL)_isTextFormattingInProgress
{
  BOOL v2;
  void *v3;

  if (-[UITextView _isTextFormattingControllerPresented](self, "_isTextFormattingControllerPresented"))
    return 1;
  +[UISubstituteKeyboardSession activeSession](UITextFormattingKeyboardSession, "activeSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (BOOL)_isTextFormattingControllerPresented
{
  UITextFormattingViewController *textFormattingViewController;
  void *v3;
  BOOL v4;

  textFormattingViewController = self->_textFormattingViewController;
  if (!textFormattingViewController)
    return 0;
  -[UIViewController presentingViewController](textFormattingViewController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_isInCompactHorizontalSizeClass
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass") == 1;

  return v3;
}

- (BOOL)_shouldHideInputViewsForTextFormatting
{
  UITextFormattingViewController *textFormattingViewController;
  void *v4;
  UITextView *v5;
  uint64_t v6;
  void *v7;
  UITextView *v8;
  int v9;
  void *v10;

  textFormattingViewController = self->_textFormattingViewController;
  if (textFormattingViewController)
  {
    -[UIViewController popoverPresentationController](textFormattingViewController, "popoverPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceView");
    v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
    -[UIView superview](self, "superview");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (UITextView *)v6;
    else
      v8 = self;
    if (v5 == v8)
    {
      -[UITextFormattingViewController configuration](self->_textFormattingViewController, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "_isTextAnimationsConfiguration") ^ 1;

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)_shouldSuppressEditMenuForTextFormatting
{
  UITextFormattingViewController *textFormattingViewController;
  void *v4;
  UITextView *v5;
  uint64_t v6;
  void *v7;
  UITextView *v8;
  BOOL v9;
  void *v11;

  textFormattingViewController = self->_textFormattingViewController;
  if (!textFormattingViewController)
    return -[UITextFormattingViewControllerConfiguration _isTextAnimationsConfiguration](self->_textFormattingRestorationConfiguration, "_isTextAnimationsConfiguration");
  -[UIViewController popoverPresentationController](textFormattingViewController, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceView");
  v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  -[UIView superview](self, "superview");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (UITextView *)v6;
  else
    v8 = self;
  if (v5 == v8)
  {
    -[UITextFormattingViewController configuration](self->_textFormattingViewController, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v11, "_isTextAnimationsConfiguration") & 1) != 0
      || -[UITextFormattingViewControllerConfiguration _isTextAnimationsConfiguration](self->_textFormattingRestorationConfiguration, "_isTextAnimationsConfiguration");

  }
  else
  {
    v9 = -[UITextFormattingViewControllerConfiguration _isTextAnimationsConfiguration](self->_textFormattingRestorationConfiguration, "_isTextAnimationsConfiguration");
  }

  return v9;
}

- (void)_textViewWillPresentTextFormattingOptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_prepareForTextFormattingControllerPresentationWithConfiguration:(id)a3 sender:(id)a4
{
  id v6;
  UITextFormattingViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  UITextView *v20;
  void *v21;
  void *v22;
  UITextFormattingViewController *textFormattingViewController;
  id v24;

  v24 = a3;
  v6 = a4;
  if (self->_canShowTextFormattingOptions)
  {
    if (self->_textFormattingViewController)
    {
      -[UITextView _dismissTextFormattingControllerIfNeededWithAnimation:](self, "_dismissTextFormattingControllerIfNeededWithAnimation:", 1);
      goto LABEL_22;
    }
    objc_msgSend(v24, "set_preferringDimmingVisible:", 0);
    objc_msgSend(v24, "set_textViewConfiguration:", 1);
    v7 = -[UITextFormattingViewController initWithConfiguration:]([UITextFormattingViewController alloc], "initWithConfiguration:", v24);
    -[UITextFormattingViewController _setInternalDelegate:](v7, "_setInternalDelegate:", self);
    -[UITextFormattingViewController _setEditResponder:](v7, "_setEditResponder:", self);
    -[UIViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 7);
    -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCanOverlapSourceViewRect:", 1);

    -[UIViewController sheetPresentationController](v7, "sheetPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrefersEdgeAttachedInCompactHeight:", 1);

    -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setShouldDimPresentingViewTint:", 0);

    if (objc_msgSend(v24, "_isTextAnimationsConfiguration"))
    {
      -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", v7);

    }
    if (-[UITextView _isInCompactHorizontalSizeClass](self, "_isInCompactHorizontalSizeClass")
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_msgSend(v24, "_isTextAnimationsConfiguration"))
          v15 = 2;
        else
          v15 = 15;
        -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPermittedArrowDirections:", v15);

        -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView superview](self, "superview");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (UITextView *)v18;
        else
          v20 = self;
        objc_msgSend(v17, "setSourceView:", v20);

        -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_setShouldHideArrow:", objc_msgSend(v24, "_isTextAnimationsConfiguration") ^ 1);

        if (-[UITextView _isInCompactHorizontalSizeClass](self, "_isInCompactHorizontalSizeClass"))
        {
          -[UITextFormattingViewController _setShouldDeferFontPickerPresentationToViewController:](v7, "_setShouldDeferFontPickerPresentationToViewController:", 0);
LABEL_21:
          textFormattingViewController = self->_textFormattingViewController;
          self->_textFormattingViewController = v7;

          -[UITextView _updateTextFormattingController](self, "_updateTextFormattingController");
          -[UITextView _presentTextFormattingController](self, "_presentTextFormattingController");
          goto LABEL_22;
        }
LABEL_20:
        -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextFormattingViewController _setShouldDeferFontPickerPresentationToViewController:](v7, "_setShouldDeferFontPickerPresentationToViewController:", v22);

        goto LABEL_21;
      }
      -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPermittedArrowDirections:", 15);

      -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSourceView:", v6);
    }
    else
    {
      -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPermittedArrowDirections:", 15);

      -[UIViewController popoverPresentationController](v7, "popoverPresentationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBarButtonItem:", v6);
    }

    goto LABEL_20;
  }
LABEL_22:

}

- (void)_presentTextFormattingController
{
  void *v3;
  UITextFormattingViewController *textFormattingViewController;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (self->_textFormattingViewController)
  {
    -[UITextView _textViewWillPresentTextFormattingOptions](self, "_textViewWillPresentTextFormattingOptions");
    objc_initWeak(&location, self);
    -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    textFormattingViewController = self->_textFormattingViewController;
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __46__UITextView__presentTextFormattingController__block_invoke;
    v8 = &unk_1E16B3F40;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "presentViewController:animated:completion:", textFormattingViewController, 1, &v5);

    -[UITextView _startSuppressingKeyboardForTextFormatting:](self, "_startSuppressingKeyboardForTextFormatting:", self->_textFormattingViewController, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __46__UITextView__presentTextFormattingController__block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  void *v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(WeakRetained, "_isInCompactHorizontalSizeClass"))
    objc_msgSend(WeakRetained, "_adjustBottomContentInsetForTextFormattingController:", 1);
  v2 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissMenuForInputUI");

}

- (void)_updateTextFormattingController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    +[UISubstituteKeyboardSession activeSession](UITextFormattingKeyboardSession, "activeSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      +[UISubstituteKeyboardSession activeSession](UITextFormattingKeyboardSession, "activeSession");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView _descriptorForTextFormattingOptions](self, "_descriptorForTextFormattingOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFormattingDescriptor:", v5);

    }
  }
  if (self->_textFormattingViewController)
  {
    -[UITextView _descriptorForTextFormattingOptions](self, "_descriptorForTextFormattingOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewController setFormattingDescriptor:](self->_textFormattingViewController, "setFormattingDescriptor:", v6);

    -[UITextView _updateTextFormattingControllerPresentationSource](self, "_updateTextFormattingControllerPresentationSource");
  }
}

- (id)_scrollViewToAdjustForTextFormattingController
{
  uint64_t v3;
  void *v4;
  UITextView *v5;
  UITextView *v6;
  uint64_t v7;
  UITextView *v8;
  UITextView *v9;

  -[UIView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = 0;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v4;

        v5 = v6;
      }
      objc_msgSend(v4, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v8 = v5;
  else
    v8 = self;
  v9 = v8;

  return v9;
}

- (void)_adjustBottomContentInsetForTextFormattingController:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  id *v20;
  id *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  _QWORD v38[5];
  _QWORD aBlock[5];

  v3 = a3;
  if (!-[UITextView _shouldAdjustKeyboardGuidesForTextFormattingIfNeeded](self, "_shouldAdjustKeyboardGuidesForTextFormattingIfNeeded"))
  {
    -[UITextView _scrollViewToAdjustForTextFormattingController](self, "_scrollViewToAdjustForTextFormattingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    if (v3)
    {
      -[UITextView _textFormattingControllerOverlapHeight](self, "_textFormattingControllerOverlapHeight");
      v9 = v8;
      objc_msgSend(v5, "adjustedContentInset");
      v11 = v9 - v10;
      if (v9 - v10 <= 0.0)
      {
LABEL_9:

        return;
      }
      objc_msgSend(v5, "contentInset");
      objc_msgSend(v5, "contentInset");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v11 + v18;
      v37[0] = v6;
      v37[1] = 3221225472;
      v37[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_2;
      v37[3] = &unk_1E16B20D8;
      v20 = (id *)v38;
      v38[0] = v5;
      v38[1] = v13;
      v38[2] = v15;
      *(double *)&v38[3] = v19;
      v38[4] = v17;
      v35[0] = v6;
      v35[1] = 3221225472;
      v21 = &v36;
      v35[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_3;
      v35[3] = &unk_1E16B1BA0;
      v36 = v7;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v37, v35, 0.2);
      self->_bottomContentInsetTextFormattingAdjustment = v11;
      self->_bottomContentInsetAfterTextFormattingAdjustment = v19;
    }
    else
    {
      if (self->_bottomContentInsetTextFormattingAdjustment <= 0.0)
        goto LABEL_9;
      objc_msgSend(v5, "contentInset");
      if (v22 != self->_bottomContentInsetAfterTextFormattingAdjustment)
        goto LABEL_9;
      objc_msgSend(v5, "contentInset");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29 - self->_bottomContentInsetTextFormattingAdjustment;
      v33[0] = v6;
      v33[1] = 3221225472;
      v33[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_4;
      v33[3] = &unk_1E16B20D8;
      v20 = (id *)v34;
      v34[0] = v5;
      v34[1] = v24;
      v34[2] = v26;
      *(double *)&v34[3] = v30;
      v34[4] = v28;
      v31[0] = v6;
      v31[1] = 3221225472;
      v21 = &v32;
      v31[2] = __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_5;
      v31[3] = &unk_1E16B1BA0;
      v32 = v7;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v33, v31, 0.2);
    }

    goto LABEL_9;
  }
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isScrollEnabled");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "scrollSelectionToVisible:", 1);
  else
    return objc_msgSend(v3, "_scrollSelectionToVisibleInContainingScrollView:", 1);
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __67__UITextView__adjustBottomContentInsetForTextFormattingController___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)_textFormattingControllerOverlapHeight
{
  double height;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = 0.0;
  if (self->_textFormattingViewController
    && -[UITextView _isInCompactHorizontalSizeClass](self, "_isInCompactHorizontalSizeClass"))
  {
    -[UIViewController view](self->_textFormattingViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_textFormattingViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeAreaLayoutGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutFrame");
    objc_msgSend(v4, "convertRect:toView:", 0);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[UITextView _scrollViewToAdjustForTextFormattingController](self, "_scrollViewToAdjustForTextFormattingController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    objc_msgSend(v16, "convertRect:toView:", 0);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    v28.origin.x = v18;
    v28.origin.y = v20;
    v28.size.width = v22;
    v28.size.height = v24;
    v27 = CGRectIntersection(v26, v28);
    height = v27.size.height;

  }
  return height;
}

- (BOOL)_preserveSelectionDisplayForTextFormatting
{
  return self->_textFormattingViewController && self->_forceSelectionDisplayForTextFormatting;
}

- (void)_prepareForTextFormattingRestorationIfNeeded
{
  void *v3;
  int v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isPreservedRestorableResponder:", self);

  if (v4)
    -[UITextView _prepareForTextFormattingRestoration](self, "_prepareForTextFormattingRestoration");
}

- (void)_prepareForTextFormattingRestoration
{
  void *v3;
  int v4;
  UITextFormattingViewControllerConfiguration *v5;
  UITextFormattingViewControllerConfiguration *textFormattingRestorationConfiguration;

  -[UITextFormattingViewController configuration](self->_textFormattingViewController, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isTextAnimationsConfiguration");

  if (v4)
  {
    -[UITextFormattingViewController configuration](self->_textFormattingViewController, "configuration");
    v5 = (UITextFormattingViewControllerConfiguration *)objc_claimAutoreleasedReturnValue();
    textFormattingRestorationConfiguration = self->_textFormattingRestorationConfiguration;
    self->_textFormattingRestorationConfiguration = v5;

  }
}

- (void)_performTextFormattingRestorationIfNeeded
{
  void *v3;
  int v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isPreservedRestorableResponder:", self);

  if (v4)
    -[UITextView _performTextFormattingRestoration](self, "_performTextFormattingRestoration");
}

- (void)_performTextFormattingRestoration
{
  UITextFormattingViewController *textFormattingViewController;
  UITextFormattingViewControllerConfiguration *textFormattingRestorationConfiguration;

  if (self->_textFormattingRestorationConfiguration)
  {
    textFormattingViewController = self->_textFormattingViewController;
    self->_textFormattingViewController = 0;

    if (-[UITextFormattingViewControllerConfiguration _isTextAnimationsConfiguration](self->_textFormattingRestorationConfiguration, "_isTextAnimationsConfiguration"))
    {
      -[UITextView _showTextFormattingAnimationOptions:](self, "_showTextFormattingAnimationOptions:", 0);
    }
    else
    {
      -[UITextView _prepareForTextFormattingControllerPresentationWithConfiguration:sender:](self, "_prepareForTextFormattingControllerPresentationWithConfiguration:sender:", self->_textFormattingRestorationConfiguration, self);
    }
    textFormattingRestorationConfiguration = self->_textFormattingRestorationConfiguration;
    self->_textFormattingRestorationConfiguration = 0;

  }
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  BOOL v2;
  objc_super v4;

  if (self->_textFormattingViewController && self->_textFormattingKeyboardSuppressionAssertion)
  {
    v2 = 1;
    self->_didDisableAutomaticKeyboardBehaviorForTextFormatting = 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITextView;
    return -[UIResponder _disableAutomaticKeyboardBehavior](&v4, sel__disableAutomaticKeyboardBehavior);
  }
  return v2;
}

- (id)_attributedPlaceholder
{
  void *v1;

  if (a1)
  {
    v1 = *(void **)(a1 + 2224);
    if (v1)
      return v1;
    objc_msgSend(*(id *)(a1 + 2216), "attributedText");
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (void)_setOverridePlaceholder:(id)a3 alignment:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSAttributedString *v9;
  NSAttributedString *overriddenPlaceholder;
  NSAttributedString *v11;
  NSTextAlignment v12;
  NSAttributedString *v13;
  id v14;

  v6 = a3;
  v14 = v6;
  if (self->_overriddenPlaceholder)
  {
    if (v6)
    {
      -[UITextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:", v6);
      -[UILabel setTextAlignment:](self->_placeholderLabel, "setTextAlignment:", a4);
    }
    else
    {
      -[UITextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:");
      -[UILabel setTextAlignment:](self->_placeholderLabel, "setTextAlignment:", self->_overriddenPlaceholderAlignment);
      overriddenPlaceholder = self->_overriddenPlaceholder;
      self->_overriddenPlaceholder = 0;

    }
  }
  else if (v6)
  {
    -[UITextView attributedPlaceholder](self, "attributedPlaceholder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
    v11 = v9;

    v12 = -[UILabel textAlignment](self->_placeholderLabel, "textAlignment");
    -[UITextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:", v14);
    -[UILabel setTextAlignment:](self->_placeholderLabel, "setTextAlignment:", a4);
    v13 = self->_overriddenPlaceholder;
    self->_overriddenPlaceholder = v11;

    self->_overriddenPlaceholderAlignment = v12;
  }
  -[UITextView _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");

}

- (void)_setTextSizeCacheEnabled:(BOOL)a3
{
  uint64_t v3;
  _UITextSizeCache *intrinsicSizeCache;

  if (((((*(_QWORD *)&self->_tvFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    v3 = 1024;
    if (!a3)
      v3 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFFBFFLL | v3);
    if (!a3)
    {
      intrinsicSizeCache = self->_intrinsicSizeCache;
      self->_intrinsicSizeCache = 0;

    }
  }
}

- (BOOL)_isTextSizeCacheEnabled
{
  return (*((unsigned __int8 *)&self->_tvFlags + 1) >> 2) & 1;
}

- (BOOL)hasText
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "hasText");

  return v3;
}

- (void)insertText:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "insertText:", v4);

}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  objc_msgSend(off_1E1679D20, "attributedText:withAlternativeTexts:style:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v8, 0, objc_msgSend(v9, "length"));

  -[UITextView insertAttributedText:](self, "insertAttributedText:", v9);
}

- (void)insertText:(id)a3 style:(int64_t)a4 alternatives:(id)a5
{
  -[UITextView insertText:alternatives:style:](self, "insertText:alternatives:style:", a3, a5, a4);
}

- (void)addTextAlternatives:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "addTextAlternatives:", v4);

}

- (void)removeEmojiAlternatives
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "removeEmojiAlternatives");

}

- (void)deleteBackward
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "deleteBackward");

}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[5];

  if (a3)
  {
    -[UITextView deleteBackward](self, "deleteBackward");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__UITextView__deleteBackwardAndNotify___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    objc_msgSend(WeakRetained, "_performWhileSuppressingDelegateNotifications:", v5);

  }
}

void __39__UITextView__deleteBackwardAndNotify___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 2120));
  objc_msgSend(WeakRetained, "deleteBackward");

}

- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "textLengthToDeleteBeforeSelectedRangeForSmartDelete");

  return v3;
}

- (void)beginSelectionChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "beginSelectionChange");

}

- (void)endSelectionChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "endSelectionChange");

}

- (void)updateSelectionImmediately
{
  id v2;

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDisplayedSelection");

}

- (BOOL)_restoreFirstResponder
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    if (-[UIResponder _restoreFirstResponder](&v7, sel__restoreFirstResponder))
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v3, "checkEditabilityAndSetFirstResponderIfNecessary");
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
    goto LABEL_5;
LABEL_3:
  -[UITextView _performTextFormattingRestorationIfNeeded](self, "_performTextFormattingRestorationIfNeeded");
  v5 = 1;
LABEL_6:

  return v5;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[UITextView interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginFloatingCursorAtPoint:", x, y);

}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[UITextView interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFloatingCursorAtPoint:", x, y);

}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  id v7;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[UITextView interactionAssistant](self, "interactionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateFloatingCursorAtPoint:animated:", v4, x, y);

}

- (void)endFloatingCursor
{
  id v2;

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endFloatingCursor");

}

- (BOOL)canBecomeFocused
{
  UITextView *v2;
  void *v3;

  v2 = self;
  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "textViewCanBecomeFocused:", v2);

  return (char)v2;
}

- (id)_defaultFocusEffect
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UITextView visibleTextRect](self, "visibleTextRect");
  -[UIView convertRect:toView:](self, "convertRect:toView:", 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  __int16 v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x200) != 0)
  {
    _UIFocusGroupIdentifierForInstance(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextView;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_diagnoseFocusabilityForReport:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[UITextView isSelectable](self, "isSelectable"))
  {
    +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("This text view is not selectable. Text views must return YES from -isSelectable in order to be focusable."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addIssue:", v4);

  }
}

- (id)editMenuForTextRange:(id)a3 suggestedActions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[UITextView _implementsEditMenu](self, "_implementsEditMenu"))
  {
    v8 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:", v6);
    v10 = v9;
    -[UIScrollView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textView:editMenuForTextInRange:suggestedActions:", self, v8, v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)willPresentEditMenuWithAnimator:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIScrollView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textView:willPresentEditMenuWithAnimator:", self, v7);

  }
}

- (void)willDismissEditMenuWithAnimator:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIScrollView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textView:willDismissEditMenuWithAnimator:", self, v7);

  }
}

- (void)_logWarningForMenuControllerUsage
{
  unint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = _logWarningForMenuControllerUsage___s_category_0;
  if (!_logWarningForMenuControllerUsage___s_category_0)
  {
    v2 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_logWarningForMenuControllerUsage___s_category_0);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Using UIMenuController to add items into text menus is deprecated. Please implement the UITextViewDelegate API textView:editMenuForTextInRange:suggestedActions: instead.", v4, 2u);
  }
}

- (CGPoint)_contentOffsetForScrollToVisible:(_NSRange)a3
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", a3.location, a3.length);
  v5 = v4;
  v7 = v6;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v9 = v8;
  v11 = v10;
  -[UIView bounds](self, "bounds");
  v14 = v13 - (v9 + v11);
  if (v14 <= v7)
    v15 = 0.0;
  else
    v15 = v9;
  v16 = -0.0;
  if (v14 > v7)
    v16 = v9;
  v17 = v12 + v16;
  if (v14 <= v7)
    v18 = v13;
  else
    v18 = v14;
  -[UIScrollView contentOffset](self, "contentOffset");
  if (v5 + v7 >= v18 + v17)
  {
    v20 = v5 + v7 - v18;
  }
  else if (v5 < v17)
  {
    v20 = v5 - v15;
  }
  result.y = v20;
  result.x = v19;
  return result;
}

- (id)_previewRendererForRange:(id)a3 unifyRects:(BOOL)a4
{
  return (id)-[_UITextLayoutController previewRendererForRange:unifyRects:](self->_textLayoutController, "previewRendererForRange:unifyRects:", a3, a4);
}

- (CGRect)_boundingRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UITextLayoutController boundingRectForRange:](self->_textLayoutController, "boundingRectForRange:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_setSiriAnimationDictationStyleWithCharacterInsertionRate:(double)a3 minimumDurationBetweenHypotheses:(double)a4
{
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *siriParameters;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("_UITextViewSiriAnimationStyleDictationRate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("_UITextViewSiriAnimationStyleDictationDuration");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  siriParameters = self->_siriParameters;
  self->_siriParameters = v8;

}

- (id)extractWordArrayFromTokensArray:(id)a3
{
  id v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CFIndex v15;
  const __CFLocale *v16;
  __CFStringTokenizer *v17;
  CFRange CurrentTokenRange;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CFRange v26;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        v11 = v8;
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v11, "removeSpaceAfter", (_QWORD)v20) & 1) == 0
          && (objc_msgSend(v12, "removeSpaceBefore") & 1) == 0)
        {
          -[__CFString appendString:](v4, "appendString:", CFSTR(" "));
        }
        objc_msgSend(v12, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendString:](v4, "appendString:", v13);

        v8 = v12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);

    if (v8 && (objc_msgSend(v8, "removeSpaceAfter") & 1) == 0)
      -[__CFString appendString:](v4, "appendString:", CFSTR(" "));
  }
  else
  {

    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", (_QWORD)v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[__CFString length](v4, "length");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v16 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
  v26.location = 0;
  v26.length = v15;
  v17 = CFStringTokenizerCreate(0, v4, v26, 3uLL, v16);
  while (1)
  {

    if (!CFStringTokenizerAdvanceToNextToken(v17))
      break;
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v17);
    -[__CFString substringWithRange:](v4, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    v16 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);
  }
  CFRelease(v17);

  return v14;
}

- (void)_didRecognizeSpeechTokens:(id)a3
{
  id v4;

  -[UITextView extractWordArrayFromTokensArray:](self, "extractWordArrayFromTokensArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView _didRecognizeSpeechStrings:](self, "_didRecognizeSpeechStrings:", v4);

}

- (void)_didRecognizeSpeechStrings:(id)a3
{
  void *v4;
  void *v5;
  _UICharacterStreamingManager *v6;
  _UICharacterStreamingManager *characterStreamingManager;
  NSDictionary *siriParameters;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UITextView interactionAssistant](self, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectionDisplayVisible:", 0);

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateSelection");

  if (!self->_characterStreamingManager)
  {
    v6 = -[_UICharacterStreamingManager initWithTextView:]([_UICharacterStreamingManager alloc], "initWithTextView:", self);
    characterStreamingManager = self->_characterStreamingManager;
    self->_characterStreamingManager = v6;

    siriParameters = self->_siriParameters;
    if (siriParameters)
    {
      -[NSDictionary objectForKeyedSubscript:](siriParameters, "objectForKeyedSubscript:", CFSTR("_UITextViewSiriAnimationStyleDictationDuration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[_UICharacterStreamingManager setMinDurationBetweenHypotheses:](self->_characterStreamingManager, "setMinDurationBetweenHypotheses:");

      -[NSDictionary objectForKeyedSubscript:](self->_siriParameters, "objectForKeyedSubscript:", CFSTR("_UITextViewSiriAnimationStyleDictationRate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      -[_UICharacterStreamingManager setStreamingCharacterInsertionRate:](self->_characterStreamingManager, "setStreamingCharacterInsertionRate:");

    }
  }
  -[_UICharacterStreamingManager setWords:](self->_characterStreamingManager, "setWords:", v11);

}

- (void)_didFinishSpeechRecognition
{
  _UICharacterStreamingManager *characterStreamingManager;

  characterStreamingManager = self->_characterStreamingManager;
  if (characterStreamingManager)
  {
    -[_UICharacterStreamingManager commitFinalResults](characterStreamingManager, "commitFinalResults");
    -[_UICharacterStreamingManager _stopStreamingAnimation](self->_characterStreamingManager, "_stopStreamingAnimation");
  }
}

- (void)_restoreScrollPosition:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v7 = objc_msgSend(v15, "range");
  -[UITextView _contentOffsetForScrollToVisible:](self, "_contentOffsetForScrollToVisible:", v7, v8);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v15, "offsetWithinLine");
  v14 = v12 + v13;
  if (v4)
  {
    -[UIScrollView _setContentOffset:animated:animationCurve:](self, "_setContentOffset:animated:animationCurve:", 1, 0, v10, v14);
    objc_storeStrong((id *)&self->_scrollTarget, a3);
  }
  else
  {
    -[UITextView setContentOffset:](self, "setContentOffset:", v10, v14);
  }

}

- (id)_restorableScrollPositionForStateRestoration
{
  return +[_UITextViewRestorableScrollPosition restorableScrollPositionForStateRestoration:](_UITextViewRestorableScrollPosition, "restorableScrollPositionForStateRestoration:", self);
}

- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  +[_UITextViewRestorableScrollPosition restorableScrollPositionWithRange:](_UITextViewRestorableScrollPosition, "restorableScrollPositionWithRange:", a3.location, a3.length);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView _restoreScrollPosition:animated:](self, "_restoreScrollPosition:animated:", v6, v4);

}

- (void)scrollRangeToVisible:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _BOOL8 v6;

  length = range.length;
  location = range.location;
  if (dyld_program_sdk_at_least())
    v6 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  else
    v6 = 1;
  -[UITextView _scrollRangeToVisible:animated:](self, "_scrollRangeToVisible:animated:", location, length, v6);
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[UITextView selectedRange](self, "selectedRange");
  -[UITextView _rectForScrollToVisible:](self, "_rectForScrollToVisible:", v5, v6);
  -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v3);
}

- (CGPoint)_contentOffsetForScrollingToRect:(CGRect)a3
{
  double height;
  double y;
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
  double v16;
  double v17;
  objc_super v18;
  CGPoint result;

  height = a3.size.height;
  y = a3.origin.y;
  v18.receiver = self;
  v18.super_class = (Class)UITextView;
  -[UIScrollView _contentOffsetForScrollingToRect:](&v18, sel__contentOffsetForScrollingToRect_, a3.origin.x, a3.origin.y, a3.size.width);
  v7 = v6;
  v9 = v8;
  if (!dyld_program_sdk_at_least())
  {
    y = v9;
    goto LABEL_16;
  }
  -[UIView bounds](self, "bounds");
  if (v10 - y >= 0.0)
    v12 = v10 - y;
  else
    v12 = -(v10 - y);
  v13 = v10 + v11;
  v14 = y + height;
  v15 = v10 + v11 - (y + height);
  if (v15 < 0.0)
    v15 = -v15;
  if (v15 >= v12)
  {
    if (y < v10)
      goto LABEL_16;
    y = v9;
    if (v14 < v13)
      goto LABEL_16;
LABEL_15:
    y = v14 - v11;
    goto LABEL_16;
  }
  if (v14 >= v13)
    goto LABEL_15;
  if (y >= v10)
    y = v9;
LABEL_16:
  v16 = v7;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGRect)_rectToScrollToVisibleInCellInWindow:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  objc_super v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect result;
  CGRect v57;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[UIResponder _textInteraction](self, "_textInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "selectedTextRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "selectionRectsForRange:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    height = v8;
    width = v7;
    y = v6;
    x = v5;
    if (v13)
    {
      v18 = v13;
      v19 = *(_QWORD *)v46;
      height = v8;
      width = v7;
      y = v6;
      x = v5;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v20), "rect");
          v57.origin.x = v21;
          v57.origin.y = v22;
          v57.size.width = v23;
          v57.size.height = v24;
          v51.origin.x = x;
          v51.origin.y = y;
          v51.size.width = width;
          v51.size.height = height;
          v52 = CGRectUnion(v51, v57);
          x = v52.origin.x;
          y = v52.origin.y;
          width = v52.size.width;
          height = v52.size.height;
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v18);
    }
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    if (CGRectIsNull(v53))
    {
      if (objc_msgSend(v11, "isEmpty"))
      {
        objc_msgSend(v11, "start");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v11, "start");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "caretRectForPosition:", v26);
          x = v27;
          y = v28;
          width = v29;
          height = v30;

        }
      }
    }
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    if (!CGRectIsNull(v54))
    {
      objc_msgSend(v10, "textInputView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "convertRect:fromView:", v31, x, y, width, height);
      v5 = v32;
      v6 = v33;
      v7 = v34;
      v8 = v35;

    }
  }
  v55.origin.x = v5;
  v55.origin.y = v6;
  v55.size.width = v7;
  v55.size.height = v8;
  if (CGRectIsNull(v55))
  {
    v44.receiver = self;
    v44.super_class = (Class)UITextView;
    -[UIView _rectToScrollToVisibleInCellInWindow:](&v44, sel__rectToScrollToVisibleInCellInWindow_, v4);
    v5 = v36;
    v6 = v37;
    v7 = v38;
    v8 = v39;
  }

  v40 = v5;
  v41 = v6;
  v42 = v7;
  v43 = v8;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (id)selectedText
{
  void *v3;
  void *v4;

  -[UITextView selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UITextView textInRange:](self, "textInRange:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)textInRange:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
  void *v6;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "textInRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertAttributedText:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "insertAttributedText:", v4);

}

- (id)attributedTextInRange:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
  void *v6;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "attributedTextInRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setWritingToolsStreamingReplacements:(BOOL)a3
{
  _BOOL8 v3;
  UITextInputController **p_inputController;
  id WeakRetained;
  int v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  p_inputController = &self->_inputController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v7 = objc_msgSend(WeakRetained, "isWritingToolsStreamingReplacements");

  if ((v7 & 1) == 0 && v3 && (*((_BYTE *)&self->_tvFlags + 3) & 0x80) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_textViewWillBeginUndoCoalescingForWritingTools:", self);

  }
  v9 = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(v9, "setWritingToolsStreamingReplacements:", v3);

  if (!(v7 ^ 1 | v3) && (*((_BYTE *)&self->_tvFlags + 4) & 1) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_textViewDidEndUndoCoalescingForWritingTools:", self);

  }
}

- (BOOL)_isWritingToolsStreamingReplacements
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "isWritingToolsStreamingReplacements");

  return v3;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "replaceRange:withText:", v7, v6);

}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "replaceRange:withAttributedText:", v7, v6);

}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "replaceRangeWithTextWithoutClosingTyping:replacementText:", v7, v6);

}

- (id)_replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5
{
  _BOOL8 v5;
  UITextInputController **p_inputController;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v5 = a5;
  p_inputController = &self->_inputController;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "replaceRange:withAttributedText:updatingSelection:", v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setSelectedTextRange:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(v5, "setSelectedTextRange:", v6);
  }
  else
  {
    -[UITextView interactionAssistant](self, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionChanged");
  }

}

- (id)_rangeForTextKitRanges:(id)a3
{
  return (id)-[_UITextLayoutController textRangeForTextKit2Ranges:](self->_textLayoutController, "textRangeForTextKit2Ranges:", a3);
}

- (int64_t)selectionAffinity
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "selectionAffinity");

  return v3;
}

- (NSDictionary)markedTextStyle
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "markedTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setMarkedTextStyle:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "setMarkedTextStyle:", v4);

}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  UITextInputController **p_inputController;
  id v7;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  p_inputController = &self->_inputController;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "setMarkedText:selectedRange:", v7, location, length);

}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  UITextInputController **p_inputController;
  id v7;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  p_inputController = &self->_inputController;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "setAttributedMarkedText:selectedRange:", v7, location, length);

}

- (void)unmarkText
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "unmarkText");

}

- (UITextPosition)beginningOfDocument
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (UITextPosition)endOfDocument
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v3;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "textRangeFromPosition:toPosition:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;
  void *v8;

  p_inputController = &self->_inputController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "positionFromPosition:offset:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  UITextInputController **p_inputController;
  id v8;
  id WeakRetained;
  void *v10;

  p_inputController = &self->_inputController;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "positionFromPosition:inDirection:offset:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;
  int64_t v9;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  v9 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v7, v6);

  return v9;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;
  int64_t v9;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  v9 = objc_msgSend(WeakRetained, "offsetFromPosition:toPosition:", v7, v6);

  return v9;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;
  void *v8;

  p_inputController = &self->_inputController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "positionWithinRange:farthestInDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_existingSelectionContainerView
{
  id *v1;
  void *v2;
  id v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1[262], "selectionContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (!v2)
      v3 = v1[332];
    v1 = (id *)v3;

  }
  return v1;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;
  void *v8;

  p_inputController = &self->_inputController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "characterRangeByExtendingPosition:inDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  return (id)-[_UITextLayoutController _visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:](self->_textLayoutController, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", a3, a5, a6, a4.x, a4.y);
}

- (id)undoManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInputDelegate:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "setInputDelegate:", v4);

}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;
  int64_t v8;

  p_inputController = &self->_inputController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  v8 = objc_msgSend(WeakRetained, "baseWritingDirectionForPosition:inDirection:", v6, a4);

  return v8;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "setBaseWritingDirection:forRange:", a3, v6);

}

- (CGRect)firstRectForRange:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
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
  double v16;
  double v17;
  CGRect result;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "firstRectForRange:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
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
  double v16;
  double v17;
  CGRect result;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "caretRectForPosition:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;
  void *v8;

  p_inputController = &self->_inputController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "textStylingAtPosition:inDirection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)selectionRectsForRange:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
  void *v6;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "selectionRectsForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  UITextInputController **p_inputController;
  id v7;
  id WeakRetained;
  void *v9;

  y = a3.y;
  x = a3.x;
  p_inputController = &self->_inputController;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "closestPositionToPoint:withinRange:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "characterRangeAtPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_showsEditMenu
{
  return (*((unsigned __int8 *)&self->_tvFlags + 1) >> 3) & 1;
}

- (void)_presentEditMenu
{
  -[UITextInteractionAssistant showSelectionCommands](self->_interactionAssistant, "showSelectionCommands");
}

- (void)_dismissEditMenu
{
  -[UITextInteractionAssistant hideSelectionCommands](self->_interactionAssistant, "hideSelectionCommands");
}

- (BOOL)_shouldSuppressSelectionCommands
{
  return 0;
}

- (BOOL)_isSystemAttachment:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
  char v6;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  v6 = objc_msgSend(WeakRetained, "_isSystemAttachment:", v4);

  return v6;
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  void *v6;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "insertTextPlaceholderWithSize:", width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "removeTextPlaceholder:", v4);

}

- (id)insertDictationResultPlaceholder
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "insertDictationResultPlaceholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
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
  double v16;
  double v17;
  CGRect result;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "frameForDictationResultPlaceholder:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  _BOOL8 v4;
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;

  v4 = a4;
  p_inputController = &self->_inputController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "removeDictationResultPlaceholder:willInsertResult:", v6, v4);

}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;
  void *v8;

  p_inputController = &self->_inputController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "rangeWithTextAlternatives:atPosition:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)typingAttributes
{
  id WeakRetained;
  void *v4;

  -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](self, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setTypingAttributes:(NSDictionary *)typingAttributes
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  NSDictionary *v8;

  v8 = typingAttributes;
  -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("_UITextInputDictationResultMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)-[NSDictionary mutableCopy](v8, "mutableCopy");
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("_UITextInputDictationResultMetadata"));
    v6 = objc_msgSend(v5, "copy");

    v8 = (NSDictionary *)v6;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "setTypingAttributes:", v8);

  -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](self, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
  if (!-[UIView isHidden](self->_placeholderLabel, "isHidden"))
    -[UITextView _setNeedsTextLayout](self, "_setNeedsTextLayout");

}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "setContinuousSpellCheckingEnabled:", v3);

}

- (BOOL)performFinalGrammarChecking
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "performFinalGrammarChecking");

  return v3;
}

- (void)applyGrammarCheckingIndication
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "applyGrammarCheckingIndication");

}

- (void)textInputDidChange:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  id v13;

  v13 = a3;
  if (self)
  {
    self->_textContainerInsetAdjustment.top = -[UITextView _applicableContentOutsetsFromFonts](self);
    self->_textContainerInsetAdjustment.left = v4;
    self->_textContainerInsetAdjustment.bottom = v5;
    self->_textContainerInsetAdjustment.right = v6;
  }
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
  -[_UITextContainerView canvasView](self->_containerView, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateContentSizeIfNeeded");

  -[UITextView _resyncContainerFrameForNonAutolayout](self, "_resyncContainerFrameForNonAutolayout");
  -[UITextDragDropSupport notifyTextInteraction](self->_textDragDropSupport, "notifyTextInteraction");
  -[UIScrollView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "textViewDidChange:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("UITextViewTextDidChangeNotification"), self);

  -[UITextView _updateTextFormattingController](self, "_updateTextFormattingController");
  -[UITextView _scrollToSelectionIfNeeded](self, "_scrollToSelectionIfNeeded");
  -[UIView window](self->_textEmphasisBackgroundView, "window");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[UIView isHidden](self->_textEmphasisBackgroundView, "isHidden");

    if (!v12)
      -[UIView setNeedsDisplay](self->_textEmphasisBackgroundView, "setNeedsDisplay");
  }

}

- (BOOL)textInputShouldExtendCaretHeight:(id)a3
{
  void *v3;
  BOOL v4;

  -[UIView traitCollection](self, "traitCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != 5;

  return v4;
}

- (void)textInputDidChangeSelection:(id)a3
{
  id v4;

  -[UIScrollView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "textViewDidChangeSelection:", self);
  -[UITextView _updateTextFormattingController](self, "_updateTextFormattingController");
  -[UITextView _scrollToCaretIfNeeded](self, "_scrollToCaretIfNeeded");

}

- (void)textInputDidFinishUndoRedoChanges:(id)a3
{
  id v3;

  -[UITextView _existingTextAssistantManager](self, "_existingTextAssistantManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasActiveWritingToolsSession"))
    objc_msgSend(v3, "finishUndoRedoChanges");

}

- (void)textInput:(id)a3 undoRedoDidApplyAttributedText:(id)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  id v9;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  -[UITextView _existingTextAssistantManager](self, "_existingTextAssistantManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasActiveWritingToolsSession"))
    objc_msgSend(v8, "updateForCharactersInRange:withReplacement:isUndoRedo:", location, length, v9, 1);

}

- (void)textInput:(id)a3 didApplyAttributedText:(id)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  int v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  length = a5.length;
  location = a5.location;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (self->_customRenderController
    && -[UITextView _customRenderControllerPermitsSetTextDidEditRange](self, "_customRenderControllerPermitsSetTextDidEditRange"))
  {
    -[UITextView _NSTextRangeFromNSRange:](self, "_NSTextRangeFromNSRange:", location, length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCustomTextRendering textDidEditRange:replacementLength:](self->_customRenderController, "textDidEditRange:replacementLength:", v11, objc_msgSend(v10, "length"));

  }
  -[UITextView _existingTextAssistantManager](self, "_existingTextAssistantManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasActiveWritingToolsSession")
    && (objc_msgSend(v12, "isReplacingTextByRequest") & 1) == 0
    && !-[UITextView _isWritingToolsStreamingReplacements](self, "_isWritingToolsStreamingReplacements"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    v14 = objc_msgSend(WeakRetained, "_undoRedoInProgress");

    if (v14)
    {
      if (os_variant_has_internal_diagnostics()
        && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
      {
        v15 = textInput_didApplyAttributedText_toCharacterRange____s_category;
        if (!textInput_didApplyAttributedText_toCharacterRange____s_category)
        {
          v15 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&textInput_didApplyAttributedText_toCharacterRange____s_category);
        }
        v16 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136315138;
          v18 = "-[UITextView textInput:didApplyAttributedText:toCharacterRange:]";
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "%s unexpectedly received during undo-redo", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    else
    {
      objc_msgSend(v12, "updateForCharactersInRange:withReplacement:isUndoRedo:", location, length, v10, 0);
    }
  }

}

- (void)textInput:(id)a3 willChangeCharactersInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id WeakRetained;
  char v8;
  id v9;

  length = a4.length;
  location = a4.location;
  -[UITextView _existingTextAssistantManager](self, "_existingTextAssistantManager", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasActiveWritingToolsSession"))
  {
    if ((objc_msgSend(v9, "isReplacingTextByRequest") & 1) == 0
      && !-[UITextView _isWritingToolsStreamingReplacements](self, "_isWritingToolsStreamingReplacements"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
      v8 = objc_msgSend(WeakRetained, "_undoRedoInProgress");

      if ((v8 & 1) == 0)
        objc_msgSend(v9, "endSessionIfNecessaryForChangingCharactersInRange:", location, length);
    }
  }

}

- (BOOL)allowsAttachments
{
  return 1;
}

- (id)_currentDefaultAttributes
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *(_QWORD *)off_1E1678D98;
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E1678D98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, v5);

  }
  return v4;
}

- (void)setText:(NSString *)text
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;

  v7 = text;
  -[UITextView _currentDefaultAttributes](self, "_currentDefaultAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v4);
  else
    v5 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  v6 = v5;
  -[UITextView setAttributedText:](self, "setAttributedText:", v5);

}

+ (id)_defaultFont
{
  void *v2;
  void *v3;
  void *v4;

  +[_UITextAttributeDefaults _unspecifiedDefaults](_UITextAttributeDefaults, "_unspecifiedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
  NSTextStorage *textStorage;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];

  textStorage = self->_textStorage;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __31__UITextView_setTextAlignment___block_invoke;
  v15[3] = &__block_descriptor_40_e23_v16__0__NSTextStorage_8l;
  v15[4] = textAlignment;
  -[NSTextStorage coordinateEditing:](textStorage, "coordinateEditing:", v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)off_1E1678F98;
  objc_msgSend(v7, "valueForKey:", *(_QWORD *)off_1E1678F98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init((Class)off_1E1679BC0);
  v14 = v12;

  objc_msgSend(v14, "setAlignment:", textAlignment);
  v13 = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(v13, "_addToTypingAttributes:value:", v8, v14);

  -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](self, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
}

void __31__UITextView_setTextAlignment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(_QWORD *)off_1E1678F98;
  v5 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__UITextView_setTextAlignment___block_invoke_2;
  v8[3] = &unk_1E16E6878;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v8);

}

void __31__UITextView_setTextAlignment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;

  v7 = (void *)objc_msgSend(a2, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = objc_alloc_init((Class)off_1E1679BC0);
  v10 = v9;

  objc_msgSend(v10, "setAlignment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(_QWORD *)off_1E1678F98, v10, a3, a4);

}

- (NSTextAlignment)textAlignment
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSTextAlignment v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "typingAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *(_QWORD *)off_1E1678F98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "alignment");
  else
    v5 = NSTextAlignmentNatural;

  return v5;
}

- (void)setSelectedRange:(NSRange)selectedRange
{
  NSUInteger length;
  NSUInteger location;
  id WeakRetained;

  length = selectedRange.length;
  location = selectedRange.location;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "setSelectedRange:", location, length);

  -[UITextView updateSelection](self, "updateSelection");
}

- (BOOL)_shouldBecomeEditableUponFocus
{
  return 0;
}

- (BOOL)_shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment
{
  return 0;
}

- (void)setClearsOnInsertion:(BOOL)clearsOnInsertion
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_clearsOnInsertion != clearsOnInsertion)
  {
    self->_clearsOnInsertion = clearsOnInsertion;
    if (clearsOnInsertion)
    {
      -[UITextView interactionAssistant](self, "interactionAssistant");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deactivateSelection");

      -[UITextView selectAll:](self, "selectAll:", self);
    }
    else if (!-[UITextView isTextDragActive](self, "isTextDragActive"))
    {
      -[UITextView interactionAssistant](self, "interactionAssistant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activateSelection");

      -[UITextView interactionAssistant](self, "interactionAssistant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSelectionDisplayVisible:", 1);

    }
    -[UITextView _updateSelectionGestures](self, "_updateSelectionGestures");
  }
}

- (BOOL)clearsOnInsertion
{
  return self->_clearsOnInsertion;
}

- (void)disableClearsOnInsertion
{
  -[UITextView setClearsOnInsertion:](self, "setClearsOnInsertion:", 0);
}

- (id)webView
{
  return 0;
}

- (void)setContentToHTMLString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    v8 = *(_QWORD *)off_1E1678CE0;
    v9[0] = *(_QWORD *)off_1E1678DD0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "initWithData:options:documentAttributes:error:", v4, v6, 0, 0);

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  }
  -[UITextView setAttributedText:](self, "setAttributedText:", v7);

}

- (BOOL)shouldAutoscrollAboveBottom
{
  return *(_BYTE *)&self->_tvFlags >> 7;
}

- (void)setShouldAutoscrollAboveBottom:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFFFF7FLL | v3);
  -[UITextView updateAutoscrollAboveBottom](self, "updateAutoscrollAboveBottom");
}

- (void)updateAutoscrollAboveBottom
{
  double v3;

  if (-[UITextView shouldAutoscrollAboveBottom](self, "shouldAutoscrollAboveBottom")
    && -[UITextView isEditing](self, "isEditing"))
  {
    v3 = 60.0;
  }
  else
  {
    v3 = 0.0;
  }
  -[UIScrollView _setContentScrollInset:](self, "_setContentScrollInset:", 0.0, 0.0, v3, 0.0);
}

- (unint64_t)marginTop
{
  return (unint64_t)self->_unadjustedTextContainerInset.top;
}

- (void)_setHorizontalMargins:(unint64_t)a3
{
  self->_unadjustedTextContainerInset.left = (double)a3;
  self->_unadjustedTextContainerInset.right = (double)a3;
  -[UITextView _ensureUpToDateTextContainerInsetAndNotifyIfNecessary]((uint64_t)self);
}

- (CGPoint)textContainerOrigin
{
  double v2;
  double v3;
  CGPoint result;

  -[_UITextContainerView textContainerOrigin](self->_containerView, "textContainerOrigin");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLineHeight:(double)a3
{
  NSTextStorage *textStorage;
  _QWORD v4[5];

  textStorage = self->_textStorage;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__UITextView_setLineHeight___block_invoke;
  v4[3] = &__block_descriptor_40_e23_v16__0__NSTextStorage_8l;
  *(double *)&v4[4] = a3;
  -[NSTextStorage coordinateEditing:](textStorage, "coordinateEditing:", v4);
}

void __28__UITextView_setLineHeight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v3 = *(_QWORD *)off_1E1678F98;
  v5 = a2;
  v4 = objc_msgSend(v5, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__UITextView_setLineHeight___block_invoke_2;
  v6[3] = &__block_descriptor_40_e27_v40__0_8__NSRange_QQ_16_B32l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0x100000, v6);

}

void __28__UITextView_setLineHeight___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  if (a2)
    v3 = (id)objc_msgSend(a2, "mutableCopy");
  else
    v3 = objc_alloc_init((Class)off_1E1679BC0);
  v4 = v3;
  objc_msgSend(v3, "setMinimumLineHeight:", *(double *)(a1 + 32));
  objc_msgSend(v4, "setMaximumLineHeight:", *(double *)(a1 + 32));

}

- (double)lineHeight
{
  NSTextStorage *textStorage;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  textStorage = self->_textStorage;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__UITextView_lineHeight__block_invoke;
  v5[3] = &unk_1E16B7418;
  v5[4] = &v6;
  -[NSTextStorage coordinateReading:](textStorage, "coordinateReading:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __24__UITextView_lineHeight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v3 = *(_QWORD *)off_1E1678F98;
  v5 = a2;
  v4 = objc_msgSend(v5, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__UITextView_lineHeight__block_invoke_2;
  v6[3] = &unk_1E16B6338;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0x100000, v6);

}

uint64_t __24__UITextView_lineHeight__block_invoke_2(uint64_t result, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v6;
  uint64_t v7;

  if (a2)
  {
    v6 = result;
    result = objc_msgSend(a2, "minimumLineHeight");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = v7;
    *a5 = 1;
  }
  return result;
}

- (void)setTextHighlightAttributes:(id)a3
{
  -[_UITextContainerView setTextHighlightAttributes:](self->_containerView, "setTextHighlightAttributes:", a3);
}

- (NSDictionary)textHighlightAttributes
{
  return -[_UITextContainerView textHighlightAttributes](self->_containerView, "textHighlightAttributes");
}

- (void)drawTextHighlightBackgroundForTextRange:(id)a3 origin:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _QWORD *ContextStack;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  UITextView *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  _QWORD v35[2];

  y = a4.y;
  x = a4.x;
  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v10 = 0;
  else
    v10 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  -[UITextView textLayoutManager](self, "textLayoutManager");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    -[UITextView textStorage](self, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    v35[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[UITextView _nsRangeForTextKitRanges:](self, "_nsRangeForTextKitRanges:", v15);
    v18 = v17;

    if (v14 < v16 + v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextView.m"), 5894, CFSTR("Incorrect textRange"));

    }
    v19 = 2;
    if (v14 - (v16 + v18) >= 2)
      v20 = 2;
    else
      v20 = v14 - (v16 + v18);
    if (v14 <= v16 + v18)
      v20 = 0;
    v21 = *(_QWORD *)off_1E1679170;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[2] = __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke;
    v26[3] = &unk_1E16E6F48;
    if (v16 < 2)
      v19 = v16;
    v26[1] = 3221225472;
    v22 = v16 - v19;
    v23 = v19 + v18 + v20;
    v30 = v16;
    v31 = v18;
    v27 = v13;
    v28 = self;
    v29 = v12;
    v32 = x;
    v33 = y;
    v34 = v10;
    v24 = v13;
    objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v21, v22, v23, 0, v26);

  }
}

void __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke(uint64_t a1, uint64_t a2, NSRange a3)
{
  NSUInteger length;
  NSUInteger location;
  __int128 *v7;
  NSRange v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  NSUInteger v13;
  NSUInteger v14;
  NSRange v15;
  __int128 v16;
  uint64_t v17;

  length = a3.length;
  location = a3.location;
  v7 = (__int128 *)(a1 + 56);
  v8 = NSIntersectionRange(*(NSRange *)(a1 + 56), a3);
  if (a2)
  {
    if (v8.length)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke_2;
      v10[3] = &unk_1E16E6F20;
      v12 = *v7;
      v13 = location;
      v14 = length;
      v9 = *(void **)(a1 + 32);
      v10[4] = *(_QWORD *)(a1 + 40);
      v15 = v8;
      v11 = *(id *)(a1 + 48);
      v16 = *(_OWORD *)(a1 + 72);
      v17 = *(_QWORD *)(a1 + 88);
      objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", v8.location, v8.length, 0, v10);

    }
  }
}

void __61__UITextView_drawTextHighlightBackgroundForTextRange_origin___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  id v14;
  NSRange v15;
  id v16;
  NSRange v17;
  NSRange v18;

  v7 = *(_QWORD *)(a1 + 48);
  if (a3 + a4 <= *(_QWORD *)(a1 + 56) + v7)
    v8 = a3 < v7;
  else
    v8 = (a3 < v7) | 2;
  v9 = *(_QWORD *)(a1 + 64);
  if (a3 <= v9)
    v8 |= 4uLL;
  if (a3 + a4 >= *(_QWORD *)(a1 + 72) + v9)
    v10 = v8 | 8;
  else
    v10 = v8;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 88);
  v14 = a2;
  v17.location = a3;
  v17.length = a4;
  v18.location = v12;
  v18.length = v13;
  v15 = NSIntersectionRange(v17, v18);
  objc_msgSend(v11, "_NSTextRangeFromNSRange:", v15.location, v15.length);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "drawTextHighlightBackgroundForTextRange:attributes:options:origin:context:", v16, v14, v10, *(_QWORD *)(a1 + 112), *(double *)(a1 + 96), *(double *)(a1 + 104));

}

- (void)_applyHighlightStyle:(id)a3 toTextRange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  id v11;

  v11 = a4;
  v6 = a3;
  -[UITextView attributedTextInRange:](self, "attributedTextInRange:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addAttribute:value:range:", *(_QWORD *)off_1E1679170, v6, 0, objc_msgSend(v8, "length"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v10 = (id)objc_msgSend(WeakRetained, "replaceRange:withAttributedText:updatingSelection:", v11, v8, 0);

}

- (void)_applyHighlightStyle:(id)a3 colorScheme:(id)a4 toTextRange:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;
  id v14;

  v14 = a5;
  v8 = a4;
  v9 = a3;
  -[UITextView attributedTextInRange:](self, "attributedTextInRange:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "addAttribute:value:range:", *(_QWORD *)off_1E1679170, v9, 0, objc_msgSend(v11, "length"));
  objc_msgSend(v11, "addAttribute:value:range:", *(_QWORD *)off_1E1679130, v8, 0, objc_msgSend(v11, "length"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v13 = (id)objc_msgSend(WeakRetained, "replaceRange:withAttributedText:updatingSelection:", v14, v11, 0);

}

- (void)_removeHighlightsFromTextRange:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a3;
  -[UITextView attributedTextInRange:](self, "attributedTextInRange:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1679170, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "removeAttribute:range:", *(_QWORD *)off_1E1679130, 0, objc_msgSend(v5, "length"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v7 = (id)objc_msgSend(WeakRetained, "replaceRange:withAttributedText:updatingSelection:", v8, v5, 0);

}

- (id)_linkTextAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSTextStorage *textStorage;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;

  v6 = a3;
  -[UIScrollView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3010000000;
    v22 = &unk_18685B0AF;
    v23 = a4;
    v24 = 1;
    textStorage = self->_textStorage;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke;
    v15[3] = &unk_1E16B74B8;
    v17 = &v19;
    v18 = a4;
    v9 = v6;
    v16 = v9;
    -[NSTextStorage coordinateReading:](textStorage, "coordinateReading:", v15);
    objc_msgSend(v7, "_textView:linkTextAttributesForLink:inRange:", self, v9, v20[4], v20[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v10 = 0;
  }
  if (qword_1ECD79390 != -1)
    dispatch_once(&qword_1ECD79390, &__block_literal_global_423);
  if (qword_1ECD79398 && !v10)
  {
    objc_msgSend((id)qword_1ECD79398, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredTextAttributesForLinkAtCharacterIndex:ofStorage:", a4, self->_textStorage);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[UITextView linkTextAttributes](self, "linkTextAttributes");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

void __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10[2];

  v3 = *(_QWORD *)off_1E1678EB8;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = a2;
  v6 = objc_msgSend(v5, "length") - *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke_2;
  v9[3] = &unk_1E16E4DF0;
  v8 = *(_OWORD *)(a1 + 32);
  v7 = (id)v8;
  *(_OWORD *)v10 = v8;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v3, v4, v6, 0, v9);

}

void __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, char *a5)
{
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSRange v14;

  v9 = a2;
  v14.location = a3;
  v14.length = a4;
  *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = NSUnionRange(v14, *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32));
  v10 = *(void **)(a1 + 32);
  v13 = v9;
  v11 = v10;
  if (v11 == v13)
  {
    v12 = 0;
  }
  else
  {
    v12 = 1;
    if (v13 && v11)
      v12 = objc_msgSend(v13, "isEqual:", v11) ^ 1;
  }

  *a5 = v12;
}

Class __61__UITextView__linkTextAttributesForLink_forCharacterAtIndex___block_invoke_3()
{
  Class result;

  result = NSClassFromString(CFSTR("DDDetectionController"));
  qword_1ECD79398 = (uint64_t)result;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UITextContainerView *v5;
  UITextView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  -[UIScrollView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UITextContainerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_containerView)
  {
    v6 = self;

    v5 = (_UITextContainerView *)v6;
  }
  return v5;
}

- (BOOL)usesStandardTextScaling
{
  return -[_UITextContainerView usesStandardTextScaling](self->_containerView, "usesStandardTextScaling");
}

- (void)setUsesStandardTextScaling:(BOOL)usesStandardTextScaling
{
  -[_UITextContainerView setUsesStandardTextScaling:](self->_containerView, "setUsesStandardTextScaling:", usesStandardTextScaling);
}

- (void)_setCuiCatalog:(id)a3
{
  CUICatalog *v5;
  CUICatalog *v6;

  v5 = (CUICatalog *)a3;
  if (self->_cuiCatalog != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cuiCatalog, a3);
    -[UITextView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (id)_cuiCatalog
{
  return self->_cuiCatalog;
}

- (void)_setCuiStyleEffectConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_UITextLayoutController styleEffectConfiguration](self->_textLayoutController, "styleEffectConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    v6 = (id)objc_msgSend(v10, "copy");
    if (!v6)
    {
      if (dyld_program_sdk_at_least())
        v6 = objc_alloc_init(MEMORY[0x1E0D1A6E8]);
      else
        v6 = 0;
    }
    objc_msgSend(v6, "appearanceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UIView traitCollection](self, "traitCollection");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[UITraitCollection _styleEffectAppearanceName](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAppearanceName:", v9);

    }
    -[_UITextLayoutController setStyleEffectConfiguration:](self->_textLayoutController, "setStyleEffectConfiguration:", v6);
    -[UITextView setNeedsDisplay](self, "setNeedsDisplay");

    v5 = v10;
  }

}

- (id)_cuiStyleEffectConfiguration
{
  return (id)-[_UITextLayoutController styleEffectConfiguration](self->_textLayoutController, "styleEffectConfiguration");
}

- (void)_updateTextEffectsConfigurationIfNeeded
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  -[_UITextLayoutController styleEffectConfiguration](self->_textLayoutController, "styleEffectConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = v3;
    -[UIView traitCollection](self, "traitCollection");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[UITraitCollection _styleEffectAppearanceName](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "appearanceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    if (v7 == v8)
    {

      v11 = v7;
    }
    else
    {
      v9 = v8;
      if (v7 && v8)
      {
        v10 = objc_msgSend(v7, "isEqual:", v8);

        if ((v10 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      v11 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v11, "setAppearanceName:", v7);
      -[_UITextLayoutController setStyleEffectConfiguration:](self->_textLayoutController, "setStyleEffectConfiguration:", v11);
      -[UITextView setNeedsDisplay](self, "setNeedsDisplay");
    }

LABEL_11:
    v3 = v12;
  }

}

- (void)_setFreezeTextContainerSize:(BOOL)a3
{
  _BOOL4 v3;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  __int128 v11;

  v3 = a3;
  if (-[UITextView _freezeTextContainerSize](self, "_freezeTextContainerSize") != a3)
  {
    if (v3)
    {
      -[UITextView textContainerInset](self, "textContainerInset");
      self->_beforeFreezingTextContainerInset.top = v5;
      self->_beforeFreezingTextContainerInset.left = v6;
      self->_beforeFreezingTextContainerInset.bottom = v7;
      self->_beforeFreezingTextContainerInset.right = v8;
      -[UIView frame](self->_containerView, "frame");
      self->_beforeFreezingFrameSize.width = v9;
      self->_beforeFreezingFrameSize.height = v10;
      v11 = *(_OWORD *)&self->_beforeFreezingTextContainerInset.bottom;
      *(_OWORD *)&self->_duringFreezingTextContainerInset.top = *(_OWORD *)&self->_beforeFreezingTextContainerInset.top;
      *(_OWORD *)&self->_duringFreezingTextContainerInset.bottom = v11;
      -[_UITextContainerView _setFreezeTextContainerSize:](self->_containerView, "_setFreezeTextContainerSize:", 1);
    }
    else
    {
      -[_UITextContainerView _setFreezeTextContainerSize:](self->_containerView, "_setFreezeTextContainerSize:", 0);
      self->_unfreezingTextContainerSize = 1;
      -[UITextView _setNeedsTextLayout](self, "_setNeedsTextLayout");
      -[UITextView setTextContainerInset:](self, "setTextContainerInset:", self->_duringFreezingTextContainerInset.top, self->_duringFreezingTextContainerInset.left, self->_duringFreezingTextContainerInset.bottom, self->_duringFreezingTextContainerInset.right);
      -[UITextView _updateTextContainerSizeAndSizeToFit](self, "_updateTextContainerSizeAndSizeToFit");
    }
  }
}

- (BOOL)_allowAnimatedUpdateSelectionRectViews
{
  return !self->_unfreezingTextContainerSize;
}

- (id)textContainerView:(id)a3 linkTextAttributesForLink:(id)a4 forCharacterAtIndex:(unint64_t)a5
{
  return -[UITextView _linkTextAttributesForLink:forCharacterAtIndex:](self, "_linkTextAttributesForLink:forCharacterAtIndex:", a4, a5);
}

- (id)textContainerView:(id)a3 cuiCatalogForTextEffectName:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a4;
  -[UITextView _cuiCatalog](self, "_cuiCatalog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasStylePresetWithName:", v5);

  if (v7)
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y;
  double x;
  UIAutoscroll *v6;
  UIAutoscroll *autoscroll;
  UITextView *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double horizontalTextContainerGeometryAdjustment;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat width;
  CGFloat height;
  double MinY;
  uint64_t v47;
  UITextInteractionAssistant *v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  y = a3.y;
  x = a3.x;
  if (!self->_autoscroll)
  {
    v6 = objc_alloc_init(UIAutoscroll);
    autoscroll = self->_autoscroll;
    self->_autoscroll = v6;

  }
  v48 = self->_interactionAssistant;
  v8 = self;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v11 = 32.0;
  else
    v11 = 8.0;
  -[UIScrollView visibleBounds](v8, "visibleBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UITextView textContainerInset](v8, "textContainerInset");
  v21 = fmax(v20, v8->_textContainerInsetAdjustment.top);
  horizontalTextContainerGeometryAdjustment = fmax(v22, v8->_textContainerInsetAdjustment.left);
  v25 = fmax(v24, v8->_textContainerInsetAdjustment.bottom);
  v27 = fmax(v26, v8->_textContainerInsetAdjustment.right);
  if (v8->_horizontalTextContainerGeometryAdjustment < 0.0)
    horizontalTextContainerGeometryAdjustment = v8->_horizontalTextContainerGeometryAdjustment;
  v28 = v13 + horizontalTextContainerGeometryAdjustment;
  v29 = v15 + v21;
  v30 = v17 - (v27 + horizontalTextContainerGeometryAdjustment);
  v31 = v19 - (v21 + v25);
  -[UIScrollView _effectiveContentInset](v8, "_effectiveContentInset");
  v33 = v32 + v28;
  v35 = v29 + v34;
  v37 = v30 - (v32 + v36);
  v39 = v31 - (v34 + v38);
  -[UIScrollView contentSize](v8, "contentSize");
  v41 = v40;
  v49.origin.x = v33;
  v49.origin.y = v35;
  v49.size.width = v37;
  v49.size.height = v39;
  v50 = CGRectInset(v49, v11, v11);
  if (v39 < v41)
  {
    v42 = v50.origin.x;
    v43 = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
    MinY = CGRectGetMinY(v50);
    v51.origin.x = v42;
    v51.origin.y = v43;
    v51.size.width = width;
    v51.size.height = height;
    if (y > CGRectGetMaxY(v51))
    {
      if (y < MinY)
        v47 = 12;
      else
        v47 = 8;
      goto LABEL_18;
    }
    if (y < MinY)
    {
      v47 = 4;
LABEL_18:
      -[UIAutoscroll startAutoscroll:scrollContainer:point:directions:repeatInterval:](self->_autoscroll, "startAutoscroll:scrollContainer:point:directions:repeatInterval:", v48, v8, v47, x, y, 0.075);
      goto LABEL_19;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UITextInteractionAssistant autoscrollWillNotStart](v48, "autoscrollWillNotStart");
  -[UITextView cancelAutoscroll](v8, "cancelAutoscroll");
LABEL_19:

}

- (void)cancelAutoscroll
{
  -[UIAutoscroll invalidate](self->_autoscroll, "invalidate");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  UILabel *placeholderLabel;

  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    placeholderLabel = self->_placeholderLabel;
    if (placeholderLabel)
      -[UILabel setAdjustsFontForContentSizeCategory:](placeholderLabel, "setAdjustsFontForContentSizeCategory:");
    -[UITextView _adjustFontForAccessibilityTraits:](self, "_adjustFontForAccessibilityTraits:", 0);
  }
}

- (void)_adjustFontForAccessibilityTraits:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id WeakRetained;
  NSTextStorage *textStorage;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  if (self->_adjustsFontForContentSizeCategory || a3)
  {
    -[UIView traitCollection](self, "traitCollection", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView font](self, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[UITextView font](self, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (v8 && v7)
    {
      -[UITextView font](self, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:", v7) ^ 1;

    }
    v23 = v9;
    if (*((_BYTE *)v21 + 24))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
      objc_msgSend(WeakRetained, "_addToTypingAttributes:value:", *(_QWORD *)off_1E1678D90, v7);

      -[UITextView _syncTypingAttributesToTextContainerAttributesForExtraLineFragment](self, "_syncTypingAttributesToTextContainerAttributesForExtraLineFragment");
    }
    textStorage = self->_textStorage;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __48__UITextView__adjustFontForAccessibilityTraits___block_invoke;
    v17 = &unk_1E16E6430;
    v13 = v5;
    v18 = v13;
    v19 = &v20;
    -[NSTextStorage coordinateEditing:](textStorage, "coordinateEditing:", &v14);
    if (*((_BYTE *)v21 + 24))
      -[UITextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v14, v15, v16, v17);

    _Block_object_dispose(&v20, 8);
  }
}

void __48__UITextView__adjustFontForAccessibilityTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__UITextView__adjustFontForAccessibilityTraits___block_invoke_2;
  v8[3] = &unk_1E16B15F8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v9 = v5;
  v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, v8);

}

void __48__UITextView__adjustFontForAccessibilityTraits___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", *(_QWORD *)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
  }

}

- (void)_setWantsContentAwareTypesettingLanguage:(BOOL)a3
{
  uint64_t v3;

  if (((((*(_QWORD *)&self->_tvFlags & 0x8000) == 0) ^ a3) & 1) == 0)
  {
    v3 = 0x8000;
    if (!a3)
      v3 = 0;
    self->_tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFFFFFFF7FFFLL | v3);
    -[UITextView _adjustFontForTypesettingLanguage](self, "_adjustFontForTypesettingLanguage");
  }
}

void __47__UITextView__adjustFontForTypesettingLanguage__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v9 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  -[UIFont _fontAdjustedForTypesettingLanguage:](v10, *(void **)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (-[__CTFont isEqual:](v10, "isEqual:", v11) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
  }

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  unsigned __int8 v17;
  objc_super v19;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v8 = objc_msgSend(WeakRetained, "_canHandleResponderAction:", a3);

  if (!v8)
  {
    if (sel__showTextFormattingOptions_ == a3)
    {
      if (-[UITextView _areDefaultTextFormattingAffordancesAvailable](self, "_areDefaultTextFormattingAffordancesAvailable"))
      {
        v11 = !-[UITextView _isTextFormattingControllerPresented](self, "_isTextFormattingControllerPresented");
        goto LABEL_31;
      }
    }
    else
    {
      if (sel_find_ != a3
        && sel_findAndReplace_ != a3
        && sel_findNext_ != a3
        && sel_findPrevious_ != a3
        && sel_useSelectionForFind_ != a3
        && sel__findSelected_ != a3)
      {
        goto LABEL_26;
      }
      if (self->_findInteractionEnabled)
      {
        if (sel_findAndReplace_ == a3)
        {
          v17 = -[UITextView supportsTextReplacement](self, "supportsTextReplacement");
          goto LABEL_27;
        }
        if (sel_useSelectionForFind_ == a3 || sel__findSelected_ == a3)
        {
          -[UITextView selectedTextRange](self, "selectedTextRange");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "_isRanged");
          goto LABEL_3;
        }
LABEL_26:
        v19.receiver = self;
        v19.super_class = (Class)UITextView;
        v17 = -[UIView canPerformAction:withSender:](&v19, sel_canPerformAction_withSender_, a3, v6);
LABEL_27:
        LOBYTE(v11) = v17;
        goto LABEL_31;
      }
    }
    LOBYTE(v11) = 0;
    goto LABEL_31;
  }
  v9 = objc_loadWeakRetained((id *)&self->_inputController);
  v10 = objc_msgSend(v9, "_shouldHandleResponderAction:", a3);
LABEL_3:
  LOBYTE(v11) = v10;

LABEL_31:
  return v11;
}

- (void)cut:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (-[UITextView keyboardInputShouldDelete:](self, "keyboardInputShouldDelete:", self))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(WeakRetained, "cut:", v5);

  }
}

- (void)copy:(id)a3
{
  UITextInputController **p_inputController;
  id v5;
  id WeakRetained;
  id v7;

  p_inputController = &self->_inputController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "copy:", v5);

  -[UITextView interactionAssistant](self, "interactionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hideSelectionCommands");

}

- (void)_define:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_define:", v4);

}

- (void)_translate:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_translate:", v4);

}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "_isDisplayingReferenceLibraryViewController");

  return v3;
}

- (void)_share:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_share:", v4);

}

- (BOOL)_isDisplayingTextService
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "_isDisplayingTextService");

  return v3;
}

- (BOOL)_isDisplayingShareViewController
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "_isDisplayingShareViewController");

  return v3;
}

- (BOOL)_isDisplayingLookupViewController
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "_isDisplayingLookupViewController");

  return v3;
}

- (void)_selectionMayChange:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_selectionMayChange:", v4);

}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_insertAttributedTextWithoutClosingTyping:", v4);

}

- (void)_addShortcut:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_addShortcut:", v4);

}

- (BOOL)_isDisplayingShortcutViewController
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "_isDisplayingShortcutViewController");

  return v3;
}

- (void)paste:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "paste:", v4);

}

- (void)pasteAndMatchStyle:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "pasteAndMatchStyle:", v4);

}

- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4
{
  _BOOL8 v4;
  UITextInputController **p_inputController;
  id v6;
  id WeakRetained;

  v4 = a4;
  p_inputController = &self->_inputController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_pasteAttributedString:pasteAsRichText:", v6, v4);

}

- (id)_attributedStringForInsertionOfAttributedString:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;
  void *v6;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_attributedStringForInsertionOfAttributedString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)pasteItemProviders:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "pasteItemProviders:", v4);

}

- (id)_effectivePasteConfiguration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextView;
  -[UIResponder _effectivePasteConfiguration](&v8, sel__effectivePasteConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UITextView _implicitPasteConfigurationClasses](self, "_implicitPasteConfigurationClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPasteConfiguration _pasteConfigurationForAcceptingClasses:](UIPasteConfiguration, "_pasteConfigurationForAcceptingClasses:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_implicitPasteConfigurationClasses
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  if (!-[UITextView isEditable](self, "isEditable"))
    return MEMORY[0x1E0C9AA60];
  v3 = -[UITextView allowsEditingTextAttributes](self, "allowsEditingTextAttributes");
  v4 = objc_opt_class();
  if (v3)
  {
    v10[0] = v4;
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    v10[3] = objc_opt_class();
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v10;
    v7 = 4;
  }
  else
  {
    v9[0] = v4;
    v9[1] = objc_opt_class();
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v9;
    v7 = 2;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)select:(id)a3
{
  id v3;

  -[UITextView interactionAssistant](self, "interactionAssistant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectWord");

}

- (void)selectAll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextView interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAll:", v4);

}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "makeTextWritingDirectionNatural:", v4);

}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "makeTextWritingDirectionRightToLeft:", v4);

}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "makeTextWritingDirectionLeftToRight:", v4);

}

- (void)toggleBoldface:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "toggleBoldface:", v4);

}

- (void)toggleItalics:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "toggleItalics:", v4);

}

- (void)toggleUnderline:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "toggleUnderline:", v4);

}

- (void)increaseSize:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "increaseSize:", self);

}

- (void)decreaseSize:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "decreaseSize:", self);

}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "updateTextAttributesWithConversionHandler:", v4);

}

- (void)replace:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "replace:", v4);

}

- (void)_promptForReplace:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_promptForReplace:", v4);

}

- (void)_transliterateChinese:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_transliterateChinese:", v4);

}

- (void)alignLeft:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "alignLeft:", v4);

}

- (void)alignCenter:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "alignCenter:", v4);

}

- (void)alignJustified:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "alignJustified:", v4);

}

- (void)alignRight:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "alignRight:", v4);

}

- (void)captureTextFromCamera:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "captureTextFromCamera:", v4);

}

- (void)validateCommand:(id)a3
{
  UITextInputController **p_inputController;
  id v4;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "validateCommand:", v4);

}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  char v10;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  -[UITextView _hideTextFormattingOptions:](self, "_hideTextFormattingOptions:", 0);
  -[UIScrollView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "textView:shouldChangeTextInRange:replacementText:", self, location, length, v8);
  else
    v10 = 1;

  return v10;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v7;
  id v8;
  UITextView *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  BOOL v13;

  v7 = a3;
  v8 = a4;
  -[UITextView _hideTextFormattingOptions:](self, "_hideTextFormattingOptions:", 0);
  -[UIScrollView delegate](self, "delegate");
  v9 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = -[UITextView selectedRange](self, "selectedRange");
    v12 = -[UITextView textView:shouldChangeTextInRange:replacementText:](v9, "textView:shouldChangeTextInRange:replacementText:", self, v10, v11, v8);
LABEL_6:
    v13 = v12;
    goto LABEL_7;
  }
  v13 = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0 && v9 != self)
  {
    v12 = -[UITextView keyboardInput:shouldInsertText:isMarkedText:](v9, "keyboardInput:shouldInsertText:isMarkedText:", v7, v8, 0);
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4;
  UITextView *v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  BOOL v11;

  v4 = a3;
  -[UITextView _hideTextFormattingOptions:](self, "_hideTextFormattingOptions:", 0);
  -[UIScrollView delegate](self, "delegate");
  v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v7 = objc_msgSend(WeakRetained, "_rangeForBackwardsDelete");
  v9 = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = -[UITextView textView:shouldChangeTextInRange:replacementText:](v5, "textView:shouldChangeTextInRange:replacementText:", self, v7, v9, &stru_1E16EDF20);
LABEL_6:
    v11 = v10;
    goto LABEL_7;
  }
  v11 = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0 && v5 != self)
  {
    v10 = -[UITextView keyboardInputShouldDelete:](v5, "keyboardInputShouldDelete:", v4);
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4;
  UITextView *v5;

  v4 = a3;
  -[UIScrollView delegate](self, "delegate");
  v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && v5 != self)
    -[UITextView keyboardInputChanged:](v5, "keyboardInputChanged:", v4);

  return 1;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  UITextView *v4;
  id v5;

  v5 = a3;
  -[UIScrollView delegate](self, "delegate");
  v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && v4 != self)
    -[UITextView keyboardInputChangedSelection:](v4, "keyboardInputChangedSelection:", v5);

}

- (id)automaticallySelectedOverlay
{
  void *v2;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;

  -[UIView _enclosingScrollableScrollerIncludingSelf](self, "_enclosingScrollableScrollerIncludingSelf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "frame");
    v7 = v6;
    -[UITextView font](self, "font");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lineHeight");
    if (v7 > v8 * 3.0)
    {
      v9 = v5;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_5;
LABEL_6:

  return v9;
}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  *(_QWORD *)&self->_tvFlags |= 0x400000000uLL;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "setSupportsAdaptiveImageGlyph:", v3);

}

- (BOOL)supportsAdaptiveImageGlyph
{
  int v3;
  id WeakRetained;
  char v5;

  if ((*((_BYTE *)&self->_tvFlags + 4) & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    v5 = objc_msgSend(WeakRetained, "supportsAdaptiveImageGlyph");

    LOBYTE(v3) = v5;
  }
  else
  {
    v3 = dyld_program_sdk_at_least();
    if (v3)
      LOBYTE(v3) = -[UITextView _supportsImagePasteCached](self, "_supportsImagePasteCached");
  }
  return v3;
}

- (BOOL)_supportsImagePasteCached
{
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags;
  _BOOL4 v4;
  uint64_t v5;

  tvFlags = self->_tvFlags;
  if ((*(_QWORD *)&tvFlags & 0x800000000) == 0)
  {
    v4 = -[UIResponder _supportsImagePaste](self, "_supportsImagePaste");
    v5 = 0x800000000;
    if (v4)
      v5 = 0x1800000000;
    tvFlags = ($CAC7BB7223AC380D8D33E5BCBA12464E)(*(_QWORD *)&self->_tvFlags & 0xFFFFFFE7FFFFFFFFLL | v5);
    self->_tvFlags = tvFlags;
  }
  return (*(unint64_t *)&tvFlags >> 36) & 1;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "insertAdaptiveImageGlyph:replacementRange:", v7, v6);

}

- (BOOL)supportsEmojiImageTextAttachments
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  v3 = objc_msgSend(WeakRetained, "supportsEmojiImageTextAttachments");

  return v3;
}

- (void)insertEmojiImageTextAttachment:(id)a3 replacementRange:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "insertEmojiImageTextAttachment:replacementRange:", v7, v6);

}

- (void)insertTextSuggestion:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIScrollView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_textView:insertTextSuggestion:", self, v7);

  }
}

- (BOOL)textInput:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id WeakRetained;
  BOOL v10;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!objc_msgSend(WeakRetained, "textView:shouldChangeTextInRange:replacementText:", self, location, length, v8))
    {
      v10 = 0;
      goto LABEL_6;
    }
    -[UITextView disableClearsOnInsertion](self, "disableClearsOnInsertion");
  }
  v10 = 1;
LABEL_6:

  return v10;
}

- (void)textInputWillAnimatePaste:(id)a3
{
  *(_QWORD *)&self->_tvFlags |= 0x200uLL;
}

- (void)textInputDidAnimatePaste:(id)a3
{
  *(_QWORD *)&self->_tvFlags &= ~0x200uLL;
}

- (void)_textFormattingDidDisappear:(id)a3
{
  UITextFormattingViewController *v4;
  UITextFormattingViewController *v5;
  BOOL v6;
  UITextFormattingViewController *v7;

  v4 = (UITextFormattingViewController *)a3;
  v5 = v4;
  if (self->_textFormattingViewController == v4)
  {
    self->_textFormattingViewController = 0;
    v7 = v4;

    -[UITextView _stopSuppressingKeyboardForTextFormatting:](self, "_stopSuppressingKeyboardForTextFormatting:", v7);
    if (!self->_textFormattingShouldSkipRestoringFirstResponderWhenFinished)
      -[UITextView _restoreFirstResponder](self, "_restoreFirstResponder");
    self->_textFormattingShouldSkipRestoringFirstResponderWhenFinished = 0;
    if (self->_didDisableAutomaticKeyboardBehaviorForTextFormatting)
    {
      -[UIResponder reloadInputViews](self, "reloadInputViews");
      self->_didDisableAutomaticKeyboardBehaviorForTextFormatting = 0;
    }
    -[UITextView _adjustBottomContentInsetForTextFormattingController:](self, "_adjustBottomContentInsetForTextFormattingController:", 0);
    self->_bottomContentInsetTextFormattingAdjustment = 0.0;
    self->_bottomContentInsetAfterTextFormattingAdjustment = 0.0;
    v6 = -[UIView isFirstResponder](self, "isFirstResponder");
    v5 = v7;
    if (!v6 && self->_forceSelectionDisplayForTextFormatting)
    {
      -[UITextInteractionAssistant setSelectionDisplayVisible:](self->_interactionAssistant, "setSelectionDisplayVisible:", 0);
      -[UITextInteractionAssistant deactivateSelection](self->_interactionAssistant, "deactivateSelection");
      v5 = v7;
      self->_forceSelectionDisplayForTextFormatting = 0;
    }
  }

}

- (void)_textFormattingRequestsFirstResponderRestoration:(id)a3
{
  self->_forceSelectionDisplayForTextFormatting = 0;
  -[UITextView _restoreFirstResponder](self, "_restoreFirstResponder", a3);
  -[UITextView _updateTextFormattingControllerPresentationSource](self, "_updateTextFormattingControllerPresentationSource");
}

- (void)_textFormattingRequestsFirstResponderResignation:(id)a3
{
  self->_forceSelectionDisplayForTextFormatting = 1;
  self->_textFormattingShouldSkipHidingOnResignFirstResponder = 1;
  -[UITextView resignFirstResponder](self, "resignFirstResponder", a3);
}

- (void)_startSuppressingKeyboardForTextFormatting:(id)a3
{
  void *v4;
  id textFormattingKeyboardSuppressionAssertion;
  id v6;

  if (-[UITextView _shouldHideInputViewsForTextFormatting](self, "_shouldHideInputViewsForTextFormatting", a3))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vendKeyboardSuppressionAssertionForReason:type:", CFSTR("Text Formatting"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    textFormattingKeyboardSuppressionAssertion = self->_textFormattingKeyboardSuppressionAssertion;
    self->_textFormattingKeyboardSuppressionAssertion = v4;

  }
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6;
  void *WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "dictationPhraseArray");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView insertDictationResult:](self, "insertDictationResult:", WeakRetained);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(WeakRetained, "insertDictationResult:withCorrectionIdentifier:", v8, v6);
  }

}

- (void)_setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v11 && objc_msgSend(v11, "count"))
  {
    +[UIDictationUtilities dictationPhrasesFromPhraseArray:](UIDictationUtilities, "dictationPhrasesFromPhraseArray:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFromKeyboard:", 0);
    objc_msgSend(v8, "setTransform:", 0);
    objc_msgSend(v8, "setUseServerCapitalization:", 0);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextView.m"), 6879, CFSTR("Only Siri calls -[UITextView _setDictationResult:withCorrectionIdentifier:], and it should always supply the correction identifier from the server."));

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
    objc_msgSend(WeakRetained, "_insertDictationResult:withCorrectionIdentifier:replacingRange:resultLength:", v8, v7, 0, -[NSTextStorage length](self->_textStorage, "length"), 0);

  }
}

- (void)_registerUndoOperationForReplacementWithActionName:(id)a3 replacementText:(id)a4
{
  UITextInputController **p_inputController;
  id v6;
  id v7;
  id WeakRetained;

  p_inputController = &self->_inputController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_inputController);
  objc_msgSend(WeakRetained, "_registerUndoOperationForReplacementWithActionName:replacementText:", v7, v6);

}

- (id)metadataDictionariesForDictationResults
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputController);
  objc_msgSend(WeakRetained, "metadataDictionariesForDictationResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  if (-[UITextView isSecureTextEntry](self, "isSecureTextEntry") != a3)
  {
    -[UITextView _textInputTraits](self, "_textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecureTextEntry:", v3);

    if (-[UITextView _shouldObscureInput](self, "_shouldObscureInput"))
    {
      -[UITextView selectedRange](self, "selectedRange");
      if (v6)
        -[UITextView selectAll:](self, "selectAll:", self);
    }
    -[UITextView interactionAssistant](self, "interactionAssistant");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateDisplayedSelection");

  }
}

- (BOOL)_shouldObscureInput
{
  int v3;

  v3 = -[UITextView isSecureTextEntry](self, "isSecureTextEntry");
  if (v3)
    LOBYTE(v3) = -[UITextView displaySecureTextUsingPlainText](self, "displaySecureTextUsingPlainText") ^ 1;
  return v3;
}

- (void)setForceEnableDictation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextView _textInputTraits](self, "_textInputTraits");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceEnableDictation:", v3);

}

- (BOOL)forceEnableDictation
{
  void *v2;
  char v3;

  -[UITextView _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceEnableDictation");

  return v3;
}

- (void)setForceDisableDictation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextView _textInputTraits](self, "_textInputTraits");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceDisableDictation:", v3);

}

- (BOOL)forceDisableDictation
{
  void *v2;
  char v3;

  -[UITextView _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceDisableDictation");

  return v3;
}

- (UIColor)selectionHighlightColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  -[UITextView textInputTraits](self, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionHighlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled")&& (-[UIView traitCollection](self, "traitCollection"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "userInterfaceStyle"), v5, v6 == 2))
  {
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.35);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (UIColor *)v8;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextView textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "takeTraitsFrom:", v4);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_cancelDataDetectors
{
  id v3;

  objc_msgSend(DataDetectorsUIGetClass(CFSTR("DDDetectionController")), "sharedController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelURLificationForContainer:", self);

}

- (void)_startDataDetectorsIfNeeded
{
  if (-[UITextView _shouldStartDataDetectors](self, "_shouldStartDataDetectors"))
    -[UITextView _startDataDetectors](self, "_startDataDetectors");
}

- (void)_applyOptionsToGeometry
{
  uint64_t defaultTextPreviewOptions_low;

  defaultTextPreviewOptions_low = LODWORD(self->_defaultTextPreviewOptions);
  if (defaultTextPreviewOptions_low == 0xFFFFFFFFLL)
    LOBYTE(defaultTextPreviewOptions_low) = !-[UITextView allowsEditingTextAttributes](self, "allowsEditingTextAttributes");
  -[_UITextStorageDraggableGeometry setGeometryOptions:](self->_geometry, "setGeometryOptions:", defaultTextPreviewOptions_low & 1);
}

- (id)_targetedPreviewForTextInteractableItem:(id)a3 dismissing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _UITextStorageDraggableGeometry *geometry;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;

  v4 = a4;
  v6 = a3;
  if (v6
    && (-[UITextView _applyOptionsToGeometry](self, "_applyOptionsToGeometry"),
        geometry = self->_geometry,
        objc_msgSend(v6, "range"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[_UITextStorageDraggableGeometry targetedPreviewProviderForTextInRange:dismissing:](geometry, "targetedPreviewProviderForTextInRange:dismissing:", v8, v4), v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(), v8, v9))
  {
    ((void (**)(_QWORD, UITextView *, uint64_t))v9)[2](v9, self, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_defaultTextPreviewOptions
{
  return self->_defaultTextPreviewOptions;
}

- (void)_setDefaultTextPreviewOptions:(unint64_t)a3
{
  self->_defaultTextPreviewOptions = a3;
}

- (BOOL)_delegatesAllowingTextItemInteractions
{
  void *v2;
  char v3;

  -[UIScrollView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_opt_respondsToSelector();
  }

  return v3 & 1;
}

- (BOOL)_delegatesAllowingTextItemPrimaryActionInteraction
{
  void *v2;
  char v3;

  -[UIScrollView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegatesAllowingTextItemMenuInteraction
{
  void *v2;
  char v3;

  -[UIScrollView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_delegatesAllowingLinkInteraction
{
  return -[UITextView _delegatesAllowingTextItemPrimaryActionInteraction](self, "_delegatesAllowingTextItemPrimaryActionInteraction")|| -[UITextView _delegatesAllowingTextItemMenuInteraction](self, "_delegatesAllowingTextItemMenuInteraction");
}

- (BOOL)_allowInteraction:(int64_t)a3 forTextInteractableItem:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  _UITextLayoutController *textLayoutController;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  char v19;
  char v20;
  _UITextLayoutController *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _UITextLayoutController *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _UITextLayoutController *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a4;
  -[UIScrollView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 != 0;
  if (a3)
  {
    if (-[UITextView _delegatesAllowingTextItemMenuInteraction](self, "_delegatesAllowingTextItemMenuInteraction"))
      goto LABEL_11;
  }
  else if (-[UITextView _delegatesAllowingTextItemPrimaryActionInteraction](self, "_delegatesAllowingTextItemPrimaryActionInteraction"))
  {
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isLinkItem"))
  {
    v9 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      textLayoutController = self->_textLayoutController;
      objc_msgSend(v9, "range");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[_UITextLayoutController characterRangeForTextRange:](textLayoutController, "characterRangeForTextRange:", v11);
      v14 = v13;

      objc_msgSend(v9, "link");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "textView:shouldInteractWithURL:inRange:interaction:", self, v15, v12, v14, v8);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v19 = 1;
        goto LABEL_19;
      }
      v27 = self->_textLayoutController;
      objc_msgSend(v9, "range");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_UITextLayoutController characterRangeForTextRange:](v27, "characterRangeForTextRange:", v28);
      v31 = v30;

      objc_msgSend(v9, "link");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "textView:shouldInteractWithURL:inRange:", self, v15, v29, v31);
    }
    v19 = v16;
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isAttachmentItem"))
  {
    v17 = v6;
    objc_msgSend(v17, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(off_1E1679D28, "_attachmentHasImage:", v18);

    v20 = dyld_program_sdk_at_least();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = self->_textLayoutController;
      objc_msgSend(v17, "range");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_UITextLayoutController characterRangeForTextRange:](v21, "characterRangeForTextRange:", v22);
      v25 = v24;

      objc_msgSend(v17, "attachment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v7, "textView:shouldInteractWithTextAttachment:inRange:interaction:", self, v15, v23, v25, v8);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:

        goto LABEL_20;
      }
      v32 = self->_textLayoutController;
      objc_msgSend(v17, "range");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[_UITextLayoutController characterRangeForTextRange:](v32, "characterRangeForTextRange:", v33);
      v36 = v35;

      objc_msgSend(v17, "attachment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v7, "textView:shouldInteractWithTextAttachment:inRange:", self, v15, v34, v36);
    }
    v19 = v26 & (v20 | v19);
LABEL_18:

    goto LABEL_19;
  }
LABEL_11:
  v19 = 1;
LABEL_20:

  return v19;
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  -[UITextView _textInteractableItemAtPoint:precision:](self, "_textInteractableItemAtPoint:precision:", 0, a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
  id v3;

  -[UITextView _textInteractableItemAtPoint:precision:](self, "_textInteractableItemAtPoint:precision:", 0, a3.x, a3.y);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeDefaultAction");

}

- (_UITextInteractableItemCache)_textInteractableItemCache
{
  _UITextInteractableItemCache *textInteractableItemCache;
  _UITextInteractableItemCache *v4;
  _UITextInteractableItemCache *v5;

  textInteractableItemCache = self->_textInteractableItemCache;
  if (!textInteractableItemCache)
  {
    v4 = (_UITextInteractableItemCache *)objc_opt_new();
    v5 = self->_textInteractableItemCache;
    self->_textInteractableItemCache = v4;

    textInteractableItemCache = self->_textInteractableItemCache;
  }
  return textInteractableItemCache;
}

- (id)_anyTextItemConstrainedToLineAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  _UITextLayoutController *textLayoutController;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSTextStorage *textStorage;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSTextStorage *v18;
  id v19;
  _QWORD v21[9];
  _QWORD v22[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  y = a3.y;
  x = a3.x;
  -[_UITextLayoutController nearestPositionAtPoint:inContainer:](self->_textLayoutController, "nearestPositionAtPoint:inContainer:", self->_textContainer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  textLayoutController = self->_textLayoutController;
  -[_UITextLayoutController beginningOfDocument](textLayoutController, "beginningOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UITextLayoutController offsetFromPosition:toPosition:](textLayoutController, "offsetFromPosition:toPosition:", v8, v6);

  -[_UITextLayoutController textRangeForLineEnclosingPosition:](self->_textLayoutController, "textRangeForLineEnclosingPosition:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:", v10);
  v13 = v12;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__210;
  v27 = __Block_byref_object_dispose__210;
  v28 = 0;
  textStorage = self->_textStorage;
  v15 = *(_QWORD *)off_1E1678EB8;
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke;
  v22[3] = &unk_1E16E6FA8;
  v22[5] = &v23;
  v22[6] = v9;
  v22[4] = self;
  *(CGFloat *)&v22[7] = x;
  *(CGFloat *)&v22[8] = y;
  -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v15, v11, v12, 0, v22);
  v17 = (void *)v24[5];
  if (!v17)
  {
    v18 = self->_textStorage;
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke_2;
    v21[3] = &unk_1E16E6FA8;
    v21[4] = self;
    v21[5] = &v23;
    v21[6] = v9;
    *(CGFloat *)&v21[7] = x;
    *(CGFloat *)&v21[8] = y;
    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](v18, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("UITextItemTagAttribute"), v11, v13, 0, v21);
    v17 = (void *)v24[5];
  }
  v19 = v17;
  _Block_object_dispose(&v23, 8);

  return v19;
}

void __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v9 = a2;
  v10 = *(_QWORD *)(a1 + 48);
  v12 = v10 >= a3;
  v11 = v10 - a3;
  v12 = !v12 || v11 >= a4;
  if (!v12)
  {
    v19 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v19;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_11:
        *a5 = 1;
        v9 = v19;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v19, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    if (v13)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2688), "textRangeForCharacterRange:", a3, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UITextInteractableItem itemForLink:range:textItemInteractingView:location:](_UITextInteractableItem, "itemForLink:range:textItemInteractingView:location:", v14, v15, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
    goto LABEL_11;
  }
LABEL_12:

}

void __51__UITextView__anyTextItemConstrainedToLineAtPoint___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = *(_QWORD *)(a1 + 48);
  v11 = v9 >= a3;
  v10 = v9 - a3;
  v11 = !v11 || v10 >= a4;
  if (!v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2688), "textRangeForCharacterRange:", a3, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UITextInteractableItem customItemWithTag:range:textItemInteractingView:location:](_UITextInteractableItem, "customItemWithTag:range:textItemInteractingView:location:", v16, v12, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a5 = 1;
    }
  }

}

- (id)_textInteractableItemAtPoint:(CGPoint)a3 precision:(unint64_t)a4
{
  double y;
  double x;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD aBlock[5];
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t *v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  CGRect v46;
  CGRect v47;

  y = a3.y;
  x = a3.x;
  if (a4 == 2)
    v7 = 1.0;
  else
    v7 = 5.0;
  -[NSTextContainer textContainerOrigin](self->_textContainer, "textContainerOrigin");
  v46.size.width = 0.0;
  v46.size.height = 0.0;
  v46.origin.x = x - v10;
  v8 = v46.origin.x;
  v46.origin.y = y - v11;
  v9 = v46.origin.y;
  v47 = CGRectInset(v46, -v7, -v7);
  -[_UITextLayoutController textRangeForBounds:inTextContainer:layoutIfNeeded:](self->_textLayoutController, "textRangeForBounds:inTextContainer:layoutIfNeeded:", self->_textContainer, 1, v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UITextLayoutController characterRangeForTextRange:](self->_textLayoutController, "characterRangeForTextRange:");
  v14 = v13;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  *(double *)&v45[3] = v7 * 1.41421356;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3010000000;
  v43 = 0;
  v44 = 0;
  v42 = &unk_18685B0AF;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__210;
  v37 = __Block_byref_object_dispose__210;
  v38 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UITextView__textInteractableItemAtPoint_precision___block_invoke;
  aBlock[3] = &unk_1E16E6FF8;
  v31 = v8;
  v32 = v9;
  v28 = v45;
  v29 = &v33;
  aBlock[4] = self;
  v27 = 0;
  v30 = &v39;
  v15 = _Block_copy(aBlock);
  v16 = (__CFString *)*(id *)off_1E1678EB8;
  -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](self->_textStorage, "enumerateAttribute:inRange:options:usingBlock:", v16, v12, v14, 0, v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
  }
  ExtendAttributedRangeForAttribute(self->_textStorage, v40[4], v40[5], v16, (NSUInteger *)v40 + 4);
  -[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", v40[4], v40[5]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v34[5], 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v34[5];
    v34[5] = v18;

  }
  +[_UITextInteractableItem itemForLink:range:textItemInteractingView:location:](_UITextInteractableItem, "itemForLink:range:textItemInteractingView:location:", v34[5], v17, self, x, y);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_9:
    v21 = (__CFString *)*(id *)off_1E1678C48;

    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](self->_textStorage, "enumerateAttribute:inRange:options:usingBlock:", v21, v12, v14, 0, v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[UITextView _interactionPossibleWithAttachment:](self, "_interactionPossibleWithAttachment:", v34[5])
      && (-[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", v40[4], v40[5]), v22 = (void *)objc_claimAutoreleasedReturnValue(), +[_UITextInteractableItem itemForAttachment:range:textItemInteractingView:location:](_UITextInteractableItem, "itemForAttachment:range:textItemInteractingView:location:", v34[5], v22, self, x, y), v20 = (void *)objc_claimAutoreleasedReturnValue(), v22, v20))
    {
      v16 = v21;
    }
    else
    {
      v16 = CFSTR("UITextItemTagAttribute");

      -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](self->_textStorage, "enumerateAttribute:inRange:options:usingBlock:", v16, v12, v14, 0, v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_UITextLayoutController textRangeForCharacterRange:](self->_textLayoutController, "textRangeForCharacterRange:", v40[4], v40[5]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UITextInteractableItem customItemWithTag:range:textItemInteractingView:location:](_UITextInteractableItem, "customItemWithTag:range:textItemInteractingView:location:", v34[5], v23, self, x, y);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v45, 8);

  return v20;
}

void __53__UITextView__textInteractableItemAtPoint_precision___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2688), "textRangeForCharacterRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 2688);
    v11 = *(_QWORD *)(v9 + 2088);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__UITextView__textInteractableItemAtPoint_precision___block_invoke_2;
    v17[3] = &unk_1E16E6FD0;
    v23 = *(_OWORD *)(a1 + 72);
    v21 = *(_OWORD *)(a1 + 48);
    v12 = v7;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v18 = v12;
    v19 = v13;
    v15 = v14;
    v24 = a3;
    v25 = a4;
    v16 = *(_QWORD *)(a1 + 64);
    v20 = v15;
    v22 = v16;
    objc_msgSend(v10, "enumerateTextSegmentsInRange:inTextContainer:usingBlock:", v8, v11, v17);

  }
}

id __53__UITextView__textInteractableItemAtPoint_precision___block_invoke_2(uint64_t a1, _BYTE *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id result;
  double v9;
  uint64_t v10;

  result = (id)UIDistanceBetweenPointAndRect(*(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), a3, a4, a5, a6);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v9 < *(double *)(v10 + 24))
  {
    *(double *)(v10 + 24) = v9;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 2080), "attribute:atIndex:effectiveRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0.0)
      *a2 = 1;
  }
  return result;
}

- (id)_textItemForItem:(id)a3
{
  _UITextLayoutController *textLayoutController;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  textLayoutController = self->_textLayoutController;
  v4 = a3;
  objc_msgSend(v4, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UITextLayoutController characterRangeForTextRange:](textLayoutController, "characterRangeForTextRange:", v5);
  v8 = v7;

  objc_msgSend(v4, "itemRepresentationWithRange:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_textInteractableItemForTag:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t v6;
  NSTextStorage *textStorage;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  UITextView *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  int64x2_t v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;

  v4 = a3;
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x4010000000;
  v31 = &unk_18685B0AF;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v32 = *MEMORY[0x1E0C9D648];
  v33 = v5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3010000000;
  v26 = &unk_18685B0AF;
  v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__210;
  v21 = __Block_byref_object_dispose__210;
  v22 = 0;
  v6 = -[NSTextStorage length](self->_textStorage, "length");
  textStorage = self->_textStorage;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__UITextView__textInteractableItemForTag___block_invoke;
  v11[3] = &unk_1E16E7048;
  v8 = v4;
  v12 = v8;
  v13 = self;
  v14 = &v17;
  v15 = &v28;
  v16 = &v23;
  -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("UITextItemTagAttribute"), 0, v6, 0, v11);
  if (v24[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    +[_UITextInteractableItem customItemWithTag:range:textItemInteractingView:location:](_UITextInteractableItem, "customItemWithTag:range:textItemInteractingView:location:", v8, v18[5], self, v29[4] + v29[6] * 0.5, v29[5] + v29[7] * 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v28, 8);

  return v9;
}

void __42__UITextView__textInteractableItemForTag___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "isEqualToString:", a1[4]))
  {
    objc_msgSend(*(id *)(a1[5] + 2688), "textRangeForCharacterRange:", a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = a1[5];
    v14 = *(void **)(v13 + 2688);
    v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v16 = *(_QWORD *)(v13 + 2088);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__UITextView__textInteractableItemForTag___block_invoke_2;
    v18[3] = &unk_1E16E7020;
    v18[4] = a1[7];
    objc_msgSend(v14, "enumerateTextSegmentsInRange:inTextContainer:usingBlock:", v15, v16, v18);
    v17 = *(_QWORD *)(a1[8] + 8);
    *(_QWORD *)(v17 + 32) = a3;
    *(_QWORD *)(v17 + 40) = a4;
    *a5 = 1;
  }

}

uint64_t __42__UITextView__textInteractableItemForTag___block_invoke_2(uint64_t result, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return result;
}

- (id)_primaryActionForTextInteractableItem:(id)a3 defaultAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[UIScrollView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextView _textItemForItem:](self, "_textItemForItem:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textView:primaryActionForTextItem:defaultAction:", self, v11, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_menuConfigurationForTextInteractableItem:(id)a3 defaultMenu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  -[UIScrollView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextItemMenuConfiguration configurationWithMenu:](UITextItemMenuConfiguration, "configurationWithMenu:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextView _textItemForItem:](self, "_textItemForItem:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textView:menuConfigurationForTextItem:defaultMenu:", self, v10, v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
}

- (void)_textInteractableItem:(id)a3 willDisplayMenuWithAnimator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[UIScrollView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextView _textItemForItem:](self, "_textItemForItem:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textView:textItemMenuWillDisplayForTextItem:animator:", self, v8, v6);

  }
}

- (void)_textInteractableItem:(id)a3 willDismissMenuWithAnimator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[UIScrollView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextView _textItemForItem:](self, "_textItemForItem:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textView:textItemMenuWillEndForTextItem:animator:", self, v8, v6);

  }
}

- (BOOL)_interactionPossibleWithAttachment:(id)a3
{
  char v4;
  void *v5;

  if ((objc_msgSend(off_1E1679D28, "_attachmentHasImage:", a3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UIScrollView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 1;
    else
      v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (BOOL)_allowHighlightForTextInteractableItem:(id)a3
{
  id v4;
  void *v5;
  _UITextLayoutController *textLayoutController;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  -[UIScrollView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    textLayoutController = self->_textLayoutController;
    objc_msgSend(v4, "range");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UITextLayoutController characterRangeForTextRange:](textLayoutController, "characterRangeForTextRange:", v7);
    v10 = v9;

    v11 = objc_msgSend(v5, "_textView:shouldHighlightForInteractionInRange:", self, v8, v10);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)_clearHighlightView
{
  -[_UITextViewSearchableObject clearHighlightView](self->_searchableObject, "clearHighlightView");
}

- (void)find:(id)a3
{
  -[UIFindInteraction presentFindNavigatorShowingReplace:](self->_findInteraction, "presentFindNavigatorShowingReplace:", 0);
}

- (void)findAndReplace:(id)a3
{
  -[UIFindInteraction presentFindNavigatorShowingReplace:](self->_findInteraction, "presentFindNavigatorShowingReplace:", 1);
}

- (void)findNext:(id)a3
{
  -[UIFindInteraction findNext](self->_findInteraction, "findNext", a3);
}

- (void)findPrevious:(id)a3
{
  -[UIFindInteraction findPrevious](self->_findInteraction, "findPrevious", a3);
}

- (void)useSelectionForFind:(id)a3
{
  -[_UITextViewSearchableObject useSelectionForFind](self->_searchableObject, "useSelectionForFind", a3);
}

- (void)_findSelected:(id)a3
{
  id v4;

  v4 = a3;
  -[UITextView useSelectionForFind:](self, "useSelectionForFind:", v4);
  -[UITextView find:](self, "find:", v4);

}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  return -[UITextSearchingFindSession initWithSearchableObject:]([UITextSearchingFindSession alloc], "initWithSearchableObject:", self);
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  -[UITextView didBeginTextSearchOperation](self, "didBeginTextSearchOperation", a3, a4);
  -[_UITextViewSearchableObject didBeginFindSession](self->_searchableObject, "didBeginFindSession");
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  -[UITextView didEndTextSearchOperation](self, "didEndTextSearchOperation", a3, a4);
  -[_UITextViewSearchableObject didEndFindSession](self->_searchableObject, "didEndFindSession");
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  return -[_UITextViewSearchableObject compareFoundRange:toRange:inDocument:](self->_searchableObject, "compareFoundRange:toRange:inDocument:", a3, a4, a5);
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  -[_UITextViewSearchableObject performTextSearchWithQueryString:usingOptions:resultAggregator:](self->_searchableObject, "performTextSearchWithQueryString:usingOptions:resultAggregator:", a3, a4, a5);
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  -[_UITextViewSearchableObject decorateFoundTextRange:inDocument:usingStyle:](self->_searchableObject, "decorateFoundTextRange:inDocument:usingStyle:", a3, a4, a5);
}

- (void)clearAllDecoratedFoundText
{
  -[_UITextViewSearchableObject clearAllDecoratedFoundText](self->_searchableObject, "clearAllDecoratedFoundText");
}

- (BOOL)supportsTextReplacement
{
  return -[_UITextViewSearchableObject supportsTextReplacement](self->_searchableObject, "supportsTextReplacement");
}

- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  return -[_UITextViewSearchableObject shouldReplaceFoundTextInRange:inDocument:withText:](self->_searchableObject, "shouldReplaceFoundTextInRange:inDocument:withText:", a3, a4, a5);
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  -[_UITextViewSearchableObject replaceFoundTextInRange:inDocument:withText:](self->_searchableObject, "replaceFoundTextInRange:inDocument:withText:", a3, a4, a5);
}

- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5
{
  -[_UITextViewSearchableObject replaceAllOccurrencesOfQueryString:usingOptions:withText:](self->_searchableObject, "replaceAllOccurrencesOfQueryString:usingOptions:withText:", a3, a4, a5);
}

- (void)willHighlightFoundTextRange:(id)a3 inDocument:(id)a4
{
  -[_UITextViewSearchableObject willHighlightFoundTextRange:inDocument:](self->_searchableObject, "willHighlightFoundTextRange:inDocument:", a3, a4);
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  -[_UITextViewSearchableObject scrollRangeToVisible:inDocument:](self->_searchableObject, "scrollRangeToVisible:inDocument:", a3, a4);
}

- (id)_targetedPreviewForHighlightRange:(id)a3
{
  return -[_UITextViewSearchableObject targetedPreviewForHighlightRange:](self->_searchableObject, "targetedPreviewForHighlightRange:", a3);
}

- (id)_textLineRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView selectionRectsForRange:](self, "selectionRectsForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "rect");
        v14 = fabs(v13);
        if (fabs(v12) >= 2.22044605e-16 && v14 >= 2.22044605e-16)
        {
          v16 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(v11, "rect");
          objc_msgSend(v16, "valueWithCGRect:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4
{
  return -[UITextView _targetedPreviewForRange:withRenderingAttributes:includeFullDocument:](self, "_targetedPreviewForRange:withRenderingAttributes:includeFullDocument:", a3, a4, 0);
}

- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4 includeFullDocument:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  UIPreviewTarget *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIPreviewTarget *v26;
  UITargetedPreview *v27;
  UITargetedPreview *v28;
  unint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  UITextView *v36;
  id v37;
  id v38;
  _BYTE *v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v5 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
  {
    v30 = _targetedPreviewForRange_withRenderingAttributes_includeFullDocument____s_category;
    if (!_targetedPreviewForRange_withRenderingAttributes_includeFullDocument____s_category)
    {
      v30 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&_targetedPreviewForRange_withRenderingAttributes_includeFullDocument____s_category);
    }
    v31 = *(NSObject **)(v30 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "Creating targeted preview for range: %@, renderingAttributes: %@", buf, 0x16u);
    }
  }
  -[UITextView _previewRendererForRange:unifyRects:](self, "_previewRendererForRange:unifyRects:", v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addRenderingAttributes:", v9);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__210;
  v42 = __Block_byref_object_dispose__210;
  v43 = 0;
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __83__UITextView__targetedPreviewForRange_withRenderingAttributes_includeFullDocument___block_invoke;
  v35 = &unk_1E16E7070;
  v36 = self;
  v11 = v8;
  v37 = v11;
  v39 = buf;
  v12 = v10;
  v38 = v12;
  v13 = _Block_copy(&v32);
  v14 = v13;
  if (v5)
  {
    -[UITextView textContainer](self, "textContainer", v32, v33, v34, v35, v36, v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;

    -[UITextView _setFreezeTextContainerSize:](self, "_setFreezeTextContainerSize:", 1);
    if (-[_UITextLayoutController canAccessLayoutManager](self->_textLayoutController, "canAccessLayoutManager"))-[UITextView _performTextKit1LayoutCalculation:inSize:](self, "_performTextKit1LayoutCalculation:inSize:", v14, v17, 3.40282347e38);
    else
      -[UITextView _performTextKit2LayoutCalculation:inSize:](self, "_performTextKit2LayoutCalculation:inSize:", v14, v17, 3.40282347e38);
    -[UITextView _setFreezeTextContainerSize:](self, "_setFreezeTextContainerSize:", 0);
  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }
  objc_msgSend(v9, "allKeys", v32, v33, v34, v35, v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeRenderingAttributes:", v18);

  -[UITextView _textLineRectsForRange:](self, "_textLineRectsForRange:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextHighlightView preferredPreviewParametersForTextLineRects:](UITextHighlightView, "preferredPreviewParametersForTextLineRects:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = [UIPreviewTarget alloc];
  -[UIView frame](self, "frame");
  v26 = -[UIPreviewTarget initWithContainer:center:](v21, "initWithContainer:center:", self, v23 + v22 * 0.5, v25 + v24 * 0.5);
  v27 = [UITargetedPreview alloc];
  v28 = -[UITargetedPreview initWithView:parameters:target:](v27, "initWithView:parameters:target:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v20, v26);

  _Block_object_dispose(buf, 8);
  return v28;
}

uint64_t __83__UITextView__targetedPreviewForRange_withRenderingAttributes_includeFullDocument___block_invoke(uint64_t a1)
{
  UIImageView *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2688), "ensureLayoutForRange:", *(_QWORD *)(a1 + 40));
  v2 = [UIImageView alloc];
  objc_msgSend(*(id *)(a1 + 48), "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIImageView initWithImage:](v2, "initWithImage:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setContentMode:", 5);
  objc_msgSend(*(id *)(a1 + 32), "_boundingRectForRange:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFrame:");
}

- (BOOL)_delegateSuppliesWritingToolsIgnoredRanges
{
  return (*((unsigned __int8 *)&self->_tvFlags + 3) >> 6) & 1;
}

- (void)_setUniqueWritingToolsAnimatedLayoutInfo:(id)a3
{
  -[_UITextContainerView setUniqueWritingToolsAnimatedLayoutInfo:](self->_containerView, "setUniqueWritingToolsAnimatedLayoutInfo:", a3);
}

- (_UIAnimatedTextLayoutInfo)_uniqueWritingToolsAnimatedLayoutInfo
{
  return -[_UITextContainerView uniqueWritingToolsAnimatedLayoutInfo](self->_containerView, "uniqueWritingToolsAnimatedLayoutInfo");
}

- (void)_setLayoutFragmentViewsHidden:(BOOL)a3 forTextRange:(id)a4
{
  -[_UITextContainerView setLayoutFragmentViewsHidden:forTextRange:](self->_containerView, "setLayoutFragmentViewsHidden:forTextRange:", a3, a4);
}

- (void)_removeLayoutFragmentViewHiding
{
  -[_UITextContainerView removeLayoutFragmentViewHiding](self->_containerView, "removeLayoutFragmentViewHiding");
}

- (BOOL)_textStorageOverridesReplaceCharactersInRangeWithAttributedString
{
  return (*((unsigned __int8 *)&self->_tvFlags + 4) >> 1) & 1;
}

- (void)setAllowedWritingToolsResultOptions:(unint64_t)a3
{
  const __CFString *v5;
  id v6;

  if ((a3 & 8) != 0
    && (!_UIIsPrivateMainBundle()
     || -[UITextView isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class())))
  {
    if (_UIIsPrivateMainBundle() && (os_variant_has_internal_diagnostics() & 1) != 0)
      v5 = CFSTR("UITextView does not yet support UIWritingToolsResultTable. Troublesome SPI can make it possible for apps allowed to use SPI.");
    else
      v5 = CFSTR("UITextView does not yet support UIWritingToolsResultTable");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v5);
  }
  -[UITextView _textInputTraits](self, "_textInputTraits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowedWritingToolsResultOptions:", a3);

}

- (unint64_t)allowedWritingToolsResultOptions
{
  void *v2;
  unint64_t v3;

  -[UITextView _textInputTraits](self, "_textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowedWritingToolsResultOptions");

  return v3;
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v6;
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    tvFlags = self->_tvFlags;
    if ((*(_DWORD *)&tvFlags & 0x10000000) != 0)
    {
      -[UIScrollView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textViewWritingToolsWillBegin:", self);
      goto LABEL_6;
    }
    if ((*(_DWORD *)&tvFlags & 0x4000000) != 0)
    {
      -[UIScrollView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_textViewWillBeginTextAssistantSession:", self);
LABEL_6:

    }
  }
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "willBeginWritingToolsSession:requestContexts:", v10, v6);

}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didBeginWritingToolsSession:contexts:", v7, v6);

}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writingToolsSession:didReceiveAction:", v6, a4);

}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  $CAC7BB7223AC380D8D33E5BCBA12464E tvFlags;
  id v9;

  v4 = a4;
  v6 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didEndWritingToolsSession:accepted:", v6, v4);

  tvFlags = self->_tvFlags;
  if ((*(_DWORD *)&tvFlags & 0x20000000) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textViewWritingToolsDidEnd:", self);
LABEL_6:

    return;
  }
  if ((*(_DWORD *)&tvFlags & 0x8000000) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_textViewDidEndTextAssistantSession:", self);
    goto LABEL_6;
  }
}

- (BOOL)isWritingToolsActive
{
  void *v2;
  char v3;

  -[UITextView _existingTextAssistantManager](self, "_existingTextAssistantManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveWritingToolsSession");

  return v3;
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 inContext:(id)a5 finished:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v12, v11, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v6);

}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v15, v14, location, length, v13, v7);

}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestion:(id)a5 inContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v12, a4, v13, v10);
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v12, a4, v11, v10);

}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  id v14;

  length = a5.length;
  location = a5.location;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v13, v12, location, length, v11, 0);

}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v15, v14, location, length, v13, v7);

}

- (void)compositionSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UITextView _textAssistantManager](self, "_textAssistantManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writingToolsSession:didReceiveAction:", v6, a4);

}

- (BOOL)worksWithAnimatedTextSpacer
{
  return 1;
}

- (_UITextAssistantManager)_textAssistantManager
{
  _UITextAssistantManager *textAssistantManager;
  _UITextAssistantManager *v4;
  _UITextAssistantManager *v5;

  textAssistantManager = self->_textAssistantManager;
  if (!textAssistantManager)
  {
    v4 = -[_UITextAssistantManager initWithTextView:]([_UITextAssistantManager alloc], "initWithTextView:", self);
    v5 = self->_textAssistantManager;
    self->_textAssistantManager = v4;

    textAssistantManager = self->_textAssistantManager;
  }
  return textAssistantManager;
}

- (id)_existingTextAssistantManager
{
  return self->_textAssistantManager;
}

- (UIDragInteraction)textDragInteraction
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_textDragDropSupport)
  {
    -[UIView interactions](self, "interactions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextDragDropSupport dragInteraction](self->_textDragDropSupport, "dragInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "indexOfObject:", v4) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      -[UITextDragDropSupport dragInteraction](self->_textDragDropSupport, "dragInteraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }
  return (UIDragInteraction *)v5;
}

- (UIDropInteraction)textDropInteraction
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_textDragDropSupport)
  {
    -[UIView interactions](self, "interactions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextDragDropSupport dropInteraction](self->_textDragDropSupport, "dropInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "indexOfObject:", v4) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      -[UITextDragDropSupport dropInteraction](self->_textDragDropSupport, "dropInteraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }
  return (UIDropInteraction *)v5;
}

- (void)invalidateDropCaret
{
  -[UITextDragDropSupport invalidateDropCaret](self->_textDragDropSupport, "invalidateDropCaret");
}

- (void)draggingFinished:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[UITextView _updateSelectionGestures](self, "_updateSelectionGestures");
  v5 = objc_msgSend(v4, "dragTearoffOccured");

  if ((v5 & 1) == 0)
  {
    -[UITextView selectedRange](self, "selectedRange");
    if (v6)
    {
      -[UITextView interactionAssistant](self, "interactionAssistant");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "showSelectionCommands");

    }
  }
}

- (BOOL)canBecomeDropResponder
{
  return 1;
}

- (BOOL)allowsDraggingAttachments
{
  return 1;
}

- (void)droppingStarted
{
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
    -[UITextView _notifyDidBeginEditing](self, "_notifyDidBeginEditing");
}

- (void)droppingFinished
{
  if (!-[UIView isFirstResponder](self, "isFirstResponder"))
  {
    -[UITextView _startDataDetectorsIfNeeded](self, "_startDataDetectorsIfNeeded");
    -[UITextView _notifyDidEndEditing](self, "_notifyDidEndEditing");
  }
}

- (UITextPasteDelegate)pasteDelegate
{
  return (UITextPasteDelegate *)objc_loadWeakRetained((id *)&self->_pasteDelegate);
}

- (NSCustomTextRendering)customRenderController
{
  return self->_customRenderController;
}

- (BOOL)allowsTextAnimations
{
  return self->_allowsTextAnimations;
}

- (void)set_textInteractableItemCache:(id)a3
{
  objc_storeStrong((id *)&self->_textInteractableItemCache, a3);
}

- (BOOL)isFindInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (UIFindInteraction)findInteraction
{
  return self->_findInteraction;
}

- (_UITextViewSearchableObject)searchableObject
{
  return self->_searchableObject;
}

- (void)setSearchableObject:(id)a3
{
  objc_storeStrong((id *)&self->_searchableObject, a3);
}

- (void)setTextDragOptions:(int64_t)a3
{
  self->_textDragOptions = a3;
}

- (UITextDragDelegate)textDragDelegate
{
  return (UITextDragDelegate *)objc_loadWeakRetained((id *)&self->_textDragDelegate);
}

- (UITextDropDelegate)textDropDelegate
{
  return (UITextDropDelegate *)objc_loadWeakRetained((id *)&self->_textDropDelegate);
}

- (UIView)inputView
{
  return (UIView *)objc_getProperty(self, a2, 2264, 1);
}

- (UITextViewBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(UITextViewBorderStyle)borderStyle
{
  self->_borderStyle = borderStyle;
}

- (BOOL)_isTextLayoutManagerEnabled
{
  return self->_textLayoutManagerEnabled;
}

- (_UITextViewVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  -[_UITextLayoutController setDrawsDebugBaselines:](self->_textLayoutController, "setDrawsDebugBaselines:", a3);
}

- (BOOL)_drawsDebugBaselines
{
  return -[_UITextLayoutController drawsDebugBaselines](self->_textLayoutController, "drawsDebugBaselines");
}

- (void)encodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  v7 = -[UITextView isEditable](self, "isEditable");
  v8 = -[UITextView selectedRange](self, "selectedRange");
  v10 = v9;
  v11 = v9 != 0;
  if (v7)
  {
    v12 = -[UIView isFirstResponder](self, "isFirstResponder");
    if (v10)
      v11 = 1;
    else
      v11 = v12;
  }
  v18.receiver = self;
  v18.super_class = (Class)UITextView;
  -[UIScrollView encodeRestorableStateWithCoder:](&v18, sel_encodeRestorableStateWithCoder_, v6);
  if (v11)
  {
    objc_msgSend(v6, "encodeInt:forKey:", v10, CFSTR("kTextSelectedTextLengthKey"));
    objc_msgSend(v6, "encodeInt:forKey:", v8, CFSTR("kTextSelectedTextLocationKey"));
    if (v4)
    {
      -[UITextView selectedText](self, "selectedText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
        objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("kTextSelectedTextKey"));
      if (-[UITextView _isDisplayingShortcutViewController](self, "_isDisplayingShortcutViewController"))
        objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
      if (-[UITextView _isDisplayingReferenceLibraryViewController](self, "_isDisplayingReferenceLibraryViewController"))
      {
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "userInterfaceIdiom");

        if (!v15)
          objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
        objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("kTextDisplayingReferenceLibraryViewControllerKey"));
      }
      if (-[UITextView _isDisplayingShareViewController](self, "_isDisplayingShareViewController"))
        objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");

    }
  }
  -[UITextView _restorableScrollPositionForStateRestoration](self, "_restorableScrollPositionForStateRestoration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v6, "encodeObject:forKey:", v17, CFSTR("kTextVisiblePosition"));
  objc_msgSend(v6, "encodeBool:forKey:", v7, CFSTR("kTextEditableKey"));
  objc_msgSend(v6, "encodeBool:forKey:", -[UIView isFirstResponder](self, "isFirstResponder"), CFSTR("kTextFirstResponderKey"));

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  -[UITextView encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", a3, 1);
}

- (void)decodeRestorableStateWithCoder:(id)a3 includingSelectedTextAndDisplayedViewControllers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  int v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD block[4];
  id v23;
  UITextView *v24;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kTextEditableKey")))
    -[UITextView setEditable:](self, "setEditable:", objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextEditableKey")));
  if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kTextFirstResponderKey"))
    && objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextFirstResponderKey")))
  {
    -[UITextView becomeFirstResponder](self, "becomeFirstResponder");
  }
  if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kTextSelectedTextLengthKey")))
  {
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kTextSelectedTextLocationKey")))
    {
      v7 = objc_msgSend(v6, "decodeIntForKey:", CFSTR("kTextSelectedTextLengthKey"));
      v8 = objc_msgSend(v6, "decodeIntForKey:", CFSTR("kTextSelectedTextLocationKey"));
      if (-[UITextView isEditable](self, "isEditable") || v7)
      {
        if (-[UIScrollView isProgrammaticScrollEnabled](self, "isProgrammaticScrollEnabled"))
        {
          -[UIScrollView setProgrammaticScrollEnabled:](self, "setProgrammaticScrollEnabled:", 0);
          -[UITextView becomeFirstResponder](self, "becomeFirstResponder");
          -[UITextView setSelectedRange:](self, "setSelectedRange:", v8, v7);
          -[UIScrollView setProgrammaticScrollEnabled:](self, "setProgrammaticScrollEnabled:", 1);
          if (!v4)
            goto LABEL_21;
        }
        else
        {
          -[UITextView becomeFirstResponder](self, "becomeFirstResponder");
          -[UITextView setSelectedRange:](self, "setSelectedRange:", v8, v7);
          if (!v4)
            goto LABEL_21;
        }
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTextSelectedTextKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextDisplayingShortcutViewControllerKey"));
          v11 = objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextDisplayingReferenceLibraryViewControllerKey"));
          objc_msgSend(v6, "decodeBoolForKey:", CFSTR("kTextDisplayingShareViewControllerKey"));
          if ((v10 & 1) == 0)
          {
            if (v11)
            {
              +[UIDevice currentDevice](UIDevice, "currentDevice");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "userInterfaceIdiom");

              if (v13)
              {
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __112__UITextView_StateRestoration__decodeRestorableStateWithCoder_includingSelectedTextAndDisplayedViewControllers___block_invoke;
                block[3] = &unk_1E16B1B50;
                v23 = v9;
                v24 = self;
                dispatch_async(MEMORY[0x1E0C80D38], block);

              }
              else
              {
                -[UITextView selectedText](self, "selectedText");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "isEqualToString:", v14);

              }
            }
          }
        }

      }
    }
  }
LABEL_21:
  v21.receiver = self;
  v21.super_class = (Class)UITextView;
  -[UIScrollView decodeRestorableStateWithCoder:](&v21, sel_decodeRestorableStateWithCoder_, v6);
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v18, CFSTR("kTextVisiblePosition"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_UITextViewRestorableScrollPosition restorableScrollPositionWithDictionary:](_UITextViewRestorableScrollPosition, "restorableScrollPositionWithDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      -[UITextView _restoreScrollPosition:animated:](self, "_restoreScrollPosition:animated:", v20, 0);

  }
}

void __112__UITextView_StateRestoration__decodeRestorableStateWithCoder_includingSelectedTextAndDisplayedViewControllers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "_define:", *(_QWORD *)(a1 + 40));
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  -[UITextView decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", a3, 1);
}

- (id)_interactionState
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[UITextView encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "encodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", v3, 0);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setInteractionState:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v10 = 0;
  v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, &v10);

  v7 = v10;
  if (v6)
  {
    -[UITextView decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:](self, "decodeRestorableStateWithCoder:includingSelectedTextAndDisplayedViewControllers:", v6, 0);
  }
  else
  {
    v8 = _setInteractionState____s_category_0;
    if (!_setInteractionState____s_category_0)
    {
      v8 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_setInteractionState____s_category_0);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[UITextView(_UIInteractionStateRestorable) _setInteractionState:]";
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%s: Error decoding interaction state (%@)", buf, 0x16u);
      }
    }
  }

}

- (id)_nonNullUITextRangeForTextKitRanges:(id)a3
{
  void *v3;

  -[UITextView _rangeForTextKitRanges:](self, "_rangeForTextKitRanges:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_nonNullUITextRangeFromNSRange:(_NSRange)a3
{
  void *v3;

  -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", a3.location, a3.length);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_internalTextLayoutController
{
  void *v2;

  -[UITextView textLayoutController](self, "textLayoutController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (id)_NSTextRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  length = a3.length;
  location = a3.location;
  -[UITextView _internalTextLayoutController](self, "_internalTextLayoutController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView textLayoutController](self, "textLayoutController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextView.m"), 8320, CFSTR("Can't fetch NSTextRange from this textLayoutController: %@"), v11);

  }
  objc_msgSend(v7, "_rangeForCharacterRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_NSRange)_nsRangeForNonNullUITextRange:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  if (a3)
  {
    v3 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:");
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)_indexForNonNullUITextPosition:(id)a3
{
  if (a3)
    return -[UIResponder _indexForTextPosition:](self, "_indexForTextPosition:");
  else
    return 0;
}

- (_NSRange)_nsRangeForTextKitRanges:(id)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[UITextView _nonNullUITextRangeForTextKitRanges:](self, "_nonNullUITextRangeForTextKitRanges:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)_nonNullIntersectionOfUITextRange:(id)a3 withOtherUITextRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UITextView comparePosition:toPosition:](self, "comparePosition:toPosition:", v10, v11);

    if (v12 == -1)
    {
      objc_msgSend(v6, "start");
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    -[UITextView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v9, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return !-[UIScrollView isScrollEnabled](self, "isScrollEnabled");
}

- (id)_fontInfoForBaselineSpacing
{
  id result;

  result = -[UITextView font](self, "font");
  if (!result)
    return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  return result;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return ((_DWORD)a3 - 11) < 2;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result;
  objc_super v8;

  if ((a3 - 5) > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextView;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v8, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, a6);
  }
  else
  {
    _UIViewBaselineToEdgeSpacing(-[UITextView _fontInfoForBaselineSpacing](self, "_fontInfoForBaselineSpacing"), a3);
    UICeilToViewScale(self);
  }
  return result;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  uint64_t v10;
  uint64_t v13;
  unsigned int v15;
  double result;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[16];

  v10 = *(_QWORD *)&a6;
  v13 = *(_QWORD *)&a3;
  if ((a3 - 5) <= 1)
  {
    v15 = a4 - 11;
    if (os_variant_has_internal_diagnostics())
    {
      if (v15 < 2)
        goto LABEL_4;
      v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
      }
    }
    else
    {
      if (v15 < 2)
      {
LABEL_4:
        _UIViewBaselineSpacing(self, a5, v13);
        return result;
      }
      v18 = _autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_882;
      if (!_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_882)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category_882);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)UITextView;
  -[UIView _autolayoutSpacingAtEdge:forAttribute:nextToNeighbor:edge:attribute:multiplier:](&v20, sel__autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier_, v13, a4, a5, v10, a7, a8);
  return result;
}

@end
