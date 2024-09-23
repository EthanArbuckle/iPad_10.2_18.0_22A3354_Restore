@implementation NSUserActivity(PhotosUICore)

- (uint64_t)px_isCurrent
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5920], "_currentUserActivityUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  return v3;
}

- (void)px_setPersistentIdentifierFromAsset:()PhotosUICore
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "cloudIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "setPersistentIdentifier:", v4);
  }
  else
  {
    objc_msgSend(v6, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPersistentIdentifier:", v5);

  }
}

- (void)px_setPersistentIdentifierFromAssetCollection:()PhotosUICore
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "cloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "setPersistentIdentifier:", v4);
  }
  else
  {
    objc_msgSend(v6, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPersistentIdentifier:", v5);

  }
}

+ (uint64_t)px_allowsDonationsForCurrentProcess
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("MobileSlideShow"));
  return v2;
}

+ (void)px_requestActivityWithActivityType:()PhotosUICore titleProvider:completionBlock:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (px_requestActivityWithActivityType_titleProvider_completionBlock__onceToken != -1)
    dispatch_once(&px_requestActivityWithActivityType_titleProvider_completionBlock__onceToken, &__block_literal_global_246429);
  v10 = px_requestActivityWithActivityType_titleProvider_completionBlock__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_2;
  block[3] = &unk_1E513DE18;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(v10, block);

}

@end
