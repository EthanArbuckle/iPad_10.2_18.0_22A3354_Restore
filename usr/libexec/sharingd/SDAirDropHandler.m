@implementation SDAirDropHandler

- (SDAirDropHandler)init
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("%@ is not a valid initializer for %@"), v4, v8);

  return -[SDAirDropHandler initWithTransfer:](self, "initWithTransfer:", 0);
}

- (SDAirDropHandler)initWithTransfer:(id)a3
{
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](self, "initWithTransfer:bundleIdentifier:", a3, 0);
}

- (SDAirDropHandler)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  SDAirDropHandler *v8;
  SDAirDropHandler *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  char v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SDAirDropHandler;
  v8 = -[SDAirDropHandler init](&v24, "init");
  v9 = v8;
  if (!v8)
    goto LABEL_20;
  -[SDAirDropHandler setTransfer:](v8, "setTransfer:", v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metaData", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (!v9->_hasFiles)
          v9->_hasFiles = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "isFile");
        if (!v9->_hasLinks)
          v9->_hasLinks = objc_msgSend(v16, "isFile") ^ 1;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v13);
  }

  if (v7 && (SFRemovableSystemAppAvailable(v7) & 1) == 0)
  {
    if ((SFRemovableSystemAppAvailable(v7) & 1) != 0)
      goto LABEL_17;
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  v9->_handlingAppInstalled = v17;
LABEL_17:
  objc_storeStrong((id *)&v9->_handlingAppBundleID, a4);
  if (v7 && v9->_handlingAppInstalled)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleProxy bundleProxyForIdentifier:](LSBundleProxy, "bundleProxyForIdentifier:", v7));
    -[SDAirDropHandler setBundleProxy:](v9, "setBundleProxy:", v18);

  }
LABEL_20:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SDAirDropHandler isActivated](self, "isActivated"))
    -[SDAirDropHandler removeNotificationObservers](self, "removeNotificationObservers");
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandler;
  -[SDAirDropHandler dealloc](&v3, "dealloc");
}

- (void)activate
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[SDAirDropHandler transferTypes](self, "transferTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaData"));
  objc_msgSend(v5, "setTransferTypes:", v3);

  -[SDAirDropHandler addStatusMonitorObservers](self, "addStatusMonitorObservers");
  -[SDAirDropHandler setIsActivated:](self, "setIsActivated:", 1);
}

- (id)description
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  LSBundleProxy *bundleProxy;
  void *v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = 0;
  v3 = objc_opt_class(self, a2);
  NSAppendPrintF(&v15, "<%@ %{ptr}", v3, self);
  v4 = v15;
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer identifier](self->_transfer, "identifier"));
  NSAppendPrintF(&v14, ", transferIdentifier: %@", v5);
  v6 = v14;

  bundleProxy = self->_bundleProxy;
  if (bundleProxy)
  {
    v13 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LSBundleProxy bundleIdentifier](bundleProxy, "bundleIdentifier"));
    NSAppendPrintF(&v13, ", bundleProxy: %@", v8);
    v9 = v13;

    v6 = v9;
  }
  v12 = v6;
  NSAppendPrintF(&v12, ">");
  v10 = v12;

  return v10;
}

- (void)transferUpdated
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedAction"));

  if (v3)
  {
    -[SDAirDropHandler triggerSelectedActionIfAppropriate](self, "triggerSelectedActionIfAppropriate");
LABEL_8:
    v5 = v15;
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedAction"));
  if (v4)
  {

    v5 = v15;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "possibleActions"));
    v14 = objc_msgSend(v13, "count");

    v5 = v15;
    if (v14)
      goto LABEL_9;
  }
  v6 = (unint64_t)objc_msgSend(v5, "transferState");
  v5 = v15;
  if (v6 <= 9)
  {
    if (((1 << v6) & 0x25E) != 0)
    {
      -[SDAirDropHandler updatePossibleActions](self, "updatePossibleActions");
    }
    else
    {
      if (v6 != 7)
        goto LABEL_9;
      -[SDAirDropHandler prepareOrPerformOpenAction](self, "prepareOrPerformOpenAction");
    }
    goto LABEL_8;
  }
LABEL_9:
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "possibleActions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler cancelActionTitleToAccompanyActions:](self, "cancelActionTitleToAccompanyActions:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cancelAction"));
  objc_msgSend(v9, "setLocalizedTitle:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cancelAction"));
  objc_msgSend(v10, "setSingleItemLocalizedTitle:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler suitableContentsTitle](self, "suitableContentsTitle"));
  objc_msgSend(v15, "setContentsTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler suitableContentsDescription](self, "suitableContentsDescription"));
  objc_msgSend(v15, "setContentsDescription:", v12);

}

- (void)actionSelected:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cancelAction"));
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if (!v8)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "possibleActions"));

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v20, "isEqual:", v5))
          {
            v21 = v20;

            v17 = v21;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);

      if (v17)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        objc_msgSend(v22, "setSelectedAction:", v17);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        objc_msgSend(v23, "setPossibleActions:", 0);

        if (objc_msgSend(v17, "shouldUpdateUserResponse"))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
          v25 = objc_msgSend(v24, "userResponse");

          if (!v25)
          {
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_100013C80;
            v26[3] = &unk_1007142E0;
            v26[4] = self;
            -[SDAirDropHandler prepareForAcceptWithCompletion:](self, "prepareForAcceptWithCompletion:", v26);
          }
        }
        -[SDAirDropHandler triggerSelectedActionIfAppropriate](self, "triggerSelectedActionIfAppropriate");
        goto LABEL_19;
      }
    }
    else
    {

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAirDropHandler.m"), 221, CFSTR("Failed to find localAction for %@"), v5);
LABEL_19:

    goto LABEL_20;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cancelAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v11, "setSelectedAction:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v12, "setUserResponse:", 2);

LABEL_20:
}

- (void)triggerSelectedActionIfAppropriate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedAction"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v6 = objc_msgSend(v5, "transferState");
    v7 = objc_msgSend(v4, "minRequiredTransferState");

    if (v6 >= v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      v13 = objc_msgSend(v12, "transferState");
      v14 = objc_msgSend(v4, "maxTransferState");

      if (v13 > v14)
      {
        v16 = airdrop_log(v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 138412290;
          v30 = v4;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cannot trigger action %@ as it is past requirement", (uint8_t *)&v29, 0xCu);
        }

        v10 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        objc_msgSend((id)v10, "setSelectedAction:", 0);
        goto LABEL_17;
      }
      if (!objc_msgSend(v4, "requiresUnlockedUI")
        || (v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor")),
            v19 = objc_msgSend(v18, "deviceUIUnlocked"),
            v18,
            (v19 & 1) != 0))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        v22 = objc_msgSend(v21, "transferState");

        if (v22 == (id)4)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
          objc_msgSend(v24, "setTransferState:", 6);

        }
        v25 = airdrop_log(v23);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 138412290;
          v30 = v4;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Triggering action %@", (uint8_t *)&v29, 0xCu);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        objc_msgSend(v27, "setSelectedAction:", 0);

        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v4);
        goto LABEL_17;
      }
      v28 = airdrop_log(v20);
      v10 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = v4;
        v11 = "Delaying trigger of action %@ till UI unlock";
        goto LABEL_5;
      }
    }
    else
    {
      v9 = airdrop_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = v4;
        v11 = "Delaying trigger of action %@ till transferState reaches requirement";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v29, 0xCu);
      }
    }
LABEL_17:

  }
}

- (void)addStatusMonitorObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "lockStatusChanged:", CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);

}

- (void)removeNotificationObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  if (self->_hasLinks)
    return (32 * self->_hasFiles) | 0x2000000;
  else
    return 32 * self->_hasFiles;
}

- (NSString)suitableContentsTitle
{
  return (NSString *)SFLocalizedStringForKey(CFSTR("AirDrop"), a2);
}

- (NSString)suitableContentsDescription
{
  return (NSString *)&stru_10072FE60;
}

- (BOOL)canAutoAccept
{
  uint64_t v3;

  v3 = objc_opt_class(SDAirDropHandlerUnsupportedType, a2);
  return (objc_opt_isKindOfClass(self, v3) & 1) == 0;
}

- (BOOL)supportsAutoOpen
{
  return 1;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (NSString)singleItemActionTitle
{
  return (NSString *)SFLocalizedStringForKey(CFSTR("ACCEPT_BUTTON_TITLE"), a2);
}

- (NSString)defaultOpenActionBundleID
{
  return 0;
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  void *v3;
  char *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", a3));
  v4 = (char *)objc_msgSend(v3, "transferState");

  if ((unint64_t)(v4 - 1) > 6)
    v6 = CFSTR("OK_BUTTON_TITLE");
  else
    v6 = off_100714428[(_QWORD)(v4 - 1)];
  v7 = SFLocalizedStringForKey(v6, v5);
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

- (void)updatePossibleActions
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t v28;
  void (*v29)(id *);
  void *v30;
  id v31;
  id location;
  id v33;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cancelAction"));
  v5 = v4 == 0;

  if (v5)
  {
    v7 = SFLocalizedStringForKey(CFSTR("DECLINE_BUTTON_TITLE"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_alloc((Class)SFAirDropAction);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v12 = objc_msgSend(v9, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v11, CFSTR("SDCancelActionIdentifier"), v8, v8, 2);

    objc_msgSend(v12, "setMinRequiredTransferState:", 1);
    objc_msgSend(v12, "setMaxTransferState:", 4);
    objc_msgSend(v12, "setActionHandler:", &stru_100714320);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    objc_msgSend(v13, "setCancelAction:", v12);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  if (objc_msgSend(v14, "transferState") == (id)3)
  {
    v15 = 1;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v15 = objc_msgSend(v16, "transferState") == (id)9;

  }
  if ((SFRemovableSystemAppAvailable(self->_handlingAppBundleID) & 1) == 0)
  {
    if (self->_handlingAppBundleID)
      v17 = v15;
    else
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      v18 = objc_alloc((Class)SFAirDropAction);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForSystemPlaceholder:](LSApplicationProxy, "applicationProxyForSystemPlaceholder:", self->_handlingAppBundleID));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedName"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
      v24 = objc_msgSend(v18, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v20, CFSTR("SDUninstalledAppActionIdentifier"), v22, v23, 1);

      v27 = _NSConcreteStackBlock;
      v28 = 3221225472;
      v29 = sub_100014488;
      v30 = &unk_100714348;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v24, "setActionHandler:", &v27);
      v33 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1, v27, v28, v29, v30));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      objc_msgSend(v26, "setPossibleActions:", v25);

      objc_destroyWeak(&v31);
    }
  }
  objc_destroyWeak(&location);
}

- (void)prepareOrPerformOpenAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v3, "dockHasDownloadsFolder");

  if (+[SFAirDropUserDefaults_objc moveToAppEnabled](SFAirDropUserDefaults_objc, "moveToAppEnabled")&& (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultOpenActionBundleID](self, "defaultOpenActionBundleID")), v5, v5))
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler actionsForModernReadyForOpen](self, "actionsForModernReadyForOpen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    objc_msgSend(v6, "setPossibleActions:", v15);

  }
  else
  {
    v7 = SFLocalizedStringForKey(CFSTR("OPEN_BUTTON_TITLE"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_alloc((Class)SFAirDropAction);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v12 = objc_msgSend(v9, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v11, CFSTR("SDOpenActionIdentifier"), v8, v8, 3);

    objc_msgSend(v12, "setMinRequiredTransferState:", 7);
    objc_msgSend(v12, "setMaxTransferState:", 7);
    location = 0;
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000147E8;
    v16[3] = &unk_100714348;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "setActionHandler:", v16);
    v19 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    objc_msgSend(v14, "setPossibleActions:", v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

- (id)defaultFolder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "temporaryDirectory"));

  return v3;
}

+ (id)persistedTransfersBaseURL
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_10019BD30();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.AirDrop"), 1));

  return v4;
}

+ (id)transferURLForTransfer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "customDestinationURL"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "customDestinationURL"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandler persistedTransfersBaseURL](SDAirDropHandler, "persistedTransfersBaseURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1));

  }
  return v5;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  void (**v5)(id, SDAirDropHandlerImportResult *, _QWORD);
  id v6;
  SDAirDropHandlerImportResult *v7;

  v5 = (void (**)(id, SDAirDropHandlerImportResult *, _QWORD))a4;
  v6 = a3;
  v7 = objc_alloc_init(SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v7, "setImportedFiles:", v6);

  v5[2](v5, v7, 0);
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  void (**v6)(id, BOOL, _QWORD);

  v6 = (void (**)(id, BOOL, _QWORD))a4;
  v6[2](v6, -[SDAirDropHandler openURLs:](self, "openURLs:", a3), 0);

}

- (void)performOpenSharesheetActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014B1C;
  v8[3] = &unk_100714370;
  v9 = a4;
  v6 = v9;
  v7 = a3;
  -[SDAirDropHandler setMoveToShareSheetCompletion:](self, "setMoveToShareSheetCompletion:", v8);
  -[SDAirDropHandler launchMoveToAppShareSheetForFiles:](self, "launchMoveToAppShareSheetForFiles:", v7);

}

- (void)prepareForAcceptWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (id)actionsForModernReadyForOpen
{
  return &__NSArray0__struct;
}

- (void)performViewActionWithURLs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  -[SDAirDropHandler openURLs:](self, "openURLs:", v5, v6);
}

- (void)launchMoveToAppShareSheetForFiles:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;
  _TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = objc_msgSend(v5, "isFileURL");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completedURLs"));

    v4 = (id)v8;
  }
  if (objc_msgSend(v4, "count"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v9 = objc_alloc_init(_TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100014DC0;
    v16[3] = &unk_1007143C0;
    objc_copyWeak(&v17, &location);
    -[SDAirDropMoveToAppShareSheet showShareSheetWith:completion:](v9, "showShareSheetWith:completion:", v4, v16);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  else
  {
    v10 = airdrop_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000161FC();

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler moveToShareSheetCompletion](self, "moveToShareSheetCompletion"));
    if (v12)
    {
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler moveToShareSheetCompletion](self, "moveToShareSheetCompletion"));
      v13[2](v13, 0);

      -[SDAirDropHandler setMoveToShareSheetCompletion:](self, "setMoveToShareSheetCompletion:", 0);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));

    if (v14)
    {
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
      v15[2](v15, 0, 0, 1);

    }
  }

}

- (void)handleMoveToAppShareSheetCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v4)
  {
    -[SDAirDropHandler handleMoveToAppShareSheetSucceeded](self, "handleMoveToAppShareSheetSucceeded");
  }
  else
  {
    v8 = airdrop_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v10)
        sub_100016254((uint64_t)v7, v9, v11);
    }
    else if (v10)
    {
      sub_100016228();
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler moveToShareSheetCompletion](self, "moveToShareSheetCompletion"));

  if (v12)
  {
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler moveToShareSheetCompletion](self, "moveToShareSheetCompletion"));
    v13[2](v13, v4);

    -[SDAirDropHandler setMoveToShareSheetCompletion:](self, "setMoveToShareSheetCompletion:", 0);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));

  if (v14)
  {
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    v15[2](v15, 1, 0, 1);

  }
}

- (id)defaultActionForBundleProxy:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAirDropHandler.m"), 528, CFSTR("Cannot generate default action for nil bundleProxy"));

  }
  v6 = objc_alloc((Class)SFAirDropAction);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v12 = objc_msgSend(v6, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v8, v9, v10, v11, 1);

  return v12;
}

- (id)applicationProxyForBundleProxy:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v3));

  return v4;
}

- (BOOL)isJustFiles
{
  return self->_hasFiles && !self->_hasLinks;
}

- (BOOL)isJustLinks
{
  return !self->_hasFiles && self->_hasLinks;
}

- (BOOL)isModernProgress
{
  return +[SFAirDropUserDefaults_objc systemLevelProgressEnabled](SFAirDropUserDefaults_objc, "systemLevelProgressEnabled");
}

- (unint64_t)totalSharedItemsCount
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metaData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "count");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)alertMessageLocalizedKeyForTypeDicts:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  void *v15;

  v4 = a3;
  v6 = (void *)objc_opt_class(self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaData"));
  v9 = objc_msgSend(v8, "senderIsMe");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metaData"));
  v12 = objc_msgSend(v11, "isVerifiableIdentity");
  v13 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertMessageLocalizedKeyForTypeDicts:senderIsMe:isVerifiableIdentity:isModernProgress:transferState:", v4, v9, v12, v13, objc_msgSend(v14, "transferState")));

  return v15;
}

+ (id)alertMessageLocalizedKeyForTypeDicts:(id)a3 senderIsMe:(BOOL)a4 isVerifiableIdentity:(BOOL)a5 isModernProgress:(BOOL)a6 transferState:(unint64_t)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  id v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  id v29;
  BOOL v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const __CFString *v40;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (v7)
    v11 = CFSTR("MODERN_TRANSFER");
  else
    v11 = CFSTR("TRANSFER_FROM");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v11));
  v13 = airdrop_ui_log();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    if (v7)
      v15 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "isModernProgress: %@", buf, 0xCu);
  }

  v31 = v7;
  if (!v7)
  {
    if ((v8 & ~v9) != 0)
      v16 = CFSTR("_PERSON");
    else
      v16 = CFSTR("_DEVICE");
    objc_msgSend(v12, "appendString:", v16);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v10;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

        objc_msgSend(v12, "appendFormat:", CFSTR("_%@"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allValues"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));
        v26 = (uint64_t)objc_msgSend(v25, "integerValue");

        if (v26 <= 1)
          v27 = &stru_10072FE60;
        else
          v27 = CFSTR("_PLURAL");
        objc_msgSend(v12, "appendString:", v27);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v18);
  }

  if (!v31)
  {
    v28 = CFSTR("_IN_PROGRESS");
    switch(a7)
    {
      case 1uLL:
      case 3uLL:
        if (obj)
          goto LABEL_31;
        v28 = CFSTR("_CANCELED");
        break;
      case 2uLL:
        goto LABEL_26;
      case 4uLL:
      case 6uLL:
      case 8uLL:
        goto LABEL_31;
      case 7uLL:
        v28 = CFSTR("_COMPLETED");
        goto LABEL_26;
      default:
        if (obj)
          goto LABEL_31;
        v28 = CFSTR("_FAILED");
        break;
    }
    goto LABEL_26;
  }
  if (a7 - 2 <= 7)
  {
    v28 = CFSTR("_CAPITALIZED");
LABEL_26:
    objc_msgSend(v12, "appendString:", v28);
  }
LABEL_31:
  objc_msgSend(v12, "appendString:", CFSTR("_TEXT"));
  v29 = objc_msgSend(v12, "copy");

  return v29;
}

- (id)bundleProxyFromCandidateIdentifiers:(id)a3 handlesURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void ***v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void **v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  SDAirDropHandler *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLOverrideForURL:", v7));

  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1000157B8;
  v21 = &unk_1007143E8;
  v22 = v6;
  v23 = self;
  v10 = v6;
  v11 = objc_retainBlock(&v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace", v18, v19, v20, v21));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationsAvailableForOpeningURL:", v9));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = ((uint64_t (*)(void ***, void *))v11[2])(v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (NSString)senderName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metaData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderCompositeName"));

  v5 = SFTruncateAirDropSenderNameForUI(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" ")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR(" ")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", &stru_1007301C0, &stru_10072FE60));

  return (NSString *)v10;
}

- (void)logReceiverBundleID:(id)a3 forAppProxy:(id)a4 andURL:(id)a5
{
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a5;
  if (a4)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bundleIdentifier"));
    +[SDAirDropHandler logReceiverBundleID:forURL:](SDAirDropHandler, "logReceiverBundleID:forURL:", v7, v9);

    v8 = (void *)v7;
  }
  else
  {
    +[SDAirDropHandler logReceiverBundleID:forURL:](SDAirDropHandler, "logReceiverBundleID:forURL:", a3, v9);
    v8 = v9;
  }

}

+ (void)logReceiverBundleID:(id)a3 forURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = v5;
LABEL_3:
    if ((-[NSObject hasPrefix:](v8, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
    {

      v8 = CFSTR("3rd-party");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.airdrop.transfer.receiver.id."), v8));
    off_1007AFF48((uint64_t)v9, 1);

    goto LABEL_10;
  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationsAvailableForOpeningURL:", v7));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationIdentifier"));

    if (v8)
      goto LABEL_3;
  }
  v13 = airdrop_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000162C0();
LABEL_10:

}

- (void)removeItemAtURLToFreeUpSpace:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    v8 = airdrop_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000162EC(v3, v9);

  }
}

- (BOOL)openURLs:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  id v21;
  id v22;
  SDAirDropHandler *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  unsigned int v38;
  id v39;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  SDAirDropHandler *v49;
  NSObject *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (!v8)
  {
    v17 = airdrop_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100016378();
    v19 = 0;
    goto LABEL_38;
  }
  v49 = self;
  v9 = airdrop_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      v12 = SFCompactStringFromCollection(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v58 = v13;
      v59 = 2112;
      v60 = v7;
      v14 = "Opening URLs: %@ in %@";
      v15 = v10;
      v16 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);

    }
  }
  else if (v11)
  {
    v20 = SFCompactStringFromCollection(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 138412290;
    v58 = v13;
    v14 = "Opening URLs: %@";
    v15 = v10;
    v16 = 12;
    goto LABEL_10;
  }
  v45 = v7;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v18 = v6;
  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v21)
  {
    v22 = v21;
    v44 = v6;
    v50 = v18;
    v51 = *(_QWORD *)v53;
    v23 = v49;
    while (1)
    {
      v24 = 0;
      v48 = v22;
      do
      {
        if (*(_QWORD *)v53 != v51)
          objc_enumerationMutation(v18);
        v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lowercaseString"));
        if ((objc_msgSend(v27, "isEqualToString:", CFSTR("voicememos")) & 1) != 0)
          goto LABEL_25;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lowercaseString"));
        if ((objc_msgSend(v29, "isEqualToString:", CFSTR("photos")) & 1) != 0)
          goto LABEL_24;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lowercaseString"));
        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("x-apple-calevent")) & 1) != 0)
          goto LABEL_23;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lowercaseString"));
        if ((objc_msgSend(v33, "isEqualToString:", CFSTR("shoebox")) & 1) != 0)
          goto LABEL_22;
        v47 = v32;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "lowercaseString"));
        if ((objc_msgSend(v34, "isEqualToString:", CFSTR("stocks")) & 1) != 0)
        {

          v32 = v47;
LABEL_22:

          v22 = v48;
          v23 = v49;
LABEL_23:

          v18 = v50;
LABEL_24:

LABEL_25:
LABEL_26:
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          v36 = objc_msgSend(v35, "openSensitiveURL:withOptions:", v25, 0);

          if ((v36 & 1) == 0)
            goto LABEL_34;
          goto LABEL_27;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scheme"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lowercaseString"));
        v43 = objc_msgSend(v41, "isEqualToString:", CFSTR("mobilephone"));

        v23 = v49;
        v18 = v50;
        v22 = v48;
        if ((v43 & 1) != 0)
          goto LABEL_26;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v38 = objc_msgSend(v37, "openURL:withOptions:", v25, 0);

        if (!v38)
        {
LABEL_34:
          v19 = 0;
          goto LABEL_35;
        }
LABEL_27:
        -[SDAirDropHandler logReceiverBundleID:forAppProxy:andURL:](v23, "logReceiverBundleID:forAppProxy:andURL:", 0, 0, v25);
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      v22 = v39;
      v19 = 1;
      if (!v39)
      {
LABEL_35:
        v6 = v44;
        goto LABEL_37;
      }
    }
  }
  v19 = 0;
LABEL_37:
  v7 = v45;
LABEL_38:

  return v19;
}

- (BOOL)openURLs:(id)a3
{
  return -[SDAirDropHandler openURLs:bundleIdentifier:](self, "openURLs:bundleIdentifier:", a3, 0);
}

- (SFAirDropTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_transfer, a3);
}

- (id)updateTransferStateHandler
{
  return self->_updateTransferStateHandler;
}

- (void)setUpdateTransferStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasFiles
{
  return self->_hasFiles;
}

- (BOOL)hasLinks
{
  return self->_hasLinks;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (id)moveToShareSheetCompletion
{
  return self->_moveToShareSheetCompletion;
}

- (void)setMoveToShareSheetCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LSBundleProxy)bundleProxy
{
  return self->_bundleProxy;
}

- (void)setBundleProxy:(id)a3
{
  objc_storeStrong((id *)&self->_bundleProxy, a3);
}

- (BOOL)handlingAppInstalled
{
  return self->_handlingAppInstalled;
}

- (void)setHandlingAppInstalled:(BOOL)a3
{
  self->_handlingAppInstalled = a3;
}

- (NSString)handlingAppBundleID
{
  return self->_handlingAppBundleID;
}

- (void)setHandlingAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_handlingAppBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlingAppBundleID, 0);
  objc_storeStrong((id *)&self->_bundleProxy, 0);
  objc_storeStrong(&self->_moveToShareSheetCompletion, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateTransferStateHandler, 0);
  objc_storeStrong((id *)&self->_transfer, 0);
}

@end
