@implementation _UIDocumentPickerNSURLWrapper

+ (id)wrapperWithURL:(id)a3
{
  return (id)objc_msgSend(a1, "wrapperWithURL:readonly:", a3, 0);
}

+ (id)wrapperWithURL:(id)a3 readonly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _UIDocumentPickerNSURLWrapper *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+UIDocumentPicker.m"), 324, CFSTR("tried to create wrapper with nil url"));

  }
  v7 = objc_alloc_init(_UIDocumentPickerNSURLWrapper);
  -[_UIDocumentPickerNSURLWrapper setUrl:](v7, "setUrl:", v6);
  v8 = (void *)_CFURLPromiseCopyPhysicalURL();
  if ((objc_msgSend(v6, "isEqual:", v8) & 1) == 0)
    -[_UIDocumentPickerNSURLWrapper setPromiseURL:](v7, "setPromiseURL:", v8);
  v9 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
  v10 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
  v11 = (uint64_t *)MEMORY[0x1E0C80000];
  if (!v4)
    v11 = (uint64_t *)MEMORY[0x1E0C80008];
  v12 = *v11;
  v13 = CFSTR("read-write");
  if (v4)
    v13 = CFSTR("read-only");
  v14 = v13;
  v27 = 0;
  objc_msgSend(v6, "ui_issueSandboxExtensionOfClass:error:", v12, &v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v27;
  -[_UIDocumentPickerNSURLWrapper setScope:](v7, "setScope:", v15);

  -[_UIDocumentPickerNSURLWrapper scope](v7, "scope");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+UIDocumentPicker.m"), 339, CFSTR("Could not issue %@ sandbox extension (%@)."), v14, v16);

    if (v8)
      goto LABEL_11;
LABEL_17:
    v19 = v16;
    if (v9)
      goto LABEL_18;
    goto LABEL_13;
  }
  if (!v8)
    goto LABEL_17;
LABEL_11:
  v26 = v16;
  objc_msgSend(v8, "ui_issueSandboxExtensionOfClass:error:", v12, &v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v26;

  -[_UIDocumentPickerNSURLWrapper setPromiseScope:](v7, "setPromiseScope:", v18);
  -[_UIDocumentPickerNSURLWrapper scope](v7, "scope");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (!v9)
      goto LABEL_13;
LABEL_18:
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");
    if (!v10)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+UIDocumentPicker.m"), 342, CFSTR("Could not issue %@ sandbox extension (%@)."), v14, v19);

  if (v9)
    goto LABEL_18;
LABEL_13:
  if (v10)
LABEL_14:
    objc_msgSend(v8, "stopAccessingSecurityScopedResource");
LABEL_15:

  return v7;
}

+ (id)wrapperForExportWithURL:(id)a3 error:(id *)a4
{
  id v5;
  _UIDocumentPickerNSURLWrapper *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIDocumentPickerNSURLWrapper *v12;

  v5 = a3;
  v6 = objc_alloc_init(_UIDocumentPickerNSURLWrapper);
  -[_UIDocumentPickerNSURLWrapper setUrl:](v6, "setUrl:", v5);
  -[_UIDocumentPickerNSURLWrapper url](v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ui_issueReadSandboxExtensionWithError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerNSURLWrapper setScope:](v6, "setScope:", v8);

  -[_UIDocumentPickerNSURLWrapper scope](v6, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)_CFURLPromiseCopyPhysicalURL();
    if (!v10)
      goto LABEL_5;
    if ((objc_msgSend(v5, "isEqual:", v10) & 1) != 0)
      goto LABEL_5;
    -[_UIDocumentPickerNSURLWrapper setPromiseURL:](v6, "setPromiseURL:", v10);
    objc_msgSend(v10, "ui_issueReadSandboxExtensionWithError:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerNSURLWrapper setPromiseScope:](v6, "setPromiseScope:", v11);

    -[_UIDocumentPickerNSURLWrapper promiseScope](v6, "promiseScope");
    v12 = (_UIDocumentPickerNSURLWrapper *)objc_claimAutoreleasedReturnValue();

    if (v12)
LABEL_5:
      v12 = v6;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIDocumentPickerNSURLWrapper url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("NSURL"));

  -[_UIDocumentPickerNSURLWrapper scope](self, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("NSURLScope"));

  -[_UIDocumentPickerNSURLWrapper promiseURL](self, "promiseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIDocumentPickerNSURLWrapper promiseURL](self, "promiseURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("NSPromise"));

    -[_UIDocumentPickerNSURLWrapper promiseScope](self, "promiseScope");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("NSPromiseScope"));

  }
}

+ (void)assembleURL:(id)a3 sandbox:(id)a4 physicalURL:(id)a5 physicalSandbox:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v12)
  {
    if (v9)
      MEMORY[0x186DC87D0](v12, v9);
    if (v10 && v11)
      MEMORY[0x186DC87D0](v10, v11);
    _CFURLPromiseSetPhysicalURL();
  }

}

- (_UIDocumentPickerNSURLWrapper)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPromise"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURLScope"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPromiseScope"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "assembleURL:sandbox:physicalURL:physicalSandbox:", v6, v8, v7, v9);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSURL+UIDocumentPicker.m"), 420, CFSTR("tried to unarchive a wrapper with nil url"));

  }
  -[_UIDocumentPickerNSURLWrapper setUrl:](self, "setUrl:", v6);

  return self;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)promiseURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPromiseURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)scope
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScope:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)promiseScope
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPromiseScope:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_promiseURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
