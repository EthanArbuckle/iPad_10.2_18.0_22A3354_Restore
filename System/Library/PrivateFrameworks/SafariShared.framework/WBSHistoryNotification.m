@implementation WBSHistoryNotification

- (WBSHistoryNotification)init
{

  return 0;
}

- (WBSHistoryNotification)initWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  WBSHistoryNotification *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSDictionary *userInfo;
  WBSHistoryNotification *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryNotification;
  v8 = -[WBSHistoryNotification init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    userInfo = v8->_userInfo;
    v8->_userInfo = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@; userInfo = %@>"),
    v5,
    self,
    self->_name,
    self->_userInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryNotification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSHistoryNotification *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBSHistoryNotification initWithName:userInfo:](self, "initWithName:userInfo:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));

}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
