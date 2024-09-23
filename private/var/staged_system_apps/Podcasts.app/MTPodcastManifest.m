@implementation MTPodcastManifest

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("MTPodcastManifestActivitySectionType")));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005038;
  v12[3] = &unk_1004A82C0;
  v13 = v9;
  v14 = v6;
  v10 = v9;
  v11 = v6;
  objc_msgSend(a1, "episodeUuidForActivity:completion:", v7, v12);

}

- (MTPodcastManifest)initWithInitialEpisodeUuid:(id)a3 sectionType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  MTPodcastManifest *v13;
  MTPodcastManifest *v14;
  void *v15;
  MTPodcastManifest *v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = sub_10004686C;
    v49 = sub_100046AAC;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = sub_10004686C;
    v43 = sub_100046AAC;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = sub_10004686C;
    v37 = sub_100046AAC;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_10004686C;
    v31 = sub_100046AAC;
    v32 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100013A94;
    v19[3] = &unk_1004AB728;
    v9 = v8;
    v20 = v9;
    v10 = v6;
    v21 = v10;
    v22 = &v45;
    v23 = &v39;
    v24 = &v33;
    v25 = &v27;
    v26 = a4;
    objc_msgSend(v9, "performBlockAndWait:", v19);
    if (objc_msgSend((id)v46[5], "length"))
    {
      v11 = objc_alloc((Class)NSFetchRequest);
      v12 = objc_msgSend(v11, "initWithEntityName:", kMTEpisodeEntityName);
      objc_msgSend(v12, "setPredicate:", v28[5]);
      objc_msgSend(v12, "setSortDescriptors:", v34[5]);
      v18.receiver = self;
      v18.super_class = (Class)MTPodcastManifest;
      v13 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:](&v18, "initWithInitialEpisodeUuid:fetchRequest:", v10, v12);
      v14 = v13;
      if (v13)
      {
        -[MTPodcastManifest setPodcastUuid:](v13, "setPodcastUuid:", v46[5]);
        -[MTPodcastManifest setSectionType:](v14, "setSectionType:", a4);
        -[MTPodcastManifest setTitle:](v14, "setTitle:", v40[5]);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastUUID:](MTPodcast, "predicateForPodcastUUID:", v46[5]));
        -[MTPredicateManifest _observeAllPropertyChangesForEntityName:predicate:](v14, "_observeAllPropertyChangesForEntityName:predicate:", kMTPodcastEntityName, v15);

      }
      self = v14;

      v16 = self;
    }
    else
    {
      v16 = 0;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)activity
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPodcastManifest;
  v3 = -[MTPlayerManifest activity](&v7, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MTPodcastManifest sectionType](self, "sectionType")));
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("MTPodcastManifestActivitySectionType"));

  return v4;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

+ (id)activityTypeSuffix
{
  return CFSTR("podcast");
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (void)setPodcastUuid:(id)a3
{
  objc_storeStrong((id *)&self->_podcastUuid, a3);
}

- (void)_propertyDidChange
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  MTPodcastManifest *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainOrPrivateContext"));

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10004686C;
  v16 = sub_100046AAC;
  v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010AD00;
  v8[3] = &unk_1004A6690;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (void *)v13[5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest sortDescriptors](self, "sortDescriptors"));
  LOBYTE(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    -[MTPredicateManifest setSortDescriptors:](self, "setSortDescriptors:", v13[5]);
    -[MTPredicateManifest _refetch:](self, "_refetch:", 0);
  }

  _Block_object_dispose(&v12, 8);
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastUuid, 0);
}

@end
