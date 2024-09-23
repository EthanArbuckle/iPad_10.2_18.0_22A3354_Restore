@implementation VUIAppDocumentRefreshEventDescriptor

- (VUIAppDocumentRefreshEventDescriptor)initWithEventType:(unint64_t)a3 delayInSeconds:(unint64_t)a4 name:(id)a5
{
  id v8;
  VUIAppDocumentRefreshEventDescriptor *v9;
  VUIAppDocumentRefreshEventDescriptor *v10;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v8 = a5;
  if (!a4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The delayInSeconds parameter must be greater than 0"));
  if (a3 >= 3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The eventType for refresh must be either foregroundTTL, refreshTTL or activeTTL"));
  v14.receiver = self;
  v14.super_class = (Class)VUIAppDocumentRefreshEventDescriptor;
  v9 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:](&v14, sel_initWithEventType_, a3);
  v10 = v9;
  if (v9)
  {
    v9->_delayInSeconds = a4;
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

  }
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUIAppDocumentRefreshEventDescriptor;
  -[VUIAppDocumentUpdateEventDescriptor description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIAppDocumentRefreshEventDescriptor delayInSeconds](self, "delayInSeconds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("delayInSeconds"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentRefreshEventDescriptor name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("name"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppDocumentRefreshEventDescriptor *v4;
  VUIAppDocumentRefreshEventDescriptor *v5;
  VUIAppDocumentRefreshEventDescriptor *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;

  v4 = (VUIAppDocumentRefreshEventDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIAppDocumentUpdateEventDescriptor type](self, "type");
    if (v7 == -[VUIAppDocumentUpdateEventDescriptor type](v6, "type")
      && (v8 = -[VUIAppDocumentRefreshEventDescriptor delayInSeconds](self, "delayInSeconds"),
          v8 == -[VUIAppDocumentRefreshEventDescriptor delayInSeconds](v6, "delayInSeconds")))
    {
      -[VUIAppDocumentRefreshEventDescriptor name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAppDocumentRefreshEventDescriptor name](v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {
        v14 = 1;
      }
      else
      {
        v14 = 0;
        if (v11 && v12)
          v14 = objc_msgSend(v11, "isEqual:", v12);
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[VUIAppDocumentUpdateEventDescriptor type](self, "type");
  v4 = v3 ^ (2 * -[VUIAppDocumentRefreshEventDescriptor delayInSeconds](self, "delayInSeconds"));
  -[VUIAppDocumentRefreshEventDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (unint64_t)delayInSeconds
{
  return self->_delayInSeconds;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (VUIAppDocumentRefreshEventDescriptor)initWithEventType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (void)setDelayInSeconds:(unint64_t)a3
{
  self->_delayInSeconds = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
