@implementation PKPinCodeField

- (PKPinCodeField)initWithPinCodeLength:(unint64_t)a3 delegate:(id)a4
{
  return -[PKPinCodeField initWithPinCodeLength:style:delegate:](self, "initWithPinCodeLength:style:delegate:", a3, 0, a4);
}

- (PKPinCodeField)initWithPinCodeLength:(unint64_t)a3 style:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  PKPinCodeField *v9;
  PKPinCodeField *v10;
  uint64_t v11;
  $12613FA7FCF63C64675037BBA6428370 *p_config;
  __int128 v13;
  PKPinCodeField *v14;
  double v15;
  NSMutableString *v16;
  NSMutableString *pinCode;
  uint64_t v18;
  NSCharacterSet *numbersOnlyCharacterSet;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIImage *dotImage;
  unint64_t v26;
  UILabel *v27;
  UILabel *hyphenLabel;
  void *v29;
  objc_class *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  $12613FA7FCF63C64675037BBA6428370 *v39;
  void *v40;
  uint64_t v41;
  NSArray *numberLabels;
  uint64_t v43;
  NSArray *dashViews;
  uint64_t v45;
  NSArray *dotViews;
  double v47;
  id v49;
  void *v50;
  void *v51;
  void *v52;

  v8 = a5;
  if (a3)
  {
    v9 = -[PKPinCodeField init](self, "init");
    v10 = v9;
    if (!v9)
    {
LABEL_14:
      self = v10;
      v14 = self;
      goto LABEL_15;
    }
    v11 = 416;
    v9->_pinCodeLength = a3;
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_style = a4;
    p_config = &v10->_config;
    v49 = v8;
    if (a4 == 1)
    {
      v13 = xmmword_19DF181A0;
    }
    else
    {
      if (a4)
      {
        v13 = 0uLL;
        v15 = 0.0;
        goto LABEL_10;
      }
      v13 = xmmword_19DF181B0;
    }
    v15 = -7.0;
LABEL_10:
    *(_OWORD *)&p_config->dashLength = v13;
    v10->_config.hyphenOffset = v15;
    v10->_keyboardOverrideEnabled = PKPinCodeViewKeyboardOverride();
    v16 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    pinCode = v10->_pinCode;
    v10->_pinCode = v16;

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
    v18 = objc_claimAutoreleasedReturnValue();
    numbersOnlyCharacterSet = v10->_numbersOnlyCharacterSet;
    v10->_numbersOnlyCharacterSet = (NSCharacterSet *)v18;

    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48C8], 2, 32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0DC3870];
    PKPassKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageNamed:inBundle:", CFSTR("passcodeDot-full"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithRenderingMode:", 2);
    v24 = objc_claimAutoreleasedReturnValue();
    dotImage = v10->_dotImage;
    v10->_dotImage = (UIImage *)v24;

    v26 = 0x1E0DC3000uLL;
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    hyphenLabel = v10->_hyphenLabel;
    v10->_hyphenLabel = v27;

    -[UILabel setFont:](v10->_hyphenLabel, "setFont:", v20);
    -[UILabel setTextAlignment:](v10->_hyphenLabel, "setTextAlignment:", 1);
    -[UILabel setHidden:](v10->_hyphenLabel, "setHidden:", 1);
    -[UILabel setText:](v10->_hyphenLabel, "setText:", CFSTR("-"));
    -[PKPinCodeField addSubview:](v10, "addSubview:", v10->_hyphenLabel);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10->_pinCodeLength);
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10->_pinCodeLength);
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10->_pinCodeLength);
    if (v10->_pinCodeLength)
    {
      v30 = 0;
      do
      {
        v31 = objc_alloc_init(*(Class *)(v26 + 2448));
        v32 = v11;
        v33 = v31;
        objc_msgSend(v31, "setFont:", v20);
        objc_msgSend(v33, "setTextAlignment:", 1);
        objc_msgSend(v33, "setHidden:", 1);
        objc_msgSend(v29, "addObject:", v33);
        -[PKPinCodeField addSubview:](v10, "addSubview:", v33);
        v34 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setBackgroundColor:", v35);

        objc_msgSend(v34, "layer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setCornerRadius:", p_config->dashWidth * 0.5);

        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10->_dotImage);
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v38 = v29;
        v39 = p_config;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setTintColor:", v40);

        p_config = v39;
        v29 = v38;
        objc_msgSend(v37, "setHidden:", 1);
        objc_msgSend(v51, "addObject:", v37);
        -[PKPinCodeField addSubview:](v10, "addSubview:", v37);
        objc_msgSend(v52, "addObject:", v34);
        -[PKPinCodeField addSubview:](v10, "addSubview:", v34);

        v11 = v32;
        v26 = 0x1E0DC3000;
        v30 = (objc_class *)((char *)v30 + 1);
      }
      while (v30 < *(Class *)((char *)&v10->super.super.super.isa + v11));
    }
    v41 = objc_msgSend(v29, "copy", v49);
    numberLabels = v10->_numberLabels;
    v10->_numberLabels = (NSArray *)v41;

    v43 = objc_msgSend(v52, "copy");
    dashViews = v10->_dashViews;
    v10->_dashViews = (NSArray *)v43;

    v45 = objc_msgSend(v51, "copy");
    dotViews = v10->_dotViews;
    v10->_dotViews = (NSArray *)v45;

    objc_msgSend(v20, "lineHeight");
    v10->_fontHeight = v47;

    v8 = v50;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)setPinCode:(id)a3
{
  NSMutableString *v4;
  NSMutableString *pinCode;
  unint64_t v6;
  unint64_t pinCodeLength;
  NSMutableString *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  pinCode = self->_pinCode;
  self->_pinCode = v4;

  v6 = objc_msgSend(v10, "length");
  if (v6)
  {
    if (self->_pinCodeLength >= v6)
      pinCodeLength = v6;
    else
      pinCodeLength = self->_pinCodeLength;
    v8 = self->_pinCode;
    objc_msgSend(v10, "substringToIndex:", pinCodeLength);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendString:](v8, "appendString:", v9);

  }
  -[PKPinCodeField updateCharacterVisibility](self, "updateCharacterVisibility");

}

- (NSString)pinCode
{
  return (NSString *)(id)-[NSMutableString copy](self->_pinCode, "copy");
}

- (void)setSecureTextEntry:(BOOL)a3
{
  if (((!self->_secureTextEntry ^ a3) & 1) == 0)
  {
    self->_secureTextEntry = a3;
    -[PKPinCodeField updateCharacterVisibility](self, "updateCharacterVisibility");
  }
}

- (void)setHyphenatePinCode:(BOOL)a3
{
  if (self->_hyphenatePinCode != a3)
  {
    self->_hyphenatePinCode = a3;
    -[UILabel setHidden:](self->_hyphenLabel, "setHidden:", !a3);
    -[PKPinCodeField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateCharacterVisibility
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v3 = -[NSMutableString length](self->_pinCode, "length");
  if (self->_pinCodeLength)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_dashViews, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", v5 < v4);

      -[NSArray objectAtIndexedSubscript:](self->_numberLabels, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = v5 >= v4 || self->_secureTextEntry;
      objc_msgSend(v7, "setHidden:", v9);

      -[NSArray objectAtIndexedSubscript:](self->_dotViews, "objectAtIndexedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = v5 >= v4 || !self->_secureTextEntry;
      objc_msgSend(v10, "setHidden:", v12);

      ++v5;
    }
    while (v5 < self->_pinCodeLength);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  -[PKPinCodeField layoutMargins](self, "layoutMargins", a3.width, a3.height);
  v7 = v5 + v6 + self->_config.dashLength * (double)self->_pinCodeLength;
  v10 = v9 + v8 + self->_fontHeight;
  v11 = fmax(v7, width);
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double dashLength;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double fontHeight;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  unint64_t pinCodeLength;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)PKPinCodeField;
  -[PKPinCodeField layoutSubviews](&v25, sel_layoutSubviews);
  -[PKPinCodeField bounds](self, "bounds");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v21 = *MEMORY[0x1E0C9D648];
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  dashLength = self->_config.dashLength;
  CGRectGetMidY(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  CGRectGetWidth(v27);
  PKFloatRoundToPixel();
  if (self->_pinCodeLength)
  {
    v9 = 0;
    v10 = dashLength + v8;
    while (1)
    {
      PKFloatRoundToPixel();
      v12 = v11;
      fontHeight = self->_fontHeight;
      -[NSArray objectAtIndexedSubscript:](self->_numberLabels, "objectAtIndexedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", x, v12, dashLength, fontHeight);

      -[NSArray objectAtIndexedSubscript:](self->_dashViews, "objectAtIndexedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKSizeAlignedInRect();
      objc_msgSend(v15, "setFrame:");

      -[NSArray objectAtIndexedSubscript:](self->_dotViews, "objectAtIndexedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKSizeAlignedInRect();
      objc_msgSend(v16, "setFrame:");

      v17 = v10 + x;
      pinCodeLength = self->_pinCodeLength;
      if (!self->_hyphenatePinCode)
        break;
      v19 = pinCodeLength >> 1;
      if (pinCodeLength >> 1 != ++v9)
        goto LABEL_7;
      PKFloatRoundToPixel();
      v24 = v20;
      v22 = dashLength;
      v23 = self->_fontHeight;
      x = v10 + v17;
      pinCodeLength = self->_pinCodeLength;
      v9 = v19;
      v21 = v17;
LABEL_8:
      if (v9 >= pinCodeLength)
        goto LABEL_9;
    }
    ++v9;
LABEL_7:
    x = v10 + x;
    goto LABEL_8;
  }
LABEL_9:
  if (self->_hyphenatePinCode)
    -[UILabel setFrame:](self->_hyphenLabel, "setFrame:", v21, v24, v22, v23);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_pinCode, "length") != 0;
}

- (void)insertText:(id)a3
{
  unint64_t pinCodeLength;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSMutableString *pinCode;
  void *v15;
  void *v16;
  NSMutableString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id WeakRetained;
  id v22;

  v22 = a3;
  pinCodeLength = self->_pinCodeLength;
  v5 = -[NSMutableString length](self->_pinCode, "length");
  v6 = self->_pinCodeLength;
  if (v5 < v6)
    v6 = -[NSMutableString length](self->_pinCode, "length");
  if (pinCodeLength - v6 >= objc_msgSend(v22, "length"))
  {
    v10 = objc_msgSend(v22, "length");
  }
  else
  {
    v7 = self->_pinCodeLength;
    v8 = -[NSMutableString length](self->_pinCode, "length");
    v9 = self->_pinCodeLength;
    if (v8 < v9)
      v9 = -[NSMutableString length](self->_pinCode, "length");
    v10 = v7 - v9;
  }
  v11 = v22;
  if (v10)
  {
    v12 = 0;
    while (-[NSCharacterSet characterIsMember:](self->_numbersOnlyCharacterSet, "characterIsMember:", objc_msgSend(v11, "characterAtIndex:", v12))|| self->_keyboardOverrideEnabled)
    {
      ++v12;
      v11 = v22;
      if (v10 == v12)
      {
        v12 = v10;
        goto LABEL_15;
      }
    }
    v11 = v22;
    if (!v12)
      goto LABEL_18;
LABEL_15:
    v13 = -[NSMutableString length](self->_pinCode, "length");
    pinCode = self->_pinCode;
    objc_msgSend(v22, "substringToIndex:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendString:](pinCode, "appendString:", v15);

    if (v13 < v13 + v12)
    {
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_numberLabels, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self->_pinCode;
        v18 = -[NSMutableString rangeOfComposedCharacterSequencesForRange:](v17, "rangeOfComposedCharacterSequencesForRange:", v13, 1);
        -[NSMutableString substringWithRange:](v17, "substringWithRange:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setText:", v20);

        -[PKPinCodeField updateCharacterVisibility](self, "updateCharacterVisibility");
        ++v13;
        --v12;
      }
      while (v12);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pinCodeTextFieldWasUpdated:isComplete:", self, -[NSMutableString length](self->_pinCode, "length") == self->_pinCodeLength);

    v11 = v22;
  }
LABEL_18:

}

- (void)deleteBackward
{
  uint64_t v3;
  id WeakRetained;

  v3 = -[NSMutableString length](self->_pinCode, "length");
  if (v3)
  {
    -[NSMutableString deleteCharactersInRange:](self->_pinCode, "deleteCharactersInRange:", v3 - 1, 1);
    -[PKPinCodeField updateCharacterVisibility](self, "updateCharacterVisibility");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pinCodeTextFieldWasUpdated:isComplete:", self, 0);

  }
}

- (int64_t)keyboardType
{
  if (self->_keyboardOverrideEnabled)
    return 0;
  else
    return 11;
}

- (BOOL)hyphenatePinCode
{
  return self->_hyphenatePinCode;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (PKPinCodeFieldDelegate)delegate
{
  return (PKPinCodeFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hyphenLabel, 0);
  objc_storeStrong((id *)&self->_dotImage, 0);
  objc_storeStrong((id *)&self->_dotViews, 0);
  objc_storeStrong((id *)&self->_dashViews, 0);
  objc_storeStrong((id *)&self->_numberLabels, 0);
  objc_storeStrong((id *)&self->_pinCode, 0);
  objc_storeStrong((id *)&self->_numbersOnlyCharacterSet, 0);
}

@end
