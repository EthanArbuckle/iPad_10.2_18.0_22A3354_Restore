@implementation MCDContentItemTableViewController

- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7
{
  return -[MCDContentItemTableViewController initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:musicKit:](self, "initWithSectionItem:limitedUI:showRankedList:queueListForPlayback:radioDomain:musicKit:", a3, a4, a5, a6, a7, 0);
}

- (MCDContentItemTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 showRankedList:(BOOL)a5 queueListForPlayback:(BOOL)a6 radioDomain:(BOOL)a7 musicKit:(BOOL)a8
{
  _BOOL8 v12;
  id v15;
  MCDContentItemTableViewController *v16;
  MCDContentItemTableViewController *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v12 = a4;
  v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCDContentItemTableViewController;
  v16 = -[MCDFuseTableViewController initWithLimitedUI:](&v21, "initWithLimitedUI:", v12);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parentSection, a3);
    v17->_displayRankings = a5;
    v17->_customListForPlayback = a6;
    v17->_useRadioDomain = a7;
    v17->_useMusicKit = a8;
    -[MCDContentItemTableViewController setPlayActivityFeatureName:](v17, "setPlayActivityFeatureName:", CFSTR("grouping"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
    if (v18)
    {
      -[MCDContentItemTableViewController setTitle:](v17, "setTitle:", v18);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemTableViewController title](v17, "title"));
      -[MCDContentItemTableViewController setTitle:](v17, "setTitle:", v19);

    }
  }

  return v17;
}

- (id)_contentManager
{
  __objc2_class *v3;
  id v4;
  void *v5;
  id v6;
  MCDBrowseItemsContentManager *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  MCDBrowseItemsContentManager *v11;

  if (-[MCDContentItemTableViewController useRadioDomain](self, "useRadioDomain"))
    v3 = MCDRadioGenresDataSource;
  else
    v3 = MCDBrowseDataSource;
  v4 = [v3 alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemTableViewController parentSection](self, "parentSection"));
  v6 = objc_msgSend(v4, "initWithParentSection:", v5);

  -[MCDContentItemTableViewController useMusicKit](self, "useMusicKit");
  v7 = [MCDBrowseItemsContentManager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v9 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemTableViewController contentResults](self, "contentResults"));
  v11 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:](v7, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:", v6, self, self, v8, v9, v10);

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDContentItemTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v7, "viewDidLoad");
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __48__MCDContentItemTableViewController_viewDidLoad__block_invoke, &unk_1339168));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__MCDContentItemTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  id WeakRetained;
  id v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  id v49;
  void *v50;
  void *v51;
  _Unwind_Exception *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  void *v58;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitCollection"));
  objc_msgSend(v17, "displayScale");
  v19 = v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  switch((unint64_t)objc_msgSend(v16, "itemType"))
  {
    case 1uLL:
      v21 = v12;
      v22 = objc_msgSend(WeakRetained, "displayRankings");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "album"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "album"));
      v25 = objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v24);
      if (v22)
        objc_msgSend(v11, "configureWithAlbum:currentlyPlaying:artworkScale:ranking:", v23, v25, (char *)objc_msgSend(v15, "row") + 1, v19);
      else
        objc_msgSend(v11, "configureWithAlbum:currentlyPlaying:artworkScale:", v23, v25, v19);
      goto LABEL_16;
    case 3uLL:
      v54 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "curator"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "shortName"));
      v30 = objc_msgSend(v29, "length");
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "curator"));
      v32 = v31;
      if (v30)
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "shortName"));
      else
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
      v50 = (void *)v33;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v51, "setText:", v50);

      objc_msgSend(v11, "setAccessoryType:", 1);
      goto LABEL_19;
    case 4uLL:
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playlist"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playlist"));
      objc_msgSend(v11, "configureWithPlaylist:currentlyPlaying:artworkScale:showCurator:", v34, objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v35), 1, v19);

      break;
    case 5uLL:
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "radioStation"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v38, "setText:", v37);

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "radioStation"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "artworkCatalog"));
      v55 = 0;
      v56 = &v55;
      v57 = 0x2020000000;
      v41 = getMCDCarDisplayBundleSymbolLoc_ptr_1;
      v58 = getMCDCarDisplayBundleSymbolLoc_ptr_1;
      if (!getMCDCarDisplayBundleSymbolLoc_ptr_1)
      {
        v42 = (void *)MusicCarDisplayUILibrary_1();
        v41 = dlsym(v42, "MCDCarDisplayBundle");
        v56[3] = (uint64_t)v41;
        getMCDCarDisplayBundleSymbolLoc_ptr_1 = v41;
      }
      v53 = v39;
      v54 = v12;
      _Block_object_dispose(&v55, 8);
      if (!v41)
      {
        v52 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
        _Block_object_dispose(&v55, 8);
        _Unwind_Resume(v52);
      }
      v43 = ((uint64_t (*)(void))v41)();
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "traitCollection"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CarDisplayRadioTab"), v44, v46));
      objc_msgSend(v11, "setArtworkCatalog:andScale:fallbackImage:", v40, v47, v19);

LABEL_19:
      v12 = v54;
      break;
    case 7uLL:
      v21 = v12;
      v48 = objc_msgSend(WeakRetained, "displayRankings");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "song"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "song"));
      v49 = objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v24);
      if (v48)
        objc_msgSend(v11, "configureWithSong:currentlyPlaying:artworkScale:ranking:", v23, v49, (char *)objc_msgSend(v15, "row") + 1, v19);
      else
        objc_msgSend(v11, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", v23, v49, 1, v19);
LABEL_16:

      v12 = v21;
      break;
    default:
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v26, "setText:", 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "detailTextLabel"));
      objc_msgSend(v27, "setText:", 0);

      objc_msgSend(v11, "setAccessoryType:", 0);
      break;
  }

}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6;
  MCDCuratedPlaylistsTableViewController *v7;
  void *v8;
  MCDCuratedPlaylistsTableViewController *v9;

  v6 = a4;
  if (objc_msgSend(v6, "itemType") == (char *)&dword_0 + 3)
  {
    v7 = [MCDCuratedPlaylistsTableViewController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "curator"));
    v9 = -[MCDCuratedPlaylistsTableViewController initWithCurator:limitedUI:](v7, "initWithCurator:limitedUI:", v8, -[MCDTableViewController limitedUI](self, "limitedUI"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MPSectionedCollection)contentResults
{
  return self->_contentResults;
}

- (void)setContentResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (MPModelStoreBrowseSection)parentSection
{
  return self->_parentSection;
}

- (void)setParentSection:(id)a3
{
  objc_storeStrong((id *)&self->_parentSection, a3);
}

- (BOOL)displayRankings
{
  return self->_displayRankings;
}

- (void)setDisplayRankings:(BOOL)a3
{
  self->_displayRankings = a3;
}

- (BOOL)customListForPlayback
{
  return self->_customListForPlayback;
}

- (void)setCustomListForPlayback:(BOOL)a3
{
  self->_customListForPlayback = a3;
}

- (BOOL)useRadioDomain
{
  return self->_useRadioDomain;
}

- (void)setUseRadioDomain:(BOOL)a3
{
  self->_useRadioDomain = a3;
}

- (BOOL)useMusicKit
{
  return self->_useMusicKit;
}

- (void)setUseMusicKit:(BOOL)a3
{
  self->_useMusicKit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSection, 0);
  objc_storeStrong((id *)&self->_contentResults, 0);
}

@end
