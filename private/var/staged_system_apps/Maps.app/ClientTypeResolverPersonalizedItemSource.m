@implementation ClientTypeResolverPersonalizedItemSource

- (ClientTypeResolverPersonalizedItemSource)initWithAddressBookManager:(id)a3 locationOfInterestManager:(id)a4
{
  id v7;
  id v8;
  ClientTypeResolverPersonalizedItemSource *v9;
  ClientTypeResolverPersonalizedItemSource *v10;
  CoreRoutineLocationOfInterestManager *locationOfInterestManager;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ClientTypeResolverPersonalizedItemSource;
  v9 = -[ClientTypeResolverPersonalizedItemSource init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addressBookManager, a3);
    objc_storeStrong((id *)&v10->_locationOfInterestManager, a4);
    locationOfInterestManager = v10->_locationOfInterestManager;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_101273890));
    -[CoreRoutineLocationOfInterestManager monitorLOIsOfTypes:](locationOfInterestManager, "monitorLOIsOfTypes:", v12);

  }
  return v10;
}

- (BOOL)homeAndWorkEnabled
{
  return GEOConfigGetBOOL(MapsConfig_UseAddressResultsForHomeAndWork, off_1014B2F68);
}

- (id)knownTypes
{
  return &off_1012738A8;
}

- (BOOL)hasObjectWithType:(int)a3
{
  uint64_t v3;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  if (!-[ClientTypeResolverSource typeIsValid:](self, "typeIsValid:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource cachedAddressWithType:](self, "cachedAddressWithType:", v3));
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource cachedLOIWithType:](self, "cachedLOIWithType:", v3));
    v6 = v7 != 0;

  }
  return v6;
}

- (void)objectWithType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  int v11;
  id location;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (v6)
  {
    if (+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed")
      && -[ClientTypeResolverPersonalizedItemSource homeAndWorkEnabled](self, "homeAndWorkEnabled")
      && -[ClientTypeResolverSource typeIsValid:](self, "typeIsValid:", v4))
    {
      objc_initWeak(&location, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource addressBookManager](self, "addressBookManager"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1005CE440;
      v8[3] = &unk_1011BD000;
      objc_copyWeak(&v10, &location);
      v11 = v4;
      v8[4] = self;
      v9 = v6;
      objc_msgSend(v7, "performBlockAfterFirstCollection:", v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

- (id)cachedObjectWithType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = *(_QWORD *)&a3;
  if (+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed")
    && -[ClientTypeResolverPersonalizedItemSource homeAndWorkEnabled](self, "homeAndWorkEnabled")
    && -[ClientTypeResolverSource typeIsValid:](self, "typeIsValid:", v3))
  {
    switch((_DWORD)v3)
    {
      case 6:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource addressBookManager](self, "addressBookManager"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "meCardSchoolAddress"));

        if (!v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource locationOfInterestManager](self, "locationOfInterestManager"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "schoolLOIs"));
          goto LABEL_16;
        }
LABEL_14:
        v13 = v6;
        v9 = v13;
LABEL_17:

        return v9;
      case 2:
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource addressBookManager](self, "addressBookManager"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "meCardWorkAddress"));

        if (!v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource locationOfInterestManager](self, "locationOfInterestManager"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workLOIs"));
          goto LABEL_16;
        }
        goto LABEL_14;
      case 1:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource addressBookManager](self, "addressBookManager"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "meCardHomeAddress"));

        if (!v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource locationOfInterestManager](self, "locationOfInterestManager"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeLOIs"));
LABEL_16:
          v14 = v8;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

          v13 = 0;
          goto LABEL_17;
        }
        goto LABEL_14;
    }
  }
  v9 = 0;
  return v9;
}

- (id)cachedAddressWithType:(int)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource cachedObjectWithType:](self, "cachedObjectWithType:", *(_QWORD *)&a3));
  v4 = objc_opt_class(AddressBookAddress);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)cachedLOIWithType:(int)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolverPersonalizedItemSource cachedObjectWithType:](self, "cachedObjectWithType:", *(_QWORD *)&a3));
  v4 = objc_opt_class(RTLocationOfInterest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (void)addressOrLOIWithType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1005CEBB8;
    v8[3] = &unk_1011BD028;
    v9 = v6;
    -[ClientTypeResolverPersonalizedItemSource objectWithType:completion:](self, "objectWithType:completion:", v4, v8);

  }
}

- (AddressBookManager)addressBookManager
{
  return self->_addressBookManager;
}

- (void)setAddressBookManager:(id)a3
{
  objc_storeStrong((id *)&self->_addressBookManager, a3);
}

- (CoreRoutineLocationOfInterestManager)locationOfInterestManager
{
  return self->_locationOfInterestManager;
}

- (void)setLocationOfInterestManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterestManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterestManager, 0);
  objc_storeStrong((id *)&self->_addressBookManager, 0);
}

@end
