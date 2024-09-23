@implementation PLEmbeddingCompareObject

- (PLEmbeddingCompareObject)initWithAssetUUID:(id)a3 vector:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PLEmbeddingCompareObject *v10;
  uint64_t v11;
  NSString *assetUUID;
  uint64_t v13;
  NSArray *vector;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEmbeddingCompareObject.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUID"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEmbeddingCompareObject.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vector"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PLEmbeddingCompareObject;
  v10 = -[PLEmbeddingCompareObject init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    assetUUID = v10->_assetUUID;
    v10->_assetUUID = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    vector = v10->_vector;
    v10->_vector = (NSArray *)v13;

  }
  return v10;
}

- (double)distanceToQueryVector:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  NSArray *vector;
  double result;
  void *v11;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEmbeddingCompareObject.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryVector.count > 0"));

  }
  -[PLEmbeddingCompareObject vector](self, "vector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEmbeddingUtilities cosineSimilarityBetweenVector:secondVector:](PLEmbeddingUtilities, "cosineSimilarityBetweenVector:secondVector:", v6, v5);
  v8 = v7;

  self->_distanceBetweenVectors = v8;
  vector = self->_vector;
  self->_vector = 0;

  -[PLEmbeddingCompareObject distanceBetweenVectors](self, "distanceBetweenVectors");
  return result;
}

- ($70930193D4F448A53BB9343C0237EB5F)llmTimeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E50];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E50];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSArray)vector
{
  return self->_vector;
}

- (double)distanceBetweenVectors
{
  return self->_distanceBetweenVectors;
}

- (unint64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(unint64_t)a3
{
  self->_modelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end
