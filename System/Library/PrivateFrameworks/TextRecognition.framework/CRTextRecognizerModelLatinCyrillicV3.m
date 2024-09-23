@implementation CRTextRecognizerModelLatinCyrillicV3

+ (id)defaultURLOfModelInThisBundle
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  if (_os_feature_enabled_impl())
  {
    CROSLogForCategory(3);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4FB8000, v2, OS_LOG_TYPE_ERROR, "Extended latin model is not present, using existing latincyrillic model", v7, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("cr_tr_model_latincyrillic_v3.mlmodelc"), CFSTR("bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  TextBoxesOffsets result;

  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelLatinCyrillicV3;
  -[CRTextSequenceRecognizerModel characterBoxesOffsets](&v6, sel_characterBoxesOffsets);
  v5 = -1.0;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

@end
