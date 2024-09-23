@implementation TPNumberPadButton

+ (void)resetLocaleIfNeeded
{
  void *v2;
  void *v3;

  if (numberFormatter)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)numberFormatter, "locale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 != v3)
      +[TPNumberPadButton resetLocale](TPNumberPadButton, "resetLocale");
  }
}

+ (double)horizontalPadding
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenSizeCategory");

  switch(v3)
  {
    case 1:
    case 8:
    case 9:
      v4 = 10.0;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isUserInterfaceIdiomPad"))
        v4 = 10.0;
      else
        v4 = 14.0;

      break;
    case 3:
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isUserInterfaceIdiomPad");

      if (v6)
        v4 = 13.6000004;
      else
        v4 = 15.0;
      break;
    case 4:
      v4 = 13.6000004;
      break;
    case 5:
    case 10:
      v4 = 12.0;
      break;
    case 7:
    case 11:
      v4 = 13.5;
      break;
    default:
      v4 = 0.0;
      break;
  }
  return v4;
}

+ (double)verticalPadding
{
  void *v2;
  uint64_t v3;
  double result;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenSizeCategory");

  switch(v3)
  {
    case 1:
    case 8:
    case 9:
      result = 4.5;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isUserInterfaceIdiomPad");

      result = 5.5;
      if ((v6 & 1) == 0)
        goto LABEL_6;
      break;
    case 3:
    case 6:
LABEL_6:
      result = 7.5;
      break;
    case 4:
    case 7:
    case 11:
      result = 8.0;
      break;
    case 5:
      result = 9.0;
      break;
    case 10:
      result = 10.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (void)setColor:(id)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_color, a3);
  if (-[TPNumberPadButton character](self, "character") != 13)
  {
    -[TPNumberPadButton circleView](self, "circleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v9);

    objc_msgSend((id)objc_opt_class(), "unhighlightedCircleViewAlpha");
    v7 = v6;
    -[TPNumberPadButton circleView](self, "circleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v7);

  }
}

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  double v6;
  double v7;
  TPNumberPadButton *v8;
  id *p_isa;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  _DWORD v41[5];
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  __int128 v50;
  int v51;
  objc_super v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultSize");
  v52.receiver = self;
  v52.super_class = (Class)TPNumberPadButton;
  v8 = -[TPNumberPadButton initWithFrame:](&v52, sel_initWithFrame_, 0.0, 0.0, v6, v7);
  p_isa = (id *)&v8->super.super.super.super.isa;
  if (v8)
  {
    -[TPNumberPadButton setCharacter:](v8, "setCharacter:", a3);
    if (a3 == 13)
    {
      objc_msgSend(p_isa, "defaultColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "setBackgroundColor:", v10);

      return p_isa;
    }
    v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend((id)objc_opt_class(), "circleBounds");
    v12 = objc_msgSend(v11, "initWithFrame:");
    v13 = p_isa[62];
    p_isa[62] = (id)v12;

    objc_msgSend(p_isa[62], "frame");
    v15 = v14 * 0.5;
    objc_msgSend(p_isa[62], "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", v15);

    objc_msgSend(p_isa, "buttonColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "setColor:", v17);

    objc_msgSend((id)objc_opt_class(), "unhighlightedCircleViewAlpha");
    v19 = v18;
    objc_msgSend(p_isa, "circleView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", v19);

    LODWORD(v20) = objc_msgSend((id)objc_opt_class(), "usesButtonColorMatrixFilters");
    v21 = (void *)objc_opt_class();
    if ((_DWORD)v20)
    {
      if (objc_msgSend(v21, "usesEmergencyCallButtonColorMatrixFilters"))
      {
        v22 = 0x3FC0C49CBF6F5C29;
        v23 = 0x3F2A3D71BE8E5604;
        v24 = 1046495625;
        v25 = -1111457006;
        v26 = 1068054348;
      }
      else
      {
        v22 = 0x3FA1CAC1BEB74BC7;
        v23 = 0x3F7126E9BDD91687;
        v24 = 0;
        v25 = -1122798404;
        v26 = 1066980606;
      }
      v41[0] = v26;
      v41[1] = v22;
      v41[2] = v25;
      v41[3] = 0;
      v41[4] = v24;
      v42 = v23;
      v43 = v25;
      v44 = 0;
      v45 = v24;
      v46 = v23;
      v47 = v22;
      v48 = 0;
      v49 = v24;
      v50 = xmmword_1BCFE7400;
      v51 = 0;
      objc_msgSend(MEMORY[0x1E0DC3660], "_colorEffectCAMatrix:", v41);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
      v55[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setBackgroundEffects:", v33);

      if (objc_msgSend((id)objc_opt_class(), "usesEmergencyCallButtonColorMatrixFilters"))
      {
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 100.0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v27;
        v54[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setBackgroundEffects:", v35);

      }
      objc_msgSend(p_isa[62], "frame");
      objc_msgSend(v28, "setFrame:");
      objc_msgSend(p_isa[62], "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "cornerRadius");
      v38 = v37;
      objc_msgSend(v28, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setCornerRadius:", v38);

      objc_msgSend(v28, "setClipsToBounds:", 1);
      objc_msgSend(p_isa, "setBackDropVisualEffectView:", v28);
      objc_msgSend(p_isa, "addSubview:", v28);
    }
    else
    {
      if (!objc_msgSend(v21, "usesButtonSaturationFilters"))
      {
LABEL_14:
        objc_msgSend(p_isa, "addSubview:", p_isa[62]);
        objc_msgSend(p_isa, "reloadImagesForCurrentCharacter");
        objc_msgSend(p_isa, "addTarget:action:forControlEvents:", p_isa, sel_touchDown, 1);
        objc_msgSend(p_isa, "addTarget:action:forControlEvents:", p_isa, sel_touchUp, 64);
        objc_msgSend(p_isa, "addTarget:action:forControlEvents:", p_isa, sel_touchUp, 128);
        objc_msgSend(p_isa, "addTarget:action:forControlEvents:", p_isa, sel_touchCancelled, 256);
        return p_isa;
      }
      v27 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setName:", CFSTR("saturation"));
      objc_msgSend(v28, "setValue:forKey:", &unk_1E760A080, CFSTR("inputAmount"));
      v29 = objc_alloc_init(MEMORY[0x1E0CD2708]);
      v53 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFilters:", v30);

      objc_msgSend(p_isa[62], "frame");
      objc_msgSend(v29, "setFrame:");
      objc_msgSend(p_isa[62], "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cornerRadius");
      objc_msgSend(v29, "setCornerRadius:");

      objc_msgSend(v29, "setScale:", 0.5);
      objc_msgSend(v29, "setGroupName:", CFSTR("TPNumberPadButton"));
      objc_msgSend(v27, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSublayer:", v29);

      objc_msgSend(p_isa, "addSubview:", v27);
    }

    goto LABEL_14;
  }
  return p_isa;
}

+ (CGRect)circleBounds
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
  double v15;
  double v16;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "defaultSize");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "outerCircleDiameter");
  v5 = (v3 - v4) * 0.5;
  objc_msgSend((id)objc_opt_class(), "defaultSize");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "outerCircleDiameter");
  v9 = (v7 - v8) * 0.5;
  objc_msgSend((id)objc_opt_class(), "outerCircleDiameter");
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "outerCircleDiameter");
  v13 = v12;
  v14 = v5;
  v15 = v9;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (CGSize)defaultSize
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
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "outerCircleDiameter");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "horizontalPadding");
  v5 = v3 + v4 * 2.0;
  objc_msgSend((id)objc_opt_class(), "outerCircleDiameter");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "verticalPadding");
  v9 = v7 + v8 * 2.0;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4 whiteVersion:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  __CFString *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v38;
  _BOOL4 v39;
  int64_t v40;
  unsigned int v41;
  _BOOL4 v42;
  int v43;
  CGSize v44;

  v5 = a5;
  v6 = a4;
  +[TPNumberPadButton loadNumberPadKeyPrototypeView](TPNumberPadButton, "loadNumberPadKeyPrototypeView");
  +[TPNumberPadButton resetLocaleIfNeeded](TPNumberPadButton, "resetLocaleIfNeeded");
  v40 = a3;
  switch(a3)
  {
    case 0:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E7609F78);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      goto LABEL_18;
    case 1:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E7609F90);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("A B C");
      break;
    case 2:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E7609FA8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("D E F");
      break;
    case 3:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E7609FC0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("G H I");
      break;
    case 4:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E7609FD8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("J K L");
      break;
    case 5:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E7609FF0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("M N O");
      break;
    case 6:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E760A008);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("P Q R S");
      break;
    case 7:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E760A020);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("T U V");
      break;
    case 8:
      v9 = a1;
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E760A038);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v43 = 1;
      v11 = CFSTR("W X Y Z");
      break;
    case 9:
      v9 = a1;
      v10 = CFSTR("*");
      goto LABEL_17;
    case 10:
      objc_msgSend((id)numberFormatter, "stringFromNumber:", &unk_1E7609F60);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = a1;
      v12 = objc_msgSend(a1, "usesTelephonyGlyphsWhereAvailable");
      v43 = 0;
      v41 = v12 ^ 1;
      if (v12)
        v11 = CFSTR("+");
      else
        v11 = &stru_1E75FDD38;
      break;
    case 11:
      v9 = a1;
      v10 = CFSTR("#");
LABEL_17:
      v41 = 1;
LABEL_18:
      v43 = 1;
      v11 = &stru_1E75FDD38;
      break;
    default:
      v9 = a1;
      v41 = 0;
      v43 = 1;
      v11 = &stru_1E75FDD38;
      v10 = &stru_1E75FDD38;
      break;
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  +[TPNumberPadButton scriptKey](TPNumberPadButton, "scriptKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v15 = CFSTR("hi");
  else
    v15 = &stru_1E75FDD38;
  v42 = v5;
  if (v5)
    v16 = CFSTR("white");
  else
    v16 = CFSTR("mask");
  if (objc_msgSend(v9, "usesBoldAssets"))
    v17 = CFSTR("-bold");
  else
    v17 = &stru_1E75FDD38;
  v18 = objc_msgSend(v9, "isCarPlay");
  v19 = CFSTR("-carplay");
  if (!v18)
    v19 = &stru_1E75FDD38;
  v38 = v17;
  v20 = (void *)v11;
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@%@%@.png"), v14, v10, v11, v15, v16, v38, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[TPFileStorageManager sharedInstance](TPFileStorageManager, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageWithName:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = v23;
  }
  else
  {
    v39 = v6;
    objc_msgSend(v9, "localizedLettersForCharacter:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v43 & (objc_msgSend(v25, "isEqualToString:", &stru_1E75FDD38) ^ 1);

    if ((_DWORD)v26 == 1)
    {
      objc_msgSend(v9, "localizedLettersForCharacter:", v40);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v20;
    }
    else
    {
      v28 = 0;
      v27 = (uint64_t)v20;
    }
    objc_sync_enter(CFSTR("lock"));
    v20 = (void *)v27;
    objc_msgSend((id)numberPadKeyPrototypeView, "setDigit:primaryLetters:secondaryLetters:", v10, v27, v28);
    v29 = (void *)numberPadKeyPrototypeView;
    v30 = uiLanguage;
    objc_msgSend((id)objc_opt_class(), "defaultSize");
    v32 = v31;
    v33 = objc_msgSend(v9, "isCarPlay");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFontStylesForHighlightState:language:showLocalizedLetters:shouldCenterDigit:fontColor:circleDiameter:isCarPlay:screenSizeCategory:", v39, v30, v26, v41, v42, v33, v32, objc_msgSend(v34, "screenSizeCategory"));

    objc_msgSend((id)numberPadKeyPrototypeView, "doLayoutNow");
    *(_QWORD *)&v44.width = prototypeViewSideDimension;
    *(_QWORD *)&v44.height = prototypeViewSideDimension;
    UIGraphicsBeginImageContextWithOptions(v44, 0, 0.0);
    objc_msgSend((id)numberPadKeyPrototypeView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "renderInContext:", UIGraphicsGetCurrentContext());

    UIGraphicsGetImageFromCurrentImageContext();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    +[TPFileStorageManager sharedInstance](TPFileStorageManager, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "saveImage:withName:", v24, v21);

    objc_sync_exit(CFSTR("lock"));
  }

  return v24;
}

- (void)reloadImagesForCurrentCharacter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
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
  float v38;
  double v39;
  void *v40;
  id v41;

  -[TPNumberPadButton glyphLayer](self, "glyphLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPNumberPadButton glyphLayer](self, "glyphLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperlayer");

  }
  -[TPNumberPadButton highlightedGlyphLayer](self, "highlightedGlyphLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TPNumberPadButton highlightedGlyphLayer](self, "highlightedGlyphLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperlayer");

  }
  objc_msgSend((id)objc_opt_class(), "imageForCharacter:", -[TPNumberPadButton character](self, "character"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  objc_msgSend(v8, "setContentsScale:");

  v41 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "setContents:", objc_msgSend(v41, "CGImage"));
  objc_msgSend(v41, "size");
  v11 = v10;
  v13 = v12;
  -[TPNumberPadButton frame](self, "frame");
  v15 = v14;
  objc_msgSend(v41, "size");
  *(float *)&v16 = (v15 - v16) * 0.5;
  v17 = roundf(*(float *)&v16);
  -[TPNumberPadButton frame](self, "frame");
  v19 = v18;
  objc_msgSend(v41, "size");
  v21 = (v19 - v20) * 0.5;
  objc_msgSend(v8, "setFrame:", v17, roundf(v21), v11, v13);
  -[TPNumberPadButton layer](self, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSublayer:", v8);

  -[TPNumberPadButton setGlyphLayer:](self, "setGlyphLayer:", v8);
  objc_msgSend((id)objc_opt_class(), "imageForCharacter:highlighted:", -[TPNumberPadButton character](self, "character"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scale");
  objc_msgSend(v24, "setContentsScale:");

  v26 = objc_retainAutorelease(v23);
  objc_msgSend(v24, "setContents:", objc_msgSend(v26, "CGImage"));
  objc_msgSend(v41, "size");
  v28 = v27;
  v30 = v29;
  -[TPNumberPadButton frame](self, "frame");
  v32 = v31;
  objc_msgSend(v26, "size");
  *(float *)&v33 = (v32 - v33) * 0.5;
  v34 = roundf(*(float *)&v33);
  -[TPNumberPadButton frame](self, "frame");
  v36 = v35;
  objc_msgSend(v26, "size");
  v38 = (v36 - v37) * 0.5;
  objc_msgSend(v24, "setFrame:", v34, roundf(v38), v28, v30);
  LODWORD(v39) = 0;
  objc_msgSend(v24, "setOpacity:", v39);
  -[TPNumberPadButton layer](self, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSublayer:", v24);

  -[TPNumberPadButton setHighlightedGlyphLayer:](self, "setHighlightedGlyphLayer:", v24);
  -[TPNumberPadButton setNeedsLayout](self, "setNeedsLayout");

}

+ (double)outerCircleDiameter
{
  void *v2;
  uint64_t v3;
  double result;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenSizeCategory");

  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 7:
    case 8:
    case 9:
    case 11:
      result = 75.0;
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isUserInterfaceIdiomPad");

      result = 85.0;
      if (v6)
        result = 83.3000031;
      break;
    case 5:
      result = 78.0;
      break;
    case 6:
      result = 85.0;
      break;
    case 10:
      result = 88.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

+ (id)localizedLettersForCharacter:(int64_t)a3
{
  unint64_t v3;
  id result;
  __CFString **v5;

  switch(a3)
  {
    case 1:
      v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2)
        return CFSTR("А Б В Г");
      if (!uiLanguage)
        return CFSTR("ب ت ة ث");
      if (uiLanguage == 5)
        return CFSTR("А Ә Б В Г");
      if (uiLanguage != 2)
        goto LABEL_25;
      return CFSTR("ד ה ו");
    case 2:
      v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2)
        return CFSTR("Д Е Ж З");
LABEL_25:
      if (!v3)
        return CFSTR("ا ء");
      if (v3 == 5)
        return CFSTR("Ғ Д Е Ж З");
      if (v3 != 2)
        goto LABEL_29;
      return CFSTR("א ב ג");
    case 3:
      v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2)
        return CFSTR("И Й К Л");
LABEL_29:
      if (!v3)
        return CFSTR("س ش ص ض");
      if (v3 == 5)
        return CFSTR("И Й К Қ Л");
      if (v3 != 2)
        goto LABEL_33;
      return CFSTR("מ נ");
    case 4:
      v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2)
        return CFSTR("М Н О П");
LABEL_33:
      if (!v3)
        return CFSTR("د ذ ر ز");
      if (v3 == 5)
        return CFSTR("М Н Ң О Ө");
      if (v3 != 2)
        goto LABEL_37;
      return CFSTR("י כ ל");
    case 5:
      v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2)
        return CFSTR("Р С Т У");
LABEL_37:
      if (!v3)
        return CFSTR("ج ح خ");
      if (v3 == 5)
        return CFSTR("П Р С Т У");
      if (v3 != 2)
        goto LABEL_41;
      return CFSTR("ז ח ט");
    case 6:
      v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2)
        return CFSTR("Ф Х Ц Ч");
LABEL_41:
      if (!v3)
        return CFSTR("ن ه و ي");
      if (v3 == 5)
        return CFSTR("Ұ Ү Ф Х Ц");
      if (v3 != 2)
        goto LABEL_16;
      return CFSTR("ר ש ת");
    case 7:
      v3 = uiLanguage;
LABEL_16:
      if (v3 >= 6 || ((0x3Du >> v3) & 1) == 0)
        goto LABEL_18;
      v5 = off_1E75FD550;
      goto LABEL_46;
    case 8:
      v3 = uiLanguage;
LABEL_18:
      if (v3 >= 6)
        goto LABEL_20;
      v5 = off_1E75FD580;
LABEL_46:
      result = v5[v3];
      break;
    default:
LABEL_20:
      result = &stru_1E75FDD38;
      break;
  }
  return result;
}

void __50__TPNumberPadButton_loadNumberPadKeyPrototypeView__block_invoke()
{
  TPNumberPadKey *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v0 = [TPNumberPadKey alloc];
  v1 = -[TPNumberPadKey initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)numberPadKeyPrototypeView;
  numberPadKeyPrototypeView = v1;

  if (numberPadKeyPrototypeView)
  {
    objc_msgSend((id)numberPadKeyPrototypeView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC5000], *(double *)(MEMORY[0x1E0DC5000] + 8));
    prototypeViewSideDimension = v3;
    v4 = objc_opt_new();
    v5 = (void *)numberFormatter;
    numberFormatter = v4;

    +[TPNumberPadButton resetLocale](TPNumberPadButton, "resetLocale");
  }
  else
  {
    v6 = (void *)numberFormatter;
    numberFormatter = 0;

  }
}

- (void)setHighlightedGlyphLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (void)setGlyphLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (void)setCharacter:(int64_t)a3
{
  self->character = a3;
}

- (CALayer)highlightedGlyphLayer
{
  return (CALayer *)objc_getProperty(self, a2, 488, 1);
}

- (CALayer)glyphLayer
{
  return (CALayer *)objc_getProperty(self, a2, 480, 1);
}

- (UIView)circleView
{
  return (UIView *)objc_getProperty(self, a2, 496, 1);
}

- (int64_t)character
{
  return self->character;
}

+ (BOOL)usesButtonColorMatrixFilters
{
  return 0;
}

+ (id)scriptKey
{
  if ((unint64_t)uiLanguage > 5)
    return CFSTR("other");
  else
    return off_1E75FD5B0[uiLanguage];
}

+ (void)resetLocale
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)numberFormatter, "setLocale:", v2);

  TPNumberPadKeyResetLocale();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("ar")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("bg")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("he")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("kk")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("ru")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    v5 = objc_msgSend(v6, "hasPrefix:", CFSTR("en"));
    v4 = 6;
    if (v5)
      v4 = 1;
  }
  uiLanguage = v4;

}

+ (void)loadNumberPadKeyPrototypeView
{
  if (loadNumberPadKeyPrototypeView_onceToken != -1)
    dispatch_once(&loadNumberPadKeyPrototypeView_onceToken, &__block_literal_global_7);
}

+ (BOOL)isCarPlay
{
  return 0;
}

+ (UIEdgeInsets)paddingOutsideRing
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
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "verticalPadding");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "horizontalPadding");
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "verticalPadding");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "horizontalPadding");
  v9 = v8;
  v10 = v3;
  v11 = v5;
  v12 = v7;
  result.right = v9;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

+ (id)imageForCharacter:(int64_t)a3
{
  return 0;
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return 0;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 0;
}

+ (BOOL)usesButtonSaturationFilters
{
  return 1;
}

+ (BOOL)usesEmergencyCallButtonColorMatrixFilters
{
  return 0;
}

+ (double)unhighlightedCircleViewAlpha
{
  return 0.200000003;
}

+ (double)highlightedCircleViewAlpha
{
  return 0.349999994;
}

- (UIColor)highlightedButtonColor
{
  return 0;
}

+ (id)disabledImageForCharacter:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "imageForCharacter:highlighted:whiteVersion:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flatImageWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initForCharacter:(int64_t)a3
{
  return -[TPNumberPadButton initForCharacter:style:](self, "initForCharacter:style:", a3, 0);
}

- (void)updateBackgroundMaterial:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TPNumberPadButton backDropVisualEffectView](self, "backDropVisualEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TPNumberPadButton backDropVisualEffectView](self, "backDropVisualEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundEffects:", v6);

  }
}

- (void)setGreyedOut:(BOOL)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  id v20;

  -[TPNumberPadButton glyphLayer](self, "glyphLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TPNumberPadButton glyphLayer](self, "glyphLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperlayer");

    -[TPNumberPadButton setGlyphLayer:](self, "setGlyphLayer:", 0);
  }
  v7 = -[TPNumberPadButton character](self, "character");
  v8 = (void *)objc_opt_class();
  if (a3)
    objc_msgSend(v8, "disabledImageForCharacter:", v7);
  else
    objc_msgSend(v8, "imageForCharacter:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  objc_msgSend(v10, "setContentsScale:");

  v20 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setContents:", objc_msgSend(v20, "CGImage"));
  objc_msgSend(v20, "size");
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v12, v13);
  -[TPNumberPadButton frame](self, "frame");
  v15 = v14 * 0.5;
  v16 = roundf(v15);
  -[TPNumberPadButton frame](self, "frame");
  v18 = v17 * 0.5;
  objc_msgSend(v10, "setPosition:", v16, roundf(v18));
  -[TPNumberPadButton layer](self, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", v10);

  -[TPNumberPadButton setGlyphLayer:](self, "setGlyphLayer:", v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  TPNumberPadButton *v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[TPNumberPadButton bounds](self, "bounds", a4);
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v10, v9))
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (void)highlightCircleView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = a4;
  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__TPNumberPadButton_highlightCircleView_animated___block_invoke;
  v10[3] = &unk_1E75FCFA8;
  v10[4] = self;
  v11 = a3;
  v6 = _Block_copy(v10);
  v7 = v6;
  if (v4)
  {
    if (v5)
      v8 = 0.0;
    else
      v8 = 0.850000024;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:controlPoint1:controlPoint2:animations:", v6, v8, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v9, "startAnimation");

  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }

}

void __50__TPNumberPadButton_highlightCircleView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "circleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v4, "highlightedCircleViewAlpha");
  else
    objc_msgSend(v4, "unhighlightedCircleViewAlpha");
  objc_msgSend(v2, "setAlpha:");

  objc_msgSend(*(id *)(a1 + 32), "highlightedButtonColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v6, "highlightedButtonColor");
    else
      objc_msgSend(v6, "buttonColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setColor:", v7);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[TPNumberPadButton isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)TPNumberPadButton;
  -[TPNumberPadButton setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != v3)
    -[TPNumberPadButton highlightCircleView:animated:](self, "highlightCircleView:animated:", v3, 1);
}

- (id)defaultColor
{
  return 0;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setCircleView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (UIColor)buttonColor
{
  return self->_buttonColor;
}

- (TPRevealingRingView)revealingRingView
{
  return self->_revealingRingView;
}

- (UIVisualEffectView)backDropVisualEffectView
{
  return self->_backDropVisualEffectView;
}

- (void)setBackDropVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backDropVisualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backDropVisualEffectView, 0);
  objc_storeStrong((id *)&self->_revealingRingView, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_highlightedGlyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
