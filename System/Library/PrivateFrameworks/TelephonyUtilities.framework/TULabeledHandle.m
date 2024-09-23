@implementation TULabeledHandle

- (TULabeledHandle)initWithHandle:(id)a3 label:(id)a4 isSuggested:(BOOL)a5
{
  id v9;
  id v10;
  TULabeledHandle *v11;
  TULabeledHandle *v12;
  uint64_t v13;
  NSString *label;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TULabeledHandle;
  v11 = -[TULabeledHandle init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_handle, a3);
    v13 = objc_msgSend(v10, "copy");
    label = v12->_label;
    v12->_label = (NSString *)v13;

    v12->_isSuggested = a5;
  }

  return v12;
}

- (TULabeledHandle)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TULabeledHandle.m"), 27, CFSTR("%s is not available. Use a designated initializer instead."), "-[TULabeledHandle init]");

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TULabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TULabeledHandle label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p handle=%@ label=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TULabeledHandle isEqualToLabeledHandle:](self, "isEqualToLabeledHandle:", v4);

  return v5;
}

- (BOOL)isEqualToLabeledHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  -[TULabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToHandle:", v6))
  {
    -[TULabeledHandle label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = -[TULabeledHandle isSuggested](self, "isSuggested");
      v10 = v9 ^ objc_msgSend(v4, "isSuggested") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  unint64_t v9;

  -[TULabeledHandle handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TULabeledHandle label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[TULabeledHandle isSuggested](self, "isSuggested");
  v8 = 1237;
  if (v7)
    v8 = 1231;
  v9 = v6 ^ v8;

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TULabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TULabeledHandle label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHandle:label:isSuggested:", v5, v6, -[TULabeledHandle isSuggested](self, "isSuggested"));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TULabeledHandle)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  TULabeledHandle *v13;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_label);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isSuggested);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", v11);

  v13 = -[TULabeledHandle initWithHandle:label:isSuggested:](self, "initWithHandle:label:isSuggested:", v7, v10, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v4 = a3;
  -[TULabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TULabeledHandle label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_label);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[TULabeledHandle isSuggested](self, "isSuggested");
  NSStringFromSelector(sel_isSuggested);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isSuggested
{
  return self->_isSuggested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
