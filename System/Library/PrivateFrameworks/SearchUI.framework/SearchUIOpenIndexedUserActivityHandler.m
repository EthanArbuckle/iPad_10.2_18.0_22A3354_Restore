@implementation SearchUIOpenIndexedUserActivityHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivityRequiredString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setUserActivityRequiredString:", v5);
    objc_msgSend(v4, "applicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setApplicationBundleIdentifier:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (objc_class *)MEMORY[0x1E0CA5920];
  v8 = a5;
  v9 = a3;
  v10 = [v7 alloc];
  objc_msgSend(v9, "userActivityRequiredString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "_initWithUserActivityStrings:secondaryString:optionalData:", v13, 0, 0);
  objc_msgSend(v9, "applicationBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *, void *))a5 + 2))(v8, v11, v12);
}

@end
