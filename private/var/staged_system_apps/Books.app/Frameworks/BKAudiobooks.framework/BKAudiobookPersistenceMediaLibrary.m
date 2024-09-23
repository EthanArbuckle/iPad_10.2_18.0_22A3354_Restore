@implementation BKAudiobookPersistenceMediaLibrary

- (BKAudiobookPersistenceMediaLibrary)init
{
  BKAudiobookPersistenceMediaLibrary *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookPersistenceMediaLibrary;
  result = -[BKAudiobookPersistenceMediaLibrary init](&v3, "init");
  if (result)
    result->_accessLock._os_unfair_lock_opaque = 0;
  return result;
}

- (int64_t)eventThreshold
{
  return 1;
}

- (NSString)shortName
{
  return (NSString *)&stru_39448;
}

- (BOOL)isLocal
{
  return 0;
}

- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  os_unfair_lock_s *p_accessLock;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  uint64_t v27;
  double v28;
  void *i;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  NSObject *v40;
  _BOOL4 v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  os_unfair_lock_s *v50;
  BKAudiobookPersistenceMediaLibrary *v51;
  NSObject *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  double v62;
  __int16 v63;
  NSObject *v64;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isAudiobookPreview"))
  {
    v8 = objc_retainBlock(v7);
    v9 = v8;
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD, double))v8 + 2))(v8, 0, 0, 0.0);

    goto LABEL_46;
  }
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v51 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary _mediaItemsFromAudiobook:](self, "_mediaItemsFromAudiobook:", v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateAccessed"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:"));
  v52 = 0;
  v16 = 0.0;
  if (objc_msgSend(v12, "hasBeenPlayed"))
  {
    if (v15 && v14 != 0)
    {
      objc_msgSend(v15, "doubleValue");
      v16 = v18;
      v52 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if (v16 > v21)
        v16 = 0.0;
      v22 = objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary logInstance](v51, "logInstance"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v60 = v13;
        v61 = 2048;
        v62 = v16;
        v63 = 2112;
        v64 = v52;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Bookmark time base-case calculation for %@: bookmarkTime=%lf timestamp=%@", buf, 0x20u);
      }

    }
  }
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v49 = v15;
    v50 = p_accessLock;
    v45 = v14;
    v46 = v12;
    v47 = v11;
    v48 = v7;
    v44 = v6;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v11;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = 0;
      v27 = *(_QWORD *)v55;
      v16 = 0.0;
      v28 = 0.0;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dateAccessed", v44));
          v32 = objc_msgSend(v30, "hasBeenPlayed");
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
          objc_msgSend(v33, "doubleValue");
          v35 = v34;

          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "valueForProperty:", MPMediaItemPropertyBookmarkTime));
          objc_msgSend(v36, "doubleValue");
          v38 = v37;

          if (v38 > v35)
            v38 = 0.0;
          if (v32)
          {
            if (!v25 || objc_msgSend(v31, "compare:", v25) == (char *)&dword_0 + 1)
            {
              v39 = v31;

              v25 = v39;
            }
            v16 = v28 + v38;
          }
          v26 |= v32;
          v28 = v28 + v35;

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v24);
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v16 = 0.0;
    }

    v40 = objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary logInstance](v51, "logInstance"));
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if (v25 || (v26 & 1) != 0)
    {
      v11 = v47;
      v7 = v48;
      v12 = v46;
      v14 = v45;
      if (v41)
      {
        *(_DWORD *)buf = 138412546;
        v60 = v13;
        v61 = 2048;
        v62 = v16;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Bookmark time for %@ calculated to be %lf on read", buf, 0x16u);
      }

      v6 = v44;
      if (!v25)
        goto LABEL_42;
      v40 = v52;
      v52 = v25;
    }
    else
    {
      v16 = 0.0;
      v11 = v47;
      v7 = v48;
      v12 = v46;
      v14 = v45;
      if (v41)
      {
        *(_DWORD *)buf = 138412290;
        v60 = v13;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Bookmark time for %@ calculated to be 0 on read because ((lastAccessedDate == nil) && !encounteredTrackWithHasBeenPlayedTrue)", buf, 0xCu);
      }
      v6 = v44;
    }

LABEL_42:
    v15 = v49;
    p_accessLock = v50;
  }
  os_unfair_lock_unlock(p_accessLock);
  v42 = objc_retainBlock(v7);
  v43 = v42;
  if (v42)
    (*((void (**)(id, NSObject *, _QWORD, double))v42 + 2))(v42, v52, 0, v16);

LABEL_46:
}

- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  double v21;
  void *v22;
  double v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  uint32_t v36;
  unsigned int v37;
  unsigned int v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  _BYTE v51[10];
  _BYTE v52[10];
  __int16 v53;
  double v54;
  _BYTE v55[128];

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isAudiobookPreview"))
  {
    v10 = objc_retainBlock(v9);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

    goto LABEL_38;
  }
  v43 = v9;
  os_unfair_lock_lock(&self->_accessLock);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary _mediaItemsFromAudiobook:](self, "_mediaItemsFromAudiobook:", v8));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v44 = v8;
  objc_msgSend(v8, "duration");
  if (v14 <= a3)
    v15 = v14;
  else
    v15 = a3;
  v16 = objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary logInstance](self, "logInstance"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v51 = v45;
    *(_WORD *)&v51[8] = 2048;
    *(double *)v52 = v15;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Setting media item bookmark time for %@ to %lf", buf, 0x16u);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v47;
    v21 = 0.0;
    do
    {
      v22 = 0;
      v23 = v21;
      do
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v17);
        v24 = *(NSObject **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForProperty:](v24, "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        v21 = v23 + v27;
        if (v15 > v23 + v27)
        {
          -[NSObject setDateAccessed:](v24, "setDateAccessed:", v13);
          -[NSObject setHasBeenPlayed:](v24, "setHasBeenPlayed:", 1);
          -[NSObject setValue:forProperty:withCompletionBlock:](v24, "setValue:forProperty:withCompletionBlock:", &off_3A110, MPMediaItemPropertyBookmarkTime, 0);
          v28 = objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary logInstance](self, "logInstance"));
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v29 = objc_msgSend(v17, "indexOfObjectIdenticalTo:", v24) + 1;
          v30 = objc_msgSend(v17, "count");
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v51 = v29;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v30;
          *(_WORD *)v52 = 2112;
          *(_QWORD *)&v52[2] = v45;
          v31 = v28;
          v32 = "Bookmark is NOT in item %u of %u of %@ on save. Setting hasBeenPlayed:YES, boomarkTime:0";
LABEL_25:
          v36 = 24;
          goto LABEL_26;
        }
        if (v23 <= v15 && v15 <= v21)
        {
          -[NSObject setDateAccessed:](v24, "setDateAccessed:", v13);
          -[NSObject setHasBeenPlayed:](v24, "setHasBeenPlayed:", 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15 - v23));
          -[NSObject setValue:forProperty:withCompletionBlock:](v24, "setValue:forProperty:withCompletionBlock:", v33, MPMediaItemPropertyBookmarkTime, 0);

          v28 = objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary logInstance](self, "logInstance"));
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v34 = objc_msgSend(v17, "indexOfObjectIdenticalTo:", v24) + 1;
            v35 = objc_msgSend(v17, "count");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v51 = v34;
            *(_WORD *)&v51[4] = 1024;
            *(_DWORD *)&v51[6] = v35;
            *(_WORD *)v52 = 2112;
            *(_QWORD *)&v52[2] = v45;
            v53 = 2048;
            v54 = v15 - v23;
            v31 = v28;
            v32 = "Bookmark is in item %u of %u of %@ on save. hasBeenPlayed:YES localTime:%f";
            v36 = 34;
            goto LABEL_26;
          }
          goto LABEL_27;
        }
        if (v23 > v15)
        {
          -[NSObject setHasBeenPlayed:](v24, "setHasBeenPlayed:", 0);
          -[NSObject setValue:forProperty:withCompletionBlock:](v24, "setValue:forProperty:withCompletionBlock:", &off_3A110, MPMediaItemPropertyBookmarkTime, 0);
          v28 = objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary logInstance](self, "logInstance"));
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v37 = objc_msgSend(v17, "indexOfObjectIdenticalTo:", v24) + 1;
          v38 = objc_msgSend(v17, "count");
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v51 = v37;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v38;
          *(_WORD *)v52 = 2112;
          *(_QWORD *)&v52[2] = v45;
          v31 = v28;
          v32 = "Setting item %u of %u on %@ to hasBeenPlayed:NO boomarkTime:0";
          goto LABEL_25;
        }
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
        if (v24 != v28)
          goto LABEL_27;

        if (vabdd_f64(v15, v21) < 0.00999999978)
        {
          -[NSObject setDateAccessed:](v24, "setDateAccessed:", v13);
          -[NSObject setHasBeenPlayed:](v24, "setHasBeenPlayed:", 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
          -[NSObject setValue:forProperty:withCompletionBlock:](v24, "setValue:forProperty:withCompletionBlock:", v39, MPMediaItemPropertyBookmarkTime, 0);

          v28 = objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary logInstance](self, "logInstance"));
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v51 = v45;
            v31 = v28;
            v32 = "Audiobook bookmark is at end of audiobook %@ on save";
            v36 = 12;
LABEL_26:
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, v32, buf, v36);
          }
LABEL_27:

        }
        v22 = (char *)v22 + 1;
        v23 = v23 + v27;
      }
      while (v19 != v22);
      v40 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      v19 = v40;
    }
    while (v40);
  }

  os_unfair_lock_unlock(&self->_accessLock);
  v9 = v43;
  v41 = objc_retainBlock(v43);
  v42 = v41;
  if (v41)
    (*((void (**)(id, _QWORD))v41 + 2))(v41, 0);

  v8 = v44;
LABEL_38:

}

- (id)_mediaItemsFromAudiobook:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary _mediaQueryFromAudiobook:](self, "_mediaQueryFromAudiobook:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));

  return v4;
}

- (id)_representativeItemFromAudibook:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_opt_class(BKMLAudiobook);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(BKMLAudiobookTrack);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tracks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = BUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaItem"));

  return v12;
}

- (id)_mediaQueryFromAudiobook:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary _representativeItemFromAudibook:](self, "_representativeItemFromAudibook:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyAlbumTitle));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v5, MPMediaItemPropertyAlbumTitle));
      objc_msgSend(v6, "addFilterPredicate:", v7);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_storeIDFromAudiobook:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceMediaLibrary _representativeItemFromAudibook:](self, "_representativeItemFromAudibook:", a3));
  v4 = objc_opt_class(NSNumber);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyStorePlaylistID));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_opt_class(NSNumber);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyStoreID));
  v10 = BUDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (objc_msgSend(v7, "unsignedLongLongValue"))
    v12 = v7;
  else
    v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));

  return v13;
}

@end
