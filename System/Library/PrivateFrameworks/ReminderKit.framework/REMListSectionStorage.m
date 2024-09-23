@implementation REMListSectionStorage

- (void)setListID:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMListSectionStorage;
  -[REMBaseSectionStorage setParentID:](&v3, sel_setParentID_, a3);
}

- (REMListSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMListSectionStorage;
  return -[REMBaseSectionStorage initWithObjectID:accountID:parentID:displayName:](&v7, sel_initWithObjectID_accountID_parentID_displayName_, a3, a4, a5, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMListSectionStorage;
  v4 = -[REMBaseSectionStorage copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[REMListSectionStorage canonicalName](self, "canonicalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanonicalName:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMListSectionStorage;
  if (-[REMBaseSectionStorage isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMListSectionStorage canonicalName](self, "canonicalName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "canonicalName");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {
        v11 = 1;
        v8 = v6;
      }
      else
      {
        v8 = (void *)v7;
        -[REMListSectionStorage canonicalName](self, "canonicalName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "canonicalName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListSectionStorage)initWithCoder:(id)a3
{
  id v3;
  REMListSectionStorage *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMListSectionStorage;
  v3 = a3;
  v4 = -[REMBaseSectionStorage initWithCoder:](&v7, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canonicalName"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListSectionStorage setCanonicalName:](v4, "setCanonicalName:", v5);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMListSectionStorage;
  v4 = a3;
  -[REMBaseSectionStorage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[REMListSectionStorage canonicalName](self, "canonicalName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("canonicalName"));

}

+ (id)cdEntityName
{
  return CFSTR("REMCDListSection");
}

- (id)cdKeyToStorageKeyMap
{
  if (cdListSectionKeyToStorageKeyMap_onceToken != -1)
    dispatch_once(&cdListSectionKeyToStorageKeyMap_onceToken, &__block_literal_global_15);
  return (id)cdListSectionKeyToStorageKeyMap_mapping;
}

- (NSString)canonicalName
{
  return self->canonicalName;
}

- (void)setCanonicalName:(id)a3
{
  objc_storeStrong((id *)&self->canonicalName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->canonicalName, 0);
}

@end
