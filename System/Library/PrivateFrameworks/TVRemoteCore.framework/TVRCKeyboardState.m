@implementation TVRCKeyboardState

+ (id)keyboardStateFromDevice:(id)a3
{
  id v3;
  TVRCKeyboardState *v4;

  v3 = a3;
  v4 = -[TVRCKeyboardState initWithDevice:]([TVRCKeyboardState alloc], "initWithDevice:", v3);

  return v4;
}

- (TVRCKeyboardState)initWithDevice:(id)a3
{
  id v4;
  TVRCKeyboardState *v5;
  void *v6;
  uint64_t v7;
  NSString *text;
  uint64_t v9;
  TVRCKeyboardAttributes *attributes;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TVRCKeyboardState;
  v5 = -[TVRCKeyboardState init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "keyboardController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEditing = objc_msgSend(v6, "isEditing");
    objc_msgSend(v6, "text");
    v7 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v7;

    objc_msgSend(v6, "attributes");
    v9 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (TVRCKeyboardAttributes *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCKeyboardState)initWithCoder:(id)a3
{
  id v4;
  TVRCKeyboardState *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  TVRCKeyboardAttributes *attributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCKeyboardState;
  v5 = -[TVRCKeyboardState init](&v11, sel_init);
  if (v5)
  {
    v5->_isEditing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEditing"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributes"));
    v8 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (TVRCKeyboardAttributes *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isEditing;
  id v5;

  isEditing = self->_isEditing;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isEditing, CFSTR("isEditing"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("attributes"));

}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; isEditing = %d"), self->_isEditing);
  objc_msgSend(v3, "appendFormat:", CFSTR("; text = %@"), self->_text);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (TVRCKeyboardAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
