@implementation ICSystemPaperPresenter

+ (void)initialize
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("ICEnableSystemPaperExtension");
    v5[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

+ (void)presentSystemPaperWithUserActivityData:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD);
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  ICSystemPaperSceneViewController *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((ICIsSystemPaperAvailable() & 1) != 0)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rootViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        do
        {
          objc_msgSend(v12, "presentedViewController");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "presentedViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v9;
        }
        while (v14);
      }
      else
      {
        v9 = v12;
      }
    }
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __101__ICSystemPaperPresenter_presentSystemPaperWithUserActivityData_presentingViewController_completion___block_invoke;
    v22[3] = &unk_24F964318;
    v25 = &v26;
    v9 = v9;
    v23 = v9;
    v24 = v10;
    v15 = (void (**)(_QWORD))MEMORY[0x22E31B578](v22);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("ICEnableSystemPaperExtension"));

    if (v17)
    {
      objc_msgSend(a1, "makeExtensionHostViewControllerWithUserActivityData:completion:", v8, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v27[5];
      v27[5] = v18;

    }
    else
    {
      v20 = -[ICSystemPaperSceneViewController initWithUserActivityData:]([ICSystemPaperSceneViewController alloc], "initWithUserActivityData:", v8);
      v21 = (void *)v27[5];
      v27[5] = (uint64_t)v20;

      objc_msgSend((id)v27[5], "setActive:", 1);
      v15[2](v15);
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("System Paper not available"));
  }

}

uint64_t __101__ICSystemPaperPresenter_presentSystemPaperWithUserActivityData_presentingViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v1)
    return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v1, 1, *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)makeExtensionHostViewControllerWithUserActivityData:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  ICSystemPaperExtensionHostViewController *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDC79E8], "extensionPointIdentifierQuery:", CFSTR("com.apple.private.system-paper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v6);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobilenotes.EditorExtension"));

      if ((v14 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (!v15)
      goto LABEL_12;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC7BB8]), "initWithExtensionIdentity:", v15);
    objc_msgSend(v16, "setBeginHostingImmediately:", 1);
    v17 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

    v19 = -[ICSystemPaperExtensionHostViewController initWithConfiguration:]([ICSystemPaperExtensionHostViewController alloc], "initWithConfiguration:", v16);
    -[_EXHostViewController setPlaceholderView:](v19, "setPlaceholderView:", v17);
    v20 = v22;
    -[ICSystemPaperExtensionHostViewController setUserActivityData:](v19, "setUserActivityData:", v22);
    -[ICSystemPaperExtensionHostViewController setStartHostingBlock:](v19, "setStartHostingBlock:", v5);

  }
  else
  {
LABEL_9:

LABEL_12:
    ICSystemPaperExtensionLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v20 = v22;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ICSystemPaperPresenter makeExtensionHostViewControllerWithUserActivityData:completion:].cold.1();
    v19 = 0;
  }

  return v19;
}

- (ICSystemPaperPresenter)init
{
  -[ICSystemPaperPresenter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (void)makeExtensionHostViewControllerWithUserActivityData:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22D8F4000, v0, OS_LOG_TYPE_ERROR, "Couldn't find System Paper extension; returning nil",
    v1,
    2u);
  OUTLINED_FUNCTION_1();
}

@end
