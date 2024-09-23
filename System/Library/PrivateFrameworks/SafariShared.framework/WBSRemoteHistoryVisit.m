@implementation WBSRemoteHistoryVisit

- (WBSRemoteHistoryVisit)init
{

  return 0;
}

- (WBSRemoteHistoryVisit)initWithURL:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  WBSRemoteHistoryVisit *v9;
  WBSRemoteHistoryVisit *v10;
  WBSRemoteHistoryVisit *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSRemoteHistoryVisit;
  v9 = -[WBSRemoteHistoryVisit init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_date, a4);
    v11 = v10;
  }

  return v10;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; url = %@; date = %@>"), v5, self, self->_url, self->_date);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSRemoteHistoryVisit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSRemoteHistoryVisit *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBSRemoteHistoryVisit initWithURL:date:](self, "initWithURL:date:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));

}

- (NSURL)url
{
  return self->_url;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
