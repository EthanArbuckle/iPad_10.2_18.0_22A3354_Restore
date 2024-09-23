@implementation TPSAssets

uint64_t __24__TPSAssets_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageId");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fallbackId");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "videoId");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterId");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caption");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alt");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gradient");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "baseURL");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "symbolSize");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "symbolColor");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "symbolId");
}

uint64_t __24__TPSAssets_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "thumbnailId");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TPSAssets;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  -[TPSAssets alt](self, "alt", v17.receiver, v17.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("alt"));

  -[TPSAssets caption](self, "caption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("caption"));

  -[TPSAssets posterId](self, "posterId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("posterId"));

  -[TPSAssets thumbnailId](self, "thumbnailId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("thumbnailId"));

  -[TPSAssets videoId](self, "videoId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("videoId"));

  -[TPSAssets fallbackId](self, "fallbackId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("fallbackId"));

  -[TPSAssets imageId](self, "imageId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("imageId"));

  -[TPSAssets symbolId](self, "symbolId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("stringId"));

  -[TPSAssets symbolColor](self, "symbolColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("color"));

  -[TPSAssets symbolSize](self, "symbolSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("size"));

  -[TPSAssets baseURL](self, "baseURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("baseURL"));

  -[TPSAssets gradient](self, "gradient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("gradient"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TPSAssets;
  v4 = -[TPSSerializableObject copyWithZone:](&v18, sel_copyWithZone_, a3);
  -[TPSAssets alt](self, "alt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlt:", v5);

  -[TPSAssets caption](self, "caption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaption:", v6);

  -[TPSAssets posterId](self, "posterId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosterId:", v7);

  -[TPSAssets thumbnailId](self, "thumbnailId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumbnailId:", v8);

  -[TPSAssets videoId](self, "videoId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVideoId:", v9);

  -[TPSAssets fallbackId](self, "fallbackId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFallbackId:", v10);

  -[TPSAssets imageId](self, "imageId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageId:", v11);

  -[TPSAssets symbolId](self, "symbolId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSymbolId:", v12);

  -[TPSAssets symbolColor](self, "symbolColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSymbolColor:", v13);

  -[TPSAssets symbolSize](self, "symbolSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSymbolSize:", v14);

  -[TPSAssets baseURL](self, "baseURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseURL:", v15);

  -[TPSAssets gradient](self, "gradient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGradient:", v16);

  return v4;
}

- (NSString)symbolId
{
  return self->_symbolId;
}

- (TPSGradient)gradient
{
  return self->_gradient;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSString)videoId
{
  return self->_videoId;
}

- (NSString)posterId
{
  return self->_posterId;
}

- (NSString)thumbnailId
{
  return self->_thumbnailId;
}

- (NSString)symbolSize
{
  return self->_symbolSize;
}

- (NSString)symbolColor
{
  return self->_symbolColor;
}

- (NSString)imageId
{
  return self->_imageId;
}

- (NSString)fallbackId
{
  return self->_fallbackId;
}

- (NSString)caption
{
  return self->_caption;
}

- (NSString)alt
{
  return self->_alt;
}

- (void)setVideoId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setThumbnailId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSymbolSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setSymbolId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSymbolColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPosterId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setImageId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setGradient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setFallbackId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAlt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (id)assetsFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeDictionaryForKey:", CFSTR("assets"));
}

- (TPSAssets)initWithCoder:(id)a3
{
  id v4;
  TPSAssets *v5;
  uint64_t v6;
  NSString *alt;
  uint64_t v8;
  NSString *caption;
  uint64_t v10;
  NSString *posterId;
  uint64_t v12;
  NSString *thumbnailId;
  uint64_t v14;
  NSString *videoId;
  uint64_t v16;
  NSString *fallbackId;
  uint64_t v18;
  NSString *imageId;
  uint64_t v20;
  NSString *symbolId;
  uint64_t v22;
  NSString *symbolColor;
  uint64_t v24;
  NSString *symbolSize;
  uint64_t v26;
  NSURL *baseURL;
  uint64_t v28;
  TPSGradient *gradient;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TPSAssets;
  v5 = -[TPSSerializableObject initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alt"));
    v6 = objc_claimAutoreleasedReturnValue();
    alt = v5->_alt;
    v5->_alt = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caption"));
    v8 = objc_claimAutoreleasedReturnValue();
    caption = v5->_caption;
    v5->_caption = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("posterId"));
    v10 = objc_claimAutoreleasedReturnValue();
    posterId = v5->_posterId;
    v5->_posterId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailId"));
    v12 = objc_claimAutoreleasedReturnValue();
    thumbnailId = v5->_thumbnailId;
    v5->_thumbnailId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoId"));
    v14 = objc_claimAutoreleasedReturnValue();
    videoId = v5->_videoId;
    v5->_videoId = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackId"));
    v16 = objc_claimAutoreleasedReturnValue();
    fallbackId = v5->_fallbackId;
    v5->_fallbackId = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageId"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageId = v5->_imageId;
    v5->_imageId = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringId"));
    v20 = objc_claimAutoreleasedReturnValue();
    symbolId = v5->_symbolId;
    v5->_symbolId = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v22 = objc_claimAutoreleasedReturnValue();
    symbolColor = v5->_symbolColor;
    v5->_symbolColor = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v24 = objc_claimAutoreleasedReturnValue();
    symbolSize = v5->_symbolSize;
    v5->_symbolSize = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v26 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradient"));
    v28 = objc_claimAutoreleasedReturnValue();
    gradient = v5->_gradient;
    v5->_gradient = (TPSGradient *)v28;

  }
  return v5;
}

- (TPSAssets)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  TPSAssets *v8;
  uint64_t v9;
  NSURL *baseURL;
  void *v11;
  uint64_t v12;
  void *imageId;
  uint64_t v14;
  NSString *symbolId;
  uint64_t v16;
  NSString *symbolColor;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *caption;
  uint64_t v24;
  NSString *posterId;
  uint64_t v26;
  NSString *thumbnailId;
  uint64_t v28;
  NSString *videoId;
  uint64_t v30;
  NSString *fallbackId;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSString *alt;
  TPSGradient *v36;
  TPSGradient *gradient;
  TPSAssets *v38;
  objc_super v40;

  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)TPSAssets;
  v8 = -[TPSSerializableObject initWithDictionary:](&v40, sel_initWithDictionary_, v6);
  if (!v8)
    goto LABEL_15;
  objc_msgSend(v7, "assetBaseURL");
  v9 = objc_claimAutoreleasedReturnValue();
  baseURL = v8->_baseURL;
  v8->_baseURL = (NSURL *)v9;

  objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("attrs"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_17:

      v38 = 0;
      goto LABEL_16;
    }
    imageId = (void *)v12;
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("symbol")))
    {
      objc_msgSend(imageId, "TPSSafeStringForKey:", CFSTR("stringId"));
      v14 = objc_claimAutoreleasedReturnValue();
      symbolId = v8->_symbolId;
      v8->_symbolId = (NSString *)v14;

      objc_msgSend(imageId, "TPSSafeStringForKey:", CFSTR("color"));
      v16 = objc_claimAutoreleasedReturnValue();
      symbolColor = v8->_symbolColor;
      v8->_symbolColor = (NSString *)v16;

      objc_msgSend(imageId, "TPSSafeStringForKey:", CFSTR("size"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = 88;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("inlineIcon")))
      {
LABEL_10:
        objc_msgSend(imageId, "TPSSafeStringForKey:", CFSTR("alt"));
        v34 = objc_claimAutoreleasedReturnValue();
        alt = v8->_alt;
        v8->_alt = (NSString *)v34;

        v36 = -[TPSGradient initWithDictionary:]([TPSGradient alloc], "initWithDictionary:", imageId);
        gradient = v8->_gradient;
        v8->_gradient = v36;

        goto LABEL_11;
      }
      -[TPSAssets identifierForKey:dictionary:](v8, "identifierForKey:dictionary:", CFSTR("imageId"), imageId);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = 64;
    }
    v33 = *(Class *)((char *)&v8->super.super.isa + v19);
    *(Class *)((char *)&v8->super.super.isa + v19) = (Class)v18;

    goto LABEL_10;
  }
  objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("alt"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v8->_alt;
  v8->_alt = (NSString *)v20;

  objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("caption"));
  v22 = objc_claimAutoreleasedReturnValue();
  caption = v8->_caption;
  v8->_caption = (NSString *)v22;

  -[TPSAssets identifierForKey:dictionary:](v8, "identifierForKey:dictionary:", CFSTR("posterId"), v6);
  v24 = objc_claimAutoreleasedReturnValue();
  posterId = v8->_posterId;
  v8->_posterId = (NSString *)v24;

  -[TPSAssets identifierForKey:dictionary:](v8, "identifierForKey:dictionary:", CFSTR("thumbnailId"), v6);
  v26 = objc_claimAutoreleasedReturnValue();
  thumbnailId = v8->_thumbnailId;
  v8->_thumbnailId = (NSString *)v26;

  -[TPSAssets identifierForKey:dictionary:](v8, "identifierForKey:dictionary:", CFSTR("videoId"), v6);
  v28 = objc_claimAutoreleasedReturnValue();
  videoId = v8->_videoId;
  v8->_videoId = (NSString *)v28;

  -[TPSAssets identifierForKey:dictionary:](v8, "identifierForKey:dictionary:", CFSTR("fallbackId"), v6);
  v30 = objc_claimAutoreleasedReturnValue();
  fallbackId = v8->_fallbackId;
  v8->_fallbackId = (NSString *)v30;

  -[TPSAssets identifierForKey:dictionary:](v8, "identifierForKey:dictionary:", CFSTR("imageId"), v6);
  v32 = objc_claimAutoreleasedReturnValue();
  imageId = v8->_imageId;
  v8->_imageId = (NSString *)v32;
LABEL_11:

  if (!-[TPSAssets hasImage](v8, "hasImage") && !-[TPSAssets hasVideo](v8, "hasVideo") && !v8->_thumbnailId)
    goto LABEL_17;

LABEL_15:
  v38 = v8;
LABEL_16:

  return v38;
}

- (id)identifierForKey:(id)a3 dictionary:(id)a4
{
  void *v4;

  objc_msgSend(a4, "TPSSafeStringForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {

    v4 = 0;
  }
  return v4;
}

- (BOOL)hasImage
{
  return -[NSString length](self->_posterId, "length")
      || -[NSString length](self->_imageId, "length")
      || -[NSString length](self->_fallbackId, "length")
      || -[NSString length](self->_symbolId, "length") != 0;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

id __24__TPSAssets_na_identity__block_invoke()
{
  if (TPSAssetsGradientKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSAssetsGradientKey_block_invoke_na_once_token_0, &__block_literal_global_36);
  return (id)TPSAssetsGradientKey_block_invoke_na_once_object_0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_symbolSize, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_symbolId, 0);
  objc_storeStrong((id *)&self->_imageId, 0);
  objc_storeStrong((id *)&self->_fallbackId, 0);
  objc_storeStrong((id *)&self->_videoId, 0);
  objc_storeStrong((id *)&self->_thumbnailId, 0);
  objc_storeStrong((id *)&self->_posterId, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_alt, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __24__TPSAssets_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __24__TPSAssets_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSAssetsGradientKey_block_invoke_na_once_object_0;
  TPSAssetsGradientKey_block_invoke_na_once_object_0 = v0;

}

id __24__TPSAssets_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_41);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_42);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_43);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_44);
  v5 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_45);
  v6 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_46);
  v7 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_47);
  v8 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_48);
  v9 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_49_0);
  v10 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_50);
  v11 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_52);
  v12 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_54_0);
  objc_msgSend(v0, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (TPSAssets)initWithSymbolId:(id)a3 symbolColor:(id)a4 symbolSize:(id)a5 alt:(id)a6 gradientColorStrings:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAssets *v17;
  TPSAssets *v18;
  TPSGradient *v19;
  TPSGradient *gradient;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TPSAssets;
  v17 = -[TPSAssets init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_symbolId, a3);
    objc_storeStrong((id *)&v18->_symbolColor, a4);
    objc_storeStrong((id *)&v18->_symbolSize, a5);
    objc_storeStrong((id *)&v18->_alt, a6);
    v19 = -[TPSGradient initWithColorStrings:]([TPSGradient alloc], "initWithColorStrings:", v16);
    gradient = v18->_gradient;
    v18->_gradient = v19;

  }
  return v18;
}

- (id)imageIdentifier
{
  NSString *posterId;
  NSString *v3;

  posterId = self->_posterId;
  if (!posterId)
  {
    v3 = self->_imageId;
    if (v3)
      return v3;
    posterId = self->_fallbackId;
  }
  v3 = posterId;
  return v3;
}

- (BOOL)hasVideo
{
  void *v2;
  BOOL v3;

  -[TPSAssets videoId](self, "videoId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v32.receiver = self;
  v32.super_class = (Class)TPSAssets;
  -[TPSSerializableObject debugDescription](&v32, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSAssets alt](self, "alt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSAssets alt](self, "alt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("alt"), v7);

  }
  -[TPSAssets caption](self, "caption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TPSAssets caption](self, "caption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("caption"), v9);

  }
  -[TPSAssets posterId](self, "posterId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TPSAssets posterId](self, "posterId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("posterId"), v11);

  }
  -[TPSAssets thumbnailId](self, "thumbnailId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSAssets thumbnailId](self, "thumbnailId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("thumbnailId"), v13);

  }
  -[TPSAssets videoId](self, "videoId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TPSAssets videoId](self, "videoId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("videoId"), v15);

  }
  -[TPSAssets fallbackId](self, "fallbackId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TPSAssets fallbackId](self, "fallbackId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("fallbackId"), v17);

  }
  -[TPSAssets imageId](self, "imageId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[TPSAssets imageId](self, "imageId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("imageId"), v19);

  }
  -[TPSAssets symbolId](self, "symbolId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[TPSAssets symbolId](self, "symbolId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("stringId"), v21);

  }
  -[TPSAssets symbolColor](self, "symbolColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[TPSAssets symbolColor](self, "symbolColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("color"), v23);

  }
  -[TPSAssets symbolColor](self, "symbolColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[TPSAssets symbolSize](self, "symbolSize");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("size"), v25);

  }
  -[TPSAssets baseURL](self, "baseURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[TPSAssets baseURL](self, "baseURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("baseURL"), v27);

  }
  -[TPSAssets gradient](self, "gradient");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[TPSAssets gradient](self, "gradient");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "debugDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("gradient"), v30);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

@end
