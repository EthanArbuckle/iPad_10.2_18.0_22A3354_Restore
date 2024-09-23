@implementation RKConversationTurn

- (RKConversationTurn)initWithString:(id)a3 senderID:(id)a4 timestamp:(id)a5
{
  id v9;
  id v10;
  id v11;
  RKConversationTurn *v12;
  RKConversationTurn *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RKConversationTurn;
  v12 = -[RKConversationTurn init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_text, a3);
    objc_storeStrong((id *)&v13->_senderId, a4);
    objc_storeStrong((id *)&v13->_timestamp, a5);
  }

  return v13;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)senderId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_senderId, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
