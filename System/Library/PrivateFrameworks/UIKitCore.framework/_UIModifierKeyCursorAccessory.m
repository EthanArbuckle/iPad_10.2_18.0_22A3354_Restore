@implementation _UIModifierKeyCursorAccessory

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIModifierKeyCursorAccessory;
  v4 = a3;
  -[_UICursorAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_modifierType, CFSTR("modifierType"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIModifierKeyCursorAccessory;
  return self->_modifierType ^ -[_UICursorAccessory hash](&v3, sel_hash);
}

- (_UIModifierKeyCursorAccessory)initWithCoder:(id)a3
{
  id v4;
  _UIModifierKeyCursorAccessory *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIModifierKeyCursorAccessory;
  v5 = -[_UICursorAccessory initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_modifierType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modifierType"));

  return v5;
}

- (id)descriptionBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIModifierKeyCursorAccessory;
  -[_UICursorAccessory descriptionBuilder](&v6, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", LODWORD(self->_modifierType), CFSTR("modifierType"));
  return v3;
}

- (id)identifier
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIModifierKeyCursorAccessory;
  -[_UICursorAccessory identifier](&v5, sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mod:%ld"), self->_modifierType);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICursorAccessory setIdentifier:](self, "setIdentifier:", v3);
  }
  return v3;
}

- (int64_t)modifierType
{
  return self->_modifierType;
}

- (void)setModifierType:(int64_t)a3
{
  self->_modifierType = a3;
}

@end
