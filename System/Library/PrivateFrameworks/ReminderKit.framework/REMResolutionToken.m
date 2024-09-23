@implementation REMResolutionToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMResolutionToken)initWithCounter:(int64_t)a3 modificationTime:(double)a4 replicaID:(id)a5
{
  id v8;
  REMResolutionToken *v9;
  REMResolutionToken *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)REMResolutionToken;
  v9 = -[REMResolutionToken init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[REMResolutionToken setCounter:](v9, "setCounter:", a3);
    -[REMResolutionToken setModificationTime:](v10, "setModificationTime:", a4);
    -[REMResolutionToken setReplicaID:](v10, "setReplicaID:", v8);
  }

  return v10;
}

- (REMResolutionToken)init
{
  double Current;
  void *v4;
  REMResolutionToken *v5;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMResolutionToken initWithCounter:modificationTime:replicaID:](self, "initWithCounter:modificationTime:replicaID:", 0, v4, Current);

  return v5;
}

- (REMResolutionToken)initWithDefaultValue
{
  void *v3;
  REMResolutionToken *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C6613346-F378-45AB-8DBD-57BE9AAFB009"));
  v4 = -[REMResolutionToken initWithCounter:modificationTime:replicaID:](self, "initWithCounter:modificationTime:replicaID:", 0, v3, 0.0);

  return v4;
}

- (REMResolutionToken)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  REMResolutionToken *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("counter"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("modificationTime"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replicaID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMResolutionToken initWithCounter:modificationTime:replicaID:](self, "initWithCounter:modificationTime:replicaID:", v5, v8, v7);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMResolutionToken counter](self, "counter"), CFSTR("counter"));
  -[REMResolutionToken modificationTime](self, "modificationTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("modificationTime"));
  -[REMResolutionToken replicaID](self, "replicaID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("replicaID"));

}

- (void)update
{
  -[REMResolutionToken setCounter:](self, "setCounter:", -[REMResolutionToken counter](self, "counter") + 1);
  -[REMResolutionToken setModificationTime:](self, "setModificationTime:", CFAbsoluteTimeGetCurrent());
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMResolutionToken *v4;
  int64_t v5;
  double v6;
  double v7;
  void *v8;
  REMResolutionToken *v9;

  v4 = [REMResolutionToken alloc];
  v5 = -[REMResolutionToken counter](self, "counter");
  -[REMResolutionToken modificationTime](self, "modificationTime");
  v7 = v6;
  -[REMResolutionToken replicaID](self, "replicaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMResolutionToken initWithCounter:modificationTime:replicaID:](v4, "initWithCounter:modificationTime:replicaID:", v5, v8, v7);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  REMResolutionToken *v4;
  BOOL v5;

  v4 = (REMResolutionToken *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[REMResolutionToken compare:](self, "compare:", v4) == 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[REMResolutionToken counter](self, "counter");
  if (v5 == objc_msgSend(v4, "counter"))
  {
    -[REMResolutionToken modificationTime](self, "modificationTime");
    v7 = v6;
    objc_msgSend(v4, "modificationTime");
    if (vabdd_f64(v7, v8) <= 2.22044605e-16)
    {
      -[REMResolutionToken replicaID](self, "replicaID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "replicaID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "CR_compare:", v12);

    }
    else if (v7 - v8 > 0.0)
    {
      v9 = 1;
    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v10 = -[REMResolutionToken counter](self, "counter");
    if (v10 > objc_msgSend(v4, "counter"))
      v9 = 1;
    else
      v9 = -1;
  }

  return v9;
}

- (id)description
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[REMResolutionToken counter](self, "counter");
  -[REMResolutionToken modificationTime](self, "modificationTime");
  v6 = v5;
  -[REMResolutionToken replicaID](self, "replicaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<counter=%ld modificationTime=%lf replicaID=%@>"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)resolutionTokenWithJSONObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  REMResolutionToken *v15;
  uint64_t v16;
  REMResolutionToken *v17;
  NSObject *v18;

  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("counter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v4, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("modificationTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v7, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("replicaID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v10, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || !v9
    || !v12
    || (v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12)) == 0
    || (v14 = (void *)v13,
        v15 = [REMResolutionToken alloc],
        v16 = objc_msgSend(v6, "integerValue"),
        objc_msgSend(v9, "doubleValue"),
        v17 = -[REMResolutionToken initWithCounter:modificationTime:replicaID:](v15, "initWithCounter:modificationTime:replicaID:", v16, v14), v14, !v17))
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[REMResolutionToken resolutionTokenWithJSONObject:].cold.1((uint64_t)v3, v18);

    v17 = 0;
  }

  return v17;
}

- (double)generateNonce
{
  double v3;
  double v4;

  v3 = (double)-[REMResolutionToken counter](self, "counter");
  -[REMResolutionToken modificationTime](self, "modificationTime");
  return v4 + v3 * 1.0e11;
}

- (int64_t)counter
{
  return self->_counter;
}

- (void)setCounter:(int64_t)a3
{
  self->_counter = a3;
}

- (double)modificationTime
{
  return self->_modificationTime;
}

- (void)setModificationTime:(double)a3
{
  self->_modificationTime = a3;
}

- (NSUUID)replicaID
{
  return self->_replicaID;
}

- (void)setReplicaID:(id)a3
{
  objc_storeStrong((id *)&self->_replicaID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaID, 0);
}

+ (void)resolutionTokenWithJSONObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Can't construct REMResolutionToken from invalid JSON {jsonObject: %@}", (uint8_t *)&v2, 0xCu);
}

@end
