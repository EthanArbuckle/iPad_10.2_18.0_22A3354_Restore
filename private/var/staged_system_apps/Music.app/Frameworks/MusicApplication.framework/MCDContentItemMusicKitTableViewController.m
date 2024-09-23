@implementation MCDContentItemMusicKitTableViewController

- (MCDContentItemMusicKitTableViewController)initWithSectionItem:(id)a3 limitedUI:(BOOL)a4 radioDomain:(BOOL)a5
{
  _BOOL8 v6;
  id v9;
  MCDContentItemMusicKitTableViewController *v10;
  MCDContentItemMusicKitTableViewController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCDContentItemMusicKitTableViewController;
  v10 = -[MCDFuseTableViewController initWithLimitedUI:](&v15, "initWithLimitedUI:", v6);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentSection, a3);
    v11->_useRadioDomain = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    if (v12)
    {
      -[MCDContentItemMusicKitTableViewController setTitle:](v11, "setTitle:", v12);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemMusicKitTableViewController title](v11, "title"));
      -[MCDContentItemMusicKitTableViewController setTitle:](v11, "setTitle:", v13);

    }
    -[MCDContentItemMusicKitTableViewController setPlayActivityFeatureName:](v11, "setPlayActivityFeatureName:", CFSTR("grouping"));
  }

  return v11;
}

- (id)_contentManager
{
  __objc2_class *v3;
  id v4;
  void *v5;
  id v6;
  MCDBrowseItemsMusicKitContentManager *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  MCDBrowseItemsMusicKitContentManager *v11;

  if (-[MCDContentItemMusicKitTableViewController useRadioDomain](self, "useRadioDomain"))
    v3 = MCDRadioGenresDataSource;
  else
    v3 = MCDBrowseDataSource;
  v4 = [v3 alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemMusicKitTableViewController parentSection](self, "parentSection"));
  v6 = objc_msgSend(v4, "initWithParentSection:", v5);

  v7 = [MCDBrowseItemsMusicKitContentManager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController playbackManager](self, "playbackManager"));
  v9 = -[MCDTableViewController limitedUI](self, "limitedUI");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDContentItemMusicKitTableViewController contentResults](self, "contentResults"));
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
  v7.super_class = (Class)MCDContentItemMusicKitTableViewController;
  -[MCDFuseTableViewController viewDidLoad](&v7, "viewDidLoad");
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseTableViewController contentManager](self, "contentManager", _NSConcreteStackBlock, 3221225472, __56__MCDContentItemMusicKitTableViewController_viewDidLoad__block_invoke, &unk_1339168));
  objc_msgSend(v3, "setTableCellConfigurationBlock:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__MCDContentItemMusicKitTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t (*v43)(void);
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _Unwind_Exception *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  void *v61;

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
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "album"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "album"));
      objc_msgSend(v11, "configureWithAlbum:currentlyPlaying:artworkScale:", v21, objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v22), v19);
      goto LABEL_10;
    case 3uLL:
      v55 = v12;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "curator"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "shortName"));
      v27 = objc_msgSend(v26, "length");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "curator"));
      v29 = v28;
      if (v27)
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "shortName"));
      else
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
      v50 = (void *)v30;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v51, "setText:", v50);

      objc_msgSend(v11, "setAccessoryType:", 1);
      v12 = v55;
      break;
    case 4uLL:
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playlist"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playlist"));
      objc_msgSend(v11, "configureWithPlaylist:currentlyPlaying:artworkScale:showCurator:", v31, objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v32), 1, v19);

      break;
    case 5uLL:
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "radioStation"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "name"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v35, "setText:", v34);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "radioStation"));
      v37 = (char *)objc_msgSend(v36, "subtype");

      if (v37 == (_BYTE *)&dword_0 + 1)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "radioStation"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "editorNotes"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "detailTextLabel"));
        objc_msgSend(v40, "setText:", v39);

      }
      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "detailTextLabel"));
        objc_msgSend(v38, "setText:", 0);
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "radioStation"));
      v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "artworkCatalog"));
      v58 = 0;
      v59 = &v58;
      v60 = 0x2020000000;
      v43 = (uint64_t (*)(void))getMCDCarDisplayBundleSymbolLoc_ptr_8;
      v61 = getMCDCarDisplayBundleSymbolLoc_ptr_8;
      if (!getMCDCarDisplayBundleSymbolLoc_ptr_8)
      {
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = __getMCDCarDisplayBundleSymbolLoc_block_invoke_4;
        v57[3] = &unk_1339000;
        v57[4] = &v58;
        __getMCDCarDisplayBundleSymbolLoc_block_invoke_4((uint64_t)v57);
        v43 = (uint64_t (*)(void))v59[3];
      }
      v53 = v15;
      v54 = v41;
      v44 = (void *)v42;
      v56 = v12;
      _Block_object_dispose(&v58, 8);
      if (!v43)
      {
        v52 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
        _Block_object_dispose(&v58, 8);
        _Unwind_Resume(v52);
      }
      v45 = v43();
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "traitCollection"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CarDisplayRadioTab"), v46, v48));
      objc_msgSend(v11, "setArtworkCatalog:andScale:fallbackImage:", v44, v49, v19);

      v12 = v56;
      v15 = v53;
      break;
    case 7uLL:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "song"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "song"));
      objc_msgSend(v11, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", v21, objc_msgSend(WeakRetained, "_contentItemIsPlaying:", v22), 1, v19);
LABEL_10:

      break;
    default:
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
      objc_msgSend(v23, "setText:", 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "detailTextLabel"));
      objc_msgSend(v24, "setText:", 0);

      objc_msgSend(v11, "setAccessoryType:", 0);
      break;
  }

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

- (BOOL)useRadioDomain
{
  return self->_useRadioDomain;
}

- (void)setUseRadioDomain:(BOOL)a3
{
  self->_useRadioDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSection, 0);
  objc_storeStrong((id *)&self->_contentResults, 0);
}

@end
