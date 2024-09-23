@implementation IPAVideoAdjustmentStackSerializer

- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  IPAVideoAdjustmentStackSerializer *v9;
  SEL v10;
  id v11;
  id *v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IPAVideoAdjustmentStackSerializer dataFromVideoAdjustmentStack:error:](self, "dataFromVideoAdjustmentStack:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_opt_class();
    v9 = (IPAVideoAdjustmentStackSerializer *)_PFAssertFailHandler();
    return -[IPAVideoAdjustmentStackSerializer _adjustmentStackFromData:error:](v9, v10, v11, v12);
  }
}

- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4
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
  return -[IPAVideoAdjustmentStackSerializer videoAdjustmentStackFromData:error:](v6, v7, v8, v9);
}

- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  void *v6;
  SEL v7;
  id v8;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (void *)_PFAssertFailHandler();
  return +[IPAAdjustmentStackSerializer dataFromPropertyList:](v6, v7, v8);
}

@end
