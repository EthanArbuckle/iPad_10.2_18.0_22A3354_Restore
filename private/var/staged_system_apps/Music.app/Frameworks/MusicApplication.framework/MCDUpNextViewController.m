@implementation MCDUpNextViewController

- (MCDUpNextViewController)initWithContentManager:(id)a3
{
  id v5;
  MCDUpNextViewController *v6;
  MCDUpNextViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDUpNextViewController;
  v6 = -[MCDTableViewController initWithLimitedUI:](&v9, "initWithLimitedUI:", objc_msgSend(v5, "limitedUI"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentManager, a3);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDUpNextViewController;
  -[MCDTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDNowPlayingContentManager tableView](self->_contentManager, "tableView"));
  objc_msgSend(v4, "_scrollToTopIfPossible:", 0);

}

- (void)viewDidLoad
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  MCDPlaybackManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCDUpNextViewController;
  -[MCDTableViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = _os_feature_enabled_impl("MediaPlayer", "QueueFA");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Queue");
  else
    v6 = CFSTR("Playing Next");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_13E1990, 0));
  -[MCDUpNextViewController setTitle:](self, "setTitle:", v7);

  -[MCDNowPlayingContentManager setTableCellConfigurationBlock:](self->_contentManager, "setTableCellConfigurationBlock:", &__block_literal_global_7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDUpNextViewController tableView](self, "tableView"));
  -[MCDNowPlayingContentManager setTableView:](self->_contentManager, "setTableView:", v8);

  v9 = -[MCDPlaybackManager initWithDelegate:]([MCDPlaybackManager alloc], "initWithDelegate:", self);
  -[MCDNowPlayingContentManager setPlaybackManager:](self->_contentManager, "setPlaybackManager:", v9);

}

void __38__MCDUpNextViewController_viewDidLoad__block_invoke(id a1, UITableViewCell *a2, MPModelObject *a3, UITableView *a4, MusicAttributionMetadata *a5)
{
  MPModelObject *v8;
  UITableView *v9;
  MPModelObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  UITableViewCell *v42;

  v42 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicAttributionMetadata artworkCatalog](a5, "artworkCatalog"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
  objc_msgSend(v13, "scale");
  -[UITableViewCell configureWithAttributionArtwork:artworkScale:](v42, "configureWithAttributionArtwork:artworkScale:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayApplicationCapabilitiesController sharedController](MusicCarPlayApplicationCapabilitiesController, "sharedController"));
  v15 = objc_msgSend(v14, "subscriptionCapabilities");

  switch((unint64_t)-[MPModelObject type](v10, "type"))
  {
    case 1uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject song](v10, "song"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "screen"));
      objc_msgSend(v18, "scale");
      v20 = v19;
      if ((v15 & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject song](v10, "song"));
        -[UITableViewCell configureWithSong:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", v16, 0, objc_msgSend(v21, "isLibraryAdded"), v20);
        goto LABEL_12;
      }
      -[UITableViewCell configureWithSong:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", v16, 0, 1, v19);
      goto LABEL_25;
    case 5uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlistEntry](v10, "playlistEntry"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "song"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlistEntry](v10, "playlistEntry"));
      v16 = v24;
      if (v23)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "song"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
        objc_msgSend(v25, "scale");
        v27 = v26;
        if ((v15 & 1) != 0)
        {
          -[UITableViewCell configureWithSong:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", v17, 0, 1, v26);
          goto LABEL_24;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlistEntry](v10, "playlistEntry"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "song"));
        -[UITableViewCell configureWithSong:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", v17, 0, objc_msgSend(v29, "isLibraryAdded"), v27);
        goto LABEL_23;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tvEpisode"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlistEntry](v10, "playlistEntry"));
      v16 = v35;
      if (v34)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "tvEpisode"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
        objc_msgSend(v25, "scale");
        v37 = v36;
        if ((v15 & 1) == 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlistEntry](v10, "playlistEntry"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "tvEpisode"));
          -[UITableViewCell configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:", v17, 0, objc_msgSend(v29, "isLibraryAdded"), v37);
LABEL_23:

          goto LABEL_24;
        }
        -[UITableViewCell configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:", v17, 0, 1, v36);
      }
      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "movie"));

        if (!v38)
          goto LABEL_27;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlistEntry](v10, "playlistEntry"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "movie"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
        objc_msgSend(v25, "scale");
        v40 = v39;
        if ((v15 & 1) == 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject playlistEntry](v10, "playlistEntry"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "movie"));
          -[UITableViewCell configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:", v17, 0, objc_msgSend(v29, "isLibraryAdded"), v40);
          goto LABEL_23;
        }
        -[UITableViewCell configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:", v17, 0, 1, v39);
      }
LABEL_24:

LABEL_25:
LABEL_26:

LABEL_27:
      if (-[UITableViewCell isContentUnavailable](v42, "isContentUnavailable"))
        v41 = 0;
      else
        v41 = 3;
      -[UITableViewCell setSelectionStyle:](v42, "setSelectionStyle:", v41);

      return;
    case 6uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject tvEpisode](v10, "tvEpisode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "screen"));
      objc_msgSend(v18, "scale");
      v31 = v30;
      if ((v15 & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject tvEpisode](v10, "tvEpisode"));
        -[UITableViewCell configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:", v16, 0, objc_msgSend(v21, "isLibraryAdded"), v31);
        goto LABEL_12;
      }
      -[UITableViewCell configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithTVEpisode:currentlyPlaying:artworkScale:contentAvailable:", v16, 0, 1, v30);
      goto LABEL_25;
    case 9uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject movie](v10, "movie"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "screen"));
      objc_msgSend(v18, "scale");
      v33 = v32;
      if ((v15 & 1) != 0)
      {
        -[UITableViewCell configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:", v16, 0, 1, v32);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject movie](v10, "movie"));
        -[UITableViewCell configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithMovie:currentlyPlaying:artworkScale:contentAvailable:", v16, 0, objc_msgSend(v21, "isLibraryAdded"), v33);
LABEL_12:

      }
      goto LABEL_25;
    default:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView window](v9, "window"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "screen"));
      objc_msgSend(v17, "scale");
      -[UITableViewCell configureWithSong:currentlyPlaying:artworkScale:contentAvailable:](v42, "configureWithSong:currentlyPlaying:artworkScale:contentAvailable:", 0, 0, 1);
      goto LABEL_26;
  }
}

- (BOOL)alwaysHideNowPlayingButton
{
  return 1;
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MCDUpNextViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (MCDNowPlayingContentManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_contentManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentManager, 0);
}

@end
