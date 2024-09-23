@implementation PGMemoryMusicEnergyQuestion

- (PGMemoryMusicEnergyQuestion)initWithMemory:(id)a3 song:(id)a4 localFactoryScore:(double)a5
{
  id v8;
  id v9;
  PGMemoryMusicEnergyQuestion *v10;
  uint64_t v11;
  NSString *entityIdentifier;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  NSDictionary *additionalInfo;
  objc_super v27;
  _QWORD v28[5];
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PGMemoryMusicEnergyQuestion;
  v10 = -[PGMemoryMusicEnergyQuestion init](&v27, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "uuid");
    v11 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v10->_entityIdentifier;
    v10->_entityIdentifier = (NSString *)v11;

    v10->_state = 0;
    v10->_localFactoryScore = a5;
    v28[0] = *MEMORY[0x1E0D78098];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "category"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    v28[1] = *MEMORY[0x1E0D780A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "subcategory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v14;
    v28[2] = *MEMORY[0x1E0D780B8];
    objc_msgSend(v9, "playbackStoreID");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = CFSTR("Unknown");
    v29[2] = v17;
    v28[3] = *MEMORY[0x1E0D780C0];
    objc_msgSend(v9, "title");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = CFSTR("Unknown");
    v29[3] = v20;
    v28[4] = *MEMORY[0x1E0D780A8];
    objc_msgSend(v9, "artist");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = CFSTR("Unknown");
    v29[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
    v24 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v10->_additionalInfo;
    v10->_additionalInfo = (NSDictionary *)v24;

  }
  return v10;
}

- (unsigned)type
{
  return 16;
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
