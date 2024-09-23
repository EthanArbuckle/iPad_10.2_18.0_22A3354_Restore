@implementation TUIInputAccessoryBackdropView

- (void)setInputAccessoryViewTraits:(id)a3
{
  TUIInputAccessoryViewTraits *v5;
  TUIInputAccessoryViewTraits *v6;

  v5 = (TUIInputAccessoryViewTraits *)a3;
  if (self->_inputAccessoryViewTraits != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inputAccessoryViewTraits, a3);
    -[TUIInputAccessoryBackdropView updateVisualStyle](self, "updateVisualStyle");
    v5 = v6;
  }

}

- (void)_setRenderConfig:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIInputAccessoryBackdropView;
  -[TUIInputAccessoryBackdropView _setRenderConfig:](&v4, sel__setRenderConfig_, a3);
  -[TUIInputAccessoryBackdropView updateVisualStyle](self, "updateVisualStyle");
}

- (void)updateVisualStyle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  -[TUIInputAccessoryBackdropView inputAccessoryViewTraits](self, "inputAccessoryViewTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[TUIInputAccessoryBackdropView inputAccessoryViewTraits](self, "inputAccessoryViewTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputAccessoryViewBackdropColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIInputAccessoryBackdropView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  -[TUIInputAccessoryBackdropView inputAccessoryViewTraits](self, "inputAccessoryViewTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[TUIInputAccessoryBackdropView inputAccessoryViewTraits](self, "inputAccessoryViewTraits");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputAccessoryViewBackdropEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIInputAccessoryBackdropView setBackgroundEffects:](self, "setBackgroundEffects:", v9);

  }
}

- (TUIInputAccessoryViewTraits)inputAccessoryViewTraits
{
  return self->_inputAccessoryViewTraits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAccessoryViewTraits, 0);
}

@end
