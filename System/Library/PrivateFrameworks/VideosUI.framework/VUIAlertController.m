@implementation VUIAlertController

- (void)vui_addAction:(id)a3 isPreferred:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v4 = a4;
  v6 = a3;
  if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
  {
    -[VUIAlertController alertActions](self, "alertActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAlertController setAlertActions:](self, "setAlertActions:", v8);

    }
    -[VUIAlertController alertActions](self, "alertActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

  }
  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v6, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "style");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__VUIAlertController_vui_addAction_isPreferred___block_invoke;
  v15[3] = &unk_1E9FA37B0;
  v16 = v6;
  v13 = v6;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, v12, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIAlertController addAction:](self, "addAction:", v14);
  if (v4)
    -[VUIAlertController setPreferredAction:](self, "setPreferredAction:", v14);

}

void __48__VUIAlertController_vui_addAction_isPreferred___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)vui_addAction:(id)a3
{
  -[VUIAlertController vui_addAction:isPreferred:](self, "vui_addAction:isPreferred:", a3, 0);
}

- (void)vui_presentAlertFromPresentingController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (_os_feature_enabled_impl())
  {
    -[VUIAlertController _attributedTitle](self, "_attributedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[VUIAlertController title](self, "title");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    -[VUIAlertController _attributedMessage](self, "_attributedMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[VUIAlertController message](self, "message");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v18, "vui_requiresLegacyPresentation"))
    {
      objc_msgSend(v18, "presentViewController:animated:completion:", self, 1, 0);
    }
    else
    {
      -[VUIAlertController alertActions](self, "alertActions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v18, "presentAlertWithTitle:message:actions:animated:", v10, v15, v17, 1);

    }
  }
  else
  {
    objc_msgSend(v18, "presentViewController:animated:completion:", self, 1, 0);
  }

}

- (void)vui_dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controllerPresenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, v8);

  }
  else
  {
    -[VUIAlertController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v8);
  }

}

- (BOOL)overridesOrientationLock
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return +[VUIUtilities isRemoteApp](VUIUtilities, "isRemoteApp");
}

- (NSMutableArray)alertActions
{
  return self->_alertActions;
}

- (void)setAlertActions:(id)a3
{
  objc_storeStrong((id *)&self->_alertActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertActions, 0);
}

@end
