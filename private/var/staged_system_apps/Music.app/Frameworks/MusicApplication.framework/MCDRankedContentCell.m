@implementation MCDRankedContentCell

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
    v13 = soft_MCDCarDisplayBundle_0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Title"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
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
    v13 = soft_MCDCarDisplayBundle_0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Album"), &stru_13E1990, CFSTR("MusicCarDisplayUI")));
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

- (MCDRankedContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCDRankedContentCell *v4;
  void *v5;
  id MCDPlaybackStateChangedNotification;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDRankedContentCell;
  v4 = -[_MCDReusableCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", 3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    MCDPlaybackStateChangedNotification = getMCDPlaybackStateChangedNotification();
    v7 = (void *)objc_claimAutoreleasedReturnValue(MCDPlaybackStateChangedNotification);
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
  char *v5;
  uint64_t v6;
  id v7;

  if (-[MCDRankedContentCell isCurrentlyPlaying](self, "isCurrentlyPlaying"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell viewWithTag:](self, "viewWithTag:", 1002));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nowPlayingContentManager"));
    v5 = (char *)objc_msgSend(v4, "playerState");

    v6 = objc_opt_class(_TtC16MusicApplication30CarPlayNowPlayingIndicatorView);
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      objc_msgSend(v7, "setIsPlaying:", v5 == (_BYTE *)&dword_0 + 2);

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
  _TtC16MusicApplication30CarPlayNowPlayingIndicatorView *v17;
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
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[5];
  id v55[5];
  id location;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  objc_super v63;
  CGRect v64;

  v63.receiver = self;
  v63.super_class = (Class)MCDRankedContentCell;
  -[MCDRankedContentCell layoutSubviews](&v63, "layoutSubviews");
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = -[MCDRankedContentCell isExplicitContent](self, "isExplicitContent");
  explicitLabel = self->_explicitLabel;
  if (v4)
  {
    if (!explicitLabel)
    {
      v6 = MCDTableCellExplicitLabel();
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
      v12 = soft_MCDFavoriteIcon();
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
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__5;
  v61 = __Block_byref_object_dispose__5;
  v62 = (id)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell artworkImageView](self, "artworkImageView"));
  v17 = (_TtC16MusicApplication30CarPlayNowPlayingIndicatorView *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell viewWithTag:](self, "viewWithTag:", 1002));
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
      v17 = objc_alloc_init(_TtC16MusicApplication30CarPlayNowPlayingIndicatorView);
      -[CarPlayNowPlayingIndicatorView setTag:](v17, "setTag:", 1002);
    }
    -[CarPlayNowPlayingIndicatorView frame](v17, "frame");
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
    v30 = CGRectGetWidth(v64);
    v31 = UIRectCenteredYInRect((36.0 - v30) * 0.5 + 4.0, y, width, height, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26);
    -[CarPlayNowPlayingIndicatorView setFrame:](v17, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v31, v32, v33, v34, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26));
    -[MCDRankedContentCell addSubview:](self, "addSubview:", v17);
    -[MCDRankedContentCell _updateNowPlayingView](self, "_updateNowPlayingView");
  }
  else
  {
    -[CarPlayNowPlayingIndicatorView removeFromSuperview](v17, "removeFromSuperview");
    if (!v16)
    {
      v16 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
      objc_msgSend(v16, "setFont:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _labelColor](UIColor, "_labelColor"));
      objc_msgSend(v16, "setTextColor:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
      objc_msgSend(v16, "setHighlightedTextColor:", v37);

      objc_msgSend(v16, "setTag:", 1001);
    }
    v38 = objc_alloc_init((Class)NSNumberFormatter);
    objc_msgSend(v38, "setNumberStyle:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MCDRankedContentCell ranking](self, "ranking")));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringFromNumber:", v39));
    objc_msgSend(v16, "setText:", v40);

    objc_msgSend(v16, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    v42 = UIRectCenteredYInRect(12.0, 0.0, 27.0, v41, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26);
    objc_msgSend(v16, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v42, v43, v44, v45, *(double *)&v20, *(double *)&v22, *(double *)&v24, *(double *)&v26));
    -[MCDRankedContentCell addSubview:](self, "addSubview:", v16);

  }
  if (-[MCDRankedContentCell isCurrentlyPlaying](self, "isCurrentlyPlaying")
    || (v46 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog")),
        v46,
        v46))
  {
    -[MCDRankedContentCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 87.0, 0.0, 0.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog"));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog"));
      v49 = (objc_class *)objc_opt_class(self);
      v50 = NSStringFromClass(v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      objc_msgSend(v48, "setCacheIdentifier:forRequestingContext:", v51, self);

      objc_initWeak(&location, self);
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRankedContentCell artworkCatalog](self, "artworkCatalog"));
      v53 = objc_loadWeakRetained(&location);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = __38__MCDRankedContentCell_layoutSubviews__block_invoke;
      v54[3] = &unk_133A4C8;
      objc_copyWeak(v55, &location);
      v54[4] = &v57;
      v55[1] = v20;
      v55[2] = v22;
      v55[3] = v24;
      v55[4] = v26;
      objc_msgSend(v52, "setDestination:configurationBlock:", v53, v54);

      objc_destroyWeak(v55);
      objc_destroyWeak(&location);
    }
    else
    {
      -[CarPlayNowPlayingIndicatorView removeFromSuperview](v17, "removeFromSuperview");
      objc_msgSend((id)v58[5], "removeFromSuperview");
    }
  }

  _Block_object_dispose(&v57, 8);
}

void __38__MCDRankedContentCell_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v20;
  v6 = WeakRetained;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v20)
  {
    if (!v7)
    {
      v8 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 39.0, 0.0, 36.0, 36.0);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setTag:", 1000);
      v5 = v20;
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v7, "setImage:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setClipsToBounds:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_setContinuousCornerRadius:", 4.5);
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v11, "frame");
    v16 = UIRectCenteredYInRect(v12, v13, v14, v15, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(v11, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v16, v17, v18, v19, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72)));
    objc_msgSend(v6, "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
  else
  {
    objc_msgSend(v7, "removeFromSuperview");
  }

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

@end
