@implementation SSDownloadManifestResponse

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManifestResponse;
  -[SSDownloadManifestResponse dealloc](&v3, sel_dealloc);
}

- (NSArray)validDownloads
{
  return self->_validDownloads;
}

- (void)setValidDownloads:(id)a3
{
  NSArray *validDownloads;

  validDownloads = self->_validDownloads;
  if (validDownloads != a3)
  {

    self->_validDownloads = (NSArray *)a3;
  }
}

- (SSDownloadManifestResponse)initWithCoder:(id)a3
{
  SSDownloadManifestResponse *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSDownloadManifestResponse.m"), 41, CFSTR("Only keyed coding is supported"));
  v10.receiver = self;
  v10.super_class = (Class)SSDownloadManifestResponse;
  v6 = -[SSDownloadManifestResponse init](&v10, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v6->_validDownloads = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("valid"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSDownloadManifestResponse.m"), 49, CFSTR("Only keyed coding is supported"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_validDownloads, CFSTR("valid"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  xpc_object_t v4;
  NSArray *validDownloads;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = xpc_array_create(0, 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  validDownloads = self->_validDownloads;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](validDownloads, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(validDownloads);
        xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "persistentIdentifier"));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](validDownloads, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  xpc_dictionary_set_value(v3, "valid", v4);
  xpc_release(v4);
  return v3;
}

- (SSDownloadManifestResponse)initWithXPCEncoding:(id)a3
{
  SSDownloadManifestResponse *v5;
  id v7;
  xpc_object_t value;
  void *v9;
  _QWORD applier[5];
  objc_super v11;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v11.receiver = self;
    v11.super_class = (Class)SSDownloadManifestResponse;
    v5 = -[SSDownloadManifestResponse init](&v11, sel_init);
    if (v5)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      value = xpc_dictionary_get_value(a3, "valid");
      if (value)
      {
        v9 = value;
        if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812C8])
        {
          applier[0] = MEMORY[0x1E0C809B0];
          applier[1] = 3221225472;
          applier[2] = __50__SSDownloadManifestResponse_initWithXPCEncoding___block_invoke;
          applier[3] = &unk_1E47B9F50;
          applier[4] = v7;
          xpc_array_apply(v9, applier);
        }
      }
      v5->_validDownloads = (NSArray *)objc_msgSend(v7, "copy");

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t __50__SSDownloadManifestResponse_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  SSDownload *v5;

  if (MEMORY[0x1A85863E4](a3) == MEMORY[0x1E0C81328])
  {
    v5 = -[SSDownload initWithPersistentIdentifier:]([SSDownload alloc], "initWithPersistentIdentifier:", xpc_int64_get_value(a3));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  return 1;
}

@end
