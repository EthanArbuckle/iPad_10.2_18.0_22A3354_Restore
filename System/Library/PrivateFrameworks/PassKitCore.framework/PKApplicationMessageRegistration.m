@implementation PKApplicationMessageRegistration

+ (id)_createLocalWithIdentifier:(void *)a3 createdDate:(void *)a4 priority:(char)a5 badge:
{
  id v8;
  id v9;
  _QWORD *v10;
  id *v11;

  v8 = a3;
  v9 = a2;
  objc_opt_self();
  v10 = -[PKApplicationMessageKey _initWithSource:identifier:]([PKApplicationMessageKey alloc], 0, v9);

  v11 = -[PKApplicationMessageRegistration _initWithKey:createdDate:priority:badge:]((id *)[PKApplicationMessageRegistration alloc], v10, v8, a4, a5);
  return v11;
}

- (id)_initWithKey:(void *)a3 createdDate:(void *)a4 priority:(char)a5 badge:
{
  id v10;
  id v11;
  void *v12;
  id *v13;
  id *v14;
  id *v15;
  objc_super v17;

  v10 = a2;
  v11 = a3;
  v12 = v11;
  v13 = 0;
  if (a1 && v10 && v11)
  {
    v17.receiver = a1;
    v17.super_class = (Class)PKApplicationMessageRegistration;
    v14 = (id *)objc_msgSendSuper2(&v17, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 2, a2);
      objc_storeStrong(v15 + 3, a3);
      v15[4] = a4;
      *((_BYTE *)v15 + 8) = a5;
    }
    a1 = v15;
    v13 = a1;
  }

  return v13;
}

+ (id)createWithKey:(id)a3 createdDate:(id)a4 priority:(unint64_t)a5 badge:(BOOL)a6
{
  id v9;
  id v10;
  id *v11;

  v9 = a4;
  v10 = a3;
  v11 = -[PKApplicationMessageRegistration _initWithKey:createdDate:priority:badge:]((id *)[PKApplicationMessageRegistration alloc], v10, v9, (void *)a5, a6);

  return v11;
}

- (PKApplicationMessageRegistration)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageRegistration)initWithCoder:(id)a3
{
  id v4;
  PKApplicationMessageRegistration *v5;
  uint64_t v6;
  PKApplicationMessageKey *key;
  uint64_t v8;
  NSDate *createdDate;
  void *v10;
  PKApplicationMessageRegistration *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplicationMessageRegistration;
  v5 = -[PKApplicationMessageRegistration init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (PKApplicationMessageKey *)v6;

    if (!v5->_key)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKApplicationMessageRegistration"), 0, 0);
      objc_msgSend(v4, "failWithError:", v12);

      v11 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priority"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_priority = objc_msgSend(v10, "unsignedLongLongValue");

    v5->_badge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("badge"));
  }
  v11 = v5;
LABEL_6:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  PKApplicationMessageKey *key;
  void *v5;
  id v6;

  key = self->_key;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_createdDate, CFSTR("createdDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_priority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("priority"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_badge, CFSTR("badge"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  PKApplicationMessageKey *key;
  PKApplicationMessageKey *v7;
  NSDate *createdDate;
  NSDate *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    if (!self)
    {
LABEL_15:

      goto LABEL_16;
    }
    key = self->_key;
    v7 = (PKApplicationMessageKey *)*((_QWORD *)v5 + 2);
    if (key && v7)
    {
      if (!-[PKApplicationMessageKey isEqual:](key, "isEqual:"))
        goto LABEL_14;
    }
    else if (key != v7)
    {
LABEL_14:
      LOBYTE(self) = 0;
      goto LABEL_15;
    }
    if (self->_priority == *((_QWORD *)v5 + 4) && self->_badge == v5[8])
    {
      createdDate = self->_createdDate;
      v9 = (NSDate *)*((_QWORD *)v5 + 3);
      if (createdDate && v9)
        LOBYTE(self) = -[NSDate isEqual:](createdDate, "isEqual:");
      else
        LOBYTE(self) = createdDate == v9;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  LOBYTE(self) = 0;
LABEL_16:

  return (char)self;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v5;

  v3 = -[PKApplicationMessageKey hash](self->_key, "hash");
  LOBYTE(v5) = self->_badge;
  -[NSDate hash](self->_createdDate, "hash", v3, self->_priority, v5);
  return SipHash();
}

- (PKApplicationMessageKey)key
{
  return self->_key;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (BOOL)badge
{
  return self->_badge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
