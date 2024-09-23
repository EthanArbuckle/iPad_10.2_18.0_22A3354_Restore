@implementation MFAttachmentShowcase

- (void)dealloc
{
  objc_super v3;

  -[MFAttachmentShowcase finishedPresenting](self, "finishedPresenting");
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentShowcase;
  -[MFAttachmentShowcase dealloc](&v3, "dealloc");
}

- (void)presentExchangeEventUID:(int)a3 showcaseInfo:(id)a4 delegate:(id)a5 completion:(id)a6
{
  -[MFAttachmentShowcase _presentContentRepresentation:exchangeEventUID:scene:showcaseInfo:delegate:completion:](self, "_presentContentRepresentation:exchangeEventUID:scene:showcaseInfo:delegate:completion:", 0, *(_QWORD *)&a3, 0, a4, a5, a6);
}

- (void)presentContentRepresentation:(id)a3 scene:(id)a4 showcaseInfo:(id)a5 delegate:(id)a6 completion:(id)a7
{
  -[MFAttachmentShowcase _presentContentRepresentation:exchangeEventUID:scene:showcaseInfo:delegate:completion:](self, "_presentContentRepresentation:exchangeEventUID:scene:showcaseInfo:delegate:completion:", a3, 0, a4, a5, a6, a7);
}

- (void)_presentContentRepresentation:(id)a3 exchangeEventUID:(int)a4 scene:(id)a5 showcaseInfo:(id)a6 delegate:(id)a7 completion:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  CNUnknownContactsController *v18;
  CNUnknownContactsController *vcardController;
  id v20;
  EMLMessageViewController *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  EMLMessageViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  EMLMessageViewController *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  objc_class *v50;
  void *v51;
  UIDocumentInteractionController *v52;
  UIDocumentInteractionController *uidic;
  void *v54;
  UIDocumentInteractionController *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  uint64_t v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  id v101;
  NSErrorUserInfoKey v102;
  void *v103;
  CGRect v104;
  CGRect v105;

  v12 = *(_QWORD *)&a4;
  v14 = a3;
  v92 = a5;
  v15 = a6;
  v94 = a7;
  v16 = a8;
  v93 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneButtonTapped:");
  -[MFAttachmentShowcase finishedPresenting](self, "finishedPresenting");
  -[MFAttachmentShowcase setDelegate:](self, "setDelegate:", v94);
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "type"));
  if (objc_msgSend(v17, "conformsToType:", UTTypeVCard))
  {
    v18 = (CNUnknownContactsController *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _controllerForVCardRepresentation:](self, "_controllerForVCardRepresentation:", v14));
    vcardController = self->_vcardController;
    self->_vcardController = v18;

    v20 = 0;
    v21 = (EMLMessageViewController *)objc_claimAutoreleasedReturnValue(-[CNUnknownContactsController viewController](self->_vcardController, "viewController"));
    if (!v21)
      goto LABEL_22;
    goto LABEL_10;
  }
  v22 = objc_msgSend(v17, "conformsToType:", UTTypeCalendarEvent) ^ 1;
  if ((_DWORD)v12)
    LOBYTE(v22) = 0;
  if ((v22 & 1) == 0)
  {
    v101 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _eventPreviewControllerForICSRepresentation:exchangeEventUID:managed:error:](self, "_eventPreviewControllerForICSRepresentation:exchangeEventUID:managed:error:", v14, v12, objc_msgSend(v15, "fromManagedAccount"), &v101));
    v20 = v101;
    if (!v20)
    {
      objc_storeStrong((id *)&self->_icsPreviewController, v23);
      -[EKICSPreviewController setPreviewDelegate:](self->_icsPreviewController, "setPreviewDelegate:", self);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[EKICSPreviewController viewController](self->_icsPreviewController, "viewController"));
      objc_msgSend(v24, "setHidesBottomBarWhenPushed:", 1);

      v93 = 0;
      -[EKICSPreviewController setCancelButtonWithTarget:action:](self->_icsPreviewController, "setCancelButtonWithTarget:action:", self, "_doneButtonTapped:");
    }
    v21 = (EMLMessageViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "viewController"));

    if (!v21)
      goto LABEL_22;
    goto LABEL_10;
  }
  if (-[MFAttachmentShowcase isProvisioningProfile:](self, "isProvisioningProfile:", v17))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _dataForContentRepresentation:](self, "_dataForContentRepresentation:", v14));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentURL"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastPathComponent"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_10014791C;
    v98[3] = &unk_100520650;
    v35 = v33;
    v99 = v35;
    v100 = v16;
    objc_msgSend(v34, "queueFileDataForAcceptance:originalFileName:forBundleID:completion:", v31, v35, 0, v98);

LABEL_18:
    v21 = 0;
    v20 = 0;
    goto LABEL_24;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  if ((objc_msgSend(v37, "ef_conformsToRFC822UTType") & 1) == 0)
  {

LABEL_30:
    if (-[MFAttachmentShowcase isAddableToPassbook:](self, "isAddableToPassbook:", v17))
    {
      v97 = 0;
      v42 = objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _passkitViewControllerForRepresentation:error:](self, "_passkitViewControllerForRepresentation:error:", v14, &v97));
      v20 = v97;
      if (v42)
      {
        v21 = (EMLMessageViewController *)v42;
LABEL_21:
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase presentingViewController](self, "presentingViewController"));
        objc_msgSend(v36, "presentViewController:animated:completion:", v21, objc_msgSend(v15, "shouldAnimate"), 0);

        goto LABEL_22;
      }
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("com.apple.watchface"));

      if (v44)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentURL"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:", v46, CFSTR("com.apple.Bridge"), 0, 0));

        objc_msgSend(v47, "start");
      }
      else
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.workout"));

        if (v49)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _dataForContentRepresentation:](self, "_dataForContentRepresentation:", v14));
          v50 = -[objc_class sharedInstance](off_1005A1780(), "sharedInstance");
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          v95[0] = _NSConcreteStackBlock;
          v95[1] = 3221225472;
          v95[2] = sub_100147A28;
          v95[3] = &unk_100520678;
          v96 = v16;
          objc_msgSend(v51, "presentWorkoutConfigurationData:completion:", v31, v95);

          v35 = v96;
          goto LABEL_18;
        }
        if (_os_feature_enabled_impl("Mail", "QuickLookInSeparateWindow")
          && +[UIDevice mf_isPad](UIDevice, "mf_isPad")
          && !objc_msgSend(v17, "conformsToType:", UTTypeImage))
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "contactStoreForAttachmentShowcase:", self));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "contentItemHandlingDelegateForAttachmentShowcase:", self));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentURL"));
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "message"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "senderDisplayNameUsingContactStore:", v89));
          v68 = objc_msgSend(v90, "shouldShowReplyAll");
          v80 = sub_100147B10((uint64_t)self, v92);
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectID"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mailboxObjectID"));
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "subject"));
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "subjectString"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originView"));
          objc_msgSend(v15, "originRect");
          v70 = v69;
          v72 = v71;
          v74 = v73;
          v76 = v75;
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "assetViewerManager"));
          LOBYTE(v78) = v80;
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[MessageAttachmentActionGenerator quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:](MessageAttachmentActionGenerator, "quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:", v88, v85, v84, v83, v87, v68, v70, v72, v74, v76, v79, v78, v86, v77));

          objc_msgSend(v81, "performWithSender:target:", self, 0);
        }
        else
        {
          v52 = (UIDocumentInteractionController *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase documentInteractionControllerForContentRepresentation:](self, "documentInteractionControllerForContentRepresentation:", v14));
          uidic = self->_uidic;
          self->_uidic = v52;

          v54 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase documentInteractionControllerDelegate](self, "documentInteractionControllerDelegate"));
          -[UIDocumentInteractionController setDelegate:](self->_uidic, "setDelegate:", v54);

          -[UIDocumentInteractionController setIsContentManaged:](self->_uidic, "setIsContentManaged:", objc_msgSend(v15, "fromManagedAccount"));
          if (!-[UIDocumentInteractionController presentPreviewAnimated:](self->_uidic, "presentPreviewAnimated:", objc_msgSend(v15, "shouldAnimate")))
          {
            v55 = self->_uidic;
            objc_msgSend(v15, "originRect");
            v57 = v56;
            v59 = v58;
            v61 = v60;
            v63 = v62;
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originView"));
            LOBYTE(v55) = -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](v55, "presentOptionsMenuFromRect:inView:animated:", v64, objc_msgSend(v15, "shouldAnimate"), v57, v59, v61, v63);

            if ((v55 & 1) == 0)
            {
              -[MFAttachmentShowcase finishedPresenting](self, "finishedPresenting");
              v102 = NSLocalizedDescriptionKey;
              v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("ATTACHMENT_UNKNOWN_TYPE_TITLE"), &stru_100531B00, CFSTR("Main")));
              v103 = v66;
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
              v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AttachmentShowcase"), 0, v67));

              goto LABEL_36;
            }
          }
        }
      }
      v20 = 0;
    }
LABEL_36:
    v21 = 0;
    goto LABEL_22;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentMessage"));

  if (!v38)
    goto LABEL_30;
  v39 = [EMLMessageViewController alloc];
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentMessage"));
  v21 = -[EMLMessageViewController initWithScene:messageListItem:](v39, "initWithScene:messageListItem:", v92, v40);

  v41 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneButtonTapped:");
  -[ConversationViewControllerBase setDoneButton:](v21, "setDoneButton:", v41);

  v20 = 0;
  if (v21)
  {
LABEL_10:
    if (v93)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController navigationItem](v21, "navigationItem"));
      objc_msgSend(v25, "setRightBarButtonItem:", v93);

    }
    v26 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v21, v26) & 1) == 0)
    {
      v27 = (EMLMessageViewController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v21);

      v21 = v27;
    }
    -[EMLMessageViewController setModalPresentationStyle:](v21, "setModalPresentationStyle:", 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController popoverPresentationController](v21, "popoverPresentationController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originView"));
    objc_msgSend(v28, "setSourceView:", v29);

    objc_msgSend(v28, "setDelegate:", self);
    objc_msgSend(v15, "originRect");
    v105.origin.x = CGRectZero.origin.x;
    v105.origin.y = CGRectZero.origin.y;
    v105.size.width = CGRectZero.size.width;
    v105.size.height = CGRectZero.size.height;
    if (CGRectEqualToRect(v104, v105))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originView"));
      objc_msgSend(v30, "bounds");
      objc_msgSend(v28, "setSourceRect:");

    }
    else
    {
      objc_msgSend(v15, "originRect");
      objc_msgSend(v28, "setSourceRect:");
    }

    goto LABEL_21;
  }
LABEL_22:
  if (v16)
    (*((void (**)(id, id))v16 + 2))(v16, v20);
LABEL_24:

}

- (void)_clearController
{
  NSObject *controller;
  EKICSPreviewController *icsPreviewController;
  UIDocumentInteractionController *uidic;
  CNUnknownContactsController *vcardController;

  controller = self->_controller;
  self->_controller = 0;

  icsPreviewController = self->_icsPreviewController;
  self->_icsPreviewController = 0;

  uidic = self->_uidic;
  self->_uidic = 0;

  vcardController = self->_vcardController;
  self->_vcardController = 0;

}

- (void)finishedPresenting
{
  MFAttachmentShowcase *v4;
  void *v5;
  MFRFC822AttachmentDataProvider *rfc822DataProvider;
  void *v7;

  if (pthread_main_np() != 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAttachmentShowcase.m"), 236, CFSTR("Current thread must be main"));

  }
  v4 = (MFAttachmentShowcase *)objc_claimAutoreleasedReturnValue(-[UIDocumentInteractionController delegate](self->_uidic, "delegate"));

  if (v4 == self)
    -[UIDocumentInteractionController setDelegate:](self->_uidic, "setDelegate:", 0);
  -[MFAttachmentShowcase _clearController](self, "_clearController");
  if (self->_rfc822DataProvider)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"));
    objc_msgSend(v5, "removeProvider:", self->_rfc822DataProvider);

    rfc822DataProvider = self->_rfc822DataProvider;
    self->_rfc822DataProvider = 0;

  }
}

- (void)_doneButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentingViewControllerForAttachmentShowcase:", self));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_controllerForVCardRepresentation:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _dataForContentRepresentation:](self, "_dataForContentRepresentation:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _controllerForVCardData:](self, "_controllerForVCardData:", v4));

  return v5;
}

- (id)_eventPreviewControllerForICSRepresentation:(id)a3 exchangeEventUID:(int)a4 managed:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;
  void *v19;
  NSErrorUserInfoKey v20;
  void *v21;

  v7 = a5;
  v8 = *(id *)&a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)EKEventStore);
  if ((_DWORD)v8
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentItem")),
        v8 = objc_msgSend(v11, "exchangeEventUID"),
        v11,
        (_DWORD)v8))
  {
    v12 = objc_msgSend(objc_alloc((Class)EKICSPreviewController), "initWithEventUID:eventStore:", v8, v10);
  }
  else
  {
    if (v7)
      v17 = 2;
    else
      v17 = 1;
    objc_msgSend(v10, "setSourceAccountManagement:", v17);
    v18 = objc_alloc((Class)EKICSPreviewController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentURL"));
    v12 = objc_msgSend(v18, "initWithURL:eventStore:", v19, v10);

    objc_msgSend(v12, "setAllowsImport:", 1);
    objc_msgSend(v12, "setAllowsEditing:", 1);
  }
  if (a6 && !v12)
  {
    v20 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ATTACHMENT_INVALID_CALENDAR_EVENT"), &stru_100531B00, CFSTR("Main")));
    v21 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AttachmentShowcase"), 1, v15));

  }
  return v12;
}

- (id)_passkitViewControllerForRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase _dataForContentRepresentation:](self, "_dataForContentRepresentation:", v6));
  v8 = objc_msgSend(objc_alloc((Class)PKPass), "initWithData:error:", v7, a4);
  v9 = v8;
  if (v8)
  {
    v13 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  }
  else
  {
    v10 = &__NSArray0__struct;
  }
  v11 = objc_msgSend(objc_alloc((Class)PKAddPassesViewController), "initWithPasses:", v10);

  return v11;
}

- (id)_dataForContentRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentURL"));
  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v4, 1, &v12));
  v6 = v12;

  if (v6 || !v5)
  {
    v9 = MFLogGeneral(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10039390C((uint64_t)v3, (uint64_t)v6, v10);

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)documentInteractionControllerForContentRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  char v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  if (objc_msgSend(v8, "ef_conformsToIWorkUTType"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathExtension"));
    v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("zip"));

    if (!v10)
      goto LABEL_5;
    v8 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingPathExtension"));
  }

LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFDocumentInteractionController interactionControllerWithURL:](MFDocumentInteractionController, "interactionControllerWithURL:", v4));
  objc_msgSend(v11, "setName:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v13 = objc_msgSend(v12, "ef_conformsToRFC822UTType");
  v14 = v13;
  if (v13)
    v15 = (void *)EFEmailMessageUTType;
  else
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  objc_msgSend(v11, "setUTI:", v15);
  if ((v14 & 1) == 0)

  objc_msgSend(v11, "setShouldUnzipDocument:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniformTypeIdentifier"));
  objc_msgSend(v11, "setPreviewsPresentWithMarkup:", objc_msgSend(v16, "ef_conformsToMarkupUTType"));

  return v11;
}

- (id)_controllerForVCardData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactVCardSerialization contactsWithData:error:](CNContactVCardSerialization, "contactsWithData:error:", a3, &v12));
  v5 = v12;
  v6 = v5;
  if (!v4)
  {
    v7 = MFLogGeneral(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100393990((uint64_t)v6, v8);

    v4 = &__NSArray0__struct;
  }
  v9 = objc_msgSend(objc_alloc((Class)CNUnknownContactsController), "initWithContacts:contactStore:", v4, 0);
  objc_msgSend(v9, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewController"));
  objc_msgSend(v10, "setHidesBottomBarWhenPushed:", 1);

  return v9;
}

- (BOOL)isProvisioningProfile:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", kMFUTTypeMobileConfig));
  if ((objc_msgSend(v3, "conformsToType:", v4) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", UTTypePKCS12) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", UTTypeX509Certificate) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", kMFUTTypeMobileProvision));
    v5 = objc_msgSend(v3, "conformsToType:", v7);

  }
  return v5;
}

- (BOOL)isAddableToPassbook:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToType:", _UTTypePassData) & 1) != 0
    || objc_msgSend(v3, "conformsToType:", _UTTypePassBundle))
  {
    v4 = +[PKAddPassesViewController canAddPasses](PKAddPassesViewController, "canAddPasses");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)unknownContactsController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "key"));
  v7 = objc_msgSend(v6, "isEqualToString:", CNContactEmailAddressesKey);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase presentingViewController](self, "presentingViewController"));
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  return 1;
}

- (void)unknownContactsControllerDidComplete:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase presentingViewController](self, "presentingViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class(UIPopoverPresentationController);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    -[MFAttachmentShowcase finishedPresenting](self, "finishedPresenting");

}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFAttachmentShowcase delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentingViewControllerForAttachmentShowcase:", self));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIDocumentInteractionControllerDelegate)documentInteractionControllerDelegate
{
  return (UIDocumentInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_documentInteractionControllerDelegate);
}

- (void)setDocumentInteractionControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_documentInteractionControllerDelegate, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (MFAttachmentShowcaseDelegate)delegate
{
  return (MFAttachmentShowcaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_documentInteractionControllerDelegate);
  objc_storeStrong((id *)&self->_rfc822DataProvider, 0);
  objc_storeStrong((id *)&self->_vcardController, 0);
  objc_storeStrong((id *)&self->_uidic, 0);
  objc_storeStrong((id *)&self->_icsPreviewController, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
