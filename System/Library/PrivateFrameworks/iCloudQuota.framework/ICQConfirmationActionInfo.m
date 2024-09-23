@implementation ICQConfirmationActionInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQConfirmationActionInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  ICQLink *v19;
  ICQConfirmationActionInfo *v20;
  uint8_t v22[16];
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICQConfirmationActionInfo;
  v5 = -[ICQConfirmationActionInfo init](&v23, sel_init);
  if (!v5)
    goto LABEL_23;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDefault"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[ICQConfirmationActionInfo setIsDefault:](v5, "setIsDefault:", v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDestructive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[ICQConfirmationActionInfo setIsDestructive:](v5, "setIsDestructive:", v9);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ICQConfirmationActionInfo setTitle:](v5, "setTitle:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ICQConfirmationActionInfo setSubtitle:](v5, "setSubtitle:", v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[ICQConfirmationActionInfo setActionURL:](v5, "setActionURL:", v13);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionParameters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("purchaseAttribution"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("route"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("purchaseAttribution"));
      if (v18)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("route"));

    }
    if (v12)
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("URL"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("openURL"));
    }
    v19 = -[ICQLink initWithText:action:parameters:]([ICQLink alloc], "initWithText:action:parameters:", v10, _ICQActionForServerActionString(v14), v16);

    -[ICQConfirmationActionInfo setIcqLink:](v5, "setIcqLink:", v19);
  }
  else
  {
    _ICQGetLogSystem();
    v19 = (ICQLink *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1CDEBD000, &v19->super, OS_LOG_TYPE_DEFAULT, "Parsing manage storage confirmation action, no action type found", v22, 2u);
    }
  }

  if (!v14)
    v20 = 0;
  else
LABEL_23:
    v20 = v5;

  return v20;
}

- (id)description
{
  const __CFString *v2;

  if (self->_isDestructive)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("title: %@, subtitle: %@, actionURL: %@, icqLink: %@, isDefault: %hhd, isDestructive: %@"), *(_OWORD *)&self->_title, self->_actionURL, self->_icqLink, self->_isDefault, v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQConfirmationActionInfo *v4;

  v4 = objc_alloc_init(ICQConfirmationActionInfo);
  -[ICQConfirmationActionInfo setTitle:](v4, "setTitle:", self->_title);
  -[ICQConfirmationActionInfo setSubtitle:](v4, "setSubtitle:", self->_subtitle);
  -[ICQConfirmationActionInfo setIcqLink:](v4, "setIcqLink:", self->_icqLink);
  -[ICQConfirmationActionInfo setActionURL:](v4, "setActionURL:", self->_actionURL);
  -[ICQConfirmationActionInfo setIsDefault:](v4, "setIsDefault:", self->_isDefault);
  -[ICQConfirmationActionInfo setIsDestructive:](v4, "setIsDestructive:", self->_isDestructive);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icqLink, CFSTR("icqLink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefault, CFSTR("isDefault"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDestructive, CFSTR("isDestructive"));

}

- (ICQConfirmationActionInfo)initWithCoder:(id)a3
{
  id v4;
  ICQConfirmationActionInfo *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  ICQLink *icqLink;
  uint64_t v12;
  NSURL *actionURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQConfirmationActionInfo;
  v5 = -[ICQConfirmationActionInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icqLink"));
    v10 = objc_claimAutoreleasedReturnValue();
    icqLink = v5->_icqLink;
    v5->_icqLink = (ICQLink *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v12;

    v5->_isDefault = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefault"));
    v5->_isDestructive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDestructive"));
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICQLink)icqLink
{
  return self->_icqLink;
}

- (void)setIcqLink:(id)a3
{
  objc_storeStrong((id *)&self->_icqLink, a3);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_icqLink, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
