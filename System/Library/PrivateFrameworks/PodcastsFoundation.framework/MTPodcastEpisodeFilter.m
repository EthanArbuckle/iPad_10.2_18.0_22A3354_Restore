@implementation MTPodcastEpisodeFilter

- (MTPodcastEpisodeFilter)init
{
  MTPodcastEpisodeFilter *v2;
  MTPodcastEpisodeFilter *v3;
  NSString *excludingEpisodeUuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPodcastEpisodeFilter;
  v2 = -[MTPodcastEpisodeFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_excludeUnentitled = 0;
    v2->_restrictToUserEpisodes = 0;
    v2->_playStateFilter = 0;
    v2->_excludeExplicit = 0;
    excludingEpisodeUuid = v2->_excludingEpisodeUuid;
    v2->_episodeTypeFilter = 0;
    v2->_excludingEpisodeUuid = 0;

    v3->_excludeGhostEpisodes = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPlayStateFilter:", self->_playStateFilter);
  objc_msgSend(v4, "setExcludeExplicit:", self->_excludeExplicit);
  objc_msgSend(v4, "setEpisodeTypeFilter:", self->_episodeTypeFilter);
  objc_msgSend(v4, "setExcludeUnentitled:", self->_excludeUnentitled);
  objc_msgSend(v4, "setRestrictToUserEpisodes:", self->_restrictToUserEpisodes);
  v5 = (void *)-[NSString copy](self->_excludingEpisodeUuid, "copy");
  objc_msgSend(v4, "setExcludingEpisodeUuid:", v5);

  objc_msgSend(v4, "setExcludeGhostEpisodes:", self->_excludeGhostEpisodes);
  return v4;
}

+ (int64_t)playStateFilterFromExcludePlayed:(BOOL)a3
{
  return a3;
}

- (id)filterExcludingPlayed
{
  void *v2;

  v2 = (void *)-[MTPodcastEpisodeFilter copy](self, "copy");
  objc_msgSend(v2, "setPlayStateFilter:", +[MTPodcastEpisodeFilter playStateFilterFromExcludePlayed:](MTPodcastEpisodeFilter, "playStateFilterFromExcludePlayed:", 1));
  return v2;
}

- (id)predicateForPodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  if (-[MTPodcastEpisodeFilter restrictToUserEpisodes](self, "restrictToUserEpisodes"))
  {
    +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v5, 0, objc_msgSend(v4, "deletePlayedEpisodesResolvedValue"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  v9 = -[MTPodcastEpisodeFilter playStateFilter](self, "playStateFilter");
  if (v9 == 2 || -[MTPodcastEpisodeFilter playStateFilter](self, "playStateFilter") == 1)
  {
    +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", v9 == 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  -[MTPodcastEpisodeFilter excludingEpisodeUuid](self, "excludingEpisodeUuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[MTPodcastEpisodeFilter excludingEpisodeUuid](self, "excludingEpisodeUuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v15);

  }
  if (-[MTPodcastEpisodeFilter episodeTypeFilter](self, "episodeTypeFilter"))
  {
    +[MTEpisode predicateForEpisodeTypeFilter:](MTEpisode, "predicateForEpisodeTypeFilter:", -[MTPodcastEpisodeFilter episodeTypeFilter](self, "episodeTypeFilter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v16);

  }
  if (+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp")
    && (-[MTPodcastEpisodeFilter excludeExplicit](self, "excludeExplicit") == 1
     || !-[MTPodcastEpisodeFilter excludeExplicit](self, "excludeExplicit")
     && !+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed")))
  {
    if ((objc_msgSend(v4, "isExplicit") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "falsePredicate");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    +[MTEpisode predicateForExplicit:](MTEpisode, "predicateForExplicit:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

  }
  if (-[MTPodcastEpisodeFilter excludeUnentitled](self, "excludeUnentitled"))
  {
    +[MTEpisode predicateForEntitledEpisodes](MTEpisode, "predicateForEntitledEpisodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v19);

  }
  if (-[MTPodcastEpisodeFilter excludeGhostEpisodes](self, "excludeGhostEpisodes"))
  {
    +[MTEpisode predicateForHasNonEmptyEnclosureURL](MTEpisode, "predicateForHasNonEmptyEnclosureURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v20);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_23:
  v21 = (void *)v17;

  return v21;
}

- (int64_t)playStateFilter
{
  return self->_playStateFilter;
}

- (void)setPlayStateFilter:(int64_t)a3
{
  self->_playStateFilter = a3;
}

- (int64_t)excludeExplicit
{
  return self->_excludeExplicit;
}

- (void)setExcludeExplicit:(int64_t)a3
{
  self->_excludeExplicit = a3;
}

- (int64_t)episodeTypeFilter
{
  return self->_episodeTypeFilter;
}

- (void)setEpisodeTypeFilter:(int64_t)a3
{
  self->_episodeTypeFilter = a3;
}

- (BOOL)excludeUnentitled
{
  return self->_excludeUnentitled;
}

- (void)setExcludeUnentitled:(BOOL)a3
{
  self->_excludeUnentitled = a3;
}

- (BOOL)excludeGhostEpisodes
{
  return self->_excludeGhostEpisodes;
}

- (void)setExcludeGhostEpisodes:(BOOL)a3
{
  self->_excludeGhostEpisodes = a3;
}

- (BOOL)restrictToUserEpisodes
{
  return self->_restrictToUserEpisodes;
}

- (void)setRestrictToUserEpisodes:(BOOL)a3
{
  self->_restrictToUserEpisodes = a3;
}

- (NSString)excludingEpisodeUuid
{
  return self->_excludingEpisodeUuid;
}

- (void)setExcludingEpisodeUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludingEpisodeUuid, 0);
}

@end
