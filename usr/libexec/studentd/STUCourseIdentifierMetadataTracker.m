@implementation STUCourseIdentifierMetadataTracker

+ (id)sharedTracker
{
  if (qword_1000FC060 != -1)
    dispatch_once(&qword_1000FC060, &stru_1000C9A40);
  return (id)qword_1000FC068;
}

- (id)_init
{
  STUCourseIdentifierMetadataTracker *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mMetadataByCourseIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *mNumberOfConnectionsByCourseIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUCourseIdentifierMetadataTracker;
  v2 = -[STUCourseIdentifierMetadataTracker init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    mMetadataByCourseIdentifier = v2->mMetadataByCourseIdentifier;
    v2->mMetadataByCourseIdentifier = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    mNumberOfConnectionsByCourseIdentifier = v2->mNumberOfConnectionsByCourseIdentifier;
    v2->mNumberOfConnectionsByCourseIdentifier = v5;

  }
  return v2;
}

- (void)classSessionDidConnectWithCourseIdentifier:(id)a3
{
  unint64_t v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[STUCourseIdentifierMetadataTracker numberOfConnectionsForCourseIdentifier:](self, "numberOfConnectionsForCourseIdentifier:");
  if (!v4)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mMetadataByCourseIdentifier, "setObject:forKeyedSubscript:", v5, v7);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4 + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mNumberOfConnectionsByCourseIdentifier, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)classSessionDidDisconnectWithCourseIdentifier:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = -[STUCourseIdentifierMetadataTracker numberOfConnectionsForCourseIdentifier:](self, "numberOfConnectionsForCourseIdentifier:");
  if (v5)
  {
    v6 = v5 - 1;
    if (v5 == 1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mMetadataByCourseIdentifier, "setObject:forKeyedSubscript:", v6, v9);
      v6 = 0;
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));

    v6 = -1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mNumberOfConnectionsByCourseIdentifier, "setObject:forKeyedSubscript:", v7, v9);

}

- (void)setValue:(id)a3 forKey:(id)a4 courseIdentifier:(id)a5
{
  NSMutableDictionary *mMetadataByCourseIdentifier;
  id v9;
  id v10;
  id v11;
  id v12;

  mMetadataByCourseIdentifier = self->mMetadataByCourseIdentifier;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](mMetadataByCourseIdentifier, "objectForKeyedSubscript:", v9));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mMetadataByCourseIdentifier, "setObject:forKeyedSubscript:", v12, v9);
}

- (void)removeValueForKey:(id)a3 courseIdentifier:(id)a4
{
  -[STUCourseIdentifierMetadataTracker setValue:forKey:courseIdentifier:](self, "setValue:forKey:courseIdentifier:", 0, a3, a4);
}

- (id)valueForKey:(id)a3 courseIdentifier:(id)a4
{
  NSMutableDictionary *mMetadataByCourseIdentifier;
  id v6;
  void *v7;
  void *v8;

  mMetadataByCourseIdentifier = self->mMetadataByCourseIdentifier;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](mMetadataByCourseIdentifier, "objectForKeyedSubscript:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  return v8;
}

- (unint64_t)numberOfConnectionsForCourseIdentifier:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mNumberOfConnectionsByCourseIdentifier, "objectForKeyedSubscript:", a3));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNumberOfConnectionsByCourseIdentifier, 0);
  objc_storeStrong((id *)&self->mMetadataByCourseIdentifier, 0);
}

@end
