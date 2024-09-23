@implementation PRXPasscodeEntryView

- (PRXPasscodeEntryView)initWithNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4 delegate:(id)a5
{
  id v8;
  void *v9;
  PRXPasscodeEntryView *v10;
  PRXPasscodeEntryView *v11;
  uint64_t v12;
  NSMutableString *text;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSArray *v19;
  void *v20;
  PRXPasscodeWell *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSArray *wells;
  PRXPasscodeEntryView *v41;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  objc_super v48;

  v8 = a5;
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v43 = (void *)MEMORY[0x24BDBCE88];
    v44 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively."), 4, 8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "exceptionWithName:reason:userInfo:", v44, v45, 0);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v46);
  }
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "preferredSizeForNumberOfDigits:", a3);
  v48.receiver = self;
  v48.super_class = (Class)PRXPasscodeEntryView;
  v10 = -[PRXPasscodeEntryView initWithFrame:](&v48, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11 = v10;
  if (v10)
  {
    v47 = v9;
    objc_storeWeak((id *)&v10->_delegate, v9);
    v11->_keyboardType = 11;
    v11->_numberOfDigits = a3;
    v11->_useMonospacedFont = a4;
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v12 = objc_claimAutoreleasedReturnValue();
    text = v11->_text;
    v11->_text = (NSMutableString *)v12;

    objc_msgSend((id)objc_opt_class(), "fontForNumberOfDigits:useMonospacedFont:", a3, v11->_useMonospacedFont);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "interWellSpacingForNumberOfDigits:", a3);
    v16 = v15;
    objc_msgSend((id)objc_opt_class(), "wellCornerRadiusForNumberOfDigits:", a3);
    v18 = v17;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    while (-[NSArray count](v19, "count") < a3)
    {
      v21 = objc_alloc_init(PRXPasscodeWell);
      -[PRXPasscodeWell setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRXPasscodeWell label](v21, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFont:", v14);

      -[PRXPasscodeWell _setContinuousCornerRadius:](v21, "_setContinuousCornerRadius:", v18);
      -[PRXPasscodeEntryView addSubview:](v11, "addSubview:", v21);
      -[NSArray lastObject](v19, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v19, "addObject:", v21);
      if (v23)
      {
        -[PRXPasscodeWell widthAnchor](v21, "widthAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "widthAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);

        -[PRXPasscodeWell leftAnchor](v21, "leftAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "rightAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, v16);
      }
      else
      {
        -[PRXPasscodeWell leftAnchor](v21, "leftAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRXPasscodeEntryView leftAnchor](v11, "leftAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToAnchor:", v28);
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v29);

      -[PRXPasscodeWell topAnchor](v21, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXPasscodeEntryView topAnchor](v11, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v32);

      -[PRXPasscodeWell bottomAnchor](v21, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXPasscodeEntryView bottomAnchor](v11, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v35);

    }
    -[NSArray lastObject](v19, "lastObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXPasscodeEntryView rightAnchor](v11, "rightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v39);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v20);
    wells = v11->_wells;
    v11->_wells = v19;

    -[PRXPasscodeEntryView _updateWells](v11, "_updateWells");
    v41 = v11;

    v9 = v47;
  }

  return v11;
}

- (PRXPasscodeEntryView)initWithFrame:(CGRect)a3
{
  return -[PRXPasscodeEntryView initWithNumberOfDigits:useMonospacedFont:delegate:](self, "initWithNumberOfDigits:useMonospacedFont:delegate:", 4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXPasscodeEntryView;
  -[PRXPasscodeEntryView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PRXPasscodeEntryView _updateWells](self, "_updateWells");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXPasscodeEntryView;
  -[PRXPasscodeEntryView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PRXPasscodeEntryView _updateWells](self, "_updateWells");
}

- (NSString)text
{
  return (NSString *)(id)-[NSMutableString copy](self->_text, "copy");
}

- (void)setText:(id)a3
{
  unint64_t v4;
  unint64_t numberOfDigits;
  void *v6;
  NSMutableString *v7;
  NSMutableString *text;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  if ((-[NSMutableString isEqualToString:](self->_text, "isEqualToString:") & 1) == 0)
  {
    v4 = objc_msgSend(v13, "length");
    numberOfDigits = self->_numberOfDigits;
    if (v4 > numberOfDigits)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@' is too long for %@; _numberOfDigits=%ld"),
        v13,
        self,
        numberOfDigits);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v12);
    }
    objc_msgSend(v13, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableString *)objc_msgSend(v6, "mutableCopy");
    text = self->_text;
    self->_text = v7;

    -[PRXPasscodeEntryView _updateWells](self, "_updateWells");
  }

}

- (void)_updateWells
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  NSArray *wells;
  _QWORD v8[7];

  v3 = -[NSMutableString length](self->_text, "length");
  -[PRXPasscodeEntryView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = 1.0 / v5;

  wells = self->_wells;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__PRXPasscodeEntryView__updateWells__block_invoke;
  v8[3] = &unk_24CC31EE8;
  v8[4] = self;
  v8[5] = v3;
  *(double *)&v8[6] = v6;
  -[NSArray enumerateObjectsUsingBlock:](wells, "enumerateObjectsUsingBlock:", v8);
}

void __36__PRXPasscodeEntryView__updateWells__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (*(_QWORD *)(a1 + 40) == a3 && objc_msgSend(*(id *)(a1 + 32), "isFirstResponder"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tintColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    objc_msgSend(v17, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v6);

    objc_msgSend(v17, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 2.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemGray4Color");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    objc_msgSend(v17, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderColor:", v12);

    v14 = 1.0;
    if (*(uint64_t *)(*(_QWORD *)(a1 + 32) + 488) <= 6)
      v14 = *(double *)(a1 + 48) + 1.0;
    objc_msgSend(v17, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v14;
  }
  objc_msgSend(v8, "setBorderWidth:", v10);

  if (*(_QWORD *)(a1 + 40) <= a3)
  {
    objc_msgSend(v17, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", &stru_24CC320A8);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "substringWithRange:", a3, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "preferredSizeForNumberOfDigits:", self->_numberOfDigits);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)wellSizeForNumberOfDigits:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  CGSize result;

  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v17 = v4;
    v18 = v3;
    v13 = (void *)MEMORY[0x24BDBCE88];
    v14 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively."), 4, 8, v6, v5, v17, v18, v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  v9 = (double)(a3 - 4);
  v10 = v9 * -4.5 + 50.0;
  v11 = roundf(v10);
  *(float *)&v9 = v9 * -7.0 + 76.0;
  v12 = roundf(*(float *)&v9);
  result.height = v12;
  result.width = v11;
  return result;
}

+ (double)interWellSpacingForNumberOfDigits:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v15 = v4;
    v16 = v3;
    v11 = (void *)MEMORY[0x24BDBCE88];
    v12 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively."), 4, 8, v6, v5, v15, v16, v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v9 = (double)(a3 - 4) * -0.5 + 8.0;
  return roundf(v9);
}

+ (double)wellCornerRadiusForNumberOfDigits:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v14 = v4;
    v15 = v3;
    v10 = (void *)MEMORY[0x24BDBCE88];
    v11 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively."), 4, 8, v6, v5, v14, v15, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  return 8.0;
}

+ (CGSize)preferredSizeForNumberOfDigits:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  CGSize result;

  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively."), 4, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  objc_msgSend(a1, "wellSizeForNumberOfDigits:");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "interWellSpacingForNumberOfDigits:", a3);
  v10 = v9 * (double)(a3 - 1) + v6 * (double)a3;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)fontForNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4
{
  float v4;
  double v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRXPasscodeEntryView requires at between %ld and %ld digits, inclusively."), a4, 4, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }
  v4 = 28.0 - (double)(a3 - 4);
  v5 = roundf(v4);
  if (a4)
    objc_msgSend(MEMORY[0x24BDF6A70], "monospacedSystemFontOfSize:weight:", v5, *MEMORY[0x24BDF7890]);
  else
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", v5, *MEMORY[0x24BDF7880]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRXPasscodeEntryView;
  v3 = -[PRXPasscodeEntryView becomeFirstResponder](&v7, sel_becomeFirstResponder);
  if (v3)
  {
    -[PRXPasscodeEntryView _updateWells](self, "_updateWells");
    -[PRXPasscodeEntryView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PRXPasscodeEntryView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passcodeEntryViewDidBecomeFirstResponder:", self);

    }
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRXPasscodeEntryView;
  v3 = -[PRXPasscodeEntryView resignFirstResponder](&v5, sel_resignFirstResponder);
  if (v3)
    -[PRXPasscodeEntryView _updateWells](self, "_updateWells");
  return v3;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRXPasscodeEntryView;
  v5 = -[PRXPasscodeEntryView beginTrackingWithTouch:withEvent:](&v7, sel_beginTrackingWithTouch_withEvent_, a3, a4);
  if (v5)
    -[PRXPasscodeEntryView becomeFirstResponder](self, "becomeFirstResponder");
  return v5;
}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_text, "length") != 0;
}

- (void)insertText:(id)a3
{
  NSMutableString *text;
  void *v5;
  id v6;

  v6 = a3;
  if ((unint64_t)-[NSMutableString length](self->_text, "length") < self->_numberOfDigits)
  {
    text = self->_text;
    objc_msgSend(v6, "uppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendString:](text, "appendString:", v5);

    -[PRXPasscodeEntryView _updateWells](self, "_updateWells");
    -[PRXPasscodeEntryView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (void)deleteBackward
{
  if (-[NSMutableString length](self->_text, "length"))
  {
    -[NSMutableString replaceCharactersInRange:withString:](self->_text, "replaceCharactersInRange:withString:", -[NSMutableString length](self->_text, "length") - 1, 1, &stru_24CC320A8);
    -[PRXPasscodeEntryView _updateWells](self, "_updateWells");
    -[PRXPasscodeEntryView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (int64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (BOOL)useMonospacedFont
{
  return self->_useMonospacedFont;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (PRXPasscodeEntryViewDelegate)delegate
{
  return (PRXPasscodeEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wells, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
