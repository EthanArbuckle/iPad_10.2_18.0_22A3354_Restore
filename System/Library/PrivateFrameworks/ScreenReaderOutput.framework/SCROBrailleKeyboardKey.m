@implementation SCROBrailleKeyboardKey

- (id)description
{
  unsigned int modifiers;

  modifiers = self->_modifiers;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("display = %ld, keysting = \"%@\", shift = %d, command = %d, control = %d, option = %d, fn = %d, keycode = %d, virtualKeycode = %d"), self->super._displayToken, self->_keyString, (*MEMORY[0x24BE0FCB0] & modifiers) != 0, (*MEMORY[0x24BE0FC88] & modifiers) != 0, (*MEMORY[0x24BE0FC90] & modifiers) != 0, (*MEMORY[0x24BE0FCA0] & modifiers) != 0, (*MEMORY[0x24BE0FCA8] & modifiers) != 0, self->_keyCode, self->_virtualKeyCode);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROBrailleKeyboardKey)initWithCoder:(id)a3
{
  id v4;
  SCROBrailleKeyboardKey *v5;
  uint64_t v6;
  NSString *keyString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCROBrailleKeyboardKey;
  v5 = -[SCROBrailleKey initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyString"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyString = v5->_keyString;
    v5->_keyString = (NSString *)v6;

    v5->_modifiers = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_modifiers"));
    v5->_keyCode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_keyCode"));
    v5->_virtualKeyCode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_virtualKeyCode"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *keyString;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SCROBrailleKeyboardKey;
  -[SCROBrailleKey encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  keyString = self->_keyString;
  if (keyString)
    objc_msgSend(v4, "encodeObject:forKey:", keyString, CFSTR("_keyString"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_modifiers, CFSTR("_modifiers"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_keyCode, CFSTR("_keyCode"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_virtualKeyCode, CFSTR("_virtualKeyCode"));

}

- (NSString)keyString
{
  return self->_keyString;
}

- (void)setKeyString:(id)a3
{
  objc_storeStrong((id *)&self->_keyString, a3);
}

- (unsigned)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(unsigned int)a3
{
  self->_modifiers = a3;
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unsigned int)a3
{
  self->_keyCode = a3;
}

- (unsigned)virtualKeyCode
{
  return self->_virtualKeyCode;
}

- (void)setVirtualKeyCode:(unsigned int)a3
{
  self->_virtualKeyCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
