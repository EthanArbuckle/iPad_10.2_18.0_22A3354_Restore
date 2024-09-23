@implementation PTUINumericKeypad

+ (id)sharedKeypad
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__PTUINumericKeypad_sharedKeypad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedKeypad_onceToken != -1)
    dispatch_once(&sharedKeypad_onceToken, block);
  return (id)sharedKeypad___keypad;
}

void __33__PTUINumericKeypad_sharedKeypad__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedKeypad___keypad;
  sharedKeypad___keypad = (uint64_t)v1;

}

- (PTUINumericKeypad)init
{
  PTUINumericKeypad *v2;
  uint64_t v3;
  NSMutableArray *digitsBeforeDot;
  uint64_t v5;
  NSMutableArray *digitsAfterDot;
  UIView *v7;
  UIView *backgroundView;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  UILabel *v15;
  UILabel *valueLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  _KeypadDismissButton *v23;
  _KeypadDismissButton *dismissButton;
  void *v25;
  uint64_t i;
  _KeypadButton *v27;
  uint64_t v28;
  NSArray *digitButtons;
  _KeypadButton *v30;
  _KeypadButton *dotButton;
  _KeypadButton *v32;
  _KeypadButton *signButton;
  _KeypadButton *v34;
  _KeypadButton *clearButton;
  _KeypadButton *v36;
  _KeypadButton *backspaceButton;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)PTUINumericKeypad;
  v2 = -[PTUINumericKeypad init](&v43, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    digitsBeforeDot = v2->_digitsBeforeDot;
    v2->_digitsBeforeDot = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    digitsAfterDot = v2->_digitsAfterDot;
    v2->_digitsAfterDot = (NSMutableArray *)v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v7;

    v9 = v2->_backgroundView;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIView layer](v2->_backgroundView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 10.0);

    -[UIView layer](v2->_backgroundView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", 2.0);

    -[UIView layer](v2->_backgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _KeypadForegroundColor();
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    -[PTUINumericKeypad addSubview:](v2, "addSubview:", v2->_backgroundView);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    valueLabel = v2->_valueLabel;
    v2->_valueLabel = v15;

    v17 = v2->_valueLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

    v19 = v2->_valueLabel;
    _KeypadForegroundColor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    v21 = v2->_valueLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 23.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    -[UILabel setTextAlignment:](v2->_valueLabel, "setTextAlignment:", 2);
    -[PTUINumericKeypad addSubview:](v2, "addSubview:", v2->_valueLabel);
    v23 = objc_alloc_init(_KeypadDismissButton);
    dismissButton = v2->_dismissButton;
    v2->_dismissButton = v23;

    -[_KeypadDismissButton addTarget:action:forControlEvents:](v2->_dismissButton, "addTarget:action:forControlEvents:", v2, sel__dismissButtonPress, 64);
    -[PTUINumericKeypad addSubview:](v2, "addSubview:", v2->_dismissButton);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 10; ++i)
    {
      v27 = -[_KeypadButton initWithDigit:target:]([_KeypadButton alloc], "initWithDigit:target:", i, v2);
      objc_msgSend(v25, "addObject:", v27);
      -[PTUINumericKeypad addSubview:](v2, "addSubview:", v27);

    }
    v28 = objc_msgSend(v25, "copy");
    digitButtons = v2->_digitButtons;
    v2->_digitButtons = (NSArray *)v28;

    v30 = -[_KeypadButton initWithKeyType:target:]([_KeypadButton alloc], "initWithKeyType:target:", 1, v2);
    dotButton = v2->_dotButton;
    v2->_dotButton = v30;

    -[PTUINumericKeypad addSubview:](v2, "addSubview:", v2->_dotButton);
    v32 = -[_KeypadButton initWithKeyType:target:]([_KeypadButton alloc], "initWithKeyType:target:", 2, v2);
    signButton = v2->_signButton;
    v2->_signButton = v32;

    -[PTUINumericKeypad addSubview:](v2, "addSubview:", v2->_signButton);
    v34 = -[_KeypadButton initWithKeyType:target:]([_KeypadButton alloc], "initWithKeyType:target:", 3, v2);
    clearButton = v2->_clearButton;
    v2->_clearButton = v34;

    -[PTUINumericKeypad addSubview:](v2, "addSubview:", v2->_clearButton);
    v36 = -[_KeypadButton initWithKeyType:target:]([_KeypadButton alloc], "initWithKeyType:target:", 4, v2);
    backspaceButton = v2->_backspaceButton;
    v2->_backspaceButton = v36;

    -[PTUINumericKeypad addSubview:](v2, "addSubview:", v2->_backspaceButton);
    -[PTUINumericKeypad layer](v2, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setShadowOffset:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

    -[PTUINumericKeypad layer](v2, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 1053609165;
    objc_msgSend(v39, "setShadowOpacity:", v40);

    -[PTUINumericKeypad layer](v2, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setShadowRadius:", 8.0);

  }
  return v2;
}

- (void)showAnimated:(BOOL)a3 forDelegate:(id)a4
{
  _BOOL4 v5;
  id v7;
  void *v8;
  double MidX;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v5 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_delegate, a4);
  if (!self->_showing)
  {
    -[PTUINumericKeypad superview](self, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend((id)__numericKeypadWindow, "addSubview:", self);
      objc_msgSend((id)__numericKeypadWindow, "bringSubviewToFront:", self);
      -[PTUINumericKeypad sizeToFit](self, "sizeToFit");
      objc_msgSend((id)__numericKeypadWindow, "bounds");
      MidX = CGRectGetMidX(v18);
      objc_msgSend((id)__numericKeypadWindow, "bounds");
      -[PTUINumericKeypad setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v19) + -100.0);
      CGAffineTransformMakeScale(&v17, 0.75, 0.75);
      -[PTUINumericKeypad setTransform:](self, "setTransform:", &v17);
      -[PTUINumericKeypad setAlpha:](self, "setAlpha:", 0.0);
    }
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke;
    v16[3] = &unk_24C435668;
    v16[4] = self;
    v11 = (void (**)(_QWORD))MEMORY[0x20BD36E44](v16);
    v12 = v11;
    if (v5)
    {
      v13 = (void *)MEMORY[0x24BDF6F90];
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke_2;
      v14[3] = &unk_24C435690;
      v15 = v11;
      objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 4, v14, 0, 0.3, 0.0);

    }
    else
    {
      v11[2](v11);
    }
    self->_showing = 1;

  }
}

uint64_t __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __46__PTUINumericKeypad_showAnimated_forDelegate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hideAnimated:(BOOL)a3
{
  _BOOL4 v3;
  PTUINumericKeypadDelegate *delegate;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a3;
  delegate = self->_delegate;
  self->_delegate = 0;

  if (self->_showing)
  {
    if (v3)
    {
      v6[4] = self;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __34__PTUINumericKeypad_hideAnimated___block_invoke;
      v7[3] = &unk_24C435668;
      v7[4] = self;
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __34__PTUINumericKeypad_hideAnimated___block_invoke_2;
      v6[3] = &unk_24C4356B8;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v7, v6, 0.3, 0.0);
    }
    else
    {
      -[PTUINumericKeypad removeFromSuperview](self, "removeFromSuperview");
    }
    self->_showing = 0;
  }
}

uint64_t __34__PTUINumericKeypad_hideAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.75, 0.75);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

_BYTE *__34__PTUINumericKeypad_hideAnimated___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[424])
    return (_BYTE *)objc_msgSend(result, "removeFromSuperview");
  return result;
}

- (double)doubleValue
{
  NSNumber *cachedNumberValue;
  unint64_t v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  unint64_t v12;
  double v13;
  NSNumber *v14;
  NSNumber *v15;
  float v16;

  cachedNumberValue = self->_cachedNumberValue;
  if (!cachedNumberValue)
  {
    if (-[NSMutableArray count](self->_digitsBeforeDot, "count"))
    {
      v4 = 0;
      v5 = 1.0;
      v6 = 0.0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_digitsBeforeDot, "objectAtIndex:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "integerValue");

        v6 = v6 + (double)v8 * v5;
        v5 = v5 * 10.0;
        ++v4;
      }
      while (v4 < -[NSMutableArray count](self->_digitsBeforeDot, "count"));
    }
    else
    {
      v6 = 0.0;
    }
    if (-[NSMutableArray count](self->_digitsAfterDot, "count"))
    {
      v9 = 0;
      v10 = 0.1;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_digitsAfterDot, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        v6 = v6 + (double)v12 * v10;
        v10 = v10 * 0.1;
        ++v9;
      }
      while (v9 < -[NSMutableArray count](self->_digitsAfterDot, "count"));
    }
    v13 = -v6;
    if (!self->_negative)
      v13 = v6;
    *(float *)&v13 = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v15 = self->_cachedNumberValue;
    self->_cachedNumberValue = v14;

    cachedNumberValue = self->_cachedNumberValue;
  }
  -[NSNumber floatValue](cachedNumberValue, "floatValue");
  return v16;
}

- (void)setDoubleValue:(double)a3
{
  double v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSMutableArray *digitsBeforeDot;
  void *v10;
  unint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  NSMutableArray *digitsAfterDot;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  NSMutableArray *v23;
  void *v24;
  int v25;
  BOOL v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  void *v33;

  -[NSMutableArray removeAllObjects](self->_digitsBeforeDot, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_digitsAfterDot, "removeAllObjects");
  self->_negative = a3 < 0.0;
  v5 = fabs(a3);
  v6 = vcvtmd_u64_f64(v5);
  if (v6)
  {
    v7 = 1;
    do
    {
      if ((unint64_t)-[NSMutableArray count](self->_digitsBeforeDot, "count") > 0xA)
        break;
      v8 = 10 * v7;
      digitsBeforeDot = self->_digitsBeforeDot;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6 % (10 * v7) / v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](digitsBeforeDot, "addObject:", v10);

      v7 = v8;
    }
    while (v8 <= v6);
  }
  v11 = -[PTUINumericKeypad _remainingAllowedDigits](self, "_remainingAllowedDigits");
  if (v11 != -1)
  {
    v13 = 0;
    v14 = 0;
    v12 = v5 - (double)v6;
    do
    {
      v15 = v12 * 10.0;
      v16 = vcvtmd_u64_f64(v12 * 10.0);
      if (v16)
      {
        for (; v14; --v14)
          -[NSMutableArray addObject:](self->_digitsAfterDot, "addObject:", &unk_24C43A340);
        digitsAfterDot = self->_digitsAfterDot;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](digitsAfterDot, "addObject:", v18);

        v14 = 0;
      }
      else
      {
        ++v14;
      }
      v12 = v15 - (double)v16;
      v26 = v13++ == v11;
    }
    while (!v26);
  }
  if (-[NSMutableArray count](self->_digitsAfterDot, "count", v12) <= v11
    || (-[NSMutableArray lastObject](self->_digitsAfterDot, "lastObject"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "integerValue"),
        v19,
        -[NSMutableArray removeLastObject](self->_digitsAfterDot, "removeLastObject"),
        v20 < 5))
  {
LABEL_19:
    v25 = 0;
  }
  else
  {
    while (-[NSMutableArray count](self->_digitsAfterDot, "count"))
    {
      -[NSMutableArray lastObject](self->_digitsAfterDot, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue") + 1;

      -[NSMutableArray removeLastObject](self->_digitsAfterDot, "removeLastObject");
      if (v22 <= 9)
      {
        v23 = self->_digitsAfterDot;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v23, "addObject:", v24);

        goto LABEL_19;
      }
    }
    v25 = 1;
  }
  if (-[NSMutableArray count](self->_digitsBeforeDot, "count"))
    v26 = v25 == 0;
  else
    v26 = 1;
  if (!v26)
  {
    v27 = 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_digitsBeforeDot, "objectAtIndex:", v27 - 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");
      v30 = v29 + 1;

      LOBYTE(v25) = v29 == 9;
      if (v29 == 9)
        v31 = 0;
      else
        v31 = v29 + 1;
      v32 = self->_digitsBeforeDot;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray replaceObjectAtIndex:withObject:](v32, "replaceObjectAtIndex:withObject:", v27 - 1, v33);

    }
    while (v27++ < -[NSMutableArray count](self->_digitsBeforeDot, "count") && v30 == 10);
  }
  if ((v25 & 1) != 0)
    -[NSMutableArray addObject:](self->_digitsBeforeDot, "addObject:", &unk_24C43A358);
  self->_hasDot = -[NSMutableArray count](self->_digitsAfterDot, "count") != 0;
  -[PTUINumericKeypad _updateDisplayedValue](self, "_updateDisplayedValue");
}

- (NSString)stringValue
{
  NSString *cachedStringValue;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *digitsBeforeDot;
  NSMutableArray *digitsAfterDot;
  id v10;
  NSString *v11;
  NSString *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  cachedStringValue = self->_cachedStringValue;
  if (!cachedStringValue)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_negative)
      objc_msgSend(v4, "appendString:", CFSTR("-"));
    v6 = -[NSMutableArray count](self->_digitsBeforeDot, "count");
    v7 = MEMORY[0x24BDAC760];
    if (v6)
    {
      digitsBeforeDot = self->_digitsBeforeDot;
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __32__PTUINumericKeypad_stringValue__block_invoke;
      v19[3] = &unk_24C4356E0;
      v20 = v5;
      -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](digitsBeforeDot, "enumerateObjectsWithOptions:usingBlock:", 2, v19);

    }
    else
    {
      objc_msgSend(v5, "appendString:", CFSTR("0"));
    }
    if (self->_hasDot)
      objc_msgSend(v5, "appendString:", CFSTR("."));
    digitsAfterDot = self->_digitsAfterDot;
    v14 = v7;
    v15 = 3221225472;
    v16 = __32__PTUINumericKeypad_stringValue__block_invoke_2;
    v17 = &unk_24C4356E0;
    v18 = v5;
    v10 = v5;
    -[NSMutableArray enumerateObjectsUsingBlock:](digitsAfterDot, "enumerateObjectsUsingBlock:", &v14);
    v11 = (NSString *)objc_msgSend(v10, "copy", v14, v15, v16, v17);
    v12 = self->_cachedStringValue;
    self->_cachedStringValue = v11;

    cachedStringValue = self->_cachedStringValue;
  }
  return cachedStringValue;
}

uint64_t __32__PTUINumericKeypad_stringValue__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%d"), objc_msgSend(a2, "intValue"));
}

uint64_t __32__PTUINumericKeypad_stringValue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%d"), objc_msgSend(a2, "intValue"));
}

- (void)setStringValue:(id)a3
{
  objc_msgSend(a3, "doubleValue");
  -[PTUINumericKeypad setDoubleValue:](self, "setDoubleValue:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 210.0;
  v4 = 310.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double y;
  _KeypadButton *backspaceButton;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  _KeypadButton *dotButton;
  void *v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  CGRect v43;
  CGRect v44;

  v42[2] = *MEMORY[0x24BDAC8D0];
  -[PTUINumericKeypad bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  v44 = CGRectInset(v43, 16.0, 16.0);
  y = v44.origin.y;
  -[UILabel setFrame:](self->_valueLabel, "setFrame:", v44.origin.x);
  backspaceButton = self->_backspaceButton;
  v42[0] = self->_clearButton;
  v42[1] = backspaceButton;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUINumericKeypad _layoutButtonRow:atY:](self, "_layoutButtonRow:atY:", v13, y + 46.0);
  v15 = v14;

  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v16;
  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v17;
  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUINumericKeypad _layoutButtonRow:atY:](self, "_layoutButtonRow:atY:", v19, v15);
  v21 = v20;

  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v22;
  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v23;
  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUINumericKeypad _layoutButtonRow:atY:](self, "_layoutButtonRow:atY:", v25, v21);
  v27 = v26;

  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v28;
  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v29;
  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUINumericKeypad _layoutButtonRow:atY:](self, "_layoutButtonRow:atY:", v31, v27);
  v33 = v32;

  v38[0] = self->_signButton;
  -[NSArray objectAtIndexedSubscript:](self->_digitButtons, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  dotButton = self->_dotButton;
  v38[1] = v34;
  v38[2] = dotButton;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUINumericKeypad _layoutButtonRow:atY:](self, "_layoutButtonRow:atY:", v36, v33);

  -[_KeypadDismissButton setFrame:](self->_dismissButton, "setFrame:", -20.0, -20.0, 40.0, 40.0);
  -[_KeypadDismissButton layer](self->_dismissButton, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setCornerRadius:", 20.0);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_KeypadDismissButton convertPoint:fromView:](self->_dismissButton, "convertPoint:fromView:", self, x, y);
  if ((-[_KeypadDismissButton pointInside:withEvent:](self->_dismissButton, "pointInside:withEvent:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PTUINumericKeypad;
    v8 = -[PTUINumericKeypad pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y);
  }

  return v8;
}

- (double)_layoutButtonRow:(id)a3 atY:(double)a4
{
  double result;

  -[PTUINumericKeypad _layoutButtonRow:atY:stretch:](self, "_layoutButtonRow:atY:stretch:", a3, 0, a4);
  return result;
}

- (double)_layoutButtonRow:(id)a3 atY:(double)a4 stretch:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  _QWORD v17[7];
  _QWORD v18[4];

  v5 = a5;
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (v8 != 3 && !v5)
  {
    if (v8 == 1)
    {
      objc_msgSend(v7, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 78.0;
      v15 = a4;
    }
    else
    {
      if (v8 != 2)
        goto LABEL_15;
      objc_msgSend(v7, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFrame:", 16.0, a4, 54.0, 40.0);

      objc_msgSend(v7, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 140.0;
      v15 = a4;
    }
    objc_msgSend(v12, "setFrame:", v14, v15, 54.0, 40.0);

    goto LABEL_15;
  }
  v10 = 54.0;
  if (v8 == 2)
    v10 = 85.0;
  v18[0] = 0;
  v18[1] = v18;
  if (v8 == 1)
    v10 = 178.0;
  v18[2] = 0x2020000000;
  v18[3] = 0x4030000000000000;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__PTUINumericKeypad__layoutButtonRow_atY_stretch___block_invoke;
  v17[3] = &unk_24C435708;
  v17[4] = v18;
  *(double *)&v17[5] = a4;
  *(double *)&v17[6] = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
  _Block_object_dispose(v18, 8);
LABEL_15:

  return a4 + 40.0 + 8.0;
}

CGFloat __50__PTUINumericKeypad__layoutButtonRow_atY_stretch___block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  CGFloat result;
  CGRect v7;

  v3 = *(double *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 24);
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(a2, "setFrame:", v3, v4, v5, 40.0);
  v7.origin.x = v3;
  v7.origin.y = v4;
  v7.size.width = v5;
  v7.size.height = 40.0;
  result = CGRectGetMaxX(v7) + 8.0;
  *(CGFloat *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 24) = result;
  return result;
}

- (void)_updateDisplayedValue
{
  NSNumber *cachedNumberValue;
  NSString *cachedStringValue;
  UILabel *valueLabel;
  void *v6;

  cachedNumberValue = self->_cachedNumberValue;
  self->_cachedNumberValue = 0;

  cachedStringValue = self->_cachedStringValue;
  self->_cachedStringValue = 0;

  valueLabel = self->_valueLabel;
  -[PTUINumericKeypad stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](valueLabel, "setText:", v6);

  -[PTUINumericKeypadDelegate numericKeypadDidUpdateValue:](self->_delegate, "numericKeypadDidUpdateValue:", self);
}

- (void)keyPress:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "keyType"))
  {
    case 0:
      -[PTUINumericKeypad _appendDigit:](self, "_appendDigit:", objc_msgSend(v4, "digit"));
      break;
    case 1:
      -[PTUINumericKeypad _appendDot](self, "_appendDot");
      break;
    case 2:
      -[PTUINumericKeypad _changeSign](self, "_changeSign");
      break;
    case 3:
      -[PTUINumericKeypad _clear](self, "_clear");
      break;
    case 4:
      -[PTUINumericKeypad _backspace](self, "_backspace");
      break;
    default:
      break;
  }

}

- (void)_appendDigit:(unint64_t)a3
{
  NSMutableArray *digitsAfterDot;
  void *v6;
  NSMutableArray *digitsBeforeDot;

  if (!-[PTUINumericKeypad _remainingAllowedDigits](self, "_remainingAllowedDigits"))
  {
    -[PTUINumericKeypad _flash](self, "_flash");
    return;
  }
  if (self->_hasDot)
  {
    digitsAfterDot = self->_digitsAfterDot;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](digitsAfterDot, "addObject:", v6);
LABEL_7:

    goto LABEL_8;
  }
  if (-[NSMutableArray count](self->_digitsBeforeDot, "count") | a3)
  {
    digitsBeforeDot = self->_digitsBeforeDot;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](digitsBeforeDot, "insertObject:atIndex:", v6, 0);
    goto LABEL_7;
  }
LABEL_8:
  -[PTUINumericKeypad _updateDisplayedValue](self, "_updateDisplayedValue");
}

- (unint64_t)_remainingAllowedDigits
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSMutableArray count](self->_digitsBeforeDot, "count");
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  v5 = -[NSMutableArray count](self->_digitsAfterDot, "count");
  if ((unint64_t)(v5 + v4) <= 0xB)
    return 11 - (v5 + v4);
  else
    return 0;
}

- (void)_appendDot
{
  if (self->_hasDot)
  {
    -[PTUINumericKeypad _flash](self, "_flash");
  }
  else
  {
    self->_hasDot = 1;
    -[PTUINumericKeypad _updateDisplayedValue](self, "_updateDisplayedValue");
  }
}

- (void)_changeSign
{
  self->_negative ^= 1u;
  -[PTUINumericKeypad _updateDisplayedValue](self, "_updateDisplayedValue");
}

- (void)_clear
{
  -[NSMutableArray removeAllObjects](self->_digitsAfterDot, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_digitsBeforeDot, "removeAllObjects");
  self->_hasDot = 0;
  self->_negative = 0;
  -[PTUINumericKeypad _updateDisplayedValue](self, "_updateDisplayedValue");
}

- (void)_backspace
{
  uint64_t v3;

  if (-[NSMutableArray count](self->_digitsAfterDot, "count"))
  {
    -[NSMutableArray removeLastObject](self->_digitsAfterDot, "removeLastObject");
LABEL_7:
    -[PTUINumericKeypad _updateDisplayedValue](self, "_updateDisplayedValue");
    return;
  }
  v3 = 513;
  if (self->_hasDot)
    goto LABEL_4;
  if (-[NSMutableArray count](self->_digitsBeforeDot, "count"))
  {
    -[NSMutableArray removeObjectAtIndex:](self->_digitsBeforeDot, "removeObjectAtIndex:", 0);
    goto LABEL_7;
  }
  v3 = 512;
  if (self->_negative)
  {
LABEL_4:
    *((_BYTE *)&self->super.super.super.isa + v3) = 0;
    goto LABEL_7;
  }
  -[PTUINumericKeypad _flash](self, "_flash");
}

- (void)_dismissButtonPress
{
  -[PTUINumericKeypadDelegate numericKeypadWillDismiss:](self->_delegate, "numericKeypadWillDismiss:", self);
  -[PTUINumericKeypad hideAnimated:](self, "hideAnimated:", 1);
}

- (void)_flash
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __27__PTUINumericKeypad__flash__block_invoke;
  v3[3] = &unk_24C435668;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __27__PTUINumericKeypad__flash__block_invoke_2;
  v2[3] = &unk_24C4356B8;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v3, v2, 0.1);
}

uint64_t __27__PTUINumericKeypad__flash__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  if (_KeypadFlashColor_onceToken != -1)
    dispatch_once(&_KeypadFlashColor_onceToken, &__block_literal_global_130);
  return objc_msgSend(v1, "setBackgroundColor:", _KeypadFlashColor___color);
}

uint64_t __27__PTUINumericKeypad__flash__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __27__PTUINumericKeypad__flash__block_invoke_3;
  v2[3] = &unk_24C435668;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.1);
}

void __27__PTUINumericKeypad__flash__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStringValue, 0);
  objc_storeStrong((id *)&self->_cachedNumberValue, 0);
  objc_storeStrong((id *)&self->_digitsAfterDot, 0);
  objc_storeStrong((id *)&self->_digitsBeforeDot, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_backspaceButton, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_signButton, 0);
  objc_storeStrong((id *)&self->_dotButton, 0);
  objc_storeStrong((id *)&self->_digitButtons, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
