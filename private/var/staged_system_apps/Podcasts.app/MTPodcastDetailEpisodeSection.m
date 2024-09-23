@implementation MTPodcastDetailEpisodeSection

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1004D74D0, "objectAtIndexedSubscript:", -[MTPodcastDetailEpisodeSection sectionType](self, "sectionType")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection episodes](self, "episodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Section: %@ (%lu)"), v3, objc_msgSend(v4, "count")));

  return (NSString *)v5;
}

- (NSString)title
{
  void *v3;
  id v4;
  NSString *v5;

  if (self->_showTitleWithNoEpisodes
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection episodes](self, "episodes")),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    v5 = self->_title;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (void)initializeFrc
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  id v13;

  if (!self->_frc)
  {
    v3 = objc_alloc((Class)NSFetchRequest);
    v4 = objc_msgSend(v3, "initWithEntityName:", kMTEpisodeEntityName);
    objc_msgSend(v4, "setPredicate:", self->_predicate);
    objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainQueueContext"));

    v7 = objc_msgSend(objc_alloc((Class)MTFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v4, v6, 0, 0);
    v8 = objc_msgSend((id)objc_opt_class(self), "dependentPropertyKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "setPropertyKeys:", v9);

    objc_msgSend(v7, "setDelegate:", self);
    v13 = 0;
    v10 = objc_msgSend(v7, "performFetch:", &v13);
    v11 = v13;
    v12 = v11;
    if (v10)
      -[MTPodcastDetailEpisodeSection setFrc:](self, "setFrc:", v7);
    else
      objc_msgSend(v11, "logAndThrow:", 1);

  }
}

+ (id)dependentPropertyKeys
{
  _QWORD v3[20];

  v3[0] = kEpisodeUuid;
  v3[1] = kEpisodeGuid;
  v3[2] = kEpisodeTitle;
  v3[3] = kEpisodeCleanedTitle;
  v3[4] = kEpisodeDescription;
  v3[5] = kEpisodeEnclosureUrl;
  v3[6] = kEpisodeFeedDeleted;
  v3[7] = kEpisodeAssetURL;
  v3[8] = kEpisodeSuppressAutoDownload;
  v3[9] = kEpisodePubDate;
  v3[10] = kEpisodeDuration;
  v3[11] = kEpisodeAudio;
  v3[12] = kEpisodeVideo;
  v3[13] = kEpisodeExternalType;
  v3[14] = kEpisodeUti;
  v3[15] = kEpisodeExplicit;
  v3[16] = kEpisodeIsFromiTunesSync;
  v3[17] = kEpisodePlayState;
  v3[18] = kEpisodePlayStateManuallySet;
  v3[19] = kEpisodeBackCatalog;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 20));
}

- (id)episodes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection frc](self, "frc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchedObjects"));

  return v3;
}

- (unint64_t)indexOfEpisode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForObject:", v4));

  if (v6)
    v7 = (unint64_t)objc_msgSend(v6, "row");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = v14;
  if (!v13)
  {
    v16 = -1;
    if (v14)
      goto LABEL_3;
LABEL_5:
    v17 = -1;
    goto LABEL_6;
  }
  v16 = (uint64_t)objc_msgSend(v13, "row");
  if (!v15)
    goto LABEL_5;
LABEL_3:
  v17 = (uint64_t)objc_msgSend(v15, "row");
LABEL_6:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection delegate](self, "delegate"));
  objc_msgSend(v18, "episodeSection:didChangeObject:atIndex:forChangeType:newIndex:", self, v12, v16, a6, v17);

}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection delegate](self, "delegate", a3));
  objc_msgSend(v4, "sectionWillChangeContent:", self);

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection delegate](self, "delegate", a3));
  objc_msgSend(v4, "sectionDidChangeContent:", self);

}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)showTitleWithNoEpisodes
{
  return self->_showTitleWithNoEpisodes;
}

- (void)setShowTitleWithNoEpisodes:(BOOL)a3
{
  self->_showTitleWithNoEpisodes = a3;
}

- (MTPodcastDetailEpisodeSectionDelegate)delegate
{
  return (MTPodcastDetailEpisodeSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTFetchedResultsControllerProtocol)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
  objc_storeStrong((id *)&self->_frc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frc, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
