@implementation RAPPhotoWithMetadata

- (RAPPhotoWithMetadata)initWithRAPPhoto:(id)a3 photoType:(int64_t)a4
{
  RAPPhotoWithMetadata *result;

  result = -[RAPPhotoWithMetadata initWithRAPPhoto:](self, "initWithRAPPhoto:", a3);
  if (result)
    result->_photoType = a4;
  return result;
}

- (RAPPhotoWithMetadata)initWithRAPPhoto:(id)a3
{
  id v4;
  RAPPhotoWithMetadata *v5;
  UIImage *v6;
  NSData *v7;
  uint64_t v8;
  NSData *rawImageData;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  GEORPPhotoMetadata *v14;
  GEORPPhotoMetadata *photoMetadata;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RAPPhotoWithMetadata;
  v5 = -[RAPPhotoWithMetadata init](&v17, "init");
  if (v5)
  {
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photo"));
    v7 = UIImageJPEGRepresentation(v6, 0.400000006);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    rawImageData = v5->_rawImageData;
    v5->_rawImageData = (NSData *)v8;

    v10 = objc_alloc((Class)GEORPPhotoMetadata);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v14 = (GEORPPhotoMetadata *)objc_msgSend(v10, "initWithUUID:location:", v12, v13);
    photoMetadata = v5->_photoMetadata;
    v5->_photoMetadata = v14;

  }
  return v5;
}

- (void)anonymizeLocation
{
  -[GEORPPhotoMetadata setGeotag:](self->_photoMetadata, "setGeotag:", 0);
}

- (RAPPhotoWithMetadata)initWithCoder:(id)a3
{
  id v4;
  RAPPhotoWithMetadata *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSData *rawImageData;
  uint64_t v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  GEORPPhotoMetadata *photoMetadata;
  uint64_t v16;
  NSString *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RAPPhotoWithMetadata;
  v5 = -[RAPPhotoWithMetadata init](&v21, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSData);
    v7 = NSStringFromSelector("rawImageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v8));
    rawImageData = v5->_rawImageData;
    v5->_rawImageData = (NSData *)v9;

    v11 = objc_opt_class(GEORPPhotoMetadata);
    v12 = NSStringFromSelector("photoMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v13));
    photoMetadata = v5->_photoMetadata;
    v5->_photoMetadata = (GEORPPhotoMetadata *)v14;

    v16 = objc_opt_class(NSNumber);
    v17 = NSStringFromSelector("photoType");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v18));

    v5->_photoType = (int64_t)objc_msgSend(v19, "integerValue");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *rawImageData;
  id v5;
  NSString *v6;
  void *v7;
  GEORPPhotoMetadata *photoMetadata;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;

  rawImageData = self->_rawImageData;
  v5 = a3;
  v6 = NSStringFromSelector("rawImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "encodeObject:forKey:", rawImageData, v7);

  photoMetadata = self->_photoMetadata;
  v9 = NSStringFromSelector("photoMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v5, "encodeObject:forKey:", photoMetadata, v10);

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_photoType));
  v11 = NSStringFromSelector("photoType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v5, "encodeObject:forKey:", v13, v12);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hasRawImageData : %d \n photoMetadata : %@ \n photoType : %lu"), self->_rawImageData != 0, self->_photoMetadata, self->_photoType);
}

- (NSData)rawImageData
{
  return self->_rawImageData;
}

- (int64_t)photoType
{
  return self->_photoType;
}

- (GEORPPhotoMetadata)photoMetadata
{
  return self->_photoMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMetadata, 0);
  objc_storeStrong((id *)&self->_rawImageData, 0);
}

@end
