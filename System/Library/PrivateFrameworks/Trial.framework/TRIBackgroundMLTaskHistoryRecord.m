@implementation TRIBackgroundMLTaskHistoryRecord

- (TRIBackgroundMLTaskHistoryRecord)initWithEventDate:(id)a3 eventType:(unsigned __int8)a4 backgroundMLTaskId:(id)a5 deploymentId:(int)a6 factorPackSetId:(id)a7
{
  id v14;
  id v15;
  id v16;
  TRIBackgroundMLTaskHistoryRecord *v17;
  TRIBackgroundMLTaskHistoryRecord *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3550, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventDate != nil"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backgroundMLTaskId != nil"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)TRIBackgroundMLTaskHistoryRecord;
  v17 = -[TRIBackgroundMLTaskHistoryRecord init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventDate, a3);
    v18->_eventType = a4;
    objc_storeStrong((id *)&v18->_backgroundMLTaskId, a5);
    v18->_deploymentId = a6;
    objc_storeStrong((id *)&v18->_factorPackSetId, a7);
  }

  return v18;
}

+ (id)recordWithEventDate:(id)a3 eventType:(unsigned __int8)a4 backgroundMLTaskId:(id)a5 deploymentId:(int)a6 factorPackSetId:(id)a7
{
  uint64_t v7;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;

  v7 = *(_QWORD *)&a6;
  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", v14, v9, v13, v7, v12);

  return v15;
}

- (id)copyWithReplacementEventDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", v4, self->_eventType, self->_backgroundMLTaskId, self->_deploymentId, self->_factorPackSetId);

  return v5;
}

- (id)copyWithReplacementEventType:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", self->_eventDate, a3, self->_backgroundMLTaskId, self->_deploymentId, self->_factorPackSetId);
}

- (id)copyWithReplacementBackgroundMLTaskId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", self->_eventDate, self->_eventType, v4, self->_deploymentId, self->_factorPackSetId);

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", self->_eventDate, self->_eventType, self->_backgroundMLTaskId, *(_QWORD *)&a3, self->_factorPackSetId);
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", self->_eventDate, self->_eventType, self->_backgroundMLTaskId, self->_deploymentId, v4);

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSDate *eventDate;
  void *v10;
  int v11;
  int eventType;
  int v13;
  void *v14;
  int v15;
  NSString *backgroundMLTaskId;
  void *v17;
  int v18;
  int deploymentId;
  int v20;
  void *v21;
  int v22;
  TRIFactorPackSetId *factorPackSetId;
  void *v24;
  char v25;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_13;
  v6 = self->_eventDate != 0;
  objc_msgSend(v4, "eventDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_13;
  eventDate = self->_eventDate;
  if (eventDate)
  {
    objc_msgSend(v5, "eventDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDate isEqual:](eventDate, "isEqual:", v10);

    if (!v11)
      goto LABEL_13;
  }
  eventType = self->_eventType;
  if (eventType != objc_msgSend(v5, "eventType"))
    goto LABEL_13;
  v13 = self->_backgroundMLTaskId != 0;
  objc_msgSend(v5, "backgroundMLTaskId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_13;
  backgroundMLTaskId = self->_backgroundMLTaskId;
  if (backgroundMLTaskId)
  {
    objc_msgSend(v5, "backgroundMLTaskId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](backgroundMLTaskId, "isEqual:", v17);

    if (!v18)
      goto LABEL_13;
  }
  deploymentId = self->_deploymentId;
  if (deploymentId != objc_msgSend(v5, "deploymentId")
    || (v20 = self->_factorPackSetId != 0,
        objc_msgSend(v5, "factorPackSetId"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = v21 == 0,
        v21,
        v20 == v22))
  {
LABEL_13:
    v25 = 0;
  }
  else
  {
    factorPackSetId = self->_factorPackSetId;
    if (factorPackSetId)
    {
      objc_msgSend(v5, "factorPackSetId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[TRIFactorPackSetId isEqual:](factorPackSetId, "isEqual:", v24);

    }
    else
    {
      v25 = 1;
    }
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  TRIBackgroundMLTaskHistoryRecord *v4;
  TRIBackgroundMLTaskHistoryRecord *v5;
  BOOL v6;

  v4 = (TRIBackgroundMLTaskHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIBackgroundMLTaskHistoryRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSDate hash](self->_eventDate, "hash");
  v4 = self->_eventType - v3 + 32 * v3;
  v5 = -[NSString hash](self->_backgroundMLTaskId, "hash");
  v6 = self->_deploymentId - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  return -[TRIFactorPackSetId hash](self->_factorPackSetId, "hash") - v6 + 32 * v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIBackgroundMLTaskHistoryRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  objc_class *v21;
  objc_class *v22;
  TRIBackgroundMLTaskHistoryRecord *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIBackgroundMLTaskHistoryRecord key \"eventDate\" (expected %@, decoded %@)"), v8, v10, 0);
      v38 = *MEMORY[0x1E0CB2D50];
      v39 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain"), 3, v14);
      objc_msgSend(v4, "failWithError:", v15);
      goto LABEL_13;
    }
    v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("eventType"));
    if (v6)
    {
LABEL_4:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundMLTaskId"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deploymentId"));
        if ((_DWORD)v9)
          goto LABEL_6;
        objc_msgSend(v4, "error");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deploymentId")) & 1) == 0)
          {
            v32 = *MEMORY[0x1E0CB2D50];
            v33 = CFSTR("Missing serialized value for TRIBackgroundMLTaskHistoryRecord.deploymentId");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain"), 1, v10);
            objc_msgSend(v4, "failWithError:", v12);
            goto LABEL_14;
          }
LABEL_6:
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factorPackSetId"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v11 = (objc_class *)objc_opt_class();
              NSStringFromClass(v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (objc_class *)objc_opt_class();
              NSStringFromClass(v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIBackgroundMLTaskHistoryRecord key \"factorPackSetId\" (expected %@, decoded %@)"), v12, v14, 0);
              v30 = *MEMORY[0x1E0CB2D50];
              v31 = v15;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain"), 3, v16);
              objc_msgSend(v4, "failWithError:", v17);

LABEL_13:
LABEL_14:

              goto LABEL_15;
            }
          }
          else
          {
            objc_msgSend(v4, "error");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              v10 = 0;
              goto LABEL_15;
            }
          }
          self = -[TRIBackgroundMLTaskHistoryRecord initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:](self, "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", v5, v6, v8, v9, v10);
          v23 = self;
          goto LABEL_16;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          v34 = *MEMORY[0x1E0CB2D50];
          v35 = CFSTR("Retrieved nil serialized value for nonnull TRIBackgroundMLTaskHistoryRecord.backgroundMLTaskId");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain"), 2, v10);
          objc_msgSend(v4, "failWithError:", v29);

          v8 = 0;
          goto LABEL_15;
        }
        v8 = 0;
      }
      v23 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v4, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
LABEL_19:
      v23 = 0;
      goto LABEL_20;
    }
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("eventType")) & 1) != 0)
      goto LABEL_4;
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("Missing serialized value for TRIBackgroundMLTaskHistoryRecord.eventType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = 1;
  }
  else
  {
    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_19;
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("Retrieved nil serialized value for nonnull TRIBackgroundMLTaskHistoryRecord.eventDate");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = 2;
  }
  v10 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("TRIBackgroundMLTaskHistoryRecordOCNTErrorDomain"), v20, v8);
  objc_msgSend(v4, "failWithError:", v10);
LABEL_15:
  v23 = 0;
LABEL_16:

LABEL_17:
LABEL_20:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *eventDate;
  NSString *backgroundMLTaskId;
  TRIFactorPackSetId *factorPackSetId;
  id v7;

  v7 = a3;
  eventDate = self->_eventDate;
  if (eventDate)
    objc_msgSend(v7, "encodeObject:forKey:", eventDate, CFSTR("eventDate"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_eventType, CFSTR("eventType"));
  backgroundMLTaskId = self->_backgroundMLTaskId;
  if (backgroundMLTaskId)
    objc_msgSend(v7, "encodeObject:forKey:", backgroundMLTaskId, CFSTR("backgroundMLTaskId"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_deploymentId, CFSTR("deploymentId"));
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
    objc_msgSend(v7, "encodeObject:forKey:", factorPackSetId, CFSTR("factorPackSetId"));

}

- (id)description
{
  id v3;
  NSDate *eventDate;
  void *v5;
  NSString *backgroundMLTaskId;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  eventDate = self->_eventDate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_eventType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundMLTaskId = self->_backgroundMLTaskId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIBackgroundMLTaskHistoryRecord | eventDate:%@ eventType:%@ backgroundMLTaskId:%@ deploymentId:%@ factorPackSetId:%@>"), eventDate, v5, backgroundMLTaskId, v7, self->_factorPackSetId);

  return v8;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (NSString)backgroundMLTaskId
{
  return self->_backgroundMLTaskId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_backgroundMLTaskId, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
}

@end
