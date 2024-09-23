@implementation PLSearchEntityRelationToPerson

- (PLSearchEntityRelationToPerson)initWithPerson:(id)a3 relationType:(signed __int16)a4 relationTypeConfidence:(double)a5
{
  id v8;
  PLSearchEntityRelationToPerson *v9;
  uint64_t v10;
  NSString *personUUID;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSearchEntityRelationToPerson;
  v9 = -[PLSearchEntityRelationToPerson init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "personUUID");
    v10 = objc_claimAutoreleasedReturnValue();
    personUUID = v9->_personUUID;
    v9->_personUUID = (NSString *)v10;

    v9->_relationType = a4;
    v9->_relationTypeConfidence = a5;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = self->_personUUID;
  v7[0] = CFSTR("personUUID");
  v7[1] = CFSTR("relationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_relationType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("relationTypeConfidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relationTypeConfidence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchEntityRelationToPerson personUUID](self, "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLSearchEntityRelationToPerson relationType](self, "relationType");
  -[PLSearchEntityRelationToPerson relationTypeConfidence](self, "relationTypeConfidence");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\npersonUUID: %@\nrelationType: %llu\nrelationTypeConfidence: %f"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (void)setPersonUUID:(id)a3
{
  objc_storeStrong((id *)&self->_personUUID, a3);
}

- (signed)relationType
{
  return self->_relationType;
}

- (void)setRelationType:(signed __int16)a3
{
  self->_relationType = a3;
}

- (double)relationTypeConfidence
{
  return self->_relationTypeConfidence;
}

- (void)setRelationTypeConfidence:(double)a3
{
  self->_relationTypeConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
}

@end
