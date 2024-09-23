@implementation _WTTextPlaceholderController

+ (id)placeholderControllerForDelegate:(id)a3
{
  id v4;
  void *v5;
  _WTTextPlaceholderController *v6;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  objc_getAssociatedObject(v4, &_WTTextPlaceholderControllerIdentifier);
  v6 = (_WTTextPlaceholderController *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (objc_msgSend(a1, "_delegateImplementsInsertionMethods:", v5)
      && objc_msgSend(a1, "_delegateImplementsRemovalMethods:", v5))
    {
      v6 = -[_WTTextPlaceholderController initWithDelegate:]([_WTTextPlaceholderController alloc], "initWithDelegate:", v5);
      objc_setAssociatedObject(v5, &_WTTextPlaceholderControllerIdentifier, v6, (void *)0x301);
      goto LABEL_7;
    }
LABEL_6:
    v6 = 0;
  }
LABEL_7:

  return v6;
}

+ (void)removePlaceholderControllerForDelegate:(id)a3
{
  if (a3)
    objc_setAssociatedObject(a3, &_WTTextPlaceholderControllerIdentifier, 0, (void *)0x301);
}

+ (BOOL)_delegateImplementsInsertionMethods:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 1;
  else
    v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

+ (BOOL)_delegateImplementsRemovalMethods:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 1;
  else
    v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (_WTTextPlaceholderController)initWithDelegate:(id)a3
{
  id v5;
  _WTTextPlaceholderController *v6;
  _WTTextPlaceholderController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WTTextPlaceholderController;
  v6 = -[_WTTextPlaceholderController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_delegate, a3);
    v7->_phase = 0;
  }

  return v7;
}

- (void)beginPlaceholder
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UITextPlaceholder *v13;
  UITextPlaceholder *placeholder;
  id delegate;
  UITextPlaceholder *v16;
  _QWORD v17[9];

  if (objc_msgSend((id)objc_opt_class(), "_delegateImplementsRemovalMethods:", self->_delegate))
  {
    if (self->_delegate && self->_placeholder)
      -[_WTTextPlaceholderController endPlaceholderAndWillInsertText:completion:](self, "endPlaceholderAndWillInsertText:completion:", 0, 0);
    v4 = *MEMORY[0x24BDBF070];
    v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(self->_delegate, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(self->_delegate, "caretRectForPosition:", v8);
        v4 = v9;
        v3 = v10;
        v6 = v11;
        v5 = v12;
      }

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(self->_delegate, "insertTextPlaceholderWithSize:", 0.0, 100.0);
      v13 = (UITextPlaceholder *)objc_claimAutoreleasedReturnValue();
      placeholder = self->_placeholder;
      self->_placeholder = v13;

      -[_WTTextPlaceholderController _beginShowingShimmerHighlightsWithCaretRect:](self, "_beginShowingShimmerHighlightsWithCaretRect:", v4, v3, v6, v5);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      delegate = self->_delegate;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __48___WTTextPlaceholderController_beginPlaceholder__block_invoke;
      v17[3] = &unk_251C073E0;
      v17[4] = self;
      *(double *)&v17[5] = v4;
      *(double *)&v17[6] = v3;
      *(double *)&v17[7] = v6;
      *(double *)&v17[8] = v5;
      objc_msgSend(delegate, "insertTextPlaceholderWithSize:completionHandler:", v17, 0.0, 100.0);
    }
    else
    {
      v16 = self->_placeholder;
      self->_placeholder = 0;

    }
  }
}

- (double)_widthRatioForIteration:(int)a3 isFinal:(BOOL)a4
{
  int64_t pattern;
  double result;
  double v6;
  _OWORD v7[2];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7[0] = xmmword_24A7EDB90;
  v7[1] = xmmword_24A7EDBA0;
  v8 = 0x3FE999999999999ALL;
  pattern = self->_pattern;
  if (pattern == 1)
    return *((double *)v7 + a3 % 5);
  result = 1.0;
  v6 = 0.5;
  if (!a4)
    v6 = 1.0;
  if (!pattern)
    return v6;
  return result;
}

- (id)_visualRectsForRects:(id)a3 containerBounds:(CGRect)a4 caretRect:(CGRect)a5
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  double MinY;
  double MaxY;
  objc_class *v21;
  void *v22;
  int v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double MinX;
  void *v30;
  _QWORD v32[4];
  id v33;
  _WTTextPlaceholderController *v34;
  id v35;
  _QWORD *v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  _QWORD v42[3];
  int v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v14 = a3;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "writingDirection");

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      if (CGRectIsNull(v44) || (objc_msgSend(v18, "rect"), CGRectGetHeight(v45) < height))
      {
        objc_msgSend(v18, "rect");
        height = CGRectGetHeight(v46);
      }
      objc_msgSend(v18, "rect");
      MinY = CGRectGetMinY(v47);
      objc_msgSend(v18, "rect");
      MaxY = CGRectGetMaxY(v48);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("WKTextSelectionRect"));

      if (v23)
      {
        objc_msgSend(v18, "rect");
        MaxY = y + v24;
        MinY = y;
      }
      v25 = 0;
      do
      {
        if (MinY > MaxY)
          break;
        v26 = height + MinY;
        -[_WTTextPlaceholderController _widthRatioForIteration:isFinal:](self, "_widthRatioForIteration:isFinal:", v25, height + MinY > MaxY);
        v28 = v10 * v27;
        objc_msgSend(v18, "rect");
        MinX = CGRectGetMinX(v49);
        if (v16 == 1)
          MinX = v10 - v28;
        +[WTTextSelectionRect rectWithRect:](WTTextSelectionRect, "rectWithRect:", MinX, MinY + 1.5, v28, height + -1.5 + -1.5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v30);

        v25 = (v25 + 1);
        MinY = height + MinY;
      }
      while (v26 <= MaxY);

    }
    else
    {
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x2020000000;
      v43 = 0;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __79___WTTextPlaceholderController__visualRectsForRects_containerBounds_caretRect___block_invoke;
      v32[3] = &unk_251C07408;
      v37 = v12;
      v38 = v11;
      v39 = v10;
      v40 = v9;
      v33 = v14;
      v34 = self;
      v36 = v42;
      v41 = v16;
      v17 = v17;
      v35 = v17;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v32);

      _Block_object_dispose(v42, 8);
    }
  }
  else
  {
    v17 = (id)MEMORY[0x24BDBD1A8];
  }

  return v17;
}

- (void)_beginShowingShimmerHighlightsWithCaretRect:(CGRect)a3
{
  void *v4;
  void *v5;
  CGPath *Mutable;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _WTTextPreview *v11;
  _WTTextPreview *textPreview;
  _WTTextEffectView *v13;
  _WTTextRangeChunk *v14;
  _WTReplaceSourceTextEffect *v15;
  _WTReplaceSourceTextEffect *sweepInEffect;
  uint64_t v17;
  _WTSweepTextEffect *v18;
  _WTSweepTextEffect *ponderingEffect;
  _WTSweepTextEffect *v20;
  void *v21;
  void *v22;
  _WTReplaceSourceTextEffect *v23;
  _WTReplaceSourceTextEffect *sweepOutEffect;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;

  v38 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_delegate, "textInputView");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = self->_delegate;
    else
      v25 = 0;
  }
  -[UITextPlaceholder rects](self->_placeholder, "rects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  -[_WTTextPlaceholderController _visualRectsForRects:containerBounds:caretRect:](self, "_visualRectsForRects:containerBounds:caretRect:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  Mutable = CGPathCreateMutable();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), "rect");
        CGPathAddRoundedRect(Mutable, 0, v39, 4.0, 4.0);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

  v11 = -[_WTTextPreview initWithContentPath:]([_WTTextPreview alloc], "initWithContentPath:", Mutable);
  textPreview = self->_textPreview;
  self->_textPreview = v11;

  CGPathRelease(Mutable);
  v13 = -[_WTTextEffectView initWithAsyncSource:]([_WTTextEffectView alloc], "initWithAsyncSource:", self);
  objc_msgSend(v25, "bounds");
  -[_WTTextEffectView setFrame:](v13, "setFrame:");
  objc_storeStrong((id *)&self->_effectView, v13);
  objc_msgSend(v25, "addSubview:", self->_effectView);
  objc_initWeak(&location, self);
  v14 = -[_WTTextRangeChunk initWithRange:]([_WTTextRangeChunk alloc], "initWithRange:", 0, 1);
  v15 = -[_WTReplaceTextEffect initWithChunk:effectView:]([_WTReplaceSourceTextEffect alloc], "initWithChunk:effectView:", v14, v13);
  sweepInEffect = self->_sweepInEffect;
  self->_sweepInEffect = v15;

  -[_WTReplaceTextEffect setIsDestination:](self->_sweepInEffect, "setIsDestination:", 1);
  -[_WTReplaceTextEffect setAnimateRemovalWhenDone:](self->_sweepInEffect, "setAnimateRemovalWhenDone:", 0);
  v17 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __76___WTTextPlaceholderController__beginShowingShimmerHighlightsWithCaretRect___block_invoke;
  v30[3] = &unk_251C070A8;
  objc_copyWeak(&v31, &location);
  -[_WTReplaceTextEffect setCompletion:](self->_sweepInEffect, "setCompletion:", v30);
  v18 = -[_WTSweepTextEffect initWithChunk:effectView:]([_WTSweepTextEffect alloc], "initWithChunk:effectView:", v14, v13);
  ponderingEffect = self->_ponderingEffect;
  self->_ponderingEffect = v18;

  v20 = self->_ponderingEffect;
  +[_WTLightEffectPalette ponderingPurple](_WTLightEffectPalette, "ponderingPurple");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTLightEffectPalette ponderingLightEdge](_WTLightEffectPalette, "ponderingLightEdge");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WTSweepTextEffect prepareWithPalette:lightEdgePalette:brightnessBoost:](v20, "prepareWithPalette:lightEdgePalette:brightnessBoost:", v21, v22, 0);

  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __76___WTTextPlaceholderController__beginShowingShimmerHighlightsWithCaretRect___block_invoke_2;
  v28[3] = &unk_251C070A8;
  objc_copyWeak(&v29, &location);
  -[_WTTextEffect setCompletion:](self->_ponderingEffect, "setCompletion:", v28);
  v23 = -[_WTReplaceTextEffect initWithChunk:effectView:]([_WTReplaceSourceTextEffect alloc], "initWithChunk:effectView:", v14, v13);
  sweepOutEffect = self->_sweepOutEffect;
  self->_sweepOutEffect = v23;

  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __76___WTTextPlaceholderController__beginShowingShimmerHighlightsWithCaretRect___block_invoke_3;
  v26[3] = &unk_251C070A8;
  objc_copyWeak(&v27, &location);
  -[_WTReplaceTextEffect setCompletion:](self->_sweepOutEffect, "setCompletion:", v26);
  -[_WTTextPlaceholderController _updateEffectForPhase:](self, "_updateEffectForPhase:", 2);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);
}

- (void)_updateEffectForPhase:(int64_t)a3
{
  _WTTextEffectView *effectView;
  void *sweepOutEffect;
  id v7;

  if (a3)
  {
    if (self->_phase >= a3)
      return;
    switch(a3)
    {
      case 3:
        effectView = self->_effectView;
        sweepOutEffect = self->_sweepOutEffect;
        goto LABEL_10;
      case 2:
        effectView = self->_effectView;
        sweepOutEffect = self->_ponderingEffect;
        goto LABEL_10;
      case 1:
        effectView = self->_effectView;
        sweepOutEffect = self->_sweepInEffect;
LABEL_10:
        v7 = -[_WTTextEffectView addEffect:](effectView, "addEffect:", sweepOutEffect);
        break;
    }
  }
  else
  {
    -[_WTTextEffectView removeAllEffects](self->_effectView, "removeAllEffects");
  }
  self->_phase = a3;
}

- (void)textPreviewsForChunk:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = self->_textPreview;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)textPreviewForRect:(CGRect)a3 completion:(id)a4
{
  (*((void (**)(id, _WTTextPreview *, CGPoint, __n128, CGSize, __n128))a4 + 2))(a4, self->_textPreview, a3.origin, *(__n128 *)&a3.origin.y, a3.size, *(__n128 *)&a3.size.height);
}

- (void)updateIsTextVisible:(BOOL)a3 forChunk:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (void)endPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  char v7;
  id delegate;
  UITextPlaceholder *placeholder;
  UITextPlaceholder *v10;
  _QWORD v11[5];
  void (**v12)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_WTTextPlaceholderController _endShowingShimmerHighlights](self, "_endShowingShimmerHighlights");
    objc_msgSend(self->_delegate, "removeTextPlaceholder:", self->_placeholder);
  }
  else
  {
    v7 = objc_opt_respondsToSelector();
    -[_WTTextPlaceholderController _endShowingShimmerHighlights](self, "_endShowingShimmerHighlights");
    if ((v7 & 1) != 0)
    {
      delegate = self->_delegate;
      placeholder = self->_placeholder;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke;
      v11[3] = &unk_251C07430;
      v11[4] = self;
      v12 = v6;
      objc_msgSend(delegate, "removeTextPlaceholder:willInsertText:completionHandler:", placeholder, v4, v11);

      goto LABEL_7;
    }
  }
  v10 = self->_placeholder;
  self->_placeholder = 0;

  if (v6)
    v6[2](v6);
LABEL_7:

}

- (void)_endShowingShimmerHighlights
{
  _WTTextEffectView *effectView;

  -[_WTTextPlaceholderController _updateEffectForPhase:](self, "_updateEffectForPhase:", 0);
  -[_WTTextEffectView removeFromSuperview](self->_effectView, "removeFromSuperview");
  effectView = self->_effectView;
  self->_effectView = 0;

}

- (int64_t)pattern
{
  return self->_pattern;
}

- (void)setPattern:(int64_t)a3
{
  self->_pattern = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPreview, 0);
  objc_storeStrong((id *)&self->_sweepOutEffect, 0);
  objc_storeStrong((id *)&self->_ponderingEffect, 0);
  objc_storeStrong((id *)&self->_sweepInEffect, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong(&self->_delegate, 0);
}

@end
