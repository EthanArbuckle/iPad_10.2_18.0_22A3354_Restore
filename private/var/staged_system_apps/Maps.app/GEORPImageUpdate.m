@implementation GEORPImageUpdate

- (NSUUID)comparisonIdentifier
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPImageUpdate photoMetadata](self, "photoMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientImageUuid"));
  v6 = objc_msgSend(v3, "initWithUUIDString:", v5);

  return (NSUUID *)v6;
}

+ (id)newImageUpdateWithImageId:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)GEORPImageUpdate);
  objc_msgSend(v4, "setAction:", 1);
  objc_msgSend(v4, "setImageId:", v3);

  return v4;
}

+ (id)newImageUpdateWithImageId:(id)a3 photoMetadata:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = +[GEORPImageUpdate newImageUpdateWithImageId:](GEORPImageUpdate, "newImageUpdateWithImageId:", a3);
  objc_msgSend(v6, "setPhotoMetadata:", v5);

  return v6;
}

+ (id)newImageUpdateWithClientImageId:(id)a3 responseData:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = +[GEORPImageUpdate newImageUpdateWithImageId:](GEORPImageUpdate, "newImageUpdateWithImageId:", 0);
  objc_msgSend(v7, "setUploadResponse:", v5);

  v8 = objc_alloc_init((Class)GEORPPhotoMetadata);
  objc_msgSend(v8, "setClientImageUuid:", v6);

  objc_msgSend(v7, "setPhotoMetadata:", v8);
  return v7;
}

+ (id)deleteImageUpdateWithImageId:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)GEORPImageUpdate);
  objc_msgSend(v4, "setAction:", 2);
  objc_msgSend(v4, "setImageId:", v3);

  return v4;
}

+ (id)unmodifiedImageUpdateWithImageId:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)GEORPImageUpdate);
  objc_msgSend(v4, "setAction:", 3);
  objc_msgSend(v4, "setImageId:", v3);

  return v4;
}

@end
