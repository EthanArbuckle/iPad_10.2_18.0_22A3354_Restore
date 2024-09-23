void sub_1000018C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000196C(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000019D4;
  block[3] = &unk_100004278;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_1000019D4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100001AA4(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "container"));
  v6 = objc_msgSend(v5, "newBackgroundModel");

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100001C24;
  v13[3] = &unk_1000042C8;
  v14 = a1[5];
  v15 = v6;
  v7 = v2;
  v16 = v7;
  v8 = v3;
  v17 = v8;
  v9 = v6;
  objc_msgSend(v9, "performBlockAndWait:", v13);

  objc_autoreleasePoolPop(v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100001D68;
  v11[3] = &unk_1000042A0;
  v12 = a1[6];
  objc_msgSend(v10, "updateSearchMetadataWithRecordingURIsToInsert:recordingURIsToUpdate:recordingURIsToDelete:completionBlock:", 0, v7, v8, v11);

}

void sub_100001C24(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCCloudRecording savedRecordingURIForSearchableItemIdentifier:](RCCloudRecording, "savedRecordingURIForSearchableItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recordingWithURIRepresentation:", v7));
        if (v8)
          v9 = 48;
        else
          v9 = 56;
        objc_msgSend(*(id *)(a1 + v9), "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void sub_100001D68(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001DD0;
  block[3] = &unk_100004278;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100001DD0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_1000020F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", a1, a2, a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_100004330));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

NSString *__cdecl sub_100002A98(id a1, AVMetadataItem *a2)
{
  return -[AVMetadataItem stringValue](a2, "stringValue");
}

NSDate *__cdecl sub_100002AA0(id a1, AVMetadataItem *a2)
{
  return -[AVMetadataItem dateValue](a2, "dateValue");
}

NSNumber *__cdecl sub_100002AA8(id a1, AVMetadataItem *a2)
{
  return -[AVMetadataItem numberValue](a2, "numberValue");
}

NSData *__cdecl sub_100002AB0(id a1, AVMetadataItem *a2)
{
  return -[AVMetadataItem dataValue](a2, "dataValue");
}

id objc_msgSend_AVAssetAuthoringMetadataWithRecordingMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AVAssetAuthoringMetadataWithRecordingMetadata:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "container");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileFormat");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatDescriptions");
}

id objc_msgSend_identifierForKey_keySpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierForKey:keySpace:");
}

id objc_msgSend_initStandardFormatWithSampleRate_channels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initStandardFormatWithSampleRate:channels:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:options:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "key");
}

id objc_msgSend_keySpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keySpace");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataItemsFromArray_withKey_keySpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataItemsFromArray:withKey:keySpace:");
}

id objc_msgSend_movieWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movieWithURL:options:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_map:");
}

id objc_msgSend_newBackgroundModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBackgroundModel");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processingFormat");
}

id objc_msgSend_rc_audioTracks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rc_audioTracks");
}

id objc_msgSend_rc_updateMetadataInFile_withMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rc_updateMetadataInFile:withMetadata:error:");
}

id objc_msgSend_recordingWithURIRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordingWithURIRepresentation:");
}

id objc_msgSend_reloadExistingSearchMetadataWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadExistingSearchMetadataWithCompletionBlock:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sampleRate");
}

id objc_msgSend_savedRecordingURIForSearchableItemIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savedRecordingURIForSearchableItemIdentifier:");
}

id objc_msgSend_setDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataType:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setKeySpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeySpace:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_tracksWithMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tracksWithMediaType:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSearchMetadataWithRecordingURIsToInsert:recordingURIsToUpdate:recordingURIsToDelete:completionBlock:");
}

id objc_msgSend_writeMovieHeaderToURL_fileType_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMovieHeaderToURL:fileType:options:error:");
}
