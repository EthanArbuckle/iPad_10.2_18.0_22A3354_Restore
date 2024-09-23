@implementation SFNewsCardSection

- (SFNewsCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFNewsCardSection *v5;
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
  SFRichText *v25;
  void *v26;
  SFRichText *v27;
  void *v28;
  SFRichText *v29;
  void *v30;
  SFRichText *v31;
  void *v32;
  SFImage *v33;
  void *v34;
  SFImage *v35;
  void *v36;
  SFImage *v37;
  void *v38;
  SFImage *v39;
  void *v40;
  SFRichText *v41;
  void *v42;
  SFRichText *v43;
  SFNewsCardSection *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFNewsCardSection;
  v5 = -[SFCardSection init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
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
      -[SFNewsCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFRichText initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFNewsCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "subtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFRichText alloc];
      objc_msgSend(v4, "subtitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFRichText initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFNewsCardSection setSubtitle:](v5, "setSubtitle:", v31);

    }
    objc_msgSend(v4, "thumbnail");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [SFImage alloc];
      objc_msgSend(v4, "thumbnail");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SFImage initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[SFNewsCardSection setThumbnail:](v5, "setThumbnail:", v35);

    }
    objc_msgSend(v4, "providerImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [SFImage alloc];
      objc_msgSend(v4, "providerImage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SFImage initWithProtobuf:](v37, "initWithProtobuf:", v38);
      -[SFNewsCardSection setProviderImage:](v5, "setProviderImage:", v39);

    }
    objc_msgSend(v4, "providerTitle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = [SFRichText alloc];
      objc_msgSend(v4, "providerTitle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SFRichText initWithProtobuf:](v41, "initWithProtobuf:", v42);
      -[SFNewsCardSection setProviderTitle:](v5, "setProviderTitle:", v43);

    }
    if (objc_msgSend(v4, "overlayTextInImage"))
      -[SFNewsCardSection setOverlayTextInImage:](v5, "setOverlayTextInImage:", objc_msgSend(v4, "overlayTextInImage"));
    v44 = v5;

  }
  return v5;
}

- (void)setOverlayTextInImage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_overlayTextInImage = a3;
}

- (BOOL)hasOverlayTextInImage
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFNewsCardSection)initWithCoder:(id)a3
{
  id v4;
  SFNewsCardSection *v5;
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
  void *v36;
  void *v37;
  void *v38;

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
    -[SFNewsCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection title](v8, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNewsCardSection setTitle:](v5, "setTitle:", v14);

    -[SFCardSection subtitle](v8, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNewsCardSection setSubtitle:](v5, "setSubtitle:", v15);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNewsCardSection setThumbnail:](v5, "setThumbnail:", v16);

    -[SFCardSection providerImage](v8, "providerImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNewsCardSection setProviderImage:](v5, "setProviderImage:", v17);

    -[SFCardSection providerTitle](v8, "providerTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNewsCardSection setProviderTitle:](v5, "setProviderTitle:", v18);

    -[SFNewsCardSection setOverlayTextInImage:](v5, "setOverlayTextInImage:", -[SFCardSection overlayTextInImage](v8, "overlayTextInImage"));
    -[SFCardSection nextCard](v8, "nextCard");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v19);

    -[SFCardSection commands](v8, "commands");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v20);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v21);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v22);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v23);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v24);

    -[SFCardSection command](v8, "command");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v25);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v26);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v27);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v28);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v29);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v30);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v31);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v32);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v33);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v34);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v35);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v36);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v37);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v38);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFNewsCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBNewsCardSection *v2;
  void *v3;

  v2 = -[_SFPBNewsCardSection initWithFacade:]([_SFPBNewsCardSection alloc], "initWithFacade:", self);
  -[_SFPBNewsCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBNewsCardSection *v2;
  void *v3;

  v2 = -[_SFPBNewsCardSection initWithFacade:]([_SFPBNewsCardSection alloc], "initWithFacade:", self);
  -[_SFPBNewsCardSection jsonData](v2, "jsonData");
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SFNewsCardSection;
  v4 = -[SFCardSection copyWithZone:](&v26, sel_copyWithZone_, a3);
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
  -[SFNewsCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFNewsCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setTitle:", v16);

  -[SFNewsCardSection subtitle](self, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setSubtitle:", v18);

  -[SFNewsCardSection thumbnail](self, "thumbnail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setThumbnail:", v20);

  -[SFNewsCardSection providerImage](self, "providerImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setProviderImage:", v22);

  -[SFNewsCardSection providerTitle](self, "providerTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setProviderTitle:", v24);

  objc_msgSend(v4, "setOverlayTextInImage:", -[SFNewsCardSection overlayTextInImage](self, "overlayTextInImage"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SFNewsCardSection *v5;
  SFNewsCardSection *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  SFNewsCardSection *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  SFNewsCardSection *v43;
  _BOOL4 v44;
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
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  _BYTE v93[12];
  _QWORD v94[4];
  int v95;
  int v96;
  id v97;
  id v98;
  _QWORD v99[4];
  objc_super v100;

  v5 = (SFNewsCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v16) = 1;
    goto LABEL_85;
  }
  if (!-[SFNewsCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class())
    || (v100.receiver = self,
        v100.super_class = (Class)SFNewsCardSection,
        !-[SFCardSection isEqual:](&v100, sel_isEqual_, v5)))
  {
    LOBYTE(v16) = 0;
    goto LABEL_85;
  }
  v6 = v5;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v6, "punchoutOptions");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  v98 = v7;
  v95 = v97 != 0;
  v96 = v7 == 0;
  if (v96 == v95)
  {
    memset(v94, 0, sizeof(v94));
    v9 = 0;
    memset(v99, 0, sizeof(v99));
    v92 = 0;
    v10 = 0;
    v11 = 0;
    memset(v93, 0, sizeof(v93));
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    LOBYTE(v16) = 0;
  }
  else
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)v3;
    if (!v3
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v6, "punchoutOptions"),
          v87 = (void *)objc_claimAutoreleasedReturnValue(),
          v88 = v8,
          objc_msgSend(v8, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v94[3]) = v3 != 0;
      if ((v90 == 0) != (v89 != 0))
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v17 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v99[3]) = v17 != 0;
        v86 = (void *)v17;
        if (v17)
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v6;
          v20 = (void *)v18;
          v43 = v19;
          -[SFCardSection punchoutPickerTitle](v19, "punchoutPickerTitle");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v20;
          if (!objc_msgSend(v20, "isEqual:"))
          {
            v9 = 0;
            memset(v94, 0, 20);
            v92 = 0;
            v10 = 0;
            v11 = 0;
            memset(v93, 0, sizeof(v93));
            v12 = 0;
            memset(v99, 0, 28);
            v13 = 0;
            v14 = 0;
            v15 = 0;
            LOBYTE(v16) = 0;
            *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
            HIDWORD(v99[3]) = 1;
            v6 = v43;
            goto LABEL_26;
          }
          v6 = v43;
        }
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v85 == 0) == (v84 != 0))
        {
          v94[0] = 0;
          v9 = 0;
          v94[1] = 0;
          v92 = 0;
          v10 = 0;
          v11 = 0;
          memset(v93, 0, sizeof(v93));
          v12 = 0;
          memset(v99, 0, 28);
          v13 = 0;
          v14 = 0;
          v15 = 0;
          LOBYTE(v16) = 0;
          *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
          LODWORD(v94[2]) = 1;
        }
        else
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v99[3]) = v81 != 0;
          if (!v81
            || (-[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText"),
                v79 = (void *)objc_claimAutoreleasedReturnValue(),
                v80 = v21,
                objc_msgSend(v21, "isEqual:")))
          {
            v3 = -[SFCardSection canBeHidden](self, "canBeHidden");
            if ((_DWORD)v3 == -[SFCardSection canBeHidden](v6, "canBeHidden")
              && (v3 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  (_DWORD)v3 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
              && (v3 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  (_DWORD)v3 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
            {
              -[SFNewsCardSection type](self, "type");
              v3 = objc_claimAutoreleasedReturnValue();
              -[SFNewsCardSection type](v6, "type");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = (void *)v3;
              if ((v3 == 0) == (v77 != 0))
              {
                v94[0] = 0;
                v94[1] = 0;
                *(_QWORD *)v93 = 0;
                v92 = 0;
                v10 = 0;
                v11 = 0;
                memset(v99, 0, 24);
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                LOBYTE(v16) = 0;
                *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                LODWORD(v94[2]) = 1;
                *(_DWORD *)&v93[8] = 1;
                v9 = 1;
              }
              else
              {
                -[SFNewsCardSection type](self, "type");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                HIDWORD(v99[2]) = v76 != 0;
                if (!v76
                  || (-[SFNewsCardSection type](self, "type"),
                      v29 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFNewsCardSection type](v6, "type"),
                      v74 = (void *)objc_claimAutoreleasedReturnValue(),
                      v75 = v29,
                      objc_msgSend(v29, "isEqual:")))
                {
                  v3 = -[SFCardSection separatorStyle](self, "separatorStyle");
                  if ((_DWORD)v3 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
                  {
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCardSection backgroundColor](v6, "backgroundColor");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v73 == 0) == (v72 != 0))
                    {
                      *(_QWORD *)v93 = 0;
                      v92 = 0;
                      v10 = 0;
                      v11 = 0;
                      v12 = 0;
                      memset(v99, 0, 20);
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      LOBYTE(v16) = 0;
                      *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                      LODWORD(v94[2]) = 1;
                      *(_DWORD *)&v93[8] = 1;
                      v94[0] = 0x100000000;
                      v9 = 1;
                      v94[1] = 0x100000000;
                    }
                    else
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v30 = objc_claimAutoreleasedReturnValue();
                      LODWORD(v99[2]) = v30 != 0;
                      v71 = (void *)v30;
                      if (!v30
                        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                            v31 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFCardSection backgroundColor](v6, "backgroundColor"),
                            v67 = (void *)objc_claimAutoreleasedReturnValue(),
                            v68 = v31,
                            objc_msgSend(v31, "isEqual:")))
                      {
                        -[SFNewsCardSection title](self, "title");
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFNewsCardSection title](v6, "title");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v70 == 0) == (v69 != 0))
                        {
                          v99[0] = 0;
                          v99[1] = 0;
                          v92 = 0;
                          v10 = 0;
                          v11 = 0;
                          v12 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          LOBYTE(v16) = 0;
                          LODWORD(v94[3]) = 1;
                          v94[2] = 0x100000001;
                          *(_DWORD *)&v93[8] = 1;
                          v94[0] = 0x100000000;
                          v9 = 1;
                          v94[1] = 0x100000001;
                          *(_QWORD *)v93 = 0x100000000;
                        }
                        else
                        {
                          -[SFNewsCardSection title](self, "title");
                          v32 = objc_claimAutoreleasedReturnValue();
                          HIDWORD(v99[1]) = v32 != 0;
                          v66 = (void *)v32;
                          if (!v32
                            || (-[SFNewsCardSection title](self, "title"),
                                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFNewsCardSection title](v6, "title"),
                                v62 = (void *)objc_claimAutoreleasedReturnValue(),
                                v63 = v33,
                                objc_msgSend(v33, "isEqual:")))
                          {
                            -[SFNewsCardSection subtitle](self, "subtitle");
                            v65 = (void *)objc_claimAutoreleasedReturnValue();
                            -[SFNewsCardSection subtitle](v6, "subtitle");
                            v64 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((v65 == 0) == (v64 != 0))
                            {
                              v10 = 0;
                              *(_QWORD *)((char *)v99 + 4) = 0;
                              v92 = 0x100000000;
                              v11 = 0;
                              v12 = 0;
                              LODWORD(v99[0]) = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              LOBYTE(v16) = 0;
                              *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                              LODWORD(v94[2]) = 1;
                              *(_DWORD *)&v93[8] = 1;
                              v94[0] = 0x100000001;
                              v9 = 1;
                              v94[1] = 0x100000001;
                              *(_QWORD *)v93 = 0x100000000;
                            }
                            else
                            {
                              -[SFNewsCardSection subtitle](self, "subtitle");
                              v34 = objc_claimAutoreleasedReturnValue();
                              LODWORD(v99[1]) = v34 != 0;
                              v61 = (void *)v34;
                              if (!v34
                                || (-[SFNewsCardSection subtitle](self, "subtitle"),
                                    v35 = (void *)objc_claimAutoreleasedReturnValue(),
                                    -[SFNewsCardSection subtitle](v6, "subtitle"),
                                    v57 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v58 = v35,
                                    objc_msgSend(v35, "isEqual:")))
                              {
                                -[SFNewsCardSection thumbnail](self, "thumbnail");
                                v60 = (void *)objc_claimAutoreleasedReturnValue();
                                -[SFNewsCardSection thumbnail](v6, "thumbnail");
                                v59 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((v60 == 0) == (v59 != 0))
                                {
                                  v11 = 0;
                                  v99[0] = 0;
                                  v12 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  LOBYTE(v16) = 0;
                                  *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                  LODWORD(v94[2]) = 1;
                                  *(_DWORD *)&v93[8] = 1;
                                  v94[0] = 0x100000001;
                                  v9 = 1;
                                  v94[1] = 0x100000001;
                                  *(_QWORD *)v93 = 0x100000000;
                                  v10 = 1;
                                  v92 = 0x100000001;
                                }
                                else
                                {
                                  -[SFNewsCardSection thumbnail](self, "thumbnail");
                                  v36 = objc_claimAutoreleasedReturnValue();
                                  HIDWORD(v99[0]) = v36 != 0;
                                  v56 = (void *)v36;
                                  if (!v36
                                    || (-[SFNewsCardSection thumbnail](self, "thumbnail"),
                                        v37 = (void *)objc_claimAutoreleasedReturnValue(),
                                        -[SFNewsCardSection thumbnail](v6, "thumbnail"),
                                        v52 = (void *)objc_claimAutoreleasedReturnValue(),
                                        v53 = v37,
                                        objc_msgSend(v37, "isEqual:")))
                                  {
                                    -[SFNewsCardSection providerImage](self, "providerImage");
                                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[SFNewsCardSection providerImage](v6, "providerImage");
                                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                                    if ((v55 == 0) == (v54 != 0))
                                    {
                                      v12 = 0;
                                      LODWORD(v99[0]) = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      LOBYTE(v16) = 0;
                                      *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                      LODWORD(v94[2]) = 1;
                                      *(_DWORD *)&v93[8] = 1;
                                      v9 = 1;
                                      v94[1] = 0x100000001;
                                      v94[0] = 0x100000001;
                                      v92 = 0x100000001;
                                      v10 = 1;
                                      v11 = 1;
                                      *(_QWORD *)v93 = 0x100000001;
                                    }
                                    else
                                    {
                                      -[SFNewsCardSection providerImage](self, "providerImage");
                                      v38 = objc_claimAutoreleasedReturnValue();
                                      LODWORD(v99[0]) = v38 != 0;
                                      v51 = (void *)v38;
                                      if (!v38
                                        || (-[SFNewsCardSection providerImage](self, "providerImage"),
                                            v39 = (void *)objc_claimAutoreleasedReturnValue(),
                                            -[SFNewsCardSection providerImage](v6, "providerImage"),
                                            v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                            v48 = v39,
                                            objc_msgSend(v39, "isEqual:")))
                                      {
                                        -[SFNewsCardSection providerTitle](self, "providerTitle");
                                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[SFNewsCardSection providerTitle](v6, "providerTitle");
                                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                                        if ((v50 == 0) == (v49 != 0))
                                        {
                                          v14 = 0;
                                          v15 = 0;
                                          LOBYTE(v16) = 0;
                                          *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                          LODWORD(v94[2]) = 1;
                                          *(_DWORD *)&v93[8] = 1;
                                          v9 = 1;
                                          v94[1] = 0x100000001;
                                          v94[0] = 0x100000001;
                                          v92 = 0x100000001;
                                          v10 = 1;
                                          v11 = 1;
                                          *(_QWORD *)v93 = 0x100000001;
                                          v12 = 1;
                                          v13 = 1;
                                        }
                                        else
                                        {
                                          -[SFNewsCardSection providerTitle](self, "providerTitle");
                                          v40 = objc_claimAutoreleasedReturnValue();
                                          v44 = v40 != 0;
                                          v46 = (void *)v40;
                                          if (!v40
                                            || (-[SFNewsCardSection providerTitle](self, "providerTitle"),
                                                v41 = (void *)objc_claimAutoreleasedReturnValue(),
                                                -[SFNewsCardSection providerTitle](v6, "providerTitle"),
                                                v3 = objc_claimAutoreleasedReturnValue(),
                                                v45 = v41,
                                                objc_msgSend(v41, "isEqual:", v3)))
                                          {
                                            v42 = -[SFNewsCardSection overlayTextInImage](self, "overlayTextInImage");
                                            v16 = v42 ^ -[SFNewsCardSection overlayTextInImage](v6, "overlayTextInImage") ^ 1;
                                            *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                            LODWORD(v94[2]) = 1;
                                            *(_DWORD *)&v93[8] = 1;
                                            v9 = 1;
                                            v94[1] = 0x100000001;
                                            v94[0] = 0x100000001;
                                            v92 = 0x100000001;
                                            v10 = 1;
                                            v11 = 1;
                                            *(_QWORD *)v93 = 0x100000001;
                                            v12 = 1;
                                            v13 = 1;
                                            v14 = 1;
                                            v15 = v44;
                                          }
                                          else
                                          {
                                            LOBYTE(v16) = 0;
                                            *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                            LODWORD(v94[2]) = 1;
                                            *(_DWORD *)&v93[8] = 1;
                                            v9 = 1;
                                            v94[1] = 0x100000001;
                                            v94[0] = 0x100000001;
                                            v92 = 0x100000001;
                                            v10 = 1;
                                            v11 = 1;
                                            *(_QWORD *)v93 = 0x100000001;
                                            v12 = 1;
                                            v13 = 1;
                                            v14 = 1;
                                            v15 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        LOBYTE(v16) = 0;
                                        *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                        LODWORD(v94[2]) = 1;
                                        *(_DWORD *)&v93[8] = 1;
                                        v9 = 1;
                                        v94[1] = 0x100000001;
                                        v94[0] = 0x100000001;
                                        v92 = 0x100000001;
                                        v10 = 1;
                                        v11 = 1;
                                        *(_QWORD *)v93 = 0x100000001;
                                        v12 = 1;
                                        LODWORD(v99[0]) = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v12 = 0;
                                    v99[0] = 0x100000000;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    LOBYTE(v16) = 0;
                                    *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                    LODWORD(v94[2]) = 1;
                                    *(_DWORD *)&v93[8] = 1;
                                    v94[0] = 0x100000001;
                                    v9 = 1;
                                    v94[1] = 0x100000001;
                                    *(_QWORD *)v93 = 0x100000000;
                                    v92 = 0x100000001;
                                    v10 = 1;
                                    v11 = 1;
                                  }
                                }
                              }
                              else
                              {
                                v11 = 0;
                                v99[0] = 0;
                                v12 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                LOBYTE(v16) = 0;
                                *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                                LODWORD(v94[2]) = 1;
                                *(_DWORD *)&v93[8] = 1;
                                v94[0] = 0x100000001;
                                v9 = 1;
                                v94[1] = 0x100000001;
                                *(_QWORD *)v93 = 0x100000000;
                                v92 = 0x100000000;
                                v10 = 1;
                                LODWORD(v99[1]) = 1;
                              }
                            }
                          }
                          else
                          {
                            v92 = 0;
                            v10 = 0;
                            *(_QWORD *)((char *)v99 + 4) = 0;
                            v11 = 0;
                            v12 = 0;
                            LODWORD(v99[0]) = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            LOBYTE(v16) = 0;
                            LODWORD(v94[3]) = 1;
                            v94[2] = 0x100000001;
                            *(_DWORD *)&v93[8] = 1;
                            v94[0] = 0x100000001;
                            v9 = 1;
                            v94[1] = 0x100000001;
                            *(_QWORD *)v93 = 0x100000000;
                            HIDWORD(v99[1]) = 1;
                          }
                        }
                      }
                      else
                      {
                        *(_QWORD *)v93 = 0;
                        v99[0] = 0;
                        v99[1] = 0;
                        v92 = 0;
                        v10 = 0;
                        v11 = 0;
                        v12 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        LOBYTE(v16) = 0;
                        LODWORD(v94[3]) = 1;
                        v94[2] = 0x100000001;
                        *(_DWORD *)&v93[8] = 1;
                        v94[0] = 0x100000000;
                        v9 = 1;
                        v94[1] = 0x100000001;
                        LODWORD(v99[2]) = 1;
                      }
                    }
                  }
                  else
                  {
                    *(_QWORD *)((char *)v94 + 4) = 0;
                    *(_QWORD *)v93 = 0;
                    v92 = 0;
                    v10 = 0;
                    v11 = 0;
                    v12 = 0;
                    memset(v99, 0, 20);
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    LOBYTE(v16) = 0;
                    *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                    LODWORD(v94[2]) = 1;
                    *(_DWORD *)&v93[8] = 1;
                    LODWORD(v94[0]) = 0;
                    v9 = 1;
                    HIDWORD(v94[1]) = 1;
                  }
                }
                else
                {
                  *(_QWORD *)((char *)v94 + 4) = 0;
                  *(_QWORD *)v93 = 0;
                  v92 = 0;
                  v10 = 0;
                  v11 = 0;
                  v12 = 0;
                  memset(v99, 0, 20);
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  LOBYTE(v16) = 0;
                  *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
                  HIDWORD(v94[1]) = 1;
                  LODWORD(v94[2]) = 1;
                  *(_DWORD *)&v93[8] = 1;
                  LODWORD(v94[0]) = 0;
                  v9 = 1;
                  HIDWORD(v99[2]) = 1;
                }
              }
            }
            else
            {
              v9 = 0;
              v94[0] = 0;
              v94[1] = 0;
              *(_QWORD *)v93 = 0;
              v92 = 0;
              v10 = 0;
              v11 = 0;
              memset(v99, 0, 24);
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              LOBYTE(v16) = 0;
              *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
              LODWORD(v94[2]) = 1;
              *(_DWORD *)&v93[8] = 1;
            }
          }
          else
          {
            v9 = 0;
            v94[0] = 0;
            v94[1] = 0;
            *(_QWORD *)v93 = 0;
            v92 = 0;
            v10 = 0;
            v11 = 0;
            memset(v99, 0, 24);
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            LOBYTE(v16) = 0;
            *(_QWORD *)((char *)&v94[2] + 4) = 0x100000001;
            LODWORD(v94[2]) = 1;
            *(_DWORD *)&v93[8] = 1;
            LODWORD(v99[3]) = 1;
          }
        }
        goto LABEL_26;
      }
      memset(v94, 0, 24);
      v9 = 0;
      memset(v99, 0, sizeof(v99));
      v92 = 0;
      v10 = 0;
      v11 = 0;
      memset(v93, 0, sizeof(v93));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LOBYTE(v16) = 0;
      LODWORD(v94[3]) = 1;
    }
    else
    {
      v9 = 0;
      memset(v94, 0, 28);
      memset(v99, 0, sizeof(v99));
      v92 = 0;
      v10 = 0;
      v11 = 0;
      memset(v93, 0, sizeof(v93));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LOBYTE(v16) = 0;
      HIDWORD(v94[3]) = 1;
    }
  }
LABEL_26:
  if (v15)
  {
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = v13;
    v26 = v9;
    v27 = v14;

    v14 = v27;
    v9 = v26;
    v13 = v25;
    v12 = v24;
    v11 = v23;
    v10 = v22;
  }
  if (v14)

  if (v13)
  {

  }
  if (LODWORD(v99[0]))
  {

  }
  if (v12)

  if (*(_DWORD *)v93)
  {

  }
  if (HIDWORD(v99[0]))
  {

  }
  if (v11)

  if ((_DWORD)v92)
  {

  }
  if (LODWORD(v99[1]))
  {

  }
  if (v10)

  if (HIDWORD(v92))
  {

  }
  if (HIDWORD(v99[1]))
  {

  }
  if (LODWORD(v94[0]))

  if (*(_DWORD *)&v93[4])
  {

  }
  if (LODWORD(v99[2]))
  {

  }
  if (LODWORD(v94[1]))

  if (HIDWORD(v94[0]))
  {

  }
  if (HIDWORD(v99[2]))
  {

  }
  if (HIDWORD(v94[1]))

  if (v9)
  {

  }
  if (LODWORD(v99[3]))
  {

  }
  if (*(_DWORD *)&v93[8])

  if (LODWORD(v94[2]))
  {

  }
  if (HIDWORD(v99[3]))
  {

  }
  if (HIDWORD(v94[2]))

  if (LODWORD(v94[3]))
  {

  }
  if (HIDWORD(v94[3]))
  {

  }
  if (v96 != v95)

LABEL_85:
  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SFNewsCardSection;
  v3 = -[SFCardSection hash](&v30, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v29, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v28, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v27, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFNewsCardSection type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SFNewsCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8 ^ v14 ^ objc_msgSend(v15, "hash");
  -[SFNewsCardSection subtitle](self, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[SFNewsCardSection thumbnail](self, "thumbnail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[SFNewsCardSection providerImage](self, "providerImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFNewsCardSection providerTitle](self, "providerTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  v25 = v16 ^ v24 ^ -[SFNewsCardSection overlayTextInImage](self, "overlayTextInImage");

  return v25;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SFRichText)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (SFRichText)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (SFImage)providerImage
{
  return self->_providerImage;
}

- (void)setProviderImage:(id)a3
{
  objc_storeStrong((id *)&self->_providerImage, a3);
}

- (SFRichText)providerTitle
{
  return self->_providerTitle;
}

- (void)setProviderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_providerTitle, a3);
}

- (BOOL)overlayTextInImage
{
  return self->_overlayTextInImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerTitle, 0);
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
