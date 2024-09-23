@implementation TRITreatmentInfo

- (TRITreatmentInfo)initWithPaths:(id)a3
{
  id v5;
  TRITreatmentInfo *v6;
  TRITreatmentInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRITreatmentInfo;
  v6 = -[TRITreatmentInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    v7->_deploymentId = -1;
  }

  return v7;
}

- (id)_treatmentBasePath
{
  return (id)-[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
}

- (id)baseUrlForTreatmentsWithNamespaceName:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceIdFromName:", v5);
  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0C99E98];
  -[TRITreatmentInfo _treatmentBasePath](self, "_treatmentBasePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPathComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITreatmentInfo.m"), 50, CFSTR("base URL for treatments with namespace %@ is nil"), v5);

  }
  return v12;
}

- (id)baseUrlForTreatment:(id)a3 namespaceName:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a3;
  -[TRITreatmentInfo baseUrlForTreatmentsWithNamespaceName:](self, "baseUrlForTreatmentsWithNamespaceName:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITreatmentInfo.m"), 57, CFSTR("baseUrlForTreatment is nil"));

  }
  return v9;
}

+ (id)loadInfoForTreatment:(id)a3 namespaceName:(id)a4 paths:(id)a5
{
  id v7;
  id v8;
  id v9;
  TRITreatmentInfo *v10;
  TRITreatmentInfo *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TRITreatmentInfo initWithPaths:]([TRITreatmentInfo alloc], "initWithPaths:", v7);

  -[TRITreatmentInfo setTreatmentId:](v10, "setTreatmentId:", v9);
  -[TRITreatmentInfo setNamespaceName:](v10, "setNamespaceName:", v8);

  if (-[TRITreatmentInfo load](v10, "load"))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)treatmentDirectory
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TRITreatmentInfo treatmentId](self, "treatmentId");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[TRITreatmentInfo namespaceName](self, "namespaceName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[TRITreatmentInfo treatmentId](self, "treatmentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentInfo namespaceName](self, "namespaceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentInfo baseUrlForTreatment:namespaceName:](self, "baseUrlForTreatment:namespaceName:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)urlWithDir:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99E98];
  v9[0] = a3;
  v9[1] = CFSTR("info.plist");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPathComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)url
{
  void *v3;
  void *v4;
  void *v5;

  -[TRITreatmentInfo treatmentDirectory](self, "treatmentDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentInfo urlWithDir:](self, "urlWithDir:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)loadFromUrl:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", a3, &v19);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v19;
    v6 = v5;
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 0;
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentInfo setExperimentId:](self, "setExperimentId:", v9);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deploymentId"));
      v10 = objc_claimAutoreleasedReturnValue();
      v12 = v10;
      if (v10)
        v11 = -[NSObject intValue](v10, "intValue");
      else
        v11 = 0xFFFFFFFFLL;
      -[TRITreatmentInfo setDeploymentId:](self, "setDeploymentId:", v11);
    }
    else
    {
      TRILogCategory_ClientFramework();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[TRITreatmentInfo namespaceName](self, "namespaceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentInfo treatmentId](self, "treatmentId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v6;
        _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "could not load treatment info for namespace %@ with treatment id %@ -- %@", buf, 0x20u);

      }
    }

  }
  else
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentInfo namespaceName](self, "namespaceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentInfo treatmentId](self, "treatmentId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "could not load treatment info for namespace %@ with treatment id %@ -- path is nil", buf, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)load
{
  TRITreatmentInfo *v2;
  void *v3;

  v2 = self;
  -[TRITreatmentInfo url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[TRITreatmentInfo loadFromUrl:](v2, "loadFromUrl:", v3);

  return (char)v2;
}

- (BOOL)saveToDir:(id)a3
{
  TRITreatmentInfo *v3;
  void *v4;

  v3 = self;
  -[TRITreatmentInfo urlWithDir:](self, "urlWithDir:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TRITreatmentInfo saveToUrl:](v3, "saveToUrl:", v4);

  return (char)v3;
}

- (BOOL)save
{
  TRITreatmentInfo *v2;
  void *v3;

  v2 = self;
  -[TRITreatmentInfo url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[TRITreatmentInfo saveToUrl:](v2, "saveToUrl:", v3);

  return (char)v2;
}

- (id)infoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TRITreatmentInfo experimentId](self, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[TRITreatmentInfo experimentId](self, "experimentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("experimentId"));

    if (-[TRITreatmentInfo deploymentId](self, "deploymentId") < 0)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("deploymentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRITreatmentInfo deploymentId](self, "deploymentId"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deploymentId"));

    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v4;
}

- (BOOL)saveToUrl:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITreatmentInfo.m"), 141, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

    }
    v26 = 0;
    objc_msgSend(v6, "triCreateDirectoryForPath:isDirectory:error:", v7, 0, &v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v26;

    if (!v8)
    {
      TRILogCategory_ClientFramework();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[TRITreatmentInfo namespaceName](self, "namespaceName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentInfo treatmentId](self, "treatmentId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v28 = v22;
        v29 = 2112;
        v30 = v23;
        v31 = 2112;
        v32 = v5;
        v33 = 2112;
        v34 = v9;
        _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "failed to create directory to save treatment info for namespace %@ with treatment id %@ to path %@ -- %@", buf, 0x2Au);

      }
      v15 = 0;
      v12 = v9;
      goto LABEL_19;
    }
    -[TRITreatmentInfo infoDictionary](self, "infoDictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v25 = v9;
    v11 = -[NSObject writeToURL:error:](v10, "writeToURL:error:", v5, &v25);
    v12 = v25;

    if ((v11 & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3620];
      objc_msgSend(v5, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_msgSend(v13, "triRemoveFileProtectionIfPresentForPath:", v14);

      if ((v13 & 1) != 0)
      {
        v15 = 1;
LABEL_19:

        goto LABEL_20;
      }
      TRILogCategory_ClientFramework();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v5;
        _os_log_error_impl(&dword_19B89C000, v16, OS_LOG_TYPE_ERROR, "Failed to remove file protection from info.plist at %@", buf, 0xCu);
      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[TRITreatmentInfo namespaceName](self, "namespaceName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentInfo treatmentId](self, "treatmentId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v28 = v17;
        v29 = 2112;
        v30 = v18;
        v31 = 2112;
        v32 = v5;
        v33 = 2112;
        v34 = v12;
        _os_log_error_impl(&dword_19B89C000, v16, OS_LOG_TYPE_ERROR, "could save treatment info for namespace %@ with treatment id %@ to path %@ -- %@", buf, 0x2Au);

      }
    }

    v15 = 0;
    goto LABEL_19;
  }
  TRILogCategory_ClientFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[TRITreatmentInfo namespaceName](self, "namespaceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentInfo treatmentId](self, "treatmentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v20;
    v29 = 2112;
    v30 = v21;
    _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "could save treatment info for namespace %@ with treatment id %@ -- path is nil", buf, 0x16u);

  }
  v15 = 0;
LABEL_20:

  return v15;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setNamespaceName:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceName, a3);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(int)a3
{
  self->_deploymentId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
