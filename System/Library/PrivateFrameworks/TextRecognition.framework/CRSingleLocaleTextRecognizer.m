@implementation CRSingleLocaleTextRecognizer

- (CRSingleLocaleTextRecognizer)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6;
  CRSingleLocaleTextRecognizer *v7;
  CRMultiLocaleRecognizerConfiguration *v8;
  void *v9;
  uint64_t v10;
  __objc2_class **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRSingleLocaleTextRecognizer;
  v7 = -[CRMultiModelTextRecognizer initWithConfigurationOptions:](&v17, sel_initWithConfigurationOptions_, v6);
  if (v7)
  {
    v8 = -[CRMultiLocaleRecognizerConfiguration initWithImageReaderOptions:error:]([CRMultiLocaleRecognizerConfiguration alloc], "initWithImageReaderOptions:error:", v6, a4);
    -[CRMultiModelTextRecognizer setConfiguration:](v7, "setConfiguration:", v8);
    -[CRMultiModelTextRecognizer configuration](v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "revision");

    v11 = off_1E98D7250;
    if (v10 != 3)
      v11 = off_1E98D7248;
    v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithConfiguration:", v8);
    -[CRMultiModelTextRecognizer setTextFeatureSplitter:](v7, "setTextFeatureSplitter:", v12);

    -[CRMultiLocaleRecognizerConfiguration languages](v8, "languages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRNeuralTextRecognizer recognizerForLocale:imageReaderOptions:error:](CRNeuralTextRecognizer, "recognizerForLocale:imageReaderOptions:error:", v14, v6, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSingleLocaleTextRecognizer setNeuralRecognizer:](v7, "setNeuralRecognizer:", v15);

  }
  return v7;
}

- (id)inferenceStats
{
  void *v2;
  void *v3;

  -[CRSingleLocaleTextRecognizer neuralRecognizer](self, "neuralRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inferenceStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)decodingStats
{
  void *v2;
  void *v3;

  -[CRSingleLocaleTextRecognizer neuralRecognizer](self, "neuralRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decodingStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)identifierForTextRegion:(id)a3
{
  return &stru_1E98DC948;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRSingleLocaleTextRecognizer;
  -[CRMultiModelTextRecognizer cancel](&v4, sel_cancel);
  -[CRSingleLocaleTextRecognizer neuralRecognizer](self, "neuralRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (CRNeuralTextRecognizer)neuralRecognizer
{
  return (CRNeuralTextRecognizer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNeuralRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuralRecognizer, 0);
}

@end
