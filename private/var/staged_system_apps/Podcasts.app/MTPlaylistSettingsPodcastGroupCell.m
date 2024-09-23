@implementation MTPlaylistSettingsPodcastGroupCell

- (MTPlaylistSettingsPodcastGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTPlaylistSettingsPodcastGroupCell *v4;
  MTArtworkView *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTPlaylistSettingsPodcastGroupCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MTArtworkView);
    -[MTPlaylistSettingsPodcastGroupCell setArtworkView:](v4, "setArtworkView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell artworkView](v4, "artworkView"));
    objc_msgSend(v6, "addSubview:", v7);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double y;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double MinX;
  double v39;
  double MaxX;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat rect;
  CGFloat v51;
  double v52;
  double v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v54.receiver = self;
  v54.super_class = (Class)MTPlaylistSettingsPodcastGroupCell;
  -[MTTableViewCell layoutSubviews](&v54, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v48 = v5;
  v49 = v4;
  v47 = v6;
  rect = v7;

  v8 = -[MTPlaylistSettingsPodcastGroupCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[MTPlaylistSettingsPodcastGroupCell layoutMargins](self, "layoutMargins");
  v10 = v9;
  y = CGRectZero.origin.y;
  +[MTPlaylistSettingsViewController podcastImageSize](MTPlaylistSettingsViewController, "podcastImageSize");
  v13 = v12;
  v15 = v14;
  -[MTPlaylistSettingsPodcastGroupCell bounds](self, "bounds");
  v20 = IMRectCenteredYInRectScale(v10, y, v13, v15, v16, v17, v18, v19, 0.0);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell textLabel](self, "textLabel"));
  objc_msgSend(v27, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v55.origin.x = v20;
  v52 = v24;
  v53 = v22;
  v55.origin.y = v22;
  v55.size.width = v24;
  v55.size.height = v26;
  v34 = CGRectGetMaxX(v55) + 14.0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell textLabel](self, "textLabel"));
  objc_msgSend(v35, "frame");
  v37 = v31 - (v34 - v36);

  v56.origin.x = v34;
  v56.origin.y = v29;
  v56.size.width = v37;
  v56.size.height = v33;
  MinX = CGRectGetMinX(v56);
  v39 = MinX;
  if (v8 == (id)1)
  {
    v46 = MinX;
    v57.origin.x = v49;
    v57.origin.y = v48;
    v57.size.width = v47;
    v57.size.height = rect;
    v51 = v26;
    MaxX = CGRectGetMaxX(v57);
    v58.origin.x = v20;
    v58.origin.y = v53;
    v58.size.width = v52;
    v58.size.height = v51;
    v41 = MaxX - CGRectGetWidth(v58);
    v59.origin.x = v20;
    v59.origin.y = v53;
    v59.size.width = v52;
    v59.size.height = v51;
    v20 = v41 - CGRectGetMinX(v59);
    v60.origin.x = v49;
    v60.origin.y = v48;
    v39 = v46;
    v60.size.width = v47;
    v60.size.height = rect;
    v42 = CGRectGetMaxX(v60);
    v61.origin.x = v34;
    v61.origin.y = v29;
    v61.size.height = v33;
    v61.size.width = v37;
    v43 = v42 - CGRectGetWidth(v61);
    v62.origin.x = v34;
    v62.origin.y = v29;
    v62.size.height = v33;
    v62.size.width = v37;
    v34 = v43 - CGRectGetMinX(v62);
    v26 = v51;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell textLabel](self, "textLabel"));
  objc_msgSend(v44, "setFrame:", v34, v29, v37, v33);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell artworkView](self, "artworkView"));
  objc_msgSend(v45, "setFrame:", v20, v53, v52, v26);

  -[MTPlaylistSettingsPodcastGroupCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v39, 0.0, 0.0);
}

- (MTArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
