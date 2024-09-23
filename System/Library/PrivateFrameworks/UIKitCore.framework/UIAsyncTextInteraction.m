@implementation UIAsyncTextInteraction

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  id v5;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_view);
    objc_setAssociatedObject(v5, &_UITextInputImplicitInteractionAssistantKey, 0, (void *)0x301);

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)didMoveToView:(id)a3
{
  UIWKTextInteractionAssistant *v4;
  UIWKTextInteractionAssistant *textInteractionAssistant;
  id object;

  object = a3;
  if (object)
  {
    v4 = -[UIWKTextInteractionAssistant initWithView:]([UIWKTextInteractionAssistant alloc], "initWithView:", object);
    textInteractionAssistant = self->_textInteractionAssistant;
    self->_textInteractionAssistant = v4;

    -[UIWKTextInteractionAssistant setDelegate:](self->_textInteractionAssistant, "setDelegate:", self);
    objc_setAssociatedObject(object, &_UITextInputImplicitInteractionAssistantKey, self->_textInteractionAssistant, (void *)0x301);
  }
  objc_storeWeak((id *)&self->_view, object);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContextMenuInteractionDelegate:(id)a3
{
  -[UITextInteractionAssistant setExternalContextMenuInteractionDelegate:](self->_textInteractionAssistant, "setExternalContextMenuInteractionDelegate:", a3);
}

- (UITextSelectionDisplayInteraction)textSelectionDisplayInteraction
{
  return -[UITextInteractionAssistant _selectionViewManager](self->_textInteractionAssistant, "_selectionViewManager");
}

- (void)editabilityChanged
{
  -[UITextInteractionAssistant setGestureRecognizers](self->_textInteractionAssistant, "setGestureRecognizers");
}

- (id)asyncTextInput
{
  UIView **p_view;
  id WeakRetained;
  int v4;
  id v5;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EE0CE228);

  if (v4)
    v5 = objc_loadWeakRetained((id *)p_view);
  else
    v5 = 0;
  return v5;
}

- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(int64_t)a6
{
  -[UIWKTextInteractionAssistant selectionChangedWithGestureAt:withGesture:withState:withFlags:](self->_textInteractionAssistant, "selectionChangedWithGestureAt:withGesture:withState:withFlags:", a4, a5, a6, a3.x, a3.y);
}

- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(int64_t)a5
{
  -[UIWKTextInteractionAssistant selectionChangedWithTouchAt:withSelectionTouch:withFlags:](self->_textInteractionAssistant, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:", a4, a5, a3.x, a3.y);
}

- (void)showDictionaryFor:(id)a3 fromRect:(CGRect)a4
{
  -[UIWKTextInteractionAssistant showDictionaryFor:fromRect:](self->_textInteractionAssistant, "showDictionaryFor:fromRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4
{
  -[UIWKTextInteractionAssistant showTextServiceFor:fromRect:](self->_textInteractionAssistant, "showTextServiceFor:fromRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4
{
  -[UIWKTextInteractionAssistant showShareSheetFor:fromRect:](self->_textInteractionAssistant, "showShareSheetFor:fromRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5
{
  -[UIWKTextInteractionAssistant lookup:withRange:fromRect:](self->_textInteractionAssistant, "lookup:withRange:fromRect:", a3, a4.location, a4.length, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)translate:(id)a3 fromRect:(CGRect)a4
{
  -[UIWKTextInteractionAssistant translate:fromRect:](self->_textInteractionAssistant, "translate:fromRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)scheduleReplacementsForText:(id)a3
{
  -[UIWKTextInteractionAssistant scheduleReplacementsForText:](self->_textInteractionAssistant, "scheduleReplacementsForText:", a3);
}

- (void)scheduleChineseTransliterationForText:(id)a3
{
  -[UIWKTextInteractionAssistant scheduleChineseTransliterationForText:](self->_textInteractionAssistant, "scheduleChineseTransliterationForText:", a3);
}

- (void)presentEditMenuForSelection
{
  -[UITextInteractionAssistant showSelectionCommands](self->_textInteractionAssistant, "showSelectionCommands");
}

- (void)dismissEditMenuForSelection
{
  -[UITextInteractionAssistant hideSelectionCommands](self->_textInteractionAssistant, "hideSelectionCommands");
}

- (void)selectionChanged
{
  -[UIWKTextInteractionAssistant selectionChanged](self->_textInteractionAssistant, "selectionChanged");
}

- (UIContextMenuInteractionDelegate)contextMenuInteractionDelegate
{
  return -[UITextInteractionAssistant externalContextMenuInteractionDelegate](self->_textInteractionAssistant, "externalContextMenuInteractionDelegate");
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return -[UITextInteractionAssistant contextMenuInteraction](self->_textInteractionAssistant, "contextMenuInteraction");
}

- (void)selectionWillChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIAsyncTextInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIAsyncTextInteraction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionWillChange:", self);

  }
  -[UIAsyncTextInteraction asyncTextInput](self, "asyncTextInput");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asyncSystemInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionWillChange:", v7);

}

- (void)selectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIAsyncTextInteraction asyncTextInput](self, "asyncTextInput", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asyncSystemInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionDidChange:", v7);

  -[UIAsyncTextInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIAsyncTextInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionDidChange:", self);

  }
}

- (UIAsyncTextInteractionDelegate)delegate
{
  return (UIAsyncTextInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_textInteractionAssistant, 0);
}

@end
