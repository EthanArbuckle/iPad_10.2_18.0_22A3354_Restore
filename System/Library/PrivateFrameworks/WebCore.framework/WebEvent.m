@implementation WebEvent

+ (unsigned)modifierFlags
{
  PAL *IsHardwareKeyboardAttached;

  IsHardwareKeyboardAttached = (PAL *)GSEventIsHardwareKeyboardAttached();
  if ((_DWORD)IsHardwareKeyboardAttached)
  {
    objc_msgSend((id)objc_msgSend((id)PAL::getUIApplicationClass(IsHardwareKeyboardAttached), "sharedApplication"), "_hardwareKeyboard");
    LODWORD(IsHardwareKeyboardAttached) = GSKeyboardGetModifierState();
  }
  return IsHardwareKeyboardAttached;
}

- (WebEvent)initWithMouseEventType:(int)a3 timeStamp:(double)a4 location:(CGPoint)a5
{
  return -[WebEvent initWithMouseEventType:timeStamp:location:modifiers:](self, "initWithMouseEventType:timeStamp:location:modifiers:", *(_QWORD *)&a3, 0, a4, a5.x, a5.y);
}

- (WebEvent)initWithMouseEventType:(int)a3 timeStamp:(double)a4 location:(CGPoint)a5 modifiers:(unsigned int)a6
{
  CGFloat y;
  CGFloat x;
  WebEvent *result;
  objc_super v12;

  y = a5.y;
  x = a5.x;
  v12.receiver = self;
  v12.super_class = (Class)WebEvent;
  result = -[WebEvent init](&v12, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_timestamp = a4;
    result->_locationInWindow.x = x;
    result->_locationInWindow.y = y;
    result->_modifierFlags = a6;
  }
  return result;
}

- (WebEvent)initWithScrollWheelEventWithTimeStamp:(double)a3 location:(CGPoint)a4 deltaX:(float)a5 deltaY:(float)a6
{
  CGFloat y;
  CGFloat x;
  WebEvent *result;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v12.receiver = self;
  v12.super_class = (Class)WebEvent;
  result = -[WebEvent init](&v12, sel_init);
  if (result)
  {
    result->_type = 3;
    result->_timestamp = a3;
    result->_locationInWindow.x = x;
    result->_locationInWindow.y = y;
    result->_deltaX = a5;
    result->_deltaY = a6;
  }
  return result;
}

- (WebEvent)initWithTouchEventType:(int)a3 timeStamp:(double)a4 location:(CGPoint)a5 modifiers:(unsigned int)a6 touchCount:(unsigned int)a7 touchLocations:(id)a8 touchIdentifiers:(id)a9 touchPhases:(id)a10 isGesture:(BOOL)a11 gestureScale:(float)a12 gestureRotation:(float)a13
{
  CGFloat y;
  CGFloat x;
  WebEvent *v24;
  WebEvent *v25;
  objc_super v27;

  y = a5.y;
  x = a5.x;
  v27.receiver = self;
  v27.super_class = (Class)WebEvent;
  v24 = -[WebEvent init](&v27, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_type = a3;
    v24->_modifierFlags = a6;
    v24->_timestamp = a4;
    v24->_locationInWindow.x = x;
    v24->_locationInWindow.y = y;
    v24->_touchCount = a7;
    v24->_touchLocations = (NSArray *)objc_msgSend(a8, "copy");
    v25->_touchIdentifiers = (NSArray *)objc_msgSend(a9, "copy");
    v25->_touchPhases = (NSArray *)objc_msgSend(a10, "copy");
    v25->_isGesture = a11;
    v25->_gestureScale = a12;
    v25->_gestureRotation = a13;
  }
  return v25;
}

- (WebEvent)initWithKeyEventType:(int)a3 timeStamp:(double)a4 characters:(id)a5 charactersIgnoringModifiers:(id)a6 modifiers:(unsigned int)a7 isRepeating:(BOOL)a8 withFlags:(unint64_t)a9 withInputManagerHint:(id)a10 keyCode:(unsigned __int16)a11 isTabKey:(BOOL)a12
{
  WebEvent *v19;
  WebEvent *v20;
  unint64_t keyboardFlags;
  int v22;
  unsigned int v23;
  int v24;
  WebCore *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)WebEvent;
  v19 = -[WebEvent init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    v19->_timestamp = a4;
    v19->_modifierFlags = a7;
    v19->_keyboardFlags = a9;
    v19->_inputManagerHint = (NSString *)a10;
    keyboardFlags = v20->_keyboardFlags;
    if ((keyboardFlags & 0x20) == 0
      && (v22 = objc_msgSend(a6, "isEqualToString:", CFSTR(".")), (a7 & 0x1010000) != 0)
      && v22)
    {
      v20->_modifierFlags &= 0xFEFEFFFF;
      v23 = 41;
LABEL_6:
      v24 = WebCore::windowsKeyCodeForKeyCode(unsigned short)::windowsKeyCode[v23];
LABEL_7:
      v20->_keyCode = v24;
      if ((keyboardFlags & 0x20) == 0)
      {
LABEL_8:
        v20->_characters = (NSString *)(id)normalizedStringWithAppKitCompatibilityMapping((NSString *)a5, v23);
        v20->_charactersIgnoringModifiers = (NSString *)(id)normalizedStringWithAppKitCompatibilityMapping((NSString *)a6, v23);
        v20->_tabKey = a12;
        v20->_keyRepeating = a8;
      }
    }
    else
    {
      v23 = a11;
      switch(a11)
      {
        case 0xE0u:
          LOWORD(v24) = 162;
          goto LABEL_7;
        case 0xE1u:
          LOWORD(v24) = 160;
          goto LABEL_7;
        case 0xE2u:
          LOWORD(v24) = 164;
          goto LABEL_7;
        case 0xE3u:
          LOWORD(v24) = 91;
          goto LABEL_7;
        case 0xE4u:
          LOWORD(v24) = 163;
          goto LABEL_7;
        case 0xE5u:
          LOWORD(v24) = 161;
          goto LABEL_7;
        case 0xE6u:
          LOWORD(v24) = 165;
          goto LABEL_7;
        case 0xE7u:
          LOWORD(v24) = 93;
          goto LABEL_7;
        default:
          if (a11)
          {
            if (a11 == 133)
            {
              LOWORD(v24) = 108;
              goto LABEL_7;
            }
            if (a11 > 0x81u)
            {
              LOWORD(v24) = 0;
              goto LABEL_7;
            }
            goto LABEL_6;
          }
          if (objc_msgSend(a6, "length") == 1)
          {
            v26 = (WebCore *)objc_msgSend(a6, "characterAtIndex:", 0);
            if ((_DWORD)v26 == 10)
            {
              v23 = 0;
              LOWORD(v24) = 13;
            }
            else
            {
              LOWORD(v24) = WebCore::windowsKeyCodeForCharCode(v26);
              v23 = 0;
            }
            goto LABEL_7;
          }
          v23 = 0;
          if ((keyboardFlags & 0x20) == 0)
            goto LABEL_8;
          break;
      }
    }
  }
  return v20;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebEvent;
  -[WebEvent dealloc](&v3, sel_dealloc);
}

- (id)_typeDescription
{
  uint64_t type;

  type = self->_type;
  if (type > 9)
    return CFSTR("Unknown");
  else
    return off_1E34863B0[type];
}

- (id)_modiferFlagsDescription
{
  uint64_t modifierFlags;

  modifierFlags = (int)self->_modifierFlags;
  if (modifierFlags > 9)
    return CFSTR("Unknown");
  else
    return off_1E34863B0[modifierFlags];
}

- (id)_touchLocationsDescription:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = &stru_1E3487BC0;
    do
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(a3);
      objc_msgSend(**((id **)&v15 + 1), "pointValue");
      objc_msgSend(v4, "appendFormat:", CFSTR("%@(%f, %f)"), v8, v9, v10);
      if (v6 >= 2)
      {
        for (i = 1; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(a3);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "pointValue");
          objc_msgSend(v4, "appendFormat:", CFSTR("%@(%f, %f)"), CFSTR(", "), v12, v13);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = CFSTR(", ");
    }
    while (v6);
  }
  return v4;
}

- (id)_touchIdentifiersDescription
{
  void *v3;
  NSArray *touchIdentifiers;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  touchIdentifiers = self->_touchIdentifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](touchIdentifiers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = &stru_1E3487BC0;
    do
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(touchIdentifiers);
      objc_msgSend(v3, "appendFormat:", CFSTR("%@%u"), v8, objc_msgSend(**((id **)&v11 + 1), "unsignedIntValue"));
      if (v6 >= 2)
      {
        for (i = 1; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(touchIdentifiers);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@%u"), CFSTR(", "), objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntValue"));
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](touchIdentifiers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = CFSTR(", ");
    }
    while (v6);
  }
  return v3;
}

- (id)_touchPhaseDescription:(int)a3
{
  if (a3 > 4)
    return CFSTR("Unknown");
  else
    return off_1E3486400[a3];
}

- (id)_touchPhasesDescription
{
  void *v3;
  NSArray *touchPhases;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  touchPhases = self->_touchPhases;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](touchPhases, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = &stru_1E3487BC0;
    do
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(touchPhases);
      objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v8, -[WebEvent _touchPhaseDescription:](self, "_touchPhaseDescription:", objc_msgSend(**((id **)&v11 + 1), "unsignedIntValue")));
      if (v6 >= 2)
      {
        for (i = 1; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(touchPhases);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), CFSTR(", "), -[WebEvent _touchPhaseDescription:](self, "_touchPhaseDescription:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntValue")));
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](touchPhases, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = CFSTR(", ");
    }
    while (v6);
  }
  return v3;
}

- (id)_eventDescription
{
  id result;
  unint64_t keyboardFlags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  switch(self->_type)
  {
    case 0:
    case 1:
    case 2:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("location: (%f, %f)"), *(_QWORD *)&self->_locationInWindow.x, *(_QWORD *)&self->_locationInWindow.y, v4, v5, v6, v7, v8, v9, v10);
      break;
    case 3:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("location: (%f, %f) deltaX: %f deltaY: %f"), *(_QWORD *)&self->_locationInWindow.x, *(_QWORD *)&self->_locationInWindow.y, self->_deltaX, self->_deltaY, v6, v7, v8, v9, v10);
      break;
    case 4:
    case 5:
      keyboardFlags = self->_keyboardFlags;
      if ((keyboardFlags & 0x20) != 0)
        result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flags: %d keyboardFlags: %lu keyCode %d"), self->_modifierFlags, self->_keyboardFlags, self->_keyCode, v5, v6, v7, v8, v9, v10);
      else
        result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("chars: %@ charsNoModifiers: %@ flags: %d repeating: %d keyboardFlags: %lu keyCode %d, isTab: %d"), self->_characters, self->_charactersIgnoringModifiers, self->_modifierFlags, self->_keyRepeating, keyboardFlags, self->_keyCode, self->_tabKey, v9, v10);
      break;
    case 6:
    case 7:
    case 8:
    case 9:
      result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("location: (%f, %f) count: %d locations: %@ identifiers: %@ phases: %@ isGesture: %d scale: %f rotation: %f"), *(_QWORD *)&self->_locationInWindow.x, *(_QWORD *)&self->_locationInWindow.y, self->_touchCount, -[WebEvent _touchLocationsDescription:](self, "_touchLocationsDescription:", self->_touchLocations), -[WebEvent _touchIdentifiersDescription](self, "_touchIdentifiersDescription"), -[WebEvent _touchPhasesDescription](self, "_touchPhasesDescription"), self->_isGesture, self->_gestureScale, self->_gestureRotation);
      break;
    default:
      result = CFSTR("Unknown");
      break;
  }
  return result;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ type: %@ - %@"), -[WebEvent description](&v3, sel_description), -[WebEvent _typeDescription](self, "_typeDescription"), -[WebEvent _eventDescription](self, "_eventDescription"));
}

- (CGPoint)locationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInWindow.x;
  y = self->_locationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)characters
{
  NSString *characters;

  characters = self->_characters;
  if (characters)
    CFRetain(self->_characters);
  return (NSString *)(id)CFMakeCollectable(characters);
}

- (NSString)charactersIgnoringModifiers
{
  NSString *charactersIgnoringModifiers;

  charactersIgnoringModifiers = self->_charactersIgnoringModifiers;
  if (charactersIgnoringModifiers)
    CFRetain(self->_charactersIgnoringModifiers);
  return (NSString *)(id)CFMakeCollectable(charactersIgnoringModifiers);
}

- (NSString)inputManagerHint
{
  NSString *inputManagerHint;

  inputManagerHint = self->_inputManagerHint;
  if (inputManagerHint)
    CFRetain(self->_inputManagerHint);
  return (NSString *)(id)CFMakeCollectable(inputManagerHint);
}

- (unsigned)modifierFlags
{
  return self->_modifierFlags;
}

- (BOOL)isKeyRepeating
{
  return self->_keyRepeating;
}

- (unint64_t)keyboardFlags
{
  return self->_keyboardFlags;
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (BOOL)isTabKey
{
  return self->_tabKey;
}

- (float)deltaX
{
  return self->_deltaX;
}

- (float)deltaY
{
  return self->_deltaY;
}

- (unsigned)touchCount
{
  return self->_touchCount;
}

- (NSArray)touchLocations
{
  return self->_touchLocations;
}

- (NSArray)touchIdentifiers
{
  return self->_touchIdentifiers;
}

- (NSArray)touchPhases
{
  return self->_touchPhases;
}

- (BOOL)isGesture
{
  return self->_isGesture;
}

- (float)gestureScale
{
  return self->_gestureScale;
}

- (float)gestureRotation
{
  return self->_gestureRotation;
}

- (int)type
{
  return self->_type;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)wasHandled
{
  return self->_wasHandled;
}

- (void)setWasHandled:(BOOL)a3
{
  self->_wasHandled = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_originalKeyEntry.m_ptr;
  self->_originalKeyEntry.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = 0;
  return self;
}

- (WebEvent)initWithKeyEntry:(id)a3
{
  WebEvent *v4;
  int v5;
  double v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *m_ptr;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WebEvent;
  v4 = -[WebEvent init](&v13, sel_init);
  if (!v4)
    return v4;
  if (objc_msgSend(a3, "state") == 2)
    v5 = 5;
  else
    v5 = 4;
  v4->_type = v5;
  objc_msgSend(a3, "timestamp");
  v4->_timestamp = v6;
  v4->_keyboardFlags = 0;
  v7 = objc_msgSend((id)objc_msgSend(a3, "key"), "keyCode");
  if (v7 <= 159)
  {
    if (v7 != 20 && v7 != 91 && v7 != 93)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((unint64_t)(v7 - 160) <= 5)
LABEL_7:
    v4->_keyboardFlags |= 0x20uLL;
LABEL_8:
  if (objc_msgSend(a3, "isKeyRepeating"))
    v4->_keyboardFlags |= 1uLL;
  v8 = (void *)objc_msgSend(a3, "key");
  v9 = objc_msgSend(v8, "modifierFlags");
  if ((*(_QWORD *)&v9 & 0x100000) != 0)
    v10 = 16842752;
  else
    v10 = 0;
  if ((*(_QWORD *)&v9 & 0x80000) != 0)
    v10 |= 0x480000u;
  if ((*(_QWORD *)&v9 & 0x40000) != 0)
    v10 |= 0x900000u;
  if ((*(_QWORD *)&v9 & 0x20000) != 0)
    v10 |= 0x220000u;
  v4->_modifierFlags = v10 | (4 * v9) & 0x40000;
  v4->_keyCode = objc_msgSend(v8, "keyCode");
  v4->_characters = (NSString *)(id)objc_msgSend(v8, "characters");
  v4->_charactersIgnoringModifiers = (NSString *)(id)objc_msgSend(v8, "charactersIgnoringModifiers");
  v4->_tabKey = 0;
  v4->_keyRepeating = objc_msgSend(a3, "isKeyRepeating");
  if (a3)
    CFRetain(a3);
  m_ptr = v4->_originalKeyEntry.m_ptr;
  v4->_originalKeyEntry.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
  return v4;
}

- (BEKeyEntry)originalKeyEntry
{
  return (BEKeyEntry *)self->_originalKeyEntry.m_ptr;
}

@end
