@implementation PGMemoryMusicQualityQuestion

- (PGMemoryMusicQualityQuestion)initWithMemory:(id)a3 withSongInfo:(id)a4 localFactoryScore:(double)a5
{
  id v8;
  id v9;
  PGMemoryMusicQualityQuestion *v10;
  uint64_t v11;
  NSString *entityIdentifier;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  NSDictionary *additionalInfo;
  objc_super v31;
  _QWORD v32[6];
  _QWORD v33[6];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PGMemoryMusicQualityQuestion;
  v10 = -[PGMemoryMusicQualityQuestion init](&v31, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "uuid");
    v11 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v10->_entityIdentifier;
    v10->_entityIdentifier = (NSString *)v11;

    v10->_state = 0;
    v10->_localFactoryScore = a5;
    PLStoryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_DEBUG, "[MusicQualityQuestion] songInfo: %@", buf, 0xCu);
      }

      v32[0] = *MEMORY[0x1E0D78098];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "category"));
      v14 = objc_claimAutoreleasedReturnValue();
      v33[0] = v14;
      v32[1] = *MEMORY[0x1E0D780A0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "subcategory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v15;
      v32[2] = *MEMORY[0x1E0D780B8];
      objc_msgSend(v9, "objectForKeyedSubscript:");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (const __CFString *)v16;
      else
        v18 = CFSTR("Unknown");
      v33[2] = v18;
      v32[3] = *MEMORY[0x1E0D780C0];
      objc_msgSend(v9, "objectForKeyedSubscript:");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (const __CFString *)v19;
      else
        v21 = CFSTR("Unknown");
      v33[3] = v21;
      v32[4] = *MEMORY[0x1E0D780A8];
      objc_msgSend(v9, "objectForKeyedSubscript:");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (const __CFString *)v22;
      else
        v24 = CFSTR("Unknown");
      v33[4] = v24;
      v32[5] = *MEMORY[0x1E0D780B0];
      objc_msgSend(v9, "objectForKeyedSubscript:");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        v27 = (const __CFString *)v25;
      else
        v27 = CFSTR("Unknown");
      v33[5] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
      v28 = objc_claimAutoreleasedReturnValue();
      additionalInfo = v10->_additionalInfo;
      v10->_additionalInfo = (NSDictionary *)v28;

    }
    else
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v8, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v15;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] Unable to extract songInfo for memory %@", buf, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

- (unsigned)type
{
  return 15;
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
