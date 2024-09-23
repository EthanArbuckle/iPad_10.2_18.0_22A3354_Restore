@implementation TRIPartialBMLTRecord

- (TRIPartialBMLTRecord)initWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 namespace:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  TRIPartialBMLTRecord *v22;
  TRIPartialBMLTRecord *v23;
  void *v25;
  void *v26;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v17 = a3;
  v29 = a4;
  v18 = a4;
  v30 = a5;
  v19 = a5;
  v31 = a6;
  v20 = a6;
  v21 = a7;
  v34 = a8;
  v33 = a10;
  v32 = a11;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 2479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment != nil"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 2480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pluginId != nil"));

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)TRIPartialBMLTRecord;
  v22 = -[TRIPartialBMLTRecord init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_bmltDeployment, a3);
    objc_storeStrong((id *)&v23->_pluginId, v29);
    objc_storeStrong((id *)&v23->_activeFactorPackSetId, v30);
    objc_storeStrong((id *)&v23->_activeTargetingRuleIndex, v31);
    objc_storeStrong((id *)&v23->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v23->_targetedTargetingRuleIndex, a8);
    v23->_status = a9;
    objc_storeStrong((id *)&v23->_endDate, a10);
    objc_storeStrong((id *)&v23->_namespace, a11);
  }

  return v23;
}

+ (id)recordWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 namespace:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;

  v18 = a11;
  v19 = a10;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", v25, v24, v23, v22, v21, v20, a9, v19, v18);

  return v26;
}

- (id)copyWithReplacementBmltDeployment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", v4, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_namespace);

  return v5;
}

- (id)copyWithReplacementPluginId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, v4, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_namespace);

  return v5;
}

- (id)copyWithReplacementActiveFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, self->_pluginId, v4, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_namespace);

  return v5;
}

- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, v4, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_namespace);

  return v5;
}

- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, v4, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_namespace);

  return v5;
}

- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, v4, self->_status, self->_endDate, self->_namespace);

  return v5;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, a3, self->_endDate, self->_namespace);
}

- (id)copyWithReplacementEndDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, v4, self->_namespace);

  return v5;
}

- (id)copyWithReplacementNamespace:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, v4);

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIBMLTDeployment *bmltDeployment;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  NSString *pluginId;
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
  NSDate *endDate;
  void *v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  NSString *v52;
  void *v53;
  char v54;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_27;
  v6 = self->_bmltDeployment != 0;
  objc_msgSend(v4, "bmltDeployment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_27;
  bmltDeployment = self->_bmltDeployment;
  if (bmltDeployment)
  {
    objc_msgSend(v5, "bmltDeployment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIBMLTDeployment isEqual:](bmltDeployment, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  v12 = self->_pluginId != 0;
  objc_msgSend(v5, "pluginId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_27;
  pluginId = self->_pluginId;
  if (pluginId)
  {
    objc_msgSend(v5, "pluginId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](pluginId, "isEqual:", v16);

    if (!v17)
      goto LABEL_27;
  }
  v18 = self->_activeFactorPackSetId != 0;
  objc_msgSend(v5, "activeFactorPackSetId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_27;
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    objc_msgSend(v5, "activeFactorPackSetId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[TRIFactorPackSetId isEqual:](activeFactorPackSetId, "isEqual:", v22);

    if (!v23)
      goto LABEL_27;
  }
  v24 = self->_activeTargetingRuleIndex != 0;
  objc_msgSend(v5, "activeTargetingRuleIndex");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_27;
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    objc_msgSend(v5, "activeTargetingRuleIndex");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSNumber isEqual:](activeTargetingRuleIndex, "isEqual:", v28);

    if (!v29)
      goto LABEL_27;
  }
  v30 = self->_targetedFactorPackSetId != 0;
  objc_msgSend(v5, "targetedFactorPackSetId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_27;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    objc_msgSend(v5, "targetedFactorPackSetId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TRIFactorPackSetId isEqual:](targetedFactorPackSetId, "isEqual:", v34);

    if (!v35)
      goto LABEL_27;
  }
  v36 = self->_targetedTargetingRuleIndex != 0;
  objc_msgSend(v5, "targetedTargetingRuleIndex");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v36 == v38)
    goto LABEL_27;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    objc_msgSend(v5, "targetedTargetingRuleIndex");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[NSNumber isEqual:](targetedTargetingRuleIndex, "isEqual:", v40);

    if (!v41)
      goto LABEL_27;
  }
  status = self->_status;
  if (status != objc_msgSend(v5, "status"))
    goto LABEL_27;
  v43 = self->_endDate != 0;
  objc_msgSend(v5, "endDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (v43 == v45)
    goto LABEL_27;
  endDate = self->_endDate;
  if (endDate)
  {
    objc_msgSend(v5, "endDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[NSDate isEqual:](endDate, "isEqual:", v47);

    if (!v48)
      goto LABEL_27;
  }
  v49 = self->_namespace != 0;
  objc_msgSend(v5, "namespace");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50 == 0;

  if (v49 == v51)
  {
LABEL_27:
    v54 = 0;
  }
  else
  {
    v52 = self->_namespace;
    if (v52)
    {
      objc_msgSend(v5, "namespace");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[NSString isEqual:](v52, "isEqual:", v53);

    }
    else
    {
      v54 = 1;
    }
  }

  return v54;
}

- (BOOL)isEqual:(id)a3
{
  TRIPartialBMLTRecord *v4;
  TRIPartialBMLTRecord *v5;
  BOOL v6;

  v4 = (TRIPartialBMLTRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIPartialBMLTRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;

  v3 = -[TRIBMLTDeployment hash](self->_bmltDeployment, "hash");
  v4 = -[NSString hash](self->_pluginId, "hash") - v3 + 32 * v3;
  v5 = -[TRIFactorPackSetId hash](self->_activeFactorPackSetId, "hash") - v4 + 32 * v4;
  v6 = -[NSNumber hash](self->_activeTargetingRuleIndex, "hash") - v5 + 32 * v5;
  v7 = -[TRIFactorPackSetId hash](self->_targetedFactorPackSetId, "hash") - v6 + 32 * v6;
  v8 = -[NSNumber hash](self->_targetedTargetingRuleIndex, "hash");
  v9 = self->_status - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  v10 = -[NSDate hash](self->_endDate, "hash") - v9 + 32 * v9;
  return -[NSString hash](self->_namespace, "hash") - v10 + 32 * v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPartialBMLTRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TRIPartialBMLTRecord *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  TRIPartialBMLTRecord *v46;
  void *v47;
  TRIPartialBMLTRecord *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  TRIPartialBMLTRecord *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bmltDeployment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pluginId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v6 = 0;
        v16 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v74 = *MEMORY[0x1E0CB2D50];
      v75 = CFSTR("Retrieved nil serialized value for nonnull TRIPartialBMLTRecord.pluginId");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 2, v7);
      objc_msgSend(v4, "failWithError:", v9);
      goto LABEL_25;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeFactorPackSetId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialBMLTRecord key \"activeFactorPackSetId\" (expected %@, decoded %@)"), v9, v11, 0);
        v72 = *MEMORY[0x1E0CB2D50];
        v73 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 3, v13);
        objc_msgSend(v4, "failWithError:", v14);
LABEL_15:

LABEL_16:
        v16 = 0;
LABEL_17:

LABEL_18:
LABEL_19:

LABEL_26:
        goto LABEL_27;
      }
      goto LABEL_12;
    }
    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_12:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeTargetingRuleIndex"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v60 = self;
          v20 = v9;
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialBMLTRecord key \"activeTargetingRuleIndex\" (expected %@, decoded %@)"), v21, v12, 0);
          v70 = *MEMORY[0x1E0CB2D50];
          v71 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 3, v14);
          objc_msgSend(v4, "failWithError:", v23);

          v11 = (void *)v21;
          v9 = v20;
          self = v60;
          goto LABEL_15;
        }
LABEL_30:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetedFactorPackSetId"));
        v61 = objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v58 = objc_claimAutoreleasedReturnValue();
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialBMLTRecord key \"targetedFactorPackSetId\" (expected %@, decoded %@)"), v58, v13, 0);
            v68 = *MEMORY[0x1E0CB2D50];
            v69 = v54;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 3, v28);
            objc_msgSend(v4, "failWithError:", v29);

            v11 = (void *)v61;
            v12 = (void *)v58;

            goto LABEL_16;
          }
        }
        else
        {
          objc_msgSend(v4, "error");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v11 = 0;
            v16 = 0;
            goto LABEL_19;
          }
        }
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetedTargetingRuleIndex"));
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialBMLTRecord key \"targetedTargetingRuleIndex\" (expected %@, decoded %@)"), v13, v55, 0);
            v66 = *MEMORY[0x1E0CB2D50];
            v67 = v33;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 3, v34);
            objc_msgSend(v4, "failWithError:", v35);

LABEL_45:
            v16 = 0;
            v12 = (void *)v59;
            v11 = (void *)v61;
            goto LABEL_17;
          }
        }
        else
        {
          objc_msgSend(v4, "error");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            v12 = 0;
            v16 = 0;
            v11 = (void *)v61;
            goto LABEL_18;
          }
        }
        v37 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("status"));
        if (!v37)
        {
          objc_msgSend(v4, "error");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v16 = 0;
            v12 = (void *)v59;
            v11 = (void *)v61;
            goto LABEL_18;
          }
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("status")) & 1) == 0)
          {
            v64 = *MEMORY[0x1E0CB2D50];
            v65 = CFSTR("Missing serialized value for TRIPartialBMLTRecord.status");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 1, v13);
            objc_msgSend(v4, "failWithError:", v50);

            goto LABEL_45;
          }
        }
        v56 = v37;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIPartialBMLTRecord key \"endDate\" (expected %@, decoded %@)"), v57, v53, 0);
            v62 = *MEMORY[0x1E0CB2D50];
            v63 = v40;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 3, v41);
            objc_msgSend(v4, "failWithError:", v42);

            goto LABEL_45;
          }
        }
        else
        {
          objc_msgSend(v4, "error");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            v13 = 0;
            goto LABEL_45;
          }
        }
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespace"));
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45
          || (objc_msgSend(v4, "error"), v51 = (void *)objc_claimAutoreleasedReturnValue(), v51, !v51))
        {
          v52 = v45;
          v46 = self;
          v11 = (void *)v61;
          v47 = (void *)v45;
          v12 = (void *)v59;
          v48 = -[TRIPartialBMLTRecord initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:](v46, "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", v5, v6, v7, v9, v61, v59, v56, v13, v52);
          v49 = v47;
          self = v48;
          v16 = v48;
        }
        else
        {
          v16 = 0;
          v49 = 0;
          v12 = (void *)v59;
          v11 = (void *)v61;
        }

        goto LABEL_17;
      }
      objc_msgSend(v4, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_30;
      v9 = 0;
LABEL_25:
      v16 = 0;
      goto LABEL_26;
    }
    v7 = 0;
LABEL_21:
    v16 = 0;
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v4, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v76 = *MEMORY[0x1E0CB2D50];
    v77[0] = CFSTR("Retrieved nil serialized value for nonnull TRIPartialBMLTRecord.bmltDeployment");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIPartialBMLTRecordOCNTErrorDomain"), 2, v6);
    objc_msgSend(v4, "failWithError:", v7);
    goto LABEL_21;
  }
  v16 = 0;
LABEL_29:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TRIBMLTDeployment *bmltDeployment;
  NSString *pluginId;
  TRIFactorPackSetId *activeFactorPackSetId;
  NSNumber *activeTargetingRuleIndex;
  TRIFactorPackSetId *targetedFactorPackSetId;
  NSNumber *targetedTargetingRuleIndex;
  NSDate *endDate;
  NSString *v12;
  id v13;

  v4 = a3;
  bmltDeployment = self->_bmltDeployment;
  v13 = v4;
  if (bmltDeployment)
  {
    objc_msgSend(v4, "encodeObject:forKey:", bmltDeployment, CFSTR("bmltDeployment"));
    v4 = v13;
  }
  pluginId = self->_pluginId;
  if (pluginId)
  {
    objc_msgSend(v13, "encodeObject:forKey:", pluginId, CFSTR("pluginId"));
    v4 = v13;
  }
  activeFactorPackSetId = self->_activeFactorPackSetId;
  if (activeFactorPackSetId)
  {
    objc_msgSend(v13, "encodeObject:forKey:", activeFactorPackSetId, CFSTR("activeFactorPackSetId"));
    v4 = v13;
  }
  activeTargetingRuleIndex = self->_activeTargetingRuleIndex;
  if (activeTargetingRuleIndex)
  {
    objc_msgSend(v13, "encodeObject:forKey:", activeTargetingRuleIndex, CFSTR("activeTargetingRuleIndex"));
    v4 = v13;
  }
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  if (targetedFactorPackSetId)
  {
    objc_msgSend(v13, "encodeObject:forKey:", targetedFactorPackSetId, CFSTR("targetedFactorPackSetId"));
    v4 = v13;
  }
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  if (targetedTargetingRuleIndex)
  {
    objc_msgSend(v13, "encodeObject:forKey:", targetedTargetingRuleIndex, CFSTR("targetedTargetingRuleIndex"));
    v4 = v13;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_status, CFSTR("status"));
  endDate = self->_endDate;
  if (endDate)
    objc_msgSend(v13, "encodeObject:forKey:", endDate, CFSTR("endDate"));
  v12 = self->_namespace;
  if (v12)
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("namespace"));

}

- (id)description
{
  id v3;
  TRIFactorPackSetId *targetedFactorPackSetId;
  NSNumber *targetedTargetingRuleIndex;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = *(_OWORD *)&self->_bmltDeployment;
  v9 = *(_OWORD *)&self->_activeFactorPackSetId;
  targetedFactorPackSetId = self->_targetedFactorPackSetId;
  targetedTargetingRuleIndex = self->_targetedTargetingRuleIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIPartialBMLTRecord | bmltDeployment:%@ pluginId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ endDate:%@ namespace:%@>"), v10, v9, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, self->_endDate, self->_namespace);

  return v7;
}

- (TRIBMLTDeployment)bmltDeployment
{
  return self->_bmltDeployment;
}

- (NSString)pluginId
{
  return self->_pluginId;
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

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_pluginId, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
}

@end
