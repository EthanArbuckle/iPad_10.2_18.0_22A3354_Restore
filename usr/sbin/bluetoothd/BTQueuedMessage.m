@implementation BTQueuedMessage

- (BTQueuedMessage)init
{
  return -[BTQueuedMessage initWithMsg:arguments:](self, "initWithMsg:arguments:", 0, 0);
}

- (BTQueuedMessage)initWithMsg:(unsigned __int16)a3 arguments:(id)a4
{
  id v7;
  BTQueuedMessage *v8;
  BTQueuedMessage *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BTQueuedMessage;
  v8 = -[BTQueuedMessage init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_msgId = a3;
    objc_storeStrong((id *)&v8->_arguments, a4);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_msgId, CFSTR("message"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_arguments, CFSTR("arguments"));

}

- (BTQueuedMessage)initWithCoder:(id)a3
{
  id v4;
  BTQueuedMessage *v5;
  uint64_t v6;
  NSDictionary *arguments;

  v4 = a3;
  v5 = -[BTQueuedMessage init](self, "init");
  if (v5)
  {
    v5->_msgId = (unsigned __int16)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("arguments")));
    arguments = v5->_arguments;
    v5->_arguments = (NSDictionary *)v6;

  }
  return v5;
}

- (unsigned)msgId
{
  return self->_msgId;
}

- (void)setMsgId:(unsigned __int16)a3
{
  self->_msgId = a3;
}

- (NSDictionary)arguments
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArguments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
}

@end
