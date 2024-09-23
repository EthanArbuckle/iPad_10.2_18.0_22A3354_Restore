@implementation WBSSavedAccountAdditionalSite

- (WBSSavedAccountAdditionalSite)initWithSite:(id)a3
{
  id v5;
  WBSSavedAccountAdditionalSite *v6;
  WBSSavedAccountAdditionalSite *v7;
  WBSSavedAccountAdditionalSite *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountAdditionalSite;
  v6 = -[WBSSavedAccountAdditionalSite init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_site, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSSavedAccountAdditionalSite)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WBSSavedAccountAdditionalSite *v5;
  uint64_t v6;
  NSString *site;
  WBSSavedAccountAdditionalSite *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountAdditionalSite;
  v5 = -[WBSSavedAccountAdditionalSite init](&v10, sel_init);
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("s"));
    v6 = objc_claimAutoreleasedReturnValue();
    site = v5->_site;
    v5->_site = (NSString *)v6;

    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *site;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  site = self->_site;
  if (site)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", site, CFSTR("s"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WBSSavedAccountAdditionalSite *v4;
  NSString *site;
  void *v6;
  char v7;

  v4 = (WBSSavedAccountAdditionalSite *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      site = self->_site;
      -[WBSSavedAccountAdditionalSite site](v4, "site");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = WBSIsEqual(site, v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_site, "hash");
}

- (NSString)site
{
  return self->_site;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_site, 0);
}

@end
