@implementation TPSTipsByCollectionViewController

- (void)setContentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentDelegate, a3);
}

- (BOOL)pendingContentUpdate
{
  return self->_pendingTipID || self->_pendingCollectionID != 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  objc_msgSend(v3, "removeDelegate:", self);

  v4.receiver = self;
  v4.super_class = (Class)TPSTipsByCollectionViewController;
  -[TPSTipsViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSTipsByCollectionViewController;
  -[TPSTipsViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  if ((objc_msgSend(v4, "contentHasLoaded") & 1) == 0)
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  if (!objc_msgSend(v5, "count"))
  {

LABEL_6:
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionView](self, "collectionView"));
  v7 = objc_msgSend(v6, "isHidden");

  if (v7)
    -[TPSTipsViewController removeInlineMessageLabel](self, "removeInlineMessageLabel");
LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  objc_msgSend(v8, "addDelegate:", self);

  -[TPSTipsByCollectionViewController updateContent](self, "updateContent");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSTipsByCollectionViewController;
  -[TPSTipsViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  objc_msgSend(v4, "removeDelegate:", self);

}

- (void)setPendingReload:(BOOL)a3
{
  if (self->_pendingReload != a3)
  {
    self->_pendingReload = a3;
    -[TPSTipsByCollectionViewController reloadContentIfNeeded](self, "reloadContentIfNeeded");
  }
}

- (void)reloadContentIfNeeded
{
  if (-[TPSTipsByCollectionViewController pendingReload](self, "pendingReload"))
  {
    if (-[TPSAppViewController viewWillAppear](self, "viewWillAppear"))
    {
      -[TPSTipsByCollectionViewController updateTipsForCurrentCollection](self, "updateTipsForCurrentCollection");
      -[TPSTipsByCollectionViewController setPendingReload:](self, "setPendingReload:", 0);
    }
  }
}

- (void)updateContent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collections"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
LABEL_2:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    -[TPSTipsByCollectionViewController appControllerContentUpdated:](self, "appControllerContentUpdated:", v6);

LABEL_3:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    -[TPSTipsByCollectionViewController appController:loadingContent:](self, "appController:loadingContent:", v7, 0);

    -[TPSTipsByCollectionViewController reloadContentIfNeeded](self, "reloadContentIfNeeded");
    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  v9 = objc_msgSend(v8, "updatingContent");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  v12 = v10;
  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "featuredCollection"));

    if (!v11)
      goto LABEL_3;
    goto LABEL_2;
  }
  -[TPSTipsByCollectionViewController appController:loadingContent:](self, "appController:loadingContent:", v10, 1);

}

- (void)updateTipsForCurrentCollection
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[TPSTipsByCollectionViewController resetTips](self, "resetTips");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tipForIdentifier:", v12));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    }
    -[TPSTipsViewController setCurrentTip:](self, "setCurrentTip:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
    -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", v9);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v11 = objc_msgSend(v10, "updatingContent");

    if ((v11 & 1) == 0)
      -[TPSTipsByCollectionViewController showError](self, "showError");
  }
}

- (void)showError
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  v4 = objc_msgSend(v3, "updatingContent");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastFetchError"));

    if (v6)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastFetchError"));
      -[TPSViewController showInlineMessageForError:](self, "showInlineMessageForError:", v7);

    }
    else
    {
      -[TPSViewController showInlineGenericErrorMessage](self, "showInlineGenericErrorMessage");
    }
  }
}

- (void)updateWithCollectionID:(id)a3 tipID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSString *v14;
  NSString *pendingTipID;
  void *v16;
  void *v17;
  unsigned int v18;
  char v19;
  id v20;
  NSString *currentCollectionFirstTipID;
  void *v22;
  NSString *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  NSString *pendingCollectionID;
  NSString *v40;
  NSString *v41;
  NSString *v42;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionIdentifierForTipIdentifier:", v7));

    v6 = (id)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionForIdentifier:", v6));

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Unknown")) & 1) == 0)
    -[TPSTipsByCollectionViewController updateTitleTextForCollection:](self, "updateTitleTextForCollection:", v11);
  if (!-[TPSAppViewController viewWillAppear](self, "viewWillAppear"))
  {
    objc_storeStrong((id *)&self->_pendingCollectionID, v6);
    v14 = (NSString *)v7;
    pendingTipID = self->_pendingTipID;
    self->_pendingTipID = v14;
    v42 = (NSString *)v6;
LABEL_46:

    goto LABEL_47;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  if ((objc_msgSend(v12, "updatingContent") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v13 = objc_msgSend(v16, "contentHasLoaded");

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  v18 = objc_msgSend(v17, "isEqualToString:", v6);

  if ((v18 & 1) == 0)
  {
    if (v11)
      v19 = 1;
    else
      v19 = v13;
    v20 = v6;
    if ((v19 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_pendingCollectionID, v6);
      v20 = 0;
    }
    -[TPSTipsViewController setCollectionID:](self, "setCollectionID:", v20);
    currentCollectionFirstTipID = self->_currentCollectionFirstTipID;
    self->_currentCollectionFirstTipID = 0;

    -[TPSTipsViewController setCurrentTip:](self, "setCurrentTip:", 0);
  }
  if (v13)
    -[TPSTipsViewController removeInlineMessageLabel](self, "removeInlineMessageLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {

    goto LABEL_26;
  }
  if (!v18)
  {

    goto LABEL_25;
  }
  v23 = self->_pendingTipID;

  if (v23)
LABEL_25:
    -[TPSTipsByCollectionViewController updateTipsForCurrentCollection](self, "updateTipsForCurrentCollection");
LABEL_26:
  v24 = objc_msgSend(v7, "length");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v26 = v25;
  if (v24)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
    v28 = objc_msgSend(v27, "isEqualToString:", v7);

    if ((v28 & 1) != 0)
      goto LABEL_36;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tipForTipID:](self, "tipForTipID:", v7));
    if (!v29)
    {
      objc_storeStrong((id *)&self->_pendingTipID, a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
      v31 = objc_msgSend(v30, "count");

      if (!v31)
        -[TPSViewController setLoading:](self, "setLoading:", 1);
      goto LABEL_35;
    }
LABEL_34:
    -[TPSTipsViewController setCurrentTip:](self, "setCurrentTip:", v29);
LABEL_35:

    goto LABEL_36;
  }
  if (!v25
    || (v32 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips")),
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip")),
        v34 = objc_msgSend(v32, "indexOfObject:", v33),
        v33,
        v32,
        v26,
        v34 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));

    goto LABEL_34;
  }
LABEL_36:
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", v36);

  -[TPSTipsViewController ensureCurrentTipVisible](self, "ensureCurrentTipVisible");
  v37 = (NSString *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  if (v37)
  {
LABEL_41:

    goto LABEL_42;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  if (objc_msgSend(v38, "count"))
    v13 = 0;

  if (v13 == 1)
  {
    pendingCollectionID = self->_pendingCollectionID;
    self->_pendingCollectionID = 0;

    v37 = self->_pendingTipID;
    self->_pendingTipID = 0;
    goto LABEL_41;
  }
LABEL_42:
  v40 = (NSString *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  v41 = v40;
  if (!v40)
    v41 = self->_pendingCollectionID;
  v42 = v41;

  if (!-[NSString isEqualToString:](v42, "isEqualToString:", CFSTR("Unknown")))
  {
    pendingTipID = (NSString *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    -[NSString collectionIdentifierViewed:](pendingTipID, "collectionIdentifierViewed:", v42);
    goto LABEL_46;
  }
LABEL_47:

}

- (id)collectionIDForTipID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipForIdentifier:", self->_pendingTipID));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIdentifierToUseForCollectionIdentifiers:", v7));

  return v8;
}

- (void)appControllerContentUpdated:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *currentCollectionFirstTipID;
  NSString **p_pendingTipID;
  BOOL v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *pendingCollectionID;
  NSString *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;

  v21 = self->_currentCollectionFirstTipID;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  currentCollectionFirstTipID = self->_currentCollectionFirstTipID;
  self->_currentCollectionFirstTipID = v6;

  p_pendingTipID = &self->_pendingTipID;
  if (self->_pendingTipID)
    v9 = 1;
  else
    v9 = v21 == 0;
  if (!v9 && !-[NSString isEqualToString:](v21, "isEqualToString:", self->_currentCollectionFirstTipID))
    objc_storeStrong((id *)&self->_pendingTipID, self->_currentCollectionFirstTipID);
  if (-[NSString isEqualToString:](self->_pendingCollectionID, "isEqualToString:", CFSTR("Unknown")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));

    if (!v10)
    {
      v11 = *p_pendingTipID;
      v12 = *p_pendingTipID;
      if (!*p_pendingTipID)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
        v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      }
      v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[TPSTipsByCollectionViewController collectionIDForTipID:](self, "collectionIDForTipID:", v12));
      pendingCollectionID = self->_pendingCollectionID;
      self->_pendingCollectionID = v13;

      if (!v11)
      {

      }
    }
  }
  v15 = self->_pendingCollectionID;
  if (!*p_pendingTipID)
  {
    if (!v15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
      v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "collectionForIdentifier:", v20));

      -[TPSTipsByCollectionViewController updateTitleTextForCollection:](self, "updateTitleTextForCollection:", v18);
      -[TPSTipsByCollectionViewController updateTipsForCurrentCollection](self, "updateTipsForCurrentCollection");
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v15)
  {
LABEL_17:
    -[TPSTipsByCollectionViewController updateWithCollectionID:tipID:](self, "updateWithCollectionID:tipID:");
    goto LABEL_18;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  -[TPSTipsByCollectionViewController updateWithCollectionID:tipID:](self, "updateWithCollectionID:tipID:", v16, *p_pendingTipID);

LABEL_18:
  v17 = *p_pendingTipID;
  *p_pendingTipID = 0;

  v18 = self->_pendingCollectionID;
  self->_pendingCollectionID = 0;
LABEL_19:

}

- (void)updateTitleTextForCollection:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortTitle"));
  if (!v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    if (v5)
      v4 = (__CFString *)v5;
    else
      v4 = &stru_1000A5680;
  }
  -[TPSTipsViewController setTitleText:](self, "setTitleText:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController titleText](self, "titleText"));
  -[TPSTipsViewController updateNavigationTitle:](self, "updateNavigationTitle:", v6);

}

- (void)appController:(id)a3 loadingContent:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSString *pendingTipID;
  NSString *pendingCollectionID;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  if (a4)
  {
    -[TPSTipsViewController removeInlineMessageLabel](self, "removeInlineMessageLabel", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      -[TPSViewController setLoading:](self, "setLoading:", 1);
  }
  else
  {
    -[TPSViewController setLoading:](self, "setLoading:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[TPSTipsViewController removeInlineMessageLabel](self, "removeInlineMessageLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
      -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", v9);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastFetchError"));

      -[TPSViewController showInlineMessageForError:](self, "showInlineMessageForError:", v9);
      v11 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
        v15 = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tips feed %@ load failed with error %@", (uint8_t *)&v15, 0x16u);

      }
    }

    pendingTipID = self->_pendingTipID;
    self->_pendingTipID = 0;

    pendingCollectionID = self->_pendingCollectionID;
    self->_pendingCollectionID = 0;

  }
}

- (void)resetTips
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *currentCollectionFirstTipID;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  if (-[NSString length](self->_pendingCollectionID, "length")
    && !-[NSString isEqualToString:](self->_pendingCollectionID, "isEqualToString:", CFSTR("Unknown")))
  {
    v3 = self->_pendingCollectionID;
  }
  else
  {
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  }
  v10 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsByCollectionViewController contentDelegate](self, "contentDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipsByCollectionViewController:tipsForCollectionID:", self, v10));

  if (v5)
  {
    currentCollectionFirstTipID = self->_currentCollectionFirstTipID;
    self->_currentCollectionFirstTipID = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tipsForCollectionIdentifier:", v10));

    if (self->_currentCollectionFirstTipID)
      goto LABEL_9;
    currentCollectionFirstTipID = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString identifier](currentCollectionFirstTipID, "identifier"));
    v9 = self->_currentCollectionFirstTipID;
    self->_currentCollectionFirstTipID = v8;

  }
LABEL_9:
  -[TPSTipsViewController setTips:](self, "setTips:", v5);

}

- (BOOL)skipIntro
{
  return self->_skipIntro;
}

- (void)setSkipIntro:(BOOL)a3
{
  self->_skipIntro = a3;
}

- (BOOL)pendingReload
{
  return self->_pendingReload;
}

- (TPSTipsByCollectionViewControllerDelegate)contentDelegate
{
  return (TPSTipsByCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_contentDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentDelegate);
  objc_storeStrong((id *)&self->_pendingTipID, 0);
  objc_storeStrong((id *)&self->_pendingCollectionID, 0);
  objc_storeStrong((id *)&self->_currentCollectionFirstTipID, 0);
}

@end
