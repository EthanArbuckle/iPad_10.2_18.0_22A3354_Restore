void sub_1000019B4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _BOOL4 v12;
  void (**v13)(id, void *);
  void *v14;
  int v15;
  id v16;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[INPlayMediaMediaItemResolutionResult unsupported](INPlayMediaMediaItemResolutionResult, "unsupported"));
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v5 = BooksSiriLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
      v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "One media item matches the request: %@", (uint8_t *)&v15, 0xCu);

    }
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v9 = objc_claimAutoreleasedReturnValue(+[INPlayMediaMediaItemResolutionResult successWithResolvedMediaItem:](INPlayMediaMediaItemResolutionResult, "successWithResolvedMediaItem:", v8));

    v4 = v9;
  }
  else
  {
    v10 = objc_msgSend(v3, "count");
    v11 = BooksSiriLog();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if ((unint64_t)v10 < 2)
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No media items match the request", (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      if (v12)
      {
        v15 = 138412290;
        v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Multiple media items match the request: %@", (uint8_t *)&v15, 0xCu);
      }

      v8 = v4;
      v4 = objc_claimAutoreleasedReturnValue(+[INPlayMediaMediaItemResolutionResult disambiguationWithMediaItemsToDisambiguate:](INPlayMediaMediaItemResolutionResult, "disambiguationWithMediaItemsToDisambiguate:", v3));
    }
  }

  v13 = (void (**)(id, void *))objc_retainBlock(*(id *)(a1 + 32));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
    v13[2](v13, v14);

  }
}

void sub_1000021BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000021D4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000021E4(uint64_t a1)
{

}

void sub_1000021EC(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "representativeItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "persistentID")));
  objc_msgSend(v2, "addObject:", v3);

}

void sub_10000225C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "representativeItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "persistentID")));
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void sub_100002654(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002664(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id BooksSiriLog()
{
  if (qword_100008820 != -1)
    dispatch_once(&qword_100008820, &stru_100004298);
  return (id)qword_100008818;
}

void sub_1000026BC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BooksSiriLog");
  v2 = (void *)qword_100008818;
  qword_100008818 = (uint64_t)v1;

}

void sub_1000026EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002664((void *)&_mh_execute_header, a2, a3, "Requesting for an audiobook using an unknown request type. %@", a5, a6, a7, a8, 2u);
  sub_100002674();
}

void sub_100002750(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002664((void *)&_mh_execute_header, a2, a3, "We don't recognize this URL and cannot parse the assetID out of it. %@", a5, a6, a7, a8, 2u);
  sub_100002674();
}

void sub_1000027B4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "resolveMediaItemsForPlayMedia: %@", (uint8_t *)&v2, 0xCu);
  sub_100002674();
}

void sub_100002824(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002654((void *)&_mh_execute_header, a1, a3, "confirmPlayMedia:completion:", a5, a6, a7, a8, 0);
}

void sub_100002858(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002654((void *)&_mh_execute_header, a1, a3, "handlePlayMedia", a5, a6, a7, a8, 0);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__createMediaItemsFromCollections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createMediaItemsFromCollections:");
}

id objc_msgSend__queryAudiobooksForAlbumPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queryAudiobooksForAlbumPersistentID:");
}

id objc_msgSend__queryAudiobooksForTitle_author_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queryAudiobooksForTitle:author:");
}

id objc_msgSend__respectContentRestrictionsOnQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_respectContentRestrictionsOnQuery:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFilterPredicate:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumTitle");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artistName");
}

id objc_msgSend_bk_assetID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_assetID");
}

id objc_msgSend_bk_audiobooksNonPreordersQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bk_audiobooksNonPreordersQuery");
}

id objc_msgSend_bu_assetIDFromURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bu_assetIDFromURL");
}

id objc_msgSend_bu_urlWithAssetID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bu_urlWithAssetID:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collections");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_disambiguationWithMediaItemsToDisambiguate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disambiguationWithMediaItemsToDisambiguate:");
}

id objc_msgSend_effectiveAlbumArtist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveAlbumArtist");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithIdentifier_title_type_artwork_artist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:title:type:artwork:artist:");
}

id objc_msgSend_isExplicitContentAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExplicitContentAllowed");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mediaIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaIdentifier");
}

id objc_msgSend_mediaItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItems");
}

id objc_msgSend_mediaName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaName");
}

id objc_msgSend_mediaSearch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaSearch");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaType");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentID");
}

id objc_msgSend_predicateWithSearchString_forProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithSearchString:forProperties:");
}

id objc_msgSend_predicateWithValue_forProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithValue:forProperty:");
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "representativeItem");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setFilteringDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilteringDisabled:");
}

id objc_msgSend_setIgnoreSystemFilterPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreSystemFilterPredicates:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_successWithResolvedMediaItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedMediaItem:");
}

id objc_msgSend_suppressExplicit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suppressExplicit");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_unsupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsupported");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     v29[1] = 3221225472;
      v29[2] = sub_1000021EC;
      v29[3] = &unk_100004230;
      v29[4] = v30;
      -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v29);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000225C;
      v26[3] = &unk_100004258;
      v28 = v30;
      v21 = v20;
      v27 = v21;
      -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v26);
      v22 = (NSArray *)-[NSMutableArray copy](v21, "copy");

      _Block_object_dispose(v30, 8);
      v10 = v22;
    }
    else
    {
      if (-[NSArray count](v8, "count"))
        v23 = v8;
      else
        v23 = v9;
      v24 = v23;

      v10 = v24;
    }
  }

  return v10;
}

- (id)_createMediaItemsFromCollections:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  __int128 v25;
  uint64_t v26;
  NSMutableArray *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  NSObject *v36;
  _BYTE v37[128];

  v3 = a3;
  v27 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v30;
    *(_QWORD *)&v6 = 138412290;
    v25 = v6;
    v26 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "representativeItem", v25));
        v11 = objc_claimAutoreleasedReturnValue(-[NSObject bk_assetID](v10, "bk_assetID"));
        if ((-[NSMutableArray containsObject:](v4, "containsObject:", v11) & 1) != 0)
        {
          v12 = BooksSiriLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v25;
            v34 = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Found a duplicate collection that represents %@", buf, 0xCu);
          }
        }
        else
        {
          v13 = objc_claimAutoreleasedReturnValue(+[NSURL bu_urlWithAssetID:](NSURL, "bu_urlWithAssetID:", v11));
          v14 = BooksSiriLog();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          v16 = v15;
          if (v13)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v34 = v13;
              v35 = 2112;
              v36 = v10;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "found match: url = '%@', %@", buf, 0x16u);
            }

            v16 = objc_claimAutoreleasedReturnValue(-[NSObject effectiveAlbumArtist](v10, "effectiveAlbumArtist"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject albumTitle](v10, "albumTitle"));
            if (objc_msgSend(v17, "length"))
              v18 = objc_claimAutoreleasedReturnValue(-[NSObject albumTitle](v10, "albumTitle"));
            else
              v18 = objc_claimAutoreleasedReturnValue(-[NSObject title](v10, "title"));
            v19 = (void *)v18;

            v20 = objc_alloc((Class)INMediaItem);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v13, "absoluteString"));
            v22 = objc_msgSend(v20, "initWithIdentifier:title:type:artwork:artist:", v21, v19, 10, 0, v16);

            -[NSMutableArray addObject:](v27, "addObject:", v22);
            -[NSMutableArray addObject:](v4, "addObject:", v11);

            v8 = v26;
          }
          else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v34 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to generate a URL for media item %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v7);
  }

  v23 = -[NSMutableArray copy](v27, "copy");
  return v23;
}

- (BOOL)suppressExplicit
{
  return self->_suppressExplicit;
}

- (void)setSuppressExplicit:(BOOL)a3
{
  self->_suppressExplicit = a3;
}

@end
