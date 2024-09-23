@implementation BKMLAudiobook

- (BOOL)isAudiobookPreview
{
  return 0;
}

- (BKMLAudiobook)init
{
  BKMLAudiobook *v2;
  BKMLAudiobook *v3;
  NSArray *mediaLibraryTracks;
  NSArray *mediaLibraryChapters;
  NSString *title;
  NSString *author;
  NSString *guid;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKMLAudiobook;
  v2 = -[BKMLAudiobook init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    mediaLibraryTracks = v2->_mediaLibraryTracks;
    v2->_mediaLibraryTracks = (NSArray *)&__NSArray0__struct;

    mediaLibraryChapters = v3->_mediaLibraryChapters;
    v3->_mediaLibraryChapters = (NSArray *)&__NSArray0__struct;

    v3->_duration = 0.0;
    title = v3->_title;
    v3->_title = (NSString *)&stru_39448;

    author = v3->_author;
    v3->_author = (NSString *)&stru_39448;

    guid = v3->_guid;
    v3->_guid = (NSString *)&stru_39448;

  }
  return v3;
}

- (void)addTracks:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  NSArray *v14;
  NSArray *mediaLibraryChapters;
  void *v16;
  NSString *v17;
  NSString *title;
  void *v19;
  NSString *v20;
  NSString *author;
  void *v22;
  id v23;
  NSObject *v24;
  double duration;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSString *v29;
  NSString *v30;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  double v42;
  __int16 v43;
  NSUInteger v44;
  __int16 v45;
  NSUInteger v46;
  __int16 v47;
  NSUInteger v48;
  __int16 v49;
  NSString *v50;
  __int16 v51;
  NSString *v52;
  _BYTE v53[128];

  v5 = a3;
  objc_storeStrong((id *)&self->_mediaLibraryTracks, a3);
  v6 = objc_opt_new(NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = self->_mediaLibraryTracks;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chapters"));
        -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v12);

        objc_msgSend(v11, "duration");
        self->_duration = v13 + self->_duration;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v8);
  }

  v14 = (NSArray *)-[NSMutableArray copy](v6, "copy");
  mediaLibraryChapters = self->_mediaLibraryChapters;
  self->_mediaLibraryChapters = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook representativeItem](self, "representativeItem"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bk_effectiveTitle"));
  title = self->_title;
  self->_title = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook representativeItem](self, "representativeItem"));
  v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bk_effectiveAuthor"));
  author = self->_author;
  self->_author = v20;

  objc_initWeak(&location, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v31 = _NSConcreteStackBlock;
  v32 = 3221225472;
  v33 = sub_F60C;
  v34 = &unk_38F30;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v22, "lookupRacGUIDWithCompletion:", &v31);

  v23 = BKAudiobooksLog();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    duration = self->_duration;
    v26 = -[NSArray count](self->_mediaLibraryTracks, "count", v31, v32, v33, v34);
    v27 = -[NSArray count](self->_mediaLibraryChapters, "count");
    v28 = -[NSArray count](self->_supplementalContents, "count");
    v29 = self->_title;
    v30 = self->_author;
    *(_DWORD *)buf = 134219266;
    v42 = duration;
    v43 = 2048;
    v44 = v26;
    v45 = 2048;
    v46 = v27;
    v47 = 2048;
    v48 = v28;
    v49 = 2112;
    v50 = v29;
    v51 = 2112;
    v52 = v30;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Setup audiobook with duration:%.2f tracks:%ld chapters:%ld supplemental content count:%lu title:'%@' author:'%@'", buf, 0x3Eu);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)coverArtWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook representativeItem](self, "representativeItem"));
  if (v5)
  {
    if (self->_coverArt)
    {
      v6 = objc_retainBlock(v4);
      v7 = v6;
      if (v6)
        (*((void (**)(id, UIImage *))v6 + 2))(v6, self->_coverArt);

    }
    else
    {
      v12 = BKAudiobooksLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Lazy loading artwork into memory.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F890;
      v14[3] = &unk_38F58;
      objc_copyWeak(&v16, buf);
      v15 = v4;
      objc_msgSend(v5, "bk_artworkImageWithCompletion:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    v8 = BKAudiobooksLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21960(v9);

    v10 = objc_retainBlock(v4);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

  }
}

- (void)artworkWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_F988;
  v5[3] = &unk_38F80;
  v6 = a3;
  v4 = v6;
  -[BKMLAudiobook coverArtWithCompletion:](self, "coverArtWithCompletion:", v5);

}

- (NSString)assetID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook representativeItem](self, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bk_assetID"));

  return (NSString *)v3;
}

- (double)bookmarkTime
{
  void *v2;
  double v3;
  double v4;
  id v5;
  NSObject *v6;
  int v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_mediaLibraryTracks, "firstObject"));
  objc_msgSend(v2, "bookmarkTime");
  v4 = v3;

  v5 = BKAudiobooksLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Fetched media library bookmark time of %.2f.", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)setBookmarkTime:(double)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  double v9;

  if (-[NSArray count](self->_mediaLibraryTracks, "count"))
  {
    v5 = BKAudiobooksLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = a3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Saving media library bookmark time to be %.2f.", (uint8_t *)&v8, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_mediaLibraryTracks, "firstObject"));
    objc_msgSend(v7, "setBookmarkTime:", a3);

  }
}

- (NSDate)dateLastOpened
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook representativeItem](self, "representativeItem"));
  v3 = objc_opt_class(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", MPMediaItemPropertyLastPlayedDate));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = BKAudiobooksLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Fetched media library last opened date of %@.", (uint8_t *)&v10, 0xCu);
  }

  return (NSDate *)v6;
}

- (NSArray)tracks
{
  return self->_mediaLibraryTracks;
}

- (NSArray)chapters
{
  return self->_mediaLibraryChapters;
}

- (unint64_t)indexOfTrack:(id)a3
{
  return -[NSArray indexOfObject:](self->_mediaLibraryTracks, "indexOfObject:", a3);
}

- (id)representativeItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_mediaLibraryTracks, "firstObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mediaItem"));

  return v3;
}

- (BOOL)isEqualToAudiobook:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook assetID](self, "assetID"));
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

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  BKMLAudiobook *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook title](self, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobook author](self, "author"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:%p title=%@ author=%@ _coverArt=%p tracks=\n"), v5, self, v6, v7, self->_coverArt));

  v22 = self;
  v9 = -[NSArray count](self->_mediaLibraryTracks, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = v9 - 1;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v22->_mediaLibraryTracks, "objectAtIndexedSubscript:", v11));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("\n")));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v8, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v19));
            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v17);
      }

      if (v11 == v12)
        v20 = &stru_39448;
      else
        v20 = CFSTR(",");
      objc_msgSend(v8, "appendString:", v20);

      ++v11;
    }
    while (v11 != v10);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR(">"));
  return (NSString *)v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (double)duration
{
  return self->_duration;
}

- (UIImage)coverArt
{
  return self->_coverArt;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)supplementalContents
{
  return self->_supplementalContents;
}

- (void)setSupplementalContents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)mediaLibraryTracks
{
  return self->_mediaLibraryTracks;
}

- (void)setMediaLibraryTracks:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryTracks, a3);
}

- (NSArray)mediaLibraryChapters
{
  return self->_mediaLibraryChapters;
}

- (void)setMediaLibraryChapters:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryChapters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryChapters, 0);
  objc_storeStrong((id *)&self->_mediaLibraryTracks, 0);
  objc_storeStrong((id *)&self->_supplementalContents, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
