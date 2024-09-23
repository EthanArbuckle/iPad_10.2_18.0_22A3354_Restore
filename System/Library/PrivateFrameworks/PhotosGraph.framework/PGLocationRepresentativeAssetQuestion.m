@implementation PGLocationRepresentativeAssetQuestion

- (PGLocationRepresentativeAssetQuestion)initWithAssetUUID:(id)a3 locationName:(id)a4
{
  id v7;
  id v8;
  PGLocationRepresentativeAssetQuestion *v9;
  PGLocationRepresentativeAssetQuestion *v10;
  uint64_t v11;
  NSDictionary *additionalInfo;
  objc_super v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGLocationRepresentativeAssetQuestion;
  v9 = -[PGLocationRepresentativeAssetQuestion init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityIdentifier, a3);
    v10->_state = 0;
    v15 = CFSTR("localizedLocationName");
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v10->_additionalInfo;
    v10->_additionalInfo = (NSDictionary *)v11;

  }
  return v10;
}

- (unsigned)type
{
  return 27;
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
