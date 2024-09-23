@implementation TRINamespaceDescriptorSetExternalRefStore

- (TRINamespaceDescriptorSetExternalRefStore)initWithServerContext:(id)a3
{
  id v5;
  TRINamespaceDescriptorSetExternalRefStore *v6;
  TRINamespaceDescriptorSetExternalRefStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceDescriptorSetExternalRefStore;
  v6 = -[TRINamespaceDescriptorSetExternalRefStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)hasReferenceToPath:(id)a3
{
  id v4;
  TRINamespaceDescriptorSetStorage *v5;
  void *v6;
  TRINamespaceDescriptorSetStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  v5 = [TRINamespaceDescriptorSetStorage alloc];
  -[TRIServerContext paths](self->_context, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TRINamespaceDescriptorSetStorage initWithPaths:](v5, "initWithPaths:", v6);

  -[TRINamespaceDescriptorSetStorage parentDirForNamespaceDescriptorSets](v7, "parentDirForNamespaceDescriptorSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "triStringByResolvingSymlinksInPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triStringByResolvingSymlinksInPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hasPrefix:", v11);

  if (v12)
  {
    objc_msgSend(v4, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && objc_msgSend(v13, "triIsPathSafePlausibleUniqueId"))
    {
      -[TRIServerContext experimentDatabase](self->_context, "experimentDatabase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasRecordReferencingTreatmentId:withReferenceType:", v14, 3);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
