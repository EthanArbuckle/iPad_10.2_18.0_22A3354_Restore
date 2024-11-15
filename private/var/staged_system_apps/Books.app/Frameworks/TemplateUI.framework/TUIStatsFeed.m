@implementation TUIStatsFeed

- (TUIStatsFeed)initWithDates:(id)a3 collector:(id)a4
{
  id v6;
  id v7;
  TUIStatsFeed *v8;
  uint64_t v9;
  NSDate *creationDate;
  uint64_t v11;
  NSDate *initialResourcesRenderedDate;
  uint64_t v13;
  NSDate *contentUpdateDate;
  uint64_t v15;
  NSDate *initialContentReadyDate;
  uint64_t v17;
  NSDate *initialLayoutStartDate;
  uint64_t v19;
  NSDate *allContentReadyDate;
  uint64_t v21;
  NSDate *dynamicUpdateDate;
  uint64_t v23;
  NSDate *resourcesStartLoadingDate;
  uint64_t v25;
  NSDate *resourcesLoadedDate;
  uint64_t v27;
  NSDate *viewWillAppearDate;
  void *v29;
  NSArray *v30;
  NSArray *passes;
  void *v32;
  NSArray *v33;
  NSArray *currentEntriesUID;
  uint64_t i;
  double v36;
  uint64_t j;
  NSMutableDictionary *v38;
  void *v39;
  NSMutableDictionary *v40;
  NSDictionary *v41;
  NSDictionary *entries;
  _QWORD v44[4];
  NSMutableDictionary *v45;
  objc_super v46;

  v6 = a3;
  v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)TUIStatsFeed;
  v8 = -[TUIStatsFeed init](&v46, "init");
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "creationDate"));
    creationDate = v8->_creationDate;
    v8->_creationDate = (NSDate *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initialResourcesRenderedDate"));
    initialResourcesRenderedDate = v8->_initialResourcesRenderedDate;
    v8->_initialResourcesRenderedDate = (NSDate *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentUpdateDate"));
    contentUpdateDate = v8->_contentUpdateDate;
    v8->_contentUpdateDate = (NSDate *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initialContentReadyDate"));
    initialContentReadyDate = v8->_initialContentReadyDate;
    v8->_initialContentReadyDate = (NSDate *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initialLayoutStartDate"));
    initialLayoutStartDate = v8->_initialLayoutStartDate;
    v8->_initialLayoutStartDate = (NSDate *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allContentReadyDate"));
    allContentReadyDate = v8->_allContentReadyDate;
    v8->_allContentReadyDate = (NSDate *)v19;

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicUpdateDate"));
    dynamicUpdateDate = v8->_dynamicUpdateDate;
    v8->_dynamicUpdateDate = (NSDate *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourcesStartLoadingDate"));
    resourcesStartLoadingDate = v8->_resourcesStartLoadingDate;
    v8->_resourcesStartLoadingDate = (NSDate *)v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourcesLoadedDate"));
    resourcesLoadedDate = v8->_resourcesLoadedDate;
    v8->_resourcesLoadedDate = (NSDate *)v25;

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewWillAppearDate"));
    viewWillAppearDate = v8->_viewWillAppearDate;
    v8->_viewWillAppearDate = (NSDate *)v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passes"));
    v30 = (NSArray *)objc_msgSend(v29, "copy");
    passes = v8->_passes;
    v8->_passes = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentEntriesUID"));
    v33 = (NSArray *)objc_msgSend(v32, "copy");
    currentEntriesUID = v8->_currentEntriesUID;
    v8->_currentEntriesUID = v33;

    for (i = 0; i != 5; ++i)
    {
      objc_msgSend(v7, "elapsedTimeForPhase:", i);
      v8->_elapsedTime[i] = v36;
    }
    for (j = 0; j != 29; ++j)
      v8->_eventCount[j] = (unint64_t)objc_msgSend(v7, "countForEvent:", j);
    v38 = objc_opt_new(NSMutableDictionary);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entries"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_59918;
    v44[3] = &unk_23F070;
    v45 = v38;
    v40 = v38;
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v44);

    v41 = (NSDictionary *)-[NSMutableDictionary copy](v40, "copy");
    entries = v8->_entries;
    v8->_entries = v41;

  }
  return v8;
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)initialResourcesRenderedDate
{
  return self->_initialResourcesRenderedDate;
}

- (NSDate)contentUpdateDate
{
  return self->_contentUpdateDate;
}

- (NSDate)initialContentReadyDate
{
  return self->_initialContentReadyDate;
}

- (NSDate)initialLayoutStartDate
{
  return self->_initialLayoutStartDate;
}

- (NSDate)allContentReadyDate
{
  return self->_allContentReadyDate;
}

- (NSDate)dynamicUpdateDate
{
  return self->_dynamicUpdateDate;
}

- (NSDate)resourcesStartLoadingDate
{
  return self->_resourcesStartLoadingDate;
}

- (NSDate)resourcesLoadedDate
{
  return self->_resourcesLoadedDate;
}

- (NSDate)viewWillAppearDate
{
  return self->_viewWillAppearDate;
}

- (NSArray)passes
{
  return self->_passes;
}

- (NSDictionary)entries
{
  return self->_entries;
}

- (NSArray)currentEntriesUID
{
  return self->_currentEntriesUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEntriesUID, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_viewWillAppearDate, 0);
  objc_storeStrong((id *)&self->_resourcesLoadedDate, 0);
  objc_storeStrong((id *)&self->_resourcesStartLoadingDate, 0);
  objc_storeStrong((id *)&self->_dynamicUpdateDate, 0);
  objc_storeStrong((id *)&self->_allContentReadyDate, 0);
  objc_storeStrong((id *)&self->_initialLayoutStartDate, 0);
  objc_storeStrong((id *)&self->_initialContentReadyDate, 0);
  objc_storeStrong((id *)&self->_contentUpdateDate, 0);
  objc_storeStrong((id *)&self->_initialResourcesRenderedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
