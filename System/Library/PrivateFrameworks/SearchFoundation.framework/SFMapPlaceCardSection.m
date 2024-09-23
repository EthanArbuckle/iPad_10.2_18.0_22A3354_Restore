@implementation SFMapPlaceCardSection

- (SFMapPlaceCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFMapPlaceCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFPunchout *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SFColor *v21;
  void *v22;
  SFColor *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SFMapPlaceCardSection *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFMapPlaceCardSection;
  v5 = -[SFCardSection init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "canBeHidden"))
      -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasTopPadding"))
      -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasBottomPadding"))
      -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMapPlaceCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "separatorStyle"))
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [SFColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SFColor initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "mapsData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "mapsData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMapPlaceCardSection setMapsData:](v5, "setMapsData:", v25);

    }
    if (objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"))
      -[SFMapPlaceCardSection setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"));
    objc_msgSend(v4, "detourInfoData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "detourInfoData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMapPlaceCardSection setDetourInfoData:](v5, "setDetourInfoData:", v27);

    }
    v28 = v5;

  }
  return v5;
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMapPlaceCardSection)initWithCoder:(id)a3
{
  id v4;
  SFMapPlaceCardSection *v5;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v9);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v10);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v11);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapPlaceCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection mapsData](v8, "mapsData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapPlaceCardSection setMapsData:](v5, "setMapsData:", v14);

    -[SFMapPlaceCardSection setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFCardSection shouldSearchDirectionsAlongCurrentRoute](v8, "shouldSearchDirectionsAlongCurrentRoute"));
    -[SFCardSection detourInfoData](v8, "detourInfoData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapPlaceCardSection setDetourInfoData:](v5, "setDetourInfoData:", v15);

    -[SFCardSection nextCard](v8, "nextCard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v16);

    -[SFCardSection commands](v8, "commands");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v17);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v18);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v19);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v20);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v21);

    -[SFCardSection command](v8, "command");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v22);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v23);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v24);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v25);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v26);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v27);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v28);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v29);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v30);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v31);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v32);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v33);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v34);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v35);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMapPlaceCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMapPlaceCardSection *v2;
  void *v3;

  v2 = -[_SFPBMapPlaceCardSection initWithFacade:]([_SFPBMapPlaceCardSection alloc], "initWithFacade:", self);
  -[_SFPBMapPlaceCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMapPlaceCardSection *v2;
  void *v3;

  v2 = -[_SFPBMapPlaceCardSection initWithFacade:]([_SFPBMapPlaceCardSection alloc], "initWithFacade:", self);
  -[_SFPBMapPlaceCardSection jsonData](v2, "jsonData");
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SFMapPlaceCardSection;
  v4 = -[SFCardSection copyWithZone:](&v20, sel_copyWithZone_, a3);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPunchoutOptions:", v6);

  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPunchoutPickerTitle:", v8);

  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPunchoutPickerDismissText:", v10);

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  -[SFMapPlaceCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFMapPlaceCardSection mapsData](self, "mapsData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setMapsData:", v16);

  objc_msgSend(v4, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFMapPlaceCardSection shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
  -[SFMapPlaceCardSection detourInfoData](self, "detourInfoData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setDetourInfoData:", v18);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMapPlaceCardSection *v5;
  SFMapPlaceCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
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
  int v26;
  void *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
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
  void *v61;
  void *v62;
  void *v63;
  id v64;
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
  void *v75;
  void *v76;
  SFMapPlaceCardSection *v77;
  void *v78;
  void *v79;
  objc_super v80;

  v5 = (SFMapPlaceCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMapPlaceCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v80.receiver = self;
      v80.super_class = (Class)SFMapPlaceCardSection;
      if (-[SFCardSection isEqual:](&v80, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v6, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_58:

          goto LABEL_59;
        }
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFCardSection punchoutOptions](self, "punchoutOptions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutOptions](v6, "punchoutOptions");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_56;
          }
          v79 = v10;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) != (v13 != 0))
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v3;
          if (v14)
          {
            v73 = v12;
            -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isEqual:", v16) & 1) == 0)
            {

LABEL_31:
              v11 = 0;
              goto LABEL_32;
            }
            v71 = v16;
            v72 = v15;
            v77 = v6;
            v75 = v8;
            v17 = v7;
            v18 = v9;
            v19 = v13;
            v20 = v73;
            v3 = v76;
            v21 = v14;
          }
          else
          {
            v77 = v6;
            v75 = v8;
            v17 = v7;
            v18 = v9;
            v19 = v13;
            v20 = v12;
            v21 = 0;
          }
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v77, "punchoutPickerDismissText");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v21;
          v12 = v20;
          v13 = v19;
          v9 = v18;
          v7 = v17;
          v8 = v75;
          if ((v22 == 0) != (v23 != 0))
          {
            v69 = v23;
            v70 = v22;
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v77;
              -[SFCardSection punchoutPickerDismissText](v77, "punchoutPickerDismissText");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v25;
              v26 = objc_msgSend(v25, "isEqual:");
              v27 = v70;
              if (!v26)
                goto LABEL_27;
            }
            else
            {
              v6 = v77;
              v27 = v70;
            }
            v68 = v24;
            v28 = -[SFCardSection canBeHidden](self, "canBeHidden");
            if (v28 != -[SFCardSection canBeHidden](v6, "canBeHidden")
              || (v29 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  v29 != -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
              || (v30 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  v30 != -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
            {
              v24 = v68;
              if (!v74)
              {
LABEL_28:

                if (v24)
                {

                }
                goto LABEL_31;
              }
LABEL_27:

              goto LABEL_28;
            }
            v65 = v13;
            -[SFMapPlaceCardSection type](self, "type");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFMapPlaceCardSection type](v6, "type");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v31 == 0) != (v32 != 0))
            {
              v78 = v31;
              v64 = v32;
              -[SFMapPlaceCardSection type](self, "type");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                -[SFMapPlaceCardSection type](self, "type");
                v34 = objc_claimAutoreleasedReturnValue();
                -[SFMapPlaceCardSection type](v6, "type");
                v35 = objc_claimAutoreleasedReturnValue();
                v62 = (void *)v34;
                v36 = (void *)v34;
                v31 = (void *)v35;
                if (!objc_msgSend(v36, "isEqual:", v35))
                {
                  v11 = 0;
                  goto LABEL_68;
                }
                v63 = v33;
              }
              else
              {
                v63 = 0;
              }
              v37 = -[SFCardSection separatorStyle](self, "separatorStyle");
              if (v37 != -[SFCardSection separatorStyle](v6, "separatorStyle"))
              {
                v11 = 0;
                goto LABEL_67;
              }
              -[SFCardSection backgroundColor](self, "backgroundColor");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFCardSection backgroundColor](v6, "backgroundColor");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v38 == 0) != (v39 != 0))
              {
                v60 = v31;
                v61 = v39;
                v59 = v7;
                v40 = v12;
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v6, "backgroundColor");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = v42;
                  if (!objc_msgSend(v42, "isEqual:"))
                  {
                    v11 = 0;
                    goto LABEL_65;
                  }
                }
                -[SFMapPlaceCardSection mapsData](self, "mapsData");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFMapPlaceCardSection mapsData](v6, "mapsData");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v45;
                if ((v44 == 0) == (v45 != 0))
                {

                  v11 = 0;
                  if (!v41)
                  {
LABEL_66:

                    v12 = v40;
                    v7 = v59;
                    v31 = v60;
                    v8 = v75;
                    v27 = v70;
LABEL_67:
                    v33 = v63;
                    if (!v63)
                    {
LABEL_69:

                      if (v74)
                      {

                      }
                      if (v68)
                      {

                      }
LABEL_32:
                      v10 = v79;
                      v3 = v76;
                      if (!v9)
                        goto LABEL_57;
                      goto LABEL_56;
                    }
LABEL_68:

                    goto LABEL_69;
                  }
LABEL_65:

                  goto LABEL_66;
                }
                -[SFMapPlaceCardSection mapsData](self, "mapsData");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                if (v56)
                {
                  -[SFMapPlaceCardSection mapsData](self, "mapsData");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFMapPlaceCardSection mapsData](v6, "mapsData");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = v47;
                  if (!objc_msgSend(v47, "isEqual:"))
                  {
                    v11 = 0;
LABEL_81:

LABEL_82:
                    if (!v41)
                      goto LABEL_66;
                    goto LABEL_65;
                  }
                }
                v48 = -[SFMapPlaceCardSection shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute");
                if (v48 == -[SFMapPlaceCardSection shouldSearchDirectionsAlongCurrentRoute](v6, "shouldSearchDirectionsAlongCurrentRoute"))
                {
                  -[SFMapPlaceCardSection detourInfoData](self, "detourInfoData");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFMapPlaceCardSection detourInfoData](v6, "detourInfoData");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v53 == 0) != (v52 != 0))
                  {
                    -[SFMapPlaceCardSection detourInfoData](self, "detourInfoData");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v51)
                    {
                      -[SFMapPlaceCardSection detourInfoData](self, "detourInfoData");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFMapPlaceCardSection detourInfoData](v6, "detourInfoData");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v11 = objc_msgSend(v50, "isEqual:", v49);

                    }
                    else
                    {

                      v11 = 1;
                    }
LABEL_80:
                    if (!v56)
                      goto LABEL_82;
                    goto LABEL_81;
                  }

                }
                v11 = 0;
                goto LABEL_80;
              }

              if (v63)
              {

              }
              v32 = v64;
              v31 = v78;
            }
            v77 = v6;

            v24 = v68;
            if (v74)
            {

            }
            v23 = v69;
            v22 = v70;
            v3 = v76;
            v13 = v65;
          }

          if (v24)
          {

          }
          v6 = v77;
        }

        v11 = 0;
        v10 = v79;
        if (!v9)
        {
LABEL_57:

          goto LABEL_58;
        }
LABEL_56:

        goto LABEL_57;
      }
    }
    v11 = 0;
  }
LABEL_59:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SFMapPlaceCardSection;
  v3 = -[SFCardSection hash](&v24, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v11 = v10 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v12 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFMapPlaceCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFMapPlaceCardSection mapsData](self, "mapsData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  v20 = -[SFMapPlaceCardSection shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute");
  -[SFMapPlaceCardSection detourInfoData](self, "detourInfoData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19 ^ v20 ^ objc_msgSend(v21, "hash");

  return v22;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setMapsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (NSData)detourInfoData
{
  return self->_detourInfoData;
}

- (void)setDetourInfoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detourInfoData, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
