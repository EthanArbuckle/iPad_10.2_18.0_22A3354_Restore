@implementation MCDRankedContentCell

- (MCDRankedContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCDRankedContentCell *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDRankedContentCell;
  v4 = -[_MCDReusableCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", 3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = sub_100035B60();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_updateNowPlayingView", v7, 0);

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
  v4.super_class = (Class)MCDRankedContentCell;
  -[MCDRankedContentCell dealloc](&v4, "dealloc");
}

- (void)_updateNowPlayingView
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  if (-[MCDRankedContentCell isCurrentlyPlaying](self, "isCurrentlyPlaying"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell viewWithTag:](self, "viewWithTag:", 1002));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nowPlayingContentManager"));
    v5 = objc_msgSend(v4, "playerState");

    v6 = objc_opt_class(_TtC5Music30CarPlayNowPlayingIndicatorView);
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      objc_msgSend(v7, "setIsPlaying:", v5 == (id)2);

  }
}

- (void)layoutSubviews
{
  id v3;
  unsigned int v4;
  UILabel *explicitLabel;
  id v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  unsigned int v10;
  UIImageView *favoriteIcon;
  id v12;
  UIImageView *v13;
  UIImageView *v14;
  void *v15;
  id v16;
  _TtC5Music30CarPlayNowPlayingIndicatorView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double y;
  double width;
  double height;
  CGFloat v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[5];
  id v57[5];
  id location;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  objc_super v65;
  CGRect v66;

  v65.receiver = self;
  v65.super_class = (Class)MCDRankedContentCell;
  -[MCDRankedContentCell layoutSubviews](&v65, "layoutSubviews");
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = -[MCDRankedContentCell isExplicitContent](self, "isExplicitContent");
  explicitLabel = self->_explicitLabel;
  if (v4)
  {
    if (!explicitLabel)
    {
      v6 = sub_100036720();
      v7 = (UILabel *)objc_claimAutoreleasedReturnValue(v6);
      v8 = self->_explicitLabel;
      self->_explicitLabel = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell contentView](self, "contentView"));
      objc_msgSend(v9, "addSubview:", self->_explicitLabel);

      explicitLabel = self->_explicitLabel;
    }
    -[UILabel setHidden:](explicitLabel, "setHidden:", 0);
    objc_msgSend(v3, "addObject:", self->_explicitLabel);
  }
  else
  {
    -[UILabel setHidden:](explicitLabel, "setHidden:", 1);
  }
  v10 = -[MCDRankedContentCell isFavorite](self, "isFavorite");
  favoriteIcon = self->_favoriteIcon;
  if (v10)
  {
    if (!favoriteIcon)
    {
      v12 = sub_100036860();
      v13 = (UIImageView *)objc_claimAutoreleasedReturnValue(v12);
      v14 = self->_favoriteIcon;
      self->_favoriteIcon = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell contentView](self, "contentView"));
      objc_msgSend(v15, "addSubview:", self->_favoriteIcon);

      favoriteIcon = self->_favoriteIcon;
    }
    -[UIImageView setHidden:](favoriteIcon, "setHidden:", 0);
    objc_msgSend(v3, "addObject:", self->_favoriteIcon);
  }
  else
  {
    -[UIImageView setHidden:](favoriteIcon, "setHidden:", 1);
  }
  -[_MCDReusableCell layoutBadges:](self, "layoutBadges:", v3);
  v16 = (id)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell viewWithTag:](self, "viewWithTag:", 1001));
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_100037E7C;
  v63 = sub_100037E8C;
  v64 = (id)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell artworkImageView](self, "artworkImageView"));
  v17 = (_TtC5Music30CarPlayNowPlayingIndicatorView *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell viewWithTag:](self, "viewWithTag:", 1002));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell contentView](self, "contentView"));
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  if (-[MCDRankedContentCell isCurrentlyPlaying](self, "isCurrentlyPlaying"))
  {
    objc_msgSend(v16, "removeFromSuperview");
    if (!v17)
    {
      v17 = objc_alloc_init(_TtC5Music30CarPlayNowPlayingIndicatorView);
      -[CarPlayNowPlayingIndicatorView setTag:](v17, "setTag:", 1002);
    }
    -[CarPlayNowPlayingIndicatorView frame](v17, "frame");
    y = v66.origin.y;
    width = v66.size.width;
    height = v66.size.height;
    v30 = CGRectGetWidth(v66);
    v31 = UIRectCenteredYInRect((36.0 - v30) * 0.5 + 4.0, y, width, height, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26);
    -[CarPlayNowPlayingIndicatorView setFrame:](v17, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v32, v31, v33, v34, v35, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26));
    -[MCDRankedContentCell addSubview:](self, "addSubview:", v17);
    -[MCDRankedContentCell _updateNowPlayingView](self, "_updateNowPlayingView");
  }
  else
  {
    -[CarPlayNowPlayingIndicatorView removeFromSuperview](v17, "removeFromSuperview");
    if (!v16)
    {
      v16 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
      objc_msgSend(v16, "setFont:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _labelColor](UIColor, "_labelColor"));
      objc_msgSend(v16, "setTextColor:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
      objc_msgSend(v16, "setHighlightedTextColor:", v38);

      objc_msgSend(v16, "setTag:", 1001);
    }
    v39 = objc_alloc_init((Class)NSNumberFormatter);
    objc_msgSend(v39, "setNumberStyle:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MCDRankedContentCell ranking](self, "ranking")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringFromNumber:", v40));
    objc_msgSend(v16, "setText:", v41);

    objc_msgSend(v16, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    v43 = UIRectCenteredYInRect(12.0, 0.0, 27.0, v42, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26);
    objc_msgSend(v16, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v44, v43, v45, v46, v47, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26));
    -[MCDRankedContentCell addSubview:](self, "addSubview:", v16);

  }
  if (-[MCDRankedContentCell isCurrentlyPlaying](self, "isCurrentlyPlaying")
    || (v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog")),
        v48,
        v48))
  {
    -[MCDRankedContentCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 87.0, 0.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog"));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog"));
      v51 = (objc_class *)objc_opt_class(self);
      v52 = NSStringFromClass(v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      objc_msgSend(v50, "setCacheIdentifier:forRequestingContext:", v53, self);

      objc_initWeak(&location, self);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog"));
      v55 = objc_loadWeakRetained(&location);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100037E94;
      v56[3] = &unk_1010A9720;
      objc_copyWeak(v57, &location);
      v56[4] = &v59;
      v57[1] = v20;
      v57[2] = v22;
      v57[3] = v24;
      v57[4] = v26;
      objc_msgSend(v54, "setDestination:configurationBlock:", v55, v56);

      objc_destroyWeak(v57);
      objc_destroyWeak(&location);
    }
    else
    {
      -[CarPlayNowPlayingIndicatorView removeFromSuperview](v17, "removeFromSuperview");
      objc_msgSend((id)v60[5], "removeFromSuperview");
    }
  }

  _Block_object_dispose(&v59, 8);
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

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCatalog, a3);
}

- (int64_t)ranking
{
  return self->_ranking;
}

- (void)setRanking:(int64_t)a3
{
  self->_ranking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingImageView, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);
  objc_storeStrong((id *)&self->_explicitLabel, 0);
}

- (void)configureWithSong:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 ranking:(int64_t)a6
{
  void *v6;
  _BOOL8 v8;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a4;
  v23 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "title"));
  v11 = objc_msgSend(v10, "length");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "title"));
  }
  else
  {
    v13 = sub_10003CCF4();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Title"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell textLabel](self, "textLabel"));
  objc_msgSend(v14, "setText:", v12);

  if (!v11)
  {

    v12 = v6;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "artist"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));

  if (objc_msgSend(v23, "shouldShowComposer"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "composer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "composer"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));

      v16 = (void *)v20;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v21, "setText:", v16);

  -[MCDRankedContentCell setExplicitContent:](self, "setExplicitContent:", objc_msgSend(v23, "isExplicitSong"));
  -[MCDRankedContentCell setFavorite:](self, "setFavorite:", objc_msgSend(v23, "isFavorite"));
  -[MCDRankedContentCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v8);
  -[MCDRankedContentCell setRanking:](self, "setRanking:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "artworkCatalog"));
  -[MCDRankedContentCell setArtworkCatalog:](self, "setArtworkCatalog:", v22);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
}

- (void)configureWithAlbum:(id)a3 currentlyPlaying:(BOOL)a4 artworkScale:(double)a5 ranking:(int64_t)a6
{
  void *v6;
  _BOOL8 v8;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a4;
  v19 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
  v11 = objc_msgSend(v10, "length");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
  }
  else
  {
    v13 = sub_10003CCF4();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Album"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell textLabel](self, "textLabel"));
  objc_msgSend(v14, "setText:", v12);

  if (!v11)
  {

    v12 = v6;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "artist"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v17, "setText:", v16);

  -[MCDRankedContentCell setFavorite:](self, "setFavorite:", objc_msgSend(v19, "isFavorite"));
  -[MCDRankedContentCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v8);
  -[MCDRankedContentCell setRanking:](self, "setRanking:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "artworkCatalog"));
  -[MCDRankedContentCell setArtworkCatalog:](self, "setArtworkCatalog:", v18);

  -[_MCDReusableCell setArtworkRadiusKind:](self, "setArtworkRadiusKind:", 0);
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell textLabel](self, "textLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell detailTextLabel](self, "detailTextLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell detailTextLabel](self, "detailTextLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = objc_msgSend(v3, "copy");

  return v12;
}

@end
