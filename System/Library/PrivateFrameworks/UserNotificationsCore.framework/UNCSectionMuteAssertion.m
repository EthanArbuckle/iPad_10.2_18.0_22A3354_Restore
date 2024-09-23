@implementation UNCSectionMuteAssertion

+ (id)sectionMuteAssertionUntilDate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[UNCSectionMuteAssertion _initWithExpirationDate:]([UNCSectionMuteAssertion alloc], "_initWithExpirationDate:", v3);

  return v4;
}

- (id)_initWithExpirationDate:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCSectionMuteAssertion;
  v5 = -[UNCMuteAssertion _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "now", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NSDate compare:](self->_expirationDate, "compare:", v4) == NSOrderedDescending;

  return (char)self;
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4
{
  _BOOL4 v7;
  NSDate *expirationDate;

  v7 = -[UNCSectionMuteAssertion isActiveForThreadIdentifier:](self, "isActiveForThreadIdentifier:", 0);
  expirationDate = 0;
  if (v7)
    expirationDate = self->_expirationDate;
  *a3 = objc_retainAutorelease(expirationDate);
  *a4 = 0;
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_expirationDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (v4 = v3) != 0)
  {
    v5 = v4;
    v6 = BSEqualObjects();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; expirationDate: %@>"),
               objc_opt_class(),
               self,
               self->_expirationDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UNCSectionMuteAssertion;
  v4 = a3;
  -[UNCMuteAssertion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"), v5.receiver, v5.super_class);

}

- (UNCSectionMuteAssertion)initWithCoder:(id)a3
{
  id v4;
  UNCSectionMuteAssertion *v5;
  uint64_t v6;
  NSDate *expirationDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCSectionMuteAssertion;
  v5 = -[UNCMuteAssertion initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

  }
  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
