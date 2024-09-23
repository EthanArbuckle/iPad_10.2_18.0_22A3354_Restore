@implementation PIRedEyeAdjustmentController

- (BOOL)hasCorrections
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRedEyeAdjustmentController inputCorrectionInfoKey](PIRedEyeAdjustmentController, "inputCorrectionInfoKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count") != 0;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue") & v6;

  return v9;
}

- (NSArray)inputCorrectionInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRedEyeAdjustmentController inputCorrectionInfoKey](PIRedEyeAdjustmentController, "inputCorrectionInfoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSArray *)v7;
}

- (void)setInputCorrectionInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRedEyeAdjustmentController inputCorrectionInfoKey](PIRedEyeAdjustmentController, "inputCorrectionInfoKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)inputCorrectionInfoKey
{
  return CFSTR("inputCorrectionInfo");
}

@end
