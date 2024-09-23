@implementation _UIKeyShortcutHUDClientTraits

+ (id)traitsWithReferenceTraitEnvironment:(id)a3 referenceKeyboardEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t SenderID;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutDirection:", objc_msgSend(v8, "layoutDirection"));

  objc_msgSend(v6, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
  objc_msgSend(v7, "setHasArabicHardwareKeyboard:", 0);
  objc_msgSend(v7, "setGlobeKeyLabelHasGlobeSymbol:", 1);
  if (v5)
  {
    if (objc_msgSend(v5, "_hidEvent"))
    {
      objc_msgSend(v5, "_hidEvent");
      SenderID = IOHIDEventGetSenderID();
    }
    else
    {
      SenderID = 0;
    }
    objc_msgSend((id)UIApp, "getKeyboardDevicePropertiesForSenderID:shouldUpdate:", SenderID, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "language");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHasArabicHardwareKeyboard:", objc_msgSend(v13, "isEqualToString:", CFSTR("Arabic")));

      objc_msgSend(v7, "setGlobeKeyLabelHasGlobeSymbol:", objc_msgSend(v12, "globeKeyLabelHasGlobeSymbol"));
    }

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t layoutDirection;
  id v5;

  layoutDirection = self->_layoutDirection;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", layoutDirection, CFSTR("layoutDirection"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userInterfaceStyle, CFSTR("userInterfaceStyle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasArabicHardwareKeyboard, CFSTR("hasArabicHardwareKeyboard"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_globeKeyLabelHasGlobeSymbol, CFSTR("globeKeyLabelHasGlobeSymbol"));

}

- (_UIKeyShortcutHUDClientTraits)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDClientTraits *v5;

  v4 = a3;
  v5 = -[_UIKeyShortcutHUDClientTraits init](self, "init");
  if (v5)
  {
    v5->_layoutDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutDirection"));
    v5->_userInterfaceStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userInterfaceStyle"));
    v5->_hasArabicHardwareKeyboard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasArabicHardwareKeyboard"));
    v5->_globeKeyLabelHasGlobeSymbol = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("globeKeyLabelHasGlobeSymbol"));
  }

  return v5;
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_systemApp = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (BOOL)hasArabicHardwareKeyboard
{
  return self->_hasArabicHardwareKeyboard;
}

- (void)setHasArabicHardwareKeyboard:(BOOL)a3
{
  self->_hasArabicHardwareKeyboard = a3;
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  return self->_globeKeyLabelHasGlobeSymbol;
}

- (void)setGlobeKeyLabelHasGlobeSymbol:(BOOL)a3
{
  self->_globeKeyLabelHasGlobeSymbol = a3;
}

@end
