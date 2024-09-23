@implementation UIDebuggingKBAutoFillViewController

- (void)viewDidLoad
{
  UITableView *v3;
  void *v4;
  UITableView *v5;
  UITableView *tableView;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingKBAutoFillViewController;
  -[UIViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = [UITableView alloc];
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[UITableView initWithFrame:style:](v3, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v5;

  -[UIView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_tableView);

  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (id)_getTopMostViewControllerInWindow:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v3, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "topViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)_archiveTopMostViewControllerForAutoFillTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIKBAutoFillTestViewController *v8;
  UIKBAutoFillTestGroundTruthGenerationViewController *v9;
  UINavigationController *v10;
  id v11;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inspectedWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingKBAutoFillViewController _getTopMostViewControllerInWindow:](self, "_getTopMostViewControllerInWindow:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  +[UIKBAutoFillTestArchiveMaker archiveMakerWithViewControllerToSnapshot:](UIKBAutoFillTestArchiveMaker, "archiveMakerWithViewControllerToSnapshot:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeArchive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = -[UIKBAutoFillTestViewController initWithAutoFillTestArchive:]([UIKBAutoFillTestViewController alloc], "initWithAutoFillTestArchive:", v7);
  v9 = -[UIKBAutoFillTestGroundTruthGenerationViewController initWithAutoFillTestViewController:]([UIKBAutoFillTestGroundTruthGenerationViewController alloc], "initWithAutoFillTestViewController:", v8);
  -[UIKBAutoFillTestGroundTruthGenerationViewController setDelegate:](v9, "setDelegate:", self);
  v10 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v9);
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (id)_formTypeFileName:(int64_t)a3
{
  id result;

  result = CFSTR("Unspecified");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
    case 2:
      result = CFSTR("SignIn");
      break;
    case 3:
    case 4:
      result = CFSTR("SignUp");
      break;
    case 5:
      result = CFSTR("ChangePassword");
      break;
    default:
      if (a3 == 10000)
        result = CFSTR("Other");
      else
        result = &stru_1E16EDF20;
      break;
  }
  return result;
}

- (void)autoFillTestGroundTruthGenerationViewController:(id)a3 didFinishWithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  UIDebuggingKBAutoFillViewController *v18;
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "testViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "testArchive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setExpectedResult:", v7);
    +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Saving AutoFill Test Archive"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke;
    aBlock[3] = &unk_1E16E7B40;
    v22 = v10;
    v12 = v6;
    v23 = v12;
    v13 = v10;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_36;
    v16[3] = &unk_1E16D68C0;
    v20 = _Block_copy(aBlock);
    v17 = v9;
    v18 = self;
    v19 = v7;
    v14 = v20;
    v15 = v9;
    objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, v16);

  }
  else
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = dispatch_time(0, 500000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_2;
  v10[3] = &unk_1E16B51E8;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v10);

}

void __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_2(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (v2)
  {
    objc_msgSend(a1[4], "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Failed to save the archive with error %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setMessage:", v5);

  }
  else
  {
    _UIMainBundleIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Successfully saved AutoFill Test Archive in app's container temp directory.\nBundle identifier: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setMessage:", v7);

    v8 = _block_invoke___s_category_10;
    if (!_block_invoke___s_category_10)
    {
      v8 = __UILogCategoryGetNode("AutoFillTest", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_block_invoke___s_category_10);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      _UIMainBundleIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Saved archive for bundle id: %{public}@, at path: %{public}@", buf, 0x16u);

    }
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_32;
  v14[3] = &unk_1E16E7B18;
  v17 = v2 == 0;
  v15 = a1[6];
  v16 = a1[7];
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Done"), 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "addAction:", v13);

}

uint64_t __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_32(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = _block_invoke_2___s_category_1;
    if (!_block_invoke_2___s_category_1)
    {
      v2 = __UILogCategoryGetNode("AutoFillTest", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_block_invoke_2___s_category_1);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      _UIMainBundleIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Saved archive for bundle id: %{public}@, at path: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_36(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "autoFillTestArchiveData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("AutoFillTestArchives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v23);
  v9 = v23;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v10, "setLocale:", v20);
    objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH-mm-ss"));
    v21 = v2;
    objc_msgSend(*(id *)(a1 + 40), "_formTypeFileName:", objc_msgSend(*(id *)(a1 + 48), "formType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    _UIMainBundleIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("AutoFill_%@_%@_%@.autofillarchive"), v12, v19, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v21;
    v22 = v9;
    LODWORD(v14) = objc_msgSend(v21, "writeToURL:options:error:", v16, 1, &v22);
    v17 = v22;

    if ((_DWORD)v14)
      v18 = 0;
    else
      v18 = v17;
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v16, v18);

    v9 = v17;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "row");

  if (!v7)
    -[UIDebuggingKBAutoFillViewController _archiveTopMostViewControllerForAutoFillTest](self, "_archiveTopMostViewControllerForAutoFillTest");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  if (!v7)
  {
    objc_msgSend(v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", CFSTR("Create AutoFill Test Archive"));

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
