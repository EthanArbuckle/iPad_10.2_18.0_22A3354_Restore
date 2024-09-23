@implementation WPRestrictedOpenerDomain

- (WPRestrictedOpenerDomain)initWithDomain:(id)a3 openerType:(int64_t)a4
{
  id v7;
  WPRestrictedOpenerDomain *v8;
  WPRestrictedOpenerDomain *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPRestrictedOpenerDomain;
  v8 = -[WPRestrictedOpenerDomain init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_domain, a3);
    v9->_openerType = a4;
  }

  return v9;
}

- (id)description
{
  int64_t openerType;
  const char *v3;
  const char *v4;

  openerType = self->_openerType;
  v3 = "unknown";
  if (openerType == 2)
    v3 = "postMessageAndClose";
  if (openerType == 1)
    v4 = "noOpener";
  else
    v4 = v3;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %s"), self->_domain, v4);
}

- (NSString)domain
{
  return self->_domain;
}

- (int64_t)openerType
{
  return self->_openerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
