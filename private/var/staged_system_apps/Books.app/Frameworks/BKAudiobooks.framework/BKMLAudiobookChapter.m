@implementation BKMLAudiobookChapter

+ (id)customChapterTitleForMediaItem:(id)a3 mediaChapter:(id)a4 chapterIndex:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;

  v7 = a3;
  v8 = a4;
  if (qword_44E78 != -1)
    dispatch_once(&qword_44E78, &stru_38FA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bk_effectiveTitle"));
  if (!v9
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title")),
        v11 = objc_msgSend(v10, "hasPrefix:", v9),
        v10,
        !v11))
  {
LABEL_23:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bk_UTF8Title"));
    if (objc_msgSend(v23, "length"))
    {
      v24 = v23;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v26 = objc_msgSend(v25, "length");

      if (!v26)
      {
        v28 = BKAudiobooksBundle();
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("%@ - Chapter %@"), &stru_39448, &stru_39448));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5 + 1));
        v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v9, v31));

        goto LABEL_28;
      }
      v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    }
    v21 = v24;
LABEL_28:

    goto LABEL_29;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v9, "length")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", qword_44E70));
  if (v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bk_UTF8Title"));
    if (!objc_msgSend(v15, "hasPrefix:", v9))
    {
      v21 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v9, "length")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByTrimmingCharactersInSet:", qword_44E70));

    if (objc_msgSend(v14, "length") && objc_msgSend(v17, "length") && objc_msgSend(v14, "caseInsensitiveCompare:", v17))
    {
      v18 = BKAudiobooksBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("%@ - %@"), &stru_39448, &stru_39448));
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v14, v17));

    }
    else
    {
      if (objc_msgSend(v14, "length"))
      {
        v22 = v14;
      }
      else
      {
        if (!objc_msgSend(v17, "length"))
        {
          v21 = 0;
          goto LABEL_20;
        }
        v22 = v17;
      }
      v21 = v22;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!objc_msgSend(v14, "length"))
  {

    goto LABEL_23;
  }
  v21 = v14;
LABEL_22:

  if (!v21)
    goto LABEL_23;
LABEL_29:

  return v21;
}

- (BKMLAudiobookChapter)initWithMediaChapter:(id)a3 track:(id)a4 number:(unint64_t)a5 trackNumber:(unint64_t)a6 trackCount:(unint64_t)a7
{
  id v13;
  id v14;
  BKMLAudiobookChapter *v15;
  BKMLAudiobookChapter *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSString *author;
  id WeakRetained;
  void *v22;
  uint64_t v23;
  NSString *title;
  double v25;
  double v26;
  id v27;
  double v28;
  __int128 v29;
  id v30;
  double v31;
  __int128 v32;
  CMTime v34;
  CMTime v35;
  CMTime duration;
  CMTime start;
  CMTimeRange v38;
  objc_super v39;

  v13 = a3;
  v14 = a4;
  v39.receiver = self;
  v39.super_class = (Class)BKMLAudiobookChapter;
  v15 = -[BKMLAudiobookChapter init](&v39, "init");
  v16 = v15;
  if (v15)
  {
    v17 = objc_storeWeak((id *)&v15->_containingTrack, v14);
    v16->_chapterIndexInAudiobook = a5;
    v16->_albumTrackNumber = a6;
    v16->_albumTrackCount = a7;
    v18 = v17;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "author"));
    author = v16->_author;
    v16->_author = (NSString *)v19;

    WeakRetained = objc_loadWeakRetained((id *)&v16->_containingTrack);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mediaItem"));
    v23 = objc_claimAutoreleasedReturnValue(+[BKMLAudiobookChapter customChapterTitleForMediaItem:mediaChapter:chapterIndex:](BKMLAudiobookChapter, "customChapterTitleForMediaItem:mediaChapter:chapterIndex:", v22, v13, v16->_chapterIndexInAudiobook));
    title = v16->_title;
    v16->_title = (NSString *)v23;

    if (v13)
    {
      objc_storeStrong((id *)&v16->_mediaChapter, a3);
      objc_msgSend(v13, "playbackTime");
      v16->_startTimeInTrack = v25;
      objc_msgSend(v13, "playbackDuration");
      v16->_duration = v26;
    }
    else
    {
      v16->_startTimeInTrack = 0.0;
      v27 = objc_loadWeakRetained((id *)&v16->_containingTrack);
      objc_msgSend(v27, "duration");
      v16->_duration = v28;

    }
    CMTimeMake(&start, (uint64_t)(v16->_startTimeInTrack * 1000.0), 1000);
    CMTimeMake(&duration, (uint64_t)(v16->_duration * 1000.0), 1000);
    CMTimeRangeMake(&v38, &start, &duration);
    v29 = *(_OWORD *)&v38.start.epoch;
    *(_OWORD *)&v16->_timeRangeInTrack.start.value = *(_OWORD *)&v38.start.value;
    *(_OWORD *)&v16->_timeRangeInTrack.start.epoch = v29;
    *(_OWORD *)&v16->_timeRangeInTrack.duration.timescale = *(_OWORD *)&v38.duration.timescale;
    v30 = objc_loadWeakRetained((id *)&v16->_containingTrack);
    objc_msgSend(v30, "startTime");
    CMTimeMake(&v35, (uint64_t)((v31 + v16->_startTimeInTrack) * 1000.0), 1000);
    CMTimeMake(&v34, (uint64_t)(v16->_duration * 1000.0), 1000);
    CMTimeRangeMake(&v38, &v35, &v34);
    v32 = *(_OWORD *)&v38.start.epoch;
    *(_OWORD *)&v16->_timeRangeInAudiobook.start.value = *(_OWORD *)&v38.start.value;
    *(_OWORD *)&v16->_timeRangeInAudiobook.start.epoch = v32;
    *(_OWORD *)&v16->_timeRangeInAudiobook.duration.timescale = *(_OWORD *)&v38.duration.timescale;

  }
  return v16;
}

- (BKAudiobookTrack)track
{
  return (BKAudiobookTrack *)objc_loadWeakRetained((id *)&self->_containingTrack);
}

- (BKAudiobook)audiobook
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "audiobook"));

  return (BKAudiobook *)v3;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  Float64 Seconds;
  uint64_t v11;
  void *v12;
  CMTime v14;
  CMTime time;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[BKMLAudiobookChapter albumTrackNumber](self, "albumTrackNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter title](self, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter author](self, "author"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter customTitle](self, "customTitle"));
  -[BKMLAudiobookChapter timeRangeInAudiobook](self, "timeRangeInAudiobook");
  time = v14;
  Seconds = CMTimeGetSeconds(&time);
  -[BKMLAudiobookChapter duration](self, "duration");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p trackNumber=%lu title=%@ author=%@ customTitle=%@ range=(%.1lf,%.1lf)>"), v5, self, v6, v7, v8, v9, *(_QWORD *)&Seconds, v11));

  return (NSString *)v12;
}

- (NSString)title
{
  NSString *customTitle;

  customTitle = self->_customTitle;
  if (!customTitle)
    customTitle = self->_title;
  return customTitle;
}

- (CGImage)artwork
{
  id WeakRetained;
  CGImage *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = (CGImage *)objc_msgSend(WeakRetained, "artwork");

  return v3;
}

- (NSURL)assetURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "assetURL"));

  return (NSURL *)v3;
}

- (NSDate)dateLastOpened
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dateLastOpened"));

  return (NSDate *)v3;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter containingTrack](self, "containingTrack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bk_assetID"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter assetURL](self, "assetURL"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%lu"), v7, self->_chapterIndexInAudiobook));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

  }
  return (NSString *)v9;
}

- (MPNowPlayingContentItem)contentItem
{
  MPNowPlayingContentItem *contentItem;
  id v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  MPNowPlayingContentItem *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[3];
  _QWORD v36[3];

  contentItem = self->_contentItem;
  if (!contentItem)
  {
    v4 = objc_alloc((Class)MPNowPlayingContentItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter identifier](self, "identifier"));
    v6 = (MPNowPlayingContentItem *)objc_msgSend(v4, "initWithIdentifier:", v5);
    v7 = self->_contentItem;
    self->_contentItem = v6;

    -[MPNowPlayingContentItem setMediaType:](self->_contentItem, "setMediaType:", 4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containingTrack);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mediaItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artist"));
    -[MPNowPlayingContentItem setTrackArtistName:](self->_contentItem, "setTrackArtistName:", v10);

    v11 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "albumArtist"));
    -[MPNowPlayingContentItem setAlbumArtistName:](self->_contentItem, "setAlbumArtistName:", v13);

    v14 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaItem"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "genre"));
    -[MPNowPlayingContentItem setGenreName:](self->_contentItem, "setGenreName:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter title](self, "title"));
    -[MPNowPlayingContentItem setTitle:](self->_contentItem, "setTitle:", v17);

    v18 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mediaItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "albumTitle"));
    -[MPNowPlayingContentItem setAlbumName:](self->_contentItem, "setAlbumName:", v20);

    -[BKMLAudiobookChapter duration](self, "duration");
    -[MPNowPlayingContentItem setDuration:](self->_contentItem, "setDuration:");
    -[MPNowPlayingContentItem setElapsedTime:](self->_contentItem, "setElapsedTime:", 0.0);
    LODWORD(v21) = 0;
    -[MPNowPlayingContentItem setPlaybackRate:](self->_contentItem, "setPlaybackRate:", v21);
    LODWORD(v22) = 1.0;
    -[MPNowPlayingContentItem setDefaultPlaybackRate:](self->_contentItem, "setDefaultPlaybackRate:", v22);
    -[MPNowPlayingContentItem setNumberOfChildren:](self->_contentItem, "setNumberOfChildren:", 0);
    -[MPNowPlayingContentItem setContainer:](self->_contentItem, "setContainer:", 0);
    -[MPNowPlayingContentItem setHasArtwork:](self->_contentItem, "setHasArtwork:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPNowPlayingContentItem identifier](self->_contentItem, "identifier"));
    -[MPNowPlayingContentItem setArtworkIdentifier:](self->_contentItem, "setArtworkIdentifier:", v23);

    -[MPNowPlayingContentItem setPlayable:](self->_contentItem, "setPlayable:", 1);
    v24 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mediaItem"));
    -[MPNowPlayingContentItem setExplicitContent:](self->_contentItem, "setExplicitContent:", objc_msgSend(v25, "isExplicitItem"));

    v35[0] = kMRMediaRemoteNowPlayingInfoChapterNumber;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKMLAudiobookChapter chapterIndexInAudiobook](self, "chapterIndexInAudiobook")));
    v36[0] = v26;
    v35[1] = kMRMediaRemoteNowPlayingInfoTotalChapterCount;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookChapter audiobook](self, "audiobook"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "chapters"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "count")));
    v36[1] = v29;
    v35[2] = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
    v30 = objc_loadWeakRetained((id *)&self->_containingTrack);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mediaItem"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v31, "persistentID")));
    v36[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 3));

    -[MPNowPlayingContentItem setNowPlayingInfo:](self->_contentItem, "setNowPlayingInfo:", v33);
    contentItem = self->_contentItem;
  }
  return contentItem;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)author
{
  return self->_author;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDateLastOpened:(id)a3
{
  objc_storeStrong((id *)&self->dateLastOpened, a3);
}

- (double)startTimeInTrack
{
  return self->_startTimeInTrack;
}

- (unint64_t)albumTrackNumber
{
  return self->_albumTrackNumber;
}

- (unint64_t)albumTrackCount
{
  return self->_albumTrackCount;
}

- ($8BD1E3C934A4AE6C9488C351520253D1)timeRangeInTrack
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var3;
  return self;
}

- ($8BD1E3C934A4AE6C9488C351520253D1)timeRangeInAudiobook
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var1.var3;
  return self;
}

- (int64_t)type
{
  return self->type;
}

- (int64_t)metadataType
{
  return self->metadataType;
}

- (void)setAudiobook:(id)a3
{
  objc_storeWeak((id *)&self->audiobook, a3);
}

- (void)setTrack:(id)a3
{
  objc_storeWeak((id *)&self->track, a3);
}

- (void)setContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentItem, a3);
}

- (MPMediaChapter)mediaChapter
{
  return self->_mediaChapter;
}

- (unint64_t)chapterIndexInAudiobook
{
  return self->_chapterIndexInAudiobook;
}

- (void)setChapterIndexInAudiobook:(unint64_t)a3
{
  self->_chapterIndexInAudiobook = a3;
}

- (BKMLAudiobookTrack)containingTrack
{
  return (BKMLAudiobookTrack *)objc_loadWeakRetained((id *)&self->_containingTrack);
}

- (void)setContainingTrack:(id)a3
{
  objc_storeWeak((id *)&self->_containingTrack, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingTrack);
  objc_storeStrong((id *)&self->_mediaChapter, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_destroyWeak((id *)&self->track);
  objc_destroyWeak((id *)&self->audiobook);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->assetURL, 0);
}

@end
