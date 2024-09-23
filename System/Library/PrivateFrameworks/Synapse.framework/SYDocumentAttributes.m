@implementation SYDocumentAttributes

+ (id)documentAttributesFromData:(id)a3
{
  return (id)objc_msgSend(a1, "documentAttributesFromData:error:", a3, 0);
}

+ (id)documentAttributesForFileAtURL:(id)a3
{
  return (id)objc_msgSend(a1, "documentAttributesForFileAtURL:error:", a3, 0);
}

void __70__SYDocumentAttributes_Reading__documentAttributesForFileAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)documentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__SYDocumentAttributes_Reading__documentAttributesForFileAtURL_error___block_invoke;
  v12[3] = &unk_1E757B788;
  v14 = &v22;
  v15 = &v16;
  v8 = v7;
  v13 = v8;
  objc_msgSend(a1, "fetchDocumentAttributesForFileAtURL:completion:", v6, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v9 = (void *)v17[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

+ (id)documentAttributesFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (!v8)
    {
      v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[SYDocumentAttributes documentAttributesFromData:error:].cold.1((objc_class *)a1, (uint64_t)v9, v10);

      if (a4 && v9)
        *a4 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)saveToFileURL:(id)a3 error:(id *)a4
{
  return -[SYDocumentAttributes saveToFileURL:additionalAttributes:error:](self, "saveToFileURL:additionalAttributes:error:", a3, 0, a4);
}

- (BOOL)saveToFileURL:(id)a3 additionalAttributes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = dispatch_semaphore_create(0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_error___block_invoke;
  v15[3] = &unk_1E757B558;
  v17 = &v18;
  v11 = v10;
  v16 = v11;
  -[SYDocumentAttributes saveToFileURL:additionalAttributes:completion:](self, "saveToFileURL:additionalAttributes:completion:", v8, v9, v15);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = (void *)v19[5];
  if (a5 && v12)
  {
    *a5 = objc_retainAutorelease(v12);
    v12 = (void *)v19[5];
  }
  v13 = v12 == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __74__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)saveToFileURL:(id)a3 additionalAttributes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD, _QWORD);
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("fileURL must not be nil"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke;
  v26[3] = &unk_1E757B338;
  v12 = v10;
  v27 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCFF08C](v26);
  v25 = 0;
  -[SYDocumentAttributes dataRepresentationWithError:](self, "dataRepresentationWithError:", &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  if (v14)
  {
    v28[0] = CFSTR("com.apple.synapse:DocumentAttributes");
    v28[1] = CFSTR("SYDocumentRelatedUniqueIdentifierKey");
    v29[0] = v14;
    -[SYDocumentAttributes indexKey](self, "indexKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v18 = (void *)objc_msgSend(v17, "mutableCopy");
      objc_msgSend(v18, "addEntriesFromDictionary:", v9);
      v19 = objc_msgSend(v18, "copy");

      v17 = (void *)v19;
    }
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_8;
    v22[3] = &unk_1E757B580;
    v23 = v8;
    v24 = v13;
    +[SYFileExtendedAttributes setPrivateAttributes:forFileURL:completion:](SYFileExtendedAttributes, "setPrivateAttributes:forFileURL:completion:", v17, v23, v22);

  }
  else
  {
    v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SYDocumentAttributes(Writing) saveToFileURL:additionalAttributes:completion:].cold.1((uint64_t)v15, v20);

    ((void (**)(_QWORD, id))v13)[2](v13, v15);
  }

}

uint64_t __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_8_cold_1(a1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)removeDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "_removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:error:", a3, 0, a4);
}

+ (BOOL)_removeDocumentAttributesForFileAtURL:(id)a3 keepDocumentRelatedUniqueIdentifierKey:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  dispatch_semaphore_t v9;
  os_log_t v10;
  void *v11;
  BOOL v12;
  _QWORD v14[4];
  os_log_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = dispatch_semaphore_create(0);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __116__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_error___block_invoke;
    v14[3] = &unk_1E757B5A8;
    v16 = &v24;
    v17 = &v18;
    v10 = v9;
    v15 = v10;
    +[SYDocumentAttributes _removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:completion:]((uint64_t)a1, v8, v6, v14);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (a5)
    {
      v11 = (void *)v19[5];
      if (v11)
        *a5 = objc_retainAutorelease(v11);
    }
    v12 = *((_BYTE *)v25 + 24) != 0;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SYDocumentAttributes(Writing) _removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:error:].cold.1(v10);
    v12 = 0;
  }

  return v12;
}

void __116__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)_removeDocumentAttributesForFileAtURL:(int)a3 keepDocumentRelatedUniqueIdentifierKey:(void *)a4 completion:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_opt_self();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke;
  v22[3] = &unk_1E757B5D0;
  v9 = v7;
  v23 = v9;
  v10 = (void *)MEMORY[0x1BCCFF08C](v22);
  v11 = objc_alloc(MEMORY[0x1E0C99E08]);
  v28[0] = CFSTR("com.apple.synapse:DocumentAttributes");
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = CFSTR("SYDocumentRelatedUniqueIdentifierKey");
  v29[0] = v12;
  v29[1] = &stru_1E757CA18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithDictionary:", v13);

  if (a3)
    objc_msgSend(v14, "removeObjectForKey:", CFSTR("SYDocumentRelatedUniqueIdentifierKey"));
  v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v25 = v16;
    v26 = 1024;
    v27 = a3;
    _os_log_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_INFO, "Removing document attributes from file path: %{private}@, keepRelatedUniqueId: %{BOOL}d", buf, 0x12u);

  }
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_14;
  v19[3] = &unk_1E757B580;
  v20 = v6;
  v21 = v10;
  v17 = v10;
  v18 = v6;
  +[SYFileExtendedAttributes setPrivateAttributes:forFileURL:completion:](SYFileExtendedAttributes, "setPrivateAttributes:forFileURL:completion:", v14, v18, v19);

}

uint64_t __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_14_cold_1(a1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)initWithSourceBundleIdentifier:(uint64_t)a3 indexKey:(uint64_t)a4 fileURL:(uint64_t)a5 receivedDate:(uint64_t)a6 sender:
{
  if (a1)
    return (void *)objc_msgSend(a1, "initWithSourceBundleIdentifier:indexKey:originalFileURL:receivedDate:sender:", a2, a3, a4, a5, a6);
  return a1;
}

- (SYDocumentAttributes)initWithSourceBundleIdentifier:(id)a3 indexKey:(id)a4 originalFileURL:(id)a5 receivedDate:(id)a6 sender:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SYDocumentAttributes *v17;
  uint64_t v18;
  NSString *sourceBundleIdentifier;
  uint64_t v20;
  NSString *indexKey;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SYDocumentAttributes;
  v17 = -[SYDocumentAttributes init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    sourceBundleIdentifier = v17->_sourceBundleIdentifier;
    v17->_sourceBundleIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    indexKey = v17->_indexKey;
    v17->_indexKey = (NSString *)v20;

    objc_storeStrong((id *)&v17->_originalFileURL, a5);
    objc_storeStrong((id *)&v17->_receivedDate, a6);
    objc_storeStrong((id *)&v17->_sender, a7);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SYDocumentAttributes sourceBundleIdentifier](self, "sourceBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SYDocumentAttributeSourceBundleIdentifierKey"));

  -[SYDocumentAttributes indexKey](self, "indexKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SYDocumentAttributeIndexKey"));

  -[SYDocumentAttributes originalFileURL](self, "originalFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SYDocumentAttributeFileURLKey"));

  -[SYDocumentAttributes receivedDate](self, "receivedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("SYDocumentAttributesReceivedDateKey"));

  -[SYDocumentAttributes sender](self, "sender");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("SYDocumentAttributeSenderKey"));

}

- (SYDocumentAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SYDocumentAttributes *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentAttributeSourceBundleIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentAttributeIndexKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentAttributeFileURLKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentAttributesReceivedDateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDocumentAttributeSenderKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = 0;
  if (v5 && v6 && v7 && v11 && v12)
  {
    self = -[SYDocumentAttributes initWithSourceBundleIdentifier:indexKey:originalFileURL:receivedDate:sender:](self, "initWithSourceBundleIdentifier:indexKey:originalFileURL:receivedDate:sender:", v5, v6, v7, v11, v12);
    v14 = self;
  }

  return v14;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)indexKey
{
  return self->_indexKey;
}

- (NSURL)originalFileURL
{
  return self->_originalFileURL;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (SYDocumentSender)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_originalFileURL, 0);
  objc_storeStrong((id *)&self->_indexKey, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

+ (void)fetchDocumentAttributesForFileAtURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("fileURL must not be nil"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke;
  v15[3] = &unk_1E757B7B0;
  v16 = v6;
  v8 = v6;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2;
  v12[3] = &unk_1E757B7D8;
  v13 = v5;
  v14 = (id)MEMORY[0x1BCCFF08C](v15);
  v9 = v14;
  v10 = v5;
  +[SYFileExtendedAttributes fetchPrivateAttributesForFileURL:completion:](SYFileExtendedAttributes, "fetchPrivateAttributesForFileURL:completion:", v10, v12);

}

uint64_t __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "objectForKey:", CFSTR("com.apple.synapse:DocumentAttributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_3();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "length"))
        {
          v14 = 0;
          +[SYDocumentAttributes documentAttributesFromData:error:](SYDocumentAttributes, "documentAttributesFromData:error:", v6, &v14);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v14;
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_20:
          goto LABEL_21;
        }
        v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_4();
      }
      else
      {
        v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_5();
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "isFileReferenceURL");
  v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
      __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_1();
  }
  else if (v13)
  {
    __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_2();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_21:

}

void __79__SYDocumentAttributes_Writing__saveToFileURL_additionalAttributes_completion___block_invoke_8_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Unable to write document attributes to: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __121__SYDocumentAttributes_Writing___removeDocumentAttributesForFileAtURL_keepDocumentRelatedUniqueIdentifierKey_completion___block_invoke_14_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Unable to remove document attributes from file path: %{private}@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

+ (void)documentAttributesFromData:(NSObject *)a3 error:.cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_ERROR, "Unable to init '%@' from data, error: %@", (uint8_t *)&v6, 0x16u);

}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*v0, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BCC38000, v2, v3, "No private attributes at URL: %{public}@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_2()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BCC38000, v2, v3, "No private attributes at URL: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*(id *)(v0 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "No private attributes data at URL: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*(id *)(v0 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Found empty private attributes data at URL: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __80__SYDocumentAttributes_Reading__fetchDocumentAttributesForFileAtURL_completion___block_invoke_2_cold_5()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*(id *)(v0 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Unexpected private attributes data type at URL: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

@end
