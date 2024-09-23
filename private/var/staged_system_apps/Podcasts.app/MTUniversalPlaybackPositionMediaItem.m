@implementation MTUniversalPlaybackPositionMediaItem

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *, char *);
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, char *))a4;
  -[MTUniversalPlaybackPositionMediaItem populateEpisodeDictionary](self, "populateEpisodeDictionary");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem mediaItemDictionary](self, "mediaItemDictionary"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));

        v16 = 0;
        v7[2](v7, v13, v15, &v16);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void)populateEpisodeDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem mediaItemDictionary](self, "mediaItemDictionary"));

  if (!v3)
  {
    v4 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem episode](self, "episode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B431C;
    v7[3] = &unk_1004A6200;
    v7[4] = self;
    objc_msgSend(v6, "performBlockAndWait:", v7);

    objc_autoreleasePoolPop(v4);
  }
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem mediaItemDictionary](self, "mediaItemDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v5, v6));

  return (NSString *)v7;
}

- (NSDictionary)mediaItemDictionary
{
  return self->_mediaItemDictionary;
}

- (void)setMediaItemDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemDictionary, a3);
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (void)setEpisode:(id)a3
{
  objc_storeStrong((id *)&self->_episode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episode, 0);
  objc_storeStrong((id *)&self->_mediaItemDictionary, 0);
}

@end
