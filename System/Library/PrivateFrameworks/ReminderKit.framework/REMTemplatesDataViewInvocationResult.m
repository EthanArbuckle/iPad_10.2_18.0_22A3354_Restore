@implementation REMTemplatesDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplatesDataViewInvocationResult)initWithTemplateStorages:(id)a3
{
  id v5;
  REMTemplatesDataViewInvocationResult *v6;
  REMTemplatesDataViewInvocationResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplatesDataViewInvocationResult;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templateStorages, a3);

  return v7;
}

- (REMTemplatesDataViewInvocationResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  REMTemplatesDataViewInvocationResult *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("templateStorages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[REMTemplatesDataViewInvocationResult initWithTemplateStorages:](self, "initWithTemplateStorages:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMTemplatesDataViewInvocationResult templateStorages](self, "templateStorages");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("templateStorages"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMTemplatesDataViewInvocationResult templateStorages](self, "templateStorages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateStorages");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMTemplatesDataViewInvocationResult templateStorages](self, "templateStorages");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "templateStorages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMTemplatesDataViewInvocationResult templateStorages](self, "templateStorages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)templateStorages
{
  return self->_templateStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateStorages, 0);
}

@end
