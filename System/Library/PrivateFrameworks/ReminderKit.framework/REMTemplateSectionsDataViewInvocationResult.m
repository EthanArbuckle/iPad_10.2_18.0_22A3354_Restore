@implementation REMTemplateSectionsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplateSectionsDataViewInvocationResult)initWithTemplateStorages:(id)a3 templateSectionStorages:(id)a4
{
  id v7;
  id v8;
  REMTemplateSectionsDataViewInvocationResult *v9;
  REMTemplateSectionsDataViewInvocationResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTemplateSectionsDataViewInvocationResult;
  v9 = -[REMStoreInvocationValueStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_templateStorages, a3);
    objc_storeStrong((id *)&v10->_templateSectionStorages, a4);
  }

  return v10;
}

- (REMTemplateSectionsDataViewInvocationResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  REMTemplateSectionsDataViewInvocationResult *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("templateStorages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("templateSectionStorages"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v8 && v12)
  {
    self = -[REMTemplateSectionsDataViewInvocationResult initWithTemplateStorages:templateSectionStorages:](self, "initWithTemplateStorages:templateSectionStorages:", v8, v12);
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMTemplateSectionsDataViewInvocationResult templateStorages](self, "templateStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("templateStorages"));

  -[REMTemplateSectionsDataViewInvocationResult templateSectionStorages](self, "templateSectionStorages");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("templateSectionStorages"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMTemplateSectionsDataViewInvocationResult templateStorages](self, "templateStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateStorages");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMTemplateSectionsDataViewInvocationResult templateStorages](self, "templateStorages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateStorages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMTemplateSectionsDataViewInvocationResult templateSectionStorages](self, "templateSectionStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateSectionStorages");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMTemplateSectionsDataViewInvocationResult templateSectionStorages](self, "templateSectionStorages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateSectionStorages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[REMTemplateSectionsDataViewInvocationResult templateStorages](self, "templateStorages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMTemplateSectionsDataViewInvocationResult templateSectionStorages](self, "templateSectionStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)templateStorages
{
  return self->_templateStorages;
}

- (NSArray)templateSectionStorages
{
  return self->_templateSectionStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateSectionStorages, 0);
  objc_storeStrong((id *)&self->_templateStorages, 0);
}

@end
