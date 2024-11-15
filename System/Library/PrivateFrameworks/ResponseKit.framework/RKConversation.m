@implementation RKConversation

- (RKConversation)initWithString:(unint64_t)a3 messages:(id)a4
{
  id v7;
  RKConversation *v8;
  RKConversation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RKConversation;
  v8 = -[RKConversation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_messages, a4);
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)messages
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
