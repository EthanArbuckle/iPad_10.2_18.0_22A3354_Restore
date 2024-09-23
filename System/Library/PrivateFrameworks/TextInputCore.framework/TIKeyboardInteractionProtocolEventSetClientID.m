@implementation TIKeyboardInteractionProtocolEventSetClientID

- (TIKeyboardInteractionProtocolEventSetClientID)initWithClientID:(id)a3 keyboardState:(id)a4
{
  id v7;
  TIKeyboardInteractionProtocolEventSetClientID *v8;
  TIKeyboardInteractionProtocolEventSetClientID *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventSetClientID;
  v8 = -[TIKeyboardInteractionProtocolBase initWithKeyboardState:](&v11, sel_initWithKeyboardState_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_clientID, a3);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventSetClientID;
  v4 = a3;
  -[TIKeyboardInteractionProtocolBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientID, CFSTR("clientID"), v5.receiver, v5.super_class);

}

- (TIKeyboardInteractionProtocolEventSetClientID)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventSetClientID *v5;
  uint64_t v6;
  NSString *clientID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventSetClientID;
  v5 = -[TIKeyboardInteractionProtocolBase initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

  }
  return v5;
}

- (void)sendTo:(id)a3
{
  NSString *clientID;
  id v5;
  id v6;

  clientID = self->_clientID;
  v5 = a3;
  -[TIKeyboardInteractionProtocolBase keyboardState](self, "keyboardState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientID:keyboardState:", clientID, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SetClientID: %@>"), self->_clientID);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
