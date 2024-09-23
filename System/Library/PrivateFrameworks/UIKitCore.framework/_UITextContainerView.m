@implementation _UITextContainerView

- (void)_setNeedsContentsFormatUpdate
{
  -[_UITextCanvas _setNeedsContentsFormatUpdate](self->_canvasView, "_setNeedsContentsFormatUpdate");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextContainerView;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_UITextCanvas setNeedsDisplay](self->_canvasView, "setNeedsDisplay");
  -[_UITextContainerView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGPoint)textContainerOrigin
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
  double top;
  double left;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double x;
  double y;
  CGPoint result;

  if ((*(_BYTE *)&self->_tcvFlags & 1) != 0)
  {
    -[_UITextContainerView textContainer](self, "textContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_UITextLayoutController usedRectForTextContainer:](self->_textLayoutController, "usedRectForTextContainer:", v3);
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[UIView bounds](self, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(v3, "size");
      top = self->_textContainerInset.top;
      left = self->_textContainerInset.left;
      v24 = v9 + left + self->_textContainerInset.right;
      v25 = v11 + top + self->_textContainerInset.bottom;
      if (v24 >= v17)
      {
        v31 = v13 + left - v5;
      }
      else
      {
        v26 = v17 - v24;
        v27 = v20 - (v5 + v9);
        if (v26 + 0.001 >= v5 + v27)
        {
          v31 = v13 + left;
        }
        else
        {
          v28 = v26 * 0.5;
          if (v26 * 0.5 > v5 || v28 > v27)
          {
            v31 = v13 + left;
            if (v28 > v27)
              v31 = v31 - v5 + v26 - v27;
          }
          else
          {
            v31 = v13 + left - v5 + v28;
          }
        }
      }
      if (v25 >= v19)
      {
        v30 = v15 + top - v7;
      }
      else
      {
        v32 = v19 - v25;
        v33 = v21 - (v7 + v11);
        if (v32 >= v7 + v33)
        {
          v30 = v15 + top;
        }
        else
        {
          v34 = v32 * 0.5;
          if (v32 * 0.5 > v7 || v34 > v33)
          {
            v30 = v15 + top;
            if (v34 > v33)
              v30 = v30 - v7 + v32 - v33;
          }
          else
          {
            v30 = v15 + top - v7 + v34;
          }
        }
      }
    }
    else
    {
      v30 = self->_textContainerInset.top;
      v31 = self->_textContainerInset.left;
    }
    if (self->_textContainerOrigin.x != v31 || self->_textContainerOrigin.y != v30)
    {
      self->_textContainerOrigin.x = v31;
      self->_textContainerOrigin.y = v30;
      -[_UITextContainerView setNeedsDisplay](self, "setNeedsDisplay");
    }
    *(_BYTE *)&self->_tcvFlags &= ~1u;

  }
  x = self->_textContainerOrigin.x;
  y = self->_textContainerOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)_clipRectForFadedEdges
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_NSRange)markedRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "markedRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (UIScrollView)enclosingScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)textContainerUsageDidChangeToSize:(CGSize)a3
{
  -[_UITextContainerView setConstrainedFrameSize:](self, "setConstrainedFrameSize:", a3.width + self->_textContainerInset.left + self->_textContainerInset.right, a3.height + self->_textContainerInset.top + self->_textContainerInset.bottom);
}

- (CGSize)minSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minSize.width;
  height = self->_minSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)_freezeTextContainerSize
{
  return (*(_BYTE *)&self->_tcvFlags >> 5) & 1;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (int64_t)layoutOrientation
{
  return ((unint64_t)*(_BYTE *)&self->_tcvFlags >> 1) & 3;
}

- (void)setVerticallyResizable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_tcvFlags = *(_BYTE *)&self->_tcvFlags & 0xEF | v3;
}

- (void)setHorizontallyResizable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_tcvFlags = *(_BYTE *)&self->_tcvFlags & 0xF7 | v3;
}

- (void)sizeToFit
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[_UITextContainerView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = 0;
    v6 = 0;
    if (-[_UITextContainerView _shouldCapSizeToFitLayoutRange:](self, "_shouldCapSizeToFitLayoutRange:", &v5))
    {
      -[_UITextContainerView layoutManager](self, "layoutManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ensureLayoutForGlyphRange:", v5, v6);

    }
    else if (!-[_UITextContainerView _ensureLayoutForCappedSize](self, "_ensureLayoutForCappedSize"))
    {
      -[_UITextLayoutController ensureLayoutForTextContainer:](self->_textLayoutController, "ensureLayoutForTextContainer:", v3);
    }
    -[_UITextContainerView _sizeToConstrainedContainerUsedRect](self, "_sizeToConstrainedContainerUsedRect");
  }

}

- (BOOL)_shouldCapSizeToFitLayoutRange:(_NSRange *)a3
{
  void *v5;
  UITextView **p_textView;
  id WeakRetained;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger location;
  unint64_t v12;
  unint64_t length;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  unint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  NSRange v23;
  NSUInteger v24;
  NSUInteger v25;
  id v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  BOOL v32;
  double v33;
  NSRange v35;
  NSRange v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[_UITextContainerView layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_13;
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  if (!WeakRetained)
    goto LABEL_13;
  -[_UITextContainerView textContainer](self, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "glyphRangeForTextContainer:", v8);
  if (!v10)
  {

LABEL_13:
    v32 = 0;
    goto LABEL_18;
  }
  location = v9;
  v12 = v9 + v10;
  if (v9 >= v9 + v10)
  {
    length = 0;
  }
  else
  {
    length = 0;
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v18 = v9;
    do
    {
      v35.location = 0;
      v35.length = 0;
      objc_msgSend(v5, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v18, &v35, 1);
      v39.origin.x = v19;
      v39.origin.y = v20;
      v39.size.width = v21;
      v39.size.height = v22;
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v38 = CGRectUnion(v37, v39);
      x = v38.origin.x;
      y = v38.origin.y;
      width = v38.size.width;
      height = v38.size.height;
      v36.location = location;
      v36.length = length;
      v23 = NSUnionRange(v36, v35);
      location = v23.location;
      length = v23.length;
      v24 = v35.location;
      v25 = v35.length;
      if (!objc_msgSend(v8, "layoutOrientation"))
      {
        v26 = objc_loadWeakRetained((id *)p_textView);
        objc_msgSend(v26, "bounds");
        v28 = v27;

        if (height > v28)
          break;
      }
      if (objc_msgSend(v8, "layoutOrientation") == 1)
      {
        v29 = objc_loadWeakRetained((id *)p_textView);
        objc_msgSend(v29, "bounds");
        v31 = v30;

        if (width > v31)
          break;
      }
      v18 = v24 + v25 + 1;
    }
    while (v18 < v12);
  }
  v33 = (double)(location + length) * 1.5;
  v32 = v33 < (double)v12;
  if (v33 < (double)v12)
  {
    a3->location = location;
    a3->length = (unint64_t)((double)length * 1.5);
  }

LABEL_18:
  return v32;
}

- (NSLayoutManager)layoutManager
{
  NSTextContainer **p_textContainer;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  p_textContainer = &self->_textContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
  objc_msgSend(WeakRetained, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_textContainer);
    objc_msgSend(v6, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSLayoutManager *)v5;
}

- (BOOL)_ensureLayoutForCappedSize
{
  UITextView **p_textView;
  id WeakRetained;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    if (objc_msgSend(v5, "layoutOrientation"))
      v14 = v8;
    else
      v14 = v10;
    -[_UITextLayoutController ensureLayoutForBounds:inTextContainer:](self->_textLayoutController, "ensureLayoutForBounds:inTextContainer:", v5, v11, v12, v13, v14 * 1.5);
  }

  return v5 != 0;
}

- (void)setTextContainerInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  id v24;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != self->_textContainerInset.left
    || a3.top != self->_textContainerInset.top
    || a3.right != self->_textContainerInset.right
    || a3.bottom != self->_textContainerInset.bottom)
  {
    self->_textContainerInset = a3;
    -[_UITextContainerView textContainer](self, "textContainer");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v11 = objc_msgSend(v24, "widthTracksTextView");
      v12 = objc_msgSend(v24, "heightTracksTextView");
      v13 = v12;
      if ((v11 & 1) != 0 || v12)
      {
        objc_msgSend(v24, "size");
        v15 = v14;
        v17 = v16;
        -[UIView bounds](self, "bounds");
        v20 = v19 - (left + right);
        if (!v11)
          v20 = v15;
        v21 = v18 - (top + bottom);
        if (!v13)
          v21 = v17;
        if (v15 != v20 || v17 != v21)
        {
          objc_msgSend(v24, "setSize:");
          if ((dyld_program_sdk_at_least() & 1) != 0)
            goto LABEL_30;
          goto LABEL_29;
        }
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
LABEL_29:
          -[_UITextContainerView layoutManager](self, "layoutManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "textContainerChangedGeometry:", v24);

          goto LABEL_30;
        }
      }
      else if (!dyld_program_sdk_at_least())
      {
        goto LABEL_29;
      }
      -[_UITextContainerView _sizeToConstrainedContainerUsedRect](self, "_sizeToConstrainedContainerUsedRect");
    }
LABEL_30:
    -[_UITextContainerView invalidateTextContainerOrigin](self, "invalidateTextContainerOrigin");
    -[_UITextContainerView setNeedsDisplay](self, "setNeedsDisplay");
    -[_UITextContainerView updateInsertionPointStateAndRestartTimer:](self, "updateInsertionPointStateAndRestartTimer:", 0);

  }
}

- (void)updateInsertionPointStateAndRestartTimer:(BOOL)a3
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[2];
  CGRect v11;

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[UIView bounds](self, "bounds");
  if (!CGRectIsEmpty(v11)
    && WeakRetained
    && objc_msgSend(WeakRetained, "isEditableForTextContainerView:", self))
  {
    v5 = objc_msgSend(WeakRetained, "selectedRangeForTextContainerView:", self);
    v7 = v6;
    -[_UITextContainerView layoutManager](self, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)&self->_textContainer);
    v10[0] = 0;
    objc_msgSend(v8, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v5, v7, v5, v7, v9, v10);

    objc_msgSend(WeakRetained, "updateSelectionForTextContainerView:", self);
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextContainerView;
  v4 = a3;
  -[UIView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[_UITextCanvas setBackgroundColor:](self->_canvasView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (_UITextContainerView)initWithFrame:(CGRect)a3 textLayoutController:(id)a4 textContainer:(id)a5 delegate:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  _UITextContainerView *v17;
  _UITextContainerView *v18;
  uint64_t *p_textLayoutController;
  void *v20;
  uint64_t v21;
  _UITextCanvas *canvasView;
  id v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_UITextContainerView;
  v17 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    p_textLayoutController = (uint64_t *)&v17->_textLayoutController;
    objc_storeStrong((id *)&v17->_textLayoutController, a4);
    v20 = (void *)objc_opt_class();
    -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:](*p_textLayoutController, v20);
    objc_msgSend((id)*p_textLayoutController, "dequeueCanvasViewForTextContainer:", v15);
    v21 = objc_claimAutoreleasedReturnValue();
    canvasView = v18->_canvasView;
    v18->_canvasView = (_UITextCanvas *)v21;

    -[_UITextCanvas setContext:](v18->_canvasView, "setContext:", v18);
    -[UIView addSubview:](v18, "addSubview:", v18->_canvasView);
    objc_storeWeak((id *)&v18->_delegate, v16);
    v23 = objc_storeWeak((id *)&v18->_textContainer, v15);
    objc_msgSend(v15, "setTextView:", v18);

    *(_BYTE *)&v18->_tcvFlags |= 1u;
    _UITextContainerViewResyncNSTextContainer(v18, x, y, width, height);
    -[UIView setContentMode:](v18, "setContentMode:", 9);
  }

  return v18;
}

- (_UITextCanvas)canvasView
{
  return self->_canvasView;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  -[UIView convertRect:toView:](self, "convertRect:toView:", self->_canvasView, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UITextCanvas setNeedsDisplayInRect:](self->_canvasView, "setNeedsDisplayInRect:");
}

- (void)setMinSize:(CGSize)a3
{
  self->_minSize = a3;
}

- (void)_sizeToConstrainedContainerUsedRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  void *v9;

  -[_UITextContainerView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    -[_UITextLayoutController usedRectForTextContainer:](self->_textLayoutController, "usedRectForTextContainer:", v3);
    v5 = v4 + self->_textContainerInset.left + self->_textContainerInset.right;
    v7 = v6 + self->_textContainerInset.top + self->_textContainerInset.bottom;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    -[UIView convertSize:toView:](self, "convertSize:toView:", WeakRetained, v5, v7);
    -[_UITextContainerView setConstrainedFrameSize:](self, "setConstrainedFrameSize:");

    v3 = v9;
  }

}

- (void)setConstrainedFrameSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
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
  id v20;
  NSSize v21;
  NSSize v22;

  height = a3.height;
  width = a3.width;
  -[UIView frame](self, "frame");
  v7 = v6;
  v9 = v8;
  -[UIView superview](self, "superview");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](self, "convertRect:toView:", v20, 0.0, 0.0, self->_maxSize.width, self->_maxSize.height);
  v11 = v10;
  v13 = v12;
  -[UIView convertRect:toView:](self, "convertRect:toView:", v20, 0.0, 0.0, self->_minSize.width, self->_minSize.height);
  v16 = v7;
  if ((*(_BYTE *)&self->_tcvFlags & 8) != 0)
  {
    v17 = ceil(width);
    v16 = v17 >= v14 ? v17 : v14;
    if (v16 > v11)
      v16 = v11;
  }
  v18 = v9;
  if ((*(_BYTE *)&self->_tcvFlags & 0x10) != 0)
  {
    v19 = ceil(height);
    v18 = v19 >= v15 ? v19 : v15;
    if (v18 > v13)
      v18 = v13;
  }
  v21.width = v7;
  v21.height = v9;
  v22.width = v16;
  v22.height = v18;
  if (!NSEqualSizes(v21, v22))
  {
    -[UIView frame](self, "frame");
    -[_UITextContainerView setFrame:](self, "setFrame:");
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
  _QWORD v12[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33___UITextContainerView_setFrame___block_invoke;
  v12[3] = &unk_1E16B20D8;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[_UITextContainerView _setFrameOrBounds:oldRect:isFrameRect:settingAction:](self, "_setFrameOrBounds:oldRect:isFrameRect:settingAction:", 1, v12, x, y, width, height, v8, v9, v10, v11);
}

- (void)_setFrameOrBounds:(CGRect)a3 oldRect:(CGRect)a4 isFrameRect:(BOOL)a5 settingAction:(id)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  id WeakRetained;
  char v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void (**v21)(_QWORD);
  char v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  int64_t v28;
  _QWORD v29[4];
  void (**v30)(_QWORD);
  id v31;
  char v32;
  _QWORD v33[5];
  id v34;
  unint64_t v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  BOOL v44;
  _QWORD aBlock[6];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  (*((void (**)(id, SEL))a6 + 2))(a6, a2);
  -[_UITextContainerView _ensureMinAndMaxSizesConsistentWithBounds](self, "_ensureMinAndMaxSizesConsistentWithBounds");
  if ((*(_BYTE *)&self->_tcvFlags & 0x20) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    v17 = objc_msgSend(WeakRetained, "isZooming");

    if ((v17 & 1) == 0)
    {
      v18 = self->_invalidationSeqNo + 1;
      self->_invalidationSeqNo = v18;
      v19 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke;
      aBlock[3] = &unk_1E16B1888;
      aBlock[4] = self;
      aBlock[5] = v18;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_2;
      v33[3] = &unk_1E16E7178;
      v20 = _Block_copy(aBlock);
      v34 = v20;
      v35 = v18;
      v33[4] = self;
      v36 = v14;
      v37 = v13;
      v38 = v12;
      v39 = v11;
      v44 = a5;
      v40 = x;
      v41 = y;
      v42 = width;
      v43 = height;
      v21 = (void (**)(_QWORD))_Block_copy(v33);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        v21[2](v21);
LABEL_17:

        return;
      }
      v22 = 1;
      if (v12 >= width && v11 >= height)
      {
        ((void (*)(void (**)(_QWORD), double))v21[2])(v21, height);
        v22 = 0;
      }
      v23 = objc_loadWeakRetained((id *)&self->_textView);
      if ((objc_msgSend(v23, "isScrollEnabled") & 1) == 0)
      {
        v24 = objc_loadWeakRetained((id *)&self->_textView);
        objc_msgSend(v24, "selectedRange");
        v26 = v25;

        if (!v26)
        {
LABEL_11:
          if (!self->_invalidationSeqClipsToBounds)
          {
            v27 = -[UIView clipsToBounds](self, "clipsToBounds");
            v28 = 1;
            if (!v27)
              v28 = 2;
            self->_invalidationSeqClipsToBounds = v28;
          }
          -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1, *(_QWORD *)&height);
          v29[0] = v19;
          v29[1] = 3221225472;
          v29[2] = __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_3;
          v29[3] = &unk_1E16CAED8;
          v32 = v22;
          v30 = v21;
          v31 = v20;
          +[UIViewAnimationState _addSystemPostAnimationAction:](UIViewAnimationState, "_addSystemPostAnimationAction:", v29);

          goto LABEL_17;
        }
        v23 = objc_loadWeakRetained((id *)&self->_textView);
        objc_msgSend(v23, "updateSelection");
      }

      goto LABEL_11;
    }
  }
}

- (void)invalidateTextContainerOrigin
{
  *(_BYTE *)&self->_tcvFlags |= 1u;
}

- (NSTextContainer)textContainer
{
  return (NSTextContainer *)objc_loadWeakRetained((id *)&self->_textContainer);
}

- (UIEdgeInsets)textContainerInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textContainerInset.top;
  left = self->_textContainerInset.left;
  bottom = self->_textContainerInset.bottom;
  right = self->_textContainerInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isVerticallyResizable
{
  return (*(_BYTE *)&self->_tcvFlags >> 4) & 1;
}

- (BOOL)isHorizontallyResizable
{
  return (*(_BYTE *)&self->_tcvFlags >> 3) & 1;
}

- (void)_ensureMinAndMaxSizesConsistentWithBounds
{
  double v3;
  double v4;

  -[UIView bounds](self, "bounds");
  if (self->_minSize.width > v3)
    self->_minSize.width = v3;
  if (self->_maxSize.width < v3)
    self->_maxSize.width = v3;
  if (self->_maxSize.height < v4)
    self->_maxSize.height = v4;
}

- (void)setNeedsDisplay
{
  -[_UITextCanvas setNeedsDisplay](self->_canvasView, "setNeedsDisplay");
}

- (void)setTextContainer:(id)a3
{
  objc_storeWeak((id *)&self->_textContainer, a3);
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  UITextView **p_textView;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UITextContainerView;
  -[UIView willMoveToSuperview:](&v6, sel_willMoveToSuperview_, v4);
  p_textView = &self->_textView;
  objc_storeWeak((id *)p_textView, 0);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeWeak((id *)p_textView, v4);
  }

}

- (void)layoutSubviews
{
  id WeakRetained;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Width;
  double Height;
  id v22;
  CGFloat v23;
  _UITextCanvas *canvasView;
  CGFloat rect;
  CGAffineTransform rect_8;
  double v27;
  double v28;
  CGAffineTransform v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v30.receiver = self;
  v30.super_class = (Class)_UITextContainerView;
  -[UIView layoutSubviews](&v30, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "visibleTextRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView frame](self, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  rect = v5;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  Width = CGRectGetWidth(v31);
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  if (Width > CGRectGetWidth(v32))
    goto LABEL_3;
  v33.origin.x = rect;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  Height = CGRectGetHeight(v33);
  v34.origin.x = v13;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  if (Height > CGRectGetHeight(v34))
  {
LABEL_3:
    v22 = objc_loadWeakRetained((id *)&self->_textView);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v22, rect, v7, v9, v11);
    -[_UITextContainerView _ensureLayoutCompleteForRect:](self, "_ensureLayoutCompleteForRect:");

  }
  -[UIView transform](self, "transform");
  v23 = 1.0 / v28;
  -[UIView transform](self, "transform");
  CGAffineTransformMakeScale(&v29, v23, 1.0 / v27);
  canvasView = self->_canvasView;
  rect_8 = v29;
  -[_UITextCanvas setTransform:](canvasView, "setTransform:", &rect_8);
  -[UIView bounds](self, "bounds");
  -[_UITextCanvas setFrame:](self->_canvasView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_storeStrong((id *)&self->_textHighlightAttributes, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_linkTextAttributes, 0);
  objc_destroyWeak((id *)&self->_textContainer);
}

- (_UITextContainerView)initWithFrame:(CGRect)a3
{

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Please use the designated initializer"));
  return 0;
}

- (void)setSelectionContainerView:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  _BOOL4 v8;
  id v9;
  char v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];

  v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
    objc_msgSend(WeakRetained, "textLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!v5)
      goto LABEL_7;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextContainerView.m"), 214, CFSTR("Not supported before iOS18 or for TextKit1. This is a UIKit bug."));

  }
LABEL_7:
  v9 = v5;
  v10 = _UITextViewAllowSelectionContainerInTextLayoutCanvas();
  v11 = v9;
  if (v5)
  {
    v11 = v9;
    if ((v10 & 1) == 0)
    {
      v12 = setSelectionContainerView____s_category;
      if (!setSelectionContainerView____s_category)
      {
        v12 = __UILogCategoryGetNode("TextSelection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&setSelectionContainerView____s_category);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Requested plumbing non-nil selectionContainerView through _UITextContainerView with TextViewAllowSelectionContainerInTextLayoutCanvas preference off. Ignoring.", v15, 2u);
      }

      v11 = 0;
    }
  }
  if (v8)
    -[_UITextCanvas setSelectionContainerView:](self->_canvasView, "setSelectionContainerView:", v11);

}

- (UIView)selectionContainerView
{
  id WeakRetained;
  void *v4;
  void *v5;

  if (_UITextViewAllowSelectionContainerInTextLayoutCanvas()
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer),
        objc_msgSend(WeakRetained, "textLayoutManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        WeakRetained,
        v4))
  {
    -[_UITextCanvas selectionContainerView](self->_canvasView, "selectionContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (UIView *)v5;
}

- (void)setTextEmphasisBackgroundView:(id)a3 withTextView:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  _BOOL4 v11;
  id v12;
  char v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];

  v7 = a3;
  v8 = a4;
  if (dyld_program_sdk_at_least())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
    objc_msgSend(WeakRetained, "textLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

    if (!v7)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (!v7)
      goto LABEL_7;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextContainerView.m"), 234, CFSTR("Not supported before iOS18 or for TextKit1. This is a UIKit bug."));

  }
LABEL_7:
  v12 = v7;
  v13 = _UITextViewAllowSelectionContainerInTextLayoutCanvas();
  v14 = v12;
  if (v7)
  {
    v14 = v12;
    if ((v13 & 1) == 0)
    {
      v15 = setTextEmphasisBackgroundView_withTextView____s_category;
      if (!setTextEmphasisBackgroundView_withTextView____s_category)
      {
        v15 = __UILogCategoryGetNode("TextSelection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&setTextEmphasisBackgroundView_withTextView____s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Requested plumbing non-nil textEmphasisBackgroundView through _UITextContainerView with TextViewAllowSelectionContainerInTextLayoutCanvas preference off. Ignoring.", v18, 2u);
      }

      v14 = 0;
    }
  }
  if (v11)
    -[_UITextCanvas setTextEmphasisBackgroundView:withTextView:](self->_canvasView, "setTextEmphasisBackgroundView:withTextView:", v14, v8);

}

- (_UITextEmphasisBackgroundView)textEmphasisBackgroundView
{
  id WeakRetained;
  void *v4;
  void *v5;

  if (_UITextViewAllowSelectionContainerInTextLayoutCanvas()
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer),
        objc_msgSend(WeakRetained, "textLayoutManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        WeakRetained,
        v4))
  {
    -[_UITextCanvas textEmphasisBackgroundView](self->_canvasView, "textEmphasisBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (_UITextEmphasisBackgroundView *)v5;
}

- (void)setTextHighlightAttributes:(id)a3
{
  id v4;
  NSDictionary *textHighlightAttributes;
  NSDictionary *v6;
  char v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;

  v4 = a3;
  textHighlightAttributes = self->_textHighlightAttributes;
  v11 = (NSDictionary *)v4;
  v6 = textHighlightAttributes;
  if (v6 == v11)
  {

  }
  else
  {
    if (v11 && v6)
    {
      v7 = -[NSDictionary isEqual:](v11, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[_UITextContainerView textEmphasisBackgroundView](self, "textEmphasisBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[_UITextCanvas setNeedsLayout](self->_canvasView, "setNeedsLayout");
  }
LABEL_10:
  v9 = (NSDictionary *)-[NSDictionary copy](v11, "copy");
  v10 = self->_textHighlightAttributes;
  self->_textHighlightAttributes = v9;

}

- (NSDictionary)textHighlightAttributes
{
  NSDictionary *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = self->_textHighlightAttributes;
  if (!v3)
  {
    -[UIView tintColor](self, "tintColor");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v13[0] = *(_QWORD *)off_1E1678D98;
      v6 = (void *)v4;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "No tint color available for foreground highlight. This should never happen but it did, so using yellow", v12, 2u);
        }

      }
      else
      {
        v9 = textHighlightAttributes___s_category;
        if (!textHighlightAttributes___s_category)
        {
          v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&textHighlightAttributes___s_category);
        }
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "No tint color available for foreground highlight. This should never happen but it did, so using yellow", v12, 2u);
        }
      }
      v13[0] = *(_QWORD *)off_1E1678D98;
      +[UIColor systemYellowColor](UIColor, "systemYellowColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = v6;
    v13[1] = *(_QWORD *)off_1E1679168;
    +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (!v5)
  }
  return v3;
}

- (id)textHighlightRenderingAttributesForAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679170);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_23;
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679130);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)off_1E1679140;
  if (!v6)
    v6 = v7;
  if (!objc_msgSend(v6, "isEqualToString:", v7))
  {
    objc_opt_class();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    objc_msgSend((id)textHighlightRenderingAttributesForAttributes__colorSchemeTable, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_21;
    if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)off_1E1679160))
    {
      +[UIColor systemPurpleColor](UIColor, "systemPurpleColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)off_1E1679158))
    {
      +[UIColor systemPinkColor](UIColor, "systemPinkColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)off_1E1679150))
    {
      +[UIColor systemOrangeColor](UIColor, "systemOrangeColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)off_1E1679148))
    {
      +[UIColor systemMintColor](UIColor, "systemMintColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", *(_QWORD *)off_1E1679138))
      {
        v16 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("NSTextHighlightColorScheme"), 8);
        if (v17)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "substringFromIndex:", v16 + v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("system%@Color"), v19);
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = (NSString *)v6;
        }
        v10 = (void *)NSSelectorFromString(v20);
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend((id)objc_opt_class(), "performSelector:", v10);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = 0;
          }
        }

        if (!v10)
        {
LABEL_21:
          objc_sync_exit(v9);

          if (v10)
          {
            v21 = *(_QWORD *)off_1E1678D98;
            v22[0] = v10;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          }
LABEL_23:
          v8 = (void *)MEMORY[0x1E0C9AA70];
          goto LABEL_24;
        }
LABEL_18:
        v12 = (void *)textHighlightRenderingAttributesForAttributes__colorSchemeTable;
        if (!textHighlightRenderingAttributesForAttributes__colorSchemeTable)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v14 = (void *)textHighlightRenderingAttributesForAttributes__colorSchemeTable;
          textHighlightRenderingAttributesForAttributes__colorSchemeTable = (uint64_t)v13;

          v12 = (void *)textHighlightRenderingAttributesForAttributes__colorSchemeTable;
        }
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v6);
        goto LABEL_21;
      }
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v11;
    if (!v11)
      goto LABEL_21;
    goto LABEL_18;
  }
  -[_UITextContainerView textHighlightAttributes](self, "textHighlightAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v8;
}

- (void)setUniqueWritingToolsAnimatedLayoutInfo:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  if (dyld_program_sdk_at_least())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
    objc_msgSend(WeakRetained, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[_UITextCanvas setUniqueWritingToolsAnimatedLayoutInfo:](self->_canvasView, "setUniqueWritingToolsAnimatedLayoutInfo:", v6);
  }

}

- (_UIAnimatedTextLayoutInfo)uniqueWritingToolsAnimatedLayoutInfo
{
  id WeakRetained;
  void *v4;
  void *v5;

  if (dyld_program_sdk_at_least()
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer),
        objc_msgSend(WeakRetained, "textLayoutManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        WeakRetained,
        v4))
  {
    -[_UITextCanvas uniqueWritingToolsAnimatedLayoutInfo](self->_canvasView, "uniqueWritingToolsAnimatedLayoutInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (_UIAnimatedTextLayoutInfo *)v5;
}

- (void)setLayoutFragmentViewsHidden:(BOOL)a3 forTextRange:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
  objc_msgSend(WeakRetained, "textLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[_UITextCanvas setLayoutFragmentViewsHidden:forTextRange:](self->_canvasView, "setLayoutFragmentViewsHidden:forTextRange:", v4, v8);

}

- (void)removeLayoutFragmentViewHiding
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
  objc_msgSend(WeakRetained, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UITextCanvas removeLayoutFragmentViewHiding](self->_canvasView, "removeLayoutFragmentViewHiding");
}

- (id)linkTextAttributes
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "linkTextAttributesForTextContainerView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  _UITextContainerViewDelegate **p_delegate;
  id v7;
  id WeakRetained;
  void *v9;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "textContainerView:linkTextAttributesForLink:forCharacterAtIndex:", self, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSCustomTextRendering)customRenderController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "customRenderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCustomTextRendering *)v3;
}

- (void)_setFreezeTextContainerSize:(BOOL)a3
{
  char tcvFlags;
  char v4;
  _UITextLayoutController *textLayoutController;

  tcvFlags = (char)self->_tcvFlags;
  if (((((tcvFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 32;
    else
      v4 = 0;
    *(_BYTE *)&self->_tcvFlags = tcvFlags & 0xDF | v4;
    textLayoutController = self->_textLayoutController;
    if (a3)
      -[_UITextLayoutController suspendTiling](textLayoutController, "suspendTiling");
    else
      -[_UITextLayoutController resumeTiling](textLayoutController, "resumeTiling");
  }
}

- (BOOL)reconfigureWithLayoutManager:(id)a3 triggeredBySelector:(SEL)a4
{
  UITextView **p_textView;
  id v6;
  id WeakRetained;

  p_textView = &self->_textView;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textView);
  LOBYTE(a4) = objc_msgSend(WeakRetained, "_reconfigureWithLayoutManager:triggeredByLayoutManagerAccess:triggeringSelector:", v6, 1, a4);

  return (char)a4;
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
  v12[2] = __34___UITextContainerView_setBounds___block_invoke;
  v12[3] = &unk_1E16B20D8;
  *(double *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(double *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = self;
  -[_UITextContainerView _setFrameOrBounds:oldRect:isFrameRect:settingAction:](self, "_setFrameOrBounds:oldRect:isFrameRect:settingAction:", 0, v12, x, y, width, height, v8, v9, v10, v11);
}

- (BOOL)usesStandardTextScaling
{
  return (*(_BYTE *)&self->_tcvFlags >> 6) & 1;
}

- (void)setUsesStandardTextScaling:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  id v12;

  if (((((*(_BYTE *)&self->_tcvFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[_UITextContainerView invalidateTextContainerOrigin](self, "invalidateTextContainerOrigin");
    if (v3)
      v5 = 64;
    else
      v5 = 0;
    *(_BYTE *)&self->_tcvFlags = *(_BYTE *)&self->_tcvFlags & 0xBF | v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    v7 = WeakRetained;
    if (v3)
    {
      objc_msgSend(WeakRetained, "setMinimumZoomScale:", 1.29871);

      v8 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v8, "setMaximumZoomScale:", 1.29871);

      v9 = objc_loadWeakRetained((id *)&self->_textView);
      v10 = v9;
      v11 = 1.29871;
    }
    else
    {
      objc_msgSend(WeakRetained, "setMinimumZoomScale:", 1.0);

      v12 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v12, "setMaximumZoomScale:", 1.0);

      v9 = objc_loadWeakRetained((id *)&self->_textView);
      v10 = v9;
      v11 = 1.0;
    }
    objc_msgSend(v9, "setZoomScale:", v11);

    -[_UITextContainerView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3 avoidAdditionalLayout:(BOOL)a4
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_UITextLayoutController usesTiledViews](self->_textLayoutController, "usesTiledViews", a4))
  {
    -[UIView bounds](self, "bounds");
    v11.origin.x = x;
    v11.origin.y = y - floor(height * 0.5);
    v11.size.width = width;
    v11.size.height = height + height;
    v10 = CGRectIntersection(v9, v11);
    -[_UITextContainerView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  }
  else
  {
    -[_UITextContainerView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIColor)textColor
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (BOOL)isEditable
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v3 = objc_msgSend(WeakRetained, "isEditable");

  return v3;
}

- (BOOL)isEditing
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v3 = objc_msgSend(WeakRetained, "isEditing");

  return v3;
}

- (CGPoint)drawingScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  -[UIView transform](self, "transform");
  -[UIView transform](self, "transform");
  v3 = v5;
  v4 = v6;
  result.y = v3;
  result.x = v4;
  return result;
}

- (BOOL)drawTextInRectIfNeeded:(CGRect)a3
{
  return 0;
}

- (void)_ensureLayoutCompleteToEndOfCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  length = a3.length;
  location = a3.location;
  -[_UITextContainerView layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  if (!length)
  {
    objc_msgSend(v5, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v5 = v11;
    if (!v7)
      goto LABEL_7;
    location -= location == v7;
    length = 1;
  }
  if (objc_msgSend(v5, "allowsNonContiguousLayout"))
    objc_msgSend(v11, "ensureLayoutForCharacterRange:", location, length);
  v8 = objc_msgSend(v11, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
  v10 = (id)objc_msgSend(v11, "textContainerForGlyphAtIndex:effectiveRange:", v9 + v8 - 1, 0);
  v5 = v11;
LABEL_7:

}

- (void)_ensureLayoutCompleteForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  NSRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextContainerView layoutManager](self, "layoutManager");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "hasNonContiguousLayout"))
  {
    -[UIView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isHidden");

    if ((v9 & 1) == 0)
    {
      -[_UITextContainerView textContainer](self, "textContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextContainerView textContainerOrigin](self, "textContainerOrigin");
      if (v23)
      {
        if (v10)
        {
          v13 = v11;
          v14 = v12;
          v24.origin.x = x;
          v24.origin.y = y;
          v24.size.width = width;
          v24.size.height = height;
          if (!NSIsEmptyRect(v24))
          {
            v15 = x - v13;
            v16 = y - v14;
            v17 = height * 1.5;
            if (height * 1.5 < 0.0)
              v17 = 0.0;
            if (v17 > v16)
              v17 = y - v14;
            v18 = v16 - v17;
            v19 = height + v17;
            v20 = objc_msgSend(v23, "glyphRangeForBoundingRect:inTextContainer:", v10, v15, v16 - v17, width, v19);
            if (v21)
            {
              v22 = v20;
              if (v21 >= 0x400)
              {
                objc_msgSend(v23, "ensureLayoutForGlyphRange:", v20, v21 >> 3);
                v22 = objc_msgSend(v23, "glyphRangeForBoundingRect:inTextContainer:", v10, v15, v18, width, v19);
              }
              objc_msgSend(v23, "ensureLayoutForGlyphRange:", v22, v21);
              objc_msgSend(v23, "usedRectForTextContainer:", v10);
            }
          }
        }
      }

    }
  }

}

- (id)layoutManager:(id)a3 effectiveCUICatalogForTextEffect:(id)a4
{
  _UITextContainerViewDelegate **p_delegate;
  id v6;
  id WeakRetained;
  void *v8;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "textContainerView:cuiCatalogForTextEffectName:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  char v3;
  _BOOL4 v5;
  int64_t v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  BOOL v18;
  _BOOL8 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  if ((((unint64_t)*(_BYTE *)&self->_tcvFlags >> 1) & 3) != a3)
  {
    v3 = a3;
    v5 = -[_UITextContainerView layoutOrientation](self, "layoutOrientation") == 0;
    *(_BYTE *)&self->_tcvFlags = *(_BYTE *)&self->_tcvFlags & 0xF9 | (2 * (v3 & 3));
    v6 = -[_UITextContainerView layoutOrientation](self, "layoutOrientation");
    v7 = v6;
    if (((v5 ^ (v6 != 0)) & 1) == 0)
    {
      memset(&v29, 0, sizeof(v29));
      v8 = 1.57079633;
      if (!v6)
        v8 = 0.0;
      CGAffineTransformMakeRotation(&v29, v8);
      -[UIView frame](self, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v28 = v29;
      -[UIView setTransform:](self, "setTransform:", &v28);
      -[_UITextContainerView setFrame:](self, "setFrame:", v10, v12, v14, v16);
    }
    v17 = -[_UITextContainerView isHorizontallyResizable](self, "isHorizontallyResizable");
    if (v17 != -[_UITextContainerView isVerticallyResizable](self, "isVerticallyResizable")
      && (((v7 != 0) ^ -[_UITextContainerView isVerticallyResizable](self, "isVerticallyResizable")) & 1) == 0)
    {
      v18 = v7 == 0;
      v19 = v7 == 0;
      v20 = !v18;
      -[_UITextContainerView setHorizontallyResizable:](self, "setHorizontallyResizable:", v20);
      -[_UITextContainerView setVerticallyResizable:](self, "setVerticallyResizable:", v19);
    }
    -[_UITextContainerView layoutManager](self, "layoutManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[_UITextContainerView textContainer](self, "textContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "glyphRangeForTextContainer:", v22);
      v25 = v24;

      v26 = objc_msgSend(v21, "characterRangeForGlyphRange:actualGlyphRange:", v23, v25, 0);
      objc_msgSend(v21, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", v26, v27, 0, 0);
    }
    -[_UITextContainerView setNeedsDisplay](self, "setNeedsDisplay");

  }
}

- (NSDictionary)markedTextStyle
{
  void *v2;
  void *v3;

  -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)attributedSubstringForMarkedRange
{
  void *v2;
  void *v3;

  -[_UITextLayoutControllerBase textInputController]((UITextInputController *)self->_textLayoutController);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedSubstringForMarkedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_UITextContainerView;
  -[UIView description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_minSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_maxSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);
  objc_msgSend(WeakRetained, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ minSize = %@, maxSize = %@, textContainer = %@>"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (CGRect)visibleRect
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "convertRect:toView:", self);
  }
  else
  {
    -[UIView bounds](self, "bounds");
  }
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;

  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (_UITextLayoutController)textLayoutController
{
  return self->_textLayoutController;
}

- (_UITextContainerViewDelegate)delegate
{
  return (_UITextContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

@end
