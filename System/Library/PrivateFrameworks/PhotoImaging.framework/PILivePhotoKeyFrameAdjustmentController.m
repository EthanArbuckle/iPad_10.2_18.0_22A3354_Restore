@implementation PILivePhotoKeyFrameAdjustmentController

- (PILivePhotoKeyFrameAdjustmentController)initWithAdjustment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PILivePhotoKeyFrameAdjustmentController;
  return -[PIAdjustmentController initWithAdjustment:](&v4, sel_initWithAdjustment_, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v12;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[PILivePhotoKeyFrameAdjustmentController timeKey](PILivePhotoKeyFrameAdjustmentController, "timeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PILivePhotoKeyFrameAdjustmentController scaleKey](PILivePhotoKeyFrameAdjustmentController, "scaleKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake((CMTime *)retstr, v7, objc_msgSend(v10, "intValue"));

  return result;
}

- (void)setKeyFrameTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PILivePhotoKeyFrameAdjustmentController timeKey](PILivePhotoKeyFrameAdjustmentController, "timeKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PILivePhotoKeyFrameAdjustmentController scaleKey](PILivePhotoKeyFrameAdjustmentController, "scaleKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)timeKey
{
  return CFSTR("time");
}

+ (id)scaleKey
{
  return CFSTR("scale");
}

@end
