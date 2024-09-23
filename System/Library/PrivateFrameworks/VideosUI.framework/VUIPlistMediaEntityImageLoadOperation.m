@implementation VUIPlistMediaEntityImageLoadOperation

- (VUIPlistMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("The %@ initializer is not available."), v8);

  return 0;
}

- (VUIPlistMediaEntityImageLoadOperation)initWithParams:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIPlistMediaEntityImageLoadOperation;
  return -[VUIImageLoadParamsOperation initWithParams:scaleToSize:cropToFit:](&v4, sel_initWithParams_scaleToSize_cropToFit_, a3, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[VUIPlistMediaEntityImageLoadOperation _plistMediaEntityImageLoadParams](self, "_plistMediaEntityImageLoadParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFileURL"))
  {
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    v6 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DB1858], "imageWithData:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageLoadParamsOperation setImage:](self, "setImage:", v7);

  }
  -[VUIImageLoadParamsOperation setScalingResult:](self, "setScalingResult:", 0);
  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");

}

@end
