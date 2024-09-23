@implementation IPAPhotoAdjustmentStackSerializer

- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  IPAPhotoAdjustmentStackSerializer *v9;
  SEL v10;
  id v11;
  id *v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IPAPhotoAdjustmentStackSerializer dataFromPhotoAdjustmentStack:error:](self, "dataFromPhotoAdjustmentStack:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_opt_class();
    v9 = (IPAPhotoAdjustmentStackSerializer *)_PFAssertFailHandler();
    return -[IPAPhotoAdjustmentStackSerializer _adjustmentStackFromData:error:](v9, v10, v11, v12);
  }
}

- (id)dataFromPhotoAdjustmentStack:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  IPAPhotoAdjustmentStackSerializer *v6;
  SEL v7;
  id v8;
  id *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAPhotoAdjustmentStackSerializer *)_PFAssertFailHandler();
  return -[IPAPhotoAdjustmentStackSerializer photoAdjustmentStackFromData:error:](v6, v7, v8, v9);
}

- (id)photoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  IPAVideoAdjustmentStackSerializer *v6;
  SEL v7;
  id v8;
  id *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAVideoAdjustmentStackSerializer *)_PFAssertFailHandler();
  return -[IPAVideoAdjustmentStackSerializer _dataFromAdjustmentStack:error:](v6, v7, v8, v9);
}

@end
