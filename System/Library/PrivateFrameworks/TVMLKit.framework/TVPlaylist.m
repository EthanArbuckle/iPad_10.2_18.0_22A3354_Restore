@implementation TVPlaylist

- (void)addObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *mediaItems;
  id v11;

  v4 = a3;
  -[TVPlaylist mediaItems](self, "mediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  objc_msgSend(v11, "addObject:", v4);
  -[TVPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaItems"));
  v9 = (NSArray *)objc_msgSend(v11, "copy");
  mediaItems = self->_mediaItems;
  self->_mediaItems = v9;

  -[TVPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaItems"));
}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *mediaItems;
  id v8;

  v4 = a3;
  -[TVPlaylist mediaItems](self, "mediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v8, "removeObjectsAtIndexes:", v4);
  -[TVPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaItems"));
  v6 = (NSArray *)objc_msgSend(v8, "copy");
  mediaItems = self->_mediaItems;
  self->_mediaItems = v6;

  -[TVPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaItems"));
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *v12;
  NSArray *mediaItems;
  id v14;

  v14 = a3;
  v6 = a4;
  -[TVPlaylist mediaItems](self, "mediaItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "insertObjects:atIndexes:", v14, v6);
  -[TVPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaItems"));
  v12 = (NSArray *)objc_msgSend(v11, "copy");
  mediaItems = self->_mediaItems;
  self->_mediaItems = v12;

  -[TVPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaItems"));
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (int64_t)endAction
{
  return self->_endAction;
}

- (void)setEndAction:(int64_t)a3
{
  self->_endAction = a3;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (void)setRepeatMode:(int64_t)a3
{
  self->_repeatMode = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
}

@end
