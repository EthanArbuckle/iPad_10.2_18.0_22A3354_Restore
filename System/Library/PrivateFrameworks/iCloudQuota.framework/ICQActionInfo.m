@implementation ICQActionInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQActionInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ICQLink *v23;
  void *v24;
  ICQActionInfo *v25;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[16];
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ICQActionInfo;
  v5 = -[ICQActionInfo init](&v32, sel_init);
  if (!v5)
    goto LABEL_27;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDefault"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[ICQActionInfo setIsDefault:](v5, "setIsDefault:", v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDestructive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[ICQActionInfo setIsDestructive:](v5, "setIsDestructive:", v9);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ICQActionInfo setTitle:](v5, "setTitle:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[ICQActionInfo setSubtitle:](v5, "setSubtitle:", v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[ICQActionInfo setActionURL:](v5, "setActionURL:", v13);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = -[ICQConfirmationInfo initFromDictionary:]([ICQConfirmationInfo alloc], "initFromDictionary:", v14);
    -[ICQActionInfo setConfirmation:](v5, "setConfirmation:", v15);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionParameters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = v11;
    if (v17)
    {
      v28 = v12;
      v29 = v10;
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("purchaseAttribution"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("route"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("identifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("purchaseAttribution"));
      if (v20)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("route"));
      if (v21)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("identifier"));

      v12 = v28;
      v10 = v29;
    }
    if (v12)
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("URL"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("openURL"));
    }
    v22 = v12;
    v23 = -[ICQLink initWithText:action:parameters:]([ICQLink alloc], "initWithText:action:parameters:", v10, _ICQActionForServerActionString(v16), v18);
    -[ICQActionInfo actionURL](v5, "actionURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLink setActionURL:](v23, "setActionURL:", v24);

    goto LABEL_26;
  }
  if (v14)
  {
    v30 = v11;
    v22 = v12;
    v23 = 0;
LABEL_26:
    -[ICQActionInfo setIcqLink:](v5, "setIcqLink:", v23);

LABEL_27:
    v25 = v5;
    goto LABEL_28;
  }
  _ICQGetLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v27, OS_LOG_TYPE_DEFAULT, "Parsing manage storage action, no action type and no confirmation found", buf, 2u);
  }

  v25 = 0;
LABEL_28:

  return v25;
}

- (id)initFromConfirmationAction:(id)a3
{
  id v4;
  ICQActionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQActionInfo;
  v5 = -[ICQActionInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQActionInfo setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQActionInfo setSubtitle:](v5, "setSubtitle:", v7);

    objc_msgSend(v4, "icqLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQActionInfo setIcqLink:](v5, "setIcqLink:", v8);

    objc_msgSend(v4, "actionURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQActionInfo setActionURL:](v5, "setActionURL:", v9);

    -[ICQActionInfo setIsDefault:](v5, "setIsDefault:", objc_msgSend(v4, "isDefault"));
    -[ICQActionInfo setIsDestructive:](v5, "setIsDestructive:", objc_msgSend(v4, "isDestructive"));
  }

  return v5;
}

- (id)description
{
  const __CFString *v2;

  v2 = CFSTR("YES");
  if (!self->_isDestructive)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("title: %@, subtitle: %@, actionURL: %@, icqLink: %@, isDefault: %hhd, isDestructive: %@, confirmation: %@"), *(_OWORD *)&self->_title, self->_actionURL, self->_icqLink, self->_isDefault, v2, self->_confirmation);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQActionInfo *v4;

  v4 = objc_alloc_init(ICQActionInfo);
  -[ICQActionInfo setTitle:](v4, "setTitle:", self->_title);
  -[ICQActionInfo setSubtitle:](v4, "setSubtitle:", self->_subtitle);
  -[ICQActionInfo setIcqLink:](v4, "setIcqLink:", self->_icqLink);
  -[ICQActionInfo setActionURL:](v4, "setActionURL:", self->_actionURL);
  -[ICQActionInfo setConfirmation:](v4, "setConfirmation:", self->_confirmation);
  -[ICQActionInfo setIsDefault:](v4, "setIsDefault:", self->_isDefault);
  -[ICQActionInfo setIsDestructive:](v4, "setIsDestructive:", self->_isDestructive);
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_confirmation, CFSTR("confirmation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefault, CFSTR("isDefault"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDestructive, CFSTR("isDestructive"));

}

- (ICQActionInfo)initWithCoder:(id)a3
{
  id v4;
  ICQActionInfo *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  ICQLink *icqLink;
  uint64_t v12;
  NSURL *actionURL;
  uint64_t v14;
  ICQConfirmationInfo *confirmation;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICQActionInfo;
  v5 = -[ICQActionInfo init](&v17, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmation"));
    v14 = objc_claimAutoreleasedReturnValue();
    confirmation = v5->_confirmation;
    v5->_confirmation = (ICQConfirmationInfo *)v14;

    v5->_isDefault = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefault"));
    v5->_isDestructive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDestructive"));
  }

  return v5;
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

- (ICQConfirmationInfo)confirmation
{
  return self->_confirmation;
}

- (void)setConfirmation:(id)a3
{
  objc_storeStrong((id *)&self->_confirmation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmation, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_icqLink, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
