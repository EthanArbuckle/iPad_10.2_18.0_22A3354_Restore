@implementation TRIBackgroundMLTaskRecord

- (TRIBackgroundMLTaskRecord)initWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 artifact:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TRIBackgroundMLTaskRecord *v23;
  TRIBackgroundMLTaskRecord *v24;
  void *v26;
  void *v27;
  void *v28;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  objc_super v37;

  v17 = a3;
  v31 = a4;
  v18 = a4;
  v32 = a5;
  v19 = a5;
  v33 = a6;
  v20 = a6;
  v21 = a7;
  v35 = a8;
  v34 = a10;
  v22 = a11;
  v36 = v22;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4956, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pluginId != nil"));

    if (v36)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4955, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment != nil"));

  v22 = v36;
  if (!v18)
    goto LABEL_8;
LABEL_3:
  if (v22)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4957, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifact != nil"));

LABEL_4:
  v37.receiver = self;
  v37.super_class = (Class)TRIBackgroundMLTaskRecord;
  v23 = -[TRIBackgroundMLTaskRecord init](&v37, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_bmltDeployment, a3);
    objc_storeStrong((id *)&v24->_pluginId, v31);
    objc_storeStrong((id *)&v24->_activeFactorPackSetId, v32);
    objc_storeStrong((id *)&v24->_activeTargetingRuleIndex, v33);
    objc_storeStrong((id *)&v24->_targetedFactorPackSetId, a7);
    objc_storeStrong((id *)&v24->_targetedTargetingRuleIndex, a8);
    v24->_status = a9;
    objc_storeStrong((id *)&v24->_endDate, a10);
    objc_storeStrong((id *)&v24->_artifact, a11);
  }

  return v24;
}

+ (id)recordWithBmltDeployment:(id)a3 pluginId:(id)a4 activeFactorPackSetId:(id)a5 activeTargetingRuleIndex:(id)a6 targetedFactorPackSetId:(id)a7 targetedTargetingRuleIndex:(id)a8 status:(int64_t)a9 endDate:(id)a10 artifact:(id)a11
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
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", v25, v24, v23, v22, v21, v20, a9, v19, v18);

  return v26;
}

- (id)copyWithReplacementBmltDeployment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", v4, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_artifact);

  return v5;
}

- (id)copyWithReplacementPluginId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, v4, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_artifact);

  return v5;
}

- (id)copyWithReplacementActiveFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, self->_pluginId, v4, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_artifact);

  return v5;
}

- (id)copyWithReplacementActiveTargetingRuleIndex:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, v4, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_artifact);

  return v5;
}

- (id)copyWithReplacementTargetedFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, v4, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, self->_artifact);

  return v5;
}

- (id)copyWithReplacementTargetedTargetingRuleIndex:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, v4, self->_status, self->_endDate, self->_artifact);

  return v5;
}

- (id)copyWithReplacementStatus:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, a3, self->_endDate, self->_artifact);
}

- (id)copyWithReplacementEndDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, v4, self->_artifact);

  return v5;
}

- (id)copyWithReplacementArtifact:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:artifact:", self->_bmltDeployment, self->_pluginId, self->_activeFactorPackSetId, self->_activeTargetingRuleIndex, self->_targetedFactorPackSetId, self->_targetedTargetingRuleIndex, self->_status, self->_endDate, v4);

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
  int v11;
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
  TRIClientBMLTArtifact *artifact;
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
  v49 = self->_artifact != 0;
  objc_msgSend(v5, "artifact");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50 == 0;

  if (v49 == v51)
  {
LABEL_27:
    v54 = 0;
  }
  else
  {
    artifact = self->_artifact;
    if (artifact)
    {
      objc_msgSend(v5, "artifact");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[TRIClientBMLTArtifact isEqual:](artifact, "isEqual:", v53);

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
  TRIBackgroundMLTaskRecord *v4;
  TRIBackgroundMLTaskRecord *v5;
  BOOL v6;

  v4 = (TRIBackgroundMLTaskRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIBackgroundMLTaskRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
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
  return -[TRIClientBMLTArtifact hash](self->_artifact, "hash") - v10 + 32 * v10;
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
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIBackgroundMLTaskRecord | bmltDeployment:%@ pluginId:%@ activeFactorPackSetId:%@ activeTargetingRuleIndex:%@ targetedFactorPackSetId:%@ targetedTargetingRuleIndex:%@ status:%@ endDate:%@ artifact:%@>"), v10, v9, targetedFactorPackSetId, targetedTargetingRuleIndex, v6, self->_endDate, self->_artifact);

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

- (TRIClientBMLTArtifact)artifact
{
  return self->_artifact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifact, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_targetedTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_targetedFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_activeTargetingRuleIndex, 0);
  objc_storeStrong((id *)&self->_activeFactorPackSetId, 0);
  objc_storeStrong((id *)&self->_pluginId, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TRIBackgroundMLTaskRecord endDate](self, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v4 = objc_msgSend(v2, "compare:", v3) == -1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
