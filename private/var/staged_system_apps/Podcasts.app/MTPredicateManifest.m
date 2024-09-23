@implementation MTPredicateManifest

- (void)_freezeContentIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;

  if (-[MTPredicateManifest needsFrozenCheck](self, "needsFrozenCheck"))
  {
    kdebug_trace(723518068, 0, 0, 0, 0);
    -[MTPredicateManifest setNeedsFrozenCheck:](self, "setNeedsFrozenCheck:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    v4 = objc_msgSend(v3, "count");

    if ((unint64_t)v4 >= 0xC9)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
      if (-[MTPredicateManifest currentIndex](self, "currentIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
        v7 = (uint64_t)objc_msgSend(v5, "indexOfObject:", v6);

      }
      else
      {
        v7 = (uint64_t)-[MTPredicateManifest currentIndex](self, "currentIndex");
      }
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {

        return;
      }
      v8 = 50;
      if (v7 > 50)
        v8 = v7;
      v9 = v8 - 50;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
      v11 = (char *)objc_msgSend(v10, "count");

      v12 = (char *)(v7 + 100);
      if ((unint64_t)v11 < v7 + 100)
        v12 = v11;
      v13 = &v12[-v9];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subarrayWithRange:", v9, v13));

      -[MTBaseEpisodeListManifest setEpisodeUuids:](self, "setEpisodeUuids:", v15);
      -[MTPredicateManifest setCurrentIndex:](self, "setCurrentIndex:", objc_msgSend(v15, "indexOfObject:", v16));
      self->_resultsAreFrozen = 1;

    }
    kdebug_trace(723518072, 0, 0, 0, 0);
  }
}

- (id)_currentEpisodeUuid
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest currentItem](self, "currentItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest initialEpisodeUuid](self, "initialEpisodeUuid"));

    v4 = (void *)v5;
  }
  return v4;
}

- (void)_load:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  MTPredicateManifest *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = sub_1000119D8;
  v5[3] = &unk_1004A63C8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)MTPredicateManifest;
  v5[0] = _NSConcreteStackBlock;
  v3 = v7;
  -[MTPredicateManifest _load:](&v4, "_load:", v5);

}

- (void)_observeAllPropertyChangesForEntityName:(id)a3 predicate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013408;
  v7[3] = &unk_1004A7398;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  +[IMAVPlayer performOnAvSessionQueue:](IMAVPlayer, "performOnAvSessionQueue:", v7);

}

- (void)_refetch:(id)a3
{
  void (**v4)(_QWORD);
  dispatch_block_t v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  MTPredicateManifest *v12;
  void (**v13)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if ((-[MTPredicateManifest isLoaded](self, "isLoaded") & 1) != 0)
  {
    kdebug_trace(723518040, 0, 0, 0, 0);
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_100020424;
    v11 = &unk_1004A63C8;
    v12 = self;
    v13 = v4;
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest frc](self, "frc", v8, v9, v10, v11, v12));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    objc_msgSend(v7, "performBlock:", v5);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (MTAllPropertyChangesQueryObserver)allPropertyChangeObserver
{
  return self->_allPropertyChangeObserver;
}

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4
{
  id v6;
  MTPredicateManifest *v7;
  MTPredicateManifest *v8;
  void *v9;
  MTResultsChangeGenerator *v10;
  MTIndexPathShifter *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTPredicateManifest;
  v7 = -[MTBaseEpisodeListManifest initWithInitialEpisodeUuid:](&v14, "initWithInitialEpisodeUuid:", a3);
  v8 = v7;
  if (v7)
  {
    -[MTPredicateManifest setFetchRequest:](v7, "setFetchRequest:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "predicate"));
    -[MTPredicateManifest setPredicate:](v8, "setPredicate:", v9);

    -[MTPredicateManifest setNeedsFrozenCheck:](v8, "setNeedsFrozenCheck:", 1);
    v10 = -[MTResultsChangeGenerator initWithDelegate:]([MTResultsChangeGenerator alloc], "initWithDelegate:", v8);
    -[MTPredicateManifest setChangeGenerator:](v8, "setChangeGenerator:", v10);

    v11 = objc_alloc_init(MTIndexPathShifter);
    -[MTPredicateManifest setIndexPathShifter:](v8, "setIndexPathShifter:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, "_restrictionsDidChange", PFExplicitContentAllowedDidChangeNotification, 0);

  }
  return v8;
}

- (void)_frcDidChangeResults:(id)a3 uuidToManagedObjectIDMap:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v7 = a3;
  v8 = a4;
  if (-[MTPredicateManifest isLoaded](self, "isLoaded")
    && !-[MTPredicateManifest resultsAreFrozen](self, "resultsAreFrozen"))
  {
    kdebug_trace(723518052, 0, 0, 0, 0);
    if (self->_preserveOriginalEpisodeOrdering)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder"));

      if (!v10)
        objc_storeStrong((id *)&self->_explicitSortOrder, a3);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
      v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder", 0));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v12, "containsObject:", v18))
              objc_msgSend(v9, "addObject:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v15);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
      if (objc_msgSend(v19, "length")
        && (objc_msgSend(v9, "containsObject:", v19) & 1) == 0
        && objc_msgSend(v7, "containsObject:", v19))
      {
        v20 = -[MTPredicateManifest currentIndex](self, "currentIndex");
        if (v20 <= objc_msgSend(v9, "count"))
          v21 = -[MTPredicateManifest currentIndex](self, "currentIndex");
        else
          v21 = 0;
        objc_msgSend(v9, "insertObject:atIndex:", v19, v21);
      }

    }
    else
    {
      v9 = v7;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    v23 = objc_msgSend(v22, "isEqual:", v9);

    if (v23)
    {
      kdebug_trace(723518056, 0, 0, 0, 0);
      goto LABEL_4;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    -[MTBaseEpisodeListManifest setEpisodeUuids:](self, "setEpisodeUuids:", v9);
    -[MTBaseEpisodeListManifest setUuidToManagedObjectIDMap:](self, "setUuidToManagedObjectIDMap:", v8);
    if (!-[MTBaseEpisodeListManifest count](self, "count")
      || -[MTPredicateManifest currentIndex](self, "currentIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_47:
      -[MTPredicateManifest _freezeContentIfNeeded](self, "_freezeContentIfNeeded");
      -[MTBaseEpisodeListManifest postManifestDidChangeNotification](self, "postManifestDidChangeNotification");
      kdebug_trace(723518056, 0, 0, 0, 0);

      goto LABEL_4;
    }
    kdebug_trace(723518060, 0, 0, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[MTPredicateManifest currentIndex](self, "currentIndex"), 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
    objc_msgSend(v26, "setInitialIndexPath:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest changeGenerator](self, "changeGenerator"));
    objc_msgSend(v27, "generateChangesForExistingObjects:newObjects:inSection:", v24, v9, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "shiftedIndexPath"));
    v30 = (unint64_t)objc_msgSend(v29, "row");

    if (v30 != 0x7FFFFFFFFFFFFFFFLL
      || -[MTPredicateManifest currentIndex](self, "currentIndex") == (id)1
      && ((v30 = (unint64_t)-[MTPredicateManifest currentIndex](self, "currentIndex") - 1,
           v31 = -[MTPredicateManifest currentIndex](self, "currentIndex"),
           v31 >= objc_msgSend(v24, "count"))
        ? (v32 = 0)
        : (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", -[MTPredicateManifest currentIndex](self, "currentIndex")))), v30 >= (unint64_t)objc_msgSend(v9, "count")? (v33 = 0): (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v30))), v34 = objc_msgSend(v32, "isEqualToString:", v33), v33, v32, v34))
    {
      if ((v30 & 0x8000000000000000) != 0)
        goto LABEL_45;
    }
    else
    {
      v30 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v30 < -[MTBaseEpisodeListManifest count](self, "count"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest currentItem](self, "currentItem"));
      objc_msgSend(v35, "setManifestIndex:", v30);

LABEL_46:
      -[MTPredicateManifest setCurrentIndex:](self, "setCurrentIndex:", v30);
      kdebug_trace(723518064, 0, 0, 0, 0);
      goto LABEL_47;
    }
LABEL_45:
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
  v9 = v7;
LABEL_4:

}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (id)_augmentPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 0, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForFeedDeleted:](MTEpisode, "predicateForFeedDeleted:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AND:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AND:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v10));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OR:", v11));

    v9 = (void *)v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPodcastIsNotHidden](MTEpisode, "predicateForPodcastIsNotHidden"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "AND:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExternalType:](MTEpisode, "predicateForExternalType:", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "AND:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest _predicateForFilteringExplicitEpisodes](self, "_predicateForFilteringExplicitEpisodes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "AND:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEntitledEpisodes](MTEpisode, "predicateForEntitledEpisodes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "AND:", v19));

  return v20;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void)setNeedsFrozenCheck:(BOOL)a3
{
  self->_needsFrozenCheck = a3;
}

- (void)setIndexPathShifter:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathShifter, a3);
}

- (void)setFrc:(id)a3
{
  objc_storeStrong((id *)&self->_frc, a3);
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (void)setChangeGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_changeGenerator, a3);
}

- (void)setAllPropertyChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_allPropertyChangeObserver, a3);
}

- (BOOL)resultsAreFrozen
{
  return self->_resultsAreFrozen;
}

- (BOOL)needsFrozenCheck
{
  return self->_needsFrozenCheck;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSArray)explicitSortOrder
{
  return self->_explicitSortOrder;
}

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3
{
  return -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:](self, "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:", a3, 0, 0);
}

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 predicateToTrack:(id)a4 sortDescriptors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  MTPredicateManifest *v17;
  _QWORD v19[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 1));
    v19[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 1));
    v19[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 0));
    v19[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
    v19[3] = v14;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));

  }
  v15 = objc_alloc((Class)NSFetchRequest);
  v16 = objc_msgSend(v15, "initWithEntityName:", kMTEpisodeEntityName);
  objc_msgSend(v16, "setPredicate:", v9);
  objc_msgSend(v16, "setSortDescriptors:", v10);
  v17 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:](self, "initWithInitialEpisodeUuid:fetchRequest:", v8, v16);

  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MTAllPropertyChangesQueryObserver stop](self->_allPropertyChangeObserver, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTPredicateManifest;
  -[MTPredicateManifest dealloc](&v4, "dealloc");
}

- (void)setSortDescriptors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest fetchRequest](self, "fetchRequest"));
  objc_msgSend(v5, "setSortDescriptors:", v4);

}

- (NSArray)sortDescriptors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest fetchRequest](self, "fetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortDescriptors"));

  return (NSArray *)v3;
}

- (void)_restrictionsDidChange
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100115770;
  v2[3] = &unk_1004A6200;
  v2[4] = self;
  +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v2);
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v10 = a7;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shiftedIndexPath"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
  objc_msgSend(v13, "processChangeAtIndexPath:forChangeType:newIndexPath:", v11, a6, v10);

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (a6 - 1 <= 2)
    -[MTPredicateManifest setHasFRCChanges:](self, "setHasFRCChanges:", 1);

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  if (-[MTPredicateManifest hasFRCChanges](self, "hasFRCChanges"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchedObjects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", kEpisodeUuid));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchedObjects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", kObjectID));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v8, v6));

    -[MTPredicateManifest setHasFRCChanges:](self, "setHasFRCChanges:", 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100115A1C;
    v12[3] = &unk_1004A7398;
    v12[4] = self;
    v13 = v6;
    v14 = v9;
    v10 = v9;
    v11 = v6;
    +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v12);

  }
}

- (void)setExplicitSortOrder:(id)a3
{
  objc_storeStrong((id *)&self->_explicitSortOrder, a3);
}

- (BOOL)preserveOriginalEpisodeOrdering
{
  return self->_preserveOriginalEpisodeOrdering;
}

- (void)setPreserveOriginalEpisodeOrdering:(BOOL)a3
{
  self->_preserveOriginalEpisodeOrdering = a3;
}

- (MTResultsChangeGenerator)changeGenerator
{
  return self->_changeGenerator;
}

- (MTIndexPathShifter)indexPathShifter
{
  return self->_indexPathShifter;
}

- (BOOL)hasFRCChanges
{
  return self->_hasFRCChanges;
}

- (void)setHasFRCChanges:(BOOL)a3
{
  self->_hasFRCChanges = a3;
}

- (void)setResultsAreFrozen:(BOOL)a3
{
  self->_resultsAreFrozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathShifter, 0);
  objc_storeStrong((id *)&self->_changeGenerator, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_allPropertyChangeObserver, 0);
  objc_storeStrong((id *)&self->_explicitSortOrder, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
