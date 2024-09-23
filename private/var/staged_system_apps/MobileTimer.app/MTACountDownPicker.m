@implementation MTACountDownPicker

- (MTACountDownPicker)initWithFrame:(CGRect)a3
{
  MTACountDownPicker *v3;
  MTACountDownPicker *v4;
  void *v5;
  uint64_t v6;
  CAShapeLayer *highlightLayer;
  id v8;
  void *v9;
  NSDateComponentsFormatter *v10;
  NSDateComponentsFormatter *formatter;
  void *v12;
  id v13;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTACountDownPicker;
  v3 = -[MTACountDownPicker initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v22.receiver = v3;
    v22.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setBorderStyle:](&v22, "setBorderStyle:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities thinG2MonospacedDigitFontWithSize:](MTAUtilities, "thinG2MonospacedDigitFontWithSize:", 100.0));
    v21.receiver = v4;
    v21.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setFont:](&v21, "setFont:", v5);

    v20.receiver = v4;
    v20.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setTextAlignment:](&v20, "setTextAlignment:", 1);
    v19.receiver = v4;
    v19.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setFocusEffect:](&v19, "setFocusEffect:", 0);
    v18.receiver = v4;
    v18.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setDelegate:](&v18, "setDelegate:", v4);
    v17.receiver = v4;
    v17.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setKeyboardType:](&v17, "setKeyboardType:", 4);
    v6 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    highlightLayer = v4->_highlightLayer;
    v4->_highlightLayer = (CAShapeLayer *)v6;

    v16.receiver = v4;
    v16.super_class = (Class)MTACountDownPicker;
    v8 = -[MTACountDownPicker layer](&v16, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "addSublayer:", v4->_highlightLayer);

    v10 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    formatter = v4->_formatter;
    v4->_formatter = v10;

    -[NSDateComponentsFormatter setUnitsStyle:](v4->_formatter, "setUnitsStyle:", 0);
    -[NSDateComponentsFormatter setAllowedUnits:](v4->_formatter, "setAllowedUnits:", 224);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v4->_formatter, "setZeroFormattingBehavior:", 0x10000);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](v4->_formatter, "stringFromTimeInterval:", v4->_duration));
    v15.receiver = v4;
    v15.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setText:](&v15, "setText:", v12);

    v4->_selectedField = 0;
    -[MTACountDownPicker endEditing](v4, "endEditing");
    -[MTACountDownPicker updateHighlightPath](v4, "updateHighlightPath");
    v4->_underEditing = 0;
    v13 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "recognizeTapGesture:");
    -[MTACountDownPicker addGestureRecognizer:](v4, "addGestureRecognizer:", v13);

  }
  return v4;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTACountDownPicker;
  v3 = -[MTACountDownPicker becomeFirstResponder](&v5, "becomeFirstResponder");
  if (v3)
    -[MTACountDownPicker setSelectedField:](self, "setSelectedField:", 1);
  return v3;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTACountDownPicker;
  v3 = -[MTACountDownPicker resignFirstResponder](&v5, "resignFirstResponder");
  if (v3)
    -[MTACountDownPicker setSelectedField:](self, "setSelectedField:", 0);
  return v3;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGRect v3;

  v3 = CGRectInset(a3, 10.0, 10.0);
  return CGRectOffset(v3, 0.0, -2.0);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  CGRect v3;

  v3 = CGRectInset(a3, 10.0, 10.0);
  return CGRectOffset(v3, 0.0, -2.0);
}

- (id)selectionRectsForRange:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v33.receiver = self;
  v33.super_class = (Class)MTACountDownPicker;
  -[MTACountDownPicker layoutSubviews](&v33, "layoutSubviews");
  -[MTACountDownPicker bounds](self, "bounds");
  -[MTACountDownPicker editingRectForBounds:](self, "editingRectForBounds:");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker beginningOfDocument](self, "beginningOfDocument"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker positionFromPosition:offset:](self, "positionFromPosition:offset:", v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker positionFromPosition:offset:](self, "positionFromPosition:offset:", v6, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v6, v7));
  -[MTACountDownPicker firstRectForRange:](self, "firstRectForRange:", v8);
  v10 = v9;
  v12 = v11;

  v13 = v4 + v10;
  -[MTACountDownPicker bounds](self, "bounds");
  v14 = CGRectGetHeight(v34) + -20.0;
  -[MTACountDownPicker setHourHighlightFrame:](self, "setHourHighlightFrame:", v13, 10.0, v12, v14);
  v35.origin.y = 10.0;
  v35.origin.x = v13;
  v35.size.width = v12;
  v35.size.height = v14;
  -[MTACountDownPicker setHourMidX:](self, "setHourMidX:", CGRectGetMidX(v35));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker beginningOfDocument](self, "beginningOfDocument"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker positionFromPosition:offset:](self, "positionFromPosition:offset:", v15, 3));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker positionFromPosition:offset:](self, "positionFromPosition:offset:", v16, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v16, v17));
  -[MTACountDownPicker firstRectForRange:](self, "firstRectForRange:", v18);
  v20 = v19;
  v22 = v21;

  v23 = v4 + v20;
  -[MTACountDownPicker setMinuteHighlightFrame:](self, "setMinuteHighlightFrame:", v23, 10.0, v22, v14);
  v36.origin.y = 10.0;
  v36.origin.x = v23;
  v36.size.width = v22;
  v36.size.height = v14;
  -[MTACountDownPicker setMinuteMidX:](self, "setMinuteMidX:", CGRectGetMidX(v36));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker beginningOfDocument](self, "beginningOfDocument"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker positionFromPosition:offset:](self, "positionFromPosition:offset:", v24, 6));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker positionFromPosition:offset:](self, "positionFromPosition:offset:", v25, 2));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v25, v26));
  -[MTACountDownPicker firstRectForRange:](self, "firstRectForRange:", v27);
  v29 = v28;
  v31 = v30;

  v32 = v4 + v29;
  -[MTACountDownPicker setSecondHighlightFrame:](self, "setSecondHighlightFrame:", v32, 10.0, v31, v14);
  v37.origin.y = 10.0;
  v37.origin.x = v32;
  v37.size.width = v31;
  v37.size.height = v14;
  -[MTACountDownPicker setSecondMidX:](self, "setSecondMidX:", CGRectGetMidX(v37));
  -[MTACountDownPicker updateHighlightPath](self, "updateHighlightPath");

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTACountDownPicker;
  result = -[MTACountDownPicker canPerformAction:withSender:](&v8, "canPerformAction:withSender:", a3, a4);
  if ("copy:" == a3 && "paste:" == a3 && "selectAll:" == a3)
    return 0;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  MTACountDownPicker *v7;
  MTACountDownPicker *v8;
  MTACountDownPicker *v9;
  MTACountDownPicker *v10;
  uint64_t v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTACountDownPicker;
  -[MTACountDownPicker didUpdateFocusInContext:withAnimationCoordinator:](&v12, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (MTACountDownPicker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedView"));
  if (v7 == self)
  {

  }
  else
  {
    v8 = v7;
    v9 = (MTACountDownPicker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView"));

    if (v9 == self)
    {
      if (objc_msgSend(v6, "focusHeading") == (id)32)
      {
        v10 = self;
        v11 = 3;
LABEL_8:
        -[MTACountDownPicker setSelectedField:](v10, "setSelectedField:", v11);
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "focusHeading") == (id)16)
      {
        v10 = self;
        v11 = 1;
        goto LABEL_8;
      }
    }
  }
LABEL_9:

}

- (void)setUsesSmallSize:(BOOL)a3
{
  double v4;
  void *v5;

  if (self->_usesSmallSize != a3)
  {
    self->_usesSmallSize = a3;
    v4 = 100.0;
    if (a3)
      v4 = 54.0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities thinG2MonospacedDigitFontWithSize:](MTAUtilities, "thinG2MonospacedDigitFontWithSize:", v4));
    -[MTACountDownPicker setFont:](self, "setFont:", v5);

    -[MTACountDownPicker setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDuration:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (self->_duration != a3)
  {
    v4 = 0.0;
    if (a3 >= 0.0)
    {
      v4 = a3;
      if (a3 > 86399.0)
        v4 = 86399.0;
    }
    self->_duration = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker formatter](self, "formatter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromTimeInterval:", v4));
    v7.receiver = self;
    v7.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setText:](&v7, "setText:", v6);

  }
}

- (void)setShowText:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  __CFString *v6;
  objc_super v7;

  if (self->_showText != a3)
  {
    v4 = a3;
    self->_showText = a3;
    if (a3)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker formatter](self, "formatter"));
      -[MTACountDownPicker duration](self, "duration");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromTimeInterval:"));
    }
    else
    {
      v6 = &stru_10009A4D0;
    }
    v7.receiver = self;
    v7.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker setText:](&v7, "setText:", v6);
    if (v4)
    {

    }
  }
}

- (void)setSelectedField:(int64_t)a3
{
  if (self->_selectedField != a3)
  {
    self->_selectedField = a3;
    -[MTACountDownPicker endEditing](self, "endEditing");
    -[MTACountDownPicker updateHighlightPath](self, "updateHighlightPath");
  }
}

- (void)updateHighlightPath
{
  int64_t v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const CGPath *v8;
  void *v9;

  v3 = -[MTACountDownPicker selectedField](self, "selectedField");
  switch(v3)
  {
    case 3:
      -[MTACountDownPicker secondHighlightFrame](self, "secondHighlightFrame");
      break;
    case 2:
      -[MTACountDownPicker minuteHighlightFrame](self, "minuteHighlightFrame");
      break;
    case 1:
      -[MTACountDownPicker hourHighlightFrame](self, "hourHighlightFrame");
      break;
    default:
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      break;
  }
  v8 = CGPathCreateWithRoundedRect(*(CGRect *)&x, 3.0, 3.0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker highlightLayer](self, "highlightLayer"));
  objc_msgSend(v9, "setPath:", v8);

  CGPathRelease(v8);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MTACountDownPicker *v18;
  const char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  if (-[MTACountDownPicker isFocused](self, "isFocused"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v23 = v7;
      v22 = v6;
      v11 = 0;
      v12 = *(_QWORD *)v26;
      while (1)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13), "key", v22));
          v15 = v14;
          if (v14)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "charactersIgnoringModifiers"));
            if (objc_msgSend(v16, "isEqualToString:", UIKeyInputEscape))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTACountDownPicker superview](self, "superview"));
              objc_msgSend(v17, "pressesBegan:withEvent:", v8, v23);

LABEL_23:
              goto LABEL_24;
            }
            if (objc_msgSend(v16, "isEqualToString:", UIKeyInputUpArrow))
            {
              if (-[MTACountDownPicker incrementValue](self, "incrementValue"))
              {
                v18 = self;
                v19 = "incrementValueContinuouslly";
                goto LABEL_16;
              }
LABEL_17:
              -[MTACountDownPicker beep](self, "beep");
              goto LABEL_22;
            }
            if (objc_msgSend(v16, "isEqualToString:", UIKeyInputDownArrow))
            {
              if (!-[MTACountDownPicker decrementValue](self, "decrementValue"))
                goto LABEL_17;
              v18 = self;
              v19 = "decrementValueContinuouslly";
LABEL_16:
              -[MTACountDownPicker performSelector:withObject:afterDelay:](v18, "performSelector:withObject:afterDelay:", v19, 0, 0.2);
LABEL_22:
              v11 = 1;
              goto LABEL_23;
            }
            if (objc_msgSend(v16, "isEqualToString:", UIKeyInputLeftArrow))
            {
LABEL_19:
              -[MTACountDownPicker activatePreviousKeyField](self, "activatePreviousKeyField");
              goto LABEL_22;
            }
            if (objc_msgSend(v16, "isEqualToString:", UIKeyInputRightArrow))
            {
LABEL_21:
              -[MTACountDownPicker activateNextKeyField](self, "activateNextKeyField");
              goto LABEL_22;
            }
            if (!objc_msgSend(v16, "isEqualToString:", CFSTR("\t")))
              goto LABEL_23;
            v20 = objc_msgSend(v15, "modifierFlags");
            if (v20 == (id)0x20000)
            {
              if ((id)-[MTACountDownPicker selectedField](self, "selectedField") != (id)1)
                goto LABEL_19;
            }
            else
            {
              if (v20)
                goto LABEL_23;
              if ((id)-[MTACountDownPicker selectedField](self, "selectedField") != (id)3)
                goto LABEL_21;
            }
            -[MTACountDownPicker setSelectedField:](self, "setSelectedField:", 0);
            goto LABEL_23;
          }
LABEL_24:

          v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v10 = v21;
        if (!v21)
        {

          v6 = v22;
          v7 = v23;
          if ((v11 & 1) != 0)
            goto LABEL_38;
          goto LABEL_37;
        }
      }
    }

  }
LABEL_37:
  v24.receiver = self;
  v24.super_class = (Class)MTACountDownPicker;
  -[MTACountDownPicker pressesBegan:withEvent:](&v24, "pressesBegan:withEvent:", v6, v7);
LABEL_38:

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  const char *v18;
  unsigned int v19;
  id v20;
  id v21;
  MTACountDownPicker *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v22 = self;
  if (!-[MTACountDownPicker isFocused](self, "isFocused"))
    goto LABEL_17;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v9)
  {

LABEL_17:
    v23.receiver = v22;
    v23.super_class = (Class)MTACountDownPicker;
    -[MTACountDownPicker pressesEnded:withEvent:](&v23, "pressesEnded:withEvent:", v6, v7);
    goto LABEL_18;
  }
  v10 = v9;
  v20 = v7;
  v21 = v6;
  v11 = 0;
  v12 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "key", v20, v21));
      v15 = v14;
      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "charactersIgnoringModifiers"));
        v17 = objc_msgSend(v16, "isEqualToString:", UIKeyInputUpArrow);
        v18 = "incrementValueContinuouslly";
        if ((v17 & 1) != 0
          || (v19 = objc_msgSend(v16, "isEqualToString:", UIKeyInputDownArrow, "incrementValueContinuouslly"), v18 = "decrementValueContinuouslly", v19))
        {
          +[NSThread cancelPreviousPerformRequestsWithTarget:selector:object:](NSThread, "cancelPreviousPerformRequestsWithTarget:selector:object:", v22, v18, 0);
          v11 = 1;
        }

      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v10);

  v7 = v20;
  v6 = v21;
  if ((v11 & 1) == 0)
    goto LABEL_17;
LABEL_18:

}

- (void)activateNextKeyField
{
  int64_t v3;
  uint64_t v4;

  v3 = -[MTACountDownPicker selectedField](self, "selectedField");
  if ((unint64_t)(v3 - 1) < 2)
  {
    v4 = -[MTACountDownPicker selectedField](self, "selectedField") + 1;
LABEL_6:
    -[MTACountDownPicker setSelectedField:](self, "setSelectedField:", v4);
    return;
  }
  v4 = 1;
  if (!v3 || v3 == 3)
    goto LABEL_6;
}

- (void)activatePreviousKeyField
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[MTACountDownPicker selectedField](self, "selectedField");
  if (v3 < 2)
  {
    v4 = 3;
  }
  else
  {
    if (v3 - 2 > 1)
      return;
    v4 = -[MTACountDownPicker selectedField](self, "selectedField") - 1;
  }
  -[MTACountDownPicker setSelectedField:](self, "setSelectedField:", v4);
}

- (BOOL)incrementValue
{
  double v3;
  uint64_t v4;
  int64_t v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;

  -[MTACountDownPicker duration](self, "duration");
  v4 = (uint64_t)v3;
  v5 = -[MTACountDownPicker selectedField](self, "selectedField");
  if (v5 == 3)
  {
    if (v4 % 60 >= 59)
      v6 = 0.0;
    else
      v6 = 1.0;
  }
  else
  {
    if (v5 == 2)
    {
      v7 = v4 % 3600 < 3540;
      v8 = 60.0;
    }
    else
    {
      v6 = 0.0;
      if (v5 != 1)
        goto LABEL_12;
      v7 = v4 < 82800;
      v8 = 3600.0;
    }
    if (v7)
      v6 = v8;
    else
      v6 = 0.0;
  }
LABEL_12:
  -[MTACountDownPicker duration](self, "duration");
  -[MTACountDownPicker setDuration:](self, "setDuration:", v6 + v9);
  return v6 > 0.0;
}

- (void)incrementValueContinuouslly
{
  if (-[MTACountDownPicker incrementValue](self, "incrementValue"))
    -[MTACountDownPicker performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "incrementValueContinuouslly", 0, 0.1);
  else
    -[MTACountDownPicker beep](self, "beep");
}

- (BOOL)decrementValue
{
  double v3;
  uint64_t v4;
  int64_t v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;

  -[MTACountDownPicker duration](self, "duration");
  v4 = (uint64_t)v3;
  v5 = -[MTACountDownPicker selectedField](self, "selectedField");
  if (v5 == 3)
  {
    if (v4 % 60 <= 0)
      v6 = 0.0;
    else
      v6 = -1.0;
  }
  else
  {
    if (v5 == 2)
    {
      v7 = v4 % 3600 <= 59;
      v8 = -60.0;
    }
    else
    {
      v6 = 0.0;
      if (v5 != 1)
        goto LABEL_12;
      v7 = v4 <= 3599;
      v8 = -3600.0;
    }
    if (v7)
      v6 = 0.0;
    else
      v6 = v8;
  }
LABEL_12:
  -[MTACountDownPicker duration](self, "duration");
  -[MTACountDownPicker setDuration:](self, "setDuration:", v6 + v9);
  return v6 < 0.0;
}

- (void)decrementValueContinuouslly
{
  if (-[MTACountDownPicker decrementValue](self, "decrementValue"))
    -[MTACountDownPicker performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "decrementValueContinuouslly", 0, 0.1);
  else
    -[MTACountDownPicker beep](self, "beep");
}

- (void)startEditing
{
  +[NSThread cancelPreviousPerformRequestsWithTarget:selector:object:](NSThread, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "endEditing", 0);
  -[MTACountDownPicker setUnderEditing:](self, "setUnderEditing:", 1);
  -[MTACountDownPicker performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "endEditing", 0, 0.5);
}

- (void)endEditing
{
  +[NSThread cancelPreviousPerformRequestsWithTarget:selector:object:](NSThread, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "endEditing", 0);
  -[MTACountDownPicker setUnderEditing:](self, "setUnderEditing:", 0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  char *v16;
  char *v17;
  double v18;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7));

  if (objc_msgSend(v8, "length"))
    goto LABEL_15;
  v9 = -[MTACountDownPicker selectedField](self, "selectedField");
  switch(v9)
  {
    case 3:
      -[MTACountDownPicker duration](self, "duration");
      v11 = (uint64_t)v14 % 60;
      v12 = 1;
LABEL_8:
      v13 = 59;
      break;
    case 2:
      -[MTACountDownPicker duration](self, "duration");
      v11 = (int)(((__int16)((34953 * ((int)(uint64_t)v15 % 3600)) >> 16) >> 5)
                + ((((int)(uint64_t)v15 % 3600 + ((-30583 * ((int)(uint64_t)v15 % 3600)) >> 16)) & 0x8000) >> 15));
      v12 = 60;
      goto LABEL_8;
    case 1:
      -[MTACountDownPicker duration](self, "duration");
      v11 = (uint64_t)v10 / 3600;
      v12 = 3600;
      v13 = 23;
      break;
    default:
      -[MTACountDownPicker beep](self, "beep");
      v13 = 0;
      v12 = 0;
      v11 = 0;
      break;
  }
  v16 = (char *)objc_msgSend(v6, "integerValue");
  if ((unint64_t)v16 >= 0xA
    || (v17 = v16, -[MTACountDownPicker underEditing](self, "underEditing")) && (v17 += 10 * v11, (uint64_t)v17 > v13))
  {
    -[MTACountDownPicker beep](self, "beep");
  }
  else
  {
    -[MTACountDownPicker startEditing](self, "startEditing");
    -[MTACountDownPicker duration](self, "duration");
    -[MTACountDownPicker setDuration:](self, "setDuration:", v18 + (double)((uint64_t)&v17[-v11] * v12));
  }
LABEL_15:

  return 0;
}

- (void)recognizeTapGesture:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  uint64_t v8;
  CGPoint v9;
  CGPoint v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[MTACountDownPicker hourHighlightFrame](self, "hourHighlightFrame");
  v9.x = v5;
  v9.y = v7;
  if (CGRectContainsPoint(v12, v9))
  {
    v8 = 1;
  }
  else
  {
    -[MTACountDownPicker minuteHighlightFrame](self, "minuteHighlightFrame");
    v10.x = v5;
    v10.y = v7;
    if (CGRectContainsPoint(v13, v10))
    {
      v8 = 2;
    }
    else
    {
      -[MTACountDownPicker secondHighlightFrame](self, "secondHighlightFrame");
      v11.x = v5;
      v11.y = v7;
      if (!CGRectContainsPoint(v14, v11))
        return;
      v8 = 3;
    }
  }
  -[MTACountDownPicker setSelectedField:](self, "setSelectedField:", v8);
}

- (BOOL)usesSmallSize
{
  return self->_usesSmallSize;
}

- (double)duration
{
  return self->_duration;
}

- (double)hourMidX
{
  return self->_hourMidX;
}

- (void)setHourMidX:(double)a3
{
  self->_hourMidX = a3;
}

- (double)minuteMidX
{
  return self->_minuteMidX;
}

- (void)setMinuteMidX:(double)a3
{
  self->_minuteMidX = a3;
}

- (double)secondMidX
{
  return self->_secondMidX;
}

- (void)setSecondMidX:(double)a3
{
  self->_secondMidX = a3;
}

- (BOOL)showText
{
  return self->_showText;
}

- (int64_t)selectedField
{
  return self->_selectedField;
}

- (CAShapeLayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLayer, a3);
}

- (CGRect)hourHighlightFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_hourHighlightFrame.origin.x;
  y = self->_hourHighlightFrame.origin.y;
  width = self->_hourHighlightFrame.size.width;
  height = self->_hourHighlightFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHourHighlightFrame:(CGRect)a3
{
  self->_hourHighlightFrame = a3;
}

- (CGRect)minuteHighlightFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_minuteHighlightFrame.origin.x;
  y = self->_minuteHighlightFrame.origin.y;
  width = self->_minuteHighlightFrame.size.width;
  height = self->_minuteHighlightFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMinuteHighlightFrame:(CGRect)a3
{
  self->_minuteHighlightFrame = a3;
}

- (CGRect)secondHighlightFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_secondHighlightFrame.origin.x;
  y = self->_secondHighlightFrame.origin.y;
  width = self->_secondHighlightFrame.size.width;
  height = self->_secondHighlightFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSecondHighlightFrame:(CGRect)a3
{
  self->_secondHighlightFrame = a3;
}

- (NSDateComponentsFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (BOOL)underEditing
{
  return self->_underEditing;
}

- (void)setUnderEditing:(BOOL)a3
{
  self->_underEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
}

@end
