@implementation SXEmailAction

- (SXEmailAction)initWithRecipient:(id)a3 subject:(id)a4
{
  id v7;
  id v8;
  SXEmailAction *v9;
  SXEmailAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXEmailAction;
  v9 = -[SXEmailAction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subject, a4);
    objc_storeStrong((id *)&v10->_recipient, a3);
  }

  return v10;
}

- (NSString)type
{
  return (NSString *)CFSTR("email");
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (NSString)recipient
{
  return self->_recipient;
}

- (NSString)subject
{
  return self->_subject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->analytics, 0);
}

@end
