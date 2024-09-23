@implementation _UIStickerPickerKeyboardSession

- (void)presentWithTextInput:(id)a3 view:(id)a4
{
  id v7;
  _UIStickerPickerViewController *v8;
  _UIStickerPickerViewController *stickerPicker;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  _UIFallbackPresentationViewController *v28;
  id v29;

  v29 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_textInput, a3);
  objc_storeStrong((id *)&self->_view, a4);
  v8 = objc_alloc_init(_UIStickerPickerViewController);
  stickerPicker = self->_stickerPicker;
  self->_stickerPicker = v8;

  -[_UIStickerPickerViewController setIsLaunchedFromKeyboard:](self->_stickerPicker, "setIsLaunchedFromKeyboard:", 1);
  -[_UIStickerPickerViewController setDelegate:](self->_stickerPicker, "setDelegate:", self);
  objc_msgSend(v7, "_viewControllerForAncestor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    do
    {
      objc_msgSend(v10, "presentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v12;
    }
    while (v13);
  }
  else
  {
    v12 = v10;
  }
  objc_msgSend(v29, "selectedTextRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "start");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "caretRectForPosition:", v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIStickerPickerViewController setSourceView:](self->_stickerPicker, "setSourceView:", v7);
  -[_UIStickerPickerViewController setSourceRect:](self->_stickerPicker, "setSourceRect:", v17, v19, v21, v23);
  objc_msgSend(v7, "_window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "_isTextEffectsWindow");

  if ((v25 & 1) != 0
    || (+[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "supportsStickerTapbackPayload"),
        v26,
        v27))
  {
    v28 = objc_alloc_init(_UIFallbackPresentationViewController);
    -[UIApplicationRotationFollowingController setSizesWindowToScene:](v28, "setSizesWindowToScene:", 1);
    -[_UIFallbackPresentationViewController _presentViewController:sendingView:animated:](v28, "_presentViewController:sendingView:animated:", self->_stickerPicker, v7, 0);

  }
  else
  {
    objc_msgSend(v12, "presentViewController:animated:completion:", self->_stickerPicker, 0, 0);
  }

}

- (void)stickerPickerViewControllerDidDismiss
{
  UITextInput *textInput;
  UIView *view;
  _UIStickerPickerViewController *stickerPicker;
  void *v6;
  char v7;
  id v8;

  textInput = self->_textInput;
  self->_textInput = 0;

  view = self->_view;
  self->_view = 0;

  stickerPicker = self->_stickerPicker;
  self->_stickerPicker = 0;

  -[_UIStickerPickerKeyboardSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UIStickerPickerKeyboardSession delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stickerPickerKeyboardSessionDidFinish");

  }
}

- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4
{
  -[UITextInput _insertItemFromProvider:completionHandler:](self->_textInput, "_insertItemFromProvider:completionHandler:", a3, a4);
}

- (BOOL)remoteHandlesRecentsStickerDonation
{
  return 1;
}

- (_UIStickerPickerKeyboardSessionDelegate)delegate
{
  return (_UIStickerPickerKeyboardSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stickerPicker, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_textInput, 0);
}

@end
