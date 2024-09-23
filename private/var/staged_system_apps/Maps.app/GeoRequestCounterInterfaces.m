@implementation GeoRequestCounterInterfaces

- (GeoRequestCounterInterfaces)init
{
  GeoRequestCounterInterfaces *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GeoRequestCounterInterfaces;
  v2 = -[GeoRequestCounterInterfaces init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("_debug_geoReqCountInterfaces")));

    v5 = objc_msgSend(v4, "unsignedIntegerValue");
    v2->_selected = (unint64_t)v5;
    if (!v5)
      v2->_selected = GEORequestCounterInterfaceType_AllMask;

  }
  return v2;
}

- (BOOL)supportsMultipleSelection
{
  return 1;
}

- (id)currentSelectionString
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = GEORequestCounterInterfaceTypesToStrings(self->_selected, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));

  return v4;
}

- (id)currentSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v4 = GEOAllRequestCounterInterfaceTypesCount;
  if (GEOAllRequestCounterInterfaceTypesCount)
  {
    v5 = 0;
    do
    {
      if ((GEOAllRequestCounterInterfaceTypes[v5] & self->_selected) != 0)
        objc_msgSend(v3, "addIndex:", v5);
      ++v5;
    }
    while (v4 != v5);
  }
  return v3;
}

- (id)stringForRow:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = GEORequestCounterInterfaceTypesToStrings(GEOAllRequestCounterInterfaceTypes[a3], a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (void)setSelection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002FA498;
  v8[3] = &unk_1011B10D0;
  v8[4] = &v9;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v8);
  v5 = v10[3];
  self->_selected = v5;
  if (!v5)
    self->_selected = GEORequestCounterInterfaceType_AllMask;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_selected));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("_debug_geoReqCountInterfaces"));

  _Block_object_dispose(&v9, 8);
}

- (int64_t)rowCount
{
  return GEOAllRequestCounterInterfaceTypesCount;
}

- (unint64_t)currentInterfaces
{
  return self->_selected;
}

@end
