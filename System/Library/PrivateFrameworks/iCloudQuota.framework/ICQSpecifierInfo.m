@implementation ICQSpecifierInfo

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ID: %@, Type: %@, title: %@, subTitle: %@, iconURL: %@, actionURL: %@, icqLink: %@, actions: %@"), self->_identifier, self->_type, self->_title, self->_subTitle, self->_iconURL, self->_actionURL, self->_icqLink, self->_actions);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQSpecifierInfo *v4;

  v4 = objc_alloc_init(ICQSpecifierInfo);
  -[ICQSpecifierInfo setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[ICQSpecifierInfo setType:](v4, "setType:", self->_type);
  -[ICQSpecifierInfo setTitle:](v4, "setTitle:", self->_title);
  -[ICQSpecifierInfo setSubTitle:](v4, "setSubTitle:", self->_subTitle);
  -[ICQSpecifierInfo setIconURL:](v4, "setIconURL:", self->_iconURL);
  -[ICQSpecifierInfo setActionURL:](v4, "setActionURL:", self->_actionURL);
  -[ICQSpecifierInfo setIcqLink:](v4, "setIcqLink:", self->_icqLink);
  -[ICQSpecifierInfo setActions:](v4, "setActions:", self->_actions);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subTitle, CFSTR("subTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("iconURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icqLink, CFSTR("icqLink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));

}

- (ICQSpecifierInfo)initWithCoder:(id)a3
{
  id v4;
  ICQSpecifierInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *type;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subTitle;
  uint64_t v14;
  ICQImageURL *iconURL;
  uint64_t v16;
  NSURL *actionURL;
  uint64_t v18;
  ICQLink *icqLink;
  uint64_t v20;
  NSArray *actions;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICQSpecifierInfo;
  v5 = -[ICQSpecifierInfo init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icqLink"));
    v18 = objc_claimAutoreleasedReturnValue();
    icqLink = v5->_icqLink;
    v5->_icqLink = (ICQLink *)v18;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("actions"));
    v20 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v20;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (ICQLink)icqLink
{
  return self->_icqLink;
}

- (void)setIcqLink:(id)a3
{
  objc_storeStrong((id *)&self->_icqLink, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icqLink, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
