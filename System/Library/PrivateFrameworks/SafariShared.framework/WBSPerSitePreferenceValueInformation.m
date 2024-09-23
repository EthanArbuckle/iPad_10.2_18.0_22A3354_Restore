@implementation WBSPerSitePreferenceValueInformation

- (WBSPerSitePreferenceValueInformation)initWithDomain:(id)a3 value:(id)a4 creationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSPerSitePreferenceValueInformation *v11;
  uint64_t v12;
  NSString *domain;
  WBSPerSitePreferenceValueInformation *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSPerSitePreferenceValueInformation;
  v11 = -[WBSPerSitePreferenceValueInformation init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    domain = v11->_domain;
    v11->_domain = (NSString *)v12;

    objc_storeStrong(&v11->_value, a4);
    objc_storeStrong((id *)&v11->_creationDate, a5);
    v14 = v11;
  }

  return v11;
}

- (NSString)domain
{
  return self->_domain;
}

- (id)value
{
  return self->_value;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
