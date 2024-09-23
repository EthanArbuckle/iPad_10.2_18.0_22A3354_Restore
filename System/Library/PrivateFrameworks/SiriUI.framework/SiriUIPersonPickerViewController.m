@implementation SiriUIPersonPickerViewController

- (void)showPicker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  SiriUIPersonPickerViewController *v15;
  id v16;

  v4 = objc_alloc_init(MEMORY[0x24BDBAE78]);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicateForSelectionOfContact:", v5);

  -[SiriUIPersonPickerViewController _dismissPicker](self, "_dismissPicker");
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __47__SiriUIPersonPickerViewController_showPicker___block_invoke;
  v14 = &unk_24D7D9740;
  v15 = self;
  v6 = v4;
  v16 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0F948](&v11);
  -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate", v11, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pickerViewController:shouldPresentPicker:completion:", self, v6, v7);

  }
  else
  {
    v7[2](v7, 1);
  }

}

void __47__SiriUIPersonPickerViewController_showPicker___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pickerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "pickerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pickerViewController:willPresentPicker:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 32), "pickerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerForPickerPresentation:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 984), (id)v7);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 984));
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "pickerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "pickerDelegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pickerViewController:didRequestKeyboardWithVisibility:", *(_QWORD *)(a1 + 32), 0);

    }
  }
}

- (id)_pickerResponseForPerson:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE19118], "createSAPersonFromCNContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE818E0]);
  -[SiriUIObjectPickerViewController _picker](self, "_picker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDomainObjectPicker:", v6);

  objc_msgSend(v5, "setSelectedItem:", v4);
  return v5;
}

- (void)_dismissPicker
{
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pickerViewController:willDismissPicker:", self, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SiriUIPersonPickerViewController__dismissPicker__block_invoke;
  v7[3] = &unk_24D7D91F8;
  v7[4] = self;
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v7);

  objc_storeWeak((id *)&self->_presentingViewController, 0);
}

void __50__SiriUIPersonPickerViewController__dismissPicker__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pickerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pickerDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickerViewController:didDismissPicker:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)contactPickerDidCancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SiriUIPersonPickerViewController _dismissPicker](self, "_dismissPicker", a3);
  -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pickerViewController:didRequestKeyboardWithVisibility:", self, 1);

  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SiriUIPersonPickerViewController _pickerResponseForPerson:](self, "_pickerResponseForPerson:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pickerViewController:didSelectObject:fromPicker:", self, v6, v13);

    }
  }
  -[SiriUIPersonPickerViewController _dismissPicker](self, "_dismissPicker");
  -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SiriUIObjectPickerViewController pickerDelegate](self, "pickerDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pickerViewController:didRequestKeyboardWithVisibility:", self, 1);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
