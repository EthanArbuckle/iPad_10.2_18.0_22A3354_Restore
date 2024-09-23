@implementation ICQInAppAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performAction
{
  -[ICQInAppAction performActionWithContext:](self, "performActionWithContext:", MEMORY[0x24BDBD1B8]);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICQInAppAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[ICQInAppAction type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ICQInAppAction icqActionType](self, "icqActionType"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("icqActionType"));

}

- (ICQInAppAction)initWithCoder:(id)a3
{
  id v4;
  ICQInAppAction *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSString *title;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQInAppAction;
  v5 = -[ICQInAppAction init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icqActionType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_icqActionType = (int)objc_msgSend(v10, "intValue");

  }
  return v5;
}

- (ICQInAppAction)initWithTitle:(id)a3 type:(id)a4 icqActionType:(int64_t)a5
{
  id v9;
  id v10;
  ICQInAppAction *v11;
  ICQInAppAction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQInAppAction;
  v11 = -[ICQInAppAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a4);
    objc_storeStrong((id *)&v12->_title, a3);
    v12->_icqActionType = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *title;
  void *v7;
  NSString *type;
  void *v9;
  int64_t icqActionType;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    title = self->_title;
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](title, "isEqualToString:", v7))
    {
      type = self->_type;
      objc_msgSend(v5, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](type, "isEqualToString:", v9))
      {
        icqActionType = self->_icqActionType;
        v11 = icqActionType == objc_msgSend(v5, "icqActionType");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ICQInAppAction title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppAction type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("actionTitle: %@, actionType: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)type
{
  return self->_type;
}

- (int64_t)icqActionType
{
  return self->_icqActionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
