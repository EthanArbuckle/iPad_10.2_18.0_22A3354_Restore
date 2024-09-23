@implementation MailHandoffAlertControllerFactory

+ (id)mailAlertControllerForHandoffError:(id)a3 acknowledgmentObserver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSBundle *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSBundle *v14;
  NSBundle *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSBundle *v22;
  void *v23;
  uint64_t v24;
  NSBundle *v25;
  NSBundle *v26;
  _QWORD *v27;
  NSBundle *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  id v35;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mf_mailHandoffActivityType"));
  if (!v7)
  {
    v13 = 0;
    goto LABEL_25;
  }
  v8 = v5;
  v9 = objc_msgSend(v8, "mf_activitySource");
  if (v9 == (id)2)
  {
    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailHandoffAlertControllerFactory));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SIRI_SHORTCUT_FAILED_ERROR_TITLE"), &stru_100531B00, CFSTR("Main")));
  }
  else if (v9 == (id)3)
  {
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailHandoffAlertControllerFactory));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SELECTED_MESSAGE_NOT_FOUND_ERROR_TITLE"), &stru_100531B00, CFSTR("Main")));
  }
  else
  {
    v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailHandoffAlertControllerFactory));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HANDOFF_FAILED_ERROR_TITLE"), &stru_100531B00, CFSTR("Main")));
  }
  v16 = (void *)v12;

  v17 = v8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "domain"));
  if (objc_msgSend(v18, "isEqualToString:", MFHandoffErrorDomain))
  {

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));

    if (v19)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
      goto LABEL_21;
    }
  }
  v20 = objc_msgSend(v17, "mf_activityErrorReason");
  if (v20 == (id)1)
    goto LABEL_17;
  if (!v20)
  {
    v21 = objc_msgSend(v17, "mf_activitySource");
    if (v21 != (id)3)
    {
      if (v21 == (id)2)
      {
        v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailHandoffAlertControllerFactory));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SIRI_SHORTCUT_FAILED_ERROR_BODY"), &stru_100531B00, CFSTR("Main")));
      }
      else
      {
        v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailHandoffAlertControllerFactory));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("HANDOFF_FAILED_ERROR_BODY"), &stru_100531B00, CFSTR("Main")));
      }
      goto LABEL_20;
    }
LABEL_17:
    v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailHandoffAlertControllerFactory));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SELECTED_MESSAGE_NOT_FOUND_ERROR_BODY"), &stru_100531B00, CFSTR("Main")));
LABEL_20:
    v18 = (void *)v24;

  }
LABEL_21:

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1));
  if (v6)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000E5C5C;
    v33[3] = &unk_10051E4B0;
    v34 = v6;
    v35 = v17;
    v27 = objc_retainBlock(v33);

  }
  else
  {
    v27 = 0;
  }
  v28 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailHandoffAlertControllerFactory));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100531B00, CFSTR("Main")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v30, 0, v27));

  objc_msgSend(v13, "addAction:", v31);
LABEL_25:

  return v13;
}

@end
