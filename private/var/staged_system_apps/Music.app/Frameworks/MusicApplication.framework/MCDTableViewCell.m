@implementation MCDTableViewCell

- (void)configureWithPlaylist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 showCurator:(BOOL)a6
{
  -[MCDTableViewCell configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:](self, "configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:", a3, 0, a4, a6, a5);
}

- (void)configureWithPlaylist:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 showCurator:(BOOL)a7
{
  -[MCDTableViewCell configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:contentAvailable:](self, "configureWithPlaylist:utterance:currentlyPlaying:artworkScale:showCurator:contentAvailable:", a3, a4, a5, a7, 1, a6);
}

- (void)configureWithPlaylist:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 showCurator:(BOOL)a7 contentAvailable:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL8 v11;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v32 = a3;
  v14 = a4;
  v15 = v14;
  if (v14 && objc_msgSend(v14, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v16, "setText:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v17, "setNumberOfLines:", 2);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v18, "setText:", 0);
LABEL_7:

    goto LABEL_8;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v20, "setText:", v19);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v18, "setNumberOfLines:", 1);

  if (objc_msgSend(v32, "type") == (char *)&dword_4 + 3 || objc_msgSend(v32, "type") == &dword_8)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastModifiedDateComponents"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastUpdatedDateString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v22, "setText:", v21);

    goto LABEL_7;
  }
  if (v9)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "curator"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  }
  else
  {
    v29 = 0;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v31, "setText:", v29);

  if (v9)
  {

    goto LABEL_7;
  }
LABEL_8:
  -[MCDTableViewCell setFavorite:](self, "setFavorite:", objc_msgSend(v32, "isFavorite"));
  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v11);
  -[MCDTableViewCell setContentUnavailable:](self, "setContentUnavailable:", !v8);
  v23 = (char *)objc_msgSend(v32, "type");
  if (v23 == (_BYTE *)&dword_0 + 1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "artworkCatalog"));
    v25 = objc_claimAutoreleasedReturnValue(+[UIImage smartPlaylistPlaceholder](UIImage, "smartPlaylistPlaceholder"));
LABEL_20:
    v30 = (void *)v25;
    -[MCDTableViewCell setArtworkCatalog:andScale:fallbackImage:](self, "setArtworkCatalog:andScale:fallbackImage:", v24, v25, a6);

    goto LABEL_21;
  }
  if (v23 == (_BYTE *)&dword_0 + 2)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "artworkCatalog"));
    v25 = objc_claimAutoreleasedReturnValue(+[UIImage geniusPlaylistPlaceholder](UIImage, "geniusPlaylistPlaceholder"));
    goto LABEL_20;
  }
  if (v23 != (_BYTE *)&dword_0 + 3)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "artworkCatalog"));
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2));
    v24 = v28;

    v25 = objc_claimAutoreleasedReturnValue(+[UIImage playlistPlaceholder](UIImage, "playlistPlaceholder"));
    goto LABEL_20;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage playlistFolderPlaceholder](UIImage, "playlistFolderPlaceholder"));
  -[MCDTableViewCell setPlaceholderImage:](self, "setPlaceholderImage:", v24);
LABEL_21:

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithArtist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
  -[MCDTableViewCell configureWithArtist:currentlyPlaying:artworkScale:contentAvailable:](self, "configureWithArtist:currentlyPlaying:artworkScale:contentAvailable:", a3, a4, 1, a5);
}

- (void)configureWithArtist:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  _BOOL8 v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a6;
  v9 = a4;
  v18 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  v12 = objc_msgSend(v11, "length");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  }
  else
  {
    v14 = soft_MCDCarDisplayBundle_0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ALBUM_ARTIST"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v15, "setText:", v13);

  if (!v12)
  {

    v13 = v6;
  }

  -[MCDTableViewCell setFavorite:](self, "setFavorite:", objc_msgSend(v18, "isFavorite"));
  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v9);
  -[MCDTableViewCell setContentUnavailable:](self, "setContentUnavailable:", !v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "artworkCatalog"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage artistPlaceholder](UIImage, "artistPlaceholder"));
  -[MCDTableViewCell setArtworkCatalog:andScale:fallbackImage:](self, "setArtworkCatalog:andScale:fallbackImage:", v16, v17, a5);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 1);
}

- (void)configureWithComposer:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name", a5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v8, "setText:", v7);

  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v5);
  -[MCDTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureWithAlbum:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
  -[MCDTableViewCell configureWithAlbum:utterance:currentlyPlaying:artworkScale:](self, "configureWithAlbum:utterance:currentlyPlaying:artworkScale:", a3, 0, a4, a5);
}

- (void)configureWithAlbum:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6
{
  -[MCDTableViewCell configureWithAlbum:utterance:currentlyPlaying:artworkScale:contentAvailable:](self, "configureWithAlbum:utterance:currentlyPlaying:artworkScale:contentAvailable:", a3, a4, a5, 1, a6);
}

- (void)configureWithAlbum:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6 contentAvailable:(BOOL)a7
{
  void *v7;
  _BOOL4 v8;
  _BOOL8 v10;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v8 = a7;
  v10 = a5;
  v29 = a3;
  v13 = a4;
  v14 = v13;
  if (v13 && objc_msgSend(v13, "length"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v15, "setText:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v16, "setNumberOfLines:", 2);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v17, "setText:", 0);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "title"));
    v19 = objc_msgSend(v18, "length");
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "title"));
    }
    else
    {
      v21 = soft_MCDCarDisplayBundle_0();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unknown Album"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v22, "setText:", v20);

    if (!v19)
    {

      v20 = v7;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v23, "setNumberOfLines:", 1);

    if (objc_msgSend(v29, "isCompilation"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Various Artists"), &stru_13E1990, 0));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "artist"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
    }
    v25 = (void *)v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v26, "setText:", v25);

  }
  -[MCDTableViewCell setFavorite:](self, "setFavorite:", objc_msgSend(v29, "isFavorite"));
  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v10);
  -[MCDTableViewCell setContentUnavailable:](self, "setContentUnavailable:", !v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "artworkCatalog"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.square.stack")));
  -[MCDTableViewCell setArtworkCatalog:andScale:fallbackImage:](self, "setArtworkCatalog:andScale:fallbackImage:", v27, v28, a6);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithSong:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  _BOOL8 v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a6;
  v9 = a4;
  v21 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
  v12 = objc_msgSend(v11, "length");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
  }
  else
  {
    v14 = soft_MCDCarDisplayBundle_0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Title"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v15, "setText:", v13);

  if (!v12)
  {

    v13 = v6;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "artist"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v18, "setText:", v17);

  -[MCDTableViewCell setExplicitContent:](self, "setExplicitContent:", objc_msgSend(v21, "isExplicitSong"));
  -[MCDTableViewCell setFavorite:](self, "setFavorite:", objc_msgSend(v21, "isFavorite"));
  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v9);
  -[MCDTableViewCell setContentUnavailable:](self, "setContentUnavailable:", !v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "artworkCatalog"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.note")));
  -[MCDTableViewCell setArtworkCatalog:andScale:fallbackImage:](self, "setArtworkCatalog:andScale:fallbackImage:", v19, v20, a5);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithGenre:(id)a3 artworkScale:(double)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v6, "setText:", v5);

  -[MCDTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureWithMovie:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  _BOOL8 v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a6;
  v9 = a4;
  v19 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
  v12 = objc_msgSend(v11, "length");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
  }
  else
  {
    v14 = soft_MCDCarDisplayBundle_0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Title"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v15, "setText:", v13);

  if (!v12)
  {

    v13 = v6;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v16, "setText:", 0);

  -[MCDTableViewCell setExplicitContent:](self, "setExplicitContent:", MPModelMovieIsRestricted(v19));
  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v9);
  -[MCDTableViewCell setContentUnavailable:](self, "setContentUnavailable:", !v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "artworkCatalog"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.note")));
  -[MCDTableViewCell setArtworkCatalog:andScale:fallbackImage:](self, "setArtworkCatalog:andScale:fallbackImage:", v17, v18, a5);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithTVEpisode:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 contentAvailable:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  _BOOL8 v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a6;
  v9 = a4;
  v21 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
  v12 = objc_msgSend(v11, "length");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
  }
  else
  {
    v14 = soft_MCDCarDisplayBundle_0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Title"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v15, "setText:", v13);

  if (!v12)
  {

    v13 = v6;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "show"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v18, "setText:", v17);

  -[MCDTableViewCell setExplicitContent:](self, "setExplicitContent:", MPModelTVEpisodeIsRestricted(v21));
  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v9);
  -[MCDTableViewCell setContentUnavailable:](self, "setContentUnavailable:", !v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "artworkCatalog"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.note")));
  -[MCDTableViewCell setArtworkCatalog:andScale:fallbackImage:](self, "setArtworkCatalog:andScale:fallbackImage:", v19, v20, a5);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithRadioStation:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5
{
  -[MCDTableViewCell configureWithRadioStation:utterance:currentlyPlaying:artworkScale:](self, "configureWithRadioStation:utterance:currentlyPlaying:artworkScale:", a3, 0, a4, a5);
  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithRadioStation:(id)a3 utterance:(id)a4 currentlyPlaying:(BOOL)a5 artworkScale:(double)a6
{
  void *v6;
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v8 = a5;
  v26 = a3;
  v11 = a4;
  v12 = v11;
  if (v11 && objc_msgSend(v11, "length"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v13, "setText:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v14, "setNumberOfLines:", 2);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v15, "setText:", 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
    v17 = objc_msgSend(v16, "length");
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
    }
    else
    {
      v19 = soft_MCDCarDisplayBundle_0();
      v6 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Title"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v20, "setText:", v18);

    if (!v17)
    {

      v18 = v6;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v21, "setNumberOfLines:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "shortEditorNotes"));
    v22 = v15;
    if (!v15)
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "editorNotes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v23, "setText:", v22);

    if (!v15)
  }

  -[MCDTableViewCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v8);
  -[MCDTableViewCell setContentUnavailable:](self, "setContentUnavailable:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "artworkCatalog"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("music.note")));
  -[MCDTableViewCell setArtworkCatalog:andScale:fallbackImage:](self, "setArtworkCatalog:andScale:fallbackImage:", v24, v25, a6);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithAttributionArtwork:(id)a3 artworkScale:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  UIImageView *v12;
  void *v13;
  double v14;
  double v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  UIImageView *v19;
  _QWORD v20[4];
  UIImageView *v21;

  v6 = a3;
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[MCDTableViewCell accessoryView](self, "accessoryView"));
    if (v7
      && (v8 = (void *)v7,
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell accessoryView](self, "accessoryView")),
          v10 = objc_opt_class(UIImageView),
          isKindOfClass = objc_opt_isKindOfClass(v9, v10),
          v9,
          v8,
          (isKindOfClass & 1) != 0))
    {
      v12 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell accessoryView](self, "accessoryView"));
    }
    else
    {
      v12 = objc_opt_new(UIImageView);
      -[UIImageView setFrame:](v12, "setFrame:", 0.0, 0.0, 30.0, 30.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v12, "layer"));
      objc_msgSend(v13, "setCornerRadius:", 15.0);

      -[UIImageView setClipsToBounds:](v12, "setClipsToBounds:", 1);
      -[MCDTableViewCell setAccessoryView:](self, "setAccessoryView:", v12);
    }
    -[UIImageView frame](v12, "frame");
    objc_msgSend(v6, "setFittingSize:", v14, v15);
    objc_msgSend(v6, "setDestinationScale:", a4);
    v16 = (objc_class *)objc_opt_class(self);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v6, "setCacheIdentifier:forRequestingContext:", v18, self);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __84__MCDTableViewCell_CellConfiguration__configureWithAttributionArtwork_artworkScale___block_invoke;
    v20[3] = &unk_1339728;
    v21 = v12;
    v19 = v12;
    objc_msgSend(v6, "setDestination:configurationBlock:", v19, v20);

  }
  else
  {
    -[MCDTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
  }

}

void **__84__MCDTableViewCell_CellConfiguration__configureWithAttributionArtwork_artworkScale___block_invoke(void **result, void *a2)
{
  if (result[4] == a2)
    return (void **)objc_msgSend(a2, "setImage:");
  return result;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](self, "textLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](self, "detailTextLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = objc_msgSend(v3, "copy");

  return v12;
}

- (MCDTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCDTableViewCell *v4;
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
  id MCDPlaybackStateChangedNotification;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MCDTableViewCell;
  v4 = -[_MCDReusableCell initWithStyle:reuseIdentifier:](&v21, "initWithStyle:reuseIdentifier:", 3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v6, "setFont:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _labelColor](UIColor, "_labelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v10, "setHighlightedTextColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](v4, "detailTextLabel"));
    objc_msgSend(v12, "setFont:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](v4, "detailTextLabel"));
    objc_msgSend(v14, "setTextColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell detailTextLabel](v4, "detailTextLabel"));
    objc_msgSend(v16, "setHighlightedTextColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    MCDPlaybackStateChangedNotification = getMCDPlaybackStateChangedNotification();
    v19 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaybackStateChangedNotification);
    objc_msgSend(v17, "addObserver:selector:name:object:", v4, "_updateNowPlayingView", v19, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MCDTableViewCell;
  -[MCDTableViewCell dealloc](&v4, "dealloc");
}

+ (id)cellForTableView:(id)a3 indexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MCDTableViewCell;
  v4 = objc_msgSendSuper2(&v8, "cellForTableView:indexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artworkImageView"));
  objc_msgSend(v6, "removeFromSuperview");

  return v5;
}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;
  UIImage *artworkImage;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    artworkImage = self->_artworkImage;
    self->_artworkImage = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_placeholderImage, a3);
    v5 = v7;
  }

}

- (void)setArtworkImage:(id)a3
{
  UIImage *v5;
  UIImage *placeholderImage;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_artworkImage != v5)
  {
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_artworkImage, a3);
    v5 = v7;
  }

}

- (UIActivityIndicatorView)activityIndicator
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;

  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 21);
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (void)setLoading:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell activityIndicator](self, "activityIndicator"));
    -[MCDTableViewCell setAccessoryView:](self, "setAccessoryView:", v4);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell activityIndicator](self, "activityIndicator"));
    objc_msgSend(v5, "startAnimating");
  }
  else
  {
    -[MCDTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell activityIndicator](self, "activityIndicator"));
    objc_msgSend(v5, "stopAnimating");
  }

}

- (void)setArtworkCatalog:(id)a3 andScale:(double)a4 fallbackImage:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v12 = v8;
    v10 = a5;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[MCDTableViewCell setArtworkCatalogs:andScale:fallbackImage:](self, "setArtworkCatalogs:andScale:fallbackImage:", v11, v10, a4, v12);

  }
  else
  {
    v11 = a5;
    -[MCDTableViewCell setArtworkCatalogs:andScale:fallbackImage:](self, "setArtworkCatalogs:andScale:fallbackImage:", 0, v11, a4);
  }

}

- (void)setArtworkCatalogs:(id)a3 andScale:(double)a4 fallbackImage:(id)a5
{
  id v9;
  NSArray *v10;
  char *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *artworkCatalogs;
  NSArray *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  BOOL v24;

  v18 = (NSArray *)a3;
  v9 = a5;
  v10 = v18;
  if (v18 || !v9)
  {
    if (v18)
      goto LABEL_7;
    -[MCDTableViewCell setArtworkImage:](self, "setArtworkImage:", 0);
  }
  else
  {
    -[MCDTableViewCell setPlaceholderImage:](self, "setPlaceholderImage:", v9);
  }
  v10 = 0;
LABEL_7:
  if (self->_artworkCatalogs != v10)
  {
    objc_storeStrong((id *)&self->_artworkCatalogs, a3);
    v11 = -[NSArray count](v18, "count");
    if (v11 == (_BYTE *)&dword_0 + 1)
      v12 = 0;
    else
      v12 = objc_opt_new(NSMutableArray);
    objc_storeStrong((id *)&self->_artworkImages, v12);
    if (v11 != (_BYTE *)&dword_0 + 1)

    -[_MCDReusableCell sizeForArtwork](self, "sizeForArtwork");
    v14 = v13;
    v16 = v15;
    -[MCDTableViewCell setPlaceholderImage:](self, "setPlaceholderImage:", v9);
    artworkCatalogs = self->_artworkCatalogs;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __62__MCDTableViewCell_setArtworkCatalogs_andScale_fallbackImage___block_invoke;
    v19[3] = &unk_133A4A0;
    v21 = v14;
    v22 = v16;
    v23 = a4;
    v19[4] = self;
    v24 = v11 == (_BYTE *)&dword_0 + 1;
    v20 = v9;
    -[NSArray enumerateObjectsUsingBlock:](artworkCatalogs, "enumerateObjectsUsingBlock:", v19);

  }
  -[MCDTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

void __62__MCDTableViewCell_setArtworkCatalogs_andScale_fallbackImage___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  char v12;

  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = a2;
  objc_msgSend(v5, "setFittingSize:", v3, v4);
  objc_msgSend(v5, "setDestinationScale:", *(double *)(a1 + 64));
  v6 = (objc_class *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setCacheIdentifier:forRequestingContext:", v8, *(_QWORD *)(a1 + 32));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __62__MCDTableViewCell_setArtworkCatalogs_andScale_fallbackImage___block_invoke_2;
  v10[3] = &unk_133A478;
  v12 = *(_BYTE *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v5, "setDestination:configurationBlock:", v9, v10);

}

void __62__MCDTableViewCell_setArtworkCatalogs_andScale_fallbackImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v7, "setArtworkImage:", v5);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artworkImages"));
      objc_msgSend(v6, "addObject:", v5);

    }
  }
  else
  {
    objc_msgSend(v7, "setPlaceholderImage:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_updateNowPlayingView
{
  void *v3;
  void *v4;
  char *v5;
  uint64_t v6;
  id v7;

  if (-[MCDTableViewCell isCurrentlyPlaying](self, "isCurrentlyPlaying"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell viewWithTag:](self, "viewWithTag:", 1002));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nowPlayingContentManager"));
    v5 = (char *)objc_msgSend(v4, "playerState");

    v6 = objc_opt_class(_TtC16MusicApplication30CarPlayNowPlayingIndicatorView);
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      objc_msgSend(v7, "setIsPlaying:", v5 == (_BYTE *)&dword_0 + 2);

  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImageView *favoriteIcon;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCDTableViewCell;
  -[_MCDReusableCell setHighlighted:animated:](&v12, "setHighlighted:animated:", a3, a4);
  if (-[MCDTableViewCell selectionStyle](self, "selectionStyle"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell artworkImageView](self, "artworkImageView"));
    objc_msgSend(v6, "setHighlighted:", v4);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell viewWithTag:](self, "viewWithTag:", 1002));
  v8 = objc_opt_class(_TtC16MusicApplication30CarPlayNowPlayingIndicatorView);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    objc_msgSend(v7, "setIsHighlighted:", v4);
  favoriteIcon = self->_favoriteIcon;
  if (v4)
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v11 = (void *)v10;
  -[UIImageView setTintColor:](favoriteIcon, "setTintColor:", v10);

}

- (void)setContentUnavailable:(BOOL)a3
{
  self->_contentUnavailable = a3;
  -[MCDTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 3);
}

- (void)layoutSubviews
{
  _BOOL8 v3;
  double v4;
  double ContentDisabledAlpha;
  void *v6;
  void *v7;
  double v8;
  id v9;
  unsigned int v10;
  UILabel *explicitLabel;
  id v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  unsigned int v16;
  UIImageView *favoriteIcon;
  id v18;
  UIImageView *v19;
  UIImageView *v20;
  void *v21;
  _TtC16MusicApplication30CarPlayNowPlayingIndicatorView *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)MCDTableViewCell;
  -[MCDTableViewCell layoutSubviews](&v31, "layoutSubviews");
  v3 = -[MCDTableViewCell isContentUnavailable](self, "isContentUnavailable");
  if (v3)
  {
    ContentDisabledAlpha = UIInterfaceGetContentDisabledAlpha(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell contentView](self, "contentView"));
    v7 = v6;
    v8 = ContentDisabledAlpha;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell contentView](self, "contentView"));
    v7 = v6;
    v8 = 1.0;
  }
  objc_msgSend(v6, "setAlpha:", v8);

  v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = -[MCDTableViewCell isExplicitContent](self, "isExplicitContent");
  explicitLabel = self->_explicitLabel;
  if (v10)
  {
    if (!explicitLabel)
    {
      v12 = MCDTableCellExplicitLabel();
      v13 = (UILabel *)objc_claimAutoreleasedReturnValue(v12);
      v14 = self->_explicitLabel;
      self->_explicitLabel = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell contentView](self, "contentView"));
      objc_msgSend(v15, "addSubview:", self->_explicitLabel);

      explicitLabel = self->_explicitLabel;
    }
    objc_msgSend(v9, "addObject:", explicitLabel);
  }
  else
  {
    -[UILabel setHidden:](self->_explicitLabel, "setHidden:", 1);
  }
  v16 = -[MCDTableViewCell isFavorite](self, "isFavorite");
  favoriteIcon = self->_favoriteIcon;
  if (v16)
  {
    if (!favoriteIcon)
    {
      v18 = soft_MCDFavoriteIcon();
      v19 = (UIImageView *)objc_claimAutoreleasedReturnValue(v18);
      v20 = self->_favoriteIcon;
      self->_favoriteIcon = v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell contentView](self, "contentView"));
      objc_msgSend(v21, "addSubview:", self->_favoriteIcon);

      favoriteIcon = self->_favoriteIcon;
    }
    objc_msgSend(v9, "addObject:", favoriteIcon);
  }
  else
  {
    -[UIImageView setHidden:](self->_favoriteIcon, "setHidden:", 1);
  }
  -[_MCDReusableCell layoutBadges:](self, "layoutBadges:", v9);
  v22 = (_TtC16MusicApplication30CarPlayNowPlayingIndicatorView *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell viewWithTag:](self, "viewWithTag:", 1002));
  if (!-[MCDTableViewCell isCurrentlyPlaying](self, "isCurrentlyPlaying"))
  {
    -[CarPlayNowPlayingIndicatorView removeFromSuperview](v22, "removeFromSuperview");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell artworkImage](self, "artworkImage"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell artworkImage](self, "artworkImage"));

      if (!v25)
        goto LABEL_26;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell artworkImage](self, "artworkImage"));
      v27 = +[MCDTableViewController addAlbumArtViewWithImage:radiusKind:toCell:](MCDTableViewController, "addAlbumArtViewWithImage:radiusKind:toCell:", v26, -[_MCDReusableCell artworkRadiusKind](self, "artworkRadiusKind"), self);
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell placeholderImage](self, "placeholderImage"));

      if (!v28)
      {
        +[MCDTableViewController removeImageFromCell:](MCDTableViewController, "removeImageFromCell:", self);
        goto LABEL_26;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableViewCell placeholderImage](self, "placeholderImage"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
      +[MCDTableViewController setPlaceholderImage:tintColor:highlightedTintColor:toCell:](MCDTableViewController, "setPlaceholderImage:tintColor:highlightedTintColor:toCell:", v26, v29, v30, self);

    }
    goto LABEL_26;
  }
  if (!v22)
    goto LABEL_18;
  v23 = objc_opt_class(_TtC16MusicApplication30CarPlayNowPlayingIndicatorView);
  if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
  {
    -[CarPlayNowPlayingIndicatorView removeFromSuperview](v22, "removeFromSuperview");

LABEL_18:
    v22 = objc_alloc_init(_TtC16MusicApplication30CarPlayNowPlayingIndicatorView);
    -[CarPlayNowPlayingIndicatorView setTag:](v22, "setTag:", 1002);
  }
  +[MCDTableViewController addLeadingView:toCell:](MCDTableViewController, "addLeadingView:toCell:", v22, self);
  -[MCDTableViewCell _updateNowPlayingView](self, "_updateNowPlayingView");
LABEL_26:

}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)isCurrentlyPlaying
{
  return self->_currentlyPlaying;
}

- (void)setCurrentlyPlaying:(BOOL)a3
{
  self->_currentlyPlaying = a3;
}

- (BOOL)isContentUnavailable
{
  return self->_contentUnavailable;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (NSMutableArray)artworkImages
{
  return self->_artworkImages;
}

- (void)setArtworkImages:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImages, a3);
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_artworkImages, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_artworkCatalogs, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);
  objc_storeStrong((id *)&self->_explicitLabel, 0);
}

@end
