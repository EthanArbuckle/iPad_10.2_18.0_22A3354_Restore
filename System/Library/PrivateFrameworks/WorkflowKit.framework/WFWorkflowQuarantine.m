@implementation WFWorkflowQuarantine

- (WFWorkflowQuarantine)initWithSourceAppIdentifier:(id)a3 importDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFWorkflowQuarantine *v10;
  uint64_t v11;
  NSString *sourceAppIdentifier;
  WFWorkflowQuarantine *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowQuarantine.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAppIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowQuarantine.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("importDate"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFWorkflowQuarantine;
  v10 = -[WFWorkflowQuarantine init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    sourceAppIdentifier = v10->_sourceAppIdentifier;
    v10->_sourceAppIdentifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_importDate, a4);
    v13 = v10;
  }

  return v10;
}

- (WFWorkflowQuarantine)initWithSerializedData:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  WFWorkflowQuarantine *v19;
  uint64_t v21;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("WFWorkflowQuarantineSourceApp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("WFWorkflowQuarantineImportDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  if (v12)
  {
    self = -[WFWorkflowQuarantine initWithSourceAppIdentifier:importDate:](self, "initWithSourceAppIdentifier:importDate:", v12, v18);
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)serializedData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36F8];
  -[WFWorkflowQuarantine serializedRepresentation](self, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFWorkflowQuarantine serializedData]";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to archive quarantine data: %{public}@", buf, 0x16u);
    }

  }
  return v4;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("WFWorkflowQuarantineSourceApp");
  -[WFWorkflowQuarantine sourceAppIdentifier](self, "sourceAppIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("WFWorkflowQuarantineImportDate");
  v8[0] = v3;
  -[WFWorkflowQuarantine importDate](self, "importDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowQuarantine *v4;
  WFWorkflowQuarantine *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (WFWorkflowQuarantine *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFWorkflowQuarantine sourceAppIdentifier](self, "sourceAppIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowQuarantine sourceAppIdentifier](v5, "sourceAppIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[WFWorkflowQuarantine importDate](self, "importDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowQuarantine importDate](v5, "importDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToDate:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (NSDate)importDate
{
  return self->_importDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importDate, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
}

@end
