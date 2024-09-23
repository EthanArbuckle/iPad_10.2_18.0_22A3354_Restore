@implementation PeopleSuggesterTrialIdentifier

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasTreatment
{
  return self->_treatment != 0;
}

- (BOOL)hasDeployment
{
  return self->_deployment != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PeopleSuggesterTrialIdentifier;
  -[PeopleSuggesterTrialIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PeopleSuggesterTrialIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *task;
  NSString *treatment;
  NSString *deployment;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  task = self->_task;
  if (task)
    objc_msgSend(v3, "setObject:forKey:", task, CFSTR("task"));
  treatment = self->_treatment;
  if (treatment)
    objc_msgSend(v4, "setObject:forKey:", treatment, CFSTR("treatment"));
  deployment = self->_deployment;
  if (deployment)
    objc_msgSend(v4, "setObject:forKey:", deployment, CFSTR("deployment"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterTrialIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_task)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_treatment)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deployment)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_task)
  {
    objc_msgSend(v4, "setTask:");
    v4 = v5;
  }
  if (self->_treatment)
  {
    objc_msgSend(v5, "setTreatment:");
    v4 = v5;
  }
  if (self->_deployment)
  {
    objc_msgSend(v5, "setDeployment:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_task, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_treatment, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_deployment, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *task;
  NSString *treatment;
  NSString *deployment;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((task = self->_task, !((unint64_t)task | v4[2])) || -[NSString isEqual:](task, "isEqual:"))
    && ((treatment = self->_treatment, !((unint64_t)treatment | v4[3]))
     || -[NSString isEqual:](treatment, "isEqual:")))
  {
    deployment = self->_deployment;
    if ((unint64_t)deployment | v4[1])
      v8 = -[NSString isEqual:](deployment, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_task, "hash");
  v4 = -[NSString hash](self->_treatment, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_deployment, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[PeopleSuggesterTrialIdentifier setTask:](self, "setTask:");
  if (v4[3])
    -[PeopleSuggesterTrialIdentifier setTreatment:](self, "setTreatment:");
  if (v4[1])
    -[PeopleSuggesterTrialIdentifier setDeployment:](self, "setDeployment:");

}

- (NSString)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSString)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_treatment, a3);
}

- (NSString)deployment
{
  return self->_deployment;
}

- (void)setDeployment:(id)a3
{
  objc_storeStrong((id *)&self->_deployment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end
