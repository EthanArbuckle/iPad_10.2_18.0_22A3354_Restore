@implementation BKMLAudiobookTrack

- (BKMLAudiobookTrack)initWithAudiobook:(id)a3 mediaItem:(id)a4 startTime:(double)a5 startChapterNumber:(unint64_t)a6 trackNumber:(unint64_t)a7 trackCount:(unint64_t)a8 storeDemoMode:(BOOL)a9
{
  id v14;
  id v15;
  BKMLAudiobookTrack *v16;
  BKMLAudiobookTrack *v17;
  id *p_mediaItem;
  void *v19;
  NSString *v20;
  NSString *title;
  void *v22;
  NSString *v23;
  NSString *author;
  void *v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  BKMLAudiobookTrack *v32;
  void *i;
  void *v34;
  void *v35;
  MPMediaItem *mediaItem;
  uint64_t v37;
  NSURL *assetURL;
  NSMutableArray *v39;
  void *v40;
  BKMLAudiobookChapter *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  BKMLAudiobookChapter *v46;
  id v47;
  NSObject *v48;
  NSArray *v49;
  NSArray *chapters;
  id v52;
  id v53;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v14 = a3;
  v15 = a4;
  v64.receiver = self;
  v64.super_class = (Class)BKMLAudiobookTrack;
  v16 = -[BKMLAudiobookTrack init](&v64, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_containingAudiobook, v14);
    p_mediaItem = (id *)&v17->_mediaItem;
    objc_storeStrong((id *)&v17->_mediaItem, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", MPMediaItemPropertyTitle));
    v20 = (NSString *)objc_msgSend(v19, "copy");
    title = v17->_title;
    v17->_title = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", MPMediaItemPropertyArtist));
    v23 = (NSString *)objc_msgSend(v22, "copy");
    author = v17->_author;
    v17->_author = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
    objc_msgSend(v25, "doubleValue");
    v17->_duration = v26;

    v17->_startTime = a5;
    v17->_hasAlternateArtwork = 0;
    v53 = v15;
    if (-[MPMediaItem countOfChaptersOfType:](v17->_mediaItem, "countOfChaptersOfType:", 2))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_mediaItem, "chaptersOfType:", 2));
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v61;
        while (2)
        {
          v32 = v17;
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v61 != v31)
              objc_enumerationMutation(v28);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i), "artworkCatalog"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bestImageFromDisk"));
            if (v35)
            {
              v17 = v32;
              v32->_hasAlternateArtwork = 1;

              goto LABEL_13;
            }

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
          v17 = v32;
          if (v30)
            continue;
          break;
        }
      }
LABEL_13:

      v15 = v53;
    }
    mediaItem = v17->_mediaItem;
    if (a9)
      v37 = objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_storeDemoAssetURL](mediaItem, "bk_storeDemoAssetURL"));
    else
      v37 = objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_assetURL](mediaItem, "bk_assetURL"));
    assetURL = v17->_assetURL;
    v17->_assetURL = (NSURL *)v37;

    v39 = objc_opt_new(NSMutableArray);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem chaptersOfType:](v17->_mediaItem, "chaptersOfType:", 1));
    if (objc_msgSend(v40, "count"))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v41 = v40;
      v42 = -[BKMLAudiobookChapter countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v42)
      {
        v43 = v42;
        v52 = v14;
        v44 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v43; j = (char *)j + 1)
          {
            if (*(_QWORD *)v57 != v44)
              objc_enumerationMutation(v41);
            v46 = -[BKMLAudiobookChapter initWithMediaChapter:track:number:trackNumber:trackCount:]([BKMLAudiobookChapter alloc], "initWithMediaChapter:track:number:trackNumber:trackCount:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j), v17, (char *)j + a6, a7, a8);
            -[NSMutableArray addObject:](v39, "addObject:", v46);

          }
          v43 = -[BKMLAudiobookChapter countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          a6 += (unint64_t)j;
        }
        while (v43);
        v14 = v52;
        v15 = v53;
      }
    }
    else
    {
      v47 = BKAudiobooksLog();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        sub_21A7C(p_mediaItem, v48);

      v41 = -[BKMLAudiobookChapter initWithMediaChapter:track:number:trackNumber:trackCount:]([BKMLAudiobookChapter alloc], "initWithMediaChapter:track:number:trackNumber:trackCount:", 0, v17, a6, a7, a8);
      -[NSMutableArray addObject:](v39, "addObject:", v41);
    }

    v49 = (NSArray *)-[NSMutableArray copy](v39, "copy");
    chapters = v17->_chapters;
    v17->_chapters = v49;

  }
  return v17;
}

- (BKAudiobook)audiobook
{
  return (BKAudiobook *)objc_loadWeakRetained((id *)&self->_containingAudiobook);
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  uint64_t v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack assetURL](self, "assetURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack title](self, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack author](self, "author"));
  v9 = -[BKMLAudiobookTrack artwork](self, "artwork");
  -[BKMLAudiobookTrack duration](self, "duration");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:%p url=%@ title=%@ author=%@ artwork=%p duration=%lf chapters=\n"), v5, self, v6, v7, v8, v9, v10));

  v12 = -[NSArray count](self->_chapters, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = v12 - 1;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_chapters, "objectAtIndexedSubscript:", v14));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
      v18 = (void *)v17;
      if (v15 == v14)
        v19 = &stru_39448;
      else
        v19 = CFSTR(",");
      objc_msgSend(v11, "appendFormat:", CFSTR("  %@%@\n"), v17, v19);

      ++v14;
    }
    while (v13 != v14);
  }
  objc_msgSend(v11, "appendFormat:", CFSTR(">"));
  return (NSString *)v11;
}

- (double)bookmarkTime
{
  void *v3;
  double v4;
  double v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self->_mediaItem, "valueForProperty:", MPMediaItemPropertyBookmarkTime));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  result = 0.0;
  if (v5 <= self->_duration)
    return v5;
  return result;
}

- (void)setBookmarkTime:(double)a3
{
  void *v5;
  MPMediaItem *mediaItem;
  id v7;

  -[MPMediaItem setHasBeenPlayed:](self->_mediaItem, "setHasBeenPlayed:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[MPMediaItem setLastPlayedDate:](self->_mediaItem, "setLastPlayedDate:", v5);

  mediaItem = self->_mediaItem;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](mediaItem, "setValue:forProperty:withCompletionBlock:", v7, MPMediaItemPropertyBookmarkTime, 0);

}

- (NSDate)dateLastOpened
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem objectForKeyedSubscript:](self->_mediaItem, "objectForKeyedSubscript:", MPMediaItemPropertyLastPlayedDate));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSDate *)v6;
}

- (id)alternateArtworkTimes
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_opt_new(NSMutableArray);
  if (-[BKMLAudiobookTrack hasAlternateArtwork](self, "hasAlternateArtwork"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem chaptersOfType:](self->_mediaItem, "chaptersOfType:", 2));
    if (objc_msgSend(v4, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "playbackTime", (_QWORD)v13);
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSMutableArray addObject:](v3, "addObject:", v10);

            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }

    }
  }
  v11 = -[NSMutableArray copy](v3, "copy", (_QWORD)v13);

  return v11;
}

- (CGImage)artworkForTime:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  CGImage *v8;

  if (!-[BKMLAudiobookTrack hasAlternateArtwork](self, "hasAlternateArtwork"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem chapterOfType:atTime:](self->_mediaItem, "chapterOfType:atTime:", 2, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artworkCatalog"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bestImageFromDisk")));
  v8 = (CGImage *)objc_msgSend(v7, "CGImage");

  return v8;
}

- (UIImage)coverArt
{
  UIImage *coverArt;
  void *v4;
  void *v5;
  double v6;
  double v7;
  UIImage *v8;
  UIImage *v9;

  coverArt = self->_coverArt;
  if (!coverArt)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack mediaItem](self, "mediaItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", MPMediaItemPropertyArtwork));

    if (v5)
    {
      objc_msgSend(v5, "bounds");
      v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithSize:", v6, v7));
      v9 = self->_coverArt;
      self->_coverArt = v8;

    }
    coverArt = self->_coverArt;
  }
  return coverArt;
}

- (CGImage)artwork
{
  id v2;
  CGImage *v3;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack coverArt](self, "coverArt")));
  v3 = (CGImage *)objc_msgSend(v2, "CGImage");

  return v3;
}

- (BOOL)incrementPlayCountForStopTime:(double)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  double v8;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack mediaItem](self, "mediaItem"));
  objc_msgSend(v4, "startTime");
  v6 = v5;
  v7 = objc_msgSend(v4, "effectiveStopTime");
  v9 = MPShouldIncrementPlayCountForElapsedTime(v7, a3, v6, v8);
  if (v9)
  {
    objc_msgSend(v4, "setPlayCount:", (char *)objc_msgSend(v4, "playCount") + 1);
    objc_msgSend(v4, "setPlayCountSinceSync:", (char *)objc_msgSend(v4, "playCountSinceSync") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v4, "setLastPlayedDate:", v10);

  }
  return v9;
}

- (void)lookupRacGUIDWithCompletion:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack assetURL](self, "assetURL"));
  v5 = objc_msgSend(v4, "bk_isStreamingAssetURL");

  if (v5)
  {
    -[BKMLAudiobookTrack _lookupRacGUIDFromHLSPlaylistWithCompletion:](self, "_lookupRacGUIDFromHLSPlaylistWithCompletion:", v12);
  }
  else
  {
    v6 = objc_alloc_init((Class)BLMetadataStore);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack mediaItem](self, "mediaItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bk_storePlaylistID"));
    v9 = objc_msgSend(v8, "longLongValue");

    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_14D0C;
      v13[3] = &unk_38FD0;
      v13[4] = self;
      v14 = v12;
      objc_msgSend(v6, "racGUIDForStoreID:result:", v9, v13);
      v10 = v14;
    }
    else
    {
      v11 = objc_retainBlock(v12);
      v10 = v11;
      if (v11)
        (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    }

  }
}

- (void)_lookupRacGUIDFromHLSPlaylistWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)BLHLSAudiobookFetcher), "initCanUseCellularData:powerRequired:bundleID:", 1, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack assetURL](self, "assetURL"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_14E84;
  v8[3] = &unk_38FF8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "getRacGUIDFromMasterPlaylistURL:completion:", v6, v8);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (double)duration
{
  return self->_duration;
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)hasAlternateArtwork
{
  return self->_hasAlternateArtwork;
}

- (void)setAudiobook:(id)a3
{
  objc_storeWeak((id *)&self->audiobook, a3);
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (BKMLAudiobook)containingAudiobook
{
  return (BKMLAudiobook *)objc_loadWeakRetained((id *)&self->_containingAudiobook);
}

- (void)setContainingAudiobook:(id)a3
{
  objc_storeWeak((id *)&self->_containingAudiobook, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingAudiobook);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_destroyWeak((id *)&self->audiobook);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_dateLastOpened, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
