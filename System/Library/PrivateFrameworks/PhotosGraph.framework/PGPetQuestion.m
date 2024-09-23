@implementation PGPetQuestion

- (PGPetQuestion)initWithPetUUID:(id)a3 displayString:(id)a4 localFactoryScore:(double)a5
{
  id v9;
  id v10;
  PGPetQuestion *v11;
  PGPetQuestion *v12;
  uint64_t v13;
  NSDictionary *additionalInfo;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGPetQuestion;
  v11 = -[PGPetQuestion init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    v12->_state = 0;
    v12->_localFactoryScore = a5;
    if (v10)
    {
      v12->_entityType = 4;
      v12->_displayType = 6;
      v17 = *MEMORY[0x1E0D77FF0];
      v18[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      additionalInfo = v12->_additionalInfo;
      v12->_additionalInfo = (NSDictionary *)v13;
    }
    else
    {
      v12->_entityType = 1;
      v12->_displayType = 2;
      additionalInfo = v12->_additionalInfo;
      v12->_additionalInfo = (NSDictionary *)MEMORY[0x1E0C9AA70];
    }

  }
  return v12;
}

- (unsigned)type
{
  return 13;
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
