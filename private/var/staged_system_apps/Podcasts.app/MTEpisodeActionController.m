@implementation MTEpisodeActionController

- (id)allActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeActionFactory viewAction](MTEpisodeActionFactory, "viewAction"));
  v10[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeActionFactory playNextAction](MTEpisodeActionFactory, "playNextAction"));
  v10[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeActionFactory addToUpNextAction](MTEpisodeActionFactory, "addToUpNextAction"));
  v10[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeActionFactory markUnplayedAction](MTEpisodeActionFactory, "markUnplayedAction"));
  v10[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeActionFactory markPlayedAction](MTEpisodeActionFactory, "markPlayedAction"));
  v10[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeActionFactory shareAction](MTEpisodeActionFactory, "shareAction"));
  v10[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 6));

  return v8;
}

- (void)reloadActions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController actionObject](self, "actionObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeActionController dependentKeys](self, "dependentKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryWithValuesForKeys:", v4));

  if (!-[NSDictionary isEqualToDictionary:](self->_episodeDict, "isEqualToDictionary:", v5)
    && objc_msgSend(v5, "count"))
  {
    objc_storeStrong((id *)&self->_episodeDict, v5);
    v6.receiver = self;
    v6.super_class = (Class)MTEpisodeActionController;
    -[IMActionController reloadActions](&v6, "reloadActions");
  }

}

- (id)dependentKeys
{
  _QWORD v3[9];

  v3[0] = kEpisodeUuid;
  v3[1] = kEpisodeAssetURL;
  v3[2] = kEpisodePersistentID;
  v3[3] = kEpisodePlayState;
  v3[4] = kEpisodePlayStateManuallySet;
  v3[5] = kEpisodeIsFromiTunesSync;
  v3[6] = kEpisodeExternalType;
  v3[7] = kEpisodeAudio;
  v3[8] = kEpisodeVideo;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 9));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeDict, 0);
}

@end
