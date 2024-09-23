@implementation DMDManagedAssetManager

- (void)promptUserToLoginToiTunesIfNeededTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeAccount"));

  if (!v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationManager sharedManager](DMDUserNotificationManager, "sharedManager"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004DAB0;
    v20[3] = &unk_1000BB3D0;
    v20[4] = self;
    v21 = v12;
    v22 = v13;
    objc_msgSend(v19, "promptUserToLogIntoiTunesWithTitle:message:assertion:completionBlock:", v10, v11, v21, v20);

    v18 = v21;
    goto LABEL_5;
  }
  if (v13)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004DA80;
    block[3] = &unk_1000BB380;
    v25 = v13;
    v24 = v12;
    dispatch_async(v17, block);

    v18 = v25;
LABEL_5:

  }
}

- (void)promptUserForiTunesAccount:(id)a3 accountNameEditable:(BOOL)a4 canCreateNewAccount:(BOOL)a5 assertion:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a7;
  if (v10)
    v12 = objc_msgSend(objc_alloc((Class)SSMutableAuthenticationContext), "initWithAccount:", v10);
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[SSMutableAuthenticationContext contextForSignIn](SSMutableAuthenticationContext, "contextForSignIn"));
  v13 = v12;
  objc_msgSend(v12, "setPromptStyle:", 0);
  objc_msgSend(v13, "setAccountNameEditable:", v9);
  objc_msgSend(v13, "setCanCreateNewAccount:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMDSSAuthenticationRequestDelegate delegateWithAuthenticationContext:](DMDSSAuthenticationRequestDelegate, "delegateWithAuthenticationContext:", v13));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004DCB8;
  v16[3] = &unk_1000BB3F8;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "startWithCompletionBlock:", v16);

}

@end
