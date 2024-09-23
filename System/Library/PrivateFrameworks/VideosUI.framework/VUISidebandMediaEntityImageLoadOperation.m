@implementation VUISidebandMediaEntityImageLoadOperation

- (void)executionDidBegin
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  -[VUIImageLoadParamsOperation params](self, "params");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUIImageLoadParamsOperation params](self, "params");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v6, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke;
      v8[3] = &unk_1E9F9A938;
      objc_copyWeak(&v10, &location);
      v9 = v6;
      objc_msgSend(v7, "performBlock:", v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      -[VUISidebandMediaEntityImageLoadOperation _finishWithImage:](self, "_finishWithImage:", 0);
    }

  }
  else
  {
    -[VUISidebandMediaEntityImageLoadOperation _finishWithImage:](self, "_finishWithImage:", 0);
  }
}

void __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_2;
  block[3] = &unk_1E9F99840;
  v9 = v4;
  v10 = v3;
  v11 = WeakRetained;
  v6 = v3;
  v7 = v4;
  dispatch_async(v5, block);

}

void __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (objc_msgSend(a1[4], "length"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", a1[4]);
    v3 = a1[5];
    if (v3)
    {
      objc_msgSend(v3, "managedObjectContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_3;
      v5[3] = &unk_1E9F98DF0;
      v6 = a1[5];
      objc_msgSend(v4, "performBlock:", v5);

    }
    objc_msgSend(a1[6], "_finishWithImage:", v2);

  }
  else
  {
    objc_msgSend(a1[6], "_finishWithImage:", 0);
  }
}

void __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshObject:mergeChanges:", *(_QWORD *)(a1 + 32), 0);

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

@end
