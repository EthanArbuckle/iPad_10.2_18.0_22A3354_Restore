@implementation PXPlacesMapLayoutItemImpl

- (PXPlacesMapLayoutItemImpl)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  PXPlacesMapLayoutItemImpl *v5;
  PXPlacesMapLayoutItemImpl *v6;
  void *v7;
  objc_super v9;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapLayoutItemImpl;
  v5 = -[PXPlacesMapLayoutItemImpl init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PXPlacesMapLayoutItemImpl setCoordinate:](v5, "setCoordinate:", latitude, longitude);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapLayoutItemImpl setLayoutGeotaggables:](v6, "setLayoutGeotaggables:", v7);

  }
  return v6;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;

  -[PXPlacesMapLayoutItemImpl coordinate](self, "coordinate");
  v4 = v3;
  -[PXPlacesMapLayoutItemImpl coordinate](self, "coordinate");
  return (unint64_t)fabs(v5 * 1000.0 + v4 * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  PXPlacesMapLayoutItemImpl *v4;
  PXPlacesMapLayoutItemImpl *v5;
  BOOL v6;

  v4 = (PXPlacesMapLayoutItemImpl *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PXPlacesMapLayoutItemImpl isEqualToLayoutItem:](self, "isEqualToLayoutItem:", v5);

  return v6;
}

- (void)addGeotaggable:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->_layoutGeotaggables, "addObject:", a3);
}

- (void)addGeotaggables:(id)a3
{
  -[NSMutableOrderedSet unionOrderedSet:](self->_layoutGeotaggables, "unionOrderedSet:", a3);
}

- (BOOL)isEqualToLayoutItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  -[PXPlacesMapLayoutItemImpl coordinate](self, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  if (vabdd_f64(v6, v7) >= 2.22044605e-16
    || (-[PXPlacesMapLayoutItemImpl coordinate](self, "coordinate"),
        v9 = v8,
        objc_msgSend(v4, "coordinate"),
        vabdd_f64(v9, v10) >= 2.22044605e-16))
  {
    v14 = 0;
  }
  else
  {
    -[PXPlacesMapLayoutItemImpl geotaggables](self, "geotaggables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geotaggables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "count");
    if (v13 == objc_msgSend(v12, "count"))
      v14 = objc_msgSend(v11, "isEqualToOrderedSet:", v12);
    else
      v14 = 0;

  }
  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapLayoutItemImpl;
  -[PXPlacesMapLayoutItemImpl description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR("---------------------\n"));
  -[PXPlacesMapLayoutItemImpl coordinate](self, "coordinate");
  v7 = v6;
  -[PXPlacesMapLayoutItemImpl coordinate](self, "coordinate");
  objc_msgSend(v5, "appendFormat:", CFSTR("- Location: %f, %f:\n"), v7, v8);
  -[PXPlacesMapLayoutItemImpl geotaggables](self, "geotaggables");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("- Geotaggables: %@:\n"), v9);

  return (NSString *)v5;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  _QWORD v4[2];
  CLLocationCoordinate2D result;

  objc_copyStruct(v4, &self->_coordinate, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationCoordinate2D v3;

  v3 = a3;
  objc_copyStruct(&self->_coordinate, &v3, 16, 1, 0);
}

- (NSMutableOrderedSet)layoutGeotaggables
{
  return self->_layoutGeotaggables;
}

- (void)setLayoutGeotaggables:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGeotaggables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGeotaggables, 0);
}

@end
