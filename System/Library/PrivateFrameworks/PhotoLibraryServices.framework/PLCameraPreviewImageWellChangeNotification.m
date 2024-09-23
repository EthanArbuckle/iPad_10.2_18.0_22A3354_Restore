@implementation PLCameraPreviewImageWellChangeNotification

- (PLCameraPreviewImageWellChangeNotification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCameraPreviewImageWellChangeNotification;
  return -[PLCameraPreviewImageWellChangeNotification init](&v3, sel_init);
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PLCameraPreviewImageWellChanged");
  return CFSTR("PLCameraPreviewImageWellChanged");
}

- (id)userInfo
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (id)object
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> asset: %@"), objc_opt_class(), self, self->_uuid);
}

- (UIImage)image
{
  UIImage *image;
  UIImage *v4;
  UIImage *v5;

  image = self->_image;
  if (!image)
  {
    objc_msgSend(MEMORY[0x1E0D73140], "cameraPreviewWellImage");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (NSString)assetUUID
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (id)_init
{
  NSString *v3;
  NSString *uuid;

  PLCameraPreviewWellAssetUUIDFromPersistedFile();
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v3;

  return self;
}

+ (id)notification
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

@end
