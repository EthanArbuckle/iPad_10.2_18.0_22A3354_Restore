@implementation REMObjectID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (REMObjectID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  REMObjectID *v8;

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
    self = -[REMObjectID initWithUUID:entityName:](self, "initWithUUID:entityName:", v6, v5);
    v8 = self;
  }

  return v8;
}

+ (REMObjectID)objectIDWithUUID:(id)a3 entityName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:entityName:", v7, v6);

  return (REMObjectID *)v8;
}

- (REMObjectID)initWithUUID:(id)a3 entityName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  REMObjectID *v10;
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
    +[REMLogStore utility](REMLogStore, "utility");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[REMObjectID initWithUUID:entityName:].cold.1(v6, (uint64_t)v8, v9);

  }
  v16.receiver = self;
  v16.super_class = (Class)REMObjectID;
  v10 = -[REMObjectID init](&v16, sel_init);
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

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[REMObjectID stringRepresentation](self, "stringRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "rem_humanReadableIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@~%@"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)stringRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[REMObjectID urlRepresentation](self, "urlRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSURL)urlRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[REMObjectID entityName](self, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMObjectID uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@/%@"), CFSTR("x-apple-reminderkit"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMObjectID entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityName"));

  -[REMObjectID uuid](self, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uuid"));

}

- (NSString)entityName
{
  return self->_entityName;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMObjectID uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  REMObjectID *v4;
  REMObjectID *v5;
  objc_class *Class;
  REMObjectID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMObjectID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4
         && ((Class = object_getClass(self), Class == object_getClass(v5))
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v7 = v5;
    -[REMObjectID uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMObjectID uuid](v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      v12 = 1;
    }
    else
    {
      -[REMObjectID uuid](self, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMObjectID uuid](v7, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "rem_registerClassAtCRCoderIfNeeded");
}

+ (void)rem_registerClassAtCRCoderIfNeeded
{
  if (CR_REMObjectID_registerClass_onceToken != -1)
    dispatch_once(&CR_REMObjectID_registerClass_onceToken, &__block_literal_global_27);
}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (!-[REMObjectID isEqual:](self, "isEqual:"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot merge REMObjectID with different value."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }

}

- (id)deltaSince:(id)a3 in:(id)a4
{
  return 0;
}

- (void)setDocument:(id)a3
{
  if (CR_REMObjectID_registerClass_onceToken != -1)
    dispatch_once(&CR_REMObjectID_registerClass_onceToken, &__block_literal_global_27);
}

- (REMObjectID)initWithCRCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  REMObjectID *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("entityName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithCRCoder:", v4);

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
    self = -[REMObjectID initWithUUID:entityName:](self, "initWithUUID:entityName:", v6, v5);
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCRCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMObjectID entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:forKey:", v5, CFSTR("entityName"));

  -[REMObjectID uuid](self, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeWithCRCoder:", v4);

}

+ (REMObjectID)objectIDWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = 0;
  if (v9 == 2 && v7)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("x-apple-reminderkit"))
    && objc_msgSend(v6, "length")
    && v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:entityName:", v10, v6);
  }
  else
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[REMObjectID objectIDWithURL:].cold.1((uint64_t)v4, v12);

    v11 = 0;
  }

  return (REMObjectID *)v11;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[REMObjectID stringRepresentation](self, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)REMObjectID;
  -[REMObjectID description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rem_humanReadableIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>%@~%@"), v5, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (void)objectIDWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_DEBUG, "Failed to create REMObjectID {url: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)initWithUUID:(NSObject *)a3 entityName:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_fault_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_FAULT, "REMObjectID: nil value passed to non-nil parameter. Something must have gone wrong. {uuid: %@, entityName: %@}", (uint8_t *)&v6, 0x16u);

}

@end
