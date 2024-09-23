@implementation WPStorageAccessUserAgentStringQuirk

- (WPStorageAccessUserAgentStringQuirk)initWithDomain:(id)a3 withUserAgentString:(id)a4
{
  id v7;
  id v8;
  WPStorageAccessUserAgentStringQuirk *v9;
  WPStorageAccessUserAgentStringQuirk *v10;
  WPStorageAccessUserAgentStringQuirk *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WPStorageAccessUserAgentStringQuirk;
  v9 = -[WPStorageAccessUserAgentStringQuirk init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domain, a3);
    objc_storeStrong((id *)&v10->_userAgentString, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  if (-[NSString length](self->_domain, "length"))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), self->_domain, self->_userAgentString);
  else
    -[NSString description](self->_userAgentString, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)userAgentString
{
  return self->_userAgentString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
