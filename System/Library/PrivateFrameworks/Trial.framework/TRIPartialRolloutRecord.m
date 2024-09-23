@implementation TRIPartialRolloutRecord

+ (id)partialRecordWithFullRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  TRIPartialRolloutRecord *v13;
  uint64_t v15;
  TRIPartialRolloutRecord *v16;

  v3 = a3;
  v16 = [TRIPartialRolloutRecord alloc];
  objc_msgSend(v3, "deployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rampId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeFactorPackSetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTargetingRuleIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetedFactorPackSetId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetedTargetingRuleIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "status");
  objc_msgSend(v3, "namespaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "isShadow");

  LOBYTE(v15) = v12;
  v13 = -[TRIPartialRolloutRecord initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:](v16, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", v4, v5, v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (TRIPartialRolloutRecord)initWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  TRIPartialRolloutRecord *v24;
  TRIPartialRolloutRecord *v25;
  id v27;
  id v28;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v17 = a3;
  v31 = a4;
  v18 = a4;
  v32 = a5;
  v19 = a5;
  v33 = a6;
  v20 = a6;
  v21 = a7;
  v34 = a8;
  v22 = a10;
  v23 = v22;
  if (v17)
  {
    if (v22)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 2097, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment != nil"));

    if (v23)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 2098, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces != nil"));

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)TRIPartialRolloutRecord;
  v24 = -[TRIPartialRolloutRecord init](&v35, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_deployment, a3);
    objc_storeStrong((id *)&v25->_rampId, v31);
    objc_storeStrong((id *)&v25->_activeFactorPackSetId, v32);
    objc_storeStrong((id *)&v25->_activeTargetingRuleIndex, v33);
    objc_storeStrong((id *)&v25->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v25->_targetedTargetingRuleIndex, a8);
    v25->_status = a9;
    objc_storeStrong((id *)&v25->_namespaces, a10);
    v25->_isShadow = a11;
  }

  return v25;
}

+ (id)recordWithDeployment:(id)a3 rampId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 namespaces:(id)a10 isShadow:(BOOL)a11
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

  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  LOBYTE(v27) = a11;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", v24, v23, v22, v21, v20, v19, a9, v18, v27);

  return v25;
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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", v4, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8);

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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, v4, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8);

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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, self->_rampId, v4, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8);

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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, v4, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8);

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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, v4, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v8);

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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, v4, self->_status, self->_namespaces, v8);

  return v6;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isShadow;
  return (id)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, a3, self->_namespaces, v7);
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
  v6 = (void *)objc_msgSend(v5, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, v4, v8);

  return v6;
}

- (id)copyWithReplacementIsShadow:(BOOL)a3
{
  uint64_t v4;

  LOBYTE(v4) = a3;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", self->_deployment, self->_rampId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_namespaces, v4);
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
  _BOOL4 v11;
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
  BOOL v50;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_25;
  v6 = self->_deployment != 0;
  objc_msgSend(v4, "deployment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_25;
  deployment = self->_deployment;
  if (deployment)
  {
    objc_msgSend(v5, "deployment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIRolloutDeployment isEqual:](deployment, "isEqual:", v10);

    if (!v11)
      goto LABEL_25;
  }
  v12 = self->_rampId != 0;
  objc_msgSend(v5, "rampId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_25;
  rampId = self->_rampId;
  if (rampId)
  {
    objc_msgSend(v5, "rampId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TRIRampId isEqual:](rampId, "isEqual:", v16);

    if (!v17)
      goto LABEL_25;
  }
  v18 = self->_activeFactorPackSetId != 0;
  objc_msgSend(v5, "activeFactorPackSetId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_25;
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    objc_msgSend(v5, "activeFactorPackSetId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[TRIFactorPackSetId isEqual:](activeFactorPackSetId, "isEqual:", v22);

    if (!v23)
      goto LABEL_25;
  }
  v24 = self->_activeTargetingRuleIndex != 0;
  objc_msgSend(v5, "activeTargetingRuleIndex");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_25;
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    objc_msgSend(v5, "activeTargetingRuleIndex");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSNumber isEqual:](activeTargetingRuleIndex, "isEqual:", v28);

    if (!v29)
      goto LABEL_25;
  }
  v30 = self->_targetedFactorPackSetId != 0;
  objc_msgSend(v5, "targetedFactorPackSetId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_25;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    objc_msgSend(v5, "targetedFactorPackSetId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TRIFactorPackSetId isEqual:](targetedFactorPackSetId, "isEqual:", v34);

    if (!v35)
      goto LABEL_25;
  }
  v36 = self->_targetedTargetingRuleIndex != 0;
  objc_msgSend(v5, "targetedTargetingRuleIndex");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v36 == v38)
    goto LABEL_25;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    objc_msgSend(v5, "targetedTargetingRuleIndex");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[NSNumber isEqual:](targetedTargetingRuleIndex, "isEqual:", v40);

    if (!v41)
      goto LABEL_25;
  }
  status = self->_status;
  if (status != objc_msgSend(v5, "status"))
    goto LABEL_25;
  v43 = self->_namespaces != 0;
  objc_msgSend(v5, "namespaces");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (v43 == v45
    || (namespaces = self->_namespaces) != 0
    && (objc_msgSend(v5, "namespaces"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = -[NSArray isEqual:](namespaces, "isEqual:", v47),
        v47,
        !v48))
  {
LABEL_25:
    v50 = 0;
  }
  else
  {
    isShadow = self->_isShadow;
    v50 = isShadow == objc_msgSend(v5, "isShadow");
  }

  return v50;
}

- (BOOL)isEqual:(id)a3
{
  TRIPartialRolloutRecord *v4;
  TRIPartialRolloutRecord *v5;
  BOOL v6;

  v4 = (TRIPartialRolloutRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIPartialRolloutRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;

  v3 = -[TRIRolloutDeployment hash](self->_deployment, "hash");
  v4 = -[TRIRampId hash](self->_rampId, "hash") - v3 + 32 * v3;
  v5 = -[TRIFactorPackSetId hash](self->_activeFactorPackSetId, "hash") - v4 + 32 * v4;
  v6 = -[NSNumber hash](self->_activeTargetingRuleIndex, "hash") - v5 + 32 * v5;
  v7 = -[TRIFactorPackSetId hash](self->_targetedFactorPackSetId, "hash") - v6 + 32 * v6;
  v8 = -[NSNumber hash](self->_targetedTargetingRuleIndex, "hash");
  v9 = self->_status - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  v10 = -[NSArray hash](self->_namespaces, "hash");
  return self->_isShadow - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPartialRolloutRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TRIPartialRolloutRecord *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  void *v26;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deployment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rampId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialRolloutRecord key \"rampId\" (expected %@, decoded %@)"), v8, v10, 0);
        v81 = *MEMORY[0x1E0CB2D50];
        v82 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v13);
LABEL_20:
        v15 = 0;
LABEL_21:

LABEL_22:
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v6 = 0;
        v15 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeFactorPackSetId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialRolloutRecord key \"activeFactorPackSetId\" (expected %@, decoded %@)"), v10, v11, 0);
        v79 = *MEMORY[0x1E0CB2D50];
        v80 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 3, v13);
        objc_msgSend(v4, "failWithError:", v19);
LABEL_19:

        goto LABEL_20;
      }
LABEL_16:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeTargetingRuleIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v63 = v10;
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialRolloutRecord key \"activeTargetingRuleIndex\" (expected %@, decoded %@)"), v22, v12, 0);
          v77 = *MEMORY[0x1E0CB2D50];
          v78 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 3, v19);
          objc_msgSend(v4, "failWithError:", v24);

          v11 = (void *)v22;
          v10 = v63;
          goto LABEL_19;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v10 = 0;
          v15 = 0;
          goto LABEL_24;
        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetedFactorPackSetId"));
      v62 = objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialRolloutRecord key \"targetedFactorPackSetId\" (expected %@, decoded %@)"), v12, v13, 0);
          v75 = *MEMORY[0x1E0CB2D50];
          v76 = v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 3, v29);
          objc_msgSend(v4, "failWithError:", v30);

          v11 = (void *)v62;
LABEL_33:
          v15 = 0;
          goto LABEL_21;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v11 = 0;
          v15 = 0;
          goto LABEL_23;
        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetedTargetingRuleIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v59 = objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialRolloutRecord key \"targetedTargetingRuleIndex\" (expected %@, decoded %@)"), v13, v59, 0);
          v73 = *MEMORY[0x1E0CB2D50];
          v74 = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 3, v34);
          objc_msgSend(v4, "failWithError:", v35);

          v36 = (void *)v59;
LABEL_52:

LABEL_53:
          v15 = 0;
          v11 = (void *)v62;
          goto LABEL_21;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v12 = 0;
          goto LABEL_47;
        }
      }
      v38 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("status"));
      if (v38)
      {
LABEL_42:
        v60 = v38;
        v39 = objc_alloc(MEMORY[0x1E0C99E60]);
        v40 = objc_opt_class();
        v41 = (void *)objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("namespaces"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(v4, "error");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
          {
            v69 = *MEMORY[0x1E0CB2D50];
            v70 = CFSTR("Retrieved nil serialized value for nonnull TRIPartialRolloutRecord.namespaces");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 2, v45);
            objc_msgSend(v4, "failWithError:", v46);

          }
          v13 = 0;
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v42 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("isShadow"));
          v11 = (void *)v62;
          if (v42)
            goto LABEL_45;
          objc_msgSend(v4, "error");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
          {
            v15 = 0;
            v11 = (void *)v62;
            goto LABEL_21;
          }
          v11 = (void *)v62;
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isShadow")) & 1) != 0)
          {
LABEL_45:
            LOBYTE(v55) = v42 != 0;
            self = -[TRIPartialRolloutRecord initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:](self, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:", v5, v6, v8, v10, v11, v12, v60, v13, v55);
            v15 = self;
            goto LABEL_21;
          }
          v65 = *MEMORY[0x1E0CB2D50];
          v66 = CFSTR("Missing serialized value for TRIPartialRolloutRecord.isShadow");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 1, v53);
          objc_msgSend(v4, "failWithError:", v54);

          v11 = (void *)v62;
          goto LABEL_33;
        }
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v64 = objc_claimAutoreleasedReturnValue();
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialRolloutRecord key \"namespaces\" (expected %@, decoded %@)"), v64, v61, 0);
        v67 = *MEMORY[0x1E0CB2D50];
        v68 = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 3, v49);
        objc_msgSend(v4, "failWithError:", v50);

        v36 = (void *)v64;
        goto LABEL_52;
      }
      objc_msgSend(v4, "error");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("status")) & 1) == 0)
        {
          v71 = *MEMORY[0x1E0CB2D50];
          v72 = CFSTR("Missing serialized value for TRIPartialRolloutRecord.status");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 1, v13);
          objc_msgSend(v4, "failWithError:", v51);

          goto LABEL_53;
        }
        goto LABEL_42;
      }
LABEL_47:
      v15 = 0;
      v11 = (void *)v62;
      goto LABEL_22;
    }
    objc_msgSend(v4, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_16;
    v8 = 0;
LABEL_15:
    v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v83 = *MEMORY[0x1E0CB2D50];
    v84[0] = CFSTR("Retrieved nil serialized value for nonnull TRIPartialRolloutRecord.deployment");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialRolloutRecordOCNTErrorDomain"), 2, v6);
    objc_msgSend(v4, "failWithError:", v8);
    goto LABEL_15;
  }
  v15 = 0;
LABEL_27:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TRIRolloutDeployment *deployment;
  TRIRampId *rampId;
  TRIFactorPackSetId *activeFactorPackSetId;
  NSNumber *activeTargetingRuleIndex;
  TRIFactorPackSetId *targetedFactorPackSetId;
  NSNumber *targetedTargetingRuleIndex;
  NSArray *namespaces;
  id v12;

  v4 = a3;
  deployment = self->_deployment;
  v12 = v4;
  if (deployment)
  {
    objc_msgSend(v4, "encodeObject:forKey:", deployment, CFSTR("deployment"));
    v4 = v12;
  }
  rampId = self->_rampId;
  if (rampId)
  {
    objc_msgSend(v12, "encodeObject:forKey:", rampId, CFSTR("rampId"));
    v4 = v12;
  }
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    objc_msgSend(v12, "encodeObject:forKey:", activeFactorPackSetId, CFSTR("activeFactorPackSetId"));
    v4 = v12;
  }
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    objc_msgSend(v12, "encodeObject:forKey:", activeTargetingRuleIndex, CFSTR("activeTargetingRuleIndex"));
    v4 = v12;
  }
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    objc_msgSend(v12, "encodeObject:forKey:", targetedFactorPackSetId, CFSTR("targetedFactorPackSetId"));
    v4 = v12;
  }
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    objc_msgSend(v12, "encodeObject:forKey:", targetedTargetingRuleIndex, CFSTR("targetedTargetingRuleIndex"));
    v4 = v12;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_status, CFSTR("status"));
  namespaces = self->_namespaces;
  if (namespaces)
    objc_msgSend(v12, "encodeObject:forKey:", namespaces, CFSTR("namespaces"));
  objc_msgSend(v12, "encodeInt64:forKey:", self->_isShadow, CFSTR("isShadow"));

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
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIPartialRolloutRecord | deployment:%@ rampId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ namespaces:%@ isShadow:%@>"), v12, v11, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, namespaces, v8);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end
