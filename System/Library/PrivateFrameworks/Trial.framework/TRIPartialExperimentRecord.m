@implementation TRIPartialExperimentRecord

- (TRIPartialExperimentRecord)initWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  TRIPartialExperimentRecord *v23;
  TRIPartialExperimentRecord *v24;
  void *v26;
  void *v27;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v17 = a4;
  v31 = a5;
  v18 = a5;
  v32 = a6;
  v19 = a6;
  v20 = a9;
  v33 = a10;
  v21 = a11;
  v22 = v21;
  if (v17)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment != nil"));

    if (v22)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces != nil"));

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)TRIPartialExperimentRecord;
  v23 = -[TRIPartialExperimentRecord init](&v34, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_deploymentEnvironment = a3;
    objc_storeStrong((id *)&v23->_experimentDeployment, a4);
    objc_storeStrong((id *)&v24->_treatmentId, v31);
    objc_storeStrong((id *)&v24->_factorPackSetId, v32);
    v24->_type = a7;
    v24->_status = a8;
    objc_storeStrong((id *)&v24->_startDate, a9);
    objc_storeStrong((id *)&v24->_endDate, a10);
    objc_storeStrong((id *)&v24->_namespaces, a11);
    v24->_isShadow = a12;
  }

  return v24;
}

+ (id)recordWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12
{
  uint64_t v12;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;

  v12 = *(_QWORD *)&a7;
  v16 = *(_QWORD *)&a3;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  LOBYTE(v26) = a12;
  v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", v16, v23, v22, v21, v12, a8, v20, v19, v18, v26);

  return v24;
}

- (id)copyWithReplacementDeploymentEnvironment:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", v3, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7);
}

- (id)copyWithReplacementExperimentDeployment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, v4, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8);

  return v6;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, v4, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8);

  return v6;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, v4, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8);

  return v6;
}

- (id)copyWithReplacementType:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, v3, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7);
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, a3, self->_startDate, self->_endDate, self->_namespaces, v7);
}

- (id)copyWithReplacementStartDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, v4, self->_endDate, self->_namespaces, v8);

  return v6;
}

- (id)copyWithReplacementEndDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, v4, self->_namespaces, v8);

  return v6;
}

- (id)copyWithReplacementNamespaces:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, v4, v8);

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  uint64_t v4;

  LOBYTE(v4) = a3;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v4);
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  int deploymentEnvironment;
  int v7;
  void *v8;
  int v9;
  TRIExperimentDeployment *experimentDeployment;
  void *v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  int v15;
  NSString *treatmentId;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  TRIFactorPackSetId *factorPackSetId;
  void *v23;
  int v24;
  int type;
  int64_t status;
  int v27;
  void *v28;
  int v29;
  NSDate *startDate;
  void *v31;
  int v32;
  int v33;
  void *v34;
  int v35;
  NSDate *endDate;
  void *v37;
  int v38;
  int v39;
  void *v40;
  int v41;
  NSArray *namespaces;
  void *v43;
  int v44;
  int isShadow;
  BOOL v46;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_24;
  deploymentEnvironment = self->_deploymentEnvironment;
  if (deploymentEnvironment != objc_msgSend(v4, "deploymentEnvironment"))
    goto LABEL_24;
  v7 = self->_experimentDeployment != 0;
  objc_msgSend(v5, "experimentDeployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v7 == v9)
    goto LABEL_24;
  experimentDeployment = self->_experimentDeployment;
  if (experimentDeployment)
  {
    objc_msgSend(v5, "experimentDeployment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRIExperimentDeployment isEqual:](experimentDeployment, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  v13 = self->_treatmentId != 0;
  objc_msgSend(v5, "treatmentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_24;
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    objc_msgSend(v5, "treatmentId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](treatmentId, "isEqual:", v17);

    if (!v18)
      goto LABEL_24;
  }
  v19 = self->_factorPackSetId != 0;
  objc_msgSend(v5, "factorPackSetId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
    goto LABEL_24;
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    objc_msgSend(v5, "factorPackSetId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[TRIFactorPackSetId isEqual:](factorPackSetId, "isEqual:", v23);

    if (!v24)
      goto LABEL_24;
  }
  type = self->_type;
  if (type != objc_msgSend(v5, "type"))
    goto LABEL_24;
  status = self->_status;
  if (status != objc_msgSend(v5, "status"))
    goto LABEL_24;
  v27 = self->_startDate != 0;
  objc_msgSend(v5, "startDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (v27 == v29)
    goto LABEL_24;
  startDate = self->_startDate;
  if (startDate)
  {
    objc_msgSend(v5, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[NSDate isEqual:](startDate, "isEqual:", v31);

    if (!v32)
      goto LABEL_24;
  }
  v33 = self->_endDate != 0;
  objc_msgSend(v5, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (v33 == v35)
    goto LABEL_24;
  endDate = self->_endDate;
  if (endDate)
  {
    objc_msgSend(v5, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[NSDate isEqual:](endDate, "isEqual:", v37);

    if (!v38)
      goto LABEL_24;
  }
  v39 = self->_namespaces != 0;
  objc_msgSend(v5, "namespaces");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if (v39 == v41
    || (namespaces = self->_namespaces) != 0
    && (objc_msgSend(v5, "namespaces"),
        v43 = (void *)objc_claimAutoreleasedReturnValue(),
        v44 = -[NSArray isEqual:](namespaces, "isEqual:", v43),
        v43,
        !v44))
  {
LABEL_24:
    v46 = 0;
  }
  else
  {
    isShadow = self->_isShadow;
    v46 = isShadow == objc_msgSend(v5, "isShadow");
  }

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  TRIPartialExperimentRecord *v4;
  TRIPartialExperimentRecord *v5;
  BOOL v6;

  v4 = (TRIPartialExperimentRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIPartialExperimentRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t deploymentEnvironment;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  deploymentEnvironment = self->_deploymentEnvironment;
  v4 = -[TRIExperimentDeployment hash](self->_experimentDeployment, "hash")
     - deploymentEnvironment
     + 32 * deploymentEnvironment;
  v5 = -[NSString hash](self->_treatmentId, "hash") - v4 + 32 * v4;
  v6 = -[TRIFactorPackSetId hash](self->_factorPackSetId, "hash");
  v7 = self->_type - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = self->_status - v7 + 32 * v7;
  v9 = -[NSDate hash](self->_startDate, "hash") - v8 + 32 * v8;
  v10 = -[NSDate hash](self->_endDate, "hash") - v9 + 32 * v9;
  v11 = -[NSArray hash](self->_namespaces, "hash");
  return self->_isShadow - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPartialExperimentRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TRIPartialExperimentRecord *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString **v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  uint64_t v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deploymentEnvironment"));
  if ((_DWORD)v5)
    goto LABEL_2;
  objc_msgSend(v4, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deploymentEnvironment")) & 1) == 0)
    {
      v87 = *MEMORY[0x1E0CB2D50];
      v88[0] = CFSTR("Missing serialized value for TRIPartialExperimentRecord.deploymentEnvironment");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 1, v6);
      objc_msgSend(v4, "failWithError:", v7);
      goto LABEL_16;
    }
LABEL_2:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentDeployment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v6 = 0;
        v16 = 0;
LABEL_55:

        goto LABEL_56;
      }
      v85 = *MEMORY[0x1E0CB2D50];
      v86 = CFSTR("Retrieved nil serialized value for nonnull TRIPartialExperimentRecord.experimentDeployment");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 2, v7);
      objc_msgSend(v4, "failWithError:", v8);
      goto LABEL_30;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatmentId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v4, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v7 = 0;
LABEL_16:
        v16 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factorPackSetId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialExperimentRecord key \"factorPackSetId\" (expected %@, decoded %@)"), v10, v12, 0);
        v83 = *MEMORY[0x1E0CB2D50];
        v84 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 3, v14);
        objc_msgSend(v4, "failWithError:", v15);

LABEL_7:
        v16 = 0;
LABEL_51:

        goto LABEL_52;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v8 = 0;
        goto LABEL_30;
      }
    }
    v21 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    if (!(_DWORD)v21)
    {
      objc_msgSend(v4, "error");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_30;
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("type")) & 1) == 0)
      {
        v81 = *MEMORY[0x1E0CB2D50];
        v82 = CFSTR("Missing serialized value for TRIPartialExperimentRecord.type");
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v82;
        v32 = &v81;
        goto LABEL_38;
      }
    }
    v22 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("status"));
    if (v22)
      goto LABEL_21;
    objc_msgSend(v4, "error");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("status")) & 1) != 0)
      {
LABEL_21:
        v65 = v22;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
        v68 = objc_claimAutoreleasedReturnValue();
        if (v68)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)v68;
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v62 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialExperimentRecord key \"startDate\" (expected %@, decoded %@)"), v12, v62, 0);
            v77 = *MEMORY[0x1E0CB2D50];
            v78 = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 3, v26);
            objc_msgSend(v4, "failWithError:", v27);

            v28 = (void *)v62;
LABEL_24:
            v16 = 0;
LABEL_50:

            goto LABEL_51;
          }
        }
        else
        {
          objc_msgSend(v4, "error");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            v10 = 0;
            v16 = 0;
LABEL_52:

            goto LABEL_53;
          }
        }
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
        v64 = objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)v36;
            v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialExperimentRecord key \"endDate\" (expected %@, decoded %@)"), v36, v66, 0);
            v75 = *MEMORY[0x1E0CB2D50];
            v76 = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 3, v40);
            objc_msgSend(v4, "failWithError:", v41);

            v12 = (void *)v64;
            v28 = v38;
            v16 = 0;
            v10 = (void *)v68;
            goto LABEL_50;
          }
        }
        else
        {
          objc_msgSend(v4, "error");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            v12 = 0;
            v16 = 0;
            v10 = (void *)v68;
            goto LABEL_51;
          }
        }
        v43 = objc_alloc(MEMORY[0x1E0C99E60]);
        v44 = objc_opt_class();
        v45 = (void *)objc_msgSend(v43, "initWithObjects:", v44, objc_opt_class(), 0);
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("namespaces"));
        v46 = objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v63 = (void *)v46;
            v47 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("isShadow"));
            v10 = (void *)v68;
            v12 = (void *)v64;
            if (v47)
              goto LABEL_44;
            objc_msgSend(v4, "error");
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
            {
              v16 = 0;
              v10 = (void *)v68;
              v28 = v63;
              v12 = (void *)v64;
              goto LABEL_50;
            }
            v10 = (void *)v68;
            v12 = (void *)v64;
            if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isShadow")) & 1) != 0)
            {
LABEL_44:
              LOBYTE(v61) = v47 != 0;
              self = -[TRIPartialExperimentRecord initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:](self, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", v5, v6, v7, v8, v21, v65, v10, v12, v63, v61);
              v28 = v63;
              v16 = self;
              goto LABEL_50;
            }
            v69 = *MEMORY[0x1E0CB2D50];
            v70 = CFSTR("Missing serialized value for TRIPartialExperimentRecord.isShadow");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 1, v59);
            objc_msgSend(v4, "failWithError:", v60);

            v28 = v63;
            v12 = (void *)v64;
            v10 = (void *)v68;
            goto LABEL_24;
          }
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialExperimentRecord key \"namespaces\" (expected %@, decoded %@)"), v67, v53, 0);
          v71 = *MEMORY[0x1E0CB2D50];
          v72 = v54;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 3, v55);
          objc_msgSend(v4, "failWithError:", v56);

          v28 = (void *)v46;
        }
        else
        {
          objc_msgSend(v4, "error");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v48)
          {
            v73 = *MEMORY[0x1E0CB2D50];
            v74 = CFSTR("Retrieved nil serialized value for nonnull TRIPartialExperimentRecord.namespaces");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 2, v49);
            objc_msgSend(v4, "failWithError:", v50);

          }
          v28 = 0;
        }
        v16 = 0;
        v10 = (void *)v68;
        v12 = (void *)v64;
        goto LABEL_50;
      }
      v79 = *MEMORY[0x1E0CB2D50];
      v80 = CFSTR("Missing serialized value for TRIPartialExperimentRecord.status");
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v80;
      v32 = &v79;
LABEL_38:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialExperimentRecordOCNTErrorDomain"), 1, v10);
      objc_msgSend(v4, "failWithError:", v12);
      goto LABEL_7;
    }
LABEL_30:
    v16 = 0;
LABEL_53:

    goto LABEL_54;
  }
  v16 = 0;
LABEL_56:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  TRIExperimentDeployment *experimentDeployment;
  NSString *treatmentId;
  TRIFactorPackSetId *factorPackSetId;
  void *v7;
  NSDate *startDate;
  NSDate *endDate;
  NSArray *namespaces;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "encodeInt64:forKey:", self->_deploymentEnvironment, CFSTR("deploymentEnvironment"));
  experimentDeployment = self->_experimentDeployment;
  if (experimentDeployment)
    objc_msgSend(v12, "encodeObject:forKey:", experimentDeployment, CFSTR("experimentDeployment"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v12, "encodeObject:forKey:", treatmentId, CFSTR("treatmentId"));
  factorPackSetId = self->_factorPackSetId;
  v7 = v12;
  if (factorPackSetId)
  {
    objc_msgSend(v12, "encodeObject:forKey:", factorPackSetId, CFSTR("factorPackSetId"));
    v7 = v12;
  }
  objc_msgSend(v7, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v12, "encodeInt64:forKey:", self->_status, CFSTR("status"));
  startDate = self->_startDate;
  if (startDate)
    objc_msgSend(v12, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  endDate = self->_endDate;
  if (endDate)
    objc_msgSend(v12, "encodeObject:forKey:", endDate, CFSTR("endDate"));
  namespaces = self->_namespaces;
  v11 = v12;
  if (namespaces)
  {
    objc_msgSend(v12, "encodeObject:forKey:", namespaces, CFSTR("namespaces"));
    v11 = v12;
  }
  objc_msgSend(v11, "encodeInt64:forKey:", self->_isShadow, CFSTR("isShadow"));

}

- (id)description
{
  id v3;
  void *v4;
  TRIFactorPackSetId *factorPackSetId;
  void *v6;
  void *v7;
  NSArray *namespaces;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentEnvironment);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_experimentDeployment;
  factorPackSetId = self->_factorPackSetId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&self->_startDate;
  namespaces = self->_namespaces;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isShadow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIPartialExperimentRecord | deploymentEnvironment:%@ experimentDeployment:%@ treatmentId:%@ factorPackSetId:%@ type:%@ status:%@ startDate:%@ endDate:%@ namespaces:%@ isShadow:%@>"), v4, v13, factorPackSetId, v6, v7, v12, namespaces, v9);

  return v10;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
}

- (TRIExperimentDeployment)experimentDeployment
{
  return self->_experimentDeployment;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (int)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (BOOL)isShadow
{
  return self->_isShadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
}

@end
