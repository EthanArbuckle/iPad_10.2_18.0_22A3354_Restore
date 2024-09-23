@implementation UITextMagnifierCaret

+ (id)activeCaretMagnifier
{
  return (id)SharedInstance;
}

+ (id)sharedCaretMagnifier
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  UITextMagnifierCaret *v10;
  void *v11;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "textLoupeVisibility");

    v9 = (void *)SharedInstance;
    if (!SharedInstance && v8 != 1)
    {
      v10 = -[UITextMagnifierCaret initWithFrame]([UITextMagnifierCaret alloc], "initWithFrame");
      v11 = (void *)SharedInstance;
      SharedInstance = (uint64_t)v10;

      v9 = (void *)SharedInstance;
    }
    if (v8 == 1)
      v9 = 0;
    v5 = v9;
  }
  return v5;
}

+ (Class)renderClass
{
  return (Class)objc_opt_class();
}

- (UITextMagnifierCaret)initWithFrame
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextMagnifierCaret;
  return -[UITextMagnifier initWithFrame:](&v3, sel_initWithFrame_, 0.0, 0.0, 127.0, 127.0);
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3;
  float v4;

  v3 = -[UITextMagnifierTimeWeightedPoint historyCovers:](self->super._weightedPoint, "historyCovers:", 0.5);
  -[UITextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->super._weightedPoint, "distanceCoveredInInterval:", 0.5);
  return v4 < 10.0 && v3;
}

- (void)zoomUpAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__UITextMagnifierCaret_zoomUpAnimation__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  -[UITextMagnifier beginZoomUpAnimation:withDuration:](self, "beginZoomUpAnimation:withDuration:", v2, 0.075);
}

uint64_t __39__UITextMagnifierCaret_zoomUpAnimation__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  memset(&v9, 0, sizeof(v9));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  CGAffineTransformMakeTranslation(&v9, 0.0, (v2 + v3) * 0.5);
  v7 = v9;
  CGAffineTransformScale(&v8, &v7, 0.25, 0.25);
  v4 = *(void **)(a1 + 32);
  v6 = v8;
  return objc_msgSend(v4, "setTransform:", &v6);
}

- (void)zoomDownAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__UITextMagnifierCaret_zoomDownAnimation__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  -[UITextMagnifier beginZoomDownAnimation:withDuration:postponeHandler:](self, "beginZoomDownAnimation:withDuration:postponeHandler:", v2, 0, 0.15);
}

void __41__UITextMagnifierCaret_zoomDownAnimation__block_invoke(uint64_t a1)
{
  void *v2;
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
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;

  objc_msgSend(*(id *)(a1 + 32), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend(v2, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v2, "caretRectForPosition:", v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:fromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), v10, v12, v14, v16);
    v19 = v18;
    v21 = v20;

    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "offHostPointForPoint:", v19, v21);

  }
  v28.origin.x = v4;
  v28.origin.y = v3;
  v28.size.width = v6;
  v28.size.height = v5;
  if (!CGRectIsEmpty(v28))
  {
    objc_msgSend(*(id *)(a1 + 32), "frame");
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", round(v4 + v6 * 0.5 - v24 * 0.5), round(v3 + v5 * 0.5 - v23 * 0.5));
  }
  CGAffineTransformMakeScale(&v27, 0.00787401575, 0.00787401575);
  v25 = *(void **)(a1 + 32);
  v26 = v27;
  objc_msgSend(v25, "setTransform:", &v26);

}

- (void)remove
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextMagnifierCaret;
  -[UITextMagnifier remove](&v3, sel_remove);
  -[UITextMagnifier setFrame:](self, "setFrame:", 0.0, 0.0, 127.0, 127.0);
}

- (void)updateFrameAndOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextMagnifier magnificationPoint](self, "magnificationPoint");
  objc_msgSend(v3, "convertPoint:fromView:", self->super._target);
  v5 = v4;
  v7 = v6;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "offHostPointForPoint:", v5, v7);
  v10 = v9;
  v12 = v11;

  -[UIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15 * 0.5;
  v17 = v12 + v15 * 0.5;
  -[UIView window](self, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaInsets");
  v20 = v19;

  if (v17 + -60.0 >= v20 + 75.0)
    v21 = 60.0;
  else
    v21 = v17 - (v20 + 75.0);
  if (v12 - v21 >= 32.0)
    v22 = v21;
  else
    v22 = v12 + -32.0;
  if (v22 < 1.0)
    v22 = 1.0;
  self->_yOffset = v22;
  -[UITextMagnifierCaret offset](self, "offset");
  v24 = v10 + v23;
  -[UITextMagnifierCaret offset](self, "offset");
  v26 = floor(v14 * 0.5);
  -[UIView setCenter:](self, "setCenter:", v14 * 0.5 - v26 + floor(v24), v16 - v26 + floor(v12 + v25 - v21));
}

- (void)beginMagnifyingTarget:(id)a3 text:(id)a4 magnificationPoint:(CGPoint)a5 offset:(CGPoint)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  double y;
  double x;
  double v10;
  double v11;
  id v14;
  id v15;
  void *v16;
  objc_super v17;

  v7 = a7;
  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  v14 = a4;
  v15 = a3;
  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stopMagnifying:", 0);

  -[UITextMagnifierCaret setOffset:](self, "setOffset:", x, y);
  v17.receiver = self;
  v17.super_class = (Class)UITextMagnifierCaret;
  -[UITextMagnifier beginMagnifyingTarget:text:magnificationPoint:offset:animated:](&v17, sel_beginMagnifyingTarget_text_magnificationPoint_offset_animated_, v15, v14, v7, v11, v10, x, y);

}

- (BOOL)isHorizontal
{
  return 1;
}

- (double)offsetFromMagnificationPoint
{
  return self->_yOffset;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

@end
