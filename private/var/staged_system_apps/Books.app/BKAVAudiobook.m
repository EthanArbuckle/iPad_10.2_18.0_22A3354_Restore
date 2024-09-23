@implementation BKAVAudiobook

+ (id)audiobookWithAssetID:(id)a3 tracks:(id)a4
{
  id v5;
  id v6;
  BKAVAudiobook *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = a4;
  v7 = -[BKAVAudiobook initWithAssetID:]([BKAVAudiobook alloc], "initWithAssetID:", v5);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(BKAVAudiobookTrack);
        v15 = BUDynamicCast(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (v16)
        {
          -[BKAVAudiobook addTrack:](v7, "addTrack:", v16);
        }
        else
        {
          v17 = sub_1001B6D9C();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Attempting to add invalid track %@", buf, 0xCu);
          }

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

  return v7;
}

- (BKAVAudiobook)initWithAssetID:(id)a3
{
  id v5;
  BKAVAudiobook *v6;
  NSMutableArray *v7;
  NSMutableArray *avTracks;
  NSString *guid;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKAVAudiobook;
  v6 = -[BKAVAudiobook init](&v11, "init");
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    avTracks = v6->_avTracks;
    v6->_avTracks = v7;

    objc_storeStrong((id *)&v6->_assetID, a3);
    guid = v6->_guid;
    v6->_guid = (NSString *)&stru_10091C438;

  }
  return v6;
}

- (NSArray)chapters
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *chapters;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!-[BKAVAudiobook chapterListValid](self, "chapterListValid"))
  {
    v3 = objc_opt_new(NSMutableArray);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_avTracks;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), "chapters", (_QWORD)v13));
          -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    v10 = (NSArray *)-[NSMutableArray copy](v3, "copy");
    chapters = self->_chapters;
    self->_chapters = v10;

    -[BKAVAudiobook setChapterListValid:](self, "setChapterListValid:", 1);
  }
  return self->_chapters;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_avTracks, "count");
}

- (double)duration
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!-[BKAVAudiobook durationValid](self, "durationValid"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = self->_avTracks;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      v7 = 0.0;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "duration", (_QWORD)v11);
          v7 = v7 + v9;
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
    else
    {
      v7 = 0.0;
    }

    self->_duration = v7;
    -[BKAVAudiobook setDurationValid:](self, "setDurationValid:", 1);
  }
  return self->_duration;
}

- (void)artworkWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, id);
  id v7;
  NSObject *v8;
  void (**v9)(id, id);

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobook representativeTrack](self, "representativeTrack"));
  if (v5)
  {
    v6 = (void (**)(id, id))objc_retainBlock(v4);
    if (v6)
      v6[2](v6, objc_msgSend(v5, "artwork"));
  }
  else
  {
    v7 = sub_1001B6D9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1006A27E8(v8);

    v9 = (void (**)(id, id))objc_retainBlock(v4);
    v6 = v9;
    if (v9)
      v9[2](v9, 0);
  }

}

- (void)addTrack:(id)a3
{
  -[NSMutableArray addObject:](self->_avTracks, "addObject:", a3);
  -[BKAVAudiobook setChapterListValid:](self, "setChapterListValid:", 0);
  -[BKAVAudiobook setDurationValid:](self, "setDurationValid:", 0);
}

- (NSArray)tracks
{
  return (NSArray *)self->_avTracks;
}

- (id)representativeTrack
{
  id v3;

  v3 = -[NSMutableArray count](self->_avTracks, "count");
  if (v3)
    v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_avTracks, "objectAtIndexedSubscript:", 0));
  return v3;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  BKAVAudiobook *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobook title](self, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobook author](self, "author"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobook representativeTrack](self, "representativeTrack"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:%p title=%@ author=%@ artwork=%p tracks=\n"), v5, self, v6, v7, objc_msgSend(v8, "artwork")));

  v23 = self;
  v10 = (char *)-[NSMutableArray count](self->_avTracks, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = v10 - 1;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v23->_avTracks, "objectAtIndexedSubscript:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("\n")));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v9, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v20));
            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v18);
      }

      if (v12 == v13)
        v21 = &stru_10091C438;
      else
        v21 = CFSTR(",");
      objc_msgSend(v9, "appendString:", v21);

      ++v12;
    }
    while (v12 != v11);
  }
  objc_msgSend(v9, "appendFormat:", CFSTR(">"));
  return (NSString *)v9;
}

- (unint64_t)indexOfTrack:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObject:](self->_avTracks, "indexOfObject:", a3);
}

- (id)trackAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_avTracks, "objectAtIndex:", a3);
}

- (BOOL)isEqualToAudiobook:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobook assetID](self, "assetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isSG
{
  NSString *guid;

  guid = self->_guid;
  if (guid)
    LOBYTE(guid) = -[NSString length](guid, "length") != 0;
  return (char)guid;
}

- (id)representativeItem
{
  return 0;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)bookmarkTime
{
  return self->bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->bookmarkTime = a3;
}

- (NSDate)dateLastOpened
{
  return self->dateLastOpened;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)supplementalContents
{
  return self->_supplementalContents;
}

- (void)setSupplementalContents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isAudiobookPreview
{
  return self->_audiobookPreview;
}

- (void)setAudiobookPreview:(BOOL)a3
{
  self->_audiobookPreview = a3;
}

- (NSMutableArray)avTracks
{
  return self->_avTracks;
}

- (void)setAvTracks:(id)a3
{
  objc_storeStrong((id *)&self->_avTracks, a3);
}

- (BOOL)chapterListValid
{
  return self->_chapterListValid;
}

- (void)setChapterListValid:(BOOL)a3
{
  self->_chapterListValid = a3;
}

- (BOOL)durationValid
{
  return self->_durationValid;
}

- (void)setDurationValid:(BOOL)a3
{
  self->_durationValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avTracks, 0);
  objc_storeStrong((id *)&self->_supplementalContents, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
