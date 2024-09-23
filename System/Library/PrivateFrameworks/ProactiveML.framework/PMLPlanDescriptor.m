@implementation PMLPlanDescriptor

- (PMLPlanDescriptor)initWithName:(id)a3 version:(id)a4 locale:(id)a5
{
  id v10;
  id v11;
  id v12;
  PMLPlanDescriptor *v13;
  PMLPlanDescriptor *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPlanDescriptor.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPlanDescriptor.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPlanDescriptor.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)PMLPlanDescriptor;
  v13 = -[PMLPlanDescriptor init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_version, a4);
    objc_storeStrong((id *)&v14->_locale, a5);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PMLPlanDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  PMLPlanDescriptor *v8;

  v4 = [PMLPlanDescriptor alloc];
  -[PMLPlanDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLPlanDescriptor version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLPlanDescriptor locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PMLPlanDescriptor initWithName:version:locale:](v4, "initWithName:version:locale:", v5, v6, v7);

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_version, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_locale, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  NSString *version;
  void *v8;
  NSString *locale;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    name = self->_name;
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](name, "isEqual:", v6))
    {
      version = self->_version;
      objc_msgSend(v4, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](version, "isEqual:", v8))
      {
        locale = self->_locale;
        objc_msgSend(v4, "locale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSString isEqual:](locale, "isEqual:", v10);

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

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)isValidPlanId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 3;

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)descriptorFromPlanId:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PMLPlanDescriptor *v8;
  void *v9;
  void *v10;
  void *v11;
  PMLPlanDescriptor *v12;
  void *v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLPlanDescriptor.m"), 39, CFSTR("Invalid planId. Must be <name>-<version>-<locale> but got %@"), v5);

  }
  v8 = [PMLPlanDescriptor alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PMLPlanDescriptor initWithName:version:locale:](v8, "initWithName:version:locale:", v9, v10, v11);

  objc_autoreleasePoolPop(v6);
  return v12;
}

+ (id)planIdFromString:(id)a3
{
  return a3;
}

@end
