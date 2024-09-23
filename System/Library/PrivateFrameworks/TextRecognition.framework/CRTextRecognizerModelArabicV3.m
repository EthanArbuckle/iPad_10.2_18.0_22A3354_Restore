@implementation CRTextRecognizerModelArabicV3

+ (id)defaultURLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("cr_tr_model_arabic_v3.mlmodelc"), CFSTR("bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  TextBoxesOffsets result;

  v11.receiver = self;
  v11.super_class = (Class)CRTextRecognizerModelArabicV3;
  -[CRTextSequenceRecognizerModel wordBoxesOffsets](&v11, sel_wordBoxesOffsets);
  v3 = v2;
  v5 = v4;
  v7 = -v6;
  v9 = -v8;
  v10 = v3;
  result.var3 = v10;
  result.var2 = v5;
  result.var1 = v9;
  result.var0 = v7;
  return result;
}

@end
