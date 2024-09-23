@implementation RedoSearchMapState

- (RedoSearchMapState)initWithMapRegion:(id)a3 zoomLevel:(double)a4
{
  id v7;
  RedoSearchMapState *v8;
  RedoSearchMapState *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RedoSearchMapState;
  v8 = -[RedoSearchMapState init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapRegion, a3);
    v9->_zoomLevel = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RedoSearchMapState *v4;
  RedoSearchMapState *v5;
  uint64_t v6;
  RedoSearchMapState *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = (RedoSearchMapState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(RedoSearchMapState), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchMapState mapRegion](self, "mapRegion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchMapState mapRegion](v7, "mapRegion"));
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[RedoSearchMapState zoomLevel](self, "zoomLevel");
      v11 = v10;
      -[RedoSearchMapState zoomLevel](v7, "zoomLevel");
      v13 = v11 == v12;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return (unint64_t)-[GEOMapRegion hash](self->_mapRegion, "hash") ^ (unint64_t)self->_zoomLevel;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
{
  self->_zoomLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
}

@end
