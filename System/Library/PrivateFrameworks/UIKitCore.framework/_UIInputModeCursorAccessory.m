@implementation _UIInputModeCursorAccessory

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *inputModeIdentifier;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIInputModeCursorAccessory;
  -[_UICursorAccessory encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  inputModeIdentifier = self->_inputModeIdentifier;
  if (inputModeIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", inputModeIdentifier, CFSTR("inputModeIdentifier"));

}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIInputModeCursorAccessory;
  v3 = -[_UICursorAccessory hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_inputModeIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_dictationLanguage, "hash");
}

- (_UIInputModeCursorAccessory)initWithCoder:(id)a3
{
  id v4;
  _UIInputModeCursorAccessory *v5;
  uint64_t v6;
  NSString *inputModeIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIInputModeCursorAccessory;
  v5 = -[_UICursorAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputModeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputModeIdentifier = v5->_inputModeIdentifier;
    v5->_inputModeIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)descriptionBuilder
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIInputModeCursorAccessory;
  -[_UICursorAccessory descriptionBuilder](&v5, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_inputModeIdentifier, CFSTR("inputModeIdentifier"));
  objc_msgSend(v3, "appendString:withName:", self->_dictationLanguage, CFSTR("dictationLanguage"));
  return v3;
}

- (id)identifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIInputModeCursorAccessory;
  -[_UICursorAccessory identifier](&v10, sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIInputModeCursorAccessory dictationLanguage](self, "dictationLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[_UIInputModeCursorAccessory inputModeIdentifier](self, "inputModeIdentifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)dictationLanguage
{
  return self->_dictationLanguage;
}

- (void)setDictationLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationLanguage, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
}

@end
