@implementation MTPodcastCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (MTPodcastCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTPodcastCell *v4;
  MTPodcastCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPodcastCell;
  v4 = -[MTGenericCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[MTPodcastCell configureSubviews](v4, "configureSubviews");
  return v5;
}

- (void)updateWithObject:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  -[MTGenericCell setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell _subtitleForPodcast:](self, "_subtitleForPodcast:", v11));
  -[MTGenericCell setSubtitle:](self, "setSubtitle:", v5);

  v6 = objc_msgSend(v11, "isDark");
  if ((v6 & 1) != 0)
    v7 = &off_1004D5F38;
  else
    v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "countOfUnplayedEpisodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  objc_msgSend(v8, "setCount:", v7);

  if ((v6 & 1) == 0)
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  objc_msgSend(v9, "sizeToFit");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  -[MTGenericCell setArtworkKey:](self, "setArtworkKey:", v10);

  -[MTPodcastCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_subtitleForPodcast:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;

  v3 = kPodcastFeedChangedDate;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "friendlyDisplayString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countOfNewEpisodes"));

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  if (v8)
    v8 = (id)objc_claimAutoreleasedReturnValue(+[MTCountUtil stringForNewEpisodeCount:titleCase:](MTCountUtil, "stringForNewEpisodeCount:titleCase:", v8, 0));
  if (objc_msgSend(v5, "isToday") && objc_msgSend(v8, "isNotEmpty"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UPDATED_DATE_AT_TIME_AND_NEW_EPISODE_COUNT_FORMAT"), &stru_1004C6D40, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeString"));
    v12 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@ %@ %@"), 0, v6, v11, v8);
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(v12);

LABEL_9:
    goto LABEL_19;
  }
  if (objc_msgSend(v5, "isToday"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DATE_AT_TIME"), &stru_1004C6D40, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeString"));
    v12 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@ %@"), 0, v6, v11, v18);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isNotEmpty") && objc_msgSend(v8, "isNotEmpty"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UPDATED_DATE_AND_NEW_EPISODE_COUNT_FORMAT"), &stru_1004C6D40, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@ %@"), 0, v6, v8));
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isNotEmpty"))
  {
    v16 = v6;
  }
  else
  {
    if (!objc_msgSend(v8, "isNotEmpty"))
    {
      v14 = 0;
      goto LABEL_19;
    }
    v16 = v8;
  }
  v14 = v16;
LABEL_19:

  return v14;
}

- (void)configureSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTPodcastCell;
  -[MTGenericCell configureSubviews](&v4, "configureSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  -[MTGenericCell setSideView:](self, "setSideView:", v3);

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
  v8.super_class = (Class)MTPodcastCell;
  -[MTGenericCell updateFonts](&v8, "updateFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleTextStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  objc_msgSend(v7, "sizeToFit");

  -[MTPodcastCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateColors
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPodcastCell;
  -[MTGenericCell updateColors](&v6, "updateColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitleTextColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (MTCountChevronView)countView
{
  MTCountChevronView *countView;
  MTCountChevronView *v4;
  MTCountChevronView *v5;
  void *v6;

  countView = self->_countView;
  if (!countView)
  {
    v4 = objc_opt_new(MTCountChevronView);
    v5 = self->_countView;
    self->_countView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
    -[MTCountChevronView setTintColor:](self->_countView, "setTintColor:", v6);

    countView = self->_countView;
  }
  return countView;
}

- (void)setCountView:(id)a3
{
  objc_storeStrong((id *)&self->_countView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countView, 0);
}

@end
