@implementation UIKey

- (UIKey)initWithKeyboardEvent:(id)a3
{
  id v4;
  UIKey *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIKey;
  v5 = -[UIKey init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_unmodifiedInput");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E16EDF20;
    objc_storeStrong((id *)&v5->_unmodifiedInput, v8);

    objc_msgSend(v4, "_modifiedInput");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E16EDF20;
    objc_storeStrong((id *)&v5->_modifiedInput, v11);

    v5->_modifierFlags = objc_msgSend(v4, "_modifierFlags");
    v5->_keyCode = objc_msgSend(v4, "_keyCode");
  }

  return v5;
}

- (id)_initWithKey:(id)a3
{
  id v4;
  UIKey *v5;
  uint64_t v6;
  NSString *unmodifiedInput;
  uint64_t v8;
  NSString *modifiedInput;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKey;
  v5 = -[UIKey init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "unmodifiedInput");
    v6 = objc_claimAutoreleasedReturnValue();
    unmodifiedInput = v5->_unmodifiedInput;
    v5->_unmodifiedInput = (NSString *)v6;

    objc_msgSend(v4, "modifiedInput");
    v8 = objc_claimAutoreleasedReturnValue();
    modifiedInput = v5->_modifiedInput;
    v5->_modifiedInput = (NSString *)v8;

    v5->_modifierFlags = objc_msgSend(v4, "modifierFlags");
    v5->_keyCode = objc_msgSend(v4, "keyCode");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKey:", self);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *modifiedInput;
  id v5;

  modifiedInput = self->_modifiedInput;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modifiedInput, CFSTR("_modifiedInput"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unmodifiedInput, CFSTR("_unmodifiedInput"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_modifierFlags, CFSTR("_modifierFlags"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_keyCode, CFSTR("_keyCode"));

}

- (UIKey)initWithCoder:(id)a3
{
  id v4;
  UIKey *v5;
  uint64_t v6;
  NSString *modifiedInput;
  uint64_t v8;
  NSString *unmodifiedInput;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKey;
  v5 = -[UIKey init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_modifiedInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    modifiedInput = v5->_modifiedInput;
    v5->_modifiedInput = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_unmodifiedInput"));
    v8 = objc_claimAutoreleasedReturnValue();
    unmodifiedInput = v5->_unmodifiedInput;
    v5->_unmodifiedInput = (NSString *)v8;

    v5->_modifierFlags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_modifierFlags"));
    v5->_keyCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_keyCode"));
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_modifierFlags ^ self->_keyCode;
}

- (BOOL)isEqual:(id)a3
{
  UIKey *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (UIKey *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[UIKey hash](v4, "hash");
      v6 = v5 == -[UIKey hash](self, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)characters
{
  return self->_modifiedInput;
}

- (NSString)charactersIgnoringModifiers
{
  return self->_unmodifiedInput;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("characters");
  -[UIKey characters](self, "characters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("unmodified");
  -[UIKey charactersIgnoringModifiers](self, "charactersIgnoringModifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("modifierFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_modifierFlags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("keyCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_keyCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)modiferFlagsWithoutCapsLockOrNumberPad
{
  return -[UIKey modifierFlags](self, "modifierFlags") & 0xFFFFFFFFFFDEFFFFLL;
}

- (BOOL)modifiersEqual:(int64_t)a3
{
  return -[UIKey modiferFlagsWithoutCapsLockOrNumberPad](self, "modiferFlagsWithoutCapsLockOrNumberPad") == a3;
}

- (BOOL)equalsKeyCode:(int64_t)a3 modifiers:(int64_t)a4
{
  return -[UIKey keyCode](self, "keyCode") == a3 && -[UIKey modifiersEqual:](self, "modifiersEqual:", a4);
}

- (BOOL)unmodifiedKeyCodeEquals:(int64_t)a3
{
  return -[UIKey equalsKeyCode:modifiers:](self, "equalsKeyCode:modifiers:", a3, 0);
}

- (UIKeyModifierFlags)modifierFlags
{
  return self->_modifierFlags;
}

- (void)_setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (UIKeyboardHIDUsage)keyCode
{
  return self->_keyCode;
}

- (void)_setKeyCode:(int64_t)a3
{
  self->_keyCode = a3;
}

- (NSString)unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (void)_setUnmodifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_unmodifiedInput, a3);
}

- (NSString)modifiedInput
{
  return self->_modifiedInput;
}

- (void)_setModifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedInput, 0);
  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
}

@end
