@implementation UITextFormattingCoordinator

- (UITextFormattingCoordinator)initWithWindowScene:(UIWindowScene *)windowScene
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingCoordinator;
  return -[UITextFormattingCoordinator init](&v4, sel_init, windowScene);
}

+ (UITextFormattingCoordinator)textFormattingCoordinatorForWindowScene:(UIWindowScene *)windowScene
{
  void *v3;
  void *v4;

  -[UIWindowScene keyboardSceneDelegate](windowScene, "keyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFormattingCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextFormattingCoordinator *)v4;
}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  UITextFormattingCoordinatorDelegate **p_delegate;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "updateTextAttributesWithConversionHandler:", v4);
  }
  else
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateTextAttributesWithConversionHandler:", v4);

    v4 = v6;
  }

}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "selectedFontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__UITextFormattingCoordinator_fontPickerViewControllerDidPickFont___block_invoke;
    aBlock[3] = &unk_1E16E4EB0;
    v8 = v4;
    v6 = _Block_copy(aBlock);
    -[UITextFormattingCoordinator updateTextAttributesWithConversionHandler:](self, "updateTextAttributesWithConversionHandler:", v6);

  }
}

id __67__UITextFormattingCoordinator_fontPickerViewControllerDidPickFont___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(*(id *)(a1 + 32), "selectedFontDescriptor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "selectedFontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointSize");
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v4);
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

+ (BOOL)isFontPanelVisible
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
