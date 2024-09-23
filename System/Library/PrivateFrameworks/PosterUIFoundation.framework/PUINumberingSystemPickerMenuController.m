@implementation PUINumberingSystemPickerMenuController

- (PUINumberingSystemPickerMenuController)initWithNumberingSystem:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  PUINumberingSystemPickerMenuController *v8;
  void *v9;
  void *v10;
  PUINumberingSystem *v11;
  PUINumberingSystem *selectedNumberingSystem;
  UIFont *v13;
  UIFont *font;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUINumberingSystemPickerMenuController;
  v8 = -[PUINumberingSystemPickerMenuController init](&v16, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      +[PUINumberingSystem systemDefaultNumberingSystem](PUINumberingSystem, "systemDefaultNumberingSystem");
      v11 = (PUINumberingSystem *)objc_claimAutoreleasedReturnValue();
    }
    selectedNumberingSystem = v8->_selectedNumberingSystem;
    v8->_selectedNumberingSystem = v11;

    if (v7)
    {
      v13 = (UIFont *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
      v13 = (UIFont *)objc_claimAutoreleasedReturnValue();
    }
    font = v8->_font;
    v8->_font = v13;

  }
  return v8;
}

- (UIMenu)menu
{
  UIMenu *menu;
  UIMenu **p_menu;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  p_menu = &self->_menu;
  menu = self->_menu;
  if (menu)
    return menu;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDF6BA8];
  +[PUINumberingSystem supportedNumberingSystemTypes](PUINumberingSystem, "supportedNumberingSystemTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __46__PUINumberingSystemPickerMenuController_menu__block_invoke;
  v13 = &unk_25154BEE0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "bs_mapNoNulls:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithChildren:", v8, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)p_menu, v9);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (UIMenu *)v9;
}

id __46__PUINumberingSystemPickerMenuController_menu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PUINumberingSystem *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  PUINumberingSystem *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PUINumberingSystem *v19;
  id v20;

  v3 = a2;
  v4 = -[PUINumberingSystem initWithNumberingSystemType:]([PUINumberingSystem alloc], "initWithNumberingSystemType:", v3);
  v5 = (void *)MEMORY[0x24BDF67B8];
  -[PUINumberingSystem localizedDisplayName](v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystem image](v4, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __46__PUINumberingSystemPickerMenuController_menu__block_invoke_2;
  v18 = &unk_25154BEB8;
  v8 = (id *)(a1 + 32);
  objc_copyWeak(&v20, (id *)(a1 + 32));
  v9 = v4;
  v19 = v9;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, v3, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained(v8);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    if (-[PUINumberingSystem isEqual:](v9, "isEqual:", *((_QWORD *)WeakRetained + 2), v15, v16, v17, v18))
      objc_msgSend(v10, "setState:", 1);
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  objc_destroyWeak(&v20);
  return v13;
}

void __46__PUINumberingSystemPickerMenuController_menu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didSelectNumberingSystem:", *(_QWORD *)(a1 + 32));

}

- (NSLocale)displayLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUINumberingSystemPickerMenuController selectedNumberingSystem](self, "selectedNumberingSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v2, "systemName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("numbers"));

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v9;
}

- (void)didSelectNumberingSystem:(id)a3
{
  UIMenu *menu;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[PUINumberingSystem isEqual:](self->_selectedNumberingSystem, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_selectedNumberingSystem, a3);
    menu = self->_menu;
    self->_menu = 0;

    -[PUINumberingSystemPickerMenuController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberingSystemPickerMenuController:didSelectNumberingSystem:", self, v7);

  }
}

- (PUINumberingSystem)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (void)setSelectedNumberingSystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PUINumberingSystemPickerControllerDelegate)delegate
{
  return (PUINumberingSystemPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
