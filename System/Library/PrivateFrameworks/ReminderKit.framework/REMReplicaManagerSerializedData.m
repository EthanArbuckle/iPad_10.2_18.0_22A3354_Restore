@implementation REMReplicaManagerSerializedData

- (REMReplicaManagerSerializedData)initWithManagerData:(id)a3 version:(unint64_t)a4
{
  id v7;
  REMReplicaManagerSerializedData *v8;
  REMReplicaManagerSerializedData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMReplicaManagerSerializedData;
  v8 = -[REMReplicaManagerSerializedData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_managerData, a3);
    v9->_version = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMReplicaManagerSerializedData managerData](self, "managerData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("managerData"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[REMReplicaManagerSerializedData version](self, "version"), CFSTR("version"));
}

- (REMReplicaManagerSerializedData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMReplicaManagerSerializedData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managerData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[REMReplicaManagerSerializedData initWithManagerData:version:](self, "initWithManagerData:version:", v5, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  REMReplicaManagerSerializedData *v4;
  REMReplicaManagerSerializedData *v5;
  REMReplicaManagerSerializedData *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  unint64_t v13;

  v4 = (REMReplicaManagerSerializedData *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMReplicaManagerSerializedData managerData](self, "managerData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReplicaManagerSerializedData managerData](v6, "managerData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {

      }
      else
      {
        -[REMReplicaManagerSerializedData managerData](self, "managerData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReplicaManagerSerializedData managerData](v6, "managerData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) == 0)
          goto LABEL_5;
      }
      v13 = -[REMReplicaManagerSerializedData version](self, "version");
      v12 = v13 == -[REMReplicaManagerSerializedData version](v6, "version");
      goto LABEL_9;
    }
LABEL_5:
    v12 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v12 = 1;
LABEL_10:

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[REMReplicaManagerSerializedData version](self, "version");
  -[REMReplicaManagerSerializedData managerData](self, "managerData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>{version: %llu; %ld bytes}"),
    v4,
    self,
    v5,
    objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)serializedDataRepresentingDiscardedReplicaManager
{
  REMReplicaManagerSerializedData *v2;
  void *v3;
  REMReplicaManagerSerializedData *v4;

  v2 = [REMReplicaManagerSerializedData alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REMReplicaManagerSerializedData initWithManagerData:version:](v2, "initWithManagerData:version:", v3, 0);

  return v4;
}

- (BOOL)isRepresentingDiscardedReplicaManager
{
  BOOL v3;
  void *v4;

  if (-[REMReplicaManagerSerializedData version](self, "version"))
    return 0;
  -[REMReplicaManagerSerializedData managerData](self, "managerData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") == 0;

  return v3;
}

- (NSData)managerData
{
  return self->_managerData;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerData, 0);
}

@end
