@implementation GEORPPhotoMetadata

- (GEORPPhotoMetadata)initWithUUID:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  GEORPPhotoMetadata *v8;
  GEORPPhotoMetadata *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  objc_super v17;
  CLLocationCoordinate2D v18;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEORPPhotoMetadata;
  v8 = -[GEORPPhotoMetadata init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    -[GEORPPhotoMetadata setClientImageUuid:](v8, "setClientImageUuid:", v6);
    if (v7)
    {
      objc_msgSend(v7, "coordinate");
      if (CLLocationCoordinate2DIsValid(v18))
      {
        v10 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v7);
        -[GEORPPhotoMetadata setGeotag:](v9, "setGeotag:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timestamp"));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timestamp"));
          objc_msgSend(v12, "timeIntervalSinceReferenceDate");
          v14 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPPhotoMetadata geotag](v9, "geotag"));
          objc_msgSend(v15, "setTimestamp:", v14);

        }
      }
    }
  }

  return v9;
}

@end
