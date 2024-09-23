@implementation MTPodcastDetailEpisodeSection

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(&unk_24FD6BE00, "objectAtIndexedSubscript:", -[MTPodcastDetailEpisodeSection sectionType](self, "sectionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPodcastDetailEpisodeSection episodes](self, "episodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Section: %@ (%lu)"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)title
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  if (self->_showTitleWithNoEpisodes
    || (-[MTPodcastDetailEpisodeSection episodes](self, "episodes"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;

  if (!self->_frc)
  {
    v3 = objc_alloc(MEMORY[0x24BDBB678]);
    v4 = (void *)objc_msgSend(v3, "initWithEntityName:", *MEMORY[0x24BE739E8]);
    objc_msgSend(v4, "setPredicate:", self->_predicate);
    objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);
    objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainQueueContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE73810]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v4, v6, 0, 0);
    objc_msgSend((id)objc_opt_class(), "dependentPropertyKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPropertyKeys:", v8);

    objc_msgSend(v7, "setDelegate:", self);
    v12 = 0;
    v9 = objc_msgSend(v7, "performFetch:", &v12);
    v10 = v12;
    v11 = v10;
    if (v9)
      -[MTPodcastDetailEpisodeSection setFrc:](self, "setFrc:", v7);
    else
      objc_msgSend(v10, "logAndThrow:", 1);

  }
}

+ (id)dependentPropertyKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[21];

  v13[20] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE73930];
  v13[0] = *MEMORY[0x24BE739C0];
  v13[1] = v2;
  v3 = *MEMORY[0x24BE738E0];
  v13[2] = *MEMORY[0x24BE739A8];
  v13[3] = v3;
  v4 = *MEMORY[0x24BE738F8];
  v13[4] = *MEMORY[0x24BE738E8];
  v13[5] = v4;
  v5 = *MEMORY[0x24BE738B8];
  v13[6] = *MEMORY[0x24BE73920];
  v13[7] = v5;
  v6 = *MEMORY[0x24BE73990];
  v13[8] = *MEMORY[0x24BE739A0];
  v13[9] = v6;
  v7 = *MEMORY[0x24BE738C0];
  v13[10] = *MEMORY[0x24BE738F0];
  v13[11] = v7;
  v8 = *MEMORY[0x24BE73918];
  v13[12] = *MEMORY[0x24BE739C8];
  v13[13] = v8;
  v9 = *MEMORY[0x24BE73910];
  v13[14] = *MEMORY[0x24BE739B8];
  v13[15] = v9;
  v10 = *MEMORY[0x24BE73960];
  v13[16] = *MEMORY[0x24BE73938];
  v13[17] = v10;
  v11 = *MEMORY[0x24BE738D0];
  v13[18] = *MEMORY[0x24BE73968];
  v13[19] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)episodes
{
  void *v2;
  void *v3;

  -[MTPodcastDetailEpisodeSection frc](self, "frc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)indexOfEpisode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[MTPodcastDetailEpisodeSection frc](self, "frc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "row");
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
  v16 = objc_msgSend(v13, "row");
  if (!v15)
    goto LABEL_5;
LABEL_3:
  v17 = objc_msgSend(v15, "row");
LABEL_6:
  -[MTPodcastDetailEpisodeSection delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "episodeSection:didChangeObject:atIndex:forChangeType:newIndex:", self, v12, v16, a6, v17);

}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;

  -[MTPodcastDetailEpisodeSection delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWillChangeContent:", self);

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;

  -[MTPodcastDetailEpisodeSection delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
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
