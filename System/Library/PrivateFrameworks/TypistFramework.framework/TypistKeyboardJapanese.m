@implementation TypistKeyboardJapanese

- (id)init:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardJapanese;
  v4 = -[TypistKeyboard init:options:locale:](&v7, sel_init_options_locale_, a3, a4, CFSTR("ja_JP"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setHasCandidatesToCommit:", 0);
  return v5;
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
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
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[TypistKeyboardJapanese setMultiTapOrbit:](self, "setMultiTapOrbit:", v8);

  objc_msgSend(v6, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsString:", CFSTR("kana"));

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("iPhone");
    if (objc_msgSend(v11, "userInterfaceIdiom") == 1 && !-[TypistKeyboard isFloating](self, "isFloating"))
      v12 = CFSTR("iPad");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keyboard-ja_JP-Kana-%@.plist"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard keysDataForInputMode:andFileName:](self, "keysDataForInputMode:andFileName:", CFSTR("ja"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardJapanese setFlickTable:](self, "setFlickTable:", v14);

  }
  v36.receiver = self;
  v36.super_class = (Class)TypistKeyboardJapanese;
  -[TypistKeyboard setupKeyboardInfo:options:](&v36, sel_setupKeyboardInfo_options_, v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[TypistKeyboard setUsePopupKeys:](self, "setUsePopupKeys:", 1);
    -[TypistKeyboard keyboardID](self, "keyboardID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsString:", CFSTR("-Flick"));

    if (v17)
      -[TypistKeyboard setFlickTyping:](self, "setFlickTyping:", 1);
    +[TypistCandidateBar initWithTypistKeyboard:](TypistCandidateBar, "initWithTypistKeyboard:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setCandidatebar:](self, "setCandidatebar:", v18);

    if (-[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard"))
    {
      -[TypistKeyboardJapanese setBaseCharacters:](self, "setBaseCharacters:", &unk_251A99448);
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ゔづぱぴぷぺぽ"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboardJapanese setDoubleAccentCharacterSet:](self, "setDoubleAccentCharacterSet:", v19);

      if (-[TypistKeyboardJapanese isTenKey](self, "isTenKey"))
      {
        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("alphabet-plane"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("↨"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardJapanese setUpdownKey:](self, "setUpdownKey:", v22);

        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("☻"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardJapanese setAccentKey:](self, "setAccentKey:", v26);

        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR(""));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardJapanese setMultiTapCompleteKey:](self, "setMultiTapCompleteKey:", v30);

      }
      else
      {
        -[TypistKeyboardJapanese setUpdownKey:](self, "setUpdownKey:", 0);
        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("゛"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardJapanese setAccentKey:](self, "setAccentKey:", v34);

        -[TypistKeyboardJapanese setMultiTapCompleteKey:](self, "setMultiTapCompleteKey:", 0);
      }
    }
  }

  return v15;
}

- (void)setupExtraKeyplaneDataIfNeeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[TypistKeyboardData isKeyboardUIOutOfProcess](TypistKeyboardData, "isKeyboardUIOutOfProcess")
    && -[TypistKeyboardJapanese isTenKey](self, "isTenKey"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("multiTapOrbit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardJapanese setMultiTapOrbit:](self, "setMultiTapOrbit:", v4);

  }
}

- (BOOL)usesMecabraCandidateBar
{
  return 1;
}

- (BOOL)isHandwriting
{
  void *v2;
  char v3;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("ja_JP-HWR@"));

  return v3;
}

- (BOOL)isTenKey
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "userInterfaceIdiom") != 1 || -[TypistKeyboard isFloating](self, "isFloating"))
    && -[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard");

  return v4;
}

- (BOOL)isKanaKeyboard
{
  void *v2;
  void *v3;
  char v4;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("kana"));

  return v4;
}

- (BOOL)_canMultiTap
{
  void *v3;
  void *v4;
  int v5;

  if (-[TypistKeyboardJapanese isTenKey](self, "isTenKey"))
  {
    -[TypistKeyboard keyboardID](self, "keyboardID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsString:", CFSTR("flick")) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
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
  if (-[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard"))
  {
    v14 = v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TypistKeyboardJapanese;
    -[TypistKeyboard addKeyboardPopupKeys:inPlane:addTo:keyplaneKeycaps:](&v17, sel_addKeyboardPopupKeys_inPlane_addTo_keyplaneKeycaps_, v10, v11, v12, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("TenKey-Alphabet-Keyplane-Switch")) & 1) != 0)
  {
    v5 = CFSTR("alphabet-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("FiftyOn-Alphabet-Keyplane-Switch")) & 1) != 0)
  {
    v5 = CFSTR("alphabet-small-letter-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("FiftyOn-SymbolNumber-Keyplane-Switch")) & 1) != 0)
  {
    v5 = CFSTR("symbolnumber-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("FiftyOn-Kana-Keyplane-Switch")) & 1) != 0)
  {
    v5 = CFSTR("kana-plane");
  }
  else if (-[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard")
         && !-[TypistKeyboardJapanese isTenKey](self, "isTenKey")
         && (objc_msgSend(v4, "containsString:", CFSTR("Fullwidth-Key-To-")) & 1) != 0)
  {
    v5 = CFSTR("全");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TypistKeyboardJapanese;
    -[TypistKeyboard changeKeyNameToGenericCharacter:](&v7, sel_changeKeyNameToGenericCharacter_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  id v4;
  __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  int v22;
  id v24;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard"))
  {
    v33.receiver = self;
    v33.super_class = (Class)TypistKeyboardJapanese;
    -[TypistKeyboard generateKeyplaneSwitchTable:](&v33, sel_generateKeyplaneSwitchTable_, v4);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v42.receiver = self;
  v42.super_class = (Class)TypistKeyboardJapanese;
  v24 = v4;
  -[TypistKeyboard generateKeyplaneSwitchTableFor10Key:](&v42, sel_generateKeyplaneSwitchTableFor10Key_, v4);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (!v28)
    goto LABEL_20;
  v26 = *(_QWORD *)v39;
  v5 = CFSTR("-plane");
  v6 = CFSTR("-fullwidth");
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v39 != v26)
        objc_enumerationMutation(obj);
      v29 = v7;
      v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
      objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - -[__CFString length](v5, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v32 = v10;
      objc_msgSend(v10, "allKeys");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v35;
        do
        {
          v14 = 0;
          v30 = v12;
          do
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v31);
            v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
            objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - -[__CFString length](v5, "length"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringByAppendingString:", v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "isEqualToString:", v16))
            {

            }
            else
            {
              objc_msgSend(v16, "stringByAppendingString:", v6);
              v18 = v13;
              v19 = v6;
              v20 = v5;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", v9);

              v5 = v20;
              v6 = v19;
              v13 = v18;
              v12 = v30;

              if (!v22)
                goto LABEL_16;
            }
            objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("全"), v15);
LABEL_16:

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v12);
      }

      v7 = v29 + 1;
    }
    while (v29 + 1 != v28);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  }
  while (v28);
LABEL_20:

  v4 = v24;
LABEL_22:

  return v27;
}

- (id)getPostfixKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard"))
  {
    -[TypistKeyboardJapanese baseCharacters](self, "baseCharacters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      if (-[TypistKeyboardJapanese isTenKey](self, "isTenKey"))
      {

LABEL_11:
        -[TypistKeyboardJapanese baseCharacters](self, "baseCharacters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      v8 = -[TypistKeyboard flickTyping](self, "flickTyping");

      if (!v8)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

  if (v10)
  {
    objc_msgSend(v4, "lowercaseString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v4;
  }
  v12 = v11;
LABEL_12:

  return v12;
}

- (id)addAccentKeyAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  int v21;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard"))
    goto LABEL_21;
  -[TypistKeyboardJapanese baseCharacters](self, "baseCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0)))
    {
      v17 = -[TypistKeyboardJapanese isTenKey](self, "isTenKey");

      if (v17)
      {
        -[TypistKeyboardJapanese updownKey](self, "updownKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v10;
        v18 = (void *)MEMORY[0x24BDBCE30];
        v19 = (uint64_t *)&v24;
LABEL_12:
        objc_msgSend(v18, "arrayWithObjects:count:", v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {

    }
    if (-[TypistKeyboardJapanese _canMultiTap](self, "_canMultiTap")
      && -[TypistKeyboard flickTyping](self, "flickTyping")
      && -[TypistKeyboardJapanese isTenKey](self, "isTenKey"))
    {
      -[TypistKeyboard findKeyOnAnyPlane:](self, "findKeyOnAnyPlane:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_shouldNotTapArrowKey(v4))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("gesture"));

        if (!v21)
        {
          -[TypistKeyboardJapanese multiTapCompleteKey](self, "multiTapCompleteKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v11;
          v12 = (void *)MEMORY[0x24BDBCE30];
          v13 = &v23;
          v14 = 1;
          goto LABEL_7;
        }
      }

    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  if (-[TypistKeyboard flickTyping](self, "flickTyping") && !-[TypistKeyboardJapanese isTenKey](self, "isTenKey"))
    goto LABEL_21;
  -[TypistKeyboardJapanese doubleAccentCharacterSet](self, "doubleAccentCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

  -[TypistKeyboardJapanese accentKey](self, "accentKey");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    v25 = v9;
    v18 = (void *)MEMORY[0x24BDBCE30];
    v19 = &v25;
    goto LABEL_12;
  }
  v26[0] = v9;
  -[TypistKeyboardJapanese accentKey](self, "accentKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  v12 = (void *)MEMORY[0x24BDBCE30];
  v13 = (void **)v26;
  v14 = 2;
LABEL_7:
  objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_22:

  return v15;
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  objc_super v47;
  objc_super v48;

  v4 = a3;
  if (-[TypistKeyboardJapanese isKanaKeyboard](self, "isKanaKeyboard"))
  {
    -[TypistKeyboardJapanese _convertKanaStringstoMultiTapNecessary:](self, "_convertKanaStringstoMultiTapNecessary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TYLog(CFSTR("Japanese keys to be typed (in Kana): %@"), v6, v7, v8, v9, v10, v11, v12, (char)v5);
    v48.receiver = self;
    v48.super_class = (Class)TypistKeyboardJapanese;
    -[TypistKeyboard generateKeystrokeStream:](&v48, sel_generateKeystrokeStream_, v5);
LABEL_5:
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  -[TypistKeyboard keyboardID](self, "keyboardID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsString:", CFSTR("sw=QWERTY"));

  if (v14)
  {
    -[TypistKeyboardJapanese _convertKanaStringstoRomajiIfNecessary:](self, "_convertKanaStringstoRomajiIfNecessary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TYLog(CFSTR("Japanese keys to be typed (in Romaji): %@"), v15, v16, v17, v18, v19, v20, v21, (char)v5);
    v47.receiver = self;
    v47.super_class = (Class)TypistKeyboardJapanese;
    -[TypistKeyboard generateKeystrokeStream:](&v47, sel_generateKeystrokeStream_, v5);
    goto LABEL_5;
  }
  if (-[TypistKeyboardJapanese isHandwriting](self, "isHandwriting"))
  {
    -[TypistKeyboardJapanese _determineHandwritingBound](self, "_determineHandwritingBound");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    TYLog(CFSTR("Text to be handwritten: %@"), v39, v40, v41, v42, v43, v44, v45, (char)v4);
    -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:](self, "generateHandwritingStream:inFrame:isPencil:", v4, 0, v32, v34, v36, v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TYLog(CFSTR("The current input mode is unknown or unsupported at this time. Please file a radar."), v24, v25, v26, v27, v28, v29, v30, v46);
    v22 = 0;
  }
LABEL_6:

  return v22;
}

- (CGRect)_determineHandwritingBound
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  +[TypistKeyboardUtilities findKeyBoundsInKeyboard:](TypistKeyboardUtilities, "findKeyBoundsInKeyboard:", CFSTR("Handwriting-Input"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_flickGestureDirection
{
  if (_flickGestureDirection_onceToken_0 != -1)
    dispatch_once(&_flickGestureDirection_onceToken_0, &__block_literal_global_8);
  return (id)_flickGestureDirection_flickGestureDirection_0;
}

void __48__TypistKeyboardJapanese__flickGestureDirection__block_invoke()
{
  void *v0;

  v0 = (void *)_flickGestureDirection_flickGestureDirection_0;
  _flickGestureDirection_flickGestureDirection_0 = (uint64_t)&unk_251A990D8;

}

- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
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
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  TypistKeyboardJapanese *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  objc_super v73;
  _QWORD v74[9];
  _QWORD v75[9];
  _QWORD v76[2];
  _QWORD v77[4];

  v77[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v70 = a6;
  if (-[TypistKeyboardJapanese isTenKey](self, "isTenKey") && (objc_msgSend(v11, "modifiesKeyplane") & 1) == 0)
  {
    objc_msgSend(v11, "fullRepresentedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = self;
    v72 = v13;
    if ((unint64_t)objc_msgSend(v13, "length") >= 2)
    {
      v14 = 1;
      do
      {
        objc_msgSend(v13, "substringWithRange:", v14, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardJapanese multiTapOrbit](self, "multiTapOrbit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          ++v14;
        }
        else
        {
          -[TypistKeyboardJapanese multiTapOrbit](self, "multiTapOrbit");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v76[1] = CFSTR("taps");
          v77[0] = v12;
          v76[0] = CFSTR("basekey");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", ++v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v77[1] = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v20, v15);

          self = v68;
        }

        v13 = v72;
      }
      while (v14 < objc_msgSend(v72, "length"));
    }
    v66 = v12;
    -[TypistKeyboardJapanese flickTable](self, "flickTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "displayString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Roman-Accent-%@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v25;
    objc_msgSend(v25, "objectForKey:", CFSTR("Strings"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v28;
    objc_msgSend(v28, "componentsSeparatedByCharactersInSet:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = v11;
    objc_msgSend(v11, "frame");
    UIRectGetCenter();
    -[TypistKeyboard centerOfKey:withOffset:](self, "centerOfKey:withOffset:");
    v32 = v31;
    v34 = v33;
    v71 = v30;
    if ((unint64_t)objc_msgSend(v30, "count") >= 2)
    {
      v35 = 1;
      v36 = 4;
      while (v36)
      {
        objc_msgSend(v71, "objectAtIndexedSubscript:", v35);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboardJapanese _flickGestureDirection](v68, "_flickGestureDirection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v35 - 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v73.receiver = v68;
        v73.super_class = (Class)TypistKeyboardJapanese;
        LODWORD(v39) = 1118175232;
        -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v73, sel_calculateCoordinatesForFlickGesture_direction_offset_, v38, v32, v34, v39);
        v41 = v40;
        v43 = v42;

        v74[0] = CFSTR("key");
        v74[1] = CFSTR("basekey");
        v75[0] = v69;
        v75[1] = v66;
        v75[2] = CFSTR("flick");
        v74[2] = CFSTR("action");
        v74[3] = CFSTR("x");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v75[3] = v44;
        v74[4] = CFSTR("y");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v75[4] = v45;
        v75[5] = v70;
        v74[5] = CFSTR("plane");
        v74[6] = CFSTR("type");
        v75[6] = CFSTR("gesture");
        v74[7] = CFSTR("more-after");
        objc_msgSend(v67, "cache");
        v46 = v10;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKey:", CFSTR("more-after"));
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)v48;
        v50 = &unk_251A95858;
        if (v48)
          v50 = (void *)v48;
        v75[7] = v50;
        v74[8] = CFSTR("direction");
        -[TypistKeyboardJapanese _flickGestureDirection](v68, "_flickGestureDirection");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", v35 - 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v75[8] = v52;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 9);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v46;
        objc_msgSend(v46, "setObject:forKey:", v53, v69);

        ++v35;
        --v36;
        if (v35 >= objc_msgSend(v71, "count"))
          goto LABEL_17;
      }
      v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "representedString");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      TYLog(CFSTR("%@ - setupTenKey: WARNING! More than 4 flicks found for %@ - %@"), v56, v57, v58, v59, v60, v61, v62, (char)v55);

    }
LABEL_17:

    v12 = v66;
    v11 = v67;
  }

}

- (void)setup50OnFlick:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  TypistKeyboardJapanese *v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;
  _QWORD v51[9];
  _QWORD v52[11];

  v52[9] = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v10 = a4;
  v48 = a5;
  v47 = a6;
  -[TypistKeyboardJapanese flickTable](self, "flickTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "displayString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Roman-Accent-%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v44 = v15;
    objc_msgSend(v15, "objectForKey:", CFSTR("Strings"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v18;
    objc_msgSend(v18, "componentsSeparatedByCharactersInSet:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "frame");
    UIRectGetCenter();
    -[TypistKeyboard centerOfKey:withOffset:](self, "centerOfKey:withOffset:");
    v22 = v21;
    v24 = v23;
    if ((unint64_t)objc_msgSend(v20, "count") >= 2)
    {
      v25 = 1;
      v45 = v20;
      v46 = self;
      do
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26 && objc_msgSend(v26, "length"))
        {
          -[TypistKeyboardJapanese _flickGestureDirection](self, "_flickGestureDirection");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", v25 - 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v50.receiver = self;
          v50.super_class = (Class)TypistKeyboardJapanese;
          LODWORD(v30) = 1118175232;
          -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v50, sel_calculateCoordinatesForFlickGesture_direction_offset_, v29, v22, v24, v30);
          v32 = v31;
          v51[0] = CFSTR("key");
          v51[1] = CFSTR("basekey");
          v52[0] = v27;
          v52[1] = v48;
          v52[2] = CFSTR("flick");
          v51[2] = CFSTR("action");
          v51[3] = CFSTR("x");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v52[3] = v34;
          v51[4] = CFSTR("y");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v52[4] = v35;
          v52[5] = v47;
          v51[5] = CFSTR("plane");
          v51[6] = CFSTR("type");
          v52[6] = CFSTR("gesture");
          v51[7] = CFSTR("more-after");
          objc_msgSend(v10, "cache");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKey:", CFSTR("more-after"));
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          v39 = &unk_251A95858;
          if (v37)
            v39 = (void *)v37;
          v51[8] = CFSTR("direction");
          v52[7] = v39;
          v52[8] = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 9);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v27);
          v41 = v10;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:forKey:", v40, v42);

          v10 = v41;
          v20 = v45;

          self = v46;
        }

        ++v25;
      }
      while (v25 < objc_msgSend(v20, "count"));
    }

    v15 = v44;
  }

}

- (id)_convertKanaStringstoMultiTapNecessary:(id)a3
{
  id v4;
  id v5;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  TypistKeyboardJapanese *v23;
  void *v24;

  v4 = a3;
  if (-[TypistKeyboardJapanese _canMultiTap](self, "_canMultiTap")
    && !-[TypistKeyboard flickTyping](self, "flickTyping"))
  {
    v5 = (id)objc_opt_new();
    if (!objc_msgSend(v4, "length"))
      goto LABEL_4;
    v7 = 0;
    v23 = self;
    v24 = v4;
    while (1)
    {
      objc_msgSend(v4, "substringWithRange:", v7, 1, v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboardJapanese addAccentKeyAction:](self, "addAccentKeyAction:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[TypistKeyboardJapanese getPostfixKey:](self, "getPostfixKey:", v8);
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
      -[TypistKeyboardJapanese multiTapOrbit](self, "multiTapOrbit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        break;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("taps"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("basekey"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_13;
LABEL_14:
      if (objc_msgSend(v9, "count"))
      {
        v16 = 0;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("key"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v18);

          ++v16;
        }
        while (v16 < objc_msgSend(v9, "count"));
      }
      self = v23;
      if (!_shouldNotTapArrowKey(v15))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("plane"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("symbolnumber-plane"));

        if ((v20 & 1) == 0)
        {
          -[TypistKeyboardJapanese multiTapCompleteKey](v23, "multiTapCompleteKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("key"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v22);

        }
      }

      ++v7;
      v4 = v24;
      if (v7 >= objc_msgSend(v24, "length"))
        goto LABEL_4;
    }
    v15 = v8;
    v14 = 1;
    do
    {
LABEL_13:
      objc_msgSend(v5, "appendString:", v15);
      --v14;
    }
    while (v14);
    goto LABEL_14;
  }
  v5 = v4;
LABEL_4:

  return v5;
}

- (id)_convertKanaStringstoRomajiIfNecessary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[a-z]"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") < 2
    || objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")))
  {
    v5 = v3;
  }
  else
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v3);
    CFStringTransform(v6, 0, (CFStringRef)*MEMORY[0x24BDBD640], 1u);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("n'"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("nn"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v8;
  }

  return v5;
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  return 0;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  return 0;
}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  void *v11;
  int v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[TypistKeyboardJapanese whiteSpaceCharSet](self, "whiteSpaceCharSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));

  if (v9)
    v10 = -[TypistKeyboard hasCandidatesToCommit](self, "hasCandidatesToCommit");
  else
    v10 = 1;
  -[TypistKeyboard setHasCandidatesToCommit:](self, "setHasCandidatesToCommit:", v10);
  if (-[TypistKeyboard hasCandidatesToCommit](self, "hasCandidatesToCommit")
    && objc_msgSend(v6, "isEqualToString:", CFSTR("⏎")))
  {
    -[TypistKeyboard setHasCandidatesToCommit:](self, "setHasCandidatesToCommit:", 0);
LABEL_9:
    v13 = v7;
    goto LABEL_10;
  }
  -[TypistKeyboard getShiftPlaneForDefaultPlane](self, "getShiftPlaneForDefaultPlane");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v7);

  if (!v12)
    goto LABEL_9;
  -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v14 = v13;

  return v14;
}

- (id)whiteSpaceCharSet
{
  if (whiteSpaceCharSet___onceToken != -1)
    dispatch_once(&whiteSpaceCharSet___onceToken, &__block_literal_global_312);
  return (id)whiteSpaceCharSet___whiteSpaceCharSet;
}

void __43__TypistKeyboardJapanese_whiteSpaceCharSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" 　⇥⏎"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)whiteSpaceCharSet___whiteSpaceCharSet;
  whiteSpaceCharSet___whiteSpaceCharSet = v0;

}

- (int64_t)commitCandidate:(id)a3
{
  int64_t v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardJapanese;
  v4 = -[TypistKeyboard commitCandidate:](&v7, sel_commitCandidate_, a3);
  v5 = v4 < 0 && -[TypistKeyboard hasCandidatesToCommit](self, "hasCandidatesToCommit");
  -[TypistKeyboard setHasCandidatesToCommit:](self, "setHasCandidatesToCommit:", v5);
  return v4;
}

- (int64_t)commitCandidateAtIndex:(int64_t)a3
{
  int64_t v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardJapanese;
  v4 = -[TypistKeyboard commitCandidateAtIndex:](&v7, sel_commitCandidateAtIndex_, a3);
  v5 = v4 < 0 && -[TypistKeyboard hasCandidatesToCommit](self, "hasCandidatesToCommit");
  -[TypistKeyboard setHasCandidatesToCommit:](self, "setHasCandidatesToCommit:", v5);
  return v4;
}

- (TypistKeyboardJapanese)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardJapanese *v5;
  uint64_t v6;
  NSDictionary *baseCharacters;
  uint64_t v8;
  NSDictionary *accentKey;
  uint64_t v10;
  NSDictionary *updownKey;
  uint64_t v12;
  NSDictionary *multiTapCompleteKey;
  uint64_t v14;
  NSCharacterSet *doubleAccentCharacterSet;
  uint64_t v16;
  NSDictionary *flickTable;
  uint64_t v18;
  NSMutableDictionary *multiTapOrbit;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TypistKeyboardJapanese;
  v5 = -[TypistKeyboard initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseCharacters"));
    v6 = objc_claimAutoreleasedReturnValue();
    baseCharacters = v5->_baseCharacters;
    v5->_baseCharacters = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accentKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    accentKey = v5->_accentKey;
    v5->_accentKey = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updownKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    updownKey = v5->_updownKey;
    v5->_updownKey = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiTapCompleteKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    multiTapCompleteKey = v5->_multiTapCompleteKey;
    v5->_multiTapCompleteKey = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doubleAccentCharacterSet"));
    v14 = objc_claimAutoreleasedReturnValue();
    doubleAccentCharacterSet = v5->_doubleAccentCharacterSet;
    v5->_doubleAccentCharacterSet = (NSCharacterSet *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flickTable"));
    v16 = objc_claimAutoreleasedReturnValue();
    flickTable = v5->_flickTable;
    v5->_flickTable = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiTapOrbit"));
    v18 = objc_claimAutoreleasedReturnValue();
    multiTapOrbit = v5->_multiTapOrbit;
    v5->_multiTapOrbit = (NSMutableDictionary *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *baseCharacters;
  NSDictionary *accentKey;
  NSDictionary *updownKey;
  NSDictionary *multiTapCompleteKey;
  NSCharacterSet *doubleAccentCharacterSet;
  NSDictionary *flickTable;
  NSMutableDictionary *multiTapOrbit;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TypistKeyboardJapanese;
  -[TypistKeyboard encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  baseCharacters = self->_baseCharacters;
  if (baseCharacters)
    objc_msgSend(v4, "encodeObject:forKey:", baseCharacters, CFSTR("baseCharacters"));
  accentKey = self->_accentKey;
  if (accentKey)
    objc_msgSend(v4, "encodeObject:forKey:", accentKey, CFSTR("accentKey"));
  updownKey = self->_updownKey;
  if (updownKey)
    objc_msgSend(v4, "encodeObject:forKey:", updownKey, CFSTR("updownKey"));
  multiTapCompleteKey = self->_multiTapCompleteKey;
  if (multiTapCompleteKey)
    objc_msgSend(v4, "encodeObject:forKey:", multiTapCompleteKey, CFSTR("multiTapCompleteKey"));
  doubleAccentCharacterSet = self->_doubleAccentCharacterSet;
  if (doubleAccentCharacterSet)
    objc_msgSend(v4, "encodeObject:forKey:", doubleAccentCharacterSet, CFSTR("doubleAccentCharacterSet"));
  flickTable = self->_flickTable;
  if (flickTable)
    objc_msgSend(v4, "encodeObject:forKey:", flickTable, CFSTR("flickTable"));
  multiTapOrbit = self->_multiTapOrbit;
  if (multiTapOrbit)
    objc_msgSend(v4, "encodeObject:forKey:", multiTapOrbit, CFSTR("multiTapOrbit"));

}

- (NSDictionary)baseCharacters
{
  return self->_baseCharacters;
}

- (void)setBaseCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_baseCharacters, a3);
}

- (NSDictionary)accentKey
{
  return self->_accentKey;
}

- (void)setAccentKey:(id)a3
{
  objc_storeStrong((id *)&self->_accentKey, a3);
}

- (NSDictionary)updownKey
{
  return self->_updownKey;
}

- (void)setUpdownKey:(id)a3
{
  objc_storeStrong((id *)&self->_updownKey, a3);
}

- (NSDictionary)multiTapCompleteKey
{
  return self->_multiTapCompleteKey;
}

- (void)setMultiTapCompleteKey:(id)a3
{
  objc_storeStrong((id *)&self->_multiTapCompleteKey, a3);
}

- (NSCharacterSet)doubleAccentCharacterSet
{
  return self->_doubleAccentCharacterSet;
}

- (void)setDoubleAccentCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_doubleAccentCharacterSet, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiTapOrbit, 0);
  objc_storeStrong((id *)&self->_flickTable, 0);
  objc_storeStrong((id *)&self->_doubleAccentCharacterSet, 0);
  objc_storeStrong((id *)&self->_multiTapCompleteKey, 0);
  objc_storeStrong((id *)&self->_updownKey, 0);
  objc_storeStrong((id *)&self->_accentKey, 0);
  objc_storeStrong((id *)&self->_baseCharacters, 0);
}

@end
