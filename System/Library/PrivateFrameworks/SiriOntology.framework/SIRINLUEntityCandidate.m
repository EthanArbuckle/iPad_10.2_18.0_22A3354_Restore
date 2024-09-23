@implementation SIRINLUEntityCandidate

- (SIRINLUEntityCandidate)initWithEntity:(id)a3 score:(double)a4
{
  id v7;
  SIRINLUEntityCandidate *v8;
  SIRINLUEntityCandidate *v9;
  NSString *entityId;
  NSString *appBundleId;
  SIRINLURRGroupIdentifier *groupId;
  NSArray *annotations;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUEntityCandidate;
  v8 = -[SIRINLUEntityCandidate init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_entity, a3);
    v9->_score = a4;
    entityId = v9->_entityId;
    v9->_entityId = (NSString *)&stru_1E7D21BF0;

    appBundleId = v9->_appBundleId;
    v9->_appBundleId = (NSString *)&stru_1E7D21BF0;

    groupId = v9->_groupId;
    v9->_groupId = 0;

    annotations = v9->_annotations;
    v9->_annotations = 0;

  }
  return v9;
}

- (SIRINLUEntityCandidate)initWithEntity:(id)a3 score:(double)a4 entityId:(id)a5 appBundleId:(id)a6 groupId:(id)a7 annotations:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SIRINLUEntityCandidate *v19;
  SIRINLUEntityCandidate *v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SIRINLUEntityCandidate;
  v19 = -[SIRINLUEntityCandidate init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_entity, a3);
    v20->_score = a4;
    objc_storeStrong((id *)&v20->_entityId, a5);
    objc_storeStrong((id *)&v20->_appBundleId, a6);
    objc_storeStrong((id *)&v20->_groupId, a7);
    objc_storeStrong((id *)&v20->_annotations, a8);
  }

  return v20;
}

- (SIRINLUEntityCandidate)initWithCoder:(id)a3
{
  id v4;
  SIRINLUEntityCandidate *v5;
  uint64_t v6;
  USOSerializedGraph *entity;
  void *v8;
  double v9;
  uint64_t v10;
  NSString *entityId;
  uint64_t v12;
  NSString *appBundleId;
  uint64_t v14;
  SIRINLURRGroupIdentifier *groupId;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *annotations;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUEntityCandidate;
  v5 = -[SIRINLUEntityCandidate init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entity"));
    v6 = objc_claimAutoreleasedReturnValue();
    entity = v5->_entity;
    v5->_entity = (USOSerializedGraph *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_score = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityId"));
    v10 = objc_claimAutoreleasedReturnValue();
    entityId = v5->_entityId;
    v5->_entityId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
    v12 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupId"));
    v14 = objc_claimAutoreleasedReturnValue();
    groupId = v5->_groupId;
    v5->_groupId = (SIRINLURRGroupIdentifier *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("annotations"));
    v19 = objc_claimAutoreleasedReturnValue();
    annotations = v5->_annotations;
    v5->_annotations = (NSArray *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SIRINLUEntityCandidate entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("score"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityId, CFSTR("entityId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appBundleId, CFSTR("appBundleId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupId, CFSTR("groupId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_annotations, CFSTR("annotations"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double score;
  NSString *entityId;
  NSString *appBundleId;
  void *v10;
  void *v11;

  -[USOSerializedGraph printedForm](self->_entity, "printedForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", self->_annotations, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  score = self->_score;
  entityId = self->_entityId;
  appBundleId = self->_appBundleId;
  -[SIRINLURRGroupIdentifier description](self->_groupId, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{EntityCandidate\n  entity: \n%@\n  score: %f\n  entityId: \n%@\n  appBundleId: \n%@\n  groupId: \n%@\n  annotations: \n%@\n}"), v4, *(_QWORD *)&score, entityId, appBundleId, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (USOSerializedGraph)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)entityId
{
  return self->_entityId;
}

- (void)setEntityId:(id)a3
{
  objc_storeStrong((id *)&self->_entityId, a3);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (SIRINLURRGroupIdentifier)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
