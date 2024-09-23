@implementation PHACurareShadowEvaluationDataset

+ (id)prepareDatasetForEvaluationTaskWithRecipeOptions:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[PHAPrivateFederatedLearningRunner datasetBuilderForOptions:error:](PHAPrivateFederatedLearningRunner, "datasetBuilderForOptions:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "datasetForEvaluationForLabel:error:", CFSTR("positive"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kPositive"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kPositive"));

  }
  objc_msgSend(v5, "datasetForEvaluationForLabel:error:", CFSTR("negative"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("kNegative"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("kNegative"));

  }
  return v6;
}

@end
