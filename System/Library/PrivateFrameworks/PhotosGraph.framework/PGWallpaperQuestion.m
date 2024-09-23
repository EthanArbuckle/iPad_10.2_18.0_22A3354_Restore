@implementation PGWallpaperQuestion

- (PGWallpaperQuestion)initWithAssetUUID:(id)a3 suggestionSubtype:(unsigned __int16)a4
{
  uint64_t v4;
  id v7;
  PGWallpaperQuestion *v8;
  PGWallpaperQuestion *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *additionalInfo;
  objc_super v14;
  const __CFString *v15;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGWallpaperQuestion;
  v8 = -[PGWallpaperQuestion init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_entityIdentifier, a3);
    v9->_state = 0;
    v15 = CFSTR("suggestionSubtype");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v9->_additionalInfo;
    v9->_additionalInfo = (NSDictionary *)v11;

  }
  return v9;
}

- (unsigned)type
{
  return 22;
}

- (unsigned)displayType
{
  return 7;
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
