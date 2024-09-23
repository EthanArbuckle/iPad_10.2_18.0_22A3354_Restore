@implementation CLIPInferenceEngine

- (CLIPInferenceEngine)init
{
  CLIPInferenceEngine *v2;
  PNCVNLPWrapper *v3;
  id v4;
  PNCVNLPWrapper *clipModelWrapper;
  CLIPInferenceEngine *v6;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLIPInferenceEngine;
  v2 = -[CLIPInferenceEngine init](&v9, sel_init);
  if (!v2)
    goto LABEL_3;
  v8 = 0;
  v3 = -[PNCVNLPWrapper initWithCLIPModelName:error:]([PNCVNLPWrapper alloc], "initWithCLIPModelName:error:", CFSTR("v3.1"), &v8);
  v4 = v8;
  clipModelWrapper = v2->_clipModelWrapper;
  v2->_clipModelWrapper = v3;

  v6 = 0;
  if (!v4)
LABEL_3:
    v6 = v2;

  return v6;
}

- (id)encodeQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  -[CLIPInferenceEngine clipModelWrapper](self, "clipModelWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "encodeText:error:", v4, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[PLEmbeddingUtilities extractNumericalValuesForScenePrint:](PLEmbeddingUtilities, "extractNumericalValuesForScenePrint:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (PNCVNLPWrapper)clipModelWrapper
{
  return self->_clipModelWrapper;
}

- (void)setClipModelWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_clipModelWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipModelWrapper, 0);
}

@end
