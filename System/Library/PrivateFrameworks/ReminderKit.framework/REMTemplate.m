@implementation REMTemplate

- (REMTemplate)initWithStore:(id)a3 storage:(id)a4
{
  id v7;
  id v8;
  REMTemplate *v9;
  REMTemplate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTemplate;
  v9 = -[REMTemplate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_storage, a4);
    -[REMTemplateStorage setStoreGenerationIfNeeded:](v10->_storage, "setStoreGenerationIfNeeded:", objc_msgSend(v7, "storeGeneration"));
  }

  return v10;
}

- (id)optionalObjectID
{
  void *v2;
  void *v3;

  -[REMTemplate storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[REMTemplate store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMTemplate store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMTemplate storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMTemplate storage](self, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMTemplate storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMTemplate storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMTemplate storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMTemplate storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMTemplate;
  if (-[REMTemplate respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMTemplate storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[REMTemplate storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (REMAccountCapabilities)accountCapabilities
{
  void *v2;
  void *v3;

  -[REMTemplate storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMAccountCapabilities *)v3;
}

- (REMListBadge)badge
{
  void *v2;
  REMListBadge *v3;

  -[REMTemplate badgeEmblem](self, "badgeEmblem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[REMListBadge initWithRawValue:]([REMListBadge alloc], "initWithRawValue:", v2);
  else
    v3 = 0;

  return v3;
}

- (REMTemplateSectionContext)sectionContext
{
  void *v3;
  int v4;
  REMTemplateSectionContext *v5;

  -[REMTemplate accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSections");

  if (v4)
    v5 = -[REMTemplateSectionContext initWithParentTemplate:]([REMTemplateSectionContext alloc], "initWithParentTemplate:", self);
  else
    v5 = 0;
  return v5;
}

+ (id)newObjectID
{
  return +[REMTemplateStorage newObjectID](REMTemplateStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMTemplateStorage objectIDWithUUID:](REMTemplateStorage, "objectIDWithUUID:", a3);
}

+ (NSString)cdEntityName
{
  return +[REMTemplateStorage cdEntityName](REMTemplateStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMTemplate storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

+ (id)cdEntityNameForSavedReminder
{
  return CFSTR("REMCDSavedReminder");
}

+ (id)newObjectIDForSavedReminder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cdEntityNameForSavedReminder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cdEntityNameForSavedAttachment
{
  return CFSTR("REMCDSavedAttachment");
}

+ (id)newObjectIDForSavedAttachment
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cdEntityNameForSavedAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (REMStore)store
{
  return self->_store;
}

- (REMTemplateStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
