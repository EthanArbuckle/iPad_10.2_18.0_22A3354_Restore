@implementation TRIExperimentHistoryRecord

- (TRIExperimentHistoryRecord)initWithEventDate:(id)a3 eventType:(unsigned __int8)a4 deploymentEnvironment:(int)a5 experimentId:(id)a6 deploymentId:(int)a7 treatmentId:(id)a8 errorOrDeactivationReason:(id)a9 namespaces:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  TRIExperimentHistoryRecord *v18;
  TRIExperimentHistoryRecord *v19;
  void *v21;
  void *v22;
  void *v23;
  id v28;
  objc_super v29;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v28 = a9;
  v17 = a10;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1043, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentId != nil"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1042, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventDate != nil"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1044, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId != nil"));

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)TRIExperimentHistoryRecord;
  v18 = -[TRIExperimentHistoryRecord init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventDate, a3);
    v19->_eventType = a4;
    v19->_deploymentEnvironment = a5;
    objc_storeStrong((id *)&v19->_experimentId, a6);
    v19->_deploymentId = a7;
    objc_storeStrong((id *)&v19->_treatmentId, a8);
    objc_storeStrong((id *)&v19->_errorOrDeactivationReason, a9);
    objc_storeStrong((id *)&v19->_namespaces, a10);
  }

  return v19;
}

+ (id)recordWithEventDate:(id)a3 eventType:(unsigned __int8)a4 deploymentEnvironment:(int)a5 experimentId:(id)a6 deploymentId:(int)a7 treatmentId:(id)a8 errorOrDeactivationReason:(id)a9 namespaces:(id)a10
{
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v11 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a5;
  v14 = a4;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a6;
  v21 = a3;
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", v21, v14, v13, v20, v11, v19, v18, v17);

  return v22;
}

- (id)copyWithReplacementEventDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", v4, self->_eventType, self->_deploymentEnvironment, self->_experimentId, self->_deploymentId, self->_treatmentId, self->_errorOrDeactivationReason, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementEventType:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", self->_eventDate, a3, self->_deploymentEnvironment, self->_experimentId, self->_deploymentId, self->_treatmentId, self->_errorOrDeactivationReason, self->_namespaces);
}

- (id)copyWithReplacementDeploymentEnvironment:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", self->_eventDate, self->_eventType, *(_QWORD *)&a3, self->_experimentId, self->_deploymentId, self->_treatmentId, self->_errorOrDeactivationReason, self->_namespaces);
}

- (id)copyWithReplacementExperimentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", self->_eventDate, self->_eventType, self->_deploymentEnvironment, v4, self->_deploymentId, self->_treatmentId, self->_errorOrDeactivationReason, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", self->_eventDate, self->_eventType, self->_deploymentEnvironment, self->_experimentId, *(_QWORD *)&a3, self->_treatmentId, self->_errorOrDeactivationReason, self->_namespaces);
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", self->_eventDate, self->_eventType, self->_deploymentEnvironment, self->_experimentId, self->_deploymentId, v4, self->_errorOrDeactivationReason, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementErrorOrDeactivationReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", self->_eventDate, self->_eventType, self->_deploymentEnvironment, self->_experimentId, self->_deploymentId, self->_treatmentId, v4, self->_namespaces);

  return v5;
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", self->_eventDate, self->_eventType, self->_deploymentEnvironment, self->_experimentId, self->_deploymentId, self->_treatmentId, self->_errorOrDeactivationReason, v4);

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
  int deploymentEnvironment;
  int v14;
  void *v15;
  int v16;
  NSString *experimentId;
  void *v18;
  int v19;
  int deploymentId;
  int v21;
  void *v22;
  int v23;
  NSString *treatmentId;
  void *v25;
  int v26;
  int v27;
  void *v28;
  int v29;
  NSString *errorOrDeactivationReason;
  void *v31;
  int v32;
  int v33;
  void *v34;
  int v35;
  NSArray *namespaces;
  void *v37;
  char v38;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_20;
  v6 = self->_eventDate != 0;
  objc_msgSend(v4, "eventDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_20;
  eventDate = self->_eventDate;
  if (eventDate)
  {
    objc_msgSend(v5, "eventDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDate isEqual:](eventDate, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  eventType = self->_eventType;
  if (eventType != objc_msgSend(v5, "eventType"))
    goto LABEL_20;
  deploymentEnvironment = self->_deploymentEnvironment;
  if (deploymentEnvironment != objc_msgSend(v5, "deploymentEnvironment"))
    goto LABEL_20;
  v14 = self->_experimentId != 0;
  objc_msgSend(v5, "experimentId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v14 == v16)
    goto LABEL_20;
  experimentId = self->_experimentId;
  if (experimentId)
  {
    objc_msgSend(v5, "experimentId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NSString isEqual:](experimentId, "isEqual:", v18);

    if (!v19)
      goto LABEL_20;
  }
  deploymentId = self->_deploymentId;
  if (deploymentId != objc_msgSend(v5, "deploymentId"))
    goto LABEL_20;
  v21 = self->_treatmentId != 0;
  objc_msgSend(v5, "treatmentId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v21 == v23)
    goto LABEL_20;
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    objc_msgSend(v5, "treatmentId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[NSString isEqual:](treatmentId, "isEqual:", v25);

    if (!v26)
      goto LABEL_20;
  }
  v27 = self->_errorOrDeactivationReason != 0;
  objc_msgSend(v5, "errorOrDeactivationReason");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (v27 == v29)
    goto LABEL_20;
  errorOrDeactivationReason = self->_errorOrDeactivationReason;
  if (errorOrDeactivationReason)
  {
    objc_msgSend(v5, "errorOrDeactivationReason");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[NSString isEqual:](errorOrDeactivationReason, "isEqual:", v31);

    if (!v32)
      goto LABEL_20;
  }
  v33 = self->_namespaces != 0;
  objc_msgSend(v5, "namespaces");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (v33 == v35)
  {
LABEL_20:
    v38 = 0;
  }
  else
  {
    namespaces = self->_namespaces;
    if (namespaces)
    {
      objc_msgSend(v5, "namespaces");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[NSArray isEqual:](namespaces, "isEqual:", v37);

    }
    else
    {
      v38 = 1;
    }
  }

  return v38;
}

- (BOOL)isEqual:(id)a3
{
  TRIExperimentHistoryRecord *v4;
  TRIExperimentHistoryRecord *v5;
  BOOL v6;

  v4 = (TRIExperimentHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIExperimentHistoryRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSDate hash](self->_eventDate, "hash");
  v4 = self->_eventType - v3 + 32 * v3;
  v5 = self->_deploymentEnvironment - v4 + 32 * v4;
  v6 = -[NSString hash](self->_experimentId, "hash");
  v7 = self->_deploymentId - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = -[NSString hash](self->_treatmentId, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_errorOrDeactivationReason, "hash") - v8 + 32 * v8;
  return -[NSArray hash](self->_namespaces, "hash") - v9 + 32 * v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIExperimentHistoryRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString **v28;
  uint64_t *v29;
  void *v30;
  TRIExperimentHistoryRecord *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  objc_class *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
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
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIExperimentHistoryRecord key \"eventDate\" (expected %@, decoded %@)"), v8, v10, 0);
      v66 = *MEMORY[0x1E0CB2D50];
      v67 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIExperimentHistoryRecordOCNTErrorDomain"), 3, v24);
      objc_msgSend(v4, "failWithError:", v25);

      goto LABEL_27;
    }
    v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("eventType"));
    if (!v6)
    {
      objc_msgSend(v4, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        goto LABEL_18;
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("eventType")) & 1) == 0)
      {
        v64 = *MEMORY[0x1E0CB2D50];
        v65 = CFSTR("Missing serialized value for TRIExperimentHistoryRecord.eventType");
        v27 = (void *)MEMORY[0x1E0C99D80];
        v28 = &v65;
        v29 = &v64;
LABEL_25:
        objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = 1;
        goto LABEL_26;
      }
    }
    v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deploymentEnvironment"));
    if ((_DWORD)v7)
      goto LABEL_5;
    objc_msgSend(v4, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deploymentEnvironment")) & 1) != 0)
      {
LABEL_5:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentId"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deploymentId"));
          if ((_DWORD)v9)
          {
LABEL_7:
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatmentId"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorOrDeactivationReason"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v12 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v12);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v14);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIExperimentHistoryRecord key \"errorOrDeactivationReason\" (expected %@, decoded %@)"), v13, v50, 0);
                  v54 = *MEMORY[0x1E0CB2D50];
                  v55 = v15;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIExperimentHistoryRecordOCNTErrorDomain"), 3, v16);
                  objc_msgSend(v4, "failWithError:", v17);

LABEL_44:
                  v31 = 0;
LABEL_49:

                  goto LABEL_50;
                }
LABEL_36:
                v51 = v11;
                v39 = objc_alloc(MEMORY[0x1E0C99E60]);
                v40 = objc_opt_class();
                v41 = (void *)objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
                objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("namespaces"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                if (v13)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v42 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v42);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v43 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v43);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIExperimentHistoryRecord key \"namespaces\" (expected %@, decoded %@)"), v49, v44, 0);
                    v52 = *MEMORY[0x1E0CB2D50];
                    v53 = v45;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIExperimentHistoryRecordOCNTErrorDomain"), 3, v46);
                    objc_msgSend(v4, "failWithError:", v47);

LABEL_47:
                    v31 = 0;
                    v11 = v51;
                    goto LABEL_49;
                  }
                }
                else
                {
                  objc_msgSend(v4, "error");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v48)
                  {
                    v13 = 0;
                    goto LABEL_47;
                  }
                }
                v11 = v51;
                self = -[TRIExperimentHistoryRecord initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:](self, "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", v5, v6, v7, v8, v9, v10, v51, v13);
                v31 = self;
                goto LABEL_49;
              }
              objc_msgSend(v4, "error");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v38)
                goto LABEL_36;
              v11 = 0;
LABEL_42:
              v31 = 0;
LABEL_50:

              goto LABEL_28;
            }
            objc_msgSend(v4, "error");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
            {
              v56 = *MEMORY[0x1E0CB2D50];
              v57 = CFSTR("Retrieved nil serialized value for nonnull TRIExperimentHistoryRecord.treatmentId");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIExperimentHistoryRecordOCNTErrorDomain"), 2, v11);
              objc_msgSend(v4, "failWithError:", v13);
              goto LABEL_44;
            }
            v10 = 0;
LABEL_27:
            v31 = 0;
LABEL_28:

            goto LABEL_29;
          }
          objc_msgSend(v4, "error");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
LABEL_22:
            v31 = 0;
LABEL_29:

            goto LABEL_30;
          }
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deploymentId")) & 1) != 0)
            goto LABEL_7;
          v58 = *MEMORY[0x1E0CB2D50];
          v59 = CFSTR("Missing serialized value for TRIExperimentHistoryRecord.deploymentId");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = 1;
        }
        else
        {
          objc_msgSend(v4, "error");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            v8 = 0;
            goto LABEL_22;
          }
          v60 = *MEMORY[0x1E0CB2D50];
          v61 = CFSTR("Retrieved nil serialized value for nonnull TRIExperimentHistoryRecord.experimentId");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = 2;
        }
        v11 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", CFSTR("TRIExperimentHistoryRecordOCNTErrorDomain"), v37, v10);
        objc_msgSend(v4, "failWithError:", v11);
        goto LABEL_42;
      }
      v62 = *MEMORY[0x1E0CB2D50];
      v63 = CFSTR("Missing serialized value for TRIExperimentHistoryRecord.deploymentEnvironment");
      v27 = (void *)MEMORY[0x1E0C99D80];
      v28 = &v63;
      v29 = &v62;
      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v68 = *MEMORY[0x1E0CB2D50];
      v69[0] = CFSTR("Retrieved nil serialized value for nonnull TRIExperimentHistoryRecord.eventDate");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = 2;
LABEL_26:
      v10 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("TRIExperimentHistoryRecordOCNTErrorDomain"), v20, v8);
      objc_msgSend(v4, "failWithError:", v10);
      goto LABEL_27;
    }
  }
LABEL_18:
  v31 = 0;
LABEL_30:

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *eventDate;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *errorOrDeactivationReason;
  NSArray *namespaces;
  void *v10;
  id v11;

  v4 = a3;
  eventDate = self->_eventDate;
  v11 = v4;
  if (eventDate)
  {
    objc_msgSend(v4, "encodeObject:forKey:", eventDate, CFSTR("eventDate"));
    v4 = v11;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_eventType, CFSTR("eventType"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_deploymentEnvironment, CFSTR("deploymentEnvironment"));
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v11, "encodeObject:forKey:", experimentId, CFSTR("experimentId"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_deploymentId, CFSTR("deploymentId"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v11, "encodeObject:forKey:", treatmentId, CFSTR("treatmentId"));
  errorOrDeactivationReason = self->_errorOrDeactivationReason;
  if (errorOrDeactivationReason)
    objc_msgSend(v11, "encodeObject:forKey:", errorOrDeactivationReason, CFSTR("errorOrDeactivationReason"));
  namespaces = self->_namespaces;
  v10 = v11;
  if (namespaces)
  {
    objc_msgSend(v11, "encodeObject:forKey:", namespaces, CFSTR("namespaces"));
    v10 = v11;
  }

}

- (id)description
{
  id v3;
  NSDate *eventDate;
  void *v5;
  void *v6;
  NSString *experimentId;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  eventDate = self->_eventDate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_eventType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentEnvironment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  experimentId = self->_experimentId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIExperimentHistoryRecord | eventDate:%@ eventType:%@ deploymentEnvironment:%@ experimentId:%@ deploymentId:%@ treatmentId:%@ errorOrDeactivationReason:%@ namespaces:%@>"), eventDate, v5, v6, experimentId, v8, self->_treatmentId, self->_errorOrDeactivationReason, self->_namespaces);

  return v9;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)errorOrDeactivationReason
{
  return self->_errorOrDeactivationReason;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_errorOrDeactivationReason, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
}

@end
