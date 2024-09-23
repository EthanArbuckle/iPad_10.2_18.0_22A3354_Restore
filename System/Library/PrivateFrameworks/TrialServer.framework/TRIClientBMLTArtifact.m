@implementation TRIClientBMLTArtifact

- (TRIClientBMLTArtifact)initWithBackgroundTask:(id)a3 populations:(id)a4 deploymentType:(id)a5 deploymentDate:(id)a6 downloadSize:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TRIClientBMLTArtifact *v17;
  TRIClientBMLTArtifact *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backgroundTask != nil"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deploymentType != nil"));

      if (v16)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("populations != nil"));

  if (!v15)
    goto LABEL_10;
LABEL_4:
  if (v16)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deploymentDate != nil"));

LABEL_5:
  v25.receiver = self;
  v25.super_class = (Class)TRIClientBMLTArtifact;
  v17 = -[TRIClientBMLTArtifact init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_backgroundTask, a3);
    objc_storeStrong((id *)&v18->_populations, a4);
    objc_storeStrong((id *)&v18->_deploymentType, a5);
    objc_storeStrong((id *)&v18->_deploymentDate, a6);
    v18->_downloadSize = a7;
  }

  return v18;
}

+ (id)artifactWithBackgroundTask:(id)a3 populations:(id)a4 deploymentType:(id)a5 deploymentDate:(id)a6 downloadSize:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", v15, v14, v13, v12, a7);

  return v16;
}

- (id)copyWithReplacementBackgroundTask:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", v4, self->_populations, self->_deploymentType, self->_deploymentDate, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementPopulations:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", self->_backgroundTask, v4, self->_deploymentType, self->_deploymentDate, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementDeploymentType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", self->_backgroundTask, self->_populations, v4, self->_deploymentDate, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementDeploymentDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", self->_backgroundTask, self->_populations, self->_deploymentType, v4, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", self->_backgroundTask, self->_populations, self->_deploymentType, self->_deploymentDate, a3);
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIClientBackgroundMLTask *backgroundTask;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSArray *populations;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSNumber *deploymentType;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  NSDate *deploymentDate;
  void *v28;
  int v29;
  unint64_t downloadSize;
  BOOL v31;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  v6 = self->_backgroundTask != 0;
  objc_msgSend(v4, "backgroundTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_15;
  backgroundTask = self->_backgroundTask;
  if (backgroundTask)
  {
    objc_msgSend(v5, "backgroundTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIClientBackgroundMLTask isEqual:](backgroundTask, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  v12 = self->_populations != 0;
  objc_msgSend(v5, "populations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_15;
  populations = self->_populations;
  if (populations)
  {
    objc_msgSend(v5, "populations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSArray isEqual:](populations, "isEqual:", v16);

    if (!v17)
      goto LABEL_15;
  }
  v18 = self->_deploymentType != 0;
  objc_msgSend(v5, "deploymentType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_15;
  deploymentType = self->_deploymentType;
  if (deploymentType)
  {
    objc_msgSend(v5, "deploymentType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSNumber isEqual:](deploymentType, "isEqual:", v22);

    if (!v23)
      goto LABEL_15;
  }
  v24 = self->_deploymentDate != 0;
  objc_msgSend(v5, "deploymentDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26
    || (deploymentDate = self->_deploymentDate) != 0
    && (objc_msgSend(v5, "deploymentDate"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = -[NSDate isEqual:](deploymentDate, "isEqual:", v28),
        v28,
        !v29))
  {
LABEL_15:
    v31 = 0;
  }
  else
  {
    downloadSize = self->_downloadSize;
    v31 = downloadSize == objc_msgSend(v5, "downloadSize");
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  TRIClientBMLTArtifact *v4;
  TRIClientBMLTArtifact *v5;
  BOOL v6;

  v4 = (TRIClientBMLTArtifact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIClientBMLTArtifact isEqualToArtifact:](self, "isEqualToArtifact:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[TRIClientBackgroundMLTask hash](self->_backgroundTask, "hash");
  v4 = -[NSArray hash](self->_populations, "hash") - v3 + 32 * v3;
  v5 = -[NSNumber hash](self->_deploymentType, "hash") - v4 + 32 * v4;
  v6 = -[NSDate hash](self->_deploymentDate, "hash");
  return self->_downloadSize - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIClientBMLTArtifact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  TRIClientBMLTArtifact *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundTask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("populations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v4, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v9 = 0;
        v15 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v52 = *MEMORY[0x1E0CB2D50];
      v53 = CFSTR("Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.populations");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 2, v11);
      objc_msgSend(v4, "failWithError:", v13);
      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIClientBMLTArtifact key \"populations\" (expected %@, decoded %@)"), v11, v13, 0);
      v50 = *MEMORY[0x1E0CB2D50];
      v51 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 3, v21);
      objc_msgSend(v4, "failWithError:", v22);
      goto LABEL_21;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deploymentType"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deploymentDate"));
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(v4, "error");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            v44 = *MEMORY[0x1E0CB2D50];
            v45 = CFSTR("Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.deploymentDate");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 2, v30);
            objc_msgSend(v4, "failWithError:", v31);

          }
          v13 = 0;
          goto LABEL_23;
        }
        v13 = (void *)v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIClientBMLTArtifact key \"deploymentDate\" (expected %@, decoded %@)"), v39, v34, 0);
          v42 = *MEMORY[0x1E0CB2D50];
          v43 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 3, v36);
          objc_msgSend(v4, "failWithError:", v37);

          goto LABEL_23;
        }
        v14 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("downloadSize"));
        if (v14)
        {
LABEL_9:
          self = -[TRIClientBMLTArtifact initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:](self, "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", v5, v9, v11, v13, v14);
          v15 = self;
LABEL_24:

          goto LABEL_25;
        }
        objc_msgSend(v4, "error");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
LABEL_23:
          v15 = 0;
          goto LABEL_24;
        }
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("downloadSize")) & 1) != 0)
          goto LABEL_9;
        v40 = *MEMORY[0x1E0CB2D50];
        v41 = CFSTR("Missing serialized value for TRIClientBMLTArtifact.downloadSize");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 1, v20);
        objc_msgSend(v4, "failWithError:", v21);
LABEL_22:

        goto LABEL_23;
      }
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIClientBMLTArtifact key \"deploymentType\" (expected %@, decoded %@)"), v13, v20, 0);
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 3, v22);
      objc_msgSend(v4, "failWithError:", v26);

LABEL_21:
      goto LABEL_22;
    }
    objc_msgSend(v4, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v48 = *MEMORY[0x1E0CB2D50];
      v49 = CFSTR("Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.deploymentType");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 2, v13);
      objc_msgSend(v4, "failWithError:", v28);

      v11 = 0;
      goto LABEL_23;
    }
    v11 = 0;
LABEL_19:
    v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v4, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v54 = *MEMORY[0x1E0CB2D50];
    v55[0] = CFSTR("Retrieved nil serialized value for nonnull TRIClientBMLTArtifact.backgroundTask");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTArtifactOCNTErrorDomain"), 2, v9);
    objc_msgSend(v4, "failWithError:", v11);
    goto LABEL_19;
  }
  v15 = 0;
LABEL_27:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TRIClientBackgroundMLTask *backgroundTask;
  NSArray *populations;
  NSNumber *deploymentType;
  NSDate *deploymentDate;
  id v9;

  v4 = a3;
  backgroundTask = self->_backgroundTask;
  v9 = v4;
  if (backgroundTask)
  {
    objc_msgSend(v4, "encodeObject:forKey:", backgroundTask, CFSTR("backgroundTask"));
    v4 = v9;
  }
  populations = self->_populations;
  if (populations)
  {
    objc_msgSend(v9, "encodeObject:forKey:", populations, CFSTR("populations"));
    v4 = v9;
  }
  deploymentType = self->_deploymentType;
  if (deploymentType)
  {
    objc_msgSend(v9, "encodeObject:forKey:", deploymentType, CFSTR("deploymentType"));
    v4 = v9;
  }
  deploymentDate = self->_deploymentDate;
  if (deploymentDate)
  {
    objc_msgSend(v9, "encodeObject:forKey:", deploymentDate, CFSTR("deploymentDate"));
    v4 = v9;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_downloadSize, CFSTR("downloadSize"));

}

- (id)description
{
  id v3;
  NSNumber *deploymentType;
  NSDate *deploymentDate;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = *(_OWORD *)&self->_backgroundTask;
  deploymentType = self->_deploymentType;
  deploymentDate = self->_deploymentDate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_downloadSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIClientBMLTArtifact | backgroundTask:%@ populations:%@ deploymentType:%@ deploymentDate:%@ downloadSize:%@>"), v9, deploymentType, deploymentDate, v6);

  return v7;
}

- (TRIClientBackgroundMLTask)backgroundTask
{
  return self->_backgroundTask;
}

- (NSArray)populations
{
  return self->_populations;
}

- (NSNumber)deploymentType
{
  return self->_deploymentType;
}

- (NSDate)deploymentDate
{
  return self->_deploymentDate;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentDate, 0);
  objc_storeStrong((id *)&self->_deploymentType, 0);
  objc_storeStrong((id *)&self->_populations, 0);
  objc_storeStrong((id *)&self->_backgroundTask, 0);
}

- (TRIBMLTDeployment)deployment
{
  id v2;
  void *v3;
  void *v4;
  void *v6;

  -[TRIClientBMLTArtifact backgroundTask](self, "backgroundTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0DC09A8]);
  objc_msgSend(v6, "taskId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBackgroundMLTaskId:deploymentId:", v3, objc_msgSend(v6, "deploymentId"));

  return (TRIBMLTDeployment *)v4;
}

- (id)data
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;

  v4 = objc_alloc(MEMORY[0x1E0DC0F58]);
  -[TRIClientBMLTArtifact populations](self, "populations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  -[TRIClientBMLTArtifact populations](self, "populations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __36__TRIClientBMLTArtifact_Utils__data__block_invoke;
  v21 = &unk_1E9331400;
  v8 = v6;
  v22 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v18);

  v9 = (void *)objc_opt_new();
  -[TRIClientBMLTArtifact backgroundTask](self, "backgroundTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundMlTask:", v10);

  objc_msgSend(v9, "setPopulationsArray:", v8);
  -[TRIClientBMLTArtifact deploymentType](self, "deploymentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeploymentType:", objc_msgSend(v11, "intValue"));

  v12 = objc_alloc(MEMORY[0x1E0DC0F50]);
  -[TRIClientBMLTArtifact deploymentDate](self, "deploymentDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDate:", v13);
  objc_msgSend(v9, "setDeploymentDate:", v14);

  objc_msgSend(v9, "setDownloadSize:", -[TRIClientBMLTArtifact downloadSize](self, "downloadSize"));
  objc_msgSend(v9, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientBMLTArtifact+Utils.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"), v18, v19, v20, v21);

  }
  return v15;
}

uint64_t __36__TRIClientBMLTArtifact_Utils__data__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:", objc_msgSend(a2, "unsignedIntValue"));
}

+ (id)artifactWithTransientData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  TRIClientBMLTArtifact *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  TRIClientBMLTArtifact *v17;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  +[TRIPBMessage parseFromData:error:](TRIPersistedClientBMLTArtifact, "parseFromData:error:", a3, &v25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v25;
  if (!v3)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v4;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Failed to decode TRIPersistedClientBMLTArtifact: %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "hasBackgroundMlTask") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v15;
    v16 = "Cannot decode message of type %@ with missing field: backgroundMlTask";
LABEL_16:
    _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "hasDeploymentDate") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v15;
    v16 = "Cannot decode message of type %@ with missing field: deploymentDate";
    goto LABEL_16;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "populationsArray_Count"));
  objc_msgSend(v3, "populationsArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __58__TRIClientBMLTArtifact_Utils__artifactWithTransientData___block_invoke;
  v23 = &unk_1E93306F0;
  v7 = v5;
  v24 = v7;
  objc_msgSend(v6, "enumerateValuesWithBlock:", &v20);

  v8 = [TRIClientBMLTArtifact alloc];
  objc_msgSend(v3, "backgroundMlTask", v20, v21, v22, v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "deploymentType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deploymentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasDownloadSize"))
    v13 = objc_msgSend(v3, "downloadSize");
  else
    v13 = 0;
  v17 = -[TRIClientBMLTArtifact initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:](v8, "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", v9, v7, v10, v12, v13);

LABEL_12:
  return v17;
}

void __58__TRIClientBMLTArtifact_Utils__artifactWithTransientData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)earliestStartDateForActivationIfInFuture
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  void *v11;

  -[TRIClientBMLTArtifact backgroundTask](self, "backgroundTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "hasStartDate"))
    goto LABEL_7;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  objc_msgSend(v2, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  if (v8 <= 0.0 || v8 <= v5)
  {
LABEL_7:
    v11 = 0;
  }
  else
  {
    objc_msgSend(v2, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)allReferencedCKRecordKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC0C90];
  v7[0] = *MEMORY[0x1E0DC0C80];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0DC0CC0];
  v7[2] = *MEMORY[0x1E0DC0C88];
  v7[3] = v3;
  v4 = *MEMORY[0x1E0DC0CB0];
  v7[4] = *MEMORY[0x1E0DC0CC8];
  v7[5] = v4;
  v5 = *MEMORY[0x1E0DC0CA0];
  v7[6] = *MEMORY[0x1E0DC0CA8];
  v7[7] = v5;
  v7[8] = *MEMORY[0x1E0DC0C98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)artifactFromCKRecord:(id)a3 namespaceDescriptorProvider:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  TRIClientBMLTArtifact *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  id v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  id v114;
  void *v115;
  void *v116;
  id v117;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint8_t buf[4];
  uint64_t v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  _QWORD v167[3];

  v167[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0C80], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      TRILogCategory_Server();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v139 = (uint64_t)v81;
        _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "BMLTNotification CloudKit record %@ has missing or corrupt background ML task id.", buf, 0xCu);

      }
      if (!a5)
      {
        v10 = 0;
        v27 = 0;
LABEL_95:

        goto LABEL_96;
      }
      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("BMLTNotification CloudKit record %@ has missing or corrupt background ML task id."), v36);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v164 = *MEMORY[0x1E0CB2D50];
      v165 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v12);
      v27 = 0;
      v13 = *a5;
      *a5 = v38;
      goto LABEL_92;
    }
    objc_msgSend(v9, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0C90], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v139 = (uint64_t)v82;
        v140 = 2114;
        v141 = v10;
        _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@ has missing or corrupt deployment id.", buf, 0x16u);

      }
      if (!a5)
      {
        v11 = 0;
        v27 = 0;
LABEL_94:

        goto LABEL_95;
      }
      v40 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@ has missing or corrupt deployment id."), v41, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v162 = *MEMORY[0x1E0CB2D50];
      v163 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v42, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v13);
      v27 = 0;
      v14 = *a5;
      *a5 = v43;
      goto LABEL_91;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC09A8]), "initWithBackgroundMLTaskId:deploymentId:", v10, objc_msgSend(v11, "intValue"));
    objc_msgSend(v9, "triDataForField:", *MEMORY[0x1E0DC0CC0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      TRILogCategory_Server();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v100;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v44, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt encoded task definition.", buf, 0x20u);

      }
      if (!a5)
      {
        v13 = 0;
        v27 = 0;
LABEL_92:

        goto LABEL_93;
      }
      v45 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has missing or corrupt encoded task definition."), v46, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v160 = *MEMORY[0x1E0CB2D50];
      v161 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v47, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v15);
      v27 = 0;
      v49 = *a5;
      *a5 = v48;
      goto LABEL_89;
    }
    objc_msgSend(v9, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0CC8], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      TRILogCategory_Server();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v101;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v50, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt encoded BMLT definition signature.", buf, 0x20u);

      }
      if (!a5)
      {
        v14 = 0;
        v27 = 0;
LABEL_91:

        goto LABEL_92;
      }
      v51 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has missing or corrupt encoded BMLT definition signature."), v52, v10, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v158 = *MEMORY[0x1E0CB2D50];
      v159 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
      v133 = objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v53, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v27 = 0;
      v55 = *a5;
      *a5 = v54;
      goto LABEL_88;
    }
    objc_msgSend(v9, "triDataForField:", *MEMORY[0x1E0DC0CB0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      TRILogCategory_Server();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v134;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v56, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt public certificate.", buf, 0x20u);

      }
      if (!a5)
      {
        v15 = 0;
        v27 = 0;
LABEL_90:

        goto LABEL_91;
      }
      v57 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has missing or corrupt public certificate."), v58, v10, v11);
      v59 = objc_claimAutoreleasedReturnValue();

      v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v156 = *MEMORY[0x1E0CB2D50];
      v157 = v59;
      v133 = v59;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = v60;
      v15 = 0;
      v131 = (void *)v61;
      v63 = (void *)objc_msgSend(v62, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v27 = 0;
      v64 = *a5;
      *a5 = v63;
      goto LABEL_86;
    }
    objc_msgSend(v9, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0CA0], 0);
    v132 = v15;
    v133 = objc_claimAutoreleasedReturnValue();
    if (!v133)
    {
      TRILogCategory_Server();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v102;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v65, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has a missing or corrupt namespace name.", buf, 0x20u);

      }
      if (!a5)
      {
        v49 = 0;
        v27 = 0;
        v15 = v132;
LABEL_89:

        goto LABEL_90;
      }
      v66 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has a missing or corrupt namespace name."), v67, v10, v11);
      v68 = v13;
      v69 = objc_claimAutoreleasedReturnValue();

      v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v154 = *MEMORY[0x1E0CB2D50];
      v155 = v69;
      v131 = (void *)v69;
      v13 = v68;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
      v130 = objc_claimAutoreleasedReturnValue();
      v71 = (void *)objc_msgSend(v70, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v27 = 0;
      v72 = *a5;
      *a5 = v71;
      v15 = v132;
      goto LABEL_85;
    }
    v128 = v13;
    v129 = v14;
    objc_msgSend(v9, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0CA8], 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v16;
    if (!v16
      || (v17 = v16, objc_msgSend(v16, "count"))
      && (objc_msgSend(v17, "objectAtIndexedSubscript:", 0),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v18,
          v15 = v132,
          (isKindOfClass & 1) == 0))
    {
      TRILogCategory_Server();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v103;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v74, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt populations.", buf, 0x20u);

      }
      v13 = v128;
      if (!a5)
      {
        v27 = 0;
        v14 = v129;
        v15 = v132;
LABEL_87:
        v55 = v131;
LABEL_88:

        v49 = (id)v133;
        goto LABEL_89;
      }
      v75 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has missing or corrupt populations."), v76, v10, v11);
      v77 = objc_claimAutoreleasedReturnValue();

      v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v152 = *MEMORY[0x1E0CB2D50];
      v153 = v77;
      v130 = v77;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
      v127 = objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v78, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v27 = 0;
      v80 = *a5;
      *a5 = v79;
      v14 = v129;
      v15 = v132;
      goto LABEL_83;
    }
    objc_msgSend(v9, "triDateForField:", *MEMORY[0x1E0DC0C88]);
    v130 = objc_claimAutoreleasedReturnValue();
    if (!v130)
    {
      TRILogCategory_Server();
      v90 = objc_claimAutoreleasedReturnValue();
      v13 = v128;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v120;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v90, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has unreadable deploymentDate.", buf, 0x20u);

      }
      if (!a5)
      {
        v64 = 0;
        v27 = 0;
        v14 = v129;
LABEL_86:

        goto LABEL_87;
      }
      v91 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v92 = v15;
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has unreadable deploymentDate."), v93, v10, v11);
      v94 = objc_claimAutoreleasedReturnValue();

      v95 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v150 = *MEMORY[0x1E0CB2D50];
      v151 = v94;
      v127 = v94;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
      v96 = objc_claimAutoreleasedReturnValue();
      v97 = v95;
      v15 = v92;
      v126 = v96;
      v98 = (void *)objc_msgSend(v97, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v27 = 0;
      v99 = *a5;
      *a5 = v98;
      v14 = v129;
      goto LABEL_82;
    }
    +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v128;
    v14 = v129;
    v127 = (uint64_t)v20;
    if (!v20 || (objc_msgSend(v20, "validateBase64Signature:data:", v129, v128) & 1) == 0)
    {
      TRILogCategory_Server();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v119;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v83, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ does not have a valid signature.", buf, 0x20u);

        v14 = v129;
      }

      v15 = v132;
      if (!a5)
      {
        v27 = 0;
LABEL_84:
        v72 = (id)v127;
LABEL_85:

        v64 = (id)v130;
        goto LABEL_86;
      }
      v84 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ does not have a valid signature."), v85, v10, v11);
      v86 = objc_claimAutoreleasedReturnValue();

      v15 = v132;
      v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v148 = *MEMORY[0x1E0CB2D50];
      v149 = v86;
      v126 = v86;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
      v14 = v129;
      v125 = (id)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_msgSend(v87, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v27 = 0;
      v89 = *a5;
      *a5 = v88;
      goto LABEL_81;
    }
    objc_msgSend(v9, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0C98], 0);
    v126 = objc_claimAutoreleasedReturnValue();
    if (v126)
    {
      v135 = 0;
      objc_msgSend(MEMORY[0x1E0DC0E78], "parseFromData:error:", v128, &v135);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v135;
      v23 = v21;
      v125 = v22;
      v15 = v132;
      if (v23)
      {
        v124 = v23;
        if (!objc_msgSend(a1, "_isStructurallyValidBMLT:deployment:namespaceName:populations:deploymentType:deploymentDate:", v23, v12, v133, v131, v126, v130))
        {
          v27 = 0;
          goto LABEL_80;
        }
        v24 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v12, "backgroundMLTaskId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend(v24, "initWithFormat:", CFSTR("%@.%d"), v25, objc_msgSend(v12, "deploymentId"));

        TRILogCategory_Server();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v139 = v123;
          _os_log_debug_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEBUG, "Decoded valid and device-compatible BMLT notification: %{public}@. This means we are ack’ing the CK notification, not acting on it.", buf, 0xCu);
        }

        v27 = -[TRIClientBMLTArtifact initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:]([TRIClientBMLTArtifact alloc], "initWithBackgroundTask:populations:deploymentType:deploymentDate:downloadSize:", v124, v131, v126, v130, objc_msgSend(v132, "length") + objc_msgSend(v128, "length") + objc_msgSend(v129, "length"));
        v28 = (id)v123;
      }
      else
      {
        TRILogCategory_Server();
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "recordID");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v139 = (uint64_t)v122;
          v140 = 2114;
          v141 = v10;
          v142 = 2112;
          v143 = v11;
          v144 = 2114;
          v145 = v125;
          _os_log_error_impl(&dword_1D207F000, v110, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has unparseable background ML task definition: %{public}@", buf, 0x2Au);

          v14 = v129;
        }

        if (!a5)
        {
          v89 = 0;
          v27 = 0;
          goto LABEL_81;
        }
        v111 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "recordID");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has unparseable background ML task definition: %@"), v112, v10, v11, v125);
        v113 = objc_claimAutoreleasedReturnValue();

        v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v136 = *MEMORY[0x1E0CB2D50];
        v137 = v113;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = (void *)objc_msgSend(v114, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v115);
        v117 = *a5;
        *a5 = v116;

        v28 = (id)v113;
        v15 = v132;
        v124 = 0;
        v27 = 0;
      }
    }
    else
    {
      TRILogCategory_Server();
      v104 = objc_claimAutoreleasedReturnValue();
      v15 = v132;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v139 = (uint64_t)v121;
        v140 = 2114;
        v141 = v10;
        v142 = 2112;
        v143 = v11;
        _os_log_error_impl(&dword_1D207F000, v104, OS_LOG_TYPE_ERROR, "CloudKit record %@ with background ML task id %{public}@.%@ has missing or corrupt deployment type.", buf, 0x20u);

        v14 = v129;
      }

      if (!a5)
      {
        v80 = 0;
        v27 = 0;
        goto LABEL_83;
      }
      v105 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "recordID");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "stringWithFormat:", CFSTR("CloudKit record %@ with background ML task id %@.%@ has missing or corrupt deployment type."), v106, v10, v11);
      v107 = objc_claimAutoreleasedReturnValue();

      v15 = v132;
      v108 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v146 = *MEMORY[0x1E0CB2D50];
      v147 = v107;
      v125 = (id)v107;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
      v124 = objc_claimAutoreleasedReturnValue();
      v109 = (void *)objc_msgSend(v108, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v27 = 0;
      v28 = *a5;
      *a5 = v109;
    }

    v14 = v129;
LABEL_80:
    v89 = (id)v124;
LABEL_81:

    v99 = v125;
LABEL_82:

    v80 = (id)v126;
LABEL_83:

    goto LABEL_84;
  }
  TRILogCategory_Server();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "recordID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v139 = (uint64_t)v73;
    _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Could not create BMLT artifact from CloudKit record %@.", buf, 0xCu);

  }
  if (a5)
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "recordID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Could not create BMLT artifact from CloudKit record %@."), v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v166 = *MEMORY[0x1E0CB2D50];
    v167[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v167, &v166, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v11);
    v27 = 0;
    v12 = *a5;
    *a5 = v33;
LABEL_93:

    goto LABEL_94;
  }
  v27 = 0;
LABEL_96:

  return v27;
}

+ (BOOL)_isStructurallyValidBMLT:(id)a3 deployment:(id)a4 namespaceName:(id)a5 populations:(id)a6 deploymentType:(id)a7 deploymentDate:(id)a8
{
  id v11;
  id v12;
  __CFString *v13;
  id v14;
  void *v15;
  char v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  BOOL v30;
  int v32;
  int v33;
  __CFString *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = a7;
  if ((-[__CFString triIsPathSafe](v13, "triIsPathSafe") & 1) == 0)
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "backgroundMLTaskId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543874;
      v38 = v22;
      v39 = 1024;
      v40 = objc_msgSend(v12, "deploymentId");
      v41 = 2114;
      v42 = v13;
      v23 = "BMLT artifact with id %{public}@.%d has namespace name \"%{public}@\" which is not path-safe.";
      v24 = v21;
      v25 = 28;
LABEL_12:
      _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v37, v25);
LABEL_13:

    }
LABEL_24:

    v30 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v12, "backgroundMLTaskId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "triIsPathSafePlausibleUniqueId");

  if ((v16 & 1) == 0)
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "backgroundMLTaskId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v22;
      v39 = 1024;
      v40 = objc_msgSend(v12, "deploymentId");
      v23 = "BMLT artifact with id %{public}@.%d has backgroundMLTaskId which is not a plausible uniqueId.";
      v24 = v21;
      v25 = 18;
      goto LABEL_12;
    }
    goto LABEL_24;
  }
  if (v14)
  {
    v17 = objc_msgSend(v14, "intValue");
    if (v17 == 1)
      goto LABEL_17;
    v18 = v17;
    if (v17 == 4)
      goto LABEL_17;
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "backgroundMLTaskId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543874;
      v38 = v20;
      v39 = 1024;
      v40 = objc_msgSend(v12, "deploymentId");
      v41 = 1024;
      LODWORD(v42) = v18;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "BMLT artifact with id %{public}@.%d does not have a plausible deployment type, found: %d.", (uint8_t *)&v37, 0x18u);

    }
  }
  else
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "backgroundMLTaskId");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v36;
      v39 = 1024;
      v40 = objc_msgSend(v12, "deploymentId");
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "BMLT artifact with id %{public}@.%d does not have a plausible deployment type, found nil.", (uint8_t *)&v37, 0x12u);

    }
  }

LABEL_17:
  if (!objc_msgSend(v11, "hasTaskId"))
    goto LABEL_23;
  objc_msgSend(v12, "backgroundMLTaskId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "taskId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v26, "isEqualToString:", v27) || (objc_msgSend(v11, "hasDeploymentId") & 1) == 0)
  {

    goto LABEL_23;
  }
  v28 = objc_msgSend(v12, "deploymentId");
  v29 = objc_msgSend(v11, "deploymentId");

  if (v28 != v29)
  {
LABEL_23:
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    objc_msgSend(v12, "backgroundMLTaskId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v12, "deploymentId");
    v33 = objc_msgSend(v11, "hasTaskId");
    if (v33)
    {
      objc_msgSend(v11, "taskId");
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = CFSTR("(unset)");
    }
    if (objc_msgSend(v11, "hasDeploymentId"))
      v35 = objc_msgSend(v11, "deploymentId");
    else
      v35 = -1;
    v37 = 138544130;
    v38 = v22;
    v39 = 1024;
    v40 = v32;
    v41 = 2114;
    v42 = v34;
    v43 = 1024;
    v44 = v35;
    _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "BMLT artifact with id %{public}@.%d contains background ML task definition with mismatched identifier: %{public}@.%d", (uint8_t *)&v37, 0x22u);
    if (v33)

    goto LABEL_13;
  }
  v30 = 1;
LABEL_25:

  return v30;
}

@end
