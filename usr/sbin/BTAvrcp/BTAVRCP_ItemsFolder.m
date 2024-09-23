@implementation BTAVRCP_ItemsFolder

- (id)targetApp
{
  -[BTAVRCP_ItemsFolder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)childrenCount
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "items"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemWithUid:", a3));

  if (v6)
    return 8;
  else
    return 9;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemAtIndex:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyItemWithAttributeIDs:", v6));
  return v9;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemWithUid:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyAttributesForIDs:", v6));
  return v9;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemWithUid:", a3));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_ItemsFolder targetApp](self, "targetApp"));
    if (objc_msgSend(v7, "isEqualToString:", off_10001F048))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMusicPlayerController systemMusicPlayer](MPMusicPlayerController, "systemMusicPlayer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
      objc_msgSend(v8, "setQueueWithQuery:firstItem:", v9, v6);

      objc_msgSend(v8, "play");
    }
    else
    {
      v11 = MRSystemAppPlaybackQueueCreate(kCFAllocatorDefault, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
      MRSystemAppPlaybackQueueSetLocalQueryData(v11, +[NSKeyedArchiver archivedDataWithRootObject:](NSKeyedArchiver, "archivedDataWithRootObject:", v12));

      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID(v11, objc_msgSend(v6, "persistentID"));
      MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback(v11, 1);
      MRMediaRemoteSetAppPlaybackQueue(v7, v11, 0, 0, 0);
      MRSystemAppPlaybackQueueDestroy(v11);
    }

    v10 = 4;
  }
  else
  {
    v10 = 9;
  }

  return v10;
}

@end
