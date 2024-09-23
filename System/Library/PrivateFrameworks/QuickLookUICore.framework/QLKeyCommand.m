@implementation QLKeyCommand

+ (id)keyCommandWithKeyCommand:(id)a3 identifier:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setKeyCommand:", v5);

  objc_msgSend(v6, "setKeyCommandIdentifier:", a4);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLKeyCommand)initWithCoder:(id)a3
{
  id v4;
  QLKeyCommand *v5;
  uint64_t v6;
  UIKeyCommand *keyCommand;

  v4 = a3;
  v5 = -[QLKeyCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyCommand"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyCommand = v5->_keyCommand;
    v5->_keyCommand = (UIKeyCommand *)v6;

    v5->_keyCommandIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyCommandIdentifier"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIKeyCommand *keyCommand;
  id v5;

  keyCommand = self->_keyCommand;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyCommand, CFSTR("keyCommand"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_keyCommandIdentifier, CFSTR("keyCommandIdentifier"));

}

- (UIKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (void)setKeyCommand:(id)a3
{
  objc_storeStrong((id *)&self->_keyCommand, a3);
}

- (unint64_t)keyCommandIdentifier
{
  return self->_keyCommandIdentifier;
}

- (void)setKeyCommandIdentifier:(unint64_t)a3
{
  self->_keyCommandIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommand, 0);
}

@end
