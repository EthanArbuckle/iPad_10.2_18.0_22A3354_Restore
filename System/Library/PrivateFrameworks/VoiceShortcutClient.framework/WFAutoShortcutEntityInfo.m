@implementation WFAutoShortcutEntityInfo

- (WFAutoShortcutEntityInfo)initWithName:(id)a3 subtitle:(id)a4 icon:(id)a5 badge:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  WFAutoShortcutEntityInfo *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *subtitle;
  WFAutoShortcutEntityInfo *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFAutoShortcutEntityInfo;
  v13 = -[WFAutoShortcutEntityInfo init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v16;

    objc_storeStrong((id *)&v13->_icon, a5);
    v13->_badge = a6;
    v18 = v13;
  }

  return v13;
}

- (WFAutoShortcutEntityInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFAutoShortcutEntityInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badge"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFAutoShortcutEntityInfo initWithName:subtitle:icon:badge:](self, "initWithName:subtitle:icon:badge:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFAutoShortcutEntityInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[WFAutoShortcutEntityInfo subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[WFAutoShortcutEntityInfo icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("icon"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFAutoShortcutEntityInfo badge](self, "badge"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("badge"));

}

- (NSString)name
{
  return self->_name;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (WFContextualActionIcon)icon
{
  return self->_icon;
}

- (unint64_t)badge
{
  return self->_badge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
