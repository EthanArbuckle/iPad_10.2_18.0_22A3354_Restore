@implementation PKAddPassMetadataPreview

+ (id)previewWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPassThumbnail:localizedDescription:", a3, v5);

  return v6;
}

- (PKAddPassMetadataPreview)initWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4
{
  id v7;
  PKAddPassMetadataPreview *v8;
  PKAddPassMetadataPreview *v9;

  v7 = a4;
  v8 = -[PKAddPassMetadataPreview init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[PKAddPassMetadataPreview setPassThumbnailImage:](v8, "setPassThumbnailImage:", a3);
    objc_storeStrong((id *)&v9->_localizedDescription, a4);
  }

  return v9;
}

- (CGImage)passThumbnailImage
{
  return -[PKImage imageRef](self->_pkPassThumbnailImage, "imageRef");
}

- (void)setPassThumbnailImage:(CGImage *)a3
{
  PKImage *v4;
  PKImage *pkPassThumbnailImage;

  if (a3)
  {
    v4 = -[PKImage initWithCGImage:scale:orientation:]([PKImage alloc], "initWithCGImage:scale:orientation:", a3, 1, PKScreenScale());
    pkPassThumbnailImage = self->_pkPassThumbnailImage;
    self->_pkPassThumbnailImage = v4;
  }
  else
  {
    pkPassThumbnailImage = self->_pkPassThumbnailImage;
    self->_pkPassThumbnailImage = 0;
  }

}

- (PKAddPassMetadataPreview)initWithCoder:(id)a3
{
  id v4;
  PKAddPassMetadataPreview *v5;
  uint64_t v6;
  PKImage *pkPassThumbnailImage;
  uint64_t v8;
  NSString *localizedDescription;
  uint64_t v10;
  NSURL *thumbnailURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAddPassMetadataPreview;
  v5 = -[PKAddPassMetadataPreview init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    pkPassThumbnailImage = v5->_pkPassThumbnailImage;
    v5->_pkPassThumbnailImage = (PKImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailImageURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSURL *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKImage *pkPassThumbnailImage;
  id v5;

  pkPassThumbnailImage = self->_pkPassThumbnailImage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pkPassThumbnailImage, CFSTR("thumbnailImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailURL, CFSTR("thumbnailImageURL"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddPassMetadataPreview _extendableDescription:](self, "_extendableDescription:", v3);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_extendableDescription:(id)a3
{
  NSString *localizedDescription;
  id v5;

  localizedDescription = self->_localizedDescription;
  v5 = a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("localizedDescription: '%@'; "), localizedDescription);
  objc_msgSend(v5, "appendFormat:", CFSTR("thumbnailURL: '%@'; "), self->_thumbnailURL);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_pkPassThumbnailImage);
  v5 = -[NSString copy](self->_localizedDescription, "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  v7 = -[NSURL copy](self->_thumbnailURL, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  return (id)v4;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (PKImage)pkPassThumbnailImage
{
  return self->_pkPassThumbnailImage;
}

- (void)setPkPassThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_pkPassThumbnailImage, a3);
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_pkPassThumbnailImage, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

@end
