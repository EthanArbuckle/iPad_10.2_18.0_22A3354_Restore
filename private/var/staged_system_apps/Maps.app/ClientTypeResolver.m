@implementation ClientTypeResolver

- (ClientTypeResolver)init
{
  return -[ClientTypeResolver initWithCurrentLocation:parkedCar:personalizedItems:](self, "initWithCurrentLocation:parkedCar:personalizedItems:", 1, 1, 1);
}

- (ClientTypeResolver)initWithCurrentLocation:(BOOL)a3 parkedCar:(BOOL)a4 personalizedItems:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  ClientTypeResolver *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *sources;
  ClientTypeResolverPersonalizedItemSource *v11;
  void *v12;
  void *v13;
  ClientTypeResolverPersonalizedItemSource *v14;
  ClientTypeResolverPersonalizedItemSource *personalizedItemSource;
  ClientTypeResolverCurrentLocationSource *v17;
  void *v18;
  ClientTypeResolverCurrentLocationSource *v19;
  ClientTypeResolverCurrentLocationSource *currentLocationSource;
  ClientTypeResolverParkedCarSource *v21;
  void *v22;
  ClientTypeResolverParkedCarSource *v23;
  ClientTypeResolverParkedCarSource *parkedCarSource;
  objc_super v25;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ClientTypeResolver;
  v8 = -[ClientTypeResolver init](&v25, "init");
  if (!v8)
    return v8;
  v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  sources = v8->_sources;
  v8->_sources = v9;

  if (!v7)
  {
    if (!v6)
      goto LABEL_4;
LABEL_8:
    v21 = [ClientTypeResolverParkedCarSource alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
    v23 = -[ClientTypeResolverParkedCarSource initWithParkedCarManager:](v21, "initWithParkedCarManager:", v22);
    parkedCarSource = v8->_parkedCarSource;
    v8->_parkedCarSource = v23;

    -[ClientTypeResolver addSource:](v8, "addSource:", v8->_parkedCarSource);
    if (!v5)
      return v8;
    goto LABEL_5;
  }
  v17 = [ClientTypeResolverCurrentLocationSource alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v19 = -[ClientTypeResolverCurrentLocationSource initWithLocationManager:](v17, "initWithLocationManager:", v18);
  currentLocationSource = v8->_currentLocationSource;
  v8->_currentLocationSource = v19;

  -[ClientTypeResolver addSource:](v8, "addSource:", v8->_currentLocationSource);
  if (v6)
    goto LABEL_8;
LABEL_4:
  if (v5)
  {
LABEL_5:
    v11 = [ClientTypeResolverPersonalizedItemSource alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CoreRoutineLocationOfInterestManager sharedManager](CoreRoutineLocationOfInterestManager, "sharedManager"));
    v14 = -[ClientTypeResolverPersonalizedItemSource initWithAddressBookManager:locationOfInterestManager:](v11, "initWithAddressBookManager:locationOfInterestManager:", v12, v13);
    personalizedItemSource = v8->_personalizedItemSource;
    v8->_personalizedItemSource = v14;

    -[ClientTypeResolver addSource:](v8, "addSource:", v8->_personalizedItemSource);
  }
  return v8;
}

- (BOOL)hasObjectWithType:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver sourceWithType:](self, "sourceWithType:"));
  LOBYTE(v3) = objc_msgSend(v4, "hasObjectWithType:", v3);

  return v3;
}

- (void)addSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "knownTypes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver sources](self, "sources"));
        objc_msgSend(v11, "setObject:forKey:", v4, v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)sourceWithType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver sources](self, "sources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  return v6;
}

- (ClientTypeResolverCurrentLocationSource)currentLocationSource
{
  return self->_currentLocationSource;
}

- (void)setCurrentLocationSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocationSource, a3);
}

- (ClientTypeResolverParkedCarSource)parkedCarSource
{
  return self->_parkedCarSource;
}

- (void)setParkedCarSource:(id)a3
{
  objc_storeStrong((id *)&self->_parkedCarSource, a3);
}

- (ClientTypeResolverPersonalizedItemSource)personalizedItemSource
{
  return self->_personalizedItemSource;
}

- (void)setPersonalizedItemSource:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedItemSource, a3);
}

- (NSMutableDictionary)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_storeStrong((id *)&self->_sources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_personalizedItemSource, 0);
  objc_storeStrong((id *)&self->_parkedCarSource, 0);
  objc_storeStrong((id *)&self->_currentLocationSource, 0);
}

@end
