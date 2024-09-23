@implementation TIKeyboardInteractionProtocolBase

- (TIKeyboardInteractionProtocolBase)initWithKeyboardState:(id)a3
{
  id v5;
  TIKeyboardInteractionProtocolBase *v6;
  TIKeyboardInteractionProtocolBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolBase;
  v6 = -[TIKeyboardInteractionProtocolBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyboardState, a3);

  return v7;
}

- (TIKeyboardInteractionProtocolBase)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolBase *v5;
  uint64_t v6;
  TIKeyboardState *keyboardState;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolBase;
  v5 = -[TIKeyboardInteractionProtocolBase init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardState, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
