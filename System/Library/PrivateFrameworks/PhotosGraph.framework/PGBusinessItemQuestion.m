@implementation PGBusinessItemQuestion

- (PGBusinessItemQuestion)initWithAssetUUID:(id)a3 businessUUID:(id)a4 businessName:(id)a5 localFactoryScore:(double)a6
{
  id v11;
  id v12;
  id v13;
  PGBusinessItemQuestion *v14;
  PGBusinessItemQuestion *v15;
  uint64_t v16;
  NSDictionary *additionalInfo;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGBusinessItemQuestion;
  v14 = -[PGBusinessItemQuestion init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entityIdentifier, a3);
    v15->_localFactoryScore = a6;
    v15->_state = 0;
    v20[0] = CFSTR("businessUUID");
    v20[1] = CFSTR("businessName");
    v21[0] = v12;
    v21[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v15->_additionalInfo;
    v15->_additionalInfo = (NSDictionary *)v16;

  }
  return v15;
}

- (unsigned)type
{
  return 4;
}

- (unsigned)displayType
{
  return 0;
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
