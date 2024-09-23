@implementation TRIRolloutDeploymentRefStore

- (TRIRolloutDeploymentRefStore)initWithServerContext:(id)a3
{
  id v5;
  TRIRolloutDeploymentRefStore *v6;
  TRIRolloutDeploymentRefStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRolloutDeploymentRefStore;
  v6 = -[TRIRolloutDeploymentRefStore init](&v9, sel_init);
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
  void *v21;
  uint64_t v23;

  v4 = a3;
  v5 = [TRINamespaceResolverStorage alloc];
  -[TRIServerContext paths](self->_context, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TRINamespaceResolverStorage initWithPaths:](v5, "initWithPaths:", v6);

  -[TRINamespaceResolverStorage parentDirForRolloutDeployments](v7, "parentDirForRolloutDeployments");
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
      v23 = -1;
      v14 = 0;
      if (objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v16, 10, &v23)
        && (v23 & 0x8000000000000000) == 0
        && v23 <= 0x7FFFFFFF)
      {
        v17 = objc_alloc(MEMORY[0x1E0DC0B60]);
        v18 = (void *)objc_msgSend(v17, "initWithRolloutId:deploymentId:", v15, v23);
        -[TRIServerContext rolloutDatabase](self->_context, "rolloutDatabase");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "recordWithDeployment:usingTransaction:", v18, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v20, "activeFactorPackSetId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v21 != 0;

        }
        else
        {
          v14 = 0;
        }

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
