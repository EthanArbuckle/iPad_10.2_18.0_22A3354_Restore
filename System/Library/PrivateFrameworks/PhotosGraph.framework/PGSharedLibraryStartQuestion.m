@implementation PGSharedLibraryStartQuestion

- (PGSharedLibraryStartQuestion)init
{
  PGSharedLibraryStartQuestion *v2;
  PGSharedLibraryStartQuestion *v3;
  NSString *entityIdentifier;
  uint64_t v5;
  NSDictionary *additionalInfo;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PGSharedLibraryStartQuestion;
  v2 = -[PGSharedLibraryStartQuestion init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    entityIdentifier = v2->_entityIdentifier;
    v2->_entityIdentifier = (NSString *)CFSTR("SharedLibraryStartQuestion");

    v3->_localFactoryScore = 1.0;
    v3->_state = 0;
    v9 = *MEMORY[0x1E0D77FF0];
    v10[0] = CFSTR("?");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v3->_additionalInfo;
    v3->_additionalInfo = (NSDictionary *)v5;

  }
  return v3;
}

- (unsigned)type
{
  return 21;
}

- (unsigned)displayType
{
  return 6;
}

- (unsigned)entityType
{
  return 4;
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
