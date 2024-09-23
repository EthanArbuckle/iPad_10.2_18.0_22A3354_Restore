@implementation PPSmallBloomFilter

- (PPSmallBloomFilter)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6;
  PPSmallBloomFilter *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _PASBloomFilter *bloomFilter;
  uint64_t v15;
  NSString *inputName;
  uint64_t v17;
  NSString *outputName;
  PPSmallBloomFilter *v19;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PPSmallBloomFilter;
  v7 = -[PPSmallBloomFilter init](&v21, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trial_namespace_name"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES");
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filepathForFactor:namespaceName:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {

      v19 = 0;
      goto LABEL_11;
    }
    if (!v7->_bloomFilter)
    {
      objc_msgSend(MEMORY[0x1E0D81530], "bloomFilterWithPathToFile:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      bloomFilter = v7->_bloomFilter;
      v7->_bloomFilter = (_PASBloomFilter *)v13;

    }
    pthread_mutex_init(&v7->_lock, 0);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputName"));
    v15 = objc_claimAutoreleasedReturnValue();
    inputName = v7->_inputName;
    v7->_inputName = (NSString *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputName"));
    v17 = objc_claimAutoreleasedReturnValue();
    outputName = v7->_outputName;
    v7->_outputName = (NSString *)v17;

  }
  v19 = v7;
LABEL_11:

  return v19;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  NSString *outputName;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "featureValueForName:", self->_inputName, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedLowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    pthread_mutex_lock(&self->_lock);
    -[_PASBloomFilter computeHashesForString:reuse:](self->_bloomFilter, "computeHashesForString:reuse:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_PASBloomFilter getWithHashes:](self->_bloomFilter, "getWithHashes:", v10);
    pthread_mutex_unlock(&self->_lock);

  }
  else
  {
    v11 = 1;
  }
  v12 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  outputName = self->_outputName;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &outputName, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithDictionary:error:", v16, a5);

  return v17;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  SEL v24;
  id *v25;
  id v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v9, "count") < 1)
  {
    v13 = 0;
  }
  else
  {
    v24 = a2;
    v25 = a5;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v9, "featuresAtIndex:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v13;
      -[PPSmallBloomFilter predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v16, v10, &v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v27;

      if (v17)
      {
        objc_msgSend(v11, "addObject:", v17);
      }
      else
      {
        v18 = objc_alloc(MEMORY[0x1E0C9E8F8]);
        v26 = v13;
        v19 = (void *)objc_msgSend(v18, "initWithDictionary:error:", MEMORY[0x1E0C9AA70], &v26);
        v20 = v26;

        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("PPCoreMLUtils.m"), 242, CFSTR("Empty provider should not be null"));

        }
        objc_msgSend(v11, "addObject:", v19, v24);

        v13 = v20;
      }

      objc_autoreleasePoolPop(v15);
      ++v12;
    }
    while (v12 < objc_msgSend(v9, "count"));
    if (v25 && v13)
    {
      v13 = objc_retainAutorelease(v13);
      *v25 = v13;
    }
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v11);

  return v22;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PPSmallBloomFilter;
  -[PPSmallBloomFilter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
}

@end
