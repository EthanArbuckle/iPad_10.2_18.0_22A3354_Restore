@implementation TRILogTreatmentReader

+ (id)readerWithProjectId:(int)a3 paths:(id)a4
{
  uint64_t v4;
  id v5;
  int IsValidValue;
  TRILogTreatmentReader *v7;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  IsValidValue = TRIProject_ProjectId_IsValidValue();
  v7 = 0;
  if ((_DWORD)v4 && IsValidValue)
    v7 = -[TRILogTreatmentReader initWithProjectId:paths:]([TRILogTreatmentReader alloc], "initWithProjectId:paths:", v4, v5);

  return v7;
}

- (id)treatments
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0C99D50];
  -[TRILogTreatmentReader path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithContentsOfFile:options:error:", v3, 8, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0EB0]), "initWithData:", v4);
    v6 = v5;
    if (v5 && objc_msgSend(v5, "treatmentsCount"))
    {
      objc_msgSend(v6, "treatments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TRILogTreatmentReader)initWithProjectId:(int)a3 paths:(id)a4
{
  id v7;
  TRILogTreatmentReader *v8;
  TRILogTreatmentReader *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRILogTreatmentReader;
  v8 = -[TRILogTreatmentReader init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_projectId = a3;
    objc_storeStrong((id *)&v8->_paths, a4);
  }

  return v9;
}

- (NSString)path
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_projectId, v4, CFSTR("Projects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  v9[3] = CFSTR("treatmentsV2.data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathWithComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

- (id)namespaceLoggingTreatmentPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("logTreamentNamespaceData.data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchRolloutLogNamespaces
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[TRILogTreatmentReader namespaceLoggingTreatmentPath](self, "namespaceLoggingTreatmentPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:options:error:", v4, 1, 0);

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0EF8]), "initWithData:", v5);
    if (objc_msgSend(v6, "namespacesCount"))
    {
      objc_msgSend(v6, "namespaces");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
