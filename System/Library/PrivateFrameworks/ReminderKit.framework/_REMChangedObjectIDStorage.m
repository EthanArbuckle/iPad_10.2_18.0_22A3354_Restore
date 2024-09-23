@implementation _REMChangedObjectIDStorage

- (_REMChangedObjectIDStorage)initWithUUID:(id)a3 entityName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _REMChangedObjectIDStorage *v10;
  uint64_t v11;
  NSUUID *uuid;
  uint64_t v13;
  NSString *entityName;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_REMChangedObjectIDStorage initWithUUID:entityName:].cold.1(v6, (uint64_t)v8, v9);

  }
  v16.receiver = self;
  v16.super_class = (Class)_REMChangedObjectIDStorage;
  v10 = -[_REMChangedObjectIDStorage init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    v13 = objc_msgSend(v8, "copy");
    entityName = v10->_entityName;
    v10->_entityName = (NSString *)v13;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_REMChangedObjectIDStorage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _REMChangedObjectIDStorage *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[_REMChangedObjectIDStorage initWithUUID:entityName:](self, "initWithUUID:entityName:", v6, v5);
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_REMChangedObjectIDStorage entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityName"));

  -[_REMChangedObjectIDStorage uuid](self, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uuid"));

}

- (BOOL)isEqual:(id)a3
{
  _REMChangedObjectIDStorage *v4;
  _REMChangedObjectIDStorage *v5;
  _REMChangedObjectIDStorage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (_REMChangedObjectIDStorage *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_REMChangedObjectIDStorage entityName](self, "entityName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMChangedObjectIDStorage entityName](v6, "entityName");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[_REMChangedObjectIDStorage entityName](self, "entityName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMChangedObjectIDStorage entityName](v6, "entityName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[_REMChangedObjectIDStorage uuid](self, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMChangedObjectIDStorage uuid](v6, "uuid");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        -[_REMChangedObjectIDStorage uuid](self, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMChangedObjectIDStorage uuid](v6, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isEqual:", v18);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_entityName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithUUID:(NSObject *)a3 entityName:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = 2114;
  v8 = a2;
  _os_log_fault_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_FAULT, "_REMChangedObjectIDStorage: nil value passed to non-nil parameter. Something must have gone wrong. {uuid: %{public}@, entityName: %{public}@}", v6, 0x16u);

}

@end
