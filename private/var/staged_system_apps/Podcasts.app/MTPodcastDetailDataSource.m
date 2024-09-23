@implementation MTPodcastDetailDataSource

+ (id)predicateForPodcast:(id)a3 sectionType:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = 0;
  v7 = objc_msgSend(v5, "deletePlayedEpisodesResolvedValue");
  switch(a4)
  {
    case 1uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:](MTEpisode, "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:", v8, v7));
      goto LABEL_12;
    case 3uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:](MTEpisode, "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:", v10, v7));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:](MTEpisode, "predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:", v11, v8, v7));

      goto LABEL_13;
    case 4uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:](MTEpisode, "predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:", v8, v7));
      goto LABEL_12;
    case 6uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesInFeedForPodcastUuid:](MTEpisode, "predicateForEpisodesInFeedForPodcastUuid:", v8));
      goto LABEL_12;
    case 7uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:](MTEpisode, "predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:", v8));
      goto LABEL_12;
    case 9uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v8, 0, v7, 0));
      goto LABEL_12;
    case 0xBuLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextEpisodeUuid"));
      if (v8)
        v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v8));
      else
        v9 = objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](NSPredicate, "falsePredicate"));
LABEL_12:
      v6 = (void *)v9;
      goto LABEL_13;
    case 0xCuLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "AND:", v13));

LABEL_13:
      break;
    default:
      break;
  }

  return v6;
}

- (MTPodcastDetailDataSource)initWithPodcastUuid:(id)a3
{
  id v5;
  MTPodcastDetailDataSource *v6;
  MTPodcastDetailDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTPodcastDetailDataSource;
  v6 = -[MTPodcastDetailDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcastUuid, a3);
    v7->_showOnlyRssContent = 0;
  }

  return v7;
}

- (void)setSelectedTab:(unint64_t)a3
{
  if (self->_selectedTab != a3 || !self->_sections)
  {
    self->_selectedTab = a3;
    -[MTPodcastDetailDataSource reloadData](self, "reloadData");
  }
}

- (void)setShowOnlyRssContent:(BOOL)a3
{
  self->_showOnlyRssContent = a3;
}

- (void)reloadData
{
  unint64_t selectedTab;
  NSArray *v4;
  NSArray *sections;

  selectedTab = self->_selectedTab;
  if (selectedTab == 2)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource savedSections](self, "savedSections"));
  }
  else if (selectedTab == 1)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource feedSections](self, "feedSections"));
  }
  else if (selectedTab)
  {
    v4 = 0;
  }
  else
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource unplayedSections](self, "unplayedSections"));
  }
  sections = self->_sections;
  self->_sections = v4;

}

- (id)podcast
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_podcastUuid)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", self->_podcastUuid));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)unplayedSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForUnplayed](self, "createSectionForUnplayed"));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForOtherEpisodes](self, "createSectionForOtherEpisodes"));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForEmptyOverlay](self, "createSectionForEmptyOverlay"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForPlayedToBeDeleted](self, "createSectionForPlayedToBeDeleted"));
  v9[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));

  return v7;
}

- (id)feedSections
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForFeed](self, "createSectionForFeed"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)savedSections
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForIsFromiTunesSync](self, "createSectionForIsFromiTunesSync"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (unint64_t)indexForSection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource sections](self, "sections"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return (unint64_t)v6;
}

- (void)sectionWillChangeContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource delegate](self, "delegate"));
  objc_msgSend(v5, "sectionWillChangeContent:", v4);

}

- (void)sectionDidChangeContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource delegate](self, "delegate"));
  objc_msgSend(v5, "sectionDidChangeContent:", v4);

}

- (void)episodeSection:(id)a3 didChangeObject:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6 newIndex:(unint64_t)a7
{
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v12 = a4;
  v13 = a3;
  v14 = -[MTPodcastDetailDataSource indexForSection:](self, "indexForSection:", v13);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v19, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/PodcastsTab/PodcastDetail/MTPodcastDetailDataSource.m", 145, CFSTR("Observed change for object %@ in section %@ but can't find the section index"), v12, v13);
  }
  else
  {
    v15 = v14;
    if (a5 == -1)
      v16 = 0;
    else
      v16 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, v14));
    v19 = (id)v16;
    if (a7 == -1)
      v17 = 0;
    else
      v17 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a7, v15));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource delegate](self, "delegate"));
    objc_msgSend(v18, "episodeSection:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v13, v12, v19, a6, v17);

    v12 = v18;
    v13 = (id)v17;
  }

}

+ (id)sortDescriptorsForPodcastUuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainQueueContext"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "podcastForUuid:", v3));
  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortDescriptorsForSortOrder"));
  else
    v7 = &__NSArray0__struct;

  return v7;
}

- (id)createSectionForUnplayed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MTPodcastDetailUnplayedEpisodeSection *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  v7 = objc_opt_new(MTPodcastDetailUnplayedEpisodeSection);
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortDescriptorsForPodcastUuid:", v9));
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v10);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 1);
  v11 = objc_msgSend((id)objc_opt_class(self), "predicateForPodcast:sectionType:", v6, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v12);

  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForOtherEpisodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MTPodcastDetailEpisodeSection *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  v7 = objc_opt_new(MTPodcastDetailEpisodeSection);
  if (v6)
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "predicateForPodcast:sectionType:", v6, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);

  }
  v10 = (void *)objc_opt_class(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortDescriptorsForPodcastUuid:", v11));
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OTHER_EPISODES_SECTION"), &stru_1004C6D40, 0));
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 3);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForEmptyOverlay
{
  MTPodcastDetailEpisodeSection *v2;
  void *v3;

  v2 = objc_opt_new(MTPodcastDetailEpisodeSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
  -[MTPodcastDetailEpisodeSection setPredicate:](v2, "setPredicate:", v3);

  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v2, "setSortDescriptors:", &__NSArray0__struct);
  -[MTPodcastDetailEpisodeSection setSectionType:](v2, "setSectionType:", 8);
  return v2;
}

- (id)createSectionForDarkPlacard
{
  MTPodcastDetailEpisodeSection *v2;
  void *v3;

  v2 = objc_opt_new(MTPodcastDetailEpisodeSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
  -[MTPodcastDetailEpisodeSection setPredicate:](v2, "setPredicate:", v3);

  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v2, "setSortDescriptors:", &__NSArray0__struct);
  -[MTPodcastDetailEpisodeSection setSectionType:](v2, "setSectionType:", 10);
  return v2;
}

- (id)createSectionForPlayedToBeDeleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MTPodcastDetailEpisodeSection *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  v7 = objc_opt_new(MTPodcastDetailEpisodeSection);
  v8 = objc_msgSend((id)objc_opt_class(self), "predicateForPodcast:sectionType:", v6, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);

  v10 = (void *)objc_opt_class(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortDescriptorsForPodcastUuid:", v11));
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Played Episodes to be Deleted"), &stru_1004C6D40, 0));
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 4);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForIsFromiTunesSync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MTPodcastDetailEpisodeSection *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  v7 = objc_opt_new(MTPodcastDetailEpisodeSection);
  v8 = objc_msgSend((id)objc_opt_class(self), "predicateForPodcast:sectionType:", v6, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);

  v10 = (void *)objc_opt_class(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortDescriptorsForPodcastUuid:", v11));
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("From Your Computer"), &stru_1004C6D40, 0));
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 7);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForFeed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MTPodcastDetailEpisodeSection *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastForUuid:", v5));

  v7 = objc_opt_new(MTPodcastDetailEpisodeSection);
  v8 = objc_msgSend((id)objc_opt_class(self), "predicateForPodcast:sectionType:", v6, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (self->_showOnlyRssContent)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRSSEpisodes](MTEpisode, "predicateForRSSEpisodes"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "AND:", v10));

    v9 = (void *)v11;
  }
  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);
  v12 = (void *)objc_opt_class(self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortDescriptorsForPodcastUuid:", v13));
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 6);
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", 0);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (MTPodcastDetailDataSourceDelegate)delegate
{
  return (MTPodcastDetailDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)selectedTab
{
  return self->_selectedTab;
}

- (BOOL)showOnlyRssContent
{
  return self->_showOnlyRssContent;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
}

@end
