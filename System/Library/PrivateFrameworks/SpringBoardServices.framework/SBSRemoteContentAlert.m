@implementation SBSRemoteContentAlert

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteContentAlert)initWithCoder:(id)a3
{
  id v4;
  SBSRemoteContentAlert *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *message;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *actions;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSRemoteContentAlert;
  v5 = -[SBSRemoteContentAlert init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v8;

    v5->_preferredStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredStyle"));
    v10 = (void *)MEMORY[0x1E0C99DE8];
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("actions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSMutableArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;
  id v6;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredStyle, CFSTR("preferredStyle"));
  v6 = (id)-[NSMutableArray copy](self->_actions, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("actions"));

}

- (SBSRemoteContentAlert)initWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  id v8;
  id v9;
  SBSRemoteContentAlert *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *message;
  uint64_t v15;
  NSMutableArray *actions;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBSRemoteContentAlert;
  v10 = -[SBSRemoteContentAlert init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    message = v10->_message;
    v10->_message = (NSString *)v13;

    v10->_preferredStyle = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    actions = v10->_actions;
    v10->_actions = (NSMutableArray *)v15;

  }
  return v10;
}

- (void)addAction:(id)a3
{
  -[NSMutableArray addObject:](self->_actions, "addObject:", a3);
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (NSArray)actions
{
  return (NSArray *)self->_actions;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  char v12;
  unsigned __int8 v13;
  uint64_t v14;
  int64_t preferredStyle;
  void *v16;
  char v17;
  BOOL v18;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || self->_title)
    {
      objc_msgSend(v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", self->_title);

      v9 = v8 ^ 1;
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v5, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || self->_message)
    {
      objc_msgSend(v5, "message");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", self->_message);

      v13 = v12 ^ 1;
    }
    else
    {
      v13 = 0;
    }

    v14 = objc_msgSend(v5, "preferredStyle");
    preferredStyle = self->_preferredStyle;
    objc_msgSend(v5, "actions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", self->_actions);

    if (v14 == preferredStyle)
      v18 = v17;
    else
      v18 = 0;
    v19 = ((v9 | v13) & 1) == 0 && v18;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_message, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[NSMutableArray hash](self->_actions, "hash") ^ v6;

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
