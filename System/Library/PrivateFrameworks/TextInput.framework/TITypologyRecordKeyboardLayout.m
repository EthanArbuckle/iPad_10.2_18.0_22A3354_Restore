@implementation TITypologyRecordKeyboardLayout

- (TITypologyRecordKeyboardLayout)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordKeyboardLayout *v5;
  uint64_t v6;
  TIKeyboardLayout *keyboardLayout;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordKeyboardLayout;
  v5 = -[TITypologyRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardLayout"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardLayout = v5->_keyboardLayout;
    v5->_keyboardLayout = (TIKeyboardLayout *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordKeyboardLayout;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardLayout, CFSTR("keyboardLayout"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (id)shortDescription
{
  return CFSTR("KEYBOARD LAYOUT DESCRIPTION");
}

- (TIKeyboardLayout)keyboardLayout
{
  return self->_keyboardLayout;
}

- (void)setKeyboardLayout:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLayout, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
