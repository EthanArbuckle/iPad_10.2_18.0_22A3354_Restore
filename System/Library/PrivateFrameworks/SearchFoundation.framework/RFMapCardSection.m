@implementation RFMapCardSection

- (RFMapCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFMapCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFMapMarker *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  RFMapAnnotation *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  SFLatLng *v29;
  double v30;
  RFMapCardSection *v31;
  RFMapCardSection *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)RFMapCardSection;
  v5 = -[SFCardSection init](&v46, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "sizeFormat"))
      -[RFMapCardSection setSizeFormat:](v5, "setSizeFormat:", objc_msgSend(v4, "sizeFormat"));
    objc_msgSend(v4, "markers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "markers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = -[RFMapMarker initWithProtobuf:]([RFMapMarker alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v10);
    }

    -[RFMapCardSection setMarkers:](v5, "setMarkers:", v7);
    objc_msgSend(v4, "annotations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "annotations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          v21 = -[RFMapAnnotation initWithProtobuf:]([RFMapAnnotation alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v18);
    }

    -[RFMapCardSection setAnnotations:](v5, "setAnnotations:", v15);
    objc_msgSend(v4, "polylines");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "polylines");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v24);
          v29 = -[SFLatLng initWithProtobuf:]([SFLatLng alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      }
      while (v26);
    }

    v5 = v33;
    -[RFMapCardSection setPolyline:](v33, "setPolyline:", v23);
    objc_msgSend(v4, "cameraDistance");
    if (v30 != 0.0)
    {
      objc_msgSend(v4, "cameraDistance");
      -[RFMapCardSection setCameraDistance:](v33, "setCameraDistance:");
    }
    if (objc_msgSend(v4, "showsUserLocation"))
      -[RFMapCardSection setShowsUserLocation:](v33, "setShowsUserLocation:", objc_msgSend(v4, "showsUserLocation"));
    v31 = v33;

  }
  return v5;
}

- (void)setSizeFormat:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sizeFormat = a3;
}

- (BOOL)hasSizeFormat
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCameraDistance:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cameraDistance = a3;
}

- (BOOL)hasCameraDistance
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShowsUserLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_showsUserLocation = a3;
}

- (BOOL)hasShowsUserLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (RFMapCardSection)initWithCoder:(id)a3
{
  id v4;
  RFMapCardSection *v5;
  void *v6;
  _SFPBCardSection *v7;
  SFCardSection *v8;
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
  void *v31;

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RFMapCardSection setSizeFormat:](v5, "setSizeFormat:", -[SFCardSection sizeFormat](v8, "sizeFormat"));
    -[SFCardSection markers](v8, "markers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFMapCardSection setMarkers:](v5, "setMarkers:", v9);

    -[SFCardSection annotations](v8, "annotations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFMapCardSection setAnnotations:](v5, "setAnnotations:", v10);

    -[SFCardSection polyline](v8, "polyline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFMapCardSection setPolyline:](v5, "setPolyline:", v11);

    -[SFCardSection cameraDistance](v8, "cameraDistance");
    -[RFMapCardSection setCameraDistance:](v5, "setCameraDistance:");
    -[RFMapCardSection setShowsUserLocation:](v5, "setShowsUserLocation:", -[SFCardSection showsUserLocation](v8, "showsUserLocation"));
    -[SFCardSection nextCard](v8, "nextCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v12);

    -[SFCardSection commands](v8, "commands");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v13);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v14);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v15);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v16);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v17);

    -[SFCardSection command](v8, "command");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v18);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v19);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v20);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v21);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v22);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v24);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v25);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v26);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v27);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v28);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v29);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v30);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v31);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFMapCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMapCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFMapCardSection initWithFacade:]([_SFPBRFMapCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFMapCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMapCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFMapCardSection initWithFacade:]([_SFPBRFMapCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFMapCardSection jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RFMapCardSection;
  v4 = -[SFCardSection copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSizeFormat:", -[RFMapCardSection sizeFormat](self, "sizeFormat"));
  -[RFMapCardSection markers](self, "markers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMarkers:", v6);

  -[RFMapCardSection annotations](self, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAnnotations:", v8);

  -[RFMapCardSection polyline](self, "polyline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPolyline:", v10);

  -[RFMapCardSection cameraDistance](self, "cameraDistance");
  objc_msgSend(v4, "setCameraDistance:");
  objc_msgSend(v4, "setShowsUserLocation:", -[RFMapCardSection showsUserLocation](self, "showsUserLocation"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFMapCardSection *v5;
  RFMapCardSection *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
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
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v5 = (RFMapCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (-[RFMapCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v39.receiver = self;
      v39.super_class = (Class)RFMapCardSection;
      if (-[SFCardSection isEqual:](&v39, sel_isEqual_, v5))
      {
        v6 = v5;
        v7 = -[RFMapCardSection sizeFormat](self, "sizeFormat");
        if (v7 != -[RFMapCardSection sizeFormat](v6, "sizeFormat"))
        {
          LOBYTE(v12) = 0;
LABEL_39:

          goto LABEL_40;
        }
        -[RFMapCardSection markers](self, "markers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapCardSection markers](v6, "markers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v12) = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[RFMapCardSection markers](self, "markers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[RFMapCardSection markers](self, "markers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFMapCardSection markers](v6, "markers");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqual:", v3))
          {
            LOBYTE(v12) = 0;
            goto LABEL_36;
          }
          v38 = v11;
        }
        -[RFMapCardSection annotations](self, "annotations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapCardSection annotations](v6, "annotations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((v13 == 0) == (v14 != 0))
        {

          LOBYTE(v12) = 0;
          goto LABEL_35;
        }
        -[RFMapCardSection annotations](self, "annotations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v32 = v15;
          v17 = v13;
          -[RFMapCardSection annotations](self, "annotations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFMapCardSection annotations](v6, "annotations");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            LOBYTE(v12) = 0;
            v13 = v17;
            v15 = v32;
            goto LABEL_33;
          }
          v34 = v3;
          v37 = v16;
          v13 = v17;
          v15 = v32;
        }
        else
        {
          v34 = v3;
          v37 = 0;
        }
        -[RFMapCardSection polyline](self, "polyline");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMapCardSection polyline](v6, "polyline");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          LOBYTE(v12) = 0;
          v16 = v37;
          v3 = v34;
          if (!v37)
            goto LABEL_34;
          goto LABEL_33;
        }
        v30 = v20;
        v31 = v19;
        -[RFMapCardSection polyline](self, "polyline");
        v16 = v37;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33
          || (-[RFMapCardSection polyline](self, "polyline"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFMapCardSection polyline](v6, "polyline"),
              v28 = v21,
              v29 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v21, "isEqual:")))
        {
          v3 = v34;
          -[RFMapCardSection cameraDistance](self, "cameraDistance");
          v24 = v23;
          -[RFMapCardSection cameraDistance](v6, "cameraDistance");
          if (vabdd_f64(v24, v25) >= 2.22044605e-16)
          {
            LOBYTE(v12) = 0;
          }
          else
          {
            v26 = -[RFMapCardSection showsUserLocation](self, "showsUserLocation");
            v12 = v26 ^ -[RFMapCardSection showsUserLocation](v6, "showsUserLocation") ^ 1;
          }
          v22 = (void *)v29;
          if (!v33)
          {
LABEL_32:

            if (!v37)
            {
LABEL_34:

LABEL_35:
              v11 = v38;
              if (!v10)
              {
LABEL_37:

                goto LABEL_38;
              }
LABEL_36:

              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        else
        {
          LOBYTE(v12) = 0;
          v3 = v34;
          v22 = (void *)v29;
        }

        goto LABEL_32;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_40:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  long double v13;
  unint64_t v14;
  unint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)RFMapCardSection;
  v3 = -[SFCardSection hash](&v17, sel_hash);
  v4 = -[RFMapCardSection sizeFormat](self, "sizeFormat");
  -[RFMapCardSection markers](self, "markers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[RFMapCardSection annotations](self, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[RFMapCardSection polyline](self, "polyline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[RFMapCardSection cameraDistance](self, "cameraDistance");
  v12 = -v11;
  if (v11 >= 0.0)
    v12 = v11;
  v13 = round(v12);
  v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  v15 = v3 ^ v10 ^ -[RFMapCardSection showsUserLocation](self, "showsUserLocation") ^ v14;

  return v15;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (NSArray)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)polyline
{
  return self->_polyline;
}

- (void)setPolyline:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (double)cameraDistance
{
  return self->_cameraDistance;
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polyline, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_markers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
