@implementation PBUIWallpaperImage

- (PBUIWallpaperImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5 wallpaperFileURL:(id)a6
{
  id v11;
  PBUIWallpaperImage *v12;
  PBUIWallpaperImage *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperImage;
  v12 = -[PBUIWallpaperImage initWithCGImage:scale:orientation:](&v15, sel_initWithCGImage_scale_orientation_, a3, a5, a4);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_wallpaperFileURL, a6);

  return v13;
}

- (PBUIWallpaperImage)initWithFlatColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  void *v13;
  id v14;
  PBUIWallpaperImage *v15;

  v4 = (void *)MEMORY[0x1E0CEA950];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "scale");
  v12 = v11;
  PBUIWallpaperImageWithFlatColor(v5, v8, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = -[PBUIWallpaperImage initWithCGImage:scale:orientation:wallpaperFileURL:](self, "initWithCGImage:scale:orientation:wallpaperFileURL:", objc_msgSend(v14, "CGImage"), 0, 0, v12);

  return v15;
}

- (PBUIWallpaperImage)initWithFlatColor:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  id v7;
  PBUIWallpaperImage *v8;

  PBUIWallpaperImageWithFlatColor(a3, a4.width, a4.height, a5);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = -[PBUIWallpaperImage initWithCGImage:scale:orientation:wallpaperFileURL:](self, "initWithCGImage:scale:orientation:wallpaperFileURL:", objc_msgSend(v7, "CGImage"), 0, 0, a5);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "wallpaperFileURL"),
        v5 = objc_claimAutoreleasedReturnValue(),
        (uint64_t)self->_wallpaperFileURL | v5))
  {
    v6 = BSEqualObjects();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBUIWallpaperImage;
    v6 = -[PBUIWallpaperImage isEqual:](&v8, sel_isEqual_, v4);
  }

  return v6;
}

- (unint64_t)hash
{
  objc_super v3;

  if (self->_wallpaperFileURL)
    return -[NSURL hash](self->_wallpaperFileURL, "hash");
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperImage;
  return -[PBUIWallpaperImage hash](&v3, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIWallpaperImage;
  v4 = a3;
  -[PBUIWallpaperImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_wallpaperFileURL, CFSTR("wallpaperFileURL"), v5.receiver, v5.super_class);

}

- (PBUIWallpaperImage)initWithCoder:(id)a3
{
  id v4;
  PBUIWallpaperImage *v5;
  uint64_t v6;
  NSURL *wallpaperFileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIWallpaperImage;
  v5 = -[PBUIWallpaperImage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wallpaperFileURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    wallpaperFileURL = v5->_wallpaperFileURL;
    v5->_wallpaperFileURL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)wallpaperFileURL
{
  return self->_wallpaperFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperFileURL, 0);
}

@end
