@implementation TypistKeyboard

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPressDuration:(id)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSNumber *pressDuration;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  if (!v24 || objc_msgSend(v24, "compare:", &unk_251A94D50) == -1)
  {
    -[TypistKeyboard pressDuration](self, "pressDuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TypistKeyboard pressDuration](self, "pressDuration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Invalid pressDuration was provided: %@. The existing value of (%@) will continue to be used!"), v10, v11, v12, v13, v14, v15, (char)v24);

    }
    else
    {
      pressDuration = self->_pressDuration;
      self->_pressDuration = (NSNumber *)&unk_251A94D60;

      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Invalid pressDuration was provided: %@. The default value of %@ will be used instead."), v17, v18, v19, v20, v21, v22, (char)v24);
    }
  }
  else
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v24, "doubleValue");
      v7 = v6;
      -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPressDuration:", v7);

    }
    objc_storeStrong((id *)&self->_pressDuration, a3);
  }

}

- (void)setTypeInterval:(id)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSNumber *typeInterval;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  if (!v24 || objc_msgSend(v24, "compare:", &unk_251A94D50) == -1)
  {
    -[TypistKeyboard typeInterval](self, "typeInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TypistKeyboard typeInterval](self, "typeInterval");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Invalid typeInterval was provided: %@. The existing value of (%@) will continue to be used!"), v10, v11, v12, v13, v14, v15, (char)v24);

    }
    else
    {
      typeInterval = self->_typeInterval;
      self->_typeInterval = (NSNumber *)&unk_251A94D60;

      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Invalid typeInterval was provided: %@. The default value of %@ will be used instead."), v17, v18, v19, v20, v21, v22, (char)v24);
    }
  }
  else
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v24, "doubleValue");
      v7 = v6;
      -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTypeInterval:", v7);

    }
    objc_storeStrong((id *)&self->_typeInterval, a3);
  }

}

- (void)setTouchMajorRadius:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "doubleValue");
  if (v11 <= 0.0)
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Invalid touch radius was provided: %@. Ignoring."), v5, v6, v7, v8, v9, v10, (char)v12);
  }
  else
  {
    objc_storeStrong((id *)&self->_touchMajorRadius, a3);
    +[TypistKeyboardUtilities setTapTouchRadius:](TypistKeyboardUtilities, "setTapTouchRadius:", v12);
  }

}

- (void)dealloc
{
  objc_super v3;

  +[TypistKeyboardUtilities tearDownRecapInlinePlayer](TypistKeyboardUtilities, "tearDownRecapInlinePlayer");
  +[TypistKeyboardUtilities setTapTouchRadius:](TypistKeyboardUtilities, "setTapTouchRadius:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TypistKeyboard;
  -[TypistKeyboard dealloc](&v3, sel_dealloc);
}

- (id)init:(id)a3
{
  return -[TypistKeyboard init:options:](self, "init:options:", a3, 0);
}

- (id)init:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  __objc2_class *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("fr")))
  {
    v8 = TypistKeyboardFrench;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("fa")))
  {
    v8 = TypistKeyboardFarsi;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("ja_JP")))
  {
    v8 = TypistKeyboardJapanese;
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("zh_Han")) & 1) != 0
         || objc_msgSend(v6, "hasPrefix:", CFSTR("yue_Hant")))
  {
    v8 = TypistKeyboardChinese;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("ko_KR")))
  {
    v8 = TypistKeyboardKorean;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("chr")))
  {
    v8 = TypistKeyboardCherokee;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("cs_CZ")))
  {
    v8 = TypistKeyboardCzech;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("haw")))
  {
    v8 = TypistKeyboardHawaiian;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("el_GR")))
  {
    v8 = TypistKeyboardGreek;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("lut")))
  {
    v8 = TypistKeyboardLushootseed;
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("bo")) & 1) != 0
         || objc_msgSend(v6, "hasPrefix:", CFSTR("dz")))
  {
    v8 = TypistKeyboardTibetan;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("ta"))
         && (objc_msgSend(v6, "hasPrefix:", CFSTR("ta@sw=Tamil-QWERTY")) & 1) == 0)
  {
    v8 = TypistKeyboardTamil;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("pa@sw=Punjabi-Phonetic")))
  {
    v8 = TypistKeyboardPunjabi;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("si")))
  {
    v8 = TypistKeyboardSinhala;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("ug")))
  {
    v8 = TypistKeyboardUyghur;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("am")))
  {
    v8 = TypistKeyboardAmharic;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("my@sw=Burmese")))
  {
    v8 = TypistKeyboardBurmese;
  }
  else
  {
    if (!objc_msgSend(v6, "containsString:", CFSTR("emoji")))
    {
      v9 = -[TypistKeyboard init:options:locale:]([TypistKeyboard alloc], "init:options:locale:", v6, v7, 0);
      goto LABEL_11;
    }
    v8 = TypistKeyboardEmoji;
  }
  v9 = (id)objc_msgSend([v8 alloc], "init:options:", v6, v7);
LABEL_11:
  v10 = v9;

  return v10;
}

- (id)init:(id)a3 options:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  TypistKeyboard *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  TypistKeyboard *v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TypistKeyboard;
  v9 = -[TypistKeyboard init](&v28, sel_init);
  if (!v9)
    goto LABEL_6;
  if (-[TypistKeyboard isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TYLogl(OS_LOG_TYPE_DEFAULT, CFSTR("Initializing TypistKeyboard: [%@]"), v12, v13, v14, v15, v16, v17, (char)v11);

  }
  -[TypistKeyboard setupKeyboardInfo:options:](v9, "setupKeyboardInfo:options:", v7, v8);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v25 = (void *)v18;
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("%@"), v19, v20, v21, v22, v23, v24, v18);

    v26 = 0;
  }
  else
  {
LABEL_6:
    v26 = v9;
  }

  return v26;
}

- (void)setupSentenceBoundryStrings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[objc_class getSentenceBoundaryStrings](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getSentenceBoundaryStrings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sentenceTrailingCharacters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard setSentenceTrailingCharacters:](self, "setSentenceTrailingCharacters:", v3);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sentenceDelimitingCharacters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard setSentenceDelimitingCharacters:](self, "setSentenceDelimitingCharacters:", v4);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sentencePrefixingCharacters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard setSentencePrefixingCharacters:](self, "setSentencePrefixingCharacters:", v5);

}

- (id)_setupAutoShiftRegex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TypistKeyboard sentenceDelimitingCharacters](self, "sentenceDelimitingCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard sentenceTrailingCharacters](self, "sentenceTrailingCharacters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard sentencePrefixingCharacters](self, "sentencePrefixingCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard createAutoshiftRegularExpressionWithDelimitingCharacters:sentenceTrailingCharacters:sentencePrefixingCharacters:](self, "createAutoshiftRegularExpressionWithDelimitingCharacters:sentenceTrailingCharacters:sentencePrefixingCharacters:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTapStyleNoise:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("anyInRect")))
    {
      v7 = 1;
      goto LABEL_10;
    }
    if (!objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("normal")))
    {
      v7 = 3;
      goto LABEL_10;
    }
    if (!objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("uniform")))
    {
      v7 = 2;
      goto LABEL_10;
    }
    v6 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("none"));
    v5 = v8;
    if (v6)
    {
      v7 = 0;
LABEL_10:
      -[TypistKeyboard setTapStyle:](self, "setTapStyle:", v7);
      v5 = v8;
    }
  }

}

- (void)_setKeyboardUserPreferences:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  id v53;

  v53 = a3;
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("typeInterval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("typeInterval"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setTypeInterval:](self, "setTypeInterval:", v5);

  }
  else
  {
    -[TypistKeyboard setTypeInterval:](self, "setTypeInterval:", &unk_251A94D60);
  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("touchMajorRadius"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("touchMajorRadius"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setTouchMajorRadius:](self, "setTouchMajorRadius:", v7);

  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("pressDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("pressDuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setPressDuration:](self, "setPressDuration:", v9);

  }
  else
  {
    -[TypistKeyboard setPressDuration:](self, "setPressDuration:", &unk_251A94D60);
  }
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("fastTyping"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("fastTyping"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setFastTyping:](self, "setFastTyping:", objc_msgSend(v11, "BOOLValue"));

  }
  else
  {
    -[TypistKeyboard setFastTyping:](self, "setFastTyping:", 0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("flickTyping"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("flickTyping"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setFlickTyping:](self, "setFlickTyping:", objc_msgSend(v13, "BOOLValue"));

  }
  else
  {
    -[TypistKeyboard setFlickTyping:](self, "setFlickTyping:", 0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("usePredictionBar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("usePredictionBar"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setUsePredictionBar:](self, "setUsePredictionBar:", objc_msgSend(v15, "BOOLValue"));

  }
  else
  {
    -[TypistKeyboard setUsePredictionBar:](self, "setUsePredictionBar:", 0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("prefersPopoverKeys"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("prefersPopoverKeys"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setPrefersPopoverKeys:](self, "setPrefersPopoverKeys:", objc_msgSend(v17, "BOOLValue"));

  }
  else
  {
    -[TypistKeyboard setPrefersPopoverKeys:](self, "setPrefersPopoverKeys:", 1);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("FORCE_SPACE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("FORCE_SPACE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setSwipeForceSpace:](self, "setSwipeForceSpace:", objc_msgSend(v19, "BOOLValue"));

  }
  else
  {
    -[TypistKeyboard setSwipeForceSpace:](self, "setSwipeForceSpace:", 0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ALPHA"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ALPHA"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities validateProbability:](TypistKeyboardUtilities, "validateProbability:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setSwipeAlpha:](self, "setSwipeAlpha:", v22);

  }
  else
  {
    -[TypistKeyboard setSwipeAlpha:](self, "setSwipeAlpha:", &unk_251A94D70);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    if (v25 <= 0.0)
    {
      -[TypistKeyboard setSwipeSigma:](self, "setSwipeSigma:", &unk_251A951E0);
    }
    else
    {
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard setSwipeSigma:](self, "setSwipeSigma:", v26);

    }
  }
  else
  {
    -[TypistKeyboard setSwipeSigma:](self, "setSwipeSigma:", &unk_251A951E0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("P_PIVOT"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("P_PIVOT"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities validateProbability:](TypistKeyboardUtilities, "validateProbability:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setSwipePivotProbability:](self, "setSwipePivotProbability:", v29);

  }
  else
  {
    -[TypistKeyboard setSwipePivotProbability:](self, "setSwipePivotProbability:", &unk_251A951E0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("tapNoiseStyle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard setTapStyleNoise:](self, "setTapStyleNoise:", v30);

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("tapNoiseSigma"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31 && (objc_msgSend(v31, "doubleValue"), v33 > 0.0))
    v34 = v32;
  else
    v34 = &unk_251A951E0;
  -[TypistKeyboard setTapSigma:](self, "setTapSigma:", v34);
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("tapNoiseBounds"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35 && (objc_msgSend(v35, "doubleValue"), v37 > 0.0))
    v38 = v36;
  else
    v38 = &unk_251A951E0;
  -[TypistKeyboard setTapBounds:](self, "setTapBounds:", v38);
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("P_ERRANT"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("P_ERRANT"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities validateProbability:](TypistKeyboardUtilities, "validateProbability:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setSwipeErrantProbability:](self, "setSwipeErrantProbability:", v41);

  }
  else
  {
    -[TypistKeyboard setSwipeErrantProbability:](self, "setSwipeErrantProbability:", &unk_251A951E0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA_PIVOT"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA_PIVOT"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    if (v44 <= 0.0)
    {
      -[TypistKeyboard setSwipeErrantSigma:](self, "setSwipeErrantSigma:", &unk_251A951E0);
    }
    else
    {
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA_PIVOT"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard setSwipeErrantSigma:](self, "setSwipeErrantSigma:", v45);

    }
  }
  else
  {
    -[TypistKeyboard setSwipeErrantSigma:](self, "setSwipeErrantSigma:", &unk_251A951E0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("P_CONVEX"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("P_CONVEX"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities validateProbability:](TypistKeyboardUtilities, "validateProbability:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setSwipeConvexProbability:](self, "setSwipeConvexProbability:", v48);

  }
  else
  {
    -[TypistKeyboard setSwipeConvexProbability:](self, "setSwipeConvexProbability:", &unk_251A951E0);
  }

  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA_CONVEX"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA_CONVEX"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    if (v51 <= 0.0)
    {
      -[TypistKeyboard setSwipeConvexSigma:](self, "setSwipeConvexSigma:", &unk_251A951E0);
    }
    else
    {
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SIGMA_CONVEX"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard setSwipeConvexSigma:](self, "setSwipeConvexSigma:", v52);

    }
  }
  else
  {
    -[TypistKeyboard setSwipeConvexSigma:](self, "setSwipeConvexSigma:", &unk_251A951E0);
  }

}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _UNKNOWN **v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  objc_class *v83;
  id v84;
  TypistKeyboard *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  unsigned int v131;
  void *v132;
  unsigned int v133;
  void *v134;
  unsigned int v135;
  void *v136;
  void *v137;
  void *v138;
  unsigned int v139;
  void *v140;
  void *v141;
  void *v142;
  unsigned int v143;
  void *v144;
  void *v145;
  void *v146;
  unsigned int v147;
  void *v148;
  void *v149;
  void *v150;
  unsigned int v151;
  void *v152;
  void *v153;
  void *v154;
  unsigned int v155;
  void *v156;
  void *v157;
  void *v158;
  unsigned int v159;
  void *v160;
  void *v161;
  void *v162;
  unsigned int v163;
  void *v164;
  void *v165;
  void *v166;
  unsigned int v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  id v183;
  TypistKeyboard *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  uint64_t v198;
  void *v199;
  _BYTE v200[128];
  uint64_t v201;
  _QWORD v202[3];

  v202[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = objc_msgSend(v8, "rangeOfString:", CFSTR(";ml="));
  v10 = v8;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "substringToIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^(%@){1}(;hw=.+)?$"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = &off_251A7C000;
  +[TypistKeyboardUtilities generateKeyboardList](TypistKeyboardUtilities, "generateKeyboardList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8)
  {
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    v18 = v17 == 1;
    v13 = &off_251A7C000;
    if (v18)
    {
      -[TypistKeyboard setKeyboardID:](self, "setKeyboardID:", v8);
      -[TypistKeyboard setIsCapsLockedState:](self, "setIsCapsLockedState:", 0);
      -[TypistKeyboard setUsePopupKeys:](self, "setUsePopupKeys:", 1);
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("@"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v15;
      v125 = v19;
      v184 = self;
      if (v19)
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard setLayoutName:](self, "setLayoutName:", v20);

        -[TypistKeyboard layoutName](self, "layoutName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsString:", CFSTR("_"));

        -[TypistKeyboard layoutName](self, "layoutName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("_"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard setLanguageID:](v184, "setLanguageID:", v25);

        self = v184;
        -[TypistKeyboard layoutName](v184, "layoutName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("_"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard setRegionCode:](v184, "setRegionCode:", v28);

      }
      -[TypistKeyboard keyboardID](self, "keyboardID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("sw="));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v124 = v31;
      objc_msgSend(v31, "componentsSeparatedByString:", CFSTR(";"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard setKeyboardSW:](self, "setKeyboardSW:", v33);

      -[objc_class setTIPreferences:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "setTIPreferences:", v7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class setKeyboardUISettings:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "setKeyboardUISettings:", v7);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard _setKeyboardUserPreferences:](self, "_setKeyboardUserPreferences:", v7);
      v35 = *MEMORY[0x24BEB50C8];
      v182 = v34;
      objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x24BEB50C8]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = objc_msgSend(v36, "BOOLValue");

      v183 = v8;
      v127 = v11;
      v126 = v12;
      if ((_DWORD)v33)
      {
        +[TypistCandidateBar initWithTypistKeyboard:](TypistCandidateBar, "initWithTypistKeyboard:", self);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard setCandidatebar:](self, "setCandidatebar:", v37);

      }
      else
      {
        -[TypistKeyboard setCandidatebar:](self, "setCandidatebar:", 0);
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keyboardList"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appendKeyboard"));
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("perfConditions"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preprocessing"));
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("typeInterval"));
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("touchMajorRadius"));
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fastTyping"));
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("flickTyping"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("prefersPopoverKeys"));
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = *MEMORY[0x24BEB5058];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v187 = *MEMORY[0x24BEB5060];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = *MEMORY[0x24BEB5078];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = *MEMORY[0x24BEB50C0];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = *MEMORY[0x24BEB5070];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v35);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = *MEMORY[0x24BEB4F58];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = *MEMORY[0x24BEB5118];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = *MEMORY[0x24BEB5108];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v190 = *MEMORY[0x24BDF7960];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = *MEMORY[0x24BEB5050];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("usePredictionBar"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dictation"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = *MEMORY[0x24BEB5110];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = *MEMORY[0x24BEB4F70];
      objc_msgSend(v7, "objectForKeyedSubscript:");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("tapNoiseStyle"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FORCE_SPACE"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ALPHA"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SIGMA"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("P_PIVOT"));
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("P_ERRANT"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SIGMA_PIVOT"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("P_CONVEX"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SIGMA_CONVEX"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v136;
      v110 = v138;
      v109 = v140;
      v108 = v142;
      v107 = v144;
      v106 = v146;
      v105 = v35;
      v104 = v148;
      TYLog(CFSTR("######## SPECIFIED KEYBOARD OPTIONS FOR %@\n%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@;%@=%@"),
        v45,
        v46,
        v47,
        v48,
        v49,
        v50,
        v51,
        (char)v8);

      objc_msgSend(v182, "objectForKeyedSubscript:", v188);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v180, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v187);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend(v178, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v186);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = objc_msgSend(v175, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v185);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend(v171, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v193);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = objc_msgSend(v169, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v35);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_msgSend(v165, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v192);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend(v161, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v191);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend(v157, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v189);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend(v153, "BOOLValue");
      objc_msgSend(v181, "objectForKeyedSubscript:", v190);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v149, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v172);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v145, "BOOLValue");
      objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("LowerCaseKeyboard"));
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v141, "BOOLValue");
      objc_msgSend(v181, "objectForKeyedSubscript:", CFSTR("dictation"));
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v137, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v173);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "BOOLValue");
      objc_msgSend(v182, "objectForKeyedSubscript:", v176);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v56, "BOOLValue");
      v102 = v55;
      v101 = v52;
      v100 = v35;
      TYLog(CFSTR("######## ACTUAL KEYBOARD AND ACCESSIBILITY SETTINGS ON SYSTEM\n%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d;%@=%d; \n########"),
        v57,
        v58,
        v59,
        v60,
        v61,
        v62,
        v63,
        v188);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keyboardList"));
      v64 = objc_claimAutoreleasedReturnValue();
      if (v64
        && (v65 = (void *)v64,
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keyboardList")),
            v66 = (void *)objc_claimAutoreleasedReturnValue(),
            v67 = objc_msgSend(v66, "count"),
            v66,
            v65,
            v67))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keyboardList"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)objc_msgSend(v68, "copy");

        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v69, "count"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = 0u;
        v195 = 0u;
        v196 = 0u;
        v197 = 0u;
        v71 = v69;
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v194, v200, 16);
        if (v72)
        {
          v73 = v72;
          v74 = *(_QWORD *)v195;
          do
          {
            for (i = 0; i != v73; ++i)
            {
              if (*(_QWORD *)v195 != v74)
                objc_enumerationMutation(v71);
              v76 = *(id *)(*((_QWORD *)&v194 + 1) + 8 * i);

              v77 = objc_msgSend(v76, "rangeOfString:", CFSTR(";ml="));
              if (v77 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v10 = v76;
              }
              else
              {
                objc_msgSend(v76, "substringToIndex:", v77);
                v10 = (void *)objc_claimAutoreleasedReturnValue();

              }
              objc_msgSend(v70, "addObject:", v10);
            }
            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v194, v200, 16);
          }
          while (v73);
        }

        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v70);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v128);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v78, "isSubsetOfSet:", v79);

        if (!v80)
        {
          v86 = (void *)MEMORY[0x24BDD17C8];
          +[TypistKeyboardUtilities getMobileGestalt:](TypistKeyboardUtilities, "getMobileGestalt:", CFSTR("HWModelStr"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "stringWithFormat:", CFSTR("CRITICAL WARNING: Some keyboards specified are not valid on this device (%@)"), v87, v167, v187, v163, v186, v159, v185, v155, v193, v151, v100, v147, v192, v143, v191, v139,
            v189,
            v135,
            v190,
            v133,
            v172,
            v131,
            CFSTR("LowerCaseKeyboard"),
            v101,
            CFSTR("dictation"),
            v53,
            v173,
            v102,
            v176,
            v103,
            v104,
            v185,
            v123,
            v193,
            v122,
            v105,
            v121,
            v192,
            v120,
            v191,
            v106,
            v189,
            v107,
            v190,
            v119,
            v172,
            v118,
            CFSTR("LowerCaseKeyboard"),
            v117,
            CFSTR("usePredictionBar"),
            v116,
            CFSTR("dictation"),
            v108,
            v173,
            v109,
            v176,
            v110,
            CFSTR("tapNoiseStyle"),
            v111,
            CFSTR("FORCE_SPACE"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          v89 = (void *)MEMORY[0x24BDD1540];
          v198 = *MEMORY[0x24BDD0FD8];
          v199 = v88;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "errorWithDomain:code:userInfo:", CFSTR("TypistUnsupportedKeyboardIDError"), 2, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = v91;
          v10 = 0;
          v8 = v183;
          v11 = v127;
          v12 = v126;
          v40 = v125;
LABEL_35:

          v15 = v128;
          goto LABEL_36;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appendKeyboard"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "BOOLValue");

        v83 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
        v8 = v183;
        v11 = v127;
        v12 = v126;
        if (v82)
          v84 = (id)-[objc_class addKeyboards:](v83, "addKeyboards:", v71);
        else
          v92 = (id)-[objc_class setKeyboards:](v83, "setKeyboards:", v71);
        v85 = v184;

        v10 = 0;
        v40 = v125;
      }
      else
      {
        v8 = v183;
        v11 = v127;
        v12 = v126;
        v40 = v125;
        v85 = v184;
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appendKeyboard"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard activate:](v85, "activate:", objc_msgSend(v93, "BOOLValue"));

      -[TypistKeyboard setupSentenceBoundryStrings](v85, "setupSentenceBoundryStrings");
      -[TypistKeyboard _setupAutoShiftRegex](v85, "_setupAutoShiftRegex");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard setAutoshiftRegex:](v85, "setAutoshiftRegex:", v94);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preprocessing"));
      v95 = objc_claimAutoreleasedReturnValue();
      if (!v95
        || (v96 = (void *)v95,
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preprocessing")),
            v97 = (void *)objc_claimAutoreleasedReturnValue(),
            v98 = objc_msgSend(v97, "BOOLValue"),
            v97,
            v96,
            v98))
      {
        -[TypistKeyboard preprocessing](v85, "preprocessing");
      }
      v44 = 0;
      goto LABEL_35;
    }
  }
  v38 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v13[62], "getMobileGestalt:", CFSTR("HWModelStr"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("CRITICAL WARNING: The keyboard ID (%@) is not valid on this device (%@)"), v8, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x24BDD1540];
  v201 = *MEMORY[0x24BDD0FD8];
  v202[0] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v202, &v201, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("TypistUnsupportedKeyboardIDError"), 2, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v43;
LABEL_36:

  return v44;
}

- (id)_character_set_pattern_from_string:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("\\-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createAutoshiftRegularExpressionWithDelimitingCharacters:(id)a3 sentenceTrailingCharacters:(id)a4 sentencePrefixingCharacters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v29;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TypistKeyboard _character_set_pattern_from_string:](self, "_character_set_pattern_from_string:", CFSTR("  "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[TypistKeyboard _character_set_pattern_from_string:](self, "_character_set_pattern_from_string:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TypistKeyboard _character_set_pattern_from_string:](self, "_character_set_pattern_from_string:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringWithFormat:", CFSTR("\\A|\\n|(?:%@){3}|((?:\\b\\w++(?:\\.\\w++)*)?(?:%@))(?:%@)*(?:%@)"), v11, v13, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[TypistKeyboard _character_set_pattern_from_string:](self, "_character_set_pattern_from_string:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringWithFormat:", CFSTR("(?:%@)(?:%@)*(?:%@)*\\Z"), v15, v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v18, 16, &v29);
  v20 = v29;
  v27 = v20;
  if (!v19)
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Failed to create autoshift regular expression: %@"), v21, v22, v23, v24, v25, v26, (char)v20);

  return v19;
}

- (void)activate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  objc_class *v19;
  id v20;

  v3 = a3;
  -[TypistKeyboard keyboardID](self, "keyboardID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Switching keyboard to %@"), v6, v7, v8, v9, v10, v11, v12, (char)v5);

  v13 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  v14 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[TypistKeyboard keyboardID](self, "keyboardID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, 0);
  if (v3)
    v17 = (id)-[objc_class addKeyboards:](v13, "addKeyboards:", v16);
  else
    v18 = (id)-[objc_class setKeyboards:](v13, "setKeyboards:", v16);

  v19 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  -[TypistKeyboard keyboardID](self, "keyboardID");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[objc_class switchToKeyboard:](v19, "switchToKeyboard:", v20);

}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  -[objc_class generateKeyplaneSwitchTable:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "generateKeyplaneSwitchTable:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)generateKeyplaneSwitchTableFor10Key:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  -[objc_class generateKeyplaneSwitchTableFor10Key:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "generateKeyplaneSwitchTableFor10Key:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setOneHandedPosition:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  id v22;
  char v23;
  char v24;
  id v25;

  v25 = a3;
  TYLogl(OS_LOG_TYPE_DEFAULT, CFSTR("######## SETTING ONE HANDED (REACHABLE) KEYBOARD"), v4, v5, v6, v7, v8, v9, v23);
  v10 = +[TypistKeyboardUtilities getUIInterfaceOrientation](TypistKeyboardUtilities, "getUIInterfaceOrientation");
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") == 1)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_referenceBounds");
  if (v13 <= 320.0)
  {

LABEL_6:
    goto LABEL_7;
  }

  if (v10 != 1)
  {
LABEL_7:
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("### WARNING: setOneHandedPosition - The one handed mode is not supported on this device with current orientation. Nothing to do..."), v14, v15, v16, v17, v18, v19, v24);
    goto LABEL_8;
  }
  v20 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v25, *MEMORY[0x24BEB5068]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)-[objc_class setKeyboardUISettings:](v20, "setKeyboardUISettings:", v21);

  -[TypistKeyboard preprocessing](self, "preprocessing");
LABEL_8:

}

- (void)setFloatingKeyboard:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[TypistKeyboard isFloating](self, "isFloating") != a3)
  {
    +[TypistKeyboardUtilities setFloatingKeyboard:](TypistKeyboardUtilities, "setFloatingKeyboard:", v3);
    -[TypistKeyboard preprocessing](self, "preprocessing");
  }
}

- (BOOL)isFloating
{
  return +[TypistKeyboardUtilities isFloating](TypistKeyboardUtilities, "isFloating");
}

- (void)moveFloatingKeyboardToPosition:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  char v33;

  y = a3.y;
  x = a3.x;
  v32[2] = *MEMORY[0x24BDAC8D0];
  if (-[TypistKeyboard isFloating](self, "isFloating"))
  {
    +[TypistKeyboardUtilities floatingKeyboardDraggablePoint](TypistKeyboardUtilities, "floatingKeyboardDraggablePoint");
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate](TypistKeyboardUtilities, "touchScanRate");
    *(float *)&v17 = v17;
    objc_msgSend(v16, "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = CFSTR("ALPHA");
    LODWORD(v19) = 1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("CPPATHGEN_TIME_INTERVAL");
    v31[0] = v20;
    v31[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistPathUtilities generatePathArgumentStringWithParameters:fromPoints:](TypistPathUtilities, "generatePathArgumentStringWithParameters:fromPoints:", v21, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = CFSTR("action");
    v27[1] = CFSTR("argumentList");
    v28[0] = CFSTR("mt");
    v28[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[TypistKeyboardUtilities convertRecapCommandsFromListOfActions:](TypistKeyboardUtilities, "convertRecapCommandsFromListOfActions:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities launchRecap:](TypistKeyboardUtilities, "launchRecap:", v25);

    -[TypistKeyboard typeInterval](self, "typeInterval");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:");

    -[TypistKeyboard preprocessing](self, "preprocessing");
  }
  else
  {
    TYLog(CFSTR("Keyboard is not currently in a floating state."), v6, v7, v8, v9, v10, v11, v12, v33);
  }
}

- (BOOL)isTenKey
{
  return 0;
}

- (BOOL)isKanaKeyboard
{
  return 0;
}

- (BOOL)isHandwriting
{
  return 0;
}

- (id)keysDataForInputMode:(id)a3 andFileName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/System/Library/TextInput/TextInput_%@.bundle/%@"), GSSystemRootDirectory(), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v8, 1, 0);
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v9, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)dictationSupported
{
  void *v2;
  BOOL v3;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TypistKeyboardUtilities isDictationSupported:](TypistKeyboardUtilities, "isDictationSupported:", v2);

  return v3;
}

- (BOOL)shouldShowDictationKey
{
  return +[TypistKeyboardUtilities shouldShowDictationKey](TypistKeyboardUtilities, "shouldShowDictationKey");
}

- (BOOL)shouldShowGlobeKey
{
  return +[TypistKeyboardUtilities shouldShowGlobeKey](TypistKeyboardUtilities, "shouldShowGlobeKey");
}

- (id)getShiftPlaneForDefaultPlane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeysForObject:", CFSTR("⇧"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = &stru_251A7DE60;
  v9 = v8;

  return v9;
}

- (id)getShiftPlaneForAlternatePlane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeysForObject:", CFSTR("🔤"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeysForObject:", CFSTR("⇧"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if (v11)
    v12 = v11;
  else
    v12 = &stru_251A7DE60;
  v13 = v12;

  return v13;
}

- (id)getAlternatePlanesForDefaultPlane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_opt_new();
  -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeysForObject:", CFSTR("🔤"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "addObject:", v8);
    -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeysForObject:", CFSTR("⇧"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v3, "addObject:", v12);
    v13 = v3;

  }
  else
  {
    v13 = &unk_251A99078;
  }

  return v13;
}

- (void)preprocessing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  -[objc_class getKeyboardLayout:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyboardLayout:", self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keyPlanes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard setKeyPlanes:](self, "setKeyPlanes:", v3);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("defaultPlaneName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard setDefaultPlaneName:](self, "setDefaultPlaneName:", v4);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("planeSwitchTable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard setPlaneSwitchTable:](self, "setPlaneSwitchTable:", v5);

  if (+[TypistKeyboardData isKeyboardUIOutOfProcess](TypistKeyboardData, "isKeyboardUIOutOfProcess"))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extraKeyplaneData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extraKeyplaneData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard setupExtraKeyplaneDataIfNeeded:](self, "setupExtraKeyplaneDataIfNeeded:", v7);

    }
  }
  v8 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
  -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class switchToPlane:](v8, "switchToPlane:", v9);

  +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.2);
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  int v26;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("space-key"));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR(" ");
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsString:", CFSTR("return-key"));

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("⏎");
    }
    else
    {
      objc_msgSend(v3, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsString:", CFSTR("delete"));

      if ((v10 & 1) != 0)
      {
        v6 = CFSTR("⌫");
      }
      else
      {
        objc_msgSend(v3, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsString:", CFSTR("international"));

        if ((v12 & 1) != 0)
        {
          v6 = CFSTR("🌐");
        }
        else
        {
          objc_msgSend(v3, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsString:", CFSTR("writeboard-key"));

          if ((v14 & 1) != 0)
          {
            v6 = CFSTR("☝");
          }
          else
          {
            objc_msgSend(v3, "lowercaseString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "containsString:", CFSTR("shift"));

            if ((v16 & 1) != 0)
            {
              v6 = CFSTR("⇧");
            }
            else
            {
              objc_msgSend(v3, "lowercaseString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "containsString:", CFSTR("tab-key"));

              if ((v18 & 1) != 0)
              {
                v6 = CFSTR("⇥");
              }
              else
              {
                objc_msgSend(v3, "lowercaseString");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "containsString:", CFSTR("more-key"));

                if ((v20 & 1) != 0)
                {
                  v6 = CFSTR("🔤");
                }
                else
                {
                  objc_msgSend(v3, "lowercaseString");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v21, "containsString:", CFSTR("dictation"));

                  if ((v22 & 1) != 0)
                  {
                    v6 = CFSTR("🎙");
                  }
                  else
                  {
                    objc_msgSend(v3, "lowercaseString");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v23, "containsString:", CFSTR("undo"));

                    if ((v24 & 1) != 0)
                    {
                      v6 = CFSTR("↩");
                    }
                    else
                    {
                      objc_msgSend(v3, "lowercaseString");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v25, "containsString:", CFSTR("redo"));

                      if (v26)
                        v6 = CFSTR("↪");
                      else
                        v6 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return (id)v6;
}

- (CGPoint)calculateCoordinatesForFlickGesture:(CGPoint)a3 direction:(id)a4 offset:(float)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  float v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v21 = &unk_2494BA09E;
  v22 = x;
  v23 = y;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__TypistKeyboard_calculateCoordinatesForFlickGesture_direction_offset___block_invoke;
  v14[3] = &unk_251A7CAB0;
  v9 = v8;
  v17 = a5;
  v15 = v9;
  v16 = &v18;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v14);
  v10 = v19[4];
  v11 = v19[5];

  _Block_object_dispose(&v18, 8);
  v12 = v10;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

double __71__TypistKeyboard_calculateCoordinatesForFlickGesture_direction_offset___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  double result;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("↓")))
  {
    v2 = *(float *)(a1 + 48) + 0.0;
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("↑")))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("←")))
      {
        v3 = 0.0 - *(float *)(a1 + 48);
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("→")))
      {
        v3 = *(float *)(a1 + 48) + 0.0;
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("↙")))
      {
        v4 = *(float *)(a1 + 48);
        v5 = v4 + 0.0;
        v3 = 0.0 - v4;
        v11 = v5;
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("↘")))
          goto LABEL_15;
        v3 = *(float *)(a1 + 48) + 0.0;
        v11 = v3;
      }
      v10 = v3;
      goto LABEL_15;
    }
    v2 = 0.0 - *(float *)(a1 + 48);
  }
  v11 = v2;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", *(_QWORD *)&v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TypistKeyboardUtilities correctForRotation:orientation:](TypistKeyboardUtilities, "correctForRotation:orientation:", &v10, objc_msgSend(v6, "orientation"));

  v7 = v11;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v10
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v7 + *(double *)(v8 + 40);
  *(double *)(v8 + 40) = result;
  return result;
}

- (id)convertRepresentedStringsIfNecessary:(id)a3
{
  return a3;
}

- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[objc_class addKeyboardPopupKeys:keys:inPlane:addTo:keyplaneKeycaps:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "addKeyboardPopupKeys:keys:inPlane:addTo:keyplaneKeycaps:", self, v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_isPlaneControlKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("⇧")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("⌫")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("🔤")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("🌐")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("⇪")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("⏎"));
  }

  return v4;
}

- (CGPoint)_guardAgainstOffScreenPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  GSMainScreenPointSize();
  v7 = 0.0;
  if (x >= 0.0)
    v8 = x;
  else
    v8 = 0.0;
  if (y >= 0.0)
    v7 = y;
  if (v8 <= v5)
    v5 = v8;
  if (v7 <= v6)
    v6 = v7;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)_determinePointBetween:(CGPoint)a3 nextPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", a3.x, a3.y, 5.0);
  v10 = x - v7;
  if (v10 >= 0.0)
  {
    if (v8 >= v7)
      goto LABEL_7;
    v12 = v7 - v8;
    v13 = 2.0;
  }
  else
  {
    if (v8 <= v7)
      goto LABEL_7;
    v12 = v8 - v7;
    v13 = -2.0;
  }
  v8 = v8 + v12 * v13;
LABEL_7:
  v11 = y - v6;
  if (v11 >= 0.0)
  {
    if (v9 < v6)
    {
      v14 = v6 - v9;
      v15 = 2.0;
      goto LABEL_12;
    }
  }
  else if (v9 > v6)
  {
    v14 = v9 - v6;
    v15 = -2.0;
LABEL_12:
    v9 = v9 + v14 * v15;
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)_generateArgumentList:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v39;
  float v40;
  double v41;
  void *v42;
  float v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  float v49;
  double v50;
  void *v51;
  float v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[4];
  _QWORD v95[6];

  v95[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TypistKeyboard swipeAlpha](self, "swipeAlpha");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v82 = v6;

  -[TypistKeyboard swipeSigma](self, "swipeSigma");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[TypistKeyboard swipePivotProbability](self, "swipePivotProbability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v87 = v11;

  -[TypistKeyboard swipeErrantProbability](self, "swipeErrantProbability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v86 = v13;

  -[TypistKeyboard swipeErrantSigma](self, "swipeErrantSigma");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v85 = v15;

  -[TypistKeyboard swipeConvexProbability](self, "swipeConvexProbability");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v88 = v17;

  -[TypistKeyboard swipeConvexSigma](self, "swipeConvexSigma");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v84 = v19;

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", &stru_251A7DE60);
  v21 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    v22 = 0;
    v81 = 0.333333333;
    v80 = 0.666666667;
    v79 = 0.666666667;
    v78 = 0.333333333;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v22, *(_QWORD *)&v78, *(_QWORD *)&v79, *(_QWORD *)&v80, *(_QWORD *)&v81);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      objc_msgSend(v4, "objectAtIndexedSubscript:", v22 + 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");
      v28 = v27;

      if (!v22)
      {
        +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v25, v28, v9);
        -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v29);

      }
      +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v25, v28, v9);
      -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
      v31 = v30;
      v33 = v32;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v34);

      if (v22 <= objc_msgSend(v4, "count") - 4 && (unint64_t)objc_msgSend(v4, "count") >= 3)
      {
        if ((double)arc4random() / 4294967300.0 <= v86)
        {
          +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v31, v33, v85);
          -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
          v31 = v35;
          v33 = v36;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v37);

        }
        if ((double)arc4random() / 4294967300.0 <= v87 && v22 != 0)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v22 + 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "floatValue");
          v41 = v40;
          objc_msgSend(v4, "objectAtIndexedSubscript:", v22 + 3);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "floatValue");
          v44 = v43;

          -[TypistKeyboard _determinePointBetween:nextPoint:](self, "_determinePointBetween:nextPoint:", v31, v33, v41, v44);
          -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
          v31 = v45;
          v33 = v46;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v47);

        }
        if ((double)arc4random() / 4294967300.0 <= v88)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v22 + 2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "floatValue");
          v50 = v49;
          objc_msgSend(v4, "objectAtIndexedSubscript:", v22 + 3);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "floatValue");
          v53 = v52;

          if ((double)arc4random() / 4294967300.0 <= v88)
          {
            +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v50 * v81 + v31 * v80, v53 * v81 + v33 * v80, v84);
            -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
            v59 = v58;
            v83 = v60;
            +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v50 * v79 + v31 * v78, v53 * v79 + v33 * v78, v84);
            -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
            v55 = v61;
            v57 = v62;
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v59, v83);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v63);

          }
          else
          {
            +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", (v31 + v50) * 0.5, (v33 + v53) * 0.5, v84);
            -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
            v55 = v54;
            v57 = v56;
          }
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v55, v57);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v64);

        }
      }
      if (v22 == objc_msgSend(v4, "count") - 2)
      {
        +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v25, v28, v9);
        -[TypistKeyboard _guardAgainstOffScreenPoint:](self, "_guardAgainstOffScreenPoint:");
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v65);

      }
      v22 += 2;
    }
    while (v22 < objc_msgSend(v4, "count"));
  }
  v66 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate](TypistKeyboardUtilities, "touchScanRate");
  *(float *)&v66 = v66;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = CFSTR("ALPHA");
  HIDWORD(v68) = HIDWORD(v82);
  *(float *)&v68 = v82;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v69;
  v95[1] = v67;
  v94[1] = CFSTR("CPPATHGEN_TIME_INTERVAL");
  v94[2] = CFSTR("CPPATHGEN_TIMING_ALGORITHM");
  v94[3] = CFSTR("CPPATHGEN_VELOCITY");
  v95[2] = CFSTR("EQUIDISTANT");
  v95[3] = &unk_251A995B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  +[TypistPathUtilities generatePathArgumentStringWithParameters:fromPoints:](TypistPathUtilities, "generatePathArgumentStringWithParameters:fromPoints:", v70, v21);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:", v71);

  v91[0] = CFSTR("action");
  v91[1] = CFSTR("argumentList");
  v92[0] = CFSTR("mt");
  v92[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v72;
  v89[0] = CFSTR("action");
  v89[1] = CFSTR("time");
  v90[0] = CFSTR("wait");
  -[TypistKeyboard typeInterval](self, "typeInterval");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "stringValue");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v74;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v75;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  return v76;
}

- (id)generateSwipeStream:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];

  v4 = a3;
  if (v4)
  {
    v5 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __38__TypistKeyboard_generateSwipeStream___block_invoke;
    v24[3] = &unk_251A7C8B0;
    v24[4] = self;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v24);
    TYLog(CFSTR("Generating swipe stream for input: [%@]"), v6, v7, v8, v9, v10, v11, v12, (char)v4);
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.1);
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    v23 = (id)objc_opt_new();
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __38__TypistKeyboard_generateSwipeStream___block_invoke_334;
    v15[3] = &unk_251A7CAD8;
    v15[4] = self;
    v16 = v4;
    v17 = &v18;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v15);
    v13 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __38__TypistKeyboard_generateSwipeStream___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  objc_class *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "keyboardID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ko_KR@sw=Korean;hw=Automatic"));

  if (v3)
  {
    v4 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
    objc_msgSend(*(id *)(a1 + 32), "defaultPlaneName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[objc_class switchToPlane:](v4, "switchToPlane:", v5);

  }
}

void __38__TypistKeyboard_generateSwipeStream___block_invoke_334(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  uint64_t v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  objc_class *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  int v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  int v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  unint64_t v168;
  int v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  int v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  void *v185;
  char v186;
  void *v187;
  int v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  unint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  id obj;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _QWORD v203[2];
  _QWORD v204[2];
  const __CFString *v205;
  void *v206;
  _QWORD v207[2];
  _QWORD v208[2];
  const __CFString *v209;
  void *v210;
  const __CFString *v211;
  void *v212;
  const __CFString *v213;
  void *v214;
  _QWORD v215[2];
  _QWORD v216[2];
  const __CFString *v217;
  void *v218;
  _BYTE v219[128];
  _QWORD v220[2];
  _QWORD v221[4];

  v221[2] = *MEMORY[0x24BDAC8D0];
  v220[0] = CFSTR("action");
  v220[1] = CFSTR("time");
  v221[0] = CFSTR("wait");
  objc_msgSend(*(id *)(a1 + 32), "typeInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v221[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v221, v220, 2);
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  +[TypistKeyboardUtilities formattedKeyplaneName](TypistKeyboardUtilities, "formattedKeyplaneName");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = objc_msgSend(*(id *)(a1 + 32), "swipeForceSpace");
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v5 = 0;
    v186 = 1;
    v182 = v4;
    do
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "rangeOfComposedCharacterSequenceAtIndex:", v5);
      v8 = v5 - v6;
      if (v5 < v6)
        v8 = 0;
      if (v5 <= v6)
        v9 = v6;
      else
        v9 = v5;
      v10 = v7 - v8;
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v9, v7 - v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_multiCharacterTrailForGrapheme:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = v5;
      obj = v12;
      if (v12)
      {
        v201 = 0u;
        v202 = 0u;
        v199 = 0u;
        v200 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v200;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v200 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * i);
              v18 = objc_msgSend(v17, "length");
              objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v10 + v9, v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v17) = objc_msgSend(v19, "isEqualToString:", v17);

              if ((_DWORD)v17)
              {
                v10 += v18;
                objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v9, v10);
                v20 = objc_claimAutoreleasedReturnValue();

                v11 = (void *)v20;
              }
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
          }
          while (v14);
        }
      }
      v21 = v11;
      v22 = v21;
      if (v10)
      {
        v23 = v10 - 1;
        v24 = v21;
        v4 = v182;
        v25 = v193;
        while (1)
        {
          objc_msgSend(*(id *)(a1 + 32), "findKeyOnAnyPlane:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            break;
          objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v9, v23);
          v27 = (id)objc_claimAutoreleasedReturnValue();

          --v23;
          v24 = v27;
          if (v23 == -1)
            goto LABEL_25;
        }
        v27 = v24;

        v25 = v193 + v23;
        v22 = v27;
      }
      else
      {
        v27 = v21;
        v4 = v182;
        v25 = v193;
      }
LABEL_25:
      v28 = (void *)objc_opt_new();
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("⇪")))
      {
        objc_msgSend(v28, "addObject:", v181);
        objc_msgSend(*(id *)(a1 + 32), "generateKeystrokeStream:", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObjectsFromArray:", v29);

        if (objc_msgSend(v4, "count"))
        {
          v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v217 = CFSTR("actions");
          objc_msgSend(*(id *)(a1 + 32), "_generateArgumentList:", v4);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = v31;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v218, &v217, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v32);

          objc_msgSend(v4, "removeAllObjects");
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v181);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v28);
        v186 = 1;
        goto LABEL_117;
      }
      objc_msgSend(*(id *)(a1 + 32), "getPostfixKey:", v22);
      v33 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v33;
      objc_msgSend(*(id *)(a1 + 32), "keyPlanes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v183);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = v34;
      objc_msgSend(v36, "objectForKeyedSubscript:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "mutableCopy");

      v39 = v38;
      if (v38)
      {
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("key"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v40, "isEqualToString:", CFSTR(" ")))
        {

          v4 = v182;
          v42 = v183;
LABEL_39:
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "isEqualToString:", &stru_251A7DE60);
          v56 = v42;
          if ((v55 & 1) == 0)
          {
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v173;
          }
          v57 = v4;
          if (objc_msgSend(v183, "isEqualToString:", v56))
          {
            v58 = v39;
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("key"));
            v195 = v25;
            v59 = v28;
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isEqualToString:", CFSTR(" "));

            v28 = v59;
            v25 = v195;
            if ((v55 & 1) != 0)
              goto LABEL_46;
LABEL_45:

          }
          else
          {
            v58 = v39;
            v61 = 1;
            if ((v55 & 1) == 0)
              goto LABEL_45;
          }
LABEL_46:

          v186 |= v61;
          v194 = 0;
          v39 = v58;
          v4 = v57;
          v42 = v183;
          goto LABEL_83;
        }
        v41 = objc_msgSend(*(id *)(a1 + 32), "swipeForceSpace");

        v4 = v182;
        v42 = v183;
        if ((v41 & 1) != 0)
          goto LABEL_39;
        if (objc_msgSend(v182, "count"))
        {
          v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v213 = CFSTR("actions");
          objc_msgSend(*(id *)(a1 + 32), "_generateArgumentList:", v182);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = v44;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1);
          v45 = v39;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v46);

          v39 = v45;
          v4 = v182;
          v42 = v183;

          objc_msgSend(v182, "removeAllObjects");
        }
        v47 = 0;
        v186 = 1;
        if ((v178 & 1) != 0)
        {
          v194 = 0;
LABEL_83:
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend(v97, "isEqualToString:", &stru_251A7DE60);

          if (v98)
          {
            objc_msgSend(v39, "setObject:forKey:", v42, CFSTR("plane"));
            v186 = 1;
          }
          v99 = *(void **)(a1 + 32);
          if (v25)
          {
            objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v25 - 1, 1);
            v100 = objc_claimAutoreleasedReturnValue();
            v177 = (void *)v100;
          }
          else
          {
            v100 = 0;
          }
          objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", v9);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v99, "isSwitchedToCapitalPlane:previous:currentPlane:context:", v39, v100, v42, v101);

          if (v25)
          v103 = *(void **)(a1 + 32);
          if (v102)
          {
            objc_msgSend(*(id *)(a1 + 32), "defaultPlaneName");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "getShiftedKeyPlaneName:", v104);
          }
          else
          {
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "getExpectedPlaneNameForKey:currentPlane:", v185, v104);
          }
          v184 = objc_claimAutoreleasedReturnValue();

          v105 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class getKeyplaneDescription:](v105, "getKeyplaneDescription:", v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v186 & 1) != 0 && objc_msgSend(v4, "count"))
          {
            v108 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            v211 = CFSTR("actions");
            objc_msgSend(*(id *)(a1 + 32), "_generateArgumentList:", v4);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v212 = v109;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v212, &v211, 1);
            v110 = v28;
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "addObject:", v111);

            v28 = v110;
            objc_msgSend(v4, "removeAllObjects");
          }
          if (objc_msgSend(v107, "isLetters")
            && (v112 = *(void **)(a1 + 32),
                objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("key")),
                v113 = (void *)objc_claimAutoreleasedReturnValue(),
                LOBYTE(v112) = objc_msgSend(v112, "_isPlaneControlKey:", v113),
                v113,
                (v112 & 1) == 0))
          {
            v191 = v28;
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("type"));
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = objc_msgSend(v125, "isEqualToString:", CFSTR("popover"));

            if (v126)
            {
              v127 = (void *)MEMORY[0x24BDBCED8];
              objc_msgSend(*(id *)(a1 + 32), "keyPlanes");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "objectForKeyedSubscript:", v128);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("basekey"));
              v130 = v39;
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "objectForKeyedSubscript:", v131);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "dictionaryWithDictionary:", v132);
              v133 = (void *)objc_claimAutoreleasedReturnValue();

              v39 = v130;
              objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("x"));
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "setObject:forKey:", v134, CFSTR("x"));

              objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("y"));
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "setObject:forKey:", v135, CFSTR("y"));

              objc_msgSend(v130, "setObject:forKey:", CFSTR("tap"), CFSTR("action"));
            }
            v176 = v107;
            v136 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("x"));
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "floatValue");
            objc_msgSend(v136, "numberWithFloat:");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "addObject:", v138);

            v139 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("y"));
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "floatValue");
            objc_msgSend(v139, "numberWithFloat:");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "addObject:", v141);

            if (v194)
            {
              v179 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              v209 = CFSTR("actions");
              v207[0] = CFSTR("action");
              v207[1] = CFSTR("plane");
              v208[0] = CFSTR("waitfor");
              v142 = v39;
              objc_msgSend(v39, "objectForKeyedSubscript:");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              v208[1] = v143;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v208, v207, 2);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v194, "arrayByAddingObject:", v144);
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              v210 = v145;
              v146 = 1;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v210, &v209, 1);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "addObject:", v147);

              objc_msgSend(*(id *)(a1 + 32), "setIsCapsLockedState:", 0);
            }
            else
            {
              v142 = v39;
              v146 = (v178 | objc_msgSend(*(id *)(a1 + 32), "swipeForceSpace")) & 1;
            }
            v28 = v191;
            v4 = v182;
            if (v25 == objc_msgSend(*(id *)(a1 + 40), "length") - 1)
            {
              v157 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              v205 = CFSTR("actions");
              objc_msgSend(*(id *)(a1 + 32), "_generateArgumentList:", v182);
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              v206 = v158;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v206, &v205, 1);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "addObject:", v159);

              objc_msgSend(v182, "removeAllObjects");
              v146 = objc_msgSend(*(id *)(a1 + 32), "swipeForceSpace");
            }
            v186 = 0;
            v39 = v142;
            v78 = (void *)v184;
            v107 = v176;
          }
          else
          {
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("type"));
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend(v114, "isEqualToString:", CFSTR("basekey"));

            if (v115)
            {
              objc_msgSend(v28, "addObject:", v39);
            }
            else
            {
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("type"));
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = objc_msgSend(v116, "isEqualToString:", CFSTR("gesture"));

              if (v117)
              {
                objc_msgSend(*(id *)(a1 + 32), "keyPlanes");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v118, "objectForKeyedSubscript:", v119);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("basekey"));
                v121 = v107;
                v122 = v39;
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "objectForKeyedSubscript:", v123);
                v190 = (void *)objc_claimAutoreleasedReturnValue();

                v39 = v122;
                v107 = v121;

                objc_msgSend(v28, "addObject:", v190);
                objc_msgSend(v28, "addObject:", v39);
                objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("key"));
                v124 = objc_claimAutoreleasedReturnValue();

                v185 = (void *)v124;
              }
              else
              {
                v192 = v28;
                objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("type"));
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                v149 = objc_msgSend(v148, "isEqualToString:", CFSTR("popover"));

                if (v149)
                {
                  v150 = (void *)MEMORY[0x24BDBCED8];
                  objc_msgSend(*(id *)(a1 + 32), "keyPlanes");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v180, "objectForKeyedSubscript:", v151);
                  v152 = v39;
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v152, "objectForKeyedSubscript:", CFSTR("basekey"));
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "objectForKeyedSubscript:", v154);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v150, "dictionaryWithDictionary:", v155);
                  v156 = (void *)objc_claimAutoreleasedReturnValue();

                  v39 = v152;
                  objc_msgSend(v156, "setValue:forKey:", CFSTR("taphold"), CFSTR("action"));
                  v28 = v192;
                  objc_msgSend(v192, "addObject:", v156);
                  objc_msgSend(v192, "addObject:", v152);

                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 32), "keyPlanes");
                  v160 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("plane"));
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v160, "objectForKeyedSubscript:", v161);
                  v162 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("basekey"));
                  v163 = v39;
                  v164 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v162, "objectForKeyedSubscript:", v164);
                  v165 = (void *)objc_claimAutoreleasedReturnValue();

                  v39 = v163;
                  objc_msgSend(v192, "addObject:", v165);
                  objc_msgSend(v192, "addObject:", v163);

                  v28 = v192;
                }
              }
              v4 = v182;
            }
            objc_msgSend(v28, "addObject:", v181);
            v166 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            v203[0] = CFSTR("keystroke");
            v203[1] = CFSTR("actions");
            v204[0] = v185;
            v204[1] = v28;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v204, v203, 2);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "addObject:", v167);

            objc_msgSend(v4, "removeAllObjects");
            v186 = 1;
            v146 = 1;
            v78 = (void *)v184;
          }

          v178 = v146 != 0;
          v47 = v194;
          goto LABEL_116;
        }
        v178 = 0;
        v78 = v42;
      }
      else
      {
        objc_msgSend(CFSTR("⊎"), "stringByAppendingString:", v185);
        v48 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "keyPlanes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", v183);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = (void *)v48;
        objc_msgSend(v50, "objectForKeyedSubscript:", v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "mutableCopy");

        v39 = (void *)v52;
        if (v52)
        {
          v53 = 0;
          v42 = v183;
          v4 = v182;
          goto LABEL_82;
        }
        objc_msgSend(*(id *)(a1 + 32), "findKeyInOtherPlanes:currentPlane:", v185, v183);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)objc_msgSend(v62, "mutableCopy");

        v42 = v183;
        if (v63)
        {
          v172 = v63;
          if (objc_msgSend(*(id *)(a1 + 32), "isCapsLockedState"))
          {
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("plane"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "getShiftedKeyPlaneName:", v183);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v71, "isEqualToString:", v72);

            if (v73)
            {
              objc_msgSend(v185, "lowercaseString");
              v74 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(a1 + 32), "keyPlanes");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "objectForKeyedSubscript:", v183);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objectForKeyedSubscript:", v74);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)objc_msgSend(v76, "mutableCopy");

              v77 = v75;
              v185 = (void *)v74;
              v53 = 0;
              v4 = v182;
              goto LABEL_81;
            }
          }
          -[objc_class getKeyplaneDescription:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyplaneDescription:", v183);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
          objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("plane"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v80, "isEqualToString:", &stru_251A7DE60))
          {
            -[objc_class getKeyplaneDescription:](v79, "getKeyplaneDescription:", v183);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("plane"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[objc_class getKeyplaneDescription:](v79, "getKeyplaneDescription:", v81);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v42 = v183;

          v39 = v172;
          v4 = v182;
          if (objc_msgSend(v171, "isAlphabeticPlane")
            && objc_msgSend(v171, "isShiftKeyplane")
            && objc_msgSend(v77, "isAlphabeticPlane")
            && (objc_msgSend(v77, "isShiftKeyplane") & 1) == 0
            && (!objc_msgSend(v171, "isAlphabeticPlane")
             || !objc_msgSend(v171, "isShiftKeyplane")
             || !objc_msgSend(v77, "isAlphabeticPlane")
             || objc_msgSend(v77, "isShiftKeyplane"))
            && (!objc_msgSend(v171, "isAlphabeticPlane")
             || (objc_msgSend(v171, "isShiftKeyplane") & 1) != 0
             || !objc_msgSend(v77, "isAlphabeticPlane")
             || !objc_msgSend(v77, "isShiftKeyplane")))
          {
            v53 = 0;
LABEL_80:
            v186 = 1;
LABEL_81:

LABEL_82:
            v194 = v53;

            goto LABEL_83;
          }
          v170 = v77;
          objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("plane"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "isEqualToString:", &stru_251A7DE60);

          if (v83)
            objc_msgSend(v172, "setObject:forKey:", v183, CFSTR("plane"));
          v84 = *(void **)(a1 + 32);
          objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("plane"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v183;
          objc_msgSend(v84, "switchToPlane:fromPlane:", v85, v183);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 < 1)
          {
            v39 = v172;
            goto LABEL_77;
          }
          objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v86, "characterIsMember:", objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", v25)))goto LABEL_68;
          v196 = v53;
          v87 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", v25);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "_sanitizedStringForAutoShiftCheck:", v187);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v87) = objc_msgSend(v87, "isAutoshiftedToCapitalPlane:", v88);

          if ((_DWORD)v87)
          {
            v168 = objc_msgSend(v196, "count");
            objc_msgSend(v196, "lastObject");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("plane"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v188 = objc_msgSend(v90, "containsString:", CFSTR("small-letter"));

            if (v188)
            {
              objc_msgSend(v196, "subarrayWithRange:", 0, objc_msgSend(v196, "count") - 1);
              v91 = objc_claimAutoreleasedReturnValue();
              v86 = v196;
              goto LABEL_67;
            }
            v39 = v172;
            if (v168 >= 2)
            {
              objc_msgSend(v196, "lastObject");
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("action"));
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v92, "isEqualToString:", CFSTR("wait")) & 1) == 0)
              {

                v86 = v189;
                v53 = v196;
                goto LABEL_69;
              }
              objc_msgSend(v196, "objectAtIndexedSubscript:", v168 - 2);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("plane"));
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v169 = objc_msgSend(v94, "containsString:", CFSTR("small-letter"));

              if (v169)
              {
                v86 = v196;
                objc_msgSend(v196, "subarrayWithRange:", 0, objc_msgSend(v196, "count") - 2);
                v91 = objc_claimAutoreleasedReturnValue();
LABEL_67:
                v53 = (void *)v91;
LABEL_68:
                v39 = v172;
LABEL_69:

LABEL_77:
                v77 = v170;
                if (v53 && objc_msgSend(v53, "count"))
                {
                  objc_msgSend(v28, "addObjectsFromArray:", v53);
                  v215[0] = CFSTR("action");
                  v215[1] = CFSTR("plane");
                  v216[0] = CFSTR("waitfor");
                  objc_msgSend(v39, "objectForKeyedSubscript:");
                  v197 = v53;
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v216[1] = v95;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v216, v215, 2);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "addObject:", v96);

                  v77 = v170;
                  v53 = v197;
                  objc_msgSend(*(id *)(a1 + 32), "setIsCapsLockedState:", 0);
                }
                goto LABEL_80;
              }
              goto LABEL_75;
            }
          }
          else
          {
LABEL_75:
            v39 = v172;
          }
          v53 = v196;
          goto LABEL_77;
        }
        TYLog(CFSTR("CRITICAL WARNING: key '%@' cannot be found in any of the keyboard planes, or is not supported."), v64, v65, v66, v67, v68, v69, v70, (char)v185);

        v39 = 0;
        v47 = 0;
        v78 = v183;
        v4 = v182;
      }
LABEL_116:

      v22 = v185;
      v183 = v78;
LABEL_117:

      v5 = v25 + 1;
    }
    while (v5 < objc_msgSend(*(id *)(a1 + 40), "length"));
  }

}

- (id)generateKeystrokeStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  TypistKeyboard *v37;
  unint64_t v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  __CFString *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v99;
  void *v100;
  _BOOL4 v101;
  void *v102;
  const __CFString *v103;
  objc_class *v104;
  void *v105;
  void *v106;
  void *v107;
  BOOL v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  double v144;
  double v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  double v149;
  double v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  unint64_t v155;
  TypistKeyboard *v156;
  void *v157;
  void *v158;
  __CFString *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  void *v172;
  void *v173;
  char v174;
  void *v175;
  void *v176;
  void *v177;
  void *v179;
  __CFString *v180;
  void *v181;
  id v182;
  unint64_t v183;
  void *v184;
  void *v185;
  __CFString *v186;
  TypistKeyboard *v187;
  void *v188;
  void *v189;
  void *v190;
  int v191;
  __CFString *v192;
  __CFString *v193;
  void *v194;
  uint64_t v195;
  int v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id obj;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _QWORD v207[2];
  _QWORD v208[2];
  _QWORD v209[2];
  _QWORD v210[2];
  _QWORD v211[2];
  _QWORD v212[2];
  _QWORD v213[2];
  _QWORD v214[2];
  _QWORD v215[2];
  _QWORD v216[2];
  _QWORD v217[2];
  _QWORD v218[2];
  _BYTE v219[128];
  uint64_t v220;

  v220 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isEqualToString:", &stru_251A7DE60) & 1) != 0)
  {
    v182 = 0;
    goto LABEL_148;
  }
  +[TypistKeyboardUtilities formattedKeyplaneName](TypistKeyboardUtilities, "formattedKeyplaneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Generating keystroke (tap) stream for input: [%@]"), v7, v8, v9, v10, v11, v12, v13, (char)v5);
  v182 = (id)objc_opt_new();
  if (objc_msgSend(v5, "length"))
  {
    v196 = 0;
    v14 = 0;
    v180 = &stru_251A7DE60;
    v187 = self;
    while (1)
    {
      v198 = v6;
      objc_msgSend(v5, "substringWithRange:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("‍")))
      {
        v16 = objc_msgSend(v5, "length") - 1;

        if (v14 < v16)
        {
          objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", v14 + 1);
          v18 = v17 + 1;
          v19 = v14;
          goto LABEL_11;
        }
      }
      else
      {

      }
      v19 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", v14);
LABEL_11:
      v20 = v14 - v19;
      if (v14 < v19)
        v20 = 0;
      v195 = v14;
      if (v14 <= v19)
        v21 = v19;
      else
        v21 = v14;
      v22 = v18 - v20;
      objc_msgSend(v5, "substringWithRange:", v21, v18 - v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard _multiCharacterTrailForGrapheme:](v187, "_multiCharacterTrailForGrapheme:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v24;
      if (v24)
      {
        v205 = 0u;
        v206 = 0u;
        v203 = 0u;
        v204 = 0u;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v203, v219, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v204;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v204 != v27)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * i);
              v30 = objc_msgSend(v29, "length");
              objc_msgSend(v5, "substringWithRange:", v22 + v21, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v29) = objc_msgSend(v31, "isEqualToString:", v29);

              if ((_DWORD)v29)
              {
                v22 += v30;
                objc_msgSend(v5, "substringWithRange:", v21, v22);
                v32 = objc_claimAutoreleasedReturnValue();

                v23 = (void *)v32;
              }
            }
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v219, 16);
          }
          while (v26);
        }
      }
      v33 = v23;
      v34 = v33;
      if (v22)
      {
        v35 = v22 - 1;
        v36 = v33;
        v37 = v187;
        v38 = 0x24BDBC000uLL;
        while (1)
        {
          -[TypistKeyboard findKeyOnAnyPlane:](v187, "findKeyOnAnyPlane:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            break;
          objc_msgSend(v5, "substringWithRange:", v21, v35);
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

          --v35;
          v36 = v40;
          if (v35 == -1)
            goto LABEL_33;
        }
        v40 = v36;

        v195 += v35;
        v34 = v40;
      }
      else
      {
        v40 = v33;
        v37 = v187;
        v38 = 0x24BDBC000;
      }
LABEL_33:
      v186 = v40;
      if ((v196 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v180, v34);
        v41 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (-[TypistKeyboard isTenKey](v37, "isTenKey")
        || -[TypistKeyboard isKanaKeyboard](v37, "isKanaKeyboard")
        || (-[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("↓")) & 1) == 0
        && (-[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("↑")) & 1) == 0
        && (-[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("←")) & 1) == 0
        && (-[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("→")) & 1) == 0
        && (-[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("↙")) & 1) == 0
        && !-[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("↘")))
      {
        if (!-[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("⇪")))
          goto LABEL_40;
        -[TypistKeyboard keyPlanes](v37, "keyPlanes");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", v198);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v34);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
        {
          -[TypistKeyboard setIsCapsLockedState:](v37, "setIsCapsLockedState:", 1);
          v41 = CFSTR("⇧");
LABEL_35:
          v191 = v196 ^ 1;

          v34 = (__CFString *)v41;
        }
        else
        {
LABEL_40:
          v191 = 0;
        }
        v192 = (__CFString *)objc_opt_new();
        v45 = (void *)-[__CFString copy](v34, "copy");
        -[TypistKeyboard getPostfixKey:](v37, "getPostfixKey:", v34);
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[TypistKeyboard getActionForKeystroke:fromKeyPlane:](v37, "getActionForKeystroke:fromKeyPlane:", v46, v198);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "mutableCopy");

        v197 = (void *)v48;
        v188 = v45;
        v193 = v46;
        if (v48)
        {
          v49 = v192;
          goto LABEL_90;
        }
        -[TypistKeyboard findKeyInOtherPlanes:currentPlane:](v37, "findKeyInOtherPlanes:currentPlane:", v46, v198);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "mutableCopy");

        v49 = v192;
        v197 = v51;
        if (!v51)
          goto LABEL_151;
        if (-[TypistKeyboard isCapsLockedState](v37, "isCapsLockedState"))
        {
          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("plane"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[TypistKeyboard getShiftedKeyPlaneName:](v37, "getShiftedKeyPlaneName:", v198);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v52, "isEqualToString:", v53);

          if (v54)
          {
            -[__CFString lowercaseString](v46, "lowercaseString");
            v55 = objc_claimAutoreleasedReturnValue();

            -[TypistKeyboard keyPlanes](v37, "keyPlanes");
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v194, "objectForKeyedSubscript:", v198);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = (__CFString *)v55;
            objc_msgSend(v56, "objectForKeyedSubscript:", v55);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "mutableCopy");

            v193 = v57;
            v197 = (void *)v59;
            v45 = v188;
            if (!v59)
            {
LABEL_151:
              -[TypistKeyboard attemptToFindKeystrokeAsSecondaryDisplay:](v37, "attemptToFindKeystrokeAsSecondaryDisplay:", v193);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = (void *)objc_msgSend(v60, "mutableCopy");

              objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("plane"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v198, "isEqualToString:", v62) & 1) != 0)
              {
                v197 = v61;
                v40 = v186;
              }
              else
              {
                objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("plane"));
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                -[TypistKeyboard switchToPlane:fromPlane:](v37, "switchToPlane:fromPlane:", v66, v198);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v67, "count"))
                {
                  v197 = v61;
                }
                else
                {

                  v197 = 0;
                }
                v40 = v186;

                v45 = v188;
              }

              if (!v197)
              {
                v63 = v193;
                -[TypistKeyboard tryAlternateVariationsOfKey:](v37, "tryAlternateVariationsOfKey:", v193);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                if (v90)
                  objc_msgSend(v182, "addObjectsFromArray:", v90);
                else
                  TYLog(CFSTR("CRITICAL WARNING: key '%@' cannot be found in any of the keyboard planes, or is not supported."), v83, v84, v85, v86, v87, v88, v89, (char)v193);
                v65 = obj;
                v190 = v198;
                v64 = v195;
                goto LABEL_143;
              }
            }
          }
        }
        objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "isEqualToString:", &stru_251A7DE60);

        if (v69)
          objc_msgSend(v197, "setObject:forKey:", v198, CFSTR("plane"));
        objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v70, "isEqualToString:", v198) & 1) != 0)
        {
          v45 = v188;
          goto LABEL_89;
        }
        objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard switchToPlane:fromPlane:](v37, "switchToPlane:fromPlane:", v71, v198);
        v189 = (void *)objc_claimAutoreleasedReturnValue();

        if (v195 < 1)
        {
          v45 = v188;
          v72 = v189;
          goto LABEL_76;
        }
        v45 = v188;
        v72 = v189;
        if (!v189)
          goto LABEL_76;
        objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v73, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v195)))
        {
          objc_msgSend(v5, "substringToIndex:", v195);
          v74 = v73;
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[TypistKeyboard _sanitizedStringForAutoShiftCheck:](v37, "_sanitizedStringForAutoShiftCheck:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = -[TypistKeyboard isAutoshiftedToCapitalPlane:](v37, "isAutoshiftedToCapitalPlane:", v76);

          if (!v77)
          {
            v45 = v188;
            goto LABEL_88;
          }
          v183 = objc_msgSend(v189, "count");
          objc_msgSend(v189, "lastObject");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("plane"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "containsString:", CFSTR("small-letter"));

          if ((v80 & 1) != 0)
          {
            v81 = -1;
            goto LABEL_72;
          }
          v91 = v183 - 2;
          v45 = v188;
          if (v183 < 2)
            goto LABEL_88;
          objc_msgSend(v189, "lastObject");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("action"));
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v184, "isEqualToString:", CFSTR("wait")) & 1) != 0)
          {
            objc_msgSend(v189, "objectAtIndexedSubscript:", v91);
            v179 = v73;
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("plane"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v93, "containsString:", CFSTR("small-letter"));

            if (v94)
            {
              v81 = -2;
LABEL_72:
              objc_msgSend(v189, "subarrayWithRange:", 0, objc_msgSend(v189, "count") + v81);
              v82 = objc_claimAutoreleasedReturnValue();

              v72 = (void *)v82;
              v45 = v188;
LABEL_76:
              if (!v72)
              {
LABEL_90:
                objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                v98 = objc_msgSend(v97, "isEqualToString:", &stru_251A7DE60);

                if (v98)
                  objc_msgSend(v197, "setObject:forKey:", v198, CFSTR("plane"));
                if (v195)
                {
                  objc_msgSend(v5, "substringWithRange:", v195 - 1, 1);
                  v99 = objc_claimAutoreleasedReturnValue();
                  v181 = (void *)v99;
                }
                else
                {
                  v99 = 0;
                }
                objc_msgSend(v5, "substringToIndex:", v21);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = -[TypistKeyboard isSwitchedToCapitalPlane:previous:currentPlane:context:](v37, "isSwitchedToCapitalPlane:previous:currentPlane:context:", v197, v99, v198, v100);

                if (v195)
                if (v101)
                {
                  -[TypistKeyboard defaultPlaneName](v37, "defaultPlaneName");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TypistKeyboard getShiftedKeyPlaneName:](v37, "getShiftedKeyPlaneName:", v102);
                  v190 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if ((v191 & 1) != 0)
                    v103 = CFSTR("⇪");
                  else
                    v103 = v193;
                  objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TypistKeyboard getExpectedPlaneNameForKey:currentPlane:](v37, "getExpectedPlaneNameForKey:currentPlane:", v103, v102);
                  v190 = (void *)objc_claimAutoreleasedReturnValue();
                }

                v104 = +[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData");
                objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                -[objc_class getKeyplaneDescription:](v104, "getKeyplaneDescription:", v105);
                v185 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("type"));
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v105) = objc_msgSend(v106, "isEqualToString:", CFSTR("basekey"));

                if ((_DWORD)v105)
                {
                  if (-[TypistKeyboard tapStyle](v37, "tapStyle"))
                  {
                    if (objc_msgSend(v185, "isLetters"))
                    {
                      objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("key"));
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      v108 = -[TypistKeyboard _isPlaneControlKey:](v37, "_isPlaneControlKey:", v107);

                      if (!v108)
                      {
                        objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("x"));
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v109, "doubleValue");
                        v111 = v110;

                        objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("y"));
                        v112 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v112, "doubleValue");
                        v114 = v113;

                        if (-[TypistKeyboard tapStyle](v37, "tapStyle") == 1)
                        {
                          objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("rect"));
                          v115 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v115, "CGRectValue");
                          +[TypistKeyboardUtilities generateUniformPointWithMean:andBounds:](TypistKeyboardUtilities, "generateUniformPointWithMean:andBounds:", v111, v114, v116 * 0.5, v117 * 0.5);
                          v119 = v118;
                          v121 = v120;

                          goto LABEL_120;
                        }
                        if (-[TypistKeyboard tapStyle](v37, "tapStyle") == 2)
                        {
                          -[TypistKeyboard tapBounds](v37, "tapBounds");
                          v143 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v143, "doubleValue");
                          v145 = v144;

                          +[TypistKeyboardUtilities generateUniformPointWithMean:andBounds:](TypistKeyboardUtilities, "generateUniformPointWithMean:andBounds:", v111, v114, v145, v145);
                          goto LABEL_119;
                        }
                        v119 = 0;
                        v121 = 0;
                        if (-[TypistKeyboard tapStyle](v37, "tapStyle") == 3)
                        {
                          -[TypistKeyboard tapSigma](v37, "tapSigma");
                          v148 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v148, "doubleValue");
                          v150 = v149;

                          +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", v111, v114, v150);
LABEL_119:
                          v119 = v146;
                          v121 = v147;
                        }
LABEL_120:
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v119);
                        v151 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v197, "setObject:forKeyedSubscript:", v151, CFSTR("x"));

                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v121);
                        v152 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v197, "setObject:forKeyedSubscript:", v152, CFSTR("y"));

                      }
                    }
                  }
                  -[__CFString addObject:](v49, "addObject:", v197);
                  if ((v191 & 1) != 0)
                  {
                    -[__CFString addObject:](v49, "addObject:", &unk_251A99290);
                    -[__CFString addObject:](v49, "addObject:", v197);
                  }
                }
                else
                {
                  objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("type"));
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  v123 = objc_msgSend(v122, "isEqualToString:", CFSTR("gesture"));

                  if (v123)
                  {
                    -[TypistKeyboard keyPlanes](v37, "keyPlanes");
                    v199 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
                    v124 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v199, "objectForKeyedSubscript:", v124);
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("basekey"));
                    v126 = v45;
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v125, "objectForKeyedSubscript:", v127);
                    v128 = (void *)objc_claimAutoreleasedReturnValue();

                    v45 = v126;
                    -[__CFString addObject:](v192, "addObject:", v128);
                    -[__CFString addObject:](v192, "addObject:", v197);
                    objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("key"));
                    v129 = objc_claimAutoreleasedReturnValue();

                    v49 = v192;
                    v193 = (__CFString *)v129;
                  }
                  else
                  {
                    objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("type"));
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    v131 = objc_msgSend(v130, "isEqualToString:", CFSTR("popover"));

                    if (v131)
                    {
                      v132 = (void *)MEMORY[0x24BDBCED8];
                      -[TypistKeyboard keyPlanes](v37, "keyPlanes");
                      v200 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v200, "objectForKeyedSubscript:", v133);
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("basekey"));
                      v135 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v134, "objectForKeyedSubscript:", v135);
                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v132, "dictionaryWithDictionary:", v136);
                      v137 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v137, "setValue:forKey:", CFSTR("taphold"), CFSTR("action"));
                      v49 = v192;
                      -[__CFString addObject:](v192, "addObject:", v137);
                      -[__CFString addObject:](v192, "addObject:", v197);

                    }
                    else
                    {
                      -[TypistKeyboard keyPlanes](v37, "keyPlanes");
                      v138 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
                      v139 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v138, "objectForKeyedSubscript:", v139);
                      v140 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("basekey"));
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v140, "objectForKeyedSubscript:", v141);
                      v142 = (void *)objc_claimAutoreleasedReturnValue();

                      v49 = v192;
                      -[__CFString addObject:](v192, "addObject:", v142);
                      -[__CFString addObject:](v192, "addObject:", v197);

                    }
                    v45 = v188;
                  }
                }
                -[TypistKeyboard addAccentKeyAction:](v37, "addAccentKeyAction:", v45);
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                v201 = v153;
                if (v153)
                {
                  v154 = v153;
                  if (objc_msgSend(v153, "count"))
                  {
                    v155 = 0;
                    do
                    {
                      v215[0] = CFSTR("action");
                      v215[1] = CFSTR("time");
                      v216[0] = CFSTR("wait");
                      v156 = v37;
                      -[TypistKeyboard typeInterval](v37, "typeInterval");
                      v157 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v157, "stringValue");
                      v158 = (void *)objc_claimAutoreleasedReturnValue();
                      v216[1] = v158;
                      objc_msgSend(*(id *)(v38 + 3696), "dictionaryWithObjects:forKeys:count:", v216, v215, 2);
                      v159 = v49;
                      v160 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString addObject:](v159, "addObject:", v160);

                      objc_msgSend(v154, "objectAtIndexedSubscript:", v155);
                      v161 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v161, "objectForKeyedSubscript:", CFSTR("type"));
                      v162 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(v160) = objc_msgSend(v162, "isEqualToString:", CFSTR("gesture"));

                      if ((_DWORD)v160)
                      {
                        -[TypistKeyboard keyPlanes](v156, "keyPlanes");
                        v163 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v161, "objectForKeyedSubscript:", CFSTR("plane"));
                        v164 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v163, "objectForKeyedSubscript:", v164);
                        v165 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v161, "objectForKeyedSubscript:", CFSTR("basekey"));
                        v166 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v165, "objectForKeyedSubscript:", v166);
                        v167 = (void *)objc_claimAutoreleasedReturnValue();

                        -[__CFString addObject:](v159, "addObject:", v167);
                        v38 = 0x24BDBC000;
                      }
                      -[__CFString addObject:](v159, "addObject:", v161);

                      ++v155;
                      v154 = v201;
                      v49 = v159;
                      v37 = v156;
                    }
                    while (objc_msgSend(v201, "count") > v155);
                  }
                }
                v64 = v195;
                if (-[TypistKeyboard fastTyping](v37, "fastTyping")
                  || (-[__CFString isEqualToString:](v193, "isEqualToString:", CFSTR("🔤")) & 1) != 0
                  || (-[__CFString isEqualToString:](v193, "isEqualToString:", CFSTR("⇧")) & 1) != 0
                  || (-[__CFString isEqualToString:](v193, "isEqualToString:", CFSTR(" ")) & 1) != 0
                  || (-[__CFString isEqualToString:](v193, "isEqualToString:", CFSTR("⏎")) & 1) != 0)
                {
                  goto LABEL_138;
                }
                if ((v191 & 1) != 0)
                {
                  -[TypistKeyboard fastTyping](v37, "fastTyping");
                  v45 = v188;
                  goto LABEL_140;
                }
                objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                -[TypistKeyboard getShiftPlaneForDefaultPlane](v37, "getShiftPlaneForDefaultPlane");
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                v170 = objc_msgSend(v168, "isEqualToString:", v169);

                if (!v170)
                {
LABEL_138:
                  v45 = v188;
                  if (((v191 | -[TypistKeyboard fastTyping](v37, "fastTyping")) & 1) != 0
                    || (objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane")),
                        v173 = (void *)objc_claimAutoreleasedReturnValue(),
                        v174 = objc_msgSend(v190, "isEqualToString:", v173),
                        v173,
                        (v174 & 1) != 0))
                  {
LABEL_140:
                    v209[0] = CFSTR("action");
                    v209[1] = CFSTR("time");
                    v210[0] = CFSTR("wait");
                    -[TypistKeyboard typeInterval](v37, "typeInterval");
                    v175 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v175, "stringValue");
                    v176 = (void *)objc_claimAutoreleasedReturnValue();
                    v210[1] = v176;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v210, v209, 2);
                    v172 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v211[0] = CFSTR("action");
                    v211[1] = CFSTR("plane");
                    v212[0] = CFSTR("waitfor");
                    v212[1] = v190;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v212, v211, 2);
                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                }
                else
                {
                  v213[0] = CFSTR("action");
                  v213[1] = CFSTR("plane");
                  v214[0] = CFSTR("waitfor");
                  -[TypistKeyboard defaultPlaneName](v37, "defaultPlaneName");
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  v214[1] = v171;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v214, v213, 2);
                  v172 = (void *)objc_claimAutoreleasedReturnValue();

                  v45 = v188;
                }
                -[__CFString addObject:](v49, "addObject:", v172);

                v207[0] = CFSTR("keystroke");
                v207[1] = CFSTR("actions");
                v208[0] = v45;
                v208[1] = v49;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v208, v207, 2);
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v182, "addObject:", v177);

                v65 = obj;
                v40 = v186;
                v63 = v193;
                v90 = v197;
LABEL_143:

                v196 = 0;
                v6 = v190;
                goto LABEL_144;
              }
            }
            else
            {
              v45 = v188;
            }
LABEL_88:
            -[__CFString addObjectsFromArray:](v192, "addObjectsFromArray:", v72);
            v217[1] = CFSTR("plane");
            v218[0] = CFSTR("waitfor");
            v217[0] = CFSTR("action");
            objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("plane"));
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v218[1] = v95;
            objc_msgSend(*(id *)(v38 + 3696), "dictionaryWithObjects:forKeys:count:", v218, v217, 2);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString addObject:](v192, "addObject:", v96);

            -[TypistKeyboard setIsCapsLockedState:](v37, "setIsCapsLockedState:", 0);
            v70 = v72;
LABEL_89:

            goto LABEL_90;
          }

        }
        goto LABEL_88;
      }
      v63 = v34;
      v196 = 1;
      v49 = v180;
      v180 = v63;
      v64 = v195;
      v6 = v198;
      v65 = obj;
LABEL_144:

      v14 = v64 + 1;
      if (v14 >= objc_msgSend(v5, "length"))
        goto LABEL_147;
    }
  }
  v180 = &stru_251A7DE60;
LABEL_147:

LABEL_148:
  return v182;
}

- (CGAffineTransform)_determineTransformationInFrame:(SEL)a3 segmentStart:(CGRect)a4 totalSegmentWidth:(double)a5 scale:(unint64_t)a6 characterHeight:(double)a7 characterWidth:(double)a8 dimensions:(double)a9 isLatex:(id)a10
{
  _BOOL4 v11;
  double height;
  double width;
  double y;
  double x;
  id v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  double v27;
  int64_t v28;
  void *v29;
  BOOL v30;
  double v31;
  double v32;
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
  double v47;
  double v48;
  CGAffineTransform *result;
  double v50;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v11 = a11;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a10;
  objc_msgSend(v21, "rotationBias");
  if (v22 == 0.0)
    v22 = 0.0;
  v50 = v22;
  v23 = objc_msgSend(v21, "primaryWritingDirection");
  v24 = objc_msgSend(v21, "segmentWritingDirection");
  v25 = MEMORY[0x24BDBD8B8];
  v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v26;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v25 + 32);
  if (v23 == 2)
    v27 = width;
  else
    v27 = -0.0;
  v28 = +[TypistKeyboardUtilities getUIInterfaceOrientation](TypistKeyboardUtilities, "getUIInterfaceOrientation");
  +[TypistKeyboardUtilities getOneHandedKeyboardHandBias](TypistKeyboardUtilities, "getOneHandedKeyboardHandBias");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("Right")))
    v30 = 0;
  else
    v30 = v28 == 1;
  if (v30)
  {
    +[TypistKeyboardUtilities findKeyBoundsInKeyboard:](TypistKeyboardUtilities, "findKeyBoundsInKeyboard:", CFSTR("Candidate-Selection"));
    if (v23 == 2)
      v27 = width;
    else
      v27 = v31;
  }
  v32 = x + v27;
  objc_msgSend(v21, "writingOriginOffsetX");
  v34 = v33;
  objc_msgSend(v21, "writingOriginOffsetY");
  v35 = v32 - v34 * a7;
  v37 = y + v36 * a7;
  if (v23 != 2 || v24 != 2)
  {
    v35 = v32 + v34 * a7;
    y = v37;
  }
  v38 = -(height + -a8 * a7);
  if (height - a8 * a7 >= 0.0)
    v38 = height - a8 * a7;
  v39 = v35 + a5;
  if (v24 == 2)
    v39 = v35 + a5 + (double)a6;
  v40 = v35 - a5;
  if (v24 != 2)
    v40 = v40 - (double)a6;
  v41 = v38 * 0.5;
  if (v23 == 2)
    v42 = v40;
  else
    v42 = v39;
  if (v11)
    v43 = -0.0;
  else
    v43 = v38 * 0.5;
  GSMainScreenPointSize();
  switch(v28)
  {
    case 2:
      v46 = v44 - v42;
      v42 = v45 - y - v41;
      v47 = 180.0;
      break;
    case 3:
      v46 = v44 - y - v41;
      v47 = 90.0;
      break;
    case 4:
      v46 = v41 + y;
      v42 = v45 - v42;
      v47 = 270.0;
      break;
    default:
      v46 = v42;
      v42 = y + v43;
      v48 = v50;
      goto LABEL_36;
  }
  v48 = v50 + v47;
LABEL_36:
  CGAffineTransformMakeRotation(&t1, v48 * 3.14159265 / 180.0);
  t2.a = a7;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.d = a7;
  t2.tx = v46;
  t2.ty = v42;
  CGAffineTransformConcat(retstr, &t1, &t2);

  return result;
}

- (CGRect)_determineHandwritingBound
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5
{
  return -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:](self, "generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:", a3, a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0.0);
}

- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 rotationBias:(double)a6
{
  return -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:](self, "generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:", a3, a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6);
}

- (id)_convertCollationCharacters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%C"), 65010);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("الله"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dimensionsForLatex:(id)a3 formula:(id)a4 withPathMap:(id)a5 regionCode:(id)a6 isCursive:(BOOL)a7 cumulativeWidth:(unint64_t)a8 totalWidth:(unint64_t)a9 primaryTextDirection:(unint64_t)a10 rotationBias:(double)a11 characterByCharacterPaths:(id)a12
{
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  unint64_t v49;
  TYHandwritingDimensions *v50;
  uint64_t v52;
  unsigned int v53;
  void *v54;
  id v55;
  id v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v16 = a10;
  v63 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a12;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v17, "offsetY");
  v23 = v22;
  objc_msgSend(v18, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "charactersRequiringExtentionCharacterSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndex:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "characterIsMember:", objc_msgSend(v26, "characterAtIndex:", 0));

    objc_msgSend(v24, "objectAtIndex:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v28);
    v52 = objc_claimAutoreleasedReturnValue();

    v54 = v24;
    objc_msgSend(v24, "objectAtIndex:", 0);
    if (a7)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[TypistPathUtilities getTextClustersFrom:forCharacters:](TypistPathUtilities, "getTextClustersFrom:forCharacters:", v19, v29);
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "graphemeArray");
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v27;
    v55 = v18;
    v56 = v17;

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v34)
    {
      v35 = v34;
      v31 = 0;
      v36 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v59 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKeyedSubscript:", v38);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            objc_msgSend(v20, "addObject:", v45);
            if (objc_msgSend(v45, "width") >= 1)
            {
              objc_msgSend(v45, "perCharacterScale");
              if (v46 > 0.0)
              {
                v47 = (double)objc_msgSend(v45, "width");
                objc_msgSend(v45, "perCharacterScale");
                v49 = llround(v48 * v47);
                v31 += v49;
                a8 += v49;
              }
            }
          }
          else
          {
            TYLogl(OS_LOG_TYPE_ERROR, CFSTR("No path data found for character: [%@]"), v39, v40, v41, v42, v43, v44, v38);
          }

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v35);
    }
    else
    {
      v31 = 0;
    }

    v21 = (void *)v52;
    v18 = v55;
    v17 = v56;
    v24 = v54;
    v16 = a10;
    v30 = v53;
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  v50 = objc_alloc_init(TYHandwritingDimensions);
  -[TYHandwritingDimensions setWritingOriginOffsetX:](v50, "setWritingOriginOffsetX:", 0.0);
  -[TYHandwritingDimensions setWritingOriginOffsetY:](v50, "setWritingOriginOffsetY:", 0.0);
  -[TYHandwritingDimensions setTotalWidth:](v50, "setTotalWidth:", (double)a9);
  -[TYHandwritingDimensions setCumulativeWidth:](v50, "setCumulativeWidth:", (double)a8);
  -[TYHandwritingDimensions setSegmentWidth:](v50, "setSegmentWidth:", (double)v31);
  -[TYHandwritingDimensions setFixedScaleHeight:](v50, "setFixedScaleHeight:", 1024.0);
  -[TYHandwritingDimensions setRotationBias:](v50, "setRotationBias:", a11);
  objc_msgSend(v21, "rectValue");
  -[TYHandwritingDimensions setRect:](v50, "setRect:");
  -[TYHandwritingDimensions setPrimaryWritingDirection:](v50, "setPrimaryWritingDirection:", v16);
  -[TYHandwritingDimensions setSegmentWritingDirection:](v50, "setSegmentWritingDirection:", 1);
  -[TYHandwritingDimensions setOffsetY:](v50, "setOffsetY:", v23);
  -[TYHandwritingDimensions setRequiresExtension:](v50, "setRequiresExtension:", v30);

  return v50;
}

- (id)_dimensionsForText:(id)a3 withPathMap:(id)a4 regionCode:(id)a5 isCursive:(BOOL)a6 cumulativeWidth:(unint64_t *)a7 totalWidth:(unint64_t)a8 segmentTextDirection:(unint64_t)a9 primaryTextDirection:(unint64_t)a10 rotationBias:(double)a11 characterByCharacterPaths:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  double v39;
  double v40;
  TYHandwritingDimensions *v41;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a12;
  v44 = v19;
  if (a6)
    +[TypistPathUtilities getTextClustersFrom:withRegion:](TypistPathUtilities, "getTextClustersFrom:withRegion:", v17, v19);
  else
    objc_msgSend(v17, "graphemeArray");
  v45 = v17;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v21);
        v27 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", v27);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          objc_msgSend(v20, "addObject:", v34);
          if (objc_msgSend(v34, "width") >= 1)
          {
            objc_msgSend(v34, "perCharacterScale");
            if (v35 > 0.0)
            {
              v36 = (double)objc_msgSend(v34, "width");
              objc_msgSend(v34, "perCharacterScale");
              v38 = llround(v37 * v36);
              *a7 += v38;
              v24 += v38;
            }
          }
        }
        else
        {
          TYLogl(OS_LOG_TYPE_ERROR, CFSTR("No path data found for character: [%@]"), v28, v29, v30, v31, v32, v33, v27);
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  v39 = 0.0;
  if (a9 == 2)
  {
    +[TypistPathUtilities getWidthOfFirstCharacterInString:](TypistPathUtilities, "getWidthOfFirstCharacterInString:", v45);
    v39 = v40;
  }
  v41 = objc_alloc_init(TYHandwritingDimensions);
  -[TYHandwritingDimensions setWritingOriginOffsetX:](v41, "setWritingOriginOffsetX:", v39);
  -[TYHandwritingDimensions setWritingOriginOffsetY:](v41, "setWritingOriginOffsetY:", 0.0);
  -[TYHandwritingDimensions setTotalWidth:](v41, "setTotalWidth:", (double)a8);
  -[TYHandwritingDimensions setCumulativeWidth:](v41, "setCumulativeWidth:", (double)*a7);
  -[TYHandwritingDimensions setSegmentWidth:](v41, "setSegmentWidth:", (double)v24);
  -[TYHandwritingDimensions setFixedScaleHeight:](v41, "setFixedScaleHeight:", 1024.0);
  -[TYHandwritingDimensions setRotationBias:](v41, "setRotationBias:", a11);
  -[TYHandwritingDimensions setPrimaryWritingDirection:](v41, "setPrimaryWritingDirection:", a10);
  -[TYHandwritingDimensions setSegmentWritingDirection:](v41, "setSegmentWritingDirection:", a9);

  return v41;
}

- (id)generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 rotationBias:(double)a6 isCursive:(BOOL)a7
{
  _BOOL8 v7;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  TYParsedScribbleData *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t i;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  id v91;
  id obj;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  TYParsedScribbleData *v101;
  _BOOL4 v102;
  TypistKeyboard *v103;
  double height;
  _BOOL4 v106;
  id v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  CGAffineTransform v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;
  CGRect v127;
  CGRect v128;

  v7 = a7;
  height = a4.size.height;
  v106 = a5;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v126 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isScribbleActive");

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentLanguageIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "countryCode");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v108)
    {
      objc_msgSend(v18, "scriptCode");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v108)
      {
        objc_msgSend(v18, "languageCode");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    -[TypistKeyboard keyboardID](self, "keyboardID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities getRegionCodeFromKeyboardID:](TypistKeyboardUtilities, "getRegionCodeFromKeyboardID:", v17);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD14A8], "arabicGenericCharacters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v13, "rangeOfCharacterFromSet:", v19);

  objc_msgSend(MEMORY[0x24BDD14A8], "arabicPresentationFormCharacters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v13, "rangeOfCharacterFromSet:", v21);

  if (v20 != 0x7FFFFFFFFFFFFFFFLL || v22 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TypistKeyboard _convertCollationCharacters:](self, "_convertCollationCharacters:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "stringByConvertingArabicCharactersToPresentationForms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 1;
  }
  v24 = -[TYParsedScribbleData initWithText:regionCode:isCursive:]([TYParsedScribbleData alloc], "initWithText:regionCode:isCursive:", v13, v108, v7);
  -[TYParsedScribbleData pathMap](v24, "pathMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v102 = v7;
    v103 = self;
    v33 = CFSTR("handwriting");
    if (v106)
      v33 = CFSTR("stylus");
    v91 = v12;
    TYLog(CFSTR("Generating %@ stream for input: [%@]"), v26, v27, v28, v29, v30, v31, v32, (char)v33);
    -[TYParsedScribbleData convertedString](v24, "convertedString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v13;
    v35 = objc_msgSend(v13, "isEqualToString:", v34);

    if ((v35 & 1) == 0)
    {
      -[TYParsedScribbleData convertedString](v24, "convertedString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      TYLog(CFSTR("Text after conversion [%@]"), v37, v38, v39, v40, v41, v42, v43, (char)v36);

    }
    v122 = 0;
    v107 = (id)objc_opt_new();
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    -[TYParsedScribbleData parsedData](v24, "parsedData");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
    if (v94)
    {
      v44 = 0;
      v93 = *(_QWORD *)v119;
      v101 = v24;
      do
      {
        for (i = 0; i != v94; ++i)
        {
          if (*(_QWORD *)v119 != v93)
            objc_enumerationMutation(obj);
          v46 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
          if (objc_msgSend(v46, "isLatexString"))
          {
            if (v44 <= 1)
              v44 = 1;
            v116 = 0u;
            v117 = 0u;
            v114 = 0u;
            v115 = 0u;
            objc_msgSend(v46, "latexFormulaBoundingBoxes");
            v97 = (id)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
            if (v47)
            {
              v48 = v47;
              v95 = i;
              v49 = 0;
              v99 = *(_QWORD *)v115;
              do
              {
                v50 = 0;
                v51 = v49;
                do
                {
                  if (*(_QWORD *)v115 != v99)
                    objc_enumerationMutation(v97);
                  v52 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v50);
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TYParsedScribbleData pathMap](v24, "pathMap");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TypistKeyboard _dimensionsForLatex:formula:withPathMap:regionCode:isCursive:cumulativeWidth:totalWidth:primaryTextDirection:rotationBias:characterByCharacterPaths:](v103, "_dimensionsForLatex:formula:withPathMap:regionCode:isCursive:cumulativeWidth:totalWidth:primaryTextDirection:rotationBias:characterByCharacterPaths:", v46, v52, v54, v108, v102, v122, a6, -[TYParsedScribbleData totalWidth](v24, "totalWidth"), v44, v53);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v46, "boundingSize");
                  v56 = height / v55;
                  objc_msgSend(v46, "boundingSize");
                  v58 = width / v57;
                  if (v56 >= v58)
                    v56 = v58;
                  objc_msgSend(v46, "offsetY");
                  v60 = -(v59 * v56);
                  objc_msgSend(v49, "rect");
                  v113.b = 0.0;
                  v113.c = 0.0;
                  v113.a = v56;
                  v113.d = v56;
                  v113.tx = 0.0;
                  v113.ty = v60;
                  v128 = CGRectApplyAffineTransform(v127, &v113);
                  v61 = v128.size.width;
                  v62 = v128.size.height;
                  v63 = x + v128.origin.x;
                  v64 = y + v128.origin.y;
                  objc_msgSend(v46, "boundingSize");
                  v66 = v65;
                  objc_msgSend(v49, "totalWidth");
                  v68 = v66 / v67;
                  objc_msgSend(v46, "boundingSize");
                  v70 = v69 * 0.0009765625;
                  if (v68 < v69 * 0.0009765625)
                    v70 = v68;
                  objc_msgSend(v49, "setBoundingBoxScale:", v70);
                  v24 = v101;
                  -[TypistKeyboard _generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:](v103, "_generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:", v53, v106, v49, 1, v63, v64, v61, v62);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v107, "addObjectsFromArray:", v71);

                  ++v50;
                  v51 = v49;
                }
                while (v48 != v50);
                v48 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
              }
              while (v48);

              i = v95;
            }

            objc_msgSend(v46, "boundingSize");
            v73 = 1024.0 / v72;
            objc_msgSend(v46, "boundingSize");
            v122 += llround(v74 * v73);
          }
          else
          {
            v96 = i;
            objc_msgSend(v46, "annotatedTextDirections");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = 0u;
            v110 = 0u;
            v111 = 0u;
            v112 = 0u;
            v98 = v75;
            v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
            if (v76)
            {
              v77 = v76;
              v100 = *(_QWORD *)v110;
              do
              {
                for (j = 0; j != v77; ++j)
                {
                  if (*(_QWORD *)v110 != v100)
                    objc_enumerationMutation(v98);
                  v79 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v44)
                    v44 = objc_msgSend(v79, "textDirection");
                  objc_msgSend(v79, "range");
                  if (v81)
                  {
                    objc_msgSend(v46, "string");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v83 = objc_msgSend(v79, "range");
                    objc_msgSend(v82, "substringWithRange:", v83, v84);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();

                    -[TYParsedScribbleData pathMap](v24, "pathMap");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TypistKeyboard _dimensionsForText:withPathMap:regionCode:isCursive:cumulativeWidth:totalWidth:segmentTextDirection:primaryTextDirection:rotationBias:characterByCharacterPaths:](v103, "_dimensionsForText:withPathMap:regionCode:isCursive:cumulativeWidth:totalWidth:segmentTextDirection:primaryTextDirection:rotationBias:characterByCharacterPaths:", v85, v86, v108, v102, &v122, -[TYParsedScribbleData totalWidth](v24, "totalWidth"), a6, objc_msgSend(v79, "textDirection"), v44, v80);
                    v87 = (void *)objc_claimAutoreleasedReturnValue();

                    -[TypistKeyboard _generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:](v103, "_generateHandwritingStream:inFrame:isPencil:dimensions:isLatex:", v80, v106, v87, 0, x, y, width, height);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v107, "addObjectsFromArray:", v88);

                    v24 = v101;
                  }

                }
                v77 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
              }
              while (v77);
            }

            i = v96;
          }
        }
        v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
      }
      while (v94);
    }

    v13 = v90;
    v12 = v91;
  }
  else
  {
    v107 = 0;
  }

  return v107;
}

- (id)_generateHandwritingStream:(id)a3 inFrame:(CGRect)a4 isPencil:(BOOL)a5 dimensions:(id)a6 isLatex:(BOOL)a7
{
  _BOOL8 v8;
  double width;
  double x;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const __CFString *v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  id obj;
  uint64_t v53;
  unint64_t v54;
  _BOOL4 v55;
  double y;
  double height;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  const __CFString *v62;
  void *v63;
  id v64;
  TypistKeyboard *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  const __CFString *v82;
  void *v83;
  _QWORD v84[4];
  _QWORD v85[4];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v55 = a7;
  v8 = a5;
  y = a4.origin.y;
  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  v88 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v59 = a6;
  v65 = self;
  if ((-[TypistKeyboard isHandwriting](self, "isHandwriting") || v8) && objc_msgSend(v12, "count"))
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate](TypistKeyboardUtilities, "touchScanRate");
    *(float *)&v14 = v14;
    objc_msgSend(v13, "numberWithFloat:", v14);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (id)objc_opt_new();
    -[TypistKeyboard _getScaleInFrame:isPencil:dimensions:](self, "_getScaleInFrame:isPencil:dimensions:", v8, v59, x, y, width, height);
    v16 = v15;
    objc_msgSend(v59, "cumulativeWidth");
    v18 = v17;
    objc_msgSend(v59, "segmentWidth");
    v20 = v19;
    v21 = objc_msgSend(v59, "primaryWritingDirection");
    v22 = objc_msgSend(v59, "segmentWritingDirection");
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v51 = v12;
    obj = v12;
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    if (v58)
    {
      v23 = 1;
      if (v21 != v22)
        v23 = -1;
      v24 = v16 * v18 - v16 * v20;
      v54 = (unint64_t)(v16 * v20);
      v53 = *(_QWORD *)v74;
      if (v8)
        v25 = CFSTR("st");
      else
        v25 = CFSTR("mt");
      v62 = v25;
      v26 = (double)v23;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v74 != v53)
            objc_enumerationMutation(obj);
          v60 = v27;
          v28 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v27);
          objc_msgSend(v28, "perCharacterScale");
          v30 = v16 * v29;
          v31 = (double)objc_msgSend(v28, "height");
          v32 = (double)objc_msgSend(v28, "width");
          memset(&v72, 0, sizeof(v72));
          -[TypistKeyboard _determineTransformationInFrame:segmentStart:totalSegmentWidth:scale:characterHeight:characterWidth:dimensions:isLatex:](v65, "_determineTransformationInFrame:segmentStart:totalSegmentWidth:scale:characterHeight:characterWidth:dimensions:isLatex:", v54, v59, v55, x, y, width, height, v24, v30, v31, v32);
          if (v55 && objc_msgSend(v59, "requiresExtension"))
          {
            v70 = v72;
            CGAffineTransformScale(&v71, &v70, width / (v30 * v32), 1.0);
            v72 = v71;
          }
          objc_msgSend(v28, "strokeArray");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v72;
          +[TypistPathUtilities convertSVGPaths:withTransformation:](TypistPathUtilities, "convertSVGPaths:withTransformation:", v33, &v71);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v61 = v34;
          v35 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v67;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v67 != v37)
                  objc_enumerationMutation(v61);
                v39 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
                if (objc_msgSend(v39, "count"))
                {
                  v84[0] = CFSTR("ALPHA");
                  LODWORD(v40) = 0.5;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v85[0] = v41;
                  v85[1] = v63;
                  v84[1] = CFSTR("CPPATHGEN_TIME_INTERVAL");
                  v84[2] = CFSTR("CPPATHGEN_TIMING_ALGORITHM");
                  v84[3] = CFSTR("CPPATHGEN_VELOCITY");
                  v85[2] = CFSTR("ANGULAR");
                  v85[3] = &unk_251A995C0;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 4);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TypistPathUtilities generatePathArgumentStringWithParameters:fromPoints:](TypistPathUtilities, "generatePathArgumentStringWithParameters:fromPoints:", v42, v39);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  v82 = CFSTR("actions");
                  v79[0] = CFSTR("action");
                  v79[1] = CFSTR("argumentList");
                  v80[0] = v62;
                  v80[1] = v43;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v81[0] = v44;
                  v77[0] = CFSTR("action");
                  v77[1] = CFSTR("time");
                  v78[0] = CFSTR("wait");
                  -[TypistKeyboard typeInterval](v65, "typeInterval");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "stringValue");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v78[1] = v46;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v81[1] = v47;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 2);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v83 = v48;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "addObject:", v49);

                }
              }
              v36 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
            }
            while (v36);
          }
          v24 = v24 + v26 * v32 * v30;

          v27 = v60 + 1;
        }
        while (v60 + 1 != v58);
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
      }
      while (v58);
    }

    v12 = v51;
  }
  else
  {
    v64 = 0;
  }

  return v64;
}

- (double)_getScaleInFrame:(CGRect)a3 isPencil:(BOOL)a4 dimensions:(id)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v22[12];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x3010000000;
  v43 = 0;
  v44 = 0;
  v42 = &unk_2494BA09E;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x4010000000;
  v36 = &unk_2494BA09E;
  v37 = 0u;
  v38 = 0u;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __55__TypistKeyboard__getScaleInFrame_isPencil_dimensions___block_invoke;
  v22[3] = &unk_251A7CB00;
  *(CGFloat *)&v22[8] = x;
  *(CGFloat *)&v22[9] = y;
  *(CGFloat *)&v22[10] = width;
  *(CGFloat *)&v22[11] = height;
  v22[4] = &v39;
  v22[5] = &v33;
  v22[6] = &v27;
  v22[7] = &v23;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v22);
  if (objc_msgSend((id)v28[5], "caseInsensitiveCompare:", CFSTR("Left"))
    && objc_msgSend((id)v28[5], "caseInsensitiveCompare:", CFSTR("Right")))
  {
    v11 = v40;
  }
  else
  {
    v11 = v40;
    if (v24[3] == 1)
    {
      v40[4] = v34[6];
      v11[5] = height;
    }
  }
  v12 = v11[4];
  objc_msgSend(v10, "totalWidth");
  v14 = v13;
  v15 = v40[5];
  if (v5)
  {
    objc_msgSend(v10, "fixedScaleHeight");
    v17 = v15 / v16;
  }
  else
  {
    v18 = v34[7];
    objc_msgSend(v10, "fixedScaleHeight");
    v17 = (v15 - v18) / v19;
  }
  if (v12 / v14 >= v17)
    v20 = v17;
  else
    v20 = v12 / v14;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v20;
}

int64_t __55__TypistKeyboard__getScaleInFrame_isPencil_dimensions___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t result;

  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *(_OWORD *)(a1 + 80);
  +[TypistKeyboardUtilities findKeyBoundsInKeyboard:](TypistKeyboardUtilities, "findKeyBoundsInKeyboard:", CFSTR("Candidate-Selection"));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  +[TypistKeyboardUtilities getOneHandedKeyboardHandBias](TypistKeyboardUtilities, "getOneHandedKeyboardHandBias");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  result = +[TypistKeyboardUtilities getUIInterfaceOrientation](TypistKeyboardUtilities, "getUIInterfaceOrientation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)generatePencilGestureStream:(int)a3 gestureStyle:(int)a4 inFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  const __CFString *v62;
  void *v63;
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[4];
  _QWORD v69[4];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v69[2] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = 1.0 / (double)+[TypistKeyboardUtilities touchScanRate](TypistKeyboardUtilities, "touchScanRate");
  *(float *)&v13 = v13;
  objc_msgSend(v12, "numberWithFloat:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = y + height * 0.5;
  if (a3 != 3 || a4)
  {
    if (a3 != 1 || a4)
    {
      if (a3 == 1 && a4 == 1)
      {
        +[TypistPathUtilities convertCurveDeleteTouchPoints:endPoint:curveHeight:curveDensity:tilt:](TypistPathUtilities, "convertCurveDeleteTouchPoints:endPoint:curveHeight:curveDensity:tilt:", 10, x, v22, x + width, v22, height, -1.5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (a4 | a3)
      {
        if (a3 != 2 || a4)
        {
          TYLog(CFSTR("Gesture %u is not supported"), v14, v15, v16, v17, v18, v19, v20, a3);
          v49 = 0;
          goto LABEL_18;
        }
        v43 = x + width;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v43, v22);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v39;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v43, height + v22);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v66[1] = v40;
        v44 = (void *)MEMORY[0x24BDBCE30];
        v45 = v66;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, v22);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v39;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x + width + -1.0, v22);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v40;
        v44 = (void *)MEMORY[0x24BDBCE30];
        v45 = v67;
      }
      objc_msgSend(v44, "arrayWithObjects:count:", v45, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:", x + width, v22, height * 0.25);
      v32 = v31;
      v34 = v33;
      +[TypistKeyboardUtilities generateGaussianPointWithMean:andSigma:](TypistKeyboardUtilities, "generateGaussianPointWithMean:andSigma:");
      v36 = v35;
      v38 = v37;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, v22);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v39;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v32, v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v40;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, v22);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v41;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v36, v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v68[3] = v42;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_17;
  }
  v23 = x + width;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v24;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v23, v22 + 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD16E0];
  v28 = 1.0
      / (double)+[TypistKeyboardUtilities touchScanRate](TypistKeyboardUtilities, "touchScanRate")
      * 100.0;
  *(float *)&v28 = v28;
  objc_msgSend(v27, "numberWithFloat:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)v29;
LABEL_17:
  v64[0] = CFSTR("ALPHA");
  LODWORD(v30) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v46;
  v65[1] = v21;
  v64[1] = CFSTR("CPPATHGEN_TIME_INTERVAL");
  v64[2] = CFSTR("CPPATHGEN_TIMING_ALGORITHM");
  v64[3] = CFSTR("CPPATHGEN_VELOCITY");
  v65[2] = CFSTR("ANGULAR");
  v65[3] = &unk_251A995C0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[TypistPathUtilities generatePathArgumentStringWithParameters:fromPoints:](TypistPathUtilities, "generatePathArgumentStringWithParameters:fromPoints:", v47, v26);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)objc_opt_new();
  v62 = CFSTR("actions");
  v59[0] = CFSTR("action");
  v59[1] = CFSTR("argumentList");
  v60[0] = CFSTR("st");
  v60[1] = v48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v50;
  v57[0] = CFSTR("action");
  v57[1] = CFSTR("time");
  v58[0] = CFSTR("wait");
  -[TypistKeyboard typeInterval](self, "typeInterval");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringValue");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v52;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v54;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObject:", v55);

LABEL_18:
  return v49;
}

- (id)getActionForKeystroke:(id)a3 fromKeyPlane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[TypistKeyboard keyPlanes](self, "keyPlanes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TypistKeyboard prefersPopoverKeys](self, "prefersPopoverKeys"))
    goto LABEL_7;
  if (!v10)
    goto LABEL_7;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("popover"));

  if (!v12)
    goto LABEL_7;
  -[TypistKeyboard findKeyInOtherPlanes:currentPlane:](self, "findKeyInOtherPlanes:currentPlane:", v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_7;
  v14 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("basekey"));

  if ((v16 & 1) != 0)
    v17 = 0;
  else
LABEL_7:
    v17 = v10;

  return v17;
}

- (id)findKeyOnAnyPlane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TypistKeyboard keyPlanes](self, "keyPlanes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[TypistKeyboard attemptToFindKeystrokeAsSecondaryDisplay:](self, "attemptToFindKeystrokeAsSecondaryDisplay:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v15;
}

- (id)findKey:(id)a3 inPlane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[TypistKeyboard keyPlanes](self, "keyPlanes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)findKeyOnCurrentPlane:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[TypistKeyboardUtilities formattedKeyplaneName](TypistKeyboardUtilities, "formattedKeyplaneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard findKey:inPlane:](self, "findKey:inPlane:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_multiCharacterTrailForGrapheme:(id)a3
{
  return 0;
}

- (id)getPostfixKey:(id)a3
{
  return a3;
}

- (id)addAccentKeyAction:(id)a3
{
  return 0;
}

- (id)attemptToFindKeystrokeAsSecondaryDisplay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
    {

      goto LABEL_17;
    }
    v8 = -[TypistKeyboard isFloating](self, "isFloating");

    if (v8)
    {
LABEL_17:
      v22 = 0;
      goto LABEL_20;
    }
    v9 = CFSTR("↓");
  }
  else
  {
    v9 = CFSTR("⊎");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v9, v4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_17;
  v11 = (void *)v10;
  v26 = v4;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[TypistKeyboard keyPlanes](self, "keyPlanes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_19;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v15)
        continue;
      break;
    }
  }

  v22 = 0;
LABEL_19:
  v4 = v26;
LABEL_20:

  return v22;
}

- (id)tryAlternateVariationsOfKey:(id)a3
{
  return 0;
}

- (id)findKeyInOtherPlanes:(id)a3 currentPlane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  TypistKeyboard *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[TypistKeyboard keyPlanes](self, "keyPlanes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      v13 = 0;
      v28 = v11;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "isEqualToString:", v7) & 1) == 0)
        {
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v6);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            -[TypistKeyboard switchToPlane:fromPlane:](self, "switchToPlane:fromPlane:", v14, v7);
            v19 = v12;
            v20 = self;
            v21 = v7;
            v22 = v6;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v23, "count");

            v6 = v22;
            v7 = v21;
            self = v20;
            v12 = v19;
            v11 = v28;

            if (v30)
            {
              -[TypistKeyboard keyPlanes](self, "keyPlanes");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v6);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
          }
          else
          {

          }
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }
  v26 = 0;
LABEL_14:

  return v26;
}

- (id)_constructSwitchPath:(id)a3 toPlane:(id)a4 fromPlane:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  TypistKeyboard *v51;
  void *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v47 = (id)objc_opt_new();
  v9 = v8;
  objc_msgSend(v7, "allKeys");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v9;
  if (objc_msgSend(v52, "containsObject:", v9))
  {
    v48 = v7;
    v51 = self;
    while (1)
    {
      v10 = v9;
      v11 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v7, "objectForKeyedSubscript:", v9);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_8;
      v15 = (void *)v14;
      -[TypistKeyboard keyPlanes](self, "keyPlanes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        break;
      -[TypistKeyboard keyPlanes](self, "keyPlanes");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", v9);
      v53 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v53);
      v49 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v48;
      self = v51;

      v11 = v53;
      if (!v22)
        goto LABEL_9;
      -[TypistKeyboard keyPlanes](v51, "keyPlanes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard planeSwitchTable](v51, "planeSwitchTable");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v53);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "insertObject:atIndex:", v28, 0);

      v11 = v53;
      v54[0] = CFSTR("action");
      v54[1] = CFSTR("time");
      v55[0] = CFSTR("wait");
      -[TypistKeyboard typeInterval](v51, "typeInterval");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "insertObject:atIndex:", v31, 1);

      self = v51;
LABEL_10:

      if ((objc_msgSend(v52, "containsObject:", v9) & 1) == 0)
        goto LABEL_11;
    }

LABEL_8:
LABEL_9:
    -[TypistKeyboard keyboardID](self, "keyboardID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("%@: !!! Unable to find a valid switch path !!!"), v33, v34, v35, v36, v37, v38, (char)v32);

    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("self.keyPlanes[%@][self.planeSwitchTable[%@][%@]]"), v39, v40, v41, v42, v43, v44, (char)v9);
    goto LABEL_10;
  }
LABEL_11:

  return v47;
}

- (id)switchToPlane:(id)a3 fromPlane:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v24;
  TypistKeyboard *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "isEqualToString:", &stru_251A7DE60);
    v9 = (void *)MEMORY[0x24BDBD1A8];
    if (v7
      && (v8 & 1) == 0
      && (objc_msgSend(v7, "isEqualToString:", &stru_251A7DE60) & 1) == 0
      && (objc_msgSend(v7, "isEqualToString:", v6) & 1) == 0)
    {
      v10 = (void *)objc_opt_new();
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "addObject:", v7);
      v12 = (void *)objc_opt_new();
      if (objc_msgSend(v11, "count"))
      {
        v24 = v7;
        v25 = self;
        while (1)
        {
          objc_msgSend(v11, "objectAtIndex:", 0, v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v6))
            break;
          objc_msgSend(v11, "removeObjectAtIndex:", 0);
          objc_msgSend(v10, "addObject:", v13);
          -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v27 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
                if ((objc_msgSend(v10, "containsObject:", v22) & 1) == 0)
                {
                  objc_msgSend(v11, "addObject:", v22);
                  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v22);
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            }
            while (v19);
          }

          self = v25;
          if (!objc_msgSend(v11, "count"))
          {
            v9 = 0;
            v7 = v24;
            goto LABEL_24;
          }
        }
        v7 = v24;
        -[TypistKeyboard _constructSwitchPath:toPlane:fromPlane:](self, "_constructSwitchPath:toPlane:fromPlane:", v12, v6, v24);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
LABEL_24:

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (id)_sanitizedStringForAutoShiftCheck:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("🔤"), &stru_251A7DE60);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("⇧"), &stru_251A7DE60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("⇪"), &stru_251A7DE60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  double Height;
  char v22;
  BOOL v23;
  char v24;
  void *v25;
  CGFloat v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v10 = (unint64_t)a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("more-after"));
  v15 = objc_claimAutoreleasedReturnValue();

  if (v10 | v15
    || (objc_msgSend(v14, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || objc_msgSend(v14, "isEqualToString:", CFSTR("⏎")))
  {
    -[objc_class getKeyplaneDescription:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyplaneDescription:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "usesAutoShift");
    v18 = objc_msgSend(v16, "isAlphabeticPlane");
    if (v18 && !v17
      || !+[TypistKeyboardUtilities getAutoCapitalizationPrefSetting](TypistKeyboardUtilities, "getAutoCapitalizationPrefSetting"))
    {
      v23 = 0;
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(&stru_251A7DE60, "stringByPaddingToLength:withString:startingAtIndex:", 2, CFSTR(" "), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_referenceBounds");
    Height = CGRectGetHeight(v39);
    v38 = (void *)v19;
    if (Height <= 1194.0)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_referenceBounds");
      if (CGRectGetHeight(v40) > 1194.0 && -[TypistKeyboard isFloating](self, "isFloating"))
      {
        v22 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_referenceBounds");
      v26 = CGRectGetHeight(v41);
      v27 = v18 ^ 1;
      if (v26 <= 1194.0)
        v27 = 1;
      if ((v27 & 1) != 0)
      {
LABEL_25:

        goto LABEL_36;
      }
      -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v36, "isEqualToString:", v11)
        || -[TypistKeyboard isCapsLockedState](self, "isCapsLockedState"))
      {

        goto LABEL_25;
      }
      v35 = v25;
      v22 = 1;
    }
LABEL_14:
    if (objc_msgSend(v14, "isEqualToString:", CFSTR(" ")))
    {
      if ((objc_msgSend((id)v10, "isEqualToString:", CFSTR(".")) & 1) != 0
        || (objc_msgSend((id)v10, "isEqualToString:", CFSTR("!")) & 1) != 0
        || (objc_msgSend((id)v10, "isEqualToString:", CFSTR("?")) & 1) != 0)
      {
        v24 = 1;
        goto LABEL_31;
      }
      if ((unint64_t)objc_msgSend(v12, "length") > 1)
      {
        objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v12, "length") - 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v34, "isEqualToString:", v19);

        if ((v22 & 1) == 0)
          goto LABEL_33;
        v28 = v36;
LABEL_32:

LABEL_33:
        if (Height > 1194.0)

        if ((v24 & 1) != 0)
          goto LABEL_39;
LABEL_36:
        if ((v18 & objc_msgSend(v14, "isEqualToString:", CFSTR(" "))) == 1
          && (-[TypistKeyboard defaultPlaneName](self, "defaultPlaneName"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v30 = objc_msgSend(v29, "isEqualToString:", v11),
              v29,
              !v30)
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("⏎")) & 1) != 0)
        {
LABEL_39:
          v23 = 1;
          v31 = v38;
LABEL_40:

          goto LABEL_41;
        }
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("🔤")) & 1) != 0)
        {
          v31 = v38;
          if ((v18 & 1) == 0)
          {
LABEL_45:
            -[TypistKeyboard _sanitizedStringForAutoShiftCheck:](self, "_sanitizedStringForAutoShiftCheck:", v12);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "length"))
              v23 = -[TypistKeyboard isAutoshiftedToCapitalPlane:](self, "isAutoshiftedToCapitalPlane:", v33);
            else
              v23 = 1;

            goto LABEL_40;
          }
        }
        else
        {
          v31 = v38;
          if (((v18 | objc_msgSend(v14, "isEqualToString:", CFSTR(" ")) ^ 1) & 1) == 0)
            goto LABEL_45;
        }
        v23 = 0;
        goto LABEL_40;
      }
    }
    v24 = 0;
LABEL_31:
    v28 = v36;
    if ((v22 & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  v23 = 0;
LABEL_42:

  return v23;
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  if (v4
    && +[TypistKeyboardUtilities getAutoCapitalizationPrefSetting](TypistKeyboardUtilities, "getAutoCapitalizationPrefSetting"))
  {
    v5 = (void *)MEMORY[0x24BDD14A8];
    -[TypistKeyboard sentenceDelimitingCharacters](self, "sentenceDelimitingCharacters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "characterSetWithCharactersInString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:", v7, 4);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v8 + 1;
    -[TypistKeyboard autoshiftRegex](self, "autoshiftRegex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstMatchInString:options:range:", v4, 0, v9, objc_msgSend(v4, "length") - v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)getShiftedKeyPlaneName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeysForObject:", CFSTR("⇧"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)getAlternativeKeyPlaneName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[TypistKeyboard planeSwitchTable](self, "planeSwitchTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeysForObject:", CFSTR("🔤"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  int v60;
  void *v61;
  CGRect v62;
  CGRect v63;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("⇧")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("🔤")))
    {
      -[TypistKeyboard setIsCapsLockedState:](self, "setIsCapsLockedState:", 0);
      -[TypistKeyboard getAlternativeKeyPlaneName:](self, "getAlternativeKeyPlaneName:", v9);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
      v10 = v14;
      goto LABEL_35;
    }
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard getShiftedKeyPlaneName:](self, "getShiftedKeyPlaneName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v9))
    {
      v17 = -[TypistKeyboard isCapsLockedState](self, "isCapsLockedState");

      if (!v17)
        goto LABEL_32;
    }
    else
    {

    }
    -[TypistKeyboard getAlternatePlanesForDefaultPlane](self, "getAlternatePlanesForDefaultPlane");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", v9);
    if ((v19 & 1) == 0)
    {
      -[objc_class getKeyplaneDescription:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getKeyplaneDescription:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "ignoresShiftState") & 1) == 0)
      {

LABEL_32:
        -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      v56 = v20;
    }
    v21 = objc_msgSend(v8, "isEqualToString:", CFSTR(" "));
    if (v21)
    {
      -[TypistKeyboard keyPlanes](self, "keyPlanes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR(" "));
      v24 = objc_claimAutoreleasedReturnValue();
      v57 = v23;
      v58 = (void *)v22;
      if (v24)
      {
        v59 = v21;
        v61 = (void *)v24;
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_referenceBounds");
        if (CGRectGetHeight(v62) <= 1194.0)
        {
LABEL_21:

          v26 = 1;
          v27 = v61;
          goto LABEL_28;
        }
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_referenceBounds");
        if (CGRectGetHeight(v63) > 1194.0 && -[TypistKeyboard isFloating](self, "isFloating"))
        {

          goto LABEL_21;
        }
        v52 = v25;
        v28 = 1;
        v21 = v59;
      }
      else
      {
        v61 = 0;
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("⏎")) & 1) != 0)
    {
      v26 = 1;
      if ((v28 & 1) == 0)
        goto LABEL_27;
    }
    else
    {
      v60 = v21;
      v54 = v5;
      v55 = v4;
      -[TypistKeyboard keyPlanes](self, "keyPlanes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("more-after"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v30;
      if ((objc_msgSend(v33, "BOOLValue") & 1) != 0 || (objc_msgSend(v8, "isEqualToString:", CFSTR("'")) & 1) != 0)
      {
        v26 = 1;
      }
      else
      {
        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", v9);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", v8);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("type"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v48 = v34;
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", v9);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", v8);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("basekey"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v44 = v35;
            -[TypistKeyboard keyPlanes](self, "keyPlanes");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", v9);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v8);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("type"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "isEqualToString:", CFSTR("popover")))
            {
              -[TypistKeyboard keyPlanes](self, "keyPlanes");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", v9);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectForKeyedSubscript:", v8);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("basekey"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v36, "isEqualToString:", CFSTR("'"));

            }
            else
            {
              v26 = 0;
            }

            v35 = v44;
          }
          else
          {
            v26 = 0;
          }

          v34 = v48;
        }
        else
        {
          v26 = 0;
        }

      }
      v5 = v54;
      v4 = v55;
      v21 = v60;
      if ((v28 & 1) == 0)
      {
LABEL_27:
        v27 = v61;
        if (!v21)
          goto LABEL_29;
        goto LABEL_28;
      }
    }

    v27 = v61;
    if ((v21 & 1) == 0)
    {
LABEL_29:
      if ((v19 & 1) == 0)

      if ((v26 & 1) == 0)
      {
        v14 = v9;
        goto LABEL_34;
      }
      goto LABEL_32;
    }
LABEL_28:

    goto LABEL_29;
  }
  -[TypistKeyboard getShiftedKeyPlaneName:](self, "getShiftedKeyPlaneName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TypistKeyboard isCapsLockedState](self, "isCapsLockedState"))
  {
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (v12)
    {
      -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
  }
  -[TypistKeyboard setIsCapsLockedState:](self, "setIsCapsLockedState:", 0);
LABEL_35:

  return v10;
}

- (void)typeKeystrokeStream:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (v7 && objc_msgSend(v7, "count"))
  {
    +[TypistKeyboardUtilities convertRecapCommands:](TypistKeyboardUtilities, "convertRecapCommands:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities launchRecap:completion:](TypistKeyboardUtilities, "launchRecap:completion:", v6, v5);

  }
}

- (void)typeKeystrokeStream:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "count");
    v4 = v7;
    if (v5)
    {
      +[TypistKeyboardUtilities convertRecapCommands:](TypistKeyboardUtilities, "convertRecapCommands:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[TypistKeyboardUtilities launchRecap:](TypistKeyboardUtilities, "launchRecap:", v6);

      v4 = v7;
    }
  }

}

- (void)typeString:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("⇧"), CFSTR("⇧"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v7, CFSTR("⇪"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TypistKeyboard usePredictionBar](self, "usePredictionBar")
      && +[TypistKeyboardUtilities getPredictivePrefSetting](TypistKeyboardUtilities, "getPredictivePrefSetting")&& !-[TypistKeyboard usesMecabraCandidateBar](self, "usesMecabraCandidateBar"))
    {
      -[TypistKeyboard generateKeystrokeStream:](self, "generateKeystrokeStream:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard typeKeystrokeStreamWithPredictive:originalText:completion:](self, "typeKeystrokeStreamWithPredictive:originalText:completion:", v9, v8, v6);
    }
    else
    {
      -[TypistKeyboard generateKeystrokeStream:](self, "generateKeystrokeStream:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard typeKeystrokeStream:completion:](self, "typeKeystrokeStream:completion:", v9, v6);
    }

  }
}

- (void)typeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TypistKeyboard typeStringWithHardwareKeyboard:](self, "typeStringWithHardwareKeyboard:", v5);
    }
    else
    {
      if (-[TypistKeyboard fastTyping](self, "fastTyping"))
        +[TypistKeyboardUtilities setRecapFastMode:](TypistKeyboardUtilities, "setRecapFastMode:", 1);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __29__TypistKeyboard_typeString___block_invoke;
      v7[3] = &unk_251A7C8B0;
      v7[4] = self;
      -[TypistKeyboard typeString:completion:](self, "typeString:completion:", v5, v7);
    }
  }

}

uint64_t __29__TypistKeyboard_typeString___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "fastTyping");
  if ((_DWORD)result)
    return +[TypistKeyboardUtilities setRecapFastMode:](TypistKeyboardUtilities, "setRecapFastMode:", 0);
  return result;
}

- (void)typeString:(id)a3 withCommit:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  void (**v19)(_QWORD);
  id v20;
  void *v21;
  char v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  _QWORD v28[3];
  char v29;

  v6 = a3;
  v7 = a4;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v15 = (void *)v8,
        v16 = -[TypistKeyboard usesMecabraCandidateBar](self, "usesMecabraCandidateBar"),
        v15,
        v16))
  {
    v17 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v18 = MEMORY[0x24BDAC760];
    v29 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __40__TypistKeyboard_typeString_withCommit___block_invoke;
    v27[3] = &unk_251A7C9D8;
    v27[4] = v28;
    v19 = (void (**)(_QWORD))MEMORY[0x2495B14D4](v27);
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __40__TypistKeyboard_typeString_withCommit___block_invoke_2;
    v23[3] = &unk_251A7CB28;
    v23[4] = self;
    v24 = v7;
    v20 = v17;
    v25 = v20;
    v26 = v28;
    v21 = (void *)MEMORY[0x2495B14D4](v23);
    -[TypistKeyboard typeString:completion:](self, "typeString:completion:", v6, v21);
    v19[2](v19);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("ERROR: This function is for CJ based candidate bar only! Aborting."), v9, v10, v11, v12, v13, v14, v22);
  }

}

uint64_t __40__TypistKeyboard_typeString_withCommit___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v1 = result;
    do
      result = +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.02);
    while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __40__TypistKeyboard_typeString_withCommit___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "commitCandidate:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "tryLock");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(a1 + 48), "unlock");
  }
  return result;
}

- (void)swipeString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v10;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("⇧"), CFSTR("⇧"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v7, CFSTR("⇪"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard generateSwipeStream:](self, "generateSwipeStream:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard typeKeystrokeStream:completion:](self, "typeKeystrokeStream:completion:", v9, 0);

      v5 = v10;
    }
  }

}

- (void)writeString:(id)a3 inFrame:(CGRect)a4
{
  -[TypistKeyboard writeString:inFrame:rotationBias:isCursive:](self, "writeString:inFrame:rotationBias:isCursive:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0.0);
}

- (void)writeString:(id)a3 inFrame:(CGRect)a4 isCursive:(BOOL)a5
{
  -[TypistKeyboard writeString:inFrame:rotationBias:isCursive:](self, "writeString:inFrame:rotationBias:isCursive:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0.0);
}

- (void)writeString:(id)a3 inFrame:(CGRect)a4 rotationBias:(double)a5
{
  -[TypistKeyboard writeString:inFrame:rotationBias:isCursive:](self, "writeString:inFrame:rotationBias:isCursive:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)writeString:(id)a3 inFrame:(CGRect)a4 rotationBias:(double)a5 isCursive:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v6 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = v13;
  if (v13)
  {
    v17 = v13;
    v15 = objc_msgSend(v13, "length");
    v14 = v17;
    if (v15)
    {
      -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:](self, "generateHandwritingStream:inFrame:isPencil:rotationBias:isCursive:", v17, 1, v6, x, y, width, height, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard typeKeystrokeStream:completion:](self, "typeKeystrokeStream:completion:", v16, 0);

      v14 = v17;
    }
  }

}

- (void)writePencilGesture:(int)a3 inStyle:(int)a4 inFrame:(CGRect)a5
{
  id v6;

  -[TypistKeyboard generatePencilGestureStream:gestureStyle:inFrame:](self, "generatePencilGestureStream:gestureStyle:inFrame:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard typeKeystrokeStream:completion:](self, "typeKeystrokeStream:completion:", v6, 0);

}

- (BOOL)usesMecabraCandidateBar
{
  return 0;
}

- (id)getAllCandidates
{
  void *v3;
  void *v4;
  void *v5;

  -[TypistKeyboard candidatebar](self, "candidatebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TypistKeyboard candidatebar](self, "candidatebar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAllCandidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getVisibleCandidates
{
  void *v3;
  void *v4;
  void *v5;

  -[TypistKeyboard candidatebar](self, "candidatebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TypistKeyboard candidatebar](self, "candidatebar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getVisibleCandidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)commitCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TypistKeyboard candidatebar](self, "candidatebar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "selectCandidate:", v4);

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int64_t)commitCandidateAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;

  -[TypistKeyboard candidatebar](self, "candidatebar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return -1;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectCandidateAtIndex:", a3);

  return v7;
}

- (BOOL)hasCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TypistKeyboard candidatebar](self, "candidatebar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasCandidate:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasCandidate:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  char v10;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TypistKeyboard candidatebar](self, "candidatebar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasCandidate:inRange:", v7, location, length);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TypistKeyboard candidatebar](self, "candidatebar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasCandidates:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasCandidates:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TypistKeyboard candidatebar](self, "candidatebar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hasCandidates:inRange:", v7, location, length);

  }
  return 0;
}

- (id)splitKeystrokeStreamByWord:(id)a3 originalText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t i;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v33;
  id obj;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1690], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formUnionWithCharacterSet:", v9);

  v33 = v6;
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v35 = v11;
  objc_msgSend(v11, "removeObject:", &stru_251A7DE60);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v12 = 0x24BDD1000;
  v13 = 0x24BDBC000;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        v15 = v13;
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("keystroke"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "rangeOfCharacterFromSet:", v8) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v17, "length") - 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v18);

          objc_msgSend(v36, "addObject:", v16);
          v13 = v15;
        }
        else
        {
          if (objc_msgSend(v7, "length"))
          {
            v49[0] = CFSTR("word");
            v48[0] = CFSTR("type");
            v48[1] = CFSTR("text");
            v19 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithString:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v49[1] = v21;
            v48[2] = CFSTR("keystrokeStream");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v49[2] = v22;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v23);

            objc_msgSend(v7, "setString:", &stru_251A7DE60);
            objc_msgSend(v36, "removeAllObjects");
            objc_msgSend(v35, "removeObjectAtIndex:", 0);
          }
          v47[0] = CFSTR("separator");
          v46[0] = CFSTR("type");
          v46[1] = CFSTR("text");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v47[1] = v24;
          v46[2] = CFSTR("keystrokeStream");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v47[2] = v25;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v26);

          v13 = 0x24BDBC000uLL;
        }

        v12 = 0x24BDD1000uLL;
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v39);
  }

  if (objc_msgSend(v7, "length") && objc_msgSend(v35, "count"))
  {
    v45[0] = CFSTR("separator");
    v44[0] = CFSTR("type");
    v44[1] = CFSTR("text");
    v27 = *(void **)(v12 + 1992);
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v29;
    v44[2] = CFSTR("keystrokeStream");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v30;
    objc_msgSend(*(id *)(v13 + 3696), "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v31);

  }
  return v37;
}

- (void)typeKeystrokeStreamWithPredictive:(id)a3 originalText:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  char v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  v17 = (void *)v10;
  -[TypistKeyboard candidatebar](self, "candidatebar");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_6;
  }
  v19 = (void *)v18;
  v20 = -[TypistKeyboard usesMecabraCandidateBar](self, "usesMecabraCandidateBar");

  if (!v20)
  {
LABEL_6:
    -[TypistKeyboard splitKeystrokeStreamByWord:originalText:](self, "splitKeystrokeStreamByWord:originalText:", v23, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard typeWordKeystrokeWithPredictive:atIndex:completion:](self, "typeWordKeystrokeWithPredictive:atIndex:completion:", v21, 0, v9);

    goto LABEL_7;
  }
LABEL_4:
  TYLogl(OS_LOG_TYPE_ERROR, CFSTR("ERROR: Predictive setting or QuickType bar is not enabled with the keyboard. Aborting."), v11, v12, v13, v14, v15, v16, v22);
LABEL_7:

}

- (void)typeWordKeystrokeWithPredictive:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  void (**v23)(_QWORD);
  int64_t v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(_QWORD);
  int64_t v28;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count") && objc_msgSend(v8, "count") > (unint64_t)a4)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("separator"));

    if (v12)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keystrokeStream"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke;
      v25[3] = &unk_251A7CB50;
      v25[4] = self;
      v26 = v8;
      v28 = a4;
      v27 = v9;
      -[TypistKeyboard typeKeystrokeStream:completion:](self, "typeKeystrokeStream:completion:", v13, v25);

      v14 = v26;
    }
    else
    {
      if (-[TypistKeyboard usePredictionBar](self, "usePredictionBar"))
      {
        -[TypistKeyboard candidatebar](self, "candidatebar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("text"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "getIndexOfCandidate:", v16);

        if ((v17 & 0x8000000000000000) == 0)
        {
          -[TypistKeyboard candidatebar](self, "candidatebar");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "selectCandidateAtIndex:", v17);

          -[TypistKeyboard typeWordKeystrokeWithPredictive:atIndex:completion:](self, "typeWordKeystrokeWithPredictive:atIndex:completion:", v8, a4 + 1, v9);
LABEL_12:

          goto LABEL_13;
        }
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keystrokeStream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("text"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke_2;
      v21[3] = &unk_251A7CB50;
      v21[4] = self;
      v22 = v8;
      v24 = a4;
      v23 = v9;
      -[TypistKeyboard typeWordKeystrokes:expectedWord:atIndex:completion:](self, "typeWordKeystrokes:expectedWord:atIndex:completion:", v19, v20, 0, v21);

      v14 = v22;
    }

    goto LABEL_12;
  }
  if (v9)
    v9[2](v9);
LABEL_13:

}

uint64_t __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "typeWordKeystrokeWithPredictive:atIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

uint64_t __69__TypistKeyboard_typeWordKeystrokeWithPredictive_atIndex_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "typeWordKeystrokeWithPredictive:atIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

- (void)typeWordKeystrokes:(id)a3 expectedWord:(id)a4 atIndex:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  void (**v18)(_QWORD);
  int64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  if (objc_msgSend(v10, "count") && objc_msgSend(v10, "count") > (unint64_t)a5)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__TypistKeyboard_typeWordKeystrokes_expectedWord_atIndex_completion___block_invoke;
    v15[3] = &unk_251A7CB78;
    v15[4] = self;
    v16 = v11;
    v17 = v10;
    v18 = v12;
    v19 = a5;
    -[TypistKeyboard typeKeystrokeStream:completion:](self, "typeKeystrokeStream:completion:", v14, v15);

  }
  else if (v12)
  {
    v12[2](v12);
  }

}

uint64_t __69__TypistKeyboard_typeWordKeystrokes_expectedWord_atIndex_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (!objc_msgSend(*(id *)(a1 + 32), "usePredictionBar")
    || (objc_msgSend(*(id *)(a1 + 32), "candidatebar"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "getIndexOfCandidate:", *(_QWORD *)(a1 + 40)),
        v2,
        v3 < 0))
  {
    v10 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64) + 1;
    v11 = *(void **)(a1 + 48);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "candidatebar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectCandidateAtIndex:", v3);

    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(v5, "count");
    v9 = *(_QWORD *)(a1 + 56);
    v10 = v7;
    v11 = v5;
    v12 = v6;
  }
  return objc_msgSend(v10, "typeWordKeystrokes:expectedWord:atIndex:completion:", v11, v12, v8, v9);
}

- (void)switchKeyPlaneOnActiveKeyboard:(id)a3
{
  id v3;

  v3 = a3;
  -[objc_class switchToPlane:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "switchToPlane:", v3);

}

- (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[objc_class centerOfKey:withOffset:](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "centerOfKey:withOffset:", a3.x, a3.y, a4.x, a4.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (TypistKeyboard)initWithHardwareKeyboard:(id)a3
{
  id v4;
  TypistKeyboard *v5;
  TypistKeyboard *v6;
  NSNumber *typeInterval;
  NSNumber *pressDuration;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TypistKeyboard;
  v5 = -[TypistKeyboard init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    typeInterval = v5->_typeInterval;
    v5->_typeInterval = (NSNumber *)&unk_251A94D60;

    pressDuration = v6->_pressDuration;
    v6->_pressDuration = (NSNumber *)&unk_251A94D60;

    -[TypistKeyboard attachHardwareKeyboard:](v6, "attachHardwareKeyboard:", v4);
  }

  return v6;
}

- (void)pressKeycode:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = a3;
  -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pressKeycode:", v3);

  }
}

+ (void)typeStringOnHardwareKeyboard:(id)a3 withLanguage:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  TypistHWKeyboard *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  if (v13 && v5)
  {
    v12 = -[TypistHWKeyboard initWithLanguage:]([TypistHWKeyboard alloc], "initWithLanguage:", v5);
    if (v12)
    {
      objc_msgSend(&unk_251A94D60, "doubleValue");
      -[TypistHWKeyboard setTypeInterval:](v12, "setTypeInterval:");
      -[TypistHWKeyboard typeString:](v12, "typeString:", v13);
      -[TypistHWKeyboard detach](v12, "detach");
    }
    else
    {
      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Unable to attach hardware keyboard with language %@"), v6, v7, v8, v9, v10, v11, (char)v5);
    }

  }
}

- (void)attachHardwareKeyboard:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TypistHWKeyboard *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v5 = a3;
  if (v5)
  {
    v23 = v5;
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      TYLog(CFSTR("An existing hardware keyboard was found to be attached. Detaching prior to attaching new keyboard (%@)..."), v7, v8, v9, v10, v11, v12, v13, (char)v23);
      -[TypistKeyboard detachHardwareKeyboard](self, "detachHardwareKeyboard");
    }
    v14 = -[TypistHWKeyboard initWithLanguage:]([TypistHWKeyboard alloc], "initWithLanguage:", v23);
    -[TypistKeyboard setHardwareKeyboard:](self, "setHardwareKeyboard:", v14);

    -[TypistKeyboard pressDuration](self, "pressDuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[TypistKeyboard pressDuration](self, "pressDuration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "doubleValue");
    }
    else
    {
      objc_msgSend(&unk_251A94D60, "doubleValue");
    }
    v17 = v16;
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPressDuration:", v17);

    if (v15)
    -[TypistKeyboard typeInterval](self, "typeInterval");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[TypistKeyboard typeInterval](self, "typeInterval");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "doubleValue");
    }
    else
    {
      objc_msgSend(&unk_251A94D80, "doubleValue");
    }
    v21 = v20;
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTypeInterval:", v21);

    if (v19)
    v5 = v23;
  }

}

- (void)attachHardwareKeyboardWithCountryCode:(id)a3
{
  NSNumber *typeInterval;
  NSNumber *pressDuration;
  id v6;

  if (a3)
  {
    +[TypistHWKeyboard convertHIDCountryCodeToLanguage:](TypistHWKeyboard, "convertHIDCountryCodeToLanguage:", objc_msgSend(a3, "integerValue"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    typeInterval = self->_typeInterval;
    self->_typeInterval = (NSNumber *)&unk_251A94D60;

    pressDuration = self->_pressDuration;
    self->_pressDuration = (NSNumber *)&unk_251A94D60;

    -[TypistKeyboard attachHardwareKeyboard:](self, "attachHardwareKeyboard:", v6);
  }
}

- (void)detachHardwareKeyboard
{
  void *v3;
  void *v4;

  -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detach");

    -[TypistKeyboard setHardwareKeyboard:](self, "setHardwareKeyboard:", 0);
  }
}

- (void)typeStringWithHardwareKeyboard:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeString:", v13);

  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("A call to typeStringWithHardwareKeyboard was made but no hardware keyboard is attached."), v5, v6, v7, v8, v9, v10, v12);
  }

}

- (void)pressAndHoldHardwareKeys:(id)a3 forDuration:(double)a4 withValidation:(id)a5 validateAfter:(double)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a5;
  if (v13)
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pressAndHoldKeys:forDuration:withValidation:after:", v13, v10, a4, a6);

    }
  }

}

- (void)toggleCapsLock
{
  void *v3;
  id v4;

  -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeString:", CFSTR("⇪"));

  }
  else
  {
    -[TypistKeyboard typeString:](self, "typeString:", CFSTR("⇪"));
  }
}

- (void)tapGlobeKey
{
  void *v3;
  id v4;

  -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeString:", CFSTR("⌨"));

  }
  else
  {
    -[TypistKeyboard typeString:](self, "typeString:", CFSTR("🌐"));
  }
}

- (void)tapMoreKey
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[TypistKeyboard hardwareKeyboard](self, "hardwareKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    TYLog(CFSTR("%@ is not an understood action in the context of hardware keyboards. Aborting..."), v4, v5, v6, v7, v8, v9, v10, (char)CFSTR("🔤"));
  else
    -[TypistKeyboard typeString:](self, "typeString:", CFSTR("🔤"));
}

+ (id)keyboardLanguageValueMap
{
  return +[TypistHWKeyboard keyboardLanguageValueMap](TypistHWKeyboard, "keyboardLanguageValueMap");
}

- (TypistKeyboard)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboard *v5;
  uint64_t v6;
  NSString *keyboardID;
  uint64_t v8;
  NSNumber *typeInterval;
  uint64_t v10;
  TypistHWKeyboard *hardwareKeyboard;
  uint64_t v12;
  TypistCandidateBar *candidatebar;
  uint64_t v14;
  NSString *layoutName;
  uint64_t v16;
  NSString *languageID;
  uint64_t v18;
  NSString *regionCode;
  uint64_t v20;
  NSString *keyboardSW;
  uint64_t v22;
  NSString *keyboardType;
  uint64_t v24;
  NSMutableDictionary *keyPlanes;
  uint64_t v26;
  NSString *defaultPlaneName;
  uint64_t v28;
  NSDictionary *planeSwitchTable;
  uint64_t v30;
  NSString *sentenceDelimitingCharacters;
  uint64_t v32;
  NSString *sentenceTrailingCharacters;
  uint64_t v34;
  NSString *sentencePrefixingCharacters;
  uint64_t v36;
  NSRegularExpression *autoshiftRegex;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TypistKeyboard;
  v5 = -[TypistKeyboard init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardID"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardID = v5->_keyboardID;
    v5->_keyboardID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeInterval"));
    v8 = objc_claimAutoreleasedReturnValue();
    typeInterval = v5->_typeInterval;
    v5->_typeInterval = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardwareKeyboard"));
    v10 = objc_claimAutoreleasedReturnValue();
    hardwareKeyboard = v5->_hardwareKeyboard;
    v5->_hardwareKeyboard = (TypistHWKeyboard *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidatebar"));
    v12 = objc_claimAutoreleasedReturnValue();
    candidatebar = v5->_candidatebar;
    v5->_candidatebar = (TypistCandidateBar *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutName"));
    v14 = objc_claimAutoreleasedReturnValue();
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("languageID"));
    v16 = objc_claimAutoreleasedReturnValue();
    languageID = v5->_languageID;
    v5->_languageID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionCode"));
    v18 = objc_claimAutoreleasedReturnValue();
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardSW"));
    v20 = objc_claimAutoreleasedReturnValue();
    keyboardSW = v5->_keyboardSW;
    v5->_keyboardSW = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardType"));
    v22 = objc_claimAutoreleasedReturnValue();
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v22;

    v5->_usePopupKeys = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usePopupKeys"));
    v5->_usePredictionBar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usePredictionBar"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPlanes"));
    v24 = objc_claimAutoreleasedReturnValue();
    keyPlanes = v5->_keyPlanes;
    v5->_keyPlanes = (NSMutableDictionary *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultPlaneName"));
    v26 = objc_claimAutoreleasedReturnValue();
    defaultPlaneName = v5->_defaultPlaneName;
    v5->_defaultPlaneName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planeSwitchTable"));
    v28 = objc_claimAutoreleasedReturnValue();
    planeSwitchTable = v5->_planeSwitchTable;
    v5->_planeSwitchTable = (NSDictionary *)v28;

    v5->_dictationSupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dictationSupported"));
    v5->_shouldShowDictationKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldShowDictationKey"));
    v5->_shouldShowGlobeKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldShowGlobeKey"));
    v5->_isTenKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTenKey"));
    v5->_isKana = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isKana"));
    v5->_isHandwriting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHandwriting"));
    v5->_fastTyping = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fastTyping"));
    v5->_hasCandidatesToCommit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCandidatesToCommit"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sentenceDelimitingCharacters"));
    v30 = objc_claimAutoreleasedReturnValue();
    sentenceDelimitingCharacters = v5->_sentenceDelimitingCharacters;
    v5->_sentenceDelimitingCharacters = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sentenceTrailingCharacters"));
    v32 = objc_claimAutoreleasedReturnValue();
    sentenceTrailingCharacters = v5->_sentenceTrailingCharacters;
    v5->_sentenceTrailingCharacters = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sentencePrefixingCharacters"));
    v34 = objc_claimAutoreleasedReturnValue();
    sentencePrefixingCharacters = v5->_sentencePrefixingCharacters;
    v5->_sentencePrefixingCharacters = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoshiftRegex"));
    v36 = objc_claimAutoreleasedReturnValue();
    autoshiftRegex = v5->_autoshiftRegex;
    v5->_autoshiftRegex = (NSRegularExpression *)v36;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *keyboardID;
  NSNumber *typeInterval;
  TypistCandidateBar *candidatebar;
  TypistHWKeyboard *hardwareKeyboard;
  NSString *layoutName;
  NSString *languageID;
  NSString *regionCode;
  NSString *keyboardSW;
  NSString *keyboardType;
  NSMutableDictionary *keyPlanes;
  NSString *defaultPlaneName;
  NSDictionary *planeSwitchTable;
  void *v17;
  NSString *sentenceTrailingCharacters;
  NSString *sentencePrefixingCharacters;
  NSRegularExpression *autoshiftRegex;
  void *v21;
  id v22;

  v4 = a3;
  keyboardID = self->_keyboardID;
  v22 = v4;
  if (keyboardID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", keyboardID, CFSTR("keyboardID"));
    v4 = v22;
  }
  typeInterval = self->_typeInterval;
  if (typeInterval)
  {
    objc_msgSend(v22, "encodeObject:forKey:", typeInterval, CFSTR("typeInterval"));
    v4 = v22;
  }
  candidatebar = self->_candidatebar;
  if (candidatebar)
  {
    objc_msgSend(v22, "encodeObject:forKey:", candidatebar, CFSTR("candidatebar"));
    v4 = v22;
  }
  hardwareKeyboard = self->_hardwareKeyboard;
  if (hardwareKeyboard)
  {
    objc_msgSend(v22, "encodeObject:forKey:", hardwareKeyboard, CFSTR("hardwareKeyboard"));
    v4 = v22;
  }
  layoutName = self->_layoutName;
  if (layoutName)
  {
    objc_msgSend(v22, "encodeObject:forKey:", layoutName, CFSTR("layoutName"));
    v4 = v22;
  }
  languageID = self->_languageID;
  if (languageID)
  {
    objc_msgSend(v22, "encodeObject:forKey:", languageID, CFSTR("languageID"));
    v4 = v22;
  }
  regionCode = self->_regionCode;
  if (regionCode)
  {
    objc_msgSend(v22, "encodeObject:forKey:", regionCode, CFSTR("regionCode"));
    v4 = v22;
  }
  keyboardSW = self->_keyboardSW;
  if (keyboardSW)
  {
    objc_msgSend(v22, "encodeObject:forKey:", keyboardSW, CFSTR("keyboardSW"));
    v4 = v22;
  }
  keyboardType = self->_keyboardType;
  if (keyboardType)
  {
    objc_msgSend(v22, "encodeObject:forKey:", keyboardType, CFSTR("keyboardType"));
    v4 = v22;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_usePopupKeys, CFSTR("usePopupKeys"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_usePredictionBar, CFSTR("usePredictionBar"));
  keyPlanes = self->_keyPlanes;
  if (keyPlanes)
    objc_msgSend(v22, "encodeObject:forKey:", keyPlanes, CFSTR("keyPlanes"));
  defaultPlaneName = self->_defaultPlaneName;
  if (defaultPlaneName)
    objc_msgSend(v22, "encodeObject:forKey:", defaultPlaneName, CFSTR("defaultPlaneName"));
  planeSwitchTable = self->_planeSwitchTable;
  v17 = v22;
  if (planeSwitchTable)
  {
    objc_msgSend(v22, "encodeObject:forKey:", planeSwitchTable, CFSTR("planeSwitchTable"));
    v17 = v22;
  }
  objc_msgSend(v17, "encodeBool:forKey:", self->_dictationSupported, CFSTR("dictationSupported"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_shouldShowDictationKey, CFSTR("shouldShowDictationKey"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_shouldShowGlobeKey, CFSTR("shouldShowGlobeKey"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_isTenKey, CFSTR("isTenKey"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_isKana, CFSTR("isKana"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_isHandwriting, CFSTR("isHandwriting"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_fastTyping, CFSTR("fastTyping"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_hasCandidatesToCommit, CFSTR("hasCandidatesToCommit"));
  objc_msgSend(v22, "encodeBool:forKey:", self->_sentenceDelimitingCharacters != 0, CFSTR("sentenceDelimitingCharacters"));
  sentenceTrailingCharacters = self->_sentenceTrailingCharacters;
  if (sentenceTrailingCharacters)
    objc_msgSend(v22, "encodeObject:forKey:", sentenceTrailingCharacters, CFSTR("sentenceTrailingCharacters"));
  sentencePrefixingCharacters = self->_sentencePrefixingCharacters;
  if (sentencePrefixingCharacters)
    objc_msgSend(v22, "encodeObject:forKey:", sentencePrefixingCharacters, CFSTR("sentencePrefixingCharacters"));
  autoshiftRegex = self->_autoshiftRegex;
  v21 = v22;
  if (autoshiftRegex)
  {
    objc_msgSend(v22, "encodeObject:forKey:", autoshiftRegex, CFSTR("autoshiftRegex"));
    v21 = v22;
  }

}

- (NSNumber)typeInterval
{
  return self->_typeInterval;
}

- (NSNumber)touchMajorRadius
{
  return self->_touchMajorRadius;
}

- (NSString)keyboardID
{
  return self->_keyboardID;
}

- (void)setKeyboardID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (void)setLayoutName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)keyboardSW
{
  return self->_keyboardSW;
}

- (void)setKeyboardSW:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)prefersPopoverKeys
{
  return self->_prefersPopoverKeys;
}

- (void)setPrefersPopoverKeys:(BOOL)a3
{
  self->_prefersPopoverKeys = a3;
}

- (BOOL)usePopupKeys
{
  return self->_usePopupKeys;
}

- (void)setUsePopupKeys:(BOOL)a3
{
  self->_usePopupKeys = a3;
}

- (BOOL)flickTyping
{
  return self->_flickTyping;
}

- (void)setFlickTyping:(BOOL)a3
{
  self->_flickTyping = a3;
}

- (int)tapStyle
{
  return self->_tapStyle;
}

- (void)setTapStyle:(int)a3
{
  self->_tapStyle = a3;
}

- (NSNumber)tapSigma
{
  return self->_tapSigma;
}

- (void)setTapSigma:(id)a3
{
  objc_storeStrong((id *)&self->_tapSigma, a3);
}

- (NSNumber)tapBounds
{
  return self->_tapBounds;
}

- (void)setTapBounds:(id)a3
{
  objc_storeStrong((id *)&self->_tapBounds, a3);
}

- (BOOL)usePredictionBar
{
  return self->_usePredictionBar;
}

- (void)setUsePredictionBar:(BOOL)a3
{
  self->_usePredictionBar = a3;
}

- (TypistCandidateBar)candidatebar
{
  return self->_candidatebar;
}

- (void)setCandidatebar:(id)a3
{
  objc_storeStrong((id *)&self->_candidatebar, a3);
}

- (BOOL)swipeForceSpace
{
  return self->_swipeForceSpace;
}

- (void)setSwipeForceSpace:(BOOL)a3
{
  self->_swipeForceSpace = a3;
}

- (NSNumber)swipeSigma
{
  return self->_swipeSigma;
}

- (void)setSwipeSigma:(id)a3
{
  objc_storeStrong((id *)&self->_swipeSigma, a3);
}

- (NSNumber)swipeAlpha
{
  return self->_swipeAlpha;
}

- (void)setSwipeAlpha:(id)a3
{
  objc_storeStrong((id *)&self->_swipeAlpha, a3);
}

- (NSNumber)swipePivotProbability
{
  return self->_swipePivotProbability;
}

- (void)setSwipePivotProbability:(id)a3
{
  objc_storeStrong((id *)&self->_swipePivotProbability, a3);
}

- (NSNumber)swipeErrantProbability
{
  return self->_swipeErrantProbability;
}

- (void)setSwipeErrantProbability:(id)a3
{
  objc_storeStrong((id *)&self->_swipeErrantProbability, a3);
}

- (NSNumber)swipeConvexProbability
{
  return self->_swipeConvexProbability;
}

- (void)setSwipeConvexProbability:(id)a3
{
  objc_storeStrong((id *)&self->_swipeConvexProbability, a3);
}

- (NSNumber)swipeErrantSigma
{
  return self->_swipeErrantSigma;
}

- (void)setSwipeErrantSigma:(id)a3
{
  objc_storeStrong((id *)&self->_swipeErrantSigma, a3);
}

- (NSNumber)swipeConvexSigma
{
  return self->_swipeConvexSigma;
}

- (void)setSwipeConvexSigma:(id)a3
{
  objc_storeStrong((id *)&self->_swipeConvexSigma, a3);
}

- (NSNumber)pressDuration
{
  return self->_pressDuration;
}

- (TypistHWKeyboard)hardwareKeyboard
{
  return self->_hardwareKeyboard;
}

- (void)setHardwareKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareKeyboard, a3);
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSMutableDictionary)keyPlanes
{
  return self->_keyPlanes;
}

- (void)setKeyPlanes:(id)a3
{
  objc_storeStrong((id *)&self->_keyPlanes, a3);
}

- (NSString)defaultPlaneName
{
  return self->_defaultPlaneName;
}

- (void)setDefaultPlaneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDictionary)planeSwitchTable
{
  return self->_planeSwitchTable;
}

- (void)setPlaneSwitchTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setDictationSupported:(BOOL)a3
{
  self->_dictationSupported = a3;
}

- (void)setShouldShowDictationKey:(BOOL)a3
{
  self->_shouldShowDictationKey = a3;
}

- (void)setShouldShowGlobeKey:(BOOL)a3
{
  self->_shouldShowGlobeKey = a3;
}

- (void)setIsTenKey:(BOOL)a3
{
  self->_isTenKey = a3;
}

- (void)setIsKana:(BOOL)a3
{
  self->_isKana = a3;
}

- (void)setIsHandwriting:(BOOL)a3
{
  self->_isHandwriting = a3;
}

- (BOOL)fastTyping
{
  return self->_fastTyping;
}

- (void)setFastTyping:(BOOL)a3
{
  self->_fastTyping = a3;
}

- (BOOL)hasCandidatesToCommit
{
  return self->_hasCandidatesToCommit;
}

- (void)setHasCandidatesToCommit:(BOOL)a3
{
  self->_hasCandidatesToCommit = a3;
}

- (BOOL)isCapsLockedState
{
  return self->_isCapsLockedState;
}

- (void)setIsCapsLockedState:(BOOL)a3
{
  self->_isCapsLockedState = a3;
}

- (NSString)sentenceDelimitingCharacters
{
  return self->_sentenceDelimitingCharacters;
}

- (void)setSentenceDelimitingCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_sentenceDelimitingCharacters, a3);
}

- (NSString)sentenceTrailingCharacters
{
  return self->_sentenceTrailingCharacters;
}

- (void)setSentenceTrailingCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_sentenceTrailingCharacters, a3);
}

- (NSString)sentencePrefixingCharacters
{
  return self->_sentencePrefixingCharacters;
}

- (void)setSentencePrefixingCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_sentencePrefixingCharacters, a3);
}

- (NSRegularExpression)autoshiftRegex
{
  return self->_autoshiftRegex;
}

- (void)setAutoshiftRegex:(id)a3
{
  objc_storeStrong((id *)&self->_autoshiftRegex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoshiftRegex, 0);
  objc_storeStrong((id *)&self->_sentencePrefixingCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceTrailingCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceDelimitingCharacters, 0);
  objc_storeStrong((id *)&self->_planeSwitchTable, 0);
  objc_storeStrong((id *)&self->_defaultPlaneName, 0);
  objc_storeStrong((id *)&self->_keyPlanes, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_hardwareKeyboard, 0);
  objc_storeStrong((id *)&self->_pressDuration, 0);
  objc_storeStrong((id *)&self->_swipeConvexSigma, 0);
  objc_storeStrong((id *)&self->_swipeErrantSigma, 0);
  objc_storeStrong((id *)&self->_swipeConvexProbability, 0);
  objc_storeStrong((id *)&self->_swipeErrantProbability, 0);
  objc_storeStrong((id *)&self->_swipePivotProbability, 0);
  objc_storeStrong((id *)&self->_swipeAlpha, 0);
  objc_storeStrong((id *)&self->_swipeSigma, 0);
  objc_storeStrong((id *)&self->_candidatebar, 0);
  objc_storeStrong((id *)&self->_tapBounds, 0);
  objc_storeStrong((id *)&self->_tapSigma, 0);
  objc_storeStrong((id *)&self->_keyboardSW, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_layoutName, 0);
  objc_storeStrong((id *)&self->_keyboardID, 0);
  objc_storeStrong((id *)&self->_touchMajorRadius, 0);
  objc_storeStrong((id *)&self->_typeInterval, 0);
}

- (void)_bailWithError:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, id))a4 + 2))(a4, a3);
}

- (BOOL)isAvailableKeyOnCurrentPlane:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("basekey"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAvailablePopoverOnCurrentPlane:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("popover"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAvailableFlickOnCurrentPlane:(id)a3 withDirection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  if (-[TypistKeyboard isTenKey](self, "isTenKey"))
  {
    -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("gesture")))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("direction"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v7);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isAvailableGestureOnCurrentPlane:(id)a3 withDirection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("gesture"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tapKey:(id)a3 tapCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[TypistKeyboard typeInterval](self, "typeInterval");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard tapKey:tapCount:overriddenTypeInterval:completion:](self, "tapKey:tapCount:overriddenTypeInterval:completion:", v9, a4, v10, v8);

}

- (void)tapKey:(id)a3 tapCount:(unint64_t)a4 overriddenTypeInterval:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v25 = a5;
  v11 = (void (**)(id, void *))a6;
  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12
    && (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("basekey")),
        v14,
        v15))
  {
    v24 = (void *)objc_opt_new();
    for (i = (void *)objc_opt_new(); a4; --a4)
    {
      if (a4 == 1)
      {
        -[TypistKeyboard typeInterval](self, "typeInterval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v25, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(i, "addObject:", v13);
      v30[0] = CFSTR("action");
      v30[1] = CFSTR("time");
      v31[0] = CFSTR("wait");
      v31[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v19);

    }
    v28[0] = CFSTR("keystroke");
    v28[1] = CFSTR("actions");
    v29[0] = v10;
    v29[1] = i;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    objc_msgSend(v24, "addObject:", v20);

    -[TypistKeyboard typeKeystrokeStream:](self, "typeKeystrokeStream:", v24);
    v22 = 0;
  }
  else
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No tap information was found for %@"), v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    i = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyNotFoundError"), 1, i);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v11)
    v11[2](v11, v22);

}

- (void)dragFromKey:(id)a3 toKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
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
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[TypistKeyboardUtilities formattedKeyplaneName](TypistKeyboardUtilities, "formattedKeyplaneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard getExpectedPlaneNameForKey:currentPlane:](self, "getExpectedPlaneNameForKey:currentPlane:", v8, v12);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard findKey:inPlane:](self, "findKey:inPlane:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v37 = v12;
      v14 = (void *)objc_opt_new();
      v15 = (void *)objc_opt_new();
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("x"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      objc_msgSend(v16, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);

      v19 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("y"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      objc_msgSend(v19, "numberWithFloat:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v21);

      v22 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("x"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      objc_msgSend(v22, "numberWithFloat:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v24);

      v25 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("y"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");
      objc_msgSend(v25, "numberWithFloat:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v27);

      v39 = CFSTR("actions");
      -[TypistKeyboard _generateArgumentList:](self, "_generateArgumentList:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v29);

      -[TypistKeyboard typeKeystrokeStream:](self, "typeKeystrokeStream:", v14);
      if (v10)
        v10[2](v10, 0);

      v30 = 0;
      v12 = v37;
    }
    else
    {
      v34 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No key information was found for %@"), v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyNotFoundError"), 1, v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[TypistKeyboard _bailWithError:completion:](self, "_bailWithError:completion:", v30, v10);
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No key information was found for %@"), v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyNotFoundError"), 1, v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[TypistKeyboard _bailWithError:completion:](self, "_bailWithError:completion:", v30, v10);
  }

}

- (void)dragPopoverKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  int v11;
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
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("popover")),
        v10,
        v11))
  {
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v21 = (void *)MEMORY[0x24BDBCED8];
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("plane"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("basekey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryWithDictionary:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setValue:forKey:", CFSTR("taphold"), CFSTR("action"));
    objc_msgSend(v13, "addObject:", v22);
    objc_msgSend(v13, "addObject:", v9);
    v26[0] = CFSTR("keystroke");
    v26[1] = CFSTR("actions");
    v27[0] = v6;
    v27[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

    -[TypistKeyboard typeKeystrokeStream:](self, "typeKeystrokeStream:", v12);
    v19 = 0;
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No popover information was found for %@"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyNotFoundError"), 1, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
    v7[2](v7, v19);

}

- (void)flickKey:(id)a3 withDirection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!-[TypistKeyboard isTenKey](self, "isTenKey"))
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current keyboard is not a ten key implementation or is not a ten key implementation known to this version of Typist. Please file a radar."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyboardNotTenKeyError"), 1, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_8;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("gesture")) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("direction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v9);

  if (!v15)
  {
LABEL_8:
    v24 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No key information was found for %@ with direction %@"), v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyNotFoundError"), 1, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  -[TypistKeyboard keyPlanes](self, "keyPlanes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("plane"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("basekey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addObject:", v25);
  objc_msgSend(v17, "addObject:", v12);
  v31[0] = CFSTR("keystroke");
  v31[1] = CFSTR("actions");
  v32[0] = v8;
  v32[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v21);

  -[TypistKeyboard typeKeystrokeStream:](self, "typeKeystrokeStream:", v16);
  v22 = 0;
LABEL_9:

LABEL_10:
  if (v10)
    v10[2](v10, v22);

}

- (void)swipeGestureKey:(id)a3 withDirection:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TypistKeyboard *v25;
  id v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboard findKeyOnCurrentPlane:](self, "findKeyOnCurrentPlane:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11
    && (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("type")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("gesture")),
        v13,
        v14))
  {
    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v26 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("plane"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("basekey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v25 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v26;
    objc_msgSend(v16, "addObject:", v21);
    objc_msgSend(v16, "addObject:", v12);
    v29[0] = CFSTR("keystroke");
    v29[1] = CFSTR("actions");
    v30[0] = v26;
    v30[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v22);

    -[TypistKeyboard typeKeystrokeStream:](v25, "typeKeystrokeStream:", v15);
    v23 = 0;
  }
  else
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No gesture information was found for %@"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyNotFoundError"), 1, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9)
    v9[2](v9, v23);

}

- (void)swipeGestureOrFlickKey:(id)a3 withDirection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[TypistKeyboard isAvailableFlickOnCurrentPlane:withDirection:](self, "isAvailableFlickOnCurrentPlane:withDirection:", v8, v9))
  {
    -[TypistKeyboard flickKey:withDirection:completion:](self, "flickKey:withDirection:completion:", v8, v9, v10);
  }
  else if (-[TypistKeyboard isAvailableGestureOnCurrentPlane:withDirection:](self, "isAvailableGestureOnCurrentPlane:withDirection:", v8, v9))
  {
    -[TypistKeyboard swipeGestureKey:withDirection:completion:](self, "swipeGestureKey:withDirection:completion:", v8, v9, v10);
  }
  else if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No gesture or flick information was found for %@ in direction \"%@\" "), v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("TypistKeyNotFoundInSpecifiedDirectionError"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, v14);
  }

}

@end
