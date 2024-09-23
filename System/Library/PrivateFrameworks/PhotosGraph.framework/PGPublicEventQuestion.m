@implementation PGPublicEventQuestion

- (PGPublicEventQuestion)initWithAssetUUID:(id)a3 publicEventMUID:(unint64_t)a4 publicEventName:(id)a5 localFactoryScore:(double)a6
{
  id v11;
  id v12;
  PGPublicEventQuestion *v13;
  PGPublicEventQuestion *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *additionalInfo;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGPublicEventQuestion;
  v13 = -[PGPublicEventQuestion init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entityIdentifier, a3);
    v14->_localFactoryScore = a6;
    v14->_state = 0;
    v20[0] = CFSTR("publicEventMUID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("publicEventName");
    v21[0] = v15;
    v21[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v16;

  }
  return v14;
}

- (unsigned)type
{
  return 6;
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
