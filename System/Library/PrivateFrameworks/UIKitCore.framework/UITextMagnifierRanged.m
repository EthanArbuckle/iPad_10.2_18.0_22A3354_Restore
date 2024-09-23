@implementation UITextMagnifierRanged

+ (id)activeRangedMagnifier
{
  return (id)SharedInstance_0;
}

+ (id)sharedRangedMagnifier
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  UITextMagnifierRanged *v7;
  void *v8;

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
    v6 = (void *)SharedInstance_0;
    if (!SharedInstance_0)
    {
      v7 = -[UITextMagnifierRanged initWithFrame]([UITextMagnifierRanged alloc], "initWithFrame");
      v8 = (void *)SharedInstance_0;
      SharedInstance_0 = (uint64_t)v7;

      v6 = (void *)SharedInstance_0;
    }
    v5 = v6;
  }
  return v5;
}

+ (Class)renderClass
{
  return (Class)objc_opt_class();
}

- (UITextMagnifierRanged)initWithFrame
{
  UITextMagnifierRanged *v2;
  UITextMagnifierRanged *v3;
  UITextMagnifierRanged *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextMagnifierRanged;
  v2 = -[UITextMagnifier initWithFrame:](&v6, sel_initWithFrame_, 0.0, 0.0, 139.0, 55.0);
  v3 = v2;
  if (v2)
  {
    v2->_isHorizontal = 1;
    v2->_isAnimating = 0;
    v2->_delayedAnimationType = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setIsHorizontal:(BOOL)a3
{
  self->_isHorizontal = a3;
  if (!self->_isAnimating)
    -[UITextMagnifierRanged updateFrameAndOffset](self, "updateFrameAndOffset");
  -[UIView update](self->super._magnifierRenderer, "update");
  -[UIView update](self->super._autoscrollRenderer, "update");
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)UITextMagnifierRanged;
  -[UITextMagnifier setMagnificationPoint:](&v6, sel_setMagnificationPoint_);
  -[UITextMagnifier setAnimationPoint:](self, "setAnimationPoint:", x, y);
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3;
  float v4;

  v3 = -[UITextMagnifierTimeWeightedPoint historyCovers:](self->super._weightedPoint, "historyCovers:", 0.2);
  -[UITextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->super._weightedPoint, "distanceCoveredInInterval:", 0.2);
  return v4 < 20.0 && v3;
}

- (int)horizontalMovementAtTime:(double)a3
{
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  -[UITextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->super._weightedPoint, "distanceCoveredInInterval:", 3.40282347e38);
  v5 = v4;
  -[UITextMagnifierTimeWeightedPoint displacementInInterval:](self->super._weightedPoint, "displacementInInterval:", 0.5);
  v7 = fabs(v6);
  v9 = fabs(v8) * 4.0;
  v10 = v7 >= 16.0 && v9 <= v7;
  if (v10 && v7 * 1.5 >= v5)
    return (int)v6;
  else
    return 0;
}

- (BOOL)wasPlacedCarefullyAtTime:(double)a3
{
  float v3;

  -[UITextMagnifierTimeWeightedPoint distanceCoveredInInterval:priorTo:](self->super._weightedPoint, "distanceCoveredInInterval:priorTo:", 0.5, a3);
  return v3 < 10.0;
}

- (int)horizontalMovement
{
  float v3;
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  -[UITextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->super._weightedPoint, "distanceCoveredInInterval:", 3.40282347e38);
  v4 = v3;
  -[UITextMagnifierTimeWeightedPoint displacementInInterval:](self->super._weightedPoint, "displacementInInterval:", 0.5);
  v6 = fabs(v5);
  v8 = fabs(v7) * 4.0;
  v9 = v6 >= 16.0 && v8 <= v6;
  if (v9 && v6 * 1.5 >= v4)
    return (int)v5;
  else
    return 0;
}

- (void)zoomUpAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__UITextMagnifierRanged_zoomUpAnimation__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  -[UITextMagnifier beginZoomUpAnimation:withDuration:](self, "beginZoomUpAnimation:withDuration:", v2, 0.1);
}

uint64_t __40__UITextMagnifierRanged_zoomUpAnimation__block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  memset(&v15, 0, sizeof(v15));
  v2 = *(unsigned __int8 **)(a1 + 32);
  v3 = v2[544];
  objc_msgSend(v2, "bounds");
  v6 = (v4 + v5) * 0.5;
  v9 = (v7 + v8) * 0.5;
  if (v3)
    v6 = 0.0;
  else
    v9 = 0.0;
  CGAffineTransformMakeTranslation(&v15, v6, v9);
  v13 = v15;
  CGAffineTransformScale(&v14, &v13, 0.25, 0.25);
  v10 = *(void **)(a1 + 32);
  v12 = v14;
  objc_msgSend(v10, "setTransform:", &v12);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)zoomDownAnimation
{
  double v3;
  double v4;
  BOOL v5;
  _QWORD v6[7];
  _QWORD v7[7];

  -[UITextMagnifier animationPoint](self, "animationPoint");
  v5 = !self->_isHorizontal;
  if (!self->_isHorizontal)
    v3 = v3 + 8.0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke;
  v7[3] = &unk_1E16B4E70;
  if (!v5)
    v4 = v4 + 8.0;
  v7[4] = self;
  *(double *)&v7[5] = v3;
  *(double *)&v7[6] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke_2;
  v6[3] = &unk_1E16B4E70;
  v6[4] = self;
  *(double *)&v6[5] = v3;
  *(double *)&v6[6] = v4;
  -[UITextMagnifier beginZoomDownAnimation:withDuration:postponeHandler:](self, "beginZoomDownAnimation:withDuration:postponeHandler:", v7, v6, 0.2);
}

uint64_t __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 424) = *(_OWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "updateFrameAndOffset");
  memset(&v13, 0, sizeof(v13));
  v2 = *(unsigned __int8 **)(a1 + 32);
  v3 = v2[544];
  objc_msgSend(v2, "bounds");
  v6 = (v4 + v5) * 0.5;
  v9 = (v7 + v8) * 0.5;
  if (v3)
    v6 = 0.0;
  else
    v9 = 0.0;
  CGAffineTransformMakeTranslation(&v13, v6, v9);
  v11 = v13;
  CGAffineTransformScale(&v12, &v11, 0.25, 0.25);
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v12);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __42__UITextMagnifierRanged_zoomDownAnimation__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 70;
  objc_msgSend(v2, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), *(double *)(a1 + 40), *(double *)(a1 + 48));
  *v3 = v4;
  v3[1] = v5;

}

- (double)offsetFromMagnificationPoint
{
  return self->_magnifierOffsetFromTouch + self->_touchOffsetFromMagnificationPoint;
}

- (void)updateFrameAndOffset
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double x;
  double v8;
  double y;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 isHorizontal;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if (self->_isHorizontal)
    v3 = 139.0;
  else
    v3 = 55.0;
  if (self->_isHorizontal)
    v4 = 55.0;
  else
    v4 = 139.0;
  -[UIView setSize:](self, "setSize:", v3, v4);
  if (self->super._target)
  {
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextMagnifier magnificationPoint](self, "magnificationPoint");
    objc_msgSend(v5, "convertPoint:fromView:", self->super._target);
    x = v6;
    y = v8;

  }
  else
  {
    x = self->_delayedAnimationPoint.x;
    y = self->_delayedAnimationPoint.y;
  }
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "offHostPointForPoint:", x, y);
  v12 = v11;
  v14 = v13;

  isHorizontal = self->_isHorizontal;
  -[UIView bounds](self, "bounds");
  v17 = v16;
  v19 = v18;
  self->_magnifierOffsetFromTouch = 48.0;
  -[UITextMagnifierRanged offsetFromMagnificationPoint](self, "offsetFromMagnificationPoint");
  if (isHorizontal)
  {
    v21 = v4 + v20 - (v14 + v19 * 0.5);
    if (v21 > 0.0)
      self->_magnifierOffsetFromTouch = self->_magnifierOffsetFromTouch - v21;
    -[UITextMagnifierRanged offsetFromMagnificationPoint](self, "offsetFromMagnificationPoint");
    v14 = v14 - v22;
  }
  else
  {
    v23 = v3 + v20 - (v12 + v17 * 0.5);
    if (v23 > 0.0)
      self->_magnifierOffsetFromTouch = self->_magnifierOffsetFromTouch - v23;
    -[UITextMagnifierRanged offsetFromMagnificationPoint](self, "offsetFromMagnificationPoint");
    v12 = v12 - v24;
  }
  if (fabs(round(v12) + 0.5) != INFINITY && fabs(round(v14) + 0.5) != INFINITY)
    -[UIView setCenter:](self, "setCenter:");
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
  double v17;
  objc_super v18;

  v7 = a7;
  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  v14 = a4;
  v15 = a3;
  +[UITextMagnifierCaret sharedCaretMagnifier](UITextMagnifierCaret, "sharedCaretMagnifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stopMagnifying:", 0);

  v17 = round(y);
  if (v17 < 0.0)
    v17 = 0.0;
  self->_touchOffsetFromMagnificationPoint = v17;
  v18.receiver = self;
  v18.super_class = (Class)UITextMagnifierRanged;
  -[UITextMagnifier beginMagnifyingTarget:text:magnificationPoint:offset:animated:](&v18, sel_beginMagnifyingTarget_text_magnificationPoint_offset_animated_, v15, v14, v7, v11, v10, x, y);

}

- (void)stopMagnifying:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextMagnifierRanged;
  -[UITextMagnifier stopMagnifying:](&v4, sel_stopMagnifying_, a3);
  self->_touchOffsetFromMagnificationPoint = 0.0;
}

- (CGPoint)clipPoint:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double MaxX;
  double MinY;
  double v12;
  double v13;
  CGPoint result;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  if (a3.x >= CGRectGetMinX(a4))
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    if (v9 <= CGRectGetMaxX(v16))
      goto LABEL_6;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MaxX = CGRectGetMaxX(v17);
  }
  else
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    MaxX = CGRectGetMinX(v15);
  }
  v9 = MaxX;
LABEL_6:
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (v8 < CGRectGetMinY(v18))
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MinY = CGRectGetMinY(v19);
LABEL_10:
    v8 = MinY;
    goto LABEL_11;
  }
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (v8 > CGRectGetMaxY(v20))
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    MinY = CGRectGetMaxY(v21);
    goto LABEL_10;
  }
LABEL_11:
  v12 = v9;
  v13 = v8;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)caretRectClosestToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  void *v31;
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
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect result;

  y = a3.y;
  x = a3.x;
  -[UITextMagnifier text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v11 = objc_msgSend(v6, "_usesAsynchronousProtocol");
  objc_msgSend(v6, "selectedTextRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    if (v12)
    {
      objc_msgSend(v6, "selectedTextRange");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "closestPositionToPoint:withinRange:", v31, x, y);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v6, "closestPositionToPoint:", x, y);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
        goto LABEL_14;
    }
    objc_msgSend(v6, "caretRectForPosition:", v32);
    v8 = v33;
    v7 = v34;
    v9 = v35;
    v10 = v36;
    goto LABEL_14;
  }
  v41 = v10;
  v42 = v9;
  v43 = v7;
  v44 = v8;
  objc_msgSend(v12, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caretRectForPosition:", v14);
  v8 = v15;
  v7 = v16;
  v45 = v18;
  v46 = v17;

  objc_msgSend(v6, "selectedTextRange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "end");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caretRectForPosition:", v20);
  v22 = v21;
  v24 = v23;
  v9 = v25;
  v10 = v26;

  v27 = vabdd_f64(v8, x);
  v28 = v22 - x;
  v29 = vabdd_f64(v7, y);
  if (self->_isHorizontal)
  {
    v28 = v24 - y;
    v27 = v29;
  }
  v30 = v27 < fabs(v28);
  if (v30)
  {
    v9 = v46;
    v10 = v45;
  }
  else
  {
    v7 = v24;
  }
  if (!v30)
    v8 = v22;
  v47.origin.x = v8;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v10;
  if (CGRectIsEmpty(v47))
  {
    v10 = v41;
    v9 = v42;
    v7 = v43;
    v8 = v44;
  }
LABEL_15:

  v37 = v8;
  v38 = v7;
  v39 = v9;
  v40 = v10;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (CGPoint)adjustMagnificationPoint:(CGPoint)a3
{
  double y;
  double x;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double width;
  double height;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGPoint result;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  -[UITextMagnifier text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertPoint:fromView:", self->super._target, x, y);
  v9 = v8;
  v11 = v10;
  if (v7)
  {
    objc_msgSend(v7, "bounds");
    -[UITextMagnifierRanged clipPoint:inRect:](self, "clipPoint:inRect:", v9, v11, v12, v13, v14, v15);
    v9 = v16;
    v11 = v17;
  }
  -[UITextMagnifierRanged caretRectClosestToPoint:](self, "caretRectClosestToPoint:", v9, v11);
  v18 = v29.origin.x;
  v19 = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  if (!CGRectIsNull(v29))
  {
    if (self->_isHorizontal)
      v11 = round(v19 + height / 1.3);
    else
      v9 = round(v18 + width / 1.3);
  }
  objc_msgSend(v7, "convertPoint:toView:", self->super._target, v9, v11);
  v23 = v22;
  v25 = v24;

  v26 = v23;
  v27 = v25;
  result.y = v27;
  result.x = v26;
  return result;
}

- (BOOL)isHorizontal
{
  return self->_isHorizontal;
}

@end
