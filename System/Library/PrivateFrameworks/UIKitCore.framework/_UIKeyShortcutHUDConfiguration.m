@implementation _UIKeyShortcutHUDConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _UIKeyShortcutHUDModel *model;
  id v5;

  model = self->_model;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", model, CFSTR("model"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_searching, CFSTR("searching"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_presentedModifierFlag, CFSTR("presentedModifierFlag"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_initialHeldModifierFlags, CFSTR("initialHeldModifierFlag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientTraits, CFSTR("clientTraits"));

}

- (_UIKeyShortcutHUDConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDConfiguration *v5;
  void *v6;
  uint64_t v7;
  _UIKeyShortcutHUDModel *model;
  void *v9;
  uint64_t v10;
  _UIKeyShortcutHUDClientTraits *clientTraits;

  v4 = a3;
  v5 = -[_UIKeyShortcutHUDConfiguration init](self, "init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("model"));
    v7 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (_UIKeyShortcutHUDModel *)v7;

    v5->_searching = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("searching"));
    v5->_presentedModifierFlag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentedModifierFlag"));
    v5->_initialHeldModifierFlags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialHeldModifierFlag"));
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("clientTraits"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientTraits = v5->_clientTraits;
    v5->_clientTraits = (_UIKeyShortcutHUDClientTraits *)v10;

  }
  return v5;
}

- (_UIKeyShortcutHUDModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (void)setSearching:(BOOL)a3
{
  self->_searching = a3;
}

- (int64_t)presentedModifierFlag
{
  return self->_presentedModifierFlag;
}

- (void)setPresentedModifierFlag:(int64_t)a3
{
  self->_presentedModifierFlag = a3;
}

- (int64_t)initialHeldModifierFlags
{
  return self->_initialHeldModifierFlags;
}

- (void)setInitialHeldModifierFlags:(int64_t)a3
{
  self->_initialHeldModifierFlags = a3;
}

- (_UIKeyShortcutHUDClientTraits)clientTraits
{
  return self->_clientTraits;
}

- (void)setClientTraits:(id)a3
{
  objc_storeStrong((id *)&self->_clientTraits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTraits, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
