@implementation WFSageObjectVariableContent

- (WFSageObjectVariableContent)initWithName:(id)a3 content:(id)a4 contentClassName:(id)a5
{
  return -[WFSageObjectVariableContent initWithName:content:contentClassName:frameworkPath:](self, "initWithName:content:contentClassName:frameworkPath:", a3, a4, a5, 0);
}

- (WFSageObjectVariableContent)initWithName:(id)a3 content:(id)a4 contentClassName:(id)a5 frameworkPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFSageObjectVariableContent *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *contentClassName;
  uint64_t v20;
  NSString *frameworkPath;
  WFSageObjectVariableContent *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

LABEL_3:
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EEE5D550) & 1) != 0)
  {
    if (v13)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[content conformsToProtocol:@protocol(NSSecureCoding)]"));

    if (v13)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("className"));

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)WFSageObjectVariableContent;
  v15 = -[WFSageObjectVariableContent init](&v28, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    objc_storeStrong((id *)&v15->_content, a4);
    v18 = objc_msgSend(v13, "copy");
    contentClassName = v15->_contentClassName;
    v15->_contentClassName = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    frameworkPath = v15->_frameworkPath;
    v15->_frameworkPath = (NSString *)v20;

    v22 = v15;
  }

  return v15;
}

- (WFSageObjectVariableContent)initWithName:(id)a3 archivedContent:(id)a4 contentClassName:(id)a5 frameworkPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFSageObjectVariableContent *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *contentClassName;
  uint64_t v20;
  NSString *frameworkPath;
  WFSageObjectVariableContent *v22;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("archivedContent"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("className"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)WFSageObjectVariableContent;
  v15 = -[WFSageObjectVariableContent init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    objc_storeStrong((id *)&v15->_archivedContent, a4);
    v18 = objc_msgSend(v13, "copy");
    contentClassName = v15->_contentClassName;
    v15->_contentClassName = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    frameworkPath = v15->_frameworkPath;
    v15->_frameworkPath = (NSString *)v20;

    v22 = v15;
  }

  return v15;
}

- (BOOL)loadContentByTrustingThePayload:(BOOL)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = os_log_create("com.apple.shortcuts", "Sage");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[WFSageObjectVariableContent name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSageObjectVariableContent contentClassName](self, "contentClassName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSageObjectVariableContent frameworkPath](self, "frameworkPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v7;
      v32 = 2112;
      v33 = v8;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1AF681000, v6, OS_LOG_TYPE_DEFAULT, "Decoding variable with name: %@, expected class name: %@, framework path: %@", buf, 0x20u);

    }
    -[WFSageObjectVariableContent frameworkPath](self, "frameworkPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11
      && (-[WFSageObjectVariableContent frameworkPath](self, "frameworkPath"),
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
          v13 = dlopen((const char *)objc_msgSend(v12, "UTF8String"), 0),
          v12,
          !v13))
    {
      if (!a4)
      {
        v21 = 0;
        goto LABEL_15;
      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2FE0];
      v26 = *__error();
      v28 = *MEMORY[0x1E0CB2D50];
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", dlerror(), 4);
      v29 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v26, v20);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = objc_alloc(MEMORY[0x1E0C99E20]);
      v15 = objc_opt_class();
      v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
      -[WFSageObjectVariableContent contentClassName](self, "contentClassName");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", NSClassFromString(v17));

      v18 = (void *)MEMORY[0x1E0CB3710];
      -[WFSageObjectVariableContent archivedContent](self, "archivedContent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v16, v19, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_storeStrong((id *)&self->_content, v20);
        v21 = 1;
      }
      else
      {
        v21 = 0;
      }
    }

LABEL_15:
    return v21;
  }
  if (a4)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2FE0];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("you must trust the payload before loading frameworks it declares in memory");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1, v6);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  return 0;
}

- (WFSageObjectVariableContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFSageObjectVariableContent *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedContent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentClassName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameworkPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFSageObjectVariableContent initWithName:archivedContent:contentClassName:frameworkPath:](self, "initWithName:archivedContent:contentClassName:frameworkPath:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFSageObjectVariableContent name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[WFSageObjectVariableContent contentClassName](self, "contentClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contentClassName"));

  -[WFSageObjectVariableContent frameworkPath](self, "frameworkPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("frameworkPath"));

  -[WFSageObjectVariableContent archivedContent](self, "archivedContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFSageObjectVariableContent archivedContent](self, "archivedContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("archivedContent"));

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB36F8];
    -[WFSageObjectVariableContent content](self, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    if (v12)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("archivedContent"));
    }
    else
    {
      v14 = os_log_create("com.apple.shortcuts", "Sage");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        -[WFSageObjectVariableContent content](self, "content");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v13;
        _os_log_fault_impl(&dword_1AF681000, v14, OS_LOG_TYPE_FAULT, "couldn't encode %@, this sage blob is going to be useless: %@", buf, 0x16u);

      }
    }

  }
}

- (NSSecureCoding)content
{
  return self->_content;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)contentClassName
{
  return self->_contentClassName;
}

- (NSString)frameworkPath
{
  return self->_frameworkPath;
}

- (NSData)archivedContent
{
  return self->_archivedContent;
}

- (void)setArchivedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedContent, 0);
  objc_storeStrong((id *)&self->_frameworkPath, 0);
  objc_storeStrong((id *)&self->_contentClassName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
