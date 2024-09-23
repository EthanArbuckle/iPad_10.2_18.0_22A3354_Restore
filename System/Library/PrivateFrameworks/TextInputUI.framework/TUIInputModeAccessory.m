@implementation TUIInputModeAccessory

- (TUIInputModeAccessory)initWithInputMode:(id)a3
{
  id v4;
  TUIInputModeAccessory *v5;
  TUIInputModeAccessory *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIInputModeAccessory;
  v5 = -[TUICursorAccessory init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TUIInputModeAccessory setInputMode:](v5, "setInputMode:", v4);

  return v6;
}

- (TUIInputModeAccessory)initWithCoder:(id)a3
{
  id v4;
  TUIInputModeAccessory *v5;
  uint64_t v6;
  NSString *inputMode;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIInputModeAccessory;
  v5 = -[TUICursorAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TUInputModeCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIInputModeAccessory;
  v4 = a3;
  -[TUICursorAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputMode, CFSTR("TUInputModeCodingKey"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  TUIInputModeAccessory *v4;
  TUIInputModeAccessory *v5;
  BOOL v6;
  objc_super v8;

  v4 = (TUIInputModeAccessory *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)TUIInputModeAccessory;
  if (-[TUICursorAccessory isEqual:](&v8, sel_isEqual_, v4))
    v6 = -[NSString isEqualToString:](self->_inputMode, "isEqualToString:", v5->_inputMode);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (id)additionalComponents
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIInputModeAccessory;
  -[TUICursorAccessory additionalComponents](&v6, sel_additionalComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inputMode)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputMode = %@"), self->_inputMode);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIInputModeAccessory;
  v3 = 257 * -[TUICursorAccessory hash](&v7, sel_hash);
  -[TUIInputModeAccessory inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  return v5;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
