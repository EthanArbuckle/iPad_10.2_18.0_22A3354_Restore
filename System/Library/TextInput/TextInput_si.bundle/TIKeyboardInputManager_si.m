@implementation TIKeyboardInputManager_si

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL4 v5;
  objc_super v7;

  v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_si;
  -[TIKeyboardInputManager_si syncToKeyboardState:from:afterContextChange:](&v7, sel_syncToKeyboardState_from_afterContextChange_, a3, a4);
  if (v5)
    -[TIKeyboardInputManager_si setLastTypedChar:](self, "setLastTypedChar:", 0);
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y;
  double x;
  uint64_t v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v19;
  __int16 v20;
  _BYTE v21[32];
  uint64_t v22;

  y = a5.y;
  x = a5.x;
  v9 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  if (objc_msgSend(v11, "length") == 1)
    v12 = objc_msgSend(v11, "characterAtIndex:", 0);
  else
    v12 = 0;
  v13 = -[TIKeyboardInputManager_si composedCharacterWithInputCharacter:](self, "composedCharacterWithInputCharacter:", v12);
  v20 = v13;
  if ((_DWORD)v13)
  {
    v14 = v13;
    *a6 = 1;
    TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.isa
                                                         + (int)*MEMORY[0x24BEB5498]));
    MEMORY[0x2349031D8](v21, v14);
    TIInputManager::add_input();
    KB::String::~String((KB::String *)v21);
    if ((_DWORD)v14 == 3548)
      v15 = 3548;
    else
      v15 = 0;
    -[TIKeyboardInputManager_si setLastTypedChar:](self, "setLastTypedChar:", v15);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v20, 1);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManager_si setLastTypedChar:](self, "setLastTypedChar:", v12);
    v19.receiver = self;
    v19.super_class = (Class)TIKeyboardInputManager_si;
    -[TIKeyboardInputManager_si addInput:flags:point:firstDelete:](&v19, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;

  return v17;
}

- (unsigned)composedCharacterWithInputCharacter:(unsigned __int16)a3
{
  int v3;
  int v4;
  unsigned __int16 v5;

  v3 = a3;
  v4 = -[TIKeyboardInputManager_si lastTypedChar](self, "lastTypedChar");
  if (!v3 || !v4)
    return 0;
  if (v4 > 3543)
  {
    if (v4 == 3544)
    {
      if (v3 == 3544)
        return 3570;
    }
    else if (v4 == 3545)
    {
      if (v3 <= 3534)
      {
        if (v3 == 3473)
          return 3475;
        if (v3 == 3530)
          return 3546;
      }
      else
      {
        switch(v3)
        {
          case 3551:
            return 3550;
          case 3545:
            return 3547;
          case 3535:
            return 3548;
        }
      }
    }
    else if (v4 == 3548 && v3 == 3530)
    {
      return 3549;
    }
    return 0;
  }
  switch(v4)
  {
    case 3467:
      if (v3 != 3551)
        return 0;
      v5 = 3468;
      break;
    case 3468:
    case 3470:
    case 3472:
    case 3474:
    case 3475:
      return 0;
    case 3469:
      if (v3 != 3544)
        return 0;
      v5 = 3470;
      break;
    case 3471:
      if (v3 != 3551)
        return 0;
      v5 = 3472;
      break;
    case 3473:
      if (v3 != 3530)
        return 0;
      v5 = 3474;
      break;
    case 3476:
      if (v3 == 3551)
        v5 = 3478;
      else
        v5 = 0;
      if (v3 == 3530)
        v5 = 3477;
      break;
    default:
      if (v4 != 3461 || (v3 - 3535) >= 3)
        return 0;
      v5 = v3 - 73;
      break;
  }
  return v5;
}

- (void)deleteFromInputWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_si;
  -[TIKeyboardInputManager_si deleteFromInputWithContext:](&v4, sel_deleteFromInputWithContext_, a3);
  -[TIKeyboardInputManager_si setLastTypedChar:](self, "setLastTypedChar:", 0);
}

- (unsigned)lastTypedChar
{
  return self->_lastTypedChar;
}

- (void)setLastTypedChar:(unsigned __int16)a3
{
  self->_lastTypedChar = a3;
}

@end
