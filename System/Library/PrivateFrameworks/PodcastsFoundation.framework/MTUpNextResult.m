@implementation MTUpNextResult

- (void)updateFor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUpNextResult setEpisodeUuid:](self, "setEpisodeUuid:", v5);

  LODWORD(v5) = objc_msgSend(v4, "listenNowEpisode");
  -[MTUpNextResult setNeedsUpdate:](self, "setNeedsUpdate:", v5 ^ 1);
}

- (void)setModifiedDate:(double)a3
{
  double v5;
  id v6;

  +[FutureDateChecker lenientSharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "lenientSharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestampBoundByNow:", a3);
  self->_modifiedDate = v5;

}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (void)setEpisodeUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)modifiedDate
{
  return self->_modifiedDate;
}

- (double)modifiedDateScore
{
  return self->_modifiedDateScore;
}

- (void)setModifiedDateScore:(double)a3
{
  self->_modifiedDateScore = a3;
}

- (MTUpNextScorePrototype)upNextScore
{
  return self->_upNextScore;
}

- (void)setUpNextScore:(id)a3
{
  objc_storeStrong((id *)&self->_upNextScore, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upNextScore, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
}

@end
