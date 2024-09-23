@implementation IPAPreviewSizeRegistry

- (IPAPreviewSizeRegistry)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ not supported for %@: use initWithName:"), v5, objc_opt_class());

  return 0;
}

- (IPAPreviewSizeRegistry)initWithName:(id)a3
{
  id v5;
  IPAPreviewSizeRegistry *v6;
  IPAPreviewSizeRegistry *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *policies;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPAPreviewSizeRegistry;
  v6 = -[IPAPreviewSizeRegistry init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    policies = v7->_policies;
    v7->_policies = v8;

  }
  return v7;
}

- (void)addPolicy:(id)a3
{
  NSMutableDictionary *policies;
  id v4;
  id v5;

  policies = self->_policies;
  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](policies, "setObject:forKeyedSubscript:", v4, v5);

}

- (id)policyForStyle:(unint64_t)a3
{
  NSMutableDictionary *policies;
  void *v4;
  void *v5;
  IPAPreviewSizeRegistry *v7;
  SEL v8;
  id v9;

  policies = self->_policies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](policies, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return v5;
  v7 = (IPAPreviewSizeRegistry *)_PFAssertFailHandler();
  return -[IPAPreviewSizeRegistry policyForStyleObject:](v7, v8, v9);
}

- (id)policyForStyleObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  IPAPreviewSizeRegistry *v8;
  SEL v9;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_policies, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;

    return v6;
  }
  else
  {
    v8 = (IPAPreviewSizeRegistry *)_PFAssertFailHandler();
    return -[IPAPreviewSizeRegistry description](v8, v9);
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSMutableDictionary allValues](self->_policies, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> %@"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> %@"), objc_opt_class(), self, self->_policies);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
