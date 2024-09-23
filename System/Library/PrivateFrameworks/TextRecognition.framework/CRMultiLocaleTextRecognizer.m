@implementation CRMultiLocaleTextRecognizer

- (CRMultiLocaleTextRecognizer)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6;
  CRMultiLocaleTextRecognizer *v7;
  CRMultiLocaleRecognizerConfiguration *v8;
  CRLocaleBasedTextFeatureSplitter *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRMultiLocaleTextRecognizer;
  v7 = -[CRMultiModelTextRecognizer initWithConfigurationOptions:](&v12, sel_initWithConfigurationOptions_, v6);
  if (v7)
  {
    v8 = -[CRMultiLocaleRecognizerConfiguration initWithImageReaderOptions:error:]([CRMultiLocaleRecognizerConfiguration alloc], "initWithImageReaderOptions:error:", v6, a4);
    -[CRMultiModelTextRecognizer setConfiguration:](v7, "setConfiguration:", v8);
    v9 = -[CRLocaleBasedTextFeatureSplitter initWithConfiguration:]([CRLocaleBasedTextFeatureSplitter alloc], "initWithConfiguration:", v8);
    -[CRMultiModelTextRecognizer setTextFeatureSplitter:](v7, "setTextFeatureSplitter:", v9);

    v10 = (void *)objc_opt_new();
    -[CRMultiLocaleTextRecognizer setTextRecognizers:](v7, "setTextRecognizers:", v10);

  }
  return v7;
}

- (id)recognizerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v4 = a3;
  -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[CRMultiModelTextRecognizer configurationOptions](self, "configurationOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    +[CRNeuralTextRecognizer recognizerForLocale:imageReaderOptions:error:](CRNeuralTextRecognizer, "recognizerForLocale:imageReaderOptions:error:", v4, v8, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v4);

    if (!-[CRMultiModelTextRecognizer keepAllResourcesLoadedWhenNotInUse](self, "keepAllResourcesLoadedWhenNotInUse"))
    {
      -[CRMultiModelTextRecognizer configuration](self, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "languages");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v4, "isEqualToString:", v14) & 1) == 0
        && !+[CRImageReader languageIsLatin:](CRImageReader, "languageIsLatin:", v4)
        && !+[CRImageReader languageIsCyrillic:](CRImageReader, "languageIsCyrillic:", v4))
      {
        -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setUnloadResourcesWhenNotInUse:", 1);

      }
    }

  }
  -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v18;
}

- (id)inferenceStats
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CRMultiLocaleTextRecognizer_inferenceStats__block_invoke;
  v5[3] = &unk_1E98DA0C8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__CRMultiLocaleTextRecognizer_inferenceStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v6;
  CRPerformanceStatistics *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    v4 = a3;
    objc_msgSend(v4, "inferenceStats");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addStatistics:", v11);
  }
  else
  {
    v6 = a3;
    v7 = [CRPerformanceStatistics alloc];
    objc_msgSend(v6, "inferenceStats");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v8 = -[CRPerformanceStatistics initWithStatistics:](v7, "initWithStatistics:", v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)decodingStats
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CRMultiLocaleTextRecognizer_decodingStats__block_invoke;
  v5[3] = &unk_1E98DA0C8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__CRMultiLocaleTextRecognizer_decodingStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v6;
  CRPerformanceStatistics *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    v4 = a3;
    objc_msgSend(v4, "decodingStats");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addStatistics:", v11);
  }
  else
  {
    v6 = a3;
    v7 = [CRPerformanceStatistics alloc];
    objc_msgSend(v6, "decodingStats");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v8 = -[CRPerformanceStatistics initWithStatistics:](v7, "initWithStatistics:", v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)identifierForTextRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "locale"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRMultiLocaleTextRecognizer;
  -[CRMultiModelTextRecognizer cancel](&v5, sel_cancel);
  -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[CRMultiLocaleTextRecognizer textRecognizers](self, "textRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);

  objc_sync_exit(v3);
}

uint64_t __37__CRMultiLocaleTextRecognizer_cancel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

- (NSMutableDictionary)textRecognizers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTextRecognizers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRecognizers, 0);
}

@end
