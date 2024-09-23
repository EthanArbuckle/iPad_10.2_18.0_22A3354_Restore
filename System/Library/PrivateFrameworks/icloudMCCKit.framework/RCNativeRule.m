@implementation RCNativeRule

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *messageRef;
  id v5;

  messageRef = self->_messageRef;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageRef, CFSTR("_messageRef"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("_category"));

}

- (RCNativeRule)initWithCoder:(id)a3
{
  id v4;
  RCNativeRule *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *messageRef;
  uint64_t v11;
  NSString *category;

  v4 = a3;
  v5 = -[RCNativeRule init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_messageRef"));
    v9 = objc_claimAutoreleasedReturnValue();
    messageRef = v5->_messageRef;
    v5->_messageRef = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_category"));
    v11 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v11;

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

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSDictionary copy](self->_messageRef, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_category, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)messageRef
{
  return self->_messageRef;
}

- (void)setMessageRef:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_messageRef, 0);
}

@end
