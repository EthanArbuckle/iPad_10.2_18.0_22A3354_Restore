@implementation TypistKeyboardKorean

- (id)init:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardKorean;
  v7 = -[TypistKeyboard init:options:locale:](&v11, sel_init_options_locale_, a3, v6, CFSTR("ko_KR"));
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("automaticallyTapsArrowKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("automaticallyTapsArrowKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAutomaticallyInsertsArrowKey:", objc_msgSend(v9, "BOOLValue"));

    }
    else
    {
      objc_msgSend(v7, "setAutomaticallyInsertsArrowKey:", 1);
    }

  }
  return v7;
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[TypistKeyboardKorean setMultiTapOrbit:](self, "setMultiTapOrbit:", v8);

  -[TypistKeyboard keysDataForInputMode:andFileName:](self, "keysDataForInputMode:andFileName:", CFSTR("ko"), CFSTR("Keyboard-ko.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboardKorean setFlickTable:](self, "setFlickTable:", v9);

  v12.receiver = self;
  v12.super_class = (Class)TypistKeyboardKorean;
  -[TypistKeyboard setupKeyboardInfo:options:](&v12, sel_setupKeyboardInfo_options_, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[TypistKeyboard setUsePopupKeys:](self, "setUsePopupKeys:", 1);
    -[TypistKeyboardKorean setHangul:](self, "setHangul:", &unk_251A99138);
    -[TypistKeyboardKorean setDoubleConsonantJong:](self, "setDoubleConsonantJong:", &unk_251A99150);
    -[TypistKeyboardKorean setDoubleConsonantSplitJong:](self, "setDoubleConsonantSplitJong:", &unk_251A99168);
    -[TypistKeyboardKorean setDoubleVowel:](self, "setDoubleVowel:", &unk_251A99180);
    -[TypistKeyboardKorean setDoubleVowelSplit:](self, "setDoubleVowelSplit:", &unk_251A99198);
    -[TypistKeyboardKorean setRadicalBreakdownMultiTap:](self, "setRadicalBreakdownMultiTap:", &unk_251A99470);
    -[TypistKeyboardKorean setRadicalBreakdownFlick:](self, "setRadicalBreakdownFlick:", &unk_251A99498);
  }
  return v10;
}

- (void)setupExtraKeyplaneDataIfNeeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[TypistKeyboardData isKeyboardUIOutOfProcess](TypistKeyboardData, "isKeyboardUIOutOfProcess")
    && -[TypistKeyboardKorean isTenKey](self, "isTenKey"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("multiTapOrbit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardKorean setMultiTapOrbit:](self, "setMultiTapOrbit:", v4);

  }
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  id v4;
  char **v5;
  TypistKeyboardKorean **v6;
  void *v7;
  TypistKeyboardKorean *v9;
  TypistKeyboardKorean *v10;

  v4 = a3;
  if (-[TypistKeyboardKorean isTenKey](self, "isTenKey"))
  {
    v10 = self;
    v5 = &selRef_generateKeyplaneSwitchTableFor10Key_;
    v6 = &v10;
  }
  else
  {
    v9 = self;
    v5 = &selRef_generateKeyplaneSwitchTable_;
    v6 = &v9;
  }
  v6[1] = (TypistKeyboardKorean *)TypistKeyboardKorean;
  objc_msgSendSuper2((objc_super *)v6, *v5, v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isTenKey
{
  void *v2;
  char v3;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("10Key"));

  return v3;
}

- (BOOL)usesMecabraCandidateBar
{
  return 0;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  return 0;
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  return 0;
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("Korean10Key-SymbolNumber-Keyplane-Switch")) & 1) != 0)
  {
    v5 = CFSTR("symbolnumber-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("TenKey-Alphabet-Keyplane-Switch")) & 1) != 0)
  {
    v5 = CFSTR("alphabet-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("Korean10Key-Keyplane-Switch")) & 1) != 0)
  {
    v5 = CFSTR("korean10key-plane");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TypistKeyboardKorean;
    -[TypistKeyboard changeKeyNameToGenericCharacter:](&v7, sel_changeKeyNameToGenericCharacter_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "containsString:", CFSTR("small-letters")))
  {
    v14 = v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TypistKeyboardKorean;
    -[TypistKeyboard addKeyboardPopupKeys:inPlane:addTo:keyplaneKeycaps:](&v17, sel_addKeyboardPopupKeys_inPlane_addTo_keyplaneKeycaps_, v10, v11, v12, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (id)generateKeystrokeStream:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  -[TypistKeyboardKorean decomposeKoreanStrings:](self, "decomposeKoreanStrings:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboardKorean _convertToMultiTapIfNecessary:](self, "_convertToMultiTapIfNecessary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  TYLog(CFSTR("Korean keys to be typed: %@"), v6, v7, v8, v9, v10, v11, v12, (char)v5);
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardKorean;
  -[TypistKeyboard generateKeystrokeStream:](&v15, sel_generateKeystrokeStream_, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)generateSwipeStream:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  -[TypistKeyboardKorean decomposeKoreanStrings:](self, "decomposeKoreanStrings:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Korean keys to be swiped: %@"), v5, v6, v7, v8, v9, v10, v11, (char)v4);
  v14.receiver = self;
  v14.super_class = (Class)TypistKeyboardKorean;
  -[TypistKeyboard generateSwipeStream:](&v14, sel_generateSwipeStream_, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_convertToMultiTapIfNecessary:(id)a3
{
  id v4;
  id v5;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[TypistKeyboardKorean isTenKey](self, "isTenKey") && !-[TypistKeyboard flickTyping](self, "flickTyping"))
  {
    v5 = (id)objc_opt_new();
    if (objc_msgSend(v4, "length"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v4, "substringWithRange:", v7, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardKorean multiTapOrbit](self, "multiTapOrbit");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = 1;
        if (!v10
          || (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("taps")),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v11 = objc_msgSend(v12, "unsignedIntegerValue"),
              v12,
              v11))
        {
          do
          {
            if (v10)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("basekey"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appendString:", v13);

            }
            else
            {
              objc_msgSend(v5, "appendString:", v8);
            }
            --v11;
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 < objc_msgSend(v4, "length"));
    }
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)_convertRadicalIfNeeded:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[TypistKeyboardKorean isTenKey](self, "isTenKey"))
  {
    v5 = (id)objc_opt_new();
    if (objc_msgSend(v4, "length"))
    {
      v6 = 0;
      do
      {
        objc_msgSend(v4, "substringWithRange:", v6, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[TypistKeyboard flickTyping](self, "flickTyping"))
          -[TypistKeyboardKorean radicalBreakdownFlick](self, "radicalBreakdownFlick");
        else
          -[TypistKeyboardKorean radicalBreakdownMultiTap](self, "radicalBreakdownMultiTap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (void *)v9;
        else
          v11 = v7;
        objc_msgSend(v5, "appendString:", v11);

        ++v6;
      }
      while (v6 < objc_msgSend(v4, "length"));
    }
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)decomposeKoreanStrings:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
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
  void *v34;
  id v35;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    v34 = v5;
    v35 = v4;
    do
    {
      v7 = objc_msgSend(v4, "characterAtIndex:", v6);
      if ((unsigned __int16)((unsigned __int16)(v7 + 21504) >> 2) > 0xAE8u)
      {
        objc_msgSend(v5, "appendFormat:", CFSTR("%C"), objc_msgSend(v4, "characterAtIndex:", v6));
      }
      else
      {
        v8 = (unsigned __int16)(v7 + 21504) / 0x24Cu;
        v9 = (unsigned __int16)(v7 + 21504) % 0x24Cu / 0x1C;
        v10 = (unsigned __int16)(v7 + 21504) % 0x1Cu;
        -[TypistKeyboardKorean hangul](self, "hangul");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[TypistKeyboardKorean doubleVowel](self, "doubleVowel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "indexOfObject:", v13);

        -[TypistKeyboardKorean hangul](self, "hangul");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[TypistKeyboardKorean doubleConsonantJong](self, "doubleConsonantJong");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "indexOfObject:", v18);

        -[TypistKeyboardKorean hangul](self, "hangul");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardKorean _convertRadicalIfNeeded:](self, "_convertRadicalIfNeeded:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[TypistKeyboardKorean doubleVowel](self, "doubleVowel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 >= objc_msgSend(v25, "count"))
        {
          -[TypistKeyboardKorean _convertRadicalIfNeeded:](self, "_convertRadicalIfNeeded:", v13);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[TypistKeyboardKorean doubleVowelSplit](self, "doubleVowelSplit");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[TypistKeyboardKorean _convertRadicalIfNeeded:](self, "_convertRadicalIfNeeded:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[TypistKeyboardKorean doubleConsonantJong](self, "doubleConsonantJong");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 >= objc_msgSend(v29, "count"))
        {
          -[TypistKeyboardKorean _convertRadicalIfNeeded:](self, "_convertRadicalIfNeeded:", v18);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[TypistKeyboardKorean doubleConsonantSplitJong](self, "doubleConsonantSplitJong");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v20);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[TypistKeyboardKorean _convertRadicalIfNeeded:](self, "_convertRadicalIfNeeded:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v5 = v34;

        objc_msgSend(v34, "appendString:", v24);
        objc_msgSend(v34, "appendString:", v28);
        objc_msgSend(v34, "appendString:", v32);

        v4 = v35;
      }
      if (-[TypistKeyboardKorean isTenKey](self, "isTenKey")
        && -[TypistKeyboardKorean automaticallyInsertsArrowKey](self, "automaticallyInsertsArrowKey"))
      {
        objc_msgSend(v5, "appendString:", CFSTR(""));
      }
      ++v6;
    }
    while (v6 < objc_msgSend(v4, "length"));
  }

  return v5;
}

- (id)_flickGestureDirection:(unint64_t)a3
{
  if (a3 - 3 > 2)
    return 0;
  else
    return (id)qword_251A7D0F0[a3 - 3];
}

- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  TypistKeyboardKorean *v23;
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
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  TypistKeyboardKorean *v82;
  objc_super v83;
  _QWORD v84[9];
  _QWORD v85[9];
  _QWORD v86[2];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[TypistKeyboardKorean isTenKey](self, "isTenKey") && (objc_msgSend(v11, "modifiesKeyplane") & 1) == 0)
  {
    v78 = v13;
    v79 = v10;
    v80 = v11;
    objc_msgSend(v11, "fullRepresentedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v12;
    v82 = self;
    if ((unint64_t)objc_msgSend(v14, "length") >= 2)
    {
      v15 = 1;
      do
      {
        -[TypistKeyboardKorean multiTapOrbit](self, "multiTapOrbit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = CFSTR("taps");
        v87[0] = v12;
        v86[0] = CFSTR("basekey");
        v17 = v15 + 1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15 + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v87[1] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringWithRange:", v15, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v19, v20);

        v12 = v81;
        v15 = v17;
        v21 = v17 >= objc_msgSend(v14, "length");
        self = v82;
      }
      while (!v21);
    }
    if (-[TypistKeyboard flickTyping](self, "flickTyping"))
    {
      -[TypistKeyboardKorean flickTable](self, "flickTable");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = self;
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "displayString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("Roman-Accent-%@"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Strings"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByTrimmingCharactersInSet:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        -[TypistKeyboardKorean flickTable](v23, "flickTable");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v80, "displayString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("Roman-Accent-%@-Korean10Key-Plane"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Strings"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringByTrimmingCharactersInSet:", v37);
        v38 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v38;
      }
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v30;
      objc_msgSend(v30, "componentsSeparatedByCharactersInSet:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v40, "mutableCopy");

      objc_msgSend(v41, "lastObject");
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removeLastObject");
      v75 = (void *)v42;
      objc_msgSend(v41, "insertObject:atIndex:", v42, 1);
      objc_msgSend(v80, "frame");
      UIRectGetCenter();
      -[TypistKeyboard centerOfKey:withOffset:](v23, "centerOfKey:withOffset:");
      v44 = v43;
      v46 = v45;
      v12 = v81;
      if ((unint64_t)objc_msgSend(v41, "count") >= 2)
      {
        v47 = 1;
        while (v47 != 6)
        {
          objc_msgSend(v41, "objectAtIndexedSubscript:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v48, "isEqualToString:", v12) & 1) == 0)
          {
            -[TypistKeyboardKorean _flickGestureDirection:](v23, "_flickGestureDirection:", objc_msgSend(v41, "count"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectAtIndexedSubscript:", v47 - 1);
            v50 = v41;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v83.receiver = v82;
            v83.super_class = (Class)TypistKeyboardKorean;
            LODWORD(v52) = 1118175232;
            -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v83, sel_calculateCoordinatesForFlickGesture_direction_offset_, v51, v44, v46, v52);
            v54 = v53;
            v56 = v55;

            v84[0] = CFSTR("key");
            v84[1] = CFSTR("basekey");
            v85[0] = v48;
            v85[1] = v12;
            v85[2] = CFSTR("flick");
            v84[2] = CFSTR("action");
            v84[3] = CFSTR("x");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v54);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v85[3] = v77;
            v84[4] = CFSTR("y");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v85[4] = v57;
            v85[5] = v78;
            v84[5] = CFSTR("plane");
            v84[6] = CFSTR("type");
            v85[6] = CFSTR("gesture");
            v84[7] = CFSTR("more-after");
            objc_msgSend(v80, "cache");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKey:", CFSTR("more-after"));
            v59 = objc_claimAutoreleasedReturnValue();
            v60 = (void *)v59;
            v61 = &unk_251A95870;
            if (v59)
              v61 = (void *)v59;
            v85[7] = v61;
            v84[8] = CFSTR("direction");
            -[TypistKeyboardKorean _flickGestureDirection:](v82, "_flickGestureDirection:", objc_msgSend(v50, "count"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectAtIndexedSubscript:", v47 - 1);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v85[8] = v63;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 9);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "setObject:forKey:", v64, v48);

            v12 = v81;
            v41 = v50;
            v23 = v82;

          }
          if (++v47 >= (unint64_t)objc_msgSend(v41, "count"))
            goto LABEL_20;
        }
        v65 = (objc_class *)objc_opt_class();
        NSStringFromClass(v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "representedString");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        TYLog(CFSTR("%@ - setupTenKey: WARNING! More than 5 flicks found for %@ - %@"), v67, v68, v69, v70, v71, v72, v73, (char)v66);

      }
LABEL_20:

      v10 = v79;
    }

    v11 = v80;
    v13 = v78;
  }

}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  id v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  objc_super v18;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (-[TypistKeyboardKorean isTenKey](self, "isTenKey"))
  {
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("alphabet-capital-letter-plane")))
    {
      v8 = objc_msgSend(v6, "isEqualToString:", CFSTR(""));
      v9 = CFSTR("alphabet-plane");
      if (!v8)
        v9 = v7;
      v10 = v9;
    }
    else
    {
      -[TypistKeyboard keyPlanes](self, "keyPlanes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("more-after"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if (v15)
      {
        -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = v7;
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)TypistKeyboardKorean;
    -[TypistKeyboard getExpectedPlaneNameForKey:currentPlane:](&v18, sel_getExpectedPlaneNameForKey_currentPlane_, v6, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v10;

  return v16;
}

- (TypistKeyboardKorean)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardKorean *v5;
  uint64_t v6;
  NSArray *hangul;
  uint64_t v8;
  NSArray *doubleConsonantJong;
  uint64_t v10;
  NSArray *doubleConsonantSplitJong;
  uint64_t v12;
  NSArray *doubleVowel;
  uint64_t v14;
  NSArray *doubleVowelSplit;
  uint64_t v16;
  NSDictionary *radicalBreakdownMultiTap;
  uint64_t v18;
  NSDictionary *radicalBreakdownFlick;
  uint64_t v20;
  NSDictionary *flickTable;
  uint64_t v22;
  NSMutableDictionary *multiTapOrbit;
  uint64_t v24;
  NSDictionary *multiTapCompleteKey;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TypistKeyboardKorean;
  v5 = -[TypistKeyboard initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hangul"));
    v6 = objc_claimAutoreleasedReturnValue();
    hangul = v5->_hangul;
    v5->_hangul = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doubleConsonantJong"));
    v8 = objc_claimAutoreleasedReturnValue();
    doubleConsonantJong = v5->_doubleConsonantJong;
    v5->_doubleConsonantJong = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doubleConsonantSplitJong"));
    v10 = objc_claimAutoreleasedReturnValue();
    doubleConsonantSplitJong = v5->_doubleConsonantSplitJong;
    v5->_doubleConsonantSplitJong = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doubleVowel"));
    v12 = objc_claimAutoreleasedReturnValue();
    doubleVowel = v5->_doubleVowel;
    v5->_doubleVowel = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doubleVowelSplit"));
    v14 = objc_claimAutoreleasedReturnValue();
    doubleVowelSplit = v5->_doubleVowelSplit;
    v5->_doubleVowelSplit = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radicalBreakdownMultiTap"));
    v16 = objc_claimAutoreleasedReturnValue();
    radicalBreakdownMultiTap = v5->_radicalBreakdownMultiTap;
    v5->_radicalBreakdownMultiTap = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radicalBreakdownFlick"));
    v18 = objc_claimAutoreleasedReturnValue();
    radicalBreakdownFlick = v5->_radicalBreakdownFlick;
    v5->_radicalBreakdownFlick = (NSDictionary *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flickTable"));
    v20 = objc_claimAutoreleasedReturnValue();
    flickTable = v5->_flickTable;
    v5->_flickTable = (NSDictionary *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiTapOrbit"));
    v22 = objc_claimAutoreleasedReturnValue();
    multiTapOrbit = v5->_multiTapOrbit;
    v5->_multiTapOrbit = (NSMutableDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiTapCompleteKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    multiTapCompleteKey = v5->_multiTapCompleteKey;
    v5->_multiTapCompleteKey = (NSDictionary *)v24;

    v5->_automaticallyInsertsArrowKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("automaticallyInsertsArrowKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *hangul;
  NSArray *doubleConsonantJong;
  NSArray *doubleConsonantSplitJong;
  NSArray *doubleVowel;
  NSArray *doubleVowelSplit;
  NSDictionary *radicalBreakdownMultiTap;
  NSDictionary *radicalBreakdownFlick;
  NSDictionary *flickTable;
  NSMutableDictionary *multiTapOrbit;
  NSDictionary *multiTapCompleteKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardKorean;
  -[TypistKeyboard encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  hangul = self->_hangul;
  if (hangul)
    objc_msgSend(v4, "encodeObject:forKey:", hangul, CFSTR("hangul"));
  doubleConsonantJong = self->_doubleConsonantJong;
  if (doubleConsonantJong)
    objc_msgSend(v4, "encodeObject:forKey:", doubleConsonantJong, CFSTR("doubleConsonantJong"));
  doubleConsonantSplitJong = self->_doubleConsonantSplitJong;
  if (doubleConsonantSplitJong)
    objc_msgSend(v4, "encodeObject:forKey:", doubleConsonantSplitJong, CFSTR("doubleConsonantSplitJong"));
  doubleVowel = self->_doubleVowel;
  if (doubleVowel)
    objc_msgSend(v4, "encodeObject:forKey:", doubleVowel, CFSTR("doubleVowel"));
  doubleVowelSplit = self->_doubleVowelSplit;
  if (doubleVowelSplit)
    objc_msgSend(v4, "encodeObject:forKey:", doubleVowelSplit, CFSTR("doubleVowelSplit"));
  radicalBreakdownMultiTap = self->_radicalBreakdownMultiTap;
  if (radicalBreakdownMultiTap)
    objc_msgSend(v4, "encodeObject:forKey:", radicalBreakdownMultiTap, CFSTR("radicalBreakdownMultiTap"));
  radicalBreakdownFlick = self->_radicalBreakdownFlick;
  if (radicalBreakdownFlick)
    objc_msgSend(v4, "encodeObject:forKey:", radicalBreakdownFlick, CFSTR("radicalBreakdownFlick"));
  flickTable = self->_flickTable;
  if (flickTable)
    objc_msgSend(v4, "encodeObject:forKey:", flickTable, CFSTR("flickTable"));
  multiTapOrbit = self->_multiTapOrbit;
  if (multiTapOrbit)
    objc_msgSend(v4, "encodeObject:forKey:", multiTapOrbit, CFSTR("multiTapOrbit"));
  multiTapCompleteKey = self->_multiTapCompleteKey;
  if (multiTapCompleteKey)
    objc_msgSend(v4, "encodeObject:forKey:", multiTapCompleteKey, CFSTR("multiTapCompleteKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_automaticallyInsertsArrowKey, CFSTR("automaticallyInsertsArrowKey"));

}

- (NSArray)hangul
{
  return self->_hangul;
}

- (void)setHangul:(id)a3
{
  objc_storeStrong((id *)&self->_hangul, a3);
}

- (NSArray)doubleConsonantJong
{
  return self->_doubleConsonantJong;
}

- (void)setDoubleConsonantJong:(id)a3
{
  objc_storeStrong((id *)&self->_doubleConsonantJong, a3);
}

- (NSArray)doubleConsonantSplitJong
{
  return self->_doubleConsonantSplitJong;
}

- (void)setDoubleConsonantSplitJong:(id)a3
{
  objc_storeStrong((id *)&self->_doubleConsonantSplitJong, a3);
}

- (NSArray)doubleVowel
{
  return self->_doubleVowel;
}

- (void)setDoubleVowel:(id)a3
{
  objc_storeStrong((id *)&self->_doubleVowel, a3);
}

- (NSArray)doubleVowelSplit
{
  return self->_doubleVowelSplit;
}

- (void)setDoubleVowelSplit:(id)a3
{
  objc_storeStrong((id *)&self->_doubleVowelSplit, a3);
}

- (NSDictionary)radicalBreakdownMultiTap
{
  return self->_radicalBreakdownMultiTap;
}

- (void)setRadicalBreakdownMultiTap:(id)a3
{
  objc_storeStrong((id *)&self->_radicalBreakdownMultiTap, a3);
}

- (NSDictionary)radicalBreakdownFlick
{
  return self->_radicalBreakdownFlick;
}

- (void)setRadicalBreakdownFlick:(id)a3
{
  objc_storeStrong((id *)&self->_radicalBreakdownFlick, a3);
}

- (NSDictionary)flickTable
{
  return self->_flickTable;
}

- (void)setFlickTable:(id)a3
{
  objc_storeStrong((id *)&self->_flickTable, a3);
}

- (NSMutableDictionary)multiTapOrbit
{
  return self->_multiTapOrbit;
}

- (void)setMultiTapOrbit:(id)a3
{
  objc_storeStrong((id *)&self->_multiTapOrbit, a3);
}

- (NSDictionary)multiTapCompleteKey
{
  return self->_multiTapCompleteKey;
}

- (void)setMultiTapCompleteKey:(id)a3
{
  objc_storeStrong((id *)&self->_multiTapCompleteKey, a3);
}

- (BOOL)automaticallyInsertsArrowKey
{
  return self->_automaticallyInsertsArrowKey;
}

- (void)setAutomaticallyInsertsArrowKey:(BOOL)a3
{
  self->_automaticallyInsertsArrowKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiTapCompleteKey, 0);
  objc_storeStrong((id *)&self->_multiTapOrbit, 0);
  objc_storeStrong((id *)&self->_flickTable, 0);
  objc_storeStrong((id *)&self->_radicalBreakdownFlick, 0);
  objc_storeStrong((id *)&self->_radicalBreakdownMultiTap, 0);
  objc_storeStrong((id *)&self->_doubleVowelSplit, 0);
  objc_storeStrong((id *)&self->_doubleVowel, 0);
  objc_storeStrong((id *)&self->_doubleConsonantSplitJong, 0);
  objc_storeStrong((id *)&self->_doubleConsonantJong, 0);
  objc_storeStrong((id *)&self->_hangul, 0);
}

@end
