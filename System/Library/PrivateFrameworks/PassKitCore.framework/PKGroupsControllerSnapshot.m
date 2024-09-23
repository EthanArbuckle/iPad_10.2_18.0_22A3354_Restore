@implementation PKGroupsControllerSnapshot

- (void)encodeWithCoder:(id)a3
{
  NSSet *passes;
  id v5;

  passes = self->_passes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passes, CFSTR("passes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_states, CFSTR("states"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_annotations, CFSTR("annotationsByPassUniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_catalog, CFSTR("catalog"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accounts, CFSTR("creditAccount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

- (NSSet)passes
{
  return self->_passes;
}

- (NSDictionary)states
{
  return self->_states;
}

- (PKCatalog)catalog
{
  return self->_catalog;
}

- (NSDictionary)annotations
{
  return self->_annotations;
}

- (PKGroupsControllerSnapshot)initWithCoder:(id)a3
{
  id v4;
  PKGroupsControllerSnapshot *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *passes;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *states;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *annotations;
  void *v23;
  uint64_t v24;
  PKCatalog *catalog;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSSet *accounts;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKGroupsControllerSnapshot;
  v5 = -[PKGroupsControllerSnapshot init](&v32, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("passes"));
    v9 = objc_claimAutoreleasedReturnValue();
    passes = v5->_passes;
    v5->_passes = (NSSet *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("states"));
    v15 = objc_claimAutoreleasedReturnValue();
    states = v5->_states;
    v5->_states = (NSDictionary *)v15;

    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = (void *)objc_msgSend(v17, "initWithObjects:", v18, v19, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("annotationsByPassUniqueID"));
    v21 = objc_claimAutoreleasedReturnValue();
    annotations = v5->_annotations;
    v5->_annotations = (NSDictionary *)v21;

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("catalog"));
    v24 = objc_claimAutoreleasedReturnValue();
    catalog = v5->_catalog;
    v5->_catalog = (PKCatalog *)v24;

    v26 = objc_alloc(MEMORY[0x1E0C99E60]);
    v27 = objc_opt_class();
    v28 = (void *)objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("creditAccount"));
    v29 = objc_claimAutoreleasedReturnValue();
    accounts = v5->_accounts;
    v5->_accounts = (NSSet *)v29;

  }
  return v5;
}

- (PKGroupsControllerSnapshot)init
{

  return 0;
}

- (PKGroupsControllerSnapshot)initWithPasses:(id)a3 annotationsByPassUniqueID:(id)a4 accounts:(id)a5 catalog:(id)a6
{
  return -[PKGroupsControllerSnapshot initWithPasses:states:annotations:accounts:catalog:](self, "initWithPasses:states:annotations:accounts:catalog:", a3, MEMORY[0x1E0C9AA70], a4, a5, a6);
}

- (PKGroupsControllerSnapshot)initWithPasses:(id)a3 states:(id)a4 annotations:(id)a5 accounts:(id)a6 catalog:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKGroupsControllerSnapshot *v17;
  uint64_t v18;
  NSSet *passes;
  uint64_t v20;
  NSDictionary *states;
  uint64_t v22;
  NSDictionary *annotations;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKGroupsControllerSnapshot;
  v17 = -[PKGroupsControllerSnapshot init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    passes = v17->_passes;
    v17->_passes = (NSSet *)v18;

    v20 = objc_msgSend(v13, "copy");
    states = v17->_states;
    v17->_states = (NSDictionary *)v20;

    v22 = objc_msgSend(v14, "copy");
    annotations = v17->_annotations;
    v17->_annotations = (NSDictionary *)v22;

    objc_storeStrong((id *)&v17->_accounts, a6);
    objc_storeStrong((id *)&v17->_catalog, a7);
  }

  return v17;
}

- (NSDictionary)annotationsByPassUniqueID
{
  return self->_annotations;
}

- (NSSet)accounts
{
  return self->_accounts;
}

@end
