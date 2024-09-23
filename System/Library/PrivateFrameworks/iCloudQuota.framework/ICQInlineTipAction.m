@implementation ICQInlineTipAction

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buttonTitle: %@, actionName: %@, actionURL: %@, link: %@"), self->_buttonTitle, self->_actionName, self->_actionURL, self->_link);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQInlineTipAction *v4;

  v4 = objc_alloc_init(ICQInlineTipAction);
  -[ICQInlineTipAction setButtonTitle:](v4, "setButtonTitle:", self->_buttonTitle);
  -[ICQInlineTipAction setActionName:](v4, "setActionName:", self->_actionName);
  -[ICQInlineTipAction setActionURL:](v4, "setActionURL:", self->_actionURL);
  -[ICQInlineTipAction setLink:](v4, "setLink:", self->_link);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *buttonTitle;
  id v5;

  buttonTitle = self->_buttonTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", buttonTitle, CFSTR("buttonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionName, CFSTR("actionName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_link, CFSTR("link"));

}

- (ICQInlineTipAction)initWithCoder:(id)a3
{
  id v4;
  ICQInlineTipAction *v5;
  uint64_t v6;
  NSString *buttonTitle;
  uint64_t v8;
  NSString *actionName;
  uint64_t v10;
  NSURL *actionURL;
  uint64_t v12;
  ICQLink *link;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQInlineTipAction;
  v5 = -[ICQInlineTipAction init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    buttonTitle = v5->_buttonTitle;
    v5->_buttonTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionName"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link"));
    v12 = objc_claimAutoreleasedReturnValue();
    link = v5->_link;
    v5->_link = (ICQLink *)v12;

  }
  return v5;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (ICQLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
