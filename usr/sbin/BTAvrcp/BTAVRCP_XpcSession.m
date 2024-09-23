@implementation BTAVRCP_XpcSession

- (void)dealloc
{
  objc_super v3;

  if (-[BTAVRCP_XpcSession isRewinding](self, "isRewinding"))
    MRMediaRemoteSendCommand(11, 0);
  if (-[BTAVRCP_XpcSession isForwarding](self, "isForwarding"))
    MRMediaRemoteSendCommand(9, 0);
  v3.receiver = self;
  v3.super_class = (Class)BTAVRCP_XpcSession;
  -[BTAVRCP_XpcSession dealloc](&v3, "dealloc");
}

- (id)nowPlayingInfo
{
  void *v3;
  BTAVRCP_NowPlayingInfo *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession lazyNowPlayingInfo](self, "lazyNowPlayingInfo"));

  if (!v3)
  {
    v4 = objc_alloc_init(BTAVRCP_NowPlayingInfo);
    -[BTAVRCP_XpcSession setLazyNowPlayingInfo:](self, "setLazyNowPlayingInfo:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession lazyNowPlayingInfo](self, "lazyNowPlayingInfo"));
    objc_msgSend(v5, "setDelegate:", self);

  }
  return -[BTAVRCP_XpcSession lazyNowPlayingInfo](self, "lazyNowPlayingInfo");
}

- (id)library
{
  void *v3;
  BTAVRCP_Library *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession lazyLibrary](self, "lazyLibrary"));

  if (!v3)
  {
    v4 = objc_alloc_init(BTAVRCP_Library);
    -[BTAVRCP_XpcSession setLazyLibrary:](self, "setLazyLibrary:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession lazyLibrary](self, "lazyLibrary"));
    objc_msgSend(v5, "setDelegate:", self);

  }
  return -[BTAVRCP_XpcSession lazyLibrary](self, "lazyLibrary");
}

- (void)handleSendCommandMsg:(id)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  id v7;
  int64_t int64;
  const char *string;
  void *v10;
  void *v11;
  BTAVRCP_XpcSession *v12;
  uint64_t v13;
  BTAVRCP_XpcSession *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = a3;
  int64 = xpc_dictionary_get_int64(v7, "kCommand");
  string = xpc_dictionary_get_string(v7, "kSource");

  v18[0] = kMRMediaRemoteOptionSourceID;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  v18[1] = kMRMediaRemoteOptionRemoteControlInterfaceIdentifier;
  v19[0] = v10;
  v19[1] = CFSTR("com.apple.AVRCP");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));

  switch((int)int64)
  {
    case 8:
      v12 = self;
      v13 = 1;
      goto LABEL_4;
    case 9:
      v12 = self;
      v13 = 0;
LABEL_4:
      -[BTAVRCP_XpcSession setIsForwarding:](v12, "setIsForwarding:", v13);
      break;
    case 10:
      v14 = self;
      v15 = 1;
      goto LABEL_7;
    case 11:
      v14 = self;
      v15 = 0;
LABEL_7:
      -[BTAVRCP_XpcSession setIsRewinding:](v14, "setIsRewinding:", v15);
      break;
    default:
      break;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v17 = objc_msgSend(v16, "isLocalOrigin");

  if (v17)
    MRMediaRemoteSendCommand(int64, v11);
  v6[2](v6, 4, 0);

}

- (void)handleSetSettingsMsg:(id)a3 replyBlock:(id)a4
{
  id v5;
  int64_t int64;
  int64_t v7;
  void (**v8)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  v5 = a3;
  int64 = xpc_dictionary_get_int64(v5, "kRepeatMode");
  v7 = xpc_dictionary_get_int64(v5, "kShuffleMode");

  if ((_DWORD)int64 != -1)
    MRMediaRemoteSetRepeatMode(int64);
  if ((_DWORD)v7 != -1)
    MRMediaRemoteSetShuffleMode(v7);
  v8[2](v8, 4, 0);

}

- (void)handleGetSettingsMsg:(id)a3 replyBlock:(id)a4
{
  void (**v5)(id, uint64_t, void *);
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v5 = (void (**)(id, uint64_t, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v7 = (unint64_t)objc_msgSend(v6, "settings");

  v11[0] = CFSTR("kRepeatMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  v11[1] = CFSTR("kShuffleMode");
  v12[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v7)));
  v12[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v5[2](v5, 4, v10);

}

- (void)handleGetPlayStatusMsg:(id)a3 replyBlock:(id)a4
{
  void (**v5)(id, uint64_t, id);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void (**)(id, uint64_t, id))a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trackDuration"));
  objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("kTrackDuration"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trackPosition"));
  objc_msgSend(v12, "setValue:forKey:", v9, CFSTR("kTrackPosition"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "playbackState")));
  objc_msgSend(v12, "setValue:forKey:", v11, CFSTR("kPlaybackState"));

  v5[2](v5, 4, v12);
}

- (void)handleGetElementAttributesMsg:(id)a3 replyBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(id, uint64_t, void *);

  v22 = (void (**)(id, uint64_t, void *))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trackTitle"));

  if (v7)
    objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("kTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trackAlbum"));

  if (v9)
    objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("kAlbum"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trackArtist"));

  if (v11)
    objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("kArtist"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trackGenre"));

  if (v13)
    objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("kGenre"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trackQueueIndex"));

  if (v15)
    objc_msgSend(v5, "setValue:forKey:", v15, CFSTR("kQueueIndex"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trackQueueCount"));

  if (v17)
    objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("kQueueCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trackDuration"));

  if (v19)
    objc_msgSend(v5, "setValue:forKey:", v19, CFSTR("kDuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trackImageHandle"));

  if (v21)
    objc_msgSend(v5, "setValue:forKey:", v21, CFSTR("kImageHandle"));
  v22[2](v22, 4, v5);

}

- (void)handleRegisterForChangesMsg:(id)a3 replyBlock:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v5 = -[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo");
  v6[2](v6, 4, 0);

}

- (void)handleRegisterForPlayerChangesMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v10 = CFSTR("kPlayerId");
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "playerId")));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4, v9);

}

- (void)handleRegisterForPlaybackStateChangesMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v10 = CFSTR("kPlaybackState");
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "playbackState")));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4, v9);

}

- (void)handleRegisterForTrackChangesMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v10 = CFSTR("kUid");
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "trackId")));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4, v9);

}

- (void)handleRegisterForSettingsChangesMsg:(id)a3 replyBlock:(id)a4
{
  void (**v5)(id, uint64_t, void *);
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v5 = (void (**)(id, uint64_t, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v7 = (unint64_t)objc_msgSend(v6, "settings");

  v11[0] = CFSTR("kRepeatMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  v11[1] = CFSTR("kShuffleMode");
  v12[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v7)));
  v12[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v5[2](v5, 4, v10);

}

- (void)handleSetAddressedPlayerMsg:(id)a3 replyBlock:(id)a4
{
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a4;
  xpc_dictionary_get_int64(a3, "kPlayerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  objc_msgSend(v6, "playerId");

  v7[2]();
}

- (void)handleSetBrowsedPlayerMsg:(id)a3 replyBlock:(id)a4
{
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void (*v11)(void);
  _QWORD *v12;

  v12 = a4;
  LODWORD(a3) = xpc_dictionary_get_int64(a3, "kPlayerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v7 = objc_msgSend(v6, "playerId");

  if (v7 != (_DWORD)a3)
  {
    v11 = (void (*)(void))v12[2];
LABEL_6:
    v11();
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v9 = objc_msgSend(v8, "isBrowsablePlayer");

  if (!v9)
  {
    v11 = (void (*)(void))v12[2];
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
  objc_msgSend(v10, "getCurrentPath:", v12);

LABEL_7:
}

- (void)handleChangePathMsg:(id)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  __int16 int64;
  int64_t v8;
  void *v9;
  xpc_object_t xdict;

  xdict = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  int64 = xpc_dictionary_get_int64(xdict, "kUidCounter");
  if (xpc_dictionary_get_BOOL(xdict, "kDotDot"))
    v8 = 0;
  else
    v8 = xpc_dictionary_get_int64(xdict, "kUid");
  if (int64)
  {
    v6[2](v6, 5, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
    objc_msgSend(v9, "changePath:replyBlock:", v8, v6);

  }
}

- (void)handleGetFolderItemsMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  char int64;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void (*v11)(void);
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  unsigned int v15;
  _QWORD *v16;

  v16 = a4;
  v6 = a3;
  int64 = xpc_dictionary_get_int64(v6, "kScope");
  v8 = xpc_dictionary_get_int64(v6, "kStartItem");
  LODWORD(v9) = xpc_dictionary_get_int64(v6, "kEndItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession attributeIDsFromArgs:](self, "attributeIDsFromArgs:", v6));

  if (v8 <= v9)
  {
    if (v8 + 20 <= v9)
      v9 = v8 + 19;
    else
      v9 = v9;
    if (objc_msgSend(v10, "containsObject:", &off_100019AF0))
      v12 = &off_100019BE8;
    else
      v12 = 0;
    switch(int64)
    {
      case 0:
        -[BTAVRCP_XpcSession getMediaPlayersFromStart:toEnd:replyBlock:](self, "getMediaPlayersFromStart:toEnd:replyBlock:", v8, v9, v16);
        break;
      case 1:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        objc_msgSend(v13, "getVFSItemsFromStart:toEnd:attributeIDs:replyBlock:", v8, v9, v12, v16);
        goto LABEL_17;
      case 2:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        objc_msgSend(v13, "getSearchItemsFromStart:toEnd:attributeIDs:replyBlock:", v8, v9, v12, v16);
        goto LABEL_17;
      case 3:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
        v15 = objc_msgSend(v14, "isMusicApp");

        if (!v15)
          goto LABEL_2;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        objc_msgSend(v13, "getNowPlayingItemsFromStart:toEnd:attributeIDs:replyBlock:", v8, v9, v12, v16);
LABEL_17:

        break;
      default:
        v11 = (void (*)(void))v16[2];
        goto LABEL_3;
    }
  }
  else
  {
LABEL_2:
    v11 = (void (*)(void))v16[2];
LABEL_3:
    v11();
  }

}

- (void)handleGetItemAttributesMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  void *v7;
  char int64;
  int64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  void (**v19)(id, uint64_t, void *);

  v19 = (void (**)(id, uint64_t, void *))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  int64 = xpc_dictionary_get_int64(v6, "kScope");
  v9 = xpc_dictionary_get_int64(v6, "kUid");
  v10 = xpc_dictionary_get_int64(v6, "kUidCounter");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession attributeIDsFromArgs:](self, "attributeIDsFromArgs:", v6));

  if (!v10)
  {
    switch(int64)
    {
      case 3:
        if (v9 == -1)
        {
          v12 = 9;
          goto LABEL_15;
        }
        if (!v9
          || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo")),
              v16 = objc_msgSend(v15, "trackId"),
              v15,
              (id)v9 == v16))
        {
          v12 = -[BTAVRCP_XpcSession getNowPlayingAttributeIDs:reply:](self, "getNowPlayingAttributeIDs:reply:", v11, v7);
          goto LABEL_15;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
        v18 = objc_msgSend(v17, "isMusicApp");

        if (!v18)
        {
          v12 = 11;
          goto LABEL_15;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        v14 = objc_msgSend(v13, "getNowPlayingItemWithUid:attributeIDs:reply:", v9, v11, v7);
        break;
      case 2:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        v14 = objc_msgSend(v13, "getSearchItemWithUid:attributeIDs:reply:", v9, v11, v7);
        break;
      case 1:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        v14 = objc_msgSend(v13, "getVFSItemWithUid:attributeIDs:reply:", v9, v11, v7);
        break;
      default:
        v12 = 10;
        goto LABEL_15;
    }
    v12 = (uint64_t)v14;

    goto LABEL_15;
  }
  v12 = 5;
LABEL_15:
  v19[2](v19, v12, v7);

}

- (void)handleSearchMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  const char *string;
  void *v8;
  id v9;

  v6 = a4;
  string = xpc_dictionary_get_string(a3, "kSearchString");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v9, "search:replyBlock:", v8, v6);

}

- (void)handleGetTotalNumberOfItemsMsg:(id)a3 replyBlock:(id)a4
{
  void (**v6)(id, uint64_t, void *);
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v6 = (void (**)(id, uint64_t, void *))a4;
  switch(xpc_dictionary_get_int64(a3, "kScope"))
  {
    case 0u:
      v7 = 1;
      break;
    case 1u:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
      v9 = objc_msgSend(v8, "getVFSItemsCount");
      goto LABEL_7;
    case 2u:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
      v9 = objc_msgSend(v8, "getSearchItemsCount");
      goto LABEL_7;
    case 3u:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
      v11 = objc_msgSend(v10, "isMusicApp");

      if (!v11)
        goto LABEL_8;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
      v9 = objc_msgSend(v8, "getNowPlayingItemsCount");
LABEL_7:
      v7 = (uint64_t)v9;

      break;
    default:
LABEL_8:
      v7 = 0;
      break;
  }
  v14 = CFSTR("kNumItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v15 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v6[2](v6, 4, v13);

}

- (void)handlePlayItemMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  char int64;
  int64_t v8;
  __int16 v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  void (**v15)(id, uint64_t, _QWORD);

  v15 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  int64 = xpc_dictionary_get_int64(v6, "kScope");
  v8 = xpc_dictionary_get_int64(v6, "kUid");
  v9 = xpc_dictionary_get_int64(v6, "kUidCounter");

  if (v9)
  {
    v10 = 5;
  }
  else
  {
    switch(int64)
    {
      case 3:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
        v14 = objc_msgSend(v13, "isMusicApp");

        if (!v14)
        {
          v10 = 9;
          goto LABEL_13;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        v12 = objc_msgSend(v11, "playNowPlayingItemWithUid:", v8);
        break;
      case 2:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        v12 = objc_msgSend(v11, "playSearchItemWithUid:", v8);
        break;
      case 1:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        v12 = objc_msgSend(v11, "playVFSItemWithUid:", v8);
        break;
      default:
        v10 = 10;
        goto LABEL_13;
    }
    v10 = (uint64_t)v12;

  }
LABEL_13:
  v15[2](v15, v10, 0);

}

- (void)handleGetImagePropertiesMsg:(id)a3 replyBlock:(id)a4
{
  void (**v5)(id, _QWORD, id);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void (**)(id, _QWORD, id))a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodings"));
  objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("kEncodings"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widths"));
  objc_msgSend(v12, "setValue:forKey:", v9, CFSTR("kWidths"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heights"));
  objc_msgSend(v12, "setValue:forKey:", v11, CFSTR("kHeights"));

  v5[2](v5, 0, v12);
}

- (void)handleGetImageMsg:(id)a3 replyBlock:(id)a4
{
  id v6;
  id v7;
  int64_t int64;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v20;
  double v21;
  const void *v22;
  uint64_t LocalOrigin;
  const void *v24;
  __n128 v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a4;
  v7 = a3;
  int64 = xpc_dictionary_get_int64(v7, "kWidth");
  v9 = xpc_dictionary_get_int64(v7, "kHeight");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widths"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", int64));
  v13 = objc_msgSend(v11, "indexOfObject:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heights"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
  v17 = objc_msgSend(v15, "indexOfObject:", v16);

  v20 = v13 == (id)0x7FFFFFFFFFFFFFFFLL || v13 != v17 || v17 == (id)0x7FFFFFFFFFFFFFFFLL;
  v21 = (double)(unint64_t)int64;
  v22 = (const void *)MRPlaybackQueueRequestCreate(0, 1);
  LocalOrigin = MRMediaRemoteGetLocalOrigin();
  v24 = (const void *)MRNowPlayingPlayerPathCreate(LocalOrigin, 0, 0);
  if (v20)
    v25.n128_f64[0] = 200.0;
  else
    v25.n128_f64[0] = v21;
  MRPlaybackQueueRequestSetIncludeArtwork(v22, v25);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000079BC;
  v27[3] = &unk_100018A28;
  v26 = v6;
  v28 = v26;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v22, v24, &_dispatch_main_q, v27);
  if (v22)
    CFRelease(v22);
  if (v24)
    CFRelease(v24);

}

- (void)handleMsg:(id)a3
{
  id v4;
  const char *string;
  xpc_object_t value;
  void *v7;
  id v8;
  _QWORD *v9;
  NSString *v10;
  const char *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  value = xpc_dictionary_get_value(v4, "kMsgArgs");
  v7 = (void *)objc_claimAutoreleasedReturnValue(value);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007B74;
  v12[3] = &unk_100018A50;
  v12[4] = self;
  v13 = v4;
  v8 = v4;
  v9 = objc_retainBlock(v12);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("handle%sMsg:replyBlock:"), string));
  v11 = NSSelectorFromString(v10);

  objc_msgSend(self, v11, v7, v9);
}

- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5
{
  unsigned int v5;
  id v8;
  void *v9;
  void *v10;
  xpc_object_t xdict;

  v5 = a4;
  v8 = a5;
  xdict = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_int64(xdict, "kMsgStatus", v5);
  if (v8)
    v9 = v8;
  else
    v9 = &__NSArray0__struct;
  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);

  xpc_dictionary_set_value(xdict, "kMsgArgs", v10);
  -[BTXpcSession sendReply:](self, "sendReply:", xdict);

}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "kMsgId", v9);
  if (v11)
  {
    v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v11);
    xpc_dictionary_set_value(v7, "kMsgArgs", v10);

  }
  -[BTXpcSession sendMsg:](self, "sendMsg:", v7);

}

- (void)playerDidChange:(int)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("kPlayerId");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("PlayerDidChange"), v5);

}

- (void)playbackStateDidChange:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("kPlaybackState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("PlaybackStateDidChange"), v5);

}

- (void)trackDidChange:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("kUid");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("TrackDidChange"), v5);

}

- (void)settingsDidChange:(id)a3
{
  uint64_t var1;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];

  var1 = a3.var1;
  v8[0] = CFSTR("kRepeatMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  v8[1] = CFSTR("kShuffleMode");
  v9[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", var1));
  v9[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("SettingsDidChange"), v7);

}

- (void)playbackQueueDidChange
{
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("PlaybackQueueDidChange"), 0);
}

- (void)libraryDidChange
{
  id v3;

  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", CFSTR("LibraryDidChange"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  -[BTAVRCP_XpcSession trackDidChange:](self, "trackDidChange:", objc_msgSend(v3, "trackId"));

}

- (id)attributeIDsFromArgs:(id)a3
{
  xpc_object_t value;
  uint64_t v4;
  void *v5;
  void *v6;

  value = xpc_dictionary_get_value(a3, "kAttributeIDs");
  v4 = objc_claimAutoreleasedReturnValue(value);
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
  else
    v6 = 0;

  return v6;
}

- (void)getMediaPlayersFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 replyBlock:(id)a5
{
  void (*v5)(void);
  id v6;
  void (**v8)(id, uint64_t, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[4];

  if (a3)
  {
    v5 = (void (*)(void))*((_QWORD *)a5 + 2);
    v6 = a5;
    v5();
  }
  else
  {
    v22[0] = CFSTR("kPlayerId");
    v8 = (void (**)(id, uint64_t, void *))a5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "playerId")));
    v23[0] = v10;
    v22[1] = CFSTR("kPlaybackState");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "playbackState")));
    v23[1] = v12;
    v22[2] = CFSTR("kIsBrowsable");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "isBrowsablePlayer")));
    v23[2] = v14;
    v22[3] = CFSTR("kName");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playerName"));
    v23[3] = v16;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));

    v19 = v6;
    v20 = CFSTR("kItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v21 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v8[2](v8, 4, v18);

  }
}

- (unsigned)getNowPlayingAttributeIDs:(id)a3 reply:(id)a4
{
  id v5;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008354;
  v7[3] = &unk_100018A78;
  v7[4] = self;
  v8 = a4;
  v5 = v8;
  objc_msgSend(a3, "enumerateAttributeIDs:", v7);

  return 4;
}

- (BTAVRCP_NowPlayingInfo)lazyNowPlayingInfo
{
  return self->_lazyNowPlayingInfo;
}

- (void)setLazyNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lazyNowPlayingInfo, a3);
}

- (BTAVRCP_Library)lazyLibrary
{
  return self->_lazyLibrary;
}

- (void)setLazyLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_lazyLibrary, a3);
}

- (BOOL)isForwarding
{
  return self->_isForwarding;
}

- (void)setIsForwarding:(BOOL)a3
{
  self->_isForwarding = a3;
}

- (BOOL)isRewinding
{
  return self->_isRewinding;
}

- (void)setIsRewinding:(BOOL)a3
{
  self->_isRewinding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyLibrary, 0);
  objc_storeStrong((id *)&self->_lazyNowPlayingInfo, 0);
}

@end
