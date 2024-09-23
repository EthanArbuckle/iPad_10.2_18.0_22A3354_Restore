@implementation PKCollectionSpecialization

- (PKCollectionSpecialization)initWithCollection:(id)a3
{
  id v5;
  PKCollectionSpecialization *v6;
  PKCollectionSpecialization *v7;
  Printd_Parameters_ForColTypes *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKCollectionSpecialization;
  v6 = -[PKCollectionSpecialization init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = (Printd_Parameters_ForColTypes *)operator new();
    v8->var0 = v7->_collection;
    v7->_params = v8;
  }

  return v7;
}

- (void)dealloc
{
  Printd_Parameters_ForColTypes *params;
  objc_super v4;

  params = self->_params;
  if (params)
  {

    MEMORY[0x227667788](params, 0x80C40B8603338);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKCollectionSpecialization;
  -[PKCollectionSpecialization dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCollection:", self->_collection);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if ((-[PKCollectionSpecialization conformsToProtocol:](self, "conformsToProtocol:", &unk_255657C38) & 1) != 0)
  {
    -[PKCollectionSpecialization userCodableDictionary](self, "userCodableDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    v8.receiver = self;
    v8.super_class = (Class)PKCollectionSpecialization;
    -[PKCollectionSpecialization description](&v8, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    -[PK_ipp_collection_t debugDescription](self->_collection, "debugDescription");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)collection
{
  return self->_collection;
}

- (const)params
{
  return self->_params;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
