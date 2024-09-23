@implementation TypistHWKeyboard

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[TypistHWKeyboard detach](self, "detach");
  v4.receiver = self;
  v4.super_class = (Class)TypistHWKeyboard;
  -[TypistHWKeyboard dealloc](&v4, sel_dealloc);
}

- (void)setKeyboardLanguage:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;

  objc_storeStrong((id *)&self->_keyboardLanguage, a3);
  v5 = a3;
  +[TypistHWKeyboard keyboardLayoutValueMap](TypistHWKeyboard, "keyboardLayoutValueMap");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[TypistHWKeyboard keyboardLanguage](self, "keyboardLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("ABC");
  -[TypistHWKeyboard setKeyboardLanguageString:](self, "setKeyboardLanguageString:", v9);

}

- (TypistHWKeyboard)initWithLanguage:(id)a3
{
  id v4;
  TypistHWKeyboard *v5;
  uint64_t v6;
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
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v36;
  TypistHWKeyboard *v37;
  __CFString *v38;
  char v40;
  id v41;
  objc_super v42;
  _QWORD v43[5];
  _QWORD v44[6];

  v44[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)TypistHWKeyboard;
  v5 = -[TypistHWKeyboard init](&v42, sel_init);
  if (!v5)
    goto LABEL_6;
  GSInitialize();
  if (!v4)
  {
    v38 = CFSTR("[TypistHWKeyboard]: No keyboard language has been provided.");
LABEL_9:
    TYLogl(OS_LOG_TYPE_ERROR, v38, v6, v7, v8, v9, v10, v11, v40);
LABEL_10:
    v37 = 0;
    goto LABEL_11;
  }
  +[TypistHWKeyboard keyboardLayoutValueMap](TypistHWKeyboard, "keyboardLayoutValueMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v40 = (char)v4;
    v38 = CFSTR("[TypistHWKeyboard]: Unrecognized Keyboard Language Identifier (%@)");
    goto LABEL_9;
  }
  -[TypistHWKeyboard setKeyboardLanguage:](v5, "setKeyboardLanguage:", v4);
  -[TypistHWKeyboard setUsagePage:](v5, "setUsagePage:", 7);
  -[TypistHWKeyboard setHidKeyboardType:](v5, "setHidKeyboardType:", -[TypistHWKeyboard getHIDKeyboardType](v5, "getHIDKeyboardType"));
  -[TypistHWKeyboard keyboardLanguage](v5, "keyboardLanguage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TypistHWKeyboard _convertKeyboardLanguageToHIDCountryCode:](TypistHWKeyboard, "_convertKeyboardLanguageToHIDCountryCode:", objc_msgSend(v14, "integerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistHWKeyboard setKeyboardCountryCode:](v5, "setKeyboardCountryCode:", v15);

  v43[0] = CFSTR("PrimaryUsagePage");
  v43[1] = CFSTR("PrimaryUsage");
  v44[0] = &unk_251A94D90;
  v44[1] = &unk_251A94DA8;
  v43[2] = CFSTR("KeyboardLanguage");
  -[TypistHWKeyboard keyboardLanguageString](v5, "keyboardLanguageString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v16;
  v43[3] = CFSTR("StandardType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TypistHWKeyboard hidKeyboardType](v5, "hidKeyboardType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v17;
  v43[4] = CFSTR("CountryCode");
  -[TypistHWKeyboard keyboardCountryCode](v5, "keyboardCountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistHWKeyboard setPropertyDictionary:](v5, "setPropertyDictionary:", v19);

  v20 = objc_alloc(MEMORY[0x24BDD17C8]);
  v21 = (void *)MEMORY[0x24BDD1608];
  -[TypistHWKeyboard propertyDictionary](v5, "propertyDictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v21, "dataWithJSONObject:options:error:", v22, 0, &v41);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v41;
  v25 = (void *)objc_msgSend(v20, "initWithData:encoding:", v23, 4);
  -[TypistHWKeyboard setPropertyDictionaryString:](v5, "setPropertyDictionaryString:", v25);

  +[TypistHWKeyboard _convertHIDKeyboardTypeToGSKeyboardType:](TypistHWKeyboard, "_convertHIDKeyboardTypeToGSKeyboardType:", -[TypistHWKeyboard hidKeyboardType](v5, "hidKeyboardType"));
  -[TypistHWKeyboard keyboardCountryCode](v5, "keyboardCountryCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "unsignedIntValue");
  -[TypistHWKeyboard hidKeyboardType](v5, "hidKeyboardType");
  GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType();

  +[TypistHWKeyboard keyboardLayoutValueMap](TypistHWKeyboard, "keyboardLayoutValueMap");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "objectForKey:", v4);

  -[TypistHWKeyboard setHardwareKeyboard:](v5, "setHardwareKeyboard:", GSKeyboardCreate());
  if (!-[TypistHWKeyboard hardwareKeyboard](v5, "hardwareKeyboard"))
  {
    TYLogl(OS_LOG_TYPE_FAULT, CFSTR("GSKeyboardCreate failed to allocate memory to layout [%@] for language [%@]."), v29, v30, v31, v32, v33, v34, v28);

    goto LABEL_10;
  }
  -[TypistHWKeyboard setModifierCharMap](v5, "setModifierCharMap");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_setModifierCharMap, (CFStringRef)*MEMORY[0x24BED2770], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[TypistHWKeyboard setCharacterToKeycodeMap:](v5, "setCharacterToKeycodeMap:", v36);

  -[TypistHWKeyboard _setupCharacterToKeycodeMap](v5, "_setupCharacterToKeycodeMap");
LABEL_6:
  v37 = v5;
LABEL_11:

  return v37;
}

- (unsigned)getHIDKeyboardType
{
  void *v2;
  unsigned int v3;

  -[TypistHWKeyboard keyboardLanguage](self, "keyboardLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TypistHWKeyboard _convertKeyboardLanguageToHIDKeyboardType:](TypistHWKeyboard, "_convertKeyboardLanguageToHIDKeyboardType:", v2);

  return v3;
}

- (void)setModifierCharMap
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
  void *v13;
  _QWORD v14[9];
  _QWORD v15[9];
  _QWORD v16[10];
  _QWORD v17[12];

  v17[10] = *MEMORY[0x24BDAC8D0];
  if (_AXSFullKeyboardAccessEnabled())
  {
    v16[0] = CFSTR("⌥");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 226);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v16[1] = CFSTR("⇧");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 225);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v16[2] = CFSTR("⌘");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 227);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    v16[3] = CFSTR("⌃");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 224);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    v16[4] = CFSTR("⌨");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), 255, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    v16[5] = CFSTR("⇥");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 43);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    v16[6] = CFSTR("⇩");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 229);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v7;
    v16[7] = CFSTR("⎇");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 230);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v8;
    v16[8] = CFSTR("⊞");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 231);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v9;
    v16[9] = CFSTR("⌄");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 228);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistHWKeyboard setModifierCharMap:](self, "setModifierCharMap:", v11);

  }
  else
  {
    v14[0] = CFSTR("⌥");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 226);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v13;
    v14[1] = CFSTR("⇧");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 225);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v12;
    v14[2] = CFSTR("⌘");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 227);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v3;
    v14[3] = CFSTR("⌃");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 224);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v4;
    v14[4] = CFSTR("⌨");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), 255, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v5;
    v14[5] = CFSTR("⇩");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 229);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v6;
    v14[6] = CFSTR("⎇");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 230);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[6] = v7;
    v14[7] = CFSTR("⊞");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 231);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[7] = v8;
    v14[8] = CFSTR("⌄");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 228);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[8] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistHWKeyboard setModifierCharMap:](self, "setModifierCharMap:", v10);
  }

}

- (void)_insertKey:(unsigned __int16)a3 logOutput:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  int ModifierState;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  char *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  char v31;
  unsigned __int16 v32;
  _WORD v33[24];
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard"))
  {
    v13 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    v32 = 0;
    -[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    GSKeyboardTranslateKeyExtended();
    -[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard", &v32, v33, v13 + 54, v13 + 55);
    ModifierState = GSKeyboardGetModifierState();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v13 + 30, v13[29]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (ModifierState & 0x2000000) != 0 ? CFSTR("Yes - skipping") : CFSTR("No");
      v19 = v17 ? CFSTR("Yes - skipping") : CFSTR("No");
      objc_msgSend(v6, "appendFormat:", CFSTR("keyCode: %#x, unmodifiedCharacters: %@, dead key: %@, key exists: %@\n"), v4, v15, v18, v19);
      if ((ModifierState & 0x2000000) == 0 && !v17)
      {
        -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v21, v15);

      }
    }
    v32 = 0;
    v33[0] = 0;
    free(v13);
    v22 = (char *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    -[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    GSKeyboardTranslateKeyExtended();
    -[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard", &v32, v33, v22 + 108, v22 + 110);
    GSKeyboardTranslateKeyExtended();
    -[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard", &v32, v33, v22 + 108, v22 + 110);
    v23 = GSKeyboardGetModifierState();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v33, v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = CFSTR("No");
      if ((v23 & 0x2000000) != 0)
        v28 = CFSTR("Yes - skipping");
      else
        v28 = CFSTR("No");
      if (v26)
        v27 = CFSTR("Yes - skipping");
      objc_msgSend(v6, "appendFormat:", CFSTR("keyCode: %#x, shiftModifiedCharacters: %@, dead key: %@, key exists: %@\n"), v4, v24, v28, v27);
      if ((v23 & 0x2000000) == 0 && !v26)
      {
        -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 225, -[TypistHWKeyboard usagePage](self, "usagePage"), v4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v30, v24);

      }
    }
    free(v22);

  }
  else
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("No hardware keyboard reference is attached. It may have been detached."), v7, v8, v9, v10, v11, v12, v31);
  }

}

- (void)_insertCharacterForKeyCode:(unsigned __int16)a3 logOutput:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;

  v4 = a3;
  v6 = a4;
  switch((int)v4)
  {
    case '(':
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 40);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("⏎");
      goto LABEL_9;
    case ')':
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 41);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("␛");
      goto LABEL_9;
    case '*':
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 42);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("⌫");
      goto LABEL_9;
    case '+':
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 43);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("⇥");
      goto LABEL_9;
    case ',':
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 44);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR(" ");
      goto LABEL_9;
    default:
      if ((_DWORD)v4 == 57)
      {
        -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 57);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("⇪");
LABEL_9:
        objc_msgSend(v7, "setObject:forKey:", v8, v9);

      }
      else if ((v4 - 58) > 0x35)
      {
        -[TypistHWKeyboard _insertKey:logOutput:](self, "_insertKey:logOutput:", v4, v6);
      }
      else
      {
        v13 = v4 - 2357;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v13, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, v10);

      }
      return;
  }
}

- (void)_insertStaticKeys
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 76);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("⌦"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 75);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("⇞"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("⇟"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 74);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("⇱"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 77);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("⇲"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 79);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("→"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 80);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("←"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 81);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("↓"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), 82);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("↑"));

  -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), 255, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v21, CFSTR("⌨"));

}

- (void)_setupCharacterToKeycodeMap
{
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = 4;
  v10 = objc_opt_new();
  do
  {
    v4 = (unsigned __int16)v3;
    -[TypistHWKeyboard _insertCharacterForKeyCode:logOutput:](self, "_insertCharacterForKeyCode:logOutput:", (unsigned __int16)v3++, v10);
  }
  while (v4 < 0x45);
  v5 = 104;
  do
  {
    v6 = (unsigned __int16)v5;
    -[TypistHWKeyboard _insertCharacterForKeyCode:logOutput:](self, "_insertCharacterForKeyCode:logOutput:", (unsigned __int16)v5++, v10);
  }
  while (v6 < 0x6F);
  -[TypistHWKeyboard _insertStaticKeys](self, "_insertStaticKeys");
  if (-[TypistHWKeyboard hidKeyboardType](self, "hidKeyboardType") == 2)
  {
    -[TypistHWKeyboard _insertKey:logOutput:](self, "_insertKey:logOutput:", 135, v10);
    v7 = (void *)v10;
    v8 = 137;
LABEL_9:
    -[TypistHWKeyboard _insertKey:logOutput:](self, "_insertKey:logOutput:", v8, v7);
    v7 = (void *)v10;
    goto LABEL_10;
  }
  v9 = -[TypistHWKeyboard hidKeyboardType](self, "hidKeyboardType");
  v7 = (void *)v10;
  if (v9 == 1)
  {
    v8 = 100;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)detach
{
  void *v3;

  -[TypistHWKeyboard keyboardCountryCode](self, "keyboardCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsignedIntValue");
  GSEventSetHardwareKeyboardAttached();

  if (-[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard"))
  {
    -[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard");
    GSKeyboardRelease();
    -[TypistHWKeyboard setHardwareKeyboard:](self, "setHardwareKeyboard:", 0);
  }
  +[TypistKeyboardUtilities tearDownRecapInlinePlayer](TypistKeyboardUtilities, "tearDownRecapInlinePlayer");
}

- (id)generateKeystrokeStream:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE7CE50];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__TypistHWKeyboard_generateKeystrokeStream___block_invoke;
  v9[3] = &unk_251A7C888;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "eventStreamWithEventActions:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__TypistHWKeyboard_generateKeystrokeStream___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  id v26;

  v26 = a2;
  v3 = (void *)MEMORY[0x24BE7CE38];
  objc_msgSend(*(id *)(a1 + 32), "propertyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSenderProperties:", v5);

  objc_msgSend(*(id *)(a1 + 32), "usagePairsForText:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "usages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "usages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "usagePages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count"))
      {
        v14 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntegerValue");

          objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntegerValue");

          objc_msgSend(v26, "beginButtonPressWithPage:usage:", v16, v18);
          objc_msgSend(*(id *)(a1 + 32), "pressDuration");
          objc_msgSend(v26, "advanceTime:");
          ++v14;
        }
        while (v14 < objc_msgSend(v11, "count"));
      }
      v19 = objc_msgSend(v11, "count") - 1;
      if (v19 >= 0)
      {
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "unsignedIntegerValue");

          objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "unsignedIntegerValue");

          objc_msgSend(v26, "endButtonPressWithPage:usage:", v21, v23);
          objc_msgSend(v26, "advanceTime:", 0.01);
          --v19;
        }
        while (v19 != -1);
      }
      objc_msgSend(*(id *)(a1 + 32), "typeInterval");
      objc_msgSend(v26, "advanceTime:");

      ++v9;
      objc_msgSend(v6, "usages");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

    }
    while (v9 < v25);
  }

}

- (id)_generateKeystrokeStream:(id)a3 appendTypeInterval:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
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
  uint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  char v50;
  void *v51;
  id v52;
  id v53;
  TypistHWKeyboard *v54;
  _BOOL4 v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  __int16 v60;

  v4 = a4;
  v6 = a3;
  if (!-[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard"))
  {
    TYLogl(OS_LOG_TYPE_ERROR, CFSTR("No hardware keyboard reference is attached. It may have been detached."), v7, v8, v9, v10, v11, v12, v50);
    v20 = 0;
    goto LABEL_35;
  }
  v13 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v13, "setDecimalSeparator:", CFSTR("."));
  objc_msgSend(v13, "setNumberStyle:", 1);
  objc_msgSend(v13, "setMaximumFractionDigits:", 5);
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[TypistHWKeyboard pressDuration](self, "pressDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromNumber:", v15);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD16E0];
  -[TypistHWKeyboard typeInterval](self, "typeInterval");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromNumber:", v17);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR("⇥"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("⏎"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[TypistHWKeyboard modifierCharMap](self, "modifierCharMap");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  TYLog(CFSTR("Generating hardware keystroke stream for input: [%@]"), v21, v22, v23, v24, v25, v26, v27, (char)v6);
  if (!objc_msgSend(v19, "length"))
  {
    v29 = 0;
    goto LABEL_34;
  }
  v52 = v13;
  v53 = v6;
  v28 = 0;
  v29 = 0;
  v30 = 0x24BDD1000uLL;
  v31 = v59;
  v55 = v4;
  v54 = self;
  v56 = v20;
  do
  {
    v60 = 0;
    v60 = objc_msgSend(v19, "characterAtIndex:", v28);
    objc_msgSend(*(id *)(v30 + 1992), "stringWithCharacters:length:", &v60, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      objc_msgSend(*(id *)(v30 + 1992), "stringWithCharacters:length:", &v60, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        if (v29)
        {
          objc_msgSend(v29, "appendFormat:", CFSTR("/%@"), v36);
          if (!v4)
            goto LABEL_26;
        }
        else
        {
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("bx %@"), v36);
          if (!v4)
            goto LABEL_26;
        }
        goto LABEL_25;
      }
      -[TypistHWKeyboard hardwareKeyboard](self, "hardwareKeyboard");
      GSKeyboardHWKeyboardNormalizeInput();
      -[TypistHWKeyboard characterToKeycodeMap](self, "characterToKeycodeMap");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKey:", v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        TYLogl(OS_LOG_TYPE_ERROR, CFSTR("The character \"%@\" is not in the character map and cannot be normalized to a known character."), v39, v40, v41, v42, v43, v44, (char)v34);
        v20 = v56;
LABEL_27:

        v31 = v59;
        v30 = 0x24BDD1000;
        goto LABEL_28;
      }
      -[TypistHWKeyboard _getModifierMaskMap](self, "_getModifierMaskMap");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKey:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v47, "length"))
      {
        v4 = v55;
        if (v29)
        {
          objc_msgSend(v29, "appendFormat:", CFSTR("/%@/%@"), v47, v38);
          goto LABEL_24;
        }
        v51 = v38;
        v48 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("bx %@/%@"), v47);
      }
      else
      {
        v4 = v55;
        if (v29)
        {
          objc_msgSend(v29, "appendFormat:", CFSTR("/%@"), v38, v51);
          goto LABEL_24;
        }
        v48 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("bx %@"), v38);
      }
      v29 = (void *)v48;
LABEL_24:
      self = v54;

      v20 = v56;
      if (!v4)
      {
LABEL_26:
        objc_msgSend(v20, "appendString:", v29);

        v29 = 0;
        goto LABEL_27;
      }
LABEL_25:
      v51 = v57;
      objc_msgSend(v29, "appendFormat:", CFSTR(" %@ wait %@ "), v58);
      goto LABEL_26;
    }
    if (v29)
      objc_msgSend(v29, "appendFormat:", CFSTR("/%@"), v33);
    else
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("bx %@"), v33);
LABEL_28:

    ++v28;
  }
  while (objc_msgSend(v19, "length") > v28);
  if (v29)
  {
    objc_msgSend(v29, "appendString:", CFSTR(" "));
    objc_msgSend(v20, "appendString:", v29);
  }
  v13 = v52;
  v6 = v53;
LABEL_34:

LABEL_35:
  return v20;
}

- (id)pressKeycodes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  TYRecapCommand *v23;
  void *v24;
  TypistHWKeyboard *v26;
  id obj;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  TYRecapCommand *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v6, "setDecimalSeparator:", CFSTR("."));
  objc_msgSend(v6, "setNumberStyle:", 1);
  objc_msgSend(v6, "setMaximumFractionDigits:", 5);
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[TypistHWKeyboard pressDuration](self, "pressDuration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD16E0];
  v26 = self;
  -[TypistHWKeyboard typeInterval](self, "typeInterval");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v32)
  {
    v28 = *(_QWORD *)v34;
    v29 = v5;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v13 = (void *)objc_opt_new();
        if (objc_msgSend(v12, "count") != 1)
        {
          v14 = 0;
          do
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "unsignedShortValue");

            objc_msgSend(v12, "objectAtIndexedSubscript:", v14 + 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "unsignedShortValue");

            if (objc_msgSend(v13, "length"))
              v19 = CFSTR("/");
            else
              v19 = &stru_251A7DE60;
            objc_msgSend(v13, "appendFormat:", CFSTR("%@%02x,%02x"), v19, v16, v18);
            v14 += 2;
          }
          while (v14 < objc_msgSend(v12, "count") - 1);
        }
        v5 = v29;
        objc_msgSend(v29, "appendFormat:", CFSTR("bx %@ %@ wait %@ "), v13, v31, v30);

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v5, "length"))
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    -[TypistHWKeyboard propertyDictionaryString](v26, "propertyDictionaryString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("sender %@ %@"), v21, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[TYRecapCommand initWithCommandType:commandString:commandDescription:]([TYRecapCommand alloc], "initWithCommandType:commandString:commandDescription:", 1, v22, 0);
    v37 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[TypistKeyboardUtilities launchRecap:](TypistKeyboardUtilities, "launchRecap:", v24);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)pressKeycode:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TYRecapCommand *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bx %x,%x"), -[TypistHWKeyboard usagePage](self, "usagePage"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[TypistHWKeyboard propertyDictionaryString](self, "propertyDictionaryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("sender %@ %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TYRecapCommand initWithCommandType:commandString:commandDescription:]([TYRecapCommand alloc], "initWithCommandType:commandString:commandDescription:", 1, v7, 0);
  v10[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TypistKeyboardUtilities launchRecap:](TypistKeyboardUtilities, "launchRecap:", v9);

}

- (void)typeString:(id)a3
{
  id v3;

  -[TypistHWKeyboard generateKeystrokeStream:](self, "generateKeystrokeStream:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:](TypistKeyboardUtilities, "launchRecapWithSyntheticEventStream:", v3);

}

- (id)_subsequentKeyPressPairForCharacter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TypistHWKeyboard _generateKeystrokeStream:appendTypeInterval:](self, "_generateKeystrokeStream:appendTypeInterval:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("bx")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("bx"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)pressAndHoldKeys:(id)a3 forDuration:(double)a4 withValidation:(id)a5 after:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TYRecapCommand *v20;
  NSObject *v21;
  TYRecapCommand *v22;
  void (**v23)(_QWORD);
  _QWORD block[4];
  TYRecapCommand *v25;

  v10 = a3;
  v23 = (void (**)(_QWORD))a5;
  v11 = objc_alloc(MEMORY[0x24BDD16A8]);
  -[TypistHWKeyboard propertyDictionaryString](self, "propertyDictionaryString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("sender %@ "), v12);

  if (objc_msgSend(v10, "count"))
  {
    v14 = 0;
    do
    {
      if (v14)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistHWKeyboard _subsequentKeyPressPairForCharacter:](self, "_subsequentKeyPressPairForCharacter:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "appendFormat:", CFSTR("/%@"), v16);
      }
      else
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistHWKeyboard _generateKeystrokeStream:appendTypeInterval:](self, "_generateKeystrokeStream:appendTypeInterval:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendString:", v19);

      }
      ++v14;
    }
    while (objc_msgSend(v10, "count") > v14);
  }
  objc_msgSend(v13, "appendFormat:", CFSTR(" %f"), *(_QWORD *)&a4);
  v20 = -[TYRecapCommand initWithCommandType:commandString:commandDescription:]([TYRecapCommand alloc], "initWithCommandType:commandString:commandDescription:", 1, v13, 0);
  v21 = dispatch_queue_create("launchRecapQueue", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__TypistHWKeyboard_pressAndHoldKeys_forDuration_withValidation_after___block_invoke;
  block[3] = &unk_251A7C8B0;
  v22 = v20;
  v25 = v22;
  dispatch_async(v21, block);
  +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", a6);
  if (v23)
    v23[2](v23);

}

void __70__TypistHWKeyboard_pressAndHoldKeys_forDuration_withValidation_after___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[TypistKeyboardUtilities sharedRecapInlinePlayer](TypistKeyboardUtilities, "sharedRecapInlinePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarmForEventStream:completion:", v3, 0);

  +[TypistKeyboardUtilities sharedRecapInlinePlayer](TypistKeyboardUtilities, "sharedRecapInlinePlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "playEventStream:options:completion:", v4, v5, 0);

}

- (id)_getModifierMaskMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__TypistHWKeyboard__getModifierMaskMap__block_invoke;
  block[3] = &unk_251A7C8B0;
  block[4] = self;
  if (_getModifierMaskMap_modifierMaskMapToken != -1)
    dispatch_once(&_getModifierMaskMap_modifierMaskMapToken, block);
  return (id)_getModifierMaskMap_modifierMaskMapDictionary;
}

void __39__TypistHWKeyboard__getModifierMaskMap__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  _QWORD v35[16];
  _QWORD v36[18];

  v36[16] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v34;
  v36[0] = &stru_251A7DE60;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x20000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v33;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v32;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x80000);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v31;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v30;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x100000);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v29;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x10000);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v27;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 655360);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v25;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v24;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1179648);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v23;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 196608);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v21;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1572864);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v19;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 589824);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1114112);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v15;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1703936);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 720896);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[12] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1245184);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[13] = v9;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v36[13] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1638400);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[14] = v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[14] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1769472);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[15] = v5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x,%x/%x,%x/%x,%x/%x,%x"), objc_msgSend(*(id *)(a1 + 32), "usagePage"), 225, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 226, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 224, objc_msgSend(*(id *)(a1 + 32), "usagePage"), 227);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[15] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 16);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_getModifierMaskMap_modifierMaskMapDictionary;
  _getModifierMaskMap_modifierMaskMapDictionary = v7;

}

+ (unsigned)_convertHIDKeyboardTypeToGSKeyboardType:(unsigned int)a3
{
  unsigned int v3;

  v3 = 0xCFCBCAu >> (8 * a3);
  if (a3 >= 3)
    LOBYTE(v3) = 0;
  return v3;
}

+ (unsigned)_convertKeyboardLanguageToHIDKeyboardType:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 0x21)
    return 1;
  if (((1 << v3) & 0x200048820) == 0)
  {
    if (v3 == 3)
      return 2;
    return 1;
  }
  return 0;
}

+ (id)keyboardLanguageValueMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TypistHWKeyboard_keyboardLanguageValueMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (keyboardLanguageValueMap_onceToken != -1)
    dispatch_once(&keyboardLanguageValueMap_onceToken, block);
  return (id)keyboardLanguageValueMap_layoutMap;
}

void __44__TypistHWKeyboard_keyboardLanguageValueMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_opt_new();
  v3 = (void *)keyboardLanguageValueMap_layoutMap;
  keyboardLanguageValueMap_layoutMap = v2;

  objc_msgSend(*(id *)(a1 + 32), "keyboardLayoutValueMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global);

}

uint64_t __44__TypistHWKeyboard_keyboardLanguageValueMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)keyboardLanguageValueMap_layoutMap, "setObject:forKeyedSubscript:", a2, a3);
}

+ (id)keyboardLayoutValueMap
{
  if (keyboardLayoutValueMap_onceToken != -1)
    dispatch_once(&keyboardLayoutValueMap_onceToken, &__block_literal_global_187);
  return (id)keyboardLayoutValueMap_countryCodeMap;
}

void __42__TypistHWKeyboard_keyboardLayoutValueMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[40];
  _QWORD v3[41];

  v3[40] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_251A94DC0;
  v2[1] = &unk_251A94D90;
  v3[0] = CFSTR("ABC");
  v3[1] = CFSTR("German");
  v2[2] = &unk_251A94DD8;
  v2[3] = &unk_251A94DF0;
  v3[2] = CFSTR("French");
  v3[3] = CFSTR("ABC");
  v2[4] = &unk_251A94E08;
  v2[5] = &unk_251A94E20;
  v3[4] = CFSTR("USInternational-PC");
  v3[5] = CFSTR("US");
  v2[6] = &unk_251A94DA8;
  v2[7] = &unk_251A94E38;
  v3[6] = CFSTR("British");
  v3[7] = CFSTR("Spanish");
  v2[8] = &unk_251A94E50;
  v2[9] = &unk_251A94E68;
  v3[8] = CFSTR("Swedish");
  v3[9] = CFSTR("Italian");
  v2[10] = &unk_251A94E80;
  v2[11] = &unk_251A94E98;
  v3[10] = CFSTR("Canadian");
  v3[11] = CFSTR("ABC");
  v2[12] = &unk_251A94EB0;
  v2[13] = &unk_251A94EC8;
  v3[12] = CFSTR("Danish");
  v3[13] = CFSTR("Belgian");
  v2[14] = &unk_251A94EE0;
  v2[15] = &unk_251A94EF8;
  v3[14] = CFSTR("Norwegian");
  v3[15] = CFSTR("ABC");
  v2[16] = &unk_251A94F10;
  v2[17] = &unk_251A94F28;
  v3[16] = CFSTR("Dutch");
  v3[17] = CFSTR("Swiss German");
  v2[18] = &unk_251A94F40;
  v2[19] = &unk_251A94F58;
  v3[18] = CFSTR("ABC");
  v3[19] = CFSTR("ABC");
  v2[20] = &unk_251A94F70;
  v2[21] = &unk_251A94F88;
  v3[20] = CFSTR("Bulgarian");
  v3[21] = CFSTR("Croatian");
  v2[22] = &unk_251A94FA0;
  v2[23] = &unk_251A94FB8;
  v3[22] = CFSTR("Croatian-Standard");
  v3[23] = CFSTR("Czech");
  v2[24] = &unk_251A94FD0;
  v2[25] = &unk_251A94FE8;
  v3[24] = CFSTR("ABC");
  v3[25] = CFSTR("ABC");
  v2[26] = &unk_251A95000;
  v2[27] = &unk_251A95018;
  v3[26] = CFSTR("Icelandic");
  v3[27] = CFSTR("Hungarian");
  v2[28] = &unk_251A95030;
  v2[29] = &unk_251A95048;
  v3[28] = CFSTR("Polish");
  v3[29] = CFSTR("Portuguese");
  v2[30] = &unk_251A95060;
  v2[31] = &unk_251A95078;
  v3[30] = CFSTR("ABC");
  v3[31] = CFSTR("Romanian");
  v2[32] = &unk_251A95090;
  v2[33] = &unk_251A950A8;
  v3[32] = CFSTR("Russian");
  v3[33] = CFSTR("Slovak");
  v2[34] = &unk_251A950C0;
  v2[35] = &unk_251A950D8;
  v3[34] = CFSTR("ABC");
  v3[35] = CFSTR("Turkish-QWERTY-PC");
  v2[36] = &unk_251A950F0;
  v2[37] = &unk_251A95108;
  v3[36] = CFSTR("Turkish-QWERTY");
  v3[37] = CFSTR("Ukrainian");
  v2[38] = &unk_251A95120;
  v2[39] = &unk_251A95138;
  v3[38] = CFSTR("Turkish-Standard");
  v3[39] = CFSTR("ABC");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyboardLayoutValueMap_countryCodeMap;
  keyboardLayoutValueMap_countryCodeMap = v0;

}

+ (id)_convertKeyboardLanguageToHIDCountryCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (_convertKeyboardLanguageToHIDCountryCode__onceToken != -1)
    dispatch_once(&_convertKeyboardLanguageToHIDCountryCode__onceToken, &__block_literal_global_284);
  v4 = (void *)_convertKeyboardLanguageToHIDCountryCode__countryCodeMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __61__TypistHWKeyboard__convertKeyboardLanguageToHIDCountryCode___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[40];
  _QWORD v3[41];

  v3[40] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_251A94DC0;
  v2[1] = &unk_251A94D90;
  v3[0] = &unk_251A94DC0;
  v3[1] = &unk_251A94E68;
  v2[2] = &unk_251A94DD8;
  v2[3] = &unk_251A94DF0;
  v3[2] = &unk_251A94E50;
  v3[3] = &unk_251A94EF8;
  v2[4] = &unk_251A94E08;
  v2[5] = &unk_251A94E20;
  v3[4] = &unk_251A94EC8;
  v3[5] = &unk_251A950C0;
  v2[6] = &unk_251A94DA8;
  v2[7] = &unk_251A94E38;
  v3[6] = &unk_251A950A8;
  v3[7] = &unk_251A95000;
  v2[8] = &unk_251A94E50;
  v2[9] = &unk_251A94E68;
  v3[8] = &unk_251A95018;
  v3[9] = &unk_251A94EE0;
  v2[10] = &unk_251A94E80;
  v2[11] = &unk_251A94E98;
  v3[10] = &unk_251A94E08;
  v3[11] = &unk_251A95150;
  v2[12] = &unk_251A94EB0;
  v2[13] = &unk_251A94EC8;
  v3[12] = &unk_251A94DA8;
  v3[13] = &unk_251A94DD8;
  v2[14] = &unk_251A94EE0;
  v2[15] = &unk_251A94EF8;
  v3[14] = &unk_251A94F58;
  v3[15] = &unk_251A94F10;
  v2[16] = &unk_251A94F10;
  v2[17] = &unk_251A94F28;
  v3[16] = &unk_251A94F40;
  v3[17] = &unk_251A95048;
  v2[18] = &unk_251A94F40;
  v2[19] = &unk_251A94F58;
  v3[18] = &unk_251A95078;
  v3[19] = &unk_251A94D90;
  v2[20] = &unk_251A94F70;
  v2[21] = &unk_251A94F88;
  v3[20] = &unk_251A95168;
  v3[21] = &unk_251A950D8;
  v2[22] = &unk_251A94FB8;
  v2[23] = &unk_251A94FD0;
  v3[22] = &unk_251A94E20;
  v3[23] = &unk_251A94E80;
  v2[24] = &unk_251A94FE8;
  v2[25] = &unk_251A95000;
  v3[24] = &unk_251A94E98;
  v3[25] = &unk_251A95180;
  v2[26] = &unk_251A95018;
  v2[27] = &unk_251A95030;
  v3[26] = &unk_251A94EB0;
  v3[27] = &unk_251A94F88;
  v2[28] = &unk_251A95048;
  v2[29] = &unk_251A95060;
  v3[28] = &unk_251A94FB8;
  v3[29] = &unk_251A94F70;
  v2[30] = &unk_251A95078;
  v2[31] = &unk_251A95090;
  v3[30] = &unk_251A95198;
  v3[31] = &unk_251A94FD0;
  v2[32] = &unk_251A950A8;
  v2[33] = &unk_251A950C0;
  v3[32] = &unk_251A94FE8;
  v3[33] = &unk_251A951B0;
  v2[34] = &unk_251A950D8;
  v2[35] = &unk_251A950F0;
  v3[34] = &unk_251A95090;
  v3[35] = &unk_251A950F0;
  v2[36] = &unk_251A95108;
  v2[37] = &unk_251A95120;
  v3[36] = &unk_251A951C8;
  v3[37] = &unk_251A950F0;
  v2[38] = &unk_251A95138;
  v2[39] = &unk_251A94FA0;
  v3[38] = &unk_251A94F28;
  v3[39] = &unk_251A950D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_convertKeyboardLanguageToHIDCountryCode__countryCodeMap;
  _convertKeyboardLanguageToHIDCountryCode__countryCodeMap = v0;

}

+ (id)convertHIDCountryCodeToLanguage:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (convertHIDCountryCodeToLanguage__onceToken != -1)
    dispatch_once(&convertHIDCountryCodeToLanguage__onceToken, &__block_literal_global_291);
  v4 = (void *)convertHIDCountryCodeToLanguage__countryCodeMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __52__TypistHWKeyboard_convertHIDCountryCodeToLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[36];
  _QWORD v3[37];

  v3[36] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_251A94DC0;
  v2[1] = &unk_251A94E68;
  v3[0] = &unk_251A94DC0;
  v3[1] = &unk_251A94D90;
  v2[2] = &unk_251A94E50;
  v2[3] = &unk_251A94EF8;
  v3[2] = &unk_251A94DD8;
  v3[3] = &unk_251A94DF0;
  v2[4] = &unk_251A94EC8;
  v2[5] = &unk_251A950C0;
  v3[4] = &unk_251A94E08;
  v3[5] = &unk_251A94E20;
  v2[6] = &unk_251A950A8;
  v2[7] = &unk_251A95000;
  v3[6] = &unk_251A94DA8;
  v3[7] = &unk_251A94E38;
  v2[8] = &unk_251A95018;
  v2[9] = &unk_251A94EE0;
  v3[8] = &unk_251A94E50;
  v3[9] = &unk_251A94E68;
  v2[10] = &unk_251A94E08;
  v2[11] = &unk_251A94DA8;
  v3[10] = &unk_251A94E80;
  v3[11] = &unk_251A94EB0;
  v2[12] = &unk_251A94DD8;
  v2[13] = &unk_251A94F58;
  v3[12] = &unk_251A94EC8;
  v3[13] = &unk_251A94EE0;
  v2[14] = &unk_251A94F10;
  v2[15] = &unk_251A94F40;
  v3[14] = &unk_251A94EF8;
  v3[15] = &unk_251A94F10;
  v2[16] = &unk_251A95048;
  v2[17] = &unk_251A95078;
  v3[16] = &unk_251A94F28;
  v3[17] = &unk_251A94F40;
  v2[18] = &unk_251A94D90;
  v2[19] = &unk_251A950D8;
  v3[18] = &unk_251A94F58;
  v3[19] = &unk_251A94FA0;
  v2[20] = &unk_251A94E20;
  v2[21] = &unk_251A94E80;
  v3[20] = &unk_251A94FB8;
  v3[21] = &unk_251A94FD0;
  v2[22] = &unk_251A94E98;
  v2[23] = &unk_251A94EB0;
  v3[22] = &unk_251A94FE8;
  v3[23] = &unk_251A95018;
  v2[24] = &unk_251A94F88;
  v2[25] = &unk_251A94FB8;
  v3[24] = &unk_251A95030;
  v3[25] = &unk_251A95048;
  v2[26] = &unk_251A94F70;
  v2[27] = &unk_251A94FD0;
  v3[26] = &unk_251A95060;
  v3[27] = &unk_251A95090;
  v2[28] = &unk_251A94FE8;
  v2[29] = &unk_251A95090;
  v3[28] = &unk_251A950A8;
  v3[29] = &unk_251A950D8;
  v2[30] = &unk_251A950F0;
  v2[31] = &unk_251A951C8;
  v3[30] = &unk_251A95120;
  v3[31] = &unk_251A95108;
  v2[32] = &unk_251A951B0;
  v2[33] = &unk_251A95198;
  v3[32] = &unk_251A950C0;
  v3[33] = &unk_251A95078;
  v2[34] = &unk_251A95168;
  v2[35] = &unk_251A95150;
  v3[34] = &unk_251A94F70;
  v3[35] = &unk_251A94E98;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 36);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)convertHIDCountryCodeToLanguage__countryCodeMap;
  convertHIDCountryCodeToLanguage__countryCodeMap = v0;

}

- (double)typeInterval
{
  return self->_typeInterval;
}

- (void)setTypeInterval:(double)a3
{
  self->_typeInterval = a3;
}

- (double)pressDuration
{
  return self->_pressDuration;
}

- (void)setPressDuration:(double)a3
{
  self->_pressDuration = a3;
}

- (__GSKeyboard)hardwareKeyboard
{
  return self->_hardwareKeyboard;
}

- (void)setHardwareKeyboard:(__GSKeyboard *)a3
{
  self->_hardwareKeyboard = a3;
}

- (NSMutableDictionary)characterToKeycodeMap
{
  return self->_characterToKeycodeMap;
}

- (void)setCharacterToKeycodeMap:(id)a3
{
  objc_storeStrong((id *)&self->_characterToKeycodeMap, a3);
}

- (unsigned)hidKeyboardType
{
  return self->_hidKeyboardType;
}

- (void)setHidKeyboardType:(unsigned int)a3
{
  self->_hidKeyboardType = a3;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(unsigned __int8)a3
{
  self->_usagePage = a3;
}

- (NSNumber)keyboardCountryCode
{
  return self->_keyboardCountryCode;
}

- (void)setKeyboardCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardCountryCode, a3);
}

- (NSNumber)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (NSString)keyboardLanguageString
{
  return self->_keyboardLanguageString;
}

- (void)setKeyboardLanguageString:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLanguageString, a3);
}

- (NSDictionary)propertyDictionary
{
  return self->_propertyDictionary;
}

- (void)setPropertyDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_propertyDictionary, a3);
}

- (NSString)propertyDictionaryString
{
  return self->_propertyDictionaryString;
}

- (void)setPropertyDictionaryString:(id)a3
{
  objc_storeStrong((id *)&self->_propertyDictionaryString, a3);
}

- (NSDictionary)modifierCharMap
{
  return self->_modifierCharMap;
}

- (void)setModifierCharMap:(id)a3
{
  objc_storeStrong((id *)&self->_modifierCharMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifierCharMap, 0);
  objc_storeStrong((id *)&self->_propertyDictionaryString, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
  objc_storeStrong((id *)&self->_keyboardLanguageString, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardCountryCode, 0);
  objc_storeStrong((id *)&self->_characterToKeycodeMap, 0);
}

- (id)getPropertyDictionaryString
{
  void *v2;
  void *v3;

  -[TypistHWKeyboard propertyDictionaryString](self, "propertyDictionaryString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)usagePairsForText:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  TYUsagePairs *v6;
  TYUsagePairs *v7;
  _QWORD v9[4];
  TYUsagePairs *v10;

  -[TypistHWKeyboard _generateKeystrokeStream:appendTypeInterval:](self, "_generateKeystrokeStream:appendTypeInterval:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("bx "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByExcludingObjectsInArray:", &unk_251A990A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(TYUsagePairs);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke;
  v9[3] = &unk_251A7CC70;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = (id)objc_opt_new();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = (id)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke_66;
  v7[3] = &unk_251A7CC48;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_usagePages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15[5]);

  objc_msgSend(*(id *)(a1 + 32), "_usages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9[5]);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

}

void __49__TypistHWKeyboard_RecapSPIs__usagePairsForText___block_invoke_66(uint64_t a1, void *a2)
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
  void *v13;
  uint64_t v14;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17A8];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scannerWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v6, "scanHexInt:", (char *)&v14 + 4);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v14));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  v9 = (void *)MEMORY[0x24BDD17A8];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scannerWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "scanHexInt:", &v14);
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

void __79__TypistHWKeyboard_Deprecated_initWithCountryCode_andPropertyDictionaryAtPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareInputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automaticHardwareLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;

}

uint64_t __79__TypistHWKeyboard_Deprecated_initWithCountryCode_andPropertyDictionaryAtPath___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.02);
}

void __38__TypistHWKeyboard_Deprecated_detach___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "emulatedKeyboard");
  CFRunLoopGetMain();
  IOHIDUserDeviceUnscheduleFromRunLoop();
  objc_msgSend(*(id *)(a1 + 32), "keyboardCountryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsignedIntValue");
  GSEventSetHardwareKeyboardAttached();

  CFRelease((CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "emulatedKeyboard"));
  objc_msgSend(*(id *)(a1 + 32), "hardwareKeyboard");
  GSKeyboardRelease();
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardCountryCode:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCharacterToKeycodeMap:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTypistHWKeyboardQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setGroup:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setEmulatedModel:", 0);
  v3 = dispatch_time(0, 200000000);
  if (*(_QWORD *)(a1 + 40))
    v4 = *(void **)(a1 + 40);
  else
    v4 = &__block_literal_global_61;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], v4);
}

void __38__TypistHWKeyboard_Deprecated_detach___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  TYLog(CFSTR("Exiting deatch"), a2, a3, a4, a5, a6, a7, a8, a9);
}

void __46__TypistHWKeyboard_Deprecated_modifierCharMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("⌥");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = CFSTR("⇧");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = CFSTR("⌘");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = CFSTR("⌃");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)modifierCharMap_modifierCharMap;
  modifierCharMap_modifierCharMap = v4;

}

void __53__TypistHWKeyboard_Deprecated_typeString_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  void *v5;

  if (a1[4])
  {
    v2 = (void *)a1[5];
    objc_msgSend(v2, "generateKeystrokeStream:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "typeKeyStrokeStream:", v3);

  }
  v4 = dispatch_time(0, 200000000);
  if (a1[6])
    v5 = (void *)a1[6];
  else
    v5 = &__block_literal_global_159;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);
}

void __58__TypistHWKeyboard_Deprecated_pressAndHoldKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  void *v5;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "generateKeystrokeStream:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subarrayWithRange:", 0, objc_msgSend(v2, "count") - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "typeKeyStrokeStream:", v3);
  }
  v4 = dispatch_time(0, 200000000);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(void **)(a1 + 48);
  else
    v5 = &__block_literal_global_160;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);
}

void __61__TypistHWKeyboard_Deprecated_releaseKeyPressWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0, CFSTR("keyCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("modifier");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeKeyStrokeStream:", v6);

  v7 = dispatch_time(0, 200000000);
  if (*(_QWORD *)(a1 + 40))
    v8 = *(void **)(a1 + 40);
  else
    v8 = &__block_literal_global_161;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], v8);
}

void __51__TypistHWKeyboard_Deprecated_keyboardCountryCodes__block_invoke()
{
  void *v0;

  v0 = (void *)keyboardCountryCodes_keyboardCountryCodes;
  keyboardCountryCodes_keyboardCountryCodes = (uint64_t)&unk_251A99420;

}

@end
