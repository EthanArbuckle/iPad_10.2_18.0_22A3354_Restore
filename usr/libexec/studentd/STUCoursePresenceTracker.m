@implementation STUCoursePresenceTracker

- (STUCoursePresenceTracker)initWithDateProvider:(id)a3
{
  id v6;
  STUCoursePresenceTracker *v7;
  STUCoursePresenceTracker *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *mMetadataByCourseIdentifier;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePresenceTracker.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateProvider"));

  }
  v13.receiver = self;
  v13.super_class = (Class)STUCoursePresenceTracker;
  v7 = -[STUCoursePresenceTracker init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->mDateProvider, a3);
    v9 = objc_opt_new(NSMutableDictionary);
    mMetadataByCourseIdentifier = v8->mMetadataByCourseIdentifier;
    v8->mMetadataByCourseIdentifier = v9;

  }
  return v8;
}

- (NSSet)presentCourseIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->mMetadataByCourseIdentifier, "allValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("courseIdentifier")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return (NSSet *)v4;
}

- (void)foundCourseIdentifier:(id)a3
{
  id v5;
  STUPresenceMetadata *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePresenceTracker.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("courseIdentifier"));

    v5 = 0;
  }
  v6 = (STUPresenceMetadata *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mMetadataByCourseIdentifier, "objectForKeyedSubscript:", v5));
  if (!v6)
  {
    v6 = objc_opt_new(STUPresenceMetadata);
    -[STUPresenceMetadata setCourseIdentifier:](v6, "setCourseIdentifier:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDateProviderProtocol currentDate](self->mDateProvider, "currentDate"));
    -[STUPresenceMetadata setFirstSeenDate:](v6, "setFirstSeenDate:", v7);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mMetadataByCourseIdentifier, "setObject:forKeyedSubscript:", v6, v9);
  }

}

- (void)removedCourseIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->mMetadataByCourseIdentifier, "removeObjectForKey:", a3);
}

- (id)firstSeenDateForCourseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMFControlGroupIdentifier crk_managedXPCGroupIdentifier](DMFControlGroupIdentifier, "crk_managedXPCGroupIdentifier"));
    v14[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMFControlGroupIdentifier crk_adHocXPCGroupIdentifier](DMFControlGroupIdentifier, "crk_adHocXPCGroupIdentifier"));
    v14[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDateProviderProtocol distantPast](self->mDateProvider, "distantPast"));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mMetadataByCourseIdentifier, "objectForKeyedSubscript:", v4));
      v11 = v10;
      if (v10)
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstSeenDate"));
      else
        v12 = objc_claimAutoreleasedReturnValue(-[STUDateProviderProtocol distantFuture](self->mDateProvider, "distantFuture"));
      v9 = (void *)v12;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMetadataByCourseIdentifier, 0);
  objc_storeStrong((id *)&self->mDateProvider, 0);
}

@end
