@implementation _UIKeyShortcutHUDModifierKeyListener

- (void)handleKeyboardEvent:(id)a3
{
  unint64_t v4;
  int64_t currentModifierFlags;
  char v6;
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "modifierFlags") & 0xFFFFFFFFFFFEFFFFLL;
  currentModifierFlags = self->_currentModifierFlags;
  self->_currentModifierFlags = v4;
  if (objc_msgSend(v9, "_isModifierKey"))
  {
    objc_msgSend(v9, "_isKeyDown");
  }
  else
  {
    v6 = objc_msgSend(v9, "_isGlobeKey");
    if (objc_msgSend(v9, "_isKeyDown") && (v6 & 1) == 0)
    {
      -[_UIKeyShortcutHUDModifierKeyListener delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modifierKeyListenerDidPressNonModifierKey:", self);
LABEL_8:

      goto LABEL_9;
    }
  }
  v8 = currentModifierFlags ^ v4;
  if (v8)
  {
    -[_UIKeyShortcutHUDModifierKeyListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modifierKeyListener:didUpdateModifierFlag:", self, v8);
    goto LABEL_8;
  }
LABEL_9:

}

- (_UIKeyShortcutHUDKeyListenerDelegate)delegate
{
  return (_UIKeyShortcutHUDKeyListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentModifierFlags
{
  return self->_currentModifierFlags;
}

- (void)setCurrentModifierFlags:(int64_t)a3
{
  self->_currentModifierFlags = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
