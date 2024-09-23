@implementation TRIFactorPackSetExternalReferenceStore

- (TRIFactorPackSetExternalReferenceStore)initWithServerContext:(id)a3
{
  id v5;
  TRIFactorPackSetExternalReferenceStore *v6;
  TRIFactorPackSetExternalReferenceStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFactorPackSetExternalReferenceStore;
  v6 = -[TRIFactorPackSetExternalReferenceStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)hasReferenceToPath:(id)a3
{
  id v4;
  TRIFactorPackSetStorage *v5;
  void *v6;
  TRIFactorPackSetStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  char v19;

  v4 = a3;
  v5 = [TRIFactorPackSetStorage alloc];
  -[TRIServerContext paths](self->_context, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TRIFactorPackSetStorage initWithPaths:](v5, "initWithPaths:", v6);

  -[TRIFactorPackSetStorage parentDirForFactorPackSets](v7, "parentDirForFactorPackSets");
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
    TRIValidateFactorPackSetId();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[TRIServerContext rolloutDatabase](self->_context, "rolloutDatabase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasRecordReferencingFactorPackSetId:withReferenceType:", v14, 3);

      if (_os_feature_enabled_impl())
      {
        -[TRIServerContext experimentDatabase](self->_context, "experimentDatabase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hasRecordReferencingFactorPackSetId:withReferenceType:", v14, 3);

      }
      else
      {
        v18 = 0;
      }
      v19 = v16 | v18;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
