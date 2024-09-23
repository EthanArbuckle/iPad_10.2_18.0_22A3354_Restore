@implementation BAAppStoreProgressInfoDescriptor

- (BAAppStoreProgressInfoDescriptor)initWithCoder:(id)a3
{
  id v4;
  BAAppStoreProgressInfoDescriptor *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BAAppStoreProgressInfoDescriptor;
  v5 = -[BAAppStoreProgressInfoDescriptor init](&v7, "init");
  if (v5)
  {
    v5->_progressState = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_progressState"));
    v5->_countOfBytesReceived = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_countOfBytesReceived"));
    v5->_countOfBytesExpectedToReceive = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_countOfBytesExpectedToReceive"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BAAppStoreProgressInfoDescriptor progressState](self, "progressState"), CFSTR("_progressState"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[BAAppStoreProgressInfoDescriptor countOfBytesReceived](self, "countOfBytesReceived"), CFSTR("_countOfBytesReceived"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive"), CFSTR("_countOfBytesExpectedToReceive"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  BAAppStoreProgressInfoDescriptor *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v5 = (BAAppStoreProgressInfoDescriptor *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(BAAppStoreProgressInfoDescriptor, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
      && (v7 = -[BAAppStoreProgressInfoDescriptor progressState](v5, "progressState"),
          v7 == (id)-[BAAppStoreProgressInfoDescriptor progressState](self, "progressState"))
      && (v8 = -[BAAppStoreProgressInfoDescriptor countOfBytesReceived](v5, "countOfBytesReceived"),
          v8 == (id)-[BAAppStoreProgressInfoDescriptor countOfBytesReceived](self, "countOfBytesReceived")))
    {
      v9 = -[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](v5, "countOfBytesExpectedToReceive");
      v10 = v9 == (id)-[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive");
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;

  v3 = -[BAAppStoreProgressInfoDescriptor progressState](self, "progressState");
  v4 = -[BAAppStoreProgressInfoDescriptor countOfBytesReceived](self, "countOfBytesReceived");
  return v3
       + 16
       * (-[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") + v4);
}

- (int64_t)progressState
{
  return self->_progressState;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

@end
