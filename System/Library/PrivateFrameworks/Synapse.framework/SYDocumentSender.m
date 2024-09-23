@implementation SYDocumentSender

- (SYDocumentSender)initWithName:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  SYDocumentSender *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *handle;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SYDocumentSender;
  v8 = -[SYDocumentSender init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    handle = v8->_handle;
    v8->_handle = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDocumentSender name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDocumentSender handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> {name = %@, handle = %@}"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SYDocumentSender name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SYDocumentSenderNameKey"));

  -[SYDocumentSender handle](self, "handle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SYDocumentSenderHandleKey"));

}

- (SYDocumentSender)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  SYDocumentSender *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentSenderNameKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentSenderHandleKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[SYDocumentSender initWithName:handle:](self, "initWithName:handle:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSString)preferredFormattedName
{
  return (NSString *)-[SYDocumentSender formattedNameWithStyle:](self, "formattedNameWithStyle:", 1);
}

- (id)formattedNameWithStyle:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v5, "setStyle:", a3);
  -[SYDocumentSender name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personNameComponentsFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "stringFromPersonNameComponents:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SYDocumentSender formattedNameWithStyle:].cold.2(self);

    -[SYDocumentSender name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      -[SYDocumentSender name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        -[SYDocumentSender name](self, "name");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {

    }
    v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SYDocumentSender formattedNameWithStyle:].cold.1(self);

    -[SYDocumentSender handle](self, "handle");
    v8 = objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v16 = (void *)v8;

  return v16;
}

- (id)personNameComponentsFormattedWithStyle:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v5, "setStyle:", a3);
  -[SYDocumentSender name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personNameComponentsFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)formattedNameWithStyle:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Have to fallback to handle. Name was empty or nil: %{private}@, style: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)formattedNameWithStyle:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Unable to get person name components from string: %{private}@, style: %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

@end
