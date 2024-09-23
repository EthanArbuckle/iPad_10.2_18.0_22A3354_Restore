@implementation WPLinkFilteringRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queryParameter, 0);
}

- (WPLinkFilteringRule)initWithQueryParameter:(id)a3 domain:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  id v11;
  WPLinkFilteringRule *v12;
  WPLinkFilteringRule *v13;
  WPLinkFilteringRule *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WPLinkFilteringRule;
  v12 = -[WPLinkFilteringRule init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queryParameter, a3);
    objc_storeStrong((id *)&v13->_domain, a4);
    objc_storeStrong((id *)&v13->_path, a5);
    v14 = v13;
  }

  return v13;
}

- (NSString)queryParameter
{
  return self->_queryParameter;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)domain
{
  return self->_domain;
}

- (id)description
{
  NSString *v3;

  if (-[NSString length](self->_domain, "length") || -[NSString length](self->_path, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@ - %@"), self->_queryParameter, self->_domain, self->_path);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_queryParameter;
  }
  return v3;
}

@end
