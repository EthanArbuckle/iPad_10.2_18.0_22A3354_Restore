@implementation SRUIFConversationError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCode:userInfo:", a3, v6);

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCode:localizedFailureReason:", a3, v6);

  return v7;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:userInfo:", a3, 0);
}

- (SRUIFConversationError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  return -[SRUIFConversationError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.conversation.ErrorDomain"), a3, a4);
}

- (SRUIFConversationError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  SRUIFConversationError *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0FD8];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SRUIFConversationError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, v8);
  return v9;
}

- (SRUIFConversationError)initWithCode:(int64_t)a3
{
  return -[SRUIFConversationError initWithCode:userInfo:](self, "initWithCode:userInfo:", a3, 0);
}

@end
