@implementation TIKeyboardInteractionProtocolEventLayoutDidChange

- (TIKeyboardInteractionProtocolEventLayoutDidChange)initWithLayout:(id)a3 keyboardState:(id)a4
{
  id v7;
  TIKeyboardInteractionProtocolEventLayoutDidChange *v8;
  TIKeyboardInteractionProtocolEventLayoutDidChange *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventLayoutDidChange;
  v8 = -[TIKeyboardInteractionProtocolBase initWithKeyboardState:](&v11, sel_initWithKeyboardState_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_keyLayout, a3);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventLayoutDidChange;
  v4 = a3;
  -[TIKeyboardInteractionProtocolBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyLayout, CFSTR("keyLayout"), v5.receiver, v5.super_class);

}

- (TIKeyboardInteractionProtocolEventLayoutDidChange)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventLayoutDidChange *v5;
  uint64_t v6;
  TIKeyboardLayout *keyLayout;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventLayoutDidChange;
  v5 = -[TIKeyboardInteractionProtocolBase initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyLayout"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v6;

  }
  return v5;
}

- (void)sendTo:(id)a3
{
  TIKeyboardLayout *keyLayout;
  id v5;
  id v6;

  keyLayout = self->_keyLayout;
  v5 = a3;
  -[TIKeyboardInteractionProtocolBase keyboardState](self, "keyboardState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutDidChange:keyboardState:", keyLayout, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<LayoutDidChange=%@>"), self->_keyLayout);
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLayout, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
