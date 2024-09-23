@implementation MTEpisodeLockup

+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  unint64_t v4;

  v4 = 2;
  if (a3 > 472.0)
    v4 = 3;
  if (a4)
    return v4;
  else
    return a3 > 472.0;
}

+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  double result;

  _objc_msgSend(a1, "estimatedHeightForWidth:style:", objc_msgSend(a1, "styleForWidth:showsArtwork:", a4), a3);
  return result;
}

+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4
{
  MTEpisodeLockup *v7;
  void *v8;
  double v9;
  double v10;

  v7 = objc_opt_new(MTEpisodeLockup);
  -[MTEpisodeLockup setStyle:](v7, "setStyle:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mockEpisode"));
  -[MTEpisodeLockup setEpisode:](v7, "setEpisode:", v8);

  -[MTEpisodeLockup sizeThatFits:](v7, "sizeThatFits:", a3, 1.79769313e308);
  v10 = v9;

  return v10;
}

+ (unint64_t)titleNumberOfLinesForStyle:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (objc_msgSend(a1, "useLayoutForSkinnyPhones"))
      return 2;
    else
      return 3;
  }
  else if (a3)
  {
    return 2;
  }
  else if (+[MTEpisodeLockup useSelfSizingCells](MTEpisodeLockup, "useSelfSizingCells"))
  {
    return 5;
  }
  else
  {
    return 2;
  }
}

+ (unint64_t)descriptionNumberOfLinesForStyle:(unint64_t)a3 isTitleMultipleLines:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;
  unint64_t v6;
  BOOL v8;
  unint64_t v9;

  v4 = a4;
  if (a3 == 3)
  {
    v8 = !a4;
    v9 = 1;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    v8 = !a4;
    v9 = 2;
LABEL_11:
    if (v8)
      return v9 + 1;
    else
      return v9;
  }
  if (a3)
    return 3;
  v5 = +[MTEpisodeLockup useSelfSizingCells](MTEpisodeLockup, "useSelfSizingCells");
  v6 = 2;
  if (!v4)
    v6 = 3;
  if (v5)
    return 4;
  else
    return v6;
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3 showsPlayState:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
  objc_msgSend(v7, "readableWidth");
  v9 = IMRoundToPixel(v8);

  objc_msgSend(a1, "artworkSizeForStyle:", a3);
  v11 = v10 + 8.0;
  v12 = v10 <= 0.0;
  v13 = 0.0;
  if (v12)
    v11 = 0.0;
  if (v4)
    v13 = 24.0;
  return v9 + v13 + v11;
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3
{
  double result;

  _objc_msgSend(a1, "maximumContentWidthForStyle:showsPlayState:", a3, 1);
  return result;
}

+ (CGRect)frameForContentViewSize:(CGSize)a3 style:(unint64_t)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.height;
  width = a3.width;
  x = CGPointZero.x;
  y = CGPointZero.y;
  +[MTEpisodeLockup maximumContentWidthForStyle:](MTEpisodeLockup, "maximumContentWidthForStyle:", a4);
  if (width > v8)
  {
    v9 = width - v8;
    x = CGPointZero.x + IMRoundToPixel((width - v8) * 0.5);
    width = width - v9;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (double)artworkHeightForStyle:(unint64_t)a3 sizeType:(unint64_t)a4
{
  double v7;
  void *v8;
  const UIContentSizeCategory *v9;
  UIContentSizeCategory v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v7 = 0.0;
  if (!objc_msgSend(a1, "showsArtworkForStyle:"))
    return v7;
  if (a4 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleTextStyle"));
    v9 = &UIContentSizeCategoryExtraExtraLarge;
  }
  else
  {
    if (a4 != 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleFont"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionFont"));
      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleTextStyle"));
    v9 = &UIContentSizeCategorySmall;
  }
  v10 = *v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_fontForTextStyle:contentSizeCategoryName:](UIFont, "mt_fontForTextStyle:contentSizeCategoryName:", v8, *v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionTextStyle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_fontForTextStyle:contentSizeCategoryName:](UIFont, "mt_fontForTextStyle:contentSizeCategoryName:", v12, v10));

LABEL_8:
  v14 = objc_msgSend(a1, "titleNumberOfLinesForStyle:", a3);
  v15 = 1.0;
  if (a3 == 3)
    v15 = (double)((unint64_t)objc_msgSend(a1, "descriptionNumberOfLinesForStyle:isTitleMultipleLines:", 3, 1)+ 2);
  objc_msgSend(v11, "lineHeight");
  v17 = (double)(unint64_t)v14 * v16 + 2.0;
  objc_msgSend(v13, "lineHeight");
  v19 = v17 + v15 * v18;
  if (a3 != 3)
  {
    objc_msgSend(v11, "mt_offsetFromCapHeightToAscent");
    v19 = v19 + v20;
  }
  v7 = v19 + 2.0 + -1.0;

  return v7;
}

+ (CGSize)artworkSizeForStyle:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t *v9;
  uint64_t *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[6];
  _QWORD block[6];
  CGSize result;

  objc_msgSend(a1, "artworkHeightForStyle:sizeType:", a3, 0);
  v6 = v5;
  if (a3 == 3)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A5348;
    v15[3] = &unk_1004A9360;
    v15[4] = a1;
    v15[5] = 3;
    if (qword_1005673D8 != -1)
      dispatch_once(&qword_1005673D8, v15);
    v9 = &qword_1005673D0;
    v10 = &qword_100551088;
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    if (a3 != 2)
      goto LABEL_10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A5300;
    block[3] = &unk_1004A9360;
    block[4] = a1;
    block[5] = 2;
    if (qword_1005673C8 != -1)
      dispatch_once(&qword_1005673C8, block);
    v9 = &qword_1005673C0;
    v10 = &qword_100551080;
  }
  v8 = *(double *)v10;
  v7 = *(double *)v9;
LABEL_10:
  if (v6 >= v7)
    v7 = v6;
  if (v7 >= v8)
    v11 = v8;
  else
    v11 = v7;
  if (qword_1005673E0 != -1)
    dispatch_once(&qword_1005673E0, &stru_1004A93D0);
  v12 = ceil(v11 * *(double *)&qword_100551090) / *(double *)&qword_100551090;
  v13 = ceil(v11);
  if (*(double *)&qword_100551090 == 1.0)
    v12 = v13;
  v14 = v12;
  result.height = v14;
  result.width = v12;
  return result;
}

+ (id)defaultArtworkForStyle:(unint64_t)a3
{
  objc_msgSend(a1, "artworkSizeForStyle:", a3);
  return _objc_msgSend(a1, "defaultArtworkWithSize:");
}

+ (id)defaultArtworkWithSize:(CGSize)a3
{
  double width;
  double height;
  void *v6;
  void *v7;

  width = a3.width;
  if (a3.width < 1.0 || a3.height < 1.0)
  {
    v7 = 0;
  }
  else
  {
    height = a3.height;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageForKey:size:", kMTLibraryDefaultImageKey, width, height));

  }
  return v7;
}

+ (BOOL)showsArtworkForStyle:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)mockEpisode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectModel"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entitiesByName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kMTEpisodeEntityName));

  v6 = objc_msgSend(objc_alloc((Class)MTEpisode), "initWithEntity:insertIntoManagedObjectContext:", v5, 0);
  objc_msgSend(v6, "setTitle:", CFSTR("This is a really long title that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... "));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("This is a really long description that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... "), "stringByAppendingString:", CFSTR("This is a really long description that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... ")));
  v8 = kEpisodeDescription;
  objc_msgSend(v6, "willChangeValueForKey:", kEpisodeDescription);
  objc_msgSend(v6, "setPrimitiveValue:forKey:", v7, v8);
  objc_msgSend(v6, "didChangeValueForKey:", v8);
  objc_msgSend(v6, "setUuid:", CFSTR("mockEpisodeUuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v10));
  objc_msgSend(v6, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  objc_msgSend(v6, "setCleanedTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setPubDate:");

  objc_msgSend(v6, "setDuration:", 3600.0);
  objc_msgSend(v6, "setByteSize:", 52428800);
  objc_msgSend(v6, "setExternalType:", 0);
  objc_msgSend(v6, "setVideo:", 0);
  objc_msgSend(v6, "setAudio:", 1);
  objc_msgSend(v6, "setExplicit:", 1);
  v14 = kEpisodePlayState;
  objc_msgSend(v6, "willChangeValueForKey:", kEpisodePlayState);
  objc_msgSend(v6, "setPrimitiveValue:forKey:", &off_1004D5D28, v14);
  objc_msgSend(v6, "didChangeValueForKey:", v14);

  return v6;
}

+ (id)dependentPropertyKeys
{
  _QWORD v3[20];

  v3[0] = kEpisodeUuid;
  v3[1] = kEpisodeGuid;
  v3[2] = kEpisodeTitle;
  v3[3] = kEpisodeCleanedTitle;
  v3[4] = kEpisodeDescription;
  v3[5] = kEpisodeEnclosureUrl;
  v3[6] = kEpisodeFeedDeleted;
  v3[7] = kEpisodeAssetURL;
  v3[8] = kEpisodeSuppressAutoDownload;
  v3[9] = kEpisodePubDate;
  v3[10] = kEpisodeDuration;
  v3[11] = kEpisodeAudio;
  v3[12] = kEpisodeVideo;
  v3[13] = kEpisodeExternalType;
  v3[14] = kEpisodeUti;
  v3[15] = kEpisodeExplicit;
  v3[16] = kEpisodeIsFromiTunesSync;
  v3[17] = kEpisodePlayState;
  v3[18] = kEpisodePlayStateManuallySet;
  v3[19] = kEpisodeBackCatalog;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 20));
}

+ (BOOL)useLayoutForSkinnyPhones
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;

  return v4 < 375.0;
}

+ (BOOL)useSelfSizingCells
{
  return 1;
}

+ (double)leadingMarginForViewWidth:(double)a3
{
  unsigned int v3;
  double result;

  v3 = +[UIView mt_areMarginsGenerousForWidth:](UIView, "mt_areMarginsGenerousForWidth:", a3);
  result = 32.0;
  if (!v3)
    return 28.0;
  return result;
}

+ (double)descriptionMaxHeightForCurrentOrientation
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;

  v5 = 0.4;
  if (v4 < 737.0)
    v5 = 0.5;
  return v4 * v5;
}

+ (id)titleTextStyle
{
  return UIFontTextStyleHeadline1;
}

+ (id)descriptionTextStyle
{
  return UIFontTextStyleSubheadline2;
}

+ (id)footerTextStyle
{
  return UIFontTextStyleFootnote;
}

+ (id)titleFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleTextStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (id)metadataHeaderFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionTextStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:](UIFont, "mt_preferredFontForTextStyle:addingSymbolicTraits:", v2, 2));

  return v3;
}

+ (id)descriptionFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionTextStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (id)metadataFooterFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "footerTextStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

- (MTEpisodeLockup)initWithFrame:(CGRect)a3
{
  MTEpisodeLockup *v3;
  uint64_t v4;
  NSMutableDictionary *sizeCache;
  MTEpisodeActionController *v6;
  MTEpisodeActionController *actionController;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTEpisodeLockup;
  v3 = -[MTEpisodeLockup initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sizeCache = v3->_sizeCache;
    v3->_sizeCache = (NSMutableDictionary *)v4;

    v6 = objc_opt_new(MTEpisodeActionController);
    actionController = v3->_actionController;
    v3->_actionController = v6;

    v3->_showsPubDate = 1;
    v3->_showsPlayState = 1;
    -[MTEpisodeLockup configureSubviews](v3, "configureSubviews");
    v3->_initialized = 1;
    v3->_shouldShowNowPlaying = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    objc_msgSend(v8, "addObserver:", v3);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, "airplaneModeChanged:", CFSTR("MTAirplaneModeChangedNotification"), 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)MTEpisodeLockup;
  -[MTEpisodeLockup dealloc](&v5, "dealloc");
}

- (void)configureSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup layer](self, "layer"));
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v7);

  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v9);

  if (!-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v10);

  }
  -[MTEpisodeLockup updateColors](self, "updateColors");
  -[MTEpisodeLockup setStyle:](self, "setStyle:", 0);
  -[MTEpisodeLockup setShowsMoreButton:](self, "setShowsMoreButton:", 1);
}

- (MTEpisodeArtworkView)artworkView
{
  MTEpisodeArtworkView *artworkView;
  MTEpisodeArtworkView *v4;
  MTEpisodeArtworkView *v5;

  artworkView = self->_artworkView;
  if (!artworkView)
  {
    v4 = objc_opt_new(MTEpisodeArtworkView);
    v5 = self->_artworkView;
    self->_artworkView = v4;

    -[MTEpisodeArtworkView setCurrentPlayerItem:](self->_artworkView, "setCurrentPlayerItem:", -[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem"));
    artworkView = self->_artworkView;
  }
  return artworkView;
}

- (UIImageView)playStatusView
{
  UIImageView *playStatusView;
  UIImageView *v4;
  UIImageView *v5;

  playStatusView = self->_playStatusView;
  if (!playStatusView)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    v5 = self->_playStatusView;
    self->_playStatusView = v4;

    playStatusView = self->_playStatusView;
  }
  return playStatusView;
}

- (UIImageView)explicitIconView
{
  UIImageView *explicitIconView;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;

  explicitIconView = self->_explicitIconView;
  if (!explicitIconView)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView explicitIcon](MTEpisodeStateView, "explicitIcon"));
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_explicitIconView;
    self->_explicitIconView = v6;

    -[UIImageView sizeToFit](self->_explicitIconView, "sizeToFit");
    explicitIconView = self->_explicitIconView;
  }
  return explicitIconView;
}

- (MTEpisodeStateView)iconView
{
  MTEpisodeStateView *iconView;
  MTEpisodeStateView *v4;
  MTEpisodeStateView *v5;

  iconView = self->_iconView;
  if (!iconView)
  {
    v4 = objc_opt_new(MTEpisodeStateView);
    v5 = self->_iconView;
    self->_iconView = v4;

    -[MTEpisodeStateView setVerticalLayout:](self->_iconView, "setVerticalLayout:", 0);
    iconView = self->_iconView;
  }
  return iconView;
}

- (MTTouchInsetsButton)moreButton
{
  MTTouchInsetsButton *moreButton;
  MTTouchInsetsButton *v4;
  MTTouchInsetsButton *v5;
  MTTouchInsetsButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTTouchInsetsButton *v12;
  void *v13;

  moreButton = self->_moreButton;
  if (!moreButton)
  {
    v4 = (MTTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[MTTouchInsetsButton buttonWithType:](MTTouchInsetsButton, "buttonWithType:", 1));
    v5 = self->_moreButton;
    self->_moreButton = v4;

    v6 = self->_moreButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("more..."), &stru_1004C6D40, 0));
    -[MTTouchInsetsButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_moreButton, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
    objc_msgSend(v9, "setFont:", v10);

    -[MTTouchInsetsButton addTarget:action:forControlEvents:](self->_moreButton, "addTarget:action:forControlEvents:", self, "moreButtonTapped:", 64);
    -[MTTouchInsetsButton setTouchInsets:](self->_moreButton, "setTouchInsets:", -16.0, -8.0, -8.0, -12.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_moreButton, "titleLabel"));
    objc_msgSend(v11, "sizeToFit");

    v12 = self->_moreButton;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](v12, "titleLabel"));
    objc_msgSend(v13, "bounds");
    -[MTTouchInsetsButton setFrame:](v12, "setFrame:");

    moreButton = self->_moreButton;
  }
  return moreButton;
}

- (MTTouchInsetsButton)descriptionButton
{
  MTTouchInsetsButton *descriptionButton;
  MTTouchInsetsButton *v4;
  MTTouchInsetsButton *v5;
  MTTouchInsetsButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTTouchInsetsButton *v12;
  void *v13;

  descriptionButton = self->_descriptionButton;
  if (!descriptionButton)
  {
    v4 = (MTTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[MTTouchInsetsButton buttonWithType:](MTTouchInsetsButton, "buttonWithType:", 1));
    v5 = self->_descriptionButton;
    self->_descriptionButton = v4;

    v6 = self->_descriptionButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("show full description"), &stru_1004C6D40, 0));
    -[MTTouchInsetsButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_descriptionButton, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
    objc_msgSend(v9, "setFont:", v10);

    -[MTTouchInsetsButton setTouchInsets:](self->_descriptionButton, "setTouchInsets:", -16.0, -8.0, -8.0, -12.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_descriptionButton, "titleLabel"));
    objc_msgSend(v11, "sizeToFit");

    v12 = self->_descriptionButton;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](v12, "titleLabel"));
    objc_msgSend(v13, "bounds");
    -[MTTouchInsetsButton setFrame:](v12, "setFrame:");

    descriptionButton = self->_descriptionButton;
  }
  return descriptionButton;
}

- (UIButton)actionButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreAction](self, "moreAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "button"));

  return (UIButton *)v3;
}

- (IMActionSheetAction)moreAction
{
  IMActionSheetAction *moreAction;
  IMActionSheetAction *v4;
  IMActionSheetAction *v5;
  IMActionSheetAction *v6;
  void *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;

  moreAction = self->_moreAction;
  if (!moreAction)
  {
    v4 = (IMActionSheetAction *)objc_claimAutoreleasedReturnValue(+[MTMoreActionSheetAction action](MTMoreActionSheetAction, "action"));
    v5 = self->_moreAction;
    self->_moreAction = v4;

    objc_initWeak(&location, self);
    v6 = self->_moreAction;
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_1000A629C;
    v12 = &unk_1004A6108;
    objc_copyWeak(&v13, &location);
    -[IMAction setActionBlock:](v6, "setActionBlock:", &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController", v9, v10, v11, v12));
    -[IMAction setController:](self->_moreAction, "setController:", v7);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    moreAction = self->_moreAction;
  }
  return moreAction;
}

- (UITextView)titleTextView
{
  UITextView *titleTextView;
  UITextView *v4;
  UITextView *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  titleTextView = self->_titleTextView;
  if (!titleTextView)
  {
    v4 = objc_opt_new(UITextView);
    v5 = self->_titleTextView;
    self->_titleTextView = v4;

    -[UITextView setEditable:](self->_titleTextView, "setEditable:", 0);
    -[UITextView setScrollEnabled:](self->_titleTextView, "setScrollEnabled:", 0);
    -[UITextView setUserInteractionEnabled:](self->_titleTextView, "setUserInteractionEnabled:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_titleTextView, "setBackgroundColor:", v6);

    -[UITextView setDataDetectorTypes:](self->_titleTextView, "setDataDetectorTypes:", 0);
    v7 = objc_msgSend((id)objc_opt_class(self), "titleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UITextView setFont:](self->_titleTextView, "setFont:", v8);

    -[UITextView setTextContainerInset:](self->_titleTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    objc_msgSend(v10, "setWidthTracksTextView:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    objc_msgSend(v11, "setHeightTracksTextView:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    objc_msgSend(v12, "setLineBreakMode:", 4);

    titleTextView = self->_titleTextView;
  }
  return titleTextView;
}

- (UITextView)descriptionTextView
{
  UITextView *descriptionTextView;
  UITextView *v4;
  UITextView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UITextView *v11;
  void *v12;

  descriptionTextView = self->_descriptionTextView;
  if (!descriptionTextView)
  {
    v4 = objc_opt_new(UITextView);
    v5 = self->_descriptionTextView;
    self->_descriptionTextView = v4;

    -[UITextView setEditable:](self->_descriptionTextView, "setEditable:", 0);
    -[UITextView setScrollEnabled:](self->_descriptionTextView, "setScrollEnabled:", 0);
    -[UITextView setClipsToBounds:](self->_descriptionTextView, "setClipsToBounds:", 0);
    -[UITextView setUserInteractionEnabled:](self->_descriptionTextView, "setUserInteractionEnabled:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_descriptionTextView, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    objc_msgSend(v7, "setLineBreakMode:", 4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    objc_msgSend(v9, "setHeightTracksTextView:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    objc_msgSend(v10, "setWidthTracksTextView:", 1);

    -[UITextView setTextContainerInset:](self->_descriptionTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[UITextView setDataDetectorTypes:](self->_descriptionTextView, "setDataDetectorTypes:", 0);
    v11 = self->_descriptionTextView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
    -[UITextView setFont:](v11, "setFont:", v12);

    descriptionTextView = self->_descriptionTextView;
  }
  return descriptionTextView;
}

- (UILabel)metadataLabel
{
  UILabel *metadataLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;

  metadataLabel = self->_metadataLabel;
  if (!metadataLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_metadataLabel;
    self->_metadataLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_metadataLabel, "setBackgroundColor:", v6);

    v7 = self->_metadataLabel;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
    -[UILabel setFont:](v7, "setFont:", v8);

    metadataLabel = self->_metadataLabel;
  }
  return metadataLabel;
}

- (UITextView)footerTextView
{
  UITextView *footerTextView;
  UITextView *v4;
  UITextView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UITextView *v11;
  void *v12;

  footerTextView = self->_footerTextView;
  if (!footerTextView)
  {
    v4 = objc_opt_new(UITextView);
    v5 = self->_footerTextView;
    self->_footerTextView = v4;

    -[UITextView setEditable:](self->_footerTextView, "setEditable:", 0);
    -[UITextView setScrollEnabled:](self->_footerTextView, "setScrollEnabled:", 0);
    -[UITextView setClipsToBounds:](self->_footerTextView, "setClipsToBounds:", 0);
    -[UITextView setUserInteractionEnabled:](self->_footerTextView, "setUserInteractionEnabled:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_footerTextView, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    objc_msgSend(v7, "setLineBreakMode:", 4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    objc_msgSend(v9, "setHeightTracksTextView:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    objc_msgSend(v10, "setWidthTracksTextView:", 1);

    -[UITextView setTextContainerInset:](self->_footerTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[UITextView setDataDetectorTypes:](self->_footerTextView, "setDataDetectorTypes:", 0);
    v11 = self->_footerTextView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](MTEpisodeLockup, "metadataFooterFont"));
    -[UITextView setFont:](v11, "setFont:", v12);

    footerTextView = self->_footerTextView;
  }
  return footerTextView;
}

- (MTNowPlayingIndicatorView)barsView
{
  MTNowPlayingIndicatorView *barsView;
  MTNowPlayingIndicatorView *v4;
  MTNowPlayingIndicatorView *v5;
  void *v6;
  double v7;
  double v8;

  barsView = self->_barsView;
  if (!barsView)
  {
    v4 = objc_opt_new(MTNowPlayingIndicatorView);
    v5 = self->_barsView;
    self->_barsView = v4;

    -[MTNowPlayingIndicatorView setBounceStyle:](self->_barsView, "setBounceStyle:", 1);
    -[MTNowPlayingIndicatorView setNumberOfLevels:](self->_barsView, "setNumberOfLevels:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "scale");
    v8 = v7;

    -[MTNowPlayingIndicatorView setLevelCornerRadius:](self->_barsView, "setLevelCornerRadius:", 1.0 / v8);
    -[MTEpisodeLockup updateColorsForBarsView:](self, "updateColorsForBarsView:", self->_barsView);
    barsView = self->_barsView;
  }
  return barsView;
}

- (void)setColorTheme:(id)a3
{
  MTColorTheme *v5;
  MTColorTheme *colorTheme;
  unsigned __int8 v7;
  MTColorTheme *v8;

  v5 = (MTColorTheme *)a3;
  colorTheme = self->_colorTheme;
  if (colorTheme != v5)
  {
    v8 = v5;
    v7 = -[MTColorTheme isEqual:](colorTheme, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_colorTheme, a3);
      -[MTEpisodeLockup updateColors](self, "updateColors");
      v5 = v8;
    }
  }

}

- (void)updateColors
{
  void *v3;
  void *v4;
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
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  v20 = (id)objc_claimAutoreleasedReturnValue(+[UIColor tintColorForTheme:](UIColor, "tintColorForTheme:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor primaryTextColorForTheme:](UIColor, "primaryTextColorForTheme:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](UIColor, "secondaryTextColorForTheme:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  objc_msgSend(v8, "setTextColor:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  objc_msgSend(v9, "setTextColor:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
  objc_msgSend(v10, "setTextColor:", v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  objc_msgSend(v11, "setTextColor:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  objc_msgSend(v12, "setColorTheme:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  objc_msgSend(v14, "setColorTheme:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  objc_msgSend(v16, "setTintColor:", v20);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  objc_msgSend(v17, "setTintColor:", v20);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
  objc_msgSend(v18, "setTintColor:", v20);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionButton](self, "descriptionButton"));
  objc_msgSend(v19, "setTintColor:", v20);

  -[MTEpisodeLockup updateColorsForBarsView:](self, "updateColorsForBarsView:", self->_barsView);
  -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");

}

- (void)updateColorsForBarsView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor barsTintColorForTheme:](UIColor, "barsTintColorForTheme:", v6));
    objc_msgSend(v4, "setTintColor:", v5);

  }
}

- (void)moreButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup delegate](self, "delegate"));
  objc_msgSend(v5, "lockup:moreButtonTapped:", self, v4);

}

- (void)airplaneModeChanged:(id)a3
{
  void *v4;

  if (!-[MTEpisodeLockup updateDisabledReason](self, "updateDisabledReason", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

    if (v4)
      -[MTEpisodeLockup updateIcons](self, "updateIcons");
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  MTTouchInsetsButton *moreButton;

  -[MTTouchInsetsButton removeFromSuperview](self->_moreButton, "removeFromSuperview", a3);
  moreButton = self->_moreButton;
  self->_moreButton = 0;

  if (-[MTEpisodeLockup showsMoreButton](self, "showsMoreButton"))
  {
    self->_showsMoreButton = 0;
    -[MTEpisodeLockup setShowsMoreButton:](self, "setShowsMoreButton:", 1);
  }
}

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A6D64;
  v4[3] = &unk_1004A7570;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setEpisode:(id)a3
{
  objc_storeStrong((id *)&self->_episode, a3);
  if (a3)
    -[MTEpisodeLockup update](self, "update");
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[MTEpisodeLockup updateMoreButtonVisibility](self, "updateMoreButtonVisibility");
  }
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_currentPlayerItem != a3)
  {
    v3 = a3;
    self->_currentPlayerItem = a3;
    -[MTEpisodeArtworkView setCurrentPlayerItem:](self->_artworkView, "setCurrentPlayerItem:");
    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
    -[MTEpisodeLockup updateIconView](self, "updateIconView");
    if (v3)
      -[MTEpisodeLockup startObservingPlaybackState](self, "startObservingPlaybackState");
    else
      -[MTEpisodeLockup stopObservingPlaybackState](self, "stopObservingPlaybackState");
  }
}

- (void)setExpanded:(BOOL)a3
{
  id v5;
  void *v6;

  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[MTEpisodeLockup updateMoreButtonVisibility](self, "updateMoreButtonVisibility");
    if (a3)
      v5 = 0;
    else
      v5 = objc_msgSend((id)objc_opt_class(self), "descriptionNumberOfLinesForStyle:isTitleMultipleLines:", -[MTEpisodeLockup style](self, "style"), 1);
    -[MTEpisodeLockup _setNumberOfLinesForDescription:](self, "_setNumberOfLinesForDescription:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

    if (v6)
      -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
    -[MTEpisodeLockup updateFooterTextViewVisbility](self, "updateFooterTextViewVisbility");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStyle:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;

  if (self->_style != a3 || !self->_initialized)
  {
    self->_style = a3;
    -[MTEpisodeLockup setShowsArtwork:](self, "setShowsArtwork:", +[MTEpisodeLockup showsArtworkForStyle:](MTEpisodeLockup, "showsArtworkForStyle:", a3));
    v5 = objc_msgSend((id)objc_opt_class(self), "titleNumberOfLinesForStyle:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textContainer"));
    objc_msgSend(v7, "setMaximumNumberOfLines:", v5);

    -[MTEpisodeLockup updateTitleFontIfNeeded](self, "updateTitleFontIfNeeded");
    -[MTEpisodeLockup invalidateSizeMetrics](self, "invalidateSizeMetrics");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsPubDate:(BOOL)a3
{
  if (self->_showsPubDate != a3)
  {
    self->_showsPubDate = a3;
    -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
  }
}

- (void)setShowsPlayState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  MTEpisodeLockup *v6;
  void *v7;

  if (self->_showsPlayState != a3)
  {
    v3 = a3;
    self->_showsPlayState = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
    v6 = (MTEpisodeLockup *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (v3)
    {
      if (v6 != self)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
        -[MTEpisodeLockup addSubview:](self, "addSubview:", v7);
LABEL_7:

      }
    }
    else if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
      objc_msgSend(v7, "removeFromSuperview");
      goto LABEL_7;
    }
    -[MTEpisodeLockup updateIcons](self, "updateIcons");
  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[MTEpisodeLockup setEpisode:](self, "setEpisode:", 0);
  -[MTEpisodeLockup setExpanded:](self, "setExpanded:", 0);
  -[MTEpisodeLockup setDelegate:](self, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  objc_msgSend(v3, "prepareForReuse");

  -[MTEpisodeLockup setDisabledReason:](self, "setDisabledReason:", 0);
  -[MTEpisodeLockup invalidateSizeMetrics](self, "invalidateSizeMetrics");
  -[MTEpisodeLockup invalidateLayoutMargins](self, "invalidateLayoutMargins");
  self->_shouldShowNowPlaying = 1;
  -[MTEpisodeLockup setCurrentPlayerItem:](self, "setCurrentPlayerItem:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artwork"));

  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "defaultArtworkForStyle:", -[MTEpisodeLockup style](self, "style"));
    v8 = (id)objc_claimAutoreleasedReturnValue(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
    objc_msgSend(v7, "setArtwork:", v8);

  }
}

- (void)invalidateSizeMetrics
{
  -[NSMutableDictionary removeAllObjects](self->_sizeCache, "removeAllObjects");
  self->_descriptionSize = CGSizeZero;
}

- (void)invalidateLayoutMargins
{
  __int128 v2;

  v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->__layoutMargins.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->__layoutMargins.bottom = v2;
}

- (void)updateActionSheetsAndPopovers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreAction](self, "moreAction"));
  sub_1000A72E0((uint64_t)v3, v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  objc_msgSend(v4, "updateActionSheetsAndPopovers");

}

- (void)dismissActionSheetsAndPopovers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreAction](self, "moreAction"));
  sub_1000A7390((uint64_t)v3, v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  objc_msgSend(v4, "dismissActionSheetsAndPopovers");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MTEpisodeLockup;
  v8 = -[MTEpisodeLockup hitTest:withEvent:](&v16, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));

  if (v9 == v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
    -[MTEpisodeLockup convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitTest:withEvent:", v7));

    if (v13)
    {
      v14 = v13;

      v9 = v14;
    }

  }
  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double x;
  double v7;
  double y;
  double v9;
  double width;
  double v11;
  double height;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  unint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  BOOL v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  uint64_t v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  _QWORD v130[9];
  _QWORD v131[9];
  double v132;
  __int128 v133;
  double v134;
  objc_super v135;
  CGRect v136;
  CGRect v137;

  v135.receiver = self;
  v135.super_class = (Class)MTEpisodeLockup;
  -[MTEpisodeLockup layoutSubviews](&v135, "layoutSubviews");
  -[MTEpisodeLockup bounds](self, "bounds");
  v4 = v3;
  if (-[MTEpisodeLockup showsArtwork](self, "showsArtwork"))
  {
    -[MTEpisodeLockup artworkFrameForStyle:forViewWidth:](self, "artworkFrameForStyle:forViewWidth:", -[MTEpisodeLockup style](self, "style"), v4);
    x = v5;
    y = v7;
    width = v9;
    height = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
    objc_msgSend(v13, "setFrame:", x, y, width, height);

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v125 = width;
  v127 = x;
  -[MTEpisodeLockup titleOriginYForArtworkFrame:style:](self, "titleOriginYForArtworkFrame:style:", -[MTEpisodeLockup style](self, "style"), x, y, width, height);
  v126 = y;
  v15 = v14;
  v16 = v4;
  v17 = v4;
  v18 = v15;
  v113 = v15;
  -[MTEpisodeLockup actionButtonFrameForViewWidth:titleOriginY:](self, "actionButtonFrameForViewWidth:titleOriginY:", v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  -[MTEpisodeLockup downloadButtonFrameForActionButtonFrame:titleOriginY:](self, "downloadButtonFrameForActionButtonFrame:titleOriginY:", v20, v22, v24, v26, v18);
  v123 = v22;
  v124 = v20;
  v121 = v28;
  v122 = v24;
  v115 = v26;
  v119 = v30;
  v120 = v29;
  v118 = v31;
  -[MTEpisodeLockup buttonsFrameForActionButtonFrame:downloadButtonFrame:](self, "buttonsFrameForActionButtonFrame:downloadButtonFrame:", v20, v22, v24, v26);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[MTEpisodeLockup titleOriginXForViewWidth:artworkFrame:buttonFrame:style:](self, "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:", -[MTEpisodeLockup style](self, "style"), v16, v127, y, v125, height, v32, v34, v36, v38);
  v128 = v40;
  v129 = v16;
  v114 = v39;
  v116 = v35;
  v117 = v33;
  -[MTEpisodeLockup titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:](self, "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:", -[MTEpisodeLockup style](self, "style"), v16, v40, v113, v127, y, v125, height, v33, v35, v37, v39);
  v42 = v41;
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  objc_msgSend(v45, "setFrame:", v128, v113, v42, v44);

  v46 = v44;
  v47 = v42;
  -[MTEpisodeLockup playStatusViewFrameForViewWidth:titleFrame:artworkFrame:](self, "playStatusViewFrameForViewWidth:titleFrame:artworkFrame:", v16, v128, v113, v42, v46, *(_QWORD *)&v127, *(_QWORD *)&y, *(_QWORD *)&v125, *(_QWORD *)&height);
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
  objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup barsView](self, "barsView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "superview"));

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup barsView](self, "barsView"));
    objc_msgSend(v59, "setFrame:", v49, v51, v53, v55);

  }
  -[MTEpisodeLockup metadataFrameForViewWidth:titleFrame:style:](self, "metadataFrameForViewWidth:titleFrame:style:", -[MTEpisodeLockup style](self, "style"), v129, v128, v113, v47, v46);
  v132 = v60;
  *(_QWORD *)&v133 = v61;
  *((_QWORD *)&v133 + 1) = v62;
  v134 = v63;
  -[MTEpisodeLockup iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:](self, "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:", &v132, -[MTEpisodeLockup style](self, "style"), v129, v128, v113, v47, v46);
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "superview"));

  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    objc_msgSend(v74, "setFrame:", v65, v67, v69, v71);

  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  objc_msgSend(v75, "setFrame:", v132, v133, v134);

  v76 = -[MTEpisodeLockup style](self, "style");
  -[MTEpisodeLockup descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:](self, "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:", v76, v129, v127, v126, v125, height, v117, v116, v37, v114, *(_QWORD *)&v128, *(_QWORD *)&v113, *(_QWORD *)&v47, *(_QWORD *)&v46, *(_QWORD *)&v132, v133, *(_QWORD *)&v134,
    *(_QWORD *)&v65,
    *(_QWORD *)&v67,
    *(_QWORD *)&v69,
    *(_QWORD *)&v71);
  v78 = v77;
  v80 = v79;
  -[MTEpisodeLockup exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:](self, "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:", -[MTEpisodeLockup style](self, "style"), v77, v79, v129, v128, v113, v47, v46, *(_QWORD *)&v124, *(_QWORD *)&v123, *(_QWORD *)&v122, *(_QWORD *)&v115, v121, v120, v119, v118);
  v82 = v81;
  v84 = v83;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  objc_msgSend(v85, "frame");
  v137.origin.x = v86;
  v137.origin.y = v87;
  v137.size.width = v88;
  v137.size.height = v89;
  v136.origin.x = v78;
  v136.origin.y = v80;
  v136.size.width = v82;
  v136.size.height = v84;
  v90 = CGRectEqualToRect(v136, v137);

  if (!v90)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    objc_msgSend(v91, "setFrame:", v78, v80, v82, v84);

  }
  -[MTEpisodeLockup fixEmptyTextContainers](self, "fixEmptyTextContainers");
  if (-[MTEpisodeLockup showsMoreButton](self, "showsMoreButton"))
  {
    -[MTEpisodeLockup moreButtonFrameForDescriptionFrame:](self, "moreButtonFrameForDescriptionFrame:", v78, v80, v82, v84);
    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472;
    v131[2] = sub_1000A7BB8;
    v131[3] = &unk_1004A9388;
    v131[4] = self;
    v131[5] = v92;
    v131[6] = v93;
    v131[7] = v94;
    v131[8] = v95;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v131);
  }
  -[MTEpisodeLockup descriptionButtonFrameForDescriptionFrame:](self, "descriptionButtonFrameForDescriptionFrame:", v78, v80, v82, v84);
  v97 = v96;
  v99 = v98;
  v101 = v100;
  v103 = v102;
  if (-[MTEpisodeLockup showsDescriptionButton](self, "showsDescriptionButton"))
  {
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_1000A7C10;
    v130[3] = &unk_1004A9388;
    v130[4] = self;
    *(double *)&v130[5] = v97;
    *(double *)&v130[6] = v99;
    *(double *)&v130[7] = v101;
    *(double *)&v130[8] = v103;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v130);
  }
  if (-[MTEpisodeLockup showsFooterTextView](self, "showsFooterTextView"))
  {
    -[MTEpisodeLockup footerFrameForDescriptionButtonFrame:descriptionFrame:](self, "footerFrameForDescriptionButtonFrame:descriptionFrame:", v97, v99, v101, v103, v78, v80, v82, v84);
    v105 = v104;
    v107 = v106;
    v109 = v108;
    v111 = v110;
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    objc_msgSend(v112, "setFrame:", v105, v107, v109, v111);

  }
}

- (CGRect)explicitIconFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  double v25;
  double MaxY;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  char *v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGRect v63;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup titleFont](MTEpisodeLockup, "titleFont"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup explicitIconView](self, "explicitIconView"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  v16 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  v62 = a3;
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  if (v16)
  {
    v21 = CGRectGetMinX(*(CGRect *)&v17) - v13;
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    if (v21 >= v22)
      v23 = v21;
    else
      v23 = v22;
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v17);
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    if (MaxX >= a3 - v25 - v13)
      v23 = a3 - v25 - v13;
    else
      v23 = MaxX;
  }
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  MaxY = CGRectGetMaxY(v63);
  objc_msgSend(v10, "im_distanceFromLastBaselineToBottom");
  v28 = v27;
  objc_msgSend(v10, "lineHeight");
  v30 = (v29 - v15) * 0.5;
  if (qword_1005673E0 != -1)
    dispatch_once(&qword_1005673E0, &stru_1004A93D0);
  v31 = ceil(v30 * *(double *)&qword_100551090) / *(double *)&qword_100551090;
  v32 = ceil(v30);
  if (*(double *)&qword_100551090 == 1.0)
    v33 = v32;
  else
    v33 = v31;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layoutManager"));
  v36 = (char *)objc_msgSend(v35, "numberOfGlyphs") - 1;

  if (v36)
  {
    v61 = v28;
    v37 = MaxY;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layoutManager"));
    objc_msgSend(v39, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v36, 0);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    v48 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
    v49 = v41;
    v50 = v43;
    v51 = v45;
    v52 = v47;
    if (v48)
    {
      v53 = CGRectGetMinX(*(CGRect *)&v49) + -5.0 - v13;
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      if (v53 >= v54)
        v23 = v53;
      else
        v23 = v54;
    }
    else
    {
      v55 = CGRectGetMaxX(*(CGRect *)&v49) + 5.0;
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      if (v55 >= v62 - v56 - v13)
        v23 = v62 - v56 - v13;
      else
        v23 = v55;
    }
    MaxY = v37;
    v28 = v61;
  }

  v57 = v23;
  v58 = MaxY - v28 - v33;
  v59 = v13;
  v60 = v15;
  result.size.height = v60;
  result.size.width = v59;
  result.origin.y = v58;
  result.origin.x = v57;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  unint64_t v6;
  const __CFString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGSize v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[MTEpisodeLockup style](self, "style");
  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
    v7 = CFSTR("e");
  else
    v7 = CFSTR("c");
  v20.width = width;
  v20.height = height;
  v8 = NSStringFromCGSize(v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu-%@-%@"), v6, v7, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sizeCache, "objectForKeyedSubscript:", v10));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "CGSizeValue");
    width = v13;
    v15 = v14;
  }
  else
  {
    -[MTEpisodeLockup _layoutMarginsForViewWidth:](self, "_layoutMarginsForViewWidth:", width);
    -[MTEpisodeLockup set_layoutMargins:](self, "set_layoutMargins:");
    -[MTEpisodeLockup heightForWidth:style:](self, "heightForWidth:style:", -[MTEpisodeLockup style](self, "style"), width);
    v15 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, v16));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizeCache, "setObject:forKeyedSubscript:", v17, v10);

  }
  v18 = width;
  v19 = v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)fixEmptyTextContainers
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textContainer"));
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  if (v6 != v11 || v8 != v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textContainer"));
    objc_msgSend(v16, "setSize:", v11, v13);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textContainer"));
  objc_msgSend(v18, "size");
  v20 = v19;
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;

  if (v20 != v25 || v22 != v27)
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "textContainer"));
    objc_msgSend(v28, "setSize:", v25, v27);

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MTEpisodeLockup frame](self, "frame");
  if (v8 != width)
  {
    self->_descriptionSize = CGSizeZero;
    -[MTEpisodeLockup invalidateLayoutMargins](self, "invalidateLayoutMargins");
  }
  v9.receiver = self;
  v9.super_class = (Class)MTEpisodeLockup;
  -[MTEpisodeLockup setFrame:](&v9, "setFrame:", x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MTEpisodeLockup bounds](self, "bounds");
  if (v8 != width)
  {
    self->_descriptionSize = CGSizeZero;
    -[MTEpisodeLockup invalidateLayoutMargins](self, "invalidateLayoutMargins");
  }
  v9.receiver = self;
  v9.super_class = (Class)MTEpisodeLockup;
  -[MTEpisodeLockup setBounds:](&v9, "setBounds:", x, y, width, height);
}

- (void)layoutMarginsDidChange
{
  -[MTEpisodeLockup invalidateLayoutMargins](self, "invalidateLayoutMargins");
  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (UIEdgeInsets)_layoutMargins
{
  UIEdgeInsets *p_layoutMargins;
  float64x2_t v3;
  float64x2_t v4;
  double left;
  double right;
  double v8;
  UIEdgeInsets result;

  p_layoutMargins = &self->__layoutMargins;
  v3 = *(float64x2_t *)&self->__layoutMargins.top;
  v4 = *(float64x2_t *)&self->__layoutMargins.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v3, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v4, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))) & 1) != 0)
  {
    -[MTEpisodeLockup bounds](self, "bounds");
    -[MTEpisodeLockup _layoutMarginsForViewWidth:](self, "_layoutMarginsForViewWidth:", v8);
    p_layoutMargins->top = v3.f64[0];
    p_layoutMargins->left = left;
    p_layoutMargins->bottom = v4.f64[0];
    p_layoutMargins->right = right;
  }
  else
  {
    left = self->__layoutMargins.left;
    right = self->__layoutMargins.right;
  }
  result.bottom = v4.f64[0];
  result.top = v3.f64[0];
  result.right = right;
  result.left = left;
  return result;
}

- (UIEdgeInsets)_layoutMarginsForViewWidth:(double)a3
{
  double v5;
  double v6;
  float64x2_t v7;
  float64x2_t v8;
  double left;
  double right;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(self), "leadingMarginForViewWidth:", a3);
  v6 = v5;
  v7 = *(float64x2_t *)&self->__layoutMargins.top;
  v8 = *(float64x2_t *)&self->__layoutMargins.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v7, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v8, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))) & 1) != 0)
  {
    +[MTEpisodeLockup maximumContentWidthForStyle:](MTEpisodeLockup, "maximumContentWidthForStyle:", -[MTEpisodeLockup style](self, "style"));
    v12 = v11;
    -[MTEpisodeLockup mt_layoutMarginsForWidth:](self, "mt_layoutMarginsForWidth:", a3);
    v19 = v14;
    v20 = v13;
    v16 = v15;
    right = v17;
    if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState") && v15 < v6)
      left = v6;
    else
      left = v16;
    if (a3 - left - right > v12)
    {
      left = IMRoundToPixel((a3 - v12) * 0.5);
      right = left;
    }
    v8.f64[0] = v19;
    v7.f64[0] = v20;
    self->__layoutMargins.top = v20;
    self->__layoutMargins.left = left;
    self->__layoutMargins.bottom = v19;
    self->__layoutMargins.right = right;
  }
  else
  {
    left = self->__layoutMargins.left;
    right = self->__layoutMargins.right;
  }
  v18 = right;
  result.bottom = v8.f64[0];
  result.top = v7.f64[0];
  result.right = v18;
  result.left = left;
  return result;
}

- (double)heightForWidth:(double)a3 style:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double MaxY;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  BOOL v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double y;
  CGFloat v86;
  double v87;
  double width;
  double v89;
  double height;
  void *v91;
  double v92;
  double v93;
  id v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  uint64_t v101;
  double v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat x;
  uint64_t v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  uint64_t v126;
  __int128 v127;
  uint64_t v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  -[MTEpisodeLockup artworkFrameForStyle:forViewWidth:](self, "artworkFrameForStyle:forViewWidth:");
  v124 = v7;
  v103 = v8;
  v118 = v9;
  v11 = v10;
  -[MTEpisodeLockup titleOriginYForArtworkFrame:style:](self, "titleOriginYForArtworkFrame:style:", a4);
  v102 = v12;
  -[MTEpisodeLockup actionButtonFrameForViewWidth:titleOriginY:](self, "actionButtonFrameForViewWidth:titleOriginY:", a3, v12);
  v14 = v13;
  v114 = v15;
  v116 = v13;
  v16 = v15;
  v18 = v17;
  v110 = v19;
  v112 = v17;
  v20 = v19;
  -[MTEpisodeLockup downloadButtonFrameForActionButtonFrame:titleOriginY:](self, "downloadButtonFrameForActionButtonFrame:titleOriginY:");
  v108 = v22;
  v109 = v21;
  v106 = v24;
  v107 = v23;
  -[MTEpisodeLockup buttonsFrameForActionButtonFrame:downloadButtonFrame:](self, "buttonsFrameForActionButtonFrame:downloadButtonFrame:", v14, v16, v18, v20, v21, v22, v23, v24);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v120 = v31;
  v104 = v29;
  v105 = v27;
  v122 = v11;
  -[MTEpisodeLockup titleOriginXForViewWidth:artworkFrame:buttonFrame:style:](self, "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:", a4, a3, v124, v11, v103, v118, v25, v27, v29, v31);
  v101 = v30;
  v33 = v32;
  -[MTEpisodeLockup titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:](self, "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:", a4, a3, v26, v28, v101, v120);
  v35 = v34;
  v37 = v36;
  -[MTEpisodeLockup metadataFrameForViewWidth:titleFrame:style:](self, "metadataFrameForViewWidth:titleFrame:style:", a4, a3, v33, v102, v34, v36);
  v126 = v38;
  *(_QWORD *)&v127 = v39;
  *((_QWORD *)&v127 + 1) = v40;
  v128 = v41;
  -[MTEpisodeLockup iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:](self, "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:", &v126, a4, a3, v33, v102, v35, v37);
  -[MTEpisodeLockup descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:](self, "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:", a4, a3, v124, v122, v103, v118, v26, v105, v104, v120, *(_QWORD *)&v33, *(_QWORD *)&v102, *(_QWORD *)&v35, *(_QWORD *)&v37, v126, v127, v128,
    v42,
    v43,
    v44,
    v45);
  v47 = v46;
  v49 = v48;
  -[MTEpisodeLockup exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:](self, "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:", a4, *(_QWORD *)&v116, *(_QWORD *)&v114, *(_QWORD *)&v112, *(_QWORD *)&v110, *(_QWORD *)&v109, *(_QWORD *)&v108, *(_QWORD *)&v107, *(_QWORD *)&v106);
  v51 = v50;
  v121 = v52;
  -[MTEpisodeLockup moreButtonFrameForDescriptionFrame:](self, "moreButtonFrameForDescriptionFrame:", v49, v47);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v129.origin.y = v122;
  v129.origin.x = v124;
  v129.size.width = v103;
  v129.size.height = v118;
  MaxY = CGRectGetMaxY(v129);
  v130.origin.x = v54;
  v130.origin.y = v56;
  v130.size.width = v58;
  v130.size.height = v60;
  if (CGRectIsEmpty(v130))
  {
    v62 = v47 + v51;
  }
  else
  {
    v131.origin.x = v54;
    v131.origin.y = v56;
    v131.size.width = v58;
    v131.size.height = v60;
    v62 = CGRectGetMaxY(v131);
  }
  v63 = v47;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
  objc_msgSend(v64, "mt_offsetFromLastBaselineToBottom");
  v66 = v62 - v65;

  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    v123 = v66;
    v125 = MaxY;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    objc_msgSend(v67, "frame");
    v136.origin.x = v68;
    v136.origin.y = v69;
    v136.size.width = v70;
    v136.size.height = v71;
    v132.origin.x = v49;
    v132.origin.y = v47;
    v132.size.width = v121;
    v132.size.height = v51;
    v72 = CGRectEqualToRect(v132, v136);

    if (!v72)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
      objc_msgSend(v73, "setFrame:", v49, v47, v121, v51);

    }
    -[MTEpisodeLockup descriptionButtonFrameForDescriptionFrame:](self, "descriptionButtonFrameForDescriptionFrame:", v49, v47, v121, v51);
    v75 = v74;
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v115 = v76;
    v117 = v74;
    v111 = v80;
    v113 = v78;
    if (-[MTEpisodeLockup showsFooterTextView](self, "showsFooterTextView"))
    {
      -[MTEpisodeLockup footerFrameForDescriptionButtonFrame:descriptionFrame:](self, "footerFrameForDescriptionButtonFrame:descriptionFrame:", v75, v77, v79, v81, v49, v63, v121, v51);
      v83 = v82;
      y = v84;
      v86 = v63;
      width = v87;
      height = v89;
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
      x = v83;
      objc_msgSend(v91, "setFrame:", v83, y, width, height);

    }
    else
    {
      y = CGRectZero.origin.y;
      x = CGRectZero.origin.x;
      v86 = v63;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
    }
    v133.origin.x = v49;
    v133.origin.y = v86;
    v133.size.width = v121;
    v133.size.height = v51;
    v66 = v123;
    if (CGRectGetHeight(v133) > 0.0)
    {
      v134.origin.y = v115;
      v134.origin.x = v117;
      v134.size.height = v111;
      v134.size.width = v113;
      v92 = CGRectGetMaxY(v134);
      if (v123 < v92)
        v66 = v92;
    }
    MaxY = v125;
    v135.origin.x = x;
    v135.origin.y = y;
    v135.size.width = width;
    v135.size.height = height;
    v93 = CGRectGetMaxY(v135);
    if (v66 < v93)
      v66 = v93;
  }
  v94 = objc_msgSend((id)objc_opt_class(self), "titleFont");
  v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
  objc_msgSend(v95, "_scaledValueForValue:", 8.0);
  if (v96 < 8.0)
    v96 = 8.0;
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      v97 = v66 + v96 * 2.0;
      goto LABEL_25;
    case 1uLL:
      v99 = v66 + 5.0;
      goto LABEL_24;
    case 3uLL:
      if (MaxY >= v66)
        v99 = MaxY;
      else
        v99 = v66;
LABEL_24:
      v97 = v99 + v96;
LABEL_25:
      v98 = IMRoundToPixel(v97);
      break;
    default:
      v98 = 100.0;
      break;
  }

  return v98;
}

- (CGRect)artworkFrameForStyle:(unint64_t)a3 forViewWidth:(double)a4
{
  double v7;
  double width;
  double v9;
  CGFloat height;
  unsigned int v11;
  double v12;
  double x;
  double y;
  double v15;
  double v16;
  CGRect result;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend((id)objc_opt_class(self), "artworkSizeForStyle:", a3);
    width = v7;
    height = v9;
    v11 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    x = a4 - v12 - width;
    if (!v11)
      x = v12;
    y = 8.0;
    if (a3 == 2)
      y = 16.0;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)titleOriginXForViewWidth:(double)result artworkFrame:(CGRect)a4 buttonFrame:(CGRect)a5 style:(unint64_t)a6
{
  double v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;

  if (a6 - 2 < 2)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    if (!-[MTEpisodeLockup _isRTL](self, "_isRTL", result))
    {
      v13 = x;
      v14 = y;
      v15 = width;
      v16 = height;
      return CGRectGetMaxX(*(CGRect *)&v13) + 8.0;
    }
LABEL_6:
    if (CGRectIsEmpty(a5))
    {
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      return v12;
    }
    v13 = a5.origin.x;
    v14 = a5.origin.y;
    v15 = a5.size.width;
    v16 = a5.size.height;
    return CGRectGetMaxX(*(CGRect *)&v13) + 8.0;
  }
  if (a6 <= 1)
  {
    if (!-[MTEpisodeLockup _isRTL](self, "_isRTL", result, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height))
    {
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      return v7;
    }
    goto LABEL_6;
  }
  return result;
}

- (CGSize)titleSizeForViewWidth:(double)a3 titleOrigin:(CGPoint)a4 artworkFrame:(CGRect)a5 buttonViewFrame:(CGRect)a6 style:(unint64_t)a7
{
  double y;
  double x;
  unsigned int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat width;
  CGFloat height;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize result;

  y = a4.y;
  x = a4.x;
  v10 = objc_msgSend((id)objc_opt_class(self), "showsArtworkForStyle:", a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  if (x != v13 || y != v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v22, "setFrame:", x, y, v19, v21);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleExclusionPathsForButtonViewFrame:](self, "titleExclusionPathsForButtonViewFrame:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "textContainer"));
  objc_msgSend(v25, "setExclusionPaths:", v23);

  LODWORD(v24) = CGRectIsEmpty(a6);
  v26 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  if ((_DWORD)v24)
  {
    if (!v26)
    {
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      v32 = a3 - v33;
      goto LABEL_16;
    }
    if (v10)
      goto LABEL_9;
  }
  else
  {
    if (!v26)
    {
      v27 = a6.origin.x;
      v28 = a6.origin.y;
      width = a6.size.width;
      height = a6.size.height;
      goto LABEL_15;
    }
    if (v10)
    {
LABEL_9:
      v27 = a5.origin.x;
      v28 = a5.origin.y;
      width = a5.size.width;
      height = a5.size.height;
LABEL_15:
      v32 = CGRectGetMinX(*(CGRect *)&v27) + -8.0;
      goto LABEL_16;
    }
  }
  -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
  v32 = a3 - v31;
LABEL_16:
  v34 = v32 - x;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  objc_msgSend(v35, "sizeThatFits:", v34, 1.79769313e308);
  v37 = v36;

  v38 = v34;
  v39 = v37;
  result.height = v39;
  result.width = v38;
  return result;
}

- (double)titleOriginYForArtworkFrame:(CGRect)a3 style:(unint64_t)a4
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MinY;
  double v17;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
  v10 = v9;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(v9, "mt_offsetFromCapHeightToAscent");
      v12 = 16.0;
      goto LABEL_4;
    case 1uLL:
      objc_msgSend(v9, "mt_offsetFromCapHeightToAscent");
      v12 = 13.0;
LABEL_4:
      v13 = v12 - v11;
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v9, "mt_offsetFromCapHeightToAscent");
      v15 = v14;
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v13 = CGRectGetMinY(v19) + 3.5 - v15;
      goto LABEL_7;
    case 3uLL:
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      MinY = CGRectGetMinY(v20);
      objc_msgSend(v10, "mt_offsetFromCapHeightToAscent");
      v13 = MinY - v17;
LABEL_7:
      height = IMRoundToPixel(v13);
      break;
    default:
      break;
  }

  return height;
}

- (double)descriptionOriginForViewWidth:(CGFloat)a3 artworkFrame:(CGFloat)a4 buttonViewFrame:(CGFloat)a5 titleFrame:(CGFloat)a6 metadataFrame:(uint64_t)a7 iconViewFrame:(unint64_t)a8 style:(double)a9
{
  void *v31;
  void *v32;
  double Height;
  double v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MaxY;
  void *v44;
  unsigned int v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MinX;
  unsigned int v52;
  CGFloat v53;
  double v54;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  CGFloat v73;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_currentTitleFont"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
  v76.origin.x = a20;
  v76.origin.y = a21;
  v76.size.width = a22;
  v76.size.height = a23;
  Height = CGRectGetHeight(v76);
  v77.origin.x = a24;
  v77.origin.y = a25;
  v77.size.width = a26;
  v77.size.height = a27;
  v34 = CGRectGetHeight(v77);
  if (Height >= v34)
    v34 = Height;
  if (v34 <= 0.0)
    v35 = v31;
  else
    v35 = v32;
  v36 = v35;
  if (a8 < 2)
  {
LABEL_9:
    objc_msgSend(v31, "lineHeight");
    v38 = v37;
    objc_msgSend(v36, "mt_offsetFromLastBaselineToBottom");
    v40 = v38 - v39;
    objc_msgSend(v32, "mt_offsetFromFirstBaselineToTop");
    v42 = v41;
    v78.origin.x = a16;
    v78.origin.y = a17;
    v78.size.width = a18;
    v78.size.height = a19;
    MaxY = CGRectGetMaxY(v78);
    v79.origin.x = a20;
    v79.origin.y = a21;
    v79.size.width = a22;
    v79.size.height = a23;
    if (CGRectGetHeight(v79) > 0.0)
    {
      v80.origin.x = a20;
      v80.origin.y = a21;
      v80.size.width = a22;
      v80.size.height = a23;
      MaxY = CGRectGetMaxY(v80);
    }
    v81.origin.x = a24;
    v81.origin.y = a25;
    v81.size.width = a26;
    v81.size.height = a27;
    if (CGRectGetMaxY(v81) > MaxY)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "iconView"));
      v45 = objc_msgSend(v44, "isNotEmpty");

      if (v45)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v46, "scale");
        v48 = v47;

        v82.origin.x = a24;
        v82.origin.y = a25;
        v82.size.width = a26;
        v82.size.height = a27;
        MaxY = CGRectGetMaxY(v82) + 1.0 / v48 * 4.0;
      }
    }
    IMRoundToPixel(v40 - v42 + MaxY);
    if (objc_msgSend(a1, "_isRTL"))
    {
      objc_msgSend(a1, "descriptionWidthForViewWidth:titleFrame:style:", a8, a2, a16, a17, a18, a19);
      v50 = v49;
      v83.origin.x = a16;
      v83.origin.y = a17;
      v83.size.width = a18;
      v83.size.height = a19;
      MinX = CGRectGetMaxX(v83) - v50;
    }
    else
    {
      v84.origin.x = a16;
      v84.origin.y = a17;
      v84.size.width = a18;
      v84.size.height = a19;
      MinX = CGRectGetMinX(v84);
    }
    goto LABEL_34;
  }
  if (a8 != 2)
  {
    if (a8 != 3)
    {
      MinX = CGPointZero.x;
      goto LABEL_34;
    }
    goto LABEL_9;
  }
  v52 = objc_msgSend(a1, "_isRTL");
  v53 = a3;
  v54 = a4;
  if (v52)
  {
    v53 = a12;
    v54 = a13;
  }
  else
  {
    a14 = a5;
  }
  if (!v52)
    a15 = a6;
  v73 = CGRectGetMinX(*(CGRect *)&v53);
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "iconView"));
  v58 = 0.0;
  if (objc_msgSend(v57, "isNotEmpty"))
  {
    v85.origin.x = a24;
    v85.origin.y = a25;
    v85.size.width = a26;
    v85.size.height = a27;
    v58 = CGRectGetMaxY(v85);
  }

  v86.origin.x = a20;
  v86.origin.y = a21;
  v86.size.width = a22;
  v86.size.height = a23;
  if (CGRectGetHeight(v86) > 0.0)
  {
    v87.origin.x = a20;
    v87.origin.y = a21;
    v87.size.width = a22;
    v87.size.height = a23;
    v59 = CGRectGetMaxY(v87);
    objc_msgSend(v32, "mt_offsetFromLastBaselineToBottom");
    v58 = v59 - v60;
  }
  v88.origin.x = a16;
  v88.origin.y = a17;
  v88.size.width = a18;
  v88.size.height = a19;
  v61 = CGRectGetMaxY(v88);
  objc_msgSend(v31, "mt_offsetFromLastBaselineToBottom");
  v63 = v61 - v62;
  if (v63 >= v58)
    v64 = v63;
  else
    v64 = v58;
  v89.origin.x = a3;
  v89.origin.y = a4;
  v89.size.width = a5;
  v89.size.height = a6;
  v65 = CGRectGetMaxY(v89);
  if (v65 < v64)
    v65 = v64;
  v66 = v65 + 8.0;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](MTEpisodeLockup, "metadataFooterFont"));
  objc_msgSend(v67, "mt_offsetFromCapHeightToAscent");
  IMRoundToPixel(v66 - v68);

  MinX = v73;
LABEL_34:

  return MinX;
}

- (double)exactDescriptionSizeForOrigin:(double)a3 viewWidth:(double)a4 titleFrame:(double)a5 actionButtonFrame:(double)a6 downloadButtonFrame:(double)a7 style:(double)a8
{
  void *v32;
  id v33;
  id v34;
  double *v35;
  double v36;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  _BOOL8 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  double v59;
  double v60;
  double v61;
  double v62;

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_currentTitleFont"));
  v33 = objc_msgSend(a1, "isLabelMultipleLinesWithFrame:font:", v32, a5, a6, a7, a8);

  v62 = a4;
  if ((objc_msgSend(a1, "isExpanded") & 1) != 0)
    v34 = 0;
  else
    v34 = objc_msgSend((id)objc_opt_class(a1), "descriptionNumberOfLinesForStyle:isTitleMultipleLines:", a10, v33);
  objc_msgSend(a1, "_setNumberOfLinesForDescription:", v34);
  v35 = a1 + 3;
  v36 = a1[3];
  if (v36 == CGSizeZero.width && a1[4] == CGSizeZero.height)
  {
    objc_msgSend(a1, "buttonsFrameForActionButtonFrame:downloadButtonFrame:", a12, a13, a14, a15, a16, a17, a18, a19);
    v39 = v38;
    v60 = v41;
    v61 = v40;
    v59 = v42;
    objc_msgSend(a1, "descriptionWidthForViewWidth:titleFrame:style:", a10, v62, a5, a6, a7, a8);
    v36 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionExclusionPathsForOrigin:descriptionWidth:buttonsFrame:titleFrame:", a2, a3, v43, v39, v61, v60, v59, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionTextView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "textContainer"));
    objc_msgSend(v46, "setExclusionPaths:", v44);

    objc_msgSend((id)objc_opt_class(a1), "descriptionMaxHeightForCurrentOrientation");
    v48 = v47;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionTextView"));
    objc_msgSend(v49, "sizeThatFits:", v36, v48);
    v51 = v50;

    v52 = v51 > v48;
    if (v51 <= v48)
      v48 = v51;
    objc_msgSend(a1, "setShowsDescriptionButton:", v52);
    if (v48 > 0.0)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionTextView"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "text"));
      if (objc_msgSend(v54, "length"))
      {

      }
      else
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionTextView"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "attributedText"));
        v57 = objc_msgSend(v56, "length");

        if (!v57)
          v48 = 0.0;
      }
    }
    *v35 = v36;
    v35[1] = v48;

  }
  return v36;
}

- (double)descriptionWidthForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v17;
  double MaxX;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned int v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double result;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v30 = v13;
  v31 = v12;
  v32 = v11;
  v33 = v10;
  v34 = v9;
  v35 = v5;
  switch(a5)
  {
    case 0uLL:
    case 2uLL:
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
      MaxX = a3 - v17;
      goto LABEL_7;
    case 1uLL:
    case 3uLL:
      height = a4.size.height;
      width = a4.size.width;
      y = a4.origin.y;
      x = a4.origin.x;
      v23 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
      v24 = x;
      v25 = y;
      v26 = width;
      v27 = height;
      if (v23)
        MaxX = CGRectGetMaxX(*(CGRect *)&v24);
      else
        MaxX = a3 - CGRectGetMinX(*(CGRect *)&v24);
LABEL_7:
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins", v14, v30, v31, v32, v33, v34, v6, v35, v7, v8);
      result = MaxX - v29;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (id)titleExclusionPathsForButtonViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v8 = &__NSArray0__struct;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v9, "convertRect:fromView:", self, x, y, width, height);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v18 = objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v11 + -5.0, v13, v15 + 5.0, v17));
    v19 = (void *)v18;
    if (v18)
    {
      v21 = v18;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    }
    else
    {
      v8 = &__NSArray0__struct;
    }

  }
  return v8;
}

- (id)titleExclusionPathsForExplicitIconFrame:(CGRect)a3 viewWidth:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v10 = &__NSArray0__struct;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v11, "convertRect:fromView:", self, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    if (-[MTEpisodeLockup _isRTL](self, "_isRTL"))
    {
      v26.origin.x = v13;
      v26.origin.y = v15;
      v26.size.width = v17;
      v26.size.height = v19;
      v20 = CGRectGetMaxX(v26) + 5.0;
      v21 = 0.0;
    }
    else
    {
      v21 = v13 + -5.0;
      v27.origin.x = v21;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      v20 = a4 - CGRectGetMinX(v27);
    }
    v22 = objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v21, v15, v20, v19));
    v23 = (void *)v22;
    if (v22)
    {
      v25 = v22;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    }
    else
    {
      v10 = &__NSArray0__struct;
    }

  }
  return v10;
}

- (id)descriptionExclusionPathsForOrigin:(CGPoint)a3 descriptionWidth:(double)a4 buttonsFrame:(CGRect)a5 titleFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3.y;
  v12 = a3.x;
  if (CGRectIsEmpty(a5))
    goto LABEL_4;
  v18.size.height = 1.79769313e308;
  v18.origin.x = v12;
  v18.origin.y = v11;
  v18.size.width = a4;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (!CGRectIntersectsRect(v18, v21))
  {
LABEL_4:
    v13 = 0;
  }
  else
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v20 = CGRectOffset(v19, -v12, -v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = v14;
  if (v13)
    objc_msgSend(v14, "addObject:", v13);
  v16 = objc_msgSend(v15, "copy");

  return v16;
}

- (BOOL)isLabelMultipleLinesWithFrame:(CGRect)a3 font:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectGetHeight(v16);
  objc_msgSend(v8, "lineHeight");
  v11 = v10;

  v12 = v11 * 1.5;
  if (qword_1005673E0 != -1)
    dispatch_once(&qword_1005673E0, &stru_1004A93D0);
  v13 = floor(v12 * *(double *)&qword_100551090) / *(double *)&qword_100551090;
  v14 = floor(v12);
  if (*(double *)&qword_100551090 == 1.0)
    v13 = v14;
  return v9 >= v13;
}

- (CGRect)metadataFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MaxX;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat MaxY;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MinX = CGRectGetMinX(a4);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  MaxX = CGRectGetMaxX(v49);
  v44 = MaxX;
  if (!-[MTEpisodeLockup _isRTL](self, "_isRTL"))
    MaxX = a3 - MinX;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel", *(_QWORD *)&v44));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributedText"));
  v47 = width;
  v48 = height;
  v46 = MinX;
  if (objc_msgSend(v14, "length"))
  {

LABEL_6:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
    objc_msgSend(v18, "sizeThatFits:", MaxX, 1.79769313e308);
    v20 = v19;
    v22 = v21;

    goto LABEL_7;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "text"));
  v17 = objc_msgSend(v16, "length");

  if (v17)
    goto LABEL_6;
  v20 = CGSizeZero.width;
  v22 = CGSizeZero.height;
LABEL_7:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup titleFont](MTEpisodeLockup, "titleFont"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
  objc_msgSend(v23, "lineHeight");
  v26 = v25;
  objc_msgSend(v23, "mt_offsetFromLastBaselineToBottom");
  v28 = v27;
  objc_msgSend(v24, "mt_offsetFromFirstBaselineToTop");
  v30 = v29;
  if (qword_1005673E0 != -1)
    dispatch_once(&qword_1005673E0, &stru_1004A93D0);
  v31 = ceil(v20 * *(double *)&qword_100551090) / *(double *)&qword_100551090;
  v32 = ceil(v20);
  if (*(double *)&qword_100551090 == 1.0)
    v33 = v32;
  else
    v33 = v31;
  v34 = ceil(v22 * *(double *)&qword_100551090) / *(double *)&qword_100551090;
  v35 = ceil(v22);
  if (*(double *)&qword_100551090 == 1.0)
    v36 = v35;
  else
    v36 = v34;
  if (-[MTEpisodeLockup _isRTL](self, "_isRTL"))
    v37 = v45 - v33;
  else
    v37 = v46;
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = v47;
  v50.size.height = v48;
  MaxY = CGRectGetMaxY(v50);
  v39 = IMRoundToPixel(v26 - v28 - v30 + MaxY);

  v40 = v37;
  v41 = v39;
  v42 = v33;
  v43 = v36;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (CGRect)moreButtonFrameForDescriptionFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double MinX;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  id v23;
  double MinY;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  unsigned int v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[MTEpisodeLockup showsMoreButton](self, "showsMoreButton"))
  {
    MinX = CGRectZero.origin.x;
    v18 = CGRectZero.origin.y;
    v19 = CGRectZero.size.width;
    v20 = CGRectZero.size.height;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
  objc_msgSend(v8, "lineHeight");
  v10 = v9;
  objc_msgSend(v8, "mt_offsetFromLastBaselineToBottom");
  v12 = v10 - v11;
  objc_msgSend(v8, "mt_offsetFromFirstBaselineToTop");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attributedText"));
  if (objc_msgSend(v16, "length"))
  {

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "text"));
    v23 = objc_msgSend(v22, "length");

    if (!v23)
    {
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      MinY = CGRectGetMinY(v40);
      goto LABEL_7;
    }
  }
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  MinY = CGRectGetMaxY(v39);
LABEL_7:
  v25 = MinY;
  v26 = v12 - v14;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
  objc_msgSend(v27, "frame");
  v19 = v28;
  v20 = v29;

  v30 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  if (v30)
    MinX = CGRectGetMaxX(*(CGRect *)&v31) - v19;
  else
    MinX = CGRectGetMinX(*(CGRect *)&v31);
  v18 = IMRoundToPixel(v26 + v25);

LABEL_11:
  v35 = MinX;
  v36 = v18;
  v37 = v19;
  v38 = v20;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)iconsViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 metadataFrame:(CGRect *)a5 style:(unint64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double MaxY;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unsigned int v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MinY;
  double v46;
  double v47;
  NSAttributedStringKey v48;
  void *v49;
  CGRect v50;
  CGRect result;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup titleFont](MTEpisodeLockup, "titleFont", a5, a6, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributedText"));
  if (objc_msgSend(v12, "length"))
  {

LABEL_4:
    v48 = NSFontAttributeName;
    v49 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    objc_msgSend(CFSTR(" "), "sizeWithAttributes:", v16);
    v18 = v17;

    MaxY = CGRectGetMaxY(*a5);
    objc_msgSend(v10, "mt_offsetFromLastBaselineToBottom");
    v21 = MaxY - v20;
    v22 = 0.0;
    goto LABEL_5;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));
  v15 = objc_msgSend(v14, "length");

  if (v15)
    goto LABEL_4;
  MinY = CGRectGetMinY(*a5);
  objc_msgSend(v10, "mt_offsetFromFirstBaselineToTop");
  v21 = MinY + v46;
  objc_msgSend(v9, "mt_leftMargin");
  v22 = v47;
  v18 = 0.0;
LABEL_5:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;

  v28 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  x = a5->origin.x;
  y = a5->origin.y;
  width = a5->size.width;
  height = a5->size.height;
  if (v28)
    v33 = CGRectGetMinX(*(CGRect *)&x) - v25 - v18 - v22;
  else
    v33 = v22 + v18 + CGRectGetMaxX(*(CGRect *)&x);
  if (-[MTEpisodeLockup _isRTL](self, "_isRTL"))
  {
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    v35 = v34 - v33;
    if (v34 - v33 > 0.0)
    {
      v33 = v33 + v35;
      a5->origin.x = v35 + a5->origin.x;
LABEL_13:
      a5->size.width = a5->size.width - v35;
    }
  }
  else
  {
    v50.origin.x = v33;
    v50.origin.y = v21 - v27;
    v50.size.width = v25;
    v50.size.height = v27;
    v36 = CGRectGetMaxX(v50) - a3;
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    v35 = v36 + v37;
    if (v36 + v37 > 0.0)
    {
      v33 = v33 - v35;
      goto LABEL_13;
    }
  }
  v38 = UIPointRoundToViewScale(0, v33, v21 - v27);
  v40 = v39;

  v41 = v38;
  v42 = v40;
  v43 = v25;
  v44 = v27;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (CGRect)playStatusViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 artworkFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MinY;
  void *v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "scale");
  v13 = v12;

  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState"))
  {
    objc_msgSend((id)objc_opt_class(self), "leadingMarginForViewWidth:", a3);
    v15 = IMRoundToPixel((v14 + -14.0) * 0.5);
    v16 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
    v17 = -[MTEpisodeLockup showsArtwork](self, "showsArtwork");
    if (v17)
      v18 = a5.size.height;
    else
      v18 = height;
    if (v17)
      v19 = a5.size.width;
    else
      v19 = width;
    if (v17)
      v20 = a5.origin.y;
    else
      v20 = y;
    v21 = a5.origin.x;
    if (!v17)
      v21 = x;
    if (v16)
      v22 = v15 + CGRectGetMaxX(*(CGRect *)(&v18 - 3));
    else
      v22 = CGRectGetMinX(*(CGRect *)(&v18 - 3)) + -14.0 - v15;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    MinY = CGRectGetMinY(v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
    objc_msgSend(v27, "mt_offsetFromCapHeightToAscent");
    v23 = IMRoundToPixel(MinY + v28) - (1.0 / v13 + 1.0 / v13);

    v25 = 14.0;
    v24 = 14.0;
  }
  else
  {
    v22 = CGRectZero.origin.x;
    v23 = CGRectZero.origin.y;
    v24 = CGRectZero.size.width;
    v25 = CGRectZero.size.height;
  }
  v29 = v22;
  v30 = v23;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)downloadButtonFrameForActionButtonFrame:(CGRect)a3 titleOriginY:(double)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)actionButtonFrameForViewWidth:(double)a3 titleOriginY:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup titleFont](MTEpisodeLockup, "titleFont"));
  if (-[MTEpisodeLockup _isRTL](self, "_isRTL"))
  {
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    v14 = v13;
  }
  else
  {
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    v14 = a3 - v9 - v15;
  }
  objc_msgSend(v12, "mt_offsetFromCapHeightToAscent");
  v17 = v16 + a4;
  objc_msgSend(v12, "capHeight");
  v19 = IMRoundToPixel(v17 + (v18 - v11) * 0.5);

  v20 = v14;
  v21 = v19;
  v22 = v9;
  v23 = v11;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)buttonsFrameForActionButtonFrame:(CGRect)a3 downloadButtonFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (!CGRectIsEmpty(a4))
  {
    v16.origin.x = v11;
    v16.origin.y = v10;
    v16.size.width = v9;
    v16.size.height = v8;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v17 = CGRectUnion(v16, v19);
    v11 = v17.origin.x;
    v10 = v17.origin.y;
    v9 = v17.size.width;
    v8 = v17.size.height;
  }
  v12 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)descriptionButtonFrameForDescriptionFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinY;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  unsigned int v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat MaxX;
  CGFloat v34;
  double v35;
  double MinX;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat MaxY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGRect v50;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinY = CGRectGetMinY(a3);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  if (CGRectGetHeight(v50) > 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutManager"));
    objc_msgSend(v9, "_lastGlyphBaselineRightPointWithLayoutManager:", v11);
    v13 = v12;
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    -[MTEpisodeLockup convertPoint:fromView:](self, "convertPoint:fromView:", v16, v13, v15);
    v18 = v17;

    MinY = v18 + 2.0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](MTEpisodeLockup, "metadataHeaderFont"));
  objc_msgSend(v19, "lineHeight");
  v21 = v20;
  objc_msgSend(v19, "mt_offsetFromLastBaselineToBottom");
  v48 = v22;
  objc_msgSend(v19, "mt_offsetFromFirstBaselineToTop");
  v47 = v23;
  if (-[MTEpisodeLockup showsDescriptionButton](self, "showsDescriptionButton"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionButton](self, "descriptionButton"));
    objc_msgSend(v24, "frame");
    v26 = v25;
    v49 = v27;

  }
  else
  {
    v26 = CGSizeZero.width;
    v49 = CGSizeZero.height;
  }
  v28 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  if (v28)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v29);
    v34 = height;
    v35 = v26;
    MinX = MaxX - v26;
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v29);
    v34 = height;
    v35 = v26;
  }
  v37 = x;
  v38 = y;
  v39 = width;
  MaxY = CGRectGetMaxY(*(CGRect *)(&v34 - 3));
  objc_msgSend(v19, "mt_offsetFromFirstBaselineToTop", IMRoundToPixel(v21 - v48 - v47 + MaxY));
  v42 = MinY + v21 - v41;

  v43 = MinX;
  v44 = v42;
  v45 = v35;
  v46 = v49;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (CGRect)footerFrameForDescriptionButtonFrame:(CGRect)a3 descriptionFrame:(CGRect)a4
{
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat MinX;
  double v29;
  double v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double height;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](MTEpisodeLockup, "descriptionFont"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](MTEpisodeLockup, "metadataFooterFont"));
  v39.origin.x = v10;
  v39.origin.y = v9;
  v39.size.width = v8;
  v39.size.height = v7;
  if (CGRectGetHeight(v39) <= 0.0)
    v14 = 2.0;
  else
    v14 = 0.0;
  v40.origin.x = v10;
  v40.origin.y = v9;
  v40.size.width = v8;
  v40.size.height = v7;
  v15 = CGRectGetHeight(v40);
  v16 = v15 <= 0.0;
  if (v15 <= 0.0)
    v17 = x;
  else
    v17 = v10;
  if (v16)
    v18 = y;
  else
    v18 = v9;
  if (v16)
    v19 = width;
  else
    v19 = v8;
  if (v16)
    v20 = height;
  else
    v20 = v7;
  MaxY = CGRectGetMaxY(*(CGRect *)&v17);
  objc_msgSend(v13, "_scaledValueForValue:", 26.0);
  v23 = v22;
  objc_msgSend(v12, "mt_offsetFromLastBaselineToBottom");
  v25 = v23 - v24;
  objc_msgSend(v13, "mt_offsetFromFirstBaselineToTop");
  v27 = v25 - v26 - v14;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  MinX = CGRectGetMinX(v41);
  v29 = IMRoundToPixel(MaxY + v27);
  if (-[MTEpisodeLockup showsFooterTextView](self, "showsFooterTextView"))
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v30 = CGRectGetWidth(v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    objc_msgSend(v31, "sizeThatFits:", v30, 1.79769313e308);
    v33 = v32;

  }
  else
  {
    v30 = CGRectZero.size.width;
    v33 = CGRectZero.size.height;
  }

  v34 = MinX;
  v35 = v29;
  v36 = v30;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)update
{
  void *v3;
  void *v4;

  -[MTEpisodeLockup invalidateSizeMetrics](self, "invalidateSizeMetrics");
  if (!-[MTEpisodeLockup updateTitleFontIfNeeded](self, "updateTitleFontIfNeeded")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage")),
        v3,
        !v3))
  {
    -[MTEpisodeLockup updateTitleIncludingIcons](self, "updateTitleIncludingIcons");
  }
  if (!-[MTEpisodeLockup updateDisabledReason](self, "updateDisabledReason"))
    -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));

  if (v4)
    -[MTEpisodeLockup beginLoadingArtwork](self, "beginLoadingArtwork");
  -[MTEpisodeLockup updateIcons](self, "updateIcons");
  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateMetadataText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[MTEpisodeLockup showsPubDate](self, "showsPubDate"))
    v3 = 7;
  else
    v3 = 5;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[MTEpisodeDescriptionCache sharedInstance](MTEpisodeDescriptionCache, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "descriptionForEpisode:options:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  objc_msgSend(v6, "setAttributedText:", v5);

}

- (void)updateFooterText
{
  void *v3;
  void *v4;
  double v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    if (objc_msgSend(v3, "isPartiallyPlayed"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
      objc_msgSend(v4, "timeRemaining");
      v6 = v5 > 0.0;

    }
    else
    {
      v6 = 0;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeDescriptionCache sharedInstance](MTEpisodeDescriptionCache, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadataFooterForEpisode:includingDuration:", v8, v6));

    if (objc_msgSend(v13, "length"))
      v9 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v13);
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentDescriptionColor](self, "_currentDescriptionColor"));
    objc_msgSend(v9, "im_addAttribute:value:", NSForegroundColorAttributeName, v10);

    v11 = objc_msgSend(v9, "copy");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    objc_msgSend(v12, "setAttributedText:", v11);

  }
}

- (void)updateDescriptionText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

  if (v3)
  {
    -[MTEpisodeLockup updateMetadataText](self, "updateMetadataText");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeDescriptionCache sharedInstance](MTEpisodeDescriptionCache, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionForEpisode:options:", v5, 16));

    if (objc_msgSend(v10, "length"))
      v6 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v10);
    else
      v6 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentDescriptionColor](self, "_currentDescriptionColor"));
    objc_msgSend(v6, "addAttribute:value:range:", NSForegroundColorAttributeName, v7, 0, objc_msgSend(v10, "length"));

    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    objc_msgSend(v9, "setAttributedText:", v8);

    -[MTEpisodeLockup updateFooterText](self, "updateFooterText");
    -[MTEpisodeLockup invalidateSizeMetrics](self, "invalidateSizeMetrics");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");

  }
}

- (BOOL)updateDisabledReason
{
  void *v3;
  id v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  v4 = objc_msgSend(v3, "reasonForNotPlayable");

  v5 = -[MTEpisodeLockup disabledReason](self, "disabledReason");
  if ((id)v5 != v4)
    -[MTEpisodeLockup setDisabledReason:](self, "setDisabledReason:", v4);
  return v5 != (_QWORD)v4;
}

- (void)setDisabledReason:(int64_t)a3
{
  double v4;
  void *v5;
  id v6;

  if (self->_disabledReason != a3)
  {
    self->_disabledReason = a3;
    if (a3)
      UIInterfaceGetContentDisabledAlpha();
    else
      v4 = 1.0;
    -[MTEpisodeLockup setAlpha:](self, "setAlpha:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

    if (v5)
    {
      -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
      -[MTEpisodeLockup updateIcons](self, "updateIcons");
    }
    if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup delegate](self, "delegate"));
      objc_msgSend(v6, "lockupDidChangeSize:", self);

    }
  }
}

- (void)setShowsArtwork:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    if (a3)
    {
      v4 = objc_msgSend((id)objc_opt_class(self), "defaultArtworkForStyle:", -[MTEpisodeLockup style](self, "style"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      objc_msgSend(v6, "setArtwork:", v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      objc_msgSend(v7, "sizeToFit");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v8);

      -[MTEpisodeLockup beginLoadingArtwork](self, "beginLoadingArtwork");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      objc_msgSend(v9, "removeFromSuperview");

      -[MTEpisodeLockup setArtworkView:](self, "setArtworkView:", 0);
    }
    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)beginLoadingArtwork
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView superview](self->_artworkView, "superview"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "podcastUuid"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend((id)objc_opt_class(self), "artworkSizeForStyle:", -[MTEpisodeLockup style](self, "style"));
      v10 = v9;
      if (v9 >= 0.100000001)
      {
        v11 = v8;
        if (v8 >= 0.100000001)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "podcastUuid"));

          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageInMemoryForKey:size:", v13, v10, v11));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
            objc_msgSend(v16, "setArtwork:", v15);

          }
          else
          {
            objc_initWeak(&location, self);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_1000AAF84;
            v18[3] = &unk_1004A93B0;
            objc_copyWeak(&v19, &location);
            objc_msgSend(v17, "asyncImageForKey:size:completionHandler:", v13, v18, v10, v11);

            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
          }

        }
      }
    }
  }
}

- (void)setShowsMoreButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_showsMoreButton != a3)
  {
    v3 = a3;
    self->_showsMoreButton = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
    v6 = v5;
    if (v3)
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);
    else
      objc_msgSend(v5, "removeFromSuperview");

    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateMoreButtonVisibility
{
  uint64_t v3;

  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
    v3 = 0;
  else
    v3 = -[MTEpisodeLockup isEditing](self, "isEditing") ^ 1;
  -[MTEpisodeLockup setShowsMoreButton:](self, "setShowsMoreButton:", v3);
}

- (void)setShowsDescriptionButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_showsDescriptionButton != a3)
  {
    v3 = a3;
    self->_showsDescriptionButton = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionButton](self, "descriptionButton"));
    v6 = v5;
    if (v3)
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);
    else
      objc_msgSend(v5, "removeFromSuperview");

    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsFooterTextView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_showsFooterTextView != a3)
  {
    v3 = a3;
    self->_showsFooterTextView = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    v6 = v5;
    if (v3)
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);
    else
      objc_msgSend(v5, "removeFromSuperview");

    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateFooterTextViewVisbility
{
  void *v3;
  id v4;

  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedText"));
    -[MTEpisodeLockup setShowsFooterTextView:](self, "setShowsFooterTextView:", objc_msgSend(v3, "length") != 0);

  }
  else
  {
    -[MTEpisodeLockup setShowsFooterTextView:](self, "setShowsFooterTextView:", 0);
  }
}

- (BOOL)updateTitleFontIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend((id)objc_opt_class(self), "titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v7, "setFont:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage"));
    if (v8)
      -[MTEpisodeLockup updateTitleIncludingIcons](self, "updateTitleIncludingIcons");
  }

  return v6 ^ 1;
}

- (void)setTitleImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_titleImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_titleImage, a3);
    -[MTEpisodeLockup updateTitleIncludingIcons](self, "updateTitleIncludingIcons");
    v5 = v6;
  }

}

- (void)updateTitleIncludingIcons
{
  void *v3;
  NSTextAttachment *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage"));

  if (v3)
  {
    v4 = objc_opt_new(NSTextAttachment);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage"));
    -[NSTextAttachment setImage:](v4, "setImage:", v5);

    v6 = objc_alloc_init((Class)NSMutableAttributedString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bestTitle"));

    if (v8)
    {
      v9 = objc_alloc((Class)NSAttributedString);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bestTitle"));
      v12 = objc_msgSend(v9, "initWithString:", v11);
      objc_msgSend(v6, "appendAttributedString:", v12);

    }
    v13 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
    objc_msgSend(v6, "appendAttributedString:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v4));
    objc_msgSend(v6, "appendAttributedString:", v14);

    v20[0] = NSFontAttributeName;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
    v21[0] = v15;
    v20[1] = NSForegroundColorAttributeName;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleColor](self, "_currentTitleColor"));
    v21[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

    objc_msgSend(v6, "addAttributes:range:", v17, 0, objc_msgSend(v6, "length"));
    v18 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithAttributedString:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v19, "setAttributedText:", v18);

  }
  else
  {
    v4 = (NSTextAttachment *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NSTextAttachment bestTitle](v4, "bestTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v17, "setText:", v6);
  }

  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (void)startObservingPlaybackState
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updatePlayStatusIcons", IMAVPlayerNotification_StateDidChange, 0);

}

- (void)stopObservingPlaybackState
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, IMAVPlayerNotification_StateDidChange, 0);

}

- (void)playbackStateDidChange
{
  if (-[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem"))
    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
}

- (void)updateIcons
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  -[MTEpisodeLockup setShowsExplicitIcon:](self, "setShowsExplicitIcon:", objc_msgSend(v3, "isExplicit"));

  if (!-[MTEpisodeLockup updateIsCurrentPlayerItemState](self, "updateIsCurrentPlayerItemState"))
    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
  -[MTEpisodeLockup updateAssetStatusIcons](self, "updateAssetStatusIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  objc_msgSend(v4, "setVideo:", objc_msgSend(v5, "isVideo"));

  -[MTEpisodeLockup updateIconView](self, "updateIconView");
}

- (BOOL)updateIsCurrentPlayerItemState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v6 = objc_msgSend(v3, "isPlayingEpisodeUuid:", v5);

  v7 = v6 ^ -[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem");
  if (v7 == 1)
    -[MTEpisodeLockup setCurrentPlayerItem:](self, "setCurrentPlayerItem:", v6);
  return v7;
}

- (void)updatePlayStatusIcons
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTEpisodeLockup *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState")
    && !-[MTEpisodeLockup showsArtwork](self, "showsArtwork")
    && -[MTEpisodeLockup shouldShowNowPlaying](self, "shouldShowNowPlaying"))
  {
    v3 = -[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem");
  }
  else
  {
    v3 = 0;
  }
  v12 = 0;
  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState") && (v3 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playStatusImageForTheme:", v5));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
  objc_msgSend(v6, "setImage:", v12);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
  objc_msgSend(v7, "sizeToFit");

  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup barsView](self, "barsView"));
    v9 = (MTEpisodeLockup *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));

    if (v9 != self)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup barsView](self, "barsView"));
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v10);

    }
    -[MTEpisodeLockup updateStateForBarsView:](self, "updateStateForBarsView:", self->_barsView);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTNowPlayingIndicatorView superview](self->_barsView, "superview"));

    if (v11)
    {
      -[MTNowPlayingIndicatorView setPlaybackState:](self->_barsView, "setPlaybackState:", 0);
      -[MTNowPlayingIndicatorView removeFromSuperview](self->_barsView, "removeFromSuperview");
    }
  }
  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateStateForBarsView:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (-[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    v5 = objc_msgSend(v4, "isTargetPlaying");

    if (v5)
      v6 = 1;
    else
      v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v7, "setPlaybackState:", v6);

}

- (void)updateAssetStatusIcons
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  v4 = objc_msgSend(v3, "isExternalType");

  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    if ((objc_msgSend(v6, "isReachable") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
      v8 = objc_msgSend(v7, "feedDeleted");

      if (!v8)
      {
        v5 = 2;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v5 = 3;
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  objc_msgSend(v9, "setAssetStatus:", v5);

}

- (void)updateIconView
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  MTEpisodeLockup *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  v4 = objc_msgSend(v3, "isNotEmpty");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  v6 = v5;
  if (!v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (!v10)
      return;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    objc_msgSend(v9, "removeFromSuperview");
    goto LABEL_6;
  }
  objc_msgSend(v5, "updateSizeIfNeeded");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  v8 = (MTEpisodeLockup *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

  if (v8 != self)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v9);
LABEL_6:

  }
  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsExplicitIcon:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_showsExplicitIcon != a3)
  {
    v3 = a3;
    self->_showsExplicitIcon = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    objc_msgSend(v4, "setExplicit:", v3);

  }
}

- (BOOL)_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[MTEpisodeLockup semanticContentAttribute](self, "semanticContentAttribute")) == (id)1;
}

- (id)_currentTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "titleFont");
    v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }
  v8 = v6;

  return v8;
}

- (id)_currentDescriptionFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "descriptionFont");
    v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }
  v8 = v6;

  return v8;
}

- (id)_currentTitleColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textColor"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor primaryTextColorForTheme:](UIColor, "primaryTextColorForTheme:", v7));

  }
  return v6;
}

- (id)_currentDescriptionColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textColor"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](UIColor, "secondaryTextColorForTheme:", v7));

  }
  return v6;
}

- (void)_setNumberOfLinesForDescription:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textContainer"));
  v7 = objc_msgSend(v6, "maximumNumberOfLines");

  if (v7 != (id)a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textContainer"));
    objc_msgSend(v9, "setMaximumNumberOfLines:", a3);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textContainer"));
    objc_msgSend(v11, "textContainerChangedGeometry:", v13);

    self->_descriptionSize = CGSizeZero;
  }
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (MTEpisodeLockupDelegate)delegate
{
  return (MTEpisodeLockupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTEpisodeActionController)actionController
{
  return self->_actionController;
}

- (void)setActionController:(id)a3
{
  objc_storeStrong((id *)&self->_actionController, a3);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (BOOL)shouldShowNowPlaying
{
  return self->_shouldShowNowPlaying;
}

- (void)setShouldShowNowPlaying:(BOOL)a3
{
  self->_shouldShowNowPlaying = a3;
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)showsPubDate
{
  return self->_showsPubDate;
}

- (BOOL)showsPlayState
{
  return self->_showsPlayState;
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (void)setDescriptionButton:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionButton, a3);
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (NSOperation)imageLoadingOperation
{
  return self->_imageLoadingOperation;
}

- (void)setImageLoadingOperation:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoadingOperation, a3);
}

- (BOOL)showsDescriptionButton
{
  return self->_showsDescriptionButton;
}

- (BOOL)showsFooterTextView
{
  return self->_showsFooterTextView;
}

- (BOOL)showsExplicitIcon
{
  return self->_showsExplicitIcon;
}

- (BOOL)showsStreamingIcon
{
  return self->_showsStreamingIcon;
}

- (void)setShowsStreamingIcon:(BOOL)a3
{
  self->_showsStreamingIcon = a3;
}

- (BOOL)showsDocumentIcon
{
  return self->_showsDocumentIcon;
}

- (void)setShowsDocumentIcon:(BOOL)a3
{
  self->_showsDocumentIcon = a3;
}

- (BOOL)showsErrorIcon
{
  return self->_showsErrorIcon;
}

- (void)setShowsErrorIcon:(BOOL)a3
{
  self->_showsErrorIcon = a3;
}

- (BOOL)showsAirplaneModeIcon
{
  return self->_showsAirplaneModeIcon;
}

- (void)setShowsAirplaneModeIcon:(BOOL)a3
{
  self->_showsAirplaneModeIcon = a3;
}

- (void)setMoreAction:(id)a3
{
  objc_storeStrong((id *)&self->_moreAction, a3);
}

- (void)setBarsView:(id)a3
{
  objc_storeStrong((id *)&self->_barsView, a3);
}

- (void)setTitleTextView:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextView, a3);
}

- (void)setMetadataLabel:(id)a3
{
  objc_storeStrong((id *)&self->_metadataLabel, a3);
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
}

- (void)setFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextView, a3);
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (void)setPlayStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_playStatusView, a3);
}

- (void)setExplicitIconView:(id)a3
{
  objc_storeStrong((id *)&self->_explicitIconView, a3);
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (MTEpisodeStateView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonView, a3);
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (BOOL)showsMoreButton
{
  return self->_showsMoreButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_explicitIconView, 0);
  objc_storeStrong((id *)&self->_playStatusView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_storeStrong((id *)&self->_barsView, 0);
  objc_storeStrong((id *)&self->_moreAction, 0);
  objc_storeStrong((id *)&self->_imageLoadingOperation, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_descriptionButton, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_colorTheme, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_episode, 0);
  objc_storeStrong((id *)&self->_sizeCache, 0);
}

@end
