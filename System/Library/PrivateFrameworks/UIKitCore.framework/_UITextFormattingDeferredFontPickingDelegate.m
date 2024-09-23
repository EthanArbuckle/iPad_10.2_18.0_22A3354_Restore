@implementation _UITextFormattingDeferredFontPickingDelegate

- (void)setEditResponder:(id)a3
{
  id obj;

  obj = a3;
  objc_setAssociatedObject(obj, &_UITextFormattingDeferredFontPickingDelegateIdentifier, self, (void *)1);
  objc_storeWeak((id *)&self->_editResponder, obj);

}

- (void)_removeAssociatedDelegate
{
  UIResponderStandardEditActions **p_editResponder;
  id WeakRetained;
  id v4;

  p_editResponder = &self->_editResponder;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editResponder);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_editResponder);
    objc_setAssociatedObject(v4, &_UITextFormattingDeferredFontPickingDelegateIdentifier, 0, (void *)1);

  }
}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  -[_UITextFormattingDeferredFontPickingDelegate _removeAssociatedDelegate](self, "_removeAssociatedDelegate");
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  objc_msgSend(v4, "selectedFontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    -[_UITextFormattingDeferredFontPickingDelegate fontSize](self, "fontSize");
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, *(_QWORD *)off_1E1678D90);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UITextFormattingDeferredFontPickingDelegate editResponder](self, "editResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[_UITextFormattingDeferredFontPickingDelegate editResponder](self, "editResponder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SendUpdatesToEditResponder(v8, v10);

      }
    }

  }
  v11 = dispatch_time(0, 300000000);
  objc_initWeak(&location, v4);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __84___UITextFormattingDeferredFontPickingDelegate_fontPickerViewControllerDidPickFont___block_invoke;
  v15 = &unk_1E16B3F40;
  objc_copyWeak(&v16, &location);
  dispatch_after(v11, MEMORY[0x1E0C80D38], &v12);
  -[_UITextFormattingDeferredFontPickingDelegate _removeAssociatedDelegate](self, "_removeAssociatedDelegate", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (UIResponderStandardEditActions)editResponder
{
  return (UIResponderStandardEditActions *)objc_loadWeakRetained((id *)&self->_editResponder);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editResponder);
}

@end
