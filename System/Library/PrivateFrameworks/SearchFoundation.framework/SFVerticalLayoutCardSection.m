@implementation SFVerticalLayoutCardSection

- (SFVerticalLayoutCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFVerticalLayoutCardSection *v5;
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
  SFImage *v25;
  void *v26;
  SFImage *v27;
  void *v28;
  SFRichText *v29;
  void *v30;
  SFRichText *v31;
  void *v32;
  SFRichText *v33;
  void *v34;
  SFRichText *v35;
  void *v36;
  SFRichText *v37;
  void *v38;
  SFRichText *v39;
  SFVerticalLayoutCardSection *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SFVerticalLayoutCardSection;
  v5 = -[SFCardSection init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
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
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
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
      -[SFVerticalLayoutCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "thumbnail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFImage alloc];
      objc_msgSend(v4, "thumbnail");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFImage initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFVerticalLayoutCardSection setThumbnail:](v5, "setThumbnail:", v27);

    }
    objc_msgSend(v4, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFRichText initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFVerticalLayoutCardSection setTitle:](v5, "setTitle:", v31);

    }
    objc_msgSend(v4, "footnote");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [SFRichText alloc];
      objc_msgSend(v4, "footnote");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SFRichText initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[SFVerticalLayoutCardSection setFootnote:](v5, "setFootnote:", v35);

    }
    if (objc_msgSend(v4, "contentsLeading"))
      -[SFVerticalLayoutCardSection setContentsLeading:](v5, "setContentsLeading:", objc_msgSend(v4, "contentsLeading"));
    objc_msgSend(v4, "thumbnailOverlayText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [SFRichText alloc];
      objc_msgSend(v4, "thumbnailOverlayText");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SFRichText initWithProtobuf:](v37, "initWithProtobuf:", v38);
      -[SFVerticalLayoutCardSection setThumbnailOverlayText:](v5, "setThumbnailOverlayText:", v39);

    }
    if (objc_msgSend(v4, "useAppIconMetrics"))
      -[SFVerticalLayoutCardSection setUseAppIconMetrics:](v5, "setUseAppIconMetrics:", objc_msgSend(v4, "useAppIconMetrics"));
    v40 = v5;

  }
  return v5;
}

- (void)setContentsLeading:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentsLeading = a3;
}

- (BOOL)hasContentsLeading
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUseAppIconMetrics:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_useAppIconMetrics = a3;
}

- (BOOL)hasUseAppIconMetrics
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFVerticalLayoutCardSection)initWithCoder:(id)a3
{
  id v4;
  SFVerticalLayoutCardSection *v5;
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
    -[SFVerticalLayoutCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFVerticalLayoutCardSection setThumbnail:](v5, "setThumbnail:", v14);

    -[SFCardSection title](v8, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFVerticalLayoutCardSection setTitle:](v5, "setTitle:", v15);

    -[SFCardSection footnote](v8, "footnote");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFVerticalLayoutCardSection setFootnote:](v5, "setFootnote:", v16);

    -[SFVerticalLayoutCardSection setContentsLeading:](v5, "setContentsLeading:", -[SFCardSection contentsLeading](v8, "contentsLeading"));
    -[SFCardSection thumbnailOverlayText](v8, "thumbnailOverlayText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFVerticalLayoutCardSection setThumbnailOverlayText:](v5, "setThumbnailOverlayText:", v17);

    -[SFVerticalLayoutCardSection setUseAppIconMetrics:](v5, "setUseAppIconMetrics:", -[SFCardSection useAppIconMetrics](v8, "useAppIconMetrics"));
    -[SFCardSection nextCard](v8, "nextCard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v18);

    -[SFCardSection commands](v8, "commands");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v19);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v20);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v21);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v22);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v23);

    -[SFCardSection command](v8, "command");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v24);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v25);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v26);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v27);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v28);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v29);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v30);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v31);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v32);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v33);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v34);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v35);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v36);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v37);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFVerticalLayoutCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBVerticalLayoutCardSection *v2;
  void *v3;

  v2 = -[_SFPBVerticalLayoutCardSection initWithFacade:]([_SFPBVerticalLayoutCardSection alloc], "initWithFacade:", self);
  -[_SFPBVerticalLayoutCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBVerticalLayoutCardSection *v2;
  void *v3;

  v2 = -[_SFPBVerticalLayoutCardSection initWithFacade:]([_SFPBVerticalLayoutCardSection alloc], "initWithFacade:", self);
  -[_SFPBVerticalLayoutCardSection jsonData](v2, "jsonData");
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SFVerticalLayoutCardSection;
  v4 = -[SFCardSection copyWithZone:](&v24, sel_copyWithZone_, a3);
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
  -[SFVerticalLayoutCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFVerticalLayoutCardSection thumbnail](self, "thumbnail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setThumbnail:", v16);

  -[SFVerticalLayoutCardSection title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setTitle:", v18);

  -[SFVerticalLayoutCardSection footnote](self, "footnote");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setFootnote:", v20);

  objc_msgSend(v4, "setContentsLeading:", -[SFVerticalLayoutCardSection contentsLeading](self, "contentsLeading"));
  -[SFVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setThumbnailOverlayText:", v22);

  objc_msgSend(v4, "setUseAppIconMetrics:", -[SFVerticalLayoutCardSection useAppIconMetrics](self, "useAppIconMetrics"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFVerticalLayoutCardSection *v5;
  SFVerticalLayoutCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
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
  _BOOL4 v45;
  void *v46;
  _BOOL4 v47;
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
  SFVerticalLayoutCardSection *v70;
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
  objc_super v88;

  v5 = (SFVerticalLayoutCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFVerticalLayoutCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v88.receiver = self;
      v88.super_class = (Class)SFVerticalLayoutCardSection;
      if (-[SFCardSection isEqual:](&v88, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v6, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_38:

          goto LABEL_39;
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
            LOBYTE(v11) = 0;
            goto LABEL_36;
          }
          v87 = v10;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
        {
LABEL_35:

          LOBYTE(v11) = 0;
          v10 = v87;
          if (!v9)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v81 = v8;
          v15 = v7;
          v16 = v9;
          v17 = v13;
          v18 = v12;
          v19 = v3;
          v20 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = (void *)v20;
          v21 = (void *)v20;
          v3 = v19;
          v12 = v18;
          v13 = v17;
          v9 = v16;
          v7 = v15;
          v8 = v81;
          if (!objc_msgSend(v21, "isEqual:"))
            goto LABEL_33;
        }
        v85 = v3;
        v86 = v14;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) == (v23 != 0))
        {

          goto LABEL_32;
        }
        v78 = v22;
        v79 = v23;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v24 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = (void *)v24;
          v25 = (void *)v24;
          v14 = v86;
          v26 = v80;
          if (!objc_msgSend(v25, "isEqual:"))
            goto LABEL_30;
        }
        v27 = -[SFCardSection canBeHidden](self, "canBeHidden");
        if (v27 == -[SFCardSection canBeHidden](v6, "canBeHidden"))
        {
          v28 = -[SFCardSection hasTopPadding](self, "hasTopPadding");
          if (v28 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
          {
            v29 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
            if (v29 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding"))
            {
              -[SFVerticalLayoutCardSection type](self, "type");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFVerticalLayoutCardSection type](v6, "type");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v30 == 0) != (v31 != 0))
              {
                v74 = v31;
                v75 = v30;
                -[SFVerticalLayoutCardSection type](self, "type");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v80;
                if (v32)
                {
                  -[SFVerticalLayoutCardSection type](self, "type");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFVerticalLayoutCardSection type](v6, "type");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v73, "isEqual:"))
                  {
LABEL_54:

LABEL_55:
                    v14 = v86;
                    if (!v26)
                      goto LABEL_31;
                    goto LABEL_30;
                  }
                }
                v72 = v32;
                v34 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v34 != -[SFCardSection separatorStyle](v6, "separatorStyle"))
                {
LABEL_53:
                  v26 = v80;
                  v32 = v72;
                  if (!v72)
                    goto LABEL_55;
                  goto LABEL_54;
                }
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFCardSection backgroundColor](v6, "backgroundColor");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v35 == 0) == (v36 != 0))
                {

                  goto LABEL_53;
                }
                v67 = v36;
                v82 = v8;
                v66 = v7;
                v68 = v13;
                v69 = v12;
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (v37)
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v6, "backgroundColor");
                  v8 = v38;
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v38, "isEqual:"))
                    goto LABEL_51;
                }
                -[SFVerticalLayoutCardSection thumbnail](self, "thumbnail");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v6;
                -[SFVerticalLayoutCardSection thumbnail](v6, "thumbnail");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v40;
                if ((v39 == 0) == (v40 != 0))
                {

                  v6 = v70;
                  if (!v37)
                  {
LABEL_52:

                    v13 = v68;
                    v12 = v69;
                    v7 = v66;
                    v8 = v82;
                    goto LABEL_53;
                  }
LABEL_51:

                  goto LABEL_52;
                }
                -[SFVerticalLayoutCardSection thumbnail](self, "thumbnail");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                if (v65)
                {
                  -[SFVerticalLayoutCardSection thumbnail](self, "thumbnail");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFVerticalLayoutCardSection thumbnail](v70, "thumbnail");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = v42;
                  if (!objc_msgSend(v42, "isEqual:"))
                    goto LABEL_62;
                }
                -[SFVerticalLayoutCardSection title](self, "title");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFVerticalLayoutCardSection title](v70, "title");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v64 == 0) == (v63 != 0))
                {

                  if (!v65)
                  {
LABEL_63:

                    if (v37)
                    {

                    }
                    if (v72)
                    {

                    }
                    if (v80)
                    {

                    }
                    if (!v86)
                    {
LABEL_89:

                      LOBYTE(v11) = 0;
                      if (v9)
                      {
LABEL_90:
                        v10 = v87;
                        v3 = v85;
                        v7 = v66;
                        v8 = v82;
                        v6 = v70;
                        goto LABEL_36;
                      }
LABEL_116:
                      v7 = v66;
                      v8 = v82;
                      v6 = v70;
                      goto LABEL_37;
                    }
LABEL_87:

LABEL_88:
                    goto LABEL_89;
                  }
LABEL_62:

                  goto LABEL_63;
                }
                -[SFVerticalLayoutCardSection title](self, "title");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (v60)
                {
                  -[SFVerticalLayoutCardSection title](self, "title");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFVerticalLayoutCardSection title](v70, "title");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = v43;
                  if (!objc_msgSend(v43, "isEqual:"))
                  {
LABEL_77:

LABEL_78:
                    if (v65)
                    {

                    }
                    if (v37)
                    {

                    }
                    if (v72)
                    {

                    }
                    if (v80)
                    {

                    }
                    if (!v86)
                      goto LABEL_88;
                    goto LABEL_87;
                  }
                }
                -[SFVerticalLayoutCardSection footnote](self, "footnote");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFVerticalLayoutCardSection footnote](v70, "footnote");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v59 == 0) == (v58 != 0))
                {

                  if (!v60)
                    goto LABEL_78;
                  goto LABEL_77;
                }
                -[SFVerticalLayoutCardSection footnote](self, "footnote");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  -[SFVerticalLayoutCardSection footnote](self, "footnote");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFVerticalLayoutCardSection footnote](v70, "footnote");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = v44;
                  if (!objc_msgSend(v44, "isEqual:"))
                  {
                    LOBYTE(v11) = 0;
LABEL_102:

LABEL_103:
                    if (v60)
                    {

                    }
                    if (v65)
                    {

                    }
                    if (v37)
                    {

                    }
                    if (v72)
                    {

                    }
                    if (v80)
                    {

                    }
                    if (v86)
                    {

                    }
                    if (v9)
                      goto LABEL_90;
                    goto LABEL_116;
                  }
                }
                v45 = -[SFVerticalLayoutCardSection contentsLeading](self, "contentsLeading");
                if (v45 == -[SFVerticalLayoutCardSection contentsLeading](v70, "contentsLeading"))
                {
                  -[SFVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFVerticalLayoutCardSection thumbnailOverlayText](v70, "thumbnailOverlayText");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v52 == 0) != (v51 != 0))
                  {
                    -[SFVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v50
                      || (-[SFVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText"),
                          v46 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFVerticalLayoutCardSection thumbnailOverlayText](v70, "thumbnailOverlayText"),
                          v48 = (void *)objc_claimAutoreleasedReturnValue(),
                          v49 = v46,
                          objc_msgSend(v46, "isEqual:")))
                    {
                      v47 = -[SFVerticalLayoutCardSection useAppIconMetrics](self, "useAppIconMetrics");
                      v11 = v47 ^ -[SFVerticalLayoutCardSection useAppIconMetrics](v70, "useAppIconMetrics") ^ 1;
                      if (!v50)
                      {
LABEL_100:

LABEL_101:
                        if (!v55)
                          goto LABEL_103;
                        goto LABEL_102;
                      }
                    }
                    else
                    {
                      LOBYTE(v11) = 0;
                    }

                    goto LABEL_100;
                  }

                }
                LOBYTE(v11) = 0;
                goto LABEL_101;
              }

            }
          }
        }
        v14 = v86;
        v26 = v80;
        if (!v80)
        {
LABEL_31:

LABEL_32:
          v3 = v85;
          if (!v14)
          {
LABEL_34:

            goto LABEL_35;
          }
LABEL_33:

          goto LABEL_34;
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_39:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SFVerticalLayoutCardSection;
  v3 = -[SFCardSection hash](&v29, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v28, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v27, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v9 = v8 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v10 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFVerticalLayoutCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  v13 = v12 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[SFVerticalLayoutCardSection thumbnail](self, "thumbnail");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9 ^ v15 ^ objc_msgSend(v16, "hash");
  -[SFVerticalLayoutCardSection title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  -[SFVerticalLayoutCardSection footnote](self, "footnote");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  v22 = v21 ^ -[SFVerticalLayoutCardSection contentsLeading](self, "contentsLeading");
  -[SFVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  v25 = v17 ^ v24 ^ -[SFVerticalLayoutCardSection useAppIconMetrics](self, "useAppIconMetrics");

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

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (SFRichText)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (SFRichText)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_storeStrong((id *)&self->_footnote, a3);
}

- (BOOL)contentsLeading
{
  return self->_contentsLeading;
}

- (SFRichText)thumbnailOverlayText
{
  return self->_thumbnailOverlayText;
}

- (void)setThumbnailOverlayText:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailOverlayText, a3);
}

- (BOOL)useAppIconMetrics
{
  return self->_useAppIconMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailOverlayText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
