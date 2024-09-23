@implementation ICNoteBrowseDataSource

- (ICNoteCoreDataIndexer)indexer
{
  uint64_t v3;
  ICNoteCoreDataIndexer *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = objc_opt_class(ICNoteCoreDataIndexer, a2);
  v9.receiver = self;
  v9.super_class = (Class)ICNoteBrowseDataSource;
  v4 = -[ICNoteBrowseDataSource indexer](&v9, "indexer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (ICNoteCoreDataIndexer *)v7;
}

- (ICNoteBrowseDataSource)initWithCollectionView:(id)a3 presentingViewController:(id)a4 noteContainerViewMode:(int64_t)a5 folderDataSource:(id)a6 persistenceConfiguration:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  UICollectionViewSupplementaryRegistration *v49;
  void *v50;
  uint64_t v51;
  UICollectionViewSupplementaryRegistration *v52;
  void *v53;
  id v54;
  _QWORD *v55;
  id v56;
  _QWORD *v57;
  ICNoteBrowseDataSource *v58;
  ICNoteBrowseDataSource *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  ICSelectorDelayer *v65;
  ICSelectorDelayer *lockedNotesMigratorDidMigrateNoteDelayer;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *noteMigrationObserver;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *editorExtensionDidSaveNotificationObserver;
  ICNoteBrowseDataSource *v76;
  _QWORD *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id *v84;
  id *v85;
  void *v86;
  void *v87;
  id *v88;
  id *v89;
  void *v90;
  void *v91;
  id obj;
  id v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  objc_super v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  _QWORD v114[4];
  id *v115;
  id v116;
  id v117;
  id *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  id v132;
  _QWORD v133[4];
  id v134;
  id v135;
  _QWORD v136[4];
  id v137;
  id v138;
  id v139;
  id v140;
  _QWORD v141[4];
  id v142[2];
  id from;
  id location[2];

  v12 = a3;
  v13 = a4;
  obj = a6;
  v14 = a7;
  v94 = v12;
  objc_initWeak(location, v12);
  objc_initWeak(&from, self);
  -[ICNoteBrowseDataSource setPersistenceConfiguration:](self, "setPersistenceConfiguration:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "legacyViewContext"));
  -[ICNoteBrowseDataSource setLegacyViewContext:](self, "setLegacyViewContext:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modernViewContext"));
  -[ICNoteBrowseDataSource setModernViewContext:](self, "setModernViewContext:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modernBackgroundContext"));
  -[ICNoteBrowseDataSource setModernBackgroundContext:](self, "setModernBackgroundContext:", v17);
  v87 = v14;

  v18 = objc_alloc((Class)ICNoteCoreDataIndexer);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource legacyViewContext](self, "legacyViewContext"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource modernBackgroundContext](self, "modernBackgroundContext"));
  v93 = objc_msgSend(v18, "initWithLegacyManagedObjectContext:modernManagedObjectContext:", v19, v20);

  v22 = objc_opt_class(ICOutlineParentCollectionViewCell, v21);
  v141[0] = _NSConcreteStackBlock;
  v141[1] = 3221225472;
  v141[2] = sub_100024D78;
  v141[3] = &unk_10054F958;
  v142[1] = (id)a5;
  objc_copyWeak(v142, &from);
  v23 = objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v22, v141));
  objc_initWeak(&v140, v13);
  v25 = objc_opt_class(ICFolderOutlineCollectionViewCell, v24);
  v136[0] = _NSConcreteStackBlock;
  v136[1] = 3221225472;
  v136[2] = sub_100024ECC;
  v136[3] = &unk_10054F980;
  objc_copyWeak(&v137, &from);
  objc_copyWeak(&v138, &v140);
  objc_copyWeak(&v139, location);
  v89 = (id *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v25, v136));
  v88 = (id *)v23;
  v91 = v13;
  v27 = objc_opt_class(ICNoteResultsListCollectionViewCell, v26);
  v133[0] = _NSConcreteStackBlock;
  v133[1] = 3221225472;
  v133[2] = sub_100025064;
  v133[3] = &unk_10054F9A8;
  objc_copyWeak(&v134, &from);
  objc_copyWeak(&v135, location);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v27, v133));
  v30 = (objc_class *)objc_opt_class(ICNoteResultsGalleryCollectionViewCell, v29);
  v31 = NSStringFromClass(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v32, 0));

  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v130[2] = sub_1000251C8;
  v130[3] = &unk_10054F9D0;
  objc_copyWeak(&v131, &from);
  objc_copyWeak(&v132, location);
  v90 = (void *)v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellNib:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellNib:configurationHandler:", v33, v130));
  v36 = (objc_class *)objc_opt_class(ICNoteBrowseGalleryFolderCollectionViewCell, v35);
  v37 = NSStringFromClass(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v38, 0));

  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_1000252CC;
  v127[3] = &unk_10054F9F8;
  objc_copyWeak(&v128, &from);
  objc_copyWeak(&v129, location);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellNib:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellNib:configurationHandler:", v39, v127));
  v42 = objc_opt_class(ICTagContainerCell, v41);
  v86 = (void *)v39;
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_1000253BC;
  v125[3] = &unk_10054FA88;
  objc_copyWeak(&v126, &from);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v42, v125));
  v44 = a5;
  v46 = objc_opt_class(ICTagDetailCell, v45);
  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472;
  v123[2] = sub_1000256B0;
  v123[3] = &unk_10054FB00;
  objc_copyWeak(&v124, &from);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v46, v123));
  v49 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(ICRecentlyDeletedHeaderView, v48), UICollectionElementKindSectionHeader, &stru_10054FB40);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v52 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(ICToolbarSummaryView, v51), UICollectionElementKindSectionFooter, &stru_10054FB80);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_100025AEC;
  v114[3] = &unk_10054FBA8;
  v85 = v88;
  v115 = v85;
  v83 = v43;
  v116 = v83;
  v82 = v47;
  v117 = v82;
  objc_copyWeak(&v122, &from);
  v84 = v89;
  v118 = v84;
  v80 = v40;
  v119 = v80;
  v54 = v28;
  v120 = v54;
  v81 = v34;
  v121 = v81;
  v55 = objc_retainBlock(v114);
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_100025CC0;
  v110[3] = &unk_10054FBD0;
  objc_copyWeak(&v113, &from);
  v79 = v50;
  v111 = v79;
  v56 = v53;
  v112 = v56;
  v57 = objc_retainBlock(v110);
  v109.receiver = self;
  v109.super_class = (Class)ICNoteBrowseDataSource;
  v58 = -[ICNoteBrowseDataSource initWithCollectionView:cellProvider:indexer:](&v109, "initWithCollectionView:cellProvider:indexer:", v94, v55, v93);
  v59 = v58;
  v61 = v90;
  v60 = v91;
  if (v58)
  {
    v78 = v57;
    objc_storeWeak((id *)&v58->_presentingViewController, v91);
    objc_storeWeak((id *)&v59->_folderDataSource, obj);
    v62 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_100025DF4;
    v107[3] = &unk_10054FBF8;
    objc_copyWeak(&v108, &from);
    objc_msgSend(v62, "setShouldExpandItemHandler:", v107);
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_100025E7C;
    v105[3] = &unk_10054FBF8;
    objc_copyWeak(&v106, &from);
    objc_msgSend(v62, "setShouldCollapseItemHandler:", v105);
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_100025F04;
    v103[3] = &unk_10054FC20;
    objc_copyWeak(&v104, &from);
    objc_msgSend(v62, "setWillExpandItemHandler:", v103);
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_100025FF0;
    v101[3] = &unk_10054FC20;
    objc_copyWeak(&v102, &from);
    objc_msgSend(v62, "setWillCollapseItemHandler:", v101);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource collectionViewDiffableDataSource](v59, "collectionViewDiffableDataSource"));
    objc_msgSend(v63, "setSectionSnapshotHandlers:", v62);

    -[ICNoteBrowseDataSource setSectionTypes:](v59, "setSectionTypes:", &off_10057C678);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource collectionViewDiffableDataSource](v59, "collectionViewDiffableDataSource"));
    objc_msgSend(v64, "setSupplementaryViewProvider:", v78);

    -[ICNoteBrowseDataSource setNoteContainerViewMode:](v59, "setNoteContainerViewMode:", v44);
    v65 = (ICSelectorDelayer *)objc_msgSend(objc_alloc((Class)ICSelectorDelayer), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v59, "reindexDataAnimatedYes", 1, 0, 0.3);
    lockedNotesMigratorDidMigrateNoteDelayer = v59->_lockedNotesMigratorDidMigrateNoteDelayer;
    v59->_lockedNotesMigratorDidMigrateNoteDelayer = v65;

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "crossProcessChangeCoordinator"));
    v69 = ICLockedNotesModeMigratorDidMigrateNoteNotification;
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_1000260DC;
    v98[3] = &unk_10054FC48;
    objc_copyWeak(&v99, location);
    objc_copyWeak(&v100, &from);
    v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "registerForCrossProcessNotificationName:block:", v69, v98));
    noteMigrationObserver = v59->_noteMigrationObserver;
    v59->_noteMigrationObserver = v70;

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "crossProcessChangeCoordinator"));
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_100026164;
    v95[3] = &unk_10054FC48;
    objc_copyWeak(&v96, location);
    objc_copyWeak(&v97, &from);
    v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "registerForEditorExtensionDidSaveNotificationWithBlock:", v95));
    editorExtensionDidSaveNotificationObserver = v59->_editorExtensionDidSaveNotificationObserver;
    v59->_editorExtensionDidSaveNotificationObserver = v74;

    objc_destroyWeak(&v97);
    objc_destroyWeak(&v96);
    objc_destroyWeak(&v100);
    objc_destroyWeak(&v99);
    objc_destroyWeak(&v102);
    objc_destroyWeak(&v104);
    objc_destroyWeak(&v106);
    objc_destroyWeak(&v108);

    v61 = v90;
    v60 = v91;
    v57 = v78;
  }
  v76 = v59;

  objc_destroyWeak(&v113);
  objc_destroyWeak(&v122);

  objc_destroyWeak(&v124);
  objc_destroyWeak(&v126);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&v128);

  objc_destroyWeak(&v132);
  objc_destroyWeak(&v131);

  objc_destroyWeak(&v135);
  objc_destroyWeak(&v134);

  objc_destroyWeak(&v139);
  objc_destroyWeak(&v138);
  objc_destroyWeak(&v137);
  objc_destroyWeak(&v140);

  objc_destroyWeak(v142);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v76;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "virtualSmartFolder"));

  return (ICVirtualSmartFolderItemIdentifier *)v3;
}

- (ICFolderCustomNoteSortType)sortType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortType"));

  return (ICFolderCustomNoteSortType *)v3;
}

- (BOOL)shouldIncludeSubfolders
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeSubfolders");

  return v3;
}

- (void)setShouldIncludeSubfolders:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeSubfolders:", v3);

}

- (void)setPersistenceConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceConfiguration, a3);
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  void *v5;

  if (self->_noteContainerViewMode != a3)
  {
    self->_noteContainerViewMode = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource collectionView](self, "collectionView"));
    objc_msgSend(v5, "setNoteContainerViewMode:", a3);

    -[ICNoteBrowseDataSource updateIndexerForCurrentNoteContainerViewMode](self, "updateIndexerForCurrentNoteContainerViewMode");
  }
}

- (void)setModernViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_modernViewContext, a3);
}

- (void)setModernBackgroundContext:(id)a3
{
  objc_storeStrong((id *)&self->_modernBackgroundContext, a3);
}

- (void)setLegacyViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_legacyViewContext, a3);
}

- (ICPersistenceConfiguration)persistenceConfiguration
{
  return self->_persistenceConfiguration;
}

- (ICNoteContainer)noteContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteContainer"));

  return (ICNoteContainer *)v3;
}

- (NoteCollectionObject)noteCollection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteCollection"));

  return (NoteCollectionObject *)v3;
}

- (NSManagedObjectContext)modernBackgroundContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource persistenceConfiguration](self, "persistenceConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modernBackgroundContext"));

  return (NSManagedObjectContext *)v3;
}

- (NSManagedObjectContext)legacyViewContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource persistenceConfiguration](self, "persistenceConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "legacyViewContext"));

  return (NSManagedObjectContext *)v3;
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource sortType](self, "sortType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v6, "setSortType:", v5);

  v7.receiver = self;
  v7.super_class = (Class)ICNoteBrowseDataSource;
  -[ICNoteBrowseDataSource applicationWillEnterForeground:](&v7, "applicationWillEnterForeground:", v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crossProcessChangeCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteMigrationObserver](self, "noteMigrationObserver"));
  objc_msgSend(v4, "removeCrossProcessNotificationObserver:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crossProcessChangeCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource editorExtensionDidSaveNotificationObserver](self, "editorExtensionDidSaveNotificationObserver"));
  objc_msgSend(v7, "removeCrossProcessNotificationObserver:", v8);

  v9.receiver = self;
  v9.super_class = (Class)ICNoteBrowseDataSource;
  -[ICNoteBrowseDataSource dealloc](&v9, "dealloc");
}

- (BOOL)shouldIncludeTags
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeTags");

  return v3;
}

- (void)setShouldIncludeTags:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeTags:", v3);

}

- (BOOL)shouldIncludeTagDetail
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeTagDetail");

  return v3;
}

- (void)setShouldIncludeTagDetail:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeTagDetail:", v3);

}

- (BOOL)shouldIncludeInvitations
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeInvitations");

  return v3;
}

- (void)setShouldIncludeInvitations:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeInvitations:", v3);

}

- (void)setNoteContainer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v5, "setNoteContainer:", v4);

  -[ICNoteBrowseDataSource updateIndexerForCurrentNoteContainerViewMode](self, "updateIndexerForCurrentNoteContainerViewMode");
}

- (void)setNoteCollection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v5, "setNoteCollection:", v4);

  -[ICNoteBrowseDataSource updateIndexerForCurrentNoteContainerViewMode](self, "updateIndexerForCurrentNoteContainerViewMode");
}

- (ICQuery)noteQuery
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteQuery"));

  return (ICQuery *)v3;
}

- (void)setNoteQuery:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v5, "setNoteQuery:", v4);

  -[ICNoteBrowseDataSource updateIndexerForCurrentNoteContainerViewMode](self, "updateIndexerForCurrentNoteContainerViewMode");
}

- (void)setVirtualSmartFolder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v5, "setVirtualSmartFolder:", v4);

  -[ICNoteBrowseDataSource updateIndexerForCurrentNoteContainerViewMode](self, "updateIndexerForCurrentNoteContainerViewMode");
}

- (void)setSortType:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[ICNoteBrowseDataSource updateIndexerForCurrentNoteContainerViewMode](self, "updateIndexerForCurrentNoteContainerViewMode");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v7, "setSortType:force:", v6, v4);

}

- (void)setSortType:(id)a3
{
  -[ICNoteBrowseDataSource setSortType:force:](self, "setSortType:force:", a3, 0);
}

- (int)dateHeadersType
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "dateHeadersType");

  return v3;
}

- (void)setDateHeadersType:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setDateHeadersType:", v3);

}

- (unint64_t)totalNoteCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "totalNoteCount");

  return (unint64_t)v3;
}

- (unint64_t)totalFolderCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "totalFolderCount");

  return (unint64_t)v3;
}

- (unint64_t)totalInvitationsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "totalInvitationsCount");

  return (unint64_t)v3;
}

- (BOOL)needsReindexWithCollectionDifference:(id)a3 controller:(id)a4 identifiersToReload:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  ICNoteBrowseDataSource *v23;
  uint64_t *v24;
  objc_super v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unsigned __int8 v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v25.receiver = self;
  v25.super_class = (Class)ICNoteBrowseDataSource;
  v29 = -[ICNoteBrowseDataSource needsReindexWithCollectionDifference:controller:identifiersToReload:](&v25, "needsReindexWithCollectionDifference:controller:identifiersToReload:", v8, v9, v10);
  if (*((_BYTE *)v27 + 24))
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
    v13 = objc_msgSend(v12, "isShowingDateHeaders");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "insertions"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "removals"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16));

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000268E4;
      v20[3] = &unk_10054FC98;
      v18 = v14;
      v21 = v18;
      v23 = self;
      v24 = &v26;
      v22 = v9;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v20);
      v11 = *((unsigned __int8 *)v27 + 24);

    }
    else
    {
      v11 = *((unsigned __int8 *)v27 + 24);
    }
  }
  _Block_object_dispose(&v26, 8);

  return v11 != 0;
}

- (NSManagedObjectContext)modernViewContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource persistenceConfiguration](self, "persistenceConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modernViewContext"));

  return (NSManagedObjectContext *)v3;
}

- (id)emptyConfigurationForNoteWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICNoteResultsCellConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL8 v27;
  ICNoteResultsCellConfiguration *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  if (objc_msgSend(v4, "ic_isModernNoteType"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource modernViewContext](self, "modernViewContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_existingObjectWithID:", v4));

    v7 = -[ICNoteResultsCellConfiguration initWithNote:]([ICNoteResultsCellConfiguration alloc], "initWithNote:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteContainer](self, "noteContainer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "customNoteSortType"));
    -[ICNoteResultsCellConfiguration setFolderNoteSortType:](v7, "setFolderNoteSortType:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource virtualSmartFolder](self, "virtualSmartFolder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
    -[ICNoteResultsCellConfiguration setShowParticipantsInfo:](v7, "setShowParticipantsInfo:", objc_msgSend(v11, "isEqual:", ICVirtualSmartFolderItemIdentifierTypeSharedWithYou));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource virtualSmartFolder](self, "virtualSmartFolder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "type"));
    v14 = objc_msgSend(v13, "isEqualToString:", ICVirtualSmartFolderItemIdentifierTypeSystemPaper);

    if (-[ICNoteBrowseDataSource shouldStyleForCalculator](self, "shouldStyleForCalculator") || (v14 & 1) != 0)
    {
      -[ICNoteResultsCellConfiguration setShowFolderName:](v7, "setShowFolderName:", 0);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteContainer](self, "noteContainer"));
      v16 = objc_opt_class(ICFolder);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v17 = objc_opt_class(ICFolder);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteContainer](self, "noteContainer"));
        v19 = ICDynamicCast(v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if ((objc_msgSend(v20, "isSmartFolder") & 1) != 0)
        {
          -[ICNoteResultsCellConfiguration setShowFolderName:](v7, "setShowFolderName:", 1);
        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteQuery](self, "noteQuery"));
          -[ICNoteResultsCellConfiguration setShowFolderName:](v7, "setShowFolderName:", v31 != 0);

        }
      }
      else
      {
        -[ICNoteResultsCellConfiguration setShowFolderName:](v7, "setShowFolderName:", 1);
      }

    }
    v32 = objc_opt_class(ICFolder);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteContainer](self, "noteContainer"));
    v34 = ICDynamicCast(v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[ICNoteResultsCellConfiguration setIsDisplayedInFolder:](v7, "setIsDisplayedInFolder:", v35 != 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource folderDataSource](self, "folderDataSource"));
    if ((unint64_t)objc_msgSend(v24, "countOfAllVisibleAccounts") >= 2)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteQuery](self, "noteQuery"));
      if (!v26)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource virtualSmartFolder](self, "virtualSmartFolder"));
        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource virtualSmartFolder](self, "virtualSmartFolder"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "accountObjectID"));
          -[ICNoteResultsCellConfiguration setShowAccountName:](v7, "setShowAccountName:", v38 == 0);

        }
        else
        {
          -[ICNoteResultsCellConfiguration setShowAccountName:](v7, "setShowAccountName:", 0);
        }

        goto LABEL_27;
      }
      v28 = v7;
      v27 = 1;
LABEL_21:
      -[ICNoteResultsCellConfiguration setShowAccountName:](v28, "setShowAccountName:", v27);
LABEL_27:

      goto LABEL_28;
    }
    goto LABEL_22;
  }
  if (objc_msgSend(v4, "ic_isLegacyNoteType"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource legacyViewContext](self, "legacyViewContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_existingObjectWithID:", v4));

    v7 = -[ICNoteResultsCellConfiguration initWithNote:]([ICNoteResultsCellConfiguration alloc], "initWithNote:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteCollection](self, "noteCollection"));
    v23 = objc_opt_class(NoteAccountObject);
    -[ICNoteResultsCellConfiguration setShowFolderName:](v7, "setShowFolderName:", objc_opt_isKindOfClass(v22, v23) & 1);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteCollection](self, "noteCollection"));
    v25 = objc_opt_class(NoteAccountObject);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource folderDataSource](self, "folderDataSource"));
      v27 = (unint64_t)objc_msgSend(v26, "countOfAllVisibleAccounts") > 1;
      v28 = v7;
      goto LABEL_21;
    }
LABEL_22:
    -[ICNoteResultsCellConfiguration setShowAccountName:](v7, "setShowAccountName:", 0);
LABEL_28:

    -[ICNoteResultsCellConfiguration setHideThumbnailImage:](v7, "setHideThumbnailImage:", -[ICNoteBrowseDataSource isTrashFolder](self, "isTrashFolder"));
    goto LABEL_29;
  }
  if (objc_msgSend(v4, "ic_isInvitationType"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource modernViewContext](self, "modernViewContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ic_existingObjectWithID:", v4));

    v7 = -[ICNoteResultsCellConfiguration initWithInvitation:]([ICNoteResultsCellConfiguration alloc], "initWithInvitation:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource folderDataSource](self, "folderDataSource"));
    -[ICNoteResultsCellConfiguration setShowAccountName:](v7, "setShowAccountName:", (unint64_t)objc_msgSend(v30, "countOfAllVisibleAccounts") > 1);

    -[ICNoteResultsCellConfiguration setShowFolderName:](v7, "setShowFolderName:", 0);
LABEL_29:

    goto LABEL_30;
  }
  v7 = 0;
LABEL_30:

  return v7;
}

- (void)updateIndexerForCurrentNoteContainerViewMode
{
  unint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = -[ICNoteBrowseDataSource pinnedNotesSectionMinimumCount](self, "pinnedNotesSectionMinimumCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setPinnedNotesSectionMinimumCount:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v5, "setShouldIncludeOutlineParentItems:", 1);

  v6 = -[ICNoteBrowseDataSource noteContainerViewMode](self, "noteContainerViewMode") == 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "folderIndexer"));
  objc_msgSend(v8, "setShouldIncludeSubfolders:", v6);

  if ((id)-[ICNoteBrowseDataSource noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
    v9 = 3;
  else
    v9 = 0;
  -[ICNoteBrowseDataSource setAutoExpandMode:](self, "setAutoExpandMode:", v9);
}

- (BOOL)isTrashFolder
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteContainer](self, "noteContainer"));
  if ((objc_msgSend(v3, "isTrashFolder") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource virtualSmartFolder](self, "virtualSmartFolder"));
    v4 = objc_msgSend(v5, "isTrashFolder");

  }
  return v4;
}

- (unint64_t)pinnedNotesSectionMinimumCount
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  int64_t v8;
  NSObject *v9;

  if (-[ICNoteBrowseDataSource isTrashFolder](self, "isTrashFolder"))
    return -1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteContainer](self, "noteContainer"));
  if (objc_msgSend(v4, "isShowingDateHeaders"))
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource virtualSmartFolder](self, "virtualSmartFolder"));
  if (objc_msgSend(v5, "isShowingDateHeaders"))
  {

LABEL_6:
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  v7 = objc_msgSend(v6, "isShowingDateHeaders");

  if ((v7 & 1) != 0)
    return 1;
  v8 = -[ICNoteBrowseDataSource noteContainerViewMode](self, "noteContainerViewMode");
  switch(v8)
  {
    case -1:
      v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        sub_100403A44(v9);

      return 1;
    case 0:
      return 1;
    case 1:
      return 5;
    default:
      return 0;
  }
}

- (void)reindexDataAnimatedYes
{
  -[ICNoteBrowseDataSource reindexDataAnimated:](self, "reindexDataAnimated:", 1);
}

- (BOOL)shouldStyleForCalculator
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource collectionView](self, "collectionView"));
  v3 = objc_msgSend(v2, "ic_behavior") == (id)1;

  return v3;
}

- (void)accountHidesNotesInCustomFoldersDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v22.receiver = self;
  v22.super_class = (Class)ICNoteBrowseDataSource;
  -[ICNoteBrowseDataSource accountHidesNotesInCustomFoldersDidChange:](&v22, "accountHidesNotesInCustomFoldersDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource noteContainer](self, "noteContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource indexer](self, "indexer"));
  objc_msgSend(v5, "setNoteContainer:", v4);

  -[ICNoteBrowseDataSource reloadDataAnimated:](self, "reloadDataAnimated:", 1);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource collectionView](self, "collectionView", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForVisibleItems"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(ICFolderOutlineCollectionViewCell);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource collectionView](self, "collectionView"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v12));
        v16 = ICDynamicCast(v13, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        objc_msgSend(v17, "updateNoteCount");
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v5 = objc_opt_class(ICNoteLockManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = ICCheckedDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updatedNote"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updatedNote"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource associatedCellsForItemIdentifiers:](self, "associatedCellsForItemIdentifiers:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updatedNote"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseDataSource emptyConfigurationForNoteWithObjectID:](self, "emptyConfigurationForNoteWithObjectID:", v16));
    v18 = objc_opt_class(ICNoteResultsListCollectionViewCell);
    v19 = ICDynamicCast(v18, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v20, "setConfiguration:", v17);

  }
  v21.receiver = self;
  v21.super_class = (Class)ICNoteBrowseDataSource;
  -[ICNoteBrowseDataSource noteLockManagerDidToggleLock:](&v21, "noteLockManagerDidToggleLock:", v4);

}

- (id)unsupportedFolderInfoButtonTapHandler
{
  return self->_unsupportedFolderInfoButtonTapHandler;
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (id)tagSelectionDidChangeHandler
{
  return self->_tagSelectionDidChangeHandler;
}

- (void)setTagSelectionDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICFolderDataSource)folderDataSource
{
  return (ICFolderDataSource *)objc_loadWeakRetained((id *)&self->_folderDataSource);
}

- (ICNAViewController)presentingViewController
{
  return (ICNAViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICSelectorDelayer)lockedNotesMigratorDidMigrateNoteDelayer
{
  return self->_lockedNotesMigratorDidMigrateNoteDelayer;
}

- (NSObject)noteMigrationObserver
{
  return self->_noteMigrationObserver;
}

- (void)setNoteMigrationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_noteMigrationObserver, a3);
}

- (NSObject)editorExtensionDidSaveNotificationObserver
{
  return self->_editorExtensionDidSaveNotificationObserver;
}

- (void)setEditorExtensionDidSaveNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_editorExtensionDidSaveNotificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorExtensionDidSaveNotificationObserver, 0);
  objc_storeStrong((id *)&self->_noteMigrationObserver, 0);
  objc_storeStrong((id *)&self->_lockedNotesMigratorDidMigrateNoteDelayer, 0);
  objc_storeStrong((id *)&self->_persistenceConfiguration, 0);
  objc_storeStrong((id *)&self->_modernBackgroundContext, 0);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_folderDataSource);
  objc_storeStrong(&self->_tagSelectionDidChangeHandler, 0);
  objc_storeStrong(&self->_unsupportedFolderInfoButtonTapHandler, 0);
}

@end
