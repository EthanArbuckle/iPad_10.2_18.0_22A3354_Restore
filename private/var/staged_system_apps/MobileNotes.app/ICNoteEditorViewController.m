@implementation ICNoteEditorViewController

- (void)ppt_didFinishExtendedLaunch
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  objc_msgSend(v2, "didFinishExtendedLaunch");

}

- (void)ppt_didShowNoteEditor
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "isRunningTest");

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v4, "didShowNoteEditor");

  }
}

- (void)ppt_willLoadNoteIntoEditor
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  objc_msgSend(v2, "willLoadNoteIntoEditor");

}

- (void)ppt_didEditorBeginEditing
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "isRunningTest");

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v4, "didEditorBeginEditing");

  }
}

- (void)ppt_textViewDidChange
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "isRunningTest");

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v4, "textViewDidChange");

  }
}

- (void)ppt_inkPickerDidShow
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "isRunningTest");

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v4, "inkPickerDidShow");

  }
}

- (void)ppt_noteEditorDidLayoutSubviews
{
  unsigned int v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if (objc_msgSend(v4, "isRunningTest"))
  {
    v3 = -[ICNoteEditorViewController _appearState](self, "_appearState");

    if (v3 != 1)
      return;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v4, "noteEditorDidLayoutSubviews");
  }

}

- (id)realtimeCollaborationSelectionController
{
  uint64_t v3;
  id AssociatedObject;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(ICRealtimeCollaborationSelectionController, a2);
  AssociatedObject = objc_getAssociatedObject(self, off_1005CD4B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)setRealtimeCollaborationSelectionController:(id)a3
{
  objc_setAssociatedObject(self, off_1005CD4B0, a3, (void *)1);
}

- (void)realtimeCollaborationControllerSessionWillBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int IsTextKit2Enabled;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attachments"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "paperBundleModel"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textLayoutManager"));
          if (v14)
          {
            v15 = (void *)v14;
            IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();

            if (IsTextKit2Enabled)
            {
              v17 = objc_opt_class(ICTK2TextLayoutManager);
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "textLayoutManager"));
              v20 = ICCheckedDynamicCast(v17, v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

              objc_msgSend(v4, "updatePaperKitMessengerForAttachment:textLayoutManager:", v11, v21);
LABEL_14:

              continue;
            }
          }
          else
          {

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layoutManager"));
          if (v22)
          {
            v23 = (void *)v22;
            v24 = ICInternalSettingsIsTextKit2Enabled();

            if ((v24 & 1) != 0)
              continue;
            v25 = objc_opt_class(ICLayoutManager);
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layoutManager"));
            v28 = ICCheckedDynamicCast(v25, v27);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v28);

            objc_msgSend(v4, "updatePaperKitMessengerForAttachment:layoutManager:", v11, v21);
          }
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v29, "addObserver:selector:name:object:", self, "paperKitViewDidAppear:", ICSystemPaperTextAttachmentDidAppearNotification, 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v30, "addObserver:selector:name:object:", self, "paperKitViewWillDisappear:", ICSystemPaperTextAttachmentWillDisappearNotification, 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v31, "addObserver:selector:name:object:", self, "noteCursorVisibilityChanged:", ICNoteShowsCollaboratorCursorsDidChangeNotification, 0);

}

- (void)realtimeCollaborationControllerSessionDidTerminate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v26 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, ICSystemPaperTextAttachmentDidAppearNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, ICSystemPaperTextAttachmentWillDisappearNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, ICNoteShowsCollaboratorCursorsDidChangeNotification, 0);

  -[ICNoteEditorViewController _realtimeCollaborationSessionStateDidChange](self, "_realtimeCollaborationSessionStateDidChange");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachments"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = ICAttachmentUTTypeSystemPaper;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "typeUTI"));
        v16 = objc_msgSend(v15, "isEqualToString:", v12);

        if (v16)
        {
          if (ICInternalSettingsIsTextKit2Enabled())
          {
            v17 = objc_opt_class(ICTK2TextLayoutManager);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "textLayoutManager"));
            v20 = ICCheckedDynamicCast(v17, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

            objc_msgSend(v26, "removePaperKitMessengerForAttachmentIfNecessary:textLayoutManager:", v14, v21);
          }
          else
          {
            v22 = objc_opt_class(ICLayoutManager);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutManager"));
            v25 = ICCheckedDynamicCast(v22, v24);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v25);

            objc_msgSend(v26, "removePaperKitMessengerForAttachmentIfNecessary:layoutManager:", v14, v21);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

}

- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationSelectionController](self, "realtimeCollaborationSelectionController"));
  objc_msgSend(v5, "realtimeCollaborationControllerDidChangeSelectionState:", v4);

}

- (void)paperKitViewDidAppear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_opt_class(UIView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICCheckedDynamicCast(v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
  objc_msgSend(v8, "configurePaperKitAttachmentViewIfNecessary:", v9);

}

- (void)paperKitViewWillDisappear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_opt_class(UIView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICCheckedDynamicCast(v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
  objc_msgSend(v8, "removePaperKitMessengerForViewIfNecessary:", v9);

}

- (void)noteCursorVisibilityChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a3;
  v5 = objc_opt_class(ICNote);
  v28 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = ICDynamicCast(v5, v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachments"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    v13 = ICAttachmentUTTypeSystemPaper;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "typeUTI"));
        v17 = objc_msgSend(v16, "isEqualToString:", v13);

        if (v17)
        {
          if (ICInternalSettingsIsTextKit2Enabled())
          {
            v18 = objc_opt_class(ICTK2TextLayoutManager);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textLayoutManager"));
            v21 = ICCheckedDynamicCast(v18, v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

            if (v22)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
              objc_msgSend(v23, "setShowsCursors:forPaperKitAttachment:textLayoutManager:", objc_msgSend(v29, "showsCollaboratorCursors"), v15, v22);
              goto LABEL_12;
            }
          }
          else
          {
            v24 = objc_opt_class(ICLayoutManager);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController textView](self, "textView"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutManager"));
            v27 = ICCheckedDynamicCast(v24, v26);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v27);

            if (v22)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
              objc_msgSend(v23, "setShowsCursors:forPaperKitAttachment:layoutManager:", objc_msgSend(v29, "showsCollaboratorCursors"), v15, v22);
LABEL_12:

            }
          }

          continue;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
  }

}

- (void)rcc_updatePaperKitMessengerForAttachment:(id)a3 layoutManager:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
  v8 = objc_msgSend(v7, "hasActiveSession");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
    objc_msgSend(v9, "updatePaperKitMessengerForAttachment:layoutManager:", v10, v6);

  }
}

- (void)rcc_updatePaperKitMessengerForAttachment:(id)a3 textLayoutManager:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
  v8 = objc_msgSend(v7, "hasActiveSession");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
    objc_msgSend(v9, "updatePaperKitMessengerForAttachment:textLayoutManager:", v10, v6);

  }
}

- (void)groupActivityDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  -[ICNoteEditorViewController updateFastSyncParticipantCursorsForNote:](self, "updateFastSyncParticipantCursorsForNote:", v3);

}

- (void)updateFastSyncParticipantCursorsForNote:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  ICRealtimeCollaborationSelectionController *v15;
  void *v16;
  ICRealtimeCollaborationSelectionController *v17;
  id v18;

  v18 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
  if (!v4)
    goto LABEL_7;
  v5 = (void *)v4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  if (!v6)
  {

    goto LABEL_7;
  }
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentNoteIdentifier"));
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (!v11)
  {
LABEL_7:
    -[ICNoteEditorViewController setRealtimeCollaborationSelectionController:](self, "setRealtimeCollaborationSelectionController:", 0);
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationSelectionController](self, "realtimeCollaborationSelectionController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "realtimeCollaborationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));

  if (v13 != v14)
  {
    v15 = [ICRealtimeCollaborationSelectionController alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController realtimeCollaborationController](self, "realtimeCollaborationController"));
    v17 = -[ICRealtimeCollaborationSelectionController initWithEditorController:realtimeCollaborationController:](v15, "initWithEditorController:realtimeCollaborationController:", self, v16);
    -[ICNoteEditorViewController setRealtimeCollaborationSelectionController:](self, "setRealtimeCollaborationSelectionController:", v17);

  }
LABEL_8:

}

- (void)app_showRecoverNoteAlert
{
  ICRecoverNoteAlertController *v3;
  void *v4;
  ICRecoverNoteAlertController *v5;

  v3 = [ICRecoverNoteAlertController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  v5 = -[ICRecoverNoteAlertController initWithNote:](v3, "initWithNote:", v4);

  -[ICRecoverNoteAlertController showFromViewController:](v5, "showFromViewController:", self);
}

- (void)app_showMoveToFolder
{
  ICMoveNoteActivity *v3;
  void *v4;
  ICMoveNoteActivity *v5;

  v3 = [ICMoveNoteActivity alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  v5 = -[ICMoveNoteActivity initWithNote:presentingViewController:](v3, "initWithNote:presentingViewController:", v4, self);

  -[ICMoveNoteActivity performActivityWithCompletion:](v5, "performActivityWithCompletion:", 0);
}

- (id)app_systemPaperInkPaletteButtonView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemPaperViewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inkPaletteButtonViewWithInkPaletteController:", v4));
  return v7;
}

- (void)app_showLearnMoreTags
{
  +[ICLearnMoreViewController showHelpWithPresentingViewController:](ICLearnMoreTagsViewController, "showHelpWithPresentingViewController:", self);
}

- (void)app_shareButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController eventReporter](self, "eventReporter"));
  objc_msgSend(v9, "presentSendNoteActivityViewControllerWithPresentingWindow:presentingViewController:sourceItem:sourceView:sourceRect:note:excludedTypes:eventReporter:didPresentActivityHandler:", v6, self, v4, 0, v7, &__NSArray0__struct, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, v8, 0);

}

- (void)collaborationButtons_setupCollaborationController
{
  ICCollaborationButtonsController *v3;
  void *v4;
  void *v5;
  ICCollaborationButtonsController *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = [ICCollaborationButtonsController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager"));
  v6 = -[ICCollaborationButtonsController initWithCloudObject:coordinator:](v3, "initWithCloudObject:coordinator:", v4, v5);
  -[ICNoteEditorViewController setCollaborationButtonsController:](self, "setCollaborationButtonsController:", v6);

  objc_copyWeak(&v9, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController collaborationButtonsController](self, "collaborationButtonsController", _NSConcreteStackBlock, 3221225472, sub_100094708, &unk_10054FF58));
  objc_msgSend(v7, "setDidPressManageShareButton:", &v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)collaborationButtons_collaborationBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController collaborationButtonsController](self, "collaborationButtonsController"));

  if (!v3)
    -[ICNoteEditorViewController collaborationButtons_setupCollaborationController](self, "collaborationButtons_setupCollaborationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController collaborationButtonsController](self, "collaborationButtonsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buttonItem"));
  -[ICNoteEditorViewController setCollaborationBarButtonItem:](self, "setCollaborationBarButtonItem:", v5);

  return -[ICNoteEditorViewController collaborationBarButtonItem](self, "collaborationBarButtonItem");
}

- (void)collaborationButtons_registerForSharedWithYouHighlightUpdates
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "sharedWithYouControllerDidUpdateHighlights:", ICSharedWithYouControllerDidUpdateHighlightsNotification, 0);

}

- (void)collaborationButtons_acceptInviteWithShareURL:(id)a3 invitationViewController:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  ICNoteEditorViewController *v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000949E8;
  block[3] = &unk_100550110;
  v7 = a4;
  v17 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  global_queue = dispatch_get_global_queue(2, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000949F4;
  v12[3] = &unk_100550020;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)app_createAndPresentCloudSharingControllerBySender:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController iCloudShareBarButtonItem](self, "iCloudShareBarButtonItem"));
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100094E60;
  v10[3] = &unk_100550110;
  v10[4] = self;
  objc_msgSend(v8, "showCloudSharingControllerForNote:presentingViewController:popoverBarButtonItem:presented:dismissed:", v9, self, v7, v10, 0);

}

- (BOOL)collaborationButtons_updateCollaborationStateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController collaborationButtonsController](self, "collaborationButtonsController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudObject"));

    if (!v5)
      return 0;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController collaborationButtonsController](self, "collaborationButtonsController"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController collaborationButtonsController](self, "collaborationButtonsController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cloudObject"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if ((v11 & 1) != 0)
      return 0;
  }
  -[ICNoteEditorViewController collaborationButtons_setupCollaborationController](self, "collaborationButtons_setupCollaborationController");
  return 1;
}

- (void)collaboration_setupActivityItemsConfigurationProvider
{
  ICNoteEditorActivityItemsConfigurationProvider *v3;

  v3 = -[ICNoteEditorActivityItemsConfigurationProvider initWithDelegate:]([ICNoteEditorActivityItemsConfigurationProvider alloc], "initWithDelegate:", self);
  -[ICNoteEditorViewController setActivityItemsConfigurationProvider:](self, "setActivityItemsConfigurationProvider:", v3);

}

- (BOOL)isDarkModeForActivityItemsConfiguration
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "ic_isDark");

  return v3;
}

- (void)link_addCreateNoteInteraction
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController view](self, "view"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000950C8;
  v4[3] = &unk_100552D38;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "ic_addCreateNoteInteractionWithFolderHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)link_addSetParagraphStyleInteraction
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController view](self, "view"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009520C;
  v4[3] = &unk_100552D60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "ic_addSetParagraphStyleInteractionWithStyleHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)link_addInsertNoteLinkInteraction
{
  -[ICNoteEditorViewController ic_addInsertNoteLinkInteraction](self, "ic_addInsertNoteLinkInteraction");
}

- (void)link_addReplaceSelectionInteraction
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController view](self, "view"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100095328;
  v4[3] = &unk_100552D88;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "ic_addReplaceSelectionInteractionWithTextHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)link_removeLinkActionInteractions
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController view](self, "view"));
  objc_msgSend(v2, "ic_removeLinkActionInteractions");

}

- (id)notePreview:(id)a3
{
  id v3;
  ICNotePreviewViewController *v4;

  v3 = a3;
  v4 = -[ICNotePreviewViewController initWithNote:]([ICNotePreviewViewController alloc], "initWithNote:", v3);

  return v4;
}

- (void)updateViewAnnotation
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController note](self, "note"));
  objc_msgSend(v4, "ic_annotateWithNote:", v3);

}

- (BOOL)noteEditorActionMenuCanScanDocuments:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!+[UIDevice ic_isVision](UIDevice, "ic_isVision", a3))
    return +[ICDeviceSupport isCameraAvailable](ICDeviceSupport, "isCameraAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaBarButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "menu"));
  v7 = v6 != 0;

  return v7;
}

- (void)noteEditorActionMenuShouldScanDocuments:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009E7FC;
  v3[3] = &unk_100550110;
  v3[4] = self;
  -[ICNoteEditorViewController ic_dismissPresentedViewControllerAnimated:completion:](self, "ic_dismissPresentedViewControllerAnimated:completion:", 1, v3);
}

- (void)noteEditorActionMenuShouldDeleteNote:(id)a3
{
  -[ICNoteEditorViewController deleteCurrentNote:](self, "deleteCurrentNote:", 0);
}

- (void)noteEditorActionMenuShouldFindInNote:(id)a3
{
  -[ICNoteEditorViewController performFindInNote:](self, "performFindInNote:", 0);
}

- (void)noteEditorActionMenuShouldShowHandwritingDebug:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009E868;
  v3[3] = &unk_100550110;
  v3[4] = self;
  -[ICNoteEditorViewController ic_dismissPresentedViewControllerAnimated:completion:](self, "ic_dismissPresentedViewControllerAnimated:completion:", 1, v3);
}

- (void)noteEditorActionMenuWillShow:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "noteEditorDidTapActionMenu:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorViewController delegate](self, "delegate"));
    objc_msgSend(v6, "noteEditorDidTapActionMenu:", self);

  }
  -[ICNoteEditorViewController hideInkPicker](self, "hideInkPicker");
}

- (id)noteEditorActionMenuShouldCreateNewNote:(id)a3
{
  return -[ICNoteEditorViewController createNewNote](self, "createNewNote", a3);
}

- (void)ic_addInsertNoteLinkInteraction
{
  uint64_t v3;
  unint64_t v4;
  ICNoteEditorViewController *v5;
  void *v6;
  id v7;
  id v8;

  v3 = swift_allocObject(&unk_10056E7E8, 24, 7);
  *(_QWORD *)(v3 + 16) = self;
  objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction(0));
  v4 = sub_1001B27E8();
  v5 = self;
  v6 = (void *)UIAppIntentInteraction.init<A>(intent:perform:)(&type metadata for InsertNoteLinkIntent, &unk_1005DCAC0, v3, &type metadata for InsertNoteLinkIntent, v4);
  v7 = -[ICNoteEditorViewController view](v5, "view");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "addInteraction:", v6);

  }
  else
  {
    __break(1u);
  }
}

@end
