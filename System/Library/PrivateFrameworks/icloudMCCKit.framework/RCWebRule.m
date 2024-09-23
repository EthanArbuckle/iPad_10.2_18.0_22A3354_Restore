@implementation RCWebRule

- (RCWebRule)initWithSender:(id)a3 category:(id)a4 lastModified:(double)a5
{
  id v8;
  id v9;
  RCWebRule *v10;
  uint64_t v11;
  NSDictionary *sender;
  uint64_t v13;
  NSNumber *lastModifiedDate;
  NSString *category;
  void *v16;
  objc_super v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RCWebRule;
  v10 = -[RCWebRule init](&v18, sel_init);
  if (v10)
  {
    v19 = CFSTR("email");
    v20[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    sender = v10->_sender;
    v10->_sender = (NSDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v13 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v10->_lastModifiedDate;
    v10->_lastModifiedDate = (NSNumber *)v13;

    category = v10->_category;
    v10->_category = (NSString *)CFSTR("others");

    objc_msgSend(v9, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(&unk_251C8C6B8, "containsObject:", v16))
    {
      objc_storeStrong((id *)&v10->_category, v16);
    }
    else
    {

      v10 = 0;
    }

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *sender;
  id v5;

  sender = self->_sender;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sender, CFSTR("_sender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("_category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastModifiedDate, CFSTR("_lastModifiedDate"));

}

- (RCWebRule)initWithCoder:(id)a3
{
  id v4;
  RCWebRule *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *sender;
  uint64_t v11;
  NSString *category;
  uint64_t v13;
  NSNumber *lastModifiedDate;

  v4 = a3;
  v5 = -[RCWebRule init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_sender"));
    v9 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_category"));
    v11 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastModifiedDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSNumber *)v13;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSDictionary copy](self->_sender, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_category, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSNumber copy](self->_lastModifiedDate, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WebRule:{%@,%@}"), self->_sender, self->_category);
}

- (NSDictionary)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
