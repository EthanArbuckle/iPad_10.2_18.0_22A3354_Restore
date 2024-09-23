@implementation UNNotificationSourceMuteAssertion

- (UNNotificationSourceMuteAssertion)initWithExpirationDate:(id)a3
{
  id v5;
  id *v6;
  UNNotificationSourceMuteAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNNotificationSourceMuteAssertion;
  v6 = -[UNNotificationMuteAssertion _init](&v9, sel__init);
  v7 = (UNNotificationSourceMuteAssertion *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

+ (id)sourceMuteAssertionUntilDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpirationDate:", v4);

  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = -[NSDate compare:](self->_expirationDate, "compare:", v7) == NSOrderedDescending;

  return v9;
}

- (UNNotificationSourceMuteAssertion)initWithCoder:(id)a3
{
  id v4;
  UNNotificationSourceMuteAssertion *v5;
  uint64_t v6;
  NSDate *expirationDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNNotificationSourceMuteAssertion;
  v5 = -[UNNotificationMuteAssertion initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UNNotificationSourceMuteAssertion;
  v4 = a3;
  -[UNNotificationMuteAssertion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
