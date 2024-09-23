@implementation NSUserActivity(UINSItemProvider)

+ (id)readableTypeIdentifiersForItemProvider
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("com.apple.uikit.useractivity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v15;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", a4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", CFSTR("com.apple.uikit.useractivity"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToType:", v9))
  {

LABEL_4:
    v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithUserActivityData:", v7);
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", CFSTR("com.apple.uikit.scene"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "conformsToType:", v10);

  if (v11)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 1024, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  v12 = 0;
  if (a5 && v15)
  {
    v13 = objc_retainAutorelease(v15);
    v12 = 0;
    *a5 = v13;
  }
LABEL_5:

  return v12;
}

- (id)initWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = *MEMORY[0x1E0CB3418];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a1, "initWithActivityType:", v8);
  objc_msgSend((id)objc_opt_class(), "objectWithItemProviderData:typeIdentifier:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  return v13;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("com.apple.uikit.useractivity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)loadDataWithTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.uikit.useractivity")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.uikit.scene")))
    {
      v8 = a1;
      v9 = v7;
      dispatch_get_global_queue(0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __createDataWithCompletion_block_invoke;
      v13[3] = &unk_1E16B1D18;
      v14 = v8;
      v15 = v9;
      v11 = v8;
      dispatch_async(v10, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }

  return 0;
}

@end
