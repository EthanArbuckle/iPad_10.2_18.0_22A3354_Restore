@implementation TRITaskCapabilityModifier

- (TRITaskCapabilityModifier)init
{
  return -[TRITaskCapabilityModifier initWithAdd:remove:](self, "initWithAdd:remove:", 0, 0);
}

- (TRITaskCapabilityModifier)initWithAdd:(unint64_t)a3 remove:(unint64_t)a4
{
  TRITaskCapabilityModifier *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRITaskCapabilityModifier;
  result = -[TRITaskCapabilityModifier init](&v7, sel_init);
  if (result)
  {
    result->_add = a3;
    result->_remove = a4;
  }
  return result;
}

- (unint64_t)updateCapability:(unint64_t)a3
{
  return (self->_add | a3) & ~self->_remove;
}

- (BOOL)isEqualToModifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t add;
  unint64_t remove;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (add = self->_add, add == objc_msgSend(v4, "add")))
  {
    remove = self->_remove;
    v8 = remove == objc_msgSend(v5, "remove");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TRITaskCapabilityModifier *v4;
  TRITaskCapabilityModifier *v5;
  BOOL v6;

  v4 = (TRITaskCapabilityModifier *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITaskCapabilityModifier isEqualToModifier:](self, "isEqualToModifier:", v5);

  return v6;
}

- (unint64_t)hash
{
  return self->_remove - self->_add + 32 * self->_add;
}

- (id)asPersistedModifier
{
  TRIPersistedTaskCapabilityModifier *v3;

  v3 = objc_alloc_init(TRIPersistedTaskCapabilityModifier);
  -[TRIPersistedTaskCapabilityModifier setAdd:](v3, "setAdd:", self->_add);
  -[TRIPersistedTaskCapabilityModifier setRemove:](v3, "setRemove:", self->_remove);
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRITaskCapabilityModifier asPersistedModifier](self, "asPersistedModifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskCapabilityUtilities.m"), 82, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  TRITaskCapabilityModifier *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  objc_class *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  +[TRIPBMessage parseFromData:error:](TRIPersistedTaskCapabilityModifier, "parseFromData:error:", a3, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (!v3)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIPersistedTaskCapabilityModifier: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "hasAdd") & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v5 = 0;
      goto LABEL_11;
    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    v9 = "Cannot decode message of type %@ with missing field: add";
LABEL_13:
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);

    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "hasRemove") & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    v9 = "Cannot decode message of type %@ with missing field: remove";
    goto LABEL_13;
  }
  v5 = -[TRITaskCapabilityModifier initWithAdd:remove:]([TRITaskCapabilityModifier alloc], "initWithAdd:remove:", objc_msgSend(v3, "add"), objc_msgSend(v3, "remove"));
LABEL_11:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITaskCapabilityModifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  TRITaskCapabilityModifier *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  objc_class *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0;
    +[TRIPBMessage parseFromData:error:](TRIPersistedTaskCapabilityModifier, "parseFromData:error:", v5, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (!v6)
    {
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIPersistedTaskCapabilityModifier: %@", buf, 0xCu);
      }
      goto LABEL_12;
    }
    if ((objc_msgSend(v6, "hasAdd") & 1) != 0)
    {
      if ((objc_msgSend(v6, "hasRemove") & 1) != 0)
      {
        self = -[TRITaskCapabilityModifier initWithAdd:remove:](self, "initWithAdd:remove:", objc_msgSend(v6, "add"), objc_msgSend(v6, "remove"));
        v8 = self;
LABEL_13:

        goto LABEL_14;
      }
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        v8 = 0;
        goto LABEL_13;
      }
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      v12 = "Cannot decode message of type %@ with missing field: remove";
    }
    else
    {
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      v12 = "Cannot decode message of type %@ with missing field: add";
    }
    _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    goto LABEL_12;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TRITaskCapabilityModifier serialize](self, "serialize");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRITaskCapabilityModifier | add:0x%llx remove:0x%llx"), self->_add, self->_remove);
}

- (unint64_t)add
{
  return self->_add;
}

- (unint64_t)remove
{
  return self->_remove;
}

@end
