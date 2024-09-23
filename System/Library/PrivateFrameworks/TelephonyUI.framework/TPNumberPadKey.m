@implementation TPNumberPadKey

- (TPNumberPadKey)initWithFrame:(CGRect)a3
{
  TPNumberPadKey *v3;
  uint64_t v4;
  UILabel *digit;
  uint64_t v6;
  UILabel *letters;
  uint64_t v8;
  UILabel *secondaryLetters;
  void *v10;
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
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSLayoutConstraint *letterBaseline;
  void *v31;
  void *v32;
  uint64_t v33;
  NSLayoutConstraint *digitBaseline;
  void *v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *secondaryLetterBaseline;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)TPNumberPadKey;
  v3 = -[TPNumberPadKey initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    digit = v3->_digit;
    v3->_digit = (UILabel *)v4;

    v6 = objc_opt_new();
    letters = v3->_letters;
    v3->_letters = (UILabel *)v6;

    v8 = objc_opt_new();
    secondaryLetters = v3->_secondaryLetters;
    v3->_secondaryLetters = (UILabel *)v8;

    -[TPNumberPadKey setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_secondaryLetters, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_letters, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_digit, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPNumberPadKey addSubview:](v3, "addSubview:", v3->_digit);
    -[TPNumberPadKey addSubview:](v3, "addSubview:", v3->_letters);
    -[TPNumberPadKey addSubview:](v3, "addSubview:", v3->_secondaryLetters);
    -[TPNumberPadKey widthAnchor](v3, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 75.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[TPNumberPadKey heightAnchor](v3, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 75.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UILabel centerXAnchor](v3->_digit, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPadKey centerXAnchor](v3, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UILabel centerXAnchor](v3->_secondaryLetters, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPadKey centerXAnchor](v3, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[UILabel centerYAnchor](v3->_digit, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPadKey centerYAnchor](v3, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v23) = 1132068864;
    objc_msgSend(v22, "setPriority:", v23);
    objc_msgSend(v22, "setActive:", 1);
    -[UILabel centerXAnchor](v3->_letters, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPadKey centerXAnchor](v3, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UILabel firstBaselineAnchor](v3->_letters, "firstBaselineAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v3->_digit, "firstBaselineAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 14.0);
    v29 = objc_claimAutoreleasedReturnValue();
    letterBaseline = v3->_letterBaseline;
    v3->_letterBaseline = (NSLayoutConstraint *)v29;

    -[UILabel firstBaselineAnchor](v3->_digit, "firstBaselineAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPadKey topAnchor](v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 44.0);
    v33 = objc_claimAutoreleasedReturnValue();
    digitBaseline = v3->_digitBaseline;
    v3->_digitBaseline = (NSLayoutConstraint *)v33;

    -[UILabel firstBaselineAnchor](v3->_secondaryLetters, "firstBaselineAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v3->_letters, "firstBaselineAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    secondaryLetterBaseline = v3->_secondaryLetterBaseline;
    v3->_secondaryLetterBaseline = (NSLayoutConstraint *)v37;

    -[NSLayoutConstraint setActive:](v3->_secondaryLetterBaseline, "setActive:", 1);
    -[NSLayoutConstraint setActive:](v3->_digitBaseline, "setActive:", 1);
    -[NSLayoutConstraint setActive:](v3->_letterBaseline, "setActive:", 1);

  }
  return v3;
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
}

+ (float)absoluteTrackingValueForString:(id)a3 pointSize:(float)a4 unitsPerEm:(float)a5
{
  unint64_t v7;
  float v8;

  v7 = objc_msgSend(a3, "length");
  v8 = -25.0;
  if (v7 < 6)
    v8 = 0.0;
  if (isBold)
    v8 = -175.0;
  return (float)(v8 / a5) * a4;
}

- (BOOL)isAsterisk
{
  void *v2;
  void *v3;
  char v4;

  -[TPNumberPadKey digit](self, "digit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("*"));

  return v4;
}

- (BOOL)isPound
{
  void *v2;
  void *v3;
  char v4;

  -[TPNumberPadKey digit](self, "digit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("#"));

  return v4;
}

- (double)digitFontSizeForScreenSizeCategory:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  void *v8;
  double result;
  BOOL v10;

  v5 = a5;
  v7 = 36.0;
  switch(a3)
  {
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isUserInterfaceIdiomPad"))
        v7 = 36.0;
      else
        v7 = 40.0;

      break;
    case 5uLL:
      v7 = 37.0;
      break;
    case 6uLL:
      v7 = 40.0;
      break;
    case 0xAuLL:
      v7 = 41.0;
      break;
    default:
      break;
  }
  result = v7 + 2.0;
  if (!v5)
    result = v7;
  if (useIndicDigits)
    v10 = a4 == 0;
  else
    v10 = 0;
  if (!v10)
    return v7;
  return result;
}

- (double)letterFontSizeForScreenSizeCategory:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  void *v9;

  v5 = a5;
  v7 = 10.0;
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isUserInterfaceIdiomPad"))
      v7 = 12.0;

    if (a4)
      goto LABEL_9;
    return v7 + 1.0;
  }
  if (a3 == 10)
    v8 = 12.0;
  else
    v8 = 10.0;
  if (a3 == 6)
    v7 = 12.0;
  else
    v7 = v8;
  if (!a4)
    return v7 + 1.0;
LABEL_9:
  if (v5)
  {
    if (a4 == 2)
      return v7 + 1.0;
    else
      return v7 + -1.0;
  }
  return v7;
}

- (double)secondaryLetterFontSizeForScreenSizeCategory:(unint64_t)a3
{
  double v3;
  double v4;
  void *v5;

  v3 = 9.0;
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isUserInterfaceIdiomPad"))
      v3 = 11.0;

  }
  else
  {
    v4 = 10.0;
    if (a3 != 10)
      v4 = 9.0;
    if (a3 == 6)
      return 11.0;
    else
      return v4;
  }
  return v3;
}

- (void)updateBaselineConstraintConstantsFor:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  int v9;
  BOOL v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  id v17;

  v5 = a5;
  if (a3 == 6)
  {
    v9 = 1;
    if (a4)
      goto LABEL_6;
LABEL_9:
    if (useIndicDigits)
    {
      -[TPNumberPadKey letterBaseline](self, "letterBaseline");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setConstant:", 14.0);

    }
    v10 = v9 == 0;
    v11 = 12.0;
    v12 = 14.0;
    goto LABEL_12;
  }
  if (a3 != 3)
  {
    v9 = 0;
    if (a4)
      goto LABEL_6;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isUserInterfaceIdiomPad") ^ 1;

  if (!a4)
    goto LABEL_9;
LABEL_6:
  if (!v5)
    goto LABEL_16;
  v10 = v9 == 0;
  v11 = 11.0;
  v12 = 13.0;
LABEL_12:
  if (v10)
    v14 = v11;
  else
    v14 = v12;
  -[TPNumberPadKey secondaryLetterBaseline](self, "secondaryLetterBaseline", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v14);

LABEL_16:
  if (v9)
    v16 = 16.0;
  else
    v16 = 14.0;
  -[TPNumberPadKey letterBaseline](self, "letterBaseline");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v16);

}

- (void)setFontStylesForHighlightState:(BOOL)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5 shouldCenterDigit:(BOOL)a6 fontColor:(BOOL)a7 circleDiameter:(double)a8 isCarPlay:(BOOL)a9 screenSizeCategory:(unint64_t)a10
{
  _BOOL4 v10;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL8 v14;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  const __CTFont *v45;
  void *v46;
  void *v47;
  void *v48;
  float v49;
  double v50;
  double v51;
  float v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  float v58;
  double v59;
  double v60;
  float v61;
  double v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  id v94;

  v10 = a9;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  -[TPNumberPadKey digitFontSizeForScreenSizeCategory:language:showLocalizedLetters:](self, "digitFontSizeForScreenSizeCategory:language:showLocalizedLetters:", a10);
  v18 = v17;
  -[TPNumberPadKey letterFontSizeForScreenSizeCategory:language:showLocalizedLetters:](self, "letterFontSizeForScreenSizeCategory:language:showLocalizedLetters:", a10, a4, v14);
  v20 = v19;
  -[TPNumberPadKey secondaryLetterFontSizeForScreenSizeCategory:](self, "secondaryLetterFontSizeForScreenSizeCategory:", a10);
  v22 = v21;
  if (isBold)
    v23 = &semiBoldFont;
  else
    v23 = &regularFont;
  v24 = *v23;
  v25 = boldFont;
  v26 = &blackColor;
  if (v12)
    v26 = &whiteColor;
  v94 = (id)*v26;
  -[TPNumberPadKey letters](self, "letters");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", 0);

  -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", 0);

  -[TPNumberPadKey updateBaselineConstraintConstantsFor:language:showLocalizedLetters:](self, "updateBaselineConstraintConstantsFor:language:showLocalizedLetters:", a10, a4, v14);
  if (!v14)
  {
    -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", 1);

    -[TPNumberPadKey letters](self, "letters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("+"));

    if (v35)
      v20 = v20 + 5.0;
    if (a8 == 65.0)
    {
      v36 = 0x4043000000000000;
    }
    else
    {
      if (a8 == 83.0)
      {
        v37 = 0x4047800000000000;
        goto LABEL_15;
      }
      v36 = 0x4046000000000000;
    }
    v37 = v36;
LABEL_15:
    -[TPNumberPadKey digitBaseline](self, "digitBaseline");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = *(double *)&v37;
    goto LABEL_16;
  }
  -[TPNumberPadKey digitBaseline](self, "digitBaseline");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v31 = 38.0;
LABEL_16:
  objc_msgSend(v29, "setConstant:", v31);

  -[TPNumberPadKey digitBaseline](self, "digitBaseline");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", !v13);

  if (v10)
  {
    v18 = v18 * 0.5;
    v20 = v20 * 0.5;
    v22 = v22 * 0.5;
    -[TPNumberPadKey secondaryLetterBaseline](self, "secondaryLetterBaseline");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constant");
    objc_msgSend(v39, "setConstant:", v40 * 0.5);

    -[TPNumberPadKey letterBaseline](self, "letterBaseline");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constant");
    objc_msgSend(v41, "setConstant:", v42 * 0.5);

    if (!v14)
    {
      -[TPNumberPadKey digitBaseline](self, "digitBaseline");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constant");
      objc_msgSend(v43, "setConstant:", v44 + -3.0);

    }
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v25, v20, v24);
  v45 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v25, v22);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPNumberPadKey letters](self, "letters");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "text");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v50 = (float)CTFontGetUnitsPerEm(v45);
  v49 = v20;
  *(float *)&v51 = v49;
  +[TPNumberPadKey absoluteTrackingValueForString:pointSize:unitsPerEm:](TPNumberPadKey, "absoluteTrackingValueForString:pointSize:unitsPerEm:", v48, v51, v50);
  v53 = v52;

  -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "text");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "text");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v59 = (float)CTFontGetUnitsPerEm(v45);
    v58 = v22;
    *(float *)&v60 = v58;
    +[TPNumberPadKey absoluteTrackingValueForString:pointSize:unitsPerEm:](TPNumberPadKey, "absoluteTrackingValueForString:pointSize:unitsPerEm:", v57, v60, v59);
    v62 = v61;

  }
  else
  {
    v62 = 0.0;
  }
  v63 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[TPNumberPadKey letters](self, "letters");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "text");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v63, "initWithString:", v65);

  v67 = *MEMORY[0x1E0DC1150];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPNumberPadKey letters](self, "letters");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "text");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addAttribute:value:range:", v67, v68, 0, objc_msgSend(v70, "length"));

  -[TPNumberPadKey letters](self, "letters");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setAttributedText:", v66);

  -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "text");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    v74 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "text");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend(v74, "initWithString:", v76);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "text");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addAttribute:value:range:", v67, v78, 0, objc_msgSend(v80, "length"));

    -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setAttributedText:", v77);

  }
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v93, v18);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPNumberPadKey digit](self, "digit");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setFont:", v82);

  if (-[TPNumberPadKey isAsterisk](self, "isAsterisk") || -[TPNumberPadKey isPound](self, "isPound"))
  {
    -[TPNumberPadKey digit](self, "digit");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "font");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "withCaseSensitiveAttribute");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPadKey digit](self, "digit");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setFont:", v86);

  }
  -[TPNumberPadKey letters](self, "letters");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setFont:", v45);

  -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setFont:", v46);

  -[TPNumberPadKey digit](self, "digit");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setTextColor:", v94);

  -[TPNumberPadKey letters](self, "letters");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTextColor:", v94);

  -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setTextColor:", v94);

}

- (void)setDigit:(id)a3 primaryLetters:(id)a4 secondaryLetters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v8 = a4;
  v9 = a3;
  -[TPNumberPadKey digit](self, "digit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[TPNumberPadKey letters](self, "letters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v8);

  if (v13)
  {
    -[TPNumberPadKey secondaryLetters](self, "secondaryLetters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v13);

  }
}

- (void)doLayoutNow
{
  -[TPNumberPadKey setNeedsLayout](self, "setNeedsLayout");
  -[TPNumberPadKey setNeedsDisplay](self, "setNeedsDisplay");
  -[TPNumberPadKey layoutIfNeeded](self, "layoutIfNeeded");
}

- (UILabel)digit
{
  return self->_digit;
}

- (void)setDigit:(id)a3
{
  objc_storeStrong((id *)&self->_digit, a3);
}

- (UILabel)letters
{
  return self->_letters;
}

- (void)setLetters:(id)a3
{
  objc_storeStrong((id *)&self->_letters, a3);
}

- (UILabel)secondaryLetters
{
  return self->_secondaryLetters;
}

- (void)setSecondaryLetters:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLetters, a3);
}

- (NSLayoutConstraint)digitBaseline
{
  return self->_digitBaseline;
}

- (void)setDigitBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_digitBaseline, a3);
}

- (NSLayoutConstraint)letterBaseline
{
  return self->_letterBaseline;
}

- (void)setLetterBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_letterBaseline, a3);
}

- (NSLayoutConstraint)secondaryLetterBaseline
{
  return self->_secondaryLetterBaseline;
}

- (void)setSecondaryLetterBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLetterBaseline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLetterBaseline, 0);
  objc_storeStrong((id *)&self->_letterBaseline, 0);
  objc_storeStrong((id *)&self->_digitBaseline, 0);
  objc_storeStrong((id *)&self->_secondaryLetters, 0);
  objc_storeStrong((id *)&self->_letters, 0);
  objc_storeStrong((id *)&self->_digit, 0);
}

@end
