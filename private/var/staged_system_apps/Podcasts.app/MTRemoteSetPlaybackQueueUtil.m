@implementation MTRemoteSetPlaybackQueueUtil

+ (void)setRemotePlaybackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manifest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));
  v10 = objc_msgSend(v9, "isInteractive");

  v24 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v12 = objc_msgSend(v11, "playbackQueueWithAccountInfoForManifest:queueStatus:", v8, &v24);

  if (v24)
  {
    if (v10)
      objc_msgSend(a1, "promptBeforePerformingRequestAsBufferedAirPlay:queueStatus:", v6);
    else
      objc_msgSend(a1, "performRequestAsBufferedAirPlay:", v6);
  }
  else
  {
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback(v12, objc_msgSend(v6, "startPlayback"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));
    v14 = objc_msgSend(v13, "upNextQueueIntent");

    if (v10)
      v15 = 0;
    else
      v15 = 2;
    if (v14)
      v15 = 0;
    if (v14 == (id)1)
      v16 = 2;
    else
      v16 = v15;
    if (v14 == (id)2)
      v17 = 1;
    else
      v17 = v16;
    MRSystemAppPlaybackQueueSetReplaceIntent(v12, v17);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000CAECC;
    v18[3] = &unk_1004A9EF8;
    v19 = v6;
    v20 = v7;
    v21 = v12;
    v22 = a1;
    v23 = v10;
    objc_msgSend(a1, "_destinationForRequest:completion:", v19, v18);

  }
}

+ (void)sendPlaybackQueueToLocalDestination:(_MRSystemAppPlaybackQueue *)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *ExternalRepresentation;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc((Class)MPCAssistantRemoteControlDestination);
  v11 = objc_msgSend(v10, "initWithAppBundleID:playerID:origin:", kMTApplicationBundleIdentifier, kPodcastsPlayerID, 0);
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(kCFAllocatorDefault, a3);
  if (ExternalRepresentation)
    objc_msgSend(v12, "setObject:forKey:", ExternalRepresentation, kMRMediaRemoteOptionSystemAppPlaybackQueueData);
  if (v8)
    objc_msgSend(v12, "setObject:forKey:", v8, kMRMediaRemoteOptionContextID);
  v14 = objc_alloc_init((Class)MPCAssistantCommand);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000CB3D0;
  v16[3] = &unk_1004A9F20;
  v17 = v9;
  v18 = a1;
  v15 = v9;
  objc_msgSend(v14, "sendCommand:toDestination:withOptions:completion:", 122, v11, v12, v16);

}

+ (void)promptBeforePerformingRequestAsBufferedAirPlay:(id)a3 queueStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  if (isTV(v6))
  {
    objc_msgSend(a1, "performRequestAsBufferedAirPlay:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playerPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manifest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "episode"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "podcast"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "provider"));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000CB624;
    v15[3] = &unk_1004A9F48;
    v17 = a1;
    v16 = v6;
    +[MTEpisodeUnavailableUtil promptBeforePerformingIntentAsBufferedAirPlayForRoute:provider:queueStatus:completion:](MTEpisodeUnavailableUtil, "promptBeforePerformingIntentAsBufferedAirPlayForRoute:provider:queueStatus:completion:", v9, v14, a4, v15);

  }
}

+ (void)performRequestAsBufferedAirPlay:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unsigned __int8 v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
  v6 = objc_msgSend(v4, "startPlayback");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v8 = objc_msgSend(v7, "source");

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CB74C;
  v13[3] = &unk_1004A9F70;
  v16 = v6;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  objc_msgSend(v4, "setCompletion:", v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CB7D4;
  v11[3] = &unk_1004A6AD8;
  v12 = v4;
  v10 = v4;
  objc_msgSend(a1, "convertActiveEndpointToBufferedAirPlayWithCompletion:", v11);

}

+ (void)convertActiveEndpointToBufferedAirPlayWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerPath"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));

  objc_msgSend(a1, "pickRouteAndSwitchToLocalCard:completion:", v7, v4);
}

+ (void)pickRouteAndSwitchToLocalCard:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)MPAVRoutingController), "initWithName:", CFSTR("PodcastsRemoteSetPlaybackQueueUtil"));
  if (!v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(+[MPAVRoutingController systemRoute](MPAVRoutingController, "systemRoute"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CB998;
  v9[3] = &unk_1004A8F60;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "selectRoute:operation:completion:", v5, 0, v9);

}

+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 enqueuer:(id)a5 accountLookupFailed:(BOOL)a6 startPlayback:(BOOL)a7 upNextQueueIntent:(unint64_t)a8 completion:(id)a9
{
  objc_msgSend(a1, "decodeAndSetPlaybackQueueForController:fromIdentifiers:sessionIdentifierOverride:enqueuer:accountLookupFailed:startPlayback:upNextQueueIntent:completion:", a3, a4, 0, a5, a6, a7, a8, a9);
}

+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 sessionIdentifierOverride:(id)a5 enqueuer:(id)a6 accountLookupFailed:(BOOL)a7 startPlayback:(BOOL)a8 upNextQueueIntent:(unint64_t)a9 completion:(id)a10
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  BOOL v43;
  uint8_t buf[4];
  id v45;

  v11 = a7;
  v15 = a3;
  v35 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a10;
  v19 = +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod");
  if (v17 && (_DWORD)v19)
  {
    v20 = _MTLogCategoryMediaRemote(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Overriding active account, enqueuer: %@", buf, 0xCu);
    }
    v22 = a8;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    objc_msgSend(v23, "setAccountOverride:", v17);

    goto LABEL_7;
  }
  v22 = a8;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance", v35));
  objc_msgSend(v24, "setAccountOverride:", 0);

  if (v17)
  {
LABEL_7:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance", v35));
    v11 = objc_msgSend(v25, "isPrimaryUserActiveAccount") ^ 1;

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "upNextController"));
  v27 = objc_msgSend(v26, "count");

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "upNextController"));
  v29 = objc_msgSend(v28, "upNextOffset");

  if (a9 || v27 == v29)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000CBD60;
    v36[3] = &unk_1004A9FC0;
    v33 = v35;
    v37 = v35;
    v40 = v18;
    v41 = 7;
    v38 = v16;
    v42 = a9;
    v43 = v22;
    v39 = v15;
    objc_msgSend(v34, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:initiatedByAnotherUser:completion:", v37, v11, v36);

  }
  else
  {
    v31 = _MTLogCategoryMediaRemote(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = v35;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v35;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Asking for queue confirmation for identifiers %@", buf, 0xCu);
    }

    if (v18)
      (*((void (**)(id, uint64_t, uint64_t))v18 + 2))(v18, 8, 7);
  }

}

+ (void)insertEpisodeUuids:(id)a3 intoPlaybackQueueAtPosition:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), (_QWORD)v14));
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(a1, "insertPlayerItems:intoPlaybackQueueAtPosition:", v7, v4);
}

+ (void)insertPlayerItems:(id)a3 intoPlaybackQueueAtPosition:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  int v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v8 = objc_msgSend(v7, "playbackQueueWithAccountInfoForPlayerItems:", v5);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CC218;
  v9[3] = &unk_1004AA020;
  v9[4] = v8;
  v10 = a4;
  objc_msgSend(v6, "resolveActivePlayerPathWithCompletion:", v9);

}

+ (int64_t)requestStatusForMediaRemoteStatus:(unsigned int)a3
{
  int64_t result;

  result = 1;
  switch(a3)
  {
    case 0u:
    case 3u:
      return result;
    case 1u:
      result = 3;
      break;
    case 2u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
      goto LABEL_4;
    case 0xAu:
      result = 4;
      break;
    default:
      if (a3 == 101)
        result = 8;
      else
LABEL_4:
        result = 0;
      break;
  }
  return result;
}

+ (void)_destinationForRequest:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CC4B0;
  v7[3] = &unk_1004AA048;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "resolveActivePlayerPathWithCompletion:", v7);

}

+ (id)_entityForFetchRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(_QWORD *);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10004677C;
  v32 = sub_100046A34;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10004677C;
  v26 = sub_100046A34;
  v27 = 0;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000CC790;
  v17 = &unk_1004A9740;
  v20 = &v22;
  v6 = v5;
  v18 = v6;
  v7 = v3;
  v19 = v7;
  v21 = &v28;
  v8 = objc_msgSend(v6, "performBlockAndWait:", &v14);
  if (v29[5])
  {
    v9 = _MTLogCategoryMediaRemote(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v29[5];
      *(_DWORD *)buf = 138412290;
      v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error fetching episodeGuid while setting play queue: %@", buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "firstObject", v14, v15, v16, v17, v18));
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

@end
