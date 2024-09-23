@implementation TIKeyboardInteractionProtocolEventAddKeyInput

- (TIKeyboardInteractionProtocolEventAddKeyInput)initWithKeyInput:(id)a3 keyboardState:(id)a4
{
  id v7;
  TIKeyboardInteractionProtocolEventAddKeyInput *v8;
  TIKeyboardInteractionProtocolEventAddKeyInput *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventAddKeyInput;
  v8 = -[TIKeyboardInteractionProtocolBase initWithKeyboardState:](&v11, sel_initWithKeyboardState_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_keyboardInput, a3);

  return v9;
}

- (TIKeyboardInteractionProtocolEventAddKeyInput)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventAddKeyInput *v5;
  uint64_t v6;
  TIKeyboardInput *keyboardInput;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddKeyInput;
  v5 = -[TIKeyboardInteractionProtocolBase initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardInput = v5->_keyboardInput;
    v5->_keyboardInput = (TIKeyboardInput *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventAddKeyInput;
  v4 = a3;
  -[TIKeyboardInteractionProtocolBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardInput, CFSTR("keyboardInput"), v5.receiver, v5.super_class);

}

- (void)sendTo:(id)a3
{
  TIKeyboardInput *keyboardInput;
  id v5;
  id v6;

  keyboardInput = self->_keyboardInput;
  v5 = a3;
  -[TIKeyboardInteractionProtocolBase keyboardState](self, "keyboardState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addKeyInput:keyboardState:", keyboardInput, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AddKeyInput: %@>"), self->_keyboardInput);
}

- (TIKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardInput, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
