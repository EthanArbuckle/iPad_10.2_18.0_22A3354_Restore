@implementation STUniquedManagedObject

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUniquedManagedObject;
  -[STUniquedManagedObject awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUniquedManagedObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v3, CFSTR("sortKey"));

}

- (void)updateUniqueIdentifier
{
  id v3;

  -[STUniquedManagedObject computeUniqueIdentifier](self, "computeUniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STUniquedManagedObject setValue:forKey:](self, "setValue:forKey:", v3, CFSTR("uniqueIdentifier"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_class();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFC7F020))
  {
    objc_msgSend(v4, "serializableClassName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("class"));

  }
  -[STUniquedManagedObject uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("uniqueIdentifier"));

  return v3;
}

- (id)computeUniqueIdentifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return &stru_1E9372498;
}

@end
