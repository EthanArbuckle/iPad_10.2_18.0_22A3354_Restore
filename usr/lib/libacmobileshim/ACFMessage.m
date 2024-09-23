@implementation ACFMessage

+ (id)message
{
  return (id)objc_msgSend(a1, "messageWithInfo:", 0);
}

+ (id)messageWithInfo:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:", a3);
}

- (ACFMessage)initWithInfo:(id)a3
{
  ACFMessage *v4;
  ACFMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACFMessage;
  v4 = -[ACFMessage init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ACFMessage setInfo:](v4, "setInfo:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACFMessage;
  -[ACFMessage dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "messageWithInfo:", (id)objc_msgSend(-[ACFMessage info](self, "info"), "copyWithZone:", a3));
}

- (void)encodeWithCoder:(id)a3
{
  if (objc_msgSend(a3, "allowsKeyedCoding"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_mutableInfo, CFSTR("ACFMessageInfo"));
}

- (ACFMessage)initWithCoder:(id)a3
{
  ACFMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACFMessage;
  v4 = -[ACFMessage init](&v6, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      v4->_mutableInfo = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("ACFMessageInfo")), "mutableCopy");
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)info
{
  return self->_mutableInfo;
}

- (void)setInfo:(id)a3
{
  NSMutableDictionary *mutableInfo;

  mutableInfo = self->_mutableInfo;
  if (mutableInfo != a3)
  {

    self->_mutableInfo = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  }
}

- (id)mutableInfo
{
  id result;

  result = self->_mutableInfo;
  if (!result)
  {
    result = (id)objc_opt_new();
    self->_mutableInfo = (NSMutableDictionary *)result;
  }
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    if (a3)
      objc_msgSend(-[ACFMessage mutableInfo](self, "mutableInfo"), "setObject:forKey:", a3, a4);
    else
      -[ACFMessage removeObjectForKey:](self, "removeObjectForKey:", a4);
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"-[ACFMessage setObject:forKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFMessage.m", 130, 0, "Attempt to add object with nil key!");
  }
}

- (void)removeObjectForKey:(id)a3
{
  objc_msgSend(-[ACFMessage mutableInfo](self, "mutableInfo"), "removeObjectForKey:", a3);
}

- (id)objectForKey:(id)a3
{
  return (id)objc_msgSend(-[ACFMessage info](self, "info"), "objectForKey:", a3);
}

+ (id)messageWithIdentifier:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "message");
  objc_msgSend(v4, "setIdentifier:", a3);
  return v4;
}

- (id)identifier
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACFMessageIdentifier"));
}

- (void)setIdentifier:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACFMessageIdentifier"));
}

- (id)error
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACFMessageError"));
}

- (void)setError:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACFMessageError"));
}

- (void)clearError
{
  -[ACFMessage removeObjectForKey:](self, "removeObjectForKey:", CFSTR("ACFMessageError"));
}

- (int64_t)errorCode
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACFMessageError")), "code");
}

- (id)errorMessage
{
  id v2;

  v2 = -[ACFMessage error](self, "error");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@  %@"), objc_msgSend(v2, "localizedDescription"), objc_msgSend(v2, "localizedRecoverySuggestion"));
}

- (int)senderProcessID
{
  return objc_msgSend(-[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACFMessageSenderPID")), "intValue");
}

- (id)senderProcessName
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACFMessageSenderProcessName"));
}

- (id)senderPortName
{
  return -[ACFMessage objectForKey:](self, "objectForKey:", CFSTR("ACFMessageSenderPortName"));
}

- (void)setSenderProcessID:(int)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("ACFMessageSenderPID"));
}

- (void)setSenderProcessName:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACFMessageSenderProcessName"));
}

- (void)setSenderPortName:(id)a3
{
  -[ACFMessage setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ACFMessageSenderPortName"));
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p (identifier = %@; error = %@; infoKeys = %@)>"),
                       NSStringFromClass(v4),
                       self,
                       -[ACFMessage identifier](self, "identifier"),
                       -[ACFMessage error](self, "error"),
                       objc_msgSend(-[ACFMessage info](self, "info"), "allKeys"));
}

@end
