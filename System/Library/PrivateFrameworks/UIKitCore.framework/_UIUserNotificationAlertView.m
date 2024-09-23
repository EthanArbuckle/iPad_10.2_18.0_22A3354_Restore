@implementation _UIUserNotificationAlertView

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_MergedGlobals_1_25;
    _MergedGlobals_1_25 = v2;

  }
}

- (void)show
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(void *, void *);
  CFOptionFlags v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFUserNotification *v33;
  __CFUserNotification *userNotification;
  __CFRunLoop *Main;
  void *v36;
  void *v37;
  id obj;
  _QWORD aBlock[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  SInt32 error[2];
  SInt32 *v47;
  uint64_t v48;
  uint64_t v49;

  if (!self->_userNotification)
  {
    -[UIAlertView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "willPresentAlertView:", self);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertView title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIAlertView title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x1E0C9B800]);

    }
    -[UIAlertView message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIAlertView message](self, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, *MEMORY[0x1E0C9B810]);

    }
    -[UIAlertView buttonTitleAtIndex:](self, "buttonTitleAtIndex:", -[UIAlertView numberOfButtons](self, "numberOfButtons") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, *MEMORY[0x1E0C9B838]);

    if (-[UIAlertView numberOfButtons](self, "numberOfButtons") >= 2)
    {
      -[UIAlertView buttonTitleAtIndex:](self, "buttonTitleAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, *MEMORY[0x1E0C9B830]);

      if (-[UIAlertView numberOfButtons](self, "numberOfButtons") == 3)
      {
        -[UIAlertView buttonTitleAtIndex:](self, "buttonTitleAtIndex:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, *MEMORY[0x1E0C9B868]);

      }
    }
    *(_QWORD *)error = 0;
    v47 = error;
    v48 = 0x2020000000;
    v12 = (_QWORD *)qword_1ECD79F78;
    v49 = qword_1ECD79F78;
    if (!qword_1ECD79F78)
    {
      v13 = SpringBoardServicesLibrary_2();
      v12 = dlsym(v13, "SBUserNotificationAllowMenuButtonDismissal");
      *((_QWORD *)v47 + 3) = v12;
      qword_1ECD79F78 = (uint64_t)v12;
    }
    _Block_object_dispose(error, 8);
    if (v12)
    {
      v14 = *MEMORY[0x1E0C9AE50];
      objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *v12);
      *(_QWORD *)error = 0;
      v47 = error;
      v48 = 0x2020000000;
      v15 = (_QWORD *)qword_1ECD79F80;
      v49 = qword_1ECD79F80;
      if (!qword_1ECD79F80)
      {
        v16 = SpringBoardServicesLibrary_2();
        v15 = dlsym(v16, "SBUserNotificationDismissOnLock");
        *((_QWORD *)v47 + 3) = v15;
        qword_1ECD79F80 = (uint64_t)v15;
      }
      _Block_object_dispose(error, 8);
      if (v15)
      {
        obj = v3;
        objc_msgSend(v4, "setObject:forKey:", v14, *v15);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __36___UIUserNotificationAlertView_show__block_invoke;
        aBlock[3] = &unk_1E16E8D08;
        v22 = v17;
        v40 = v22;
        v23 = v18;
        v41 = v23;
        v24 = v19;
        v42 = v24;
        v25 = v20;
        v43 = v25;
        v26 = v21;
        v44 = v26;
        v27 = v4;
        v45 = v27;
        v28 = (void (**)(void *, void *))_Block_copy(aBlock);
        v29 = 3;
        switch(-[UIAlertView alertViewStyle](self, "alertViewStyle"))
        {
          case UIAlertViewStyleDefault:
            goto LABEL_22;
          case UIAlertViewStyleSecureTextInput:
            v29 = 65539;
            goto LABEL_19;
          case UIAlertViewStylePlainTextInput:
LABEL_19:
            v30 = 0;
            goto LABEL_21;
          case UIAlertViewStyleLoginAndPasswordInput:
            -[_UIUserNotificationAlertView textFieldAtIndex:](self, "textFieldAtIndex:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v28[2](v28, v31);

            v29 = 131075;
            v30 = 1;
LABEL_21:
            -[_UIUserNotificationAlertView textFieldAtIndex:](self, "textFieldAtIndex:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v28[2](v28, v32);

LABEL_22:
            error[0] = 0;
            v33 = CFUserNotificationCreate(0, 0.0, v29, error, (CFDictionaryRef)v27);
            self->_userNotification = v33;
            if (error[0] || (userNotification = v33) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to create CFUserNotification: %ld (you may need to add permission to send to com.apple.SBUserNotification)"), error[0]);
              userNotification = self->_userNotification;
            }
            objc_msgSend((id)_MergedGlobals_1_25, "setObject:forKey:", self, userNotification);
            objc_storeStrong(&self->_retainedSelf, self);
            objc_storeStrong(&self->_strongDelegate, obj);
            self->_userNotificationRunLoopSource = CFUserNotificationCreateRunLoopSource(0, self->_userNotification, (CFUserNotificationCallBack)__userNotificationCallback_0, 0);
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(obj, "didPresentAlertView:", self);

            return;
          default:
            goto LABEL_32;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationDismissOnLock(void)");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("UIAlertView_ViewServiceSupport.m"), 29, CFSTR("%s"), dlerror());
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationAllowMenuButtonDismissal(void)");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("UIAlertView_ViewServiceSupport.m"), 28, CFSTR("%s"), dlerror());
    }

    __break(1u);
LABEL_32:
    abort();
  }
}

- (BOOL)isVisible
{
  return self->_userNotification != 0;
}

- (id)textFieldAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIUserNotificationAlertView;
  -[UIAlertView textFieldAtIndex:](&v6, sel_textFieldAtIndex_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIUserNotificationAlertViewRestrictedTextField restrictedProxyForTextField:](_UIUserNotificationAlertViewRestrictedTextField, "restrictedProxyForTextField:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)addButtonWithTitle:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  if (-[UIAlertView numberOfButtons](self, "numberOfButtons") == 3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("UIAlertViews displayed from view services may have at most three buttons"));
  v7.receiver = self;
  v7.super_class = (Class)_UIUserNotificationAlertView;
  v5 = -[UIAlertView addButtonWithTitle:](&v7, sel_addButtonWithTitle_, v4);

  return (int64_t)v5;
}

- (void)setHostedWindow:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UIUserNotificationAlertView _removeObservervations](self, "_removeObservervations");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_cancelAlertView, 0x1E1784A20, v5);

  }
}

- (void)setRemoteViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UIUserNotificationAlertView _removeObservervations](self, "_removeObservervations");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_cancelAlertView, CFSTR("_UIViewServiceRemoteViewControllerWillDisconnectNotification"), v5);

  }
}

- (void)cancelAlertView
{
  id v3;

  -[UIAlertView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "alertViewCancel:", self);
    -[_UIUserNotificationAlertView _cancelUserNotification](self, "_cancelUserNotification");
  }
  else
  {
    -[_UIUserNotificationAlertView dismissWithClickedButtonIndex:animated:](self, "dismissWithClickedButtonIndex:animated:", -[UIAlertView cancelButtonIndex](self, "cancelButtonIndex"), 0);
  }

}

- (void)_cancelUserNotification
{
  __CFUserNotification *userNotification;
  __CFRunLoop *Main;
  id v5;
  id v6;
  id retainedSelf;
  id strongDelegate;

  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    objc_msgSend((id)_MergedGlobals_1_25, "removeObjectForKey:", self->_userNotification);
    CFRelease(self->_userNotification);
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_userNotificationRunLoopSource);
    self->_userNotification = 0;
    v5 = objc_retainAutorelease(self->_retainedSelf);
    v6 = objc_retainAutorelease(self->_strongDelegate);
    retainedSelf = self->_retainedSelf;
    self->_retainedSelf = 0;

    strongDelegate = self->_strongDelegate;
    self->_strongDelegate = 0;

  }
}

- (void)_removeObservervations
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1784A20, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIViewServiceRemoteViewControllerWillDisconnectNotification"), 0);

}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  id v6;

  -[UIAlertView delegate](self, "delegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "alertView:willDismissWithButtonIndex:", self, a3);
  -[_UIUserNotificationAlertView _cancelUserNotification](self, "_cancelUserNotification");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "alertView:didDismissWithButtonIndex:", self, a3);

}

- (void)dealloc
{
  objc_super v3;

  -[_UIUserNotificationAlertView _removeObservervations](self, "_removeObservervations");
  if (self->_userNotification)
    -[_UIUserNotificationAlertView cancelAlertView](self, "cancelAlertView");
  v3.receiver = self;
  v3.super_class = (Class)_UIUserNotificationAlertView;
  -[UIAlertView dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retainedSelf, 0);
  objc_storeStrong(&self->_strongDelegate, 0);
}

@end
