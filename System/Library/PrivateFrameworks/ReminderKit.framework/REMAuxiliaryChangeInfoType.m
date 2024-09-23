@implementation REMAuxiliaryChangeInfoType

+ (NSString)cdEntityName
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Abstract method called -[%@ %@]"), v5, v6);

  return 0;
}

- (REMAuxiliaryChangeInfoType)initWithREMObjectID:(id)a3
{
  id v4;
  REMAuxiliaryChangeInfoType *v5;
  REMAuxiliaryChangeInfoType *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMAuxiliaryChangeInfoType;
  v5 = -[REMAuxiliaryChangeInfoType init](&v8, sel_init);
  v6 = v5;
  if (v4 && v5)
    -[REMAuxiliaryChangeInfoType setRemObjectID:](v5, "setRemObjectID:", v4);

  return v6;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMAuxiliaryChangeInfoType storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  class_addMethod(v4, a3, (IMP)dynamicMethodIMP, "@@:");
  return 1;
}

- (REMObjectID)remObjectID
{
  return self->remObjectID;
}

- (void)setRemObjectID:(id)a3
{
  objc_storeStrong((id *)&self->remObjectID, a3);
}

- (NSDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->remObjectID, 0);
}

@end
