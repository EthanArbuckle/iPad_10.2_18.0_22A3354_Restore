@implementation PGCLIPQueryAssetFilter

- (PGCLIPQueryAssetFilter)initWithPositiveQueryEmbeddings:(id)a3 cosineSimilarityThresholdByVersion:(id)a4
{
  id v7;
  id v8;
  PGCLIPQueryAssetFilter *v9;
  PGCLIPQueryAssetFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGCLIPQueryAssetFilter;
  v9 = -[PGCLIPQueryAssetFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_positiveQueryEmbeddings, a3);
    objc_storeStrong((id *)&v10->_cosineSimilarityThresholdByVersion, a4);
  }

  return v10;
}

- (id)filteredAssetsFromAssets:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0CB3880];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PGCLIPQueryAssetFilter_filteredAssetsFromAssets___block_invoke;
  v8[3] = &unk_1E8430EB8;
  v8[4] = self;
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)passesWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "curationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CLIPprintModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "version");

  if (v7 == objc_msgSend(MEMORY[0x1E0D781F8], "latestVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary allKeys](self->_cosineSimilarityThresholdByVersion, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", v9))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_cosineSimilarityThresholdByVersion, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      objc_msgSend(v4, "clsSceneprint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = self->_positiveQueryEmbeddings;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            -[PGCLIPQueryAssetFilter cosineSimilarityBetweenQueryEmbedding:assetEmbedding:](self, "cosineSimilarityBetweenQueryEmbedding:assetEmbedding:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v14, (_QWORD)v23);
            if (v20 >= v13)
            {
              v21 = 1;
              goto LABEL_15;
            }
          }
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v17)
            continue;
          break;
        }
      }
      v21 = 0;
LABEL_15:

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (double)cosineSimilarityBetweenQueryEmbedding:(id)a3 assetEmbedding:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  id v11;
  float *v12;
  float *v13;
  unint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = objc_msgSend(v6, "elementCount");
  v9 = objc_msgSend(v6, "elementType");
  v10 = 0.0;
  if (v8 == v7 >> 2 && v9 == 1)
  {
    objc_msgSend(v6, "descriptorData");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (float *)objc_msgSend(v11, "bytes");

    v13 = (float *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    if (v12)
    {
      if (v13)
      {
        if (v7 >= 4)
        {
          v14 = v7 >> 2;
          v15 = 0.0;
          v16 = 0.0;
          do
          {
            v17 = *v12++;
            v18 = v17;
            v19 = *v13++;
            v10 = v10 + (float)(v18 * v19);
            v16 = v16 + (float)(v18 * v18);
            v15 = v15 + (float)(v19 * v19);
            --v14;
          }
          while (v14);
          if (v16 > 0.0 && v15 > 0.0)
            v10 = v10 / sqrtf(v16 * v15);
        }
      }
    }
  }

  return v10;
}

- (NSArray)positiveQueryEmbeddings
{
  return self->_positiveQueryEmbeddings;
}

- (NSDictionary)cosineSimilarityThresholdByVersion
{
  return self->_cosineSimilarityThresholdByVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cosineSimilarityThresholdByVersion, 0);
  objc_storeStrong((id *)&self->_positiveQueryEmbeddings, 0);
}

uint64_t __51__PGCLIPQueryAssetFilter_filteredAssetsFromAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "passesWithAsset:", a2);
}

+ (NSString)name
{
  return (NSString *)CFSTR("CLIP");
}

@end
