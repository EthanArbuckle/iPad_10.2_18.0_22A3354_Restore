@implementation TRINamespaceDescriptorProvider

+ (id)providerWithNamespaceDatabase:(id)a3 defaultDescriptorDirectoryPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v7, v6);

  return v8;
}

- (TRINamespaceDescriptorProvider)initWithNamespaceDatabase:(id)a3 defaultDescriptorDirectoryPath:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRINamespaceDescriptorProvider *v11;
  TRINamespaceDescriptorProvider *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDescriptorProvider.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceDatabase"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDescriptorProvider.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptorDirectory"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRINamespaceDescriptorProvider;
  v11 = -[TRINamespaceDescriptorProvider init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_namespaceDatabase, a3);
    objc_storeStrong((id *)&v12->_descriptorDirectory, a4);
  }

  return v12;
}

- (id)descriptorWithNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC0AD8], "loadWithNamespaceName:fromDirectory:", v4, self->_descriptorDirectory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[TRINamespaceDatabase dynamicNamespaceRecordWithNamespaceName:](self->_namespaceDatabase, "dynamicNamespaceRecordWithNamespaceName:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[TRINamespaceDescriptorProvider _descriptorFromDynamicNamespaceRecord:](TRINamespaceDescriptorProvider, "_descriptorFromDynamicNamespaceRecord:", v8);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)enumerateDefaultDescriptorsWithBlock:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DC0AD8], "enumerateDescriptorsInDirectory:block:", self->_descriptorDirectory, a3);
}

- (id)_dynamicDescriptorsForContainer:(int)a3 teamId:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  TRINamespaceDatabase *namespaceDatabase;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  namespaceDatabase = self->_namespaceDatabase;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__TRINamespaceDescriptorProvider__dynamicDescriptorsForContainer_teamId___block_invoke;
  v13[3] = &unk_1E93304D0;
  v14 = v7;
  v9 = v7;
  LODWORD(v4) = -[TRINamespaceDatabase enumerateDynamicNamespaceRecordsForContainer:teamId:block:](namespaceDatabase, "enumerateDynamicNamespaceRecordsForContainer:teamId:block:", v4, v6, v13);

  if ((_DWORD)v4)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

void __73__TRINamespaceDescriptorProvider__dynamicDescriptorsForContainer_teamId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "appContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fetchStatus");

  if (v4 != 2)
  {
    v5 = *(void **)(a1 + 32);
    +[TRINamespaceDescriptorProvider _descriptorFromDynamicNamespaceRecord:](TRINamespaceDescriptorProvider, "_descriptorFromDynamicNamespaceRecord:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

+ (id)_descriptorFromDynamicNamespaceRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "defaultsFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFactorsURL:", v5);

  objc_msgSend(v3, "appContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppContainer:", v6);

  objc_msgSend(v4, "setCloudKitContainerId:", objc_msgSend(v3, "cloudKitContainer"));
  v7 = objc_alloc(MEMORY[0x1E0DC0AD8]);
  objc_msgSend(v3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "compatibilityVersion");

  v10 = (void *)objc_msgSend(v7, "initWithNamespaceName:downloadNCV:optionalParams:", v8, v9, v4);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptorDirectory, 0);
  objc_storeStrong((id *)&self->_namespaceDatabase, 0);
}

@end
