@implementation SYDocument

- (SYDocument)initWithFileURL:(id)a3
{
  return -[SYDocument initWithFileURL:error:](self, "initWithFileURL:error:", a3, 0);
}

- (SYDocument)initWithFileURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  SYDocument *v9;
  NSObject *v10;
  id v12;

  v6 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v6, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    self = -[SYDocument initWithURLWrapper:](self, "initWithURLWrapper:", v7);
    v9 = self;
  }
  else
  {
    v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SYDocument initWithFileURL:error:].cold.1((uint64_t)v6, (uint64_t)v8, v10);

    v9 = 0;
    if (a4 && v8)
    {
      v9 = 0;
      *a4 = objc_retainAutorelease(v8);
    }
  }

  return v9;
}

- (SYDocument)initWithURLWrapper:(id)a3
{
  id v5;
  SYDocument *v6;
  SYDocument *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYDocument;
  v6 = -[SYDocument init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_urlWrapper, a3);

  return v7;
}

- (NSURL)fileURL
{
  return (NSURL *)-[FPSandboxingURLWrapper url](self->_urlWrapper, "url");
}

- (id)documentAttributesWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[SYDocument fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYDocumentAttributes documentAttributesForFileAtURL:error:](SYDocumentAttributes, "documentAttributesForFileAtURL:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setDocumentAttributes:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v6 = a3;
  -[SYDocument fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = objc_msgSend(v6, "saveToFileURL:error:", v7, a4);
  else
    v8 = +[SYDocumentAttributes removeDocumentAttributesForFileAtURL:error:](SYDocumentAttributes, "removeDocumentAttributesForFileAtURL:error:", v7, a4);
  v9 = v8;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_urlWrapper, CFSTR("SYDocumentFileURLWrapperKey"));
}

- (SYDocument)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SYDocument *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentFileURLWrapperKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SYDocument initWithURLWrapper:](self, "initWithURLWrapper:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)documentFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = a3;
    v9 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (!v5)
    {
      v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[SYDocument documentFromData:].cold.1((uint64_t)v6, v7);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlWrapper, 0);
}

- (void)initWithFileURL:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Unable to create a sandbox file wrapper for fileURL: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)documentFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Error while trying to init from data, error: %@", (uint8_t *)&v2, 0xCu);
}

@end
