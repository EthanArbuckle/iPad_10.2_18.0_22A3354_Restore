@implementation PGRelationshipQuestion

- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 personUUID:(id)a4 localFactoryScore:(double)a5
{
  return -[PGRelationshipQuestion initWithRelationshipLabel:personUUID:displayString:localFactoryScore:](self, "initWithRelationshipLabel:personUUID:displayString:localFactoryScore:", a3, a4, 0, a5);
}

- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 confirmedPersonUUID:(id)a4
{
  PGRelationshipQuestion *result;

  result = -[PGRelationshipQuestion initWithRelationshipLabel:personUUID:displayString:localFactoryScore:](self, "initWithRelationshipLabel:personUUID:displayString:localFactoryScore:", a3, a4, 0, 1.0);
  if (result)
    result->_state = 2;
  return result;
}

- (PGRelationshipQuestion)initWithRelationshipLabel:(id)a3 personUUID:(id)a4 displayString:(id)a5 localFactoryScore:(double)a6
{
  id v10;
  id v11;
  id v12;
  PGRelationshipQuestion *v13;
  PGRelationshipQuestion *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *additionalInfo;
  objc_super v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PGRelationshipQuestion;
  v13 = -[PGRelationshipQuestion init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entityIdentifier, a4);
    v14->_state = 0;
    v14->_localFactoryScore = a6;
    if (v12)
    {
      v14->_entityType = 4;
      v14->_displayType = 6;
      v15 = *MEMORY[0x1E0D780D8];
      v26[0] = *MEMORY[0x1E0D77FF0];
      v26[1] = v15;
      v27[0] = v12;
      v27[1] = v10;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = (id *)v27;
      v18 = v26;
      v19 = 2;
    }
    else
    {
      v14->_entityType = 1;
      v14->_displayType = 2;
      v24 = *MEMORY[0x1E0D780D8];
      v25 = v10;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v25;
      v18 = &v24;
      v19 = 1;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v20;

  }
  return v14;
}

- (unsigned)type
{
  return 5;
}

- (unsigned)displayType
{
  return self->_displayType;
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

@end
