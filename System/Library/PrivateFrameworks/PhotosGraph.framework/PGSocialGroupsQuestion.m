@implementation PGSocialGroupsQuestion

- (PGSocialGroupsQuestion)initWithSocialGroupID:(id)a3 personLocalIdentifiers:(id)a4 personNames:(id)a5 localFactoryScore:(double)a6
{
  id v10;
  id v11;
  PGSocialGroupsQuestion *v12;
  PGSocialGroupsQuestion *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *additionalInfo;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  const __CFString *v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PGSocialGroupsQuestion;
  v12 = -[PGSocialGroupsQuestion init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    v13->_localFactoryScore = a6;
    v13->_state = 0;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v11, "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19), (_QWORD)v24);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v14, "addObject:", v20);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        }
        while (v17);
      }

    }
    v29 = CFSTR("personUUIDs");
    v30 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1, (_QWORD)v24);
    v21 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v13->_additionalInfo;
    v13->_additionalInfo = (NSDictionary *)v21;

  }
  return v13;
}

- (unsigned)type
{
  return 17;
}

- (unsigned)displayType
{
  return 3;
}

- (unsigned)entityType
{
  return 5;
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
