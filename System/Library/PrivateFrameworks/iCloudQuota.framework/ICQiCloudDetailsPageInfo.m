@implementation ICQiCloudDetailsPageInfo

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("actionType: %@, actionURL: %@"), self->_actionType, self->_actionURL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQiCloudDetailsPageInfo *v4;

  v4 = objc_alloc_init(ICQiCloudDetailsPageInfo);
  -[ICQiCloudDetailsPageInfo setActionType:](v4, "setActionType:", self->_actionType);
  -[ICQiCloudDetailsPageInfo setActionURL:](v4, "setActionURL:", self->_actionURL);
  return v4;
}

- (ICQLink)icqLink
{
  ICQLink *v3;
  void *v4;
  void *v5;
  ICQLink *v6;

  v3 = [ICQLink alloc];
  -[ICQiCloudDetailsPageInfo actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQiCloudDetailsPageInfo actionURL](self, "actionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICQLink initWithActionString:url:](v3, "initWithActionString:url:", v4, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *actionType;
  id v5;

  actionType = self->_actionType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", actionType, CFSTR("actionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"));

}

- (ICQiCloudDetailsPageInfo)initWithCoder:(id)a3
{
  id v4;
  ICQiCloudDetailsPageInfo *v5;
  uint64_t v6;
  NSString *actionType;
  uint64_t v8;
  NSURL *actionURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQiCloudDetailsPageInfo;
  v5 = -[ICQiCloudDetailsPageInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionType"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionType = v5->_actionType;
    v5->_actionType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v8;

  }
  return v5;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end
