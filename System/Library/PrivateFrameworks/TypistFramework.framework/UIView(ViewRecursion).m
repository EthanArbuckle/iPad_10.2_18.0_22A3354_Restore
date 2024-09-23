@implementation UIView(ViewRecursion)

- (id)allSubViews
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6[5], "addObject:", a1);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__UIView_ViewRecursion__allSubViews__block_invoke;
  v4[3] = &unk_251A7CA40;
  v4[4] = a1;
  v4[5] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (uint64_t)viewExistsOnScreen:()ViewRecursion
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[5];
  id v29;

  v3 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__7;
  v28[4] = __Block_byref_object_dispose__7;
  v29 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __44__UIView_ViewRecursion__viewExistsOnScreen___block_invoke;
  v16[3] = &unk_251A7D390;
  v18 = v28;
  v13 = v3;
  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  v17 = v13;
  v19 = &v24;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v16);
  v14 = *((unsigned __int8 *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);

  return v14;
}

@end
