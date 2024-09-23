@implementation MFMailDebugUnreadIssueViewController

+ (id)title
{
  return CFSTR("Unread Issue");
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailDebugUnreadIssueViewController;
  -[MFMailDebugUnreadIssueViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugUnreadIssueViewController view](self, "view"));
  v4 = objc_alloc((Class)UITextView);
  objc_msgSend(v3, "frame");
  v5 = objc_msgSend(v4, "initWithFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setEditable:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  -[MFMailDebugUnreadIssueViewController setTextView:](self, "setTextView:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailDebugUnreadIssueViewController;
  -[MFMailDebugUnreadIssueViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[MFMailDebugUnreadIssueViewController _loadUnreadDebugInformation](self, "_loadUnreadDebugInformation");
}

- (void)selectAll:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugUnreadIssueViewController textView](self, "textView"));
  objc_msgSend(v4, "selectAll:", v5);

}

- (void)_loadUnreadDebugInformation
{
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugUnreadIssueViewController textView](self, "textView"));
  objc_msgSend(v3, "setText:", CFSTR("fetching unread debug informations... be patient."));

  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  v6 = objc_alloc_init((Class)NSMutableString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugUnreadIssueViewController _badgeCount](self, "_badgeCount"));
  objc_msgSend(v6, "appendFormat:", CFSTR("%@\n\n"), v7);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017539C;
  block[3] = &unk_10051B9A0;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_async(v5, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (id)_accountInformationFromAccounts:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v12 = a3;
  v3 = objc_alloc_init((Class)NSMutableString);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = v12;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueID"));
        if (objc_msgSend(v7, "isActive"))
          v10 = CFSTR("active");
        else
          v10 = CFSTR("inactive");
        objc_msgSend(v3, "appendFormat:", CFSTR("\n%@ : %@ - %@"), v8, v9, v10);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "insertString:atIndex:", CFSTR("Accounts Information:"), 0);
  }
  else
  {

    v3 = 0;
  }

  return v3;
}

- (id)_accountUnreadCountFromAccounts:(id)a3
{
  id v3;
  id v4;
  void *i;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  id obj;
  void *v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v18 = a3;
  v3 = objc_alloc_init((Class)NSMutableString);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v18;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v4)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = v4;
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isActive"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allMailboxUids"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
          objc_msgSend(v3, "appendFormat:", CFSTR("%@:"), v7);

          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v8 = v20;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(_QWORD *)v24 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v12, "isSpecialMailboxUid"))
                  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayNameUsingSpecialNames"));
                else
                  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
                v14 = (void *)v13;
                v15 = objc_msgSend(v12, "unreadCount");
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueId"));
                objc_msgSend(v3, "appendFormat:", CFSTR("\n - %@ (%lu) %@"), v14, v15, v16, v18);

              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v9);
          }

          objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "insertString:atIndex:", CFSTR("Accounts (unread):\n"), 0);
  }
  else
  {

    v3 = 0;
  }

  return v3;
}

- (id)_badgeCount
{
  void *v4;
  void *v5;
  void *v7;

  if (pthread_main_np() != 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailDebugUnreadIssueViewController.m"), 128, CFSTR("Current thread must be main"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Badge Count: %li"), objc_msgSend(v4, "applicationIconBadgeNumber")));

  return v5;
}

- (id)_mailboxUnreadCountInformations
{
  id v4;
  void *v5;
  void *v6;
  void *v8;

  if (pthread_main_np())
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailDebugUnreadIssueViewController.m"), 133, CFSTR("Current thread is main"));

  }
  v4 = objc_alloc_init((Class)NSMutableString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromAllMailboxUnreadCount"));
  objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v6);

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("Mailbox Unread Count Informations from DB:\n"), 0);
  }
  else
  {

    v4 = 0;
  }

  return v4;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
