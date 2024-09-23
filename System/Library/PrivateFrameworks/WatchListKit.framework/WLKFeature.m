@implementation WLKFeature

- (id)jsonRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_domain, CFSTR("domain"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("enabled"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isEqual:(id)a3
{
  WLKFeature *v4;
  BOOL v5;

  v4 = (WLKFeature *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WLKFeature isEqualToFeature:](self, "isEqualToFeature:", v4);
  }

  return v5;
}

- (BOOL)isEqualToFeature:(id)a3
{
  id v4;
  void *v5;
  NSString *name;
  void *v7;
  NSString *domain;
  void *v9;
  int enabled;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    name = self->_name;
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](name, "isEqual:", v7))
    {
      domain = self->_domain;
      objc_msgSend(v5, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](domain, "isEqual:", v9))
      {
        enabled = self->_enabled;
        v11 = enabled == objc_msgSend(v5, "enabled");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WLKFeature name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString length](self->_name, "length");
  return -[NSString length](self->_domain, "length") + v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WLKFeature;
  -[WLKFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKFeature jsonRepresentation](self, "jsonRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
