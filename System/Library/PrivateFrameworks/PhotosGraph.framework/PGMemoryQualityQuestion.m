@implementation PGMemoryQualityQuestion

- (PGMemoryQualityQuestion)initWithMemory:(id)a3 localFactoryScore:(double)a4
{
  id v6;
  PGMemoryQualityQuestion *v7;
  uint64_t v8;
  NSString *entityIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *additionalInfo;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGMemoryQualityQuestion;
  v7 = -[PGMemoryQualityQuestion init](&v15, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "uuid");
    v8 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v7->_entityIdentifier;
    v7->_entityIdentifier = (NSString *)v8;

    v7->_state = 0;
    v7->_localFactoryScore = a4;
    v16[0] = CFSTR("category");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("subcategory");
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "subcategory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v7->_additionalInfo;
    v7->_additionalInfo = (NSDictionary *)v12;

  }
  return v7;
}

- (unsigned)type
{
  return 11;
}

- (unsigned)displayType
{
  return 5;
}

- (unsigned)entityType
{
  return 2;
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
