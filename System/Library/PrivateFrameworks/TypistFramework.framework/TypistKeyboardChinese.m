@implementation TypistKeyboardChinese

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardChinese;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("zh_Han"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  objc_super v25;
  id v26;

  v6 = a4;
  v7 = a3;
  -[TypistKeyboard keysDataForInputMode:andFileName:](self, "keysDataForInputMode:andFileName:", CFSTR("zh"), CFSTR("Keyboard-zh.plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboardChinese setFlickTable:](self, "setFlickTable:", v8);

  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\s+"), 1, &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26;
  -[TypistKeyboardChinese setWhiteSpaceRegex:](self, "setWhiteSpaceRegex:", v9);

  -[TypistKeyboardChinese setPinyinMap:](self, "setPinyinMap:", &unk_251A992B8);
  v25.receiver = self;
  v25.super_class = (Class)TypistKeyboardChinese;
  -[TypistKeyboard setupKeyboardInfo:options:](&v25, sel_setupKeyboardInfo_options_, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[TypistKeyboard setUsePopupKeys:](self, "setUsePopupKeys:", 1);
    +[TypistCandidateBar initWithTypistKeyboard:](TypistCandidateBar, "initWithTypistKeyboard:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard setCandidatebar:](self, "setCandidatebar:", v12);

    -[TypistKeyboard keyboardID](self, "keyboardID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("zh_hant-zhuyin"));

    if (v15)
    {
      -[TypistKeyboard keyPlanes](self, "keyPlanes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR(" "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");
      -[TypistKeyboard keyPlanes](self, "keyPlanes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, CFSTR("ˉ"));

    }
  }
  return v11;
}

- (BOOL)_isPinyin
{
  void *v2;
  void *v3;
  char v4;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("pinyin"));

  return v4;
}

- (BOOL)_isWubihua
{
  void *v2;
  void *v3;
  char v4;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("wubihua"));

  return v4;
}

- (id)changeKeyNameToGenericCharacter:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("TenKey-Chinese-Wubihua-Alphabet-Keyplane-Switch-Key")) & 1) != 0)
  {
    v5 = CFSTR("alphabet-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("TenKey-Number-To-Number-Alternative-Keyplane-Switch-Key")) & 1) != 0)
  {
    v5 = CFSTR("number-alternative-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("TenKey-Pinyin-Keyplane-Switch-Key")) & 1) != 0)
  {
    v5 = CFSTR("pinyin-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("TenKey-Chinese-Number-Keyplane-Switch-Key")) & 1) != 0)
  {
    v5 = CFSTR("number-plane");
  }
  else if ((objc_msgSend(v4, "containsString:", CFSTR("TenKey-Wubihua-Keyplane-Switch-Key")) & 1) != 0)
  {
    v5 = CFSTR("wubihua-plane");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TypistKeyboardChinese;
    -[TypistKeyboard changeKeyNameToGenericCharacter:](&v7, sel_changeKeyNameToGenericCharacter_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_flickGestureDirection
{
  if (_flickGestureDirection_onceToken != -1)
    dispatch_once(&_flickGestureDirection_onceToken, &__block_literal_global_1);
  return (id)_flickGestureDirection_flickGestureDirection;
}

void __47__TypistKeyboardChinese__flickGestureDirection__block_invoke()
{
  void *v0;

  v0 = (void *)_flickGestureDirection_flickGestureDirection;
  _flickGestureDirection_flickGestureDirection = (uint64_t)&unk_251A99090;

}

- (id)getPostfixKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  __CFString *v12;

  v4 = a3;
  if (-[TypistKeyboardChinese isTenKey](self, "isTenKey") && -[TypistKeyboardChinese _isPinyin](self, "_isPinyin"))
  {
    -[TypistKeyboardChinese pinyinMap](self, "pinyinMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = -[TypistKeyboard flickTyping](self, "flickTyping");

      if (!v9)
      {
        -[TypistKeyboardChinese pinyinMap](self, "pinyinMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  if (-[TypistKeyboardChinese isTenKey](self, "isTenKey")
    && -[TypistKeyboardChinese _isWubihua](self, "_isWubihua")
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("*")) & 1) != 0)
  {
    v12 = CFSTR("問");
  }
  else
  {
    v12 = (__CFString *)v4;
  }
LABEL_12:

  return v12;
}

- (BOOL)isPinyinCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 97, 26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "characterIsMember:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 65, 26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "characterIsMember:", v3);

  }
  return v5;
}

- (void)setupTenKey:(id)a3 forKey:(id)a4 keyName:(id)a5 planeName:(id)a6
{
  id v9;
  id v10;
  id v11;
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
  uint64_t v23;
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
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  TypistKeyboardChinese *v76;
  void *v77;
  void *v78;
  objc_super v79;
  _QWORD v80[9];
  _QWORD v81[11];

  v81[9] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (-[TypistKeyboardChinese isTenKey](self, "isTenKey") && (objc_msgSend(v10, "modifiesKeyplane") & 1) == 0)
  {
    v76 = self;
    if (objc_msgSend(v11, "containsString:", CFSTR("pinyin")))
    {
      -[TypistKeyboardChinese flickTable](self, "flickTable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v10, "displayString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Roman-Accent-%@-Pinyin-Plane"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Strings"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      self = v76;
      if (v19)
        goto LABEL_7;
    }
    -[TypistKeyboardChinese flickTable](self, "flickTable");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "displayString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Roman-Accent-%@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "objectForKey:", CFSTR("Direction"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_msgSend(v25, "isEqualToString:", CFSTR("flick"));

    if ((v23 & 1) == 0)
    {

      goto LABEL_20;
    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Strings"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
LABEL_7:
      v73 = v11;
      v74 = v9;
      -[TypistKeyboardChinese whiteSpaceRegex](self, "whiteSpaceRegex");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByReplacingMatchesInString:options:range:withTemplate:", v19, 0, 0, objc_msgSend(v19, "length"), CFSTR(" "));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v29;
      objc_msgSend(v29, "componentsSeparatedByCharactersInSet:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "mutableCopy");

      objc_msgSend(v32, "lastObject");
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeLastObject");
      v71 = (void *)v33;
      objc_msgSend(v32, "insertObject:atIndex:", v33, 1);
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToString:", v35);

      v75 = v10;
      objc_msgSend(v10, "frame");
      UIRectGetCenter();
      -[TypistKeyboard centerOfKey:withOffset:](self, "centerOfKey:withOffset:");
      v38 = v37;
      v40 = v39;
      if (v36)
        v41 = 2;
      else
        v41 = 1;
      v78 = v32;
      if (v41 < objc_msgSend(v32, "count"))
      {
        v42 = v41 - 6;
        while (v42)
        {
          objc_msgSend(v78, "objectAtIndexedSubscript:", v41);
          v43 = objc_claimAutoreleasedReturnValue();
          -[TypistKeyboardChinese _flickGestureDirection](v76, "_flickGestureDirection");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", v41 - 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v79.receiver = v76;
          v79.super_class = (Class)TypistKeyboardChinese;
          LODWORD(v46) = 1118175232;
          -[TypistKeyboard calculateCoordinatesForFlickGesture:direction:offset:](&v79, sel_calculateCoordinatesForFlickGesture_direction_offset_, v45, v38, v40, v46);
          v48 = v47;
          v50 = v49;

          v81[0] = v43;
          v51 = (void *)v43;
          v80[0] = CFSTR("key");
          v80[1] = CFSTR("basekey");
          objc_msgSend(v78, "objectAtIndexedSubscript:", 0);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v81[1] = v77;
          v81[2] = CFSTR("flick");
          v80[2] = CFSTR("action");
          v80[3] = CFSTR("x");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v81[3] = v52;
          v80[4] = CFSTR("y");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v81[4] = v53;
          v81[5] = v73;
          v80[5] = CFSTR("plane");
          v80[6] = CFSTR("type");
          v81[6] = CFSTR("gesture");
          v80[7] = CFSTR("more-after");
          objc_msgSend(v75, "cache");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKey:", CFSTR("more-after"));
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = (void *)v55;
          v57 = &unk_251A951F8;
          if (v55)
            v57 = (void *)v55;
          v81[7] = v57;
          v80[8] = CFSTR("direction");
          -[TypistKeyboardChinese _flickGestureDirection](v76, "_flickGestureDirection");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectAtIndexedSubscript:", v41 - 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v81[8] = v59;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 9);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKey:", v60, v51);

          ++v41;
          ++v42;
          if (v41 >= objc_msgSend(v78, "count"))
            goto LABEL_19;
        }
        v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "representedString");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        TYLog(CFSTR("%@ - setupTenKey: WARNING! More than 4 flicks found for %@ - %@"), v63, v64, v65, v66, v67, v68, v69, (char)v62);

      }
LABEL_19:

      v9 = v74;
      v10 = v75;
      v11 = v73;
    }
  }
LABEL_20:

}

- (void)setupSentenceBoundryStrings
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TypistKeyboardChinese;
  -[TypistKeyboard setupSentenceBoundryStrings](&v3, sel_setupSentenceBoundryStrings);
  -[TypistKeyboard setSentenceDelimitingCharacters:](self, "setSentenceDelimitingCharacters:", CFSTR(".?!。？！"));
}

- (BOOL)isAutoshiftedToCapitalPlane:(id)a3
{
  return 0;
}

- (BOOL)isTenKey
{
  void *v2;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsString:", CFSTR("sw=Pinyin10")) & 1) == 0)
  {
    -[TypistKeyboard keyboardID](self, "keyboardID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("sw=Wubihua"));
    if (v7
      && (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "userInterfaceIdiom") != 1))
    {
      v5 = 1;
    }
    else
    {
      -[TypistKeyboard keyboardID](self, "keyboardID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "containsString:", CFSTR("sw=Wubihua")))
      {
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
        {
          v5 = -[TypistKeyboard isFloating](self, "isFloating");

          if ((v7 & 1) == 0)
            goto LABEL_14;
        }
        else
        {

          v5 = 0;
          if ((v7 & 1) == 0)
          {
LABEL_14:

            goto LABEL_15;
          }
        }
      }
      else
      {

        v5 = 0;
        if (!v7)
          goto LABEL_14;
      }
    }

    goto LABEL_14;
  }
  v5 = 1;
LABEL_15:

  return v5;
}

- (BOOL)usesMecabraCandidateBar
{
  return 1;
}

- (BOOL)isHandwriting
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[TypistKeyboard keyboardID](self, "keyboardID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh_Hans-HWR@")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[TypistKeyboard keyboardID](self, "keyboardID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("zh_Hant-HWR@")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[TypistKeyboard keyboardID](self, "keyboardID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "hasPrefix:", CFSTR("yue_Hant-HWR@"));

    }
  }

  return v4;
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  id v4;
  char **v5;
  TypistKeyboardChinese **v6;
  void *v7;
  TypistKeyboardChinese *v9;
  TypistKeyboardChinese *v10;

  v4 = a3;
  if (-[TypistKeyboardChinese isTenKey](self, "isTenKey"))
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
  v6[1] = (TypistKeyboardChinese *)TypistKeyboardChinese;
  objc_msgSendSuper2((objc_super *)v6, *v5, v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  return 0;
}

- (id)willDirectlyCommitNumbersAndPunctuationSet
{
  if (willDirectlyCommitNumbersAndPunctuationSet_commitSet != -1)
    dispatch_once(&willDirectlyCommitNumbersAndPunctuationSet_commitSet, &__block_literal_global_228);
  return (id)willDirectlyCommitNumbersAndPunctuationSet_directlyCommitNumbersAndPunctuationSet;
}

void __67__TypistKeyboardChinese_willDirectlyCommitNumbersAndPunctuationSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)willDirectlyCommitNumbersAndPunctuationSet_directlyCommitNumbersAndPunctuationSet;
  willDirectlyCommitNumbersAndPunctuationSet_directlyCommitNumbersAndPunctuationSet = v0;

}

- (BOOL)keyWillCommitCandidate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[TypistKeyboardChinese willDirectlyCommitNumbersAndPunctuationSet](self, "willDirectlyCommitNumbersAndPunctuationSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "characterAtIndex:", 0);

  LOBYTE(v4) = objc_msgSend(v5, "characterIsMember:", v6);
  return (char)v4;
}

- (BOOL)isSwitchedToDefaultPlane:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[TypistKeyboardChinese willSwitchToDefaultPlaneCharacterSet](self, "willSwitchToDefaultPlaneCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "characterAtIndex:", 0);

  LOBYTE(v4) = objc_msgSend(v5, "characterIsMember:", v6);
  return (char)v4;
}

- (id)willSwitchToDefaultPlaneCharacterSet
{
  if (willSwitchToDefaultPlaneCharacterSet_defaultPlaneCharacterSetToken != -1)
    dispatch_once(&willSwitchToDefaultPlaneCharacterSet_defaultPlaneCharacterSetToken, &__block_literal_global_231);
  return (id)willSwitchToDefaultPlaneCharacterSet_willSwitchToDefaultPlaneCharacterSet;
}

void __61__TypistKeyboardChinese_willSwitchToDefaultPlaneCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)willSwitchToDefaultPlaneCharacterSet_willSwitchToDefaultPlaneCharacterSet;
  willSwitchToDefaultPlaneCharacterSet_willSwitchToDefaultPlaneCharacterSet = v0;

}

- (id)getExpectedPlaneNameForKey:(id)a3 currentPlane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[TypistKeyboard keyPlanes](self, "keyPlanes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("more-after"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "BOOLValue") & 1) != 0)
    goto LABEL_8;
  if (!-[TypistKeyboardChinese isTenKey](self, "isTenKey"))
  {
    -[TypistKeyboard getAlternatePlanesForDefaultPlane](self, "getAlternatePlanesForDefaultPlane");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", v7))
    {
      v13 = -[TypistKeyboardChinese isSwitchedToDefaultPlane:](self, "isSwitchedToDefaultPlane:", v6);

      if (!v13)
        goto LABEL_6;
LABEL_9:
      -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }

LABEL_8:
    goto LABEL_9;
  }

LABEL_6:
  v14 = v7;
LABEL_10:
  v15 = v14;

  return v15;
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[TypistKeyboardChinese isHandwriting](self, "isHandwriting"))
  {
    -[TypistKeyboardChinese _determineHandwritingBound](self, "_determineHandwritingBound");
    -[TypistKeyboard generateHandwritingStream:inFrame:isPencil:](self, "generateHandwritingStream:inFrame:isPencil:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TypistKeyboardChinese;
    -[TypistKeyboard generateKeystrokeStream:](&v8, sel_generateKeystrokeStream_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
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

- (TypistKeyboardChinese)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardChinese *v5;
  uint64_t v6;
  NSDictionary *flickTable;
  uint64_t v8;
  NSDictionary *pinyinMap;
  uint64_t v10;
  NSRegularExpression *whiteSpaceRegex;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TypistKeyboardChinese;
  v5 = -[TypistKeyboard initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flickTable"));
    v6 = objc_claimAutoreleasedReturnValue();
    flickTable = v5->_flickTable;
    v5->_flickTable = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinyinMap"));
    v8 = objc_claimAutoreleasedReturnValue();
    pinyinMap = v5->_pinyinMap;
    v5->_pinyinMap = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("whiteSpaceRegex"));
    v10 = objc_claimAutoreleasedReturnValue();
    whiteSpaceRegex = v5->_whiteSpaceRegex;
    v5->_whiteSpaceRegex = (NSRegularExpression *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *flickTable;
  NSDictionary *pinyinMap;
  NSRegularExpression *whiteSpaceRegex;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TypistKeyboardChinese;
  -[TypistKeyboard encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  flickTable = self->_flickTable;
  if (flickTable)
    objc_msgSend(v4, "encodeObject:forKey:", flickTable, CFSTR("flickTable"));
  pinyinMap = self->_pinyinMap;
  if (pinyinMap)
    objc_msgSend(v4, "encodeObject:forKey:", pinyinMap, CFSTR("pinyinMap"));
  whiteSpaceRegex = self->_whiteSpaceRegex;
  if (whiteSpaceRegex)
    objc_msgSend(v4, "encodeObject:forKey:", whiteSpaceRegex, CFSTR("whiteSpaceRegex"));

}

- (NSDictionary)flickTable
{
  return self->_flickTable;
}

- (void)setFlickTable:(id)a3
{
  objc_storeStrong((id *)&self->_flickTable, a3);
}

- (NSDictionary)pinyinMap
{
  return self->_pinyinMap;
}

- (void)setPinyinMap:(id)a3
{
  objc_storeStrong((id *)&self->_pinyinMap, a3);
}

- (NSRegularExpression)whiteSpaceRegex
{
  return self->_whiteSpaceRegex;
}

- (void)setWhiteSpaceRegex:(id)a3
{
  objc_storeStrong((id *)&self->_whiteSpaceRegex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteSpaceRegex, 0);
  objc_storeStrong((id *)&self->_pinyinMap, 0);
  objc_storeStrong((id *)&self->_flickTable, 0);
}

@end
