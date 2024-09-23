@implementation MTEpisodeDownloadsAlertsPresenter

- (void)showGenericAlert:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Download Failed"), &stru_1004C6D40, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Download error."), &stru_1004C6D40, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1004C6D40, 0));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A3AC4;
  v15[3] = &unk_1004A9318;
  v16 = v3;
  v12 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v15));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTAlertController alertControllerWithTitle:message:preferredStyle:](MTAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v9, 1));
  objc_msgSend(v14, "addAction:", v13);
  objc_msgSend(v14, "presentAnimated:completion:", 1, 0);

}

- (void)showOrUpdateNetworkErrorAlert:(id)a3 body:(id)a4 onRetry:(id)a5 onDismiss:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_FAILED_DONE"), &stru_1004C6D40, 0));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000A3CD4;
  v27[3] = &unk_1004A9318;
  v28 = v10;
  v15 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, v27));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_FAILED_RETRY"), &stru_1004C6D40, 0));
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_1000A3CE0;
  v25 = &unk_1004A9318;
  v26 = v9;
  v19 = v9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, &v22));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTAlertController alertControllerWithTitle:message:preferredStyle:](MTAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v11, 1, v22, v23, v24, v25));
  objc_msgSend(v21, "addAction:", v16);
  objc_msgSend(v21, "addAction:", v20);
  objc_msgSend(v21, "presentAnimated:completion:", 1, 0);

}

- (void)showEpisodeFeedDeleted:(id)a3 onDismiss:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUnavailableUtil sharedInstance](MTEpisodeUnavailableUtil, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A3DA0;
  v9[3] = &unk_1004A7948;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "showDialogForReason:podcastTitle:completion:", 3, v6, v9);

}

- (void)showSubscriptionRequired:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUnavailableUtil sharedInstance](MTEpisodeUnavailableUtil, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A3E44;
  v6[3] = &unk_1004A7948;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "showDialogForReason:podcastTitle:completion:", 8, 0, v6);

}

- (void)showEpisodeRestricted:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUnavailableUtil sharedInstance](MTEpisodeUnavailableUtil, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A3EE8;
  v6[3] = &unk_1004A7948;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "showDialogForReason:podcastTitle:completion:", 1, 0, v6);

}

- (void)showNoInternet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A3F84;
  v6[3] = &unk_1004A6378;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "showInternetUnreachableDialogWithAcknowledmentBlock:", v6);

}

@end
