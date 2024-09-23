@implementation WBSHistoryEntity

- (WBSHistoryEntity)initWithIdentifier:(id)a3 title:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSHistoryEntity *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSURL *url;
  WBSHistoryEntity *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSHistoryEntity;
  v11 = -[WBSHistoryEntity init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    url = v11->_url;
    v11->_url = (NSURL *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
