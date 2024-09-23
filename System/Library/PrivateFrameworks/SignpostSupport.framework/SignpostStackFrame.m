@implementation SignpostStackFrame

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolOwnerUUID, 0);
}

- (SignpostStackFrame)initWithUUID:(id)a3 offset:(unint64_t)a4
{
  id v7;
  SignpostStackFrame *v8;
  SignpostStackFrame *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SignpostStackFrame;
  v8 = -[SignpostStackFrame init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_symbolOwnerUUID, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (id)_serializableArrayRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[SignpostStackFrame symbolOwnerUUID](self, "symbolOwnerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostStackFrame offset](self, "offset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SignpostStackFrame)initWithArrayRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  SignpostStackFrame *v12;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = (objc_class *)MEMORY[0x1E0CB3A28];
      v8 = v6;
      v9 = v5;
      v10 = (void *)objc_msgSend([v7 alloc], "initWithUUIDString:", v9);

      v11 = objc_msgSend(v8, "unsignedLongLongValue");
      self = -[SignpostStackFrame initWithUUID:offset:](self, "initWithUUID:offset:", v10, v11);

      v12 = self;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  SignpostStackFrame *v4;
  SignpostStackFrame *v5;
  SignpostStackFrame *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SignpostStackFrame *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && -[SignpostStackFrame isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = v5;
    v7 = -[SignpostStackFrame offset](self, "offset");
    if (v7 == -[SignpostStackFrame offset](v6, "offset"))
    {
      -[SignpostStackFrame symbolOwnerUUID](self, "symbolOwnerUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostStackFrame symbolOwnerUUID](v6, "symbolOwnerUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostStackFrame symbolOwnerUUID](self, "symbolOwnerUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@+%llu"), v5, -[SignpostStackFrame offset](self, "offset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)symbolOwnerUUID
{
  return self->_symbolOwnerUUID;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end
