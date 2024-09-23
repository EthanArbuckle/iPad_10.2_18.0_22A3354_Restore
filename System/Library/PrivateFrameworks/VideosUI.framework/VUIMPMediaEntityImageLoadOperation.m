@implementation VUIMPMediaEntityImageLoadOperation

- (VUIMPMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIMPMediaEntityImageLoadOperation;
  return -[VUIImageLoadParamsOperation initWithParams:scaleToSize:cropToFit:](&v5, sel_initWithParams_scaleToSize_cropToFit_, a3, 0, a4.width, a4.height);
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[VUIMPMediaEntityImageLoadOperation _MPMediaEntityImageLoadParams](self, "_MPMediaEntityImageLoadParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkCatalog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "hasImageOnDisk"))
    {
      objc_msgSend(v5, "bestImageFromDisk");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMPMediaEntityImageLoadOperation _finishWithImage:](self, "_finishWithImage:", v6);

    }
    else
    {
      objc_msgSend(v5, "setFittingSize:", *MEMORY[0x1E0CC1D20], *(double *)(MEMORY[0x1E0CC1D20] + 8));
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __55__VUIMPMediaEntityImageLoadOperation_executionDidBegin__block_invoke;
      v7[3] = &unk_1E9F9B520;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v5, "requestImageWithCompletion:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[VUIMPMediaEntityImageLoadOperation _finishWithImage:](self, "_finishWithImage:", 0);
  }

}

- (void)_finishWithImage:(id)a3
{
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DB1858], "imageWithCGImageRef:preserveAlpha:", objc_msgSend(objc_retainAutorelease(a3), "CGImage"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageLoadParamsOperation setImage:](self, "setImage:", v4);

  }
  -[VUIImageLoadParamsOperation setScalingResult:](self, "setScalingResult:", 0);
  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (VUIMPMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
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

void __55__VUIMPMediaEntityImageLoadOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_finishWithImage:", v3);

}

@end
