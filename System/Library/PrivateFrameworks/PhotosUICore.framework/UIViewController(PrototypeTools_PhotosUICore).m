@implementation UIViewController(PrototypeTools_PhotosUICore)

+ (id)px_viewControllerWithSettings:()PrototypeTools_PhotosUICore
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D83120];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRootSettings:", v4);

  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)px_viewControllerWithOutput:()PrototypeTools_PhotosUICore
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithOutput___block_invoke;
  v8[3] = &unk_1E511F9E0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "px_viewControllerWithAsynchronousOutputProducer:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)px_viewControllerWithAsynchronousOutputProducer:()PrototypeTools_PhotosUICore
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithAsynchronousOutputProducer___block_invoke;
  v8[3] = &unk_1E511FA98;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "px_viewControllerWithContinuousOutputProducer:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_PXConsoleViewController)px_viewControllerWithContinuousOutputProducer:()PrototypeTools_PhotosUICore
{
  id v3;
  _PXConsoleViewController *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = a3;
  v4 = objc_alloc_init(_PXConsoleViewController);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithContinuousOutputProducer___block_invoke;
  v12[3] = &unk_1E5129188;
  objc_copyWeak(&v13, &location);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __95__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithContinuousOutputProducer___block_invoke_2;
  v9[3] = &unk_1E511FAC0;
  objc_copyWeak(&v11, &location);
  v7 = v5;
  v10 = v7;
  (*((void (**)(id, _QWORD *, _QWORD *))v3 + 2))(v3, v12, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v4;
}

@end
