@implementation PREditorNumberingSystemPickerController

- (PREditorNumberingSystemPickerController)initWithSelectedNumberingSystem:(id)a3 selectedFont:(id)a4
{
  id v6;
  id v7;
  PREditorNumberingSystemPickerController *v8;
  uint64_t v9;
  void *selectedNumberingSystem;
  uint64_t v11;
  NSString *v12;
  UIFont *v13;
  UIFont *font;

  v6 = a3;
  v7 = a4;
  v8 = -[PREditorNumberingSystemPickerController init](self, "init");
  if (v8)
  {
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      selectedNumberingSystem = v8->_selectedNumberingSystem;
      v8->_selectedNumberingSystem = (NSString *)v9;
    }
    else
    {
      PRSystemNumberingSystem();
      selectedNumberingSystem = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(selectedNumberingSystem, "copy");
      v12 = v8->_selectedNumberingSystem;
      v8->_selectedNumberingSystem = (NSString *)v11;

    }
    if (v7)
    {
      v13 = (UIFont *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
      v13 = (UIFont *)objc_claimAutoreleasedReturnValue();
    }
    font = v8->_font;
    v8->_font = v13;

  }
  return v8;
}

- (id)menu
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PRAllNumberingSystems();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7), "intValue");
        PRNumberingSystemStringForType(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PRNumberingSystemImageForType(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0DC3428];
        PRNumberingSystemDisplayNameForType(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __47__PREditorNumberingSystemPickerController_menu__block_invoke;
        v18[3] = &unk_1E2183C48;
        objc_copyWeak(&v20, &location);
        v13 = v9;
        v19 = v13;
        objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, v10, v13, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "isEqualToString:", self->_selectedNumberingSystem))
          objc_msgSend(v14, "setState:", 1);
        objc_msgSend(v3, "addObject:", v14);

        objc_destroyWeak(&v20);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&location);

  return v15;
}

void __47__PREditorNumberingSystemPickerController_menu__block_invoke(uint64_t a1)
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

  -[PREditorNumberingSystemPickerController selectedNumberingSystem](self, "selectedNumberingSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKey:", v2, CFSTR("numbers"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v8;
}

- (void)didSelectNumberingSystem:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_selectedNumberingSystem != v6)
  {
    objc_storeStrong((id *)&self->_selectedNumberingSystem, a3);
    -[PREditorNumberingSystemPickerController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberingSystemPickerController:didSelectNumberingSystem:", self, v6);

  }
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (NSString)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (PREditorNumberingSystemPickerControllerDelegate)delegate
{
  return (PREditorNumberingSystemPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
