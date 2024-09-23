@implementation TIKeyboardInputManager_ja_Kana

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (id)liveConversionTextInputManager
{
  TIKeyboardInputManagerLiveConversion_ja_Kana *v3;
  void *v4;
  void *v5;
  TIKeyboardInputManagerLiveConversion_ja_Kana *v6;
  TIKeyboardInputManager_ja_Inline *v7;
  void *v8;

  if (-[TIKeyboardInputManager_ja_Kana inHardwareKeyboardMode](self, "inHardwareKeyboardMode"))
  {
    v3 = [TIKeyboardInputManagerLiveConversion_ja_Kana alloc];
    -[TIKeyboardInputManager_ja_Kana config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TIKeyboardInputManagerLiveConversion_ja initWithConfig:keyboardState:](v3, "initWithConfig:keyboardState:", v4, v5);
  }
  else
  {
    v7 = [TIKeyboardInputManager_ja_Inline alloc];
    -[TIKeyboardInputManager_ja_Kana config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja wordSearch](self, "wordSearch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TIKeyboardInputManager_ja_Inline initWithConfig:keyboardState:wordSearch:romajiMode:](v7, "initWithConfig:keyboardState:wordSearch:romajiMode:", v4, v5, v8, 0);

  }
  return v6;
}

- (void)resetWordSearchWithClass:(Class)a3
{
  _BOOL4 knowSplitMode;
  id v6;
  void *v7;
  TIWordSearch *v8;
  TIWordSearch *kbws;
  id v10;

  if (!self->_knowSplitMode || !self->_knowHardwareMode || !*(&self->_knowSplitMode + 1))
  {
    -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hardwareKeyboardMode") & 1) == 0)
    {

      return;
    }
    knowSplitMode = self->_knowSplitMode;

    if (!knowSplitMode)
      return;
  }
  if ((-[TIWordSearch isMemberOfClass:](self->super._kbws, "isMemberOfClass:", a3) & 1) == 0)
  {
    v6 = [a3 alloc];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (TIWordSearch *)objc_msgSend(v6, "initTIWordSearchWithInputMode:", v7);
    kbws = self->super._kbws;
    self->super._kbws = v8;

    -[TIWordSearch setShouldLearnAcceptedCandidate:](self->super._kbws, "setShouldLearnAcceptedCandidate:", self->super._shouldLearnAcceptedCandidate);
    -[TIWordSearch setInsertKatakanaAtIndex:](self->super._kbws, "setInsertKatakanaAtIndex:", 4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[TIWordSearch setFlickOnly:](self->super._kbws, "setFlickOnly:", self->_knowInputMode);
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  -[TIKeyboardInputManager_ja syncToLayoutState:](&v10, sel_syncToLayoutState_, v4);
  self->_knowInputMode = objc_msgSend(v4, "canMultitap") ^ 1;
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  v6 = 1;
  if (v5 == 1)
    v6 = objc_msgSend(v4, "hasCandidateKey");
  self->_isFlickOnly = v6;
  self->_knowHardwareMode = 1;
  *(&self->_knowSplitMode + 1) = 1;
  -[TIKeyboardInputManager_ja_Kana setSupportsFlickAutocorrection:](self, "setSupportsFlickAutocorrection:", 1);
  if (self->_isFlickOnly)
    v7 = objc_opt_class();
  else
    v7 = 0;
  -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hardwareKeyboardMode");

  if (v9)
    v7 = objc_opt_class();
  -[TIKeyboardInputManager_ja_Kana resetWordSearchWithClass:](self, "resetWordSearchWithClass:", v7);
  -[TIKeyboardInputManager_ja_Kana buildFlickTables](self, "buildFlickTables");

}

- (id)keyboardConfigurationLayoutTag
{
  if (self->_isFlickOnly && -[TIKeyboardInputManager_ja inputCount](self, "inputCount"))
    return CFSTR("VoicedSoundMarkAndSemiVoicedSoundMarkAndSmallVariation");
  else
    return CFSTR("Default");
}

- (void)setInSplitKeyboardMode:(BOOL)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;

  -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom") != 1 || a3;
  self->_isFlickOnly = v7;

  if (self->_isFlickOnly)
  {
    -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hardwareKeyboardMode");

  }
  v9 = objc_opt_class();
  *(&self->_knowSplitMode + 1) = 1;
  -[TIKeyboardInputManager_ja_Kana resetWordSearchWithClass:](self, "resetWordSearchWithClass:", v9);
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v5 = objc_opt_class();
  self->_knowSplitMode = 1;
  -[TIKeyboardInputManager_ja_Kana resetWordSearchWithClass:](self, "resetWordSearchWithClass:", v5);
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  -[TIKeyboardInputManager_ja_Kana setInHardwareKeyboardMode:](&v6, sel_setInHardwareKeyboardMode_, v3);
}

- (void)buildFlickTables
{
  TIKeyboardInputManager_ja_Kana *v2;
  int *v3;
  id v4;
  id *p_kanaFlickDirectionMap_current;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  NSDictionary *v35;
  NSDictionary *kanaFlickDirectionMap_current;
  NSDictionary *v37;
  NSDictionary *kanaFlickKeyMap_current;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  TIKeyboardInputManager_ja_Kana *v45;
  NSDictionary *v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v2 = self;
  v54 = *MEMORY[0x24BDAC8D0];
  if (self->_isFlickOnly)
    v3 = &OBJC_IVAR___TIKeyboardInputManager_ja_Kana__kanaFlickDirectionMap_3x3;
  else
    v3 = &OBJC_IVAR___TIKeyboardInputManager_ja_Kana__kanaFlickDirectionMap_50on;
  v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v3);
  if (v4)
  {
    p_kanaFlickDirectionMap_current = (id *)&v2->_kanaFlickDirectionMap_current;
    if (v2->_isFlickOnly)
    {
      objc_storeStrong(p_kanaFlickDirectionMap_current, v2->_kanaFlickDirectionMap_3x3);
      v6 = 904;
    }
    else
    {
      objc_storeStrong(p_kanaFlickDirectionMap_current, v2->_kanaFlickDirectionMap_50on);
      v6 = 912;
    }
    objc_storeStrong((id *)&v2->_kanaFlickKeyMap_current, *(id *)((char *)&v2->super.super.super.super.super.super.isa + v6));
  }
  else
  {
    -[TIKeyboardInputManagerBase inputMode](v2, "inputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "normalizedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2->_isFlickOnly)
      v9 = CFSTR("iPhone");
    else
      v9 = CFSTR("iPad");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keyboard-%@-%@.plist"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    TIBundlePathForInputMode();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if (v14)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v12, 1, 0);
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v15, 0, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v40 = v15;
          v41 = v12;
          v42 = v11;
          v43 = v10;
          v44 = v8;
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" "));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2->_isFlickOnly)
            v17 = 43;
          else
            v17 = 38;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v17);
          v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          if (v2->_isFlickOnly)
            v19 = 11;
          else
            v19 = 30;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v19);
          v46 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v39 = v16;
          v20 = v16;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v50;
            v45 = v2;
            v47 = v20;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v50 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                if (objc_msgSend(v25, "hasPrefix:", CFSTR("Roman-Accent-")))
                {
                  v26 = objc_msgSend(v25, "characterAtIndex:", objc_msgSend(CFSTR("Roman-Accent-"), "length"));
                  v27 = v26;
                  if (!v2->_isFlickOnly || (_DWORD)v26 == 12289 || (unsigned __int16)(v26 - 12353) <= 0x53u)
                  {
                    objc_msgSend(v20, "objectForKey:", v25);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v28, "objectForKey:", CFSTR("Strings"));
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "componentsSeparatedByCharactersInSet:", v48);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v30, "count") == 5)
                      {
                        for (j = 1; j != 5; ++j)
                        {
                          objc_msgSend(v30, "objectAtIndexedSubscript:", j);
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v32, "length"))
                          {
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", j);
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            -[NSDictionary setObject:forKey:](v18, "setObject:forKey:", v33, v32);

                          }
                        }
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v27);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSDictionary setObject:forKey:](v46, "setObject:forKey:", v30, v34);

                        v2 = v45;
                      }

                      v20 = v47;
                    }

                  }
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
            }
            while (v22);
          }

          if (v2->_isFlickOnly)
          {
            -[TIKeyboardInputManager_ja_Kana setKanaFlickDirectionMap_3x3:](v2, "setKanaFlickDirectionMap_3x3:", v18);
            v35 = v46;
            -[TIKeyboardInputManager_ja_Kana setKanaFlickKeyMap_3x3:](v2, "setKanaFlickKeyMap_3x3:", v46);
          }
          else
          {
            -[TIKeyboardInputManager_ja_Kana setKanaFlickDirectionMap_50on:](v2, "setKanaFlickDirectionMap_50on:", v18);
            v35 = v46;
            -[TIKeyboardInputManager_ja_Kana setKanaFlickKeyMap_50on:](v2, "setKanaFlickKeyMap_50on:", v46);
          }
          v8 = v44;
          v4 = 0;
          v11 = v42;
          v10 = v43;
          v16 = v39;
          kanaFlickDirectionMap_current = v2->_kanaFlickDirectionMap_current;
          v2->_kanaFlickDirectionMap_current = v18;
          v37 = v18;

          kanaFlickKeyMap_current = v2->_kanaFlickKeyMap_current;
          v2->_kanaFlickKeyMap_current = v35;

          v15 = v40;
          v12 = v41;
        }

      }
    }

  }
}

- (unsigned)flickKeyForBaseKey:(unsigned __int16)a3 direction:(int)a4
{
  NSDictionary *kanaFlickKeyMap_current;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int16 v9;

  kanaFlickKeyMap_current = self->_kanaFlickKeyMap_current;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](kanaFlickKeyMap_current, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      v9 = objc_msgSend(v8, "characterAtIndex:", 0);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)needsTouchEvents
{
  return 1;
}

- (void)calculateGeometryForInput:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSDictionary *kanaFlickDirectionMap_current;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  _BOOL4 v14;
  TIInputManager *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double *v27;
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
  double v38;
  double v40;
  double v41;
  double v42;
  float v43;
  float v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  float v51;
  float *v52;
  int v53;
  __int16 v54;
  int v55;
  float *v56;
  _QWORD *v57;
  float *v58;
  _QWORD *v59;
  void *v60;
  uint64_t v61;
  unsigned int v62;
  float v63;
  float v64;
  float *v65;
  float *v66;
  uint64_t *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  int v74;
  _WORD v75[44];
  _QWORD v76[11];
  uint64_t v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "characterAtIndex:", 0);

  kanaFlickDirectionMap_current = self->_kanaFlickDirectionMap_current;
  objc_msgSend(v4, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](kanaFlickDirectionMap_current, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if ((v7 - 12353) >= 0x54)
  {
    v14 = v7 != 12289 && (_DWORD)v11 == 0;
    v12 = !self->_isFlickOnly || v14;
  }
  else
  {
    v12 = 0;
  }
  v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!(-858993459 * ((*((_QWORD *)v15 + 2) - *((_QWORD *)v15 + 1)) >> 3)))
    goto LABEL_17;
  v16 = TIInputManager::keys_for_input(v15);
  if (!v16)
    goto LABEL_17;
  v17 = (_QWORD *)v16;
  -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "hardwareKeyboardMode"))
  {

LABEL_17:
    -[TIKeyboardInputManagerMecabra restoreGeometryForInput:atIndex:](self, "restoreGeometryForInput:atIndex:", v4, v5);
    goto LABEL_18;
  }
  v19 = objc_msgSend(v4, "isMultitap") | v12;

  if (v19 == 1)
    goto LABEL_17;
  v20 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "touchEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "pathIndex"));
  v22 = objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerMecabra touchDownEvents](self, "touchDownEvents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerMecabra touchUpEvents](self, "touchUpEvents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)v22;
  objc_msgSend(v25, "objectForKey:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (double *)MEMORY[0x24BDBEFB0];
  if (v24)
  {
    objc_msgSend(v24, "location");
    v29 = v28;
    v31 = v30;
    if (v26)
    {
LABEL_21:
      objc_msgSend(v26, "location");
      v34 = *v27;
      v35 = v27[1];
      goto LABEL_24;
    }
  }
  else
  {
    v29 = *MEMORY[0x24BDBEFB0];
    v31 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    if (v26)
      goto LABEL_21;
  }
  v34 = *v27;
  v35 = v27[1];
  v32 = *v27;
  v33 = v35;
LABEL_24:
  v36 = v32 - v29;
  v37 = v33 - v31;
  v38 = hypot(v32 - v29, v33 - v31);
  if (v31 == v35 && v29 == v34)
    v40 = 0.0;
  else
    v40 = v38;
  if (!(_DWORD)v11 && v40 > 0.0)
  {
    v38 = atan2(-v37, v36) * 180.0 / 3.14159265;
    if (v38 < 0.0)
      v38 = v38 + 360.0;
    if (v38 <= 45.0)
    {
      v11 = 2;
    }
    else if (v38 <= 135.0)
    {
      v11 = 1;
    }
    else if (v38 <= 225.0)
    {
      v11 = 4;
    }
    else if (v38 <= 315.0)
    {
      v11 = 3;
    }
    else
    {
      v11 = 2;
    }
  }
  if (objc_msgSend(v4, "isFlick", v38))
  {
    v41 = v40 + -26.0;
    if (v40 + -26.0 < 1.0)
      v41 = 1.0;
    v42 = v41 * v41 * -0.0002;
    goto LABEL_49;
  }
  v43 = 0.0;
  if (v40 > 0.0)
  {
    v42 = -5.0 / v40;
LABEL_49:
    v43 = v42;
  }
  v69 = v26;
  v71 = v24;
  v73 = v5;
  if (TI_IS_WILDCAT())
    v44 = -3.0;
  else
    v44 = -2.0;
  if (*v17)
  {
    v74 = 0;
    v45 = 0;
    v46 = v17[1];
    v47 = 8 * *v17;
    do
    {
      if (*(float *)(*(_QWORD *)v46 + 32) < v44)
        break;
      v48 = *(_QWORD *)(*(_QWORD *)v46 + 8);
      v49 = *(_QWORD *)(v48 + 16);
      if (!v49)
        v49 = v48 + 24;
      v77 = v49;
      v78 = 0;
      v79 = *(unsigned __int16 *)(v48 + 8);
      v80 = 0;
      KB::String::iterator::initialize((KB::String::iterator *)&v77);
      v50 = v80;
      if ((v80 - 12353) < 0x54 || v80 == 12289 && self->_isFlickOnly)
      {
        v51 = *(float *)(*(_QWORD *)v46 + 32);
        v52 = (float *)&v76[v45];
        *(_WORD *)v52 = v80;
        v52[1] = v51;
        if ((_DWORD)v11)
        {
          v53 = -[TIKeyboardInputManager_ja_Kana flickKeyForBaseKey:direction:](self, "flickKeyForBaseKey:direction:", (unsigned __int16)v50, v11);
          if (v53)
          {
            v54 = v53;
            v55 = objc_msgSend(v4, "isFlick");
            if (v50 == 12289)
            {
              if (v55)
                *(_WORD *)v52 = v54;
            }
            else
            {
              if (v55)
                v52[1] = v43 + v51;
              else
                v51 = v43 + v51;
              v75[4 * v74] = v54;
              *(float *)&v75[4 * v74++ + 2] = v51;
            }
          }
        }
        if (++v45 == 10)
          break;
      }
      v46 += 8;
      v47 -= 8;
    }
    while (v47);
  }
  else
  {
    v45 = 0;
    v74 = 0;
  }
  v56 = (float *)v76;
  v57 = &v76[v45];
  *(_WORD *)v57 = 0;
  *((_DWORD *)v57 + 1) = 0;
  v58 = (float *)v75;
  v59 = &v75[4 * v74];
  *(_WORD *)v59 = 0;
  *((_DWORD *)v59 + 1) = 0;
  -[TIKeyboardInputManagerMecabra padGeometryForInput:atIndex:](self, "padGeometryForInput:atIndex:", v4, v73, v69);
  -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = 0;
  while (*(_WORD *)v56)
  {
    v63 = v56[1];
    if (!*(_WORD *)v58 || (v64 = v58[1], v63 > v64))
    {
      v65 = (float *)((char *)&v77 + v61);
      *(_WORD *)v65 = *(_WORD *)v56;
      v65[1] = v63;
      v56 += 2;
      goto LABEL_82;
    }
LABEL_81:
    v66 = (float *)((char *)&v77 + v61);
    *(_WORD *)v66 = *(_WORD *)v58;
    v66[1] = v64;
    v58 += 2;
LABEL_82:
    ++v62;
    v61 += 8;
  }
  if (*(_WORD *)v58)
  {
    v64 = v58[1];
    goto LABEL_81;
  }
  v67 = &v77 + v62;
  *(_WORD *)v67 = 0;
  *((_DWORD *)v67 + 1) = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v77, (v61 + 8) & 0x7FFFFFFF8);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "insertObject:atIndex:", v68, v73 - 1);

  if (-[TIKeyboardInputManager_ja_Kana isTypologyEnabled](self, "isTypologyEnabled"))
    -[TIKeyboardInputManagerMecabra saveTouchDataForEvent:atIndex:](self, "saveTouchDataForEvent:atIndex:", v4, v73 - 1);

LABEL_18:
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_1);
  return (id)-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__validCharSet;
}

- (id)geometryDataWithSubstitutedMultitapKeys:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  _WORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[22];

  v12[21] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(v3, "getBytes:length:", v12, v4);
  v5 = (v4 >> 3) - 1;
  if ((int)v5 >= 1)
  {
    v6 = v12;
    do
    {
      GetMultitapSequenceTable();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
        *v6 = objc_msgSend(v9, "characterAtIndex:", 0);

      v6 += 4;
      --v5;
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  unint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  unint64_t v79;
  void *v80;
  id v81;
  unint64_t v82;
  uint64_t v83;
  _WORD *v84;
  int v85;
  int v86;
  void *v87;
  unint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  unint64_t v92;
  void *v93;
  void *v94;
  unint64_t v95;
  __CFString *v96;
  void *v97;
  void *v98;
  unint64_t v99;
  unint64_t v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  objc_super v105;
  unsigned __int16 v106;
  _WORD v107[84];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && -[__CFString length](v8, "length"))
  {
    if (!-[TIKeyboardInputManager_ja flickUsed](self, "flickUsed") && objc_msgSend(v6, "isFlick"))
      -[TIKeyboardInputManager_ja setFlickUsed:](self, "setFlickUsed:", 1);
    v10 = -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
    if ((-[TIKeyboardInputManager_ja_Kana inHardwareKeyboardMode](self, "inHardwareKeyboardMode") & 1) != 0)
      v11 = 0;
    else
      v11 = objc_msgSend(v6, "isPopupVariant");
    -[TIKeyboardInputManager_ja stringByConvertingPunctuationForInput:isLockedInput:](self, "stringByConvertingPunctuationForInput:isLockedInput:", v9, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x24BEB5AA8];
    if (-[__CFString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BEB5AA8]))
    {
      if (self->_isFlickOnly && (_DWORD)v10)
        v14 = CFSTR("゛");
      else
        v14 = (const __CFString *)(id)*MEMORY[0x24BEB5A98];

      v12 = (__CFString *)v14;
    }
    v15 = -[__CFString characterAtIndex:](v12, "characterAtIndex:", 0);
    -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v104 = 0;
    if (objc_msgSend(v6, "isMultitap"))
    {
      if ((_DWORD)v10)
      {
        v96 = v12;
        v97 = v16;
        v102 = v7;
        -[TIKeyboardInputManager_ja inputString](self, "inputString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v10;
        v19 = v10 - 1;
        v20 = objc_msgSend(v18, "characterAtIndex:", v10 - 1);

        v107[0] = v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v107, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        GetMultitapSequenceTable();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "string");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToString:", v24);

        if (v25)
        {
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndex:", v19);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[TIKeyboardInputManager_ja_Kana isTypologyEnabled](self, "isTypologyEnabled"))
          {
            -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndex:", v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v17 = 0;
          }
        }
        else
        {
          v17 = 0;
          v104 = 0;
        }
        v7 = v102;
        v12 = v96;

        v16 = v97;
        v10 = v99;
      }
      else
      {
        v17 = 0;
        v104 = 0;
      }
      -[TIKeyboardInputManager_ja_Kana _deleteFromInput](self, "_deleteFromInput");
    }
    if (v15 == 8616)
    {
      if ((_DWORD)v10)
      {
        v103 = v17;
        -[TIKeyboardInputManager_ja inputString](self, "inputString");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v10;
        v28 = objc_msgSend(v98, "characterAtIndex:", v10 - 1);
        v107[0] = v28;
        objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v28) = objc_msgSend(v29, "characterIsMember:", v28);

        if ((_DWORD)v28)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v107, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lowercaseString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "characterIsMember:", v107[0]);

          if (!v51)
            goto LABEL_49;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v107, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "uppercaseString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v31)
        {
          -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", 0, 1, v31);
          v52 = objc_claimAutoreleasedReturnValue();

          -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "inputForMarkedText");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v54)
            objc_msgSend(v7, "deleteBackward:", 1);
          -[TIKeyboardInputManager_ja_Kana _deleteFromInput](self, "_deleteFromInput");

          v49 = 0;
          v12 = (__CFString *)v52;
          v10 = v100;
          goto LABEL_66;
        }
LABEL_49:

        v49 = 0;
        goto LABEL_50;
      }
LABEL_59:
      v49 = 0;
      goto LABEL_60;
    }
    v103 = v17;
    if (v15 != 12443)
    {
      if (v15 != 12444
        || (-[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState"),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v44 = objc_msgSend(v43, "hardwareKeyboardMode"),
            v43,
            !v44))
      {
        if (self->_isFlickOnly || !-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("｢")))
        {
          v55 = v10;
          if (-[TIKeyboardInputManager_ja inputCount](self, "inputCount"))
          {
            v56 = *MEMORY[0x24BEB5AA0];
            if ((-[__CFString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BEB5AA0]) & 1) != 0
              || (-[__CFString isEqualToString:](v12, "isEqualToString:", v13) & 1) != 0
              || (v57 = *MEMORY[0x24BEB5A98],
                  (-[__CFString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BEB5A98]) & 1) != 0)
              || (objc_msgSend(v16, "isEqualToString:", v56) & 1) != 0
              || (objc_msgSend(v16, "isEqualToString:", v13) & 1) != 0
              || objc_msgSend(v16, "isEqualToString:", v57))
            {
              v17 = v103;
              if ((-[__CFString isEqualToString:](v12, "isEqualToString:", v16) & 1) == 0)
              {
                -[TIKeyboardInputManager_ja_Kana acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
                v49 = 0;
                v10 = v55;
                goto LABEL_67;
              }
              goto LABEL_59;
            }
          }
          -[TIKeyboardInputManager_ja_Kana acceptCurrentCandidateIfSelectedWithContext:](self, "acceptCurrentCandidateIfSelectedWithContext:", v7);
          v49 = 0;
          v10 = v55;
        }
        else
        {

          if ((_DWORD)v10)
          {
            v45 = v7;
            -[TIKeyboardInputManager_ja inputString](self, "inputString");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "characterAtIndex:", v10 - 1);

            v48 = v104;
            if (v47 == 12301)
            {
              -[TIKeyboardInputManager_ja_Kana _deleteFromInput](self, "_deleteFromInput");
            }
            else if (v47 == 12300)
            {
              -[TIKeyboardInputManager_ja_Kana _deleteFromInput](self, "_deleteFromInput");
              v49 = 0;
              v12 = CFSTR("」");
LABEL_124:
              v7 = v45;
LABEL_98:
              v17 = v103;
              goto LABEL_99;
            }
            v49 = 0;
            v12 = CFSTR("「");
            goto LABEL_124;
          }
          v49 = 0;
          v12 = CFSTR("「");
        }
LABEL_66:
        v17 = v103;
LABEL_67:
        v48 = v104;
LABEL_99:
        -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
        -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
        objc_msgSend(v6, "setString:", v12);
        v105.receiver = self;
        v105.super_class = (Class)TIKeyboardInputManager_ja_Kana;
        -[TIKeyboardInputManager_ja_Kana addInput:withContext:](&v105, sel_addInput_withContext_, v6, v7);
        if (!-[TIKeyboardInputManager_ja_Kana supportsFlickAutocorrection](self, "supportsFlickAutocorrection")
          || (-[__CFString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BEB5A98]) & 1) != 0)
        {
          goto LABEL_119;
        }
        if (v49 && v48)
        {
          v103 = v17;
          v79 = v10;
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v48;
          v82 = objc_msgSend(v81, "length");
          v104 = v81;
          objc_msgSend(v81, "getBytes:length:", v107, v82);
          v83 = (v82 >> 3) - 1;
          if ((int)v83 >= 1)
          {
            v84 = v107;
            do
            {
              v85 = (unsigned __int16)*v84;
              if ((v85 - 12353) <= 0x53)
              {
                v86 = Kana_variant_map[v85 - 12353];
                if (v86)
                  *v84 = v86;
              }
              v84 += 4;
              --v83;
            }
            while (v83);
          }
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v107, v82);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          v88 = v79 - 1;
          objc_msgSend(v80, "insertObject:atIndex:", v87, v79 - 1);

          if (-[TIKeyboardInputManager_ja_Kana isTypologyEnabled](self, "isTypologyEnabled"))
          {
            v17 = v103;
            if (v103)
            {
              -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v89;
              v91 = v103;
              v92 = v88;
LABEL_117:
              objc_msgSend(v89, "insertObject:atIndex:", v91, v92);

              goto LABEL_60;
            }
            goto LABEL_60;
          }
        }
        else
        {
          if (!objc_msgSend(v6, "isMultitap") || !v48)
          {
            -[TIKeyboardInputManager_ja_Kana calculateGeometryForInput:](self, "calculateGeometryForInput:", v6);
            goto LABEL_119;
          }
          v103 = v17;
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = v48;
          -[TIKeyboardInputManager_ja_Kana geometryDataWithSubstitutedMultitapKeys:](self, "geometryDataWithSubstitutedMultitapKeys:", v48);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v10 - 1;
          objc_msgSend(v93, "insertObject:atIndex:", v94, v95);

          if (-[TIKeyboardInputManager_ja_Kana isTypologyEnabled](self, "isTypologyEnabled"))
          {
            v17 = v103;
            if (v103)
            {
              -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v89;
              v91 = v103;
              v92 = v95;
              goto LABEL_117;
            }
LABEL_60:
            v48 = v104;
LABEL_119:

            v9 = v12;
            goto LABEL_120;
          }
        }
LABEL_50:
        v17 = v103;
        goto LABEL_60;
      }
    }
    if (!(_DWORD)v10)
    {
      v58 = v10;
      v49 = 0;
      v48 = v104;
LABEL_94:
      -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "hardwareKeyboardMode");

      if (!v49 && (v78 & 1) == 0)
      {
        v49 = 0;
        v17 = v103;
        goto LABEL_119;
      }
      v10 = v58;
      goto LABEL_98;
    }
    -[TIKeyboardInputManager_ja inputString](self, "inputString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "hardwareKeyboardMode");

    v101 = v32;
    if (!v34)
    {
      v107[0] = 0;
      v59 = objc_msgSend(v32, "characterAtIndex:", v10 - 1);
      v106 = v59;
      if ((v59 - 12353) > 0x53)
      {
        v49 = 0;
        v48 = v104;
      }
      else
      {
        v107[0] = Kana_variant_map[v59 - 12353];
        v48 = v104;
        if (v107[0])
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v107, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v49 = 0;
        }
      }
      if (!-[TIKeyboardInputManager_ja_Kana supportsFlickAutocorrection](self, "supportsFlickAutocorrection"))
        goto LABEL_84;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v106, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v107[0])
      {
        if (v106 == 12289
          || v106 - 12353 < 0x54
          || (-[NSDictionary objectForKey:](self->_kanaFlickDirectionMap_current, "objectForKey:", v63),
              v64 = (void *)objc_claimAutoreleasedReturnValue(),
              v64,
              v64))
        {
          v65 = v63;

          v49 = v65;
        }
      }

LABEL_83:
      v48 = v104;
LABEL_84:
      if (v49)
      {
        if (-[TIKeyboardInputManager_ja_Kana supportsFlickAutocorrection](self, "supportsFlickAutocorrection"))
        {
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "count");

          if (v67 >= v10)
          {
            -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectAtIndex:", v10 - 1);
            v69 = objc_claimAutoreleasedReturnValue();
            v70 = v48;
            v48 = (void *)v69;

            if (-[TIKeyboardInputManager_ja_Kana isTypologyEnabled](self, "isTypologyEnabled"))
            {
              -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "objectAtIndex:", v10 - 1);
              v72 = objc_claimAutoreleasedReturnValue();

              v103 = (void *)v72;
            }
          }
        }
        -[__CFString stringByReplacingCharactersInRange:withString:](v12, "stringByReplacingCharactersInRange:withString:", 0, 1, v49);
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = v12;
        v12 = (__CFString *)v73;

        -[TIKeyboardInputManager_ja_Kana keyboardState](self, "keyboardState");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "inputForMarkedText");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v76)
          objc_msgSend(v7, "deleteBackward:", 1);
        v58 = v10;
        -[TIKeyboardInputManager_ja_Kana _deleteFromInput](self, "_deleteFromInput");
      }
      else
      {
        v58 = v10;
      }

      goto LABEL_94;
    }
    v35 = v10;
    objc_msgSend(v32, "substringWithRange:", v10 - 1, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == 12443)
    {
      v37 = objc_msgSend(CFSTR("うかきくけこさしすせそたちつてとはひふへほ"), "rangeOfString:", v36);
      v39 = v38;

      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v40 = CFSTR("ゔがぎぐげござじずぜぞだぢづでどばびぶべぼ");
        v41 = v37;
        v42 = v39;
LABEL_73:
        -[__CFString substringWithRange:](v40, "substringWithRange:", v41, v42);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_74;
      }
    }
    else
    {
      v60 = objc_msgSend(CFSTR("はひふへほ"), "rangeOfString:", v36);
      v62 = v61;

      if (v60 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v40 = CFSTR("ぱぴぷぺぽ");
        v41 = v60;
        v42 = v62;
        goto LABEL_73;
      }
    }
    v49 = 0;
LABEL_74:
    v10 = v35;
    goto LABEL_83;
  }
LABEL_120:

}

- (void)_deleteFromInput
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  if (-[TIKeyboardInputManager_ja_Kana supportsFlickAutocorrection](self, "supportsFlickAutocorrection"))
  {
    v3 = -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
    if (v3)
    {
      v4 = v3;
      -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6 >= v4)
      {
        -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v4 - 1;
        objc_msgSend(v7, "removeObjectAtIndex:", v8);

        if (-[TIKeyboardInputManager_ja_Kana isTypologyEnabled](self, "isTypologyEnabled"))
        {
          -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObjectAtIndex:", v8);

        }
      }
    }
    -[TIWordSearch clearCache](self->super._kbws, "clearCache");
  }
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  -[TIKeyboardInputManager_ja _deleteFromInput](&v10, sel__deleteFromInput);
}

- (void)deleteFromInputWithContext:(id)a3
{
  TIWordSearch *kbws;
  id v5;
  objc_super v6;

  kbws = self->super._kbws;
  v5 = a3;
  -[TIWordSearch clearCache](kbws, "clearCache");
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja_Kana;
  -[TIKeyboardInputManagerMecabra deleteFromInputWithContext:](&v6, sel_deleteFromInputWithContext_, v5);

}

- (id)geometryModelData
{
  void *v3;
  objc_super v5;

  if (-[TIKeyboardInputManager_ja_Kana supportsFlickAutocorrection](self, "supportsFlickAutocorrection"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_ja_Kana;
    -[TIKeyboardInputManager_ja geometryModelData](&v5, sel_geometryModelData);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_NSRange)analysisStringRange
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v3 = -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length");

  }
  v6 = 0;
  v7 = v4;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)supportsFlickAutocorrection
{
  return self->_supportsFlickAutocorrection;
}

- (void)setSupportsFlickAutocorrection:(BOOL)a3
{
  self->_supportsFlickAutocorrection = a3;
}

- (NSDictionary)kanaFlickDirectionMap_3x3
{
  return self->_kanaFlickDirectionMap_3x3;
}

- (void)setKanaFlickDirectionMap_3x3:(id)a3
{
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_3x3, a3);
}

- (NSDictionary)kanaFlickDirectionMap_50on
{
  return self->_kanaFlickDirectionMap_50on;
}

- (void)setKanaFlickDirectionMap_50on:(id)a3
{
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_50on, a3);
}

- (NSDictionary)kanaFlickKeyMap_3x3
{
  return self->_kanaFlickKeyMap_3x3;
}

- (void)setKanaFlickKeyMap_3x3:(id)a3
{
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_3x3, a3);
}

- (NSDictionary)kanaFlickKeyMap_50on
{
  return self->_kanaFlickKeyMap_50on;
}

- (void)setKanaFlickKeyMap_50on:(id)a3
{
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_50on, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_50on, 0);
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_3x3, 0);
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_50on, 0);
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_3x3, 0);
  objc_storeStrong((id *)&self->_kanaFlickKeyMap_current, 0);
  objc_storeStrong((id *)&self->_kanaFlickDirectionMap_current, 0);
}

@end
