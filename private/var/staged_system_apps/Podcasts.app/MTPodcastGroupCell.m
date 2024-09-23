@implementation MTPodcastGroupCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (void)updateWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", kEpisodeUuid));
  -[MTPodcastGroupCell setEpisodeUUIDs:](self, "setEpisodeUUIDs:", v6);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell _currentEpisodeForPodcastGroup:](self, "_currentEpisodeForPodcastGroup:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcast"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  -[MTGenericCell setArtworkKey:](self, "setArtworkKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell _titleForPodcastGroup:currentEpisode:](self, "_titleForPodcastGroup:currentEpisode:", v4, v17));
  -[MTGenericCell setTitle:](self, "setTitle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell _subtitleForPodcastGroup:currentEpisode:](self, "_subtitleForPodcastGroup:currentEpisode:", v4, v17));
  -[MTGenericCell setSubtitle:](self, "setSubtitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid"));
  v12 = -[MTPodcastGroupCell _indexOfEpisodeUUID:](self, "_indexOfEpisodeUUID:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  v14 = objc_msgSend(v13, "count");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  objc_msgSend(v15, "setIndex:forCount:", v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  objc_msgSend(v16, "sizeToFit");

  -[MTPodcastGroupCell setCurrentEpisodeDownloaded:](self, "setCurrentEpisodeDownloaded:", objc_msgSend(v17, "isDownloaded"));
  -[MTPodcastGroupCell updateEnabled](self, "updateEnabled");
  -[MTPodcastGroupCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateEnabled
{
  void *v3;
  id v4;
  _BOOL8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    v5 = -[MTPodcastGroupCell networkIsReachable](self, "networkIsReachable")
      || -[MTPodcastGroupCell isCurrentEpisodeDownloaded](self, "isCurrentEpisodeDownloaded");
  else
    v5 = 0;
  -[MTGenericCell setEnabled:](self, "setEnabled:", v5);
}

- (void)configureSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTPodcastGroupCell;
  -[MTGenericCell configureSubviews](&v4, "configureSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  -[MTGenericCell setSideView:](self, "setSideView:", v3);

  -[MTTableViewCell setShowsSeparator:](self, "setShowsSeparator:", 0);
}

- (void)updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTPodcastGroupCell;
  -[MTGenericCell updateFonts](&v8, "updateFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitleTextStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  objc_msgSend(v7, "sizeToFit");

  -[MTPodcastGroupCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateColors
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTPodcastGroupCell;
  -[MTGenericCell updateColors](&v5, "updateColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  objc_msgSend(v4, "setTextColor:", v3);

}

- (id)_titleForPodcastGroup:(id)a3 currentEpisode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[MTPodcastGroupCell isEditing](self, "isEditing"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "podcast"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));

  }
  else if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bestTitle"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_subtitleForPodcastGroup:(id)a3 currentEpisode:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;

  v5 = a4;
  if (-[MTPodcastGroupCell isEditing](self, "isEditing"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
    v7 = objc_claimAutoreleasedReturnValue(+[MTCountUtil stringForUnplayedEpisodeCount:](MTCountUtil, "stringForUnplayedEpisodeCount:", objc_msgSend(v6, "count")));
LABEL_10:
    v13 = (void *)v7;
    goto LABEL_11;
  }
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("No New Episodes"), &stru_1004C6D40, 0));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", kEpisodePubDate));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "friendlyDisplayString"));
    objc_msgSend(v6, "addObject:", v10);

  }
  objc_msgSend(v5, "duration");
  if (v11 > 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString prettyStringWithDuration:](NSString, "prettyStringWithDuration:"));
    objc_msgSend(v6, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" • ")));

LABEL_11:
  return v13;
}

- (unint64_t)_indexOfEpisodeUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return (unint64_t)v6;
}

- (id)_currentEpisodeForPodcastGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeUuid"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  LODWORD(v5) = objc_msgSend(v8, "containsObject:", v7);

  if ((_DWORD)v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainQueueContext"));

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "episodeForUuid:", v7));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodes"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  }
  v12 = (void *)v11;

  return v12;
}

- (MTCountInfoButton)countInfoButton
{
  MTCountInfoButton *countInfoButton;
  MTCountInfoButton *v4;
  MTCountInfoButton *v5;

  countInfoButton = self->_countInfoButton;
  if (!countInfoButton)
  {
    v4 = objc_opt_new(MTCountInfoButton);
    v5 = self->_countInfoButton;
    self->_countInfoButton = v4;

    -[MTCountInfoButton addTarget:action:forControlEvents:](self->_countInfoButton, "addTarget:action:forControlEvents:", self, "infoButtonTapped:", 64);
    countInfoButton = self->_countInfoButton;
  }
  return countInfoButton;
}

- (void)infoButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "podcastGroupCellDidTapInfoButton:", self);

}

- (MTPodcastGroupCellDelegate)delegate
{
  return (MTPodcastGroupCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)networkIsReachable
{
  return self->_networkIsReachable;
}

- (void)setNetworkIsReachable:(BOOL)a3
{
  self->_networkIsReachable = a3;
}

- (NSArray)episodeUUIDs
{
  return self->_episodeUUIDs;
}

- (void)setEpisodeUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_episodeUUIDs, a3);
}

- (BOOL)isCurrentEpisodeDownloaded
{
  return self->_currentEpisodeDownloaded;
}

- (void)setCurrentEpisodeDownloaded:(BOOL)a3
{
  self->_currentEpisodeDownloaded = a3;
}

- (void)setCountInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_countInfoButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countInfoButton, 0);
  objc_storeStrong((id *)&self->_episodeUUIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
