@implementation UIDocumentAlertPresenter

- (UIDocumentAlertPresenter)initWithError:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  UIDocumentAlertPresenter *v9;
  uint64_t v10;
  id completionHandler;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIDocumentAlertPresenter;
  v9 = -[UIDocumentAlertPresenter init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    completionHandler = v9->_completionHandler;
    v9->_completionHandler = (id)v10;

    objc_storeStrong((id *)&v9->_error, a3);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[UIAlertView setDelegate:](self->_alert, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentAlertPresenter;
  -[UIDocumentAlertPresenter dealloc](&v3, sel_dealloc);
}

+ (id)_presentAlertWithError:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  UIDocumentAlertPresenter *v7;
  UIAlertView *v8;
  void *v9;
  void *v10;
  UIAlertView *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[UIDocumentAlertPresenter initWithError:completionHandler:]([UIDocumentAlertPresenter alloc], "initWithError:completionHandler:", v5, v6);
  v8 = [UIAlertView alloc];
  objc_msgSend(v5, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedRecoverySuggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIAlertView initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:](v8, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", v9, v10, v7, 0, 0);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "localizedRecoveryOptions", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[UIAlertView addButtonWithTitle:](v11, "addButtonWithTitle:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  -[UIAlertView show](v11, "show");
  return v7;
}

- (void)_forceFinishNow
{
  -[UIAlertView dismissWithClickedButtonIndex:animated:](self->_alert, "dismissWithClickedButtonIndex:animated:", -[UIAlertView cancelButtonIndex](self->_alert, "cancelButtonIndex"), 0);
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void (**completionHandler)(id, uint64_t);

  if (objc_msgSend(a3, "cancelButtonIndex") == a4)
  {
    v6 = 0;
  }
  else
  {
    -[NSError recoveryAttempter](self->_error, "recoveryAttempter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "attemptRecoveryFromError:optionIndex:", self->_error, a4);

  }
  completionHandler = (void (**)(id, uint64_t))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, v6);
}

- (void)alertViewCancel:(id)a3
{
  void (**completionHandler)(id, _QWORD);

  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
