@implementation IMActionSheetAction

- (void)dealloc
{
  objc_super v3;

  -[IMActionSheetAction dismissActionSheet](self, "dismissActionSheet");
  v3.receiver = self;
  v3.super_class = (Class)IMActionSheetAction;
  -[IMActionSheetAction dealloc](&v3, "dealloc");
}

- (UIButton)button
{
  UIButton *button;
  id v4;
  UIButton *v5;
  UIButton *v6;
  objc_super v8;

  button = self->_button;
  if (!button)
  {
    v8.receiver = self;
    v8.super_class = (Class)IMActionSheetAction;
    v4 = -[IMAction button](&v8, "button");
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_button;
    self->_button = v5;

    button = self->_button;
  }
  return button;
}

- (void)setButton:(id)a3
{
  UIButton *v5;
  UIButton *button;
  UIBarButtonItem *buttonItem;
  UIButton *v8;
  UIButton *v9;
  UIButton *v10;

  v5 = (UIButton *)a3;
  button = self->_button;
  if (button != v5)
  {
    v10 = v5;
    if (button)
    {
      buttonItem = self->_buttonItem;
      if (buttonItem)
      {
        v8 = (UIButton *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem customView](buttonItem, "customView"));
        v9 = self->_button;

        if (v8 == v9)
          -[IMActionSheetAction setButtonItem:](self, "setButtonItem:", 0);
      }
    }
    objc_storeStrong((id *)&self->_button, a3);
    v5 = v10;
  }

}

- (UIBarButtonItem)buttonItem
{
  UIBarButtonItem *buttonItem;
  id v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  objc_super v8;

  buttonItem = self->_buttonItem;
  if (!buttonItem)
  {
    v8.receiver = self;
    v8.super_class = (Class)IMActionSheetAction;
    v4 = -[IMAction buttonItem](&v8, "buttonItem");
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_buttonItem;
    self->_buttonItem = v5;

    buttonItem = self->_buttonItem;
  }
  return buttonItem;
}

- (void)setAlertController:(id)a3
{
  UIAlertController *v5;
  UIAlertController *alertController;
  UIAlertController *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  UIAlertController *v12;

  v5 = (UIAlertController *)a3;
  alertController = self->_alertController;
  if (alertController != v5)
  {
    v7 = alertController;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](v7, "popoverPresentationController"));
    objc_msgSend(v8, "setDelegate:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController presentingViewController](v7, "presentingViewController"));
    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007B990;
      block[3] = &unk_1004A6200;
      v12 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
    objc_storeStrong((id *)&self->_alertController, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController"));
    objc_msgSend(v10, "setDelegate:", self);

  }
}

- (void)showActionSheetWithActions:(id)a3 fromButton:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  IMActionSheetAction *v30;
  void *v31;
  id obj;
  _QWORD v33[5];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_actions, a3);
  v30 = self;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction titleForAlertController](self, "titleForAlertController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction messageForAlertController](self, "messageForAlertController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v31));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          if (objc_msgSend(v14, "isDestructive"))
            v17 = 2;
          else
            v17 = 0;
          v18 = v9;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10007BD50;
          v33[3] = &unk_1004A7F20;
          v33[4] = v14;
          v34 = v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, v17, v33));

          v9 = v18;
          objc_msgSend(v18, "addAction:", v20);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction attributedMessageForAlertController](v30, "attributedMessageForAlertController"));
  if (v21)
    objc_msgSend(v9, "_setAttributedMessage:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction titleForCancelAction](v30, "titleForCancelAction"));
  v23 = v9;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 1, 0));
  objc_msgSend(v23, "addAction:", v24);

  -[IMPopoverPresentationAction setPresentingButton:](v30, "setPresentingButton:", v8);
  -[IMActionSheetAction setAlertController:](v30, "setAlertController:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](v30, "controller"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delegate"));

  objc_msgSend(v26, "presentViewController:animated:completion:", v23, 1, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "popoverPresentationController"));
  objc_msgSend(v27, "setDelegate:", v30);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "popoverPresentationController"));
  -[IMPopoverPresentationAction prepareForPopoverPresentation:](v30, "prepareForPopoverPresentation:", v28);

}

- (void)dismissActionSheet
{
  -[IMActionSheetAction setAlertController:](self, "setAlertController:", 0);
}

- (void)updateActionSheet
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction alertController](self, "alertController"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentationController"));
    if (objc_msgSend(v6, "presentationStyle") == (id)7)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));

      if (!v7)
      {
        objc_initWeak(&location, self);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10007BF58;
        v9[3] = &unk_1004A7570;
        objc_copyWeak(&v10, &location);
        objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, v9);

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }

}

- (NSString)titleForAlertController
{
  NSString *v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;

  v3 = self->_titleForAlertController;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction titleForAlertControllerBlock](self, "titleForAlertControllerBlock"));

  if (v4)
  {
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IMActionSheetAction titleForAlertControllerBlock](self, "titleForAlertControllerBlock"));
    v6 = ((uint64_t (**)(_QWORD, IMActionSheetAction *))v5)[2](v5, self);
    v7 = objc_claimAutoreleasedReturnValue(v6);

    v3 = (NSString *)v7;
  }
  return v3;
}

- (id)titleForCancelAction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1004C6D40, 0));

  return v3;
}

- (void)setButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItem, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setTitleForAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_titleForAlertController, a3);
}

- (id)titleForAlertControllerBlock
{
  return self->_titleForAlertControllerBlock;
}

- (void)setTitleForAlertControllerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)messageForAlertController
{
  return self->_messageForAlertController;
}

- (void)setMessageForAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_messageForAlertController, a3);
}

- (NSAttributedString)attributedMessageForAlertController
{
  return self->_attributedMessageForAlertController;
}

- (void)setAttributedMessageForAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_attributedMessageForAlertController, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_attributedMessageForAlertController, 0);
  objc_storeStrong((id *)&self->_messageForAlertController, 0);
  objc_storeStrong(&self->_titleForAlertControllerBlock, 0);
  objc_storeStrong((id *)&self->_titleForAlertController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
