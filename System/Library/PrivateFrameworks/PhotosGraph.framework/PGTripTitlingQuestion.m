@implementation PGTripTitlingQuestion

- (PGTripTitlingQuestion)initWithTripTitle:(id)a3 legacyTripTitle:(id)a4 keyAssetUUID:(id)a5 localFactoryScore:(double)a6 duplicatedTitles:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  PGTripTitlingQuestion *v15;
  PGTripTitlingQuestion *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *additionalInfo;
  objc_super v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v7 = a7;
  v26[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PGTripTitlingQuestion;
  v15 = -[PGTripTitlingQuestion init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_entityIdentifier, a5);
    v16->_state = 0;
    v16->_localFactoryScore = a6;
    v17 = *MEMORY[0x1E0D77FC8];
    v25[0] = *MEMORY[0x1E0D78160];
    v25[1] = v17;
    v26[0] = v12;
    v26[1] = &unk_1E84E43D0;
    v18 = *MEMORY[0x1E0D78150];
    v26[2] = v13;
    v19 = *MEMORY[0x1E0D78138];
    v25[2] = v18;
    v25[3] = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v21 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v16->_additionalInfo;
    v16->_additionalInfo = (NSDictionary *)v21;

  }
  return v16;
}

- (unsigned)type
{
  return 26;
}

- (unsigned)displayType
{
  return 5;
}

- (unsigned)entityType
{
  return 3;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)state
{
  return self->_state;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
