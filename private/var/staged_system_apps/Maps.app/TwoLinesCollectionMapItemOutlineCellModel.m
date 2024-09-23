@implementation TwoLinesCollectionMapItemOutlineCellModel

- (id)homeActionObject
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesCollectionMapItemOutlineCellModel mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_geoMapItem"));

  return v3;
}

- (TwoLinesCollectionMapItemOutlineCellModel)initWithMapItem:(id)a3 currentLocation:(id)a4 distanceUnit:(int64_t)a5 backgroundModel:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TwoLinesCollectionMapItemOutlineCellModel *v15;
  TwoLinesCollectionMapItemOutlineCellModel *v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v11 = a3;
  v12 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100BFF480;
  v19[3] = &unk_1011E9010;
  v13 = v11;
  v20 = v13;
  v14 = v12;
  v21 = v14;
  v18.receiver = self;
  v18.super_class = (Class)TwoLinesCollectionMapItemOutlineCellModel;
  v15 = -[TwoLinesBasicOutlineCellModel initWithBackgroundModel:contentModelBlock:](&v18, "initWithBackgroundModel:contentModelBlock:", a6, v19);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mapItem, a3);
    objc_storeStrong((id *)&v16->_currentLocation, a4);
    v16->_distanceUnit = a5;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = (unint64_t)-[MKMapItem hash](self->_mapItem, "hash");
  v4 = (unint64_t)-[GEOLocation hash](self->_currentLocation, "hash") ^ v3;
  return v4 ^ -[SidebarOutlineCellBackgroundModel hash](self->super._backgroundModel, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesCollectionMapItemOutlineCellModel *v4;
  TwoLinesCollectionMapItemOutlineCellModel *v5;
  uint64_t v6;
  TwoLinesCollectionMapItemOutlineCellModel *v7;
  MKMapItem *v8;
  MKMapItem *v9;
  GEOLocation *v10;
  GEOLocation *v11;
  BOOL v12;
  objc_super v14;

  v4 = (TwoLinesCollectionMapItemOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v14.receiver = self;
    v14.super_class = (Class)TwoLinesCollectionMapItemOutlineCellModel;
    if (-[TwoLinesBasicOutlineCellModel isEqual:](&v14, "isEqual:", v7))
    {
      v8 = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[TwoLinesCollectionMapItemOutlineCellModel mapItem](v7, "mapItem"));
      v9 = v8;
      if (v8 == self->_mapItem || -[MKMapItem isEqual:](v8, "isEqual:"))
      {
        v10 = (GEOLocation *)objc_claimAutoreleasedReturnValue(-[TwoLinesCollectionMapItemOutlineCellModel currentLocation](v7, "currentLocation"));
        v11 = v10;
        v12 = (v10 == self->_currentLocation || -[GEOLocation isEqual:](v10, "isEqual:"))
           && -[TwoLinesCollectionMapItemOutlineCellModel distanceUnit](v7, "distanceUnit") == self->_distanceUnit;

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (int64_t)distanceUnit
{
  return self->_distanceUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
