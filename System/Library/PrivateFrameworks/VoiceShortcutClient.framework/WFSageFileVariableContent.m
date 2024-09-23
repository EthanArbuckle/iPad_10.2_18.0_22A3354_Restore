@implementation WFSageFileVariableContent

- (WFSageFileVariableContent)initWithName:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  WFSageFileVariableContent *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSURL *fileURL;
  WFSageFileVariableContent *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFSageFileVariableContent;
  v8 = -[WFSageFileVariableContent init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    fileURL = v8->_fileURL;
    v8->_fileURL = (NSURL *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFSageFileVariableContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  WFSageFileVariableContent *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", getFPSandboxingURLWrapperClass(), CFSTR("fileURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFSageFileVariableContent initWithName:fileURL:](self, "initWithName:fileURL:", v5, v8);

    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id FPSandboxingURLWrapperClass;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
  -[WFSageFileVariableContent fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(FPSandboxingURLWrapperClass, "wrapperWithURL:readonly:error:", v6, 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    -[WFSageFileVariableContent name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("name"));

    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fileURL"));
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      -[WFSageFileVariableContent fileURL](self, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v16 = "-[WFSageFileVariableContent encodeWithCoder:]";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_FAULT, "%s Can't sandbox extend %@, encoding %@ failed: %@", buf, 0x2Au);

    }
  }

}

- (NSString)name
{
  return self->_name;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
