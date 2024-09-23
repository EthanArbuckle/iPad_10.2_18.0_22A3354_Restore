@implementation FMAddFriendsUtilities

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FF3C;
  block[3] = &unk_10053F200;
  block[4] = a1;
  if (qword_1005E5DD8 != -1)
    dispatch_once(&qword_1005E5DD8, block);
  return (id)qword_1005E5DD0;
}

- (id)showOfferAlertInViewController:(id)a3 withTitle:(id)a4 message:(id)a5 popoverAnchoredAtView:(id)a6 orAnchoredOnBarButtonItem:(id)a7 withCompletion:(id)a8 cancelHandler:(id)a9 showAlert:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = sub_10005FE60(CFSTR("DONT_SHARE_BUTTON_TITLE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  LOBYTE(v28) = a10;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMAddFriendsUtilities showOfferAlertStyleInViewController:withTitle:message:popoverAnchoredAtView:orAnchoredOnBarButtonItem:withCompletion:cancelButtonTitle:cancelHandler:withStyle:showAlert:](self, "showOfferAlertStyleInViewController:withTitle:message:popoverAnchoredAtView:orAnchoredOnBarButtonItem:withCompletion:cancelButtonTitle:cancelHandler:withStyle:showAlert:", v23, v22, v21, v20, v19, v18, v25, v17, 1, v28));

  return v26;
}

- (id)showOfferActionSheetInViewController:(id)a3 popoverAnchoredAtView:(id)a4 orAnchoredOnBarButtonItem:(id)a5 fromEmail:(id)a6 withCompletion:(id)a7 cancelHandler:(id)a8 showAlert:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = sub_10005FE60(CFSTR("SHARING_FROM"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v17));

  v24 = sub_10005FE60(CFSTR("CANCEL_BUTTON_TITLE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  LOBYTE(v28) = a9;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMAddFriendsUtilities showOfferAlertStyleInViewController:withTitle:message:popoverAnchoredAtView:orAnchoredOnBarButtonItem:withCompletion:cancelButtonTitle:cancelHandler:withStyle:showAlert:](self, "showOfferAlertStyleInViewController:withTitle:message:popoverAnchoredAtView:orAnchoredOnBarButtonItem:withCompletion:cancelButtonTitle:cancelHandler:withStyle:showAlert:", v20, 0, v23, v19, v18, v16, v25, v15, 0, v28));

  return v26;
}

- (id)showOfferAlertStyleInViewController:(id)a3 withTitle:(id)a4 message:(id)a5 popoverAnchoredAtView:(id)a6 orAnchoredOnBarButtonItem:(id)a7 withCompletion:(id)a8 cancelButtonTitle:(id)a9 cancelHandler:(id)a10 withStyle:(int64_t)a11 showAlert:(BOOL)a12
{
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v39;
  id v40;
  unint64_t v41;
  id v42;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v44 = a3;
  v41 = (unint64_t)a6;
  v39 = (unint64_t)a7;
  v17 = a8;
  v18 = a10;
  v40 = a9;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a4, a5, a11));
  v20 = sub_10005FE60(CFSTR("SHARE_ONE_HOUR_BUTTON_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100060508;
  v51[3] = &unk_10053F228;
  v22 = v17;
  v52 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, v51));

  v24 = sub_10005FE60(CFSTR("SHARE_EOD_BUTTON_TITLE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100060520;
  v49[3] = &unk_10053F228;
  v26 = v22;
  v50 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 0, v49));

  v28 = sub_10005FE60(CFSTR("SHARE_FOREVER_BUTTON_TITLE"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100060538;
  v47[3] = &unk_10053F228;
  v42 = v26;
  v48 = v42;
  v30 = objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v29, 0, v47));

  v31 = (void *)v30;
  v32 = (void *)v39;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100060550;
  v45[3] = &unk_10053F228;
  v46 = v18;
  v33 = v18;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v40, 1, v45));

  objc_msgSend(v19, "addAction:", v23);
  objc_msgSend(v19, "addAction:", v27);
  objc_msgSend(v19, "addAction:", v31);
  objc_msgSend(v19, "addAction:", v34);
  if (!(v41 | v39))
  {
    -[FMAddFriendsUtilities setShareActionsheet:](self, "setShareActionsheet:", 0);
    goto LABEL_9;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "popoverPresentationController"));
  v36 = v35;
  if (v39)
  {
    objc_msgSend(v35, "setBarButtonItem:", v39);
    v37 = 1;
LABEL_7:
    objc_msgSend(v36, "setPermittedArrowDirections:", v37, v39);
    goto LABEL_8;
  }
  if (v41)
  {
    objc_msgSend(v35, "setSourceView:", v41);
    objc_msgSend((id)v41, "bounds");
    objc_msgSend(v36, "setSourceRect:");
    v37 = 15;
    goto LABEL_7;
  }
LABEL_8:
  -[FMAddFriendsUtilities setShareActionsheet:](self, "setShareActionsheet:", v19, v39);

LABEL_9:
  if (a12)
    objc_msgSend(v44, "presentViewController:animated:completion:", v19, 1, 0);

  return v19;
}

- (id)showStopOfferActionSheetInViewController:(id)a3 popoverAnchoredAtView:(id)a4 orAnchoredOnBarButtonItem:(id)a5 completion:(id)a6
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v14 = sub_10005FE60(CFSTR("CANCEL_BUTTON_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, 0));
  objc_msgSend(v13, "addAction:", v16);

  v17 = sub_10005FE60(CFSTR("STOP_SHARE_LOCATION_BUTTON_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006074C;
  v24[3] = &unk_10053F228;
  v25 = v12;
  v19 = v12;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 2, v24));
  objc_msgSend(v13, "addAction:", v20);

  if (v10 | v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "popoverPresentationController"));
    v22 = v21;
    if (v11)
    {
      objc_msgSend(v21, "setBarButtonItem:", v11);
      objc_msgSend(v22, "setPermittedArrowDirections:", 1);
    }
    else if (v10)
    {
      objc_msgSend(v21, "setSourceView:", v10);
      objc_msgSend((id)v10, "bounds");
      objc_msgSend(v22, "setSourceRect:");
    }
    objc_msgSend(v22, "setPermittedArrowDirections:", 2);

  }
  objc_msgSend(v9, "presentViewController:animated:completion:", v13, 1, 0);

  return v13;
}

- (void)dismissShareActionSheet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMAddFriendsUtilities shareActionsheet](self, "shareActionsheet"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

}

+ (id)alertPresenterViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  if (v5)
  {
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
      v4 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v4;
  }
  return v6;
}

+ (void)showOfferToSelfErrorInViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = sub_10005FE60(CFSTR("OFFER_TO_SELF_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10005FE60(CFSTR("OFFER_TO_SELF_MESSAGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1));

  v12 = sub_10005FE60(CFSTR("OK_BUTTON_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, 0));
  objc_msgSend(v11, "addAction:", v14);

  if (v16)
  {
    objc_msgSend(v16, "presentViewController:animated:completion:", v11, 1, v6);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertPresenterViewController"));
    objc_msgSend(v15, "presentViewController:animated:completion:", v11, 1, v6);

  }
}

+ (void)showOfferToSelfError
{
  _objc_msgSend(a1, "showOfferToSelfErrorInViewController:completion:", 0, 0);
}

+ (void)showNotifySelfError
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = sub_10005FE60(CFSTR("NOTIFY_SELF_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_10005FE60(CFSTR("NOTIFY_SELF_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  v7 = sub_10005FE60(CFSTR("OK_BUTTON_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, 0));
  objc_msgSend(v11, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertPresenterViewController"));
  objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, 0);

}

+ (void)showGenericErrorAlert
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = sub_10005FE60(CFSTR("GENERIC_ERROR_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_10005FE60(CFSTR("GENERIC_ERROR_ALERT_TEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  v7 = sub_10005FE60(CFSTR("OK_BUTTON_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, 0));
  objc_msgSend(v11, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertPresenterViewController"));
  objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, 0);

}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = sub_10005FE60(CFSTR("OK_BUTTON_TITLE"));
  v10 = (id)objc_claimAutoreleasedReturnValue(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertPresenterViewController"));
  objc_msgSend(a1, "showSimpleAlertWithTitle:message:okButtonTitle:sender:", v7, v6, v10, v9);

}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = sub_10005FE60(CFSTR("OK_BUTTON_TITLE"));
  v13 = (id)objc_claimAutoreleasedReturnValue(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertPresenterViewController"));
  objc_msgSend(a1, "showSimpleAlertWithTitle:message:okButtonTitle:sender:handler:", v10, v9, v13, v12, v8);

}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertPresenterViewController"));
  objc_msgSend(a1, "showSimpleAlertWithTitle:message:okButtonTitle:sender:", v10, v9, v8, v11);

}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = sub_10005FE60(CFSTR("OK_BUTTON_TITLE"));
  v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(a1, "showSimpleAlertWithTitle:message:okButtonTitle:sender:", v10, v9, v12, v8);

}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 sender:(id)a6
{
  objc_msgSend(a1, "showSimpleAlertWithTitle:message:okButtonTitle:sender:handler:", a3, a4, a5, a6, 0);
}

+ (void)showSimpleAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 sender:(id)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v14)
  {
    if (objc_msgSend(v14, "isBeingDismissed"))
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentingViewController"));

      v14 = (id)v16;
    }
    if (objc_msgSend(v11, "length") || objc_msgSend(v12, "length"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "preferredContentSizeCategory"));
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

      if (IsAccessibilityCategory)
      {
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" ")));

        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" ")));
        v12 = (id)v21;
        v11 = (id)v20;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100060F9C;
      v24[3] = &unk_10053F228;
      v25 = v15;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v24));
      objc_msgSend(v22, "addAction:", v23);

      objc_msgSend(v14, "presentViewController:animated:completion:", v22, 1, 0);
    }
  }

}

+ (void)showOfferSuccessForHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "count");
  v5 = v14;
  if (v4)
  {
    if (objc_msgSend(v14, "count") == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMContactsUtilities contactFor:](_TtC6FindMy19FMContactsUtilities, "contactFor:", v6));
      if (!v7
        || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMCoreBridge displayNameFor:](_TtC6FindMy12FMCoreBridge, "displayNameFor:", v7))) == 0)
      {
        if (+[FMPhoneNumberUtil isEmailValidWithEmail:](_TtC6FindMy17FMPhoneNumberUtil, "isEmailValidWithEmail:", v6)|| !+[FMPhoneNumberUtil isPhoneNumberValidWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "isPhoneNumberValidWithPhoneNumber:", v6))
        {
          v9 = v6;
        }
        else
        {
          v9 = (id)objc_claimAutoreleasedReturnValue(+[FMPhoneNumberUtil formatWithPhoneNumber:](_TtC6FindMy17FMPhoneNumberUtil, "formatWithPhoneNumber:", v6));
        }
        v8 = v9;
      }
      v12 = sub_10005FE60(CFSTR("OFFER_SUCCESS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8));

    }
    else
    {
      v10 = sub_10005FE60(CFSTR("OFFER_SUCCESS_MULTIPLE_FRIENDS"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v7, 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));
    }

    objc_msgSend(a1, "showSimpleAlertWithTitle:message:", v11, 0);
    v5 = v14;
  }

}

- (UIAlertController)shareActionsheet
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_shareActionsheet);
}

- (void)setShareActionsheet:(id)a3
{
  objc_storeWeak((id *)&self->_shareActionsheet, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shareActionsheet);
}

@end
