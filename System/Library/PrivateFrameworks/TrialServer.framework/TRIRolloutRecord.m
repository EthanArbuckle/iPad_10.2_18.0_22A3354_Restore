@implementation TRIRolloutRecord

- (TRIRolloutRecord)initWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11 artifact:(id)a12
{
  id v18;
  id v19;
  TRIRolloutRecord *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  TRIRolloutRecord *v25;
  TRIRolloutRecord *v26;
  void *v28;
  void *v29;
  void *v30;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v18 = a3;
  v37 = a4;
  v36 = a5;
  v33 = a6;
  v19 = a6;
  v20 = self;
  v38 = v19;
  v34 = a8;
  v35 = a7;
  v21 = a8;
  v22 = a10;
  v23 = a12;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("TRIServerTupleTypes.m"), 1900, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment != nil"));

  }
  v24 = v22;
  if (v22)
  {
    if (v23)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("TRIServerTupleTypes.m"), 1901, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces != nil"));

    if (v23)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("TRIServerTupleTypes.m"), 1902, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifact != nil"));

LABEL_5:
  v39.receiver = v20;
  v39.super_class = (Class)TRIRolloutRecord;
  v25 = -[TRIRolloutRecord init](&v39, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_deployment, a3);
    objc_storeStrong((id *)&v26->_rampId, a4);
    objc_storeStrong((id *)&v26->_activeFactorPackSetId, a5);
    objc_storeStrong((id *)&v26->_activeTargetingRuleIndex, v33);
    objc_storeStrong((id *)&v26->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v26->_targetedTargetingRuleIndex, v34);
    v26->_status = a9;
    objc_storeStrong((id *)&v26->_namespaces, a10);
    v26->_isShadow = a11;
    objc_storeStrong((id *)&v26->_artifact, a12);
  }

  return v26;
}

+ (id)recordWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11 artifact:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;

  v19 = a12;
  v20 = a10;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  LOBYTE(v29) = a11;
  v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", v26, v25, v24, v23, v22, v21, a9, v20, v29, v19);

  return v27;
}

- (id)copyWithReplacementDeployment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", v4, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementRampId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, v4, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementActiveFactorPackSetId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, v4, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, v4, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, v4, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, v4, self->_status, self->_namespaces, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, a3, self->_namespaces, v7, self->_artifact);
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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, v4, v8, self->_artifact);

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  uint64_t v4;

  LOBYTE(v4) = a3;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v4, self->_artifact);
}

- (id)copyWithReplacementArtifact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isShadow;
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8, v4);

  return v6;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIRolloutDeployment *deployment;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  TRIRampId *rampId;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  TRIFactorPackSetId *activeFactorPackSetId;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  NSNumber *activeTargetingRuleIndex;
  void *v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  TRIFactorPackSetId *targetedFactorPackSetId;
  void *v34;
  int v35;
  int v36;
  void *v37;
  int v38;
  NSNumber *targetedTargetingRuleIndex;
  void *v40;
  int v41;
  int64_t status;
  int v43;
  void *v44;
  int v45;
  NSArray *namespaces;
  void *v47;
  int v48;
  int isShadow;
  int v50;
  void *v51;
  int v52;
  TRIClientRolloutArtifact *artifact;
  void *v54;
  char v55;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_28;
  v6 = self->_deployment != 0;
  objc_msgSend(v4, "deployment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_28;
  deployment = self->_deployment;
  if (deployment)
  {
    objc_msgSend(v5, "deployment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIRolloutDeployment isEqual:](deployment, "isEqual:", v10);

    if (!v11)
      goto LABEL_28;
  }
  v12 = self->_rampId != 0;
  objc_msgSend(v5, "rampId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_28;
  rampId = self->_rampId;
  if (rampId)
  {
    objc_msgSend(v5, "rampId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TRIRampId isEqual:](rampId, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  v18 = self->_activeFactorPackSetId != 0;
  objc_msgSend(v5, "activeFactorPackSetId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_28;
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    objc_msgSend(v5, "activeFactorPackSetId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[TRIFactorPackSetId isEqual:](activeFactorPackSetId, "isEqual:", v22);

    if (!v23)
      goto LABEL_28;
  }
  v24 = self->_activeTargetingRuleIndex != 0;
  objc_msgSend(v5, "activeTargetingRuleIndex");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_28;
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    objc_msgSend(v5, "activeTargetingRuleIndex");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSNumber isEqual:](activeTargetingRuleIndex, "isEqual:", v28);

    if (!v29)
      goto LABEL_28;
  }
  v30 = self->_targetedFactorPackSetId != 0;
  objc_msgSend(v5, "targetedFactorPackSetId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_28;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    objc_msgSend(v5, "targetedFactorPackSetId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TRIFactorPackSetId isEqual:](targetedFactorPackSetId, "isEqual:", v34);

    if (!v35)
      goto LABEL_28;
  }
  v36 = self->_targetedTargetingRuleIndex != 0;
  objc_msgSend(v5, "targetedTargetingRuleIndex");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v36 == v38)
    goto LABEL_28;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    objc_msgSend(v5, "targetedTargetingRuleIndex");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[NSNumber isEqual:](targetedTargetingRuleIndex, "isEqual:", v40);

    if (!v41)
      goto LABEL_28;
  }
  status = self->_status;
  if (status != objc_msgSend(v5, "status"))
    goto LABEL_28;
  v43 = self->_namespaces != 0;
  objc_msgSend(v5, "namespaces");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (v43 == v45)
    goto LABEL_28;
  namespaces = self->_namespaces;
  if (namespaces)
  {
    objc_msgSend(v5, "namespaces");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[NSArray isEqual:](namespaces, "isEqual:", v47);

    if (!v48)
      goto LABEL_28;
  }
  isShadow = self->_isShadow;
  if (isShadow != objc_msgSend(v5, "isShadow")
    || (v50 = self->_artifact != 0,
        objc_msgSend(v5, "artifact"),
        v51 = (void *)objc_claimAutoreleasedReturnValue(),
        v52 = v51 == 0,
        v51,
        v50 == v52))
  {
LABEL_28:
    v55 = 0;
  }
  else
  {
    artifact = self->_artifact;
    if (artifact)
    {
      objc_msgSend(v5, "artifact");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[TRIClientRolloutArtifact isEqual:](artifact, "isEqual:", v54);

    }
    else
    {
      v55 = 1;
    }
  }

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  TRIRolloutRecord *v4;
  TRIRolloutRecord *v5;
  BOOL v6;

  v4 = (TRIRolloutRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIRolloutRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[TRIRolloutDeployment hash](self->_deployment, "hash");
  v4 = -[TRIRampId hash](self->_rampId, "hash") - v3 + 32 * v3;
  v5 = -[TRIFactorPackSetId hash](self->_activeFactorPackSetId, "hash") - v4 + 32 * v4;
  v6 = -[NSNumber hash](self->_activeTargetingRuleIndex, "hash") - v5 + 32 * v5;
  v7 = -[TRIFactorPackSetId hash](self->_targetedFactorPackSetId, "hash") - v6 + 32 * v6;
  v8 = -[NSNumber hash](self->_targetedTargetingRuleIndex, "hash");
  v9 = self->_status - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  v10 = -[NSArray hash](self->_namespaces, "hash");
  v11 = self->_isShadow - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  return -[TRIClientRolloutArtifact hash](self->_artifact, "hash") - v11 + 32 * v11;
}

- (id)description
{
  id v3;
  TRIFactorPackSetId *targetedFactorPackSetId;
  NSNumber *targetedTargetingRuleIndex;
  void *v6;
  NSArray *namespaces;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = *(_OWORD *)&self->_deployment;
  v11 = *(_OWORD *)&self->_activeFactorPackSetId;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  namespaces = self->_namespaces;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isShadow);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIRolloutRecord | deployment:%@ rampId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ namespaces:%@ isShadow:%@ artifact:%@>"), v12, v11, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, namespaces, v8, self->_artifact);

  return v9;
}

- (TRIRolloutDeployment)deployment
{
  return self->_deployment;
}

- (TRIRampId)rampId
{
  return self->_rampId;
}

- (TRIFactorPackSetId)activeFactorPackSetId
{
  return self->_activeFactorPackSetId;
}

- (NSNumber)activeTargetingRuleIndex
{
  return self->_activeTargetingRuleIndex;
}

- (TRIFactorPackSetId)targetedFactorPackSetId
{
  return self->_targetedFactorPackSetId;
}

- (NSNumber)targetedTargetingRuleIndex
{
  return self->_targetedTargetingRuleIndex;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (BOOL)isShadow
{
  return self->_isShadow;
}

- (TRIClientRolloutArtifact)artifact
{
  return self->_artifact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifact, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end
