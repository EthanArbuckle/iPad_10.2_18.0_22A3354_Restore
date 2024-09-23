@implementation _SFPBImage

- (_SFPBImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBImage *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  _SFPBGraphicalFloat *v10;
  _SFPBGraphicalFloat *v11;
  _SFPBGraphicalFloat *v12;
  _SFPBGraphicalFloat *v13;
  _SFPBPointSize *v14;
  _SFPBPointSize *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _SFPBImage *v25;
  void *v26;
  _SFPBImage *v27;
  _SFPBURLImage *v28;
  _SFPBContactImage *v29;
  _SFPBMonogramImage *v30;
  _SFPBLocalImage *v31;
  _SFPBAppIconImage *v32;
  _SFPBMediaArtworkImage *v33;
  _SFPBCalendarImage *v34;
  _SFPBSymbolImage *v35;
  _SFPBPhotosLibraryImage *v36;
  _SFPBQuickLookThumbnailImage *v37;
  _SFPBClockImage *v38;
  _SFPBShortcutsImage *v39;
  _SFPBImage *v40;

  v4 = a3;
  v5 = -[_SFPBImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "imageData");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v4, "imageData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFPBImage setImageData:](v5, "setImageData:", v9);

      }
    }
    if (objc_msgSend(v4, "hasIsTemplate"))
      -[_SFPBImage setIsTemplate:](v5, "setIsTemplate:", objc_msgSend(v4, "isTemplate"));
    if (objc_msgSend(v4, "hasShouldCropToCircle"))
      -[_SFPBImage setShouldCropToCircle:](v5, "setShouldCropToCircle:", objc_msgSend(v4, "shouldCropToCircle"));
    if (objc_msgSend(v4, "hasCornerRadius"))
    {
      v10 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "cornerRadius");
      v11 = -[_SFPBGraphicalFloat initWithCGFloat:](v10, "initWithCGFloat:");
      -[_SFPBImage setCornerRadius:](v5, "setCornerRadius:", v11);

    }
    if (objc_msgSend(v4, "hasScale"))
    {
      v12 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "scale");
      v13 = -[_SFPBGraphicalFloat initWithCGFloat:](v12, "initWithCGFloat:");
      -[_SFPBImage setScale:](v5, "setScale:", v13);

    }
    if (objc_msgSend(v4, "hasSize"))
    {
      v14 = [_SFPBPointSize alloc];
      objc_msgSend(v4, "size");
      v15 = -[_SFPBPointSize initWithCGSize:](v14, "initWithCGSize:");
      -[_SFPBImage setSize:](v5, "setSize:", v15);

    }
    objc_msgSend(v4, "contentType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "contentType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBImage setContentType:](v5, "setContentType:", v17);

    }
    objc_msgSend(v4, "keyColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "keyColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBImage setKeyColor:](v5, "setKeyColor:", v19);

    }
    objc_msgSend(v4, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBImage setIdentifier:](v5, "setIdentifier:", v21);

    }
    if (objc_msgSend(v4, "hasSource"))
      -[_SFPBImage setSource:](v5, "setSource:", objc_msgSend(v4, "source"));
    if (objc_msgSend(v4, "hasCornerRoundingStyle"))
      -[_SFPBImage setCornerRoundingStyle:](v5, "setCornerRoundingStyle:", objc_msgSend(v4, "cornerRoundingStyle"));
    objc_msgSend(v4, "accessibilityLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "accessibilityLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBImage setAccessibilityLabel:](v5, "setAccessibilityLabel:", v23);

    }
    objc_msgSend(v4, "badgingImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      objc_msgSend(v4, "badgingImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBImage initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBImage setBadgingImage:](v5, "setBadgingImage:", v27);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[_SFPBURLImage initWithFacade:]([_SFPBURLImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setUrlImage:](v5, "setUrlImage:", v28);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBContactImage initWithFacade:]([_SFPBContactImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setContactImage:](v5, "setContactImage:", v29);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[_SFPBMonogramImage initWithFacade:]([_SFPBMonogramImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setMonogramImage:](v5, "setMonogramImage:", v30);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBLocalImage initWithFacade:]([_SFPBLocalImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setLocalImage:](v5, "setLocalImage:", v31);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[_SFPBAppIconImage initWithFacade:]([_SFPBAppIconImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setAppIconImage:](v5, "setAppIconImage:", v32);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBMediaArtworkImage initWithFacade:]([_SFPBMediaArtworkImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setMediaArtworkImage:](v5, "setMediaArtworkImage:", v33);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[_SFPBCalendarImage initWithFacade:]([_SFPBCalendarImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setCalendarImage:](v5, "setCalendarImage:", v34);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBSymbolImage initWithFacade:]([_SFPBSymbolImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setSymbolImage:](v5, "setSymbolImage:", v35);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[_SFPBPhotosLibraryImage initWithFacade:]([_SFPBPhotosLibraryImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v36);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBQuickLookThumbnailImage initWithFacade:]([_SFPBQuickLookThumbnailImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setQuickLookThumbnailImage:](v5, "setQuickLookThumbnailImage:", v37);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[_SFPBClockImage initWithFacade:]([_SFPBClockImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setClockImage:](v5, "setClockImage:", v38);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[_SFPBShortcutsImage initWithFacade:]([_SFPBShortcutsImage alloc], "initWithFacade:", v4);
      -[_SFPBImage setShortcutsImage:](v5, "setShortcutsImage:", v39);

    }
    v40 = v5;
  }

  return v5;
}

- (void)setImageData:(id)a3
{
  NSData *v4;
  NSData *imageData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  imageData = self->_imageData;
  self->_imageData = v4;

}

- (void)setIsTemplate:(BOOL)a3
{
  self->_isTemplate = a3;
}

- (void)setShouldCropToCircle:(BOOL)a3
{
  self->_shouldCropToCircle = a3;
}

- (void)setCornerRadius:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadius, a3);
}

- (void)setScale:(id)a3
{
  objc_storeStrong((id *)&self->_scale, a3);
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (void)setContentType:(id)a3
{
  NSString *v4;
  NSString *contentType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contentType = self->_contentType;
  self->_contentType = v4;

}

- (void)setKeyColor:(id)a3
{
  NSString *v4;
  NSString *keyColor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  keyColor = self->_keyColor;
  self->_keyColor = v4;

}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void)setCornerRoundingStyle:(int)a3
{
  self->_cornerRoundingStyle = a3;
}

- (void)setAccessibilityLabel:(id)a3
{
  NSString *v4;
  NSString *accessibilityLabel;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  accessibilityLabel = self->_accessibilityLabel;
  self->_accessibilityLabel = v4;

}

- (void)setBadgingImage:(id)a3
{
  objc_storeStrong((id *)&self->_badgingImage, a3);
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setUrlImage:(id)a3
{
  objc_storeStrong((id *)&self->_urlImage, a3);
}

- (void)setContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_contactImage, a3);
}

- (void)setMonogramImage:(id)a3
{
  objc_storeStrong((id *)&self->_monogramImage, a3);
}

- (void)setLocalImage:(id)a3
{
  objc_storeStrong((id *)&self->_localImage, a3);
}

- (void)setAppIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_appIconImage, a3);
}

- (void)setMediaArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_mediaArtworkImage, a3);
}

- (void)setCalendarImage:(id)a3
{
  objc_storeStrong((id *)&self->_calendarImage, a3);
}

- (void)setSymbolImage:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImage, a3);
}

- (void)setPhotosLibraryImage:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibraryImage, a3);
}

- (void)setQuickLookThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookThumbnailImage, a3);
}

- (void)setClockImage:(id)a3
{
  objc_storeStrong((id *)&self->_clockImage, a3);
}

- (void)setShortcutsImage:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutsImage, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[_SFPBImage imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteDataField();

  if (-[_SFPBImage isTemplate](self, "isTemplate"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBImage shouldCropToCircle](self, "shouldCropToCircle"))
    PBDataWriterWriteBOOLField();
  -[_SFPBImage cornerRadius](self, "cornerRadius");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage scale](self, "scale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage size](self, "size");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage contentType](self, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteStringField();

  -[_SFPBImage keyColor](self, "keyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteStringField();

  -[_SFPBImage identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  if (-[_SFPBImage source](self, "source"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBImage cornerRoundingStyle](self, "cornerRoundingStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBImage accessibilityLabel](self, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  -[_SFPBImage badgingImage](self, "badgingImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBImage type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBImage urlImage](self, "urlImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage contactImage](self, "contactImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage monogramImage](self, "monogramImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage localImage](self, "localImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage appIconImage](self, "appIconImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage mediaArtworkImage](self, "mediaArtworkImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage calendarImage](self, "calendarImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage symbolImage](self, "symbolImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage photosLibraryImage](self, "photosLibraryImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage quickLookThumbnailImage](self, "quickLookThumbnailImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage clockImage](self, "clockImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteSubmessage();

  -[_SFPBImage shortcutsImage](self, "shortcutsImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int isTemplate;
  int shouldCropToCircle;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int source;
  int cornerRoundingStyle;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int type;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  char v116;
  BOOL v117;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_112;
  -[_SFPBImage imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage imageData](self, "imageData");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBImage imageData](self, "imageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_112;
  }
  else
  {

  }
  isTemplate = self->_isTemplate;
  if (isTemplate != objc_msgSend(v4, "isTemplate"))
    goto LABEL_112;
  shouldCropToCircle = self->_shouldCropToCircle;
  if (shouldCropToCircle != objc_msgSend(v4, "shouldCropToCircle"))
    goto LABEL_112;
  -[_SFPBImage cornerRadius](self, "cornerRadius");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage cornerRadius](self, "cornerRadius");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_SFPBImage cornerRadius](self, "cornerRadius");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cornerRadius");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage scale](self, "scale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage scale](self, "scale");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_SFPBImage scale](self, "scale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage size](self, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage size](self, "size");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_SFPBImage size](self, "size");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage contentType](self, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage contentType](self, "contentType");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_SFPBImage contentType](self, "contentType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage keyColor](self, "keyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage keyColor](self, "keyColor");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_SFPBImage keyColor](self, "keyColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage identifier](self, "identifier");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[_SFPBImage identifier](self, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_112;
  }
  else
  {

  }
  source = self->_source;
  if (source != objc_msgSend(v4, "source"))
    goto LABEL_112;
  cornerRoundingStyle = self->_cornerRoundingStyle;
  if (cornerRoundingStyle != objc_msgSend(v4, "cornerRoundingStyle"))
    goto LABEL_112;
  -[_SFPBImage accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage accessibilityLabel](self, "accessibilityLabel");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBImage accessibilityLabel](self, "accessibilityLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage badgingImage](self, "badgingImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badgingImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage badgingImage](self, "badgingImage");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_SFPBImage badgingImage](self, "badgingImage");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "badgingImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_112;
  }
  else
  {

  }
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_112;
  -[_SFPBImage urlImage](self, "urlImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage urlImage](self, "urlImage");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBImage urlImage](self, "urlImage");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlImage");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage contactImage](self, "contactImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage contactImage](self, "contactImage");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[_SFPBImage contactImage](self, "contactImage");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactImage");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage monogramImage](self, "monogramImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "monogramImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage monogramImage](self, "monogramImage");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[_SFPBImage monogramImage](self, "monogramImage");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "monogramImage");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage localImage](self, "localImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage localImage](self, "localImage");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[_SFPBImage localImage](self, "localImage");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localImage");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage appIconImage](self, "appIconImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIconImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage appIconImage](self, "appIconImage");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[_SFPBImage appIconImage](self, "appIconImage");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIconImage");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage mediaArtworkImage](self, "mediaArtworkImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaArtworkImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage mediaArtworkImage](self, "mediaArtworkImage");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[_SFPBImage mediaArtworkImage](self, "mediaArtworkImage");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaArtworkImage");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (!v86)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage calendarImage](self, "calendarImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage calendarImage](self, "calendarImage");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[_SFPBImage calendarImage](self, "calendarImage");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendarImage");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage symbolImage](self, "symbolImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage symbolImage](self, "symbolImage");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[_SFPBImage symbolImage](self, "symbolImage");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolImage");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "isEqual:", v95);

    if (!v96)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage photosLibraryImage](self, "photosLibraryImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosLibraryImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage photosLibraryImage](self, "photosLibraryImage");
  v97 = objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    v98 = (void *)v97;
    -[_SFPBImage photosLibraryImage](self, "photosLibraryImage");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosLibraryImage");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v99, "isEqual:", v100);

    if (!v101)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage quickLookThumbnailImage](self, "quickLookThumbnailImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickLookThumbnailImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage quickLookThumbnailImage](self, "quickLookThumbnailImage");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    -[_SFPBImage quickLookThumbnailImage](self, "quickLookThumbnailImage");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quickLookThumbnailImage");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v104, "isEqual:", v105);

    if (!v106)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage clockImage](self, "clockImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clockImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_SFPBImage clockImage](self, "clockImage");
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    v108 = (void *)v107;
    -[_SFPBImage clockImage](self, "clockImage");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clockImage");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v109, "isEqual:", v110);

    if (!v111)
      goto LABEL_112;
  }
  else
  {

  }
  -[_SFPBImage shortcutsImage](self, "shortcutsImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortcutsImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_111:

    goto LABEL_112;
  }
  -[_SFPBImage shortcutsImage](self, "shortcutsImage");
  v112 = objc_claimAutoreleasedReturnValue();
  if (!v112)
  {

LABEL_115:
    v117 = 1;
    goto LABEL_113;
  }
  v113 = (void *)v112;
  -[_SFPBImage shortcutsImage](self, "shortcutsImage");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortcutsImage");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v114, "isEqual:", v115);

  if ((v116 & 1) != 0)
    goto LABEL_115;
LABEL_112:
  v117 = 0;
LABEL_113:

  return v117;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = -[NSData hash](self->_imageData, "hash");
  if (self->_isTemplate)
    v4 = 2654435761;
  else
    v4 = 0;
  v30 = v4;
  v31 = v3;
  if (self->_shouldCropToCircle)
    v5 = 2654435761;
  else
    v5 = 0;
  v29 = v5;
  v28 = -[_SFPBGraphicalFloat hash](self->_cornerRadius, "hash");
  v6 = -[_SFPBGraphicalFloat hash](self->_scale, "hash");
  v7 = -[_SFPBPointSize hash](self->_size, "hash");
  v8 = -[NSString hash](self->_contentType, "hash");
  v9 = -[NSString hash](self->_keyColor, "hash");
  v10 = -[NSString hash](self->_identifier, "hash");
  v11 = 2654435761 * self->_source;
  v12 = 2654435761 * self->_cornerRoundingStyle;
  v13 = -[NSString hash](self->_accessibilityLabel, "hash");
  v14 = v30 ^ v31 ^ v29 ^ v28 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  v15 = v13 ^ -[_SFPBImage hash](self->_badgingImage, "hash") ^ (2654435761 * self->_type);
  v16 = v14 ^ v15 ^ -[_SFPBURLImage hash](self->_urlImage, "hash");
  v17 = -[_SFPBContactImage hash](self->_contactImage, "hash");
  v18 = v17 ^ -[_SFPBMonogramImage hash](self->_monogramImage, "hash");
  v19 = v18 ^ -[_SFPBLocalImage hash](self->_localImage, "hash");
  v20 = v19 ^ -[_SFPBAppIconImage hash](self->_appIconImage, "hash");
  v21 = v20 ^ -[_SFPBMediaArtworkImage hash](self->_mediaArtworkImage, "hash");
  v22 = v21 ^ -[_SFPBCalendarImage hash](self->_calendarImage, "hash");
  v23 = v22 ^ -[_SFPBSymbolImage hash](self->_symbolImage, "hash");
  v24 = v16 ^ v23 ^ -[_SFPBPhotosLibraryImage hash](self->_photosLibraryImage, "hash");
  v25 = -[_SFPBQuickLookThumbnailImage hash](self->_quickLookThumbnailImage, "hash");
  v26 = v25 ^ -[_SFPBClockImage hash](self->_clockImage, "hash");
  return v24 ^ v26 ^ -[_SFPBShortcutsImage hash](self->_shortcutsImage, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  uint64_t v26;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accessibilityLabel)
  {
    -[_SFPBImage accessibilityLabel](self, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessibilityLabel"));

  }
  if (self->_appIconImage)
  {
    -[_SFPBImage appIconImage](self, "appIconImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appIconImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appIconImage"));

    }
  }
  if (self->_badgingImage)
  {
    -[_SFPBImage badgingImage](self, "badgingImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("badgingImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("badgingImage"));

    }
  }
  if (self->_calendarImage)
  {
    -[_SFPBImage calendarImage](self, "calendarImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("calendarImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("calendarImage"));

    }
  }
  if (self->_clockImage)
  {
    -[_SFPBImage clockImage](self, "clockImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("clockImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("clockImage"));

    }
  }
  if (self->_contactImage)
  {
    -[_SFPBImage contactImage](self, "contactImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("contactImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("contactImage"));

    }
  }
  if (self->_contentType)
  {
    -[_SFPBImage contentType](self, "contentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("contentType"));

  }
  if (self->_cornerRadius)
  {
    -[_SFPBImage cornerRadius](self, "cornerRadius");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("cornerRadius"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("cornerRadius"));

    }
  }
  if (self->_cornerRoundingStyle)
  {
    v26 = -[_SFPBImage cornerRoundingStyle](self, "cornerRoundingStyle");
    if (v26 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = *(&off_1E4042078 + v26);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("cornerRoundingStyle"));

  }
  if (self->_identifier)
  {
    -[_SFPBImage identifier](self, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("identifier"));

  }
  if (self->_imageData)
  {
    -[_SFPBImage imageData](self, "imageData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "base64EncodedStringWithOptions:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("imageData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("imageData"));

    }
  }
  if (self->_isTemplate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBImage isTemplate](self, "isTemplate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isTemplate"));

  }
  if (self->_keyColor)
  {
    -[_SFPBImage keyColor](self, "keyColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("keyColor"));

  }
  if (self->_localImage)
  {
    -[_SFPBImage localImage](self, "localImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("localImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("localImage"));

    }
  }
  if (self->_mediaArtworkImage)
  {
    -[_SFPBImage mediaArtworkImage](self, "mediaArtworkImage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("mediaArtworkImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("mediaArtworkImage"));

    }
  }
  if (self->_monogramImage)
  {
    -[_SFPBImage monogramImage](self, "monogramImage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("monogramImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("monogramImage"));

    }
  }
  if (self->_photosLibraryImage)
  {
    -[_SFPBImage photosLibraryImage](self, "photosLibraryImage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("photosLibraryImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("photosLibraryImage"));

    }
  }
  if (self->_quickLookThumbnailImage)
  {
    -[_SFPBImage quickLookThumbnailImage](self, "quickLookThumbnailImage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("quickLookThumbnailImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("quickLookThumbnailImage"));

    }
  }
  if (self->_scale)
  {
    -[_SFPBImage scale](self, "scale");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("scale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("scale"));

    }
  }
  if (self->_shortcutsImage)
  {
    -[_SFPBImage shortcutsImage](self, "shortcutsImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("shortcutsImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("shortcutsImage"));

    }
  }
  if (self->_shouldCropToCircle)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBImage shouldCropToCircle](self, "shouldCropToCircle"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("shouldCropToCircle"));

  }
  if (self->_size)
  {
    -[_SFPBImage size](self, "size");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("size"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("size"));

    }
  }
  if (self->_source)
  {
    v61 = -[_SFPBImage source](self, "source");
    if (v61 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = *(&off_1E4042178 + v61);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("source"));

  }
  if (self->_symbolImage)
  {
    -[_SFPBImage symbolImage](self, "symbolImage");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "dictionaryRepresentation");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("symbolImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("symbolImage"));

    }
  }
  if (self->_type)
  {
    v66 = -[_SFPBImage type](self, "type");
    switch((int)v66)
    {
      case '4':
        v67 = CFSTR("52");
        break;
      case '5':
        v67 = CFSTR("53");
        break;
      case '6':
        v67 = CFSTR("54");
        break;
      case '7':
        v67 = CFSTR("55");
        break;
      case '8':
        v67 = CFSTR("56");
        break;
      case '9':
        v67 = CFSTR("57");
        break;
      case ':':
        v67 = CFSTR("58");
        break;
      case ';':
        v67 = CFSTR("59");
        break;
      case '<':
        v67 = CFSTR("60");
        break;
      case '=':
        v67 = CFSTR("61");
        break;
      case '>':
        v67 = CFSTR("62");
        break;
      case '?':
        v67 = CFSTR("63");
        break;
      default:
        if ((_DWORD)v66)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v66);
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = CFSTR("0");
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("type"));

  }
  if (self->_urlImage)
  {
    -[_SFPBImage urlImage](self, "urlImage");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "dictionaryRepresentation");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("urlImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("urlImage"));

    }
  }
  v71 = v3;

  return v71;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBImage dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBImage *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBImage *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _SFPBGraphicalFloat *v11;
  uint64_t v12;
  _SFPBGraphicalFloat *v13;
  uint64_t v14;
  _SFPBPointSize *v15;
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
  uint64_t v26;
  _SFPBImage *v27;
  void *v28;
  uint64_t v29;
  _SFPBURLImage *v30;
  uint64_t v31;
  _SFPBContactImage *v32;
  uint64_t v33;
  _SFPBMonogramImage *v34;
  uint64_t v35;
  _SFPBLocalImage *v36;
  uint64_t v37;
  _SFPBAppIconImage *v38;
  void *v39;
  _SFPBMediaArtworkImage *v40;
  void *v41;
  _SFPBCalendarImage *v42;
  void *v43;
  _SFPBSymbolImage *v44;
  void *v45;
  _SFPBPhotosLibraryImage *v46;
  void *v47;
  _SFPBQuickLookThumbnailImage *v48;
  void *v49;
  _SFPBClockImage *v50;
  void *v51;
  _SFPBShortcutsImage *v52;
  _SFPBImage *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
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
  objc_super v74;

  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)_SFPBImage;
  v5 = -[_SFPBImage init](&v74, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageData"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      -[_SFPBImage setImageData:](v5, "setImageData:", v7);

    }
    v67 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTemplate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBImage setIsTemplate:](v5, "setIsTemplate:", objc_msgSend(v8, "BOOLValue"));
    v66 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldCropToCircle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBImage setShouldCropToCircle:](v5, "setShouldCropToCircle:", objc_msgSend(v9, "BOOLValue"));
    v65 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cornerRadius"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v10);
      -[_SFPBImage setCornerRadius:](v5, "setCornerRadius:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scale"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v12);
      -[_SFPBImage setScale:](v5, "setScale:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBPointSize initWithDictionary:]([_SFPBPointSize alloc], "initWithDictionary:", v14);
      -[_SFPBImage setSize:](v5, "setSize:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBImage setContentType:](v5, "setContentType:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[_SFPBImage setKeyColor:](v5, "setKeyColor:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(v20, "copy");
      -[_SFPBImage setIdentifier:](v5, "setIdentifier:", v21);

    }
    v64 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBImage setSource:](v5, "setSource:", objc_msgSend(v22, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cornerRoundingStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBImage setCornerRoundingStyle:](v5, "setCornerRoundingStyle:", objc_msgSend(v23, "intValue"));
    v60 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[_SFPBImage setAccessibilityLabel:](v5, "setAccessibilityLabel:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("badgingImage"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v26);
      -[_SFPBImage setBadgingImage:](v5, "setBadgingImage:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBImage setType:](v5, "setType:", objc_msgSend(v28, "intValue"));
    v57 = v28;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urlImage"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[_SFPBURLImage initWithDictionary:]([_SFPBURLImage alloc], "initWithDictionary:", v29);
      -[_SFPBImage setUrlImage:](v5, "setUrlImage:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactImage"));
    v31 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = (void *)v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[_SFPBContactImage initWithDictionary:]([_SFPBContactImage alloc], "initWithDictionary:", v31);
      -[_SFPBImage setContactImage:](v5, "setContactImage:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("monogramImage"));
    v33 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = (void *)v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[_SFPBMonogramImage initWithDictionary:]([_SFPBMonogramImage alloc], "initWithDictionary:", v33);
      -[_SFPBImage setMonogramImage:](v5, "setMonogramImage:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localImage"));
    v35 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = (void *)v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[_SFPBLocalImage initWithDictionary:]([_SFPBLocalImage alloc], "initWithDictionary:", v35);
      -[_SFPBImage setLocalImage:](v5, "setLocalImage:", v36);

    }
    v58 = (void *)v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appIconImage"));
    v37 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[_SFPBAppIconImage initWithDictionary:]([_SFPBAppIconImage alloc], "initWithDictionary:", v37);
      -[_SFPBImage setAppIconImage:](v5, "setAppIconImage:", v38);

    }
    v62 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaArtworkImage"), v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = -[_SFPBMediaArtworkImage initWithDictionary:]([_SFPBMediaArtworkImage alloc], "initWithDictionary:", v39);
      -[_SFPBImage setMediaArtworkImage:](v5, "setMediaArtworkImage:", v40);

    }
    v59 = v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarImage"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = -[_SFPBCalendarImage initWithDictionary:]([_SFPBCalendarImage alloc], "initWithDictionary:", v41);
      -[_SFPBImage setCalendarImage:](v5, "setCalendarImage:", v42);

    }
    v63 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbolImage"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = -[_SFPBSymbolImage initWithDictionary:]([_SFPBSymbolImage alloc], "initWithDictionary:", v43);
      -[_SFPBImage setSymbolImage:](v5, "setSymbolImage:", v44);

    }
    v61 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photosLibraryImage"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = -[_SFPBPhotosLibraryImage initWithDictionary:]([_SFPBPhotosLibraryImage alloc], "initWithDictionary:", v45);
      -[_SFPBImage setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v46);

    }
    v56 = (void *)v29;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("quickLookThumbnailImage"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = -[_SFPBQuickLookThumbnailImage initWithDictionary:]([_SFPBQuickLookThumbnailImage alloc], "initWithDictionary:", v47);
      -[_SFPBImage setQuickLookThumbnailImage:](v5, "setQuickLookThumbnailImage:", v48);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clockImage"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = -[_SFPBClockImage initWithDictionary:]([_SFPBClockImage alloc], "initWithDictionary:", v49);
      -[_SFPBImage setClockImage:](v5, "setClockImage:", v50);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shortcutsImage"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = -[_SFPBShortcutsImage initWithDictionary:]([_SFPBShortcutsImage alloc], "initWithDictionary:", v51);
      -[_SFPBImage setShortcutsImage:](v5, "setShortcutsImage:", v52);

    }
    v53 = v5;

  }
  return v5;
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isTemplate
{
  return self->_isTemplate;
}

- (BOOL)shouldCropToCircle
{
  return self->_shouldCropToCircle;
}

- (_SFPBGraphicalFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (_SFPBGraphicalFloat)scale
{
  return self->_scale;
}

- (_SFPBPointSize)size
{
  return self->_size;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSString)keyColor
{
  return self->_keyColor;
}

- (NSString)identifier
{
  return self->_identifier;
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

- (_SFPBImage)badgingImage
{
  return self->_badgingImage;
}

- (int)type
{
  return self->_type;
}

- (_SFPBURLImage)urlImage
{
  return self->_urlImage;
}

- (_SFPBContactImage)contactImage
{
  return self->_contactImage;
}

- (_SFPBMonogramImage)monogramImage
{
  return self->_monogramImage;
}

- (_SFPBLocalImage)localImage
{
  return self->_localImage;
}

- (_SFPBAppIconImage)appIconImage
{
  return self->_appIconImage;
}

- (_SFPBMediaArtworkImage)mediaArtworkImage
{
  return self->_mediaArtworkImage;
}

- (_SFPBCalendarImage)calendarImage
{
  return self->_calendarImage;
}

- (_SFPBSymbolImage)symbolImage
{
  return self->_symbolImage;
}

- (_SFPBPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (_SFPBQuickLookThumbnailImage)quickLookThumbnailImage
{
  return self->_quickLookThumbnailImage;
}

- (_SFPBClockImage)clockImage
{
  return self->_clockImage;
}

- (_SFPBShortcutsImage)shortcutsImage
{
  return self->_shortcutsImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsImage, 0);
  objc_storeStrong((id *)&self->_clockImage, 0);
  objc_storeStrong((id *)&self->_quickLookThumbnailImage, 0);
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_calendarImage, 0);
  objc_storeStrong((id *)&self->_mediaArtworkImage, 0);
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_localImage, 0);
  objc_storeStrong((id *)&self->_monogramImage, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_urlImage, 0);
  objc_storeStrong((id *)&self->_badgingImage, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
