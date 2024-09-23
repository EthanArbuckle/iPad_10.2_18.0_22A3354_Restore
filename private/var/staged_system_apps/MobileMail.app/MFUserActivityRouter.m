@implementation MFUserActivityRouter

- (MFUserActivityRouter)initWithDelegate:(id)a3 messageRepository:(id)a4
{
  id v6;
  id v7;
  MFUserActivityRouter *v8;
  MFUserActivityRouter *v9;
  MFLANHandoffAgent *v10;
  MFLANHandoffAgent *LANHandoffAgent;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFUserActivityRouter;
  v8 = -[MFUserActivityRouter init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_messageRepository, a4);
    v10 = (MFLANHandoffAgent *)objc_alloc_init((Class)MFLANHandoffAgent);
    LANHandoffAgent = v9->_LANHandoffAgent;
    v9->_LANHandoffAgent = v10;

  }
  return v9;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C15D4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA498 != -1)
    dispatch_once(&qword_1005AA498, block);
  return (OS_os_log *)(id)qword_1005AA490;
}

- (id)_currentActivityUserInfoFromSendMailIntent:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD *v6;
  id v7;
  void ***v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001C1924;
  v25[3] = &unk_1005232A8;
  v5 = objc_alloc_init((Class)MFPersonTransformer);
  v26 = v5;
  v6 = objc_retainBlock(v25);
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_1001C1944;
  v23 = &unk_1005232D0;
  v7 = v4;
  v24 = v7;
  v8 = objc_retainBlock(&v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sender", v20, v21, v22, v23));
  ((void (*)(void ***, _QWORD, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeySenderAddress, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "to"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_compactMap:", v6));
  ((void (*)(void ***, _QWORD, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyToRecipients, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cc"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ef_compactMap:", v6));
  ((void (*)(void ***, _QWORD, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyCcRecipients, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bcc"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ef_compactMap:", v6));
  ((void (*)(void ***, _QWORD, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyBccRecipients, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subject"));
  ((void (*)(void ***, _QWORD, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeySubject, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "body"));
  ((void (*)(void ***, _QWORD, void *))v8[2])(v8, MSMailActivityHandoffSendMailKeyMessageBody, v17);

  v18 = v7;
  return v18;
}

- (BOOL)handoffUserActivity:(id)a3 withPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  BOOL v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  MFLANHandoffAgent *LANHandoffAgent;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  MFUserActivityBrowseMailboxRoute *v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  unsigned int v66;
  _QWORD v67[4];
  id v68;
  id v69;
  MFUserActivityRouter *v70;
  _QWORD v71[4];
  MFUserActivityBrowseMailboxRoute *v72;
  id v73;
  id v74;
  MFUserActivityRouter *v75;
  id v76;
  char v77;
  char v78;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interaction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "intent"));
  v11 = objc_opt_class(MSSendMailIntent);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "intent"));
    v14 = objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter _currentActivityUserInfoFromSendMailIntent:](self, "_currentActivityUserInfoFromSendMailIntent:", v13));

    v15 = MSMailActivityHandoffTypeSendMail;
    v7 = (id)v14;
    v8 = v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter delegate](self, "delegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mailboxPickerControllerForActivityRouter:", self));
  v61 = -[MFUserActivityBrowseMailboxRoute initWithMailboxPickerController:]([MFUserActivityBrowseMailboxRoute alloc], "initWithMailboxPickerController:", v17);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter handoffComposeController](self, "handoffComposeController"));
  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffTypeKey));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffDebugKeySimulateFailureBool));
  v19 = objc_msgSend(v18, "BOOLValue");

  if (!v19)
  {
    v57 = v17;
    v58 = v9;
    v22 = objc_msgSend(MSMailActivityHandoffTypeSearch, "isEqualToString:", v8);
    v23 = objc_msgSend(CSQueryContinuationActionType, "isEqualToString:", v8);
    v60 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v8, CFSTR("ceActivityType"));
    if ((v23 | v22) == 1)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      if (v22)
      {
        objc_msgSend(v60, "setObject:forKeyedSubscript:", &off_100541A58, CFSTR("ceActivityIsHandoff"));
      }
      else if (v23)
      {
        objc_msgSend(v60, "setObject:forKeyedSubscript:", &off_100541A70, CFSTR("ceActivityIsHandoff"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CSSearchQueryString));
        if (v30)
        {
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_1001C26B0;
          v71[3] = &unk_1005232F8;
          v77 = 0;
          v72 = v61;
          v73 = v7;
          v78 = v23;
          v74 = v16;
          v75 = self;
          v76 = v30;
          v31 = v30;
          +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v71);

          v29 = 0;
          v21 = 1;
          goto LABEL_25;
        }
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v60, CFSTR("Could not continue Spotlight Query Activity; null query.")));
      v21 = 0;
LABEL_25:

      if (!v29)
        goto LABEL_31;
      goto LABEL_30;
    }
    if (objc_msgSend(CSSearchableItemActionType, "isEqualToString:", v8))
    {
      objc_msgSend(v60, "setObject:forKeyedSubscript:", &off_100541A88, CFSTR("ceActivityIsHandoff"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CSSearchableItemActivityIdentifier));
      v25 = v60;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter messageRepository](self, "messageRepository"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "messageForSearchableItemIdentifier:", v24));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "resultWithTimeout:error:", 0, 5.0));
      if (v28
        && (v25 = v60, (objc_msgSend(v16, "displayMessage:fromUserActivityRouter:", v28, self) & 1) != 0))
      {
        v29 = 0;
        v21 = 1;
      }
      else
      {
        objc_msgSend(v25, "setObject:forKeyedSubscript:", &off_100541A70, CFSTR("ceActivityErrorReason"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v60, CFSTR("Could not continue Spotlight Message Display Activity. Unable to find message with unique identifier: %@"), v24));
        v21 = 0;
      }

      goto LABEL_25;
    }
    if ((objc_msgSend(MSMailActivityHandoffTypeDisplayMessage, "isEqualToString:", v8) & 1) != 0
      || objc_msgSend(MSMailActivityHandoffTypeDisplayMessageAttachment, "isEqualToString:", v8))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffDisplayMessageKeyURL));
      objc_msgSend(v60, "setObject:forKeyedSubscript:", &off_100541A70, CFSTR("ceActivityIsHandoff"));
      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v32));
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_1001C27B4;
        v67[3] = &unk_10051D830;
        v68 = v60;
        v69 = v33;
        v70 = self;
        v34 = v33;
        objc_msgSend(v16, "openURL:fromUserActivityRouter:completionHandler:", v34, self, v67);

LABEL_22:
        v29 = 0;
        goto LABEL_29;
      }
      v35 = objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v60, CFSTR("Could not continue Message Display Activity with empty messageURL value.")));
      goto LABEL_28;
    }
    v37 = MSMailActivityHandoffTypeBrowseMailbox;
    if (objc_msgSend(MSMailActivityHandoffTypeBrowseMailbox, "isEqualToString:", v8))
    {
      v21 = 0;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityBrowseMailboxRoute browseMailboxForActivityPayload:activityType:scrollToMessage:](v61, "browseMailboxForActivityPayload:activityType:scrollToMessage:", v7, v37, 1));
      if (!v29)
        goto LABEL_31;
      goto LABEL_30;
    }
    if (objc_msgSend(MSMailActivityHandoffTypeComposeSansStreams, "isEqualToString:", v8))
    {
      objc_msgSend(v60, "setObject:forKeyedSubscript:", &off_100541A70, CFSTR("ceActivityIsHandoff"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyMessageData));
      if (v32)
      {
        v34 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:RFC822Data:", 2, v32);
        if (v59)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_mailComposeController"));
          objc_msgSend(v38, "setCompositionContext:", v34);

        }
        else
        {
          objc_msgSend(v16, "showComposeWithContext:fromActivityRouter:", v34, self);
        }
        goto LABEL_22;
      }
      v35 = objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v60, CFSTR("Received continue compose with empty message payload")));
      goto LABEL_28;
    }
    if (objc_msgSend(MSMailActivityHandoffTypeComposeWithStreams, "isEqualToString:", v8))
    {
      objc_msgSend(v60, "setObject:forKeyedSubscript:", &off_100541A70, CFSTR("ceActivityIsHandoff"));
      v39 = MSMailActivityHandoffDebugKeyComposeDataPath;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffDebugKeyComposeDataPath));

      v21 = (char)v59;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
      v42 = objc_msgSend(v41, "BOOLForKey:", CFSTR("ComposeActivityOverLAN"));

      if (!v59)
      {
        v29 = 0;
        goto LABEL_31;
      }
      if (v40)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v39));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v44 = objc_msgSend(v43, "fileExistsAtPath:", v32);

        if (v44)
        {
          v56 = v32;
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data", v60));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v32));
          if (objc_msgSend(v46, "length"))
          {
            v55 = v45;
            v66 = bswap32(objc_msgSend(v46, "length"));
            objc_msgSend(v45, "appendBytes:length:", &v66, 4);
            objc_msgSend(v45, "appendData:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](NSInputStream, "inputStreamWithData:", v45));
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSOutputStream outputStreamToMemory](NSOutputStream, "outputStreamToMemory"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_mailComposeController"));
            objc_msgSend(v49, "handleLargeMessageComposeHandoffWithInputStream:outputStream:error:", v47, v48, 0);

            v29 = 0;
            v45 = v55;
          }
          else
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v60, CFSTR("Could not read draft data from file: %@"), v56));
          }

          v32 = v56;
LABEL_29:

          v21 = 0;
          if (!v29)
          {
LABEL_31:

            v17 = v57;
            v9 = v58;
            goto LABEL_32;
          }
LABEL_30:
          -[MFUserActivityRouter presentAlertForHandoffError:](self, "presentAlertForHandoffError:", v29);
          goto LABEL_31;
        }
        v35 = objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v60, CFSTR("Compose data file for debugging does not exist: %@."), v32));
LABEL_28:
        v29 = (void *)v35;
        goto LABEL_29;
      }
      if (v42)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MFLANHandoffHostnameKey));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MFLANHandoffPortNumberKey));
        v53 = objc_alloc_init((Class)MFLANHandoffContext);
        objc_msgSend(v53, "setHost:", v51);
        objc_msgSend(v53, "setPort:", objc_msgSend(v52, "unsignedShortValue"));
        LANHandoffAgent = self->_LANHandoffAgent;
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_1001C2850;
        v64[3] = &unk_100523320;
        v65 = v59;
        -[MFLANHandoffAgent connectToServerWithContext:completion:](LANHandoffAgent, "connectToServerWithContext:completion:", v53, v64);

      }
      else
      {
        kdebug_trace(729943040, 0, 0, 0, 0);
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1001C28E0;
        v62[3] = &unk_100523348;
        v63 = v59;
        objc_msgSend(v6, "getContinuationStreamsWithCompletionHandler:", v62);

      }
    }
    else if (objc_msgSend(MSMailActivityHandoffTypeSendMail, "isEqualToString:", v8))
    {
      v50 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithHandoffActivityPayload:", v7);
      objc_msgSend(v50, "setShowContentImmediately:", 1);
      objc_msgSend(v50, "setCaretPosition:", 0x7FFFFFFFFFFFFFFFLL);
      objc_msgSend(v50, "setShowKeyboardImmediately:", 1);
      objc_msgSend(v16, "showComposeWithContext:fromActivityRouter:", v50, self);

    }
    v29 = 0;
    v21 = 0;
    goto LABEL_31;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mailHandoffSimulatedError](NSError, "mailHandoffSimulatedError"));
  objc_msgSend(v16, "simulateUserActivityFailureWithType:error:fromActivityRouter:", v8, v20, self);

  v21 = 0;
LABEL_32:

  return v21;
}

- (void)willHandoffUserActivityWithType:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxPickerControllerForActivityRouter:", self));
  if (objc_msgSend(MSMailActivityHandoffTypeBrowseMailbox, "isEqualToString:", v15))
  {
    objc_msgSend(v5, "dismissAndUnfocus");
  }
  else if ((objc_msgSend(MSMailActivityHandoffTypeComposeSansStreams, "isEqualToString:", v15) & 1) != 0
         || objc_msgSend(MSMailActivityHandoffTypeComposeWithStreams, "isEqualToString:", v15))
  {
    v6 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composeControllerForCompositionContext:forActivityRouter:", v6, self));
    -[MFUserActivityRouter setHandoffComposeController:](self, "setHandoffComposeController:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter handoffComposeController](self, "handoffComposeController"));
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFUserActivityRouter));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v8, "setInitialTitle:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter handoffComposeController](self, "handoffComposeController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mailComposeController"));
    objc_msgSend(v13, "setProgressUIVisible:animated:", 1, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter handoffComposeController](self, "handoffComposeController"));
    objc_msgSend(v4, "presentComposeController:forUserActivityRouter:", v14, self);

  }
}

- (void)handoffUserActivityFailedWithType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
    v11 = 138543362;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Hand-Off _handleHandoffError: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  if (objc_msgSend(v7, "mf_isSpotlightHandoffError"))
  {
    -[MFUserActivityRouter recoverUIAfterHandoffFailureWithType:](self, "recoverUIAfterHandoffFailureWithType:", v6);
    v10 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Hand-Off Will not present alert since it's a spotlight continuation error.", (uint8_t *)&v11, 2u);
    }

  }
  else
  {
    -[MFUserActivityRouter presentAlertForHandoffError:](self, "presentAlertForHandoffError:", v7);
  }

}

- (void)presentAlertForHandoffError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertOverlayControllerForActivityRouter:", self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MailHandoffAlertControllerFactory mailAlertControllerForHandoffError:acknowledgmentObserver:](MailHandoffAlertControllerFactory, "mailAlertControllerForHandoffError:acknowledgmentObserver:", v4, self));
  if (v6 && v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      v11 = 138412546;
      v12 = v6;
      v13 = 2114;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Hand-Off Presenting alert for handoff error using overlay controller %@. error=%{public}@", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(v6, "presentAlertController:animated:completion:", v7, 1, 0);
  }
  else
  {
    if (v6)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100394E50();
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100394EB0();
    }

  }
}

- (void)recoverUIAfterHandoffFailureWithType:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter delegate](self, "delegate"));
  if ((objc_msgSend(v6, "isEqualToString:", MSMailActivityHandoffTypeComposeSansStreams) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", MSMailActivityHandoffTypeComposeWithStreams))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter handoffComposeController](self, "handoffComposeController"));
    -[MFUserActivityRouter setHandoffComposeController:](self, "setHandoffComposeController:", 0);
    if (v5)
      objc_msgSend(v4, "dismissComposeController:forUserActivityRouter:", v5, self);

  }
}

- (void)userAcknowledgedHandoffError:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mf_mailHandoffActivityType"));
  -[MFUserActivityRouter recoverUIAfterHandoffFailureWithType:](self, "recoverUIAfterHandoffFailureWithType:");

}

- (void)routeUserActivity:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_syRelatedUniqueIdentifier"));
  if (v4 && (v5 = _os_feature_enabled_impl("Synapse", "ReturnToSender"), v4, v5))
  {
    -[MFUserActivityRouter returnToSenderUserActivity:](self, "returnToSenderUserActivity:", v8);
    v6 = v8;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    -[MFUserActivityRouter handoffUserActivity:withPayload:](self, "handoffUserActivity:withPayload:", v8, v7);

    v6 = v8;
  }

}

- (void)routeWillContinueUserActivityWithType:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(MSMailReturnToSenderActivityType, "isEqualToString:")
    && _os_feature_enabled_impl("Synapse", "ReturnToSender"))
  {
    -[MFUserActivityRouter willReturnToSenderActivityWithType:](self, "willReturnToSenderActivityWithType:", v4);
  }
  else
  {
    -[MFUserActivityRouter willHandoffUserActivityWithType:](self, "willHandoffUserActivityWithType:", v4);
  }

}

- (void)routeUserActivityFailedWithType:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(MSMailReturnToSenderActivityType, "isEqualToString:", v7)
    && _os_feature_enabled_impl("Synapse", "ReturnToSender"))
  {
    -[MFUserActivityRouter returnToSenderUserActivityFailedWithType:error:](self, "returnToSenderUserActivityFailedWithType:error:", v7, v6);
  }
  else
  {
    -[MFUserActivityRouter handoffUserActivityFailedWithType:error:](self, "handoffUserActivityFailedWithType:error:", v7, v6);
  }

}

- (void)returnToSenderUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  MFUserActivityRouter *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_syRelatedUniqueIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter messageRepository](self, "messageRepository"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageForSearchableItemIdentifier:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resultWithTimeout:error:", 0, 5.0));
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ReturnToSender success: found a valid message %{public}@", buf, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_syDocumentProvider"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_syDocumentProvider"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1001C3530;
      v14[3] = &unk_100523370;
      v15 = v9;
      v16 = self;
      v17 = v6;
      v18 = v5;
      objc_msgSend(v13, "loadDocumentWithHandler:", v14);

    }
    else
    {
      objc_msgSend(v5, "displayMessage:fromUserActivityRouter:", v9, self);
    }
  }
  else
  {
    -[MFUserActivityRouter returnToSenderErrorHandling:urlError:](self, "returnToSenderErrorHandling:urlError:", v6, 0);
  }

}

- (void)returnToSenderErrorHandling:(id)a3 urlError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100394F70();

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100394F10();

    -[MFUserActivityRouter presentAlertForReturnToSenderError](self, "presentAlertForReturnToSenderError");
  }

}

- (void)willReturnToSenderActivityWithType:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ReturnToSender will return to sender activity", v4, 2u);
  }

}

- (void)returnToSenderUserActivityFailedWithType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MFUserActivityRouter log](MFUserActivityRouter, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
    v10 = 138412546;
    v11 = v6;
    v12 = 2114;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ReturnToSender return to sender user activity failed with type %@ and error=%{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[MFUserActivityRouter presentAlertForReturnToSenderError](self, "presentAlertForReturnToSenderError");

}

- (void)presentAlertForReturnToSenderError
{
  void *v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  void *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserActivityRouter delegate](self, "delegate"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertOverlayControllerForActivityRouter:", self));

  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFUserActivityRouter));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SELECTED_MESSAGE_NOT_FOUND_ERROR_TITLE"), &stru_100531B00, CFSTR("Main")));
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFUserActivityRouter));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SELECTED_MESSAGE_NOT_FOUND_ERROR_BODY"), &stru_100531B00, CFSTR("Main")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v9, 1));

  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFUserActivityRouter));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100531B00, CFSTR("Main")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, 0));

  objc_msgSend(v10, "addAction:", v14);
  objc_msgSend(v15, "presentAlertController:animated:completion:", v10, 1, 0);

}

- (MFUserActivityRouterDelegate)delegate
{
  return (MFUserActivityRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ComposeNavigationController)handoffComposeController
{
  return self->_handoffComposeController;
}

- (void)setHandoffComposeController:(id)a3
{
  objc_storeStrong((id *)&self->_handoffComposeController, a3);
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)setMessageRepository:(id)a3
{
  objc_storeStrong((id *)&self->_messageRepository, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_handoffComposeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_LANHandoffAgent, 0);
}

@end
