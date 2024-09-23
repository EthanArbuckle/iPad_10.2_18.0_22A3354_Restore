@implementation TypistKeyboardDataInputUIClient

+ (BOOL)connectToRemoteKeyboard:(double)a3
{
  int v4;
  BOOL v5;

  if (_inputTeletypeIsLinked_onceToken != -1)
    dispatch_once(&_inputTeletypeIsLinked_onceToken, &__block_literal_global_2);
  v4 = _activeConnectionPtr_activeConnectionPtr;
  if (_inputTeletypeIsLinked_linked)
    v5 = _activeConnectionPtr_activeConnectionPtr == 0;
  else
    v5 = 0;
  if (v5)
  {
    v4 = objc_msgSend(getITTKeyboardProxyClass(), "connectToRemoteKeyboard:", a3);
    _activeConnectionPtr_activeConnectionPtr = v4;
  }
  return v4 != 0;
}

+ (void)disconnectFromRemoteKeyboard
{
  BOOL v2;

  if (_inputTeletypeIsLinked_onceToken != -1)
    dispatch_once(&_inputTeletypeIsLinked_onceToken, &__block_literal_global_2);
  if (_inputTeletypeIsLinked_linked)
    v2 = _activeConnectionPtr_activeConnectionPtr == 0;
  else
    v2 = 1;
  if (!v2)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "disconnectFromRemoteKeyboard");
    _activeConnectionPtr_activeConnectionPtr = 0;
  }
}

+ (void)tryConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__TypistKeyboardDataInputUIClient_tryConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tryConnection_onceToken != -1)
    dispatch_once(&tryConnection_onceToken, block);
}

uint64_t __48__TypistKeyboardDataInputUIClient_tryConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectToRemoteKeyboard:", 5.0);
}

+ (id)getKeyboardLayout:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  v5 = (id)MEMORY[0x24BDBD1B8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("ITT"), "stringByAppendingString:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "performSelector:", sel_flickTable);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "performSelector:", sel__flickGestureDirection);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "performSelector:", sel_whiteSpaceRegex);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "performSelector:", sel_multiTapOrbit);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v10 = (void *)getITTKeyboardConfigurationClass_softClass;
    v33 = getITTKeyboardConfigurationClass_softClass;
    if (!getITTKeyboardConfigurationClass_softClass)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __getITTKeyboardConfigurationClass_block_invoke;
      v29[3] = &unk_251A7C9D8;
      v29[4] = &v30;
      __getITTKeyboardConfigurationClass_block_invoke((uint64_t)v29);
      v10 = (void *)v31[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v30, 8);
    v12 = [v11 alloc];
    v13 = objc_msgSend(v4, "isTenKey");
    v14 = objc_msgSend(v4, "isKanaKeyboard");
    v15 = objc_msgSend(v4, "flickTyping");
    v16 = objc_msgSend(v4, "shouldShowDictationKey");
    v17 = objc_msgSend(v4, "shouldShowGlobeKey");
    LOBYTE(v24) = objc_msgSend(v4, "usePopupKeys");
    v18 = (void *)objc_msgSend(v12, "initWithClassKey:isTenKey:isKana:flickTyping:showDictationKey:showGlobeKey:usePopupKeys:flickTable:flickGestureDirection:whiteSpaceRegex:multiTapOrbit:", v27, v13, v14, v15, v16, v17, v24, v26, v25, v8, v9);
    objc_msgSend(getITTKeyboardProxyClass(), "getKeyboardLayoutWithConfiguration:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "asPropertyList");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = (void *)MEMORY[0x24BDBD1B8];
    if (v20)
      v22 = (void *)v20;
    v5 = v22;

  }
  return v5;
}

+ (id)getTIPreferences
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "tryConnection");
  v2 = (id)MEMORY[0x24BDBD1B8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getTIPreferences");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = v2;
    v2 = v5;

  }
  return v2;
}

+ (id)getKeyboardUISettings
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "tryConnection");
  v2 = (id)MEMORY[0x24BDBD1B8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getKeyboardUISettings");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = v2;
    v2 = v5;

  }
  return v2;
}

+ (id)getSentenceBoundaryStrings
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "tryConnection");
  v2 = (id)MEMORY[0x24BDBD1B8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getSentenceBoundaryStrings");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = v2;
    v2 = v5;

  }
  return v2;
}

+ (id)setTIPreferences:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  v5 = (id)MEMORY[0x24BDBD1B8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__TypistKeyboardDataInputUIClient_setTIPreferences___block_invoke;
    v12[3] = &unk_251A7CDB0;
    v13 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(getITTKeyboardProxyClass(), "setTIPreferences:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v5;
    v5 = v10;

  }
  return v5;
}

void __52__TypistKeyboardDataInputUIClient_setTIPreferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v17);
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TYLog(CFSTR("WARNING: Unsupported key or value class in -setTIPreferences: key=%@, class(key)=%@, class(obj)=%@"), v9, v10, v11, v12, v13, v14, v15, (char)v17);

  }
}

+ (id)setKeyboardUISettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  v5 = (id)MEMORY[0x24BDBD1B8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__TypistKeyboardDataInputUIClient_setKeyboardUISettings___block_invoke;
    v12[3] = &unk_251A7CDB0;
    v13 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(getITTKeyboardProxyClass(), "setKeyboardUISettings:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v5;
    v5 = v10;

  }
  return v5;
}

void __57__TypistKeyboardDataInputUIClient_setKeyboardUISettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v17);
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TYLog(CFSTR("WARNING: Unsupported key or value class in -setKeyboardUISettings: key=%@, class(key)=%@, class(obj)=%@"), v9, v10, v11, v12, v13, v14, v15, (char)v17);

  }
}

+ (id)setKeyboards:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  v5 = (id)MEMORY[0x24BDBD1A8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "setKeyboards:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v5 = v8;

  }
  return v5;
}

+ (id)addKeyboards:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  v5 = (id)MEMORY[0x24BDBD1A8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "addKeyboards:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v5 = v8;

  }
  return v5;
}

+ (id)removeKeyboards:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  v5 = (id)MEMORY[0x24BDBD1A8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "removeKeyboards:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v5 = v8;

  }
  return v5;
}

+ (id)dismissOneTimeTIActions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  v5 = (id)MEMORY[0x24BDBD1B8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "dismissOneTimeTIActions:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v5 = v8;

  }
  return v5;
}

+ (BOOL)switchToKeyboard:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  if (_activeConnectionPtr_activeConnectionPtr)
    v5 = objc_msgSend(getITTKeyboardProxyClass(), "switchToKeyboard:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)dismissKeyboard
{
  objc_msgSend(a1, "tryConnection");
  if (_activeConnectionPtr_activeConnectionPtr)
    return objc_msgSend(getITTKeyboardProxyClass(), "dismissKeyboard");
  else
    return 0;
}

+ (BOOL)switchToPlane:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  if (_activeConnectionPtr_activeConnectionPtr)
    v5 = objc_msgSend(getITTKeyboardProxyClass(), "switchToPlane:", v4);
  else
    v5 = 0;

  return v5;
}

+ (id)getVisibleKeyplaneName
{
  __CFString *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(a1, "tryConnection");
  v2 = &stru_251A7DE60;
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getVisibleKeyplaneName");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (__CFString *)v3;
    else
      v5 = &stru_251A7DE60;
    v2 = v5;

  }
  return v2;
}

+ (id)getKeyplaneDescription:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  TypistKeyplane *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "tryConnection");
  if (_activeConnectionPtr_activeConnectionPtr
    && (objc_msgSend(getITTKeyboardProxyClass(), "getDescriptionOfKeyplane:", v4),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = objc_alloc_init(TypistKeyplane);
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyplane setName:](v7, "setName:", v8);

    -[TypistKeyplane setIsLetters:](v7, "setIsLetters:", objc_msgSend(v6, "isLetters"));
    -[TypistKeyplane setIsAlphabeticPlane:](v7, "setIsAlphabeticPlane:", objc_msgSend(v6, "isAlphabeticPlane"));
    -[TypistKeyplane setIsShiftKeyplane:](v7, "setIsShiftKeyplane:", objc_msgSend(v6, "isShiftKeyplane"));
    -[TypistKeyplane setUsesAutoShift:](v7, "setUsesAutoShift:", objc_msgSend(v6, "usesAutoShift"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getAllCandidates
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (id)MEMORY[0x24BDBD1A8];
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getAllCandidates");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = v2;
    v2 = v5;

  }
  return v2;
}

+ (id)getVisibleCandidateList:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = v3;
  if (!_activeConnectionPtr_activeConnectionPtr)
  {
    v6 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("typistCandidateBarTypeMecabra")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("typistCandidateBarTypeFavonious")))
      goto LABEL_7;
  }
  objc_msgSend(getITTKeyboardProxyClass(), "getVisibleCandidates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1A8];
  v8 = v7;

  return v8;
}

+ (CGPoint)getCandidateCenter:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v3 = a3;
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    getITTKeyboardProxyClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      getITTKeyboardProxyClass();
      objc_msgSend((id)objc_opt_class(), sel_getCandidateRectWithString_, v3);
    }
    UIRectGetCenter();
    v4 = v6;
    v5 = v7;
  }
  else
  {
    v4 = *MEMORY[0x24BDBEFB0];
    v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }

  v8 = v4;
  v9 = v5;
  result.y = v9;
  result.x = v8;
  return result;
}

+ (CGRect)getCandidateBarRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getCandidateBarRect");
  }
  else
  {
    v2 = *MEMORY[0x24BDBF090];
    v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (__n128)getKeyboardScaleTransform
{
  __n128 result;

  if (_activeConnectionPtr_activeConnectionPtr)
    objc_msgSend(getITTKeyboardProxyClass(), "getKeyboardScaleTransform");
  else
    return *(__n128 *)MEMORY[0x24BDAEE00];
  return result;
}

+ (double)getKeyboardPPM
{
  double result;

  if (!_activeConnectionPtr_activeConnectionPtr)
    return 0.0;
  objc_msgSend(getITTKeyboardProxyClass(), "getKeyboardPPM");
  return result;
}

+ (BOOL)isExtendedCandidateViewMode
{
  if (_activeConnectionPtr_activeConnectionPtr)
    return objc_msgSend(getITTKeyboardProxyClass(), "isExtendedCandidateViewMode");
  else
    return 0;
}

+ (CGPoint)getExtendedCandidateViewToggleButtonCenter
{
  double v2;
  double v3;
  CGPoint result;

  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getExtendedCandidateViewToggleButtonCenter");
  }
  else
  {
    v2 = *MEMORY[0x24BDBEFB0];
    v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v3;
  result.x = v2;
  return result;
}

+ (BOOL)hasMarkedText
{
  if (_activeConnectionPtr_activeConnectionPtr)
    return objc_msgSend(getITTKeyboardProxyClass(), "hasMarkedText");
  else
    return 0;
}

+ (id)markedText
{
  __CFString *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  v2 = &stru_251A7DE60;
  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "markedText");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (__CFString *)v3;
    else
      v5 = &stru_251A7DE60;
    v2 = v5;

  }
  return v2;
}

+ (void)showCandidateAtIndex:(int64_t)a3
{
  if (_activeConnectionPtr_activeConnectionPtr)
    objc_msgSend(getITTKeyboardProxyClass(), "showCandidateAtIndex:", a3);
}

+ (CGRect)findKeyBoundsInKeyboard:(id)a3
{
  id v3;
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
  CGRect result;

  if (_activeConnectionPtr_activeConnectionPtr)
  {
    v3 = a3;
    objc_msgSend(getITTKeyboardProxyClass(), "findKeyBoundsInKeyboard:", v3);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v5 = *MEMORY[0x24BDBF070];
    v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v9 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)addKeyboardPopupKeys:(id)a3 keys:(id)a4 inPlane:(id)a5 addTo:(id)a6 keyplaneKeycaps:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  __assert_rtn("+[TypistKeyboardDataInputUIClient addKeyboardPopupKeys:keys:inPlane:addTo:keyplaneKeycaps:]", "TypistKeyboardDataInputUIClient.m", 448, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient addKeyboardPopupKeys:keys:inPlane:addTo:keyplaneCaps:]\");
}

+ (CGPoint)centerOfKey:(CGPoint)a3 withOffset:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x + a4.x;
  v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)floatingKeyboardDraggablePoint
{
  __assert_rtn("+[TypistKeyboardDataInputUIClient floatingKeyboardDraggablePoint]", "TypistKeyboardDataInputUIClient.m", 460, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient floatingKeyboardDraggablePoint]\");
}

+ (id)generateKeyplaneSwitchTable:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("+[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTable:]", "TypistKeyboardDataInputUIClient.m", 467, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTable:]\");
}

+ (id)generateKeyplaneSwitchTableFor10Key:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("+[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTableFor10Key:]", "TypistKeyboardDataInputUIClient.m", 474, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient generateKeyplaneSwitchTableFor10Key:]\");
}

+ (CGPoint)getCandidateCenterAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  if (_activeConnectionPtr_activeConnectionPtr)
  {
    objc_msgSend(getITTKeyboardProxyClass(), "getCandidateCenterWithIndex:", a3);
  }
  else
  {
    v3 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

+ (id)getRepresentedStringFromKey:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("+[TypistKeyboardDataInputUIClient getRepresentedStringFromKey:]", "TypistKeyboardDataInputUIClient.m", 489, "false && \"Do no expect calls to -[TypistKeyboardDataInputUIClient getRepresentedStringFromKey:]\");
}

@end
