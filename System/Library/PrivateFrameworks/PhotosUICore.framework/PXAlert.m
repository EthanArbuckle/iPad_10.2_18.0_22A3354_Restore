@implementation PXAlert

- (PXAlert)init
{
  PXAlertConfiguration *v3;
  PXAlert *v4;

  v3 = objc_alloc_init(PXAlertConfiguration);
  v4 = -[PXAlert initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (PXAlert)initWithConfiguration:(id)a3
{
  id v4;
  PXAlert *v5;
  uint64_t v6;
  PXAlertConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAlert;
  v5 = -[PXAlert init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (PXAlertConfiguration *)v6;

  }
  return v5;
}

- (void)_loadIfNeeded
{
  PXAlert *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIAlertController *alertController;
  void *v12;
  void *v13;
  PXAlertAction *v14;
  void *v15;
  PXAlertAction *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  PXAlert *v23;
  UIAlertController *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  _QWORD v39[5];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD aBlock[4];
  id v46;
  _BYTE v47[128];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  if (!self->_didLoad)
  {
    v2 = self;
    self->_didLoad = 1;
    -[PXAlert configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __24__PXAlert__loadIfNeeded__block_invoke;
    aBlock[3] = &unk_1E5130E00;
    v6 = v5;
    v46 = v6;
    v38 = _Block_copy(aBlock);
    v7 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(v3, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, objc_msgSend(v3, "style"));
    v10 = objc_claimAutoreleasedReturnValue();
    alertController = v2->_alertController;
    v2->_alertController = (UIAlertController *)v10;

    objc_msgSend(v3, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController setContentViewController:](v2->_alertController, "setContentViewController:", v12);

    objc_msgSend(v3, "headerContentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController _setHeaderContentViewController:](v2->_alertController, "_setHeaderContentViewController:", v13);

    v35 = v6;
    v36 = v3;
    if (!objc_msgSend(v4, "count"))
    {
      v14 = [PXAlertAction alloc];
      PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PXAlertAction initWithTitle:style:action:](v14, "initWithTitle:style:action:", v15, 1, 0, v6);
      v48[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v17;
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v4;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v23 = v2;
          v24 = v2->_alertController;
          v25 = (void *)MEMORY[0x1E0DC3448];
          objc_msgSend(v22, "title", v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v22, "style");
          if (v27 >= 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIAlertActionStyle UIAlertActionStyleFromPXAlertActionStyle(PXAlertActionStyle)");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXAlertActionStyle.h"), 43, CFSTR("Code which should be unreachable has been reached"));

            abort();
          }
          v28 = v27;
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __24__PXAlert__loadIfNeeded__block_invoke_2;
          v39[3] = &unk_1E5138AE0;
          v29 = v38;
          v39[4] = v22;
          v40 = v29;
          objc_msgSend(v25, "actionWithTitle:style:handler:", v26, v28, v39);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIAlertController addAction:](v24, "addAction:", v30);

          v2 = v23;
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v19);
    }

    objc_msgSend(v36, "sourceItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      -[UIAlertController setModalPresentationStyle:](v2->_alertController, "setModalPresentationStyle:", 7);
      -[UIAlertController popoverPresentationController](v2->_alertController, "popoverPresentationController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setSourceItem:", v31);

    }
  }
}

- (void)_present
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_firstKeyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "PXAlert should avoid using UIApplication.sharedApplication and pass in the presenting view controller directly", v8, 2u);
    }

  }
  -[PXAlert alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_presentOverTopmostPresentedViewController:animated:completion:", v7, 1, 0);

}

- (void)dismissWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[PXAlert alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);
  }
  else if (v6)
  {
    v6[2]();
  }

}

- (UIAlertController)alertController
{
  -[PXAlert _loadIfNeeded](self, "_loadIfNeeded");
  return self->_alertController;
}

- (PXAlertConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

void __24__PXAlert__loadIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(v6, "action");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);

}

uint64_t __24__PXAlert__loadIfNeeded__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)show:(id)a3
{
  void (**v4)(id, PXAlertConfiguration *);
  PXAlertConfiguration *v5;
  void *v6;

  v4 = (void (**)(id, PXAlertConfiguration *))a3;
  v5 = objc_alloc_init(PXAlertConfiguration);
  v4[2](v4, v5);

  objc_msgSend(a1, "showWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)showForError:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAlert.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __24__PXAlert_showForError___block_invoke;
  v10[3] = &unk_1E5138B28;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a1, "show:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)showWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAlert.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v5);
  objc_msgSend(v6, "_present");

  return v6;
}

uint64_t __24__PXAlert_showForError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "configureForError:", *(_QWORD *)(a1 + 32));
}

@end
