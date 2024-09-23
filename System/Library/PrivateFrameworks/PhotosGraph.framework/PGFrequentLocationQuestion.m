@implementation PGFrequentLocationQuestion

- (PGFrequentLocationQuestion)initWithAssetUUID:(id)a3 location:(id)a4 locationTypeName:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGFrequentLocationQuestion *v12;
  PGFrequentLocationQuestion *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *additionalInfo;
  objc_super v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PGFrequentLocationQuestion;
  v12 = -[PGFrequentLocationQuestion init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    objc_msgSend((id)*MEMORY[0x1E0D77FE8], "doubleValue");
    v13->_localFactoryScore = v14;
    v13->_state = 0;
    v15 = *MEMORY[0x1E0D78050];
    v30[0] = *MEMORY[0x1E0D78048];
    v30[1] = v15;
    v16 = *MEMORY[0x1E0D78020];
    v30[2] = *MEMORY[0x1E0D78058];
    v30[3] = v16;
    v30[4] = *MEMORY[0x1E0D78038];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v19 = v18;
    v20 = *MEMORY[0x1E0D78018];
    v29[0] = v17;
    v21 = *MEMORY[0x1E0D78028];
    v28[0] = v20;
    v28[1] = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v22;
    v28[2] = *MEMORY[0x1E0D78030];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = *MEMORY[0x1E0D78040];
    v29[2] = v23;
    v29[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v24 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v13->_additionalInfo;
    v13->_additionalInfo = (NSDictionary *)v24;

  }
  return v13;
}

- (unsigned)type
{
  return 8;
}

- (unsigned)displayType
{
  return 4;
}

- (unsigned)entityType
{
  return 0;
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
