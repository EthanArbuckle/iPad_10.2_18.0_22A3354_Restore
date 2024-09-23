@implementation BADeveloperDebugClientMessage

- (BADeveloperDebugClientMessage)initWithCoder:(id)a3
{
  id v4;
  BADeveloperDebugClientMessage *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BADeveloperDebugClientMessage;
  v5 = -[BADeveloperDebugMessage initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_messageOperation = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BAClientMessageOperation"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugClientMessage;
  v4 = a3;
  -[BADeveloperDebugMessage encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[BADeveloperDebugClientMessage messageOperation](self, "messageOperation", v5.receiver, v5.super_class), CFSTR("BAClientMessageOperation"));

}

- (BADeveloperDebugClientMessage)initWithMessageOperation:(int64_t)a3
{
  BADeveloperDebugClientMessage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BADeveloperDebugClientMessage;
  result = -[BADeveloperDebugMessage init](&v5, "init");
  if (result)
    result->_messageOperation = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)classForMessageOperation:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)(a3 - 1) > 3)
    return (Class)0;
  v3 = objc_opt_class(*off_100059860[a3 - 1], a2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v3);
}

- (int64_t)messageOperation
{
  return self->_messageOperation;
}

- (void)setMessageOperation:(int64_t)a3
{
  self->_messageOperation = a3;
}

@end
