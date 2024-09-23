@implementation WFCloudKitItemProperty

- (BOOL)isIgnoredByDefault
{
  return self->_ignoredByDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong(&self->_constantValue, 0);
  objc_storeStrong((id *)&self->_nilValue, 0);
  objc_storeStrong((id *)&self->_itemClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)assetPropertyWithName:(id)a3 fileType:(id)a4 ignoredByDefault:(BOOL)a5 encrypted:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  LOBYTE(v14) = a6;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 2, v11, 0, v7, 0, 0, 0, v10, v14);

  return v12;
}

+ (id)objectPropertyWithName:(id)a3 ignoredByDefault:(BOOL)a4 encrypted:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v11;

  v6 = a4;
  v8 = a3;
  LOBYTE(v11) = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 1, v8, 0, v6, 0, 0, 0, 0, v11);

  return v9;
}

- (WFCloudKitItemProperty)initWithType:(unint64_t)a3 name:(id)a4 itemClass:(Class)a5 ignoredByDefault:(BOOL)a6 nilValue:(id)a7 hasConstantValue:(BOOL)a8 constantValue:(id)a9 fileType:(id)a10 encrypted:(BOOL)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFCloudKitItemProperty *v19;
  WFCloudKitItemProperty *v20;
  uint64_t v21;
  NSString *name;
  WFCloudKitItemProperty *v23;
  void *v25;
  objc_super v29;

  v15 = a4;
  v16 = a7;
  v17 = a9;
  v18 = a10;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitItemProperty.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v29.receiver = self;
  v29.super_class = (Class)WFCloudKitItemProperty;
  v19 = -[WFCloudKitItemProperty init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    v21 = objc_msgSend(v15, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v21;

    objc_storeStrong((id *)&v20->_itemClass, a5);
    v20->_ignoredByDefault = a6;
    objc_storeStrong((id *)&v20->_nilValue, a7);
    v20->_hasConstantValue = a8;
    objc_storeStrong(&v20->_constantValue, a9);
    objc_storeStrong((id *)&v20->_fileType, a10);
    v20->_encrypted = a11;
    v23 = v20;
  }

  return v20;
}

+ (id)objectPropertyWithName:(id)a3
{
  return (id)objc_msgSend(a1, "objectPropertyWithName:ignoredByDefault:encrypted:", a3, 0, 0);
}

+ (id)assetPropertyWithName:(id)a3 fileType:(id)a4
{
  return (id)objc_msgSend(a1, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", a3, a4, 0, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (Class)itemClass
{
  return self->_itemClass;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (NSValue)nilValue
{
  return self->_nilValue;
}

- (BOOL)hasConstantValue
{
  return self->_hasConstantValue;
}

- (id)constantValue
{
  return self->_constantValue;
}

- (WFFileType)fileType
{
  return self->_fileType;
}

+ (id)scalarPropertyWithName:(id)a3 nilValue:(id)a4
{
  return (id)objc_msgSend(a1, "scalarPropertyWithName:nilValue:ignoredByDefault:encrypted:", a3, a4, 0, 0);
}

+ (id)scalarPropertyWithName:(id)a3 nilValue:(id)a4 ignoredByDefault:(BOOL)a5 encrypted:(BOOL)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v15;
  uint64_t v16;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitItemProperty.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nilValue"));

  }
  LOBYTE(v16) = a6;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 0, v11, 0, v7, v12, 0, 0, 0, v16);

  return v13;
}

+ (id)scalarPropertyWithName:(id)a3 constantValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  LOBYTE(v10) = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 0, v7, 0, 0, 0, 1, v6, 0, v10);

  return v8;
}

+ (id)objectPropertyWithName:(id)a3 constantValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  LOBYTE(v10) = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 1, v7, 0, 0, 0, 1, v6, 0, v10);

  return v8;
}

+ (id)objectPropertyWithName:(id)a3 constantValue:(id)a4 encrypted:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v12;

  v8 = a4;
  v9 = a3;
  LOBYTE(v12) = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 1, v9, 0, 0, 0, 1, v8, 0, v12);

  return v10;
}

+ (id)assetPropertyWithName:(id)a3
{
  return (id)objc_msgSend(a1, "assetPropertyWithName:fileType:", a3, 0);
}

+ (id)itemReferencePropertyWithName:(id)a3 itemClass:(Class)a4
{
  id v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v7 = a3;
  if ((-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_1EF72DF08) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitItemProperty.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[itemClass conformsToProtocol:@protocol(WFCloudKitItem)]"));

  }
  LOBYTE(v11) = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 4, v7, a4, 0, 0, 0, 0, 0, v11);

  return v8;
}

+ (id)itemPropertyWithName:(id)a3 itemClass:(Class)a4
{
  id v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v7 = a3;
  if ((-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_1EF72DF08) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitItemProperty.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[itemClass conformsToProtocol:@protocol(WFCloudKitItem)]"));

  }
  LOBYTE(v11) = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:itemClass:ignoredByDefault:nilValue:hasConstantValue:constantValue:fileType:encrypted:", 3, v7, a4, 0, 0, 0, 0, 0, v11);

  return v8;
}

@end
