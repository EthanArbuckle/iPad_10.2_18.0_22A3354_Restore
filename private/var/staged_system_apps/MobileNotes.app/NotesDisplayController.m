@implementation NotesDisplayController

- (id)webView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteHTMLEditorView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webView"));

  return v4;
}

- (void)stopTextFinding
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_findInteraction"));
  v5 = objc_msgSend(v4, "isFindNavigatorVisible");

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_findInteraction"));
    objc_msgSend(v6, "dismissFindNavigator");

  }
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerManager, a3);
}

- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3
{
  self->_splitViewExpandingOrCollapsing = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NotesDisplayController)initWithArchivedConfiguration:(id)a3
{
  id v4;
  NotesDisplayController *v5;
  void *v6;
  NSString *v7;
  CGPoint v8;
  uint64_t v9;
  NSNumber *pendingArchivedNoteID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NotesDisplayController;
  v5 = -[NotesDisplayController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsEditing")));
    v5->_pendingArchivedEditingState = objc_msgSend(v6, "BOOLValue");

    v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContentOffset")));
    v8 = CGPointFromString(v7);

    v5->_pendingArchivedContentOffset = v8;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NoteRecordId")));
    pendingArchivedNoteID = v5->_pendingArchivedNoteID;
    v5->_pendingArchivedNoteID = (NSNumber *)v9;

    -[NotesDisplayController registerTraitChanges](v5, "registerTraitChanges");
  }

  return v5;
}

- (NoteContentLayer)contentLayer
{
  return self->_contentLayer;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[8];
  _QWORD v9[8];

  v8[0] = &off_10057C400;
  v8[1] = &off_10057C418;
  v9[0] = &off_10057C418;
  v9[1] = &off_10057C430;
  v8[2] = &off_10057C430;
  v8[3] = &off_10057C448;
  v9[2] = &off_10057C448;
  v9[3] = &off_10057C460;
  v8[4] = &off_10057C478;
  v8[5] = &off_10057C460;
  v9[4] = &off_10057C490;
  v9[5] = &off_10057C4A8;
  v8[6] = &off_10057C490;
  v8[7] = &off_10057C4A8;
  v9[6] = &off_10057C4C0;
  v9[7] = &off_10057C4D8;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 8));
  v3 = (void *)qword_1005DDF90;
  qword_1005DDF90 = v2;

  v6[0] = &off_10057C478;
  v6[1] = &off_10057C460;
  v7[0] = &off_10057C4D8;
  v7[1] = &off_10057C4F0;
  v6[2] = &off_10057C490;
  v6[3] = &off_10057C4A8;
  v7[2] = &off_10057C508;
  v7[3] = &off_10057C520;
  v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 4));
  v5 = (void *)qword_1005DDF98;
  qword_1005DDF98 = v4;

}

- (void)registerTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD v8[2];

  objc_initWeak(&location, self);
  v8[0] = objc_opt_class(UITraitHorizontalSizeClass);
  v8[1] = objc_opt_class(UITraitVerticalSizeClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E945C;
  v5[3] = &unk_100550500;
  objc_copyWeak(&v6, &location);
  v4 = -[NotesDisplayController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  if (-[NotesDisplayController canProvideNote](self, "canProvideNote"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contextManager](self, "contextManager"));
    objc_msgSend(v4, "removeContextProvider:", self);

    -[NotesDisplayController invalidateNoteUserActivity](self, "invalidateNoteUserActivity");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "contentIDURL"));
        +[NotesCIDURLProtocol unregisterDataProviderForCIDURL:](NotesCIDURLProtocol, "unregisterDataProviderForCIDURL:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NoteContentLayer setDelegate:](self->_contentLayer, "setDelegate:", 0);
  -[NoteContentLayer setAttachmentPresentationDelegate:](self->_contentLayer, "setAttachmentPresentationDelegate:", 0);
  -[UIPresentationController setDelegate:](self->_activityPresentationController, "setDelegate:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_pickerController, "popoverPresentationController"));
  objc_msgSend(v11, "setDelegate:", 0);

  v12.receiver = self;
  v12.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController dealloc](&v12, "dealloc");
}

- (void)invalidateAutosaveTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController autosaveTimer](self, "autosaveTimer"));
  objc_msgSend(v3, "invalidate");

  -[NotesDisplayController setAutosaveTimer:](self, "setAutosaveTimer:", 0);
}

- (void)resetAutosaveTimer
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController autosaveTimer](self, "autosaveTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController autosaveTimer](self, "autosaveTimer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
    objc_msgSend(v6, "setFireDate:", v5);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "autosaveTimerFired:", 0, 0, 2.0));
    -[NotesDisplayController setAutosaveTimer:](self, "setAutosaveTimer:");
  }

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[NotesDisplayController isEditing](self, "isEditing"))
    -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  -[NotesDisplayController stopTextFinding](self, "stopTextFinding");
  -[NotesDisplayController setNote:](self, "setNote:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteHTMLEditorView"));
  objc_msgSend(v4, "stopEditing");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v5, "setTracksMaximumContentLength:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v6, "setContent:isPlainText:attachments:", &stru_1005704B8, 0, 0);

  -[NotesDisplayController setDisplayedNoteVersionTimestamp:](self, "setDisplayedNoteVersionTimestamp:", 0);
  -[NotesDisplayController setDisplayedNoteVersionObjectID:](self, "setDisplayedNoteVersionObjectID:", 0);
  -[NotesDisplayController invalidateAutosaveTimer](self, "invalidateAutosaveTimer");
  -[NotesDisplayController setContentHasUnsavedChanges:](self, "setContentHasUnsavedChanges:", 0);
}

- (void)significantTimeChange
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController autosaveTimer](self, "autosaveTimer"));

  if (v3)
    -[NotesDisplayController resetAutosaveTimer](self, "resetAutosaveTimer");
}

- (void)updateDate
{
  void *v3;
  void *v4;
  id v5;

  if (-[NotesDisplayController contentHasUnsavedChanges](self, "contentHasUnsavedChanges"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modificationDate"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v4, "setTimestampDate:", v5);

}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deletePresentationController](self, "deletePresentationController", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deletePresentationController](self, "deletePresentationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentingViewController"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E99C0;
    v7[3] = &unk_100550110;
    v7[4] = self;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, v7);

  }
}

- (void)_userFontSizeUpdated:(id)a3
{
  -[NotesDisplayController reloadContentLayer](self, "reloadContentLayer", a3);
}

- (void)copyNoteHTMLToPasteboard
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v2, "copyNoteHTMLToPasteboard");

}

- (BOOL)noteMatchesDisplayedContent:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[NotesDisplayController contentHasUnsavedChanges](self, "contentHasUnsavedChanges"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController displayedNoteVersionObjectID](self, "displayedNoteVersionObjectID"));
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modificationDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController displayedNoteVersionTimestamp](self, "displayedNoteVersionTimestamp"));
      v5 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)captureDisplayedNoteVersion
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectID"));
  -[NotesDisplayController setDisplayedNoteVersionObjectID:](self, "setDisplayedNoteVersionObjectID:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modificationDate"));
  -[NotesDisplayController setDisplayedNoteVersionTimestamp:](self, "setDisplayedNoteVersionTimestamp:", v5);

}

- (void)setNote:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NoteObject **p_note;
  NoteObject *note;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NoteObject *obj;

  v4 = a3;
  v5 = objc_opt_class(NoteObject);
  v6 = ICCheckedDynamicCast(v5, v4);
  obj = (NoteObject *)objc_claimAutoreleasedReturnValue(v6);

  p_note = &self->_note;
  note = self->_note;
  if (note != obj && note != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
      objc_msgSend(v12, "submitNoteViewEventForHTMLNote:", *p_note);

    }
  }
  objc_storeStrong((id *)&self->_note, obj);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject store](obj, "store"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));

  if (v14)
    v15 = objc_msgSend(v14, "preventMovingNotesToOtherAccounts");
  else
    v15 = 0;
  -[NotesDisplayController setNoteIsManaged:](self, "setNoteIsManaged:", v15);
  if (*p_note)
  {
    v16 = -[NotesDisplayController allowsAttachments](self, "allowsAttachments");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v17, "setAllowsAttachments:", v16);

  }
  -[NotesDisplayController invalidateNoteUserActivity](self, "invalidateNoteUserActivity");
  if (obj)
    -[NotesDisplayController updateUserActivityStatus](self, "updateUserActivityStatus");
  if (note != obj)
  {
    if (*p_note)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
        objc_msgSend(v20, "startNoteViewEventDurationTrackingForHTMLNote:", *p_note);

      }
    }
  }
  -[NotesDisplayController stopTextFinding](self, "stopTextFinding");
  -[NotesDisplayController updateViewAnnotation](self, "updateViewAnnotation");

}

- (void)updateNote:(id)a3
{
  void *v4;
  id v5;

  -[NotesDisplayController setNote:](self, "setNote:", a3);
  -[NotesDisplayController setContentHasUnsavedChanges:](self, "setContentHasUnsavedChanges:", 1);
  -[NotesDisplayController updateNoteFromInterface](self, "updateNoteFromInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate ic_modificationDateForNoteBeingEdited](NSDate, "ic_modificationDateForNoteBeingEdited"));
  objc_msgSend(v5, "setModificationDate:", v4);

}

- (void)displayNote:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  if (v4 == v10)
  {

  }
  else
  {
    v5 = +[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");

    if ((v5 & 1) == 0)
    {
      if (-[NotesDisplayController noteMatchesDisplayedContent:](self, "noteMatchesDisplayedContent:", v10))
      {
        -[NotesDisplayController setNote:](self, "setNote:", v10);
      }
      else
      {
        -[NotesDisplayController stopTextFinding](self, "stopTextFinding");
        if (-[NotesDisplayController isEditing](self, "isEditing"))
          -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 0);
        -[NotesDisplayController setNote:](self, "setNote:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
        objc_msgSend(v8, "scrollToTopAnimated:", 0);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
        if (v9)
          -[NotesDisplayController setContentFromNote](self, "setContentFromNote");
        else
          -[NotesDisplayController setDidSetContentFromNote:](self, "setDidSetContentFromNote:", 0);
        -[NotesDisplayController captureDisplayedNoteVersion](self, "captureDisplayedNoteVersion");
        -[NotesDisplayController updateDate](self, "updateDate");
        -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
        -[NotesDisplayController updateNoteProviderStatus](self, "updateNoteProviderStatus");
        -[NotesDisplayController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
      }
      goto LABEL_16;
    }
  }
  v6 = v10;
  if (!v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));

    if (v7)
    {
      -[NotesDisplayController setContentFromNote](self, "setContentFromNote");
      -[NotesDisplayController updateDate](self, "updateDate");
    }
    else
    {
      -[NotesDisplayController setDidSetContentFromNote:](self, "setDidSetContentFromNote:", 0);
    }
LABEL_16:
    v6 = v10;
  }

}

- (void)updateNoteTitle
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  objc_msgSend(v4, "setTitle:", v5);

}

- (void)updateNoteFromInterface
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  id v26;
  _BYTE v27[128];

  if (-[NotesDisplayController contentHasUnsavedChanges](self, "contentHasUnsavedChanges"))
  {
    v25 = 0;
    v26 = 0;
    -[NotesDisplayController prepareForSerializationWithLeftoverPresentations:createdAttachments:](self, "prepareForSerializationWithLeftoverPresentations:createdAttachments:", &v26, &v25);
    v3 = v26;
    v18 = v25;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject attachments](self->_note, "attachments"));
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1000EA1F8;
          v20[3] = &unk_100554A58;
          v20[4] = v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v20));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredSetUsingPredicate:", v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));
            objc_msgSend(v13, "deleteObject:", v12);

            -[NoteObject removeAttachmentsObject:](self->_note, "removeAttachmentsObject:", v12);
          }

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v5);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentAsPlainText:", -[NoteObject isPlainText](self->_note, "isPlainText")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v16, "setContent:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v17, "addAttachments:", v18);

    -[NotesDisplayController updateNoteTitle](self, "updateNoteTitle");
    -[NotesDisplayController updateNoteUserActivityState](self, "updateNoteUserActivityState");
    -[NotesDisplayController refreshAttachmentPresentations](self, "refreshAttachmentPresentations");
    -[NotesDisplayController prepareForPresentation](self, "prepareForPresentation");
    -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);

  }
}

- (void)saveNote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (-[NotesDisplayController contentHasUnsavedChanges](self, "contentHasUnsavedChanges"))
  {
    -[NotesDisplayController updateNoteFromInterface](self, "updateNoteFromInterface");
    if (-[NotesDisplayController noteCanBeSaved](self, "noteCanBeSaved"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      objc_msgSend(v3, "submitNoteEditEventForHTMLNote:", v4);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v5, "setModificationDate:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteContext"));
      v15 = 0;
      v9 = objc_msgSend(v8, "save:", &v15);
      v10 = v15;

      if ((v9 & 1) == 0)
      {
        v11 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10040B794(v10, v11);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "store"));
      objc_msgSend(v12, "refreshNotesIfNeededForCollection:", v14);

      -[NotesDisplayController captureDisplayedNoteVersion](self, "captureDisplayedNoteVersion");
      -[NotesDisplayController setContentHasUnsavedChanges:](self, "setContentHasUnsavedChanges:", 0);
      -[NotesDisplayController invalidateAutosaveTimer](self, "invalidateAutosaveTimer");

    }
  }
}

- (BOOL)noteContainsValuableContent
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  if ((-[NotesDisplayController isEditing](self, "isEditing") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    if ((objc_msgSend(v5, "ic_containsNonWhitespaceCharacters") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attachments"));
      v3 = objc_msgSend(v7, "count") != 0;

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v9 = v8 != 0;
  if (v8 && !v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v9 = objc_msgSend(v10, "contentContainsValuableContent");

  }
  return v9;
}

- (BOOL)noteShouldBeDiscarded
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  if (v3 && !-[NotesDisplayController isUpdatingNoteContent](self, "isUpdatingNoteContent"))
    v4 = !-[NotesDisplayController noteContainsValuableContent](self, "noteContainsValuableContent");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)updateNoteProviderStatus
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  if (v3 && -[NotesDisplayController isVisible](self, "isVisible"))
  {
    if (-[NotesDisplayController isEditing](self, "isEditing"))
      v4 = -[NotesDisplayController noteCanBeSaved](self, "noteCanBeSaved");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  if (v4 != -[NotesDisplayController canProvideNote](self, "canProvideNote"))
  {
    -[NotesDisplayController setCanProvideNote:](self, "setCanProvideNote:", v4);
    -[NotesDisplayController didChangeNoteProviderStatus](self, "didChangeNoteProviderStatus");
  }
}

- (void)didChangeNoteProviderStatus
{
  -[NotesDisplayController updateContextProviderStatus](self, "updateContextProviderStatus");
  -[NotesDisplayController updateUserActivityStatus](self, "updateUserActivityStatus");
}

- (BOOL)noteHasSizeLimit
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "store"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));
  v5 = objc_msgSend(v4, "accountType") == (id)1;

  return v5;
}

- (unint64_t)estimatedSizeOfDisplayedContent
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

  v6 = (char *)objc_msgSend(v5, "length");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentAsPlainText:", objc_msgSend(v8, "isPlainText")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));

  v11 = &v6[(_QWORD)objc_msgSend(v10, "length")];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v16);
        v27 = 0;
        objc_msgSend(v17, "getPresentationData:mimeType:error:", &v27, 0, 0);
        v18 = v27;
        v11 = &v11[(_QWORD)objc_msgSend(v18, "ic_lengthAsMIMEAttachment")];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }
  v19 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_10040B840((uint64_t)v11, v19, v20, v21, v22, v23, v24, v25);

  return (unint64_t)v11;
}

- (BOOL)acceptNewSize:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  BOOL v15;

  v15 = 0;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10040B8A8(a3, v5, v6, v7, v8, v9, v10, v11);

  v12 = sub_1000C9658(a3, &v15);
  if (v12)
  {
    if (v15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
      objc_msgSend(v13, "setTracksMaximumContentLength:", 1);

    }
  }
  else
  {
    -[NotesDisplayController warnUserAboutNoteSizeLimitExceeded](self, "warnUserAboutNoteSizeLimitExceeded");
  }
  return v12;
}

- (void)turnOnContentLengthTrackingIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  BOOL v13;

  if (!-[NotesDisplayController noteHasSizeLimit](self, "noteHasSizeLimit"))
    return;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  if (objc_msgSend(v12, "tracksMaximumContentLength"))
  {

    return;
  }
  if ((-[NotesDisplayController isEditing](self, "isEditing") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "content"));
    if ((unint64_t)objc_msgSend(v4, "length") < 0x493E0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attachments"));
      v7 = objc_msgSend(v6, "count");

      if (!v7)
        return;
      goto LABEL_10;
    }

  }
LABEL_10:
  v13 = 0;
  v8 = sub_1000C9658(-[NotesDisplayController estimatedSizeOfDisplayedContent](self, "estimatedSizeOfDisplayedContent"), &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v10 = v9;
  v11 = v13 || !v8;
  objc_msgSend(v9, "setTracksMaximumContentLength:", v11);

}

- (void)warnUserAboutNoteSizeLimitExceeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Maximum note size reached."), &stru_1005704B8, 0));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1005704B8, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 0, 0));
  objc_msgSend(v8, "addAction:", v7);

  -[NotesDisplayController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (BOOL)allowsAttachments
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "store"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));
  v5 = objc_msgSend(v4, "supportsAttachments");

  return v5;
}

- (void)setAllAttachmentPresentationOccurences:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *allAttachmentPresentationOccurences;
  NSArray *v7;
  NSArray *nonManagedAttachmentPresentationOccurences;
  id v9;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  allAttachmentPresentationOccurences = self->_allAttachmentPresentationOccurences;
  self->_allAttachmentPresentationOccurences = v5;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_objectsPassingTest:", &stru_100554A78));
  v7 = (NSArray *)objc_msgSend(v9, "copy");
  nonManagedAttachmentPresentationOccurences = self->_nonManagedAttachmentPresentationOccurences;
  self->_nonManagedAttachmentPresentationOccurences = v7;

}

- (id)attachmentPresentationOccurencesForPreviewingWithManagedInterface:(BOOL)a3
{
  int *v3;

  v3 = &OBJC_IVAR___NotesDisplayController__nonManagedAttachmentPresentationOccurences;
  if (a3)
    v3 = &OBJC_IVAR___NotesDisplayController__allAttachmentPresentationOccurences;
  return *(id *)&self->ICNAViewController_opaque[*v3];
}

- (id)attachmentContentIDs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteHTMLEditorView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attachmentContentIDs"));

  return v4;
}

- (void)prepareForPresentation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentContentIDs](self, "attachmentContentIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations"));
  v6 = 0;
  +[NoteAttachmentPresentation prepareDocumentForPresentationWithAttachmentContentIDs:withAttachmentPresentations:occurences:](NoteAttachmentPresentation, "prepareDocumentForPresentationWithAttachmentContentIDs:withAttachmentPresentations:occurences:", v3, v4, &v6);
  v5 = v6;

  -[NotesDisplayController setAllAttachmentPresentationOccurences:](self, "setAllAttachmentPresentationOccurences:", v5);
}

- (void)prepareForSerializationWithLeftoverPresentations:(id *)a3 createdAttachments:(id *)a4
{
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
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NotesDisplayController *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noteContext"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithArray:](NSMutableOrderedSet, "orderedSetWithArray:", v6));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachments"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_dictionaryByHashingContentWithFunction:", &stru_100554A98));
  v12 = objc_msgSend(v11, "mutableCopy");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_dictionaryByHashingContentWithFunction:", &stru_100554AB8));
  v15 = objc_msgSend(v14, "mutableCopy");

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentContentIDs](self, "attachmentContentIDs"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    v35 = v12;
    v36 = v7;
    v33 = v16;
    v34 = v15;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v21));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v21));
        if (v23)
        {
          objc_msgSend(v7, "removeObject:", v23);
          if (!v22)
          {
            v39 = 0;
            v40 = 0;
            v38 = 0;
            objc_msgSend(v23, "getPresentationData:mimeType:error:", &v40, &v39, &v38);
            v24 = v40;
            v25 = v39;
            v26 = v38;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "filename"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyContentUtilities createAttachmentWithContentID:mimeType:data:filename:inContext:](ICLegacyContentUtilities, "createAttachmentWithContentID:mimeType:data:filename:inContext:", v27, v25, v24, v28, v37));

            if (v22)
              objc_msgSend(v32, "addObject:", v22);

            v12 = v35;
            v7 = v36;
            v16 = v33;
            v15 = v34;
          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v18);
  }

  if (a4)
    *a4 = objc_msgSend(v32, "copy");
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "array"));
  -[NotesDisplayController setAllAttachmentPresentationOccurences:](v31, "setAllAttachmentPresentationOccurences:", 0);

}

- (id)newlyCreatedAttachmentPresentationWithData:(id)a3 mimeType:(id)a4 preferredFilename:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v10 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyContentUtilities generateContentID](ICLegacyContentUtilities, "generateContentID"));
    if (v9)
      v12 = v9;
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(+[ICLegacyContentUtilities suggestedFilenameForURL:mimeType:](ICLegacyContentUtilities, "suggestedFilenameForURL:mimeType:", 0, v8));
    v14 = v12;
    v13 = objc_msgSend(objc_alloc((Class)NoteAttachmentPresentation), "initWithData:contentID:mimeType:filename:", v10, v11, v8, v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrayByAddingObject:", v13));

    -[NotesDisplayController setAttachmentPresentations:](self, "setAttachmentPresentations:", v16);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)insertAttachmentWithData:(id)a3 mimeType:(id)a4 preferredFilename:(id)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[NotesDisplayController noteHasSizeLimit](self, "noteHasSizeLimit"))
  {
    if (!v13)
      goto LABEL_7;
LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController newlyCreatedAttachmentPresentationWithData:mimeType:preferredFilename:](self, "newlyCreatedAttachmentPresentationWithData:mimeType:preferredFilename:", v13, v8, v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v12, "replaceSelectionWithAttachmentPresentation:", v11);

    goto LABEL_7;
  }
  v10 = -[NotesDisplayController acceptNewSize:](self, "acceptNewSize:", (char *)objc_msgSend(v13, "ic_lengthAsMIMEAttachment")+ -[NotesDisplayController estimatedSizeOfDisplayedContent](self, "estimatedSizeOfDisplayedContent"));
  if (v13 && (v10 & 1) != 0)
    goto LABEL_6;
LABEL_7:

}

- (id)noteAttachmentPresentationForContentID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentID"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteAttachmentObjectWithContentID:](self, "noteAttachmentObjectWithContentID:", v4));
  if (v5)
  {
    v13 = objc_msgSend(objc_alloc((Class)NoteAttachmentPresentation), "initWithNoteAttachmentObject:", v5);
LABEL_12:
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)noteAttachmentObjectWithContentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attachments"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
  {

LABEL_13:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyAttachmentUtilities attachmentWithContentID:context:](ICLegacyAttachmentUtilities, "attachmentWithContentID:context:", v4, v17));

    v19 = objc_opt_class(NoteAttachmentObject);
    v20 = ICDynamicCast(v19, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v20);

    goto LABEL_14;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentID"));
      v14 = objc_msgSend(v13, "isEqualToString:", v4);

      if (v14)
      {
        v15 = v12;

        v9 = v15;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v8);

  if (!v9)
    goto LABEL_13;
LABEL_14:

  return v9;
}

- (id)noteContentLayer:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteAttachmentPresentationForContentID:](self, "noteAttachmentPresentationForContentID:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataFileURL"));

  return v5;
}

- (id)noteContentLayer:(id)a3 attachmentPresentationForContentID:(id)a4
{
  return -[NotesDisplayController noteAttachmentPresentationForContentID:](self, "noteAttachmentPresentationForContentID:", a4);
}

- (void)setContentFromNote
{
  void *v3;
  NotesDisplayController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  unsigned __int8 v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v4 = (NotesDisplayController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  if (v4 == self)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v5, "setDelegate:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v6, "setAttachmentPresentationDelegate:", 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v10 = objc_msgSend(v9, "isPlainText");

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000EB810;
  v15[3] = &unk_100550688;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v17 = v10;
  v12 = objc_retainBlock(v15);
  if ((unint64_t)objc_msgSend(v11, "length") <= 0x10000)
  {
    ((void (*)(_QWORD *))v12[2])(v12);
  }
  else
  {
    -[NotesDisplayController setDelayingSetContent:](self, "setDelayingSetContent:", 1);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  if (v4 == self)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v13, "setDelegate:", self);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v14, "setAttachmentPresentationDelegate:", self);

  }
  -[NotesDisplayController setDidSetContentFromNote:](self, "setDidSetContentFromNote:", 1);

}

- (void)reloadContentLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[NotesDisplayController isEditing](self, "isEditing"))
  {
    -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 0);
    -[NotesDisplayController prepareForSerializationWithLeftoverPresentations:createdAttachments:](self, "prepareForSerializationWithLeftoverPresentations:createdAttachments:", 0, 0);
    -[NotesDisplayController prepareForPresentation](self, "prepareForPresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteHTMLEditorView"));
    objc_msgSend(v4, "setNeedsDisplay");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v5, "setNeedsLayout");

    -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 1, 0);
  }
  else
  {
    -[NotesDisplayController prepareForSerializationWithLeftoverPresentations:createdAttachments:](self, "prepareForSerializationWithLeftoverPresentations:createdAttachments:", 0, 0);
    -[NotesDisplayController prepareForPresentation](self, "prepareForPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteHTMLEditorView"));
    objc_msgSend(v7, "setNeedsDisplay");

    v8 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)refreshAttachmentPresentations
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "contentIDURL"));
        +[NotesCIDURLProtocol unregisterDataProviderForCIDURL:](NotesCIDURLProtocol, "unregisterDataProviderForCIDURL:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject attachments](self->_note, "attachments"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NoteAttachmentPresentation attachmentPresentationsForAttachments:](NoteAttachmentPresentation, "attachmentPresentationsForAttachments:", v10));
  -[NotesDisplayController setAttachmentPresentations:](self, "setAttachmentPresentations:", v11);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentIDURL"));
        +[NotesCIDURLProtocol registerDataProvider:forCIDURL:](NotesCIDURLProtocol, "registerDataProvider:forCIDURL:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[NotesDisplayController setAllAttachmentPresentationOccurences:](self, "setAllAttachmentPresentationOccurences:", 0);
}

- (BOOL)wantsToRemainFirstResponder
{
  unsigned int v3;

  v3 = -[NotesDisplayController isViewLoaded](self, "isViewLoaded");
  if (v3)
    LOBYTE(v3) = -[NotesDisplayController isEditing](self, "isEditing");
  return v3;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v3 = objc_msgSend(objc_alloc((Class)NotesBackgroundView), "initWithFrame:", 0.0, 0.0, 320.0, 320.0);
  -[NotesDisplayController setBackgroundView:](self, "setBackgroundView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController backgroundView](self, "backgroundView"));
  -[NotesDisplayController setView:](self, "setView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICBackgroundColor](UIColor, "ICBackgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = objc_msgSend(objc_alloc((Class)NoteContentLayer), "initWithFrame:", 0.0, 0.0, 320.0, 320.0);
  -[NotesDisplayController setContentLayer:](self, "setContentLayer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  if (v9)
  {
    v10 = -[NotesDisplayController allowsAttachments](self, "allowsAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v11, "setAllowsAttachments:", v10);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController traitCollection](self, "traitCollection"));
  if ((objc_msgSend(v12, "ic_hasCompactWidth") & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
    if ((objc_msgSend(v14, "isAuxiliary") & 1) != 0)
    {
      v13 = 1;
    }
    else if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
      v13 = (uint64_t)objc_msgSend(v15, "isMainSplitViewDisplayModeSecondaryOnly");

    }
    else
    {
      v13 = 0;
    }

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
  v17 = objc_msgSend(v16, "noteContainerViewMode") == 0;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
  if (objc_msgSend(v18, "noteContainerViewMode") == (id)1)
    v19 = 1;
  else
    v19 = v13;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController backgroundView](self, "backgroundView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v20, "setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v21, +[UIDevice ic_isVision](UIDevice, "ic_isVision"), v13, v17, v19, 0);

  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)-[NotesDisplayController updateDate](self, "updateDate");
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "_userFontSizeUpdated:", UIContentSizeCategoryDidChangeNotification, 0);
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "applicationWillResignActive:", UIApplicationWillResignActiveNotification, 0);
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "applicationWillTerminate:", UIApplicationWillTerminateNotification, 0);
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "sceneDidActivate:", UISceneDidActivateNotification, 0);
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "sceneWillDeactivate:", UISceneWillDeactivateNotification, 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController backgroundView](self, "backgroundView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController ic_safeAreaLayoutGuide](self, "ic_safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "addConstraintsForSafeAreaLayoutGuide:toContainer:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v8, "setAttachmentPresentationDelegate:", self);

  if (-[NotesDisplayController isEditing](self, "isEditing"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "noteHTMLEditorView"));
    objc_msgSend(v10, "startEditing");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView"));
  objc_msgSend(v11, "_setFindInteractionEnabled:", 1);

}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
  -[NotesDisplayController setDidSetContentFromNote:](self, "setDidSetContentFromNote:", 0);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v4;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController viewDidMoveToWindow:shouldAppearOrDisappear:](&v11, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
    v8 = objc_msgSend(v7, "isAuxiliary");
    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController ic_viewControllerManager](self, "ic_viewControllerManager"));
      v9 = (uint64_t)objc_msgSend(v4, "isAuxiliary");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
    objc_msgSend(v10, "setHidesBackButton:", v9);

    if ((v8 & 1) == 0)
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController willMoveToParentViewController:](&v4, "willMoveToParentViewController:", a3);
  -[NotesDisplayController setToolbarItems:](self, "setToolbarItems:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[5];

  v4 = a3;
  -[NotesDisplayController setIsAppearing:](self, "setIsAppearing:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v7, "noteDisplayController:beginDisplayingNote:animated:", self, v8, v4);

  }
  if (!-[NotesDisplayController didSetContentFromNote](self, "didSetContentFromNote"))
    -[NotesDisplayController setContentFromNote](self, "setContentFromNote");
  -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
  -[NotesDisplayController updateBarsVisibilityAnimated:](self, "updateBarsVisibilityAnimated:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController transitionCoordinator](self, "transitionCoordinator"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController transitionCoordinator](self, "transitionCoordinator"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000EC4A0;
    v20[3] = &unk_1005500E8;
    v20[4] = self;
    objc_msgSend(v10, "animateAlongsideTransition:completion:", v20, 0);

  }
  else
  {
    -[NotesDisplayController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
  v12 = objc_msgSend(v11, "isAuxiliary");
  if ((v12 & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController ic_viewControllerManager](self, "ic_viewControllerManager"));
    v13 = (uint64_t)objc_msgSend(v3, "isAuxiliary");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setHidesBackButton:", v13);

  if ((v12 & 1) == 0)
  objc_initWeak(&location, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EC4A8;
  v17[3] = &unk_100552D38;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v15, "ic_addCreateNoteInteractionWithFolderHandler:", v17);

  v16.receiver = self;
  v16.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController viewWillAppear:](&v16, "viewWillAppear:", v4);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController viewDidAppear:](&v13, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v5, "startNoteViewEventDurationTrackingForHTMLNote:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  objc_msgSend(v7, "setNavigationBarHidden:animated:", 0, 0);

  if (!-[NotesDisplayController delayingSetContent](self, "delayingSetContent"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    objc_msgSend(v8, "flashScrollIndicators");

  }
  -[NotesDisplayController setVisible:](self, "setVisible:", 1);
  -[NotesDisplayController updateNoteProviderStatus](self, "updateNoteProviderStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v9, "setEditable:", 1);

  if (-[NotesDisplayController startEditingAfterViewAppears](self, "startEditingAfterViewAppears"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "noteHTMLEditorView"));
    objc_msgSend(v11, "startEditing");

    -[NotesDisplayController setStartEditingAfterViewAppears:](self, "setStartEditingAfterViewAppears:", 0);
  }
  -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  objc_msgSend(v12, "didFinishExtendedLaunch");

  -[NotesDisplayController setIsAppearing:](self, "setIsAppearing:", 0);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)sceneWillDeactivate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewIfLoaded](self, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8 && -[NotesDisplayController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));

    if (v9)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      objc_msgSend(v11, "submitNoteViewEventForHTMLNote:", v10);

    }
  }
}

- (void)sceneDidActivate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewIfLoaded](self, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8 && -[NotesDisplayController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));

    if (v9)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      objc_msgSend(v11, "startNoteViewEventDurationTrackingForHTMLNote:", v10);

    }
  }
}

- (BOOL)isEndingNoteDisplay
{
  void *v3;
  unsigned __int8 v4;
  unsigned int v5;
  unsigned __int8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v4 = objc_msgSend(v3, "isMovingFromParentViewController");
  if ((v4 & 1) != 0)
  {
    if (-[NotesDisplayController transitioningToSize](self, "transitioningToSize"))
      LOBYTE(v5) = 0;
    else
      v5 = !-[NotesDisplayController isAppearing](self, "isAppearing");
  }
  else
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
    if ((objc_msgSend(v7, "isBeingDismissed") & 1) != 0
      || (-[NotesDisplayController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0|| -[NotesDisplayController isBeingDismissed](self, "isBeingDismissed"))
    {
      if (-[NotesDisplayController transitioningToSize](self, "transitioningToSize"))
      {
        LOBYTE(v5) = 0;
        if ((v6 & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        v5 = !-[NotesDisplayController isAppearing](self, "isAppearing");
        if ((v6 & 1) != 0)
          goto LABEL_15;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
LABEL_15:

  return v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v6, "submitNoteViewEventForHTMLNote:", v7);

  }
  -[NotesDisplayController saveNote](self, "saveNote");
  -[NotesDisplayController setVisible:](self, "setVisible:", 0);
  -[NotesDisplayController updateNoteProviderStatus](self, "updateNoteProviderStatus");
  v13.receiver = self;
  v13.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController viewWillDisappear:](&v13, "viewWillDisappear:", v3);
  if (-[NotesDisplayController isEndingNoteDisplay](self, "isEndingNoteDisplay"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v8, "noteDisplayController:endDisplayingNote:animated:", self, v9, v3);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController transitionCoordinator](self, "transitionCoordinator"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000ECAF0;
  v12[3] = &unk_1005500E8;
  v12[4] = self;
  objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v12);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  objc_msgSend(v11, "ic_removeLinkActionInteractions");

  -[NotesDisplayController stopTextFinding](self, "stopTextFinding");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[NotesDisplayController isEndingNoteDisplay](self, "isEndingNoteDisplay"))
    -[NotesDisplayController prepareForReuse](self, "prepareForReuse");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v5, "setEditable:", 0);

  v6.receiver = self;
  v6.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
}

- (id)displayedActionButtonItemsWithTag:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController toolbarItems](self, "toolbarItems"));
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "tag", (_QWORD)v17) == (id)a3)
        {
          v15 = v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (UIBarButtonItem)closeAuxiliaryWindowButton
{
  UIBarButtonItem *closeAuxiliaryWindowButton;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;

  closeAuxiliaryWindowButton = self->_closeAuxiliaryWindowButton;
  if (!closeAuxiliaryWindowButton)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_1005704B8, 0));

    v6 = objc_alloc((Class)UIBarButtonItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
    v8 = (UIBarButtonItem *)objc_msgSend(v6, "initWithTitle:style:target:action:", v5, 0, v7, "closeAuxiliaryWindow");
    v9 = self->_closeAuxiliaryWindowButton;
    self->_closeAuxiliaryWindowButton = v8;

    closeAuxiliaryWindowButton = self->_closeAuxiliaryWindowButton;
  }
  return closeAuxiliaryWindowButton;
}

- (UIBarButtonItem)doneButtonItem
{
  UIBarButtonItem *doneButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonClicked:");
    v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    doneButtonItem = self->_doneButtonItem;
  }
  return doneButtonItem;
}

- (id)shareButtonItem
{
  return -[NotesDisplayController displayedActionButtonItemsWithTag:](self, "displayedActionButtonItemsWithTag:", 1);
}

- (id)deleteButtonItem
{
  return -[NotesDisplayController displayedActionButtonItemsWithTag:](self, "displayedActionButtonItemsWithTag:", 2);
}

- (id)addButtonItem
{
  return -[NotesDisplayController displayedActionButtonItemsWithTag:](self, "displayedActionButtonItemsWithTag:", 3);
}

- (void)updateBarButtonItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController traitCollection](self, "traitCollection"));
  if (!objc_msgSend(v14, "horizontalSizeClass"))
  {
LABEL_17:

    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "verticalSizeClass");

  if (v6)
  {
    -[NotesDisplayController updateToolbarButtonItemsAnimated:](self, "updateToolbarButtonItemsAnimated:", v3);
    -[NotesDisplayController updateNavigationBarLeftButtonItemsAnimated:](self, "updateNavigationBarLeftButtonItemsAnimated:", v3);
    -[NotesDisplayController updateNavigationBarRightButtonItemsAnimated:](self, "updateNavigationBarRightButtonItemsAnimated:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController addButtonItem](self, "addButtonItem"));
    if (-[NotesDisplayController noteCanBeSaved](self, "noteCanBeSaved"))
    {
      objc_msgSend(v7, "setEnabled:", 1);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      if (v8)
        v9 = (uint64_t)+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");
      else
        v9 = 1;
      objc_msgSend(v7, "setEnabled:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareButtonItem](self, "shareButtonItem"));
    if (-[NotesDisplayController noteCanBeSaved](self, "noteCanBeSaved"))
      v11 = 1;
    else
      v11 = (uint64_t)+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");
    objc_msgSend(v10, "setEnabled:", v11);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteButtonItem](self, "deleteButtonItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    if (v12)
      v13 = 1;
    else
      v13 = (uint64_t)+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG");
    objc_msgSend(v14, "setEnabled:", v13);

    goto LABEL_17;
  }
}

- (NSArray)actionButtonItemsForToolbar
{
  NSArray *actionButtonItemsForToolbar;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSArray *v21;
  NSArray *v22;
  _QWORD v24[5];

  actionButtonItemsForToolbar = self->_actionButtonItemsForToolbar;
  if (!actionButtonItemsForToolbar)
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
    v6 = objc_msgSend(v4, "initWithImage:style:target:action:", v5, 0, self, "deleteButtonClicked:");
    -[NotesDisplayController setDeleteBarButtonItem:](self, "setDeleteBarButtonItem:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteBarButtonItem](self, "deleteBarButtonItem"));
    objc_msgSend(v7, "setTag:", 2);

    v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
    v10 = objc_msgSend(v8, "initWithImage:style:target:action:", v9, 0, self, "shareButtonClicked:");
    -[NotesDisplayController setShareBarButtonItem:](self, "setShareBarButtonItem:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareBarButtonItem](self, "shareBarButtonItem"));
    objc_msgSend(v11, "setTag:", 1);

    v12 = objc_alloc((Class)UIBarButtonItem);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.pencil")));
    v14 = objc_msgSend(v12, "initWithImage:style:target:action:", v13, 0, self, "addButtonClicked:");
    -[NotesDisplayController setCreateBarButtonItem:](self, "setCreateBarButtonItem:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createBarButtonItem](self, "createBarButtonItem"));
    objc_msgSend(v15, "setTag:", 3);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteBarButtonItem](self, "deleteBarButtonItem"));
    v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0, v16);
    v24[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareBarButtonItem](self, "shareBarButtonItem"));
    v24[2] = v18;
    v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v24[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createBarButtonItem](self, "createBarButtonItem"));
    v24[4] = v20;
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 5));
    v22 = self->_actionButtonItemsForToolbar;
    self->_actionButtonItemsForToolbar = v21;

    -[NotesDisplayController applyAccessibilityInfo](self, "applyAccessibilityInfo");
    actionButtonItemsForToolbar = self->_actionButtonItemsForToolbar;
  }
  return actionButtonItemsForToolbar;
}

- (NSArray)actionButtonItemsForNavBar
{
  NSArray *actionButtonItemsForNavBar;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *v24;
  NSArray *v25;
  _QWORD v26[6];

  actionButtonItemsForNavBar = self->_actionButtonItemsForNavBar;
  if (actionButtonItemsForNavBar)
    return actionButtonItemsForNavBar;
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v5, "setWidth:", -1.0);
  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v6, "setWidth:", 10.0);
  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v7, "setWidth:", 10.0);
  v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
  v10 = objc_msgSend(v8, "initWithImage:style:target:action:", v9, 0, self, "deleteButtonClicked:");
  -[NotesDisplayController setDeleteNavBarButtonItem:](self, "setDeleteNavBarButtonItem:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteNavBarButtonItem](self, "deleteNavBarButtonItem"));
  objc_msgSend(v11, "setTag:", 2);

  v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
  v14 = objc_msgSend(v12, "initWithImage:style:target:action:", v13, 0, self, "shareButtonClicked:");
  -[NotesDisplayController setShareNavBarButtonItem:](self, "setShareNavBarButtonItem:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareNavBarButtonItem](self, "shareNavBarButtonItem"));
  objc_msgSend(v15, "setTag:", 1);

  v16 = objc_alloc((Class)UIBarButtonItem);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.pencil")));
  v18 = objc_msgSend(v16, "initWithImage:style:target:action:", v17, 0, self, "addButtonClicked:");
  -[NotesDisplayController setCreateNavBarButtonItem:](self, "setCreateNavBarButtonItem:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createNavBarButtonItem](self, "createNavBarButtonItem"));
  objc_msgSend(v19, "setTag:", 3);

  v26[0] = v5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createNavBarButtonItem](self, "createNavBarButtonItem"));
  v26[1] = v20;
  v26[2] = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareNavBarButtonItem](self, "shareNavBarButtonItem"));
  v26[3] = v21;
  v26[4] = v7;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteNavBarButtonItem](self, "deleteNavBarButtonItem"));
  v26[5] = v22;
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 6));
  v24 = self->_actionButtonItemsForNavBar;
  self->_actionButtonItemsForNavBar = v23;

  -[NotesDisplayController applyAccessibilityInfo](self, "applyAccessibilityInfo");
  v25 = self->_actionButtonItemsForNavBar;

  return v25;
}

- (BOOL)wantsButtonsInToolbar
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "horizontalSizeClass") == (id)1;

  return v3;
}

- (void)updateToolbarButtonItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[NotesDisplayController wantsButtonsInToolbar](self, "wantsButtonsInToolbar"))
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController actionButtonItemsForToolbar](self, "actionButtonItemsForToolbar"));
  else
    v7 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController toolbarItems](self, "toolbarItems"));
  if ((objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
  {
    if (v7)
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController toolbarItems](self, "toolbarItems"));

      if (!v6)
        goto LABEL_10;
    }
    -[NotesDisplayController setToolbarItems:animated:](self, "setToolbarItems:animated:", v7, v3);
    goto LABEL_10;
  }

LABEL_10:
}

- (void)updateNavigationBarLeftButtonItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
  if (objc_msgSend(v5, "isAuxiliary"))
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController ic_viewControllerManager](self, "ic_viewControllerManager"));
    v7 = objc_msgSend(v6, "isAuxiliary");

    if (!v7)
      return;
  }
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController closeAuxiliaryWindowButton](self, "closeAuxiliaryWindowButton"));
    objc_msgSend(v9, "setLeftBarButtonItem:animated:", v8, v3);

  }
}

- (void)updateNavigationBarRightButtonItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[NotesDisplayController isEditing](self, "isEditing")
    && (+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController doneButtonItem](self, "doneButtonItem"));
    objc_msgSend(v11, "addObject:", v5);

  }
  if (!-[NotesDisplayController wantsButtonsInToolbar](self, "wantsButtonsInToolbar"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController actionButtonItemsForNavBar](self, "actionButtonItemsForNavBar"));
    objc_msgSend(v11, "addObjectsFromArray:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightBarButtonItems"));
  if ((objc_msgSend(v11, "isEqual:", v8) & 1) != 0)
    goto LABEL_11;
  if (v11)
  {

LABEL_10:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
    v8 = objc_msgSend(v11, "copy");
    objc_msgSend(v7, "setRightBarButtonItems:animated:", v8, v3);
LABEL_11:

    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightBarButtonItems"));

  if (v10)
    goto LABEL_10;
LABEL_12:

}

- (void)updateBarsVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController toolbarItems](self, "toolbarItems"));
  v6 = objc_msgSend(v5, "count") == 0;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  objc_msgSend(v7, "setToolbarHidden:animated:", v6, v3);

}

- (void)addButtonClicked:(id)a3
{
  id v4;
  id v5;

  if (!-[NotesDisplayController isEditing](self, "isEditing", a3)
    || -[NotesDisplayController noteContainsValuableContent](self, "noteContainsValuableContent"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController viewControllerManager](self, "viewControllerManager"));
    v4 = objc_msgSend(v5, "showNewNoteWithApproach:sender:animated:", 2, self, 1);

  }
}

- (void)doneButtonClicked:(id)a3
{
  -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)accessibilityLargeTextDidChange
{
  -[NotesDisplayController reloadContentLayer](self, "reloadContentLayer");
}

- (void)resetFontOnResume
{
  -[NotesDisplayController reloadContentLayer](self, "reloadContentLayer");
}

- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController backgroundView](self, "backgroundView"));
  objc_msgSend(v8, "updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v7, v6, v5, 0);

}

- (void)noteContentLayer:(id)a3 didAddAttachmentForMimeType:(id)a4 filename:(id)a5 data:(id)a6
{
  -[NotesDisplayController insertAttachmentWithData:mimeType:preferredFilename:](self, "insertAttachmentWithData:mimeType:preferredFilename:", a6, a4, a5);
}

- (id)noteContentLayer:(id)a3 createAttachmentPresentationWithData:(id)a4 mimeType:(id)a5 filename:(id)a6
{
  return -[NotesDisplayController newlyCreatedAttachmentPresentationWithData:mimeType:preferredFilename:](self, "newlyCreatedAttachmentPresentationWithData:mimeType:preferredFilename:", a4, a5, a6);
}

- (BOOL)canInsertImagesInNoteContentLayer:(id)a3
{
  unsigned __int8 v3;
  char v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[NotesDisplayController allowsAttachments](self, "allowsAttachments", a3);
  v4 = v3 & +[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImagePickerController availableMediaTypesForSourceType:](UIImagePickerController, "availableMediaTypesForSourceType:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v7 = v4 & objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (void)insertImageInNoteContentLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  void *v13;

  v4 = objc_alloc_init((Class)UIImagePickerController);
  objc_msgSend(v4, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  objc_msgSend(v4, "setMediaTypes:", v6);

  objc_msgSend(v4, "setAllowsEditing:", 0);
  v7 = objc_alloc((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_properties"));
  v9 = objc_msgSend(v7, "initWithDictionary:", v8);

  objc_msgSend(v9, "setObject:forKey:", kCFBooleanTrue, _UIImagePickerControllerViewImageBeforeSelecting);
  objc_msgSend(v4, "_setProperties:", v9);
  objc_msgSend(v4, "_setImagePickerSavingOptions:", 6);
  -[NotesDisplayController setPickerController:](self, "setPickerController:", v4);
  -[NotesDisplayController setPickingAttachment:](self, "setPickingAttachment:", 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000EDC30;
  v11[3] = &unk_100554AE0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[NotesDisplayController getPickerPopoverSourceRectWithCompletion:](self, "getPickerPopoverSourceRectWithCompletion:", v11);

}

- (void)getPickerPopoverSourceRectWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EDE1C;
  v7[3] = &unk_100554B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getRectForSelectionWithCompletion:", v7);

}

- (void)dismissPickerControllerWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[NotesDisplayController isPickingAttachment](self, "isPickingAttachment"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000EE068;
    v5[3] = &unk_100550160;
    v5[4] = self;
    v6 = v4;
    -[NotesDisplayController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);

  }
}

- (void)didDismissPickerController
{
  void *v3;
  void *v4;

  if (-[NotesDisplayController isPickingAttachment](self, "isPickingAttachment"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteHTMLEditorView"));
    objc_msgSend(v4, "startEditing");

    -[NotesDisplayController setPickingAttachment:](self, "setPickingAttachment:", 0);
    -[NotesDisplayController setPickerController:](self, "setPickerController:", 0);
  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  -[NotesDisplayController dismissPickerControllerWithCompletionHandler:](self, "dismissPickerControllerWithCompletionHandler:", 0);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v5 = _UIImagePickerControllerOriginalImageData;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", UIImagePickerControllerPHAsset));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filename"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathExtension"));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000EE254;
  v14[3] = &unk_100550098;
  v14[4] = self;
  v15 = v7;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[WebMIMETypeRegistry mimeTypeForExtension:](WebMIMETypeRegistry, "mimeTypeForExtension:", v10));
  v17 = v8;
  v11 = v8;
  v12 = v16;
  v13 = v7;
  -[NotesDisplayController dismissPickerControllerWithCompletionHandler:](self, "dismissPickerControllerWithCompletionHandler:", v14);

}

- (void)showActionsForAttachmentPresentation:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[3];
  _QWORD v24[2];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataFileURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInfo printInfo](UIPrintInfo, "printInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filename"));
  objc_msgSend(v9, "setJobName:", v10);

  objc_msgSend(v9, "setOutputType:", 1);
  v11 = objc_msgSend(v7, "sourceIsManaged");

  v24[0] = v8;
  v24[1] = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
  v13 = objc_msgSend(objc_alloc((Class)UIActivityViewController), "initWithActivityItems:applicationActivities:", v12, &__NSArray0__struct);
  v23[0] = UIActivityTypeOpenInIBooks;
  v23[1] = ICActivityTypeShareToNote;
  v23[2] = UIActivityTypeSharePlay;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
  objc_msgSend(v13, "setExcludedActivityTypes:", v14);

  objc_msgSend(v13, "setIsContentManaged:", v11);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000EE570;
  v22[3] = &unk_100552550;
  v22[4] = self;
  objc_msgSend(v13, "setCompletionWithItemsHandler:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000EE578;
  v21[3] = &unk_100554B58;
  v21[4] = self;
  objc_msgSend(v13, "setCompletionHandler:", v21);
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v15 = -2;
  else
    v15 = 7;
  objc_msgSend(v13, "setModalPresentationStyle:", v15);
  -[NotesDisplayController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "popoverPresentationController"));
  -[NotesDisplayController setActivityPresentationController:](self, "setActivityPresentationController:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;

  objc_msgSend(v16, "setSourceRect:", x, y + v19, 0.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView"));
  objc_msgSend(v16, "setSourceView:", v20);

  objc_msgSend(v16, "setPermittedArrowDirections:", 15);
}

- (void)didDismissActivityController
{
  -[NotesDisplayController setActivityPresentationController:](self, "setActivityPresentationController:", 0);
}

- (CGRect)rectForAttachmentPresentationOccurence:(id)a3 inView:(id *)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "element"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v7, "rectForDOMNode:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGPoint)pointRelativeToRect:(CGRect)a3 fromContentLayerPoint:(CGPoint)a4
{
  double y;
  double x;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v10 = CGPointZero.x;
    v11 = CGPointZero.y;
  }
  else
  {
    v10 = (x - v9) / width;
    v11 = (y - v8) / height;
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)contentLayerPointFromPoint:(CGPoint)a3 relativeToRect:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.origin.x + a3.x * a4.size.width;
  v5 = a4.origin.y + a3.y * a4.size.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)occurenceForPreviewItem:(id)a3 hintIndex:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v6 = a3;
  v7 = objc_opt_class(NoteAttachmentPresentationOccurence);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentation"));
    v9 = objc_msgSend(v8, "sourceIsManaged");

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentationOccurencesForPreviewingWithManagedInterface:](self, "attachmentPresentationOccurencesForPreviewingWithManagedInterface:", v9));
  if ((unint64_t)objc_msgSend(v10, "count") <= a4)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewItemURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "previewItemURL"));
  v14 = objc_msgSend(v13, "isEqual:", v12);

  if ((v14 & 1) == 0)
  {

LABEL_7:
    v11 = 0;
  }

  return v11;
}

- (CGRect)notesQuickLookActivityItem:(id)a3 rectForPreviewItem:(id)a4 inView:(id *)a5 previewController:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned __int8 v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v9 = a6;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController occurenceForPreviewItem:hintIndex:](self, "occurenceForPreviewItem:hintIndex:", v10, objc_msgSend(v9, "currentPreviewItemIndex")));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentation"));
    v13 = objc_msgSend(v12, "sourceIsManaged");
    if (v9 && v13)
    {
      v14 = objc_msgSend(v9, "isContentManaged");

      if ((v14 & 1) == 0)
        NSLog(CFSTR("Error: Managed preview item is displayed in a non-managed preview controller %@"), v11);
    }
    else
    {

    }
    -[NotesDisplayController rectForAttachmentPresentationOccurence:inView:](self, "rectForAttachmentPresentationOccurence:inView:", v11, a5);
    x = v19;
    y = v20;
    width = v21;
    height = v22;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)notesQuickLookActivityItem:(id)a3 transitionImageForPreviewItem:(id)a4 previewController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController occurenceForPreviewItem:hintIndex:](self, "occurenceForPreviewItem:hintIndex:", v8, objc_msgSend(v7, "currentPreviewItemIndex")));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentation"));
    v11 = objc_msgSend(v10, "sourceIsManaged");
    if (v7 && v11)
    {
      v12 = objc_msgSend(v7, "isContentManaged");

      if ((v12 & 1) == 0)
        NSLog(CFSTR("Error: Managed preview item is displayed in a non-managed preview controller %@"), v9);
    }
    else
    {

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentation"));
    v18 = 0;
    v15 = objc_msgSend(v14, "getPresentationData:mimeType:error:", &v18, 0, 0);
    v16 = v18;

    v13 = 0;
    if (v15)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v16));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)noteActivityItemsForSharing
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[2];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController printFormatter](self, "printFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v4 = objc_msgSend(v3, "isPlainText");

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInfo printInfo](UIPrintInfo, "printInfo"));
  if (v4)
    objc_msgSend(v22, "setOutputType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject title](self->_note, "title"));
  objc_msgSend(v22, "setJobName:", v5);

  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = objc_alloc((Class)ICNoteLinkPresentationActivityItemSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v9 = objc_msgSend(v7, "initWithNote:", v8);

  objc_msgSend(v6, "addObject:", v9);
  objc_initWeak(&location, self);
  v10 = objc_alloc((Class)ICAirDropNoteActivityItemSource);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject title](self->_note, "title"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000EECC8;
  v23[3] = &unk_100554B80;
  objc_copyWeak(&v24, &location);
  v12 = objc_msgSend(v10, "initWithTitle:airDropDocumentCreator:", v11, v23);

  if (v12)
    objc_msgSend(v6, "addObject:", v12);
  v13 = objc_alloc((Class)ICLegacyNoteStringActivityItemSource);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject title](self->_note, "title"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject content](self->_note, "content"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject contentAsPlainText](self->_note, "contentAsPlainText"));
  v17 = objc_msgSend(v13, "initWithTitle:content:plainText:", v14, v15, v16);

  if (v17)
    objc_msgSend(v6, "addObject:", v17);
  v26[0] = v22;
  v26[1] = v21;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  objc_msgSend(v6, "addObjectsFromArray:", v18);

  v19 = objc_msgSend(v6, "copy");
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v19;
}

- (UIPrintFormatter)printFormatter
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v4 = objc_msgSend(v3, "isPlainText");

  if (v4)
  {
    v5 = objc_alloc((Class)UISimpleTextPrintFormatter);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteHTMLEditorView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v9 = objc_msgSend(v5, "initWithText:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForBodyText](UIFont, "ic_preferredFontForBodyText"));
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(v9, "setPerPageContentInsets:", 36.0, 36.0, 36.0, 36.0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewPrintFormatter"));

  }
  return (UIPrintFormatter *)v9;
}

- (void)shareButtonClicked:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  NotesActivityViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  NotesActivityViewController *v13;
  NotesActivityViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[3];
  void *v23;
  _QWORD v24[2];

  if (-[NotesDisplayController isEditing](self, "isEditing", a3))
    -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  v4 = -[NotesDisplayController stopTextFinding](self, "stopTextFinding");
  if (ICDebugModeEnabled(v4, v5))
  {
    v6 = objc_alloc((Class)ICChangeDatesActivity);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v8 = objc_msgSend(v6, "initWithObject:activityType:", v7, 0);

    v9 = [NotesActivityViewController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteActivityItemsForSharing](self, "noteActivityItemsForSharing"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController textFindingActivity](self, "textFindingActivity"));
    v24[0] = v11;
    v24[1] = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    v13 = -[NotesActivityViewController initWithActivityItems:applicationActivities:](v9, "initWithActivityItems:applicationActivities:", v10, v12);

  }
  else
  {
    v14 = [NotesActivityViewController alloc];
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteActivityItemsForSharing](self, "noteActivityItemsForSharing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController textFindingActivity](self, "textFindingActivity"));
    v23 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v13 = -[NotesActivityViewController initWithActivityItems:applicationActivities:](v14, "initWithActivityItems:applicationActivities:", v8, v11);
  }

  v22[0] = UIActivityTypeOpenInIBooks;
  v22[1] = ICActivityTypeShareToNote;
  v22[2] = UIActivityTypeSharePlay;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
  -[NotesActivityViewController setExcludedActivityTypes:](v13, "setExcludedActivityTypes:", v15);

  -[NotesActivityViewController setDisplayController:](v13, "setDisplayController:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject store](self->_note, "store"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
  -[NotesActivityViewController setIsContentManaged:](v13, "setIsContentManaged:", objc_msgSend(v17, "isManaged"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000EF148;
  v21[3] = &unk_100552550;
  v21[4] = self;
  -[NotesActivityViewController setCompletionWithItemsHandler:](v13, "setCompletionWithItemsHandler:", v21);
  -[NotesDisplayController prepareForBarSourcedPopoverPresentation](self, "prepareForBarSourcedPopoverPresentation");
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v18 = -2;
  else
    v18 = 7;
  -[NotesActivityViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", v18);
  -[NotesDisplayController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NotesActivityViewController popoverPresentationController](v13, "popoverPresentationController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareButtonItem](self, "shareButtonItem"));
  objc_msgSend(v19, "setBarButtonItem:", v20);

  objc_msgSend(v19, "setPermittedArrowDirections:", 3);
}

- (id)textFindingActivity
{
  return -[ICHTMLFindInNoteUIActivity initWithDelegate:]([ICHTMLFindInNoteUIActivity alloc], "initWithDelegate:", self);
}

- (void)performFindInNote:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_findInteraction"));
  objc_msgSend(v3, "presentFindNavigatorShowingReplace:", 0);

}

- (void)performReplaceInNote:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_findInteraction"));
  objc_msgSend(v3, "presentFindNavigatorShowingReplace:", 1);

}

- (void)performFindInNoteUIActivity:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_findInteraction"));
  objc_msgSend(v5, "presentFindNavigatorShowingReplace:", 0);

  objc_msgSend(v6, "activityDidFinish:", 1);
}

- (id)noteHTMLEditorView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteHTMLEditorView"));

  return v3;
}

- (UIScrollView)scrollView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteHTMLEditorView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollView"));

  return (UIScrollView *)v5;
}

- (void)deleteButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ICDeleteDecisionController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICDeleteDecisionController *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  void *v17;

  v4 = a3;
  if (-[NotesDisplayController isEditing](self, "isEditing"))
    -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  if (-[NotesDisplayController noteShouldBeDiscarded](self, "noteShouldBeDiscarded"))
  {
    -[NotesDisplayController setIsUpdatingNoteContent:](self, "setIsUpdatingNoteContent:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v5, "noteDisplayController:deleteNote:actionOrigin:", self, v6, 1);

    -[NotesDisplayController setIsUpdatingNoteContent:](self, "setIsUpdatingNoteContent:", 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v8 = [ICDeleteDecisionController alloc];
    v17 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
    v13 = -[ICDeleteDecisionController initWithSourceObjects:window:sender:eventReporter:](v8, "initWithSourceObjects:window:sender:eventReporter:", v9, v11, v4, v12);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000EF580;
    v15[3] = &unk_100552678;
    v15[4] = self;
    v16 = v7;
    v14 = v7;
    -[ICDeleteDecisionController performDecisionWithCompletion:](v13, "performDecisionWithCompletion:", v15);

  }
}

- (void)didDismissDeleteAlertController
{
  -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
  -[NotesDisplayController cleanupAfterBarSourcedPopoverPresentation](self, "cleanupAfterBarSourcedPopoverPresentation");
  -[NotesDisplayController setDeletePresentationController:](self, "setDeletePresentationController:", 0);
}

- (void)setPerformingDeleteAnimation:(BOOL)a3
{
  if (self->_performingDeleteAnimation != a3)
  {
    self->_performingDeleteAnimation = a3;
    -[NotesDisplayController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !a3);
  }
}

- (void)animateDeleteTransitionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 IsReduceMotionEnabled;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  NotesDisplayController *v20;
  id v21;
  BOOL v22;
  id v23;

  v4 = a3;
  -[NotesDisplayController setPerformingDeleteAnimation:](self, "setPerformingDeleteAnimation:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0));

  objc_msgSend(v6, "addSubview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController backgroundView](self, "backgroundView"));
  objc_msgSend(v9, "setContentViewVisible:", 0);

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000EF824;
  v18[3] = &unk_100554BA8;
  v22 = IsReduceMotionEnabled;
  v11 = v8;
  v19 = v11;
  v20 = self;
  v12 = v4;
  v21 = v12;
  v13 = objc_retainBlock(v18);
  v14 = v13;
  if (IsReduceMotionEnabled)
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }
  else
  {
    v23 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000EF9A0;
    v16[3] = &unk_100550890;
    v17 = v14;
    +[UIView performSystemAnimation:onViews:options:animations:completion:](UIView, "performSystemAnimation:onViews:options:animations:completion:", 0, v15, 0, 0, v16);

  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  if (!a3 && -[NotesDisplayController isEditing](self, "isEditing"))
    -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationBar"));
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
        v15 = objc_opt_class(UINavigationButton);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          objc_msgSend(v14, "setUserInteractionEnabled:", v3);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "toolbar"));
  objc_msgSend(v17, "setUserInteractionEnabled:", v3);

}

- (void)prepareForBarSourcedPopoverPresentation
{
  -[NotesDisplayController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

- (void)cleanupAfterBarSourcedPopoverPresentation
{
  -[NotesDisplayController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController activityPresentationController](self, "activityPresentationController"));

  if (v4 == v9)
  {
    -[NotesDisplayController didDismissActivityController](self, "didDismissActivityController");
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController pickerController](self, "pickerController"));

  if (v5 == v6)
  {
    -[NotesDisplayController didDismissPickerController](self, "didDismissPickerController");
    goto LABEL_7;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deletePresentationController](self, "deletePresentationController"));

  v8 = v9;
  if (v7 == v9)
  {
    -[NotesDisplayController didDismissDeleteAlertController](self, "didDismissDeleteAlertController");
LABEL_7:
    v8 = v9;
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_super v17;

  v4 = a4;
  v5 = a3;
  if (-[NotesDisplayController isEditing](self, "isEditing") != a3)
  {
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController delegate](self, "delegate"));
      v8 = objc_msgSend(v7, "canBeginEditingForNoteDisplayController:", self);

      if ((v8 & 1) == 0)
      {
        v16 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_10040B910(v16);
        goto LABEL_19;
      }
      -[NotesDisplayController turnOnContentLengthTrackingIfNeeded](self, "turnOnContentLengthTrackingIfNeeded");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
      objc_msgSend(v9, "setTracksMaximumContentLength:", 0);

    }
    v17.receiver = self;
    v17.super_class = (Class)NotesDisplayController;
    -[NotesDisplayController setEditing:animated:](&v17, "setEditing:animated:", v5, v4);
    if (v5)
    {
      -[NotesDisplayController setIsRespondingToStartEditing:](self, "setIsRespondingToStartEditing:", 1);
      -[NotesDisplayController rememberNoteContentForEditingIntent](self, "rememberNoteContentForEditingIntent");
    }
    else
    {
      -[NotesDisplayController setIsRespondingToEndEditing:](self, "setIsRespondingToEndEditing:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "noteHTMLEditorView"));
      objc_msgSend(v11, "stopEditing");

      -[NotesDisplayController invalidateAutosaveTimer](self, "invalidateAutosaveTimer");
      -[NotesDisplayController saveNote](self, "saveNote");
      -[NotesDisplayController donateEditingIntentIfNecessary](self, "donateEditingIntentIfNecessary");
    }
    if (-[NotesDisplayController isViewLoaded](self, "isViewLoaded")
      && -[NotesDisplayController isVisible](self, "isVisible"))
    {
      if (v5)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noteHTMLEditorView"));
        objc_msgSend(v13, "startEditing");

      }
    }
    else if (v5)
    {
      -[NotesDisplayController setStartEditingAfterViewAppears:](self, "setStartEditingAfterViewAppears:", 1);
    }
    -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", v4);
    -[NotesDisplayController updateDate](self, "updateDate");
    -[NotesDisplayController updateNoteUserActivityState](self, "updateNoteUserActivityState");
    -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
    if (-[NotesDisplayController isEditing](self, "isEditing"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController delegate](self, "delegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      objc_msgSend(v14, "noteDisplayController:beginEditingNote:animated:", self, v15, v4);

      v16 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject postNotificationName:object:](v16, "postNotificationName:object:", ICNoteEditorViewControllerDidStartEditingNotification, self);
LABEL_19:

    }
  }
}

- (void)rememberNoteContentForEditingIntent
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentAsPlainTextPreservingNewlines"));
  -[NotesDisplayController setOriginalPlainTextNoteContent:](self, "setOriginalPlainTextNoteContent:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController originalPlainTextNoteContent](self, "originalPlainTextNoteContent"));
  -[NotesDisplayController setIsEditingNewNote:](self, "setIsEditingNewNote:", objc_msgSend(v5, "length") == 0);

}

- (void)donateEditingIntentIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentAsPlainTextPreservingNewlines"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    if (-[NotesDisplayController isEditingNewNote](self, "isEditingNewNote"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICIntentsUtilities interactionForCreateNote:](ICIntentsUtilities, "interactionForCreateNote:", v6));
      +[ICIntentsUtilities donateInteraction:](ICIntentsUtilities, "donateInteraction:", v7);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController originalPlainTextNoteContent](self, "originalPlainTextNoteContent"));

      if (!v8)
        goto LABEL_6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentAsPlainTextPreservingNewlines"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController originalPlainTextNoteContent](self, "originalPlainTextNoteContent"));
      v11 = objc_msgSend(v6, "hasPrefix:", v10);

      if (!v11)
        goto LABEL_5;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController originalPlainTextNoteContent](self, "originalPlainTextNoteContent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v12, "length")));

      if (objc_msgSend(v7, "hasPrefix:", CFSTR("\n")))
      {
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", 1));

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICIntentsUtilities interactionForAppendToNote:withAppendedText:](ICIntentsUtilities, "interactionForAppendToNote:withAppendedText:", v14, v13));
        +[ICIntentsUtilities donateInteraction:](ICIntentsUtilities, "donateInteraction:", v15);

        v7 = (void *)v13;
      }
    }

LABEL_5:
  }
LABEL_6:
  -[NotesDisplayController setIsEditingNewNote:](self, "setIsEditingNewNote:", 0);
  -[NotesDisplayController setOriginalPlainTextNoteContent:](self, "setOriginalPlainTextNoteContent:", 0);
}

- (id)noteIdentifierForNoteContentLayer:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  return v4;
}

- (BOOL)isNoteManagedForNoteContentLayer:(id)a3
{
  return -[NotesDisplayController noteIsManaged](self, "noteIsManaged", a3);
}

- (BOOL)noteContentLayerShouldBeginEditing:(id)a3 isUserInitiated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v8;
  unsigned __int8 v9;

  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG", a3, a4) & 1) != 0)return 0;
  -[NotesDisplayController stopTextFinding](self, "stopTextFinding");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController presentedViewController](self, "presentedViewController"));

  if (v6)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "canBeginEditingForNoteDisplayController:", self);

  return v9;
}

- (void)noteContentLayerContentWillChange:(id)a3
{
  -[NotesDisplayController setIsUpdatingNoteContent:](self, "setIsUpdatingNoteContent:", 1);
}

- (void)noteContentLayerContentDidChange:(id)a3 updatedTitle:(BOOL)a4 fromDrop:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a4;
  -[NotesDisplayController setIsUpdatingNoteContent:](self, "setIsUpdatingNoteContent:", 0);
  -[NotesDisplayController resetAutosaveTimer](self, "resetAutosaveTimer");
  -[NotesDisplayController setContentHasUnsavedChanges:](self, "setContentHasUnsavedChanges:", 1);
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate ic_modificationDateForNoteBeingEdited](NSDate, "ic_modificationDateForNoteBeingEdited"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modificationDate"));
  v10 = objc_msgSend(v9, "isEqual:", v12);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v11, "setModificationDate:", v12);

  }
  if (v6)
  {
    -[NotesDisplayController updateNoteTitle](self, "updateNoteTitle");
    -[NotesDisplayController updateNoteProviderStatus](self, "updateNoteProviderStatus");
    -[NotesDisplayController updateNoteUserActivityState](self, "updateNoteUserActivityState");
  }
  -[NotesDisplayController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
  if (v5)
    -[NotesDisplayController saveNote](self, "saveNote");

}

- (BOOL)noteContentLayer:(id)a3 acceptStringIncreasingContentLength:(id)a4
{
  id v5;
  void *v6;
  char *v7;
  BOOL v8;

  v5 = a4;
  if (-[NotesDisplayController noteHasSizeLimit](self, "noteHasSizeLimit"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    v7 = (char *)objc_msgSend(v6, "length");

    v8 = -[NotesDisplayController acceptNewSize:](self, "acceptNewSize:", &v7[-[NotesDisplayController estimatedSizeOfDisplayedContent](self, "estimatedSizeOfDisplayedContent")]);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)noteContentLayer:(id)a3 setEditing:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v6)
  {
    if (-[NotesDisplayController isRespondingToStartEditing](self, "isRespondingToStartEditing"))
    {
      -[NotesDisplayController setIsRespondingToStartEditing:](self, "setIsRespondingToStartEditing:", 0);
      goto LABEL_10;
    }
  }
  else if (-[NotesDisplayController isRespondingToEndEditing](self, "isRespondingToEndEditing"))
  {
LABEL_9:
    -[NotesDisplayController setIsRespondingToEndEditing:](self, "setIsRespondingToEndEditing:", 0);
    goto LABEL_10;
  }
  if (-[NotesDisplayController isEditing](self, "isEditing") != v6
    && !-[NotesDisplayController isPickingAttachment](self, "isPickingAttachment")
    && !-[NotesDisplayController isChangingTraitCollection](self, "isChangingTraitCollection"))
  {
    -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", v6, v5);
    -[NotesDisplayController setIsRespondingToStartEditing:](self, "setIsRespondingToStartEditing:", 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)noteContentLayer:(id)a3 willHitTestWithEvent:(id)a4
{
  void *v5;
  void *v6;
  const __CFArray *Children;
  const __CFArray *v8;
  const void *ValueAtIndex;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (+[ICDeviceSupport deviceSupportsPencil](ICDeviceSupport, "deviceSupportsPencil"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController presentedViewController](self, "presentedViewController"));
    if (v6)
    {
LABEL_3:

      goto LABEL_10;
    }
    if ((objc_msgSend(v5, "BOOLForKey:", CFSTR("hasShownPencilUnsupportedAlertForHTMLNote")) & 1) == 0)
    {
      if (objc_msgSend(v20, "_hidEvent"))
      {
        Children = (const __CFArray *)IOHIDEventGetChildren();
        if (Children)
        {
          v8 = Children;
          if (CFArrayGetCount(Children))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v8, 0);
            if (IOHIDEventGetType(objc_msgSend(v20, "_hidEvent")) == 11
              && !IOHIDEventGetIntegerValue(ValueAtIndex, 720900))
            {
              v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Drawing Not Supported"), &stru_1005704B8, 0));

              v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Drawing using Apple Pencil is only supported on notes in your iCloud or On My iPad accounts."), &stru_1005704B8, 0));

              v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v19, 1));
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1005704B8, 0));
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));

              objc_msgSend(v12, "addAction:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Settings"), &stru_1005704B8, 0));
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, &stru_100554BC8));

              objc_msgSend(v12, "addAction:", v18);
              objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("hasShownPencilUnsupportedAlertForHTMLNote"));
              -[NotesDisplayController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

              goto LABEL_3;
            }
          }
        }
      }
    }
  }
LABEL_10:

}

- (BOOL)noteContentLayer:(id)a3 acceptContentsFromItemProviders:(id)a4
{
  if (-[NotesDisplayController noteHasSizeLimit](self, "noteHasSizeLimit", a3, a4))
    return -[NotesDisplayController acceptNewSize:](self, "acceptNewSize:", (char *)-[NotesDisplayController estimatedSizeOfDisplayedContent](self, "estimatedSizeOfDisplayedContent")+ 1000000);
  else
    return 1;
}

- (BOOL)noteContentLayer:(id)a3 acceptContentsFromPasteboard:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a4;
  if (-[NotesDisplayController noteHasSizeLimit](self, "noteHasSizeLimit"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_dataForPasteboardTypes:", 0, 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v6);
          v9 += (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "ic_lengthAsMIMEAttachment");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v12 = -[NotesDisplayController acceptNewSize:](self, "acceptNewSize:", (char *)-[NotesDisplayController estimatedSizeOfDisplayedContent](self, "estimatedSizeOfDisplayedContent")+ v9);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)noteContentLayer:(id)a3 showShareSheetForAttachment:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController attachmentPresentations](self, "attachmentPresentations", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentID"));
        v16 = objc_msgSend(v15, "isEqualToString:", v8);

        if (v16)
        {
          -[NotesDisplayController showActionsForAttachmentPresentation:atPoint:](self, "showActionsForAttachmentPresentation:atPoint:", v14, x, y);
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)noteContentLayer:(id)a3 openURL:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "openURL:options:completionHandler:", v4, &__NSDictionary0__struct, 0);

}

- (void)noteContentLayer:(id)a3 didInvokeFormattingCalloutOption:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)qword_1005DDF90;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v7, "submitNoteEditorCallOutBarButtonSelectionEventForHTMLNote:buttonTypeValue:", v8, objc_msgSend(v9, "integerValue"));

  }
}

- (void)noteContentLayer:(id)a3 didInvokeStyleFormattingOption:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)qword_1005DDF98;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController eventReporter](self, "eventReporter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    objc_msgSend(v7, "submitStyleFormatEventForHTMLNote:styleTypeValue:", v8, objc_msgSend(v9, "integerValue"));

  }
}

- (id)noteContentLayer:(id)a3 updateAttachments:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  uint64_t v32;
  void *k;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];

  v4 = a4;
  v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i)));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resourceSpecifier"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resourceSpecifier"));
          v15 = objc_msgSend(v13, "containsObject:", v14);

          if (v15)
            objc_msgSend(v61, "addObject:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resourceSpecifier"));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v8);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attachments"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v70 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentID"));

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentID"));
          objc_msgSend(v5, "removeObjectForKey:", v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    }
    while (v20);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v61));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v27));
  if (objc_msgSend(v28, "count"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "managedObjectContext"));

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v54 = v28;
    v30 = v28;
    v63 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    if (v63)
    {
      v53 = v27;
      v31 = 0;
      v32 = *(_QWORD *)v66;
      v58 = v6;
      v59 = v5;
      v56 = *(_QWORD *)v66;
      v57 = v30;
      do
      {
        for (k = 0; k != v63; k = (char *)k + 1)
        {
          if (*(_QWORD *)v66 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)k);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "scheme"));
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("cid"));

          if (v36)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "resourceSpecifier"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteAttachmentObjectWithContentID:](self, "noteAttachmentObjectWithContentID:", v37));

            if (v38)
            {
              v64 = 0;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "attachmentDataWithError:", &v64));
              v40 = v64;
              if (v40)
              {
                v41 = os_log_create("com.apple.notes", "UI");
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v34;
                  _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Could not load attachment data for attachment %@", buf, 0xCu);
                }

              }
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "noteContext"));

              v44 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyContentUtilities generateContentID](ICLegacyContentUtilities, "generateContentID"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "mimeType"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "filename"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[ICLegacyContentUtilities createAttachmentWithContentID:mimeType:data:filename:inContext:](ICLegacyContentUtilities, "createAttachmentWithContentID:mimeType:data:filename:inContext:", v44, v45, v39, v46, v43));

              v48 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
              objc_msgSend(v48, "addAttachmentsObject:", v47);

              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "cidURL"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "absoluteString"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "absoluteString"));
              objc_msgSend(v60, "setObject:forKeyedSubscript:", v50, v51);

              v31 = 1;
              v6 = v58;
              v5 = v59;
              v32 = v56;
              v30 = v57;
            }

          }
        }
        v63 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      }
      while (v63);

      v27 = v53;
      if ((v31 & 1) != 0)
        objc_msgSend(v55, "ic_save");
    }
    else
    {

    }
    v28 = v54;
  }

  return v60;
}

- (void)showAttachmentsUnsupportedAlertForNoteContentLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unsupported Attachment"), &stru_1005704B8, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "store"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedAttachmentsNotSupportedReason"));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v9, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1005704B8, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, 0));

  objc_msgSend(v13, "addAction:", v12);
  -[NotesDisplayController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

- (id)archivedConfiguration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSString *v18;
  void *v19;
  CGPoint v21;

  if (-[NotesDisplayController noteContainsValuableContent](self, "noteContainsValuableContent"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "integerId"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "integerId"));
        objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("NoteRecordId"));

      }
    }
    if (-[NotesDisplayController isEditing](self, "isEditing"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("IsEditing"));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
      objc_msgSend(v12, "contentOffset");
      v14 = v13;
      v16 = v15;

      if (v14 != CGPointZero.x || v16 != CGPointZero.y)
      {
        v21.x = v14;
        v21.y = v16;
        v18 = NSStringFromCGPoint(v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ContentOffset"));

      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)restoreState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController pendingArchivedNoteID](self, "pendingArchivedNoteID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "integerId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController pendingArchivedNoteID](self, "pendingArchivedNoteID"));
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      if (-[NotesDisplayController pendingArchivedEditingState](self, "pendingArchivedEditingState"))
        -[NotesDisplayController setEditing:animated:](self, "setEditing:animated:", 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
      -[NotesDisplayController pendingArchivedContentOffset](self, "pendingArchivedContentOffset");
      objc_msgSend(v8, "setContentOffset:");

    }
    -[NotesDisplayController setPendingArchivedContentOffset:](self, "setPendingArchivedContentOffset:", CGPointZero.x, CGPointZero.y);
    -[NotesDisplayController setPendingArchivedNoteID:](self, "setPendingArchivedNoteID:", 0);
    -[NotesDisplayController setPendingArchivedEditingState:](self, "setPendingArchivedEditingState:", 0);
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)NotesDisplayController;
  v7 = a4;
  -[NotesDisplayController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  objc_msgSend(v8, "setNeedsUpdateConstraints");

  -[NotesDisplayController setTransitioningToSize:](self, "setTransitioningToSize:", 1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F16A4;
  v9[3] = &unk_1005500E8;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &stru_100554BE8, v9);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v10;
  _QWORD v11[5];
  unsigned __int8 v12;

  v6 = a4;
  v7 = a3;
  -[NotesDisplayController setChangingTraitCollection:](self, "setChangingTraitCollection:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v9 = objc_msgSend(v8, "isFirstResponder");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F17EC;
  v11[3] = &unk_100554C10;
  v11[4] = self;
  v12 = v9;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v11);
  v10.receiver = self;
  v10.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController willTransitionToTraitCollection:withTransitionCoordinator:](&v10, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6);

}

- (id)contextManager
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)qword_1005DDFA0;
  if (qword_1005DDFA0)
    goto LABEL_5;
  v3 = UISystemRootDirectory(0, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/AssistantServices.framework")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v5));
  if (objc_msgSend(v6, "load"))
    qword_1005DDFA0 = (uint64_t)NSClassFromString(CFSTR("AFContextManager"));

  v2 = (void *)qword_1005DDFA0;
  if (qword_1005DDFA0)
LABEL_5:
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultContextManager"));
  return v2;
}

- (void)updateContextProviderStatus
{
  unsigned int v3;
  void *v4;
  id v5;

  v3 = -[NotesDisplayController canProvideNote](self, "canProvideNote");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contextManager](self, "contextManager"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addContextProvider:", self);
  else
    objc_msgSend(v4, "removeContextProvider:", self);

}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  void *v3;
  Class v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[NotesDisplayController saveNote](self, "saveNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v4 = NSClassFromString(CFSTR("SANoteObject"));
  if (!v4)
  {
    v5 = objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/SAObjects.framework/SAObjects"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v5));
    if (dlopen((const char *)objc_msgSend(v6, "UTF8String"), 1))
    {
      v4 = NSClassFromString(CFSTR("SANoteObject"));
    }
    else
    {
      NSLog(CFSTR("Unable to load framework"));
      v4 = 0;
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class object](v4, "object"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject noteId](self->_note, "noteId"));
    objc_msgSend(v7, "setIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionary"));
    objc_msgSend(v3, "addObject:", v9);

  }
  return v3;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NotesDisplayController;
  -[NotesDisplayController setNeedsStatusBarAppearanceUpdate](&v4, "setNeedsStatusBarAppearanceUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setNeedsStatusBarAppearanceUpdate");

}

- (int64_t)preferredStatusBarStyle
{
  if (+[UITraitCollection ic_alwaysShowLightContent](UITraitCollection, "ic_alwaysShowLightContent"))return 3;
  else
    return 0;
}

- (void)updateForceLightContentIfNecessary
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void **v29;
  uint64_t v30;
  id (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  char v34;

  v3 = +[UITraitCollection ic_alwaysShowLightContent](UITraitCollection, "ic_alwaysShowLightContent");
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", v3));
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController parentViewController](self, "parentViewController"));
  objc_msgSend(v6, "setOverrideTraitCollection:forChildViewController:", v5, self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  objc_msgSend(v8, "setOverrideUserInterfaceStyle:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", v4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController webView](self, "webView"));
  objc_msgSend(v10, "setOverrideUserInterfaceStyle:", v4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "backgroundColor"));

  v29 = _NSConcreteStackBlock;
  v30 = 3221225472;
  v31 = sub_1000F1DC0;
  v32 = &unk_100554C58;
  v34 = v4;
  v33 = v12;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &v29));
  v15 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v15, "configureWithTransparentBackground", v29, v30, v31, v32);
  objc_msgSend(v15, "setBackgroundColor:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationBar"));
  objc_msgSend(v17, "setStandardAppearance:", v15);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "navigationBar"));
  objc_msgSend(v19, "setCompactAppearance:", v15);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
  objc_msgSend(v20, "setStandardAppearance:", v15);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationItem](self, "navigationItem"));
  objc_msgSend(v21, "setCompactAppearance:", v15);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "toolbar"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "standardAppearance"));

  objc_msgSend(v24, "configureWithTransparentBackground");
  objc_msgSend(v24, "setBackgroundColor:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "toolbar"));
  objc_msgSend(v26, "setStandardAppearance:", v24);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController navigationController](self, "navigationController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "toolbar"));
  objc_msgSend(v28, "setCompactAppearance:", v24);

  -[NotesDisplayController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)updateUserActivityStatus
{
  void *v3;
  void *v4;
  id v5;

  if (-[NotesDisplayController canProvideNote](self, "canProvideNote"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivity](self, "noteUserActivity"));

    if (!v3)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Notes"));
      objc_msgSend(v5, "setDelegate:", self);
      objc_msgSend(v5, "setEligibleForSearch:", 1);
      -[NotesDisplayController setNoteUserActivity:](self, "setNoteUserActivity:", v5);
      -[NotesDisplayController updateNoteUserActivityState](self, "updateNoteUserActivityState");
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivity](self, "noteUserActivity"));
      objc_msgSend(v4, "becomeCurrent");

    }
  }
  else
  {
    -[NotesDisplayController invalidateNoteUserActivity](self, "invalidateNoteUserActivity");
  }
}

- (void)updateNoteUserActivityState
{
  uint64_t v3;
  void *v4;
  void *v5;
  NoteUserActivityState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NoteUserActivityState *v23;

  v3 = objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivity](self, "noteUserActivity"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));

    if (v5)
    {
      v6 = [NoteUserActivityState alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v23 = -[NoteUserActivityState initWithNote:](v6, "initWithNote:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      -[NoteUserActivityState setTitle:](v23, "setTitle:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guid"));
      -[NoteUserActivityState setNoteID:](v23, "setNoteID:", v11);

      -[NoteUserActivityState setEditing:](v23, "setEditing:", -[NotesDisplayController isEditing](self, "isEditing"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modificationDate"));

      if (-[NotesDisplayController isEditing](self, "isEditing"))
      {
        v14 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

        v13 = (void *)v14;
      }
      -[NoteUserActivityState setModificationDate:](v23, "setModificationDate:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "creationDate"));
      -[NoteUserActivityState setCreationDate:](v23, "setCreationDate:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      LODWORD(v16) = sub_10005CC4C(v17);

      if ((_DWORD)v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
        -[NoteUserActivityState setContentPlainText:](v23, "setContentPlainText:", objc_msgSend(v18, "isPlainText"));

      }
      -[NotesDisplayController setNoteUserActivityState:](self, "setNoteUserActivityState:", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
      v20 = sub_10005CD54(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivity](self, "noteUserActivity"));
      objc_msgSend(v21, "setEligibleForHandoff:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivity](self, "noteUserActivity"));
      objc_msgSend(v22, "setNeedsSave:", 1);

    }
  }
}

- (void)invalidateNoteUserActivity
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivity](self, "noteUserActivity"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivity](self, "noteUserActivity"));
  objc_msgSend(v4, "invalidate");

  -[NotesDisplayController setNoteUserActivity:](self, "setNoteUserActivity:", 0);
  -[NotesDisplayController setNoteUserActivityState:](self, "setNoteUserActivityState:", 0);
}

- (void)userActivityWasContinued:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2238;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)userActivityWillSave:(id)a3
{
  void *v4;
  id obj;

  obj = a3;
  objc_sync_enter(obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController noteUserActivityState](self, "noteUserActivityState"));
  objc_msgSend(v4, "updateUserActivity:", obj);

  objc_sync_exit(obj);
}

- (void)runScrollPerformanceTest:(id)a3 iterations:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController contentLayer](self, "contentLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteHTMLEditorView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
  objc_msgSend(v10, "bounds");
  v12 = (int)v11;

  v13 = objc_opt_self(self);
  v18 = (id)objc_claimAutoreleasedReturnValue(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentLayer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteHTMLEditorView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "webView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scrollView"));
  objc_msgSend(v17, "_performScrollTest:iterations:delta:", v6, v4, v12);

}

- (void)applyAccessibilityInfo
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("New note"), &stru_1005704B8, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Double tap to compose a new note."), &stru_1005704B8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createBarButtonItem](self, "createBarButtonItem"));
  objc_msgSend(v6, "setAccessibilityLabel:", v26);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createNavBarButtonItem](self, "createNavBarButtonItem"));
  objc_msgSend(v7, "setAccessibilityLabel:", v26);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createBarButtonItem](self, "createBarButtonItem"));
  objc_msgSend(v8, "setAccessibilityHint:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController createNavBarButtonItem](self, "createNavBarButtonItem"));
  objc_msgSend(v9, "setAccessibilityHint:", v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Share note"), &stru_1005704B8, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Double tap to share the current note."), &stru_1005704B8, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareBarButtonItem](self, "shareBarButtonItem"));
  objc_msgSend(v14, "setAccessibilityLabel:", v11);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareNavBarButtonItem](self, "shareNavBarButtonItem"));
  objc_msgSend(v15, "setAccessibilityLabel:", v11);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareBarButtonItem](self, "shareBarButtonItem"));
  objc_msgSend(v16, "setAccessibilityHint:", v13);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController shareNavBarButtonItem](self, "shareNavBarButtonItem"));
  objc_msgSend(v17, "setAccessibilityHint:", v13);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Delete note"), &stru_1005704B8, 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Double tap to delete the current note."), &stru_1005704B8, 0));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteBarButtonItem](self, "deleteBarButtonItem"));
  objc_msgSend(v22, "setAccessibilityLabel:", v19);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteNavBarButtonItem](self, "deleteNavBarButtonItem"));
  objc_msgSend(v23, "setAccessibilityLabel:", v19);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteBarButtonItem](self, "deleteBarButtonItem"));
  objc_msgSend(v24, "setAccessibilityHint:", v21);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController deleteNavBarButtonItem](self, "deleteNavBarButtonItem"));
  objc_msgSend(v25, "setAccessibilityHint:", v21);

}

- (void)updateViewAnnotation
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NotesDisplayController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotesDisplayController note](self, "note"));
  objc_msgSend(v4, "ic_annotateWithNote:", v3);

}

- (BOOL)contentHasUnsavedChanges
{
  return self->_contentHasUnsavedChanges;
}

- (void)setContentHasUnsavedChanges:(BOOL)a3
{
  self->_contentHasUnsavedChanges = a3;
}

- (NotesDisplayControllerDelegate)delegate
{
  return (NotesDisplayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (BOOL)isSplitViewExpandingOrCollapsing
{
  return self->_splitViewExpandingOrCollapsing;
}

- (NoteObject)note
{
  return self->_note;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayer, a3);
}

- (NSArray)attachmentPresentations
{
  return self->_attachmentPresentations;
}

- (void)setAttachmentPresentations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)allAttachmentPresentationOccurences
{
  return self->_allAttachmentPresentationOccurences;
}

- (UIImagePickerController)pickerController
{
  return self->_pickerController;
}

- (void)setPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerController, a3);
}

- (UIPresentationController)activityPresentationController
{
  return self->_activityPresentationController;
}

- (void)setActivityPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_activityPresentationController, a3);
}

- (UIPresentationController)deletePresentationController
{
  return self->_deletePresentationController;
}

- (void)setDeletePresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_deletePresentationController, a3);
}

- (NoteAttachmentPresentationOccurence)occurenceShowingActivity
{
  return self->_occurenceShowingActivity;
}

- (void)setOccurenceShowingActivity:(id)a3
{
  objc_storeStrong((id *)&self->_occurenceShowingActivity, a3);
}

- (CGPoint)inOccurenceActivityOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_inOccurenceActivityOrigin.x;
  y = self->_inOccurenceActivityOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInOccurenceActivityOrigin:(CGPoint)a3
{
  self->_inOccurenceActivityOrigin = a3;
}

- (BOOL)isPickingAttachment
{
  return self->_pickingAttachment;
}

- (void)setPickingAttachment:(BOOL)a3
{
  self->_pickingAttachment = a3;
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (void)setCloseAuxiliaryWindowButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeAuxiliaryWindowButton, a3);
}

- (void)setActionButtonItemsForToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonItemsForToolbar, a3);
}

- (void)setActionButtonItemsForNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonItemsForNavBar, a3);
}

- (CGPoint)pendingArchivedContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_pendingArchivedContentOffset.x;
  y = self->_pendingArchivedContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPendingArchivedContentOffset:(CGPoint)a3
{
  self->_pendingArchivedContentOffset = a3;
}

- (BOOL)pendingArchivedEditingState
{
  return self->_pendingArchivedEditingState;
}

- (void)setPendingArchivedEditingState:(BOOL)a3
{
  self->_pendingArchivedEditingState = a3;
}

- (NSNumber)pendingArchivedNoteID
{
  return self->_pendingArchivedNoteID;
}

- (void)setPendingArchivedNoteID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingArchivedNoteID, a3);
}

- (BOOL)canProvideNote
{
  return self->_canProvideNote;
}

- (void)setCanProvideNote:(BOOL)a3
{
  self->_canProvideNote = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSDate)displayedNoteVersionTimestamp
{
  return self->_displayedNoteVersionTimestamp;
}

- (void)setDisplayedNoteVersionTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_displayedNoteVersionTimestamp, a3);
}

- (NSManagedObjectID)displayedNoteVersionObjectID
{
  return self->_displayedNoteVersionObjectID;
}

- (void)setDisplayedNoteVersionObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_displayedNoteVersionObjectID, a3);
}

- (NSUserActivity)noteUserActivity
{
  return (NSUserActivity *)objc_getProperty(self, a2, 176, 1);
}

- (void)setNoteUserActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NoteUserActivityState)noteUserActivityState
{
  return (NoteUserActivityState *)objc_getProperty(self, a2, 184, 1);
}

- (void)setNoteUserActivityState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (BOOL)isChangingTraitCollection
{
  return self->_changingTraitCollection;
}

- (void)setChangingTraitCollection:(BOOL)a3
{
  self->_changingTraitCollection = a3;
}

- (UIBarButtonItem)createNavBarButtonItem
{
  return self->_createNavBarButtonItem;
}

- (void)setCreateNavBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_createNavBarButtonItem, a3);
}

- (UIBarButtonItem)shareNavBarButtonItem
{
  return self->_shareNavBarButtonItem;
}

- (void)setShareNavBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareNavBarButtonItem, a3);
}

- (UIBarButtonItem)deleteNavBarButtonItem
{
  return self->_deleteNavBarButtonItem;
}

- (void)setDeleteNavBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteNavBarButtonItem, a3);
}

- (UIBarButtonItem)createBarButtonItem
{
  return self->_createBarButtonItem;
}

- (void)setCreateBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_createBarButtonItem, a3);
}

- (UIBarButtonItem)shareBarButtonItem
{
  return self->_shareBarButtonItem;
}

- (void)setShareBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareBarButtonItem, a3);
}

- (UIBarButtonItem)deleteBarButtonItem
{
  return self->_deleteBarButtonItem;
}

- (void)setDeleteBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteBarButtonItem, a3);
}

- (_NSRange)selectedRangeBeforeTextFinding
{
  _NSRange *p_selectedRangeBeforeTextFinding;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedRangeBeforeTextFinding = &self->_selectedRangeBeforeTextFinding;
  location = self->_selectedRangeBeforeTextFinding.location;
  length = p_selectedRangeBeforeTextFinding->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectedRangeBeforeTextFinding:(_NSRange)a3
{
  self->_selectedRangeBeforeTextFinding = a3;
}

- (BOOL)isEditingNewNote
{
  return self->_isEditingNewNote;
}

- (void)setIsEditingNewNote:(BOOL)a3
{
  self->_isEditingNewNote = a3;
}

- (BOOL)startEditingAfterViewAppears
{
  return self->_startEditingAfterViewAppears;
}

- (void)setStartEditingAfterViewAppears:(BOOL)a3
{
  self->_startEditingAfterViewAppears = a3;
}

- (NSString)originalPlainTextNoteContent
{
  return self->_originalPlainTextNoteContent;
}

- (void)setOriginalPlainTextNoteContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (BOOL)noteIsManaged
{
  return self->_noteIsManaged;
}

- (void)setNoteIsManaged:(BOOL)a3
{
  self->_noteIsManaged = a3;
}

- (BOOL)transitioningToSize
{
  return self->_transitioningToSize;
}

- (void)setTransitioningToSize:(BOOL)a3
{
  self->_transitioningToSize = a3;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (BOOL)isUpdatingNoteContent
{
  return self->_isUpdatingNoteContent;
}

- (void)setIsUpdatingNoteContent:(BOOL)a3
{
  self->_isUpdatingNoteContent = a3;
}

- (BOOL)isRespondingToStartEditing
{
  return self->_isRespondingToStartEditing;
}

- (void)setIsRespondingToStartEditing:(BOOL)a3
{
  self->_isRespondingToStartEditing = a3;
}

- (BOOL)isRespondingToEndEditing
{
  return self->_isRespondingToEndEditing;
}

- (void)setIsRespondingToEndEditing:(BOOL)a3
{
  self->_isRespondingToEndEditing = a3;
}

- (BOOL)delayingSetContent
{
  return self->_delayingSetContent;
}

- (void)setDelayingSetContent:(BOOL)a3
{
  self->_delayingSetContent = a3;
}

- (BOOL)didSetContentFromNote
{
  return self->_didSetContentFromNote;
}

- (void)setDidSetContentFromNote:(BOOL)a3
{
  self->_didSetContentFromNote = a3;
}

- (NotesBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSTimer)autosaveTimer
{
  return self->_autosaveTimer;
}

- (void)setAutosaveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autosaveTimer, a3);
}

- (BOOL)isPerformingDeleteAnimation
{
  return self->_performingDeleteAnimation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autosaveTimer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_originalPlainTextNoteContent, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_createBarButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_createNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_noteUserActivityState, 0);
  objc_storeStrong((id *)&self->_noteUserActivity, 0);
  objc_storeStrong((id *)&self->_displayedNoteVersionObjectID, 0);
  objc_storeStrong((id *)&self->_displayedNoteVersionTimestamp, 0);
  objc_storeStrong((id *)&self->_pendingArchivedNoteID, 0);
  objc_storeStrong((id *)&self->_actionButtonItemsForNavBar, 0);
  objc_storeStrong((id *)&self->_actionButtonItemsForToolbar, 0);
  objc_storeStrong((id *)&self->_closeAuxiliaryWindowButton, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_occurenceShowingActivity, 0);
  objc_storeStrong((id *)&self->_deletePresentationController, 0);
  objc_storeStrong((id *)&self->_activityPresentationController, 0);
  objc_storeStrong((id *)&self->_pickerController, 0);
  objc_storeStrong((id *)&self->_allAttachmentPresentationOccurences, 0);
  objc_storeStrong((id *)&self->_attachmentPresentations, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nonManagedAttachmentPresentationOccurences, 0);
}

@end
