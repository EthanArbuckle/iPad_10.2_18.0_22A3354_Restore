@implementation PKRemoteImage

- (PKRemoteImage)initWithDictionary:(id)a3
{
  id v4;
  PKRemoteImage *v5;
  uint64_t v6;
  NSURL *remoteURL;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteImage;
  v5 = -[PKRemoteImage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKURLForKey:", CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("scale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scaleFactor = PKRemoteImageScaleFactorFromString(v8);

    objc_msgSend(v4, "PKNumberForKey:", CFSTR("width"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_width = PKRemoteImageDimensionFromValue(v9);

    objc_msgSend(v4, "PKNumberForKey:", CFSTR("height"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_height = PKRemoteImageDimensionFromValue(v10);

  }
  return v5;
}

- (PKRemoteImage)initWithRemoteURL:(id)a3 scaleFactor:(unint64_t)a4
{
  return -[PKRemoteImage initWithRemoteURL:scaleFactor:width:height:](self, "initWithRemoteURL:scaleFactor:width:height:", a3, a4, -1.79769313e308, -1.79769313e308);
}

- (PKRemoteImage)initWithRemoteURL:(id)a3 scaleFactor:(unint64_t)a4 width:(double)a5 height:(double)a6
{
  id v11;
  PKRemoteImage *v12;
  PKRemoteImage *v13;
  PKRemoteImage *v14;
  objc_super v16;

  v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKRemoteImage;
  v12 = -[PKRemoteImage init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    if (!v11)
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_remoteURL, a3);
    v13->_scaleFactor = a4;
    v13->_width = a5;
    v13->_height = a6;
  }
  v14 = v13;
LABEL_6:

  return v14;
}

- (void)fetchImageWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  double v6;
  void *v7;
  void *v8;
  PKImage *v9;
  NSURL *remoteURL;
  _QWORD v11[4];
  void (**v12)(_QWORD, _QWORD);
  double v13;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (v4)
  {
    if (self->_remoteURL)
    {
      if (self->_scaleFactor == 3)
        v6 = 3.0;
      else
        v6 = 2.0;
      +[PKObjectDownloader sharedImageAssetDownloader](PKObjectDownloader, "sharedImageAssetDownloader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cachedDataForURL:", self->_remoteURL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[PKImage initWithData:scale:]([PKImage alloc], "initWithData:scale:", v8, v6);
        ((void (**)(_QWORD, PKImage *))v5)[2](v5, v9);

      }
      else
      {
        remoteURL = self->_remoteURL;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __42__PKRemoteImage_fetchImageWithCompletion___block_invoke;
        v11[3] = &unk_1E2ADA440;
        v12 = v5;
        v13 = v6;
        objc_msgSend(v7, "downloadFromUrl:completionHandler:", remoteURL, v11);

      }
    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __42__PKRemoteImage_fetchImageWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  PKImage *v7;

  if (a2)
  {
    if (!a4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = a2;
      v7 = -[PKImage initWithData:scale:]([PKImage alloc], "initWithData:scale:", v6, *(double *)(a1 + 40));

      (*(void (**)(uint64_t, PKImage *))(v5 + 16))(v5, v7);
    }
  }
}

- (id)description
{
  void *v3;
  unint64_t scaleFactor;
  const __CFString *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("remoteURL: '%@'; "), self->_remoteURL);
  scaleFactor = self->_scaleFactor;
  if (scaleFactor > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2ADA460[scaleFactor];
  objc_msgSend(v3, "appendFormat:", CFSTR("scale: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("width: '%f'; "), *(_QWORD *)&self->_width);
  objc_msgSend(v3, "appendFormat:", CFSTR("height: '%f'; "), *(_QWORD *)&self->_height);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKRemoteImage *v4;
  PKRemoteImage *v5;
  BOOL v6;

  v4 = (PKRemoteImage *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRemoteImage isEqualToRemoteImage:](self, "isEqualToRemoteImage:", v5);

  return v6;
}

- (BOOL)isEqualToRemoteImage:(id)a3
{
  double *v4;
  NSURL *remoteURL;
  NSURL *v6;
  BOOL v7;
  BOOL v8;

  v4 = (double *)a3;
  if (!v4)
    goto LABEL_13;
  remoteURL = self->_remoteURL;
  v6 = (NSURL *)*((_QWORD *)v4 + 1);
  if (remoteURL)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (remoteURL == v6)
      goto LABEL_10;
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if ((-[NSURL isEqual:](remoteURL, "isEqual:") & 1) == 0)
    goto LABEL_13;
LABEL_10:
  if (self->_scaleFactor != *((_QWORD *)v4 + 2) || self->_width != v4[3])
    goto LABEL_13;
  v8 = self->_height == v4[4];
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_remoteURL);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_scaleFactor - v4 + 32 * v4;
  v6 = (unint64_t)self->_width - v5 + 32 * v5;
  v7 = (unint64_t)self->_height - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteImage)initWithCoder:(id)a3
{
  id v4;
  PKRemoteImage *v5;
  uint64_t v6;
  NSURL *remoteURL;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteImage;
  v5 = -[PKRemoteImage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scaleFactor = PKRemoteImageScaleFactorFromString(v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("width"));
    v5->_width = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
    v5->_height = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *remoteURL;
  unint64_t scaleFactor;
  const __CFString *v6;
  id v7;

  remoteURL = self->_remoteURL;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", remoteURL, CFSTR("url"));
  scaleFactor = self->_scaleFactor;
  if (scaleFactor > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ADA460[scaleFactor];
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("scale"));
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("width"), self->_width);
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("height"), self->_height);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSURL copyWithZone:](self->_remoteURL, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_QWORD *)(v5 + 16) = self->_scaleFactor;
  *(double *)(v5 + 24) = self->_width;
  *(double *)(v5 + 32) = self->_height;
  return (id)v5;
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
  objc_storeStrong((id *)&self->_remoteURL, a3);
}

- (unint64_t)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unint64_t)a3
{
  self->_scaleFactor = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteURL, 0);
}

@end
