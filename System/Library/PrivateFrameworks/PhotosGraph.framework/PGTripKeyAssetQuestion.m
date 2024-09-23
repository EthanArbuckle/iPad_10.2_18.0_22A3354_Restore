@implementation PGTripKeyAssetQuestion

- (PGTripKeyAssetQuestion)initWithKeyAssetUUID:(id)a3 tripName:(id)a4 isLongTrip:(BOOL)a5 localFactoryScore:(double)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  PGTripKeyAssetQuestion *v13;
  PGTripKeyAssetQuestion *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *additionalInfo;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v7 = a5;
  v21[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PGTripKeyAssetQuestion;
  v13 = -[PGTripKeyAssetQuestion init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entityIdentifier, a3);
    v14->_state = 0;
    v20[0] = CFSTR("tripName");
    v20[1] = CFSTR("isLongTrip");
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v16;

    v14->_localFactoryScore = a6;
  }

  return v14;
}

- (unsigned)type
{
  return 12;
}

- (unsigned)displayType
{
  return 5;
}

- (unsigned)entityType
{
  return 3;
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
