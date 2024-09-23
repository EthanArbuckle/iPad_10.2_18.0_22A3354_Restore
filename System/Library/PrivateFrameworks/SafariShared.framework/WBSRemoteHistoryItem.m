@implementation WBSRemoteHistoryItem

- (WBSRemoteHistoryItem)init
{

  return 0;
}

- (WBSRemoteHistoryItem)initWithURL:(id)a3 title:(id)a4 lastVisitTime:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSRemoteHistoryItem *v12;
  WBSRemoteHistoryItem *v13;
  uint64_t v14;
  NSString *title;
  WBSRemoteHistoryItem *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSRemoteHistoryItem;
  v12 = -[WBSRemoteHistoryItem init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_lastVisitTime, a5);
    v16 = v13;
  }

  return v13;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; url = %@; title = %@; lastVisitTime = %@>"),
    v5,
    self,
    self->_url,
    self->_title,
    self->_lastVisitTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSRemoteHistoryItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WBSRemoteHistoryItem *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastVisitTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WBSRemoteHistoryItem initWithURL:title:lastVisitTime:](self, "initWithURL:title:lastVisitTime:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastVisitTime, CFSTR("lastVisitTime"));

}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastVisitTime
{
  return self->_lastVisitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVisitTime, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
