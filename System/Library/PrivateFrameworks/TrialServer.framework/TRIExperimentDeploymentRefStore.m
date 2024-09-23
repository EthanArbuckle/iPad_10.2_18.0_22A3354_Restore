@implementation TRIExperimentDeploymentRefStore

- (TRIExperimentDeploymentRefStore)initWithServerContext:(id)a3
{
  id v5;
  TRIExperimentDeploymentRefStore *v6;
  TRIExperimentDeploymentRefStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIExperimentDeploymentRefStore;
  v6 = -[TRIExperimentDeploymentRefStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)hasReferenceToPath:(id)a3
{
  id v4;
  TRINamespaceResolverStorage *v5;
  void *v6;
  TRINamespaceResolverStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v4 = a3;
  v5 = [TRINamespaceResolverStorage alloc];
  -[TRIServerContext paths](self->_context, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TRINamespaceResolverStorage initWithPaths:](v5, "initWithPaths:", v6);

  -[TRINamespaceResolverStorage parentDirForExperimentDeployments](v7, "parentDirForExperimentDeployments");
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
    objc_msgSend(v4, "pathComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -1;
      v14 = 0;
      if (objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v16, 10, &v22)
        && (v22 & 0x8000000000000000) == 0
        && v22 <= 0x7FFFFFFF)
      {
        v17 = objc_alloc(MEMORY[0x1E0DC0A30]);
        v18 = (void *)objc_msgSend(v17, "initWithExperimentId:deploymentId:", v15, v22);
        -[TRIServerContext experimentDatabase](self->_context, "experimentDatabase");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "experimentRecordWithExperimentDeployment:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          v14 = objc_msgSend(v20, "status") == 1;
        else
          v14 = 0;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
