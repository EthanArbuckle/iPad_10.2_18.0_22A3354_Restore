@implementation MTLibraryQuery

- (MTLibraryQuery)init
{
  MTLibraryQuery *v2;
  MTLibraryQuery *v3;
  MTLibraryQuery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLibraryQuery;
  v2 = -[MTLibraryQuery init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_active = 1;
    v2->_fetchLimit = 0;
    v4 = v2;
  }

  return v3;
}

- (void)runQueryWithPodcastPredicate:(id)a3 episodePredicate:(id)a4 channelPredicate:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[MTLibraryQuery setPodcastPredicate:](self, "setPodcastPredicate:", a3);
  -[MTLibraryQuery setEpisodePredicate:](self, "setEpisodePredicate:", v9);

  -[MTLibraryQuery setChannelPredicate:](self, "setChannelPredicate:", v8);
  -[MTLibraryQuery runQuery](self, "runQuery");
}

- (void)runQuery
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  -[MTLibraryQuery runQueryInContext:](self, "runQueryInContext:", v4);
}

- (void)runQueryInContext:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSPredicate *v8;
  NSPredicate *v9;
  NSPredicate *v10;
  NSPredicate *v11;
  NSArray *v12;
  id v13;
  NSPredicate *v14;
  NSArray *v15;
  NSPredicate *v16;
  NSArray *v17;
  void (**action)(id, uint64_t, uint64_t, uint64_t);
  _QWORD v19[4];
  NSPredicate *v20;
  NSArray *v21;
  MTLibraryQuery *v22;
  id v23;
  NSPredicate *v24;
  NSArray *v25;
  NSPredicate *v26;
  NSArray *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_100046634;
  v47 = sub_10004699C;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100046634;
  v41 = sub_10004699C;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_100046634;
  v35 = sub_10004699C;
  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = self->_episodeSortDescriptors;
  v6 = self->_podcastSortDescriptors;
  v7 = self->_channelSortDescriptors;
  v8 = self->_podcastPredicate;
  v9 = self->_episodePredicate;
  v10 = self->_channelPredicate;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100070F70;
  v19[3] = &unk_1004A79B0;
  v11 = v8;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  v22 = self;
  v28 = &v37;
  v13 = v4;
  v23 = v13;
  v29 = &v31;
  v14 = v9;
  v24 = v14;
  v30 = &v43;
  v15 = v5;
  v25 = v15;
  v16 = v10;
  v26 = v16;
  v17 = v7;
  v27 = v17;
  objc_msgSend(v13, "performBlockAndWait:", v19);
  action = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_action;
  if (action)
    action[2](action, v38[5], v44[5], v32[5]);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

- (NSArray)podcastResults
{
  return self->_podcastResults;
}

- (void)setPodcastResults:(id)a3
{
  objc_storeStrong((id *)&self->_podcastResults, a3);
}

- (NSArray)episodeResults
{
  return self->_episodeResults;
}

- (void)setEpisodeResults:(id)a3
{
  objc_storeStrong((id *)&self->_episodeResults, a3);
}

- (NSArray)channelResults
{
  return self->_channelResults;
}

- (void)setChannelResults:(id)a3
{
  objc_storeStrong((id *)&self->_channelResults, a3);
}

- (NSPredicate)podcastPredicate
{
  return self->_podcastPredicate;
}

- (void)setPodcastPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_podcastPredicate, a3);
}

- (NSPredicate)episodePredicate
{
  return self->_episodePredicate;
}

- (void)setEpisodePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_episodePredicate, a3);
}

- (NSPredicate)channelPredicate
{
  return self->_channelPredicate;
}

- (void)setChannelPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_channelPredicate, a3);
}

- (NSArray)podcastSortDescriptors
{
  return self->_podcastSortDescriptors;
}

- (void)setPodcastSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_podcastSortDescriptors, a3);
}

- (NSArray)episodeSortDescriptors
{
  return self->_episodeSortDescriptors;
}

- (void)setEpisodeSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_episodeSortDescriptors, a3);
}

- (NSArray)channelSortDescriptors
{
  return self->_channelSortDescriptors;
}

- (void)setChannelSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_channelSortDescriptors, a3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(int64_t)a3
{
  self->_fetchLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_channelSortDescriptors, 0);
  objc_storeStrong((id *)&self->_episodeSortDescriptors, 0);
  objc_storeStrong((id *)&self->_podcastSortDescriptors, 0);
  objc_storeStrong((id *)&self->_channelPredicate, 0);
  objc_storeStrong((id *)&self->_episodePredicate, 0);
  objc_storeStrong((id *)&self->_podcastPredicate, 0);
  objc_storeStrong((id *)&self->_channelResults, 0);
  objc_storeStrong((id *)&self->_episodeResults, 0);
  objc_storeStrong((id *)&self->_podcastResults, 0);
}

@end
