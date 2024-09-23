@implementation MFListUnsubscribeSuggestion_iOS

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001666BC;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA170 != -1)
    dispatch_once(&qword_1005AA170, block);
  return (id)qword_1005AA168;
}

- (id)suggestionPrimaryAction
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = objc_msgSend((id)objc_opt_class(self), "suggestionPrimaryActionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001667C4;
  v7[3] = &unk_1005211F8;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SGSuggestionAction actionWithTitle:handler:](SGSuggestionAction, "actionWithTitle:handler:", v4, v7));

  return v5;
}

- (id)suggestionDismissAction
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = objc_msgSend((id)objc_opt_class(self), "suggestionDismissActionTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001668FC;
  v7[3] = &unk_1005211F8;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SGSuggestionAction actionWithTitle:handler:](SGSuggestionAction, "actionWithTitle:handler:", v4, v7));

  return v5;
}

- (id)suggestionCategoryImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", kMFMobileMailBundleIdentifier, 5));

  return v3;
}

- (id)_createConfirmationViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFListUnsubscribeSuggestion_iOS listUnsubscribeCommand](self, "listUnsubscribeCommand"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFListUnsubscribeMessageGenerator_iOS senderForCommand:](MFListUnsubscribeMessageGenerator_iOS, "senderForCommand:", v3));

  v5 = objc_msgSend((id)objc_opt_class(self), "unsubscribeTitleAlertString");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFListUnsubscribeSuggestion_iOS unsubscribeMessageAlertString](self, "unsubscribeMessageAlertString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, 0));

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ALERT_UNSUBSCRIBE_CONFIRM"), &stru_100531B00, CFSTR("Main")));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100166C54;
  v17[3] = &unk_10051E9B0;
  objc_copyWeak(&v18, &location);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v17));

  objc_msgSend(v9, "addAction:", v12);
  objc_msgSend(v9, "addAction:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v9;
}

- (void)unsubscribe
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFListUnsubscribeSuggestion_iOS contentRepresentation](self, "contentRepresentation"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100166D24;
  v5[3] = &unk_10051B140;
  v5[4] = self;
  v4 = objc_msgSend(v3, "performUnsubscribeAction:completion:", 1, v5);

}

- (void)ignore
{
  void *v3;
  id v4;
  objc_super v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFListUnsubscribeSuggestion_iOS contentRepresentation](self, "contentRepresentation"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100166F28;
  v6[3] = &unk_10051B140;
  v6[4] = self;
  v4 = objc_msgSend(v3, "performUnsubscribeAction:completion:", 0, v6);

  v5.receiver = self;
  v5.super_class = (Class)MFListUnsubscribeSuggestion_iOS;
  -[MFListUnsubscribeSuggestion_iOS ignore](&v5, "ignore");
}

- (void)_showErrorAlert:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100167080;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (EMContentRepresentation)contentRepresentation
{
  return self->_contentRepresentation;
}

- (void)setContentRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_contentRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRepresentation, 0);
}

@end
