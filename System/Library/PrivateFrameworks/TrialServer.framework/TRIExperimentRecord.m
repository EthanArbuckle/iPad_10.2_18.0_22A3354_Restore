@implementation TRIExperimentRecord

- (TRIExperimentRecord)initWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12 isManuallyTargeted:(BOOL)a13 artifact:(id)a14
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  TRIExperimentRecord *v24;
  TRIExperimentRecord *v25;
  void *v27;
  void *v28;
  id v32;
  id v34;
  void *v36;
  void *v37;
  objc_super v39;

  v16 = a4;
  v32 = a5;
  v17 = a5;
  v34 = a6;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a14;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3691, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment != nil"));

  }
  v36 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3692, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces != nil"));

  }
  v23 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3693, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifact != nil"));

  }
  v39.receiver = self;
  v39.super_class = (Class)TRIExperimentRecord;
  v24 = -[TRIExperimentRecord init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_deploymentEnvironment = a3;
    objc_storeStrong((id *)&v24->_experimentDeployment, a4);
    objc_storeStrong((id *)&v25->_treatmentId, v32);
    objc_storeStrong((id *)&v25->_factorPackSetId, v34);
    v25->_type = a7;
    v25->_status = a8;
    objc_storeStrong((id *)&v25->_startDate, a9);
    objc_storeStrong((id *)&v25->_endDate, a10);
    objc_storeStrong((id *)&v25->_namespaces, a11);
    v25->_isShadow = a12;
    v25->_isManuallyTargeted = a13;
    objc_storeStrong((id *)&v25->_artifact, a14);
  }

  return v25;
}

+ (id)recordWithDeploymentEnvironment:(int)a3 experimentDeployment:(id)a4 treatmentId:(id)a5 factorPackSetId:(id)a6 type:(int)a7 status:(int64_t)a8 startDate:(id)a9 endDate:(id)a10 namespaces:(id)a11 isShadow:(BOOL)a12 isManuallyTargeted:(BOOL)a13 artifact:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v27;

  v18 = a14;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  LOWORD(v27) = __PAIR16__(a13, a12);
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", a3, v24, v23, v22, a7, a8, v21, v20, v19, v27, v18);

  return v25;
}

- (id)copyWithReplacementDeploymentEnvironment:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v7) = *(_WORD *)&self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", v3, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementExperimentDeployment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, v4, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, self->_artifact);

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
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, v4, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, self->_artifact);

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
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, v4, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementType:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v7) = *(_WORD *)&self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, v3, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v7) = *(_WORD *)&self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, a3, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementStartDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, v4, self->_endDate, self->_namespaces, v8, self->_artifact);

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
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, v4, self->_namespaces, v8, self->_artifact);

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
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, v4, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  BYTE1(v7) = self->_isManuallyTargeted;
  LOBYTE(v7) = a3;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementIsManuallyTargeted:(BOOL)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  BYTE1(v7) = a3;
  LOBYTE(v7) = self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v7, self->_artifact);
}

- (id)copyWithReplacementArtifact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOWORD(v8) = *(_WORD *)&self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:isManuallyTargeted:artifact:", self->_deploymentEnvironment, self->_experimentDeployment, self->_treatmentId, self->_factorPackSetId, self->_type, self->_status, self->_startDate, self->_endDate, self->_namespaces, v8, v4);

  return v6;
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
  int v12;
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
  int isManuallyTargeted;
  int v47;
  void *v48;
  int v49;
  TRIClientExperimentArtifact *artifact;
  void *v51;
  char v52;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_28;
  deploymentEnvironment = self->_deploymentEnvironment;
  if (deploymentEnvironment != objc_msgSend(v4, "deploymentEnvironment"))
    goto LABEL_28;
  v7 = self->_experimentDeployment != 0;
  objc_msgSend(v5, "experimentDeployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v7 == v9)
    goto LABEL_28;
  experimentDeployment = self->_experimentDeployment;
  if (experimentDeployment)
  {
    objc_msgSend(v5, "experimentDeployment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRIExperimentDeployment isEqual:](experimentDeployment, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  v13 = self->_treatmentId != 0;
  objc_msgSend(v5, "treatmentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_28;
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    objc_msgSend(v5, "treatmentId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](treatmentId, "isEqual:", v17);

    if (!v18)
      goto LABEL_28;
  }
  v19 = self->_factorPackSetId != 0;
  objc_msgSend(v5, "factorPackSetId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
    goto LABEL_28;
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    objc_msgSend(v5, "factorPackSetId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[TRIFactorPackSetId isEqual:](factorPackSetId, "isEqual:", v23);

    if (!v24)
      goto LABEL_28;
  }
  type = self->_type;
  if (type != objc_msgSend(v5, "type"))
    goto LABEL_28;
  status = self->_status;
  if (status != objc_msgSend(v5, "status"))
    goto LABEL_28;
  v27 = self->_startDate != 0;
  objc_msgSend(v5, "startDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (v27 == v29)
    goto LABEL_28;
  startDate = self->_startDate;
  if (startDate)
  {
    objc_msgSend(v5, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[NSDate isEqual:](startDate, "isEqual:", v31);

    if (!v32)
      goto LABEL_28;
  }
  v33 = self->_endDate != 0;
  objc_msgSend(v5, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (v33 == v35)
    goto LABEL_28;
  endDate = self->_endDate;
  if (endDate)
  {
    objc_msgSend(v5, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[NSDate isEqual:](endDate, "isEqual:", v37);

    if (!v38)
      goto LABEL_28;
  }
  v39 = self->_namespaces != 0;
  objc_msgSend(v5, "namespaces");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if (v39 == v41)
    goto LABEL_28;
  namespaces = self->_namespaces;
  if (namespaces)
  {
    objc_msgSend(v5, "namespaces");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[NSArray isEqual:](namespaces, "isEqual:", v43);

    if (!v44)
      goto LABEL_28;
  }
  isShadow = self->_isShadow;
  if (isShadow != objc_msgSend(v5, "isShadow")
    || (isManuallyTargeted = self->_isManuallyTargeted,
        isManuallyTargeted != objc_msgSend(v5, "isManuallyTargeted"))
    || (v47 = self->_artifact != 0,
        objc_msgSend(v5, "artifact"),
        v48 = (void *)objc_claimAutoreleasedReturnValue(),
        v49 = v48 == 0,
        v48,
        v47 == v49))
  {
LABEL_28:
    v52 = 0;
  }
  else
  {
    artifact = self->_artifact;
    if (artifact)
    {
      objc_msgSend(v5, "artifact");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[TRIClientExperimentArtifact isEqual:](artifact, "isEqual:", v51);

    }
    else
    {
      v52 = 1;
    }
  }

  return v52;
}

- (BOOL)isEqual:(id)a3
{
  TRIExperimentRecord *v4;
  TRIExperimentRecord *v5;
  BOOL v6;

  v4 = (TRIExperimentRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIExperimentRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t deploymentEnvironment;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

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
  v12 = self->_isShadow - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
  v13 = self->_isManuallyTargeted - v12 + 32 * v12;
  return -[TRIClientExperimentArtifact hash](self->_artifact, "hash") - v13 + 32 * v13;
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
  void *v11;
  __int128 v13;
  __int128 v14;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentEnvironment);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)&self->_experimentDeployment;
  factorPackSetId = self->_factorPackSetId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_startDate;
  namespaces = self->_namespaces;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isShadow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isManuallyTargeted);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIExperimentRecord | deploymentEnvironment:%@ experimentDeployment:%@ treatmentId:%@ factorPackSetId:%@ type:%@ status:%@ startDate:%@ endDate:%@ namespaces:%@ isShadow:%@ isManuallyTargeted:%@ artifact:%@>"), v4, v14, factorPackSetId, v6, v7, v13, namespaces, v9, v10, self->_artifact);

  return v11;
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

- (BOOL)isManuallyTargeted
{
  return self->_isManuallyTargeted;
}

- (TRIClientExperimentArtifact)artifact
{
  return self->_artifact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifact, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
}

- (id)versionedNamespaces
{
  void *v2;
  void *v3;

  -[TRIExperimentRecord namespaces](self, "namespaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __63__TRIExperimentRecord_VersionedNamespaces__versionedNamespaces__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0DC0BB0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compatibilityVersion");

  v7 = (void *)objc_msgSend(v4, "initWithName:compatibilityVersion:", v5, v6);
  return v7;
}

- (BOOL)isExpiredExperiment
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;

  -[TRIExperimentRecord endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TRIExperimentRecord type](self, "type");
  v5 = 0;
  if (v4 == 1 && v3)
  {
    v6 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "compare:", v6) == -1;

  }
  return v5;
}

@end
