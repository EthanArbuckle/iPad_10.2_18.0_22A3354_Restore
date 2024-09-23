@implementation _UITextFieldClearButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)_isModernButton
{
  return 1;
}

- (id)_defaultImageForState:(unint64_t)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  -[_UITextFieldClearButton imageProvider](self, "imageProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UITextFieldClearButton imageProvider](self, "imageProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultClearButtonImageForState:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UITextFieldClearButton;
    -[UIButton _defaultImageForState:withConfiguration:](&v11, sel__defaultImageForState_withConfiguration_, a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (_UITextFieldClearButtonImageProviding)imageProvider
{
  return (_UITextFieldClearButtonImageProviding *)objc_loadWeakRetained((id *)&self->_imageProvider);
}

- (void)setImageProvider:(id)a3
{
  objc_storeWeak((id *)&self->_imageProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageProvider);
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldClearButton;
  -[UIControl setPointerInteractionEnabled:](&v7, sel_setPointerInteractionEnabled_);
  -[UIButton pointerStyleProvider](self, "pointerStyleProvider");
  v5 = objc_claimAutoreleasedReturnValue();
  if (a3 && v5 == 0)
    v6 = &__block_literal_global_396;
  else
    v6 = (void *)v5;
  -[UIButton setPointerStyleProvider:](self, "setPointerStyleProvider:", v6);

}

@end
