@implementation NFRemoteAdminStateRetryInterval

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminStateRetryInterval)initWithCoder:(id)a3
{
  id v4;
  NFRemoteAdminStateRetryInterval *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSDate *time;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NFRemoteAdminStateRetryInterval;
  v5 = -[NFRemoteAdminStateRetryInterval init](&v12, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("delayValueIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_delayValueIndex = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("time"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    time = v5->_time;
    v5->_time = (NSDate *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t delayValueIndex;
  void *v5;
  id v6;

  delayValueIndex = self->_delayValueIndex;
  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", delayValueIndex));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("delayValueIndex"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_time, CFSTR("time"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
}

@end
