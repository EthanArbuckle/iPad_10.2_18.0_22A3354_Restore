@implementation REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate)initWithParentTemplateObjectID:(id)a3
{
  id v5;
  REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate *v6;
  REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templateObjectID, a3);

  return v7;
}

- (REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templateObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate initWithParentTemplateObjectID:](self, "initWithParentTemplateObjectID:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate templateObjectID](self, "templateObjectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("templateObjectID"));

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
    -[REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate templateObjectID](self, "templateObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateObjectID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate templateObjectID](self, "templateObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "templateObjectID");
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

  -[REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate templateObjectID](self, "templateObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (REMObjectID)templateObjectID
{
  return self->_templateObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateObjectID, 0);
}

@end
