@implementation PHAPrivateFederatedLearningTransformersDecoder

- (PHAPrivateFederatedLearningTransformersDecoder)init
{
  PHAPrivateFederatedLearningTransformersDecoder *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *transformerNameToClass;
  objc_super v12;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningTransformersDecoder;
  v2 = -[PHAPrivateFederatedLearningTransformersDecoder init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D75F40], "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v14[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D75F48], "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D75F30], "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    v14[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D75F20], "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    v14[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D75F28], "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    v14[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D75F38], "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[5] = v8;
    v14[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    transformerNameToClass = v2->_transformerNameToClass;
    v2->_transformerNameToClass = (NSDictionary *)v9;

  }
  return v2;
}

- (id)transformersForFeatureExtractorsFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D75F50]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningTransformersDecoder instancesForTransformerConfigList:error:](self, "instancesForTransformerConfigList:error:", v14, a4);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {

          v17 = 0;
          goto LABEL_11;
        }
        v16 = (void *)v15;
        objc_msgSend(v7, "addFeatureTransformers:forFeatureExtractorName:", v15, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = v7;
LABEL_11:

  return v17;
}

- (id)instancesForTransformerConfigList:(id)a3 error:(id *)a4
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
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
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
          -[PHAPrivateFederatedLearningTransformersDecoder instanceForTransformerConfig:error:](self, "instanceForTransformerConfig:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), a4, (_QWORD)v17);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            v15 = 0;
            goto LABEL_13;
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
LABEL_13:

  }
  else
  {
    -[PHAPrivateFederatedLearningTransformersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid transformers format: value for transformer name is not an array."));
    v15 = 0;
  }

  return v15;
}

- (id)instanceForTransformerConfig:(id)a3 error:(id *)a4
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
      -[PHAPrivateFederatedLearningTransformersDecoder transformerNameToClass](self, "transformerNameToClass");
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
          -[PHAPrivateFederatedLearningTransformersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid transformers format: transformer parameters is not an array."));
          v11 = 0;
        }

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transformer not supported: %@"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningTransformersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 0, v12);

    }
    else
    {
      -[PHAPrivateFederatedLearningTransformersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid transformers format: transformer name is not a string."));
    }
    v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[PHAPrivateFederatedLearningTransformersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid transformers format: transformer configuration is not dictionary."));
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
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningTransformersDecoder"), a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v11;
  }
  return 0;
}

- (NSDictionary)transformerNameToClass
{
  return self->_transformerNameToClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformerNameToClass, 0);
}

@end
