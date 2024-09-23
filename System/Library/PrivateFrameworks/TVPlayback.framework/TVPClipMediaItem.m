@implementation TVPClipMediaItem

- (TVPClipMediaItem)initWithMediaItem:(id)a3 clipTimeRange:(id)a4
{
  id v7;
  id v8;
  TVPClipMediaItem *v9;
  TVPClipMediaItem *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *localMetadata;
  uint64_t v13;
  NSSet *localMetadataKeys;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TVPClipMediaItem;
  v9 = -[TVPClipMediaItem init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItem, a3);
    objc_storeStrong((id *)&v10->_clipTimeRange, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    localMetadata = v10->_localMetadata;
    v10->_localMetadata = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("TVPMediaItemMetadataStartTime"), CFSTR("TVPMediaItemMetadataForwardPlaybackEndTime"), CFSTR("TVPMediaItemMetadataReversePlaybackEndTime"), CFSTR("TVPMediaItemMetadataTitle"), CFSTR("TVPMediaItemMetadataLongDescription"), CFSTR("TVPMediaItemMetadataArtworkURLString"), CFSTR("TVPMediaItemMetadataTomatoFreshness"), CFSTR("TVPMediaItemMetadataTomatoPercentage"), CFSTR("TVPMediaItemMetadataMPNowPlayingContentItem"), CFSTR("TVPMediaItemMetadataDuration"), 0);
    localMetadataKeys = v10->_localMetadataKeys;
    v10->_localMetadataKeys = (NSSet *)v13;

    v15 = v10->_localMetadata;
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "startTime");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v17, CFSTR("TVPMediaItemMetadataStartTime"));

    v18 = v10->_localMetadata;
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "endTime");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v20, CFSTR("TVPMediaItemMetadataForwardPlaybackEndTime"));

    v21 = v10->_localMetadata;
    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "startTime");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v23, CFSTR("TVPMediaItemMetadataReversePlaybackEndTime"));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v10, sel__mediaItemMetadataWillOrDidChange_, CFSTR("TVPMediaItemMetadataWillChangeNotification"), v10->_mediaItem);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v10, sel__mediaItemMetadataWillOrDidChange_, CFSTR("TVPMediaItemMetadataDidChangeNotification"), v10->_mediaItem);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVPClipMediaItem;
  -[TVPClipMediaItem dealloc](&v4, sel_dealloc);
}

- (BOOL)hasTrait:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TVPMediaItemTraitIsScene")) & 1) != 0)
    v5 = 1;
  else
    v5 = -[TVPMediaItem hasTrait:](self->_mediaItem, "hasTrait:", v4);

  return v5;
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *localMetadata;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7 && -[NSSet containsObject:](self->_localMetadataKeys, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    v19 = CFSTR("TVPMediaItemMetadataChangesKey");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("TVPMediaItemMetadataWillChangeNotification"), self, v10);

    localMetadata = self->_localMetadata;
    if (v6)
      -[NSMutableDictionary setObject:forKey:](localMetadata, "setObject:forKey:", v6, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](localMetadata, "removeObjectForKey:", v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    v16 = CFSTR("TVPMediaItemMetadataChangesKey");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("TVPMediaItemMetadataDidChangeNotification"), self, v14);

  }
  else
  {
    -[TVPMediaItem setMediaItemMetadata:forProperty:](self->_mediaItem, "setMediaItemMetadata:forProperty:", v6, v7);
  }

}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (v4 && -[NSSet containsObject:](self->_localMetadataKeys, "containsObject:", v4))
  {
    -[NSMutableDictionary objectForKey:](self->_localMetadata, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TVPMediaItem mediaItemMetadataForProperty:](self->_mediaItem, "mediaItemMetadataForProperty:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)_mediaItemMetadataWillOrDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", v6, self, v7);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return self->_mediaItem;
  v6.receiver = self;
  v6.super_class = (Class)TVPClipMediaItem;
  -[TVPClipMediaItem forwardingTargetForSelector:](&v6, sel_forwardingTargetForSelector_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_mediaItem);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TVPClipMediaItem;
    -[TVPClipMediaItem forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TVPClipMediaItem;
  return -[TVPClipMediaItem respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((-[TVPMediaItem conformsToProtocol:](self->_mediaItem, "conformsToProtocol:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TVPClipMediaItem;
    v5 = -[TVPClipMediaItem conformsToProtocol:](&v7, sel_conformsToProtocol_, v4);
  }

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  -[TVPMediaItem methodSignatureForSelector:](self->_mediaItem, "methodSignatureForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)TVPClipMediaItem;
    -[TVPClipMediaItem methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v6;

  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TVPClipMediaItem;
  return -[TVPClipMediaItem isKindOfClass:](&v6, sel_isKindOfClass_, a3);
}

- (TVPTimeRange)clipTimeRange
{
  return self->_clipTimeRange;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (NSSet)localMetadataKeys
{
  return self->_localMetadataKeys;
}

- (void)setLocalMetadataKeys:(id)a3
{
  objc_storeStrong((id *)&self->_localMetadataKeys, a3);
}

- (NSMutableDictionary)localMetadata
{
  return self->_localMetadata;
}

- (void)setLocalMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_localMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMetadata, 0);
  objc_storeStrong((id *)&self->_localMetadataKeys, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_clipTimeRange, 0);
}

@end
