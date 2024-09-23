@implementation TRIRolloutHistoryRecord

- (TRIRolloutHistoryRecord)initWithEventLogTime:(id)a3 eventType:(unsigned __int8)a4 rolloutId:(id)a5 rampId:(id)a6 factorPackSetId:(id)a7 deploymentId:(int)a8 namespaces:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  TRIRolloutHistoryRecord *v18;
  TRIRolloutHistoryRecord *v19;
  void *v21;
  void *v22;
  id v26;
  objc_super v27;

  v14 = a3;
  v15 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a9;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 2841, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventLogTime != nil"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 2842, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId != nil"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)TRIRolloutHistoryRecord;
  v18 = -[TRIRolloutHistoryRecord init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventLogTime, a3);
    v19->_eventType = a4;
    objc_storeStrong((id *)&v19->_rolloutId, a5);
    objc_storeStrong((id *)&v19->_rampId, a6);
    objc_storeStrong((id *)&v19->_factorPackSetId, a7);
    v19->_deploymentId = a8;
    objc_storeStrong((id *)&v19->_namespaces, a9);
  }

  return v19;
}

+ (id)recordWithEventLogTime:(id)a3 eventType:(unsigned __int8)a4 rolloutId:(id)a5 rampId:(id)a6 factorPackSetId:(id)a7 deploymentId:(int)a8 namespaces:(id)a9
{
  uint64_t v9;
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v9 = *(_QWORD *)&a8;
  v13 = a4;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", v20, v13, v19, v18, v17, v9, v16);

  return v21;
}

- (id)copyWithReplacementEventLogTime:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", v4, self->_eventType, self->_rolloutId, self->_rampId, self->_factorPackSetId, self->_deploymentId, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementEventType:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", self->_eventLogTime, a3, self->_rolloutId, self->_rampId, self->_factorPackSetId, self->_deploymentId, self->_namespaces);
}

- (id)copyWithReplacementRolloutId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", self->_eventLogTime, self->_eventType, v4, self->_rampId, self->_factorPackSetId, self->_deploymentId, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementRampId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", self->_eventLogTime, self->_eventType, self->_rolloutId, v4, self->_factorPackSetId, self->_deploymentId, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", self->_eventLogTime, self->_eventType, self->_rolloutId, self->_rampId, v4, self->_deploymentId, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", self->_eventLogTime, self->_eventType, self->_rolloutId, self->_rampId, self->_factorPackSetId, *(_QWORD *)&a3, self->_namespaces);
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", self->_eventLogTime, self->_eventType, self->_rolloutId, self->_rampId, self->_factorPackSetId, self->_deploymentId, v4);

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSDate *eventLogTime;
  void *v10;
  int v11;
  int eventType;
  int v13;
  void *v14;
  int v15;
  NSString *rolloutId;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  NSString *rampId;
  void *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  TRIFactorPackSetId *factorPackSetId;
  void *v29;
  int v30;
  int deploymentId;
  int v32;
  void *v33;
  int v34;
  NSArray *namespaces;
  void *v36;
  char v37;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_19;
  v6 = self->_eventLogTime != 0;
  objc_msgSend(v4, "eventLogTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_19;
  eventLogTime = self->_eventLogTime;
  if (eventLogTime)
  {
    objc_msgSend(v5, "eventLogTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDate isEqual:](eventLogTime, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  eventType = self->_eventType;
  if (eventType != objc_msgSend(v5, "eventType"))
    goto LABEL_19;
  v13 = self->_rolloutId != 0;
  objc_msgSend(v5, "rolloutId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_19;
  rolloutId = self->_rolloutId;
  if (rolloutId)
  {
    objc_msgSend(v5, "rolloutId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](rolloutId, "isEqual:", v17);

    if (!v18)
      goto LABEL_19;
  }
  v19 = self->_rampId != 0;
  objc_msgSend(v5, "rampId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
    goto LABEL_19;
  rampId = self->_rampId;
  if (rampId)
  {
    objc_msgSend(v5, "rampId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NSString isEqual:](rampId, "isEqual:", v23);

    if (!v24)
      goto LABEL_19;
  }
  v25 = self->_factorPackSetId != 0;
  objc_msgSend(v5, "factorPackSetId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (v25 == v27)
    goto LABEL_19;
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    objc_msgSend(v5, "factorPackSetId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[TRIFactorPackSetId isEqual:](factorPackSetId, "isEqual:", v29);

    if (!v30)
      goto LABEL_19;
  }
  deploymentId = self->_deploymentId;
  if (deploymentId != objc_msgSend(v5, "deploymentId")
    || (v32 = self->_namespaces != 0,
        objc_msgSend(v5, "namespaces"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = v33 == 0,
        v33,
        v32 == v34))
  {
LABEL_19:
    v37 = 0;
  }
  else
  {
    namespaces = self->_namespaces;
    if (namespaces)
    {
      objc_msgSend(v5, "namespaces");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[NSArray isEqual:](namespaces, "isEqual:", v36);

    }
    else
    {
      v37 = 1;
    }
  }

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  TRIRolloutHistoryRecord *v4;
  TRIRolloutHistoryRecord *v5;
  BOOL v6;

  v4 = (TRIRolloutHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIRolloutHistoryRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSDate hash](self->_eventLogTime, "hash");
  v4 = self->_eventType - v3 + 32 * v3;
  v5 = -[NSString hash](self->_rolloutId, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_rampId, "hash") - v5 + 32 * v5;
  v7 = -[TRIFactorPackSetId hash](self->_factorPackSetId, "hash");
  v8 = self->_deploymentId - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
  return -[NSArray hash](self->_namespaces, "hash") - v8 + 32 * v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRolloutHistoryRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  objc_class *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  TRIRolloutHistoryRecord *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventLogTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_15;
    v60 = *MEMORY[0x1E0CB2D50];
    v61[0] = CFSTR("Retrieved nil serialized value for nonnull TRIRolloutHistoryRecord.eventLogTime");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = 2;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIRolloutHistoryRecord key \"eventLogTime\" (expected %@, decoded %@)"), v7, v8, 0);
    v58 = *MEMORY[0x1E0CB2D50];
    v59 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIRolloutHistoryRecordOCNTErrorDomain"), 3, v23);
    objc_msgSend(v4, "failWithError:", v24);

    goto LABEL_13;
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("eventType"));
  if (v6)
    goto LABEL_4;
  objc_msgSend(v4, "error");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("eventType")) & 1) != 0)
    {
LABEL_4:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rolloutId"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v4, "error");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v7 = 0;
          v25 = 0;
LABEL_40:

          goto LABEL_41;
        }
        v54 = *MEMORY[0x1E0CB2D50];
        v55 = CFSTR("Retrieved nil serialized value for nonnull TRIRolloutHistoryRecord.rolloutId");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIRolloutHistoryRecordOCNTErrorDomain"), 2, v8);
        objc_msgSend(v4, "failWithError:", v9);
        goto LABEL_30;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rampId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(v4, "error");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factorPackSetId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v45 = objc_claimAutoreleasedReturnValue();
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIRolloutHistoryRecord key \"factorPackSetId\" (expected %@, decoded %@)"), v45, v12, 0);
          v52 = *MEMORY[0x1E0CB2D50];
          v53 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIRolloutHistoryRecordOCNTErrorDomain"), 3, v14);
          objc_msgSend(v4, "failWithError:", v15);

          v16 = (void *)v45;
LABEL_36:
          v25 = 0;
          goto LABEL_37;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v9 = 0;
          goto LABEL_30;
        }
      }
      v30 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deploymentId"));
      if ((_DWORD)v30)
        goto LABEL_25;
      objc_msgSend(v4, "error");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deploymentId")) & 1) == 0)
        {
          v50 = *MEMORY[0x1E0CB2D50];
          v51 = CFSTR("Missing serialized value for TRIRolloutHistoryRecord.deploymentId");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIRolloutHistoryRecordOCNTErrorDomain"), 1, v16);
          objc_msgSend(v4, "failWithError:", v42);

          goto LABEL_36;
        }
LABEL_25:
        v46 = v30;
        v31 = objc_alloc(MEMORY[0x1E0C99E60]);
        v32 = objc_opt_class();
        v33 = (void *)objc_msgSend(v31, "initWithObjects:", v32, objc_opt_class(), 0);
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("namespaces"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIRolloutHistoryRecord key \"namespaces\" (expected %@, decoded %@)"), v47, v44, 0);
            v48 = *MEMORY[0x1E0CB2D50];
            v49 = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
            v37 = v16;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIRolloutHistoryRecordOCNTErrorDomain"), 3, v38);
            objc_msgSend(v4, "failWithError:", v39);

            v16 = v37;
            goto LABEL_36;
          }
        }
        else
        {
          objc_msgSend(v4, "error");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            v16 = 0;
            goto LABEL_36;
          }
        }
        self = -[TRIRolloutHistoryRecord initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:](self, "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", v5, v6, v7, v8, v9, v46, v16);
        v25 = self;
LABEL_37:

        goto LABEL_38;
      }
LABEL_30:
      v25 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v56 = *MEMORY[0x1E0CB2D50];
    v57 = CFSTR("Missing serialized value for TRIRolloutHistoryRecord.eventType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = 1;
LABEL_11:
    v8 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("TRIRolloutHistoryRecordOCNTErrorDomain"), v19, v7);
    objc_msgSend(v4, "failWithError:", v8);
LABEL_13:
    v25 = 0;
LABEL_39:

    goto LABEL_40;
  }
LABEL_15:
  v25 = 0;
LABEL_41:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *eventLogTime;
  NSString *rolloutId;
  NSString *rampId;
  TRIFactorPackSetId *factorPackSetId;
  void *v9;
  NSArray *namespaces;
  id v11;

  v4 = a3;
  eventLogTime = self->_eventLogTime;
  v11 = v4;
  if (eventLogTime)
  {
    objc_msgSend(v4, "encodeObject:forKey:", eventLogTime, CFSTR("eventLogTime"));
    v4 = v11;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_eventType, CFSTR("eventType"));
  rolloutId = self->_rolloutId;
  if (rolloutId)
    objc_msgSend(v11, "encodeObject:forKey:", rolloutId, CFSTR("rolloutId"));
  rampId = self->_rampId;
  if (rampId)
    objc_msgSend(v11, "encodeObject:forKey:", rampId, CFSTR("rampId"));
  factorPackSetId = self->_factorPackSetId;
  v9 = v11;
  if (factorPackSetId)
  {
    objc_msgSend(v11, "encodeObject:forKey:", factorPackSetId, CFSTR("factorPackSetId"));
    v9 = v11;
  }
  objc_msgSend(v9, "encodeInt64:forKey:", self->_deploymentId, CFSTR("deploymentId"));
  namespaces = self->_namespaces;
  if (namespaces)
    objc_msgSend(v11, "encodeObject:forKey:", namespaces, CFSTR("namespaces"));

}

- (id)description
{
  id v3;
  NSDate *eventLogTime;
  void *v5;
  TRIFactorPackSetId *factorPackSetId;
  void *v7;
  void *v8;
  __int128 v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  eventLogTime = self->_eventLogTime;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_eventType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&self->_rolloutId;
  factorPackSetId = self->_factorPackSetId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIRolloutHistoryRecord | eventLogTime:%@ eventType:%@ rolloutId:%@ rampId:%@ factorPackSetId:%@ deploymentId:%@ namespaces:%@>"), eventLogTime, v5, v10, factorPackSetId, v7, self->_namespaces);

  return v8;
}

- (NSDate)eventLogTime
{
  return self->_eventLogTime;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (NSString)rampId
{
  return self->_rampId;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_eventLogTime, 0);
}

@end
