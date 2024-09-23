@implementation PHAPrivateFederatedLearningAugmentersDecoder

- (PHAPrivateFederatedLearningAugmentersDecoder)init
{
  PHAPrivateFederatedLearningAugmentersDecoder *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *augmenterNameToClass;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PHAPrivateFederatedLearningAugmentersDecoder;
  v2 = -[PHAPrivateFederatedLearningAugmentersDecoder init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D75D30], "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D75D38], "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    v10[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    augmenterNameToClass = v2->_augmenterNameToClass;
    v2->_augmenterNameToClass = (NSDictionary *)v5;

  }
  return v2;
}

- (id)augmentersFromArray:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[PHAPrivateFederatedLearningAugmentersDecoder instanceForAugmenterConfig:error:](self, "instanceForAugmenterConfig:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), a4, (_QWORD)v17);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = v7;
LABEL_11:

  return v15;
}

- (id)instanceForAugmenterConfig:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PHAPrivateFederatedLearningAugmentersDecoder augmenterNameToClass](self, "augmenterNameToClass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v7);

      if (v9)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("params"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "instanceWithParameters:error:", v10, a4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[PHAPrivateFederatedLearningAugmentersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid augmenter format: augmenter parameters is not an array."));
          v11 = 0;
        }

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Augmenter not supported: %@"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningAugmentersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 0, v12);

    }
    else
    {
      -[PHAPrivateFederatedLearningAugmentersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid augmenter format: augmneter name is not a string."));
    }
    v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[PHAPrivateFederatedLearningAugmentersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid transformers format: transformer configuration is not dictionary."));
  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a5;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningAugmentersDecoder"), a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v11;
  }
  return 0;
}

- (NSDictionary)augmenterNameToClass
{
  return self->_augmenterNameToClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_augmenterNameToClass, 0);
}

@end
