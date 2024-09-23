@implementation SXPresentableMessage

- (SXPresentableMessage)initWithRecipient:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  SXPresentableMessage *v8;
  uint64_t v9;
  NSString *recipient;
  uint64_t v11;
  NSString *message;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXPresentableMessage;
  v8 = -[SXPresentableMessage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    recipient = v8->_recipient;
    v8->_recipient = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    message = v8->_message;
    v8->_message = (NSString *)v11;

  }
  return v8;
}

- (NSString)recipient
{
  return self->_recipient;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
