@implementation TransferMailboxPickerController

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DF05C;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA5C8 != -1)
    dispatch_once(&qword_1005AA5C8, block);
  return (id)qword_1005AA5C0;
}

- (TransferMailboxPickerController)initWithItems:(id)a3 scene:(id)a4
{
  id v7;
  TransferMailboxPickerController *v8;
  uint64_t v9;
  NSArray *sortedMessages;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  NSArray *senders;
  uint64_t v17;
  NSString *subject;
  uint64_t v19;
  NSSet *sourceMailboxes;
  NSSet *v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  MailAccount *account;
  uint64_t v33;
  MailAccount *v34;
  uint64_t v35;
  MailAccount *v36;
  NSSet *v37;
  NSSet *sourceAccounts;
  MFMessageScreenshotGenerator *v39;
  MFMessageScreenshotGenerator *screenshotGenerator;
  void *v41;
  void *v43;
  id obj;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v7 = a3;
  obj = a4;
  v45 = v7;
  if (!v7)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TransferMailboxPickerController.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != items"));

  }
  v55.receiver = self;
  v55.super_class = (Class)TransferMailboxPickerController;
  v8 = -[TransferMailboxPickerController init](&v55, "init");
  if (v8)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_1005239D8));
    sortedMessages = v8->_sortedMessages;
    v8->_sortedMessages = (NSArray *)v9;

    v8->_totalMessageCount = 0;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v13)
            objc_enumerationMutation(v11);
          v8->_totalMessageCount += (int64_t)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "count");
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v12);
    }

    objc_storeWeak((id *)&v8->_scene, obj);
    v15 = objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController _sendersFromItems:](v8, "_sendersFromItems:", v11));
    senders = v8->_senders;
    v8->_senders = (NSArray *)v15;

    v17 = objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController _subjectFromItems:totalMessageCount:](v8, "_subjectFromItems:totalMessageCount:", v11, v8->_totalMessageCount));
    subject = v8->_subject;
    v8->_subject = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController _sourceMailboxesFromItems:](v8, "_sourceMailboxesFromItems:", v11));
    sourceMailboxes = v8->_sourceMailboxes;
    v8->_sourceMailboxes = (NSSet *)v19;

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v21 = v8->_sourceMailboxes;
    v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j), "account"));
          if (v25)
          {
            objc_msgSend(v46, "addObject:", v25);
          }
          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[EFAutoBugCaptureReporter sharedReporter](EFAutoBugCaptureReporter, "sharedReporter"));
            objc_msgSend(v26, "reportIssueType:description:", CFSTR("TransferMailboxPickerController"), CFSTR("account is nil"));

          }
        }
        v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v22);
    }

    if ((unint64_t)objc_msgSend(v46, "count") < 2)
      goto LABEL_27;
    *((_BYTE *)v8 + 80) |= 1u;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringForKey:", CFSTR("LastTransferAccount")));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueID"));
    v31 = objc_msgSend(v28, "isEqualToString:", v30);

    if (v31)
    {
      account = (MailAccount *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      -[MailAccount removeObjectForKey:](account, "removeObjectForKey:", CFSTR("LastTransferAccount"));
    }
    else
    {
      if (!v28)
        goto LABEL_27;
      v33 = objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v28));
      account = v8->_account;
      v8->_account = (MailAccount *)v33;
    }

LABEL_27:
    v34 = v8->_account;
    if (!v34 || (-[MailAccount isActive](v34, "isActive") & 1) == 0)
    {
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "anyObject"));
      v36 = v8->_account;
      v8->_account = (MailAccount *)v35;

    }
    v37 = (NSSet *)objc_msgSend(v46, "copy");
    sourceAccounts = v8->_sourceAccounts;
    v8->_sourceAccounts = v37;

    v39 = -[MFMessageScreenshotGenerator initWithScene:]([MFMessageScreenshotGenerator alloc], "initWithScene:", obj);
    screenshotGenerator = v8->_screenshotGenerator;
    v8->_screenshotGenerator = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v41, "addObserver:selector:name:object:", v8, "mailAccountsDidChange:", ECMailAccountsDidChangeNotification, 0);
    objc_msgSend(v41, "addObserver:selector:name:object:", v8, "_didReceiveTargetDetailChangedNotification:", UIViewControllerShowDetailTargetDidChangeNotification, 0);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[MailboxListViewControllerMail removeFromParentViewController](self->_mailboxListController, "removeFromParentViewController");
  v3.receiver = self;
  v3.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController dealloc](&v3, "dealloc");
}

- (void)mailAccountsDidChange:(id)a3
{
  sub_1001DF7D8(self, 0);
}

- (id)contentScrollView
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self->_mailboxListController, "tableView"));
  objc_msgSend(v2, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMoveMessageViewMailboxListController);
  return v2;
}

- (void)updateTitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MAILBOXES"), &stru_100531B00, CFSTR("Main")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount displayName](self->_account, "displayName"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;

    v8 = v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController title](self, "title"));
  v7 = objc_msgSend(v8, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    -[TransferMailboxPickerController setTitle:](self, "setTitle:", v8);

}

- (double)_yOffsetMaximum
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self->_mailboxListController, "tableView"));
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  objc_msgSend(v2, "bounds");
  v6 = v4 - v5;

  return v6;
}

- (void)saveScrollOffset
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (!qword_1005AA5B8)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)qword_1005AA5B8;
    qword_1005AA5B8 = (uint64_t)v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self->_mailboxListController, "tableView"));
  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  -[TransferMailboxPickerController _yOffsetMaximum](self, "_yOffsetMaximum");
  if (v7 >= v8)
    v7 = INFINITY;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self->_mailboxListController, "account"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueID"));

  v11 = v14;
  if (v14)
  {
    v12 = (void *)qword_1005AA5B8;
    *(float *)&v10 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
    objc_msgSend(v12, "setObject:forKey:", v13, v14);

    v11 = v14;
  }

}

- (void)restoreScrollOffset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v3 = (void *)qword_1005AA5B8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self->_mailboxListController, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self->_mailboxListController, "tableView"));
  if (v16)
  {
    objc_msgSend(v16, "floatValue");
    v8 = v7;
    -[TransferMailboxPickerController _yOffsetMaximum](self, "_yOffsetMaximum");
    v10 = v9;
    -[TransferMailboxPickerController _navigationBarAndPaletteMaxY](self, "_navigationBarAndPaletteMaxY");
    v12 = v8;
    if (v10 <= v8)
      v12 = v10;
    v13 = v12 + v11;
    if (v13 >= 0.0)
      v14 = v13;
    else
      v14 = 0.0;
  }
  else
  {
    v14 = 0.0;
  }
  objc_msgSend(v6, "contentInset");
  objc_msgSend(v6, "setContentOffset:", 0.0, v14 - v15);

}

- (double)_navigationBarMaxY
{
  void *v3;
  void *v4;
  double Height;
  void *v6;
  void *v7;
  double v8;
  CGRect v10;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController scene](self, "scene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusBarManager"));
  objc_msgSend(v4, "statusBarFrame");
  Height = CGRectGetHeight(v10);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController navigationController](self, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
  objc_msgSend(v7, "bounds");
  v8 = Height + 0.0 + CGRectGetHeight(v11);

  return v8;
}

- (double)_navigationBarAndPaletteMaxY
{
  double result;

  -[TransferMailboxPickerController _navigationBarMaxY](self, "_navigationBarMaxY");
  return result;
}

- (id)_sendersFromItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v16 = a3;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)NSMutableSet);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v16;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8), "senderList"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddressValue"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
        if (!objc_msgSend(v12, "length"))
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "simpleAddress"));

          v12 = (void *)v13;
        }
        if (objc_msgSend(v12, "length"))
        {
          if (!v12)
            goto LABEL_14;
        }
        else
        {
          v14 = objc_claimAutoreleasedReturnValue(+[MUILocalizedMessageListStrings noSenderPlaceholder](MUILocalizedMessageListStrings, "noSenderPlaceholder"));

          v12 = (void *)v14;
          if (!v14)
            goto LABEL_14;
        }
        if ((objc_msgSend(v4, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v12);
          objc_msgSend(v4, "addObject:", v12);
        }
LABEL_14:

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_subjectFromItems:(id)a3 totalMessageCount:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a3;
  v6 = v5;
  if (a4 != 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatUnsignedInteger:withGrouping:](NSNumberFormatter, "ef_formatUnsignedInteger:withGrouping:", a4, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("N_MESSAGES"), &stru_100531B00, CFSTR("Main")));

    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v11, v10);
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subject"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subjectString"));

  if (!v9 || !objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_100531B00, CFSTR("Main")));
    v12 = objc_msgSend(v11, "copy");

    v9 = v12;
LABEL_6:

  }
  return v9;
}

- (id)_sourceMailboxesFromItems:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v14 = a3;
  v3 = objc_alloc_init((Class)NSMutableSet);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v14;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxProvider"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_mapSelector:", "objectID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "legacyMailboxesForObjectIDs:", v11));
        objc_msgSend(v3, "addObjectsFromArray:", v12);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  return v3;
}

- (void)_setPaletteVisible:(BOOL)a3
{
  TransferMailboxPickerPalette *pickerPalette;
  TransferMailboxPickerPalette *v5;
  TransferMailboxPickerPalette *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TransferMailboxPickerPalette *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id from;
  id location;

  if (a3)
  {
    pickerPalette = self->_pickerPalette;
    if (!pickerPalette)
    {
      v5 = -[TransferMailboxPickerPalette initWithFrame:]([TransferMailboxPickerPalette alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v6 = self->_pickerPalette;
      self->_pickerPalette = v5;

      pickerPalette = self->_pickerPalette;
    }
    -[TransferMailboxPickerPalette setSubject:](pickerPalette, "setSubject:", self->_subject);
    -[TransferMailboxPickerPalette setSenders:](self->_pickerPalette, "setSenders:", self->_senders);
    -[TransferMailboxPickerPalette setMessageCount:](self->_pickerPalette, "setMessageCount:", self->_totalMessageCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_sortedMessages, "firstObject"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "transferMailboxPickerController:viewForItem:") & 1) != 0
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "transferMailboxPickerController:viewForItem:", self, v7))) != 0)
    {
      -[TransferMailboxPickerPalette setMessageThumbnailWithView:](self->_pickerPalette, "setMessageThumbnailWithView:", v9);
    }
    else
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self->_pickerPalette);
      from = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&from, self->_screenshotGenerator);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayMessage"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1001E0888;
      v25[3] = &unk_100523A28;
      v25[4] = self;
      objc_copyWeak(&v26, &from);
      objc_copyWeak(&v27, &location);
      objc_msgSend(v11, "onScheduler:addSuccessBlock:", v12, v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      v9 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController navigationController](self, "navigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingPaletteForEdge:", 2));

    if (!v14)
    {
      v15 = self->_pickerPalette;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
      objc_msgSend(v16, "frame");
      -[TransferMailboxPickerPalette sizeThatFits:](v15, "sizeThatFits:", v17, v18);
      v20 = v19;
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "paletteForEdge:size:", 2, v20, v22));
      objc_msgSend(v23, "bounds");
      -[TransferMailboxPickerPalette setFrame:](self->_pickerPalette, "setFrame:");
      objc_msgSend(v23, "addSubview:", self->_pickerPalette);
      objc_msgSend(v13, "attachPalette:isPinned:", v23, 0);

    }
  }
  else
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController navigationController](self, "navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "existingPaletteForEdge:", 2));
    if (v10)
      objc_msgSend(v24, "detachPalette:", v10);

  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  MailboxListViewControllerMail *mailboxListController;
  MailboxListViewControllerMail *v12;
  MailboxListViewControllerMail *v13;
  MailboxListViewingContext *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewDidLoad](&v32, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController scene](self, "scene"));
  v31 = v3;
  v4 = objc_alloc((Class)UIView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mf_window"));
  objc_msgSend(v5, "bounds");
  v6 = objc_msgSend(v4, "initWithFrame:");

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  -[TransferMailboxPickerController setView:](self, "setView:", v6);
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  -[TransferMailboxPickerController updateTitle](self, "updateTitle");
  mailboxListController = self->_mailboxListController;
  if (!mailboxListController)
  {
    v12 = -[MailboxListViewControllerMail initWithScene:]([MailboxListViewControllerMail alloc], "initWithScene:", v3);
    v13 = self->_mailboxListController;
    self->_mailboxListController = v12;

    mailboxListController = self->_mailboxListController;
  }
  -[MailboxListViewControllerMail setShowsDisclosure:](mailboxListController, "setShowsDisclosure:", 0);
  -[MailboxListViewControllerMail setShowsRefreshControl:](self->_mailboxListController, "setShowsRefreshControl:", 0);
  -[TransferMailboxPickerController addChildViewController:](self, "addChildViewController:", self->_mailboxListController);
  v14 = objc_alloc_init(MailboxListViewingContext);
  -[MailboxListViewingContext setAccount:](v14, "setAccount:", self->_account);
  -[MailboxListViewingContext setSelectionTarget:](v14, "setSelectionTarget:", self);
  -[MailboxListViewControllerBase setViewingContext:](self->_mailboxListController, "setViewingContext:", v14);
  v15 = -[NSSet mutableCopy](self->_sourceMailboxes, "mutableCopy");
  v30 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount transferDisabledMailboxUids](self->_account, "transferDisabledMailboxUids"));
  if (v16)
    objc_msgSend(v15, "addObjectsFromArray:", v16);
  -[MailboxListViewControllerMail disableMailboxes:](self->_mailboxListController, "disableMailboxes:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 106));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 105));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, v19, v20, 0));

  -[MailboxListViewControllerMail disableMailboxTypes:](self->_mailboxListController, "disableMailboxTypes:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail view](self->_mailboxListController, "view"));
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v8, v10);
  objc_msgSend(v6, "addSubview:", v22);
  -[MailboxListViewControllerMail didMoveToParentViewController:](self->_mailboxListController, "didMoveToParentViewController:", self);
  v23 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
  objc_msgSend(v23, "setSearchResultsUpdater:", self);
  objc_msgSend(v23, "setHidesNavigationBarDuringPresentation:", 1);
  objc_msgSend(v23, "setObscuresBackgroundDuringPresentation:", 0);
  v24 = _EFLocalizedString(CFSTR("Search"), &unk_10059D2A0, &unk_10059D2A8);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchBar"));
  objc_msgSend(v26, "setPlaceholder:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchBar"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "searchTextField"));
  objc_msgSend(v28, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMoveMessageViewMailboxListControllerSearchTextField);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v29, "setSearchController:", v23);

  -[TransferMailboxPickerController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewWillAppear:](&v11, "viewWillAppear:");
  -[MailboxListViewControllerMail viewWillAppear:](self->_mailboxListController, "viewWillAppear:", v3);
  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, "_cancel:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController scene](self, "scene"));
  -[TransferMailboxPickerController _setPaletteVisible:](self, "_setPaletteVisible:", objc_msgSend(v10, "isInExpandedEnvironment") ^ 1);

  -[TransferMailboxPickerController restoreScrollOffset](self, "restoreScrollOffset");
}

- (void)_didReceiveTargetDetailChangedNotification:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController scene](self, "scene", a3));
  -[TransferMailboxPickerController _setPaletteVisible:](self, "_setPaletteVisible:", objc_msgSend(v4, "isInExpandedEnvironment") ^ 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewDidAppear:](&v5, "viewDidAppear:");
  -[MailboxListViewControllerMail viewDidAppear:](self->_mailboxListController, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewWillDisappear:](&v5, "viewWillDisappear:");
  -[TransferMailboxPickerController saveScrollOffset](self, "saveScrollOffset");
  -[MailboxListViewControllerMail viewWillDisappear:](self->_mailboxListController, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransferMailboxPickerController;
  -[TransferMailboxPickerController viewDidDisappear:](&v5, "viewDidDisappear:");
  -[MailboxListViewControllerMail viewDidDisappear:](self->_mailboxListController, "viewDidDisappear:", v3);
}

- (BOOL)shouldSnapshot
{
  return 0;
}

- (BOOL)canDismiss
{
  return 0;
}

- (void)_cancel:(id)a3
{
  sub_1001DF7D8(self, 0);
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)animateMessageToCell:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  UIView *v15;
  UIView *animatedView;
  id v17;
  void *i;
  void *v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGPath *Mutable;
  CGFloat v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[2];

  v5 = a3;
  objc_storeStrong((id *)&self->_tableCell, a3);
  -[MailboxTableCell destinationPointForAnimation](self->_tableCell, "destinationPointForAnimation");
  v8 = v7;
  v9 = v6;
  if (v7 == CGPointZero.x && v6 == CGPointZero.y)
    goto LABEL_12;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController view](self, "view"));
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController scene](self, "scene"));
  v13 = objc_msgSend(v12, "isInExpandedEnvironment");

  if (v13)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1001E18D0;
    v46[3] = &unk_10051AA98;
    v46[4] = self;
    -[TransferMailboxPickerController animateMessageToPoint:inView:completion:](self, "animateMessageToPoint:inView:completion:", v5, v46, v8, v9);
    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerPalette messageThumbnailView](self->_pickerPalette, "messageThumbnailView"));

  if (!v14)
  {
LABEL_12:
    sub_1001DF7D8(self, 1);
    goto LABEL_14;
  }
  v15 = (UIView *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerPalette messageThumbnailView](self->_pickerPalette, "messageThumbnailView"));
  animatedView = self->_animatedView;
  self->_animatedView = v15;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_animatedView, "superview"));
  for (i = v17; ; i = (void *)v23)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "superview"));
    if (!v19)
      break;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "superview"));
    v21 = objc_opt_class(UIWindow);
    isKindOfClass = objc_opt_isKindOfClass(v20, v21);

    if ((isKindOfClass & 1) != 0)
      break;
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(i, "superview"));

  }
  -[UIView frame](self->_animatedView, "frame");
  objc_msgSend(i, "convertRect:fromView:", v17);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[UIView setFrame:](self->_animatedView, "setFrame:");
  objc_msgSend(i, "addSubview:", self->_animatedView);
  objc_msgSend(i, "convertPoint:fromView:", self->_tableCell, v8, v9);
  v33 = v32;
  v35 = v34;
  Mutable = CGPathCreateMutable();
  v37 = v27 + round(v31 * 0.5);
  CGPathMoveToPoint(Mutable, 0, v25 + round(v29 * 0.5), v37);
  CGPathAddQuadCurveToPoint(Mutable, 0, v33, v37, v33, v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animation](CAKeyframeAnimation, "animation"));
  objc_msgSend(v38, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v38, "setKeyTimes:", &off_100542238);
  objc_msgSend(v38, "setDuration:", UIAnimationDragCoefficient(objc_msgSend(v38, "setPath:", Mutable)) * 0.5);
  objc_msgSend(v38, "setCalculationMode:", kCAAnimationLinear);
  objc_msgSend(v38, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v38, "setRemovedOnCompletion:", 0);
  CGPathRelease(Mutable);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CAValueFunction functionWithName:](CAValueFunction, "functionWithName:", kCAValueFunctionRotateZ));
  objc_msgSend(v39, "setValueFunction:", v40);

  objc_msgSend(v39, "setFromValue:", &off_100542440);
  objc_msgSend(v39, "setDuration:", UIAnimationDragCoefficient(objc_msgSend(v39, "setToValue:", &off_100542460)) * 0.5);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v39, "setTimingFunction:", v41);

  objc_msgSend(v39, "setAdditive:", 1);
  objc_msgSend(v39, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v39, "setRemovedOnCompletion:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](CAAnimationGroup, "animation"));
  v47[0] = v38;
  v47[1] = v39;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));
  objc_msgSend(v42, "setAnimations:", v43);

  objc_msgSend(v42, "setDuration:", UIAnimationDragCoefficient(v44) * 0.5);
  objc_msgSend(v42, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v42, "setRemovedOnCompletion:", 0);
  objc_msgSend(v42, "setDelegate:", self);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_animatedView, "layer"));
  objc_msgSend(v45, "addAnimation:forKey:", v42, 0);

LABEL_14:
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[TransferMailboxPickerController messageAnimationDidStop](self, "messageAnimationDidStop", a3, a4);
}

- (void)messageAnimationDidStop
{
  void *v3;
  UIView *animatedView;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIView *v10;
  UIView *lastSuperview;
  void *v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t TableSelectionBackground;
  void *v20;
  UIImageView *v21;
  UIImageView *backstop;
  void *v23;
  void *v24;
  _QWORD *v25;
  _QWORD v26[6];
  unsigned __int8 v27;
  _QWORD v28[6];
  unsigned __int8 v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_animatedView, "layer"));
  objc_msgSend(v3, "removeAllAnimations");

  -[UIView removeFromSuperview](self->_animatedView, "removeFromSuperview");
  animatedView = self->_animatedView;
  self->_animatedView = 0;

  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_1004B402D;
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  v34 = v5;
  v35 = v5;
  -[MailboxTableCell frame](self->_tableCell, "frame");
  *(_QWORD *)&v34 = v6;
  *((_QWORD *)&v34 + 1) = v7;
  *(_QWORD *)&v35 = v8;
  *((_QWORD *)&v35 + 1) = v9;
  v10 = (UIView *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell superview](self->_tableCell, "superview"));
  lastSuperview = self->_lastSuperview;
  self->_lastSuperview = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController view](self, "view"));
  objc_msgSend(v12, "convertPoint:fromView:", self->_lastSuperview, v31[4], v31[5]);
  v13 = v31;
  *((_QWORD *)v31 + 4) = v14;
  *((_QWORD *)v13 + 5) = v15;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController traitCollection](self, "traitCollection"));
  v17 = objc_msgSend(v16, "mf_useSplitViewStyling");

  if ((v17 & 1) == 0)
  {
    v18 = objc_alloc((Class)UIImageView);
    TableSelectionBackground = UIImageGetTableSelectionBackground();
    v20 = (void *)objc_claimAutoreleasedReturnValue(TableSelectionBackground);
    v21 = (UIImageView *)objc_msgSend(v18, "initWithImage:", v20);
    backstop = self->_backstop;
    self->_backstop = v21;

    -[UIImageView setFrame:](self->_backstop, "setFrame:", v31[4], v31[5], v31[6], v31[7]);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController view](self, "view"));
    objc_msgSend(v23, "addSubview:", self->_backstop);

  }
  -[MailboxTableCell setSeparatorStyle:](self->_tableCell, "setSeparatorStyle:", 0);
  -[MailboxTableCell setFrame:](self->_tableCell, "setFrame:", v31[4], v31[5], v31[6], v31[7]);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController view](self, "view"));
  objc_msgSend(v24, "addSubview:", self->_tableCell);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001E1BA4;
  v28[3] = &unk_100523A50;
  v29 = v17;
  v28[4] = self;
  v28[5] = &v30;
  v25 = objc_retainBlock(v28);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001E1DE0;
  v26[3] = &unk_10051ACC0;
  v27 = v17;
  v26[4] = self;
  v26[5] = &v30;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v26, v25, UIAnimationDragCoefficient(v25) * 0.1);

  _Block_object_dispose(&v30, 8);
}

- (void)animateMessageToPoint:(CGPoint)a3 inView:(id)a4 completion:(id)a5
{
  double y;
  double x;
  void (**v9)(_QWORD);
  id WeakRetained;
  id v11;

  y = a3.y;
  x = a3.x;
  v11 = a4;
  v9 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "transferMailboxPickerController:animateMessageToPoint:inView:completion:") & 1) != 0)objc_msgSend(WeakRetained, "transferMailboxPickerController:animateMessageToPoint:inView:completion:", self, v11, v9, x, y);
  else
    v9[2](v9);

}

- (void)mailboxList:(id)a3 didSelectMailbox:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (!-[NSSet containsObject:](self->_sourceMailboxes, "containsObject:"))
  {
    if ((*((_BYTE *)self + 80) & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "representedAccount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("LastTransferAccount"));

    }
    sub_1001E1194(self, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail cellForMailbox:](self->_mailboxListController, "cellForMailbox:", v9));
    -[TransferMailboxPickerController animateMessageToCell:](self, "animateMessageToCell:", v8);

  }
}

- (void)accountList:(id)a3 didSelectAccount:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[MailboxListViewControllerMail setAccount:](self->_mailboxListController, "setAccount:", v6);
  -[TransferMailboxPickerController setAccount:](self, "setAccount:", v6);
  -[TransferMailboxPickerController updateTitle](self, "updateTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "splitViewController"));
  if (objc_msgSend(v7, "isCollapsed"))
  {
    objc_msgSend(v7, "showColumn:", 1);
  }
  else
  {
    -[MailboxListViewControllerMail viewWillAppear:](self->_mailboxListController, "viewWillAppear:", 0);
    -[MailboxListViewControllerMail viewDidAppear:](self->_mailboxListController, "viewDidAppear:", 0);
  }
  -[TransferMailboxPickerController restoreScrollOffset](self, "restoreScrollOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerController navigationController](self, "navigationController"));
  v9 = objc_opt_class(TransferNavigationController);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    objc_msgSend(v8, "updatePrompt");

}

- (void)accountList:(id)a3 didCancel:(BOOL)a4
{
  sub_1001DF7D8(self, 0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  MailboxListViewControllerMail *mailboxListController;
  void *v4;
  id v5;

  mailboxListController = self->_mailboxListController;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[MailboxListViewControllerMail filterMailboxesContainingText:](mailboxListController, "filterMailboxesContainingText:", v4);

}

- (id)willTransferMessages
{
  return self->_willTransferMessages;
}

- (void)setWillTransferMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (TransferMailboxPickerAnimationDelegate)animationDelegate
{
  return (TransferMailboxPickerAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animationDelegate, a3);
}

- (EMMailboxPrediction)mailboxPrediction
{
  return self->_mailboxPrediction;
}

- (void)setMailboxPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPrediction, a3);
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSSet)sourceAccounts
{
  return self->_sourceAccounts;
}

- (MailScene)scene
{
  return (MailScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (TransferMailboxContext)currentTransferContext
{
  return self->_currentTransferContext;
}

- (void)setCurrentTransferContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransferContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransferContext, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong(&self->_didFinish, 0);
  objc_storeStrong(&self->_willTransferMessages, 0);
  objc_storeStrong((id *)&self->_mailboxPrediction, 0);
  objc_storeStrong((id *)&self->_backstop, 0);
  objc_storeStrong((id *)&self->_lastSuperview, 0);
  objc_storeStrong((id *)&self->_animatedView, 0);
  objc_storeStrong((id *)&self->_pickerPalette, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
  objc_storeStrong((id *)&self->_screenshotGenerator, 0);
  objc_storeStrong((id *)&self->_mailboxListController, 0);
  objc_storeStrong((id *)&self->_sourceMailboxes, 0);
  objc_storeStrong((id *)&self->_sourceAccounts, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_senders, 0);
  objc_storeStrong((id *)&self->_sortedMessages, 0);
}

@end
