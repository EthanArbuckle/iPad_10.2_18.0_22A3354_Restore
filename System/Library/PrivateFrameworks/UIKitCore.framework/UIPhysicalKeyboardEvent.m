@implementation UIPhysicalKeyboardEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  void *Data;
  id v19;

  v19 = a3;
  -[UIPhysicalKeyboardEvent _modifiedInput](self, "_modifiedInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPhysicalKeyboardEvent _modifiedInput](self, "_modifiedInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v5, CFSTR("modifiedInput"));

  }
  -[UIPhysicalKeyboardEvent _unmodifiedInput](self, "_unmodifiedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIPhysicalKeyboardEvent _unmodifiedInput](self, "_unmodifiedInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v7, CFSTR("unmodifiedInput"));

  }
  -[UIPhysicalKeyboardEvent _shiftModifiedInput](self, "_shiftModifiedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIPhysicalKeyboardEvent _shiftModifiedInput](self, "_shiftModifiedInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v9, CFSTR("shiftModifiedInput"));

  }
  -[UIPhysicalKeyboardEvent _commandModifiedInput](self, "_commandModifiedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIPhysicalKeyboardEvent _commandModifiedInput](self, "_commandModifiedInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v11, CFSTR("commandModifiedInput"));

  }
  -[UIPhysicalKeyboardEvent _markedInput](self, "_markedInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIPhysicalKeyboardEvent _markedInput](self, "_markedInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v13, CFSTR("markedInput"));

  }
  -[UIPhysicalKeyboardEvent _privateInput](self, "_privateInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIPhysicalKeyboardEvent _privateInput](self, "_privateInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v15, CFSTR("privateInput"));

  }
  -[UIPhysicalKeyboardEvent _hint](self, "_hint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UIPhysicalKeyboardEvent _hint](self, "_hint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v17, CFSTR("hint"));

  }
  objc_msgSend(v19, "encodeInteger:forKey:", -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags"), CFSTR("modifiedFlags"));
  objc_msgSend(v19, "encodeInteger:forKey:", -[UIPhysicalKeyboardEvent _privateModifierFlags](self, "_privateModifierFlags"), CFSTR("privateModifierFlags"));
  objc_msgSend(v19, "encodeInt32:forKey:", -[UIPhysicalKeyboardEvent _keyCode](self, "_keyCode"), CFSTR("keyCode"));
  objc_msgSend(v19, "encodeInt:forKey:", -[UIPhysicalKeyboardEvent _inputFlags](self, "_inputFlags"), CFSTR("inputFlags"));
  objc_msgSend(v19, "encodeInteger:forKey:", -[UIPhysicalKeyboardEvent source](self, "source"), CFSTR("source"));
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent _isExternalEvent](self, "_isExternalEvent"), CFSTR("externalEvent"));
  -[UIEvent _hidEvent](self, "_hidEvent");
  Data = (void *)IOHIDEventCreateData();
  objc_msgSend(v19, "encodeObject:forKey:", Data, CFSTR("hidEvent"));
  objc_msgSend(v19, "encodeInt:forKey:", -[UIPhysicalKeyboardEvent keyCommandCode](self, "keyCommandCode"), CFSTR("keyCommandCode"));
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent keyCommandHandlingBeforePublic](self, "keyCommandHandlingBeforePublic"), CFSTR("keyCommandHandlingBeforePublic"));
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent shiftDown](self, "shiftDown"), CFSTR("shiftDown"));
  objc_msgSend(v19, "encodeBool:forKey:", -[UIPhysicalKeyboardEvent keyEventForwardedFromInputUIHost](self, "keyEventForwardedFromInputUIHost"), CFSTR("keyEventForwardedFromInputUIHost"));
  objc_msgSend(v19, "encodeObject:forKey:", self->_keyTranslationMap, CFSTR("keyTranslationMap"));

}

- (UIPhysicalKeyboardEvent)initWithCoder:(id)a3
{
  id v4;
  UIPhysicalKeyboardEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  _UIPhysicalKeyTranslationMap *keyTranslationMap;
  uint64_t v18;
  _UIPhysicalKeyTranslationMap *originalEscapeKeyTranslationMap;
  void *v20;
  _UIPhysicalKeyTranslationMap *v21;
  void *v22;
  BOOL v23;
  objc_super v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIPhysicalKeyboardEvent;
  v5 = -[UIPhysicalKeyboardEvent init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedInput"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_modifiedInput:](v5, "set_modifiedInput:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unmodifiedInput"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_unmodifiedInput:](v5, "set_unmodifiedInput:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shiftModifiedInput"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_shiftModifiedInput:](v5, "set_shiftModifiedInput:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandModifiedInput"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_commandModifiedInput:](v5, "set_commandModifiedInput:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("markedInput"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_markedInput:](v5, "set_markedInput:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateInput"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_privateInput:](v5, "set_privateInput:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hint"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_hint:](v5, "set_hint:", v12);

    -[UIPhysicalKeyboardEvent _setModifierFlags:](v5, "_setModifierFlags:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modifiedFlags")));
    -[UIPhysicalKeyboardEvent set_privateModifierFlags:](v5, "set_privateModifierFlags:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("privateModifierFlags")));
    -[UIPhysicalKeyboardEvent set_keyCode:](v5, "set_keyCode:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("keyCode")));
    -[UIPhysicalKeyboardEvent set_inputFlags:](v5, "set_inputFlags:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("inputFlags")));
    -[UIPhysicalKeyboardEvent setSource:](v5, "setSource:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source")));
    -[UIPhysicalKeyboardEvent set_externalEvent:](v5, "set_externalEvent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("externalEvent")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hidEvent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x186DC7A2C](*MEMORY[0x1E0C9AE00], v13);
    if (v14)
    {
      v15 = (const void *)v14;
      v25.receiver = v5;
      v25.super_class = (Class)UIPhysicalKeyboardEvent;
      -[UIEvent _setHIDEvent:](&v25, sel__setHIDEvent_, v14);
      CFRelease(v15);
    }
    -[UIPhysicalKeyboardEvent setKeyCommandCode:](v5, "setKeyCommandCode:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("keyCommandCode")));
    -[UIPhysicalKeyboardEvent setKeyCommandHandlingBeforePublic:](v5, "setKeyCommandHandlingBeforePublic:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("keyCommandHandlingBeforePublic")));
    -[UIPhysicalKeyboardEvent setShiftDown:](v5, "setShiftDown:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shiftDown")));
    -[UIPhysicalKeyboardEvent setKeyEventForwardedFromInputUIHost:](v5, "setKeyEventForwardedFromInputUIHost:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("keyEventForwardedFromInputUIHost")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyTranslationMap"));
    v16 = objc_claimAutoreleasedReturnValue();
    keyTranslationMap = v5->_keyTranslationMap;
    v5->_keyTranslationMap = (_UIPhysicalKeyTranslationMap *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalEscapeKeyTranslationMap"));
    v18 = objc_claimAutoreleasedReturnValue();
    originalEscapeKeyTranslationMap = v5->_originalEscapeKeyTranslationMap;
    v5->_originalEscapeKeyTranslationMap = (_UIPhysicalKeyTranslationMap *)v18;

    -[UIPhysicalKeyboardEvent _shiftModifiedInput](v5, "_shiftModifiedInput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = v5->_keyTranslationMap;
      -[UIPhysicalKeyboardEvent _shiftModifiedInput](v5, "_shiftModifiedInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPhysicalKeyTranslationMap setKeyTranslation:modifiers:](v21, "setKeyTranslation:modifiers:", v22, 0x20000);

    }
    if (-[UIEvent _hidEvent](v5, "_hidEvent"))
      v23 = v5->_keyTranslationMap != 0;
    else
      v23 = 0;
    v5->_needToPrepareKeyTranslationMap = v23;

  }
  return v5;
}

- (void)_prepareKeyTranslationMapIfNeeded
{
  _UIPhysicalKeyTranslator *v3;

  if (self->_needToPrepareKeyTranslationMap && -[UIEvent _hidEvent](self, "_hidEvent") && self->_keyTranslationMap)
  {
    v3 = -[_UIPhysicalKeyTranslator initWithGSKeyboard:]([_UIPhysicalKeyTranslator alloc], "initWithGSKeyboard:", objc_msgSend((id)UIApp, "_hardwareKeyboardForPhysicalKeyboardEvent:createIfNeeded:", self, 0));
    -[_UIPhysicalKeyTranslationMap populateAllCombinationsOfModifiers:translator:](self->_keyTranslationMap, "populateAllCombinationsOfModifiers:translator:", 1966080, v3);

  }
  self->_needToPrepareKeyTranslationMap = 0;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)_isKeyDown
{
  if (!-[UIEvent _hidEvent](self, "_hidEvent"))
    return 1;
  -[UIEvent _hidEvent](self, "_hidEvent");
  return IOHIDEventGetIntegerValue() != 0;
}

- (BOOL)_isEjectKey
{
  __IOHIDEvent *v3;
  uint64_t IntegerValue;
  uint64_t v5;
  BOOL v7;

  v3 = -[UIEvent _hidEvent](self, "_hidEvent");
  if (v3)
  {
    -[UIEvent _hidEvent](self, "_hidEvent");
    IntegerValue = IOHIDEventGetIntegerValue();
    -[UIEvent _hidEvent](self, "_hidEvent");
    v5 = IOHIDEventGetIntegerValue();
    v7 = v5 == 430 || v5 == 184;
    LOBYTE(v3) = IntegerValue == 12 && v7;
  }
  return (char)v3;
}

- (BOOL)_isGlobeKey
{
  __IOHIDEvent *v3;

  v3 = -[UIEvent _hidEvent](self, "_hidEvent");
  if (v3)
  {
    -[UIEvent _hidEvent](self, "_hidEvent");
    IOHIDEventGetIntegerValue();
    -[UIEvent _hidEvent](self, "_hidEvent");
    IOHIDEventGetIntegerValue();
    LOBYTE(v3) = GSKeyboardIsGlobeKeyUsagePair() != 0;
  }
  return (char)v3;
}

- (int64_t)_keyCode
{
  int64_t result;

  result = -[UIEvent _hidEvent](self, "_hidEvent");
  if (result)
  {
    -[UIEvent _hidEvent](self, "_hidEvent");
    return IOHIDEventGetIntegerValue();
  }
  return result;
}

- (BOOL)_isPhysicalKeyEvent
{
  return 1;
}

- (void)_setModifierFlags:(int64_t)a3
{
  _UIPhysicalKeyTranslationMap *keyTranslationMap;
  _UIPhysicalKeyTranslationMap *v6;
  _UIPhysicalKeyTranslationMap *v7;

  keyTranslationMap = self->_keyTranslationMap;
  if (keyTranslationMap
    && -[_UIPhysicalKeyTranslationMap originalModifiers](keyTranslationMap, "originalModifiers") != a3)
  {
    v6 = -[_UIPhysicalKeyTranslationMap initWithKeyCode:action:modifiers:]([_UIPhysicalKeyTranslationMap alloc], "initWithKeyCode:action:modifiers:", (unsigned __int16)-[UIPhysicalKeyboardEvent _keyCode](self, "_keyCode"), -[UIPhysicalKeyboardEvent _isKeyDown](self, "_isKeyDown") ^ 1, a3);
    v7 = self->_keyTranslationMap;
    self->_keyTranslationMap = v6;

    self->_needToPrepareKeyTranslationMap = 0;
  }
  self->_modifierFlags = a3;
}

- (BOOL)_isModifierKey
{
  __IOHIDEvent *v3;

  v3 = -[UIEvent _hidEvent](self, "_hidEvent");
  if (v3)
    LOBYTE(v3) = isModifierFlag(-[UIPhysicalKeyboardEvent _keyCode](self, "_keyCode"));
  return (char)v3;
}

- (BOOL)_isARepeat
{
  _BOOL4 v3;

  v3 = -[UIPhysicalKeyboardEvent _isKeyDown](self, "_isKeyDown");
  if (v3)
    LOBYTE(v3) = -[UIPhysicalKeyboardEvent _inputFlags](self, "_inputFlags") & 1;
  return v3;
}

- (BOOL)_isDeleteKey
{
  __IOHIDEvent *v3;
  uint64_t IntegerValue;
  uint64_t v5;

  v3 = -[UIEvent _hidEvent](self, "_hidEvent");
  if (v3)
  {
    -[UIEvent _hidEvent](self, "_hidEvent");
    IntegerValue = IOHIDEventGetIntegerValue();
    -[UIEvent _hidEvent](self, "_hidEvent");
    v5 = IOHIDEventGetIntegerValue();
    LOBYTE(v3) = IntegerValue == 7 && v5 == 42;
  }
  return (char)v3;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3 keyboard:(__GSKeyboard *)a4
{
  unint64_t TimeStamp;
  uint64_t IntegerValue;
  uint64_t v9;
  _UIPhysicalKeyTranslationMap *originalEscapeKeyTranslationMap;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  int ModifierState;
  void *v20;
  char v21;
  void *v22;
  unsigned int v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int LiveModifierState;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  __CFString *v38;
  int v39;
  BOOL v41;
  const void *v42;
  __GSEvent *gsEvent;
  unint64_t v44;
  unint64_t v45;
  _UIPhysicalKeyTranslator *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  _UIPhysicalKeyTranslationMap *v51;
  uint64_t v52;
  void *v53;
  unint64_t v54;
  __CFString *v55;
  void *v56;
  _UIPhysicalKeyTranslationMap *v57;
  _UIPhysicalKeyTranslationMap *keyTranslationMap;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _UIPhysicalKeyTranslationMap *v63;
  void *v64;
  void *v65;
  BOOL v66;
  int64_t v67;
  _QWORD v68[32];
  uint64_t v69;
  unsigned __int16 *v70;
  char *v71;
  unsigned int v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t *v77;
  unsigned __int16 *v78;
  unsigned __int16 *v79;
  int v80;
  objc_super v81;
  char v82[48];
  char v83[48];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v81.receiver = self;
  v81.super_class = (Class)UIPhysicalKeyboardEvent;
  -[UIEvent _setHIDEvent:](&v81, sel__setHIDEvent_);
  TimeStamp = IOHIDEventGetTimeStamp();
  -[UIEvent _setTimestamp:](self, "_setTimestamp:", _UIMediaTimeForMachTime(TimeStamp));
  if (!a4)
    return;
  if (IOHIDEventGetType() != 3)
    return;
  IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue != 7 && IntegerValue != 255)
  {
    if (IntegerValue != 12)
      return;
    v9 = IOHIDEventGetIntegerValue();
    if (v9 != 184 && v9 != 669 && v9 != 430)
      return;
  }
  originalEscapeKeyTranslationMap = self->_originalEscapeKeyTranslationMap;
  v69 = 152;
  self->_originalEscapeKeyTranslationMap = 0;

  v11 = IOHIDEventGetIntegerValue();
  v12 = IOHIDEventGetIntegerValue();
  v13 = IOHIDEventGetIntegerValue();
  v77 = &v69;
  MEMORY[0x1E0C80A78](v13);
  v76 = v12;
  v15 = v12 == 0;
  *(_QWORD *)((char *)&v68[30] + 2) = 0;
  *(_OWORD *)((char *)&v68[28] + 4) = 0u;
  *(_OWORD *)((char *)&v68[26] + 4) = 0u;
  *(_OWORD *)((char *)&v68[24] + 4) = 0u;
  *(_OWORD *)((char *)&v68[22] + 4) = 0u;
  *(_OWORD *)((char *)&v68[20] + 4) = 0u;
  *(_OWORD *)((char *)&v68[18] + 4) = 0u;
  *(_OWORD *)((char *)&v68[16] + 4) = 0u;
  *(_OWORD *)((char *)&v68[14] + 4) = 0u;
  *(_OWORD *)((char *)&v68[12] + 4) = 0u;
  *(_OWORD *)((char *)&v68[10] + 4) = 0u;
  *(_OWORD *)((char *)&v68[8] + 4) = 0u;
  *(_OWORD *)((char *)&v68[6] + 4) = 0u;
  if (v12)
    v16 = 10;
  else
    v16 = 11;
  *(_OWORD *)((char *)&v68[4] + 4) = 0uLL;
  LODWORD(v68[0]) = v16;
  v17 = v11 == 103 || v11 == 133;
  *(_OWORD *)((char *)&v68[2] + 4) = 0uLL;
  *(_OWORD *)((char *)v68 + 4) = 0uLL;
  v18 = 0x200000;
  if (!v17)
    v18 = 0;
  if ((unint64_t)(v11 - 83) < 0x11)
    v18 = 0x200000;
  if (v14 != 7)
    v18 = 0;
  v73 = v18;
  v80 = 0;
  ModifierState = GSKeyboardGetModifierState();
  if (!isModifierFlag(v11))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", v68[0], v68[1], v68[2], 0, v68[4], 0, v68[6], 0, v68[8], 0, v68[10], v68[11], v68[12], v68[13], v68[14], v68[15], v68[16],
      v68[17],
      v68[18],
      v68[19],
      v68[20],
      v68[21],
      v68[22],
      v68[23],
      v68[24],
      v68[25],
      v68[26],
      v68[27],
      v68[28],
      v68[29],
      v68[30],
      v68[31]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isCapsLockSwitchEnabled");

    if ((v21 & 1) == 0)
    {
      LODWORD(v79) = v15;
      BKSHIDEventGetKeyboardAttributes();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "GSModifierState");

      v24 = ModifierState & 0x40000;
      if (((v23 >> 18) & 1) != (ModifierState & 0x40000u) >> 18)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_setCapsLockIfNeeded:event:", a4, a3);

        ModifierState = GSKeyboardGetModifierState();
        v24 = ModifierState & 0x40000;
      }
      v26 = v24 != 0;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isCapsLockSignOn");

      if (v26 != v28)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_setCapsLockIfNeeded:event:", a4, a3);

      }
    }
  }
  LiveModifierState = GSKeyboardGetLiveModifierState();
  if (dyld_program_sdk_at_least())
    v31 = ModifierState & 0x40000;
  else
    v31 = 0;
  v74 = (char *)&v68[24] + 6;
  v78 = (unsigned __int16 *)&v68[24] + 2;
  v79 = (unsigned __int16 *)&v68[12];
  v75 = (char *)&v68[12] + 2;
  v70 = (unsigned __int16 *)&v68[18] + 1;
  v71 = (char *)&v68[18] + 4;
  GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
  v32 = GSKeyboardGetModifierState();
  v33 = GSKeyboardGetLiveModifierState();
  v34 = dyld_program_sdk_at_least();
  v35 = v32 & 0x40000;
  if (!v34)
    v35 = 0;
  v36 = v35 | v33;
  LODWORD(v68[8]) = v35 | v33;
  if (v13 == 7)
  {
    v37 = 54;
    if (v11 != 133)
      v37 = v11;
    if (v11 == 88)
      v11 = 40;
    else
      v11 = v37;
    LOWORD(v68[31]) = 1;
    if (isModifierFlag(v11))
    {
      v38 = 0;
      v39 = 0;
      v41 = v11 == 57 && (v31 | LiveModifierState) == v36;
      if (!*v79 && !*v78 && !v41)
      {
        LODWORD(v68[0]) = 12;
        if (dyld_program_sdk_at_least())
          v38 = &stru_1E16EDF20;
        else
          v38 = 0;
        v39 = 32;
      }
    }
    else
    {
      v39 = 0;
      v38 = 0;
    }
  }
  else
  {
    v39 = 0;
    v38 = 0;
    LOWORD(v68[31]) = 1;
  }
  v42 = (const void *)GSEventCreateWithEventRecord();
  gsEvent = self->super.super._gsEvent;
  if (gsEvent)
  {
    CFRelease(gsEvent);
    self->super.super._gsEvent = 0;
  }
  if (v42)
  {
    self->super.super._gsEvent = (__GSEvent *)CFRetain(v42);
    CFRelease(v42);
  }
  v72 = (LODWORD(v68[8]) >> 21) & 0x10 | v39;
  if ((v68[8] & 0x480000) != 0)
    v44 = ((unint64_t)((v68[8] & 0x1010000) != 0) << 20) | 0x80000;
  else
    v44 = (unint64_t)((v68[8] & 0x1010000) != 0) << 20;
  if ((v68[8] & 0x900000) != 0)
    v44 |= 0x40000uLL;
  if ((v68[8] & 0x220000) != 0)
    v44 |= 0x20000uLL;
  v45 = v73 | (LODWORD(v68[8]) >> 3) & 0x800000 | (LODWORD(v68[8]) >> 2) & 0x10000 | v44;
  v46 = -[_UIPhysicalKeyTranslator initWithGSKeyboard:]([_UIPhysicalKeyTranslator alloc], "initWithGSKeyboard:", a4);
  if ((_WORD)v80)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v82);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    _UIKeyCommandGetLocalizedSymbol(CFSTR("."));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqualToString:", v48);

    if (v49)
    {
      v50 = v76;
      v51 = -[_UIPhysicalKeyTranslationMap initWithKeyCode:action:modifiers:]([_UIPhysicalKeyTranslationMap alloc], "initWithKeyCode:action:modifiers:", (unsigned __int16)v11, v76 == 0, v45);
      v52 = v69;
      v53 = *(Class *)((char *)&self->super.super.super.isa + v69);
      *(Class *)((char *)&self->super.super.super.isa + v69) = (Class)v51;

      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v52), "populateAllCombinationsOfModifiers:translator:", 1966080, v46);
      v54 = v45 & 0xFFFFFFFFFFEFFFFFLL;
      v11 = 41;
    }
    else
    {
      -[UIPhysicalKeyboardEvent set_commandModifiedInput:](self, "set_commandModifiedInput:", v47);
      v54 = v45;
      v50 = v76;
    }

  }
  else
  {
    -[UIPhysicalKeyboardEvent set_commandModifiedInput:](self, "set_commandModifiedInput:", 0);
    v54 = v45;
    v50 = v76;
  }
  if (v13 != 7 || v38)
  {
    v55 = v38;
    v56 = v55;
    if (v13 != 7)
      goto LABEL_76;
  }
  else
  {
    _UISpecialKeyInputFromHIDUsage(v11 + v54);
    v55 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
  _UISpecialKeyInputFromHIDUsage(v11);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_76:
  v57 = -[_UIPhysicalKeyTranslationMap initWithKeyCode:action:modifiers:]([_UIPhysicalKeyTranslationMap alloc], "initWithKeyCode:action:modifiers:", (unsigned __int16)v11, v50 == 0, v54);
  keyTranslationMap = self->_keyTranslationMap;
  self->_keyTranslationMap = v57;

  -[UIPhysicalKeyboardEvent _setModifierFlags:](self, "_setModifierFlags:", v54);
  -[UIPhysicalKeyboardEvent set_privateModifierFlags:](self, "set_privateModifierFlags:", v45);
  -[UIPhysicalKeyboardEvent set_inputFlags:](self, "set_inputFlags:", v72);
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v75, *v79);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_modifiedInput:](self, "set_modifiedInput:", v59);

    if (v56)
      goto LABEL_78;
LABEL_80:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v71, *v70, v68[0]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_unmodifiedInput:](self, "set_unmodifiedInput:", v60);

    goto LABEL_81;
  }
  -[UIPhysicalKeyboardEvent set_modifiedInput:](self, "set_modifiedInput:", v55);
  if (!v56)
    goto LABEL_80;
LABEL_78:
  -[UIPhysicalKeyboardEvent set_unmodifiedInput:](self, "set_unmodifiedInput:", v56, v68[0]);
LABEL_81:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v74, *v78);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPhysicalKeyboardEvent set_markedInput:](self, "set_markedInput:", v61);

  if (HIWORD(v80))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v83);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_shiftModifiedInput:](self, "set_shiftModifiedInput:", v62);

    v63 = self->_keyTranslationMap;
    -[UIPhysicalKeyboardEvent _shiftModifiedInput](self, "_shiftModifiedInput");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPhysicalKeyTranslationMap setKeyTranslation:modifiers:](v63, "setKeyTranslation:modifiers:", v64, 0x20000);

  }
  else
  {
    -[UIPhysicalKeyboardEvent set_shiftModifiedInput:](self, "set_shiftModifiedInput:", 0);
  }
  -[_UIPhysicalKeyTranslationMap populateAllCombinationsOfModifiers:translator:](self->_keyTranslationMap, "populateAllCombinationsOfModifiers:translator:", 1966080, v46);
  self->_needToPrepareKeyTranslationMap = 0;
  if (v55)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v75, *v79);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPhysicalKeyboardEvent set_privateInput:](self, "set_privateInput:", v65);

    v66 = 1;
  }
  else
  {
    -[UIPhysicalKeyboardEvent set_privateInput:](self, "set_privateInput:", self->_modifiedInput);
    v67 = -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags");
    v66 = v67 != -[UIPhysicalKeyboardEvent _privateModifierFlags](self, "_privateModifierFlags");
  }
  self->_canPrivatize = v66;

}

- (int64_t)_matchFidelityForKeyCommand:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  char v9;
  int64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_keyTranslationMap)
    {
      -[UIPhysicalKeyboardEvent _prepareKeyTranslationMapIfNeeded](self, "_prepareKeyTranslationMapIfNeeded");
      v6 = -[UIPhysicalKeyboardEvent _matchFidelityForKeyCommand:translationMap:](self, "_matchFidelityForKeyCommand:translationMap:", v5, self->_keyTranslationMap);
      if (v6 == 3)
        goto LABEL_11;
    }
    else
    {
      if (objc_msgSend(v4, "_layoutAwareModifierFlags") == self->_modifierFlags)
      {
        objc_msgSend(v5, "_layoutAwareInput");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", self->_modifiedInput);

        if ((v9 & 1) != 0)
          goto LABEL_11;
      }
      v6 = 0;
    }
    if (self->_originalEscapeKeyTranslationMap)
    {
      v10 = -[UIPhysicalKeyboardEvent _matchFidelityForKeyCommand:translationMap:](self, "_matchFidelityForKeyCommand:translationMap:", v5);
      if (v10 == 3)
      {
LABEL_11:
        v7 = 3;
        goto LABEL_16;
      }
    }
    else
    {
      v10 = 0;
    }
    if (v6 <= v10)
      v7 = v10;
    else
      v7 = v6;
  }
  else
  {
    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (int64_t)_matchFidelityForKeyCommand:(id)a3 translationMap:(id)a4
{
  id v6;
  id v7;
  int64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = -[UIPhysicalKeyboardEvent _matchFidelityForKeyCommand:translationMap:additionalModifiers:](self, "_matchFidelityForKeyCommand:translationMap:additionalModifiers:", v6, v7, 0);
  if (!v8)
  {
    if (objc_msgSend(v6, "_allowsCommandKeyModifierElision")
      && objc_msgSend(v7, "originalModifiers") == 0x100000)
    {
      v8 = -[UIPhysicalKeyboardEvent _matchFidelityForKeyCommand:translationMap:additionalModifiers:](self, "_matchFidelityForKeyCommand:translationMap:additionalModifiers:", v6, v7, 0x20000);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)_matchFidelityForKeyCommand:(id)a3 translationMap:(id)a4 additionalModifiers:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  int64_t v15;
  void *v16;
  _UIPhysicalKeyTranslator *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  unsigned int v23;
  __int16 v24;
  uint64_t v26;
  int v27;
  int v28;
  _QWORD v29[4];
  _UIPhysicalKeyTranslator *v30;
  id v31;
  uint64_t *v32;
  __int16 v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "_layoutAwareModifierFlags") & 0x800000) != 0
    && !objc_msgSend(v8, "allowGlobeModifier"))
  {
    goto LABEL_17;
  }
  v10 = objc_msgSend(v9, "originalModifiers") | a5;
  v11 = v10 & objc_msgSend(v8, "_layoutAwareModifierFlags");
  if (v11 != objc_msgSend(v8, "_layoutAwareModifierFlags"))
    goto LABEL_17;
  if (dyld_program_sdk_at_least())
  {
    v10 &= objc_msgSend(v8, "_layoutAwareModifierFlags") | 0xFFFFFFFFFFDEFFFFLL;
    v12 = 2162688;
  }
  else
  {
    v12 = 0;
  }
  if (v10 == objc_msgSend(v8, "_layoutAwareModifierFlags"))
  {
    objc_msgSend(v8, "_layoutAwareKeyCodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsIndex:", objc_msgSend(v9, "keyCode"));

    if ((v14 & 1) != 0)
    {
      v15 = 3;
      goto LABEL_18;
    }
  }
  objc_msgSend(v8, "input");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  v17 = -[_UIPhysicalKeyTranslator initWithGSKeyboard:]([_UIPhysicalKeyTranslator alloc], "initWithGSKeyboard:", objc_msgSend((id)UIApp, "_hardwareKeyboardForPhysicalKeyboardEvent:createIfNeeded:", self, 1));
  objc_msgSend(v8, "_layoutAwareInput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lowercaseString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v38 = -[UIPhysicalKeyboardEvent _matchFidelityFromKeyMapForKeyCommand:translationMap:translator:addingModifiers:ignoringModifiers:](self, "_matchFidelityFromKeyMapForKeyCommand:translationMap:translator:addingModifiers:ignoringModifiers:", v8, v9, v17, a5, v12);
  v20 = v36[3] == 2;
  -[_UIPhysicalKeyTranslator layoutName](v17, "layoutName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyCommandMatchingCache keyCommandMatchingCacheForLayout:]((uint64_t)_UIKeyCommandMatchingCache, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[_UIKeyCommandMatchingCache conflictStateForCommandKeyPlaneSwitchForInput:modifiers:](v22, v19, 917504);
  if (!v36[3])
  {
    v26 = objc_msgSend(v8, "_layoutAwareModifierFlags");
    if ((v26 & v10) == objc_msgSend(v8, "_layoutAwareModifierFlags") && v23 != 1)
    {
      v34 = 0;
      if ((v10 & 0x100000) == 0)
      {
        v27 = objc_msgSend(v9, "areModifiers:minimalExcessOfMask:matching:translator:matchedModifierSubset:betterMatchFound:", v10 | 0x100000, objc_msgSend(v8, "_layoutAwareModifierFlags"), v19, v17, 0, &v34);
        v28 = v34 ? 0 : v27;
        if (v28 == 1)
          v36[3] = 1;
      }
    }
  }
  if ((unint64_t)(v36[3] - 1) <= 1)
  {
    if (v23 == 1)
    {
      v36[3] = 0;
    }
    else if (!v23 && objc_msgSend(v19, "length") == 1)
    {
      v24 = objc_msgSend(v19, "characterAtIndex:", 0);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __90__UIPhysicalKeyboardEvent__matchFidelityForKeyCommand_translationMap_additionalModifiers___block_invoke;
      v29[3] = &unk_1E16DF028;
      v30 = v17;
      v33 = v24;
      v31 = v9;
      v32 = &v35;
      +[_UIPhysicalKeyTranslationMap enumerateAllCombinationsOfModifiers:staticModifiers:usingBlock:](_UIPhysicalKeyTranslationMap, "enumerateAllCombinationsOfModifiers:staticModifiers:usingBlock:", 917504, (unint64_t)v20 << 20, v29);
      -[_UIKeyCommandMatchingCache setCommandKeyPlaneHasSwitchingConflict:input:modifiers:](v22, v36[3] == 0, v19, 917504);

    }
  }
  v15 = v36[3];

  _Block_object_dispose(&v35, 8);
LABEL_18:

  return v15;
}

uint64_t __90__UIPhysicalKeyboardEvent__matchFidelityForKeyCommand_translationMap_additionalModifiers___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  int v6;

  result = objc_msgSend(*(id *)(a1 + 32), "HIDUsageCodeForCharacter:modifiers:", *(unsigned __int16 *)(a1 + 56), a2);
  if ((_DWORD)result != -1)
  {
    v6 = result;
    result = objc_msgSend(*(id *)(a1 + 40), "keyCode");
    if (v6 != (_DWORD)result)
    {
      *a3 = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  return result;
}

- (int64_t)_matchFidelityFromKeyMapForKeyCommand:(id)a3 translationMap:(id)a4 translator:(id)a5 addingModifiers:(int64_t)a6 ignoringModifiers:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int64_t v21;
  uint64_t v23;
  char v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = objc_msgSend(v11, "_layoutAwareModifierFlags");
  v15 = (objc_msgSend(v12, "originalModifiers") | a6) & ~a7;
  objc_msgSend(v11, "_layoutAwareInput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "keyTranslationWithModifiers:translator:", objc_msgSend(v12, "originalModifiers"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lowercaseString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v17, "isEqualToString:", v19) & (v14 == (v15 & 0xBF0000));
  if (v20)
    v21 = 3;
  else
    v21 = 0;
  if ((v20 & 1) == 0 && v15)
  {
    if ((objc_msgSend(v11, "_isDirectlyReachableWithTranslator:", v13) & 1) != 0
      || (v24 = 0,
          v23 = 0,
          !objc_msgSend(v12, "areModifiers:minimalExcessOfMask:matching:translator:matchedModifierSubset:betterMatchFound:", v15 & 0xBF0000, v14, v17, v13, &v23, &v24)))
    {
      v21 = 0;
    }
    else if ((v15 & 0x100000) == 0 || (v23 & 0x100000) != 0)
    {
      v21 = 3;
    }
    else
    {
      v21 = 2;
    }
  }

  return v21;
}

- (BOOL)_shouldAttemptSecurePasteAuthentication
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[UIPhysicalKeyboardEvent _isKeyDown](self, "_isKeyDown"))
    return 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x1E0DC5BE8], "allVariants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags");
        if (v9 == objc_msgSend(v8, "keyModifierFlags"))
        {
          -[UIPhysicalKeyboardEvent _commandModifiedInput](self, "_commandModifiedInput");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "keyInput");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10;
          v13 = v11;
          if (v12 == v13)
          {

LABEL_19:
            v16 = 1;
            goto LABEL_20;
          }
          v14 = v13;
          if (v12 && v13)
          {
            v15 = objc_msgSend(v12, "isEqual:", v13);

            if ((v15 & 1) != 0)
              goto LABEL_19;
          }
          else
          {

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_20:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[UIPhysicalKeyboardEvent _isKeyDown](self, "_isKeyDown");
    if (v6 == objc_msgSend(v5, "_isKeyDown")
      && (v7 = -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags"),
          v7 == objc_msgSend(v5, "_modifierFlags")))
    {
      -[UIPhysicalKeyboardEvent _modifiedInput](self, "_modifiedInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_modifiedInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_cloneEvent
{
  uint64_t v3;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  if (-[UIEvent _hidEvent](self, "_hidEvent"))
    objc_msgSend((id)v3, "_setHIDEvent:keyboard:", -[UIEvent _hidEvent](self, "_hidEvent"), 0);
  -[UIPhysicalKeyboardEvent _modifiedInput](self, "_modifiedInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend((id)v3, "set_modifiedInput:", v5);

  -[UIPhysicalKeyboardEvent _unmodifiedInput](self, "_unmodifiedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend((id)v3, "set_unmodifiedInput:", v7);

  -[UIPhysicalKeyboardEvent _privateInput](self, "_privateInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend((id)v3, "set_privateInput:", v9);

  *(_QWORD *)(v3 + 240) = self->_privateModifierFlags;
  -[UIPhysicalKeyboardEvent _shiftModifiedInput](self, "_shiftModifiedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend((id)v3, "set_shiftModifiedInput:", v11);

  -[UIPhysicalKeyboardEvent _commandModifiedInput](self, "_commandModifiedInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend((id)v3, "set_commandModifiedInput:", v13);

  -[UIPhysicalKeyboardEvent _markedInput](self, "_markedInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend((id)v3, "set_markedInput:", v15);

  -[UIPhysicalKeyboardEvent _hint](self, "_hint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend((id)v3, "set_hint:", v17);

  objc_msgSend((id)v3, "_setModifierFlags:", -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags"));
  objc_msgSend((id)v3, "set_inputFlags:", -[UIPhysicalKeyboardEvent _inputFlags](self, "_inputFlags"));
  objc_msgSend((id)v3, "setSource:", -[UIPhysicalKeyboardEvent source](self, "source"));
  objc_msgSend((id)v3, "set_externalEvent:", -[UIPhysicalKeyboardEvent _isExternalEvent](self, "_isExternalEvent"));
  -[UIEvent timestamp](self, "timestamp");
  objc_msgSend((id)v3, "_setTimestamp:");
  *(_BYTE *)(v3 + 144) = self->_canPrivatize;
  v18 = -[_UIPhysicalKeyTranslationMap copy](self->_keyTranslationMap, "copy");
  v19 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v18;

  *(_BYTE *)(v3 + 168) = self->_needToPrepareKeyTranslationMap;
  v20 = -[_UIPhysicalKeyTranslationMap copy](self->_originalEscapeKeyTranslationMap, "copy");
  v21 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v20;

  *(_BYTE *)(v3 + 170) = -[UIPhysicalKeyboardEvent keyEventForwardedFromInputUIHost](self, "keyEventForwardedFromInputUIHost");
  *(_BYTE *)(v3 + 168) = self->_needToPrepareKeyTranslationMap;
  return (id)v3;
}

+ (id)_eventWithInput:(id)a3 inputFlags:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[UIPressesEvent _init]([UIPhysicalKeyboardEvent alloc], "_init");
  objc_msgSend(v6, "set_modifiedInput:", v5);
  objc_msgSend(v6, "set_unmodifiedInput:", v5);

  objc_msgSend(v6, "set_inputFlags:", v4);
  objc_msgSend(v6, "_setTimestamp:", (double)(unint64_t)GSCurrentEventTimestamp() / 1000000000.0);
  return v6;
}

- (void)_privatize
{
  NSString *privateInput;
  NSString **p_modifiedInput;
  int64_t privateModifierFlags;

  if (self->_canPrivatize)
  {
    self->_canPrivatize = 0;
    privateInput = self->_privateInput;
    if (privateInput)
    {
      p_modifiedInput = &self->_modifiedInput;
      if (privateInput != self->_modifiedInput)
      {
        objc_storeStrong((id *)p_modifiedInput, privateInput);
        objc_storeStrong((id *)&self->_unmodifiedInput, self->_privateInput);
      }
    }
    privateModifierFlags = self->_privateModifierFlags;
    if (privateModifierFlags != self->_modifierFlags)
      self->_modifierFlags = privateModifierFlags;
  }
}

- (int64_t)_gsModifierFlags
{
  unint64_t v2;

  v2 = -[UIPhysicalKeyboardEvent _modifierFlags](self, "_modifierFlags");
  return v2 & 0xA0000 | (((v2 >> 16) & 1) << 18) & 0xFFFFFFFFFBEFFFFFLL | (v2 >> 4) & 0x10000 | (((v2 >> 18) & 1) << 20) & 0xFFFFFFFFFBFFFFFFLL | (((v2 >> 23) & 1) << 26);
}

- (NSString)_modifiedInput
{
  return self->_modifiedInput;
}

- (void)set_modifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedInput, a3);
}

- (NSString)_unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (void)set_unmodifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_unmodifiedInput, a3);
}

- (NSString)_shiftModifiedInput
{
  return self->_shiftModifiedInput;
}

- (void)set_shiftModifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_shiftModifiedInput, a3);
}

- (NSString)_commandModifiedInput
{
  return self->_commandModifiedInput;
}

- (void)set_commandModifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_commandModifiedInput, a3);
}

- (NSString)_markedInput
{
  return self->_markedInput;
}

- (void)set_markedInput:(id)a3
{
  objc_storeStrong((id *)&self->_markedInput, a3);
}

- (int64_t)_modifierFlags
{
  return self->_modifierFlags;
}

- (int)_inputFlags
{
  return self->_inputFlags;
}

- (void)set_inputFlags:(int)a3
{
  self->_inputFlags = a3;
}

- (NSString)_privateInput
{
  return self->_privateInput;
}

- (void)set_privateInput:(id)a3
{
  objc_storeStrong((id *)&self->_privateInput, a3);
}

- (int64_t)_privateModifierFlags
{
  return self->_privateModifierFlags;
}

- (void)set_privateModifierFlags:(int64_t)a3
{
  self->_privateModifierFlags = a3;
}

- (NSString)_hint
{
  return self->_hint;
}

- (void)set_hint:(id)a3
{
  objc_storeStrong((id *)&self->_hint, a3);
}

- (void)set_keyCode:(int64_t)a3
{
  self->__keyCode = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unsigned)keyCommandCode
{
  return self->_keyCommandCode;
}

- (void)setKeyCommandCode:(unsigned int)a3
{
  self->_keyCommandCode = a3;
}

- (BOOL)keyCommandHandlingBeforePublic
{
  return self->_keyCommandHandlingBeforePublic;
}

- (void)setKeyCommandHandlingBeforePublic:(BOOL)a3
{
  self->_keyCommandHandlingBeforePublic = a3;
}

- (BOOL)keyEventForwardedFromInputUIHost
{
  return self->_keyEventForwardedFromInputUIHost;
}

- (void)setKeyEventForwardedFromInputUIHost:(BOOL)a3
{
  self->_keyEventForwardedFromInputUIHost = a3;
}

- (BOOL)shiftDown
{
  return self->_shiftDown;
}

- (void)setShiftDown:(BOOL)a3
{
  self->_shiftDown = a3;
}

- (BOOL)_isExternalEvent
{
  return self->__externalEvent;
}

- (void)set_externalEvent:(BOOL)a3
{
  self->__externalEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_privateInput, 0);
  objc_storeStrong((id *)&self->_markedInput, 0);
  objc_storeStrong((id *)&self->_commandModifiedInput, 0);
  objc_storeStrong((id *)&self->_shiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
  objc_storeStrong((id *)&self->_modifiedInput, 0);
  objc_storeStrong((id *)&self->_keyTranslationMap, 0);
  objc_storeStrong((id *)&self->_originalEscapeKeyTranslationMap, 0);
}

@end
