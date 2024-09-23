@implementation SMUNPSDomainAccessor

- (SMUNPSDomainAccessor)initWithDomain:(id)a3
{
  id v4;
  SMUNPSDomainAccessor *v5;
  uint64_t v6;
  NPSDomainAccessor *domainAccessor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMUNPSDomainAccessor;
  v5 = -[SMUNPSDomainAccessor init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", v4);
    domainAccessor = v5->_domainAccessor;
    v5->_domainAccessor = (NPSDomainAccessor *)v6;

  }
  return v5;
}

- (id)objectForKey:(id)a3
{
  return (id)-[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:", a3);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  -[NPSDomainAccessor setBool:forKey:](self->_domainAccessor, "setBool:forKey:", a3, a4);
}

- (id)synchronize
{
  return (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end
