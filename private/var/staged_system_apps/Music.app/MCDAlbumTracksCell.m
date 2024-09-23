@implementation MCDAlbumTracksCell

- (MCDAlbumTracksCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCDAlbumTracksCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *trackNumberLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  UILabel *explicitLabel;
  void *v20;
  id v21;
  uint64_t v22;
  UIImageView *favoriteIcon;
  void *v24;
  _TtC5Music30CarPlayNowPlayingIndicatorView *v25;
  UIView *currentlyPlayingView;
  void *v27;
  id v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)MCDAlbumTracksCell;
  v4 = -[_MCDReusableCell initWithStyle:reuseIdentifier:](&v31, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](v4, "textLabel"));
    objc_msgSend(v6, "setFont:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](v4, "textLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](v4, "textLabel"));
    objc_msgSend(v10, "setHighlightedTextColor:", v9);

    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    trackNumberLabel = v4->_trackNumberLabel;
    v4->_trackNumberLabel = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    -[UILabel setFont:](v4->_trackNumberLabel, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
    -[UILabel setTextColor:](v4->_trackNumberLabel, "setTextColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor"));
    -[UILabel setHighlightedTextColor:](v4->_trackNumberLabel, "setHighlightedTextColor:", v15);

    -[UILabel setTextAlignment:](v4->_trackNumberLabel, "setTextAlignment:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell contentView](v4, "contentView"));
    objc_msgSend(v16, "addSubview:", v4->_trackNumberLabel);

    v17 = sub_100036720();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    explicitLabel = v4->_explicitLabel;
    v4->_explicitLabel = (UILabel *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell contentView](v4, "contentView"));
    objc_msgSend(v20, "addSubview:", v4->_explicitLabel);

    v21 = sub_100036860();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    favoriteIcon = v4->_favoriteIcon;
    v4->_favoriteIcon = (UIImageView *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell contentView](v4, "contentView"));
    objc_msgSend(v24, "addSubview:", v4->_favoriteIcon);

    v25 = objc_alloc_init(_TtC5Music30CarPlayNowPlayingIndicatorView);
    currentlyPlayingView = v4->_currentlyPlayingView;
    v4->_currentlyPlayingView = &v25->super;

    -[UIView setTag:](v4->_currentlyPlayingView, "setTag:", 1002);
    -[MCDAlbumTracksCell addSubview:](v4, "addSubview:", v4->_currentlyPlayingView);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v28 = sub_100035B60();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v27, "addObserver:selector:name:object:", v4, "_updateNowPlayingView", v29, 0);

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
  v4.super_class = (Class)MCDAlbumTracksCell;
  -[MCDAlbumTracksCell dealloc](&v4, "dealloc");
}

- (void)_updateNowPlayingView
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell viewWithTag:](self, "viewWithTag:", 1002));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MusicCarPlayManager sharedManager](MusicCarPlayManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nowPlayingContentManager"));
  v5 = objc_msgSend(v4, "playerState");

  v6 = objc_opt_class(_TtC5Music30CarPlayNowPlayingIndicatorView);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    v7 = -[MCDAlbumTracksCell isCurrentlyPlaying](self, "isCurrentlyPlaying");
    if (v5 == (id)2)
      v8 = v7;
    else
      v8 = 0;
    objc_msgSend(v9, "setIsPlaying:", v8);
  }

}

- (void)configureWithAlbumTrack:(id)a3 currentlyPlaying:(BOOL)a4 album:(id)a5 contentAvailable:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _Unwind_Exception *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;

  v7 = a6;
  v9 = a4;
  v11 = a3;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  v14 = v13;
  if (!v13)
  {
    v15 = sub_1000357A4();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unknown Title"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](self, "textLabel"));
  objc_msgSend(v16, "setText:", v14);

  if (!v13)
  {

  }
  if (objc_msgSend(v11, "trackNumber"))
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "trackNumber")));
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v18 = off_1011ECEC0;
    v26 = off_1011ECEC0;
    if (!off_1011ECEC0)
    {
      v19 = (void *)sub_1000380E0();
      v18 = dlsym(v19, "MCDFormattedNumberString");
      v24[3] = (uint64_t)v18;
      off_1011ECEC0 = v18;
    }
    _Block_object_dispose(&v23, 8);
    if (!v18)
    {
      v22 = (_Unwind_Exception *)sub_100DE9368();
      _Block_object_dispose(&v23, 8);
      _Unwind_Resume(v22);
    }
    v20 = ((uint64_t (*)(id))v18)(v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    -[UILabel setText:](self->_trackNumberLabel, "setText:", v21, v23);
  }
  -[MCDAlbumTracksCell setContentUnavailable:](self, "setContentUnavailable:", !v7);
  -[MCDAlbumTracksCell setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v9);
  -[MCDAlbumTracksCell setExplicitContent:](self, "setExplicitContent:", objc_msgSend(v11, "isExplicitSong"));
  -[MCDAlbumTracksCell setFavorite:](self, "setFavorite:", objc_msgSend(v11, "isFavorite"));

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIView *currentlyPlayingView;
  UIView *v7;
  UIView *v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCDAlbumTracksCell;
  -[_MCDReusableCell setHighlighted:animated:](&v10, "setHighlighted:animated:", a3, a4);
  currentlyPlayingView = self->_currentlyPlayingView;
  if (currentlyPlayingView)
    v7 = currentlyPlayingView;
  else
    v7 = (UIView *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell viewWithTag:](self, "viewWithTag:", 1002));
  v8 = v7;
  v9 = objc_opt_class(_TtC5Music30CarPlayNowPlayingIndicatorView);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    -[UIView setIsHighlighted:](v8, "setIsHighlighted:", v4);

}

- (double)horizontalMargin
{
  return 12.0;
}

- (void)layoutSubviews
{
  double ContentDisabledAlpha;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;
  CGFloat y;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  float v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  uint64_t v57;
  id v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double MidX;
  CGFloat v68;
  double MidY;
  double v70;
  double v71;
  objc_super v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v72.receiver = self;
  v72.super_class = (Class)MCDAlbumTracksCell;
  -[MCDAlbumTracksCell layoutSubviews](&v72, "layoutSubviews");
  if (-[MCDAlbumTracksCell isContentUnavailable](self, "isContentUnavailable"))
  {
    ContentDisabledAlpha = UIInterfaceGetContentDisabledAlpha();
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell contentView](self, "contentView"));
    v5 = v4;
    v6 = ContentDisabledAlpha;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell contentView](self, "contentView"));
    v5 = v4;
    v6 = 1.0;
  }
  objc_msgSend(v4, "setAlpha:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell contentView](self, "contentView"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = -[MCDAlbumTracksCell isCurrentlyPlaying](self, "isCurrentlyPlaying");
  -[UIView setHidden:](self->_currentlyPlayingView, "setHidden:", v16 ^ 1);
  -[UILabel setHidden:](self->_trackNumberLabel, "setHidden:", v16);
  y = CGRectZero.origin.y;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_trackNumberLabel, "font"));
  objc_msgSend(v18, "lineHeight");
  v20 = v19;
  v71 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](self, "textLabel"));
  v22 = objc_msgSend(v21, "frame");
  v70 = v9;
  v23 = v11;
  MPURectByRemovingUserInterfaceLayoutDirectionInRect(v22, v24, v25, v26, v27, v9, v11, v13, v15);

  v73.origin.x = 12.0;
  v73.size.width = 21.0;
  v73.origin.y = y;
  v73.size.height = v20;
  v28 = CGRectGetMaxX(v73) + 12.0;
  v29 = floorf(v28);
  v30 = v13;
  v31 = v13 - (v29 + 12.0);
  v32 = floorf(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](self, "textLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "font"));
  objc_msgSend(v34, "lineHeight");
  v36 = v35;

  v37 = (v15 - v36) * 0.5;
  v38 = floorf(v37);
  v39 = v9;
  v40 = v30;
  v42 = MPURectByApplyingUserInterfaceLayoutDirectionInRect(v41, v29, v38, v32, v36, v39, v23, v30, v15);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](self, "textLabel"));
  objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](self, "textLabel"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "font"));
  objc_msgSend(v51, "ascender");
  v53 = v52 + v38;

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_trackNumberLabel, "font"));
  objc_msgSend(v54, "ascender");
  *(float *)&v55 = v53 - v55;
  v56 = floorf(*(float *)&v55);

  -[UILabel setFrame:](self->_trackNumberLabel, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v57, 12.0, v56, 21.0, v71, v70, v23, v40, v15));
  v58 = objc_alloc_init((Class)NSMutableArray);
  if (-[MCDAlbumTracksCell isExplicitContent](self, "isExplicitContent"))
    objc_msgSend(v58, "addObject:", self->_explicitLabel);
  else
    -[UILabel setHidden:](self->_explicitLabel, "setHidden:", 1);
  if (-[MCDAlbumTracksCell isFavorite](self, "isFavorite", *(_QWORD *)&v70))
    objc_msgSend(v58, "addObject:", self->_favoriteIcon);
  else
    -[UIImageView setHidden:](self->_favoriteIcon, "setHidden:", 1);
  -[_MCDReusableCell layoutBadges:](self, "layoutBadges:", v58);
  -[UIView frame](self->_currentlyPlayingView, "frame");
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v66 = v65;
  -[UILabel frame](self->_trackNumberLabel, "frame");
  MidX = CGRectGetMidX(v74);
  v75.origin.x = v60;
  v75.origin.y = v62;
  v75.size.width = v64;
  v75.size.height = v66;
  v68 = MidX - CGRectGetWidth(v75) * 0.5;
  -[MCDAlbumTracksCell bounds](self, "bounds");
  MidY = CGRectGetMidY(v76);
  v77.origin.x = v68;
  v77.origin.y = v62;
  v77.size.width = v64;
  v77.size.height = v66;
  -[UIView setFrame:](self->_currentlyPlayingView, "setFrame:", v68, MidY - CGRectGetHeight(v77) * 0.5, v64, v66);
  -[MCDAlbumTracksCell _updateNowPlayingView](self, "_updateNowPlayingView");

}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](self, "textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell title](self, "title"));
  v5 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell textLabel](self, "textLabel"));
    objc_msgSend(v6, "setText:", v7);

    -[MCDAlbumTracksCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)trackNumberText
{
  return -[UILabel text](self->_trackNumberLabel, "text");
}

- (void)setTrackNumberText:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlbumTracksCell trackNumberText](self, "trackNumberText"));
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_trackNumberLabel, "setText:", v6);
    -[MCDAlbumTracksCell setNeedsLayout](self, "setNeedsLayout");
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

- (BOOL)isContentUnavailable
{
  return self->_contentUnavailable;
}

- (void)setContentUnavailable:(BOOL)a3
{
  self->_contentUnavailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPlayingView, 0);
  objc_storeStrong((id *)&self->_favoriteIcon, 0);
  objc_storeStrong((id *)&self->_explicitLabel, 0);
  objc_storeStrong((id *)&self->_trackNumberLabel, 0);
}

@end
