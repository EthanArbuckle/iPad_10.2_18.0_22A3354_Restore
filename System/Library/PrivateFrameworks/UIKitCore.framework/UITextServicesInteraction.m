@implementation UITextServicesInteraction

- (void)finishSetup
{
  void *v3;
  void *v4;
  id v5;

  -[UITextInteraction _textInput](self, "_textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextServicesResponderProxy _proxyWithResponder:](_UITextServicesResponderProxy, "_proxyWithResponder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextServicesInteraction setResponderProxy:](self, "setResponderProxy:", v4);

  -[UITextServicesInteraction responderProxy](self, "responderProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)_beginSessionWithType:(int64_t)a3 sender:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3 > 7)
  {
    if (a3 == 32)
    {
      v7 = v6;
      -[UITextServicesInteraction _translate:](self, "_translate:", v6);
      goto LABEL_11;
    }
    if (a3 != 16)
    {
      if (a3 == 8)
      {
        v7 = v6;
        -[UITextServicesInteraction _share:](self, "_share:", v6);
LABEL_11:
        v6 = v7;
        goto LABEL_12;
      }
      goto LABEL_12;
    }
LABEL_9:
    v7 = v6;
    -[UITextServicesInteraction _define:](self, "_define:", v6);
    goto LABEL_11;
  }
  if (a3 == 2)
    goto LABEL_9;
  if (a3 == 4)
  {
    v7 = v6;
    -[UITextServicesInteraction _addShortcut:](self, "_addShortcut:", v6);
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;

  -[UITextInteraction _textInput](self, "_textInput", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v5, "isSecureTextEntry") & 1) == 0)
  {
    +[_UITextServiceSessionContext selectedTextRangeForTextInput:](_UITextServiceSessionContext, "selectedTextRangeForTextInput:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (sel__share_ == a3 || sel_share_ == a3)
    {
      if (qword_1ECD7A788 != -1)
        dispatch_once(&qword_1ECD7A788, &__block_literal_global_556);
      objc_msgSend(v5, "textInRange:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByTrimmingCharactersInSet:", _MergedGlobals_3_23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v10, "length"))
        goto LABEL_34;
      objc_msgSend(v5, "textInputView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v11, "_canShowTextServiceForType:", 8);
    }
    else
    {
      if (sel__define_ == a3)
      {
        objc_msgSend(v5, "textInputView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v12;
        v13 = 2;
      }
      else
      {
        if (sel__translate_ != a3 && sel_translate_ != a3)
        {
          if (sel__addShortcut_ != a3 && sel_addShortcut_ != a3)
          {
            if (sel__startWritingTools_ == a3)
            {
              objc_msgSend(v5, "textInputView");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = objc_msgSend(v10, "_shouldDisplayWritingToolsCalloutBarItem");
LABEL_35:

              goto LABEL_36;
            }
LABEL_27:
            v6 = 0;
LABEL_36:

            goto LABEL_37;
          }
          +[_UITextServiceSession textServiceSessionForType:](_UITextServiceSession, "textServiceSessionForType:", 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isDisplaying");

          if ((v15 & 1) != 0 || (objc_msgSend(v7, "isEmpty") & 1) != 0)
            goto LABEL_27;
          objc_msgSend(v5, "textInputView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "_canShowTextServiceForType:", 4)
            && TIEnabledInputModesAllowOneToManyShortcuts())
          {
            objc_msgSend(v5, "textInRange:", v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v11, "_containsCJScripts")
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v10, "_inPopover") & 1) != 0)
            {
              v6 = 0;
            }
            else
            {
              +[UIDevice currentDevice](UIDevice, "currentDevice");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "userInterfaceIdiom");

              if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
              {
                objc_msgSend(v10, "window");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "_isTextEffectsWindow");

                v6 = v20 ^ 1;
              }
              else
              {
                v6 = 1;
              }
            }
            goto LABEL_24;
          }
LABEL_34:
          v6 = 0;
          goto LABEL_35;
        }
        objc_msgSend(v5, "textInputView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v12;
        v13 = 32;
      }
      if (!objc_msgSend(v12, "_canShowTextServiceForType:", v13))
        goto LABEL_34;
      objc_msgSend(v5, "textInRange:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v11, "length") != 0;
    }
LABEL_24:

    goto LABEL_35;
  }
  v6 = 0;
LABEL_37:

  return v6;
}

void __57__UITextServicesInteraction_canPerformAction_withSender___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int16 v5;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  v5 = -4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addCharactersInString:", v2);
  v3 = objc_msgSend(v0, "copy");
  v4 = (void *)_MergedGlobals_3_23;
  _MergedGlobals_3_23 = v3;

}

- (void)_removeShareController
{
  -[_UITextServiceSession dismissTextServiceAnimated:](self->_shareSession, "dismissTextServiceAnimated:", 1);
}

- (void)_share:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _UITextServiceSession *v9;
  _UITextServiceSession *shareSession;
  _UITextServiceSession *v11;
  _QWORD v12[5];

  -[UITextInteraction _textInput](self, "_textInput", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[UITextServicesInteraction _removeShareController](self, "_removeShareController");
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 8, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_showServiceForType:withContext:", 8, v7);
  v9 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  shareSession = self->_shareSession;
  self->_shareSession = v9;

  v11 = self->_shareSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__UITextServicesInteraction__share___block_invoke;
  v12[3] = &unk_1E16E5888;
  v12[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v11, "setDismissedHandler:", v12);

}

void __36__UITextServicesInteraction__share___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 128);
  *(_QWORD *)(v1 + 128) = 0;

}

- (void)_removeShortcutController
{
  -[_UITextServiceSession dismissTextServiceAnimated:](self->_learnSession, "dismissTextServiceAnimated:", 1);
}

- (void)_addShortcut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _UITextServiceSession *v11;
  _UITextServiceSession *learnSession;
  _UITextServiceSession *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[UITextInteraction _textInput](self, "_textInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[UITextServicesInteraction _removeShortcutController](self, "_removeShortcutController");
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_showServiceForType:withContext:", 4, v9);
  v11 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  learnSession = self->_learnSession;
  self->_learnSession = v11;

  objc_msgSend(v5, "resignFirstResponder");
  objc_initWeak(&location, self);
  v13 = self->_learnSession;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__UITextServicesInteraction__addShortcut___block_invoke;
  v15[3] = &unk_1E16E58B0;
  objc_copyWeak(&v17, &location);
  v14 = v6;
  v16 = v14;
  -[_UITextServiceSession setDismissedHandler:](v13, "setDismissedHandler:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __42__UITextServicesInteraction__addShortcut___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[15];
    WeakRetained[15] = 0;
    v7 = WeakRetained;

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    WeakRetained = v7;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "activeSelection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearSelection");

      objc_msgSend(*(id *)(a1 + 32), "setNeedsSelectionDisplayUpdate");
      WeakRetained = v7;
    }
  }

}

- (void)_define:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  _UITextServiceSession *v8;
  _UITextServiceSession *lookupSession;
  _UITextServiceSession *v10;
  void *v11;
  _QWORD v12[5];

  -[UITextInteraction _textInput](self, "_textInput", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lookupSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextServicesInteraction.m"), 274, CFSTR("Shouldn't have a lookup session"));

  }
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 16, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showServiceForType:withContext:", 16, v6);
  v8 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  lookupSession = self->_lookupSession;
  self->_lookupSession = v8;

  v10 = self->_lookupSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__UITextServicesInteraction__define___block_invoke;
  v12[3] = &unk_1E16E5888;
  v12[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v10, "setDismissedHandler:", v12);

}

void __37__UITextServicesInteraction__define___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 136);
  *(_QWORD *)(v1 + 136) = 0;

}

- (void)_translate:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  _UITextServiceSession *v8;
  _UITextServiceSession *translateSession;
  _UITextServiceSession *v10;
  void *v11;
  _QWORD v12[5];

  -[UITextInteraction _textInput](self, "_textInput", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_translateSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextServicesInteraction.m"), 286, CFSTR("Shouldn't have a translate session"));

  }
  +[_UITextServiceSessionContext sessionContextForType:withTextInput:](_UITextServiceSessionContext, "sessionContextForType:withTextInput:", 32, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showServiceForType:withContext:", 32, v6);
  v8 = (_UITextServiceSession *)objc_claimAutoreleasedReturnValue();
  translateSession = self->_translateSession;
  self->_translateSession = v8;

  v10 = self->_translateSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__UITextServicesInteraction__translate___block_invoke;
  v12[3] = &unk_1E16E5888;
  v12[4] = self;
  -[_UITextServiceSession setDismissedHandler:](v10, "setDismissedHandler:", v12);

}

void __40__UITextServicesInteraction__translate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 144);
  *(_QWORD *)(v1 + 144) = 0;

}

- (_UITextServicesResponderProxy)responderProxy
{
  return self->_responderProxy;
}

- (void)setResponderProxy:(id)a3
{
  objc_storeStrong((id *)&self->_responderProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderProxy, 0);
  objc_storeStrong((id *)&self->_translateSession, 0);
  objc_storeStrong((id *)&self->_lookupSession, 0);
  objc_storeStrong((id *)&self->_shareSession, 0);
  objc_storeStrong((id *)&self->_learnSession, 0);
  objc_storeStrong((id *)&self->_definitionSession, 0);
}

@end
