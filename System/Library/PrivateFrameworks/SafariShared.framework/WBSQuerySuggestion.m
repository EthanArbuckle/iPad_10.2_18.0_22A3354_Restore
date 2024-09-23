@implementation WBSQuerySuggestion

- (WBSQuerySuggestion)init
{

  return 0;
}

- (WBSQuerySuggestion)initWithTitle:(id)a3 identifier:(id)a4 type:(int64_t)a5 tag:(id)a6
{
  id v10;
  id v11;
  id v12;
  WBSQuerySuggestion *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *identifier;
  WBSQuerySuggestion *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBSQuerySuggestion;
  v13 = -[WBSQuerySuggestion init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    v13->_type = a5;
    objc_storeStrong(&v13->_tag, a6);
    v18 = v13;
  }

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (id)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tag, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
