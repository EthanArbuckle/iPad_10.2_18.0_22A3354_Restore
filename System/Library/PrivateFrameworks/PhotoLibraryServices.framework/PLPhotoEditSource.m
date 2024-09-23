@implementation PLPhotoEditSource

- (PLPhotoEditSource)initWithURL:(id)a3 type:(id)a4 image:(id)a5 useEmbeddedPreview:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  PLPhotoEditSource *v13;
  PLPhotoEditSource *v14;
  PLPhotoEditSource *v15;
  objc_super v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLPhotoEditSource;
  v13 = -[PLPhotoEditSource init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[PLPhotoEditSource setURL:type:image:useEmbeddedPreview:](v13, "setURL:type:image:useEmbeddedPreview:", v10, v11, v12, v6);
    v15 = v14;
  }

  return v14;
}

- (void)setURL:(id)a3 type:(id)a4 image:(id)a5 useEmbeddedPreview:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id PIPhotoEditHelperClass_72665;
  void *v18;
  id v19;

  v6 = a6;
  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x19AEBFD84](v11);
    if (v13)
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithIOSurface:", v13);
    else
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", DCIM_CGImageRefFromPLImage());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x19AEBFDF0](v12);
    v16 = (int)PLExifOrientationFromImageOrientation();
    PIPhotoEditHelperClass_72665 = getPIPhotoEditHelperClass_72665();
    if (v19)
      objc_msgSend(PIPhotoEditHelperClass_72665, "imageSourceWithURL:type:proxyImage:orientation:useEmbeddedPreview:", v19, v10, v15, v16, v6);
    else
      objc_msgSend(PIPhotoEditHelperClass_72665, "imageSourceWithCIImage:orientation:", v15, v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = -[PLPhotoEditSource newSourceWithURL:type:useEmbeddedPreview:](self, "newSourceWithURL:type:useEmbeddedPreview:", v19, v10, v6);
  }
  -[PLEditSource setResolvedSource:mediaType:](self, "setResolvedSource:mediaType:", v14, 1);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isRAWSource = objc_msgSend(v18, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

  }
  else
  {
    self->_isRAWSource = 0;
  }

}

- (BOOL)isRAWSource
{
  return self->_isRAWSource;
}

- (id)newSourceWithURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(getPIPhotoEditHelperClass_72665(), "imageSourceWithURL:type:useEmbeddedPreview:", v8, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
