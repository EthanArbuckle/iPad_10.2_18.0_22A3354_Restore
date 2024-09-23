@implementation PLEmbeddingVectorGenerator

+ (id)_TextCLIPEmbeddingVectorForString:(id)a3 error:(id *)a4
{
  id v4;
  CLIPInferenceEngine *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(CLIPInferenceEngine);
  -[CLIPInferenceEngine encodeQuery:](v5, "encodeQuery:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    +[PLEmbeddingUtilities padVector:withZeroesForVectorWithNumberOfDimensions:](PLEmbeddingUtilities, "padVector:withZeroesForVectorWithNumberOfDimensions:", v6, 768);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)CLIPEmbeddingVectorForAsset:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v18;
  id v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingVectorGenerator.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(v7, "additionalAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v11, v10, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  v14 = v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 0;
  if (v15)
  {
    +[PLEmbeddingUtilities extractNumericalValuesForScenePrint:](PLEmbeddingUtilities, "extractNumericalValuesForScenePrint:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "count"))
    {

      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    if (a4 && v13)
    {
      v16 = 0;
      *a4 = objc_retainAutorelease(v13);
    }
  }

  return v16;
}

- (id)embeddingVectorForString:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5
{
  void *v5;
  id v7;

  if (a4)
  {
    v5 = 0;
  }
  else
  {
    v7 = a3;
    objc_msgSend((id)objc_opt_class(), "_TextCLIPEmbeddingVectorForString:error:", v7, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
