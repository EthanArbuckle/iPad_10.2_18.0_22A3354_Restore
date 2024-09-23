@implementation SCRCPhotoEvaluator

+ (SCRCPhotoEvaluator)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  return (SCRCPhotoEvaluator *)(id)_sharedInstance;
}

void __36__SCRCPhotoEvaluator_sharedInstance__block_invoke()
{
  SCRCPhotoEvaluator *v0;
  void *v1;

  v0 = objc_alloc_init(SCRCPhotoEvaluator);
  v1 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v0;

}

- (id)evaluateImage:(CGImage *)a3 forCriteria:(unint64_t)a4 inRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SCRCPhotoEvaluatorResults *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  +[SCRCRawImage rawImageForImage:](SCRCRawImage, "rawImageForImage:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 2) == 0)
  {
    v11 = 0;
    if ((v9 & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v12 = 0;
    if ((v9 & 0x10) != 0)
      goto LABEL_4;
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  +[SCRCPhotoEvaluatorBlur detect:inRect:](SCRCPhotoEvaluatorBlur, "detect:inRect:", v10, x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 4) == 0)
    goto LABEL_6;
LABEL_3:
  +[SCRCPhotoEvaluatorColor detect:inRect:](SCRCPhotoEvaluatorColor, "detect:inRect:", v10, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 0x10) == 0)
    goto LABEL_7;
LABEL_4:
  +[SCRCPhotoEvaluatorLuminance detect:inRect:](SCRCPhotoEvaluatorLuminance, "detect:inRect:", v10, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = -[SCRCPhotoEvaluatorResults initWithBlurResult:colorResult:luminanceResult:]([SCRCPhotoEvaluatorResults alloc], "initWithBlurResult:colorResult:luminanceResult:", v11, v12, v13);

  return v14;
}

@end
