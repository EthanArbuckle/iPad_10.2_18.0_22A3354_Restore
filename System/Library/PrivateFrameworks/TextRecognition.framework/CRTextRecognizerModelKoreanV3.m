@implementation CRTextRecognizerModelKoreanV3

+ (id)defaultURLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("cr_tr_model_korean_v3.mlmodelc"), CFSTR("bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportCharacterBoxes
{
  return 1;
}

- (TextBoxesOffsets)characterBoxesOffsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  TextBoxesOffsets result;

  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelKoreanV3;
  -[CRTextSequenceRecognizerModel characterBoxesOffsets](&v6, sel_characterBoxesOffsets);
  v5 = -1.0;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
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
  v6.super_class = (Class)CRTextRecognizerModelKoreanV3;
  -[CRTextSequenceRecognizerModel characterBoxesOffsets](&v6, sel_characterBoxesOffsets);
  v5 = -3.0;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

@end
