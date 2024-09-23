@implementation MTEpisodeDownloadCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (void)configureSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTEpisodeDownloadCell;
  -[MTGenericCollectionCell configureSubviews](&v10, "configureSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDownloadCell downloadButton](self, "downloadButton"));
  -[MTGenericCollectionCell setSideView:](self, "setSideView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell deleteButton](self, "deleteButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_CANCEL"), &stru_1004C6D40, 0));
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell actionButtonsContainer](self, "actionButtonsContainer"));
  objc_msgSend(v7, "setNeedsLayout");

  -[MTEpisodeDownloadCell setNeedsLayout](self, "setNeedsLayout");
  v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "cellTapped");
  -[MTEpisodeDownloadCell setTapGesture:](self, "setTapGesture:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDownloadCell tapGesture](self, "tapGesture"));
  -[MTEpisodeDownloadCell addGestureRecognizer:](self, "addGestureRecognizer:", v9);

}

- (void)updateWithObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  id v18;

  v18 = a3;
  if (v18
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainQueueContext")),
        v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "episodeUuid")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodeForUuid:", v6)),
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
    objc_msgSend(v8, "setHidden:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "podcastUuid"));
    -[MTGenericCollectionCell setArtworkKey:](self, "setArtworkKey:", v9);

    objc_msgSend(v18, "downloadProgress");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDownloadCell downloadButton](self, "downloadButton"));
    objc_msgSend(v12, "setProgress:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bestTitle"));
    -[MTGenericCollectionCell setTitle:](self, "setTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode dateLabelDescriptionForEpisode:download:](MTEpisode, "dateLabelDescriptionForEpisode:download:", v7, v18));
    -[MTGenericCollectionCell setSubtitle:](self, "setSubtitle:", v14);

    -[MTEpisodeDownloadCell setPausable:](self, "setPausable:", objc_msgSend(v18, "isPausable"));
    v15 = objc_msgSend(v18, "downloadPhase");
    -[MTEpisodeDownloadCell setPaused:](self, "setPaused:", -[MTEpisodeDownloadCell _isPausedForDownloadPhase:](self, "_isPausedForDownloadPhase:", v15));
    v16 = -[MTEpisodeDownloadCell _isDownloadButtonEnabledForDownloadPhase:](self, "_isDownloadButtonEnabledForDownloadPhase:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDownloadCell downloadButton](self, "downloadButton"));
    objc_msgSend(v17, "setEnabled:", v16);

    -[MTEpisodeDownloadCell setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
    objc_msgSend(v7, "setHidden:", 1);
  }

}

- (void)setPausable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_pausable = a3;
  v3 = !a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeDownloadCell downloadButton](self, "downloadButton"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  self->_paused = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDownloadCell downloadButton](self, "downloadButton"));
  v6 = v5;
  if (v3)
    v7 = 3;
  else
    v7 = 2;
  objc_msgSend(v5, "setProgressType:animated:", v7, 0);

  -[MTEpisodeDownloadCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isPausedForDownloadPhase:(int64_t)a3
{
  return ((a3 - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)_isDownloadButtonEnabledForDownloadPhase:(int64_t)a3
{
  return a3 != 4;
}

- (MTDownloadOfferButton)downloadButton
{
  MTDownloadOfferButton *downloadButton;
  MTDownloadOfferButton *v4;
  MTDownloadOfferButton *v5;

  downloadButton = self->_downloadButton;
  if (!downloadButton)
  {
    v4 = objc_alloc_init(MTDownloadOfferButton);
    v5 = self->_downloadButton;
    self->_downloadButton = v4;

    -[MTDownloadOfferButton addTarget:action:forControlEvents:](self->_downloadButton, "addTarget:action:forControlEvents:", self, "downloadButtonTapped:", 64);
    downloadButton = self->_downloadButton;
  }
  return downloadButton;
}

- (void)downloadButtonTapped:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell scrollView](self, "scrollView", a3));
  objc_msgSend(v4, "contentOffset");
  v6 = v5;

  if (v6 <= 0.0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate"));
    objc_msgSend(v7, "cellDidPressToggleDownload:", self);

  }
}

- (void)cellTapped
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", self));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    objc_msgSend(v4, "collectionView:didSelectItemAtIndexPath:", v5, v3);

  }
}

- (BOOL)isPausable
{
  return self->_pausable;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setDownloadButton:(id)a3
{
  objc_storeStrong((id *)&self->_downloadButton, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
}

@end
