@implementation ICSERootViewController

- (void)dismissWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[ICSERootViewController setDismissing:](self, "setDismissing:", 1);
  -[ICSERootViewController setDismissDuration:](self, "setDismissDuration:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSERootViewController mainViewController](self, "mainViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topTextView"));
  v7 = objc_msgSend(v6, "isFirstResponder");

  if (v7)
  {
    -[ICSERootViewController setDismissCompletionBlock:](self, "setDismissCompletionBlock:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSERootViewController mainViewController](self, "mainViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topTextView"));
    objc_msgSend(v9, "resignFirstResponder");

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000ECA0;
    block[3] = &unk_1000D5F30;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ICSERootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
  }

}

- (void)viewDidLoad
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  ICSERootViewController *v20;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD block[5];
  id v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v38.receiver = self;
  v38.super_class = (Class)ICSERootViewController;
  -[ICSERootViewController viewDidLoad](&v38, "viewDidLoad");
  v3 = dispatch_group_create();
  v4 = objc_alloc_init((Class)NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSERootViewController extensionContext](self, "extensionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inputItems"));

  obj = v6;
  v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(obj);
        v24 = v7;
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachments"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
              v16 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v15);

              if (v16)
              {
                dispatch_group_enter(v3);
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
                v27[0] = _NSConcreteStackBlock;
                v27[1] = 3221225472;
                v27[2] = sub_10000F030;
                v27[3] = &unk_1000D5D88;
                v28 = v4;
                v29 = v3;
                objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v17, 0, v27);

              }
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v11);
        }

        v7 = v24 + 1;
      }
      while ((id)(v24 + 1) != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v23);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F0FC;
  block[3] = &unk_1000D5D38;
  block[4] = v20;
  v26 = v4;
  v18 = v4;
  dispatch_group_notify(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v19, "startAppSession");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v3, "appSessionDidTerminate");

  v4.receiver = self;
  v4.super_class = (Class)ICSERootViewController;
  -[ICSERootViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", kICNASharingExtensionReferralURL));
  objc_msgSend(v5, "startSessionWithReferralURL:referralApplication:", v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)ICSERootViewController;
  -[ICSERootViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v5, "endSessionSynchronously:endReason:", 0, 1);

  v6.receiver = self;
  v6.super_class = (Class)ICSERootViewController;
  -[ICSERootViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
}

- (void)setUpNavigationController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setNavigationBarHidden:", 1);
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationBar"));
    objc_msgSend(v5, "setTintColor:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ic_colorWith256Red:green:blue:unitAlpha:](UIColor, "ic_colorWith256Red:green:blue:unitAlpha:", 255.0, 255.0, 255.0, 1.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationBar"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
  objc_msgSend(v9, "setTransitioningDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v8, "setClipsToBounds:", 1);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  ICSEPresentationController *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[ICSEPresentationController initWithPresentedViewController:presentingViewController:]([ICSEPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  -[ICSERootViewController setIc_presentationController:](self, "setIc_presentationController:", v9);
  -[ICSEPresentationController setRootViewController:](v9, "setRootViewController:", self);
  return v9;
}

- (void)setIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  if (a4)
  {
    LODWORD(v5) = -1097229926;
    LODWORD(v6) = 1045220557;
    LODWORD(v4) = 0;
    LODWORD(v7) = 1.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v4, v5, v6, v7));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000F840;
    v11[3] = &unk_1000D5BE8;
    v11[4] = self;
    v12 = a3;
    +[UIView ic_animateWithDuration:timingFunction:animations:](UIView, "ic_animateWithDuration:timingFunction:animations:", v10, v11, 0.25);

  }
  else
  {
    -[ICSERootViewController setIsShowingSearchResults:](self, "setIsShowingSearchResults:", a3);
  }
}

- (void)setIsShowingSearchResults:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (self->_isShowingSearchResults != a3)
  {
    v3 = a3;
    self->_isShowingSearchResults = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSERootViewController ic_presentationController](self, "ic_presentationController"));
    objc_msgSend(v5, "setIsShowingSearchResults:", v3);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSERootViewController containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "setIsShowingTableContainer:", v3);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSERootViewController ic_presentationController](self, "ic_presentationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerView"));
    objc_msgSend(v8, "setNeedsLayout");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000F934;
    v9[3] = &unk_1000D5D10;
    v9[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.0);
  }
}

- (BOOL)shouldImportNotesWithURLs:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v15;
  id v16;

  v3 = a3;
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v16 = 0;
    v15 = 0;
    v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v16, NSURLTypeIdentifierKey, &v15);
    v6 = v16;
    v7 = v15;
    if ((v5 & 1) == 0)
    {
      v8 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10009E4D4(v7, (uint64_t)v4, v8);

    }
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UTType importedTypeWithIdentifier:](UTType, "importedTypeWithIdentifier:", CFSTR("com.evernote.enex")));
      if ((objc_msgSend(v9, "conformsToType:", v10) & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v6));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICArchive universalTypeIdentifier](ICArchive, "universalTypeIdentifier"));
        v11 = objc_msgSend(v12, "conformsToType:", v13);

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ICSEMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)setMainViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mainViewController, a3);
}

- (ICSETableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (ICSEContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (ICImportSERootViewController)importRootViewController
{
  return self->_importRootViewController;
}

- (void)setImportRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_importRootViewController, a3);
}

- (ICSEPresentationController)ic_presentationController
{
  return self->_ic_presentationController;
}

- (void)setIc_presentationController:(id)a3
{
  objc_storeStrong((id *)&self->_ic_presentationController, a3);
}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (id)dismissCompletionBlock
{
  return self->_dismissCompletionBlock;
}

- (void)setDismissCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)dismissDuration
{
  return self->_dismissDuration;
}

- (void)setDismissDuration:(double)a3
{
  self->_dismissDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionBlock, 0);
  objc_storeStrong((id *)&self->_ic_presentationController, 0);
  objc_storeStrong((id *)&self->_importRootViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_mainViewController, 0);
}

@end
