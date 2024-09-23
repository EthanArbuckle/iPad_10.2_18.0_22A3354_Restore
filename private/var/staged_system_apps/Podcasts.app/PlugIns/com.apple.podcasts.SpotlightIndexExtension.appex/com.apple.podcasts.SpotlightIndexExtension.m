void sub_100004FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005018(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005028(uint64_t a1)
{

}

void sub_100005030(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentFetchRequest"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj));
  objc_storeStrong((id *)(v4 + 40), obj);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "count") == 0;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mt_compactMap:", *(_QWORD *)(a1 + 40)));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_entitiesByRemovingAlreadyProcessedFrom:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

id sub_1000052B8(id a1, NSManagedObject *a2)
{
  return a2;
}

uint64_t sub_1000052CC(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;

  result = *(_QWORD *)(a1 + 56);
  if (result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 1;
    if (0x8F5C28F5C28F5C29 * v3 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70)
    {
      v4 = _MTLogCategorySpotlight();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count")));
        v8 = *(_QWORD *)(a1 + 32);
        v9 = 138412802;
        v10 = v6;
        v11 = 2112;
        v12 = v7;
        v13 = 2112;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Indexing] *** batch processing - continuing batch #%@ with %@ entities [%@]", (uint8_t *)&v9, 0x20u);

      }
      result = *(_QWORD *)(a1 + 56);
    }
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t sub_10000561C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "externallyProcessedMOIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectID"));

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

void sub_10000573C(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create(0, 0);
  v2 = (void *)qword_10001A398;
  qword_10001A398 = (uint64_t)v1;

}

uint64_t sub_100005764(uint64_t result)
{
  uint64_t v1;

  v1 = MTCoreSpotlightIndexBatchGeneratorNextDebugID;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = MTCoreSpotlightIndexBatchGeneratorNextDebugID;
  MTCoreSpotlightIndexBatchGeneratorNextDebugID = v1 + 1;
  return result;
}

NSString *__cdecl sub_100006758(id a1, NSSortDescriptor *a2)
{
  return -[NSSortDescriptor key](a2, "key");
}

void sub_100006E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006E1C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:](MTRecencyUtil, "upNextForPodcastUuid:excludeExplicit:ctx:", v2, 0, *(_QWORD *)(a1 + 40)));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextEpisodeUuid"));
  v6 = _MTLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
    objc_msgSend(v3, "modifiedDate");
    v16 = 138543874;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2050;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v16, 0x20u);

  }
  v11 = _MTLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
    v16 = 138543618;
    v17 = v5;
    v18 = 2114;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v16, 0x16u);

  }
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v5));
    if (objc_msgSend(v15, "listenNowEpisode"))
    {
      objc_msgSend(v15, "setListenNowEpisode:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v14 && (objc_msgSend(v14, "listenNowEpisode") & 1) == 0)
    {
      objc_msgSend(v14, "setListenNowEpisode:", 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v3, "modifiedDate");
      objc_msgSend(*(id *)(a1 + 32), "setModifiedDate:");
    }

  }
  if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "saveInCurrentBlock");

}

void sub_1000071CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000071E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000071F4(uint64_t a1)
{

}

void sub_1000071FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastForFeedUrl:", *(_QWORD *)(a1 + 40)));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1000075C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000075DC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:](MTEpisode, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:", v3));
  objc_msgSend(v2, "setPredicate:", v4);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v5 = *(void **)(a1 + 40);
  v8 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v2, &v8));
  v7 = v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "count") != 0;

  objc_msgSend(v7, "logAndThrow:", 0);
}

void sub_1000077EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007804(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_fetchRequestForDistinctSeasons"));
  v3 = *(void **)(a1 + 40);
  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v2, &v9));
  v5 = v9;
  objc_msgSend(v5, "logAndThrow:", 0);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", kEpisodeSeasonNumber));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_1000079CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000079E4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeType:](MTEpisode, "predicateForEpisodeType:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSeasonNumberWithNoEpisodeNumber:](MTEpisode, "predicateForSeasonNumberWithNoEpisodeNumber:", *(_QWORD *)(a1 + 64)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AND:", v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AND:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForPubDateAscending:](MTEpisode, "sortDescriptorsForPubDateAscending:", 0));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", kMTEpisodeEntityName, v5, v6, 0, 1));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

id sub_100007C28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allObjects"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007CCC;
  v8[3] = &unk_1000146D8;
  v9 = v3;
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mt_compactMap:", v8));

  return v6;
}

id sub_100007CCC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "playlistForUuid:", a2);
}

void sub_100007D80(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  MTCoreSpotlightIndexBatchGenerator *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  int v18;
  MTCoreSpotlightIndexBatchGenerator *v19;

  if (objc_msgSend(*(id *)(a1 + 32), "hasBeenIndexed"))
  {
    v2 = _MTLogCategorySpotlight();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[IndexAll] bailing.  already indexed...", (uint8_t *)&v18, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indexAllBatchGenerator"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indexAllBatchGenerator")),
        v7 = objc_msgSend(v6, "finished"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "savedPartialUploadStateIndexPath"));
    v9 = -[MTCoreSpotlightIndexBatchGenerator initWithStartingIndexPath:]([MTCoreSpotlightIndexBatchGenerator alloc], "initWithStartingIndexPath:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setIndexAllBatchGenerator:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indexAllBatchGenerator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexAllCompletions"));
    v12 = objc_retainBlock(*(id *)(a1 + 40));
    objc_msgSend(v11, "addObject:", v12);

    v13 = _MTLogCategorySpotlight();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Indexing] *** scheduling indexAll in batches [%@] ***", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onIndexingQueueHandleNextBatchOrUpdateRequest");
    goto LABEL_14;
  }
  v15 = _MTLogCategorySpotlight();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[IndexAll] bailing.  already running...", (uint8_t *)&v18, 2u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indexAllBatchGenerator"));
    v9 = (MTCoreSpotlightIndexBatchGenerator *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexAllCompletions"));
    v17 = objc_retainBlock(*(id *)(a1 + 40));
    -[MTCoreSpotlightIndexBatchGenerator addObject:](v9, "addObject:", v17);

LABEL_14:
  }
}

void sub_1000080E0(uint64_t a1)
{
  uint64_t v2;
  MTCSUpdateIndexRequest *v3;
  MTCSUpdateIndexRequest *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  MTCSUpdateIndexRequest *v9;

  if (objc_msgSend(*(id *)(a1 + 32), "hasDeferredIndexAll"))
  {
    v2 = _MTLogCategorySpotlight();
    v3 = (MTCSUpdateIndexRequest *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(MTCSUpdateIndexRequest **)(a1 + 40);
      v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v3->super, OS_LOG_TYPE_DEFAULT, "[Update] Dropping index request (reason '%@') since we haven't yet received the initial indexAllData", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v3 = -[MTCSUpdateIndexRequest initWithReason:entityLoadingBlock:searchableIndex:completion:]([MTCSUpdateIndexRequest alloc], "initWithReason:entityLoadingBlock:searchableIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updateIndexRequests"));
    objc_msgSend(v5, "addObject:", v3);

    v6 = _MTLogCategorySpotlight();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Indexing] *** scheduling update [%@] ***", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onIndexingQueueHandleNextBatchOrUpdateRequest");
  }

}

void sub_100008440(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000084A8;
  v2[3] = &unk_1000147B8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t sub_1000084A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

void sub_100008694(uint64_t a1)
{
  uint64_t (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;

  v2 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entityLoadingBlock"));
  v3 = v2[2](v2, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  v6 = _MTLogCategorySpotlight(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Indexing] *** handling update [BEGIN] [%@] ***", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "indexAllBatchGenerator"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mt_compactMap:", &stru_100014820));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "indexAllBatchGenerator"));
    objc_msgSend(v11, "markUpdateUnnecessaryForObjectIDs:", v10);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "annotator"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000884C;
  v14[3] = &unk_100014898;
  v13 = *(void **)(a1 + 56);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = v13;
  v16 = *(id *)(a1 + 32);
  +[MTCoreSpotlightUtil prepareSearchableItemsForObjectInArray:annotator:completion:](MTCoreSpotlightUtil, "prepareSearchableItemsForObjectInArray:annotator:completion:", v4, v12, v14);

}

NSManagedObjectID *__cdecl sub_100008844(id a1, NSManagedObject *a2)
{
  return -[NSManagedObject objectID](a2, "objectID");
}

void sub_10000884C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000089A4;
  v11[3] = &unk_100014848;
  v12 = *(id *)(a1 + 48);
  v6 = _MTLogCategorySpotlight(objc_msgSend(v4, "searchableIndex:indexSearchableItems:completionHandler:", v5, a2, v11));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Indexing] *** handling update [DONE] [%@] ***", buf, 0xCu);
  }

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indexingQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008A0C;
  v10[3] = &unk_100014870;
  v10[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v9, v10);

}

void sub_1000089A4(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completion"));

  if (v2)
  {
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completion"));
    v3[2]();

  }
}

id sub_100008A0C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasIndexingOperationInProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_onIndexingQueueHandleNextBatchOrUpdateRequest");
}

id sub_100008AF0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_startProcessNextBatchInGenerator:searchableIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_100008BA0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotator"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008C64;
  v9[3] = &unk_100014898;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  +[MTCoreSpotlightUtil prepareSearchableItemsForObjectInArray:annotator:completion:](MTCoreSpotlightUtil, "prepareSearchableItemsForObjectInArray:annotator:completion:", v5, v6, v9);

}

void sub_100008C64(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "count") && !objc_msgSend(*(id *)(a1 + 32), "finished"))
  {
    v6 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008D34;
    v8[3] = &unk_100014910;
    v7 = *(void **)(a1 + 32);
    v8[4] = v6;
    v9 = v7;
    objc_msgSend(v6, "searchableIndex:indexSearchableItems:completionHandler:", v5, v3, v8);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "canceled"))
      v4 = 2;
    else
      v4 = 4;
    objc_msgSend(*(id *)(a1 + 40), "_didCompleteBatchProcessingBatchGenerator:state:error:", *(_QWORD *)(a1 + 32), v4, 0);
  }

}

void sub_100008D34(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_didCompleteBatchProcessingBatchGenerator:state:error:", *(_QWORD *)(a1 + 40), 3, a2);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexingQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008DDC;
    v7[3] = &unk_1000147E0;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(v4, v7);

  }
}

void sub_100008DDC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextIndexPath"));
  objc_msgSend(*(id *)(a1 + 40), "savePartialUploadStateIndexPath:", v2);
  objc_msgSend(*(id *)(a1 + 40), "setHasIndexingOperationInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_onIndexingQueueHandleNextBatchOrUpdateRequest");

}

id sub_100008F18(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;

  v2 = _MTLogCategorySpotlight(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 56) - 1;
    if (v4 > 3)
      v5 = CFSTR("inactive");
    else
      v5 = off_100014AB8[v4];
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Indexing] *** completed indexAll (%@) in batches [%@] ***", (uint8_t *)&v10, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "indexAllBatchGenerator"));
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
    objc_msgSend(*(id *)(a1 + 40), "setIndexAllBatchGenerator:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_onQueuePerformCompletionsForGenerator:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setHasIndexingOperationInProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_onIndexingQueueHandleNextBatchOrUpdateRequest");
}

void sub_1000092AC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000933C;
    v4[3] = &unk_1000149A8;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "indexSearchableItems:completionHandler:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t sub_10000933C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100009400(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "searchableIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allObjects"));
    objc_msgSend(v4, "deleteSearchableItemsWithIdentifiers:completionHandler:", v3, 0);

  }
}

void sub_10000963C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000965C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000966C(uint64_t a1)
{

}

void sub_100009674(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "changesForEntityName:", kMTPodcastEntityName));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "updatedObjectIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "changesForEntityName:", kMTEpisodeEntityName));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjectIDs"));
  objc_msgSend(v4, "unionSet:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "changesForEntityName:", kMTPlaylistEntityName));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updatedObjectIDs"));
  objc_msgSend(v4, "unionSet:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "existingObjectWithID:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14), 0));
        if (v15)
          objc_msgSend(v9, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "annotator"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000098F4;
  v18[3] = &unk_1000149F8;
  v18[4] = *(_QWORD *)(a1 + 40);
  +[MTCoreSpotlightUtil prepareSearchableItemsForObjectInArray:annotator:completion:](MTCoreSpotlightUtil, "prepareSearchableItemsForObjectInArray:annotator:completion:", v16, v17, v18);

}

void sub_1000098F4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchableIndex"));
  objc_msgSend(v2, "searchableIndex:indexSearchableItems:completionHandler:", v4, v3, 0);

}

void sub_100009A08(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v2 = _MTLogCategorySpotlight(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Indexing] *** received indexAll request ***", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_onQueueCancelCurrentReindexAll");
  objc_msgSend(*(id *)(a1 + 32), "clearHasBeenIndexed");
  objc_msgSend(*(id *)(a1 + 32), "clearPartialUploadState");
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009AE4;
  v6[3] = &unk_1000149A8;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "indexAllDataWithSearchableIndex:completionHandler:", v5, v6);

}

uint64_t sub_100009AE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100009BD8(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v2 = objc_alloc_init((Class)NSMutableSet);
  v3 = objc_alloc_init((Class)NSMutableSet);
  v20 = a1;
  v21 = objc_alloc_init((Class)NSMutableSet);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v9, "length", v20) >= 2)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", 1));
          v11 = objc_msgSend(v9, "hasPrefix:", CFSTR("p"));
          v12 = v2;
          if ((v11 & 1) != 0
            || (v13 = objc_msgSend(v9, "hasPrefix:", CFSTR("e")), v12 = v3, (v13 & 1) != 0)
            || (v14 = objc_msgSend(v9, "hasPrefix:", CFSTR("s")), v12 = v21, v14))
          {
            objc_msgSend(v12, "addObject:", v10);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  v15 = *(void **)(v20 + 40);
  v16 = *(_QWORD *)(v20 + 48);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100009E48;
  v24[3] = &unk_100014A48;
  v25 = v2;
  v26 = v3;
  v27 = v21;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000A0CC;
  v22[3] = &unk_100014A70;
  v23 = *(id *)(v20 + 56);
  v17 = v21;
  v18 = v3;
  v19 = v2;
  objc_msgSend(v15, "updateSearchableIndexWithReason:searchableIndex:entityLoadingBlock:completion:", CFSTR("System Re-index request"), v16, v24, v22);

}

id sub_100009E48(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), kPodcastFeedUrl, a1[4]));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil fetchRequestForIndexType:additionalPredicate:](MTCoreSpotlightUtil, "fetchRequestForIndexType:additionalPredicate:", 0, v4));
  v28[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), kEpisodeGuid, a1[5]));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil fetchRequestForIndexType:additionalPredicate:](MTCoreSpotlightUtil, "fetchRequestForIndexType:additionalPredicate:", 1, v6));
  v28[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), kPlaylistUuid, a1[6]));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil fetchRequestForIndexType:additionalPredicate:](MTCoreSpotlightUtil, "fetchRequestForIndexType:additionalPredicate:", 2, v8));
  v28[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v16);
        v22 = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v17, &v22));
        v19 = v22;
        v20 = v19;
        if (v19)
          objc_msgSend(v19, "logAndThrow:", 1);
        if (v18)
          objc_msgSend(v11, "addObjectsFromArray:", v18);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  return v11;
}

uint64_t sub_10000A0CC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10000AC18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000AC28(uint64_t a1)
{

}

void sub_10000AC30(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  if (!v2)
    v2 = *(void **)(v1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void sub_10000ACE4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = _MTLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

void sub_10000AEAC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasFetchedInitialAccount") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateActiveAccount");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AF44;
    block[3] = &unk_100014A70;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t sub_10000AF44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000B208(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint8_t v8[16];

  v2 = _MTLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v8, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_activeAccountBlocking"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v7 = *(_QWORD *)(a1 + 40);
  if (v7 | v6 && (objc_msgSend((id)v7, "isEqualToString:", v6) & 1) == 0)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100014B10);
  objc_msgSend(*(id *)(a1 + 32), "setActiveAccount:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setHasFetchedInitialAccount:", 1);

}

void sub_10000B2F0(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("AccountDSIDChangedNotification"), 0);

}

void sub_10000B894(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;

  v4 = a2;
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B928;
    block[3] = &unk_1000147E0;
    v3 = *(NSObject **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = v4;
    dispatch_sync(v3, block);

  }
}

id sub_10000B928(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void sub_10000B934(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = objc_autoreleasePoolPush();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B9FC;
  v6[3] = &unk_100014B60;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  +[MTCoreSpotlightUtil prepareSearchableItemForObject:annotator:completion:](MTCoreSpotlightUtil, "prepareSearchableItemForObject:annotator:completion:", v3, v5, v6);

  objc_autoreleasePoolPop(v4);
}

void sub_10000B9FC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10000BA28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_10000BCEC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000BD00(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  _QWORD v6[4];
  id v7;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
    v4 = kMTLibraryDefaultImageKey;
    v5 = *(double *)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000BDD8;
    v6[3] = &unk_100014C00;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v3, "asyncImageURLForKey:squareDimension:cacheKeyModifier:completionHandler:", v4, 0, v6, v5);

  }
}

uint64_t sub_10000BDD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10000C428(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet"));
  objc_msgSend(v5, "setThumbnailURL:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t sub_10000CA1C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributeSet"));
  objc_msgSend(v5, "setThumbnailURL:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

CSSearchableItem __swiftcall AppCoreSpotlightEntityAnnotator.annotate(item:with:)(CSSearchableItem item, NSManagedObject with)
{
  return (CSSearchableItem)(id)sub_10000CE50((uint64_t)item.super.isa, with.super.isa);
}

id AppCoreSpotlightEntityAnnotator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id AppCoreSpotlightEntityAnnotator.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return objc_msgSendSuper2(&v2, "init");
}

id AppCoreSpotlightEntityAnnotator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000CE50(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;

  v4 = objc_opt_self(MTEpisode);
  v5 = swift_dynamicCastObjCClass(a2, v4);
  if (v5)
  {
    v6 = v5;
    *((_QWORD *)&v25 + 1) = type metadata accessor for EpisodeEntity(0);
    v26 = sub_10000D1B4(&qword_10001A388, (uint64_t (*)(uint64_t))&type metadata accessor for EpisodeEntity, (uint64_t)&protocol conformance descriptor for EpisodeEntity);
    sub_10000D11C(&v24);
    v7 = a2;
    EpisodeEntity.init(model:)(v6);
  }
  else
  {
    v8 = objc_opt_self(MTPodcast);
    v9 = swift_dynamicCastObjCClass(a2, v8);
    if (v9)
    {
      v10 = v9;
      *((_QWORD *)&v25 + 1) = type metadata accessor for ShowEntity(0);
      v26 = sub_10000D1B4(&qword_10001A380, (uint64_t (*)(uint64_t))&type metadata accessor for ShowEntity, (uint64_t)&protocol conformance descriptor for ShowEntity);
      sub_10000D11C(&v24);
      v11 = a2;
      ShowEntity.init(model:)(v10);
    }
    else
    {
      v12 = objc_opt_self(MTChannel);
      v13 = swift_dynamicCastObjCClass(a2, v12);
      if (v13)
      {
        v14 = v13;
        *((_QWORD *)&v25 + 1) = type metadata accessor for ChannelEntity(0);
        v26 = sub_10000D1B4(&qword_10001A378, (uint64_t (*)(uint64_t))&type metadata accessor for ChannelEntity, (uint64_t)&protocol conformance descriptor for ChannelEntity);
        sub_10000D11C(&v24);
        v15 = a2;
        ChannelEntity.init(model:)(v14);
      }
      else
      {
        v16 = objc_opt_self(MTPlaylist);
        v17 = swift_dynamicCastObjCClass(a2, v16);
        if (!v17)
        {
          v26 = 0;
          v24 = 0u;
          v25 = 0u;
          sub_10000D09C((uint64_t)&v24);
          return a1;
        }
        v18 = v17;
        *((_QWORD *)&v25 + 1) = type metadata accessor for StationEntity(0);
        v26 = sub_10000D1B4(&qword_10001A370, (uint64_t (*)(uint64_t))&type metadata accessor for StationEntity, (uint64_t)&protocol conformance descriptor for StationEntity);
        sub_10000D11C(&v24);
        v19 = a2;
        StationEntity.init(model:)(v18);
      }
    }
  }
  sub_10000D158(&v24, (uint64_t)v27);
  v20 = v28;
  v21 = v29;
  v22 = sub_10000D170(v27, v28);
  CSSearchableItem.associate<A>(appEntity:priority:)(v22, 0, v20, v21);
  sub_10000D194(v27);
  return a1;
}

uint64_t type metadata accessor for AppCoreSpotlightEntityAnnotator()
{
  return objc_opt_self(MTAppCoreSpotlightEntityAnnotator);
}

uint64_t sub_10000D09C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000D0DC(&qword_10001A368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D0DC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_10000D11C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_10000D158(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *sub_10000D170(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000D194(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000D1B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id objc_msgSend_AND_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AND:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__activeAccountBlocking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeAccountBlocking");
}

id objc_msgSend__didCompleteBatchProcessingBatchGenerator_state_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didCompleteBatchProcessingBatchGenerator:state:error:");
}

id objc_msgSend__entitiesByRemovingAlreadyProcessedFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitiesByRemovingAlreadyProcessedFrom:");
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRequestForDistinctSeasons");
}

id objc_msgSend__onIndexingQueueHandleNextBatchOrUpdateRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onIndexingQueueHandleNextBatchOrUpdateRequest");
}

id objc_msgSend__onIndexingQueuePerformUpdateRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onIndexingQueuePerformUpdateRequest:");
}

id objc_msgSend__onQueueCancelCurrentReindexAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueCancelCurrentReindexAll");
}

id objc_msgSend__onQueuePerformCompletionsForGenerator_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueuePerformCompletionsForGenerator:error:");
}

id objc_msgSend__onQueueStartProcessNextBatchInGenerator_searchableIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueStartProcessNextBatchInGenerator:searchableIndex:");
}

id objc_msgSend__prepareToHandleNextBatchWithReadyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareToHandleNextBatchWithReadyBlock:");
}

id objc_msgSend__uniqueIdentifierForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uniqueIdentifierForPodcast:");
}

id objc_msgSend__updateActiveAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActiveAccount");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccount");
}

id objc_msgSend_activeDsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeDsid");
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamID");
}

id objc_msgSend_addChangeNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChangeNotifier:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_fullName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fullName");
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isManagedAppleID");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_annotateItem_withManagedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateItem:withManagedObject:");
}

id objc_msgSend_annotator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotator");
}

id objc_msgSend_applyShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyShowTypeSetting:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetURL");
}

id objc_msgSend_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncImageURLForKey:squareDimension:cacheKeyModifier:completionHandler:");
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeSet");
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "author");
}

id objc_msgSend_bestDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestDescription");
}

id objc_msgSend_bestSummary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestSummary");
}

id objc_msgSend_bestTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestTitle");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_canExtensionOpenDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canExtensionOpenDatabase");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canceled");
}

id objc_msgSend_changesForEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changesForEntityName:");
}

id objc_msgSend_clearHasBeenIndexed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHasBeenIndexed");
}

id objc_msgSend_clearPartialUploadState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPartialUploadState");
}

id objc_msgSend_collectNextBatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectNextBatch:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completion");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configureArtworkForSearchableItemAttributeSet_withPodcastUuid_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureArtworkForSearchableItemAttributeSet:withPodcastUuid:completion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentFeedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentFeedURL");
}

id objc_msgSend_currentFetchRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentFetchRequest");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_deleteSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSearchableItemsWithIdentifiers:completionHandler:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_downloadDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadDate");
}

id objc_msgSend_downloadedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedDate");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_entityLoadingBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityLoadingBlock");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_episodeForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForUuid:");
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuid");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_existingObjectWithID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingObjectWithID:error:");
}

id objc_msgSend_externalType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalType");
}

id objc_msgSend_externallyProcessedMOIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externallyProcessedMOIDs");
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedChangedDate");
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedURL");
}

id objc_msgSend_fetchRequestForIndexType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestForIndexType:");
}

id objc_msgSend_fetchRequestForIndexType_additionalPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestForIndexType:additionalPredicate:");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestWithEntityName:");
}

id objc_msgSend_findEpisodeWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeWithRequest:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finished");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flags");
}

id objc_msgSend_generatedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatedDate");
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guid");
}

id objc_msgSend_hasBeenIndexed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenIndexed");
}

id objc_msgSend_hasDeferredIndexAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDeferredIndexAll");
}

id objc_msgSend_hasFetchedInitialAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasFetchedInitialAccount");
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasHTML");
}

id objc_msgSend_hasIndexingOperationInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasIndexingOperationInProgress");
}

id objc_msgSend_hasInsertsForEntityNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasInsertsForEntityNames:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_iTunesAccountDidChangeForACAccountNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesAccountDidChangeForACAccountNotification:");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiers");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageURL");
}

id objc_msgSend_importContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importContext");
}

id objc_msgSend_indexAllBatchGenerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAllBatchGenerator");
}

id objc_msgSend_indexAllCompletions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAllCompletions");
}

id objc_msgSend_indexAllDataWithSearchableIndex_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAllDataWithSearchableIndex:completionHandler:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSearchableItems:completionHandler:");
}

id objc_msgSend_indexingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexingQueue");
}

id objc_msgSend_initWithAnnotator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAnnotator:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:");
}

id objc_msgSend_initWithItemContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemContentType:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:bundleIdentifier:");
}

id objc_msgSend_initWithReason_entityLoadingBlock_searchableIndex_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReason:entityLoadingBlock:searchableIndex:completion:");
}

id objc_msgSend_initWithStartingIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartingIndexPath:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isDownloaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDownloaded");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExplicit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExplicit");
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSerialShowTypeInFeed");
}

id objc_msgSend_isUserLoggedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUserLoggedIn");
}

id objc_msgSend_isValidShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidShowTypeSetting:");
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemDescription");
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastDatePlayed");
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastImplicitlyFollowedDate");
}

id objc_msgSend_lastTouchDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastTouchDate");
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestSeasonNumber");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lenientSharedInstance");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "library");
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenNowEpisode");
}

id objc_msgSend_logAndThrow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAndThrow:");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_markHasBeenIndexed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markHasBeenIndexed");
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markPlaylistsForUpdate");
}

id objc_msgSend_markSubscriptionSyncDirty_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markSubscriptionSyncDirty:for:");
}

id objc_msgSend_markUpdateUnnecessaryForObjectIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markUpdateUnnecessaryForObjectIDs:");
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifiedDate");
}

id objc_msgSend_mt_compactMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_compactMap:");
}

id objc_msgSend_mt_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_filter:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsUpdate");
}

id objc_msgSend_newestEpisodeWithFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisodeWithFilter:");
}

id objc_msgSend_nextBatchWithTransformationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextBatchWithTransformationBlock:");
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextEpisodeUuid");
}

id objc_msgSend_nextIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextIndexPath");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectID");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentID");
}

id objc_msgSend_playCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playCount");
}

id objc_msgSend_playState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playState");
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackNewestToOldest");
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlist");
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistIfDefault");
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSettings");
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcast");
}

id objc_msgSend_podcastForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForFeedUrl:");
}

id objc_msgSend_podcastUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuid");
}

id objc_msgSend_podcastUuidForFeedUrlString_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuidForFeedUrlString:ctx:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_predicateForEpisodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeType:");
}

id objc_msgSend_predicateForEpisodesWithSeasonNumbersOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:");
}

id objc_msgSend_predicateForNotHiddenNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
}

id objc_msgSend_predicateForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcast:");
}

id objc_msgSend_predicateForPodcastIsNotHiddenNotImplicitlyFollowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
}

id objc_msgSend_predicateForSeasonNumberWithNoEpisodeNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSeasonNumberWithNoEpisodeNumber:");
}

id objc_msgSend_predicateForSubscriptionSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSubscriptionSyncType:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:");
}

id objc_msgSend_prepareSearchableItemForEpisode_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForEpisode:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForObject_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForObject:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForPodcast_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForPodcast:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForStation_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForStation:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemsForObjectInArray_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemsForObjectInArray:annotator:completion:");
}

id objc_msgSend_privateQueueContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateQueueContext");
}

id objc_msgSend_pubDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pubDate");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "row");
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveInCurrentBlock");
}

id objc_msgSend_savePartialUploadStateIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePartialUploadStateIndexPath:");
}

id objc_msgSend_savedPartialUploadStateIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savedPartialUploadStateIndexPath");
}

id objc_msgSend_searchableIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex");
}

id objc_msgSend_searchableIndex_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:indexSearchableItems:completionHandler:");
}

id objc_msgSend_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:");
}

id objc_msgSend_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:");
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonNumbers");
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonSortDescriptorsForSortOrder");
}

id objc_msgSend_seasonTrailerInSeason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonTrailerInSeason:");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "section");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setActiveAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveAccount:");
}

id objc_msgSend_setAttributeSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributeSet:");
}

id objc_msgSend_setAuthorNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthorNames:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setCompletionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionDate:");
}

id objc_msgSend_setContainerTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerTitle:");
}

id objc_msgSend_setContentCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCreationDate:");
}

id objc_msgSend_setContentDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentDescription:");
}

id objc_msgSend_setContentRating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentRating:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setContentURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentURL:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDomainIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomainIdentifier:");
}

id objc_msgSend_setDownloadedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadedDate:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEpisodeGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeGuid:");
}

id objc_msgSend_setEpisodeTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeTitle:");
}

id objc_msgSend_setExcludeUnentitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeUnentitled:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFetchOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchOffset:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setHasFetchedInitialAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasFetchedInitialAccount:");
}

id objc_msgSend_setHasIndexingOperationInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasIndexingOperationInProgress:");
}

id objc_msgSend_setIndexAllBatchGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexAllBatchGenerator:");
}

id objc_msgSend_setIndexDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexDelegate:");
}

id objc_msgSend_setInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInformation:");
}

id objc_msgSend_setLastUsedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUsedDate:");
}

id objc_msgSend_setListenNowEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenNowEpisode:");
}

id objc_msgSend_setLocal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocal:");
}

id objc_msgSend_setModifiedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedDate:");
}

id objc_msgSend_setNeedsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUpdate:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentID:");
}

id objc_msgSend_setPlayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayCount:");
}

id objc_msgSend_setPodcastFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastFeedUrl:");
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastTitle:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimitiveValue:forKey:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setRelatedUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelatedUniqueIdentifier:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsDistinctResults:");
}

id objc_msgSend_setSortAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortAscending:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreTrackId:");
}

id objc_msgSend_setStreamUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamUrl:");
}

id objc_msgSend_setStreamable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamable:");
}

id objc_msgSend_setThumbnailURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumbnailURL:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeInFeed");
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeSetting");
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortAscending");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPlayOrderByEpisodeNumber");
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPlayOrderByPubDate");
}

id objc_msgSend_sortDescriptorsForPubDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPubDateAscending:");
}

id objc_msgSend_sortOrderAscForShowType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortOrderAscForShowType:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCollectionId");
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamURL");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringBySmartlyStrippingHTML");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribed");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncType");
}

id objc_msgSend_timestampBoundByNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampBoundByNow:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_topLevelPlaylistsPredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topLevelPlaylistsPredicate");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifierForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifierForObject:");
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "universalStore");
}

id objc_msgSend_upNextForPodcastUuid_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextForPodcastUuid:excludeExplicit:ctx:");
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvg");
}

id objc_msgSend_updateIndexRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIndexRequests");
}

id objc_msgSend_updateSearchableIndexWithReason_searchableIndex_entityLoadingBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSearchableIndexWithReason:searchableIndex:entityLoadingBlock:completion:");
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStdDev");
}

id objc_msgSend_updatedObjectIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedObjectIDs");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "username");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorID");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}
