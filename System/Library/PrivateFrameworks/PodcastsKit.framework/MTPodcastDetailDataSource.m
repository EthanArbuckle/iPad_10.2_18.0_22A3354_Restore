@implementation MTPodcastDetailDataSource

- (MTPodcastDetailDataSource)initWithPodcastUuid:(id)a3
{
  id v5;
  MTPodcastDetailDataSource *v6;
  MTPodcastDetailDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTPodcastDetailDataSource;
  v6 = -[MTPodcastDetailDataSource init](&v9, sel_init);
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
    -[MTPodcastDetailDataSource savedSections](self, "savedSections");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else if (selectedTab == 1)
  {
    -[MTPodcastDetailDataSource feedSections](self, "feedSections");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else if (selectedTab)
  {
    v4 = 0;
  }
  else
  {
    -[MTPodcastDetailDataSource unplayedSections](self, "unplayedSections");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainQueueContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "podcastForUuid:", self->_podcastUuid);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

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
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  -[MTPodcastDetailDataSource createSectionForUnplayed](self, "createSectionForUnplayed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  -[MTPodcastDetailDataSource createSectionForOtherEpisodes](self, "createSectionForOtherEpisodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  -[MTPodcastDetailDataSource createSectionForEmptyOverlay](self, "createSectionForEmptyOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  -[MTPodcastDetailDataSource createSectionForPlayedToBeDeleted](self, "createSectionForPlayedToBeDeleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)feedSections
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[MTPodcastDetailDataSource createSectionForFeed](self, "createSectionForFeed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)savedSections
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[MTPodcastDetailDataSource createSectionForIsFromiTunesSync](self, "createSectionForIsFromiTunesSync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)indexForSection:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[MTPodcastDetailDataSource sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (void)sectionWillChangeContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPodcastDetailDataSource delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWillChangeContent:", v4);

}

- (void)sectionDidChangeContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPodcastDetailDataSource delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(MEMORY[0x24BE737C0], "sharedLogger");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset_PodcastsKit/Source/Classes/ViewControllers/PodcastsTab/PodcastDetail/MTPodcastDetailDataSource.m", 145, CFSTR("Observed change for object %@ in section %@ but can't find the section index"), v12, v13);
  }
  else
  {
    v15 = v14;
    if (a5 == -1)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a5, v14);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (id)v16;
    if (a7 == -1)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a7, v15);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    -[MTPodcastDetailDataSource delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "episodeSection:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v13, v12, v19, a6, v17);

    v12 = v18;
    v13 = (id)v17;
  }

}

+ (id)sortDescriptorsForPodcastUuid:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE737E8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainQueueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "podcastForUuid:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "sortDescriptorsForSortOrder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)createSectionForUnplayed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastForUuid:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_class();
  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortDescriptorsForPodcastUuid:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  objc_msgSend(v7, "setSectionType:", 1);
  objc_msgSend((id)objc_opt_class(), "predicateForPodcast:sectionType:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v11);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "loadData");

  return v7;
}

- (id)createSectionForOtherEpisodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastForUuid:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "predicateForPodcast:sectionType:", v6, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v8);

  }
  v9 = (void *)objc_opt_class();
  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortDescriptorsForPodcastUuid:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OTHER_EPISODES_SECTION"), &stru_24FD64198, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v13);

  objc_msgSend(v7, "setSectionType:", 3);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "loadData");

  return v7;
}

- (id)createSectionForEmptyOverlay
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setSortDescriptors:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v2, "setSectionType:", 8);
  return v2;
}

- (id)createSectionForDarkPlacard
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setSortDescriptors:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v2, "setSectionType:", 10);
  return v2;
}

- (id)createSectionForPlayedToBeDeleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastForUuid:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "predicateForPodcast:sectionType:", v6, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = (void *)objc_opt_class();
  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortDescriptorsForPodcastUuid:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Played Episodes to be Deleted"), &stru_24FD64198, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v13);

  objc_msgSend(v7, "setSectionType:", 4);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "loadData");

  return v7;
}

- (id)createSectionForIsFromiTunesSync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastForUuid:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "predicateForPodcast:sectionType:", v6, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = (void *)objc_opt_class();
  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortDescriptorsForPodcastUuid:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("From Your Computer"), &stru_24FD64198, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v13);

  objc_msgSend(v7, "setSectionType:", 7);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "loadData");

  return v7;
}

- (id)createSectionForFeed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "podcastForUuid:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "predicateForPodcast:sectionType:", v6, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showOnlyRssContent)
  {
    objc_msgSend(MEMORY[0x24BE737F8], "predicateForRSSEpisodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "AND:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(v7, "setPredicate:", v8);
  v11 = (void *)objc_opt_class();
  -[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortDescriptorsForPodcastUuid:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v13);

  objc_msgSend(v7, "setSectionType:", 6);
  objc_msgSend(v7, "setTitle:", 0);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "loadData");

  return v7;
}

+ (id)predicateForPodcast:(id)a3 sectionType:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
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

  v5 = a3;
  v6 = 0;
  v7 = objc_msgSend(v5, "deletePlayedEpisodesResolvedValue");
  switch(a4)
  {
    case 1uLL:
      v8 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:", v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3uLL:
      v11 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:", v12, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:", v14, v9, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 4uLL:
      v15 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:", v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6uLL:
      v16 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateForEpisodesInFeedForPodcastUuid:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7uLL:
      v17 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 9uLL:
      v18 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v9, 0, v7, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 0xBuLL:
      objc_msgSend(v5, "nextEpisodeUuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(MEMORY[0x24BE737F8], "predicateForEpisodeUuid:", v9);
      else
        objc_msgSend(MEMORY[0x24BDD1758], "falsePredicate");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v6 = (void *)v10;
      goto LABEL_14;
    case 0xCuLL:
      v19 = (void *)MEMORY[0x24BE737F8];
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "predicateForAllEpisodesOnPodcastUuid:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE737F8], "predicateForVisuallyPlayed:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "AND:", v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      break;
    default:
      break;
  }

  return v6;
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
