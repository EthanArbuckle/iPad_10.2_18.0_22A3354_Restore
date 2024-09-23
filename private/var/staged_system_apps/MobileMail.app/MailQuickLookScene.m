@implementation MailQuickLookScene

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F23FC;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9DA8 != -1)
    dispatch_once(&qword_1005A9DA8, block);
  return (OS_os_log *)(id)qword_1005A9DA0;
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  objc_super v47;
  id v48;

  v47.receiver = self;
  v47.super_class = (Class)MailQuickLookScene;
  v46 = a3;
  -[MailScene mailSceneDidConnectWithOptions:](&v47, "mailSceneDidConnectWithOptions:");
  v4 = objc_claimAutoreleasedReturnValue(-[MailQuickLookScene session](self, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stateRestorationActivity](v4, "stateRestorationActivity"));
  if (v5)
  {
LABEL_2:

    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "userActivities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));

  if (!v5)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MailQuickLookScene log](MailQuickLookScene, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10039299C(v4, v39, v40, v41, v42, v43, v44, v45);
    v5 = 0;
    goto LABEL_2;
  }
LABEL_4:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailQLAttachmentContext contextWithUserActivity:](MFMailQLAttachmentContext, "contextWithUserActivity:", v5));
  if (v7)
  {
    v8 = objc_alloc((Class)QLItem);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachmentURL"));
    v10 = objc_msgSend(v8, "initWithURL:", v9);

    if (!v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[MailQuickLookScene log](MailQuickLookScene, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10039296C(v11, v12, v13, v14, v15, v16, v17, v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachmentURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
    -[MailQuickLookScene setTitle:](self, "setTitle:", v20);

    if (v10)
    {
      v48 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
      goto LABEL_15;
    }
  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(+[MailQuickLookScene log](MailQuickLookScene, "log"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10039293C(v22, v23, v24, v25, v26, v27, v28, v29);

  }
  v10 = 0;
  v21 = &__NSArray0__struct;
LABEL_15:
  v30 = objc_msgSend(objc_alloc((Class)QLPreviewController), "initWithPreviewItems:", v21);
  objc_msgSend(v30, "setIsContentManaged:", objc_msgSend(v7, "isContentManaged"));
  if (objc_msgSend(v7, "editBehavior") == (id)2)
    objc_msgSend(v30, "setAppearanceActions:", 4);
  objc_msgSend(v30, "setDelegate:", self);
  v31 = objc_alloc_init((Class)UIViewController);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  objc_msgSend(v33, "setBackgroundColor:", v32);

  -[MailQuickLookScene setContext:](self, "setContext:", v7);
  -[MailScene setMf_rootViewController:](self, "setMf_rootViewController:", v31);
  -[MailQuickLookScene setPreviewController:](self, "setPreviewController:", v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachmentURL"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "absoluteString"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self ENDSWITH %@"), v35));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene activationConditions](self, "activationConditions"));
  objc_msgSend(v37, "setCanActivateForTargetContentIdentifierPredicate:", v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene activationConditions](self, "activationConditions"));
  objc_msgSend(v38, "setPrefersToActivateForTargetContentIdentifierPredicate:", v36);

}

- (void)mailSceneWillEnterForeground
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailQuickLookScene;
  -[MailScene mailSceneWillEnterForeground](&v9, "mailSceneWillEnterForeground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene mf_rootViewController](self, "mf_rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  v5 = objc_claimAutoreleasedReturnValue(+[MailQuickLookScene log](MailQuickLookScene, "log"));
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preview controller already presented", v8, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Present preview controller", v8, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(-[MailScene mf_rootViewController](self, "mf_rootViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene previewController](self, "previewController"));
    -[NSObject presentViewController:animated:completion:](v5, "presentViewController:animated:completion:", v7, 0, 0);

  }
}

- (id)stateRestorationActivityForMailScene
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userActivity"));

  return v3;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene context](self, "context", a3, a4));
  v5 = 2 * (objc_msgSend(v4, "editBehavior") != 0);

  return v5;
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  -[MailQuickLookScene setModifiedContentsURL:](self, "setModifiedContentsURL:", a5, a4);
}

- (id)dismissActionsForPreviewController:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location[2];

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene context](self, "context"));
  v6 = objc_msgSend(v5, "shouldShowReplyAll");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "senderDisplayName"));

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REPLY_TO_SENDER"), &stru_100531B00, CFSTR("Main")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphReply));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000F2FB8;
    v27[3] = &unk_10051E8D0;
    objc_copyWeak(&v28, location);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[QLDismissAction actionWithTitle:image:handler:](QLDismissAction, "actionWithTitle:image:handler:", v11, v12, v27));

    -[NSMutableArray addObject:](v4, "addObject:", v13);
    objc_destroyWeak(&v28);
  }
  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("REPLY_ALL"), &stru_100531B00, CFSTR("Main")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphReplyAll));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000F3008;
    v25[3] = &unk_10051E8D0;
    objc_copyWeak(&v26, location);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[QLDismissAction actionWithTitle:image:handler:](QLDismissAction, "actionWithTitle:image:handler:", v15, v16, v25));

    -[NSMutableArray addObject:](v4, "addObject:", v17);
    objc_destroyWeak(&v26);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TITLE_NEW_MESSAGE"), &stru_100531B00, CFSTR("Main")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphCompose));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000F3058;
  v23[3] = &unk_10051E8D0;
  objc_copyWeak(&v24, location);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[QLDismissAction actionWithTitle:image:handler:](QLDismissAction, "actionWithTitle:image:handler:", v19, v20, v23));

  -[NSMutableArray addObject:](v4, "addObject:", v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(location);

  return v4;
}

- (void)previewControllerWillDismiss:(id)a3
{
  -[MailScene closeSceneWithAnimation:errorHandler:](self, "closeSceneWithAnimation:errorHandler:", 1, &stru_10051E8F0);
}

- (void)_switchToComposeSceneAsReply:(BOOL)a3 composeType:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailQuickLookScene modifiedContentsURL](self, "modifiedContentsURL"));
  -[MailScene _switchToComposeSceneWithContext:modifiedContentsURL:isReply:composeType:](self, "_switchToComposeSceneWithContext:modifiedContentsURL:isReply:composeType:", v8, v7, v5, a4);

}

- (QLPreviewController)previewController
{
  return self->_previewController;
}

- (void)setPreviewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewController, a3);
}

- (MFMailQLAttachmentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSURL)modifiedContentsURL
{
  return self->_modifiedContentsURL;
}

- (void)setModifiedContentsURL:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedContentsURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedContentsURL, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
}

@end
