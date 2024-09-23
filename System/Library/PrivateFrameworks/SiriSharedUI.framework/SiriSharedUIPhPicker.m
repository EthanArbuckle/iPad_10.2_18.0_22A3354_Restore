@implementation SiriSharedUIPhPicker

- (void)presentPhotoPicker:(id)a3 withSearchString:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHPickerViewController *v11;
  PHPickerViewController *v12;
  id v13;
  PHPickerViewController *v14;
  PHPickerViewController *pickerViewController;
  void *v16;
  id completionHandler;
  PHPickerViewController *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_pickerViewController
    && (objc_msgSend(v8, "presentedViewController"),
        v11 = (PHPickerViewController *)objc_claimAutoreleasedReturnValue(),
        v12 = self->_pickerViewController,
        v11,
        v11 == v12))
  {
    -[PHPickerViewController _searchWithString:](self->_pickerViewController, "_searchWithString:", v9);
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CD2168]);
    objc_msgSend(v13, "setSelectionLimit:", 0);
    v14 = (PHPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v13);
    pickerViewController = self->_pickerViewController;
    self->_pickerViewController = v14;

    -[PHPickerViewController setDelegate:](self->_pickerViewController, "setDelegate:", self);
    v16 = _Block_copy(v10);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v16;

    objc_initWeak(&location, self);
    v18 = self->_pickerViewController;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__SiriSharedUIPhPicker_presentPhotoPicker_withSearchString_completion___block_invoke;
    v19[3] = &unk_1EA89CCA8;
    objc_copyWeak(&v21, &location);
    v20 = v9;
    objc_msgSend(v8, "presentViewController:animated:completion:", v18, 1, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __71__SiriSharedUIPhPicker_presentPhotoPicker_withSearchString_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      v4 = objc_msgSend(v3, "length");
      WeakRetained = v5;
      if (v4)
      {
        objc_msgSend(v5[1], "_searchWithString:", *(_QWORD *)(a1 + 32));
        WeakRetained = v5;
      }
    }
  }

}

- (void)dismissPhotoPickerIfExistsWithAnimation:(BOOL)a3
{
  if (self->_pickerViewController)
    -[SiriSharedUIPhPicker _dismissWithAnimation:](self, "_dismissWithAnimation:", a3);
}

- (void)_dismissWithAnimation:(BOOL)a3
{
  PHPickerViewController *pickerViewController;

  -[PHPickerViewController dismissViewControllerAnimated:completion:](self->_pickerViewController, "dismissViewControllerAnimated:completion:", a3, 0);
  pickerViewController = self->_pickerViewController;
  self->_pickerViewController = 0;

}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SiriSharedUIPhPicker completionHandler](self, "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "itemProvider", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[SiriSharedUIPhPicker completionHandler](self, "completionHandler");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v7);

  }
  -[SiriSharedUIPhPicker _dismissWithAnimation:](self, "_dismissWithAnimation:", 1, (_QWORD)v15);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end
