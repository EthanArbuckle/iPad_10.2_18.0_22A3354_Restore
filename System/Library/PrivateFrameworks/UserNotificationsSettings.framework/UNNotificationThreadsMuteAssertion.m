@implementation UNNotificationThreadsMuteAssertion

- (UNNotificationThreadsMuteAssertion)initWithExpirationDateByThreadID:(id)a3
{
  id v4;
  UNNotificationThreadsMuteAssertion *v5;
  uint64_t v6;
  NSDictionary *expirationDateByThreadID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNNotificationThreadsMuteAssertion;
  v5 = -[UNNotificationMuteAssertion _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    expirationDateByThreadID = v5->_expirationDateByThreadID;
    v5->_expirationDateByThreadID = (NSDictionary *)v6;

  }
  return v5;
}

+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpirationDateByThreadID:", v4);

  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[NSDictionary objectForKey:](self->_expirationDateByThreadID, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v9;
      v10 = objc_msgSend(v8, "compare:", v9) == 1;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UNNotificationThreadsMuteAssertion)initWithCoder:(id)a3
{
  id v4;
  UNNotificationThreadsMuteAssertion *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *expirationDateByThreadID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNNotificationThreadsMuteAssertion;
  v5 = -[UNNotificationMuteAssertion initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("threadID"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDateByThreadID = v5->_expirationDateByThreadID;
    v5->_expirationDateByThreadID = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UNNotificationThreadsMuteAssertion;
  v4 = a3;
  -[UNNotificationMuteAssertion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDateByThreadID, CFSTR("threadID"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDateByThreadID, 0);
}

@end
