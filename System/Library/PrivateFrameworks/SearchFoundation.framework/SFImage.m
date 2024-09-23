@implementation SFImage

- (SFImage)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SFURLImage *v7;
  uint64_t v8;
  SFImage *v9;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SFImage *v41;
  void *v42;
  SFImage *v43;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_56;
  }
  objc_msgSend(v4, "urlImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [SFURLImage alloc];
    objc_msgSend(v5, "urlImage");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "contactImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v7 = [SFContactImage alloc];
      objc_msgSend(v5, "contactImage");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "monogramImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v7 = [SFMonogramImage alloc];
        objc_msgSend(v5, "monogramImage");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "localImage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v7 = [SFLocalImage alloc];
          objc_msgSend(v5, "localImage");
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "appIconImage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v7 = [SFAppIconImage alloc];
            objc_msgSend(v5, "appIconImage");
            v8 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v5, "mediaArtworkImage");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              v7 = [SFMediaArtworkImage alloc];
              objc_msgSend(v5, "mediaArtworkImage");
              v8 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v5, "calendarImage");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                v7 = [SFCalendarImage alloc];
                objc_msgSend(v5, "calendarImage");
                v8 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v5, "symbolImage");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  v7 = [SFSymbolImage alloc];
                  objc_msgSend(v5, "symbolImage");
                  v8 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v5, "photosLibraryImage");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v17)
                  {
                    v7 = [SFPhotosLibraryImage alloc];
                    objc_msgSend(v5, "photosLibraryImage");
                    v8 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v5, "quickLookThumbnailImage");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v18)
                    {
                      v7 = [SFQuickLookThumbnailImage alloc];
                      objc_msgSend(v5, "quickLookThumbnailImage");
                      v8 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(v5, "clockImage");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v19)
                      {
                        v7 = [SFClockImage alloc];
                        objc_msgSend(v5, "clockImage");
                        v8 = objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        objc_msgSend(v5, "shortcutsImage");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v20)
                        {
                          v9 = objc_alloc_init(SFImage);

                          if (!v9)
                          {
                            self = 0;
                            goto LABEL_56;
                          }
                          goto LABEL_28;
                        }
                        v7 = [SFShortcutsImage alloc];
                        objc_msgSend(v5, "shortcutsImage");
                        v8 = objc_claimAutoreleasedReturnValue();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v21 = (void *)v8;
  v9 = -[SFURLImage initWithProtobuf:](v7, "initWithProtobuf:", v8);

LABEL_28:
  objc_msgSend(v5, "imageData");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v5, "urlImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v5, "imageData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFImage setImageData:](v9, "setImageData:", v25);

    }
  }
  if (objc_msgSend(v5, "isTemplate"))
    -[SFImage setIsTemplate:](v9, "setIsTemplate:", objc_msgSend(v5, "isTemplate"));
  if (objc_msgSend(v5, "shouldCropToCircle"))
    -[SFImage setShouldCropToCircle:](v9, "setShouldCropToCircle:", objc_msgSend(v5, "shouldCropToCircle"));
  objc_msgSend(v5, "cornerRadius");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v5, "cornerRadius");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    -[SFImage setCornerRadius:](v9, "setCornerRadius:");

  }
  objc_msgSend(v5, "scale");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v5, "scale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    -[SFImage setScale:](v9, "setScale:");

  }
  objc_msgSend(v5, "size");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v5, "size");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImage setSize:](v9, "setSize:", _SFPBPointSizeHandwrittenTranslator(v31));

  }
  objc_msgSend(v5, "contentType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v5, "contentType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImage setContentType:](v9, "setContentType:", v33);

  }
  objc_msgSend(v5, "keyColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v5, "keyColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImage setKeyColor:](v9, "setKeyColor:", v35);

  }
  objc_msgSend(v5, "identifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v5, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImage setIdentifier:](v9, "setIdentifier:", v37);

  }
  if (objc_msgSend(v5, "source"))
    -[SFImage setSource:](v9, "setSource:", objc_msgSend(v5, "source"));
  if (objc_msgSend(v5, "cornerRoundingStyle"))
    -[SFImage setCornerRoundingStyle:](v9, "setCornerRoundingStyle:", objc_msgSend(v5, "cornerRoundingStyle"));
  objc_msgSend(v5, "accessibilityLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v5, "accessibilityLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImage setAccessibilityLabel:](v9, "setAccessibilityLabel:", v39);

  }
  objc_msgSend(v5, "badgingImage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = [SFImage alloc];
    objc_msgSend(v5, "badgingImage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[SFImage initWithProtobuf:](v41, "initWithProtobuf:", v42);
    -[SFImage setBadgingImage:](v9, "setBadgingImage:", v43);

  }
  self = v9;
  v9 = self;
LABEL_56:

  return v9;
}

- (void)loadImageDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SFImage_Handwritten__loadImageDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E40417D0;
  v7 = v4;
  v5 = v4;
  -[SFImage loadImageDataWithCompletionAndErrorHandler:](self, "loadImageDataWithCompletionAndErrorHandler:", v6);

}

- (void)loadImageDataWithCompletionAndErrorHandler:(id)a3
{
  -[SFImage loadImageDataWithContext:completionHandler:](self, "loadImageDataWithContext:completionHandler:", 0, a3);
}

- (void)loadImageDataWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SFImage_Handwritten__loadImageDataWithContext_completionHandler___block_invoke;
  v8[3] = &unk_1E40417F8;
  v9 = v6;
  v7 = v6;
  SFResourceLoaderLoadImageWithContext(self, a3, v8);

}

void __67__SFImage_Handwritten__loadImageDataWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "imageData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

uint64_t __59__SFImage_Handwritten__loadImageDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)imageWithData:(id)a3
{
  id v3;
  SFImage *v4;

  v3 = a3;
  v4 = objc_alloc_init(SFImage);
  -[SFImage setImageData:](v4, "setImageData:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsTemplate:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isTemplate = a3;
}

- (BOOL)hasIsTemplate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setShouldCropToCircle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldCropToCircle = a3;
}

- (BOOL)hasShouldCropToCircle
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCornerRadius:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cornerRadius = a3;
}

- (BOOL)hasCornerRadius
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setScale:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_scale = a3;
}

- (BOOL)hasScale
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSize:(CGSize)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_size = a3;
}

- (BOOL)hasSize
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCornerRoundingStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_cornerRoundingStyle = a3;
}

- (BOOL)hasCornerRoundingStyle
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (SFImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v7 = -[SFImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBImage *v2;
  void *v3;

  v2 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBImage *v2;
  void *v3;

  v2 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFImage imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setImageData:", v6);

  objc_msgSend(v4, "setIsTemplate:", -[SFImage isTemplate](self, "isTemplate"));
  objc_msgSend(v4, "setShouldCropToCircle:", -[SFImage shouldCropToCircle](self, "shouldCropToCircle"));
  -[SFImage cornerRadius](self, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");
  -[SFImage scale](self, "scale");
  objc_msgSend(v4, "setScale:");
  -[SFImage size](self, "size");
  objc_msgSend(v4, "setSize:");
  -[SFImage contentType](self, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setContentType:", v8);

  -[SFImage keyColor](self, "keyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setKeyColor:", v10);

  -[SFImage identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setIdentifier:", v12);

  objc_msgSend(v4, "setSource:", -[SFImage source](self, "source"));
  objc_msgSend(v4, "setCornerRoundingStyle:", -[SFImage cornerRoundingStyle](self, "cornerRoundingStyle"));
  -[SFImage accessibilityLabel](self, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setAccessibilityLabel:", v14);

  -[SFImage badgingImage](self, "badgingImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setBadgingImage:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SFImage *v7;
  SFImage *v8;
  void *v9;
  int v10;
  char v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

  v7 = (SFImage *)a3;
  if (self == v7)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFImage isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class()))
    {
      v8 = v7;
      -[SFImage imageData](self, "imageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFImage imageData](v8, "imageData");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          -[SFImage imageData](self, "imageData");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFImage imageData](v8, "imageData");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
          {

            v11 = 0;
            goto LABEL_31;
          }
          v10 = 1;
        }
        else
        {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      v12 = -[SFImage isTemplate](self, "isTemplate");
      if (v12 == -[SFImage isTemplate](v8, "isTemplate"))
      {
        v13 = -[SFImage shouldCropToCircle](self, "shouldCropToCircle");
        if (v13 == -[SFImage shouldCropToCircle](v8, "shouldCropToCircle"))
        {
          -[SFImage cornerRadius](self, "cornerRadius");
          v15 = v14;
          -[SFImage cornerRadius](v8, "cornerRadius");
          if (vabdd_f64(v15, v16) < 2.22044605e-16)
          {
            -[SFImage scale](self, "scale");
            v18 = v17;
            -[SFImage scale](v8, "scale");
            if (vabdd_f64(v18, v19) < 2.22044605e-16)
            {
              -[SFImage size](self, "size");
              v21 = v20;
              v23 = v22;
              -[SFImage size](v8, "size");
              if (v21 == v25 && v23 == v24)
              {
                -[SFImage contentType](self, "contentType");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFImage contentType](v8, "contentType");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v26 == 0) == (v27 != 0))
                  goto LABEL_45;
                v73 = v27;
                -[SFImage contentType](self, "contentType");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v74)
                {
                  v72 = v26;
                  goto LABEL_23;
                }
                -[SFImage contentType](self, "contentType");
                v28 = objc_claimAutoreleasedReturnValue();
                -[SFImage contentType](v8, "contentType");
                v29 = objc_claimAutoreleasedReturnValue();
                v71 = (void *)v28;
                v30 = (void *)v28;
                v31 = (void *)v29;
                if ((objc_msgSend(v30, "isEqual:", v29) & 1) != 0)
                {
                  v70 = v31;
                  v72 = v26;
LABEL_23:
                  -[SFImage keyColor](self, "keyColor");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFImage keyColor](v8, "keyColor");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = v74;
                  if ((v32 == 0) != (v33 != 0))
                  {
                    v68 = v33;
                    v69 = v32;
                    -[SFImage keyColor](self, "keyColor");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v35)
                    {
                      -[SFImage keyColor](self, "keyColor");
                      v36 = objc_claimAutoreleasedReturnValue();
                      -[SFImage keyColor](v8, "keyColor");
                      v37 = objc_claimAutoreleasedReturnValue();
                      v66 = (void *)v36;
                      v38 = (void *)v36;
                      v39 = (void *)v37;
                      if (!objc_msgSend(v38, "isEqual:", v37))
                      {
                        v11 = 0;
LABEL_69:

LABEL_70:
                        if (v74)
                        {

                        }
                        if ((v10 & 1) == 0)
                        {
LABEL_30:
                          if (!v9)
                          {
LABEL_32:

                            goto LABEL_33;
                          }
LABEL_31:

                          goto LABEL_32;
                        }
LABEL_29:

                        goto LABEL_30;
                      }
                      v65 = v39;
                      v67 = v35;
                    }
                    else
                    {
                      v67 = 0;
                    }
                    -[SFImage identifier](self, "identifier");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFImage identifier](v8, "identifier");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v41 == 0) != (v42 != 0))
                    {
                      v64 = v42;
                      -[SFImage identifier](self, "identifier");
                      v63 = objc_claimAutoreleasedReturnValue();
                      if (v63)
                      {
                        -[SFImage identifier](self, "identifier");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFImage identifier](v8, "identifier");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        v59 = v43;
                        v44 = objc_msgSend(v43, "isEqual:");
                        v45 = v41;
                        if (!v44)
                        {
                          v11 = 0;
                          v46 = (void *)v63;
LABEL_67:

LABEL_68:
                          v35 = v67;
                          v39 = v65;
                          if (!v67)
                            goto LABEL_70;
                          goto LABEL_69;
                        }
                      }
                      else
                      {
                        v45 = v41;
                      }
                      v60 = -[SFImage source](self, "source");
                      if (v60 != -[SFImage source](v8, "source")
                        || (v61 = -[SFImage cornerRoundingStyle](self, "cornerRoundingStyle"),
                            v61 != -[SFImage cornerRoundingStyle](v8, "cornerRoundingStyle")))
                      {
                        v11 = 0;
                        goto LABEL_66;
                      }
                      -[SFImage accessibilityLabel](self, "accessibilityLabel");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFImage accessibilityLabel](v8, "accessibilityLabel");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v62 == 0) == (v57 != 0))
                      {

                        v11 = 0;
LABEL_65:
                        v45 = v41;
LABEL_66:
                        v46 = (void *)v63;
                        if (!v63)
                          goto LABEL_68;
                        goto LABEL_67;
                      }
                      -[SFImage accessibilityLabel](self, "accessibilityLabel");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v56
                        || (-[SFImage accessibilityLabel](self, "accessibilityLabel"),
                            v47 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFImage accessibilityLabel](v8, "accessibilityLabel"),
                            v54 = (void *)objc_claimAutoreleasedReturnValue(),
                            v55 = v47,
                            objc_msgSend(v47, "isEqual:")))
                      {
                        -[SFImage badgingImage](self, "badgingImage");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFImage badgingImage](v8, "badgingImage");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v53 == 0) == (v52 != 0))
                        {

                          v11 = 0;
                        }
                        else
                        {
                          -[SFImage badgingImage](self, "badgingImage");
                          v48 = objc_claimAutoreleasedReturnValue();
                          if (v48)
                          {
                            v49 = (void *)v48;
                            -[SFImage badgingImage](self, "badgingImage");
                            v51 = (void *)objc_claimAutoreleasedReturnValue();
                            -[SFImage badgingImage](v8, "badgingImage");
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            v11 = objc_msgSend(v51, "isEqual:", v50);

                          }
                          else
                          {

                            v11 = 1;
                          }
                        }
                        if (!v56)
                          goto LABEL_64;
                      }
                      else
                      {
                        v11 = 0;
                      }

LABEL_64:
                      goto LABEL_65;
                    }

                    v34 = v74;
                    if (v67)
                    {

                    }
                    v33 = v68;
                    v32 = v69;
                  }

                  if (v34)
                  {

                  }
                  v26 = v72;
                  v27 = v73;
LABEL_45:

                  v11 = 0;
                  if (!v10)
                    goto LABEL_30;
                  goto LABEL_29;
                }

              }
            }
          }
        }
      }
      v11 = 0;
      if ((v10 & 1) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
    v11 = 0;
  }
LABEL_33:

  return v11;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  float64x2_t v7;
  float64x2_t v8;
  float64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int8x16_t v26;
  unint64_t v27;
  long double v29;
  long double v30;
  float64x2_t __x;
  float64x2_t __xa;
  float64_t v33;
  float64x2_t v34;
  float64_t v35;
  float64x2_t v36;
  int8x16_t v37;
  uint64_t v38;
  float64_t v39;
  float64x2_t v40;
  int8x16_t v41;

  v3 = -[SFImage isTemplate](self, "isTemplate");
  v38 = v3 ^ -[SFImage shouldCropToCircle](self, "shouldCropToCircle");
  -[SFImage cornerRadius](self, "cornerRadius");
  v39 = v4;
  -[SFImage scale](self, "scale");
  v35 = v5;
  -[SFImage size](self, "size");
  v33 = v6;
  -[SFImage size](self, "size");
  v7.f64[0] = v39;
  v8.f64[0] = v33;
  v7.f64[1] = v35;
  v8.f64[1] = v9;
  v10 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), (int8x16_t)vnegq_f64(v7), (int8x16_t)v7);
  v11 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v8), (int8x16_t)vnegq_f64(v8), (int8x16_t)v8);
  v40 = vrndaq_f64(v10);
  __x = vrndaq_f64(v11);
  v34 = vsubq_f64(v11, __x);
  v36 = vsubq_f64(v10, v40);
  v29 = fmod(__x.f64[1], 1.84467441e19);
  v12.f64[0] = fmod(__x.f64[0], 1.84467441e19);
  v12.f64[1] = v29;
  __xa = v12;
  v30 = fmod(v40.f64[1], 1.84467441e19);
  v13.f64[0] = fmod(v40.f64[0], 1.84467441e19);
  v13.f64[1] = v30;
  v14 = (float64x2_t)vdupq_n_s64(0x41E3C6EF36200000uLL);
  v41 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(v13, v14)), (int64x2_t)vcvtq_n_u64_f64(v36, 0x40uLL));
  v37 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(__xa, v14)), (int64x2_t)vcvtq_n_u64_f64(v34, 0x40uLL));
  -[SFImage contentType](self, "contentType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v34.f64[0] = objc_msgSend(v15, "hash");
  -[SFImage keyColor](self, "keyColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  -[SFImage identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  v20 = -[SFImage source](self, "source");
  v21 = -[SFImage cornerRoundingStyle](self, "cornerRoundingStyle");
  -[SFImage accessibilityLabel](self, "accessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");
  -[SFImage badgingImage](self, "badgingImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");
  v26 = veorq_s8(v41, v37);
  v27 = *(_QWORD *)&veor_s8(*(int8x8_t *)v26.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)) ^ v25 ^ v23 ^ v21 ^ v19 ^ v20 ^ v17 ^ *(_QWORD *)&v34.f64[0] ^ v38;

  return v27;
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImageData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)isTemplate
{
  return self->_isTemplate;
}

- (BOOL)shouldCropToCircle
{
  return self->_shouldCropToCircle;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)source
{
  return self->_source;
}

- (int)cornerRoundingStyle
{
  return self->_cornerRoundingStyle;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SFImage)badgingImage
{
  return self->_badgingImage;
}

- (void)setBadgingImage:(id)a3
{
  objc_storeStrong((id *)&self->_badgingImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgingImage, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
