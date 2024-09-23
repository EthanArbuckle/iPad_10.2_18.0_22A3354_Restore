@implementation WBSHistoryServiceItem

- (WBSHistoryServiceItem)initWithItem:(id)a3
{
  id v4;
  WBSHistoryServiceItem *v5;
  void *v6;
  uint64_t v7;
  NSString *url;
  WBSHistoryServiceItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistoryServiceItem;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v11, sel_initWithDatabaseID_, objc_msgSend(v4, "databaseID"));
  if (v5)
  {
    objc_msgSend(v4, "urlString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    url = v5->_url;
    v5->_url = (NSString *)v7;

    v5->_statusCode = objc_msgSend(v4, "statusCode");
    v9 = v5;
  }

  return v5;
}

- (WBSHistoryServiceItem)initWithSQLRow:(id)a3
{
  id v4;
  WBSHistoryServiceItem *v5;
  uint64_t v6;
  NSString *url;
  WBSHistoryServiceItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceItem;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v10, sel_initWithDatabaseID_, objc_msgSend(v4, "int64AtIndex:", 0));
  if (v5)
  {
    objc_msgSend(v4, "stringAtIndex:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v5->_visitCount = objc_msgSend(v4, "int64AtIndex:", 3);
    v5->_statusCode = objc_msgSend(v4, "int64AtIndex:", 9);
    v8 = v5;
  }

  return v5;
}

- (WBSHistoryServiceItem)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryServiceItem *v5;
  uint64_t v6;
  NSString *url;
  WBSHistoryServiceItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceItem;
  v5 = -[WBSHistoryServiceObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v5->_visitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("visitCount"));
    v5->_statusCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("statusCode"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WBSHistoryServiceItem;
  -[WBSHistoryServiceObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_visitCount, CFSTR("visitCount"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_statusCode, CFSTR("statusCode"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(int64_t)a3
{
  self->_visitCount = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
