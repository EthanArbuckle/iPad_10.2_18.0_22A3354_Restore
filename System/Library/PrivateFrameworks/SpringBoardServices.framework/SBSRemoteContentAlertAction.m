@implementation SBSRemoteContentAlertAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteContentAlertAction)initWithCoder:(id)a3
{
  id v4;
  SBSRemoteContentAlertAction *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSRemoteContentAlertAction;
  v5 = -[SBSRemoteContentAlertAction init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_style, CFSTR("style"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));

}

- (SBSRemoteContentAlertAction)initWithTitle:(id)a3 style:(int64_t)a4
{
  id v6;
  SBSRemoteContentAlertAction *v7;
  uint64_t v8;
  NSString *title;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSRemoteContentAlertAction;
  v7 = -[SBSRemoteContentAlertAction init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v7->_style = a4;
    v7->_enabled = 1;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  int64_t style;
  int v11;
  char v12;
  BOOL v13;

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

    }
    else
    {
      v8 = 1;
    }

    v9 = objc_msgSend(v5, "style");
    style = self->_style;
    v11 = objc_msgSend(v5, "isEnabled");
    if (v9 == style)
      v12 = v8;
    else
      v12 = 0;
    if (self->_enabled == v11)
      v13 = v12;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_title, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_style);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
