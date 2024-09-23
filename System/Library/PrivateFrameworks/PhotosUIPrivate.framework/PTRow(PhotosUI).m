@implementation PTRow(PhotosUI)

+ (id)pu_rowWithTitle:()PhotosUI output:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__PTRow_PhotosUI__pu_rowWithTitle_output___block_invoke;
  v10[3] = &unk_1E58AB500;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "pu_rowWithTitle:asynchronousOutputProducer:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)pu_rowWithTitle:()PhotosUI asynchronousOutputProducer:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PTRow_PhotosUI__pu_rowWithTitle_asynchronousOutputProducer___block_invoke;
  v10[3] = &unk_1E58AB528;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)pu_rowWithTitle:()PhotosUI action:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStaticTitle:", v7);

  v9 = (void *)MEMORY[0x1E0D830A0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__PTRow_PhotosUI__pu_rowWithTitle_action___block_invoke;
  v13[3] = &unk_1E58AB550;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "actionWithHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAction:", v11);

  return v8;
}

+ (id)pu_rowWithTitle:()PhotosUI settings:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PTRow_PhotosUI__pu_rowWithTitle_settings___block_invoke;
  v10[3] = &unk_1E58AB578;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "pu_rowWithTitle:settingsProvider:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)pu_rowWithTitle:()PhotosUI settingsProvider:
{
  return objc_msgSend(a1, "pu_rowWithTitle:settingsProvider:isTransient:", a3, a4, 0);
}

+ (id)pu_rowWithTitle:()PhotosUI settingsProvider:isTransient:
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  char v14;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PTRow_PhotosUI__pu_rowWithTitle_settingsProvider_isTransient___block_invoke;
  v12[3] = &unk_1E58AB5A0;
  v13 = v8;
  v14 = a5;
  v9 = v8;
  objc_msgSend(a1, "px_rowWithTitle:action:", a3, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)pu_rowWithTitle:()PhotosUI settings:condition:
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a1, "pu_rowWithTitle:settings:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCondition:", v8);

  return v9;
}

@end
