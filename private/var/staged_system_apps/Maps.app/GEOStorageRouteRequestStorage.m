@implementation GEOStorageRouteRequestStorage

- (GEOComposedGeometryRoutePersistentData)destinationRouteData
{
  void *v3;
  id AssociatedObject;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStorageRouteRequestStorage destinationPersistentData](self, "destinationPersistentData"));
  if (v3)
  {
    AssociatedObject = objc_getAssociatedObject(self, "destinationRouteData");
    v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      v11 = 0;
      v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GEOComposedGeometryRoutePersistentData), v3, &v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = v11;
      objc_setAssociatedObject(self, "destinationRouteData", v8, (void *)1);
      v6 = v8;

    }
  }
  else
  {
    v6 = 0;
  }

  return (GEOComposedGeometryRoutePersistentData *)v6;
}

- (void)setDestinationRouteData:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v6));
  v5 = v6;
  -[GEOStorageRouteRequestStorage setDestinationPersistentData:](self, "setDestinationPersistentData:", v4);
  objc_setAssociatedObject(self, "destinationRouteData", 0, (void *)1);

}

@end
