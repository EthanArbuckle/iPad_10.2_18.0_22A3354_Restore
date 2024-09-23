@implementation STCoreOrganization

+ (Class)internalClassForSerializableClassName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = internalClassForSerializableClassName__oneTime;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&internalClassForSerializableClassName__oneTime, &__block_literal_global_10);
  objc_msgSend((id)internalClassForSerializableClassName__mapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

void __60__STCoreOrganization_internalClassForSerializableClassName___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 9);
  v1 = (void *)internalClassForSerializableClassName__mapping;
  internalClassForSerializableClassName__mapping = v0;

  v2 = (void *)internalClassForSerializableClassName__mapping;
  v3 = objc_opt_class();
  +[STLocalOrganization serializableClassName](STLocalOrganization, "serializableClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

  v5 = (void *)internalClassForSerializableClassName__mapping;
  v6 = objc_opt_class();
  +[STiCloudOrganization serializableClassName](STiCloudOrganization, "serializableClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

  v8 = (void *)internalClassForSerializableClassName__mapping;
  v9 = objc_opt_class();
  +[STFamilyOrganization serializableClassName](STFamilyOrganization, "serializableClassName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v10);

}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STCoreOrganization;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
