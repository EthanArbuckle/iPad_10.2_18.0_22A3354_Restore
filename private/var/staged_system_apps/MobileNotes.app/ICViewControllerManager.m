@implementation ICViewControllerManager

- (NSManagedObjectID)selectedNoteObjectID
{
  void *v3;
  NSManagedObjectID *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (NSManagedObjectID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedNoteObjectID"));

  }
  else
  {
    v4 = self->_selectedNoteObjectID;
  }
  return v4;
}

- (ICTagSelection)tagSelection
{
  void *v3;
  ICTagSelection *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (ICTagSelection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tagSelection"));

  }
  else
  {
    v4 = self->_tagSelection;
  }
  return v4;
}

- (ICViewControllerManager)init
{
  ICViewControllerManager *v2;
  ICViewControllerManager *v3;
  ICItemIdentifier *selectedNoteBrowseContainerItemID;
  NSManagedObjectID *selectedNoteObjectID;
  NSManagedObjectID *selectedInvitationObjectID;
  ICTagSelection *tagSelection;
  NSManagedObjectID *focusedNoteObjectID;
  ICActivityStreamSelection *activityStreamSelection;
  ICItemIdentifier *mostRecentNonSearchContainerItemID;
  NSManagedObjectID *previousSelectedNoteObjectID;
  ICSearchResult *selectedSearchResult;
  _TtC11MobileNotes33ICAppIntentsInteractionController *v13;
  _TtC11MobileNotes33ICAppIntentsInteractionController *intentsInteractionController;
  ICPersistenceConfiguration *v15;
  ICPersistenceConfiguration *persistenceConfiguration;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ICViewControllerManager;
  v2 = -[ICViewControllerManager init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    selectedNoteBrowseContainerItemID = v2->_selectedNoteBrowseContainerItemID;
    v2->_selectedNoteBrowseContainerItemID = 0;

    selectedNoteObjectID = v3->_selectedNoteObjectID;
    v3->_selectedNoteObjectID = 0;

    selectedInvitationObjectID = v3->_selectedInvitationObjectID;
    v3->_selectedInvitationObjectID = 0;

    tagSelection = v3->_tagSelection;
    v3->_tagSelection = 0;

    focusedNoteObjectID = v3->_focusedNoteObjectID;
    v3->_focusedNoteObjectID = 0;

    activityStreamSelection = v3->_activityStreamSelection;
    v3->_activityStreamSelection = 0;

    mostRecentNonSearchContainerItemID = v3->_mostRecentNonSearchContainerItemID;
    v3->_mostRecentNonSearchContainerItemID = 0;

    previousSelectedNoteObjectID = v3->_previousSelectedNoteObjectID;
    v3->_previousSelectedNoteObjectID = 0;

    selectedSearchResult = v3->_selectedSearchResult;
    v3->_selectedSearchResult = 0;

    v13 = objc_alloc_init(_TtC11MobileNotes33ICAppIntentsInteractionController);
    intentsInteractionController = v3->_intentsInteractionController;
    v3->_intentsInteractionController = v13;

    v15 = (ICPersistenceConfiguration *)objc_alloc_init((Class)ICPersistenceConfiguration);
    persistenceConfiguration = v3->_persistenceConfiguration;
    v3->_persistenceConfiguration = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "managedObjectContext"));
    -[ICPersistenceConfiguration setModernViewContext:](v3->_persistenceConfiguration, "setModernViewContext:", v18);

    -[ICPersistenceConfiguration setMakeModernBackgroundContext:](v3->_persistenceConfiguration, "setMakeModernBackgroundContext:", &stru_10054FCD8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "noteContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "managedObjectContext"));
    -[ICPersistenceConfiguration setLegacyViewContext:](v3->_persistenceConfiguration, "setLegacyViewContext:", v21);

    -[ICViewControllerManager setSelectionStateTrackingEnabled:](v3, "setSelectionStateTrackingEnabled:", ICInternalSettingsIsSelectionStateTrackingEnabled(-[ICPersistenceConfiguration setMakeLegacyBackgroundContext:](v3->_persistenceConfiguration, "setMakeLegacyBackgroundContext:", &stru_10054FCF8)));
  }
  return v3;
}

- (void)setupViewsFromWindowStateArchive:(id)a3 systemPaperShowModernAccountAlert:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t (*__ptr32 *v12)();
  void *v13;
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
  void *v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  ICViewControllerManager *v50;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));

  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10001B650(v8, v11);

  v12 = &off_100451000;
  if (objc_msgSend(v8, "isSystemPaper"))
  {
    v44 = v10;
    -[ICViewControllerManager setIsAuxiliary:](self, "setIsAuxiliary:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "initialSystemPaperLink"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "initialSystemPaperImageData"));
    v15 = +[ICSystemPaperViewController newSystemPaperViewControllerWithIncomingLink:incomingImageData:](ICSystemPaperViewController, "newSystemPaperViewControllerWithIncomingLink:incomingImageData:", v13, v14);
    objc_msgSend(v15, "setViewControllerManager:", self);
    -[ICViewControllerManager setSystemPaperViewController:](self, "setSystemPaperViewController:", v15);
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectedNoteObjectID"));

      if (!v17)
        goto LABEL_16;
LABEL_11:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectWithID:", v17));

      if (!v24)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((resolvedNote) != nil)", "-[ICViewControllerManager setupViewsFromWindowStateArchive:systemPaperShowModernAccountAlert:completion:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "resolvedNote");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
      objc_msgSend(v25, "setCurrentNote:animated:direction:setEditing:showInkPicker:", v24, 0, 0, objc_msgSend(v8, "shouldStartEditing"), 0);

      if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
        -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", v17);

      goto LABEL_16;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentObjectIDURL"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentObjectIDURL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:", v22));

      if (v17)
        goto LABEL_11;
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((systemPaperID) != nil)", "-[ICViewControllerManager setupViewsFromWindowStateArchive:systemPaperShowModernAccountAlert:completion:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "systemPaperID");
    }
LABEL_16:
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
    objc_msgSend(v26, "setShouldShowModernAccountAlert:", v6);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    objc_msgSend(v28, "setRootViewController:", v27);

    v10 = v44;
    v12 = &off_100451000;
    goto LABEL_24;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rootViewController"));

  -[ICViewControllerManager setIsAuxiliary:](self, "setIsAuxiliary:", objc_msgSend(v8, "isAuxiliaryWindow"));
  -[ICViewControllerManager initializeMainSplitViewWithStateRestoreArchive:](self, "initializeMainSplitViewWithStateRestoreArchive:", v8);
  if (objc_msgSend(v8, "isAuxiliaryWindow"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    objc_msgSend(v20, "setRootViewController:", v13);

  }
  else
  {
    if (v19)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarContainerViewController](self, "trailingSidebarContainerViewController"));
      v30 = objc_msgSend(v29, "isSidebarHidden");
      v31 = v30 ^ objc_msgSend(v8, "isTrailingContentVisible");

      -[ICViewControllerManager initializeTrailingSidebarSplitViewWithStateRestoreArchive:](self, "initializeTrailingSidebarSplitViewWithStateRestoreArchive:", v8);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarContainerViewController](self, "trailingSidebarContainerViewController"));
      objc_msgSend(v32, "setResizesWindow:", v31);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      objc_msgSend(v34, "setRootViewController:", v33);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));
      objc_msgSend(v36, "layoutIfNeeded");
    }
    else
    {
      -[ICViewControllerManager initializeTrailingSidebarSplitViewWithStateRestoreArchive:](self, "initializeTrailingSidebarSplitViewWithStateRestoreArchive:", v8);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarContainerViewController](self, "trailingSidebarContainerViewController"));
      objc_msgSend(v37, "setResizesWindow:", 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      objc_msgSend(v36, "setRootViewController:", v35);
    }

    if (!-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth")
      && (id)-[ICViewControllerManager behavior](self, "behavior") != (id)3)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100028C2C;
      v48[3] = &unk_10054FE80;
      v49 = v8;
      v50 = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v48);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarContainerViewController](self, "trailingSidebarContainerViewController"));
    objc_msgSend(v13, "setResizesWindow:", 1);
  }
LABEL_24:

  v45[0] = _NSConcreteStackBlock;
  v45[1] = *((_QWORD *)v12 + 236);
  v45[2] = sub_100015CA4;
  v45[3] = &unk_10054FED0;
  v45[4] = self;
  v46 = v8;
  v47 = v9;
  v38 = v9;
  v39 = v8;
  v40 = objc_retainBlock(v45);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  if (v10)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "folderDataSource"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "indexer"));
    ((void (*)(_QWORD *, void *))v40[2])(v40, v43);

  }
  else
  {
    objc_msgSend(v41, "reloadListWithDataIndexedBlock:dataRenderedBlock:", v40, 0);
  }

}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  int64_t v26;
  void *v27;
  id v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int64_t v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *i;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    -[ICViewControllerManager setMostRecentRegularWidthSelectedNoteObjectID:](self, "setMostRecentRegularWidthSelectedNoteObjectID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    -[ICViewControllerManager setMostRecentRegularWidthTagSelection:](self, "setMostRecentRegularWidthTagSelection:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
    -[ICViewControllerManager setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:](self, "setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
  if (objc_msgSend(v12, "count"))
  {
    v13 = -[ICViewControllerManager behavior](self, "behavior");

    if (v13 != 3)
      goto LABEL_81;
  }
  else
  {

  }
  -[ICViewControllerManager setSplitViewExpandingOrCollapsing:](self, "setSplitViewExpandingOrCollapsing:", 1);
  if (-[ICViewControllerManager isApplyingStateRestoreArchive](self, "isApplyingStateRestoreArchive"))
  {
    v14 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
    v15 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v16 = (void *)v15;
    if (v14 == 1)
    {
      if (!v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
        a4 = 2 * (objc_msgSend(v17, "count") != 0);
LABEL_25:

        goto LABEL_26;
      }
    }
    else if (!v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
      a4 = objc_msgSend(v17, "count") != 0;
      goto LABEL_25;
    }
    a4 = 2;
LABEL_26:

    goto LABEL_27;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "presentedViewController"));
  v73 = objc_msgSend(v19, "ic_hasFullScreenModalPresentationStyle");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "noteSearchViewController"));
  if (objc_msgSend(v21, "isActive"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "noteSearchViewController"));
    v72 = objc_msgSend(v23, "ic_isViewVisible");

  }
  else
  {
    v72 = 0;
  }

  v24 = -[ICViewControllerManager isMainSplitViewDisplayModeSecondaryOnly](self, "isMainSplitViewDisplayModeSecondaryOnly");
  v25 = -[ICViewControllerManager isTagSelected](self, "isTagSelected");
  v26 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v28 = objc_msgSend(v27, "displayMode");
  if (v26)
  {
    if (v28 == (id)2)
    {
      v29 = 1;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v29 = objc_msgSend(v30, "displayMode") == (id)3;

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "viewControllers"));
    if (objc_msgSend(v32, "count"))
    {
      v33 = -[ICViewControllerManager isMainSplitViewDisplayModeSecondaryOnly](self, "isMainSplitViewDisplayModeSecondaryOnly");
      goto LABEL_43;
    }
LABEL_40:
    v33 = 0;
    goto LABEL_43;
  }
  if (v28 == (id)4)
  {
    v29 = 1;
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    if (objc_msgSend(v38, "displayMode") == (id)6)
    {
      v29 = 1;
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v29 = objc_msgSend(v39, "displayMode") == (id)5;

    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "viewControllers"));
  if (!objc_msgSend(v32, "count"))
    goto LABEL_40;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  if (objc_msgSend(v40, "displayMode") == (id)2)
  {
    v33 = 1;
  }
  else
  {
    v71 = v25;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    v33 = objc_msgSend(v41, "displayMode") == (id)3;

    v25 = v71;
  }

LABEL_43:
  if (((v24 | v73) & 1) != 0 || (id)-[ICViewControllerManager behavior](self, "behavior") == (id)3)
    goto LABEL_45;
  if ((!v29 | v72 | v25 & v29) != 1)
  {
    a4 = 0;
    goto LABEL_28;
  }
  if ((v33 | v72 | v25 & v29) == 1)
  {
    if (!-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
    {
      a4 = 1;
      goto LABEL_28;
    }
LABEL_45:
    -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
    v37 = 1;
    a4 = 2;
    goto LABEL_46;
  }
LABEL_27:
  if (a4 == 2)
    goto LABEL_45;
LABEL_28:
  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v34, "stopTextFindingIfNecessary");

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
  objc_msgSend(v35, "stopTextFinding");

  v36 = -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
  v37 = 0;
  if (!a4 && (v36 & 1) == 0)
  {
    -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:sideEffects:](self, "setSelectedNoteBrowseContainerItemID:sideEffects:", 0, 0);
    a4 = 0;
    v37 = 0;
  }
LABEL_46:
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager childPrimaryViewController](self, "childPrimaryViewController"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v42));

  v44 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
  if ((unint64_t)(a4 - 1) <= 1 && !v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "viewControllers"));
    objc_msgSend(v43, "ic_addObjectsFromNonNilArray:", v46);

  }
  if (v37)
  {
    if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
      v47 = !-[ICViewControllerManager isNoteEditorVisible](self, "isNoteEditorVisible");
    else
      v47 = 0;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "viewControllers"));

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v50 = v49;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    if (v51)
    {
      v53 = v51;
      v54 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v54)
            objc_enumerationMutation(v50);
          v56 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
          if (v47)
          {
            v57 = objc_opt_class(ICNoteEditorViewController, v52);
            if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0)
              continue;
          }
          objc_msgSend(v43, "addObject:", v56);
        }
        v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
      }
      while (v53);
    }

  }
  v58 = objc_msgSend(v43, "copy");
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  objc_msgSend(v59, "setViewControllers:", v58);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedModernNote](self, "selectedModernNote"));
  LODWORD(v59) = objc_msgSend(v60, "isSharedViaICloud");

  if (!(_DWORD)v59)
    goto LABEL_80;
  if (!-[ICViewControllerManager isApplyingStateRestoreArchive](self, "isApplyingStateRestoreArchive"))
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "rootViewController"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "ic_topViewController"));
    if (objc_msgSend(v63, "ic_hasFullScreenModalPresentationStyle"))
    {

      goto LABEL_77;
    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    if (objc_msgSend(v64, "displayMode") == (id)2)
    {

LABEL_76:
      v67 = 2;
LABEL_79:
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedModernNote](self, "selectedModernNote"));
      -[ICViewControllerManager presentActivityStreamForObject:viewMode:animated:](self, "presentActivityStreamForObject:viewMode:animated:", v69, v67, 0);

      goto LABEL_80;
    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    v66 = objc_msgSend(v65, "displayMode");

    if (v66 == (id)3)
      goto LABEL_76;
  }
LABEL_77:
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));

  if (v68)
  {
    v67 = 1;
    goto LABEL_79;
  }
LABEL_80:

LABEL_81:
  return 3;
}

- (BOOL)hasCompactWidth
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "ic_hasCompactWidth");

  return v4;
}

- (void)initializeTrailingSidebarSplitViewWithStateRestoreArchive:(id)a3
{
  id v4;
  ICTrailingSidebarContainerViewController *v5;
  void *v6;
  uint64_t v7;
  ICTrailingSidebarSplitViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICActivityStreamNavigationController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UINavigationController *compactNavigationController;
  void *v27;
  id v28;

  v4 = a3;
  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)3)
  {
    v5 = objc_alloc_init(ICTrailingSidebarContainerViewController);
    -[ICViewControllerManager setTrailingSidebarContainerViewController:](self, "setTrailingSidebarContainerViewController:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarContainerViewController](self, "trailingSidebarContainerViewController"));
    -[ICViewControllerManager setTrailingSidebarViewController:](self, "setTrailingSidebarViewController:", v6);

    v7 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  }
  else
  {
    v8 = -[ICTrailingSidebarSplitViewController initWithViewControllerManager:]([ICTrailingSidebarSplitViewController alloc], "initWithViewControllerManager:", self);
    -[ICViewControllerManager setTrailingSidebarSplitViewController:](self, "setTrailingSidebarSplitViewController:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    objc_msgSend(v9, "setDelegate:", self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    objc_msgSend(v10, "setPresentsWithGesture:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    objc_msgSend(v11, "setPrimaryEdge:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    objc_msgSend(v12, "setDisplayModeButtonVisibility:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    objc_msgSend(v13, "setShowsSecondaryOnlyButton:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    objc_msgSend(v14, "setPreferredDisplayMode:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    -[ICViewControllerManager setTrailingSidebarViewController:](self, "setTrailingSidebarViewController:", v15);

    v7 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  }
  v28 = (id)v7;
  v16 = -[ICActivityStreamNavigationController initWithCoordinator:hasInteractiveSizing:]([ICActivityStreamNavigationController alloc], "initWithCoordinator:hasInteractiveSizing:", self, 0);
  -[ICViewControllerManager setActivityStreamNavigationController:](self, "setActivityStreamNavigationController:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedModernNote](self, "selectedModernNote"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamNavigationController](self, "activityStreamNavigationController"));
  objc_msgSend(v18, "setObject:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamNavigationController](self, "activityStreamNavigationController"));
  objc_msgSend(v20, "setSelection:", v19);

  LODWORD(v19) = objc_msgSend(v4, "isAuxiliaryWindow");
  if ((_DWORD)v19)
    v21 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  else
    v21 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v22 = (void *)v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
  objc_msgSend(v23, "setContentViewController:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamNavigationController](self, "activityStreamNavigationController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
  objc_msgSend(v25, "setSidebarViewController:", v24);

  -[ICViewControllerManager updateTrailingColumnWidth](self, "updateTrailingColumnWidth");
  compactNavigationController = self->_compactNavigationController;
  self->_compactNavigationController = 0;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  objc_msgSend(v28, "setViewController:forColumn:", v27, 3);

}

- (void)setupWithWindow:(id)a3 stateRestoreArchive:(id)a4 completion:(id)a5
{
  ICWindowStateArchive *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ICKeyboardHandler *v17;
  ICKeyboardHandler *keyboardHandler;
  ICColumnVisibilityController *v19;
  ICColumnVisibilityController *columnVisibilityController;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char isKindOfClass;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  ICHostedNotesAppearanceCoordinator *v41;
  ICHostedNotesAppearanceCoordinator *hostedNotesAppearanceCoordinator;
  id v43;

  v43 = a3;
  v8 = (ICWindowStateArchive *)a4;
  v9 = a5;
  -[ICViewControllerManager setWindow:](self, "setWindow:", v43);
  objc_msgSend(v43, "setViewControllerManager:", self);
  -[ICViewControllerManager updateOverrideNoteContainerViewModeIfNeeded](self, "updateOverrideNoteContainerViewModeIfNeeded");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "managedObjectContextDidChange:", NSManagedObjectContextObjectsDidChangeNotification, 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "noteLockManagerWillToggleLock:", ICNoteLockManagerWillToggleLockNotification, 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "noteLockManagerDidToggleLock:", ICNoteLockManagerDidToggleLockNotification, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification ICTagCollectionViewWillRenameTagNotification](NSNotification, "ICTagCollectionViewWillRenameTagNotification"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "collectionViewWillRenameTag:", v11, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification ICTagCollectionViewDidRenameTagNotification](NSNotification, "ICTagCollectionViewDidRenameTagNotification"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "tagDidRename:", v12, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification ICTagCollectionViewWillDeleteTagsNotification](NSNotification, "ICTagCollectionViewWillDeleteTagsNotification"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "collectionViewWillDeleteTags:", v13, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification ICTagCollectionViewDidDeleteTagsNotification](NSNotification, "ICTagCollectionViewDidDeleteTagsNotification"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "tagsDidDelete:", v14, 0);

  objc_msgSend(v10, "addObserver:selector:name:object:", self, "migrationStateDidChange:", ICMigrationStateDidChangeNotification, 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "accountsDidChange:", ICAccountsDidChangeNotification, 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "folderWasCreated:", CFSTR("ICFolderCreationControllerFolderWasCreatedNotification"), 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "willDismissSearch:", CFSTR("ICBaseViewControllerWillDismissSearchControllerNotification"), 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "searchQueryDidChange:", CFSTR("ICNoteSearchViewControllerQueryDidChangeNotification"), 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "didStartEditing:", CFSTR("ICFolderListViewControllerDidStartEditingNotification"), 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "didStartEditing:", CFSTR("ICNoteBrowseViewControllerDidStartEditingNotification"), 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "didStartEditing:", ICNoteEditorViewControllerDidStartEditingNotification, 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "didStartEditing:", CFSTR("NotesDisplayControllerDidStartEditingNotification"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification ICRecoverNoteAlertControllerWillRecoverNoteNotification](NSNotification, "ICRecoverNoteAlertControllerWillRecoverNoteNotification"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "editorWillRecoverNote:", v15, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification ICRecoverNoteAlertControllerDidRecoverNoteNotification](NSNotification, "ICRecoverNoteAlertControllerDidRecoverNoteNotification"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "editorDidRecoverNote:", v16, 0);

  v17 = -[ICKeyboardHandler initWithDelegate:]([ICKeyboardHandler alloc], "initWithDelegate:", self);
  keyboardHandler = self->_keyboardHandler;
  self->_keyboardHandler = v17;

  v19 = -[ICColumnVisibilityController initWithViewControllerManager:]([ICColumnVisibilityController alloc], "initWithViewControllerManager:", self);
  columnVisibilityController = self->_columnVisibilityController;
  self->_columnVisibilityController = v19;

  if (ICDebugModeEnabled(v21, v22))
    +[ICDebuggingViewController setupDebuggingGestureInWindow:](ICDebuggingViewController, "setupDebuggingGestureInWindow:", v43);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "windowScene"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "screenshotService"));
  objc_msgSend(v24, "setDelegate:", self);

  if (objc_msgSend((id)objc_opt_class(v43, v25), "_isSecure"))
  {
    if (-[ICViewControllerManager isAuxiliary](self, "isAuxiliary"))
      v26 = 5;
    else
      v26 = 4;
    -[ICViewControllerManager initializeModernNoteEditorWithOptions:](self, "initializeModernNoteEditorWithOptions:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v27, "setDelegate:", self);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    -[ICViewControllerManager initializeSecondaryNavigationControllerWithViewController:](self, "initializeSecondaryNavigationControllerWithViewController:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
    objc_msgSend(v43, "setRootViewController:", v29);

    objc_msgSend(v43, "setWindowIdentifier:", CFSTR("com.apple.notes.secure-window-identifier"));
  }
  else
  {
    if (!v8)
    {
      v8 = objc_alloc_init(ICWindowStateArchive);
      -[ICWindowStateArchive setCurrentNoteContainerViewMode:](v8, "setCurrentNoteContainerViewMode:", 0);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
    v32 = objc_opt_class(ICVirtualSmartFolderItemIdentifier, v31);
    isKindOfClass = objc_opt_isKindOfClass(v30, v32);

    if ((isKindOfClass & 1) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
      -[ICWindowStateArchive setCurrentVirtualSmartFolderIdentifier:](v8, "setCurrentVirtualSmartFolderIdentifier:", v34);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive windowIdentifier](v8, "windowIdentifier"));
    objc_msgSend(v43, "setWindowIdentifier:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive toolPickerIdentifier](v8, "toolPickerIdentifier"));
    objc_msgSend(v43, "setToolPickerIdentifier:", v36);

    -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v8, v9);
    if (objc_msgSend(UIApp, "applicationState"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "folderDataSource"));
      objc_msgSend(v38, "setIgnoreEnterForeground:", 1);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "noteDataSource"));
      objc_msgSend(v40, "setIgnoreEnterForeground:", 1);

    }
    if (objc_msgSend(v43, "behavior") == (id)1)
    {
      v41 = (ICHostedNotesAppearanceCoordinator *)objc_msgSend(objc_alloc((Class)ICHostedNotesAppearanceCoordinator), "initWithDelegate:", self);
      hostedNotesAppearanceCoordinator = self->_hostedNotesAppearanceCoordinator;
      self->_hostedNotesAppearanceCoordinator = v41;

    }
  }

}

- (void)initializeMainSplitViewWithStateRestoreArchive:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unsigned __int8 v42;
  char v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _BOOL4 v48;
  id v49;
  void *v50;
  ICFolderListViewController *v51;
  id v52;
  ICFolderListViewController *v53;
  ICNoteBrowseViewController *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  unsigned __int8 v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  int64_t v83;
  UINavigationController *primaryNavigationController;
  ICMainSplitViewController *v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  ICMainSplitViewController *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  _BOOL8 v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  int64_t v140;
  void *v141;
  unsigned int v142;
  uint64_t v143;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  __int128 v156;
  id v157;
  _QWORD block[5];
  _QWORD v159[4];
  id v160;
  id location;
  _QWORD v162[5];
  id v163;
  id v164;
  id v165;
  id v166;
  int64_t v167;
  _QWORD v168[5];
  _QWORD v169[5];
  _QWORD v170[2];
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;

  v4 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedNoteObjectID"));
    v7 = v6;
    if (v6)
      v157 = v6;
    else
      v157 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedInvitationObjectID"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedNoteBrowseContainerObjectID"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedNoteBrowseContainerObjectID"));
      v174 = v15;
      *((_QWORD *)&v156 + 1) = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v174, 1));

    }
    else
    {
      *((_QWORD *)&v156 + 1) = 0;
    }
    *(_QWORD *)&v156 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedVirtualSmartFolderItemID"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentFirstVisibleObjectIDURLForContainerObjectIDURL"));
    if (v156 != 0 && !v157)
      objc_msgSend(v4, "setIsAuxiliaryWindow:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tagSelection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "includedObjectIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "excludedObjectIDs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v17));

    if (objc_msgSend(v8, "mode") == (id)1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier"));
      objc_msgSend(v12, "addObject:", v19);
    }
    else
    {
      if (objc_msgSend(v8, "mode") != (id)2)
      {
LABEL_19:
        v20 = objc_msgSend(v12, "copy");
        v152 = objc_msgSend(v18, "copy");
        goto LABEL_49;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier"));
      objc_msgSend(v18, "addObject:", v19);
    }

    goto LABEL_19;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentNoteObjectIDURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentContainerObjectIDURLs"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentFirstVisibleObjectIDURLForContainerObjectIDURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentObjectIDURL"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentObjectIDURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:", v10));
    if (objc_msgSend(v11, "ic_isContainerType"))
    {
      objc_msgSend(v4, "setIsAuxiliaryWindow:", 0);

      v173 = v10;
      v12 = 0;
      v13 = 0;
      *(_QWORD *)&v156 = 0;
      v5 = v8;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v173, 1));
LABEL_34:

      v5 = v13;
      goto LABEL_35;
    }
    if (!objc_msgSend(v11, "ic_isNoteType"))
    {
      v12 = 0;
      *(_QWORD *)&v156 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (objc_msgSend(v11, "ic_isEntityOfClass:", objc_opt_class(ICNote, v21)))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectWithID:", v11));

      if (objc_msgSend(v24, "isSystemPaper"))
      {
        *(_QWORD *)&v156 = objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualSystemPaperFolder](ICAccount, "globalVirtualSystemPaperFolder"));
        v12 = 0;
        goto LABEL_31;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectID"));
      v27 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager defaultContainerObjectIDForNoteWithObjectID:](self, "defaultContainerObjectIDForNoteWithObjectID:", v26));
    }
    else
    {
      if (!objc_msgSend(v11, "ic_isEntityOfClass:", objc_opt_class(NoteObject, v22)))
      {
        *(_QWORD *)&v156 = 0;
        v12 = 0;
LABEL_33:
        v13 = v10;
        goto LABEL_34;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectWithID:", v11));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "store"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectID"));
    }
    v12 = (void *)v27;

    *(_QWORD *)&v156 = 0;
LABEL_31:

    if (v12)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URIRepresentation"));
      v172 = v28;
      v29 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v172, 1));

      v8 = (void *)v29;
    }
    goto LABEL_33;
  }
  v12 = 0;
  *(_QWORD *)&v156 = 0;
LABEL_36:
  v157 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:", v5));
  v169[0] = _NSConcreteStackBlock;
  v169[1] = 3221225472;
  v169[2] = sub_1000328B4;
  v169[3] = &unk_100550488;
  v169[4] = self;
  *((_QWORD *)&v156 + 1) = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_compactMap:", v169));
  if (!(_QWORD)v156)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVirtualSmartFolderType"));
    v31 = v30 == 0;

    if (v31)
    {
      *(_QWORD *)&v156 = 0;
    }
    else
    {
      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVirtualSmartFolderAccountObjectIDURL"));
      if (v154)
        v153 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:"));
      else
        v153 = 0;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICVirtualSmartFolderItemIdentifier allTypes](ICVirtualSmartFolderItemIdentifier, "allTypes"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVirtualSmartFolderType"));
      v34 = objc_msgSend(v32, "containsObject:", v33);

      if (v34)
      {
        v35 = objc_alloc((Class)ICVirtualSmartFolderItemIdentifier);
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVirtualSmartFolderType"));
        v37 = objc_claimAutoreleasedReturnValue(+[ICFolderListSectionIdentifier systemSectionIdentifier](ICFolderListSectionIdentifier, "systemSectionIdentifier"));
        *(_QWORD *)&v156 = objc_msgSend(v35, "initWithType:parentIdentifier:accountObjectID:", v36, v37, v153);
      }
      else
      {
        v37 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          sub_100404288(v4, v37);
        *(_QWORD *)&v156 = 0;
        v36 = v37;
      }

    }
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTagIdentifiers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v38));

  v168[0] = _NSConcreteStackBlock;
  v168[1] = 3221225472;
  v168[2] = sub_100032920;
  v168[3] = &unk_10054F930;
  v168[4] = self;
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ic_compactMap:", v168));
  v152 = 0;
LABEL_49:

  v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)&v156 + 1), "lastObject"));
  v151 = (void *)v39;
  if (v39)
    v40 = v39;
  else
    v40 = v156;
  v41 = -[ICViewControllerManager enforcedNoteContainerViewModeForContainerItemID:](self, "enforcedNoteContainerViewModeForContainerItemID:", v40);
  if (v41 != -1)
    objc_msgSend(v4, "setCurrentNoteContainerViewMode:", v41);
  self->_noteContainerViewMode = (int64_t)objc_msgSend(v4, "currentNoteContainerViewMode");
  v42 = -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
  if (v157)
    v43 = v42;
  else
    v43 = 1;
  if ((v43 & 1) == 0 && !objc_msgSend(*((id *)&v156 + 1), "count"))
  {
    v44 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager defaultContainerObjectIDForNoteWithObjectID:](self, "defaultContainerObjectIDForNoteWithObjectID:", v157));
    v45 = (void *)v44;
    if (v44)
    {
      v171 = v44;
      v46 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v171, 1));

      *((_QWORD *)&v156 + 1) = v46;
    }

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v48 = v47 == 0;

  if (v48)
  {
    v51 = [ICFolderListViewController alloc];
    v52 = objc_msgSend(v4, "currentNoteContainerViewMode");
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
    v53 = -[ICFolderListViewController initWithViewMode:viewControllerManager:overrideContainerIdentifier:](v51, "initWithViewMode:viewControllerManager:overrideContainerIdentifier:", v52, self, v50);
    -[ICViewControllerManager setFolderListViewController:](self, "setFolderListViewController:", v53);

  }
  else
  {
    v49 = objc_msgSend(v4, "currentNoteContainerViewMode");
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    objc_msgSend(v50, "setNoteContainerViewMode:", v49);
  }

  -[ICViewControllerManager setPreferredNoteContainerViewMode:](self, "setPreferredNoteContainerViewMode:", objc_msgSend(v4, "preferredNoteContainerViewMode"));
  v54 = -[ICNoteBrowseViewController initWithViewMode:viewControllerManager:]([ICNoteBrowseViewController alloc], "initWithViewMode:viewControllerManager:", objc_msgSend(v4, "currentNoteContainerViewMode"), self);
  -[ICViewControllerManager setRootNoteBrowseViewController:](self, "setRootNoteBrowseViewController:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
  -[ICViewControllerManager setCurrentNoteBrowseViewController:](self, "setCurrentNoteBrowseViewController:", v55);

  LODWORD(v55) = objc_msgSend(v4, "isAuxiliaryWindow");
  -[ICViewControllerManager initializeLegacyNoteEditor](self, "initializeLegacyNoteEditor");
  -[ICViewControllerManager initializeModernNoteEditorWithOptions:](self, "initializeModernNoteEditorWithOptions:", v55);
  v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v20, "count") || objc_msgSend(v152, "count"))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    v57 = v20;
    if (!v20)
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    if (v152)
    {
      -[ICViewControllerManager setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v56, 0, 1, v57, v152, 0, 0, 0, 0);
    }
    else
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      -[ICViewControllerManager setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v56, 0, 1, v57, v58, 0, 0, 0, 0);

    }
    if (!v20)

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    objc_msgSend(v155, "addObject:", v59);

  }
  else if ((_QWORD)v156)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v79 = v78;
    if (v78)
      v80 = v78;
    else
      v80 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));
    v139 = v80;

    v140 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    v142 = objc_msgSend(v141, "isCollapsed");

    LODWORD(v141) = -[ICViewControllerManager isApplyingStateRestoreArchive](self, "isApplyingStateRestoreArchive");
    if ((-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled") & v141) == 1
      && v139)
    {
      v143 = 1;
    }
    else if (v41 != 1 && v140 == 0)
    {
      v143 = v142 ^ 1;
    }
    else
    {
      v143 = 0;
    }
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", (_QWORD)v156));
    v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICViewControllerManager isNoteEditorVisible](self, "isNoteEditorVisible")));
    -[ICViewControllerManager setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v145, 0, 1, v146, v147, v143, v148, 0, 0);

    v149 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    objc_msgSend(v155, "addObject:", v149);

  }
  else
  {
    v162[0] = _NSConcreteStackBlock;
    v162[1] = 3221225472;
    v162[2] = sub_1000329F0;
    v162[3] = &unk_1005504D8;
    v162[4] = self;
    v163 = v157;
    v164 = v155;
    v165 = *((id *)&v156 + 1);
    v167 = v41;
    v166 = v150;
    objc_msgSend(v165, "enumerateObjectsUsingBlock:", v162);

  }
  if (!v157)
    goto LABEL_99;
  if ((objc_msgSend(v4, "isAuxiliaryWindow") & 1) == 0 && !objc_msgSend(*((id *)&v156 + 1), "count"))
  {
    v61 = -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
    v62 = (_QWORD)v156 ? v61 : 0;
    if (v62 != 1)
      goto LABEL_99;
  }
  if (objc_msgSend(v157, "ic_isEntityOfClass:", objc_opt_class(ICNote, v60)))
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectWithID:", v157));

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v66, "setEditing:", 0);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v67, "setNote:delayedForLaunch:successHandler:", v65, 1, 0);

    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollStateForNote:", v65));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v69, "applyScrollStateFromArchive:", v68);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    goto LABEL_87;
  }
  if (!objc_msgSend(v157, "ic_isEntityOfClass:", objc_opt_class(NoteObject, v63)))
  {
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled")
      && objc_msgSend(v157, "ic_isInvitationType"))
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectWithID:", v157));

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      objc_msgSend(v77, "setInvitation:", v65);

      v73 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      goto LABEL_86;
    }
    -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
LABEL_99:
    v70 = 0;
    goto LABEL_100;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectWithID:", v157));

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
  objc_msgSend(v72, "displayNote:", v65);

  v73 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
LABEL_86:
  v70 = (void *)v73;
LABEL_87:

  v74 = -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
  if (v70)
    v75 = v74;
  else
    v75 = 1;
  if ((v75 & 1) == 0)
    -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", v157);
LABEL_100:
  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "focusedNoteObjectIDURL"));
    if (v81)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:", v81));
      -[ICViewControllerManager setFocusedNoteObjectID:](self, "setFocusedNoteObjectID:", v82);

    }
  }
  if (!v70)
  {
    if (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode")
      || -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
    {
      v70 = 0;
    }
    else
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    }
  }
  v83 = -[ICViewControllerManager behavior](self, "behavior");
  if (objc_msgSend(v4, "isAuxiliaryWindow"))
  {
    -[ICViewControllerManager initializeSecondaryNavigationControllerWithViewController:](self, "initializeSecondaryNavigationControllerWithViewController:", v70);
    goto LABEL_123;
  }
  primaryNavigationController = self->_primaryNavigationController;
  self->_primaryNavigationController = 0;

  if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
  {
    v85 = -[ICMainSplitViewController initWithStyle:viewControllerManager:]([ICMainSplitViewController alloc], "initWithStyle:viewControllerManager:", 1, self);
    -[ICViewControllerManager setMainSplitViewController:](self, "setMainSplitViewController:", v85);

    v86 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    -[ICViewControllerManager initializeSecondaryNavigationControllerWithViewController:](self, "initializeSecondaryNavigationControllerWithViewController:", v86);

    v87 = v155;
    v88 = v87;
    if (v70)
    {
      v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "arrayByAddingObject:", v70));

      v88 = (void *)v89;
    }
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
    objc_msgSend(v90, "setViewControllers:", v88);

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
    objc_msgSend(v91, "setDelegate:", self);

    if (v83 != 1)
      goto LABEL_121;
  }
  else
  {
    -[ICViewControllerManager initializeSecondaryNavigationControllerWithViewController:](self, "initializeSecondaryNavigationControllerWithViewController:", v70);
    if (v83 == 1)
      v92 = 1;
    else
      v92 = 2;
    v93 = -[ICMainSplitViewController initWithStyle:viewControllerManager:]([ICMainSplitViewController alloc], "initWithStyle:viewControllerManager:", v92, self);
    -[ICViewControllerManager setMainSplitViewController:](self, "setMainSplitViewController:", v93);

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v94, "setShowsSecondaryOnlyButton:", 1);

    if (v83 != 1)
    {
      v117 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithNibName:bundle:", 0, 0);
      -[ICViewControllerManager setSupplementaryNavigationController:](self, "setSupplementaryNavigationController:", v117);

      v118 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "navigationBar"));
      objc_msgSend(v119, "setPrefersLargeTitles:", 1);

      v120 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICBackgroundColor](UIColor, "ICBackgroundColor"));
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "view"));
      objc_msgSend(v122, "setBackgroundColor:", v120);

      v123 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
      objc_msgSend(v123, "setDelegate:", self);

      v124 = objc_msgSend(v155, "copy");
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
      objc_msgSend(v125, "setViewControllers:", v124);

      v126 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v127 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
      objc_msgSend(v126, "setViewController:forColumn:", v127, 1);

LABEL_121:
      v128 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryNavigationController](self, "primaryNavigationController"));
      objc_msgSend(v128, "setViewController:forColumn:", v129, 0);

      v130 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      objc_msgSend(v130, "setPreferredDisplayMode:", 0);

      goto LABEL_122;
    }
  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryContainerViewController](self, "primaryContainerViewController"));
  objc_msgSend(v95, "setViewController:forColumn:", v96, 0);

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v97, "setDisplayModeButtonVisibility:", 1);

  v98 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v98, "setPreferredDisplayMode:", 2);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v99, "primaryColumnWidth");
  v101 = v100;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryContainerViewController](self, "primaryContainerViewController"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "configuration"));
  objc_msgSend(v103, "insets");
  v105 = v104;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryContainerViewController](self, "primaryContainerViewController"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "configuration"));
  objc_msgSend(v107, "insets");
  v109 = v108;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v110, "setPreferredPrimaryColumnWidth:", v101 + v105 + v109);

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v111, "_setWantsFloatingSidebar:", 1);

  objc_initWeak(&location, self);
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v170[0] = objc_opt_class(UITraitHorizontalSizeClass, v113);
  v170[1] = objc_opt_class(UITraitVerticalSizeClass, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v170, 2));
  v159[0] = _NSConcreteStackBlock;
  v159[1] = 3221225472;
  v159[2] = sub_100032E1C;
  v159[3] = &unk_100550500;
  objc_copyWeak(&v160, &location);
  v116 = objc_msgSend(v112, "registerForTraitChanges:withHandler:", v115, v159);

  objc_destroyWeak(&v160);
  objc_destroyWeak(&location);
LABEL_122:
  v131 = (id)-[ICViewControllerManager behavior](self, "behavior") != (id)3;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v132, "setPresentsWithGesture:", v131);

  v133 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  objc_msgSend(v133, "setViewController:forColumn:", v134, 2);

  v135 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v136 = objc_alloc_init((Class)UINavigationController);
  objc_msgSend(v135, "setViewController:forColumn:", v136, 3);

  v137 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v137, "setDelegate:", self);

  v138 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v138, "setPreferredSplitBehavior:", 0);

LABEL_123:
  if (objc_msgSend(v4, "isAttachmentBrowserOpen"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100032E48;
    block[3] = &unk_100550110;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (ICWindow)window
{
  return (ICWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)willAdoptModelForSelectionStateController:(id)a3 isNavigating:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000154B8;
  v4[3] = &unk_100550110;
  v4[4] = self;
  performBlockOnMainThread(v4);
}

- (void)updateTrailingColumnWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v3, "preferredDisplacedColumnWidth");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  objc_msgSend(v6, "setPreferredPrimaryColumnWidth:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  objc_msgSend(v7, "preferredPrimaryColumnWidth");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  objc_msgSend(v10, "setMaximumPrimaryColumnWidth:", v9);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  objc_msgSend(v14, "preferredPrimaryColumnWidth");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  objc_msgSend(v13, "setMinimumPrimaryColumnWidth:", v12);

}

- (ICTrailingSidebarViewControlling)trailingSidebarViewController
{
  return self->_trailingSidebarViewController;
}

- (ICTrailingSidebarSplitViewController)trailingSidebarSplitViewController
{
  return self->_trailingSidebarSplitViewController;
}

- (ICTrailingSidebarContainerViewController)trailingSidebarContainerViewController
{
  return self->_trailingSidebarContainerViewController;
}

- (ICSystemPaperViewController)systemPaperViewController
{
  return self->_systemPaperViewController;
}

- (UINavigationController)supplementaryNavigationController
{
  return self->_supplementaryNavigationController;
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  -[ICViewControllerManager setSplitViewExpandingOrCollapsing:](self, "setSplitViewExpandingOrCollapsing:", 0);
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    if (objc_msgSend(v8, "preferredDisplacedColumn") == (id)a4)
    {
      v9 = -[ICViewControllerManager isTrailingContentVisible](self, "isTrailingContentVisible");

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1000302A4;
          v14[3] = &unk_1005500E8;
          v14[4] = self;
          objc_msgSend(v11, "animateAlongsideTransition:completion:", v14, 0);
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
          v13 = objc_msgSend(v12, "displayMode");

          if (v13 == (id)3)
          {
LABEL_10:
            -[ICViewControllerManager setActivityStreamSelection:](self, "setActivityStreamSelection:", 0);
            goto LABEL_11;
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
          objc_msgSend(v11, "setPreferredDisplayMode:", 1);
        }

        goto LABEL_10;
      }
    }
    else
    {

    }
  }
LABEL_11:

}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  BOOL v34;
  char v35;
  BOOL v36;
  int64_t v37;
  id v38;

  v38 = a3;
  v6 = objc_msgSend(v38, "displayMode");
  if (v6 != (id)a4)
  {
    v7 = (unint64_t)v6;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));

    if (v8 == v38)
    {
      if (a4 != 6 && v7 != 6)
      {
        v11 = -[ICViewControllerManager isTrailingContentVisible](self, "isTrailingContentVisible");
        if (a4 == 1 || (v11 & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
          objc_msgSend(v13, "bounds");
          v15 = v14;
          v17 = v16;

          if (-[ICViewControllerManager isTrailingContentVisible](self, "isTrailingContentVisible"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
            objc_msgSend(v18, "sidebarWidth");
            v15 = v15 - v19;

          }
          if (a4 == 4 || a4 == 2)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
            v21 = objc_msgSend(v20, "style");
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
            v23 = v22;
            if (v21 == (id)2)
              objc_msgSend(v22, "supplementaryColumnWidth");
            else
              objc_msgSend(v22, "primaryColumnWidth");
            v25 = v24;

            v15 = v15 - v25;
          }
          if (a4 == 4)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
            objc_msgSend(v26, "primaryColumnWidth");
            v15 = v15 - v27;

          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
          v29 = objc_msgSend(v28, "requiresNotificationForSecondaryColumnSize:", v15, v17);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
          v31 = objc_msgSend(v30, "isTransitioning");

          if (!v31 && v29)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "transitionCoordinator"));
            -[ICViewControllerManager sendNotificationForNoteEditorSizeChange:transitionCoordinator:](self, "sendNotificationForNoteEditorSizeChange:transitionCoordinator:", v32, v15, v17);

          }
          -[ICViewControllerManager setProposedMainSplitViewControllerDisplayMode:](self, "setProposedMainSplitViewControllerDisplayMode:", a4);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "transitionCoordinator"));
          -[ICViewControllerManager sendNotificationForSplitViewDisplayModeChangeWithTransitionCoordinator:](self, "sendNotificationForSplitViewDisplayModeChangeWithTransitionCoordinator:", v33);

        }
      }
      if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)3 && (a4 == 1 || v7 == 1))
        -[ICViewControllerManager updateNoteEditorBezelsIfNeededWithDisplayMode:force:](self, "updateNoteEditorBezelsIfNeededWithDisplayMode:force:", a4, 1);
      if ((unint64_t)a4 <= 6 && ((1 << a4) & 0x68) != 0)
        -[ICViewControllerManager stopEditing](self, "stopEditing");
      if ((objc_msgSend(v38, "isCollapsed") & 1) == 0)
      {
        if (!-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode")
          && (a4 == 2 ? (v34 = v7 == 4) : (v34 = 0),
              !v34 ? (v35 = 0) : (v35 = 1),
              v7 == 5 ? (v36 = a4 == 3) : (v36 = 0),
              v36 || (v35 & 1) != 0)
          || (v37 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"), a4 == 1)
          && (v7 & 0xFFFFFFFFFFFFFFFELL) == 2
          && v37 == 1)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
          objc_msgSend(v10, "becomeFirstResponder");
          goto LABEL_47;
        }
      }
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));

      if (v9 == v38)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
        objc_msgSend(v10, "updateStateForTrailingSidebarVisible:", a4 == 2);
LABEL_47:

      }
    }
  }

}

- (void)setWindow:(id)a3
{
  ICWindow **p_window;
  id v5;
  id v6;

  p_window = &self->_window;
  v5 = a3;
  objc_storeWeak((id *)p_window, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager intentsInteractionController](self, "intentsInteractionController"));
  objc_msgSend(v6, "setWindow:", v5);

}

- (void)setTrailingSidebarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSidebarViewController, a3);
}

- (void)setTrailingSidebarSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSidebarSplitViewController, a3);
}

- (void)setSupplementaryNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryNavigationController, a3);
}

- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_splitViewExpandingOrCollapsing = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
  objc_msgSend(v5, "setSplitViewExpandingOrCollapsing:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v6, "setSplitViewExpandingOrCollapsing:", v3);

}

- (void)setSelectionStateTrackingEnabled:(BOOL)a3
{
  _TtC11MobileNotes26ICSelectionStateController *v4;
  void *v5;
  _TtC11MobileNotes26ICSelectionStateController *v6;
  _TtC11MobileNotes26ICSelectionStateController *selectionStateController;
  _TtC11MobileNotes26ICSelectionStateController *v8;

  if (a3)
  {
    self->_selectionStateTrackingEnabled = 1;
    v4 = [_TtC11MobileNotes26ICSelectionStateController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager persistenceConfiguration](self, "persistenceConfiguration"));
    v6 = -[ICSelectionStateController initWithPersistenceConfiguration:](v4, "initWithPersistenceConfiguration:", v5);
    selectionStateController = self->_selectionStateController;
    self->_selectionStateController = v6;

    -[ICSelectionStateController setDelegate:](self->_selectionStateController, "setDelegate:", self);
  }
  else
  {
    self->_selectionStateTrackingEnabled = 0;
    v8 = self->_selectionStateController;
    self->_selectionStateController = 0;

  }
}

- (void)setSecondaryNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryNavigationController, a3);
}

- (void)setRootNoteBrowseViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootNoteBrowseViewController, a3);
}

- (void)setPrimaryNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryNavigationController, a3);
}

- (void)setPreferredNoteContainerViewMode:(int64_t)a3
{
  self->_preferredNoteContainerViewMode = a3;
}

- (void)setNoteEditorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_noteEditorViewController, a3);
}

- (void)setMostRecentRegularWidthTagSelection:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentRegularWidthTagSelection, a3);
}

- (void)setMostRecentRegularWidthSelectedNoteObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentRegularWidthSelectedNoteObjectID, a3);
}

- (void)setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentRegularWidthSelectedNoteBrowseContainerItemID, a3);
}

- (void)setMainSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mainSplitViewController, a3);
}

- (void)setLegacyNoteEditorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_legacyNoteEditorViewController, a3);
}

- (void)setIsAuxiliary:(BOOL)a3
{
  self->_isAuxiliary = a3;
}

- (void)setIsApplyingStateRestoreArchive:(BOOL)a3
{
  self->_isApplyingStateRestoreArchive = a3;
}

- (void)setFolderListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_folderListViewController, a3);
}

- (void)setCurrentNoteBrowseViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentNoteBrowseViewController, a3);
}

- (void)setCompactNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_compactNavigationController, a3);
}

- (void)setActivityStreamNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_activityStreamNavigationController, a3);
}

- (BOOL)selectionStateTrackingEnabled
{
  return self->_selectionStateTrackingEnabled;
}

- (_TtC11MobileNotes26ICSelectionStateController)selectionStateController
{
  return self->_selectionStateController;
}

- (void)selectionStateController:(id)a3 didAdoptModelFromArchive:(id)a4 systemPaperAlert:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  BOOL v16;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100015E74;
  v12[3] = &unk_1005509F0;
  v12[4] = self;
  v13 = a3;
  v16 = a5;
  v14 = a4;
  v15 = a6;
  v9 = v15;
  v10 = v14;
  v11 = v13;
  performBlockOnMainThread(v12);

}

- (ICItemIdentifier)selectedNoteBrowseContainerItemID
{
  void *v3;
  ICItemIdentifier *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (ICItemIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedNoteBrowseContainerItemID"));

  }
  else
  {
    v4 = self->_selectedNoteBrowseContainerItemID;
  }
  return v4;
}

- (ICNote)selectedModernNote
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
  v4 = objc_msgSend(v3, "ic_isModernNoteType");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_existingObjectWithID:", v6));

  }
  else
  {
    v7 = 0;
  }
  return (ICNote *)v7;
}

- (NSManagedObjectID)selectedInvitationObjectID
{
  void *v3;
  NSManagedObjectID *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (NSManagedObjectID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedInvitationObjectID"));

  }
  else
  {
    v4 = self->_selectedInvitationObjectID;
  }
  return v4;
}

- (NSSet)selectedContainerIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
  v5 = v4;
  if (!v3)
  {
    if (v4)
    {
      v8 = objc_msgSend(v4, "mode");
      if (!v8)
      {
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "includedObjectIDs"));
        goto LABEL_3;
      }
      if (v8 == (id)1)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v9));

        goto LABEL_9;
      }
    }
    v7 = 0;
    goto LABEL_9;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v3));
LABEL_3:
  v7 = (void *)v6;
LABEL_9:

  return (NSSet *)v7;
}

- (UINavigationController)secondaryNavigationController
{
  return self->_secondaryNavigationController;
}

- (ICNoteBrowseViewController)rootNoteBrowseViewController
{
  return self->_rootNoteBrowseViewController;
}

- (id)propertiesToUpdate
{
  return &off_10057C690;
}

- (UINavigationController)primaryNavigationController
{
  UINavigationController *primaryNavigationController;
  UINavigationController *v3;
  void *v5;
  UINavigationController *v6;
  UINavigationController *v7;
  void *v8;
  void *v9;
  void *v10;

  primaryNavigationController = self->_primaryNavigationController;
  if (primaryNavigationController)
  {
    v3 = primaryNavigationController;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager childPrimaryViewController](self, "childPrimaryViewController"));
    v6 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
    v7 = self->_primaryNavigationController;
    self->_primaryNavigationController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_primaryNavigationController, "navigationBar"));
    objc_msgSend(v8, "setPrefersLargeTitles:", 1);

    -[UINavigationController setDelegate:](self->_primaryNavigationController, "setDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICBackgroundColor](UIColor, "ICBackgroundColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_primaryNavigationController, "view"));
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v3 = self->_primaryNavigationController;
  }
  return v3;
}

- (ICPersistenceConfiguration)persistenceConfiguration
{
  return self->_persistenceConfiguration;
}

- (ICNoteEditorViewController)noteEditorViewController
{
  void *v3;
  void *v4;
  ICNoteEditorViewController *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
    v5 = (ICNoteEditorViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentNoteEditorViewController"));

  }
  else
  {
    v5 = self->_noteEditorViewController;
  }
  return v5;
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  void *v18;
  _QWORD v19[5];

  v7 = a3;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  if (v9 != v7)
  {

    goto LABEL_11;
  }
  v10 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");

  if (v10 == 1)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v12 = v8;
    if ((id)v11 != v8)
    {
      v13 = (void *)v11;
      v14 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));

      if (v14 == v8)
      {
LABEL_8:
        if (-[ICViewControllerManager isSearchActiveWithQuery](self, "isSearchActiveWithQuery"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
          objc_msgSend(v15, "setDisplayModeButtonVisibility:", 1);

        }
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000322C8;
        v19[3] = &unk_100550110;
        v19[4] = self;
        objc_msgSend(v7, "ic_performBlockAfterActiveTransition:", v19);
        goto LABEL_11;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      objc_msgSend(v12, "setSidebarHidden:", 1);
    }

    goto LABEL_8;
  }
LABEL_11:
  v16 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  if (v16 == v7)
  {
    v17 = -[ICViewControllerManager isSplitViewExpandingOrCollapsing](self, "isSplitViewExpandingOrCollapsing");

    if ((v17 & 1) == 0)
      -[ICViewControllerManager hideActivityStreamWithCompletion:](self, "hideActivityStreamWithCompletion:", 0);
  }
  else
  {

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("ICNavigationControllerWillChange"), v7, 0);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  ICNoteBrowseViewController *v5;
  ICNoteBrowseViewController *v8;
  id v9;
  const __CFNull *v10;
  CFNullRef v11;
  ICNoteBrowseViewController *v12;
  _BOOL4 v13;
  uint64_t v14;
  const __CFNull *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  ICNoteBrowseViewController *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  ICNoteBrowseViewController *v24;
  CFNullRef v25;
  void *v26;
  ICNoteBrowseViewController *v27;
  ICNoteBrowseViewController *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  unsigned int v37;
  CFNullRef v38;
  const __CFNull *v39;
  const __CFNull *v40;
  uint64_t v41;
  const __CFNull *v42;
  unint64_t v43;
  unint64_t v44;
  unsigned int v45;
  CFNullRef v46;
  void *v47;
  unint64_t v48;
  void *v49;
  int v50;
  char v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  ICNoteBrowseViewController *v61;
  ICNoteBrowseViewController *v62;
  const __CFNull *v63;
  const __CFNull *v64;
  _BOOL4 v65;
  int v66;
  _QWORD v67[4];
  _QWORD *v68;
  _QWORD v69[5];
  const __CFNull *v70;
  CFNullRef v71;
  char v72;

  v8 = (ICNoteBrowseViewController *)a3;
  v9 = a4;
  if (!-[ICViewControllerManager isApplyingStateRestoreArchive](self, "isApplyingStateRestoreArchive"))
  {
    v10 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
    v11 = (CFNullRef)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    v12 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    if (!-[ICNoteBrowseViewController isCollapsed](v12, "isCollapsed"))
    {
      v13 = 0;
LABEL_6:

LABEL_7:
      v14 = objc_opt_class(ICNoteBrowseViewController);
      if ((objc_opt_isKindOfClass(v9, v14) & 1) == 0)
      {
        v21 = objc_opt_class(ICFolderListViewController);
        if ((objc_opt_isKindOfClass(v9, v21) & 1) == 0
          || !-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
        {
LABEL_40:
          if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
          {
            if (!v13)
            {
              v36 = 0;
              goto LABEL_45;
            }
LABEL_42:
            v5 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedObjectID](v5, "selectedObjectID"));
            v36 = 1;
            v37 = 1;
            if (v35)
              goto LABEL_70;
LABEL_45:
            v66 = v36;
            v61 = v5;
            v38 = v11;
            v39 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
            v64 = v10;
            if (kCFNull == v10)
              v40 = 0;
            else
              v40 = v10;
            v41 = v40;
            if (kCFNull == v39)
              v42 = 0;
            else
              v42 = v39;
            v43 = v42;
            if (v41 | v43)
            {
              v44 = v43;
              v37 = 1;
              if (!v41 || !v43)
              {
LABEL_67:
                v11 = v38;
                v50 = v66;

                v10 = v64;
LABEL_68:

                if (!v50)
                {
                  v51 = 0;
                  goto LABEL_72;
                }
                v35 = 0;
                v5 = v61;
LABEL_70:

                v51 = 1;
LABEL_72:
                v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
                v53 = objc_msgSend(v52, "applicationState");

                if (v37 && !v53)
                {
                  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "transitionCoordinator"));

                  v69[0] = _NSConcreteStackBlock;
                  v69[1] = 3221225472;
                  v69[2] = sub_100032334;
                  v69[3] = &unk_100550188;
                  v69[4] = self;
                  v10 = v10;
                  v70 = v10;
                  v11 = v11;
                  v71 = v11;
                  v72 = v51;
                  v56 = objc_retainBlock(v69);
                  v57 = v56;
                  if (v55)
                  {
                    v67[0] = _NSConcreteStackBlock;
                    v67[1] = 3221225472;
                    v67[2] = sub_10003237C;
                    v67[3] = &unk_100550460;
                    v68 = v56;
                    objc_msgSend(v55, "animateAlongsideTransition:completion:", &stru_100550438, v67);

                  }
                  else
                  {
                    ((void (*)(_QWORD *))v56[2])(v56);
                  }

                }
                goto LABEL_78;
              }
              v45 = objc_msgSend((id)v41, "isEqual:", v43);

              if (!v45)
              {
                v10 = v64;
                v50 = v66;
                goto LABEL_68;
              }
            }
            v41 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
            if (kCFNull == v11)
              v46 = 0;
            else
              v46 = v11;
            v44 = v46;
            if (kCFNull == (const CFNullRef)v41)
              v47 = 0;
            else
              v47 = (void *)v41;
            v48 = v47;
            v49 = (void *)v48;
            if (v44 | v48)
            {
              v37 = 1;
              if (v44 && v48)
                v37 = objc_msgSend((id)v44, "isEqual:", v48) ^ 1;
            }
            else
            {
              v37 = 0;
            }

            goto LABEL_67;
          }
LABEL_78:

          goto LABEL_79;
        }
        if (v13)
        {
          if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
            goto LABEL_42;
          goto LABEL_78;
        }
        v16 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
        v13 = v16 == 0;
LABEL_39:

        goto LABEL_40;
      }
      v15 = v10;
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "noteContainer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectID"));
      v19 = v18;
      v65 = v13;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        v62 = v8;
        v25 = v11;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "noteCollection"));
        v27 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectID"));
        v5 = v27;
        if (v27)
          v28 = v27;
        else
          v28 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "virtualSmartFolder"));
        v20 = v28;

        v11 = v25;
        v8 = v62;
      }

      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tagSelection"));
      if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      {
        v10 = v20;

      }
      else
      {
        -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:](self, "setSelectedNoteBrowseContainerItemID:", v20);
        v10 = v15;
      }
      v30 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
      if ((ICNoteBrowseViewController *)v30 == v8)
      {

      }
      else
      {
        v5 = (ICNoteBrowseViewController *)v30;
        v31 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");

        if (v31 != 1)
        {
LABEL_38:

          v11 = (CFNullRef)v29;
          v13 = v65;
          goto LABEL_39;
        }
      }
      if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      {
        v63 = v10;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "collectionView"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "indexPathsForSelectedItems"));
        if (objc_msgSend(v34, "count"))
        {
          v65 = 0;
        }
        else
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "noteSearchViewController"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "collectionView"));
          v5 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "indexPathsForSelectedItems"));
          v65 = -[ICNoteBrowseViewController count](v5, "count") == 0;

        }
        v10 = v63;
      }
      else
      {
        -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", 0);
      }
      goto LABEL_38;
    }
    v5 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));

    if (v5 != v8)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v12 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController topViewController](v8, "topViewController"));
    v22 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    if (v12 == (ICNoteBrowseViewController *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      v24 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));

      if (v12 != v24)
      {
        if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
        {
          v13 = 1;
          goto LABEL_83;
        }
        -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", 0);
      }
    }
    v13 = 0;
LABEL_83:
    v5 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));

    if (v12 == v5)
    {
      if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      {

        v11 = 0;
        v10 = 0;
      }
      else
      {
        -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:](self, "setSelectedNoteBrowseContainerItemID:", 0);
        -[ICViewControllerManager setTagSelection:](self, "setTagSelection:", 0);
      }
      -[ICViewControllerManager setMostRecentRegularWidthTagSelection:](self, "setMostRecentRegularWidthTagSelection:", 0);
      v5 = -[ICNoteBrowseViewController initWithViewMode:viewControllerManager:]([ICNoteBrowseViewController alloc], "initWithViewMode:viewControllerManager:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"), self);
      -[ICViewControllerManager setRootNoteBrowseViewController:](self, "setRootNoteBrowseViewController:", v5);

      -[ICViewControllerManager setCurrentNoteBrowseViewController:](self, "setCurrentNoteBrowseViewController:", 0);
    }
    goto LABEL_6;
  }
LABEL_79:

}

- (void)managedObjectContextDidChange:(id)a3
{
  void *v3;
  void *v4;
  void *v6;
  int v7;
  ICViewControllerManager *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  unsigned int v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  unsigned int v66;
  void *v67;
  unsigned int v68;
  void *v69;
  id obj;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  ICViewControllerManager *val;
  void *v79;
  _QWORD v80[5];
  _QWORD v81[6];
  id v82;
  id location;
  _QWORD v84[7];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  _QWORD block[5];
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _QWORD v110[3];
  _BYTE v111[128];
  _BYTE v112[128];

  v73 = a3;
  val = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  if (v6)
  {
    v7 = 0;
LABEL_7:
    v8 = val;
    goto LABEL_8;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](val, "selectedNoteObjectID"));
  if (v3)
  {
    v7 = 0;
    goto LABEL_7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](val, "selectedInvitationObjectID"));
  if (v4)
  {
    v3 = 0;
    v7 = 1;
    goto LABEL_7;
  }
  v8 = val;
  if (!-[ICViewControllerManager isTagSelected](val, "isTagSelected"))
    goto LABEL_103;
  v4 = 0;
  v3 = 0;
  v7 = 1;
LABEL_8:
  if (-[ICViewControllerManager isSelectedNoteTogglingLock](v8, "isSelectedNoteTogglingLock")
    || -[ICViewControllerManager isRecoveredNoteBeingPresented](v8, "isRecoveredNoteBeingPresented")
    || -[ICViewControllerManager isApplyingStateRestoreArchive](v8, "isApplyingStateRestoreArchive")
    || -[ICViewControllerManager isTagBeingRenamed](v8, "isTagBeingRenamed"))
  {
    v9 = 1;
    if (!v7)
      goto LABEL_14;
    goto LABEL_13;
  }
  v9 = -[ICViewControllerManager isTagBeingDeleted](v8, "isTagBeingDeleted");
  if ((v7 & 1) != 0)
LABEL_13:

LABEL_14:
  if (!v6)

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", NSInsertedObjectsKey));

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v106;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v106 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i);
          if (-[ICViewControllerManager shouldManagedObjectBecomeSelectedNote:](val, "shouldManagedObjectBecomeSelectedNote:", v15))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
            goto LABEL_27;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
        if (v12)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_27:

    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v110[0] = NSDeletedObjectsKey;
    v110[1] = NSUpdatedObjectsKey;
    v110[2] = NSRefreshedObjectsKey;
    v71 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v110, 3));
    v74 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    if (v74)
    {
      v77 = 0;
      v72 = *(_QWORD *)v102;
      while (1)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v102 != v72)
          {
            v18 = v17;
            objc_enumerationMutation(v71);
            v17 = v18;
          }
          v75 = v17;
          v19 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v19));

          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v22 = v21;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v98;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v98 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v25);
                v27 = objc_opt_class(ICNote);
                if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0
                  || (v28 = objc_opt_class(NoteObject), (objc_opt_isKindOfClass(v26, v28) & 1) != 0))
                {
                  objc_msgSend(v79, "addObject:", v26);
                  goto LABEL_40;
                }
                v29 = objc_opt_class(ICNoteData);
                if ((objc_opt_isKindOfClass(v26, v29) & 1) != 0)
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "note"));
                  objc_msgSend(v79, "ic_addNonNilObject:", v30);

                  goto LABEL_40;
                }
                v31 = objc_opt_class(NoteCollectionObject);
                if ((objc_opt_isKindOfClass(v26, v31) & 1) == 0)
                {
                  v32 = objc_opt_class(ICNoteContainer);
                  if ((objc_opt_isKindOfClass(v26, v32) & 1) == 0)
                  {
                    v41 = objc_opt_class(ICHashtag);
                    if ((objc_opt_isKindOfClass(v26, v41) & 1) == 0)
                      goto LABEL_40;
                    v37 = v26;
                    if (objc_msgSend(v37, "markedForDeletion"))
                    {
                      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectID"));
                      objc_msgSend(v76, "addObject:", v42);

                    }
                    goto LABEL_60;
                  }
                }
                if (objc_msgSend(v26, "isDeleted"))
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](val, "selectedNoteBrowseContainerItemID"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectID"));
                  v35 = objc_msgSend(v33, "isEqual:", v34);

                  if ((v35 & 1) != 0)
                  {
                    v77 = 0x100000001;
                    goto LABEL_40;
                  }
                }
                v36 = objc_opt_class(ICFolder);
                if ((objc_opt_isKindOfClass(v26, v36) & 1) != 0)
                {
                  v37 = v26;
                  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectID"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](val, "selectedNoteBrowseContainerItemID"));
                  v40 = objc_msgSend(v38, "isEqual:", v39);

                  if (v40)
                  {
                    if ((objc_msgSend(v37, "markedForDeletion") & 1) != 0
                      || objc_msgSend(v37, "isTrashFolder") && !objc_msgSend(v37, "visibleNotesCount"))
                    {
                      HIDWORD(v77) = 1;
                    }
                  }
                  else if (!-[ICViewControllerManager selectionStateTrackingEnabled](val, "selectionStateTrackingEnabled"))
                  {
                    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](val, "selectedNoteBrowseContainerItemID"));
                    if (v43)
                    {

                    }
                    else
                    {
                      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectID"));
                      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentNonSearchContainerItemID](val, "mostRecentNonSearchContainerItemID"));
                      if ((objc_msgSend(v44, "isEqual:", v45) & 1) != 0)
                      {
                        v46 = objc_msgSend(v37, "markedForDeletion");

                        if (v46)
                        {
                          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "account"));
                          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "defaultFolder"));

                          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectID"));
                          -[ICViewControllerManager setMostRecentNonSearchContainerItemID:](val, "setMostRecentNonSearchContainerItemID:", v49);

                        }
                      }
                      else
                      {

                      }
                    }
                  }
LABEL_60:

                }
LABEL_40:
                if (!v16)
                {
                  if (-[ICViewControllerManager shouldManagedObjectBecomeSelectedNote:](val, "shouldManagedObjectBecomeSelectedNote:", v26))
                  {
                    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectID"));
                  }
                  else
                  {
                    v16 = 0;
                  }
                }
                v25 = (char *)v25 + 1;
              }
              while (v23 != v25);
              v50 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
              v23 = v50;
            }
            while (v50);
          }

          v17 = v75 + 1;
        }
        while ((id)(v75 + 1) != v74);
        v74 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
        if (!v74)
          goto LABEL_77;
      }
    }
    v77 = 0;
LABEL_77:

    v51 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](val, "selectedContainerItemID"));
    v53 = ICDynamicCast(v51, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "workerManagedObjectContext"));
    LODWORD(v51) = objc_msgSend(v54, "isHiddenInContext:", v56);

    v57 = objc_msgSend(v76, "copy");
    v58 = -[ICViewControllerManager selectContainersForDeletedHashtagObjectIDs:](val, "selectContainersForDeletedHashtagObjectIDs:", v57);

    if (((v51 | HIDWORD(v77)) & 1) != 0
      && !-[ICViewControllerManager isNoteBeingRecovered](val, "isNoteBeingRecovered")
      && ((-[ICViewControllerManager isSelectingNextRelevantNoteBrowseContainer](val, "isSelectingNextRelevantNoteBrowseContainer") | v58) & 1) == 0&& (v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](val, "overrideContainerIdentifier")), v60 = v59 == 0, v59, v60))
    {
      -[ICViewControllerManager selectNextContainerForDeletedFolder](val, "selectNextContainerForDeletedFolder");
    }
    else if (v16)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100034434;
      block[3] = &unk_10054FE80;
      block[4] = val;
      v96 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
    else if ((objc_msgSend(v79, "count") != 0) | v77 & 1)
    {
      v89 = 0;
      v90 = &v89;
      v91 = 0x3032000000;
      v92 = sub_100027B3C;
      v93 = sub_100027B4C;
      v94 = 0;
      v85 = 0;
      v86 = &v85;
      v87 = 0x2020000000;
      v88 = 0;
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_1000344A0;
      v84[3] = &unk_1005505E8;
      v84[4] = val;
      v84[5] = &v89;
      v84[6] = &v85;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "ic_compactMap:", v84));
      if (*((_BYTE *)v86 + 24))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](val, "selectedNoteObjectID"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v62));
        -[ICViewControllerManager selectNextRelevantObjectUsingChangedInappropriateIdentifiers:](val, "selectNextRelevantObjectUsingChangedInappropriateIdentifiers:", v63);

      }
      else
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSearchResult](val, "selectedSearchResult"));
        v65 = v64 == 0;

        if (v65)
        {
          if (v90[5])
          {
            objc_initWeak(&location, val);
            -[ICViewControllerManager setIsRecoveredNoteBeingPresented:](val, "setIsRecoveredNoteBeingPresented:", 1);
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472;
            v81[2] = sub_100034AAC;
            v81[3] = &unk_100550610;
            v81[4] = val;
            v81[5] = &v89;
            objc_copyWeak(&v82, &location);
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v81);
            objc_destroyWeak(&v82);
            objc_destroyWeak(&location);
          }
          else
          {
            if (objc_msgSend(v61, "count"))
            {
              v80[0] = _NSConcreteStackBlock;
              v80[1] = 3221225472;
              v80[2] = sub_100034C9C;
              v80[3] = &unk_100550638;
              v80[4] = val;
              v66 = objc_msgSend(v61, "ic_containsObjectPassingTest:", v80);
            }
            else
            {
              v66 = 0;
            }
            if (((v77 | v66) & 1) != 0)
            {
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "object"));
              v68 = -[ICViewControllerManager selectDefaultFolderForNoteMovedOutOfSmartFolderIfNeeded:](val, "selectDefaultFolderForNoteMovedOutOfSmartFolderIfNeeded:", v67);
              if (((v68 | -[ICViewControllerManager selectDefaultFolderForNoteMovedOutOfSelectedTagsIfNeeded:](val, "selectDefaultFolderForNoteMovedOutOfSelectedTagsIfNeeded:", v67)) & 1) == 0)
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "valueForKey:", CFSTR("objectID")));
                -[ICViewControllerManager selectNextRelevantObjectUsingChangedInappropriateIdentifiers:](val, "selectNextRelevantObjectUsingChangedInappropriateIdentifiers:", v69);

              }
            }
          }
        }
      }

      _Block_object_dispose(&v85, 8);
      _Block_object_dispose(&v89, 8);

    }
  }
LABEL_103:

}

- (ICMainSplitViewController)mainSplitViewController
{
  return self->_mainSplitViewController;
}

- (NotesDisplayController)legacyNoteEditorViewController
{
  return self->_legacyNoteEditorViewController;
}

- (ICKeyboardHandler)keyboardHandler
{
  return self->_keyboardHandler;
}

- (BOOL)isWelcomeScreenVisible
{
  return self->_welcomeScreenVisible;
}

- (BOOL)isTagSelected
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
  v3 = objc_msgSend(v2, "isNonEmpty");

  return v3;
}

- (BOOL)isSplitViewExpandingOrCollapsing
{
  return self->_splitViewExpandingOrCollapsing;
}

- (BOOL)isAutomaticallySelectingNotes
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
    v6 = 1;
  else
    v6 = v5 == (id)1;
  return !v6;
}

- (BOOL)isApplyingStateRestoreArchive
{
  return self->_isApplyingStateRestoreArchive;
}

- (_TtC11MobileNotes33ICAppIntentsInteractionController)intentsInteractionController
{
  return self->_intentsInteractionController;
}

- (void)initializeSecondaryNavigationControllerWithViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_alloc((Class)UINavigationController);
  if (v12)
    v5 = objc_msgSend(v4, "initWithRootViewController:", v12);
  else
    v5 = objc_msgSend(v4, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  -[ICViewControllerManager setSecondaryNavigationController:](self, "setSecondaryNavigationController:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  objc_msgSend(v8, "setPrefersLargeTitles:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICBackgroundColor](UIColor, "ICBackgroundColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  objc_msgSend(v11, "setBackgroundColor:", v9);

}

- (void)initializeModernNoteEditorWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v7 = objc_msgSend(v6, "options");

    if (v7 == (id)a3)
      return;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributionSidebarController"));
    objc_msgSend(v9, "ic_removeObserver:forKeyPath:context:", self, CFSTR("attributionSidebarVisibility"), &off_1005CC928);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteEditorViewController editorViewControllerWithIdentifier:options:](ICNoteEditorViewController, "editorViewControllerWithIdentifier:options:", -1, a3));
  -[ICViewControllerManager setNoteEditorViewController:](self, "setNoteEditorViewController:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v11, "setViewControllerManager:", self);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributionSidebarController"));
  objc_msgSend(v12, "ic_addObserver:forKeyPath:context:", self, CFSTR("attributionSidebarVisibility"), &off_1005CC928);

}

- (void)initializeLegacyNoteEditor
{
  void *v3;
  NotesDisplayController *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));

  if (!v3)
  {
    v4 = -[NotesDisplayController initWithArchivedConfiguration:]([NotesDisplayController alloc], "initWithArchivedConfiguration:", 0);
    -[ICViewControllerManager setLegacyNoteEditorViewController:](self, "setLegacyNoteEditorViewController:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    objc_msgSend(v5, "setViewControllerManager:", self);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    objc_msgSend(v6, "setDelegate:", self);

  }
}

- (ICFolderListViewController)folderListViewController
{
  return self->_folderListViewController;
}

- (int64_t)enforcedNoteContainerViewModeForContainerItemID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v5 = objc_opt_class(NSManagedObjectID);
  v6 = ICDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v9 = ICDynamicCast(v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (objc_msgSend(v7, "ic_isModernContainerType"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = -1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100032450;
    v20[3] = &unk_10054FD20;
    v22 = &v23;
    v20[4] = self;
    v21 = v7;
    objc_msgSend(v11, "performBlockAndWait:", v20);

    v12 = v24[3];
    v13 = v21;
LABEL_5:

    _Block_object_dispose(&v23, 8);
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "ic_isLegacyContainerType"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = -1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000324DC;
    v17[3] = &unk_10054FD20;
    v19 = &v23;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v14, "performBlockAndWait:", v17);

    v12 = v24[3];
    v13 = v18;
    goto LABEL_5;
  }
  if (v10)
  {
    v12 = (int64_t)objc_msgSend(v10, "enforcedNoteContainerViewMode");
  }
  else
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10001D464();

    v12 = -1;
  }
LABEL_6:

  return v12;
}

- (void)didUpdateModelForSelectionStateController:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100015744;
  v3[3] = &unk_100550110;
  v3[4] = self;
  performBlockOnMainThread(v3);
}

- (ICNoteBrowseViewController)currentNoteBrowseViewController
{
  return self->_currentNoteBrowseViewController;
}

- (UINavigationController)compactNavigationController
{
  UINavigationController *compactNavigationController;
  UINavigationController *v4;
  UINavigationController *v5;
  void *v6;

  compactNavigationController = self->_compactNavigationController;
  if (!compactNavigationController)
  {
    v4 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithNibName:bundle:", 0, 0);
    v5 = self->_compactNavigationController;
    self->_compactNavigationController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_compactNavigationController, "navigationBar"));
    objc_msgSend(v6, "setPrefersLargeTitles:", 1);

    -[UINavigationController setToolbarHidden:](self->_compactNavigationController, "setToolbarHidden:", 0);
    -[UINavigationController setDelegate:](self->_compactNavigationController, "setDelegate:", self);
    compactNavigationController = self->_compactNavigationController;
  }
  return compactNavigationController;
}

- (void)applyStateRestoreArchive:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _TtC11MobileNotes21ICSelectionStateModel *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void (**v83)(_QWORD);
  void (**v84)(_QWORD);
  uint8_t buf[16];
  void *v86;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[ICViewControllerManager setIsApplyingStateRestoreArchive:](self, "setIsApplyingStateRestoreArchive:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostApplicationIdentifier"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostApplicationIdentifier"));
    v11 = objc_msgSend(v10, "copy");
    -[ICViewControllerManager setHostApplicationIdentifier:](self, "setHostApplicationIdentifier:", v11);

  }
  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    objc_msgSend(v12, "ensureModernAccountExistsInContext:", v13);

  }
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v14, "setupWithArchive:", v6);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSearchTerm"));
  if (!v15
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController")), v17 = objc_msgSend(v16, "ic_isViewVisible"), v16, !v17))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = objc_msgSend(v19, "supportsMultipleScenes");

    if ((v20 & 1) == 0)
      objc_msgSend(v6, "setIsAuxiliaryWindow:", 0);
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled")
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentObjectIDURL")),
          v21,
          !v21))
    {
LABEL_34:
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));

      if (v48)
      {
        objc_msgSend(v6, "setIsPrimaryContentVisible:", -[ICViewControllerManager isPrimaryContentVisible](self, "isPrimaryContentVisible"));
        objc_msgSend(v6, "setIsSupplementaryContentVisible:", -[ICViewControllerManager isSupplementaryContentVisible](self, "isSupplementaryContentVisible"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
        v50 = objc_msgSend(v49, "isCollapsed");

        if (v50)
          -[ICViewControllerManager setFolderListViewController:](self, "setFolderListViewController:", 0);
      }
      if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      {
        -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:sideEffects:](self, "setSelectedNoteBrowseContainerItemID:sideEffects:", 0, 0);
        -[ICViewControllerManager setSelectedNoteObjectID:sideEffects:](self, "setSelectedNoteObjectID:sideEffects:", 0, 0);
        -[ICViewControllerManager setSelectedInvitationObjectID:sideEffects:](self, "setSelectedInvitationObjectID:sideEffects:", 0, 0);
        -[ICViewControllerManager setFocusedNoteObjectID:](self, "setFocusedNoteObjectID:", 0);
        if (!-[ICViewControllerManager validateStateRestoreArchive:](self, "validateStateRestoreArchive:", v6))
        {
          v51 = objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveWithEmptyState](ICWindowStateArchive, "windowStateArchiveWithEmptyState"));

          v6 = (id)v51;
        }
      }
      if (!objc_msgSend(v6, "noteCreationApproach"))
      {
        v62 = 0;
        if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
          goto LABEL_66;
        v71 = 0;
        goto LABEL_65;
      }
      v52 = objc_msgSend((id)objc_opt_class(self), "isNoteCreateApproachForScrapPaper:", objc_msgSend(v6, "noteCreationApproach"));
      if (!(_DWORD)v52)
        goto LABEL_49;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v53));
      v55 = objc_msgSend(v54, "count");

      if (v55)
        goto LABEL_49;
      v56 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "No modern accounts were found, trying to create a blank modern local account as a fallback.", buf, 2u);
      }

      +[ICMigrationController upgradeEmptyLocalLegacyAccountIfNecessary](ICMigrationController, "upgradeEmptyLocalLegacyAccountIfNecessary");
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      objc_msgSend(v57, "addOrDeleteLocalAccountIfNecessary");

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v58));
      v60 = objc_msgSend(v59, "count");

      if (v60)
      {
        v61 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Successfully created local account.", buf, 2u);
        }

LABEL_49:
        v62 = 0;
        v63 = 1;
        goto LABEL_50;
      }
      v84 = v7;
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", v75));
      if (objc_msgSend(v76, "count"))
      {

      }
      else
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "noteContext"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "allAccounts"));
        v80 = objc_msgSend(v79, "count");

        if (!v80)
        {
          v63 = 1;
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager applyStateRestoreArchive:completion:]", 1, 0, CFSTR("Unable to create local account."));
          v62 = 0;
LABEL_76:
          v7 = v84;
LABEL_50:
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager containerObjectIDForNewNoteWithApproach:](self, "containerObjectIDForNewNoteWithApproach:", objc_msgSend(v6, "noteCreationApproach")));
          if (!v64)
          {
            if (v63)
              +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager applyStateRestoreArchive:completion:]", 1, 0, CFSTR("Couldn't get containerObjectID for approach %ld. Are there no accounts on the device?"), objc_msgSend(v6, "noteCreationApproach"));
            v71 = 0;
LABEL_62:

            if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
            {
              if (v71)
              {
                v74 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
                objc_msgSend(v74, "adoptModel:withArchive:systemPaperAccountAlert:completion:", v71, v6, v62, v7);

LABEL_67:
                goto LABEL_68;
              }
LABEL_66:
              v71 = (_TtC11MobileNotes21ICSelectionStateModel *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
              -[ICSelectionStateModel adoptCurrentModelWithArchive:systemPaperAccountAlert:completion:](v71, "adoptCurrentModelWithArchive:systemPaperAccountAlert:completion:", v6, v62, v7);
              goto LABEL_67;
            }
LABEL_65:
            -[ICViewControllerManager setupViewsFromWindowStateArchive:systemPaperShowModernAccountAlert:completion:](self, "setupViewsFromWindowStateArchive:systemPaperShowModernAccountAlert:completion:", v6, v62, v7);
            goto LABEL_67;
          }
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
          objc_msgSend(v65, "pushNoteCreateDataWithCreateApproach:", objc_msgSend(v6, "noteCreationApproach"));

          v66 = objc_opt_class(ICNote);
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager createNewNoteInContainerWithObjectID:isSystemPaper:](self, "createNewNoteInContainerWithObjectID:isSystemPaper:", v64, v52));
          v68 = ICDynamicCast(v66, v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

          v70 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
          objc_msgSend(v70, "popNoteCreateData");

          if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
          {
            if (!v69)
            {
              v71 = 0;
              goto LABEL_61;
            }
            v71 = objc_alloc_init(_TtC11MobileNotes21ICSelectionStateModel);
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectID"));
            -[ICSelectionStateModel setSelectedNoteObjectID:](v71, "setSelectedNoteObjectID:", v72);
          }
          else
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectID"));
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "URIRepresentation"));
            objc_msgSend(v6, "setCurrentObjectIDURL:", v73);

            v71 = 0;
          }

LABEL_61:
          goto LABEL_62;
        }
      }
      v81 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Failed to create modern local account, but legacy accounts exist. System Paper will show alert.", buf, 2u);
      }

      v63 = 0;
      v62 = 1;
      goto LABEL_76;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentObjectIDURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:", v22));
    if (!objc_msgSend(v23, "ic_isModernNoteType")
      || (v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers")),
          v25 = objc_msgSend(v24, "count"),
          v24,
          !v25))
    {
LABEL_27:
      if (objc_msgSend(v23, "ic_isBaseAttachmentType"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "ic_existingObjectWithID:", v23));

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "note"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "folder"));
        v41 = v40;
        if (v38 && v39 && v40)
        {
          v83 = v7;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectID"));
          v82 = v22;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URIRepresentation"));
          v86 = v43;
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
          objc_msgSend(v6, "setCurrentContainerObjectIDURLs:", v44);

          v7 = v83;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectID"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "URIRepresentation"));
          objc_msgSend(v6, "setCurrentNoteObjectIDURL:", v46);

          v22 = v82;
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[ICTextViewScrollState scrollStateForAttachment:inNote:](ICTextViewScrollState, "scrollStateForAttachment:inNote:", v38, v39));
          objc_msgSend(v6, "setScrollState:", v47);

        }
      }

      goto LABEL_34;
    }
    v26 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"));
    v28 = ICDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (!-[ICViewControllerManager isSelectionAppropriateForObjectID:](self, "isSelectionAppropriateForObjectID:", v23))
    {
LABEL_26:

      goto LABEL_27;
    }
    if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));
      v32 = v7;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ic_compactMap:", &stru_10054FE18));
      objc_msgSend(v6, "setCurrentTagIdentifiers:", v33);

      v7 = v32;
    }
    else if (v29)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "type"));
      objc_msgSend(v6, "setCurrentVirtualSmartFolderType:", v34);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "accountObjectID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URIRepresentation"));
      objc_msgSend(v6, "setCurrentVirtualSmartFolderAccountObjectIDURL:", v31);
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerObjectIDs](self, "selectedContainerObjectIDs"));

      if (!v35)
      {
LABEL_25:
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URIRepresentation"));
        objc_msgSend(v6, "setCurrentNoteObjectIDURL:", v36);

        objc_msgSend(v6, "setCurrentObjectIDURL:", 0);
        goto LABEL_26;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerObjectIDs](self, "selectedContainerObjectIDs"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ic_map:", &stru_10054FE58));
      objc_msgSend(v6, "setCurrentContainerObjectIDURLs:", v31);
    }

    goto LABEL_25;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));
  objc_msgSend(v18, "startSearchWithSearchQuery:searchTokens:searchScope:becomeFirstResponder:", v15, 0, 0, 1);

  -[ICViewControllerManager setIsApplyingStateRestoreArchive:](self, "setIsApplyingStateRestoreArchive:", 0);
  if (v7)
    v7[2](v7);
LABEL_68:

}

- (ICActivityStreamSelection)activityStreamSelection
{
  void *v3;
  ICActivityStreamSelection *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (ICActivityStreamSelection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityStreamSelection"));

  }
  else
  {
    v4 = self->_activityStreamSelection;
  }
  return v4;
}

- (ICActivityStreamNavigationController)activityStreamNavigationController
{
  return self->_activityStreamNavigationController;
}

+ (id)keyPathsForValuesAffectingSelectedContainerItemID
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("isSearchActiveWithQuery"), CFSTR("selectedNoteBrowseContainerItemID"), 0);
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager persistenceConfiguration](self, "persistenceConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modernViewContext"));

  return (NSManagedObjectContext *)v3;
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager persistenceConfiguration](self, "persistenceConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "legacyViewContext"));

  return (NSManagedObjectContext *)v3;
}

- (void)setPersistenceConfiguration:(id)a3
{
  id v5;
  ICWindowStateArchive *v6;

  objc_storeStrong((id *)&self->_persistenceConfiguration, a3);
  v5 = a3;
  -[ICViewControllerManager setRootNoteBrowseViewController:](self, "setRootNoteBrowseViewController:", 0);
  -[ICViewControllerManager setFolderListViewController:](self, "setFolderListViewController:", 0);
  -[ICViewControllerManager setNoteEditorViewController:](self, "setNoteEditorViewController:", 0);
  -[ICViewControllerManager setLegacyNoteEditorViewController:](self, "setLegacyNoteEditorViewController:", 0);
  -[ICViewControllerManager setMainSplitViewController:](self, "setMainSplitViewController:", 0);
  -[ICViewControllerManager setTrailingSidebarSplitViewController:](self, "setTrailingSidebarSplitViewController:", 0);
  v6 = objc_alloc_init(ICWindowStateArchive);

  -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v6, 0);
}

- (BOOL)canAddNewNoteToSelectedContainers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unsigned __int8 v17;
  BOOL v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v9 = objc_opt_class(NSManagedObjectID);
        v10 = ICDynamicCast(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        if (objc_msgSend(v11, "ic_isModernContainerType"))
        {
          v25 = 0;
          v26 = &v25;
          v27 = 0x3032000000;
          v28 = sub_100027B3C;
          v29 = sub_100027B4C;
          v30 = 0;
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100027B54;
          v21[3] = &unk_10054FD20;
          v24 = &v25;
          v12 = v20;
          v22 = v12;
          v13 = v11;
          v23 = v13;
          objc_msgSend(v12, "performBlockAndWait:", v21);
          v14 = v26[5];
          v15 = objc_opt_class(ICNoteContainer);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            v16 = (id)v26[5];
            v17 = objc_msgSend(v16, "isSharedReadOnly");

            if ((v17 & 1) != 0)
            {

              _Block_object_dispose(&v25, 8);
              v18 = 0;
              goto LABEL_14;
            }
          }

          _Block_object_dispose(&v25, 8);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v5)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_14:

  return v18;
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  ICNAEventReporter *v8;
  ICNAEventReporter *eventReporter;
  void *v10;

  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = objc_alloc((Class)ICNAEventReporter);
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    v8 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:window:", v6, v7);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = ICNAEventReporterLostSessionNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (NSUndoManager)undoManager
{
  NSUndoManager *undoManager;
  NSUndoManager *v4;
  NSUndoManager *v5;

  undoManager = self->_undoManager;
  if (!undoManager)
  {
    v4 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
    v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (NSUndoManager)visibleViewsUndoManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager undoManager](self, "undoManager"));
  if ((objc_msgSend(v3, "canUndo") & 1) == 0 && (objc_msgSend(v3, "canRedo") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_topmostPresentedViewController"));
    if (v5)
    {
LABEL_4:

      return (NSUndoManager *)v3;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v7 = objc_msgSend(v6, "ic_isViewVisible");

    if (v7 && !-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textViewUndoManager"));
      v5 = v3;
      v3 = (void *)v9;
      goto LABEL_4;
    }
  }
  return (NSUndoManager *)v3;
}

- (BOOL)hasCompactHeight
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "ic_hasCompactHeight");

  return v4;
}

- (NSSet)excludedContainerIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    v5 = objc_msgSend(v4, "mode");

    if (v5)
    {
      if (v5 != (id)2)
      {
        v3 = 0;
        return (NSSet *)v3;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "excludedObjectIDs"));
    }
    v3 = (void *)v7;

  }
  return (NSSet *)v3;
}

- (NSArray)selectedContainerObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));

  v6 = objc_opt_class(NSManagedObjectID);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"));
  v8 = ICDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v5)
  {
    v25 = v9;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v11)
      goto LABEL_16;
    v12 = v11;
    v13 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(ICNoteBrowseViewController);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v17 = v15;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "noteCollection"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "noteCollection"));
            goto LABEL_12;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "noteContainer"));

          if (v20)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "noteContainer"));
LABEL_12:
            v21 = v19;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectID"));
            objc_msgSend(v3, "ic_addNonNilObject:", v22);

          }
          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v12)
      {
LABEL_16:

        v9 = v25;
        goto LABEL_19;
      }
    }
  }
  if (v9)
    objc_msgSend(v3, "ic_addNonNilObject:", v9);
LABEL_19:
  v23 = objc_msgSend(v3, "copy");

  return (NSArray *)v23;
}

- (NSDictionary)visibleObjectIDsForContainerObjectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(ICNoteBrowseViewController);
        v13 = ICDynamicCast(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteCollection"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
        if (v16)
        {
          v17 = (void *)v16;

        }
        else
        {
          v18 = objc_opt_class(NSManagedObject);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteContainer"));
          v20 = ICDynamicCast(v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectID"));

          if (!v17)
            goto LABEL_10;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "indexPathsForVisibleItems"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sortedArrayUsingSelector:", "compare:"));

        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000283CC;
        v29[3] = &unk_10054FD48;
        v30 = v14;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ic_compactMap:", v29));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, v17);

LABEL_10:
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  v26 = objc_msgSend(v3, "copy");
  return (NSDictionary *)v26;
}

- (unint64_t)adjustedNumberOfGalleryViewColumns
{
  void *v3;
  void *v4;
  id v5;
  CGRect v7;

  if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") != (id)1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v4, "adjustedNumberOfGalleryColumnsForWidth:", CGRectGetWidth(v7));

  return (unint64_t)v5;
}

- (BOOL)isPrimaryContentVisible
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForColumn:", 0));
  v6 = objc_msgSend(v5, "ic_isViewVisible");

  return v6;
}

- (BOOL)isSupplementaryContentVisible
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForColumn:", 1));
  v6 = objc_msgSend(v5, "ic_isViewVisible");

  return v6;
}

- (BOOL)isTrailingContentVisible
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unint64_t v7;

  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      v5 = objc_msgSend(v4, "isSidebarHidden") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    v7 = (unint64_t)objc_msgSend(v6, "displayMode");

    return ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2) & ~-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth");
  }
  return v5;
}

- (ICItemIdentifier)selectedContainerItemID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
LABEL_7:
    v10 = (void *)v4;
    return (ICItemIdentifier *)v10;
  }
  if (!-[ICViewControllerManager isSearchActiveWithQuery](self, "isSearchActiveWithQuery"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "folderDataSource"));
  v7 = objc_msgSend(v6, "countOfAllVisibleAccounts");

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "folderDataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstRelevantItemIdentifier"));

  }
  else
  {
    v10 = 0;
  }
  return (ICItemIdentifier *)v10;
}

- (void)launchNotesAppFromLockscreenWithQueryOptions:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSMutableDictionary *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstResponder"));
  objc_msgSend(v9, "resignFirstResponder");

  v10 = -[objc_class serviceWithDefaultShellEndpoint](off_1005CC5A0(), "serviceWithDefaultShellEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));

  v14 = objc_msgSend(v7, "mutableCopy");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__kCFBooleanTrue, "stringValue"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, ICQuickNoteURLOptionIsContinuing);

  v16 = objc_msgSend(v14, "copy");
  v17 = objc_opt_new(NSMutableDictionary);
  v18 = off_1005CC5A8();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v19);

  v20 = off_1005CC5B0();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities urlForQuickNoteWithOptions:](ICAppURLUtilities, "urlForQuickNoteWithOptions:", v16));
  v23 = off_1005CC5B8();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v22, v24);

  v25 = -[objc_class optionsWithDictionary:](off_1005CC5C0(), "optionsWithDictionary:", v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100028A38;
  v28[3] = &unk_10054FDD8;
  v29 = v6;
  v27 = v6;
  objc_msgSend(v11, "openApplication:withOptions:completion:", v13, v26, v28);

}

- (void)dismissOverlayContent
{
  -[ICViewControllerManager dismissPrimaryOverlayContent](self, "dismissPrimaryOverlayContent");
  -[ICViewControllerManager dismissSupplementaryOverlayContent](self, "dismissSupplementaryOverlayContent");
}

- (void)showAccountListAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  v6 = objc_msgSend(v5, "isCollapsed");

  if (v6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
    v7 = objc_msgSend(v8, "popToRootViewControllerAnimated:", v3);
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v8, "ic_showColumn:animated:", 0, v3);
  }

}

- (void)showAttachmentBrowser
{
  void *v3;
  ICViewAttachmentsActivity *v4;
  void *v5;
  void *v6;
  ICViewAttachmentsActivity *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentAttachmentBrowserViewController](self, "currentAttachmentBrowserViewController"));

  if (!v3)
  {
    v4 = [ICViewAttachmentsActivity alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
    v7 = -[ICViewAttachmentsActivity initWithPresentingViewController:eventReporter:](v4, "initWithPresentingViewController:eventReporter:", v5, v6);

    -[ICViewAttachmentsActivity performActivityWithCompletion:](v7, "performActivityWithCompletion:", 0);
  }
}

- (void)showTagSelection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (v4 && !objc_msgSend(v4, "isEmpty"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "includedObjectIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "excludedObjectIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v11));

    if (objc_msgSend(v16, "mode") == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier"));
      v14 = v9;
    }
    else
    {
      if (objc_msgSend(v16, "mode") != (id)2)
      {
LABEL_13:
        v15 = objc_msgSend(v16, "copy");
        -[ICViewControllerManager setTagSelection:](self, "setTagSelection:", v15);

        -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:keepEditorShowing:animated:](self, "showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:keepEditorShowing:animated:", v9, v12, 1, 1, &__kCFBooleanTrue, 1);
        goto LABEL_14;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier"));
      v14 = v12;
    }
    objc_msgSend(v14, "addObject:", v13);

    goto LABEL_13;
  }
  if (!-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentNonSearchContainerItemID](self, "mostRecentNonSearchContainerItemID"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));

      if (!v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentNonSearchContainerItemID](self, "mostRecentNonSearchContainerItemID"));
        -[ICViewControllerManager selectContainerWithIdentifier:usingRootViewController:deferUntilDataLoaded:animated:](self, "selectContainerWithIdentifier:usingRootViewController:deferUntilDataLoaded:animated:", v8, 1, 0, 0);

      }
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
  objc_msgSend(v9, "clear");
LABEL_14:

}

- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 keepEditorShowing:(id)a7 animated:(BOOL)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  unsigned int v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  ICNoteBrowseViewController *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  _QWORD block[4];
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id location;

  v10 = a6;
  v11 = a5;
  v14 = a3;
  v30 = a4;
  v15 = a7;
  v16 = objc_msgSend(v14, "ic_containsObjectPassingTest:", &stru_10054FF10);
  v17 = objc_msgSend(v14, "ic_containsObjectPassingTest:", &stru_10054FF30);
  v18 = objc_msgSend(v14, "count");
  v19 = 0;
  v20 = a8;
  if ((v17 & 1) == 0 && v18)
  {
    if (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
      v19 = v16;
    else
      v19 = 1;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager containerItemIDForContainerIdentifiers:](self, "containerItemIDForContainerIdentifiers:", v14));
  v22 = -[ICViewControllerManager enforcedNoteContainerViewModeForContainerItemID:](self, "enforcedNoteContainerViewModeForContainerItemID:", v21);
  if (v22 == (void *)-1)
  {
    if (-[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode") == -1)
      goto LABEL_14;
    v23 = -[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode");
    -[ICViewControllerManager setPreferredNoteContainerViewMode:](self, "setPreferredNoteContainerViewMode:", -1);
    if (v23 == (void *)-1)
      goto LABEL_14;
  }
  else
  {
    v23 = v22;
    if ((void *)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") != v22
      && -[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode") == -1)
    {
      -[ICViewControllerManager setPreferredNoteContainerViewMode:](self, "setPreferredNoteContainerViewMode:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"));
    }
  }
  if (v23 == (void *)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode")
    || (self->_noteContainerViewMode = (int64_t)v23,
        v24 = -[ICNoteBrowseViewController initWithViewMode:viewControllerManager:]([ICNoteBrowseViewController alloc], "initWithViewMode:viewControllerManager:", v23, self), -[ICViewControllerManager setRootNoteBrowseViewController:](self, "setRootNoteBrowseViewController:", v24), v24, v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController")), v26 = objc_msgSend(v25, "isCollapsed"), v25, (v26 & 1) != 0))
  {
LABEL_14:
    LOBYTE(v29) = v20;
    v27 = v30;
    -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:keepEditorShowing:animated:](self, "showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:keepEditorShowing:animated:", v14, v30, v11, v10, v19, v15, v29);
    goto LABEL_15;
  }
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100029730;
  v33[3] = &unk_10054FF80;
  objc_copyWeak(&v37, &location);
  v34 = v14;
  v27 = v30;
  v35 = v30;
  v36 = v15;
  v28 = objc_retainBlock(v33);
  if (+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100029830;
    block[3] = &unk_10054FFA8;
    v32 = v28;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    ((void (*)(_QWORD *))v28[2])(v28);
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
LABEL_15:

}

- (void)showNoteWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  ICViewControllerManager *v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000298DC;
  v6[3] = &unk_100550020;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
  v9 = self;
  v4 = v8;
  v5 = v7;
  objc_msgSend(v4, "performBlock:", v6);

}

- (void)showInlineAttachmentWithIdentifier:(id)a3 inNoteIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  ICViewControllerManager *v15;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029DAC;
  v11[3] = &unk_100550098;
  v12 = v6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
  v14 = v7;
  v15 = self;
  v8 = v7;
  v9 = v13;
  v10 = v6;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)showObjectWithObjectID:(id)a3
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "ic_isContainerType"))
  {
    if (!objc_msgSend(v4, "ic_isInlineAttachmentType"))
    {
      if (objc_msgSend(v4, "ic_isNoteType"))
      {
        -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:animated:ensurePresented:", v4, 0, 0, 1, 1);
        goto LABEL_8;
      }
      if (!objc_msgSend(v4, "ic_isAttachmentType"))
        goto LABEL_8;
    }
    -[ICViewControllerManager selectAttachmentWithObjectID:animated:](self, "selectAttachmentWithObjectID:animated:", v4, 1);
    goto LABEL_8;
  }
  -[ICViewControllerManager selectContainerWithIdentifier:usingRootViewController:deferUntilDataLoaded:animated:](self, "selectContainerWithIdentifier:usingRootViewController:deferUntilDataLoaded:animated:", v4, 1, 1, 1);
LABEL_8:

}

- (void)showNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
  _BOOL4 v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  _BOOL4 v16;
  _BOOL8 v17;
  id v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned int v26;
  void *v27;
  id v28;
  int64_t v29;
  uint64_t v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  unsigned int v57;
  unsigned int v58;
  id v59;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v16 = a10;
  v17 = a9;
  v59 = a3;
  v18 = a4;
  v19 = -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
  if (!v59)
  {
    if ((v19 & 1) == 0)
      -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    v24 = objc_msgSend(v23, "isCollapsed");

    if ((v24 & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
      v26 = objc_msgSend(v25, "ic_isViewVisible");

      if (!v26)
        goto LABEL_50;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
      v28 = objc_msgSend(v27, "popViewControllerAnimated:", 1);
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      objc_msgSend(v27, "showColumn:", 1);
    }
LABEL_49:

    goto LABEL_50;
  }
  if ((v19 & 1) != 0)
    goto LABEL_24;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));

  if (!v20)
    goto LABEL_24;
  v58 = v13;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  if (!-[ICViewControllerManager isSearchActive](self, "isSearchActive"))
    goto LABEL_14;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  if (objc_msgSend(v22, "isCollapsed"))
  {

    goto LABEL_14;
  }
  v29 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");

  if (v29)
  {
LABEL_14:
    if (-[ICViewControllerManager isSearchActive](self, "isSearchActive"))
      goto LABEL_17;
  }
  if (!-[ICViewControllerManager isSelectionAppropriateForObjectID:](self, "isSelectionAppropriateForObjectID:", v59))
  {
    v30 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager defaultContainerObjectIDForNoteWithObjectID:](self, "defaultContainerObjectIDForNoteWithObjectID:", v59));

    v21 = (void *)v30;
  }
LABEL_17:
  if (v21)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
    v32 = objc_msgSend(v31, "isEqual:", v21);

    if ((v32 & 1) == 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "viewControllers"));
      v57 = v11;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastObject"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
      v17 = v35 != v36 && a9;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v21));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      -[ICViewControllerManager setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v37, v17, 1, v38, v39, 0, 0, 0, 0);

      v11 = v57;
    }

    v16 = a10;
    v13 = v58;
LABEL_24:
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));

    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectWithID:", v59));

      if (!v42)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "-[ICViewControllerManager showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "note");
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
      objc_msgSend(v43, "setCurrentNote:animated:direction:setEditing:showInkPicker:", v42, v17, 0, v13, v12);

      if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
        -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", v59);

LABEL_48:
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager previousSelectedNoteObjectID](self, "previousSelectedNoteObjectID"));
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "updateCurrentNoteLastViewedMetadata:", v55);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
      v56 = objc_msgSend(v27, "copy");
      -[ICViewControllerManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "updateCurrentNoteLastViewedMetadata:", v56, 0.75);

      goto LABEL_49;
    }
    -[ICViewControllerManager dismissAnyPresentedViewControllerAnimated:forShowNote:completion:](self, "dismissAnyPresentedViewControllerAnimated:forShowNote:completion:", v17, 1, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v44, "hideActivityStreamToolbarAnimated:", v17);

    if (objc_msgSend(v59, "ic_isEntityOfClass:", objc_opt_class(ICNote)))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectWithID:", v59));

      if (v10 && objc_msgSend(v46, "isSharedViaICloud"))
      {
        v47 = objc_msgSend(objc_alloc((Class)ICActivityStreamDigest), "initWithObject:", v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "recentUpdatesRangeValue"));
        v49 = v48;
        if (v48)
        {
          v50 = objc_msgSend(v48, "rangeValue");
          v52 = objc_claimAutoreleasedReturnValue(+[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", v50, v51, v46));

          v18 = (id)v52;
        }

      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      objc_msgSend(v53, "setNote:overrideScrollState:", v46, v18);
    }
    else
    {
      if (!objc_msgSend(v59, "ic_isEntityOfClass:", objc_opt_class(NoteObject)))
      {
LABEL_40:
        if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
          -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", v59);
        if (v16)
        {
          if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
          {
            if ((_DWORD)v11)
              -[ICViewControllerManager dismissOverlayContent](self, "dismissOverlayContent");
            -[ICViewControllerManager setNoteEditorAnimated:ensurePresented:startEditing:showLegacy:showLatestUpdatesIfAvailable:](self, "setNoteEditorAnimated:ensurePresented:startEditing:showLegacy:showLatestUpdatesIfAvailable:", v17, 1, v13, -[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"), 1);
          }
          else
          {
            -[ICViewControllerManager ensureNoteEditorPresentedAnimated:startEditing:dismissOverlayContent:](self, "ensureNoteEditorPresentedAnimated:startEditing:dismissOverlayContent:", v17, v13, v11);
          }
        }
        goto LABEL_48;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectWithID:", v59));

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
      objc_msgSend(v53, "displayNote:", v46);
    }

    goto LABEL_40;
  }
LABEL_50:

}

- (void)ensureNoteEditorPresentedAnimated:(BOOL)a3 startEditing:(BOOL)a4
{
  -[ICViewControllerManager ensureNoteEditorPresentedAnimated:startEditing:dismissOverlayContent:](self, "ensureNoteEditorPresentedAnimated:startEditing:dismissOverlayContent:", a3, a4, 1);
}

- (void)ensureNoteEditorPresentedAnimated:(BOOL)a3 startEditing:(BOOL)a4 dismissOverlayContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  unsigned int v9;
  id v10;

  v5 = a4;
  v6 = a3;
  if (a5)
    -[ICViewControllerManager dismissOverlayContent](self, "dismissOverlayContent");
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled")
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController")),
        v9 = objc_msgSend(v8, "hasDeferredItem"),
        v8,
        v9))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v10, "adoptDeferredAnimated:startEditing:", v6, v5);

  }
  else
  {
    -[ICViewControllerManager setNoteEditorAnimated:ensurePresented:startEditing:showLegacy:showLatestUpdatesIfAvailable:](self, "setNoteEditorAnimated:ensurePresented:startEditing:showLegacy:showLatestUpdatesIfAvailable:", v6, 1, v5, -[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"), 1);
  }
}

- (void)showInvitationWithObjectID:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  const __CFNull *v8;
  const __CFNull *v9;
  const __CFNull *v10;
  unint64_t v11;
  const __CFNull *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFNull *v25;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));

  if (!v7)
  {
    if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    {
      -[ICViewControllerManager setSelectedInvitationObjectID:](self, "setSelectedInvitationObjectID:", v6);
      v8 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
      v9 = (const __CFNull *)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualSharedWithYouFolder](ICAccount, "globalVirtualSharedWithYouFolder"));
      if (kCFNull == v8)
        v10 = 0;
      else
        v10 = v8;
      v11 = v10;
      if (kCFNull == v9)
        v12 = 0;
      else
        v12 = v9;
      v13 = v12;
      if (v11 | v13)
      {
        v14 = (void *)v13;
        if (v11)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (v15)
        {

        }
        else
        {
          v16 = objc_msgSend((id)v11, "isEqual:", v13);

          if ((v16 & 1) != 0)
            goto LABEL_20;
        }
        v8 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
        v9 = (const __CFNull *)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualSharedWithYouFolder](ICAccount, "globalVirtualSharedWithYouFolder"));
        v25 = v9;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
        -[ICViewControllerManager setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v8, v4, 1, v18, v19, 0, 0, 0, 0);

      }
    }
LABEL_20:
    -[ICViewControllerManager dismissAnyPresentedViewControllerAnimated:forShowNote:completion:](self, "dismissAnyPresentedViewControllerAnimated:forShowNote:completion:", v4, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v20, "hideActivityStreamToolbarAnimated:", v4);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectWithID:", v6));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v23, "setInvitation:", v22);

    -[ICViewControllerManager setNoteEditorAnimated:ensurePresented:startEditing:showLegacy:showLatestUpdatesIfAvailable:](self, "setNoteEditorAnimated:ensurePresented:startEditing:showLegacy:showLatestUpdatesIfAvailable:", v4, 1, 0, 0, 1);
    -[ICViewControllerManager dismissOverlayContent](self, "dismissOverlayContent");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
    objc_msgSend(v24, "submitCollabNotificationEventWithAction:", 3);

    goto LABEL_21;
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager showInvitationWithObjectID:animated:]", 1, 0, CFSTR("System Paper does not support showing invitations"));
LABEL_21:

}

- (BOOL)presentAttachment:(id)a3 delegate:(id)a4 displayShowInNote:(BOOL)a5 editable:(BOOL)a6 selectedSubAttachment:(id)a7 presentingViewController:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v20;

  v9 = a6;
  v10 = a5;
  v20 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

  LOBYTE(v17) = -[ICViewControllerManager presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:](self, "presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:", v18, 0, v16, v10, v9, v15, v14);
  return (char)v17;
}

- (BOOL)presentAttachments:(id)a3 startingAtIndex:(unint64_t)a4 delegate:(id)a5 displayShowInNote:(BOOL)a6 editable:(BOOL)a7 selectedSubAttachment:(id)a8 presentingViewController:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  unsigned __int8 v33;
  BOOL v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  NSObject *v38;
  unint64_t v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  unint64_t v48;
  BOOL v49;
  BOOL v50;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rootViewController"));

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentedViewController"));
    v22 = v15;
    v23 = (void *)v21;
    if (v21)
      v24 = (void *)v21;
    else
      v24 = v20;
    v18 = v24;

    v15 = v22;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentAttachmentPresenter](self, "currentAttachmentPresenter"));
  v26 = v25;
  if (v25)
  {
    v40 = a4;
    v27 = a6;
    v28 = a7;
    v29 = v17;
    v30 = v16;
    v31 = v15;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "presentedViewController"));
    v33 = objc_msgSend(v32, "isBeingPresented");

    if ((v33 & 1) != 0)
    {
      v34 = 0;
      v15 = v31;
      v16 = v30;
      v17 = v29;
      goto LABEL_17;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "galleryAttachmentEditorController"));

    v15 = v31;
    v16 = v30;
    v17 = v29;
    a7 = v28;
    a6 = v27;
    a4 = v40;
    if (v35)
    {
      v34 = 0;
      goto LABEL_17;
    }
  }
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10002B24C;
  v43[3] = &unk_1005500C0;
  v43[4] = self;
  v44 = v15;
  v48 = a4;
  v45 = v16;
  v49 = a6;
  v50 = a7;
  v46 = v18;
  v47 = v17;
  v36 = objc_retainBlock(v43);
  v37 = v36;
  if (v26)
  {
    v38 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      sub_100403F88();

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10002B2B8;
    v41[3] = &unk_10054FFA8;
    v42 = v37;
    objc_msgSend(v26, "dismissAnimated:completion:", 0, v41);

  }
  else
  {
    ((void (*)(_QWORD *))v36[2])(v36);
  }

  v34 = 1;
LABEL_17:

  return v34;
}

- (void)showSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;

  v4 = a4;
  v35 = a3;
  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "object"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
    v10 = objc_msgSend(v9, "ic_isNoteType");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "configuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "foundAttachmentObjectID"));

      if (!v12)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "object"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectID"));
        v21 = objc_msgSend(v20, "ic_isEntityOfClass:", objc_opt_class(ICNote));

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "object"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectWithID:", v24));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstMatchingRangeInNote"));
          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstMatchingRangeInNote"));
            v28 = objc_msgSend(v27, "rangeValue");
            v30 = v29;

          }
          else
          {
            v28 = 0;
            v30 = 0;
          }

          v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", v28, v30, v25));
        }
        else
        {
          v13 = 0;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "object"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));
        BYTE1(v34) = 1;
        LOBYTE(v34) = v4;
        -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v31, v13, 0, 0, 1, 0, v34);

        goto LABEL_17;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "configuration"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "foundAttachmentObjectID"));
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "object"));
      v16 = objc_opt_class(ICAttachment);
      isKindOfClass = objc_opt_isKindOfClass(v15, v16);

      if ((isKindOfClass & 1) == 0)
      {
LABEL_18:
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "highlightPatternRegexFinder"));
        objc_msgSend(v32, "highlightSearchMatchesForRegexFinder:", v33);

        -[ICViewControllerManager setSelectedSearchResult:](self, "setSelectedSearchResult:", v35);
        goto LABEL_19;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "object"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));
    }
    v18 = (void *)v14;
    -[ICViewControllerManager selectAttachmentWithObjectID:animated:](self, "selectAttachmentWithObjectID:animated:", v14, v4);
LABEL_17:

    goto LABEL_18;
  }
  v6 = v35;
  if (v35)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v7, "pushSearchResult:animated:", v35, v4);

LABEL_19:
    v6 = v35;
  }

}

- (void)showRecentUpdatesForNoteWithObjectID:(id)a3
{
  -[ICViewControllerManager showRecentUpdatesForNoteWithObjectID:suppressSidebar:](self, "showRecentUpdatesForNoteWithObjectID:suppressSidebar:", a3, 0);
}

- (void)showRecentUpdatesForNoteWithObjectID:(id)a3 suppressSidebar:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  v6 = objc_opt_class(ICNote);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectWithID:", v19));
  v9 = ICDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)ICActivityStreamDigest), "initWithObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recentUpdatesFilter"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toDate"));
    v14 = (void *)v13;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
    {
      -[ICViewControllerManager hideAttributionHighlights](self, "hideAttributionHighlights");
      v16 = 0;
    }
    else
    {
      v16 = objc_msgSend(objc_alloc((Class)ICActivityStreamSelection), "initWithFilter:displayDate:", v12, v13);
    }
    -[ICViewControllerManager showAttributionHighlightsForNoteWithObjectID:selection:suppressSidebar:](self, "showAttributionHighlightsForNoteWithObjectID:selection:suppressSidebar:", v19, v16, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
    objc_msgSend(v17, "moveToViewMode:", 1);

    objc_msgSend(v10, "markLastActivityRecentUpdatesViewed");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
    objc_msgSend(v18, "submitCollabActivityBrowseEventForObject:contextPath:clickContext:mode:isCurrentUserMentioned:hasRecentUpdates:", v10, 0, 3, 0, objc_msgSend(v11, "isCurrentUserMentionedInRecentSummary"), objc_msgSend(v11, "hasRecentUpdates"));

  }
}

- (void)showActivityStreamForObjectWithObjectID:(id)a3
{
  -[ICViewControllerManager showActivityStreamForObjectWithObjectID:collabActivityContextPath:](self, "showActivityStreamForObjectWithObjectID:collabActivityContextPath:", a3, 0);
}

- (void)showActivityStreamForObjectWithObjectID:(id)a3 collabActivityContextPath:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = objc_opt_class(ICCloudSyncingObject);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectWithID:", v17));
  v9 = ICDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    if ((objc_msgSend(v17, "ic_isFolderType") & 1) != 0
      || -[ICViewControllerManager showsPresentedActivityStreamAsModal](self, "showsPresentedActivityStreamAsModal"))
    {
      v11 = 4;
    }
    else if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
    {
      v11 = 2;
    }
    else
    {
      v11 = 5;
    }
    -[ICViewControllerManager presentActivityStreamForObject:viewMode:animated:](self, "presentActivityStreamForObject:viewMode:animated:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));

    if (a4 && !v12)
    {
      v13 = objc_msgSend(objc_alloc((Class)ICActivityStreamDigest), "initWithObject:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
      objc_msgSend(v14, "submitCollabActivityBrowseEventForObject:contextPath:clickContext:mode:isCurrentUserMentioned:hasRecentUpdates:", v10, a4, 4, 0, objc_msgSend(v13, "isCurrentUserMentionedInRecentSummary"), objc_msgSend(v13, "hasRecentUpdates"));

    }
    v15 = objc_opt_class(ICNote);
    if ((objc_opt_isKindOfClass(v10, v15) & 1) != 0)
    {
      v16 = v10;
      objc_msgSend(v16, "markActivitySummaryViewed");
      objc_msgSend(v16, "markLastActivityRecentUpdatesViewed");

    }
  }

}

- (int64_t)activityStreamViewMode
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
    v5 = (int64_t)objc_msgSend(v4, "viewMode");

  }
  else if (-[ICViewControllerManager isTrailingContentVisible](self, "isTrailingContentVisible"))
  {
    v5 = 5;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)showsActivityStream
{
  return -[ICViewControllerManager activityStreamViewMode](self, "activityStreamViewMode") != 0;
}

- (void)presentActivityStreamForObject:(id)a3 viewMode:(int64_t)a4 animated:(BOOL)a5
{
  id v8;
  unsigned int v9;
  int64_t v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  const __CFNull *v20;
  const __CFNull *v21;
  const __CFNull *v22;
  unint64_t v23;
  const __CFNull *v24;
  unint64_t v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  int64_t v31;
  BOOL v32;

  v8 = a3;
  v9 = -[ICViewControllerManager showsPresentedActivityStreamAsModal](self, "showsPresentedActivityStreamAsModal");
  v10 = 4;
  if (!v9)
    v10 = a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002BC2C;
  v29[3] = &unk_100550138;
  v31 = v10;
  v29[4] = self;
  v11 = v8;
  v30 = v11;
  v32 = a5;
  v12 = objc_retainBlock(v29);
  -[ICViewControllerManager stopEditing](self, "stopEditing");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
      -[ICViewControllerManager hidePresentedActivityStreamNavigationControllerWithCompletion:](self, "hidePresentedActivityStreamNavigationControllerWithCompletion:", v12);
  }
  else
  {
    ((void (*)(_QWORD *))v12[2])(v12);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));
  if (objc_msgSend(v19, "ic_isNoteType"))
  {
    v20 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v21 = (const __CFNull *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));
    if (kCFNull == v20)
      v22 = 0;
    else
      v22 = v20;
    v23 = v22;
    if (kCFNull == v21)
      v24 = 0;
    else
      v24 = v21;
    v25 = v24;
    if (v23 | v25)
    {
      v26 = (void *)v25;
      if (v23 && v25)
      {
        v27 = objc_msgSend((id)v23, "isEqual:", v25);

        if ((v27 & 1) != 0)
          goto LABEL_23;
      }
      else
      {

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));
      BYTE1(v28) = 1;
      LOBYTE(v28) = a5;
      -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v19, 0, 0, 0, 0, 1, v28);
    }
    else
    {

    }
  }

LABEL_23:
}

- (void)hideActivityStreamWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;

  v4 = a3;
  if (!-[ICViewControllerManager showsPresentedActivityStreamAsModal](self, "showsPresentedActivityStreamAsModal")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController")), v5, !v5))
  {
    -[ICViewControllerManager setActivityStreamSelection:](self, "setActivityStreamSelection:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));

  if (v6)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002C458;
    v33[3] = &unk_100550160;
    v33[4] = self;
    v34 = v4;
    -[ICViewControllerManager hidePresentedActivityStreamNavigationControllerWithCompletion:](self, "hidePresentedActivityStreamNavigationControllerWithCompletion:", v33);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v7, "hideActivityStreamToolbarAnimated:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
    if (!objc_msgSend(v8, "isSidebarHidden"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
      v10 = objc_msgSend(v9, "displayMode");

      if (v10 == (id)1)
        goto LABEL_9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      objc_msgSend(v17, "nonDisplacedColumnWidth");
      v19 = v14 - v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      LODWORD(v12) = objc_msgSend(v20, "isDisplacingColumn");

      if ((_DWORD)v12)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
        objc_msgSend(v21, "preferredDisplacedColumnWidth");
        v19 = v19 - v22;

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v24 = objc_msgSend(v23, "requiresNotificationForSecondaryColumnSize:", v19, v16);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      objc_msgSend(v25, "setSidebarHidden:", 1);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "transitionCoordinator"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v28 = objc_msgSend(v27, "isDisplacingColumn");

      if (v28)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10002C494;
        v32[3] = &unk_1005500E8;
        v32[4] = self;
        objc_msgSend(v8, "animateAlongsideTransition:completion:", v32, 0);
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      objc_msgSend(v29, "setIsDisplacingColumn:", 0);

      if (v24)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "transitionCoordinator"));
        -[ICViewControllerManager sendNotificationForNoteEditorSizeChange:transitionCoordinator:](self, "sendNotificationForNoteEditorSizeChange:transitionCoordinator:", v31, v19, v16);

      }
    }

  }
LABEL_9:

}

- (BOOL)showsAttributionHighlights
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));
  v3 = v2 != 0;

  return v3;
}

- (void)showAttributionHighlightsForNoteWithObjectID:(id)a3 selection:(id)a4
{
  -[ICViewControllerManager showAttributionHighlightsForNoteWithObjectID:selection:suppressSidebar:](self, "showAttributionHighlightsForNoteWithObjectID:selection:suppressSidebar:", a3, a4, 0);
}

- (void)showAttributionHighlightsForNoteWithObjectID:(id)a3 selection:(id)a4 suppressSidebar:(BOOL)a5
{
  CFNullRef v8;
  id v9;
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
  const __CFNull *v20;
  const __CFNull *v21;
  const __CFNull *v22;
  const __CFNull *v23;
  unint64_t v24;
  CFNullRef v25;
  unint64_t v26;
  void *v27;
  unsigned __int8 v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[5];
  const __CFNull *v44;
  id v45;
  BOOL v46;
  _QWORD v47[5];
  const __CFNull *v48;
  id v49;
  BOOL v50;

  v8 = (CFNullRef)a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityStreamViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));

  if (v12 && (objc_msgSend(v12, "isEqual:", v8) & 1) == 0)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10002C92C;
    v47[3] = &unk_100550188;
    v47[4] = self;
    v48 = v8;
    v49 = v9;
    v50 = a5;
    -[ICViewControllerManager hidePresentedActivityStreamNavigationControllerWithCompletion:](self, "hidePresentedActivityStreamNavigationControllerWithCompletion:", v47);

    v20 = v48;
LABEL_28:

    goto LABEL_29;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedModernNote](self, "selectedModernNote"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));
  if (!objc_msgSend(v14, "isEqual:", v8))
    goto LABEL_9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));
  if ((objc_msgSend(v15, "isEqual:", v9) & 1) == 0)
  {

LABEL_9:
LABEL_10:
    if (-[__CFNull ic_isModernNoteType](v8, "ic_isModernNoteType"))
    {
      v21 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
      v22 = v21;
      if (kCFNull == v21)
        v23 = 0;
      else
        v23 = v21;
      v24 = v23;
      if (kCFNull == v8)
        v25 = 0;
      else
        v25 = v8;
      v26 = v25;
      if (v24 | v26)
      {
        v27 = (void *)v26;
        if (!v24 || !v26)
        {

LABEL_31:
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_existingObjectWithID:", v8));

          v33 = objc_msgSend(objc_alloc((Class)ICTTTextEditGrouper), "initWithNote:", v42);
          objc_msgSend(v33, "setJoinsWhitespaceAndNewlineGaps:", 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filter"));
          objc_msgSend(v33, "setFilter:", v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "groupedEdits"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));
          v37 = objc_msgSend(v36, "range");
          v39 = v38;

          v40 = (void *)objc_claimAutoreleasedReturnValue(+[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", v37, v39, v42));
          BYTE1(v41) = 1;
          LOBYTE(v41) = -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth");
          -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v8, v40, 0, 0, 1, 1, v41);

          goto LABEL_24;
        }
        v28 = objc_msgSend((id)v24, "isEqual:", v26);

        if ((v28 & 1) == 0)
          goto LABEL_31;
      }
      else
      {

      }
    }
    -[ICViewControllerManager dismissOverlayContent](self, "dismissOverlayContent");
LABEL_24:
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10002C940;
    v43[3] = &unk_100550188;
    v43[4] = self;
    v44 = v8;
    v45 = v9;
    v46 = a5;
    v29 = objc_retainBlock(v43);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
      objc_msgSend(v31, "ic_performBlockAfterActiveTransition:", v29);

    }
    else
    {
      ((void (*)(_QWORD *))v29[2])(v29);
    }

    v20 = v44;
    goto LABEL_28;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filter"));

  if (!v16)
    goto LABEL_10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authorHighlightsUpdater"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filter"));
  objc_msgSend(v18, "flashHighlightsForFilter:", v19);

LABEL_29:
}

- (void)hideAttributionHighlights
{
  -[ICViewControllerManager setActivityStreamSelection:](self, "setActivityStreamSelection:", 0);
}

- (void)showRecentlyDeletedMathNotes
{
  void *v3;
  void *v4;
  id v5;

  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualRecentlyDeletedMathNotesFolder](ICAccount, "globalVirtualRecentlyDeletedMathNotesFolder"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:animated:](self, "selectContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:animated:", v3, v4, 0, 1, 1);

  }
}

- (void)showSelectionForParticipant:(id)a3 noteObjectID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedModernNote](self, "selectedModernNote"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
  v9 = objc_msgSend(v8, "isEqual:", v12);

  if ((v9 & 1) == 0)
    -[ICViewControllerManager showObjectWithObjectID:](self, "showObjectWithObjectID:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "realtimeCollaborationSelectionController"));
  objc_msgSend(v11, "showSelectionForParticipant:", v6);

}

- (BOOL)canUserChangeNoteContainerViewMode
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  v4 = v3 == 0;

  return v4;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  -[ICViewControllerManager setNoteContainerViewMode:completion:](self, "setNoteContainerViewMode:completion:", a3, 0);
}

- (void)setNoteContainerViewMode:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  unsigned int v7;
  void (**v8)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  v8 = v6;
  if (self->_noteContainerViewMode != a3)
  {
    v7 = -[ICViewControllerManager isAuxiliary](self, "isAuxiliary");
    v6 = v8;
    if (!v7)
    {
      self->_noteContainerViewMode = a3;
      -[ICViewControllerManager updateSplitViewForCurrentViewModeWithCompletion:](self, "updateSplitViewForCurrentViewModeWithCompletion:", v8);
      goto LABEL_6;
    }
  }
  if (v6)
  {
    v6[2](v6);
LABEL_6:
    v6 = v8;
  }

}

- (void)updateSplitViewForCurrentViewModeWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD);
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  unsigned int v67;
  _BOOL4 v68;
  void (**v69)(_QWORD);
  void *v70;
  void *v71;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v6 = objc_msgSend(v5, "style");

  if (!-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth")
    && (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") || v6 == (id)2)
    && ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") != (id)1 || v6 == (id)1))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager windowStateArchive](self, "windowStateArchive"));
      v8 = -[ICViewControllerManager behavior](self, "behavior");
      v9 = !-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth");
      if (v8 == 1)
        v9 = 1;
      v67 = v9;
      v68 = v8 != 1;
      v66 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
      v11 = objc_msgSend(v10, "isCollapsed") ^ 1;
      v12 = objc_opt_class(NSManagedObjectID);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
      v69 = v4;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstRelevantItemIdentifier"));
      v16 = ICDynamicCast(v12, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
      +[ICSelectionStateUtilities updateArchive:forNewViewMode:requiresContainerSelection:requiresObjectSelection:validateContainerSelection:defaultObjectID:modernManagedObjectContext:legacyManagedObjectContext:](_TtC11MobileNotes25ICSelectionStateUtilities, "updateArchive:forNewViewMode:requiresContainerSelection:requiresObjectSelection:validateContainerSelection:defaultObjectID:modernManagedObjectContext:legacyManagedObjectContext:", v7, v66, v67, v11, v68, v17, v18, v19);

      v4 = v69;
      -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v7, v69);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
      v21 = objc_msgSend(v20, "isCollapsed");

      if ((v21 & 1) != 0 || -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
      {
        v7 = 0;
      }
      else
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
        v58 = v57;
        if (v57)
          v59 = v57;
        else
          v59 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager previousSelectedNoteObjectID](self, "previousSelectedNoteObjectID"));
        v7 = v59;

        if (!-[ICViewControllerManager isSelectionAppropriateForObjectID:](self, "isSelectionAppropriateForObjectID:", v7))
        {
          v60 = objc_opt_class(NSManagedObjectID);
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "dataSource"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "firstRelevantItemIdentifier"));
          v64 = ICDynamicCast(v60, v63);
          v65 = objc_claimAutoreleasedReturnValue(v64);

          v7 = (void *)v65;
        }
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager windowStateArchive](self, "windowStateArchive"));
      objc_msgSend(v22, "setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:", &__NSDictionary0__struct);
      objc_msgSend(v22, "setCurrentNoteContainerViewMode:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"));
      if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
      {
        objc_msgSend(v22, "setCurrentNoteObjectIDURL:", 0);
        if (!-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentContainerObjectIDURLs"));
          v24 = objc_msgSend(v23, "count");

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentContainerObjectIDURLs"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastObject"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:", v26));

            v28 = objc_opt_class(ICFolder);
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ic_existingObjectWithID:", v27));
            v31 = ICDynamicCast(v28, v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

            if (v32)
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ancestorFolderObjectIDs"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "reverseObjectEnumerator"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "allObjects"));
              v35 = v27;
              v36 = v4;
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectID"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "arrayByAddingObject:", v37));

              v4 = v36;
              v27 = v35;

              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ic_map:", &stru_1005501C8));
              objc_msgSend(v22, "setCurrentContainerObjectIDURLs:", v39);

            }
          }
        }
      }
      else if (!-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
      {
        objc_msgSend(v22, "setIsSupplementaryContentVisible:", 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentContainerObjectIDURLs"));
        v41 = objc_msgSend(v40, "count");

        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentContainerObjectIDURLs"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastObject"));
          v71 = v43;
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));
          objc_msgSend(v22, "setCurrentContainerObjectIDURLs:", v44);

        }
        if (objc_msgSend(v7, "ic_isNoteType"))
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URIRepresentation"));
          objc_msgSend(v22, "setCurrentNoteObjectIDURL:", v45);

        }
        if (objc_msgSend(v7, "ic_isInvitationType"))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URIRepresentation"));
          objc_msgSend(v22, "setCurrentInvitationObjectIDURL:", v46);

        }
      }
      if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "ic_compactMap:", &stru_100550208));

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "allObjects"));
        objc_msgSend(v22, "setCurrentTagIdentifiers:", v49);

      }
      v50 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"));
      v52 = ICDynamicCast(v50, v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

      if (v53)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "type"));
        objc_msgSend(v22, "setCurrentVirtualSmartFolderType:", v54);

        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "accountObjectID"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "URIRepresentation"));
        objc_msgSend(v22, "setCurrentVirtualSmartFolderAccountObjectIDURL:", v56);

      }
      -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v22, v4);

    }
  }

}

+ (BOOL)isNoteCreateApproachForScrapPaper:(int64_t)a3
{
  return (unint64_t)(a3 - 15) < 6;
}

+ (BOOL)doesNoteCreateApproachUseSelectedContainerToInferSystemPaperness:(int64_t)a3
{
  return ((unint64_t)a3 < 0xF) & (0x6007u >> a3);
}

- (id)showNewNoteWithApproach:(int64_t)a3 sender:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unsigned int isKindOfClass;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  char v44;
  char v45;
  BOOL v46;
  _BOOL4 v47;
  _QWORD v48[5];
  char v49;
  BOOL v50;
  BOOL v51;
  char v52;
  char v53;

  v47 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
  v9 = objc_msgSend(v8, "ic_isEntityOfClass:", objc_opt_class(NoteObject));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    objc_msgSend(v10, "saveNote");

  }
  v11 = objc_opt_class(UIEvent);
  v12 = ICDynamicCast(v11, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v13, "ic_isPencilEvent");

  v46 = a3 == 9;
  v15 = objc_opt_class(UIKeyCommand);
  isKindOfClass = objc_opt_isKindOfClass(v7, v15);
  v17 = objc_opt_class(UIEvent);
  v18 = ICDynamicCast(v17, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allTouches"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "anyObject"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "window"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "windowScene"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "delegate"));

    v26 = objc_opt_class(ICSystemPaperWindowSceneDelegate);
    v27 = ICDynamicCast(v26, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  }
  else
  {
    v29 = objc_opt_class(ICSystemPaperWindowSceneDelegate);
    v30 = ICDynamicCast(v29, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v28 = v22;
  }

  v31 = 0;
  if (a3 != 11 && (v14 & 1) == 0)
    v31 = (a3 != 10) & ((a3 != 0) | isKindOfClass);
  if (v7)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
    objc_msgSend(v32, "pushNoteCreateDataWithCreateApproach:", a3);

  }
  LODWORD(v43) = a3 == 10;
  HIDWORD(v43) = a3 == 11;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager containerObjectIDForNewNoteWithApproach:](self, "containerObjectIDForNewNoteWithApproach:", a3, v43));
  if (v33)
  {
    if ((objc_msgSend((id)objc_opt_class(self), "isNoteCreateApproachForScrapPaper:", a3) & 1) != 0)
    {
      v34 = 1;
    }
    else if (objc_msgSend((id)objc_opt_class(self), "doesNoteCreateApproachUseSelectedContainerToInferSystemPaperness:", a3))
    {
      v36 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
      v38 = ICDynamicCast(v36, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "type"));
      v34 = (uint64_t)objc_msgSend(v40, "isEqual:", ICVirtualSmartFolderItemIdentifierTypeSystemPaper);

    }
    else
    {
      v34 = 0;
    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10002DBB0;
    v48[3] = &unk_100550230;
    v49 = (char)v14;
    v50 = v28 != 0;
    v48[4] = self;
    v51 = v46;
    v52 = v45;
    v53 = v44;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager showNewNoteStartEditing:inContainerWithObjectID:isSystemPaper:showInkPicker:animated:completion:](self, "showNewNoteStartEditing:inContainerWithObjectID:isSystemPaper:showInkPicker:animated:completion:", v31, v33, v34, v14, v47, v48));
    if (v7)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
      objc_msgSend(v41, "popNoteCreateData");

    }
  }
  else
  {
    -[ICViewControllerManager showUpgradeNotesDialog](self, "showUpgradeNotesDialog");
    v35 = 0;
  }

  return v35;
}

- (void)showUpgradeNotesDialog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Upgrade Notes"), &stru_1005704B8, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("To create notes directly, upgrade your notes."), &stru_1005704B8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v5, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1005704B8, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, 0));

  objc_msgSend(v6, "addAction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v10, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)closeAuxiliaryWindow
{
  -[ICViewControllerManager closeAuxiliaryWindowAnimated:](self, "closeAuxiliaryWindowAnimated:", 0);
}

- (void)closeAuxiliaryWindowAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  ICSystemPaperDismissAction *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = a3;
  if (-[ICViewControllerManager isAuxiliary](self, "isAuxiliary"))
  {
    v5 = +[UIDevice ic_isiPhone](UIDevice, "ic_isiPhone");
    v6 = os_log_create("com.apple.notes", "UI");
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending ICSystemPaperDismissAction to scene presenter", buf, 2u);
      }

      v8 = -[ICSystemPaperDismissAction initWithReason:]([ICSystemPaperDismissAction alloc], "initWithReason:", CFSTR("done"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
      v11 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_FBSScene"));

      if (v11)
      {
        v12 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
        -[NSObject sendActions:](v11, "sendActions:", v12);
      }
      else
      {
        v12 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          sub_100403FE0();
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Closing Auxiliary Window", v16, 2u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v8 = (ICSystemPaperDismissAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_windowHostingScene"));

      if (!v8)
      {
        v11 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No active auxiliary window to close. Ignoring request.", v15, 2u);
        }
        goto LABEL_19;
      }
      if (v3)
      {
        v11 = (os_log_t)objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
        -[NSObject setWindowDismissalAnimation:](v11, "setWindowDismissalAnimation:", 2);
      }
      else
      {
        v11 = 0;
      }
      v12 = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSystemPaperDismissAction session](v8, "session"));
      -[NSObject requestSceneSessionDestruction:options:errorHandler:](v12, "requestSceneSessionDestruction:options:errorHandler:", v14, v11, &stru_100550270);

    }
LABEL_19:

  }
}

- (unint64_t)countOfAllVisibleAccounts
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "folderDataSource"));
  v4 = objc_msgSend(v3, "countOfAllVisibleAccounts");

  return (unint64_t)v4;
}

- (NSString)title
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100027B3C;
  v32 = sub_100027B4C;
  v33 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v5 = objc_msgSend(v4, "ic_isModernNoteType");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10002E48C;
      v27[3] = &unk_100550298;
      v27[4] = self;
      v27[5] = &v28;
      objc_msgSend(v6, "performBlockAndWait:", v27);
LABEL_16:

      goto LABEL_17;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v9 = objc_msgSend(v8, "ic_isLegacyNoteType");

    if (v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002E518;
      v26[3] = &unk_100550298;
      v26[4] = self;
      v26[5] = &v28;
      objc_msgSend(v6, "performBlockAndWait:", v26);
      goto LABEL_16;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));

    if (v7)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10002E5A4;
      v25[3] = &unk_100550298;
      v25[4] = self;
      v25[5] = &v28;
      objc_msgSend(v6, "performBlockAndWait:", v25);
      goto LABEL_16;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));

    if (v10)
    {
      v11 = objc_opt_class(NSManagedObjectID);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
      v13 = ICDynamicCast(v11, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (objc_msgSend(v6, "ic_isModernContainerType"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10002E630;
        v24[3] = &unk_1005502C0;
        v15 = v24;
        v24[4] = self;
        v24[5] = v6;
        v24[6] = &v28;
        objc_msgSend(v14, "performBlockAndWait:", v24);
      }
      else
      {
        if (!objc_msgSend(v6, "ic_isLegacyContainerType"))
          goto LABEL_16;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10002E69C;
        v23[3] = &unk_1005502C0;
        v15 = v23;
        v23[4] = self;
        v23[5] = v6;
        v23[6] = &v28;
        objc_msgSend(v14, "performBlockAndWait:", v23);
      }

      goto LABEL_16;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    v17 = objc_msgSend(v16, "isNonEmpty");

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
      v20 = (void *)v29[5];
      v29[5] = v19;

    }
  }
LABEL_17:
  v21 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return (NSString *)v21;
}

- (void)updateSceneTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager title](self, "title"));
  objc_msgSend(v4, "setTitle:", v5);

}

- (void)updateOverrideNoteContainerViewModeIfNeeded
{
  id v2;

  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualMathNotesFolder](ICAccount, "globalVirtualMathNotesFolder"));
    objc_msgSend(v2, "setOverrideNoteContainerViewMode:", 0);

  }
}

- (void)updateHostedNotesAppearance
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager hostedNotesAppearanceCoordinator](self, "hostedNotesAppearanceCoordinator"));
  objc_msgSend(v2, "updateAppearance");

}

- (BOOL)isAttachmentBrowserVisible
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentAttachmentBrowserViewController](self, "currentAttachmentBrowserViewController"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isNoteEditorVisible
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  if ((objc_msgSend(v3, "ic_isViewVisible") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    v4 = objc_msgSend(v5, "ic_isViewVisible");

  }
  return v4;
}

- (BOOL)isNoteEditorTopViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
    v3 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));
    v8 = v6 == v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isInHTMLEditorMode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    LOBYTE(v5) = objc_msgSend(v4, "ic_isLegacyNoteType");
LABEL_5:

    return (char)v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));

  if (v5)
  {
    v5 = (void *)objc_opt_class(NSManagedObjectID);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
    v6 = ICDynamicCast(v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    LOBYTE(v5) = objc_msgSend(v7, "ic_isLegacyContainerType");

    goto LABEL_5;
  }
  return (char)v5;
}

- (BOOL)isFolderListVisible
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v3 = objc_msgSend(v2, "ic_isViewVisible");

  return v3;
}

- (ICNoteEditing)activeEditorController
{
  void *v3;

  if (-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  return (ICNoteEditing *)v3;
}

- (ICNoteSearchViewController)searchController
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteSearchViewController"));
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteSearchViewController"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));

    v10 = objc_opt_class(ICBaseViewController);
    v11 = ICDynamicCast(v10, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noteSearchViewController"));

    if (v13)
    {
      v7 = v13;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteSearchViewController"));

    }
  }

  return (ICNoteSearchViewController *)v7;
}

- (ICBaseViewController)currentSearchBarViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  if ((objc_msgSend(v3, "isCollapsed") & 1) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  }
  else if (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
  }
  v5 = (void *)v4;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(ICBaseViewController);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v8 = v11;
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_16:

  return (ICBaseViewController *)v8;
}

- (ICBrowseAttachmentsCollectionController)currentAttachmentBrowserViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = objc_opt_class(UINavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_topViewController"));
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
  v9 = objc_msgSend(v8, "ic_firstObjectOfClass:", objc_opt_class(ICBrowseAttachmentsCollectionController));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (ICBrowseAttachmentsCollectionController *)v10;
}

- (void)hidePresentedActivityStreamNavigationControllerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else if (v8)
  {
    v8[2]();
  }

}

- (UIViewController)presentedActivityStreamPresentingViewController
{
  void *v3;

  if (-[ICViewControllerManager isAuxiliary](self, "isAuxiliary"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  }
  else if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarViewController](self, "trailingSidebarViewController"));
  }
  return (UIViewController *)v3;
}

- (ICActivityStreamNavigationController)presentedActivityStreamNavigationController
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(ICActivityStreamNavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamPresentingViewController](self, "presentedActivityStreamPresentingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (ICActivityStreamNavigationController *)v7;
}

- (void)showStartupWithForceWelcomeScreen:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  unsigned __int8 v7;
  char v8;
  NSObject *v9;
  ICStartupNavigationController *v10;
  void *v11;
  ICStartupNavigationController *v12;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  double Height;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  ICOverlayWindowPresenter *v23;
  void *v24;
  ICOverlayWindowPresenter *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  ICStartupNavigationController *v32;
  _QWORD v33[5];
  void (**v34)(_QWORD);
  unsigned __int8 v35;
  CGRect v36;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[ICViewControllerManager isWelcomeScreenVisible](self, "isWelcomeScreenVisible"))
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    v7 = +[ICStartupController hasShownWelcomeScreen](ICStartupController, "hasShownWelcomeScreen");
    v8 = +[ICStartupController shouldShowWelcomeOrWhatsNewScreen](ICStartupController, "shouldShowWelcomeOrWhatsNewScreen");
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1004040E4(v8, v4, v9);

    v10 = [ICStartupNavigationController alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002F244;
    v33[3] = &unk_100550310;
    v35 = v7;
    v33[4] = self;
    v34 = v6;
    v12 = -[ICStartupNavigationController initWithForceWelcomeScreen:presentingWindow:dismissBlock:](v10, "initWithForceWelcomeScreen:presentingWindow:dismissBlock:", v4, v11, v33);

    v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1004040B8();

    -[ICViewControllerManager setWelcomeScreenVisible:](self, "setWelcomeScreenVisible:", 1);
    -[ICViewControllerManager setStartupNavigationController:](self, "setStartupNavigationController:", v12);
    -[ICStartupNavigationController setModalInPresentation:](v12, "setModalInPresentation:", 1);
    if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)3)
    {
      -[ICStartupNavigationController preferredContentSize](v12, "preferredContentSize");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      objc_msgSend(v16, "frame");
      Height = CGRectGetHeight(v36);

      -[ICStartupNavigationController setPreferredContentSize:](v12, "setPreferredContentSize:", v15, Height);
      v18 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rootViewController"));
      objc_msgSend(v19, "presentViewController:animated:completion:", v12, 0, 0);
    }
    else
    {
      v20 = objc_alloc_init((Class)UIViewController);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ic_dynamicWhiteBlackColor](UIColor, "ic_dynamicWhiteBlackColor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
      objc_msgSend(v22, "setBackgroundColor:", v21);

      v23 = [ICOverlayWindowPresenter alloc];
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v25 = -[ICOverlayWindowPresenter initWithRootViewController:presentingWindow:](v23, "initWithRootViewController:presentingWindow:", v20, v24);
      -[ICViewControllerManager setStartupPresenter:](self, "setStartupPresenter:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager startupPresenter](self, "startupPresenter"));
      objc_msgSend(v27, "setWindowBackgroundColor:", v26);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager startupPresenter](self, "startupPresenter"));
      objc_msgSend(v28, "setPresentAnimationType:", 2);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager startupPresenter](self, "startupPresenter"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10002F460;
      v30[3] = &unk_10054FE80;
      v31 = v20;
      v32 = v12;
      v18 = v20;
      objc_msgSend(v29, "presentWithCompletionBlock:", v30);

      v19 = v31;
    }

  }
}

- (BOOL)hasMultipleModernAccounts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "folderDataSource"));

  LOBYTE(v2) = (unint64_t)objc_msgSend(v3, "countOfModernAccounts") > 1;
  return (char)v2;
}

- (BOOL)isMainSplitViewDisplayModeSecondaryOnly
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v3 = objc_msgSend(v2, "displayMode") == (id)1;

  return v3;
}

- (ICTTTextContentStorage)textContentStorage
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = objc_opt_class(ICTK2TextView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textView"));
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_opt_class(ICTTTextContentStorage);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLayoutManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textContentManager"));
  v11 = ICDynamicCast(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return (ICTTTextContentStorage *)v12;
}

- (ICItemIdentifier)overrideContainerIdentifier
{
  void *v2;

  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)1)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualMathNotesFolder](ICAccount, "globalVirtualMathNotesFolder"));
  else
    v2 = 0;
  return (ICItemIdentifier *)v2;
}

- (int64_t)behavior
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v3 = objc_msgSend(v2, "behavior");

  return (int64_t)v3;
}

- (void)setSelectedNoteBrowseContainerItemID:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteBrowseContainerItemID:]", 1, 0, CFSTR("VCM::setSelectedNoteBrowseContainerItemID should not be called when feature enabled"));
  else
    -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:sideEffects:](self, "setSelectedNoteBrowseContainerItemID:sideEffects:", v4, 1);

}

- (void)setSelectedNoteBrowseContainerItemID:(id)a3 sideEffects:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteBrowseContainerItemID:sideEffects:]", 1, 0, CFSTR("VCM::setSelectedNoteBrowseContainerItemID should not be called when feature enabled"));
  }
  else if (a4)
  {
    if ((-[ICItemIdentifier isEqual:](self->_selectedNoteBrowseContainerItemID, "isEqual:", v14) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedNoteBrowseContainerItemID, a3);
      if (v14)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
        objc_msgSend(v7, "clear");

      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
        objc_msgSend(v8, "setNoteContainer:", 0);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
        objc_msgSend(v9, "setNoteCollection:", 0);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
        objc_msgSend(v10, "setVirtualSmartFolder:", 0);

        -[ICViewControllerManager setFocusedNoteObjectID:](self, "setFocusedNoteObjectID:", 0);
      }
      if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      {
        v11 = -[ICViewControllerManager isSearchActiveWithQuery](self, "isSearchActiveWithQuery");
        if (v14)
        {
          if ((v11 & 1) == 0)
            -[ICViewControllerManager setMostRecentNonSearchContainerItemID:](self, "setMostRecentNonSearchContainerItemID:", v14);
        }
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windowScene"));
      -[ICViewControllerManager updateSceneTitle:](self, "updateSceneTitle:", v13);

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedNoteBrowseContainerItemID, a3);
  }

}

- (void)setSelectedNoteObjectID:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteObjectID:]", 1, 0, CFSTR("VCM::setSelectedNoteObjectID should not be called when feature enabled"));
  else
    -[ICViewControllerManager setSelectedNoteObjectID:sideEffects:](self, "setSelectedNoteObjectID:sideEffects:", v4, 1);

}

- (void)setSelectedNoteObjectID:(id)a3 sideEffects:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;

  v7 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteObjectID:sideEffects:]", 1, 0, CFSTR("VCM::setSelectedNoteObjectID should not be called when feature enabled"));
  }
  else if (a4)
  {
    -[ICViewControllerManager setPreviousSelectedNoteObjectID:](self, "setPreviousSelectedNoteObjectID:", self->_selectedNoteObjectID);
    objc_storeStrong((id *)&self->_selectedNoteObjectID, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));

    if (v8)
      -[ICViewControllerManager setSelectedInvitationObjectID:sideEffects:](self, "setSelectedInvitationObjectID:sideEffects:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager previousSelectedNoteObjectID](self, "previousSelectedNoteObjectID"));
    v10 = objc_msgSend(v9, "isEqual:", v7);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager previousSelectedNoteObjectID](self, "previousSelectedNoteObjectID"));
      -[ICViewControllerManager deleteEmptyNoteIfNeeded:](self, "deleteEmptyNoteIfNeeded:", v11);

    }
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002FA64;
    v12[3] = &unk_100550338;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    performBlockOnMainThread(v12);
    -[ICViewControllerManager setSelectedSearchResult:](self, "setSelectedSearchResult:", 0);
    -[ICViewControllerManager setIsSelectedNoteTogglingLock:](self, "setIsSelectedNoteTogglingLock:", 0);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedNoteObjectID, a3);
  }

}

- (NSManagedObjectID)previousSelectedNoteObjectID
{
  void *v3;
  NSManagedObjectID *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (NSManagedObjectID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previousSelectedNoteObjectID"));

  }
  else
  {
    v4 = self->_previousSelectedNoteObjectID;
  }
  return v4;
}

- (void)setPreviousSelectedNoteObjectID:(id)a3
{
  id v5;

  v5 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setPreviousSelectedNoteObjectID:]", 1, 0, CFSTR("VCM::setPreviousSelectedNoteObjectID should not be called when feature enabled"));
  else
    objc_storeStrong((id *)&self->_previousSelectedNoteObjectID, a3);

}

- (void)setSelectedInvitationObjectID:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedInvitationObjectID:]", 1, 0, CFSTR("VCM::setSelectedInvitationObjectID should not be called when feature enabled"));
  else
    -[ICViewControllerManager setSelectedInvitationObjectID:sideEffects:](self, "setSelectedInvitationObjectID:sideEffects:", v4, 1);

}

- (void)setSelectedInvitationObjectID:(id)a3 sideEffects:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedInvitationObjectID:sideEffects:]", 1, 0, CFSTR("VCM::setSelectedInvitationObjectID should not be called when feature enabled"));
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedInvitationObjectID, a3);
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));

      if (v7)
        -[ICViewControllerManager setSelectedNoteObjectID:sideEffects:](self, "setSelectedNoteObjectID:sideEffects:", 0, 0);
    }
  }

}

- (void)setTagSelection:(id)a3
{
  id v5;

  v5 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setTagSelection:]", 1, 0, CFSTR("VCM::setTagSelection should not be called when feature enabled"));
  else
    objc_storeStrong((id *)&self->_tagSelection, a3);

}

- (NSManagedObjectID)focusedNoteObjectID
{
  void *v3;
  NSManagedObjectID *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (NSManagedObjectID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "focusedNoteObjectID"));

  }
  else
  {
    v4 = self->_focusedNoteObjectID;
  }
  return v4;
}

- (void)setFocusedNoteObjectID:(id)a3
{
  id v5;

  v5 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setFocusedNoteObjectID:]", 1, 0, CFSTR("VCM::setFocusedNoteObjectID should not be called when feature enabled"));
  else
    objc_storeStrong((id *)&self->_focusedNoteObjectID, a3);

}

- (void)setActivityStreamSelection:(id)a3
{
  ICActivityStreamSelection *activityStreamSelection;
  ICActivityStreamSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    activityStreamSelection = (ICActivityStreamSelection *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    -[ICActivityStreamSelection setActivityStreamSelection:](activityStreamSelection, "setActivityStreamSelection:", v12);
  }
  else
  {
    v5 = (ICActivityStreamSelection *)v12;
    activityStreamSelection = self->_activityStreamSelection;
    self->_activityStreamSelection = v5;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamNavigationController](self, "activityStreamNavigationController"));
  objc_msgSend(v6, "setSelection:", v12);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
  objc_msgSend(v7, "setSelection:", v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributionSidebarController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filter"));
  objc_msgSend(v9, "setFilter:animated:", v10, 1);

  if (v12)
  {
    -[ICViewControllerManager stopEditing](self, "stopEditing");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v11, "hideActivityStreamToolbarAnimated:", 1);

  }
  -[ICViewControllerManager updateIgnoreTextViewTaps](self, "updateIgnoreTextViewTaps");

}

- (ICItemIdentifier)mostRecentNonSearchContainerItemID
{
  void *v3;
  ICItemIdentifier *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (ICItemIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostRecentNonSearchContainerItemID"));

  }
  else
  {
    v4 = self->_mostRecentNonSearchContainerItemID;
  }
  return v4;
}

- (void)setMostRecentNonSearchContainerItemID:(id)a3
{
  id v5;

  v5 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setMostRecentNonSearchContainerItemID:]", 1, 0, CFSTR("VCM::setMostRecentNonSearchContainerItemID should not be called when feature enabled"));
  else
    objc_storeStrong((id *)&self->_mostRecentNonSearchContainerItemID, a3);

}

- (ICSearchResult)selectedSearchResult
{
  void *v3;
  ICSearchResult *v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v4 = (ICSearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSelectedSearchResult"));

  }
  else
  {
    v4 = self->_selectedSearchResult;
  }
  return v4;
}

- (void)setSelectedSearchResult:(id)a3
{
  id v5;

  v5 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedSearchResult:]", 1, 0, CFSTR("VCM::setSelectedSearchResult should not be called when feature enabled"));
  else
    objc_storeStrong((id *)&self->_selectedSearchResult, a3);

}

- (NSArray)mostRecentSelections
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mostRecentSelections"));

  return (NSArray *)v3;
}

- (void)splitViewControllerDidExpand:(id)a3
{
  -[ICViewControllerManager setSplitViewExpandingOrCollapsing:](self, "setSplitViewExpandingOrCollapsing:", 0);
}

- (void)splitViewControllerInteractivePresentationGestureWillBegin:(id)a3
{
  void *v4;
  id v5;

  if (!-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode", a3))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textView"));
    objc_msgSend(v4, "_willBeginInteractiveResize");

  }
}

- (void)splitViewControllerInteractivePresentationGestureDidEnd:(id)a3
{
  void *v4;
  id v5;

  if (!-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode", a3))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textView"));
    objc_msgSend(v4, "_didEndInteractiveResize");

  }
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  int64_t v36;
  id v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *i;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int64_t v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  int64_t v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  int64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  BOOL v74;
  void *v75;
  id v76;
  uint64_t v77;
  _QWORD *v78;
  void *v79;
  void *v80;
  BOOL v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unsigned __int8 v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v96;
  unsigned int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  unsigned int v103;
  id v104;
  unsigned int v105;
  void *v106;
  void *v107;
  void *v108;
  _BOOL4 v109;
  void *v110;
  int64_t v111;
  int64_t v112;
  int v113;
  void *v114;
  id obj;
  _QWORD v116[5];
  BOOL v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  void *v122;
  _BYTE v123[128];

  v6 = a3;
  -[ICViewControllerManager setSplitViewExpandingOrCollapsing:](self, "setSplitViewExpandingOrCollapsing:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));

  if (v7 != v6 || -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    goto LABEL_15;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  if (v8)
    goto LABEL_6;
  if (!-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentRegularWidthSelectedNoteBrowseContainerItemID](self, "mostRecentRegularWidthSelectedNoteBrowseContainerItemID"));
    -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:sideEffects:](self, "setSelectedNoteBrowseContainerItemID:sideEffects:", v8, 0);
LABEL_6:

  }
  if (!-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentRegularWidthTagSelection](self, "mostRecentRegularWidthTagSelection"));
    -[ICViewControllerManager setTagSelection:](self, "setTagSelection:", v9);

  }
  if (!-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentRegularWidthSelectedNoteBrowseContainerItemID](self, "mostRecentRegularWidthSelectedNoteBrowseContainerItemID"));
      -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:sideEffects:](self, "setSelectedNoteBrowseContainerItemID:sideEffects:", v11, 0);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentRegularWidthSelectedNoteObjectID](self, "mostRecentRegularWidthSelectedNoteObjectID"));
    -[ICViewControllerManager setSelectedNoteObjectID:sideEffects:](self, "setSelectedNoteObjectID:sideEffects:", v13, 0);

  }
  -[ICViewControllerManager setMostRecentRegularWidthSelectedNoteObjectID:](self, "setMostRecentRegularWidthSelectedNoteObjectID:", 0);
  -[ICViewControllerManager setMostRecentRegularWidthTagSelection:](self, "setMostRecentRegularWidthTagSelection:", 0);
  -[ICViewControllerManager setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:](self, "setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:", 0);
  -[ICViewControllerManager updateSplitViewForCurrentViewModeWithCompletion:](self, "updateSplitViewForCurrentViewModeWithCompletion:", 0);
LABEL_15:
  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchController"));
  v18 = objc_msgSend(v17, "isActive");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "searchController"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchBar"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "searchTextField"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "text"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchBar"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "searchTextField"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tokens"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchBar"));
    v104 = objc_msgSend(v26, "selectedScopeButtonIndex");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchBar"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "searchTextField"));
    v103 = objc_msgSend(v28, "isFirstResponder");

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "navigationItem"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "searchController"));
    objc_msgSend(v31, "setActive:", 0);

  }
  else
  {
    v103 = 0;
    v104 = 0;
    v107 = 0;
    v108 = 0;
  }
  v106 = v6;
  v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "viewControllers"));

  v118 = 0u;
  v119 = 0u;
  v109 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == 0;
  v120 = 0u;
  v121 = 0u;
  obj = v34;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v123, 16);
  v36 = v14;
  v110 = v32;
  v105 = v18;
  if (v35)
  {
    v37 = v35;
    v38 = v18 == 0;
    if (v18)
      v39 = 1;
    else
      v39 = 3;
    v40 = *(_QWORD *)v119;
    if (v38)
      v41 = 5;
    else
      v41 = 3;
    v42 = 4;
    if (!v38)
      v42 = 2;
    v111 = v42;
    v112 = v41;
    v113 = 1;
    while (1)
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v119 != v40)
          objc_enumerationMutation(obj);
        v44 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i);
        v45 = objc_opt_class(ICFolderListViewController);
        if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
        {
          if (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
          {
            v36 = v39;
          }
          else if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)3)
          {
            v36 = v111;
          }
          else
          {
            v36 = v112;
          }
        }
        else
        {
          v46 = objc_opt_class(ICNoteBrowseViewController);
          if ((objc_opt_isKindOfClass(v44, v46) & 1) != 0)
          {
            if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
              v47 = v32;
            else
              v47 = v114;
            objc_msgSend(v47, "addObject:", v44);
            v48 = -[ICViewControllerManager behavior](self, "behavior");
            v49 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
            v113 = 0;
            v50 = 2;
            if (v48 != 3)
              v50 = 3;
            if (v49)
              v36 = 1;
            else
              v36 = v50;
          }
          else
          {
            v51 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
            if (v44 == (void *)v51)
            {

            }
            else
            {
              v52 = (void *)v51;
              v53 = v36;
              v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));

              v38 = v44 == v54;
              v36 = v53;
              v32 = v110;
              if (!v38)
                continue;
            }
            if ((id)-[ICViewControllerManager behavior](self, "behavior") != (id)3)
            {
              objc_msgSend(v32, "addObject:", v44);
              v109 = 0;
              v36 = 1;
            }
          }
        }
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v123, 16);
      if (!v37)
        goto LABEL_57;
    }
  }
  v113 = 1;
LABEL_57:

  if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    v56 = objc_msgSend(v32, "containsObject:", v55);

    if ((v56 & 1) == 0)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
      objc_msgSend(v32, "insertObject:atIndex:", v57, 0);

    }
  }
  if (!-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
  {
    if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)1
      || (v85 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController")), v85, v85 == v106)&& v36 == 3)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      v87 = objc_msgSend(v32, "containsObject:", v86);

      if ((v87 & 1) == 0)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
        objc_msgSend(v32, "insertObject:atIndex:", v88, 0);

      }
    }
  }
  if (objc_msgSend(obj, "count"))
  {
    v58 = v36;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager childPrimaryViewController](self, "childPrimaryViewController"));
    v122 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v122, 1));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryNavigationController](self, "primaryNavigationController"));
    objc_msgSend(v61, "setViewControllers:", v60);

    v62 = objc_msgSend(v114, "copy");
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
    objc_msgSend(v63, "setViewControllers:", v62);

    v64 = objc_msgSend(v32, "copy");
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
    objc_msgSend(v65, "setViewControllers:", v64);

    if (((v113 | v109) & 1) == 0)
    {
LABEL_81:
      v36 = v58;
      if (v105)
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
        objc_msgSend(v89, "startSearchWithSearchQuery:searchTokens:searchScope:becomeFirstResponder:", v108, v107, v104, v103);

      }
      goto LABEL_83;
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
    if (!objc_msgSend(v66, "count"))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager excludedContainerIdentifiers](self, "excludedContainerIdentifiers"));
      if (!objc_msgSend(v67, "count"))
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));

        if (!v68)
          goto LABEL_68;
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager defaultContainerObjectIDForNoteWithObjectID:](self, "defaultContainerObjectIDForNoteWithObjectID:", v69));

        v70 = objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v67));
        v66 = (void *)v70;
      }

    }
LABEL_68:
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "dataSource"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "firstRelevantItemIdentifier"));

    v74 = (id)-[ICViewControllerManager enforcedNoteContainerViewModeForContainerItemID:](self, "enforcedNoteContainerViewModeForContainerItemID:", v73) != (id)1;
    if (!objc_msgSend(v66, "count"))
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager excludedContainerIdentifiers](self, "excludedContainerIdentifiers"));
      v76 = objc_msgSend(v75, "count");

      if (!v76)
      {
        v77 = objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v73));

        v66 = (void *)v77;
      }
    }
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_100030DF0;
    v116[3] = &unk_100550360;
    v116[4] = self;
    v117 = v109;
    v78 = objc_retainBlock(v116);
    if (v113 & 1 | !-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager excludedContainerIdentifiers](self, "excludedContainerIdentifiers"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
      v81 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == 0;
      v82 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v109 || v74));
      v83 = v73;
      v84 = (void *)v82;
      BYTE1(v102) = v81;
      LOBYTE(v102) = 0;
      -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v66, v79, 1, v80, 1, 0, &__kCFBooleanFalse, v102, v82, 0, 0, v78);

      v73 = v83;
      v32 = v110;

    }
    else if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled") && v109)
    {
      ((void (*)(_QWORD *))v78[2])(v78);
    }

    goto LABEL_81;
  }
LABEL_83:
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));

  if (v90 == v106)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v91, "setPreferredDisplayMode:", v36);

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
    if (v92
      && (v93 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController")), v94 = (unint64_t)objc_msgSend(v93, "viewMode"), v93, v94 != 4))
    {
      -[ICViewControllerManager hidePresentedActivityStreamNavigationControllerWithCompletion:](self, "hidePresentedActivityStreamNavigationControllerWithCompletion:", 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
      v97 = objc_msgSend(v96, "shouldRenderAsOverlay");

      if (v97)
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));

        if (v98)
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
          v100 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedModernNote](self, "selectedModernNote"));
          v101 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));
          objc_msgSend(v99, "showActivityStreamToolbarForObject:selection:animated:", v100, v101, 0);

        }
        if ((v94 & 0xFFFFFFFFFFFFFFFELL) == 2)
          v36 = 3;
        else
          v36 = 1;
      }
      else
      {
        v36 = 2;
      }
    }
    else
    {
      v36 = 1;
    }
  }

  return v36;
}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD, uint64_t, double, double, double, double);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  void (**v37)(id, _QWORD, uint64_t, double, double, double, double);
  double v38;
  char v39;

  v5 = (void (**)(id, _QWORD, uint64_t, double, double, double, double))a4;
  if (!-[ICViewControllerManager isNoteEditorVisible](self, "isNoteEditorVisible")
    || -[ICViewControllerManager isWelcomeScreenVisible](self, "isWelcomeScreenVisible")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_topmostPresentedViewController")),
        v7,
        v6,
        v7))
  {
    if (v5)
      v5[2](v5, 0, 0x7FFFFFFFFFFFFFFFLL, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    goto LABEL_6;
  }
  if (-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "printFormatter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentLayer"));
    objc_msgSend(v10, "contentOffset");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentLayer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "noteHTMLEditorView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "webView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scrollView"));
    objc_msgSend(v16, "contentSize");
    v18 = v12 / v17;

LABEL_16:
    v32 = fmax(v18, 0.0);

    if (qword_1005DDCE8 != -1)
      dispatch_once(&qword_1005DDCE8, &stru_100550380);
    v33 = qword_1005DDCE0;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000312F0;
    v35[3] = &unk_1005503F8;
    v36 = v9;
    v39 = 0;
    v38 = v32;
    v37 = v5;
    v34 = v9;
    dispatch_async(v33, v35);

    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "note"));
  if ((objc_msgSend(v19, "isPasswordProtected") & 1) == 0)
  {

    goto LABEL_15;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "note"));
  v21 = objc_msgSend(v20, "isAuthenticated");

  if ((v21 & 1) != 0)
  {
LABEL_15:
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "note"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICTextViewController printFormatterForNote:withSize:traitCollection:](ICTextViewController, "printFormatterForNote:withSize:traitCollection:", v22, v28, v25, v27));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textView"));
    objc_msgSend(v10, "contentOffset");
    v30 = v29;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textView"));
    objc_msgSend(v13, "contentSize");
    v18 = v30 / v31;
    goto LABEL_16;
  }
  if (v5)
    v5[2](v5, 0, 0x7FFFFFFFFFFFFFFFLL, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

LABEL_6:
}

- (BOOL)canBeginEditingForNoteDisplayController:(id)a3
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance", a3));
  v4 = objc_msgSend(v3, "isAnyWelcomeScreenVisible");

  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Was asked to begin editing while welcome screen was up", v7, 2u);
    }

  }
  return v4 ^ 1;
}

- (void)noteEditorDidTapAllNotes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1004041D8();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  objc_msgSend(v6, "saveSession");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v7, "saveImmediately");

  v11 = ICQuickNoteURLOptionShowList;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__kCFBooleanTrue, "stringValue"));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager quickNoteQueryOptionsFromEditor:additionalOptions:](self, "quickNoteQueryOptionsFromEditor:additionalOptions:", v4, v9));

  -[ICViewControllerManager launchNotesAppFromLockscreenWithQueryOptions:completionBlock:](self, "launchNotesAppFromLockscreenWithQueryOptions:completionBlock:", v10, 0);
}

- (void)noteEditorDidTapActionMenu:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100404204();

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));
  v7 = objc_msgSend(v6, "isEmpty");

  if ((v7 & 1) == 0)
  {
    v11 = ICQuickNoteURLOptionShowShareSheet;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__kCFBooleanTrue, "stringValue"));
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager quickNoteQueryOptionsFromEditor:additionalOptions:](self, "quickNoteQueryOptionsFromEditor:additionalOptions:", v4, v9));

    -[ICViewControllerManager launchNotesAppFromLockscreenWithQueryOptions:completionBlock:](self, "launchNotesAppFromLockscreenWithQueryOptions:completionBlock:", v10, 0);
  }

}

- (void)noteEditorDidTapAddPeople:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100404230();

  v9 = ICQuickNoteURLOptionShowiCloudShareSheet;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__kCFBooleanTrue, "stringValue"));
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager quickNoteQueryOptionsFromEditor:additionalOptions:](self, "quickNoteQueryOptionsFromEditor:additionalOptions:", v4, v7));

  -[ICViewControllerManager launchNotesAppFromLockscreenWithQueryOptions:completionBlock:](self, "launchNotesAppFromLockscreenWithQueryOptions:completionBlock:", v8, 0);
}

- (BOOL)noteEditor:(id)a3 didTapAttachment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v9 = objc_msgSend(v8, "isSecureScreenShowing");

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10040425C();

    if (v7)
    {
      v15 = ICQuickNoteURLOptionAttachmentIdentifier;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v16 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

    }
    else
    {
      v12 = &__NSDictionary0__struct;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager quickNoteQueryOptionsFromEditor:additionalOptions:](self, "quickNoteQueryOptionsFromEditor:additionalOptions:", v6, v12));
    -[ICViewControllerManager launchNotesAppFromLockscreenWithQueryOptions:completionBlock:](self, "launchNotesAppFromLockscreenWithQueryOptions:completionBlock:", v13, 0);

  }
  return v9;
}

- (id)quickNoteQueryOptionsFromEditor:(id)a3 additionalOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textView"));
  objc_msgSend(v7, "contentOffset");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, ICQuickNoteURLOptionNoteIdentifier);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, ICQuickNoteURLOptionContentOffsetY);

  }
  v17 = objc_msgSend(v10, "copy");

  return v17;
}

- (void)updateForFingerDrawingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  id v19;

  v3 = a3;
  v5 = -[ICViewControllerManager behavior](self, "behavior");
  v6 = v5;
  if (v3)
  {
    v7 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
    if (v6 != 1 && v7 == 0)
      v9 = 2;
    else
      v9 = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v10, "setDisplayModeButtonVisibility:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v11, "setPresentsWithGesture:", 0);

    v19 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "interactivePopGestureRecognizer"));
    v13 = v12;
    v14 = 0;
  }
  else
  {
    v15 = v5 == 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v16, "setDisplayModeButtonVisibility:", v15);

    v17 = (id)-[ICViewControllerManager behavior](self, "behavior") != (id)3;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v18, "setPresentsWithGesture:", v17);

    v19 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "interactivePopGestureRecognizer"));
    v13 = v12;
    v14 = 1;
  }
  objc_msgSend(v12, "setEnabled:", v14);

}

- (void)startSearchWithSearchQueryString:(id)a3 becomeFirstResponder:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  objc_msgSend(v7, "startSearchWithSearchQuery:searchTokens:searchScope:becomeFirstResponder:", v6, 0, 0, v4);

}

- (void)updateNoteEditorViewControllerWithStateArchive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _TtC11MobileNotes21ICSelectionStateModel *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  _TtC11MobileNotes21ICSelectionStateModel *v29;
  __int16 v30;
  void *v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));

  if (v6)
  {
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
      objc_msgSend(v7, "setupWithArchive:", v4);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
      v10 = objc_msgSend(v9, "isTemporaryID");

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
        v32 = v6;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
        v27 = 0;
        v13 = objc_msgSend(v11, "obtainPermanentIDsForObjects:error:", v12, &v27);
        v14 = (_TtC11MobileNotes21ICSelectionStateModel *)v27;

        if (!v13 || v14)
        {
          v24 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v14;
            v30 = 2112;
            v31 = v6;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Conversion of temporary ID to permanent ID failed with error %@ for note %@", buf, 0x16u);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
          objc_msgSend(v25, "loadViewIfNeeded");

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollStateForNote:", v6));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
          objc_msgSend(v26, "applyScrollStateFromArchive:", v16);

          goto LABEL_16;
        }
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));

        v8 = (void *)v15;
      }
      v14 = objc_alloc_init(_TtC11MobileNotes21ICSelectionStateModel);
      -[ICSelectionStateModel setSelectedNoteObjectID:](v14, "setSelectedNoteObjectID:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
      objc_msgSend(v16, "adoptInstantNoteModel:archive:", v14, v4);
LABEL_16:

      goto LABEL_17;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URIRepresentation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentNoteObjectIDURL"));
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      objc_msgSend(v21, "loadViewIfNeeded");

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollStateForNote:", v6));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      objc_msgSend(v22, "applyScrollStateFromArchive:", v8);

LABEL_17:
      goto LABEL_18;
    }
    v23 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Restore Quicknote UI editor state skipping because Note ID doesn't match", buf, 2u);
    }

  }
LABEL_18:

}

- (BOOL)canTilePrimaryContent
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v3 = objc_msgSend(v2, "_canTileSidebarColumn:", 0);

  return v3;
}

- (void)applyNoteViewModesToStateRestoreArchive:(id)a3 withContainerItemID:(id)a4
{
  int64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = -[ICViewControllerManager enforcedNoteContainerViewModeForContainerItemID:](self, "enforcedNoteContainerViewModeForContainerItemID:", a4);
  if (v6 != -1)
  {
    objc_msgSend(v10, "setCurrentNoteContainerViewMode:", v6);
    if (-[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode") == -1)
    {
      v7 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
LABEL_8:
      v9 = v7;
      v8 = v10;
      goto LABEL_9;
    }
LABEL_7:
    v7 = -[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode");
    goto LABEL_8;
  }
  if (-[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode") == -1)
  {
    objc_msgSend(v10, "setCurrentNoteContainerViewMode:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"));
    goto LABEL_7;
  }
  objc_msgSend(v10, "setCurrentNoteContainerViewMode:", -[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode"));
  v8 = v10;
  v9 = -1;
LABEL_9:
  objc_msgSend(v8, "setPreferredNoteContainerViewMode:", v9);

}

- (void)performActionForShortcutItem:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;

  v14 = a3;
  -[ICViewControllerManager setSelectedNewNoteShortcutItem:](self, "setSelectedNewNoteShortcutItem:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "type"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.notes.newNote"));

  if ((v5 & 1) != 0)
  {
    v6 = 8;
LABEL_9:
    v13 = -[ICViewControllerManager showNewNoteWithApproach:sender:animated:](self, "showNewNoteWithApproach:sender:animated:", v6, self, 1);
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "type"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.notes.photo"));

  if ((v8 & 1) != 0)
  {
    v6 = 11;
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "type"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.notes.checklist"));

  if ((v10 & 1) != 0)
  {
    v6 = 9;
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "type"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.notes.scanDocument"));

  if (v12)
  {
    v6 = 10;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)lockNotesNow
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v2, "saveNote");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v3, "deauthenticate");

}

- (void)stopEditing
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    objc_msgSend(v5, "setEditing:animated:", 0, 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v7 = objc_msgSend(v6, "isEditing");

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v8, "setEditing:animated:", 0, 0);

  }
}

- (void)toggleSidebar
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  objc_msgSend(v2, "ic_toggleSidebar");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  objc_super v14;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if ((-[ICViewControllerManager ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Navigation/ICViewControllerManager.m") & 1) != 0)
  {
    v13 = -[ICViewControllerManager ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v12, v10);

    if (a6 == &off_1005CC928
      && (v13 & 1) == 0
      && objc_msgSend(v10, "isEqualToString:", CFSTR("attributionSidebarVisibility")))
    {
      -[ICViewControllerManager updateIgnoreTextViewTaps](self, "updateIgnoreTextViewTaps");
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICViewControllerManager;
    -[ICViewControllerManager observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v12, v11, a6);

  }
}

- (void)updateIgnoreTextViewTaps
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributionSidebarController"));
  if (objc_msgSend(v4, "attributionSidebarVisibility"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"));
    if (v6)
    {
      v5 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));
      v5 = v7 != 0;

    }
  }

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v8, "setIgnoresTaps:", v5);

}

- (id)containerItemIDForContainerIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualRecentlyDeletedMathNotesFolder](ICAccount, "globalVirtualRecentlyDeletedMathNotesFolder"));
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if ((v8 & 1) == 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
LABEL_7:
      v10 = (void *)v11;
      goto LABEL_8;
    }
  }
  if (!objc_msgSend(v4, "count"))
  {
    v11 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentNonSearchContainerItemID](self, "mostRecentNonSearchContainerItemID"));
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_objectPassingTest:", &stru_100550520));

LABEL_8:
  return v10;
}

- (BOOL)isTrashFolderSelected
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  v5 = ICDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ((objc_msgSend(v6, "isTrashFolder") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_opt_class(NSManagedObjectID);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
    v10 = ICDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (objc_msgSend(v11, "ic_isEntityOfClass:", objc_opt_class(ICFolder)))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_existingObjectWithID:", v11));

      v7 = objc_msgSend(v13, "isTrashFolder");
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)setCurrentNoteBrowseViewController:(id)a3 animated:(BOOL)a4 ensurePresented:(BOOL)a5 containerIdentifiers:(id)a6 excludingIdentifiers:(id)a7 ensureSelectedNote:(BOOL)a8 keepEditorShowing:(id)a9 dataIndexedBlock:(id)a10 dataRenderedBlock:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char *v37;
  void *v38;
  char v39;
  id v40;
  unsigned __int8 v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  uint8_t buf[8];
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  _QWORD *v61;
  _QWORD v62[3];
  BOOL v63;
  id v64;

  v45 = a5;
  v42 = a4;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v43 = v16;
  v44 = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setByAddingObjectsFromSet:", v17));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager containerItemIDForContainerIdentifiers:](self, "containerItemIDForContainerIdentifiers:", v21));

  v23 = objc_opt_class(NSManagedObjectID);
  v24 = ICDynamicCast(v23, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v27 = ICDynamicCast(v26, v22);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (v18)
  {
    v41 = objc_msgSend(v18, "BOOLValue");
  }
  else if (-[ICViewControllerManager isTrashFolderSelected](self, "isTrashFolderSelected"))
  {
    v41 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == 0;
  }
  else
  {
    v41 = 0;
  }
  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    -[ICViewControllerManager setSelectedNoteBrowseContainerItemID:](self, "setSelectedNoteBrowseContainerItemID:", v22);
  -[ICViewControllerManager setCurrentNoteBrowseViewController:](self, "setCurrentNoteBrowseViewController:", v15);
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v63 = a8;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100033724;
  v58[3] = &unk_100550548;
  v61 = v62;
  v58[4] = self;
  v28 = v25;
  v59 = v28;
  v29 = v19;
  v60 = v29;
  v30 = objc_retainBlock(v58);
  if (objc_msgSend(v28, "ic_isModernContainerType"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100033C54;
    v53[3] = &unk_100550570;
    v53[4] = self;
    v54 = v28;
    v55 = v15;
    v56 = v30;
    v57 = v20;
    objc_msgSend(v31, "performBlockAndWait:", v53);

  }
  else if (objc_msgSend(v28, "ic_isLegacyContainerType"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100033CB0;
    v48[3] = &unk_100550570;
    v48[4] = self;
    v49 = v28;
    v50 = v15;
    v51 = v30;
    v52 = v20;
    objc_msgSend(v32, "performBlockAndWait:", v48);

  }
  else if (v46)
  {
    objc_msgSend(v15, "setVirtualSmartFolder:dataIndexedBlock:dataRenderedBlock:", v46, v30, v20);
  }
  else if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    objc_msgSend(v15, "setTagSelection:dataIndexedBlock:dataRenderedBlock:", v33, v30, v20);

  }
  else
  {
    v34 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "showing empty container", buf, 2u);
    }

    objc_msgSend(v15, "setNoteContainer:dataIndexedBlock:dataRenderedBlock:", 0, v30, v20);
  }
  if (v45)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteBrowseNavigationController](self, "noteBrowseNavigationController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "viewControllers"));
    v37 = (char *)objc_msgSend(v36, "indexOfObject:", v15);
    if (objc_msgSend(v36, "count"))
    {
      if (v37 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v35, "pushViewController:animated:", v15, v42);
LABEL_31:

        goto LABEL_32;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "ic_subarrayFromIndex:", v37 + 1));
      if (objc_msgSend(v38, "count"))
        v39 = v41;
      else
        v39 = 1;
      if ((v39 & 1) == 0)
        v40 = objc_msgSend(v35, "popToViewController:animated:", v15, v42);
    }
    else
    {
      if (!v15)
        goto LABEL_31;
      v64 = v15;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
      objc_msgSend(v35, "setViewControllers:", v38);
    }

    goto LABEL_31;
  }
LABEL_32:

  _Block_object_dispose(v62, 8);
}

- (ICContentInsetViewController)primaryContainerViewController
{
  ICContentInsetViewController *primaryContainerViewController;
  ICContentInsetViewController *v4;
  void *v5;
  ICContentInsetViewController *v6;
  ICContentInsetViewController *v7;

  primaryContainerViewController = self->_primaryContainerViewController;
  if (!primaryContainerViewController)
  {
    v4 = [ICContentInsetViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryNavigationController](self, "primaryNavigationController"));
    v6 = -[ICContentInsetViewController initWithContentViewController:](v4, "initWithContentViewController:", v5);
    v7 = self->_primaryContainerViewController;
    self->_primaryContainerViewController = v6;

    -[ICViewControllerManager updatePrimaryContainerViewAppearance](self, "updatePrimaryContainerViewAppearance");
    primaryContainerViewController = self->_primaryContainerViewController;
  }
  return primaryContainerViewController;
}

- (void)updatePrimaryContainerViewAppearance
{
  uint64_t v3;
  double leading;
  double top;
  double bottom;
  double trailing;
  double v8;
  void *v9;
  void *v10;
  double v11;
  ICContentInsetViewControllerConfiguration *v12;

  if ((id)-[ICViewControllerManager behavior](self, "behavior") != (id)1
    || -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth")
    || -[ICViewControllerManager hasCompactHeight](self, "hasCompactHeight"))
  {
    v3 = 0;
    top = NSDirectionalEdgeInsetsZero.top;
    leading = NSDirectionalEdgeInsetsZero.leading;
    bottom = NSDirectionalEdgeInsetsZero.bottom;
    trailing = NSDirectionalEdgeInsetsZero.trailing;
    v8 = 0.0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    objc_msgSend(v10, "layoutMargins");
    leading = v11 + 4.0;

    v8 = 20.0;
    v3 = 1;
    bottom = 24.0;
    top = 0.0;
    trailing = 0.0;
  }
  v12 = -[ICContentInsetViewControllerConfiguration initWithInsets:usesSafeAreaLayoutGuide:cornerRadius:]([ICContentInsetViewControllerConfiguration alloc], "initWithInsets:usesSafeAreaLayoutGuide:cornerRadius:", v3, top, leading, bottom, trailing, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryContainerViewController](self, "primaryContainerViewController"));
  objc_msgSend(v9, "setConfiguration:", v12);

}

- (UINavigationController)noteBrowseNavigationController
{
  void *v3;
  void *v4;
  id v5;

  if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  }
  else if (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    v5 = objc_msgSend(v4, "style");

    if (v5 == (id)2)
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
    else
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryNavigationController](self, "primaryNavigationController"));
  }
  return (UINavigationController *)v3;
}

- (UIViewController)childPrimaryViewController
{
  void *v3;

  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  return (UIViewController *)v3;
}

- (BOOL)isShowingNoteBrowsersForContainerObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteBrowseNavigationController](self, "noteBrowseNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));

  v7 = objc_msgSend(v4, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003402C;
    v11[3] = &unk_100550598;
    v12 = v4;
    v8 = objc_msgSend(v6, "ic_containsObjectPassingTest:", v11);

    v9 = v8 ^ 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setNoteBrowserNavigationStackWithFolderObjectIDs:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  if (!-[ICViewControllerManager isShowingNoteBrowsersForContainerObjectIDs:](self, "isShowingNoteBrowsersForContainerObjectIDs:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteBrowseNavigationController](self, "noteBrowseNavigationController"));
    v5 = objc_msgSend(v4, "popToRootViewControllerAnimated:", 0);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000341C8;
    v7[3] = &unk_1005505C0;
    v7[4] = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  }

}

- (BOOL)shouldManagedObjectBecomeSelectedNote:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  if (objc_msgSend(v5, "ic_isNoteType") && (objc_msgSend(v4, "isDeleted") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    if ((objc_msgSend(v7, "isTemporaryID") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
      if (v8)
      {
        v6 = 0;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));
        if (v9)
        {
          v6 = 0;
        }
        else
        {
          v10 = objc_opt_class(ICCloudSyncingObject);
          v11 = ICDynamicCast(v10, v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          if ((objc_msgSend(v12, "markedForDeletion") & 1) != 0)
          {
            v6 = 0;
          }
          else
          {
            v13 = objc_opt_class(ICCloudSyncingObject);
            v14 = ICDynamicCast(v13, v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            if ((objc_msgSend(v15, "needsInitialFetchFromCloud") & 1) != 0)
            {
              v6 = 0;
            }
            else
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
              v6 = -[ICViewControllerManager isSelectionAppropriateForObjectID:](self, "isSelectionAppropriateForObjectID:", v16);

            }
          }

        }
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)selectNextContainerForDeletedFolder
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100034DB0;
  v2[3] = &unk_100550110;
  v2[4] = self;
  performBlockOnMainThread(v2);
}

- (BOOL)selectContainersForDeletedHashtagObjectIDs:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = a3;
  if (!-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
  if ((objc_msgSend(v5, "intersectsSet:", v4) & 1) == 0)
  {

    goto LABEL_7;
  }
  v6 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");

  if (v6 == 1)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
  v8 = objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "minusSet:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
  v10 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "minusSet:", v4);
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    objc_msgSend(v11, "setIncludedObjectIDs:", v8);
    objc_msgSend(v11, "setExcludedObjectIDs:", v10);
    -[ICViewControllerManager selectTagSelection:](self, "selectTagSelection:", v11);

  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100035124;
    v14[3] = &unk_100550020;
    v14[4] = self;
    v15 = v8;
    v16 = v10;
    performBlockOnMainThread(v14);

  }
  v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)selectDefaultFolderForNoteMovedOutOfSmartFolderIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSmartFolder:](self, "selectedSmartFolder:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSmartFolderNoteObjectIDs:](self, "selectedSmartFolderNoteObjectIDs:", v4));
    v7 = -[ICViewControllerManager selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:managedObjectContext:](self, "selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:managedObjectContext:", v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)selectDefaultFolderForNoteMovedOutOfSelectedTagsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedTagsNoteObjectIDs:](self, "selectedTagsNoteObjectIDs:", v4));
    v6 = -[ICViewControllerManager selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:managedObjectContext:](self, "selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:managedObjectContext:", v5, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
  if (objc_msgSend(v8, "ic_isModernNoteType")
    && (objc_msgSend(v6, "containsObject:", v8) & 1) == 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100035498;
    v16[3] = &unk_1005502C0;
    v17 = v7;
    v10 = v8;
    v18 = v10;
    v19 = &v20;
    objc_msgSend(v17, "performBlockAndWait:", v16);
    if (*((_BYTE *)v21 + 24))
    {
      v9 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager defaultContainerObjectIDForNoteWithObjectID:](self, "defaultContainerObjectIDForNoteWithObjectID:", v10));
      v12 = v11;
      v9 = v11 != 0;
      if (v11)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000354F4;
        v14[3] = &unk_10054FE80;
        v14[4] = self;
        v15 = v11;
        performBlockOnMainThread(v14);

      }
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ICFolder)selectedSmartFolder
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSmartFolder:](self, "selectedSmartFolder:", v3));

  return (ICFolder *)v4;
}

- (id)selectedSmartFolder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = objc_opt_class(NSManagedObjectID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 && objc_msgSend(v8, "ic_isModernFolderType"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_100027B3C;
    v19 = sub_100027B4C;
    v20 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100035734;
    v11[3] = &unk_1005502C0;
    v12 = v4;
    v13 = v8;
    v14 = &v15;
    objc_msgSend(v12, "performBlockAndWait:", v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)selectedSmartFolderNoteObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSmartFolder:](self, "selectedSmartFolder:", v4));
  v6 = v5;
  if (v5)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_100027B3C;
    v19 = sub_100027B4C;
    v20 = 0;
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_1000358B0;
    v12 = &unk_100550660;
    v14 = &v15;
    v13 = v5;
    objc_msgSend(v4, "performBlockAndWait:", &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteObjectIDsWithQuery:managedObjectContext:](self, "noteObjectIDsWithQuery:managedObjectContext:", v16[5], v4, v9, v10, v11, v12));

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)selectedTagsNoteObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedTagsNoteQuery:](self, "selectedTagsNoteQuery:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteObjectIDsWithQuery:managedObjectContext:](self, "noteObjectIDsWithQuery:managedObjectContext:", v5, v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)noteObjectIDsWithQuery:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_100027B3C;
    v18 = sub_100027B4C;
    v19 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100035A78;
    v10[3] = &unk_1005502C0;
    v11 = v6;
    v12 = v5;
    v13 = &v14;
    objc_msgSend(v11, "performBlockAndWait:", v10);
    v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)selectedTagsNoteQuery:(id)a3
{
  void *v4;
  void *v5;

  if (-[ICViewControllerManager isTagSelected](self, "isTagSelected", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuery queryForNotesMatchingTagSelection:](ICQuery, "queryForNotesMatchingTagSelection:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)selectNextRelevantObjectUsingChangedInappropriateIdentifiers:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  ICViewControllerManager *v20;
  char v21;

  v4 = a3;
  if ((id)-[ICViewControllerManager behavior](self, "behavior") != (id)2)
  {
    if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") != (id)1
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController")),
          v6 = objc_msgSend(v5, "ic_isViewVisible"),
          v5,
          v6))
    {
      if (!-[ICViewControllerManager isAuxiliary](self, "isAuxiliary"))
      {
        v7 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSearchResult](self, "selectedSearchResult"));
        if (v7
          && (v8 = (void *)v7,
              v9 = -[ICViewControllerManager isSearchActive](self, "isSearchActive"),
              v8,
              v9))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager searchController](self, "searchController"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSource"));

          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextRelevantItemIdentifierAfter:", v12));

          if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
            -[ICViewControllerManager setSelectedSearchResult:](self, "setSelectedSearchResult:", v13);
          v14 = 1;
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataSource"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextRelevantItemIdentifierAfter:", v16));

          if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
            -[ICViewControllerManager setSelectedNoteObjectID:](self, "setSelectedNoteObjectID:", v13);
          v14 = 0;
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100035D18;
        block[3] = &unk_100550688;
        v21 = v14;
        v19 = v13;
        v20 = self;
        v17 = v13;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }
  }

}

- (void)dismissPrimaryOverlayContent
{
  void *v3;
  unint64_t v4;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v4 = (unint64_t)objc_msgSend(v3, "displayMode");

  if (v4 <= 6 && ((1 << v4) & 0x68) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v6, "hideColumn:", 0);

  }
}

- (void)dismissSupplementaryOverlayContent
{
  void *v3;
  id v4;
  id v5;

  if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") != (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    v4 = objc_msgSend(v3, "displayMode");

    if (v4 == (id)5 || v4 == (id)3)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      objc_msgSend(v5, "hideColumn:", 1);

    }
  }
}

- (void)sendNotificationForSplitViewDisplayModeChangeWithTransitionCoordinator:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICViewControllerManager *v8;
  _QWORD v9[4];
  id v10;
  ICViewControllerManager *v11;

  v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100036024;
  v9[3] = &unk_1005506B0;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v11 = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003606C;
  v6[3] = &unk_1005506B0;
  v7 = v10;
  v8 = self;
  v5 = v10;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v9, v6);

}

- (void)sendNotificationForNoteEditorSizeChange:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICViewControllerManager *v17;
  _QWORD v18[4];
  id v19;
  ICViewControllerManager *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  if ((objc_msgSend(v8, "ic_isViewVisible") & 1) == 0)
    goto LABEL_6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  if (objc_msgSend(v9, "isSecureScreenShowing"))
  {

LABEL_6:
    goto LABEL_7;
  }
  v10 = -[ICViewControllerManager isApplyingStateRestoreArchive](self, "isApplyingStateRestoreArchive");

  if ((v10 & 1) == 0)
  {
    v22[0] = CFSTR("ICSplitViewControllerPredictedDetailSizeUserInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height));
    v23[0] = v11;
    v22[1] = CFSTR("ICSplitViewControllerPredictedDurationUserInfo");
    objc_msgSend(v7, "transitionDuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v23[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000362B0;
    v18[3] = &unk_1005506D8;
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v20 = self;
    v21 = v13;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100036300;
    v15[3] = &unk_1005506B0;
    v16 = v19;
    v17 = self;
    v14 = v19;
    v8 = v13;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v18, v15);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(BOOL)a7 keepEditorShowing:(id)a8 animated:(BOOL)a9
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  int64_t v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  _BOOL4 v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  _QWORD v37[5];
  BOOL v38;
  BOOL v39;

  v10 = a7;
  v11 = a6;
  v35 = a5;
  v14 = a3;
  v15 = a4;
  v36 = a8;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000365D4;
  v37[3] = &unk_100550700;
  v37[4] = self;
  v38 = a9;
  v33 = v10;
  v39 = v10;
  v16 = objc_retainBlock(v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));
  v20 = v19;
  v34 = v15;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled")
    && v20
    && -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth")
    && !-[ICViewControllerManager objectAlreadyLoadedInEditorWithObjectID:](self, "objectAlreadyLoadedInEditorWithObjectID:", v20)&& -[ICViewControllerManager isNoteEditorVisible](self, "isNoteEditorVisible"))
  {
    v21 = 0;
    v22 = 1;
    if (!v11)
    {
LABEL_10:
      v23 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));
    v26 = -[ICViewControllerManager enforcedNoteContainerViewModeForContainerItemID:](self, "enforcedNoteContainerViewModeForContainerItemID:", v25);

    v27 = -[ICViewControllerManager isAutomaticallySelectingNotes](self, "isAutomaticallySelectingNotes");
    if (v26 == 1)
      v22 = 0;
    else
      v22 = v27;
    v21 = 1;
    if (!v11)
      goto LABEL_10;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  if ((objc_msgSend(v28, "isCollapsed") & 1) != 0)
  {
    v29 = 0;
  }
  else if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)3)
  {
    v29 = 0;
  }
  else
  {
    v29 = v16;
  }
  v23 = objc_retainBlock(v29);

LABEL_21:
  if (v35)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    v31 = (objc_msgSend(v30, "isCollapsed") & 1) != 0
       || -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth")
       && (id)-[ICViewControllerManager behavior](self, "behavior") == (id)3
       || (id)-[ICViewControllerManager behavior](self, "behavior") == (id)1;

  }
  else
  {
    v31 = 1;
  }
  BYTE2(v32) = v22;
  BYTE1(v32) = v21;
  LOBYTE(v32) = v31;
  -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v14, v34, 0, v35, v11, v33, v32, v36, 0, v23);
  if (!v11)
    ((void (*)(_QWORD *))v16[2])(v16);

}

- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(BOOL)a11 keepEditorShowing:(id)a12 dataIndexedBlock:(id)a13 dataRenderedBlock:(id)a14
{
  id v17;
  ICNoteBrowseViewController *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  ICNoteBrowseViewController *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;

  v42 = a3;
  v17 = a4;
  v18 = (ICNoteBrowseViewController *)a5;
  v19 = a12;
  v20 = a13;
  v21 = a14;
  v22 = objc_opt_class(NSManagedObjectID);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "allObjects"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
  v25 = ICDynamicCast(v22, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  v27 = objc_opt_class(ICFolder);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v26));
  v29 = ICDynamicCast(v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  if (!v18)
  {
    if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1
      && !-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ancestorFolderObjectIDs"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "reverseObjectEnumerator"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allObjects"));

      if (objc_msgSend(v33, "count"))
      {
        -[ICViewControllerManager setNoteBrowserNavigationStackWithFolderObjectIDs:](self, "setNoteBrowserNavigationStackWithFolderObjectIDs:", v33);
        v18 = -[ICNoteBrowseViewController initWithViewMode:viewControllerManager:]([ICNoteBrowseViewController alloc], "initWithViewMode:viewControllerManager:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"), self);

        if (v18)
          goto LABEL_14;
      }
      else
      {

      }
    }
    v40 = v30;
    if (a6)
      v34 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    else
      v34 = -[ICNoteBrowseViewController initWithViewMode:viewControllerManager:]([ICNoteBrowseViewController alloc], "initWithViewMode:viewControllerManager:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"), self);
    v18 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItem](v34, "navigationItem"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "searchController"));
    v37 = objc_msgSend(v36, "isActive");

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItem](v18, "navigationItem"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "searchController"));
      objc_msgSend(v39, "setActive:", 0);

    }
    -[ICNoteBrowseViewController setEditing:](v18, "setEditing:", 0);
    v30 = v40;
  }
LABEL_14:
  -[ICViewControllerManager setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "setCurrentNoteBrowseViewController:animated:ensurePresented:containerIdentifiers:excludingIdentifiers:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v18, a9, a10, v42, v17, a11, v19, v20, v21);

}

- (void)addSelectedHashtagsToNewNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(NSManagedObjectID);
        v13 = ICDynamicCast(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (objc_msgSend(v14, "ic_isHashtagType"))
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100036B1C;
          v16[3] = &unk_100550020;
          v15 = v5;
          v17 = v15;
          v18 = v14;
          v19 = v4;
          objc_msgSend(v15, "performBlockAndWait:", v16);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

- (void)updateNoteEditorBezelsIfNeededWithDisplayMode:(int64_t)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  int64_t v8;
  _BOOL8 v10;
  id v11;

  v4 = a4;
  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)3)
  {
    v7 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
    v8 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
    v10 = a3 == 1 || v8 == 1;
    if (-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"))
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
      objc_msgSend(v11, "updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:", a3 == 1, v7 == 0, v10);
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      objc_msgSend(v11, "updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", a3 == 1, v7 == 0, v10, v4);
    }

  }
}

- (void)clearRecentSelections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
  objc_msgSend(v2, "clear");

}

- (void)noteLockManagerWillToggleLock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_class(ICNoteLockManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICCheckedDynamicCast(v5, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "note"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
    -[ICViewControllerManager setIsSelectedNoteTogglingLock:](self, "setIsSelectedNoteTogglingLock:", 1);

}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  v5 = objc_opt_class(ICNoteLockManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICCheckedDynamicCast(v5, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "note"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "updatedNote"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "updatedNote"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));
      LOWORD(v15) = 256;
      -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v14, 0, 0, 0, 0, 1, v15);

    }
    -[ICViewControllerManager setIsSelectedNoteTogglingLock:](self, "setIsSelectedNoteTogglingLock:", 0);
  }

}

- (void)collectionViewWillRenameTag:(id)a3
{
  void *v4;

  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    objc_msgSend(v4, "setAutomaticallyRemoveDeletedTags:", 0);

  }
  -[ICViewControllerManager setIsTagBeingRenamed:](self, "setIsTagBeingRenamed:", 1);
}

- (void)collectionViewWillDeleteTags:(id)a3
{
  -[ICViewControllerManager setIsTagBeingDeleted:](self, "setIsTagBeingDeleted:", 1);
}

- (void)tagDidRename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  ICViewControllerManager *v25;
  id v26;

  v4 = a3;
  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    objc_msgSend(v5, "setAutomaticallyRemoveDeletedTags:", 1);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = objc_opt_class(NSManagedObjectID);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    v10 = objc_msgSend(v9, "copy");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification ICTagCollectionViewRenameTagOriginalTagObjectIDKey](NSNotification, "ICTagCollectionViewRenameTagOriginalTagObjectIDKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectIDs"));
    LODWORD(v13) = objc_msgSend(v15, "containsObject:", v14);

    if ((_DWORD)v13)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "excludedObjectIDs"));
      v17 = objc_msgSend(v16, "containsObject:", v14);

      objc_msgSend(v10, "removeObjectID:fromExcluded:", v14, v17);
      objc_msgSend(v10, "addObjectID:toExcluded:", v11, v17);
      if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      {
        if (-[ICViewControllerManager isAutomaticallySelectingNotes](self, "isAutomaticallySelectingNotes")
          || (v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController")), v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topViewController")), v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController")), v20, v19, v18, v19 == v20))
        {
          -[ICViewControllerManager selectTagSelection:](self, "selectTagSelection:", v10);
        }
      }
      else
      {
        v21 = _NSConcreteStackBlock;
        v22 = 3221225472;
        v23 = sub_10003712C;
        v24 = &unk_10054FE80;
        v25 = self;
        v26 = v10;
        performBlockOnMainThread(&v21);

      }
    }

  }
  -[ICViewControllerManager setIsTagBeingRenamed:](self, "setIsTagBeingRenamed:", 0, v21, v22, v23, v24, v25);

}

- (void)tagsDidDelete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  -[ICViewControllerManager setIsTagBeingDeleted:](self, "setIsTagBeingDeleted:", 0);
  if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v6 = objc_opt_class(NSArray);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
      v9 = -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
      v11 = v10;
      if (v9)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
        objc_msgSend(v11, "removeObjectIDs:", v12);

        -[ICViewControllerManager selectTagSelection:](self, "selectTagSelection:", v11);
      }
      else
      {
        v13 = objc_msgSend(v10, "copy");

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
        objc_msgSend(v13, "removeObjectIDs:", v14);

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100037330;
        v16[3] = &unk_10054FE80;
        v16[4] = self;
        v17 = v13;
        v15 = v13;
        performBlockOnMainThread(v16);

      }
    }
  }

}

- (void)migrationStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "folderDataSource"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000373D0;
  v6[3] = &unk_100550110;
  v6[4] = self;
  objc_msgSend(v5, "reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:", 1, &stru_100550740, v6);

}

- (void)accountsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if (-[ICViewControllerManager isAuxiliary](self, "isAuxiliary", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "folder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
    v8 = objc_msgSend(v7, "isDeleted");

    if (v8)
      -[ICViewControllerManager closeAuxiliaryWindowAnimated:](self, "closeAuxiliaryWindowAnimated:", 1);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folderDataSource"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000374F0;
    v11[3] = &unk_100550110;
    v11[4] = self;
    objc_msgSend(v10, "reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:", 1, &stru_100550760, v11);

  }
}

- (void)folderWasCreated:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController", a3));
  v5 = objc_msgSend(v4, "isCollapsed");

  if ((v5 & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v6, "showColumn:", 0);

  }
}

- (void)willDismissSearch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));

  if (v4 == v5)
  {
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSearchResult](self, "selectedSearchResult"));

      if (v6)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000378D4;
        block[3] = &unk_100550110;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        return;
      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v7, "highlightSearchMatchesForRegexFinder:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
    if ((objc_msgSend(v8, "isCollapsed") & 1) == 0)
    {
      v9 = -[ICViewControllerManager isSearchActiveWithQuery](self, "isSearchActiveWithQuery");

      if (!v9)
        goto LABEL_10;
      v10 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSearchResult](self, "selectedSearchResult"));
      if (!v10)
        goto LABEL_10;
      v11 = (void *)v10;
      v12 = -[ICViewControllerManager isTagSelected](self, "isTagSelected");

      if ((v12 & 1) != 0)
        goto LABEL_10;
      v13 = objc_opt_class(NSManagedObjectID);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
      v15 = ICDynamicCast(v13, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v15);

      if (objc_msgSend(v8, "ic_isModernFolderType"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ic_existingObjectWithID:", v8));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "folderDataSource"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ancestorFolderObjectIDs"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100037904;
        v22[3] = &unk_10054FE80;
        v22[4] = self;
        v23 = v17;
        v21 = v17;
        objc_msgSend(v19, "expandItemsWithIdentifiers:completion:", v20, v22);

      }
      if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
        -[ICViewControllerManager setSelectedSearchResult:](self, "setSelectedSearchResult:", 0);
    }

LABEL_10:
    -[ICViewControllerManager setIsSearchActiveWithQuery:](self, "setIsSearchActiveWithQuery:", 0);
  }
}

- (void)searchQueryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noteSearchViewController"));

  v7 = v10;
  if (v4 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICNoteSearchViewControllerQueryDidChangeNotificationQueryExistsKey")));

    if (objc_msgSend(v9, "BOOLValue")
      && !-[ICViewControllerManager isSearchActiveWithQuery](self, "isSearchActiveWithQuery"))
    {
      -[ICViewControllerManager setIsSearchActiveWithQuery:](self, "setIsSearchActiveWithQuery:", 1);
    }

    v7 = v10;
  }

}

- (void)didStartEditing:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth");
  v5 = v20;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));

    if (v6 != v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
      objc_msgSend(v8, "setEditing:animated:", 0, 1);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));

    v5 = v20;
    if (v9 != v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
      objc_msgSend(v11, "setEditing:animated:", 0, 1);

      v5 = v20;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));
  v13 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  if (v12 == (void *)v13)
  {

  }
  else
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v16 = objc_msgSend(v15, "isEditingOnSystemPaper");

    if ((v16 & 1) != 0)
      goto LABEL_11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v12, "setEditing:animated:", 0, 1);
  }

LABEL_11:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));

  if (v17 != v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    objc_msgSend(v19, "setEditing:animated:", 0, 1);

  }
}

- (void)editorWillRecoverNote:(id)a3
{
  -[ICViewControllerManager setIsNoteBeingRecovered:](self, "setIsNoteBeingRecovered:", 1);
}

- (void)editorDidRecoverNote:(id)a3
{
  -[ICViewControllerManager setIsNoteBeingRecovered:](self, "setIsNoteBeingRecovered:", 0);
}

- (void)validateState
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  ICWindowStateArchive *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v3 = objc_opt_class(NSManagedObjectID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  v5 = ICDynamicCast(v3, v4);
  v42 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (!v42)
    goto LABEL_7;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v42));
  v7 = objc_opt_class(NoteAccountObject);
  v8 = ICDynamicCast(v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9
    || (v10 = objc_opt_class(NoteStoreObject),
        v11 = ICDynamicCast(v10, v6),
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "account")),
        v12,
        v9))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    objc_msgSend(v13, "refreshObject:mergeChanges:", v9, 1);

  }
  v14 = objc_msgSend(v9, "didChooseToMigrate");
  if (v6)
  {
    v15 = objc_msgSend(v6, "isDeleted") | v14;

    if ((v15 & 1) == 0)
    {
LABEL_7:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));

      if (!v16
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID")),
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v17)), v17, v18)&& (v19 = objc_msgSend(v18, "isDeleted"), v18, (v19 & 1) == 0))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager focusedNoteObjectID](self, "focusedNoteObjectID"));

        if (!v20
          || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager focusedNoteObjectID](self, "focusedNoteObjectID")),
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v21)), v21, v22)&& (v23 = objc_msgSend(v22, "isDeleted"), v22, (v23 & 1) == 0))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));

          if (!v24)
            goto LABEL_23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v25));

          if (v26)
          {
            v27 = objc_msgSend(v26, "isDeleted");

            if (!v27)
              goto LABEL_23;
          }
        }
      }
    }
  }
  else
  {

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dataSource"));
  v30 = (ICWindowStateArchive *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstRelevantItemIdentifier"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v30));
  v32 = v31;
  if (v31 && (objc_msgSend(v31, "isDeleted") & 1) == 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v30));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:](self, "selectContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:", v40, v41, 1, 0, 0, 1);

  }
  else
  {

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager primaryNavigationController](self, "primaryNavigationController"));
    v34 = objc_msgSend(v33, "popToRootViewControllerAnimated:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager supplementaryNavigationController](self, "supplementaryNavigationController"));
    v36 = objc_msgSend(v35, "popToRootViewControllerAnimated:", 1);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    objc_msgSend(v37, "setNoteContainer:", 0);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    objc_msgSend(v38, "setNoteCollection:", 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    objc_msgSend(v39, "setNote:", 0);

    v30 = objc_alloc_init(ICWindowStateArchive);
    -[ICWindowStateArchive setIsPrimaryContentVisible:](v30, "setIsPrimaryContentVisible:", -[ICViewControllerManager isPrimaryContentVisible](self, "isPrimaryContentVisible"));
    -[ICWindowStateArchive setIsSupplementaryContentVisible:](v30, "setIsSupplementaryContentVisible:", -[ICViewControllerManager isSupplementaryContentVisible](self, "isSupplementaryContentVisible"));
    -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v30, 0);
  }

LABEL_23:
}

- (id)defaultContainerObjectIDForNoteWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100027B3C;
  v34 = sub_100027B4C;
  v35 = 0;
  if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class(ICNote)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003824C;
    v27[3] = &unk_1005502C0;
    v27[4] = self;
    v28 = v4;
    v29 = &v30;
    objc_msgSend(v5, "performBlockAndWait:", v27);

    v6 = v28;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class(NoteObject)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100038334;
    v24[3] = &unk_1005502C0;
    v24[4] = self;
    v25 = v4;
    v26 = &v30;
    objc_msgSend(v7, "performBlockAndWait:", v24);

    v6 = v25;
    goto LABEL_5;
  }
  if (!v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));

    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100038414;
    v21 = &unk_100550298;
    v12 = v11;
    v22 = v12;
    v23 = &v30;
    objc_msgSend(v12, "performBlockAndWait:", &v18);
    if (!v31[5])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp", v18, v19, v20, v21));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "noteContext"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "defaultStoreForNewNote"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
      v17 = (void *)v31[5];
      v31[5] = v16;

    }
  }
LABEL_6:
  v8 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v8;
}

- (void)dismissAnyPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  -[ICViewControllerManager dismissAnyPresentedViewControllerAnimated:forShowNote:completion:](self, "dismissAnyPresentedViewControllerAnimated:forShowNote:completion:", a3, 0, a4);
}

- (void)dismissAnyPresentedViewControllerAnimated:(BOOL)a3 forShowNote:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);

  v5 = a4;
  v6 = a3;
  v19 = (void (**)(void))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

  if (!v9)
    goto LABEL_13;
  if (v5)
  {
    v10 = objc_opt_class(ICAlertController);
    v11 = ICDynamicCast(v10, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    v14 = v12 ? objc_msgSend(v12, "shouldDismissWhenShowingNote") : 1;

  }
  else
  {
    v14 = 1;
  }
  v15 = objc_opt_class(ICAllowNotificationsViewController);
  if ((objc_opt_isKindOfClass(v9, v15) & 1) == 0 && v14)
  {
    if ((objc_opt_respondsToSelector(v9, "prepareForDismissal") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentedViewController"));

      objc_msgSend(v17, "prepareForDismissal");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v18, "dismissViewControllerAnimated:completion:", v6, v19);

  }
  else
  {
LABEL_13:
    if (v19)
      v19[2]();
  }
  -[ICViewControllerManager setCurrentAttachmentPresenter:](self, "setCurrentAttachmentPresenter:", 0);

}

- (id)containerObjectIDForNewNoteWithApproach:(int64_t)a3
{
  char v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v4 = 0;
  if ((unint64_t)a3 > 0x14)
  {
    v5 = 0;
  }
  else
  {
    if (((1 << a3) & 0x1F9F00) != 0)
    {
      v4 = 1;
LABEL_4:
      v5 = 1;
      goto LABEL_9;
    }
    if (((1 << a3) & 0xF8) != 0)
    {
      v6 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        sub_10040430C();

      v4 = 0;
      v5 = 0;
    }
    else
    {
      v5 = 0;
      if (((1 << a3) & 0x2002) != 0)
        goto LABEL_4;
    }
  }
LABEL_9:
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_100027B3C;
  v49 = sub_100027B4C;
  v50 = 0;
  if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaultAccountUtilities accountToAddNewNoteWithTagSelection:modernContext:](ICDefaultAccountUtilities, "accountToAddNewNoteWithTagSelection:modernContext:", v7, v8));

    v4 = 1;
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"));
  v12 = ICDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentNonSearchContainerItemID](self, "mostRecentNonSearchContainerItemID"));
  v16 = ICDynamicCast(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if ((v4 & 1) != 0)
  {
    v18 = 1;
  }
  else if (v13
         || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"))) == 0
         && v17
         || ((v20 = -[ICViewControllerManager isSearchActiveWithQuery](self, "isSearchActiveWithQuery"), v17)
           ? (v21 = v20)
           : (v21 = 0),
             v19,
             v21 == 1))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountObjectID"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountObjectID"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectWithID:", v24));

      v9 = v23;
    }
    else
    {
      v25 = 0;
    }

    v18 = 1;
    v9 = (void *)v25;
  }
  else
  {
    v18 = 0;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentNonSearchContainerItemID](self, "mostRecentNonSearchContainerItemID"));
  if (v26)
    v27 = v5;
  else
    v27 = 1;

  if ((v27 & 1) != 0)
  {
    if (v9)
      goto LABEL_36;
    if (!v18)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteContext"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:](ICDefaultAccountUtilities, "defaultAccountWithHTMLNoteContext:", v29));

LABEL_35:
      goto LABEL_36;
    }
LABEL_34:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v28));
    goto LABEL_35;
  }
  if ((v18 & 1) == 0)
  {
    v37 = objc_opt_class(NSManagedObjectID);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mostRecentNonSearchContainerItemID](self, "mostRecentNonSearchContainerItemID"));
    v39 = ICDynamicCast(v37, v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v41 = (void *)v46[5];
    v46[5] = v40;

    if (!objc_msgSend((id)v46[5], "ic_isModernFolderType"))
      goto LABEL_42;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100038A9C;
    v42[3] = &unk_100550298;
    v31 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v43 = v31;
    v44 = &v45;
    objc_msgSend(v31, "performBlockAndWait:", v42);
    v34 = v43;
    goto LABEL_41;
  }
  if (!v9)
    goto LABEL_34;
LABEL_36:
  v30 = objc_opt_class(ICAccount);
  if ((objc_opt_isKindOfClass(v9, v30) & 1) != 0)
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultFolder"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectID"));
LABEL_40:
    v34 = (void *)v46[5];
    v46[5] = v32;
LABEL_41:

    goto LABEL_42;
  }
  v33 = objc_opt_class(NoteAccountObject);
  if ((objc_opt_isKindOfClass(v9, v33) & 1) != 0)
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultStore"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectID"));
    goto LABEL_40;
  }
LABEL_42:
  v35 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  return v35;
}

- (id)createNewNoteInContainerWithObjectID:(id)a3
{
  return -[ICViewControllerManager createNewNoteInContainerWithObjectID:isSystemPaper:](self, "createNewNoteInContainerWithObjectID:isSystemPaper:", a3, 0);
}

- (id)createNewNoteInContainerWithObjectID:(id)a3 isSystemPaper:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(ICFolder)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectWithID:", v6));

    if (objc_msgSend((id)v8, "folderType") != 1)
    {
      v15 = 0;
      goto LABEL_18;
    }
    if (objc_msgSend((id)v8, "folderType") == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "account"));
      if (!v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v11));

      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultFolder"));

      v8 = v12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    objc_msgSend(v13, "setNoteContainer:", v8);
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(ICAccount)))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectWithID:", v6));

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultFolder"));
LABEL_10:
    v15 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(NoteStoreObject)))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectWithID:", v6));
LABEL_16:
    v15 = v16;
    v8 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(NoteAccountObject)))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectWithID:", v6));

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultStore"));
    goto LABEL_16;
  }
  v15 = 0;
  v8 = 0;
LABEL_18:
  if (!(v8 | v15))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v18));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "defaultFolder"));

  }
  if (!v8)
  {
    if (v15)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "noteContext"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "newlyAddedNote"));

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v33, "setCreationDate:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate ic_modificationDateForNoteBeingEdited](NSDate, "ic_modificationDateForNoteBeingEdited"));
      objc_msgSend(v33, "setModificationDate:", v35);

      objc_msgSend(v33, "setContent:", &stru_1005704B8);
      objc_msgSend(v33, "setTitle:", 0);
      objc_msgSend(v33, "setStore:", v15);
      v36 = v33;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "managedObjectContext"));
      objc_msgSend(v37, "ic_save");

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
      objc_msgSend(v38, "submitNoteCreateEventForHTMLNote:", v36);

      goto LABEL_36;
    }
LABEL_28:
    v36 = 0;
    goto LABEL_36;
  }
  if (!objc_msgSend((id)v8, "canMoveAddOrDeleteContents"))
    goto LABEL_28;
  v20 = +[ICNote newEmptyNoteInFolder:](ICNote, "newEmptyNoteInFolder:", v8);
  v21 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteBrowseContainerItemID](self, "selectedNoteBrowseContainerItemID"));
  v23 = ICDynamicCast(v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "type"));
  v26 = objc_msgSend(v25, "isEqual:", ICVirtualSmartFolderItemIdentifierTypeMathNotes);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager hostApplicationIdentifier](self, "hostApplicationIdentifier"));
  v28 = objc_msgSend(v27, "length");

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager hostApplicationIdentifier](self, "hostApplicationIdentifier"));
    v30 = objc_msgSend(v29, "copy");
    objc_msgSend(v20, "setHostApplicationIdentifier:", v30);

    if (objc_msgSend(v20, "isMathNote"))
      objc_msgSend(v20, "setCalculatePreviewBehavior:", 2);
    objc_msgSend(v20, "updateUserSpecificChangeCountWithReason:", CFSTR("Set host application identifier"));
  }
  else if (v26)
  {
    objc_msgSend(v20, "setCalculatePreviewBehavior:", 2);
    objc_msgSend(v20, "markAsMathNoteIfNeeded:", 1);
  }
  -[ICViewControllerManager updateNewNoteForSelectedTags:folder:](self, "updateNewNoteForSelectedTags:folder:", v20, v8);
  if (v4)
  {
    v39 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      sub_100404338(v20, v39);

    objc_msgSend(v20, "markAsSystemPaperIfNeeded:", 1);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager eventReporter](self, "eventReporter"));
  objc_msgSend(v40, "submitNoteCreateEventForModernNote:", v20);

  v36 = v20;
  objc_msgSend(v36, "updateChangeCountWithReason:", CFSTR("Created note"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "managedObjectContext"));

  objc_msgSend(v41, "ic_save");
LABEL_36:

  return v36;
}

- (void)updateNewNoteForSelectedTags:(id)a3 folder:(id)a4
{
  id v5;

  v5 = a3;
  if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
    -[ICViewControllerManager addSelectedHashtagsToNewNote:](self, "addSelectedHashtagsToNewNote:", v5);

}

- (id)showNewNoteStartEditing:(BOOL)a3 inContainerWithObjectID:(id)a4 isSystemPaper:(BOOL)a5 showInkPicker:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  id location;

  v9 = a7;
  v11 = a5;
  v12 = a3;
  v14 = a4;
  v15 = a8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "noteSearchViewController"));
  objc_msgSend(v17, "cancelSearch");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager createNewNoteInContainerWithObjectID:isSystemPaper:](self, "createNewNoteInContainerWithObjectID:isSystemPaper:", v14, v11));
  if (objc_msgSend(v18, "isModernNote"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v20 = objc_opt_class(ICNote);
    v21 = ICDynamicCast(v20, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v19, "setupLinedPaperOnNewNote:willStartEditing:", v22, v12);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));

  if (v23)
  {
    if (v12)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
      v25 = objc_msgSend(v24, "isEditing");

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
        objc_msgSend(v26, "setEditing:animated:", 0, v9);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
      v28 = objc_msgSend(v27, "isEditing");

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
        objc_msgSend(v29, "setEditing:animated:", 0, v9);

      }
    }
    objc_initWeak(&location, self);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100039370;
    v34[3] = &unk_100550788;
    objc_copyWeak(&v37, &location);
    v35 = v18;
    v38 = v12;
    v39 = a6;
    v40 = v9;
    v36 = v15;
    v30 = objc_retainBlock(v34);
    if (-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode")
      && +[ICFeatureFlags uniquelyiPadFluidTransitionsEnabled](_TtC11MobileNotes14ICFeatureFlags, "uniquelyiPadFluidTransitionsEnabled"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "noteDataSource"));
      objc_msgSend(v32, "reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:", 1, 0, v30);

    }
    else
    {
      ((void (*)(_QWORD *))v30[2])(v30);
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)setNoteEditorAnimated:(BOOL)a3 ensurePresented:(BOOL)a4 startEditing:(BOOL)a5 showLegacy:(BOOL)a6 showLatestUpdatesIfAvailable:(BOOL)a7
{
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;

  -[ICViewControllerManager stopEditing](self, "stopEditing");
  if (a6)
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003950C;
  v18[3] = &unk_100550800;
  v20 = a4;
  v18[4] = self;
  v19 = v13;
  v21 = a3;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v14 = v13;
  v15 = objc_retainBlock(v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v17, "ic_performBlockAfterActiveTransition:", v15);

  }
  else
  {
    ((void (*)(_QWORD *))v15[2])(v15);
  }

}

- (BOOL)validateStateRestoreArchive:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentObjectIDURL"));
    objc_msgSend(v6, "ic_addNonNilObject:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentNoteObjectIDURL"));
    objc_msgSend(v6, "ic_addNonNilObject:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentContainerObjectIDURLs"));
    objc_msgSend(v6, "ic_addObjectsFromNonNilArray:", v9);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100039E08;
    v11[3] = &unk_100550828;
    v11[4] = self;
    v5 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11) == (id)0x7FFFFFFFFFFFFFFFLL;

  }
  return v5;
}

- (id)managedObjectIDFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_managedObjectIDForURIRepresentation:", v4));
  if (v7)
  {
    v8 = (void *)v7;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentStoreCoordinator"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_managedObjectIDForURIRepresentation:", v4));
    v6 = v10;
  }

  return v8;
}

- (id)existingManagedObjectWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "existingObjectWithID:error:", v4, 0));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "existingObjectWithID:error:", v4, 0));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ICWindowStateArchive)windowStateArchive
{
  ICWindowStateArchive *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC11MobileNotes21ICSelectionStateModel *v11;
  void *v12;
  unsigned int v13;
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
  uint64_t v25;
  char isKindOfClass;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];

  v3 = objc_alloc_init(ICWindowStateArchive);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowIdentifier"));
  -[ICWindowStateArchive setWindowIdentifier:](v3, "setWindowIdentifier:", v5);

  -[ICWindowStateArchive setAttachmentBrowserOpen:](v3, "setAttachmentBrowserOpen:", -[ICViewControllerManager isAttachmentBrowserVisible](self, "isAttachmentBrowserVisible"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "archiveDictionary"));
  -[ICWindowStateArchive setExpansionState:](v3, "setExpansionState:", v7);

  -[ICWindowStateArchive setIsAuxiliaryWindow:](v3, "setIsAuxiliaryWindow:", -[ICViewControllerManager isAuxiliary](self, "isAuxiliary"));
  -[ICWindowStateArchive setCurrentNoteContainerViewMode:](v3, "setCurrentNoteContainerViewMode:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"));
  -[ICWindowStateArchive setPreferredNoteContainerViewMode:](v3, "setPreferredNoteContainerViewMode:", -[ICViewControllerManager preferredNoteContainerViewMode](self, "preferredNoteContainerViewMode"));
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v8, "setActivityStreamViewMode:", -[ICViewControllerManager activityStreamViewMode](self, "activityStreamViewMode"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    if (objc_msgSend(v9, "ic_isViewVisible"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      v11 = (_TtC11MobileNotes21ICSelectionStateModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "note"));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
        v13 = objc_msgSend(v12, "isEditingOnSecureScreen");

        if (!v13)
        {
          v11 = 0;
          goto LABEL_11;
        }
        v11 = objc_alloc_init(_TtC11MobileNotes21ICSelectionStateModel);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "note"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectID"));
        -[ICSelectionStateModel setSelectedNoteObjectID:](v11, "setSelectedNoteObjectID:", v14);

      }
    }
    else
    {
      v11 = 0;
    }

LABEL_11:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataRepresentationWithEditorModel:", v11));
    -[ICWindowStateArchive setSelectionState:](v3, "setSelectionState:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentScrollState"));
    -[ICWindowStateArchive setScrollState:](v3, "setScrollState:", v22);
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activityStreamSelection](self, "activityStreamSelection"));
  -[ICWindowStateArchive setCurrentActivityStreamSelection:](v3, "setCurrentActivityStreamSelection:", v15);

  -[ICWindowStateArchive setCurrentActivityStreamViewMode:](v3, "setCurrentActivityStreamViewMode:", -[ICViewControllerManager activityStreamViewMode](self, "activityStreamViewMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URIRepresentation"));
    -[ICWindowStateArchive setCurrentNoteObjectIDURL:](v3, "setCurrentNoteObjectIDURL:", v18);
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));

  if (v23)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedInvitationObjectID](self, "selectedInvitationObjectID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URIRepresentation"));
    -[ICWindowStateArchive setCurrentInvitationObjectIDURL:](v3, "setCurrentInvitationObjectIDURL:", v18);
    goto LABEL_14;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  if (!objc_msgSend(v17, "ic_isViewVisible"))
    goto LABEL_15;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "note"));

  if (v53)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "note"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "URIRepresentation"));
    -[ICWindowStateArchive setCurrentNoteObjectIDURL:](v3, "setCurrentNoteObjectIDURL:", v55);

    goto LABEL_14;
  }
LABEL_16:
  if (-[ICViewControllerManager isTagSelected](self, "isTagSelected"))
  {
    v11 = (_TtC11MobileNotes21ICSelectionStateModel *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectionStateModel allObjects](v11, "allObjects"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_compactMap:", &stru_100550848));
    -[ICWindowStateArchive setCurrentTagIdentifiers:](v3, "setCurrentTagIdentifiers:", v22);
    goto LABEL_20;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"));
  v25 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  isKindOfClass = objc_opt_isKindOfClass(v24, v25);

  if ((isKindOfClass & 1) != 0)
  {
    v27 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"));
    v29 = ICCheckedDynamicCast(v27, v28);
    v11 = (_TtC11MobileNotes21ICSelectionStateModel *)objc_claimAutoreleasedReturnValue(v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectionStateModel type](v11, "type"));
    -[ICWindowStateArchive setCurrentVirtualSmartFolderType:](v3, "setCurrentVirtualSmartFolderType:", v30);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectionStateModel accountObjectID](v11, "accountObjectID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "URIRepresentation"));
    -[ICWindowStateArchive setCurrentVirtualSmartFolderAccountObjectIDURL:](v3, "setCurrentVirtualSmartFolderAccountObjectIDURL:", v22);
    goto LABEL_20;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerObjectIDs](self, "selectedContainerObjectIDs"));

  if (v51)
  {
    v11 = (_TtC11MobileNotes21ICSelectionStateModel *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerObjectIDs](self, "selectedContainerObjectIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSelectionStateModel ic_map:](v11, "ic_map:", &stru_100550868));
    -[ICWindowStateArchive setCurrentContainerObjectIDURLs:](v3, "setCurrentContainerObjectIDURLs:", v21);
    goto LABEL_21;
  }
LABEL_22:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[ICWindowStateArchive setCurrentNoteLastViewedDate:](v3, "setCurrentNoteLastViewedDate:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager visibleObjectIDsForContainerObjectID](self, "visibleObjectIDsForContainerObjectID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v32, "count")));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v34 = v32;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v39, (_QWORD)v56));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "firstObject"));

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "URIRepresentation"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "URIRepresentation"));
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v42, v43);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v36);
  }

  -[ICWindowStateArchive setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:](v3, "setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:", v33);
  -[ICWindowStateArchive setIsPrimaryContentVisible:](v3, "setIsPrimaryContentVisible:", -[ICViewControllerManager isPrimaryContentVisible](self, "isPrimaryContentVisible"));
  -[ICWindowStateArchive setIsSupplementaryContentVisible:](v3, "setIsSupplementaryContentVisible:", -[ICViewControllerManager isSupplementaryContentVisible](self, "isSupplementaryContentVisible"));
  -[ICWindowStateArchive setIsTrailingContentVisible:](v3, "setIsTrailingContentVisible:", -[ICViewControllerManager isTrailingContentVisible](self, "isTrailingContentVisible"));
  if (-[ICViewControllerManager isTrailingContentVisible](self, "isTrailingContentVisible"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    objc_msgSend(v44, "preferredPrimaryColumnWidth");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[ICWindowStateArchive setMainSplitViewPrimaryColumnWidth:](v3, "setMainSplitViewPrimaryColumnWidth:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
    v47 = objc_msgSend(v46, "style");

    if (v47 == (id)2)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      objc_msgSend(v48, "preferredSupplementaryColumnWidth");
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[ICWindowStateArchive setMainSplitViewSupplementaryColumnWidth:](v3, "setMainSplitViewSupplementaryColumnWidth:", v49);

    }
  }

  return v3;
}

- (void)updateCurrentNoteLastViewedMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class(ICNote)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_existingObjectWithID:", v4));

    v7 = objc_msgSend(v6, "updateLastViewedTimestampWithCurrentTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    if (v8)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v10 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003A988;
      block[3] = &unk_100550110;
      v13 = v8;
      dispatch_async(v10, block);

    }
    if (-[ICViewControllerManager isSearchActive](self, "isSearchActive"))
    {
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v6, "setLastOpenedDate:", v11);

    }
    objc_msgSend(v6, "saveAfterDelay");
LABEL_9:

  }
}

- (BOOL)isSearchActive
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationItem"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchController"));
  v6 = objc_msgSend((id)v5, "isActive");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchController"));
  LOBYTE(v5) = objc_msgSend(v9, "isActive");

  return v6 | v5;
}

- (void)deleteEmptyNoteIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));
  if (v6)
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNewNoteShortcutItem](self, "selectedNewNoteShortcutItem"));

    if (v4)
    {
      if (!v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSearchResult](self, "selectedSearchResult"));

        if (!v8)
        {
          if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class(ICNote)))
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_10003ABD0;
            v14[3] = &unk_10054FE80;
            v14[4] = self;
            v15 = v4;
            objc_msgSend(v9, "performBlock:", v14);

            v10 = v15;
          }
          else
          {
            if (!objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class(NoteObject)))
              goto LABEL_3;
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10003AC58;
            v12[3] = &unk_10054FE80;
            v12[4] = self;
            v13 = v4;
            objc_msgSend(v11, "performBlock:", v12);

            v10 = v13;
          }

        }
      }
    }
  }
LABEL_3:

}

- (void)ensureSearchVisibleWhenApplyingArchive
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  v4 = objc_msgSend(v3, "isCollapsed");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));

    if (v6 != v7)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
      v9 = objc_msgSend(v10, "popToViewController:animated:", v8, 0);

    }
  }
  else
  {
    -[ICViewControllerManager ensureSearchVisible](self, "ensureSearchVisible");
  }
}

- (void)ensureSearchVisible
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager trailingSidebarSplitViewController](self, "trailingSidebarSplitViewController"));
  v4 = objc_msgSend(v3, "isCollapsed");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));

    if (v6 != v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
LABEL_8:
      v14 = (id)v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));
      v13 = objc_msgSend(v14, "popToViewController:animated:", v12, 0);

LABEL_11:
    }
  }
  else
  {
    if (!-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"))
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      objc_msgSend(v14, "ic_showColumn:animated:", 1, 0);
      goto LABEL_11;
    }
    if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentSearchBarViewController](self, "currentSearchBarViewController"));

      if (v10 != v11)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
        goto LABEL_8;
      }
    }
  }
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  ICFolderListSelectionValidator *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workerManagedObjectContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext sharedContext](NoteContext, "sharedContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v14 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager tagSelection](self, "tagSelection"));
    v11 = objc_msgSend(v10, "copyWithManagedObjectContext:", v6);

    v12 = -[ICFolderListSelectionValidator initWithModernContext:htmlContext:]([ICFolderListSelectionValidator alloc], "initWithModernContext:htmlContext:", v6, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerIdentifiers](self, "selectedContainerIdentifiers"));
    v14 = -[ICFolderListSelectionValidator isSelectionAppropriateForObjectID:selectedContainerIdentifiers:tagSelection:](v12, "isSelectionAppropriateForObjectID:selectedContainerIdentifiers:tagSelection:", v4, v13, v11);

  }
  return v14;
}

- (BOOL)canPerformAddNote
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager keyboardHandler](self, "keyboardHandler"));
  v4 = objc_msgSend(v3, "globalKeyCommandsInhibited");

  if ((v4 & 1) != 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v6 = objc_msgSend(v5, "isSecureScreenShowing");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteEditorViewController"));
    v9 = v8 != 0;
    goto LABEL_4;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_topmostPresentedViewController"));

  if (v11)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
  if ((objc_msgSend(v7, "ic_isViewVisible") & 1) != 0)
  {
    v9 = 1;
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  if ((objc_msgSend(v8, "ic_isViewVisible") & 1) != 0
    || -[ICViewControllerManager isNoteEditorVisible](self, "isNoteEditorVisible"))
  {
    v9 = 1;
  }
  else
  {
    v9 = -[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode");
  }
LABEL_4:

LABEL_5:
  return v9;
}

- (BOOL)canPerformAddFolder
{
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager keyboardHandler](self, "keyboardHandler"));
  v4 = objc_msgSend(v3, "globalKeyCommandsInhibited");

  if ((v4 & 1) != 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_topmostPresentedViewController"));

  if (v7 && (v8 = objc_opt_class(ICMoveNavigationController), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
    if ((objc_msgSend(v9, "ic_isViewVisible") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
      v5 = objc_msgSend(v10, "ic_isViewVisible");

    }
  }

  return v5;
}

- (BOOL)canPerformToggleSearch
{
  void *v3;
  BOOL v4;
  void *v5;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager keyboardHandler](self, "keyboardHandler"));
  if ((objc_msgSend(v3, "globalKeyCommandsInhibited") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    if ((objc_msgSend(v5, "isSecureScreenShowing") & 1) != 0
      || (id)-[ICViewControllerManager behavior](self, "behavior") == (id)2)
    {
      v4 = 0;
    }
    else
    {
      v7 = -[ICViewControllerManager isAuxiliary](self, "isAuxiliary");

      if ((v7 & 1) != 0)
        return 0;
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager searchController](self, "searchController"));
      if ((objc_msgSend(v3, "isFirstResponder") & 1) != 0
        || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar")),
            v9 = objc_msgSend(v8, "isFirstResponder"),
            v8,
            (v9 & 1) != 0))
      {
        v4 = 1;
        goto LABEL_7;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_topmostPresentedViewController"));

      if (v11)
        goto LABEL_2;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSource"));
      v4 = v12 != 0;

    }
    goto LABEL_7;
  }
LABEL_2:
  v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)canPerformFindInNote
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  int64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager keyboardHandler](self, "keyboardHandler"));
  if ((objc_msgSend(v3, "globalKeyCommandsInhibited") & 1) != 0)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_topmostPresentedViewController"));
  if (v5)
  {

LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  v8 = -[ICViewControllerManager behavior](self, "behavior");

  if (v8 == 2)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
  v6 = objc_msgSend(v3, "canPerformAction:withSender:", "performFindInNote:", self);
LABEL_5:

  return v6;
}

- (BOOL)canPerformReplaceInNote
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = -[ICViewControllerManager canPerformFindInNote](self, "canPerformFindInNote");
  if (v3)
  {
    if (-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));
      v6 = objc_msgSend(v5, "isEditable");

      LOBYTE(v3) = v6;
    }
  }
  return v3;
}

- (BOOL)canPerformCmd1
{
  void *v3;
  BOOL v4;

  if (!-[ICViewControllerManager canPerformCmd3](self, "canPerformCmd3"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedContainerItemID](self, "selectedContainerItemID"));
  v4 = -[ICViewControllerManager enforcedNoteContainerViewModeForContainerItemID:](self, "enforcedNoteContainerViewModeForContainerItemID:", v3) == -1;

  return v4;
}

- (BOOL)canPerformCmd3
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  if ((objc_msgSend(v3, "isEditingOnSystemPaper") & 1) != 0
    || -[ICViewControllerManager isAuxiliary](self, "isAuxiliary")
    || -[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"))
  {
    v4 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    v7 = objc_msgSend(v6, "isSecureScreenShowing");

    if ((v7 & 1) != 0)
      return 0;
    if ((id)-[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
      v9 = (void *)objc_opt_class(v8);
      if ((objc_msgSend(v9, "isEqual:", objc_opt_class(ICNoteBrowseViewController)) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));
        v12 = (void *)objc_opt_class(v11);
        v4 = objc_msgSend(v12, "isEqual:", objc_opt_class(ICNoteBrowseViewController));

      }
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
      v4 = objc_msgSend(v3, "displayMode") != (id)1;
    }
  }

  return v4;
}

- (BOOL)canPerformToggleEditorCallouts
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "note"));
  v4 = objc_msgSend(v3, "isSharedViaICloud");

  return v4;
}

- (BOOL)canPerformToggleNoteActivity
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "note"));
  v4 = objc_msgSend(v3, "isSharedViaICloud");

  return v4;
}

- (BOOL)canPerformReturnKey
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager keyboardHandler](self, "keyboardHandler"));
  if ((objc_msgSend(v3, "globalKeyCommandsInhibited") & 1) != 0)
  {
    v4 = 0;
LABEL_14:

    return v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_topmostPresentedViewController"));
  if (v6)
  {
    v7 = (void *)v6;
LABEL_12:
    v4 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
  if (!objc_msgSend(v7, "ic_isViewVisible"))
    goto LABEL_12;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
  if ((objc_msgSend(v8, "isEditing") & 1) != 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  if (!objc_msgSend(v9, "ic_isFirstResponder"))
  {

    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  v11 = objc_msgSend(v10, "isEditing");

  if ((v11 & 1) == 0)
  {
    if (-[ICViewControllerManager isInHTMLEditorMode](self, "isInHTMLEditorMode"))
      return 1;
    v13 = objc_opt_class(ICNoteEditorViewController);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
    v14 = ICDynamicCast(v13, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));
    v4 = objc_msgSend(v7, "isEditable");
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)canPerformAddLink
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
  if (objc_msgSend(v3, "isEditing"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v5 = objc_msgSend(v4, "isEditingOnSecureScreen") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)canPerformGotoPreviousNote
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned __int8 v7;

  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v4 = objc_msgSend(v3, "isEditingOnSecureScreen");

  if ((v4 & 1) != 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
  v7 = objc_msgSend(v6, "canNavigateBackwards");

  return v7;
}

- (BOOL)canPerformGotoNextNote
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned __int8 v7;

  if (!-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v4 = objc_msgSend(v3, "isEditingOnSecureScreen");

  if ((v4 & 1) != 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
  v7 = objc_msgSend(v6, "canNavigateForwards");

  return v7;
}

- (BOOL)canPerformCmdReturnKey
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager keyboardHandler](self, "keyboardHandler"));
  if ((objc_msgSend(v3, "globalKeyCommandsInhibited") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    if ((objc_msgSend(v5, "isSecureScreenShowing") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_topmostPresentedViewController"));

      if (v8)
        return 0;
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstResponder"));

      if ((objc_msgSend(v3, "isFirstResponder") & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        v10 = objc_msgSend(v3, "isEditing");
        if (v5)
          v4 = v10;
        else
          v4 = 1;
      }
    }

  }
  return v4;
}

- (BOOL)canPerformEnclosingFolderKey
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));

  if (v3)
    return 0;
  if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
  v4 = (unint64_t)objc_msgSend(v7, "count") > 1;

  return v4;
}

- (BOOL)canPerformDeleteKey
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;

  if (!-[ICViewControllerManager isSearchActive](self, "isSearchActive"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
    v8 = objc_msgSend(v7, "hasDeletableNoteCell");

    if (!v8)
      return 0;
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
    v6 = v11 == 0;

    return v6;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager searchController](self, "searchController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  v5 = objc_msgSend(v4, "isFirstResponder");

  if ((v5 & 1) != 0)
    goto LABEL_5;
  return 0;
}

- (BOOL)canPerformDeleteSystemPaperNote
{
  return (id)-[ICViewControllerManager behavior](self, "behavior") == (id)2;
}

- (void)performAddNote:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v6 = a3;
  if ((id)-[ICViewControllerManager behavior](self, "behavior") == (id)2)
    v4 = 18;
  else
    v4 = 0;
  v5 = -[ICViewControllerManager showNewNoteWithApproach:sender:animated:](self, "showNewNoteWithApproach:sender:animated:", v4, v6, 1);

}

- (void)performAddFolder:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  ICFolderCreationController *v19;
  void *v20;
  id v21;

  v4 = objc_opt_class(ICMoveNavigationController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_topmostPresentedViewController"));
  v7 = ICDynamicCast(v4, v6);
  v21 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (!v21)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    if ((objc_msgSend(v9, "ic_isViewVisible") & 1) != 0)
      v10 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    else
      v10 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
    v8 = (void *)v10;

    if (!v8)
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((presentingViewController) != nil)", "-[ICViewControllerManager performAddFolder:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "presentingViewController");
    v11 = objc_opt_class(ICFolder);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noteContainer"));
    v14 = ICDynamicCast(v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderListViewController](self, "folderListViewController"));
    if ((objc_msgSend(v16, "ic_isViewVisible") & 1) != 0)
    {

    }
    else
    {
      v17 = objc_msgSend(v15, "canAddSubfolder");

      if (v17)
      {
        v18 = v15;
LABEL_13:
        v19 = -[ICFolderCreationController initWithViewController:noteContainer:creationApproach:]([ICFolderCreationController alloc], "initWithViewController:noteContainer:creationApproach:", v8, v18, 1);
        -[ICViewControllerManager setFolderCreationController:](self, "setFolderCreationController:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager folderCreationController](self, "folderCreationController"));
        objc_msgSend(v20, "promptToAddFolderAllowingSmartFolder:withCompletionHandler:", 1, 0);

        goto LABEL_14;
      }
    }
    v18 = 0;
    goto LABEL_13;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "moveViewController"));
  objc_msgSend(v8, "promptToAddFolderIn:", 0);
LABEL_14:

}

- (void)performToggleSearch:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[ICViewControllerManager ensureSearchVisible](self, "ensureSearchVisible", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager mainSplitViewController](self, "mainSplitViewController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003BF40;
  v5[3] = &unk_100550110;
  v5[4] = self;
  objc_msgSend(v4, "ic_performBlockAfterActiveTransition:", v5);

}

- (BOOL)canPerformPrintNote
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "note"));
  if (v4)
    v5 = (id)-[ICViewControllerManager behavior](self, "behavior") != (id)2;
  else
    v5 = 0;

  return v5;
}

- (void)performPrintNote:(id)a3
{
  void *v4;
  ICPrintNoteActivity *v5;
  void *v6;
  ICPrintNoteActivity *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));

  v5 = [ICPrintNoteActivity alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v7 = -[ICPrintNoteActivity initWithNote:presentingViewController:](v5, "initWithNote:presentingViewController:", v8, v6);

  -[ICPrintNoteActivity performActivityWithCompletion:](v7, "performActivityWithCompletion:", 0);
}

- (void)performCmd1:(id)a3
{
  if (-[ICViewControllerManager canUserChangeNoteContainerViewMode](self, "canUserChangeNoteContainerViewMode", a3))
    -[ICViewControllerManager setNoteContainerViewMode:](self, "setNoteContainerViewMode:", 0);
}

- (void)performCmd2:(id)a3
{
  if (-[ICViewControllerManager canUserChangeNoteContainerViewMode](self, "canUserChangeNoteContainerViewMode", a3))
    -[ICViewControllerManager setNoteContainerViewMode:](self, "setNoteContainerViewMode:", 1);
}

- (void)performCmd3:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[ICViewControllerManager isAttachmentBrowserVisible](self, "isAttachmentBrowserVisible"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentAttachmentBrowserViewController](self, "currentAttachmentBrowserViewController"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  v6 = v5;
  objc_msgSend(v5, "performCmd3:", v4);

}

- (void)performToggleEditorCallouts:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributionSidebarController"));

  if (objc_msgSend(v4, "attributionSidebarVisibility"))
    objc_msgSend(v4, "hideSidebarAnimated:", 1);
  else
    objc_msgSend(v4, "showSidebarAnimated:", 1);

}

- (void)performToggleNoteActivity:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));

  if (-[ICViewControllerManager activityStreamViewMode](self, "activityStreamViewMode"))
  {
    -[ICViewControllerManager hideActivityStreamWithCompletion:](self, "hideActivityStreamWithCompletion:", 0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    -[ICViewControllerManager showActivityStreamForObjectWithObjectID:](self, "showActivityStreamForObjectWithObjectID:", v5);

  }
}

- (id)cmd3Title
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[ICViewControllerManager isAttachmentBrowserVisible](self, "isAttachmentBrowserVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Hide Attachments Browser");
  else
    v5 = CFSTR("Show Attachments Browser");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1005704B8, 0));

  return v6;
}

- (id)toggleEditorCalloutsTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributionSidebarController"));
  v4 = objc_msgSend(v3, "attributionSidebarVisibility");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4)
    v7 = CFSTR("Hide Highlights");
  else
    v7 = CFSTR("Show Highlights");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1005704B8, 0));

  return v8;
}

- (id)toggleNoteActivityTitle
{
  int64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[ICViewControllerManager activityStreamViewMode](self, "activityStreamViewMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Hide Note Activity");
  else
    v5 = CFSTR("Show Note Activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1005704B8, 0));

  return v6;
}

- (void)performReturnKey:(id)a3
{
  void *v4;
  id v5;

  -[ICViewControllerManager dismissOverlayContent](self, "dismissOverlayContent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v4, "becomeFirstResponder");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  objc_msgSend(v5, "setEditing:animated:", 1, 1);

}

- (void)performCmdReturnKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  _QWORD *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD *v19;
  _QWORD v20[5];
  unsigned __int8 v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager window](self, "window", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstResponder"));

  if (-[ICViewControllerManager isSearchActive](self, "isSearchActive"))
    v6 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager searchController](self, "searchController"));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
  v9 = objc_msgSend(v8, "isEditing");

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003C610;
  v20[3] = &unk_100550360;
  v20[4] = self;
  v21 = v9;
  v10 = objc_retainBlock(v20);
  if (v5 != v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    v12 = objc_msgSend(v11, "isSecureScreenShowing");

    if ((v12 & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
      v14 = objc_msgSend(v13, "isEditing");

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentLayer"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "noteHTMLEditorView"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10003C718;
        v18[3] = &unk_100550890;
        v19 = v10;
        objc_msgSend(v17, "stopEditingWithCompletion:", v18);

      }
      else
      {
        objc_msgSend(v5, "resignFirstResponder");
        ((void (*)(_QWORD *))v10[2])(v10);
      }
    }
  }

}

- (void)performAddLinkKey:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v5 = objc_msgSend(v4, "isEditing");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v7 = objc_msgSend(v6, "ic_isViewVisible");

  if (v7)
  {
    if (v5)
    {
      if (-[ICViewControllerManager canPerformAddLink](self, "canPerformAddLink"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
        v9 = objc_opt_respondsToSelector(v8, "openLinkEditor:");

        if ((v9 & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "auxiliaryResponder"));

          if (v11)
          {
            v12 = objc_opt_class(ICTableColumnTextView);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "auxiliaryResponder"));
            v15 = ICDynamicCast(v12, v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
          }
          objc_msgSend(v16, "performSelector:withObject:", "openLinkEditor:", v17);

        }
      }
    }
  }

}

- (void)performGotoPreviousNote:(id)a3
{
  id v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v4, "navigateBackwards");

  }
}

- (void)performGotoNextNote:(id)a3
{
  id v4;

  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v4, "navigateForwards");

  }
}

- (void)performFindInNote:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
  if (-[ICViewControllerManager canPerformFindInNote](self, "canPerformFindInNote")
    && (objc_opt_respondsToSelector(v4, "performFindInNote:") & 1) != 0)
  {
    objc_msgSend(v4, "performSelector:withObject:", "performFindInNote:", v5);
  }

}

- (void)performReplaceInNote:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
  v5 = objc_opt_respondsToSelector(v4, "performReplaceInNote:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager activeEditorController](self, "activeEditorController"));
    objc_msgSend(v6, "performSelector:withObject:", "performReplaceInNote:", v7);

  }
}

- (void)performEnclosingFolderKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  if (-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth", a3))
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager compactNavigationController](self, "compactNavigationController"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager secondaryNavigationController](self, "secondaryNavigationController"));
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= 2)
    v7 = objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

- (void)performDeleteKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager currentNoteBrowseViewController](self, "currentNoteBrowseViewController"));
  objc_msgSend(v5, "performDeleteKey:", v4);

}

- (void)performDeleteQuickNoteKey:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController", a3));
  objc_msgSend(v3, "deleteCurrentNote");

}

- (BOOL)canPerformSystemPaperNavigateLeft
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
  v3 = objc_msgSend(v2, "canSwipeInDirection:", 1);

  return v3;
}

- (void)systemPaperNavigateLeft:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController", a3));
  objc_msgSend(v3, "synthesizeSwipeForDirection:", 1);

}

- (BOOL)canPerformSystemPaperNavigateRight
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
  v3 = objc_msgSend(v2, "canSwipeInDirection:", 0);

  return v3;
}

- (void)systemPaperNavigateRight:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController", a3));
  objc_msgSend(v3, "synthesizeSwipeForDirection:", 0);

}

- (BOOL)canPerformSystemPaperShowInNotes
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentNote"));
  v4 = v3 != 0;

  return v4;
}

- (void)systemPaperShowInNotes:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager systemPaperViewController](self, "systemPaperViewController", a3));
  objc_msgSend(v3, "backToNotesWithKeyboard");

}

- (BOOL)canPerformExpandSection
{
  int IsCollapsibleSectionsEnabled;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unsigned __int8 v9;

  IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled(self, a2);
  if (IsCollapsibleSectionsEnabled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textView"));
    v7 = objc_msgSend(v6, "selectedRange");
    v9 = objc_msgSend(v4, "canExpandSectionsInRange:", v7, v8);

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performExpandSection:(id)a3
{
  -[ICViewControllerManager setExpandedForSectionsInSelectedRange:](self, "setExpandedForSectionsInSelectedRange:", 1);
}

- (BOOL)canPerformExpandAllSections
{
  int IsCollapsibleSectionsEnabled;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unsigned __int8 v9;

  IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled(self, a2);
  if (IsCollapsibleSectionsEnabled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textStorage"));
    v7 = objc_msgSend(v6, "ic_range");
    v9 = objc_msgSend(v4, "canExpandSectionsInRange:", v7, v8);

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performExpandAllSections:(id)a3
{
  id v4;

  if (ICInternalSettingsIsCollapsibleSectionsEnabled(self, a2))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    objc_msgSend(v4, "expandAllSections");

  }
}

- (BOOL)canPerformCollapseSection
{
  int IsCollapsibleSectionsEnabled;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unsigned __int8 v9;

  IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled(self, a2);
  if (IsCollapsibleSectionsEnabled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textView"));
    v7 = objc_msgSend(v6, "selectedRange");
    v9 = objc_msgSend(v4, "canCollapseSectionsInRange:", v7, v8);

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performCollapseSection:(id)a3
{
  -[ICViewControllerManager setExpandedForSectionsInSelectedRange:](self, "setExpandedForSectionsInSelectedRange:", 0);
}

- (BOOL)canPerformCollapseAllSections
{
  int IsCollapsibleSectionsEnabled;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unsigned __int8 v9;

  IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled(self, a2);
  if (IsCollapsibleSectionsEnabled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textStorage"));
    v7 = objc_msgSend(v6, "ic_range");
    v9 = objc_msgSend(v4, "canCollapseSectionsInRange:", v7, v8);

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performCollapseAllSections:(id)a3
{
  id v4;

  if (ICInternalSettingsIsCollapsibleSectionsEnabled(self, a2))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    objc_msgSend(v4, "collapseAllSections");

  }
}

- (void)setExpandedForSectionsInSelectedRange:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  if (ICInternalSettingsIsCollapsibleSectionsEnabled(self, a2))
  {
    v5 = objc_opt_class(ICTK2TextView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textView"));
    v8 = ICDynamicCast(v5, v7);
    v15 = (id)objc_claimAutoreleasedReturnValue(v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager textContentStorage](self, "textContentStorage"));
    v10 = objc_msgSend(v15, "selectedRange");
    objc_msgSend(v9, "setExpanded:forSectionsInRange:", v3, v10, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLayoutManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLayoutManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "documentRange"));
    objc_msgSend(v12, "invalidateLayoutForRange:", v14);

  }
}

- (void)addNoteFromAirDropDocument:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAirDropDocument documentAtURL:](ICAirDropDocument, "documentAtURL:", v4));
  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003D21C;
    v12[3] = &unk_1005508B8;
    v12[4] = self;
    v6 = objc_retainBlock(v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteContext"));

    if (objc_msgSend(v5, "hasDocumentForNote"))
    {
      +[ICNote createNoteForAirDropDocument:legacyContext:completion:](ICNote, "createNoteForAirDropDocument:legacyContext:completion:", v5, v8, v6);
    }
    else if (objc_msgSend(v5, "hasDocumentForLegacyNote"))
    {
      v9 = objc_alloc_init((Class)ICTextController);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
      v11 = +[NoteObject newNoteForAirDropDocument:context:styler:attachmentPreviewGenerator:](NoteObject, "newNoteForAirDropDocument:context:styler:attachmentPreviewGenerator:", v5, v8, v9, v10);

      if (v11)
      {
        ((void (*)(_QWORD *, id))v6[2])(v6, v11);

      }
      else
      {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager addNoteFromAirDropDocument:]", 1, 0, CFSTR("No note created for AirDrop document %@"), v5);
      }
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager addNoteFromAirDropDocument:]", 1, 0, CFSTR("No data found for AirDrop document %@"), v5);
    }

  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "airDropDocument", "-[ICViewControllerManager addNoteFromAirDropDocument:]", 1, 0, CFSTR("Failed to load AirDrop at url %@"), v4);
  }

}

- (void)addNoteFromPlaintextFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  ICViewControllerManager *v51;
  id v52;
  id v53;
  id v54;

  v4 = a3;
  v54 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:usedEncoding:error:](NSString, "stringWithContentsOfURL:usedEncoding:error:", v4, 0, &v54));
  v6 = v54;
  if (v5)
  {
    v51 = self;
  }
  else
  {
    v53 = v6;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:encoding:error:](NSString, "stringWithContentsOfURL:encoding:error:", v4, 4, &v53));
    v7 = v53;

    if (!v5)
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "content != ((void *)0)", "-[ICViewControllerManager addNoteFromPlaintextFile:]", 1, 0, CFSTR("Failed to load file content at url %@"), v4);
      goto LABEL_16;
    }
    v51 = self;
    v6 = v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "noteContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:](ICDefaultAccountUtilities, "defaultAccountWithHTMLNoteContext:", v9));

  v11 = objc_opt_class(ICAccount);
  v12 = ICDynamicCast(v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_opt_class(NoteAccountObject);
  v15 = ICDynamicCast(v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultFolder"));
    v49 = v4;
    v19 = +[ICNote newEmptyNoteInFolder:](ICNote, "newEmptyNoteInFolder:", v18);

    objc_msgSend(v19, "setCreationDate:", v17);
    objc_msgSend(v19, "setModificationDate:", v17);
    v20 = objc_alloc_init((Class)NSMutableDictionary);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICTTParagraphStyle paragraphStyleNamed:](ICTTParagraphStyle, "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle")));
    objc_msgSend(v20, "setObject:forKey:", v21, ICTTAttributeNameParagraphStyle);

    v47 = v17;
    v22 = v10;
    v23 = v6;
    v24 = v13;
    v25 = v16;
    v26 = objc_msgSend(v5, "paragraphRangeForRange:", 0, 0);
    v28 = v27;
    v29 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v5);
    objc_msgSend(v29, "setAttributes:range:", v20, v26, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textStorage"));
    objc_msgSend(v30, "appendAttributedString:", v29);

    objc_msgSend(v19, "updateChangeCountWithReason:", CFSTR("Created note from plaintext file"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v31, "saveImmediately");
    objc_msgSend(v31, "setCurrentNote:", v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectID"));
    LOWORD(v46) = 257;
    -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](v51, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v32, 0, 0, 0, 1, 1, v46);

    v16 = v25;
    v13 = v24;

    v7 = v23;
    v10 = v22;
    v17 = v47;
    v4 = v49;
  }
  else if (v16)
  {
    v50 = v4;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "noteContext"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "newlyAddedNote"));

    objc_msgSend(v35, "setCreationDate:", v17);
    objc_msgSend(v35, "setModificationDate:", v17);
    v48 = v16;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "defaultStore"));
    objc_msgSend(v35, "setStore:", v36);

    v37 = ICNoteTitleFromPlainText(v5);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    objc_msgSend(v35, "setTitle:", v38);

    v39 = ICNoteHTMLFromPlainText(v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    objc_msgSend(v35, "setContent:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "noteContext"));
    v52 = v6;
    v43 = objc_msgSend(v42, "save:", &v52);
    v7 = v52;

    if ((v43 & 1) == 0)
    {
      v44 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        sub_1004043B8();

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectID"));
    LOWORD(v46) = 257;
    -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](v51, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v45, 0, 0, 0, 1, 1, v46);

    v16 = v48;
    v4 = v50;
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager addNoteFromPlaintextFile:]", 1, 0, CFSTR("Couldn't get default account"));
    v7 = v6;
  }

LABEL_16:
}

- (BOOL)openURL:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  BOOL v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  _QWORD v73[5];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  ICViewControllerManager *v79;
  unsigned __int8 v80;
  _QWORD v81[4];
  id v82;
  ICViewControllerManager *v83;
  id v84;
  id v85;
  unsigned __int8 v86;
  id v87;
  id v88;
  void *v89;
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  int v93;

  v4 = a3;
  v5 = objc_msgSend(v4, "isFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v7 = objc_msgSend(v6, "isSecureScreenShowing");

  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v91 = "-[ICViewControllerManager openURL:]";
    v92 = 1024;
    v93 = 7723;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if (v5)
  {
    v88 = 0;
    v87 = 0;
    v9 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v88, NSURLTypeIdentifierKey, &v87);
    v10 = v88;
    v11 = v87;
    if ((v9 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
      v13 = objc_msgSend(v12, "isEqualToString:", kICAirDropDocumentExtension);

      if (v13)
      {
        -[ICViewControllerManager addNoteFromAirDropDocument:](self, "addNoteFromAirDropDocument:", v4);
LABEL_26:
        v27 = 1;
LABEL_28:

        goto LABEL_64;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v10));
      v26 = objc_msgSend(v25, "conformsToType:", UTTypePlainText);

      if (v26)
      {
        -[ICViewControllerManager addNoteFromPlaintextFile:](self, "addNoteFromPlaintextFile:", v4);
        goto LABEL_26;
      }
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100404424(v11, (uint64_t)v4, v18);

    }
    v27 = 0;
    goto LABEL_28;
  }
  if (v4)
    v14 = v7;
  else
    v14 = 0;
  if (v14 != 1)
  {
    if (!v4)
      goto LABEL_31;
    if (!+[ICAppURLUtilities isQuickNoteModeURL:](ICAppURLUtilities, "isQuickNoteModeURL:", v4))
    {
      if (+[ICAppURLUtilities isTranscriptionDonationURL:](ICAppURLUtilities, "isTranscriptionDonationURL:", v4))
      {
        v28 = +[ICAppURLUtilities isTranscriptionDonationURLPositive:](ICAppURLUtilities, "isTranscriptionDonationURLPositive:", v4);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "workerManagedObjectContext"));

        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_10003E130;
        v76[3] = &unk_100550188;
        v77 = v4;
        v78 = v30;
        v79 = self;
        v80 = v28;
        v31 = v30;
        objc_msgSend(v31, "performBlockAndWait:", v76);

      }
      goto LABEL_31;
    }
    v19 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_1004044DC();

    v11 = (id)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "managedObjectContext"));

    v23 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities noteIdentifierFromQuickNoteURL:](ICAppURLUtilities, "noteIdentifierFromQuickNoteURL:", v4));
    v70 = (void *)v23;
    if (v23)
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v23, v22));
    else
      v24 = 0;
    v36 = +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen");
    v37 = +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen");
    if (v37 == (id)3 || v36 == (id)2)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      v40 = v39;
      if (v37 == (id)3)
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "quicknoteArchiveState"));
      else
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastBackgroundedArchiveState"));
      v42 = (void *)v41;

      if (!v24)
      {
LABEL_47:
        buf[0] = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "noteForSessionCreatingIfNecessaryInContext:stateArchive:canResume:isNewlyCreated:", v22, v42, 1, buf));
        if (buf[0])
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "eventReporter"));

          objc_msgSend(v44, "submitNoteCreateEventForModernNote:createApproach:", v24, 12);
        }
      }
    }
    else
    {
      if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
        v38 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager windowStateArchive](self, "windowStateArchive"));
      else
        v38 = objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveWithEmptyState](ICWindowStateArchive, "windowStateArchiveWithEmptyState"));
      v42 = (void *)v38;
      if (!v24)
        goto LABEL_47;
    }
    v69 = (void *)v22;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastSavedInkingTool"));
    v71 = v20;
    objc_msgSend(v20, "updateInkPickerAndTextViewToTool:", v45);

    v68 = v42;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "scrollStateForNote:", v24));
    v46 = +[ICAppURLUtilities quickNoteURLShouldShowList:](ICAppURLUtilities, "quickNoteURLShouldShowList:", v4);
    v47 = +[ICAppURLUtilities quickNoteURLShouldShowShareSheet:](ICAppURLUtilities, "quickNoteURLShouldShowShareSheet:", v4);
    v48 = +[ICAppURLUtilities quickNoteURLShouldShowiCloudShareSheet:](ICAppURLUtilities, "quickNoteURLShouldShowiCloudShareSheet:", v4);
    v49 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities attachmentIdentifierFromQuickNoteURL:](ICAppURLUtilities, "attachmentIdentifierFromQuickNoteURL:", v4));
    v50 = objc_msgSend(v24, "isPasswordProtected");
    v72 = 0;
    if ((v46 & 1) == 0 && (v47 & 1) == 0 && (v48 & 1) == 0 && !v49)
    {
      v51 = v50;
      if ((+[ICAppURLUtilities isLaunchingQuickNoteViaPencil:](ICAppURLUtilities, "isLaunchingQuickNoteViaPencil:", v4) & 1) != 0)
      {
        v72 = 0;
      }
      else
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "textView"));
        v72 = objc_msgSend(v52, "canBecomeFirstResponder") & (v51 ^ 1);

      }
    }
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      v53 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager windowStateArchive](self, "windowStateArchive"));
    else
      v53 = objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveWithEmptyState](ICWindowStateArchive, "windowStateArchiveWithEmptyState"));
    v54 = (void *)v53;
    v66 = (void *)v49;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "folder"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "account"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectID"));

    if (!v46
      || (v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "URIRepresentation")),
          v89 = v58,
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1)), objc_msgSend(v54, "setCurrentContainerObjectIDURLs:", v59), v59, v58, !-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth")))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectID"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "URIRepresentation"));
      objc_msgSend(v54, "setCurrentNoteObjectIDURL:", v61);

    }
    objc_msgSend(v54, "setCurrentNoteContainerViewMode:", -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode"));
    objc_msgSend(v54, "setScrollState:", v67);
    objc_msgSend(v54, "setActiveEditorInEditMode:", v72);
    -[ICViewControllerManager applyNoteViewModesToStateRestoreArchive:withContainerItemID:](self, "applyNoteViewModesToStateRestoreArchive:withContainerItemID:", v54, v57);
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10003E0BC;
    v81[3] = &unk_1005508E0;
    v86 = v48;
    v82 = v71;
    v83 = self;
    v84 = v66;
    v85 = v69;
    v62 = v69;
    v63 = v66;
    v64 = v71;
    -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v54, v81);

    goto LABEL_63;
  }
  v15 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities noteIdentifierFromNotesAppURL:](ICAppURLUtilities, "noteIdentifierFromNotesAppURL:", v4));
  if (v15)
  {
    v11 = (id)v15;
    v16 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_1004044B0();

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, ICQuickNoteURLOptionNoteIdentifier);
    -[ICViewControllerManager launchNotesAppFromLockscreenWithQueryOptions:completionBlock:](self, "launchNotesAppFromLockscreenWithQueryOptions:completionBlock:", v17, 0);

    goto LABEL_63;
  }
LABEL_31:
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedNoteObjectID](self, "selectedNoteObjectID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager rootNoteBrowseViewController](self, "rootNoteBrowseViewController"));
    v35 = -[ICViewControllerManager noteContainerViewMode](self, "noteContainerViewMode");
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10003E3EC;
    v73[3] = &unk_100550930;
    v73[4] = self;
    v74 = v32;
    v75 = v4;
    v11 = v32;
    objc_msgSend(v33, "openURL:rootNoteBrowseViewController:currentNoteContainerViewMode:completion:", v75, v34, v35, v73);

LABEL_63:
    v27 = 1;
    goto LABEL_64;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager archiveForURL:](self, "archiveForURL:", v4));
  v27 = v11 != 0;
  if (v11)
    -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v11, 0);
LABEL_64:

  return v27;
}

- (void)showAudioDonationDialog:(BOOL)a3 mediaURL:(id)a4 transcript:(id)a5 date:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  BOOL v33;

  v8 = a4;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Help Improve Transcriptions?"), &stru_1005704B8, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Would you like to submit this recording to Apple to improve transcription accuracy?\n\nRecordings will only be used to improve the quality of speech recognition in Apple products.\n\nDo not submit recordings if you believe the speaker would be uncomfortable with you submitting the content to Apple."), &stru_1005704B8, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v28, v27, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Submit"), &stru_1005704B8, 0));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003E7C4;
  v29[3] = &unk_100550978;
  v30 = v8;
  v31 = v9;
  v32 = v10;
  v33 = a3;
  v25 = v10;
  v16 = v9;
  v17 = v8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v29));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1005704B8, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, 0));

  objc_msgSend(v13, "addAction:", v18);
  objc_msgSend(v13, "addAction:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "presentedViewController"));
  objc_msgSend(v23, "presentViewController:animated:completion:", v13, 1, 0);

}

- (id)archiveForURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  void *v84;

  v3 = a3;
  v4 = sub_1000A011C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDForModernFolderMentionedInURL:noteContext:](ICAppURLUtilities, "objectIDForModernFolderMentionedInURL:noteContext:", v3, v6));
    if (v7)
    {
LABEL_3:
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URIRepresentation"));
LABEL_6:
      v83 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
LABEL_7:
      v13 = 0;
      goto LABEL_8;
    }
    if ((+[ICAppURLUtilities isShowVirtualSmartFolderURL:](ICAppURLUtilities, "isShowVirtualSmartFolderURL:", v3) & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities virtualSmartFolderMentionedInURL:context:](ICAppURLUtilities, "virtualSmartFolderMentionedInURL:context:", v3, v27));

      v8 = 0;
      v9 = 0;
      v83 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_7;
    }
    if (+[ICAppURLUtilities isShowNoteInVirtualSmartFolderURL:](ICAppURLUtilities, "isShowNoteInVirtualSmartFolderURL:", v3))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities virtualSmartFolderMentionedInURL:context:](ICAppURLUtilities, "virtualSmartFolderMentionedInURL:context:", v3, v28));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities notePredicateFromNoteInVirtualSmartFolderInURL:](ICAppURLUtilities, "notePredicateFromNoteInVirtualSmartFolderInURL:", v3));
      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v29, v30));

        if (objc_msgSend(v31, "count"))
        {
          v32 = v6;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectID"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "URIRepresentation"));

          if (v12)
            v35 = v9;
          else
            v35 = 0;
          v83 = v35;
          if (v12)
            v9 = 0;

          v6 = v32;
        }
        else
        {
          v83 = 0;
          v9 = 0;
        }

      }
      else
      {
        v83 = 0;
        v9 = 0;
      }

      v10 = 0;
LABEL_67:
      v13 = (char)v83;
      v8 = 0;
      if (v83)
      {
        v11 = 0;
        v13 = objc_msgSend(v10, "count") != 0;
      }
      else
      {
        v83 = 0;
        v11 = 0;
      }
      goto LABEL_8;
    }
  }
  else if ((+[ICAppURLUtilities isShowVirtualSmartFolderURL:](ICAppURLUtilities, "isShowVirtualSmartFolderURL:", v3) & 1) != 0)
  {
    goto LABEL_5;
  }
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDForHTMLFolderMentionedInURL:context:](ICAppURLUtilities, "objectIDForHTMLFolderMentionedInURL:context:", v3, v5));
    if (v7)
      goto LABEL_3;
    if (+[ICAppURLUtilities isShowDefaultFolderURL:](ICAppURLUtilities, "isShowDefaultFolderURL:", v3))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaultAccountUtilities defaultFolderWithHTMLNoteContext:](ICDefaultAccountUtilities, "defaultFolderWithHTMLNoteContext:", v5));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "URIRepresentation"));

LABEL_36:
      v8 = 0;
      goto LABEL_6;
    }
  }
  if (+[ICAppURLUtilities isShowNoteURL:](ICAppURLUtilities, "isShowNoteURL:", v3))
  {
    v38 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities predicateForNotesMentionedInURL:](ICAppURLUtilities, "predicateForNotesMentionedInURL:", v3));
    v39 = (void *)v38;
    v10 = 0;
    if (v6)
    {
      v83 = 0;
      v9 = 0;
      if (v38)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v39, v40));

        v77 = v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities folderIdentifierForShowNoteURL:](ICAppURLUtilities, "folderIdentifierForShowNoteURL:", v3));
        if (v43)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder folderWithIdentifier:context:](ICFolder, "folderWithIdentifier:context:", v43, v44));

          if (v45
            && v42
            && (v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "visibleNotes")),
                v47 = objc_msgSend(v46, "containsObject:", v42),
                v46,
                v47))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectID"));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "URIRepresentation"));

            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectID"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "URIRepresentation"));
            v84 = v49;
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v84, 1));

            v50 = 0;
          }
          else
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectID"));
            v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "URIRepresentation"));

            v10 = 0;
            v83 = 0;
          }

        }
        else
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectID"));
          v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "URIRepresentation"));

          v10 = 0;
          v83 = 0;
        }

        v9 = (void *)v50;
      }
    }
    else
    {
      v83 = 0;
      v9 = 0;
    }

    v12 = 0;
    goto LABEL_67;
  }
  v51 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:](ICAppURLUtilities, "objectIDURIRepresentationForHTMLNoteMentionedInURL:", v3));
  if (!v51)
  {
    if (+[ICAppURLUtilities isShowNoteFocusedInFolderURL:](ICAppURLUtilities, "isShowNoteFocusedInFolderURL:", v3))
    {
      v81 = v5;
      v52 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities predicateForFolderWithNoteFocusedInURL:](ICAppURLUtilities, "predicateForFolderWithNoteFocusedInURL:", v3));
      v53 = (void *)v52;
      v12 = 0;
      v11 = 0;
      v9 = 0;
      if (v6 && v52)
      {
        v79 = v6;
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v53, v54));

        v56 = objc_opt_class(ICNote);
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstObject"));
        v58 = ICDynamicCast(v56, v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);

        if (!v59)
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((firstNote) != nil)", "-[ICViewControllerManager archiveForURL:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "firstNote");
        if (objc_msgSend(v59, "isSystemPaper"))
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualSystemPaperFolder](ICAccount, "globalVirtualSystemPaperFolder"));
        else
          v12 = 0;
        if (objc_msgSend(v59, "isMathNote"))
        {
          v71 = objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualMathNotesFolder](ICAccount, "globalVirtualMathNotesFolder"));

          v12 = (void *)v71;
        }
        if (objc_msgSend(v59, "isCallNote"))
        {
          v72 = 0;
          v73 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount globalVirtualCallNotesFolder](ICAccount, "globalVirtualCallNotesFolder"));
        }
        else
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "folder"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectID"));
          v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "URIRepresentation"));

        }
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "URIRepresentation"));

        v6 = v79;
        v9 = (void *)v72;
      }

      v8 = 0;
      v83 = 0;
      v10 = 0;
      v13 = 0;
      v5 = v81;
LABEL_8:
      if (!v9 && !v13 && !v12)
      {
        v9 = 0;
        v14 = 0;
        if (!+[ICAppURLUtilities isShowFolderListURL:](ICAppURLUtilities, "isShowFolderListURL:", v3))goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (NotesAppIsValidURL(v3))
    {
      v61 = NotesAppPredicateForNoteMentionedInURL(v3);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      if (v62)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "noteContext"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "allVisibleNotesMatchingPredicate:sorted:", v62, 1));

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "firstObject"));
        v67 = v6;
        v68 = v5;
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "URIRepresentation"));

        v5 = v68;
        v6 = v67;

      }
      else
      {
        v9 = 0;
      }

      goto LABEL_36;
    }
LABEL_5:
    v8 = 0;
    v9 = 0;
    goto LABEL_6;
  }
  v9 = (void *)v51;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  v83 = 0;
  v8 = 0;
LABEL_12:
  v78 = v6;
  v80 = v5;
  v15 = v3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveWithEmptyState](ICWindowStateArchive, "windowStateArchiveWithEmptyState"));
  v14 = v16;
  if (v11)
    objc_msgSend(v16, "setFocusedNoteObjectIDURL:", v11);
  v17 = v11;
  v18 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager managedObjectIDFromURL:](self, "managedObjectIDFromURL:", v9));
  v19 = (void *)v18;
  v20 = v12;
  if (v18)
    v21 = (void *)v18;
  else
    v21 = v12;
  v22 = v21;

  if (v22)
    -[ICViewControllerManager applyNoteViewModesToStateRestoreArchive:withContainerItemID:](self, "applyNoteViewModesToStateRestoreArchive:withContainerItemID:", v14, v22);
  objc_msgSend(v14, "setCurrentObjectIDURL:", v9);
  objc_msgSend(v14, "setCurrentNoteObjectIDURL:", v83);
  objc_msgSend(v14, "setCurrentContainerObjectIDURLs:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "type"));
  objc_msgSend(v14, "setCurrentVirtualSmartFolderType:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accountObjectID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URIRepresentation"));
  objc_msgSend(v14, "setCurrentVirtualSmartFolderAccountObjectIDURL:", v25);

  v12 = v20;
  v3 = v15;
  v6 = v78;
  v5 = v80;
  v11 = v17;
LABEL_20:

  return v14;
}

- (id)createDeferredActionMenuElementForEditorViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "invitation"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003F204;
  v9[3] = &unk_1005509A0;
  objc_copyWeak(&v10, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteEditorActionMenu deferredActionMenuElementWithNote:invitation:presentingViewController:viewControllerManager:delegate:completion:](ICNoteEditorActionMenu, "deferredActionMenuElementWithNote:invitation:presentingViewController:viewControllerManager:delegate:completion:", v5, v6, v4, self, v4, v9));
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

- (void)selectTagSelection:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    v5 = objc_msgSend(v6, "copy");
    objc_msgSend(v4, "pushTagSelection:", v5);

  }
  else
  {
    -[ICViewControllerManager showTagSelection:](self, "showTagSelection:", v6);
  }

}

- (void)selectContainerWithIdentifier:(id)a3 usingRootViewController:(BOOL)a4 deferUntilDataLoaded:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v14 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    if (v14)
      v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:"));
    else
      v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    BYTE1(v13) = 1;
    LOBYTE(v13) = a6;
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v11, v12, 0, v8, v7, &__kCFBooleanFalse, v13, 0, 0, 0, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet ic_setFromNonNilObject:](NSSet, "ic_setFromNonNilObject:", v14));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    LOBYTE(v13) = a6;
    -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:keepEditorShowing:animated:](self, "showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:keepEditorShowing:animated:", v11, v12, v8, v7, 0, 0, v13);
  }

}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  uint64_t v13;
  id v14;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a4;
  v14 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    BYTE1(v13) = 1;
    LOBYTE(v13) = v7;
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v14, v12, 0, v9, v8, 0, v13, 0, 0, 0, 0);
  }
  else
  {
    -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:keepEditorShowing:animated:](self, "showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:keepEditorShowing:animated:", v14, v12, v9, v8, 0, v7);
  }

}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(BOOL)a7 animated:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v17 = a3;
  v14 = a4;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    BYTE1(v16) = 1;
    LOBYTE(v16) = a8;
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v17, v14, 0, v11, v10, v15, v16, 0, 0, 0, 0);

  }
  else
  {
    LOBYTE(v16) = a8;
    -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:keepEditorShowing:animated:](self, "showContainerWithIdentifiers:excludingIdentifiers:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:keepEditorShowing:animated:", v17, v14, v11, v10, v9, 0, v16);
  }

}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(id)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(id)a11 keepEditorShowing:(id)a12 dataIndexedBlock:(id)a13 dataRenderedBlock:(id)a14
{
  uint64_t v14;

  LOWORD(v14) = __PAIR16__(a10, a9);
  -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", a3, a4, 0, a5, a6, a7, a8, v14, a11, a12, a13, a14);
}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 isChangingDisplayMode:(BOOL)a5 noteBrowseViewController:(id)a6 usingRootViewController:(BOOL)a7 deferUntilDataLoaded:(BOOL)a8 dismissOverlayContent:(id)a9 animated:(BOOL)a10 ensurePresented:(BOOL)a11 ensureSelectedNote:(id)a12 keepEditorShowing:(id)a13 dataIndexedBlock:(id)a14 dataRenderedBlock:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  void *v25;
  void *v26;
  ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *v27;
  int64_t v28;
  unsigned __int8 v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  uint64_t v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  id v44;
  id v45;

  v43 = a8;
  v40 = a5;
  v42 = a7;
  v45 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a9;
  v21 = a12;
  v44 = a13;
  v22 = (unint64_t)a14;
  v23 = (unint64_t)a15;
  v24 = -[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allObjects"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
  if (!v24)
  {
    v28 = -[ICViewControllerManager enforcedNoteContainerViewModeForContainerItemID:](self, "enforcedNoteContainerViewModeForContainerItemID:", v26);

    v41 = v20 != 0;
    v29 = -[ICViewControllerManager isAutomaticallySelectingNotes](self, "isAutomaticallySelectingNotes");
    v30 = v20;
    v31 = v19;
    v32 = v21;
    v33 = v18;
    if (v28 == 1)
      v34 = 0;
    else
      v34 = v29;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ICViewControllerManager isTrashFolderSelected](self, "isTrashFolderSelected")));
    BYTE2(v39) = v34;
    v18 = v33;
    v21 = v32;
    v19 = v31;
    v20 = v30;
    LOWORD(v39) = __PAIR16__(a11, a10);
    -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v45, v18, v19, v42, v43, v41, v39, v26, v22, v23);
    goto LABEL_10;
  }

  if (!objc_msgSend((id)objc_opt_class(v26), "conformsToProtocol:", &OBJC_PROTOCOL___ICItemIdentifier)
    || !-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth")
    && (v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController")),
        v37 = objc_msgSend(v36, "selectedContainerEqualTo:", v26),
        v36,
        v37)
    && !v40)
  {
LABEL_10:
    v35 = v44;
    goto LABEL_11;
  }
  if (v22 | v23)
    v27 = -[ICSelectionStateModelContainerSelectionOptionsCompletionBlocks initWithDataIndexedBlock:dataRenderedBlock:]([ICSelectionStateModelContainerSelectionOptionsCompletionBlocks alloc], "initWithDataIndexedBlock:dataRenderedBlock:", v22, v23);
  else
    v27 = 0;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
  v35 = v44;
  LOWORD(v39) = __PAIR16__(a11, a10);
  objc_msgSend(v38, "pushContainerSelectionWithObjectID:forceApply:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:containerSelectionCompletionBlocks:", v26, v40, v19, v42, v43, v20, v39, v21, v44, v27);

LABEL_11:
}

- (void)selectObjectWithObjectID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled")
    && (objc_msgSend(v7, "ic_isContainerType") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v5, "pushObjectWithObjectID:", v7);
  }
  else
  {
    if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
      v4 = objc_claimAutoreleasedReturnValue(-[ICViewControllerManager windowStateArchive](self, "windowStateArchive"));
    else
      v4 = objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveWithEmptyState](ICWindowStateArchive, "windowStateArchiveWithEmptyState"));
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URIRepresentation"));
    objc_msgSend(v5, "setCurrentObjectIDURL:", v6);

    -[ICViewControllerManager applyNoteViewModesToStateRestoreArchive:withContainerItemID:](self, "applyNoteViewModesToStateRestoreArchive:withContainerItemID:", v5, v7);
    -[ICViewControllerManager applyStateRestoreArchive:completion:](self, "applyStateRestoreArchive:completion:", v5, 0);
  }

}

- (void)selectInvitationWithObjectID:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v6, "pushInvitationWithObjectID:animated:", v7, v4);

  }
  else
  {
    -[ICViewControllerManager showInvitationWithObjectID:animated:](self, "showInvitationWithObjectID:animated:", v7, v4);
  }

}

- (void)selectNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 animated:(BOOL)a6 ensurePresented:(BOOL)a7
{
  uint64_t v7;

  BYTE1(v7) = a7;
  LOBYTE(v7) = a6;
  -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", a3, a4, a5, 0, 1, 1, v7);
}

- (void)selectNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v20 = a3;
  v16 = a4;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    if (-[ICViewControllerManager isSearchActive](self, "isSearchActive"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectedSearchResult](self, "selectedSearchResult"));
      LOWORD(v19) = __PAIR16__(a10, a9);
      objc_msgSend(v17, "pushNoteSelectionWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:searchResult:", v20, v16, v13, v12, v11, v10, v19, v18);

    }
    else
    {
      LOWORD(v19) = __PAIR16__(a10, a9);
      objc_msgSend(v17, "pushNoteSelectionWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:searchResult:", v20, v16, v13, v12, v11, v10, v19, 0);
    }

  }
  else
  {
    LOWORD(v19) = __PAIR16__(a10, a9);
    -[ICViewControllerManager showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v20, v16, v13, v12, v11, v10, v19);
  }

}

- (void)selectNoteStartEditingIfEmptyWithObjectID:(id)a3 scrollState:(id)a4 animated:(BOOL)a5 ensurePresented:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  _QWORD v14[7];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    if (objc_msgSend(v10, "ic_isModernNoteType"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10003FCE8;
      v15[3] = &unk_1005502C0;
      v13 = v15;
      v15[4] = self;
      v15[5] = v10;
      v15[6] = &v16;
      objc_msgSend(v12, "performBlockAndWait:", v15);
    }
    else
    {
      if (!objc_msgSend(v10, "ic_isLegacyNoteType"))
      {
LABEL_7:
        -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:animated:ensurePresented:", v10, v11, *((unsigned __int8 *)v17 + 24), v7, v6);
        _Block_object_dispose(&v16, 8);
        goto LABEL_8;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyManagedObjectContext](self, "legacyManagedObjectContext"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10003FD48;
      v14[3] = &unk_1005502C0;
      v13 = v14;
      v14[4] = self;
      v14[5] = v10;
      v14[6] = &v16;
      objc_msgSend(v12, "performBlockAndWait:", v14);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)selectAttachmentWithObjectID:(id)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (-[ICViewControllerManager selectionStateTrackingEnabled](self, "selectionStateTrackingEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    BYTE1(v11) = 1;
    LOBYTE(v11) = a4;
    objc_msgSend(v6, "pushAttachmentSelectionWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v12, 0, 0, 0, 1, 0, v11);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v12, "ic_isBaseAttachmentType"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager modernManagedObjectContext](self, "modernManagedObjectContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectWithID:", v12));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICTextViewScrollState scrollStateForAttachment:inNote:](ICTextViewScrollState, "scrollStateForAttachment:inNote:", v6, v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
    BYTE1(v11) = 1;
    LOBYTE(v11) = a4;
    -[ICViewControllerManager showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v10, v9, 0, 0, 1, 0, v11);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)selectModel:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager selectionStateController](self, "selectionStateController"));
    objc_msgSend(v5, "pushModel:navigating:", v4, 0);

  }
}

- (BOOL)objectAlreadyLoadedInEditorWithObjectID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  unsigned int v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v7 = a3;
  v8 = objc_msgSend(v7, "ic_isModernNoteType");
  if (v8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "note"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    if ((objc_msgSend(v7, "isEqual:", v5) & 1) != 0)
    {
      v9 = 1;
LABEL_10:

      goto LABEL_11;
    }
    if ((objc_msgSend(v7, "ic_isInvitationType") & 1) == 0)
    {
      v9 = 0;
      goto LABEL_10;
    }
  }
  else if (!objc_msgSend(v7, "ic_isInvitationType"))
  {
    v9 = 0;
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "invitation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));
  v9 = objc_msgSend(v7, "isEqual:", v12);

  if (v8)
    goto LABEL_10;
LABEL_11:
  if (objc_msgSend(v7, "ic_isLegacyNoteType"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager legacyNoteEditorViewController](self, "legacyNoteEditorViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "note"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));
    v16 = objc_msgSend(v7, "isEqual:", v15);

  }
  else
  {
    v16 = 0;
  }

  return v9 | v16;
}

- (void)adoptContainerFromSelectionStateController:(id)a3 oldModel:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  ICViewControllerManager *v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004015C;
  v8[3] = &unk_100550020;
  v9 = a3;
  v10 = a4;
  v11 = self;
  v6 = v10;
  v7 = v9;
  performBlockOnMainThread(v8);

}

- (void)adoptObjectFromSelectionStateController:(id)a3 oldModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICViewControllerManager *v13;
  id v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000407B8;
  v11[3] = &unk_1005509C8;
  v12 = a3;
  v13 = self;
  v14 = a4;
  v15 = a5;
  v8 = v15;
  v9 = v14;
  v10 = v12;
  performBlockOnMainThread(v11);

}

- (void)selectionStateController:(id)a3 didAdoptModelFromOldModel:(id)a4 isNavigating:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100040CD8;
  v18[3] = &unk_100550020;
  v18[4] = self;
  v9 = v7;
  v19 = v9;
  v10 = v8;
  v20 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100040F14;
  v14[3] = &unk_1005509C8;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = objc_retainBlock(v18);
  v11 = v17;
  v12 = v10;
  v13 = v9;
  performBlockOnMainThread(v14);

}

- (BOOL)shouldAutomaticallySelectNoteContainerForSelectionStateController:(id)a3
{
  void *v4;
  BOOL v5;

  if (-[ICViewControllerManager isApplyingStateRestoreArchive](self, "isApplyingStateRestoreArchive", a3)
    || !-[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth"))
  {
    return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
  v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldRevertToDefaultFolderWhenUnselectingTagsForSelectionStateController:(id)a3
{
  _BOOL4 v4;

  v4 = -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth", a3);
  if (v4)
    LOBYTE(v4) = -[ICViewControllerManager isNoteEditorVisible](self, "isNoteEditorVisible");
  return v4;
}

- (BOOL)shouldRevertToAllTagsWhenUnselectingTagsForSelectionStateController:(id)a3
{
  _BOOL4 v4;

  v4 = -[ICViewControllerManager hasCompactWidth](self, "hasCompactWidth", a3);
  if (v4)
    LOBYTE(v4) = !-[ICViewControllerManager isNoteEditorVisible](self, "isNoteEditorVisible");
  return v4;
}

- (BOOL)shouldSelectDefaultContainerWhenInappropriateForSelectionStateController:(id)a3
{
  BOOL v4;
  void *v5;

  if (-[ICViewControllerManager isSearchActive](self, "isSearchActive", a3))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager overrideContainerIdentifier](self, "overrideContainerIdentifier"));
  v4 = v5 == 0;

  return v4;
}

- (BOOL)shouldRevertToMostRecentlySelectedNonSearchObjectOnNavigationTransitionForSelectionStateController:(id)a3
{
  if (-[ICViewControllerManager isSearchActive](self, "isSearchActive", a3))
    return 0;
  else
    return -[ICViewControllerManager isAutomaticallySelectingNotes](self, "isAutomaticallySelectingNotes");
}

- (BOOL)shouldRevertToMostRecentlySelectedSearchResultOnNavigationTransitionForSelectionStateController:(id)a3
{
  _BOOL4 v4;

  v4 = -[ICViewControllerManager isSearchActive](self, "isSearchActive", a3);
  if (v4)
    LOBYTE(v4) = -[ICViewControllerManager isAutomaticallySelectingNotes](self, "isAutomaticallySelectingNotes");
  return v4;
}

- (void)selectionStateController:(id)a3 didAdoptInstantNoteModelFromArchive:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004115C;
  v7[3] = &unk_100550020;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  performBlockOnMainThread(v7);

}

- (void)selectionStateController:(id)a3 didIgnoreDuplicateModel:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041310;
  v5[3] = &unk_10054FE80;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  performBlockOnMainThread(v5);

}

- (id)selectionStateController:(id)a3 scrollStateForObjectID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (objc_msgSend(v5, "ic_isModernNoteType")
    && -[ICViewControllerManager objectAlreadyLoadedInEditorWithObjectID:](self, "objectAlreadyLoadedInEditorWithObjectID:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](self, "noteEditorViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentScrollState"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hostedNotesAppearanceCoordinatorModeButtonHidingModalTypes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_opt_class(PHPickerViewController);
  v4 = objc_opt_class(UIActivityViewController);
  v5 = objc_opt_class(UIDocumentPickerViewController);
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, objc_opt_class(UINavigationController), 0);
}

- (id)hostedNotesAppearanceCoordinatorModeButtonHidingPopoverTypes:(id)a3
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", NSClassFromString(CFSTR("PKPaletteAttributeViewController")), 0);
}

- (BOOL)hostedNotesAppearanceCoordinator:(id)a3 shouldHideWithModal:(id)a4
{
  return +[ICAudioRecordingViewController presentedViewControllerIsAudio:](ICAudioRecordingViewController, "presentedViewControllerIsAudio:", a4);
}

- (BOOL)isAuxiliary
{
  return self->_isAuxiliary;
}

- (void)setKeyboardHandler:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardHandler, a3);
}

- (void)setSystemPaperViewController:(id)a3
{
  objc_storeStrong((id *)&self->_systemPaperViewController, a3);
}

- (void)setWelcomeScreenVisible:(BOOL)a3
{
  self->_welcomeScreenVisible = a3;
}

- (ICAttachmentPresenter)currentAttachmentPresenter
{
  return self->_currentAttachmentPresenter;
}

- (void)setCurrentAttachmentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_currentAttachmentPresenter, a3);
}

- (UIApplicationShortcutItem)selectedNewNoteShortcutItem
{
  return self->_selectedNewNoteShortcutItem;
}

- (void)setSelectedNewNoteShortcutItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedNewNoteShortcutItem, a3);
}

- (ICStartupNavigationController)startupNavigationController
{
  return self->_startupNavigationController;
}

- (void)setStartupNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_startupNavigationController, a3);
}

- (int64_t)proposedMainSplitViewControllerDisplayMode
{
  return self->_proposedMainSplitViewControllerDisplayMode;
}

- (void)setProposedMainSplitViewControllerDisplayMode:(int64_t)a3
{
  self->_proposedMainSplitViewControllerDisplayMode = a3;
}

- (ICOverlayWindowPresenter)startupPresenter
{
  return self->_startupPresenter;
}

- (void)setStartupPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_startupPresenter, a3);
}

- (void)setPrimaryContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryContainerViewController, a3);
}

- (void)setTrailingSidebarContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSidebarContainerViewController, a3);
}

- (ICColumnVisibilityController)columnVisibilityController
{
  return self->_columnVisibilityController;
}

- (void)setColumnVisibilityController:(id)a3
{
  objc_storeStrong((id *)&self->_columnVisibilityController, a3);
}

- (int64_t)preferredNoteContainerViewMode
{
  return self->_preferredNoteContainerViewMode;
}

- (BOOL)isSelectedNoteTogglingLock
{
  return self->_isSelectedNoteTogglingLock;
}

- (void)setIsSelectedNoteTogglingLock:(BOOL)a3
{
  self->_isSelectedNoteTogglingLock = a3;
}

- (BOOL)isTagBeingRenamed
{
  return self->_isTagBeingRenamed;
}

- (void)setIsTagBeingRenamed:(BOOL)a3
{
  self->_isTagBeingRenamed = a3;
}

- (BOOL)isTagBeingDeleted
{
  return self->_isTagBeingDeleted;
}

- (void)setIsTagBeingDeleted:(BOOL)a3
{
  self->_isTagBeingDeleted = a3;
}

- (BOOL)isNoteBeingRecovered
{
  return self->_isNoteBeingRecovered;
}

- (void)setIsNoteBeingRecovered:(BOOL)a3
{
  self->_isNoteBeingRecovered = a3;
}

- (BOOL)isRecoveredNoteBeingPresented
{
  return self->_isRecoveredNoteBeingPresented;
}

- (void)setIsRecoveredNoteBeingPresented:(BOOL)a3
{
  self->_isRecoveredNoteBeingPresented = a3;
}

- (BOOL)isSelectingNextRelevantNoteBrowseContainer
{
  return self->_isSelectingNextRelevantNoteBrowseContainer;
}

- (void)setIsSelectingNextRelevantNoteBrowseContainer:(BOOL)a3
{
  self->_isSelectingNextRelevantNoteBrowseContainer = a3;
}

- (BOOL)isMainSplitViewColumnDisplaced
{
  return self->_isMainSplitViewColumnDisplaced;
}

- (void)setIsMainSplitViewColumnDisplaced:(BOOL)a3
{
  self->_isMainSplitViewColumnDisplaced = a3;
}

- (ICItemIdentifier)mostRecentRegularWidthSelectedNoteBrowseContainerItemID
{
  return self->_mostRecentRegularWidthSelectedNoteBrowseContainerItemID;
}

- (ICTagSelection)mostRecentRegularWidthTagSelection
{
  return self->_mostRecentRegularWidthTagSelection;
}

- (NSManagedObjectID)mostRecentRegularWidthSelectedNoteObjectID
{
  return self->_mostRecentRegularWidthSelectedNoteObjectID;
}

- (BOOL)isSearchActiveWithQuery
{
  return self->_isSearchActiveWithQuery;
}

- (void)setIsSearchActiveWithQuery:(BOOL)a3
{
  self->_isSearchActiveWithQuery = a3;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (ICFolderCreationController)folderCreationController
{
  return self->_folderCreationController;
}

- (void)setFolderCreationController:(id)a3
{
  objc_storeStrong((id *)&self->_folderCreationController, a3);
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (void)setSelectionStateController:(id)a3
{
  objc_storeStrong((id *)&self->_selectionStateController, a3);
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (ICHostedNotesAppearanceCoordinator)hostedNotesAppearanceCoordinator
{
  return self->_hostedNotesAppearanceCoordinator;
}

- (void)setHostedNotesAppearanceCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hostedNotesAppearanceCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedNotesAppearanceCoordinator, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_selectionStateController, 0);
  objc_storeStrong((id *)&self->_intentsInteractionController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_folderCreationController, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_mostRecentRegularWidthSelectedNoteObjectID, 0);
  objc_storeStrong((id *)&self->_mostRecentRegularWidthTagSelection, 0);
  objc_storeStrong((id *)&self->_mostRecentRegularWidthSelectedNoteBrowseContainerItemID, 0);
  objc_storeStrong((id *)&self->_columnVisibilityController, 0);
  objc_storeStrong((id *)&self->_trailingSidebarSplitViewController, 0);
  objc_storeStrong((id *)&self->_trailingSidebarContainerViewController, 0);
  objc_storeStrong((id *)&self->_compactNavigationController, 0);
  objc_storeStrong((id *)&self->_secondaryNavigationController, 0);
  objc_storeStrong((id *)&self->_supplementaryNavigationController, 0);
  objc_storeStrong((id *)&self->_primaryNavigationController, 0);
  objc_storeStrong((id *)&self->_primaryContainerViewController, 0);
  objc_storeStrong((id *)&self->_startupPresenter, 0);
  objc_storeStrong((id *)&self->_startupNavigationController, 0);
  objc_storeStrong((id *)&self->_selectedNewNoteShortcutItem, 0);
  objc_storeStrong((id *)&self->_currentAttachmentPresenter, 0);
  objc_storeStrong((id *)&self->_systemPaperViewController, 0);
  objc_storeStrong((id *)&self->_activityStreamNavigationController, 0);
  objc_storeStrong((id *)&self->_currentNoteBrowseViewController, 0);
  objc_storeStrong((id *)&self->_rootNoteBrowseViewController, 0);
  objc_storeStrong((id *)&self->_folderListViewController, 0);
  objc_storeStrong((id *)&self->_noteEditorViewController, 0);
  objc_storeStrong((id *)&self->_legacyNoteEditorViewController, 0);
  objc_storeStrong((id *)&self->_mainSplitViewController, 0);
  objc_storeStrong((id *)&self->_trailingSidebarViewController, 0);
  objc_storeStrong((id *)&self->_keyboardHandler, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_persistenceConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedSearchResult, 0);
  objc_storeStrong((id *)&self->_previousSelectedNoteObjectID, 0);
  objc_storeStrong((id *)&self->_mostRecentNonSearchContainerItemID, 0);
  objc_storeStrong((id *)&self->_activityStreamSelection, 0);
  objc_storeStrong((id *)&self->_focusedNoteObjectID, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
  objc_storeStrong((id *)&self->_selectedInvitationObjectID, 0);
  objc_storeStrong((id *)&self->_selectedNoteObjectID, 0);
  objc_storeStrong((id *)&self->_selectedNoteBrowseContainerItemID, 0);
}

+ (void)createDonationOf:(NSURL *)a3 transcript:(NSString *)a4 date:(NSDate *)a5 isFeedbackPositive:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSURL *v21;
  NSString *v22;
  NSDate *v23;
  uint64_t v24;
  uint64_t v25;

  v13 = sub_100012E18(&qword_1005D4680);
  __chkstk_darwin(v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject(&unk_100564FE0, 64, 7);
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_QWORD *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 40) = a6;
  *(_QWORD *)(v17 + 48) = v16;
  *(_QWORD *)(v17 + 56) = a1;
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject(&unk_100565008, 48, 7);
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1005D72A8;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject(&unk_100565030, 48, 7);
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1005D72B0;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = sub_1003439E8((uint64_t)v15, (uint64_t)&unk_1005D72B8, (uint64_t)v20);
  swift_release(v24);
}

+ (id)trimBuffer:(id)a3 toFrameLength:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  sub_1002AF41C(v5, v4);
  v7 = v6;

  return v7;
}

@end
