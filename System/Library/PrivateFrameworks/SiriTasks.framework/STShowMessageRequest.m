@implementation STShowMessageRequest

- (BOOL)_makeAppFrontmost
{
  return 0;
}

- (id)_initWithMessage:(id)a3 showAsDraft:(BOOL)a4
{
  id v7;
  STShowMessageRequest *v8;
  STShowMessageRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STShowMessageRequest;
  v8 = -[AFSiriRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v9->_showAsDraft = a4;
  }

  return v9;
}

- (id)message
{
  return self->_message;
}

- (BOOL)showAsDraft
{
  return self->_showAsDraft;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowMessageRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_message, CFSTR("_message"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_showAsDraft, CFSTR("_showAsDraft"));

}

- (STShowMessageRequest)initWithCoder:(id)a3
{
  id v4;
  STShowMessageRequest *v5;
  uint64_t v6;
  STSiriMessage *message;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowMessageRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_message"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (STSiriMessage *)v6;

    v5->_showAsDraft = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_showAsDraft"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
