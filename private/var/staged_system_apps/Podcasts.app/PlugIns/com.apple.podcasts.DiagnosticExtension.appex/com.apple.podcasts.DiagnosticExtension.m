void sub_100003860(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100003874(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v4 = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "counterForGeneratingLibraryChangeNotifications");
  if (v4 >= 1)
    objc_msgSend(WeakRetained, "_endGeneratingLibraryChangeNotifications");
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100003970;
  v11 = &unk_1000082E0;
  v13 = *(id *)(a1 + 40);
  v5 = v3;
  v12 = v5;
  v6 = objc_msgSend(v5, "performTransactionWithBlock:", &v8);
  if (v4 >= 1)
    objc_msgSend(WeakRetained, "_beginGeneratingLibraryChangeNotifications", v8, v9, v10, v11);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);

}

uint64_t sub_100003970(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100003A10(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id sub_100003DA8(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_beginGeneratingLibraryChangeNotifications");
}

uint64_t sub_100003E70(uint64_t a1)
{
  uint64_t result;

  if ((uint64_t)objc_msgSend(*(id *)(a1 + 32), "counterForGeneratingLibraryChangeNotifications") >= 1)
    objc_msgSend(*(id *)(a1 + 32), "_endGeneratingLibraryChangeNotifications");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100004238(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const CFStringRef *v8;
  NSString *v9;

  v9 = a2;
  v5 = a3;
  if (MPMediaItemPropertyArtist == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setArtist:", v5);
  }
  else if ((NSString *)MPMediaItemPropertyPodcastURL == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFeedUrl:", v5);
  }
  else if (MPMediaItemPropertyPodcastTitle == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPodcastTitle:", v5);
  }
  else if (MPMediaItemPropertyPodcastPersistentID == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPodcastPersistentId:", v5);
  }
  else if (MPMediaItemPropertyAssetURL == v9)
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
    objc_msgSend(v6, "setAssetUrl:", v7);

  }
  else if ((NSString *)MPMediaItemPropertyIsITunesU == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsItunesU:", objc_msgSend(v5, "BOOLValue"));
  }
  else if (MPMediaItemPropertyPersistentID == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPersistentId:", v5);
  }
  else if ((NSString *)MPMediaItemPropertyFileSize == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setByteSize:", v5);
  }
  else if (MPMediaItemPropertyGenre == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCategory:", v5);
  }
  else if (MPMediaItemPropertyPlaybackDuration == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDuration:", v5);
  }
  else if (MPMediaItemPropertyTitle == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v5);
  }
  else if (MPMediaItemPropertyMediaType == v9)
  {
    v8 = &kUTTypeMovie;
    if (objc_msgSend(v5, "integerValue") != (id)1024 && objc_msgSend(v5, "integerValue") != (id)4096)
      v8 = &kUTTypeAudio;
    objc_msgSend(*(id *)(a1 + 32), "setUti:", *v8);
  }
  else if ((NSString *)MPMediaItemPropertyPodcastGUID == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setGuid:", v5);
  }
  else if (MPMediaItemPropertyReleaseDate == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPubDate:", v5);
  }
  else if (MPMediaItemPropertyBookmarkTime == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlayhead:", v5);
  }
  else if ((NSString *)MPMediaItemPropertyHasBeenPlayed == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenPlayed:", objc_msgSend(v5, "BOOLValue"));
  }
  else if (MPMediaItemPropertyPlayCount == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlayCount:", v5);
  }
  else if ((NSString *)MPMediaItemPropertyDownloadIdentifier == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDownloadIdentifier:", v5);
  }
  else if ((NSString *)MPMediaItemPropertyRestricted == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsExplicit:", objc_msgSend(v5, "BOOLValue"));
  }
  else if ((NSString *)MPMediaItemPropertyStoreID == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStoreTrackId:", v5);
  }
  else if ((NSString *)MPMediaItemPropertyStorePlaylistID == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStoreCollectionId:", v5);
  }
  else if (MPMediaItemPropertyLastPlayedDate == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastPlayedDate:", v5);
  }

}

BOOL sub_100004608(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemWithPersistentID:", objc_msgSend(v2, "persistentID")));

  v5 = +[MTMLMediaItem isMissingAssetForItem:](MTMLMediaItem, "isMissingAssetForItem:", v4);
  if (v5)
    objc_msgSend(v4, "populateLocationPropertiesWithPath:", 0);

  return v5;
}

void sub_100004E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E54(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004E64(uint64_t a1)
{

}

void sub_100004E6C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "setIgnoreSystemFilterPredicates:", 1);
    v3 = v8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "arrayByAddingObjectsFromArray:", v4));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void sub_1000051C4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description"));
  objc_msgSend(v4, "setValue:forKey:", v6, v5);

}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend__applePodcastsFoundationSharedUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applePodcastsFoundationSharedUserDefaults");
}

id objc_msgSend__beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginGeneratingLibraryChangeNotifications");
}

id objc_msgSend__endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endGeneratingLibraryChangeNotifications");
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

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginGeneratingLibraryChangeNotifications");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_containsStringInsensitive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsStringInsensitive:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_counterForGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "counterForGeneratingLibraryChangeNotifications");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_debugDataFileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDataFileName");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMediaLibrary");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endGeneratingLibraryChangeNotifications");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateValuesForProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateValuesForProperties:usingBlock:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filesInDir_matchingPattern_excludingPattern_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesInDir:matchingPattern:excludingPattern:");
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guid");
}

id objc_msgSend_initWithPath_withDisplayName_modificationDate_andFilesize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:withDisplayName:modificationDate:andFilesize:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isMediaItemSyncedFromiTunes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMediaItemSyncedFromiTunes:");
}

id objc_msgSend_isMissingAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMissingAsset");
}

id objc_msgSend_isMissingAssetForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMissingAssetForItem:");
}

id objc_msgSend_isMissingFilePathForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMissingFilePathForItem:");
}

id objc_msgSend_itemWithPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemWithPersistentID:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mt_allItemsForPodcastsApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_allItemsForPodcastsApp");
}

id objc_msgSend_mt_iTunesUQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_iTunesUQuery");
}

id objc_msgSend_mt_podcastsQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_podcastsQuery");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_performTransactionWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performTransactionWithBlock:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentID");
}

id objc_msgSend_persistentId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentId");
}

id objc_msgSend_podcastsQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastsQuery");
}

id objc_msgSend_populateLocationPropertiesWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateLocationPropertiesWithPath:");
}

id objc_msgSend_predicateWithValue_forProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithValue:forProperty:");
}

id objc_msgSend_propertiesForMediaItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertiesForMediaItem");
}

id objc_msgSend_registerDataProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDataProvider:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_requestMediaLibraryWriteTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestMediaLibraryWriteTransaction:");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_setArtist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArtist:");
}

id objc_msgSend_setAssetUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetUrl:");
}

id objc_msgSend_setAttachmentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachmentType:");
}

id objc_msgSend_setByteSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByteSize:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCounterForGeneratingLibraryChangeNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCounterForGeneratingLibraryChangeNotifications:");
}

id objc_msgSend_setDownloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadIdentifier:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setFeedUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeedUrl:");
}

id objc_msgSend_setGroupingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGroupingType:");
}

id objc_msgSend_setGuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGuid:");
}

id objc_msgSend_setHasBeenPlayed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasBeenPlayed:");
}

id objc_msgSend_setIgnoreSystemFilterPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreSystemFilterPredicates:");
}

id objc_msgSend_setIsExplicit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsExplicit:");
}

id objc_msgSend_setIsFromITunesSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFromITunesSync:");
}

id objc_msgSend_setIsItunesU_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsItunesU:");
}

id objc_msgSend_setIsMissingAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsMissingAsset:");
}

id objc_msgSend_setLastPlayedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPlayedDate:");
}

id objc_msgSend_setPersistentId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentId:");
}

id objc_msgSend_setPlayCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayCount:");
}

id objc_msgSend_setPlayhead_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayhead:");
}

id objc_msgSend_setPodcastPersistentId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPodcastPersistentId:");
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPodcastTitle:");
}

id objc_msgSend_setPubDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPubDate:");
}

id objc_msgSend_setSerialQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialQueue:");
}

id objc_msgSend_setShouldCompress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCompress:");
}

id objc_msgSend_setStoreCollectionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreCollectionId:");
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreTrackId:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUti_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUti:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setup");
}

id objc_msgSend_sharedDocumentsDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDocumentsDirectory");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_toJSONString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toJSONString:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_writeDebugData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDebugData");
}
