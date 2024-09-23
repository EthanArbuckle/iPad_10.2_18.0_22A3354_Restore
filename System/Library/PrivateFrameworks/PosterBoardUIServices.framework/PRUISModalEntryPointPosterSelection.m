@implementation PRUISModalEntryPointPosterSelection

- (PRUISModalEntryPointPosterSelection)initWithAllowedConfigurationUUIDs:(id)a3
{
  return -[PRUISModalEntryPointPosterSelection initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:](self, "initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:", self->_allowedConfigurationUUIDs, 0);
}

- (PRUISModalEntryPointPosterSelection)initWithAllowedConfigurationUUIDs:(id)a3 selectedConfigurationUUID:(id)a4
{
  id v6;
  id v7;
  PRUISModalEntryPointPosterSelection *v8;
  uint64_t v9;
  NSSet *allowedConfigurationUUIDs;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRUISModalEntryPointPosterSelection;
  v8 = -[PRUISModalEntryPointPosterSelection init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    allowedConfigurationUUIDs = v8->_allowedConfigurationUUIDs;
    v8->_allowedConfigurationUUIDs = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_selectedConfigurationUUID, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSSet *allowedConfigurationUUIDs;
  uint64_t v8;
  id v9;
  id v10;
  NSUUID *selectedConfigurationUUID;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke;
  v20[3] = &unk_251535C50;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", allowedConfigurationUUIDs, v20);
  selectedConfigurationUUID = self->_selectedConfigurationUUID;
  v15 = v8;
  v16 = 3221225472;
  v17 = __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke_2;
  v18 = &unk_251534BA0;
  v19 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", selectedConfigurationUUID, &v15);
  LOBYTE(selectedConfigurationUUID) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return (char)selectedConfigurationUUID;
}

uint64_t __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "allowedConfigurationUUIDs");
}

uint64_t __47__PRUISModalEntryPointPosterSelection_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectedConfigurationUUID");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_allowedConfigurationUUIDs);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_selectedConfigurationUUID);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:", self->_allowedConfigurationUUIDs, self->_selectedConfigurationUUID);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointPosterSelection)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PRUISModalEntryPointPosterSelection *v8;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v5, objc_opt_class(), CFSTR("allowedConfigurationUUIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedConfigurationUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PRUISModalEntryPointPosterSelection initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:](self, "initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:", v6, v7);
  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSSet *allowedConfigurationUUIDs;
  id v5;

  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", allowedConfigurationUUIDs, CFSTR("allowedConfigurationUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedConfigurationUUID, CFSTR("selectedConfigurationUUID"));

}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return CFSTR("PosterSelection");
}

- (NSSet)allowedConfigurationUUIDs
{
  return self->_allowedConfigurationUUIDs;
}

- (NSUUID)selectedConfigurationUUID
{
  return self->_selectedConfigurationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedConfigurationUUID, 0);
  objc_storeStrong((id *)&self->_allowedConfigurationUUIDs, 0);
}

@end
