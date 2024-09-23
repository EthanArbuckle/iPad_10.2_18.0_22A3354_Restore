@implementation SFDetailedRowCardSection

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_preventThumbnailImageScaling = a3;
}

- (BOOL)hasPreventThumbnailImageScaling
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsSecondaryTitleDetached:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isSecondaryTitleDetached = a3;
}

- (BOOL)hasIsSecondaryTitleDetached
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShouldUseCompactDisplay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_shouldUseCompactDisplay = a3;
}

- (BOOL)hasShouldUseCompactDisplay
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_buttonItemsAreTrailing = a3;
}

- (BOOL)hasButtonItemsAreTrailing
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFDetailedRowCardSection)initWithCoder:(id)a3
{
  id v4;
  SFDetailedRowCardSection *v5;
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
    -[SFDetailedRowCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setThumbnail:](v5, "setThumbnail:", v14);

    -[SFDetailedRowCardSection setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", -[SFCardSection preventThumbnailImageScaling](v8, "preventThumbnailImageScaling"));
    -[SFCardSection title](v8, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setTitle:](v5, "setTitle:", v15);

    -[SFCardSection secondaryTitle](v8, "secondaryTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setSecondaryTitle:](v5, "setSecondaryTitle:", v16);

    -[SFCardSection secondaryTitleImage](v8, "secondaryTitleImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setSecondaryTitleImage:](v5, "setSecondaryTitleImage:", v17);

    -[SFDetailedRowCardSection setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", -[SFCardSection isSecondaryTitleDetached](v8, "isSecondaryTitleDetached"));
    -[SFCardSection descriptions](v8, "descriptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setDescriptions:](v5, "setDescriptions:", v18);

    -[SFCardSection footnote](v8, "footnote");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setFootnote:](v5, "setFootnote:", v19);

    -[SFCardSection trailingTopText](v8, "trailingTopText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setTrailingTopText:](v5, "setTrailingTopText:", v20);

    -[SFCardSection trailingMiddleText](v8, "trailingMiddleText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setTrailingMiddleText:](v5, "setTrailingMiddleText:", v21);

    -[SFCardSection trailingBottomText](v8, "trailingBottomText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setTrailingBottomText:](v5, "setTrailingBottomText:", v22);

    -[SFCardSection action](v8, "action");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setAction:](v5, "setAction:", v23);

    -[SFCardSection button](v8, "button");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setButton:](v5, "setButton:", v24);

    -[SFDetailedRowCardSection setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", -[SFCardSection shouldUseCompactDisplay](v8, "shouldUseCompactDisplay"));
    -[SFCardSection buttonItems](v8, "buttonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setButtonItems:](v5, "setButtonItems:", v25);

    -[SFCardSection trailingThumbnail](v8, "trailingThumbnail");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setTrailingThumbnail:](v5, "setTrailingThumbnail:", v26);

    -[SFDetailedRowCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", -[SFCardSection buttonItemsAreTrailing](v8, "buttonItemsAreTrailing"));
    -[SFCardSection topText](v8, "topText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setTopText:](v5, "setTopText:", v27);

    -[SFCardSection richTrailingTopText](v8, "richTrailingTopText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setRichTrailingTopText:](v5, "setRichTrailingTopText:", v28);

    -[SFCardSection richTrailingMiddleText](v8, "richTrailingMiddleText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setRichTrailingMiddleText:](v5, "setRichTrailingMiddleText:", v29);

    -[SFCardSection richTrailingBottomText](v8, "richTrailingBottomText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDetailedRowCardSection setRichTrailingBottomText:](v5, "setRichTrailingBottomText:", v30);

    -[SFCardSection nextCard](v8, "nextCard");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v31);

    -[SFCardSection commands](v8, "commands");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v32);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v33);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v34);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v35);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v36);

    -[SFCardSection command](v8, "command");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v37);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v38);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v39);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v40);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v41);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v42);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v43);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v44);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v45);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v46);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v47);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v48);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v49);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v50);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFDetailedRowCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBDetailedRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBDetailedRowCardSection initWithFacade:]([_SFPBDetailedRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBDetailedRowCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBDetailedRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBDetailedRowCardSection initWithFacade:]([_SFPBDetailedRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBDetailedRowCardSection jsonData](v2, "jsonData");
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)SFDetailedRowCardSection;
  v4 = -[SFCardSection copyWithZone:](&v50, sel_copyWithZone_, a3);
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
  -[SFDetailedRowCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFDetailedRowCardSection thumbnail](self, "thumbnail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setThumbnail:", v16);

  objc_msgSend(v4, "setPreventThumbnailImageScaling:", -[SFDetailedRowCardSection preventThumbnailImageScaling](self, "preventThumbnailImageScaling"));
  -[SFDetailedRowCardSection title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setTitle:", v18);

  -[SFDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setSecondaryTitle:", v20);

  -[SFDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setSecondaryTitleImage:", v22);

  objc_msgSend(v4, "setIsSecondaryTitleDetached:", -[SFDetailedRowCardSection isSecondaryTitleDetached](self, "isSecondaryTitleDetached"));
  -[SFDetailedRowCardSection descriptions](self, "descriptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setDescriptions:", v24);

  -[SFDetailedRowCardSection footnote](self, "footnote");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setFootnote:", v26);

  -[SFDetailedRowCardSection trailingTopText](self, "trailingTopText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setTrailingTopText:", v28);

  -[SFDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setTrailingMiddleText:", v30);

  -[SFDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setTrailingBottomText:", v32);

  -[SFDetailedRowCardSection action](self, "action");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setAction:", v34);

  -[SFDetailedRowCardSection button](self, "button");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setButton:", v36);

  objc_msgSend(v4, "setShouldUseCompactDisplay:", -[SFDetailedRowCardSection shouldUseCompactDisplay](self, "shouldUseCompactDisplay"));
  -[SFDetailedRowCardSection buttonItems](self, "buttonItems");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setButtonItems:", v38);

  -[SFDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setTrailingThumbnail:", v40);

  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[SFDetailedRowCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
  -[SFDetailedRowCardSection topText](self, "topText");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setTopText:", v42);

  -[SFDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v4, "setRichTrailingTopText:", v44);

  -[SFDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  objc_msgSend(v4, "setRichTrailingMiddleText:", v46);

  -[SFDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v4, "setRichTrailingBottomText:", v48);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v4;
  SFDetailedRowCardSection *v6;
  SFDetailedRowCardSection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  int v18;
  int v19;
  SFDetailedRowCardSection *v20;
  int v21;
  int v22;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  _BOOL4 v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  _BOOL4 v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
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
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  uint64_t v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  _BYTE v204[20];
  uint64_t v205;
  _BOOL4 v206;
  int v207;
  _BOOL4 v208;
  int v209;
  _BOOL4 v210;
  _BOOL4 v211;
  _BOOL4 v212;
  _BOOL4 v213;
  _BOOL4 v214;
  _BOOL4 v215;
  _BOOL4 v216;
  _BOOL4 v217;
  uint64_t v218;
  int v219;
  int v220;
  id v221;
  id v222;
  _BOOL4 v223;
  _BOOL4 v224;
  _BOOL4 v225;
  __int128 v226;
  objc_super v227;

  v6 = (SFDetailedRowCardSection *)a3;
  if (self == v6)
  {
    v16 = 1;
    goto LABEL_147;
  }
  if (!-[SFDetailedRowCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class())
    || (v227.receiver = self,
        v227.super_class = (Class)SFDetailedRowCardSection,
        !-[SFCardSection isEqual:](&v227, sel_isEqual_, v6)))
  {
    v16 = 0;
    goto LABEL_147;
  }
  v7 = v6;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v7, "punchoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = v9;
  v222 = v8;
  v219 = v9 != 0;
  v220 = v8 == 0;
  if (v220 == v219)
  {
    v218 = 0;
    v209 = 0;
    v207 = 0;
    v226 = 0uLL;
    v205 = 0;
    memset(v204, 0, sizeof(v204));
    v11 = 0;
    v203 = 0;
    v201 = 0;
    v198 = 0;
    v199 = 0;
    v225 = 0;
    v193 = 0;
    v195 = 0;
    v224 = 0;
    v190 = 0;
    v223 = 0;
    v187 = 0;
    v191 = 0;
    v217 = 0;
    v183 = 0;
    v186 = 0;
    v216 = 0;
    v178 = 0;
    v184 = 0;
    v215 = 0;
    v176 = 0;
    v182 = 0;
    v214 = 0;
    v174 = 0;
    v180 = 0;
    v213 = 0;
    v175 = 0;
    v181 = 0;
    v212 = 0;
    v177 = 0;
    v179 = 0;
    v211 = 0;
    v185 = 0;
    v189 = 0;
    v210 = 0;
    v188 = 0;
    v192 = 0;
    v208 = 0;
    v194 = 0;
    v196 = 0;
    v206 = 0;
    v197 = 0;
    v200 = 0;
    v202 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  else
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v10 = objc_claimAutoreleasedReturnValue();
    v4 = v10 != 0;
    v173 = (void *)v10;
    if (!v10
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v7, "punchoutOptions"),
          v170 = v3,
          v169 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v218) = v4;
      if ((v172 == 0) == (v171 != 0))
      {
        v207 = 0;
        v226 = 0uLL;
        v205 = 0;
        memset(v204, 0, sizeof(v204));
        LODWORD(v218) = 0;
        v11 = 0;
        v203 = 0;
        v201 = 0;
        v198 = 0;
        v199 = 0;
        v225 = 0;
        v193 = 0;
        v195 = 0;
        v224 = 0;
        v190 = 0;
        v223 = 0;
        v187 = 0;
        v191 = 0;
        v217 = 0;
        v183 = 0;
        v186 = 0;
        v216 = 0;
        v178 = 0;
        v184 = 0;
        v215 = 0;
        v176 = 0;
        v182 = 0;
        v214 = 0;
        v174 = 0;
        v180 = 0;
        v213 = 0;
        v175 = 0;
        v181 = 0;
        v212 = 0;
        v177 = 0;
        v179 = 0;
        v211 = 0;
        v185 = 0;
        v189 = 0;
        v210 = 0;
        v188 = 0;
        v192 = 0;
        v208 = 0;
        v194 = 0;
        v196 = 0;
        v206 = 0;
        v197 = 0;
        v200 = 0;
        v202 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v209 = 1;
      }
      else
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v17 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v226) = v17 != 0;
        v168 = (void *)v17;
        if (!v17
          || (-[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle"),
              v165 = v3,
              v164 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:")))
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v7, "punchoutPickerDismissText");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v167 == 0) == (v166 != 0))
          {
            memset(v204, 0, sizeof(v204));
            *(_QWORD *)((char *)&v226 + 4) = 0;
            LODWORD(v218) = 0;
            v11 = 0;
            v203 = 0;
            v201 = 0;
            LODWORD(v226) = 0;
            v198 = 0;
            v199 = 0;
            v225 = 0;
            v193 = 0;
            v195 = 0;
            v224 = 0;
            v190 = 0;
            v223 = 0;
            v187 = 0;
            v191 = 0;
            v217 = 0;
            v183 = 0;
            v186 = 0;
            v216 = 0;
            v178 = 0;
            v184 = 0;
            v215 = 0;
            v176 = 0;
            v182 = 0;
            v214 = 0;
            v174 = 0;
            v180 = 0;
            v213 = 0;
            v175 = 0;
            v181 = 0;
            v212 = 0;
            v177 = 0;
            v179 = 0;
            v211 = 0;
            v185 = 0;
            v189 = 0;
            v210 = 0;
            v188 = 0;
            v192 = 0;
            v208 = 0;
            v194 = 0;
            v196 = 0;
            v206 = 0;
            v197 = 0;
            v200 = 0;
            v202 = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v209 = 1;
            v207 = 1;
            v205 = 1;
          }
          else
          {
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v24 = objc_claimAutoreleasedReturnValue();
            DWORD2(v226) = v24 != 0;
            v163 = (void *)v24;
            if (!v24
              || (-[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText"),
                  v3 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFCardSection punchoutPickerDismissText](v7, "punchoutPickerDismissText"),
                  v162 = v3,
                  v161 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v3, "isEqual:")))
            {
              v25 = -[SFCardSection canBeHidden](self, "canBeHidden");
              if (v25 == -[SFCardSection canBeHidden](v7, "canBeHidden")
                && (v26 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                    v26 == -[SFCardSection hasTopPadding](v7, "hasTopPadding"))
                && (v27 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                    v27 == -[SFCardSection hasBottomPadding](v7, "hasBottomPadding")))
              {
                -[SFDetailedRowCardSection type](self, "type");
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFDetailedRowCardSection type](v7, "type");
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v160 == 0) != (v159 != 0))
                {
                  -[SFDetailedRowCardSection type](self, "type");
                  v28 = objc_claimAutoreleasedReturnValue();
                  v29 = v28 != 0;
                  v158 = (void *)v28;
                  if (v28)
                  {
                    -[SFDetailedRowCardSection type](self, "type");
                    v3 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFDetailedRowCardSection type](v7, "type");
                    v157 = v3;
                    v156 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v3, "isEqual:"))
                    {
                      v11 = 0;
                      *(_QWORD *)&v226 = 0;
                      v203 = 0;
                      v201 = 0;
                      v198 = 0;
                      v199 = 0;
                      v225 = 0;
                      v193 = 0;
                      v195 = 0;
                      v224 = 0;
                      v190 = 0;
                      v223 = 0;
                      v187 = 0;
                      v191 = 0;
                      v217 = 0;
                      v183 = 0;
                      v186 = 0;
                      v216 = 0;
                      v178 = 0;
                      v184 = 0;
                      v215 = 0;
                      v176 = 0;
                      v182 = 0;
                      v214 = 0;
                      v174 = 0;
                      v180 = 0;
                      v213 = 0;
                      v175 = 0;
                      v181 = 0;
                      v212 = 0;
                      v177 = 0;
                      v179 = 0;
                      v211 = 0;
                      v185 = 0;
                      v189 = 0;
                      v210 = 0;
                      v188 = 0;
                      v192 = 0;
                      v208 = 0;
                      v194 = 0;
                      v196 = 0;
                      v206 = 0;
                      v197 = 0;
                      v200 = 0;
                      v202 = 0;
                      v12 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v209 = 1;
                      v207 = 1;
                      v205 = 1;
                      *(_QWORD *)v204 = 1;
                      *(_DWORD *)&v204[16] = 0;
                      *(_QWORD *)&v204[8] = 0x100000001;
                      LODWORD(v218) = 1;
                      goto LABEL_16;
                    }
                    LODWORD(v218) = v29;
                  }
                  else
                  {
                    LODWORD(v218) = 0;
                  }
                  v30 = -[SFCardSection separatorStyle](self, "separatorStyle");
                  if (v30 == -[SFCardSection separatorStyle](v7, "separatorStyle"))
                  {
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v155 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCardSection backgroundColor](v7, "backgroundColor");
                    v154 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v155 == 0) == (v154 != 0))
                    {
                      *(_DWORD *)&v204[4] = 0;
                      *(_QWORD *)&v226 = 0;
                      v203 = 0;
                      v201 = 0;
                      v198 = 0;
                      v199 = 0;
                      v225 = 0;
                      v193 = 0;
                      v195 = 0;
                      v224 = 0;
                      v190 = 0;
                      v223 = 0;
                      v187 = 0;
                      v191 = 0;
                      v217 = 0;
                      v183 = 0;
                      v186 = 0;
                      v216 = 0;
                      v178 = 0;
                      v184 = 0;
                      v215 = 0;
                      v176 = 0;
                      v182 = 0;
                      v214 = 0;
                      v174 = 0;
                      v180 = 0;
                      v213 = 0;
                      v175 = 0;
                      v181 = 0;
                      v212 = 0;
                      v177 = 0;
                      v179 = 0;
                      v211 = 0;
                      v185 = 0;
                      v189 = 0;
                      v210 = 0;
                      v188 = 0;
                      v192 = 0;
                      v208 = 0;
                      v194 = 0;
                      v196 = 0;
                      v206 = 0;
                      v197 = 0;
                      v200 = 0;
                      v202 = 0;
                      v12 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v209 = 1;
                      v207 = 1;
                      v205 = 1;
                      *(_DWORD *)v204 = 1;
                      *(_QWORD *)&v204[12] = 1;
                      *(_DWORD *)&v204[8] = 1;
                      v11 = 1;
                    }
                    else
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v31 = objc_claimAutoreleasedReturnValue();
                      DWORD1(v226) = v31 != 0;
                      v153 = (void *)v31;
                      if (!v31
                        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                            v32 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFCardSection backgroundColor](v7, "backgroundColor"),
                            v150 = v32,
                            v149 = (void *)objc_claimAutoreleasedReturnValue(),
                            objc_msgSend(v32, "isEqual:")))
                      {
                        -[SFDetailedRowCardSection thumbnail](self, "thumbnail");
                        v152 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFDetailedRowCardSection thumbnail](v7, "thumbnail");
                        v151 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v152 == 0) == (v151 != 0))
                        {
                          v201 = 0;
                          LODWORD(v226) = 0;
                          v198 = 0;
                          v199 = 0;
                          v225 = 0;
                          v193 = 0;
                          v195 = 0;
                          v224 = 0;
                          v190 = 0;
                          v223 = 0;
                          v187 = 0;
                          v191 = 0;
                          v217 = 0;
                          v183 = 0;
                          v186 = 0;
                          v216 = 0;
                          v178 = 0;
                          v184 = 0;
                          v215 = 0;
                          v176 = 0;
                          v182 = 0;
                          v214 = 0;
                          v174 = 0;
                          v180 = 0;
                          v213 = 0;
                          v175 = 0;
                          v181 = 0;
                          v212 = 0;
                          v177 = 0;
                          v179 = 0;
                          v211 = 0;
                          v185 = 0;
                          v189 = 0;
                          v210 = 0;
                          v188 = 0;
                          v192 = 0;
                          v208 = 0;
                          v194 = 0;
                          v196 = 0;
                          v206 = 0;
                          v197 = 0;
                          v200 = 0;
                          v12 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v209 = 1;
                          v207 = 1;
                          v205 = 1;
                          *(_QWORD *)v204 = 0x100000001;
                          *(_DWORD *)&v204[16] = 0;
                          *(_QWORD *)&v204[8] = 0x100000001;
                          v11 = 1;
                          v202 = 0;
                          v203 = 1;
                        }
                        else
                        {
                          -[SFDetailedRowCardSection thumbnail](self, "thumbnail");
                          v33 = objc_claimAutoreleasedReturnValue();
                          LODWORD(v226) = v33 != 0;
                          v148 = (void *)v33;
                          if (!v33
                            || (-[SFDetailedRowCardSection thumbnail](self, "thumbnail"),
                                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFDetailedRowCardSection thumbnail](v7, "thumbnail"),
                                v147 = v34,
                                v146 = (void *)objc_claimAutoreleasedReturnValue(),
                                objc_msgSend(v34, "isEqual:")))
                          {
                            v35 = -[SFDetailedRowCardSection preventThumbnailImageScaling](self, "preventThumbnailImageScaling");
                            if (v35 == -[SFDetailedRowCardSection preventThumbnailImageScaling](v7, "preventThumbnailImageScaling"))
                            {
                              -[SFDetailedRowCardSection title](self, "title");
                              v145 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SFDetailedRowCardSection title](v7, "title");
                              v144 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((v145 == 0) == (v144 != 0))
                              {
                                v199 = 0;
                                v225 = 0;
                                v193 = 0;
                                v195 = 0;
                                v224 = 0;
                                v190 = 0;
                                v223 = 0;
                                v187 = 0;
                                v191 = 0;
                                v217 = 0;
                                v183 = 0;
                                v186 = 0;
                                v216 = 0;
                                v178 = 0;
                                v184 = 0;
                                v215 = 0;
                                v176 = 0;
                                v182 = 0;
                                v214 = 0;
                                v174 = 0;
                                v180 = 0;
                                v213 = 0;
                                v175 = 0;
                                v181 = 0;
                                v212 = 0;
                                v177 = 0;
                                v179 = 0;
                                v211 = 0;
                                v185 = 0;
                                v189 = 0;
                                v210 = 0;
                                v188 = 0;
                                v192 = 0;
                                v208 = 0;
                                v194 = 0;
                                v196 = 0;
                                v206 = 0;
                                v197 = 0;
                                v200 = 0;
                                v12 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                v209 = 1;
                                v207 = 1;
                                v205 = 1;
                                *(_QWORD *)v204 = 0x100000001;
                                *(_DWORD *)&v204[16] = 0;
                                *(_QWORD *)&v204[8] = 0x100000001;
                                v11 = 1;
                                v202 = 0;
                                v203 = 1;
                                v201 = 1;
                                v198 = 1;
                              }
                              else
                              {
                                -[SFDetailedRowCardSection title](self, "title");
                                v36 = objc_claimAutoreleasedReturnValue();
                                v225 = v36 != 0;
                                v143 = (void *)v36;
                                if (!v36
                                  || (-[SFDetailedRowCardSection title](self, "title"),
                                      v37 = (void *)objc_claimAutoreleasedReturnValue(),
                                      -[SFDetailedRowCardSection title](v7, "title"),
                                      v140 = v37,
                                      v139 = (void *)objc_claimAutoreleasedReturnValue(),
                                      objc_msgSend(v37, "isEqual:")))
                                {
                                  -[SFDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
                                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[SFDetailedRowCardSection secondaryTitle](v7, "secondaryTitle");
                                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((v142 == 0) == (v141 != 0))
                                  {
                                    v195 = 0;
                                    v224 = 0;
                                    v190 = 0;
                                    v223 = 0;
                                    v187 = 0;
                                    v191 = 0;
                                    v217 = 0;
                                    v183 = 0;
                                    v186 = 0;
                                    v216 = 0;
                                    v178 = 0;
                                    v184 = 0;
                                    v215 = 0;
                                    v176 = 0;
                                    v182 = 0;
                                    v214 = 0;
                                    v174 = 0;
                                    v180 = 0;
                                    v213 = 0;
                                    v175 = 0;
                                    v181 = 0;
                                    v212 = 0;
                                    v177 = 0;
                                    v179 = 0;
                                    v211 = 0;
                                    v185 = 0;
                                    v189 = 0;
                                    v210 = 0;
                                    v188 = 0;
                                    v192 = 0;
                                    v208 = 0;
                                    v194 = 0;
                                    v196 = 0;
                                    v206 = 0;
                                    v197 = 0;
                                    v200 = 0;
                                    v12 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    v209 = 1;
                                    v207 = 1;
                                    v205 = 1;
                                    *(_QWORD *)v204 = 0x100000001;
                                    *(_DWORD *)&v204[16] = 0;
                                    *(_QWORD *)&v204[8] = 0x100000001;
                                    v11 = 1;
                                    v202 = 0;
                                    v203 = 1;
                                    v201 = 1;
                                    v198 = 1;
                                    v199 = 1;
                                    v193 = 1;
                                  }
                                  else
                                  {
                                    -[SFDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
                                    v38 = objc_claimAutoreleasedReturnValue();
                                    v224 = v38 != 0;
                                    v138 = (void *)v38;
                                    if (!v38
                                      || (-[SFDetailedRowCardSection secondaryTitle](self, "secondaryTitle"),
                                          v39 = (void *)objc_claimAutoreleasedReturnValue(),
                                          -[SFDetailedRowCardSection secondaryTitle](v7, "secondaryTitle"),
                                          v135 = v39,
                                          v134 = (void *)objc_claimAutoreleasedReturnValue(),
                                          objc_msgSend(v39, "isEqual:")))
                                    {
                                      -[SFDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
                                      v137 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[SFDetailedRowCardSection secondaryTitleImage](v7, "secondaryTitleImage");
                                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                                      if ((v137 == 0) == (v136 != 0))
                                      {
                                        v190 = 0x100000000;
                                        v223 = 0;
                                        v187 = 0;
                                        v191 = 0;
                                        v217 = 0;
                                        v183 = 0;
                                        v186 = 0;
                                        v216 = 0;
                                        v178 = 0;
                                        v184 = 0;
                                        v215 = 0;
                                        v176 = 0;
                                        v182 = 0;
                                        v214 = 0;
                                        v174 = 0;
                                        v180 = 0;
                                        v213 = 0;
                                        v175 = 0;
                                        v181 = 0;
                                        v212 = 0;
                                        v177 = 0;
                                        v179 = 0;
                                        v211 = 0;
                                        v185 = 0;
                                        v189 = 0;
                                        v210 = 0;
                                        v188 = 0;
                                        v192 = 0;
                                        v208 = 0;
                                        v194 = 0;
                                        v196 = 0;
                                        v206 = 0;
                                        v197 = 0;
                                        v200 = 0;
                                        v12 = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        v209 = 1;
                                        v207 = 1;
                                        v205 = 1;
                                        *(_QWORD *)v204 = 0x100000001;
                                        *(_DWORD *)&v204[16] = 0;
                                        *(_QWORD *)&v204[8] = 0x100000001;
                                        v11 = 1;
                                        v202 = 0;
                                        v203 = 1;
                                        v201 = 1;
                                        v198 = 1;
                                        v199 = 1;
                                        v193 = 1;
                                        v195 = 1;
                                      }
                                      else
                                      {
                                        -[SFDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
                                        v40 = objc_claimAutoreleasedReturnValue();
                                        v223 = v40 != 0;
                                        v133 = (void *)v40;
                                        if (!v40
                                          || (-[SFDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage"), v41 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection secondaryTitleImage](v7, "secondaryTitleImage"), v131 = (void *)objc_claimAutoreleasedReturnValue(), v132 = v41, objc_msgSend(v41, "isEqual:")))
                                        {
                                          v42 = -[SFDetailedRowCardSection isSecondaryTitleDetached](self, "isSecondaryTitleDetached");
                                          if (v42 == -[SFDetailedRowCardSection isSecondaryTitleDetached](v7, "isSecondaryTitleDetached"))
                                          {
                                            -[SFDetailedRowCardSection descriptions](self, "descriptions");
                                            v130 = (void *)objc_claimAutoreleasedReturnValue();
                                            -[SFDetailedRowCardSection descriptions](v7, "descriptions");
                                            v129 = (void *)objc_claimAutoreleasedReturnValue();
                                            if ((v130 == 0) == (v129 != 0))
                                            {
                                              v191 = 0;
                                              v217 = 0;
                                              v183 = 0;
                                              v186 = 0;
                                              v216 = 0;
                                              v178 = 0;
                                              v184 = 0;
                                              v215 = 0;
                                              v176 = 0;
                                              v182 = 0;
                                              v214 = 0;
                                              v174 = 0;
                                              v180 = 0;
                                              v213 = 0;
                                              v175 = 0;
                                              v181 = 0;
                                              v212 = 0;
                                              v177 = 0;
                                              v179 = 0;
                                              v211 = 0;
                                              v185 = 0;
                                              v189 = 0;
                                              v210 = 0;
                                              v188 = 0;
                                              v192 = 0;
                                              v208 = 0;
                                              v194 = 0;
                                              v196 = 0;
                                              v206 = 0;
                                              v197 = 0;
                                              v200 = 0;
                                              v12 = 0;
                                              v13 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              v16 = 0;
                                              v209 = 1;
                                              v207 = 1;
                                              v205 = 1;
                                              *(_QWORD *)v204 = 0x100000001;
                                              *(_DWORD *)&v204[16] = 0;
                                              *(_QWORD *)&v204[8] = 0x100000001;
                                              v11 = 1;
                                              v202 = 0;
                                              v203 = 1;
                                              v201 = 1;
                                              v198 = 1;
                                              v199 = 1;
                                              v193 = 1;
                                              v195 = 1;
                                              v190 = 0x100000001;
                                              v187 = 1;
                                            }
                                            else
                                            {
                                              -[SFDetailedRowCardSection descriptions](self, "descriptions");
                                              v43 = objc_claimAutoreleasedReturnValue();
                                              v217 = v43 != 0;
                                              v128 = (void *)v43;
                                              if (!v43
                                                || (-[SFDetailedRowCardSection descriptions](self, "descriptions"),
                                                    v44 = (void *)objc_claimAutoreleasedReturnValue(),
                                                    -[SFDetailedRowCardSection descriptions](v7, "descriptions"),
                                                    v124 = (void *)objc_claimAutoreleasedReturnValue(),
                                                    v125 = v44,
                                                    objc_msgSend(v44, "isEqual:")))
                                              {
                                                -[SFDetailedRowCardSection footnote](self, "footnote");
                                                v127 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[SFDetailedRowCardSection footnote](v7, "footnote");
                                                v126 = (void *)objc_claimAutoreleasedReturnValue();
                                                if ((v127 == 0) == (v126 != 0))
                                                {
                                                  v186 = 0;
                                                  v216 = 0;
                                                  v178 = 0;
                                                  v184 = 0;
                                                  v215 = 0;
                                                  v176 = 0;
                                                  v182 = 0;
                                                  v214 = 0;
                                                  v174 = 0;
                                                  v180 = 0;
                                                  v213 = 0;
                                                  v175 = 0;
                                                  v181 = 0;
                                                  v212 = 0;
                                                  v177 = 0;
                                                  v179 = 0;
                                                  v211 = 0;
                                                  v185 = 0;
                                                  v189 = 0;
                                                  v210 = 0;
                                                  v188 = 0;
                                                  v192 = 0;
                                                  v208 = 0;
                                                  v194 = 0;
                                                  v196 = 0;
                                                  v206 = 0;
                                                  v197 = 0;
                                                  v200 = 0;
                                                  v12 = 0;
                                                  v13 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  v16 = 0;
                                                  v209 = 1;
                                                  v207 = 1;
                                                  v205 = 1;
                                                  *(_QWORD *)v204 = 0x100000001;
                                                  *(_DWORD *)&v204[16] = 0;
                                                  *(_QWORD *)&v204[8] = 0x100000001;
                                                  v11 = 1;
                                                  v202 = 0;
                                                  v203 = 1;
                                                  v201 = 1;
                                                  v198 = 1;
                                                  v199 = 1;
                                                  v193 = 1;
                                                  v195 = 1;
                                                  v190 = 0x100000001;
                                                  v187 = 1;
                                                  v191 = 1;
                                                  v183 = 1;
                                                }
                                                else
                                                {
                                                  -[SFDetailedRowCardSection footnote](self, "footnote");
                                                  v45 = objc_claimAutoreleasedReturnValue();
                                                  v216 = v45 != 0;
                                                  v123 = (void *)v45;
                                                  if (!v45
                                                    || (-[SFDetailedRowCardSection footnote](self, "footnote"),
                                                        v46 = (void *)objc_claimAutoreleasedReturnValue(),
                                                        -[SFDetailedRowCardSection footnote](v7, "footnote"),
                                                        v119 = (void *)objc_claimAutoreleasedReturnValue(),
                                                        v120 = v46,
                                                        objc_msgSend(v46, "isEqual:")))
                                                  {
                                                    -[SFDetailedRowCardSection trailingTopText](self, "trailingTopText");
                                                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                                                    -[SFDetailedRowCardSection trailingTopText](v7, "trailingTopText");
                                                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if ((v122 == 0) == (v121 != 0))
                                                    {
                                                      v184 = 0;
                                                      v215 = 0;
                                                      v176 = 0;
                                                      v182 = 0;
                                                      v214 = 0;
                                                      v174 = 0;
                                                      v180 = 0;
                                                      v213 = 0;
                                                      v175 = 0;
                                                      v181 = 0;
                                                      v212 = 0;
                                                      v177 = 0;
                                                      v179 = 0;
                                                      v211 = 0;
                                                      v185 = 0;
                                                      v189 = 0;
                                                      v210 = 0;
                                                      v188 = 0;
                                                      v192 = 0;
                                                      v208 = 0;
                                                      v194 = 0;
                                                      v196 = 0;
                                                      v206 = 0;
                                                      v197 = 0;
                                                      v200 = 0;
                                                      v12 = 0;
                                                      v13 = 0;
                                                      v14 = 0;
                                                      v15 = 0;
                                                      v16 = 0;
                                                      v209 = 1;
                                                      v207 = 1;
                                                      v205 = 1;
                                                      *(_QWORD *)v204 = 0x100000001;
                                                      *(_DWORD *)&v204[16] = 0;
                                                      *(_QWORD *)&v204[8] = 0x100000001;
                                                      v11 = 1;
                                                      v202 = 0;
                                                      v203 = 1;
                                                      v201 = 1;
                                                      v198 = 1;
                                                      v199 = 1;
                                                      v193 = 1;
                                                      v195 = 1;
                                                      v190 = 0x100000001;
                                                      v187 = 1;
                                                      v191 = 1;
                                                      v183 = 1;
                                                      v186 = 1;
                                                      v178 = 1;
                                                    }
                                                    else
                                                    {
                                                      -[SFDetailedRowCardSection trailingTopText](self, "trailingTopText");
                                                      v47 = objc_claimAutoreleasedReturnValue();
                                                      v215 = v47 != 0;
                                                      v116 = (void *)v47;
                                                      if (!v47
                                                        || (-[SFDetailedRowCardSection trailingTopText](self, "trailingTopText"), v48 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingTopText](v7, "trailingTopText"), v117 = (void *)objc_claimAutoreleasedReturnValue(), v118 = v48, objc_msgSend(v48, "isEqual:")))
                                                      {
                                                        -[SFDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
                                                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                                                        -[SFDetailedRowCardSection trailingMiddleText](v7, "trailingMiddleText");
                                                        v114 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if ((v115 == 0) == (v114 != 0))
                                                        {
                                                          v182 = 0;
                                                          v214 = 0;
                                                          v174 = 0;
                                                          v180 = 0;
                                                          v213 = 0;
                                                          v175 = 0;
                                                          v181 = 0;
                                                          v212 = 0;
                                                          v177 = 0;
                                                          v179 = 0;
                                                          v211 = 0;
                                                          v185 = 0;
                                                          v189 = 0;
                                                          v210 = 0;
                                                          v188 = 0;
                                                          v192 = 0;
                                                          v208 = 0;
                                                          v194 = 0;
                                                          v196 = 0;
                                                          v206 = 0;
                                                          v197 = 0;
                                                          v200 = 0;
                                                          v12 = 0;
                                                          v13 = 0;
                                                          v14 = 0;
                                                          v15 = 0;
                                                          v16 = 0;
                                                          v209 = 1;
                                                          v207 = 1;
                                                          v205 = 1;
                                                          *(_QWORD *)v204 = 0x100000001;
                                                          *(_DWORD *)&v204[16] = 0;
                                                          *(_QWORD *)&v204[8] = 0x100000001;
                                                          v11 = 1;
                                                          v202 = 0;
                                                          v203 = 1;
                                                          v201 = 1;
                                                          v198 = 1;
                                                          v199 = 1;
                                                          v193 = 1;
                                                          v195 = 1;
                                                          v190 = 0x100000001;
                                                          v187 = 1;
                                                          v191 = 1;
                                                          v183 = 1;
                                                          v186 = 1;
                                                          v178 = 1;
                                                          v184 = 1;
                                                          v176 = 1;
                                                        }
                                                        else
                                                        {
                                                          -[SFDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
                                                          v49 = objc_claimAutoreleasedReturnValue();
                                                          v214 = v49 != 0;
                                                          v109 = (void *)v49;
                                                          if (!v49
                                                            || (-[SFDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText"), v50 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingMiddleText](v7, "trailingMiddleText"), v112 = (void *)objc_claimAutoreleasedReturnValue(), v113 = v50, objc_msgSend(v50, "isEqual:")))
                                                          {
                                                            -[SFDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
                                                            v108 = (void *)objc_claimAutoreleasedReturnValue();
                                                            -[SFDetailedRowCardSection trailingBottomText](v7, "trailingBottomText");
                                                            v105 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if ((v108 == 0) == (v105 != 0))
                                                            {
                                                              v180 = 0;
                                                              v213 = 0;
                                                              v175 = 0;
                                                              v181 = 0;
                                                              v212 = 0;
                                                              v177 = 0;
                                                              v179 = 0;
                                                              v211 = 0;
                                                              v185 = 0;
                                                              v189 = 0;
                                                              v210 = 0;
                                                              v188 = 0;
                                                              v192 = 0;
                                                              v208 = 0;
                                                              v194 = 0;
                                                              v196 = 0;
                                                              v206 = 0;
                                                              v197 = 0;
                                                              v200 = 0;
                                                              v12 = 0;
                                                              v13 = 0;
                                                              v14 = 0;
                                                              v15 = 0;
                                                              v16 = 0;
                                                              v209 = 1;
                                                              v207 = 1;
                                                              v205 = 1;
                                                              *(_QWORD *)v204 = 0x100000001;
                                                              *(_DWORD *)&v204[16] = 0;
                                                              *(_QWORD *)&v204[8] = 0x100000001;
                                                              v11 = 1;
                                                              v202 = 0;
                                                              v203 = 1;
                                                              v201 = 1;
                                                              v198 = 1;
                                                              v199 = 1;
                                                              v193 = 1;
                                                              v195 = 1;
                                                              v190 = 0x100000001;
                                                              v187 = 1;
                                                              v191 = 1;
                                                              v183 = 1;
                                                              v186 = 1;
                                                              v178 = 1;
                                                              v184 = 1;
                                                              v176 = 1;
                                                              v182 = 1;
                                                              v174 = 1;
                                                            }
                                                            else
                                                            {
                                                              -[SFDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
                                                              v51 = objc_claimAutoreleasedReturnValue();
                                                              v213 = v51 != 0;
                                                              v104 = (void *)v51;
                                                              if (!v51
                                                                || (-[SFDetailedRowCardSection trailingBottomText](self, "trailingBottomText"), v52 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingBottomText](v7, "trailingBottomText"), v110 = (void *)objc_claimAutoreleasedReturnValue(), v111 = v52, objc_msgSend(v52, "isEqual:")))
                                                              {
                                                                -[SFDetailedRowCardSection action](self, "action");
                                                                v103 = (void *)objc_claimAutoreleasedReturnValue();
                                                                -[SFDetailedRowCardSection action](v7, "action");
                                                                v100 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if ((v103 == 0) == (v100 != 0))
                                                                {
                                                                  v181 = 0;
                                                                  v212 = 0;
                                                                  v177 = 0;
                                                                  v179 = 0;
                                                                  v211 = 0;
                                                                  v185 = 0;
                                                                  v189 = 0;
                                                                  v210 = 0;
                                                                  v188 = 0;
                                                                  v192 = 0;
                                                                  v208 = 0;
                                                                  v194 = 0;
                                                                  v196 = 0;
                                                                  v206 = 0;
                                                                  v197 = 0;
                                                                  v200 = 0;
                                                                  v12 = 0;
                                                                  v13 = 0;
                                                                  v14 = 0;
                                                                  v15 = 0;
                                                                  v16 = 0;
                                                                  v209 = 1;
                                                                  v207 = 1;
                                                                  v205 = 1;
                                                                  *(_QWORD *)v204 = 0x100000001;
                                                                  *(_DWORD *)&v204[16] = 0;
                                                                  *(_QWORD *)&v204[8] = 0x100000001;
                                                                  v11 = 1;
                                                                  v202 = 0;
                                                                  v203 = 1;
                                                                  v201 = 1;
                                                                  v198 = 1;
                                                                  v199 = 1;
                                                                  v193 = 1;
                                                                  v195 = 1;
                                                                  v190 = 0x100000001;
                                                                  v187 = 1;
                                                                  v191 = 1;
                                                                  v183 = 1;
                                                                  v186 = 1;
                                                                  v178 = 1;
                                                                  v184 = 1;
                                                                  v176 = 1;
                                                                  v182 = 1;
                                                                  v174 = 1;
                                                                  v180 = 1;
                                                                  v175 = 1;
                                                                }
                                                                else
                                                                {
                                                                  -[SFDetailedRowCardSection action](self, "action");
                                                                  v53 = objc_claimAutoreleasedReturnValue();
                                                                  v212 = v53 != 0;
                                                                  v99 = (void *)v53;
                                                                  if (!v53
                                                                    || (-[SFDetailedRowCardSection action](self, "action"), v54 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection action](v7, "action"), v106 = (void *)objc_claimAutoreleasedReturnValue(), v107 = v54, objc_msgSend(v54, "isEqual:")))
                                                                  {
                                                                    -[SFDetailedRowCardSection button](self, "button");
                                                                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    -[SFDetailedRowCardSection button](v7, "button");
                                                                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if ((v98 == 0) == (v97 != 0))
                                                                    {
                                                                      v179 = 0;
                                                                      v211 = 0;
                                                                      v185 = 0;
                                                                      v189 = 0;
                                                                      v210 = 0;
                                                                      v188 = 0;
                                                                      v192 = 0;
                                                                      v208 = 0;
                                                                      v194 = 0;
                                                                      v196 = 0;
                                                                      v206 = 0;
                                                                      v197 = 0;
                                                                      v200 = 0;
                                                                      v12 = 0;
                                                                      v13 = 0;
                                                                      v14 = 0;
                                                                      v15 = 0;
                                                                      v16 = 0;
                                                                      v209 = 1;
                                                                      v207 = 1;
                                                                      v205 = 1;
                                                                      *(_QWORD *)v204 = 0x100000001;
                                                                      *(_DWORD *)&v204[16] = 0;
                                                                      *(_QWORD *)&v204[8] = 0x100000001;
                                                                      v11 = 1;
                                                                      v202 = 0;
                                                                      v203 = 1;
                                                                      v201 = 1;
                                                                      v198 = 1;
                                                                      v199 = 1;
                                                                      v193 = 1;
                                                                      v195 = 1;
                                                                      v190 = 0x100000001;
                                                                      v187 = 1;
                                                                      v191 = 1;
                                                                      v183 = 1;
                                                                      v186 = 1;
                                                                      v178 = 1;
                                                                      v184 = 1;
                                                                      v176 = 1;
                                                                      v182 = 1;
                                                                      v174 = 1;
                                                                      v180 = 1;
                                                                      v175 = 1;
                                                                      v181 = 1;
                                                                      v177 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      -[SFDetailedRowCardSection button](self, "button");
                                                                      v55 = objc_claimAutoreleasedReturnValue();
                                                                      v211 = v55 != 0;
                                                                      v94 = (void *)v55;
                                                                      if (!v55
                                                                        || (-[SFDetailedRowCardSection button](self, "button"), v56 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection button](v7, "button"), v101 = (void *)objc_claimAutoreleasedReturnValue(), v102 = v56, objc_msgSend(v56, "isEqual:")))
                                                                      {
                                                                        v57 = -[SFDetailedRowCardSection shouldUseCompactDisplay](self, "shouldUseCompactDisplay");
                                                                        if (v57 == -[SFDetailedRowCardSection shouldUseCompactDisplay](v7, "shouldUseCompactDisplay"))
                                                                        {
                                                                          -[SFDetailedRowCardSection buttonItems](self, "buttonItems");
                                                                          v93 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          -[SFDetailedRowCardSection buttonItems](v7, "buttonItems");
                                                                          v91 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          if ((v93 == 0) == (v91 != 0))
                                                                          {
                                                                            v189 = 0;
                                                                            v210 = 0;
                                                                            v188 = 0;
                                                                            v192 = 0;
                                                                            v208 = 0;
                                                                            v194 = 0;
                                                                            v196 = 0;
                                                                            v206 = 0;
                                                                            v197 = 0;
                                                                            v200 = 0;
                                                                            v12 = 0;
                                                                            v13 = 0;
                                                                            v14 = 0;
                                                                            v15 = 0;
                                                                            v16 = 0;
                                                                            v209 = 1;
                                                                            v207 = 1;
                                                                            v205 = 1;
                                                                            *(_QWORD *)v204 = 0x100000001;
                                                                            *(_DWORD *)&v204[16] = 0;
                                                                            *(_QWORD *)&v204[8] = 0x100000001;
                                                                            v11 = 1;
                                                                            v202 = 0;
                                                                            v203 = 1;
                                                                            v201 = 1;
                                                                            v198 = 1;
                                                                            v199 = 1;
                                                                            v193 = 1;
                                                                            v195 = 1;
                                                                            v190 = 0x100000001;
                                                                            v187 = 1;
                                                                            v191 = 1;
                                                                            v183 = 1;
                                                                            v186 = 1;
                                                                            v178 = 1;
                                                                            v184 = 1;
                                                                            v176 = 1;
                                                                            v182 = 1;
                                                                            v174 = 1;
                                                                            v180 = 1;
                                                                            v175 = 1;
                                                                            v181 = 1;
                                                                            v177 = 1;
                                                                            v179 = 1;
                                                                            v185 = 1;
                                                                          }
                                                                          else
                                                                          {
                                                                            -[SFDetailedRowCardSection buttonItems](self, "buttonItems");
                                                                            v58 = objc_claimAutoreleasedReturnValue();
                                                                            v210 = v58 != 0;
                                                                            v89 = (void *)v58;
                                                                            if (!v58
                                                                              || (-[SFDetailedRowCardSection buttonItems](self, "buttonItems"), v59 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection buttonItems](v7, "buttonItems"), v95 = (void *)objc_claimAutoreleasedReturnValue(), v96 = v59, objc_msgSend(v59, "isEqual:")))
                                                                            {
                                                                              -[SFDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
                                                                              v88 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              -[SFDetailedRowCardSection trailingThumbnail](v7, "trailingThumbnail");
                                                                              v87 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if ((v88 == 0) == (v87 != 0))
                                                                              {
                                                                                v192 = 0;
                                                                                v208 = 0;
                                                                                v194 = 0;
                                                                                v196 = 0;
                                                                                v206 = 0;
                                                                                v197 = 0;
                                                                                v200 = 0;
                                                                                v12 = 0;
                                                                                v13 = 0;
                                                                                v14 = 0;
                                                                                v15 = 0;
                                                                                v16 = 0;
                                                                                v209 = 1;
                                                                                v207 = 1;
                                                                                v205 = 1;
                                                                                *(_QWORD *)v204 = 0x100000001;
                                                                                *(_DWORD *)&v204[16] = 0;
                                                                                *(_QWORD *)&v204[8] = 0x100000001;
                                                                                v11 = 1;
                                                                                v202 = 0;
                                                                                v203 = 1;
                                                                                v201 = 1;
                                                                                v198 = 1;
                                                                                v199 = 1;
                                                                                v193 = 1;
                                                                                v195 = 1;
                                                                                v190 = 0x100000001;
                                                                                v187 = 1;
                                                                                v191 = 1;
                                                                                v183 = 1;
                                                                                v186 = 1;
                                                                                v178 = 1;
                                                                                v184 = 1;
                                                                                v176 = 1;
                                                                                v182 = 1;
                                                                                v174 = 1;
                                                                                v180 = 1;
                                                                                v175 = 1;
                                                                                v181 = 1;
                                                                                v177 = 1;
                                                                                v179 = 1;
                                                                                v185 = 1;
                                                                                v189 = 1;
                                                                                v188 = 1;
                                                                              }
                                                                              else
                                                                              {
                                                                                -[SFDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
                                                                                v60 = objc_claimAutoreleasedReturnValue();
                                                                                v208 = v60 != 0;
                                                                                v85 = (void *)v60;
                                                                                if (!v60
                                                                                  || (-[SFDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail"), v61 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingThumbnail](v7, "trailingThumbnail"), v92 = v61, v90 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v61, "isEqual:")))
                                                                                {
                                                                                  v62 = -[SFDetailedRowCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing");
                                                                                  if (v62 == -[SFDetailedRowCardSection buttonItemsAreTrailing](v7, "buttonItemsAreTrailing"))
                                                                                  {
                                                                                    -[SFDetailedRowCardSection topText](self, "topText");
                                                                                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    -[SFDetailedRowCardSection topText](v7, "topText");
                                                                                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    if ((v83 == 0) == (v82 != 0))
                                                                                    {
                                                                                      v196 = 0;
                                                                                      v206 = 0;
                                                                                      v197 = 0;
                                                                                      v200 = 0;
                                                                                      v12 = 0;
                                                                                      v13 = 0;
                                                                                      v14 = 0;
                                                                                      v15 = 0;
                                                                                      v16 = 0;
                                                                                      v209 = 1;
                                                                                      v207 = 1;
                                                                                      v205 = 1;
                                                                                      *(_QWORD *)v204 = 0x100000001;
                                                                                      *(_DWORD *)&v204[16] = 0;
                                                                                      *(_QWORD *)&v204[8] = 0x100000001;
                                                                                      v11 = 1;
                                                                                      v202 = 0;
                                                                                      v203 = 1;
                                                                                      v201 = 1;
                                                                                      v198 = 1;
                                                                                      v199 = 1;
                                                                                      v193 = 1;
                                                                                      v195 = 1;
                                                                                      v190 = 0x100000001;
                                                                                      v187 = 1;
                                                                                      v191 = 1;
                                                                                      v183 = 1;
                                                                                      v186 = 1;
                                                                                      v178 = 1;
                                                                                      v184 = 1;
                                                                                      v176 = 1;
                                                                                      v182 = 1;
                                                                                      v174 = 1;
                                                                                      v180 = 1;
                                                                                      v175 = 1;
                                                                                      v181 = 1;
                                                                                      v177 = 1;
                                                                                      v179 = 1;
                                                                                      v185 = 1;
                                                                                      v189 = 1;
                                                                                      v188 = 1;
                                                                                      v192 = 1;
                                                                                      v194 = 1;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      -[SFDetailedRowCardSection topText](self, "topText");
                                                                                      v63 = objc_claimAutoreleasedReturnValue();
                                                                                      v206 = v63 != 0;
                                                                                      v80 = (void *)v63;
                                                                                      if (!v63
                                                                                        || (-[SFDetailedRowCardSection topText](self, "topText"), v64 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection topText](v7, "topText"), v86 = v64, v84 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v64, "isEqual:")))
                                                                                      {
                                                                                        -[SFDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
                                                                                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        -[SFDetailedRowCardSection richTrailingTopText](v7, "richTrailingTopText");
                                                                                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        if ((v78 == 0) == (v77 != 0))
                                                                                        {
                                                                                          v200 = 0;
                                                                                          v12 = 0;
                                                                                          v13 = 0;
                                                                                          v14 = 0;
                                                                                          v15 = 0;
                                                                                          v16 = 0;
                                                                                          v209 = 1;
                                                                                          v207 = 1;
                                                                                          v205 = 1;
                                                                                          *(_QWORD *)v204 = 0x100000001;
                                                                                          *(_DWORD *)&v204[16] = 0;
                                                                                          *(_QWORD *)&v204[8] = 0x100000001;
                                                                                          v11 = 1;
                                                                                          v202 = 0;
                                                                                          v203 = 1;
                                                                                          v201 = 1;
                                                                                          v198 = 1;
                                                                                          v199 = 1;
                                                                                          v193 = 1;
                                                                                          v195 = 1;
                                                                                          v190 = 0x100000001;
                                                                                          v187 = 1;
                                                                                          v191 = 1;
                                                                                          v183 = 1;
                                                                                          v186 = 1;
                                                                                          v178 = 1;
                                                                                          v184 = 1;
                                                                                          v176 = 1;
                                                                                          v182 = 1;
                                                                                          v174 = 1;
                                                                                          v180 = 1;
                                                                                          v175 = 1;
                                                                                          v181 = 1;
                                                                                          v177 = 1;
                                                                                          v179 = 1;
                                                                                          v185 = 1;
                                                                                          v189 = 1;
                                                                                          v188 = 1;
                                                                                          v192 = 1;
                                                                                          v194 = 1;
                                                                                          v196 = 1;
                                                                                          v197 = 1;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          -[SFDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
                                                                                          v65 = objc_claimAutoreleasedReturnValue();
                                                                                          HIDWORD(v205) = v65 != 0;
                                                                                          v76 = (void *)v65;
                                                                                          if (!v65
                                                                                            || (-[SFDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText"), v66 = (void *)objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection richTrailingTopText](v7, "richTrailingTopText"), v81 = v66, v79 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v66, "isEqual:")))
                                                                                          {
                                                                                            -[SFDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
                                                                                            v73 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            -[SFDetailedRowCardSection richTrailingMiddleText](v7, "richTrailingMiddleText");
                                                                                            v72 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            if ((v73 == 0) == (v72 != 0))
                                                                                            {
                                                                                              v12 = 0;
                                                                                              v13 = 0;
                                                                                              v14 = 0;
                                                                                              v15 = 0;
                                                                                              v16 = 0;
                                                                                              v209 = 1;
                                                                                              v207 = 1;
                                                                                              *(_DWORD *)&v204[16] = 0;
                                                                                              LODWORD(v205) = 1;
                                                                                              *(_DWORD *)v204 = 1;
                                                                                              *(_DWORD *)&v204[4] = 1;
                                                                                              *(_DWORD *)&v204[8] = 1;
                                                                                              *(_DWORD *)&v204[12] = 1;
                                                                                              v11 = 1;
                                                                                              v203 = 1;
                                                                                              v201 = 1;
                                                                                              v198 = 1;
                                                                                              v199 = 1;
                                                                                              v193 = 1;
                                                                                              v195 = 1;
                                                                                              v190 = 0x100000001;
                                                                                              v187 = 1;
                                                                                              v191 = 1;
                                                                                              v183 = 1;
                                                                                              v186 = 1;
                                                                                              v178 = 1;
                                                                                              v184 = 1;
                                                                                              v176 = 1;
                                                                                              v182 = 1;
                                                                                              v174 = 1;
                                                                                              v180 = 1;
                                                                                              v175 = 1;
                                                                                              v181 = 1;
                                                                                              v177 = 1;
                                                                                              v179 = 1;
                                                                                              v185 = 1;
                                                                                              v189 = 1;
                                                                                              v188 = 1;
                                                                                              v192 = 1;
                                                                                              v194 = 1;
                                                                                              v196 = 1;
                                                                                              v197 = 1;
                                                                                              v200 = 1;
                                                                                              v202 = 1;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              -[SFDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
                                                                                              v67 = objc_claimAutoreleasedReturnValue();
                                                                                              *(_DWORD *)&v204[16] = v67 != 0;
                                                                                              v71 = (void *)v67;
                                                                                              if (!v67
                                                                                                || (-[SFDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText"),
                                                                                                    v68 = (void *)objc_claimAutoreleasedReturnValue(),
                                                                                                    -[SFDetailedRowCardSection richTrailingMiddleText](v7, "richTrailingMiddleText"),
                                                                                                    v74 = (void *)objc_claimAutoreleasedReturnValue(),
                                                                                                    v75 = v68,
                                                                                                    objc_msgSend(v68, "isEqual:")))
                                                                                              {
                                                                                                -[SFDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
                                                                                                v69 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                -[SFDetailedRowCardSection richTrailingBottomText](v7, "richTrailingBottomText");
                                                                                                v3 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                if ((v69 == 0) == (v3 != 0))
                                                                                                {
                                                                                                  v14 = 0;
                                                                                                  v15 = 0;
                                                                                                  v16 = 0;
                                                                                                  v209 = 1;
                                                                                                  v207 = 1;
                                                                                                  LODWORD(v205) = 1;
                                                                                                  *(_DWORD *)v204 = 1;
                                                                                                  *(_DWORD *)&v204[4] = 1;
                                                                                                  *(_DWORD *)&v204[8] = 1;
                                                                                                  *(_DWORD *)&v204[12] = 1;
                                                                                                  v11 = 1;
                                                                                                  v203 = 1;
                                                                                                  v201 = 1;
                                                                                                  v198 = 1;
                                                                                                  v199 = 1;
                                                                                                  v193 = 1;
                                                                                                  v195 = 1;
                                                                                                  v190 = 0x100000001;
                                                                                                  v187 = 1;
                                                                                                  v191 = 1;
                                                                                                  v183 = 1;
                                                                                                  v186 = 1;
                                                                                                  v178 = 1;
                                                                                                  v184 = 1;
                                                                                                  v176 = 1;
                                                                                                  v182 = 1;
                                                                                                  v174 = 1;
                                                                                                  v180 = 1;
                                                                                                  v175 = 1;
                                                                                                  v181 = 1;
                                                                                                  v177 = 1;
                                                                                                  v179 = 1;
                                                                                                  v185 = 1;
                                                                                                  v189 = 1;
                                                                                                  v188 = 1;
                                                                                                  v192 = 1;
                                                                                                  v194 = 1;
                                                                                                  v196 = 1;
                                                                                                  v197 = 1;
                                                                                                  v200 = 1;
                                                                                                  v202 = 1;
                                                                                                  v12 = 1;
                                                                                                  v13 = 1;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  -[SFDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
                                                                                                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  if (v70)
                                                                                                  {
                                                                                                    -[SFDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
                                                                                                    v4 = objc_claimAutoreleasedReturnValue();
                                                                                                    -[SFDetailedRowCardSection richTrailingBottomText](v7, "richTrailingBottomText");
                                                                                                    v9 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v16 = objc_msgSend((id)v4, "isEqual:", v9);
                                                                                                    v15 = 1;
                                                                                                    v209 = 1;
                                                                                                    v207 = 1;
                                                                                                    LODWORD(v205) = 1;
                                                                                                    *(_DWORD *)v204 = 1;
                                                                                                    *(_DWORD *)&v204[4] = 1;
                                                                                                    *(_DWORD *)&v204[8] = 1;
                                                                                                    *(_DWORD *)&v204[12] = 1;
                                                                                                    v11 = 1;
                                                                                                    v203 = 1;
                                                                                                    v201 = 1;
                                                                                                    v198 = 1;
                                                                                                    v199 = 1;
                                                                                                    v193 = 1;
                                                                                                    v195 = 1;
                                                                                                    v190 = 0x100000001;
                                                                                                    v187 = 1;
                                                                                                    v191 = 1;
                                                                                                    v183 = 1;
                                                                                                    v186 = 1;
                                                                                                    v178 = 1;
                                                                                                    v184 = 1;
                                                                                                    v176 = 1;
                                                                                                    v182 = 1;
                                                                                                    v174 = 1;
                                                                                                    v180 = 1;
                                                                                                    v175 = 1;
                                                                                                    v181 = 1;
                                                                                                    v177 = 1;
                                                                                                    v179 = 1;
                                                                                                    v185 = 1;
                                                                                                    v189 = 1;
                                                                                                    v188 = 1;
                                                                                                    v192 = 1;
                                                                                                    v194 = 1;
                                                                                                    v196 = 1;
                                                                                                    v197 = 1;
                                                                                                    v200 = 1;
                                                                                                    v202 = 1;
                                                                                                    v12 = 1;
                                                                                                    v13 = 1;
                                                                                                    v14 = 1;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v70 = 0;
                                                                                                    v15 = 0;
                                                                                                    v209 = 1;
                                                                                                    v207 = 1;
                                                                                                    LODWORD(v205) = 1;
                                                                                                    *(_QWORD *)v204 = 0x100000001;
                                                                                                    *(_QWORD *)&v204[8] = 0x100000001;
                                                                                                    v11 = 1;
                                                                                                    v203 = 1;
                                                                                                    v201 = 1;
                                                                                                    v198 = 1;
                                                                                                    v199 = 1;
                                                                                                    v193 = 1;
                                                                                                    v195 = 1;
                                                                                                    v190 = 0x100000001;
                                                                                                    v187 = 1;
                                                                                                    v191 = 1;
                                                                                                    v183 = 1;
                                                                                                    v186 = 1;
                                                                                                    v178 = 1;
                                                                                                    v184 = 1;
                                                                                                    v176 = 1;
                                                                                                    v182 = 1;
                                                                                                    v174 = 1;
                                                                                                    v180 = 1;
                                                                                                    v175 = 1;
                                                                                                    v181 = 1;
                                                                                                    v177 = 1;
                                                                                                    v179 = 1;
                                                                                                    v185 = 1;
                                                                                                    v189 = 1;
                                                                                                    v188 = 1;
                                                                                                    v192 = 1;
                                                                                                    v194 = 1;
                                                                                                    v196 = 1;
                                                                                                    v197 = 1;
                                                                                                    v200 = 1;
                                                                                                    v202 = 1;
                                                                                                    v12 = 1;
                                                                                                    v13 = 1;
                                                                                                    v14 = 1;
                                                                                                    v16 = 1;
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v13 = 0;
                                                                                                v14 = 0;
                                                                                                v15 = 0;
                                                                                                v16 = 0;
                                                                                                v209 = 1;
                                                                                                v207 = 1;
                                                                                                LODWORD(v205) = 1;
                                                                                                *(_DWORD *)v204 = 1;
                                                                                                *(_DWORD *)&v204[4] = 1;
                                                                                                *(_DWORD *)&v204[8] = 1;
                                                                                                *(_DWORD *)&v204[12] = 1;
                                                                                                v11 = 1;
                                                                                                v203 = 1;
                                                                                                v201 = 1;
                                                                                                v198 = 1;
                                                                                                v199 = 1;
                                                                                                v193 = 1;
                                                                                                v195 = 1;
                                                                                                v190 = 0x100000001;
                                                                                                v187 = 1;
                                                                                                v191 = 1;
                                                                                                v183 = 1;
                                                                                                v186 = 1;
                                                                                                v178 = 1;
                                                                                                v184 = 1;
                                                                                                v176 = 1;
                                                                                                v182 = 1;
                                                                                                v174 = 1;
                                                                                                v180 = 1;
                                                                                                v175 = 1;
                                                                                                v181 = 1;
                                                                                                v177 = 1;
                                                                                                v179 = 1;
                                                                                                v185 = 1;
                                                                                                v189 = 1;
                                                                                                v188 = 1;
                                                                                                v192 = 1;
                                                                                                v194 = 1;
                                                                                                v196 = 1;
                                                                                                v197 = 1;
                                                                                                v200 = 1;
                                                                                                v202 = 1;
                                                                                                v12 = 1;
                                                                                                *(_DWORD *)&v204[16] = 1;
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v12 = 0;
                                                                                            v13 = 0;
                                                                                            v14 = 0;
                                                                                            v15 = 0;
                                                                                            v16 = 0;
                                                                                            v209 = 1;
                                                                                            v207 = 1;
                                                                                            *(_DWORD *)&v204[16] = 0;
                                                                                            v205 = 0x100000001;
                                                                                            *(_QWORD *)v204 = 0x100000001;
                                                                                            *(_QWORD *)&v204[8] = 0x100000001;
                                                                                            v11 = 1;
                                                                                            v202 = 0;
                                                                                            v203 = 1;
                                                                                            v201 = 1;
                                                                                            v198 = 1;
                                                                                            v199 = 1;
                                                                                            v193 = 1;
                                                                                            v195 = 1;
                                                                                            v190 = 0x100000001;
                                                                                            v187 = 1;
                                                                                            v191 = 1;
                                                                                            v183 = 1;
                                                                                            v186 = 1;
                                                                                            v178 = 1;
                                                                                            v184 = 1;
                                                                                            v176 = 1;
                                                                                            v182 = 1;
                                                                                            v174 = 1;
                                                                                            v180 = 1;
                                                                                            v175 = 1;
                                                                                            v181 = 1;
                                                                                            v177 = 1;
                                                                                            v179 = 1;
                                                                                            v185 = 1;
                                                                                            v189 = 1;
                                                                                            v188 = 1;
                                                                                            v192 = 1;
                                                                                            v194 = 1;
                                                                                            v196 = 1;
                                                                                            v197 = 1;
                                                                                            v200 = 1;
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v197 = 0;
                                                                                        v200 = 0;
                                                                                        v12 = 0;
                                                                                        v13 = 0;
                                                                                        v14 = 0;
                                                                                        v15 = 0;
                                                                                        v16 = 0;
                                                                                        v209 = 1;
                                                                                        v207 = 1;
                                                                                        v205 = 1;
                                                                                        *(_QWORD *)v204 = 0x100000001;
                                                                                        *(_DWORD *)&v204[16] = 0;
                                                                                        *(_QWORD *)&v204[8] = 0x100000001;
                                                                                        v11 = 1;
                                                                                        v202 = 0;
                                                                                        v203 = 1;
                                                                                        v201 = 1;
                                                                                        v198 = 1;
                                                                                        v199 = 1;
                                                                                        v193 = 1;
                                                                                        v195 = 1;
                                                                                        v190 = 0x100000001;
                                                                                        v187 = 1;
                                                                                        v191 = 1;
                                                                                        v183 = 1;
                                                                                        v186 = 1;
                                                                                        v178 = 1;
                                                                                        v184 = 1;
                                                                                        v176 = 1;
                                                                                        v182 = 1;
                                                                                        v174 = 1;
                                                                                        v180 = 1;
                                                                                        v175 = 1;
                                                                                        v181 = 1;
                                                                                        v177 = 1;
                                                                                        v179 = 1;
                                                                                        v185 = 1;
                                                                                        v189 = 1;
                                                                                        v188 = 1;
                                                                                        v192 = 1;
                                                                                        v194 = 1;
                                                                                        v196 = 1;
                                                                                        v206 = 1;
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v194 = 0;
                                                                                    v196 = 0;
                                                                                    v206 = 0;
                                                                                    v197 = 0;
                                                                                    v200 = 0;
                                                                                    v12 = 0;
                                                                                    v13 = 0;
                                                                                    v14 = 0;
                                                                                    v15 = 0;
                                                                                    v16 = 0;
                                                                                    v209 = 1;
                                                                                    v207 = 1;
                                                                                    v205 = 1;
                                                                                    *(_QWORD *)v204 = 0x100000001;
                                                                                    *(_DWORD *)&v204[16] = 0;
                                                                                    *(_QWORD *)&v204[8] = 0x100000001;
                                                                                    v11 = 1;
                                                                                    v202 = 0;
                                                                                    v203 = 1;
                                                                                    v201 = 1;
                                                                                    v198 = 1;
                                                                                    v199 = 1;
                                                                                    v193 = 1;
                                                                                    v195 = 1;
                                                                                    v190 = 0x100000001;
                                                                                    v187 = 1;
                                                                                    v191 = 1;
                                                                                    v183 = 1;
                                                                                    v186 = 1;
                                                                                    v178 = 1;
                                                                                    v184 = 1;
                                                                                    v176 = 1;
                                                                                    v182 = 1;
                                                                                    v174 = 1;
                                                                                    v180 = 1;
                                                                                    v175 = 1;
                                                                                    v181 = 1;
                                                                                    v177 = 1;
                                                                                    v179 = 1;
                                                                                    v185 = 1;
                                                                                    v189 = 1;
                                                                                    v188 = 1;
                                                                                    v192 = 1;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v194 = 0;
                                                                                  v196 = 0;
                                                                                  v206 = 0;
                                                                                  v197 = 0;
                                                                                  v200 = 0;
                                                                                  v12 = 0;
                                                                                  v13 = 0;
                                                                                  v14 = 0;
                                                                                  v15 = 0;
                                                                                  v16 = 0;
                                                                                  v209 = 1;
                                                                                  v207 = 1;
                                                                                  v205 = 1;
                                                                                  *(_QWORD *)v204 = 0x100000001;
                                                                                  *(_DWORD *)&v204[16] = 0;
                                                                                  *(_QWORD *)&v204[8] = 0x100000001;
                                                                                  v11 = 1;
                                                                                  v202 = 0;
                                                                                  v203 = 1;
                                                                                  v201 = 1;
                                                                                  v198 = 1;
                                                                                  v199 = 1;
                                                                                  v193 = 1;
                                                                                  v195 = 1;
                                                                                  v190 = 0x100000001;
                                                                                  v187 = 1;
                                                                                  v191 = 1;
                                                                                  v183 = 1;
                                                                                  v186 = 1;
                                                                                  v178 = 1;
                                                                                  v184 = 1;
                                                                                  v176 = 1;
                                                                                  v182 = 1;
                                                                                  v174 = 1;
                                                                                  v180 = 1;
                                                                                  v175 = 1;
                                                                                  v181 = 1;
                                                                                  v177 = 1;
                                                                                  v179 = 1;
                                                                                  v185 = 1;
                                                                                  v189 = 1;
                                                                                  v188 = 1;
                                                                                  v192 = 1;
                                                                                  v208 = 1;
                                                                                }
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v188 = 0;
                                                                              v192 = 0;
                                                                              v208 = 0;
                                                                              v194 = 0;
                                                                              v196 = 0;
                                                                              v206 = 0;
                                                                              v197 = 0;
                                                                              v200 = 0;
                                                                              v12 = 0;
                                                                              v13 = 0;
                                                                              v14 = 0;
                                                                              v15 = 0;
                                                                              v16 = 0;
                                                                              v209 = 1;
                                                                              v207 = 1;
                                                                              v205 = 1;
                                                                              *(_QWORD *)v204 = 0x100000001;
                                                                              *(_DWORD *)&v204[16] = 0;
                                                                              *(_QWORD *)&v204[8] = 0x100000001;
                                                                              v11 = 1;
                                                                              v202 = 0;
                                                                              v203 = 1;
                                                                              v201 = 1;
                                                                              v198 = 1;
                                                                              v199 = 1;
                                                                              v193 = 1;
                                                                              v195 = 1;
                                                                              v190 = 0x100000001;
                                                                              v187 = 1;
                                                                              v191 = 1;
                                                                              v183 = 1;
                                                                              v186 = 1;
                                                                              v178 = 1;
                                                                              v184 = 1;
                                                                              v176 = 1;
                                                                              v182 = 1;
                                                                              v174 = 1;
                                                                              v180 = 1;
                                                                              v175 = 1;
                                                                              v181 = 1;
                                                                              v177 = 1;
                                                                              v179 = 1;
                                                                              v185 = 1;
                                                                              v189 = 1;
                                                                              v210 = 1;
                                                                            }
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v185 = 0;
                                                                          v189 = 0;
                                                                          v210 = 0;
                                                                          v188 = 0;
                                                                          v192 = 0;
                                                                          v208 = 0;
                                                                          v194 = 0;
                                                                          v196 = 0;
                                                                          v206 = 0;
                                                                          v197 = 0;
                                                                          v200 = 0;
                                                                          v12 = 0;
                                                                          v13 = 0;
                                                                          v14 = 0;
                                                                          v15 = 0;
                                                                          v16 = 0;
                                                                          v209 = 1;
                                                                          v207 = 1;
                                                                          v205 = 1;
                                                                          *(_QWORD *)v204 = 0x100000001;
                                                                          *(_DWORD *)&v204[16] = 0;
                                                                          *(_QWORD *)&v204[8] = 0x100000001;
                                                                          v11 = 1;
                                                                          v202 = 0;
                                                                          v203 = 1;
                                                                          v201 = 1;
                                                                          v198 = 1;
                                                                          v199 = 1;
                                                                          v193 = 1;
                                                                          v195 = 1;
                                                                          v190 = 0x100000001;
                                                                          v187 = 1;
                                                                          v191 = 1;
                                                                          v183 = 1;
                                                                          v186 = 1;
                                                                          v178 = 1;
                                                                          v184 = 1;
                                                                          v176 = 1;
                                                                          v182 = 1;
                                                                          v174 = 1;
                                                                          v180 = 1;
                                                                          v175 = 1;
                                                                          v181 = 1;
                                                                          v177 = 1;
                                                                          v179 = 1;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v185 = 0;
                                                                        v189 = 0;
                                                                        v210 = 0;
                                                                        v188 = 0;
                                                                        v192 = 0;
                                                                        v208 = 0;
                                                                        v194 = 0;
                                                                        v196 = 0;
                                                                        v206 = 0;
                                                                        v197 = 0;
                                                                        v200 = 0;
                                                                        v12 = 0;
                                                                        v13 = 0;
                                                                        v14 = 0;
                                                                        v15 = 0;
                                                                        v16 = 0;
                                                                        v209 = 1;
                                                                        v207 = 1;
                                                                        v205 = 1;
                                                                        *(_QWORD *)v204 = 0x100000001;
                                                                        *(_DWORD *)&v204[16] = 0;
                                                                        *(_QWORD *)&v204[8] = 0x100000001;
                                                                        v11 = 1;
                                                                        v202 = 0;
                                                                        v203 = 1;
                                                                        v201 = 1;
                                                                        v198 = 1;
                                                                        v199 = 1;
                                                                        v193 = 1;
                                                                        v195 = 1;
                                                                        v190 = 0x100000001;
                                                                        v187 = 1;
                                                                        v191 = 1;
                                                                        v183 = 1;
                                                                        v186 = 1;
                                                                        v178 = 1;
                                                                        v184 = 1;
                                                                        v176 = 1;
                                                                        v182 = 1;
                                                                        v174 = 1;
                                                                        v180 = 1;
                                                                        v175 = 1;
                                                                        v181 = 1;
                                                                        v177 = 1;
                                                                        v179 = 1;
                                                                        v211 = 1;
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v177 = 0;
                                                                    v179 = 0;
                                                                    v211 = 0;
                                                                    v185 = 0;
                                                                    v189 = 0;
                                                                    v210 = 0;
                                                                    v188 = 0;
                                                                    v192 = 0;
                                                                    v208 = 0;
                                                                    v194 = 0;
                                                                    v196 = 0;
                                                                    v206 = 0;
                                                                    v197 = 0;
                                                                    v200 = 0;
                                                                    v12 = 0;
                                                                    v13 = 0;
                                                                    v14 = 0;
                                                                    v15 = 0;
                                                                    v16 = 0;
                                                                    v209 = 1;
                                                                    v207 = 1;
                                                                    v205 = 1;
                                                                    *(_QWORD *)v204 = 0x100000001;
                                                                    *(_DWORD *)&v204[16] = 0;
                                                                    *(_QWORD *)&v204[8] = 0x100000001;
                                                                    v11 = 1;
                                                                    v202 = 0;
                                                                    v203 = 1;
                                                                    v201 = 1;
                                                                    v198 = 1;
                                                                    v199 = 1;
                                                                    v193 = 1;
                                                                    v195 = 1;
                                                                    v190 = 0x100000001;
                                                                    v187 = 1;
                                                                    v191 = 1;
                                                                    v183 = 1;
                                                                    v186 = 1;
                                                                    v178 = 1;
                                                                    v184 = 1;
                                                                    v176 = 1;
                                                                    v182 = 1;
                                                                    v174 = 1;
                                                                    v180 = 1;
                                                                    v175 = 1;
                                                                    v181 = 1;
                                                                    v212 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v175 = 0;
                                                                v181 = 0;
                                                                v212 = 0;
                                                                v177 = 0;
                                                                v179 = 0;
                                                                v211 = 0;
                                                                v185 = 0;
                                                                v189 = 0;
                                                                v210 = 0;
                                                                v188 = 0;
                                                                v192 = 0;
                                                                v208 = 0;
                                                                v194 = 0;
                                                                v196 = 0;
                                                                v206 = 0;
                                                                v197 = 0;
                                                                v200 = 0;
                                                                v12 = 0;
                                                                v13 = 0;
                                                                v14 = 0;
                                                                v15 = 0;
                                                                v16 = 0;
                                                                v209 = 1;
                                                                v207 = 1;
                                                                v205 = 1;
                                                                *(_QWORD *)v204 = 0x100000001;
                                                                *(_DWORD *)&v204[16] = 0;
                                                                *(_QWORD *)&v204[8] = 0x100000001;
                                                                v11 = 1;
                                                                v202 = 0;
                                                                v203 = 1;
                                                                v201 = 1;
                                                                v198 = 1;
                                                                v199 = 1;
                                                                v193 = 1;
                                                                v195 = 1;
                                                                v190 = 0x100000001;
                                                                v187 = 1;
                                                                v191 = 1;
                                                                v183 = 1;
                                                                v186 = 1;
                                                                v178 = 1;
                                                                v184 = 1;
                                                                v176 = 1;
                                                                v182 = 1;
                                                                v174 = 1;
                                                                v180 = 1;
                                                                v213 = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v174 = 0;
                                                            v180 = 0;
                                                            v213 = 0;
                                                            v175 = 0;
                                                            v181 = 0;
                                                            v212 = 0;
                                                            v177 = 0;
                                                            v179 = 0;
                                                            v211 = 0;
                                                            v185 = 0;
                                                            v189 = 0;
                                                            v210 = 0;
                                                            v188 = 0;
                                                            v192 = 0;
                                                            v208 = 0;
                                                            v194 = 0;
                                                            v196 = 0;
                                                            v206 = 0;
                                                            v197 = 0;
                                                            v200 = 0;
                                                            v12 = 0;
                                                            v13 = 0;
                                                            v14 = 0;
                                                            v15 = 0;
                                                            v16 = 0;
                                                            v209 = 1;
                                                            v207 = 1;
                                                            v205 = 1;
                                                            *(_QWORD *)v204 = 0x100000001;
                                                            *(_DWORD *)&v204[16] = 0;
                                                            *(_QWORD *)&v204[8] = 0x100000001;
                                                            v11 = 1;
                                                            v202 = 0;
                                                            v203 = 1;
                                                            v201 = 1;
                                                            v198 = 1;
                                                            v199 = 1;
                                                            v193 = 1;
                                                            v195 = 1;
                                                            v190 = 0x100000001;
                                                            v187 = 1;
                                                            v191 = 1;
                                                            v183 = 1;
                                                            v186 = 1;
                                                            v178 = 1;
                                                            v184 = 1;
                                                            v176 = 1;
                                                            v182 = 1;
                                                            v214 = 1;
                                                          }
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v176 = 0;
                                                        v182 = 0;
                                                        v214 = 0;
                                                        v174 = 0;
                                                        v180 = 0;
                                                        v213 = 0;
                                                        v175 = 0;
                                                        v181 = 0;
                                                        v212 = 0;
                                                        v177 = 0;
                                                        v179 = 0;
                                                        v211 = 0;
                                                        v185 = 0;
                                                        v189 = 0;
                                                        v210 = 0;
                                                        v188 = 0;
                                                        v192 = 0;
                                                        v208 = 0;
                                                        v194 = 0;
                                                        v196 = 0;
                                                        v206 = 0;
                                                        v197 = 0;
                                                        v200 = 0;
                                                        v12 = 0;
                                                        v13 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        v16 = 0;
                                                        v209 = 1;
                                                        v207 = 1;
                                                        v205 = 1;
                                                        *(_QWORD *)v204 = 0x100000001;
                                                        *(_DWORD *)&v204[16] = 0;
                                                        *(_QWORD *)&v204[8] = 0x100000001;
                                                        v11 = 1;
                                                        v202 = 0;
                                                        v203 = 1;
                                                        v201 = 1;
                                                        v198 = 1;
                                                        v199 = 1;
                                                        v193 = 1;
                                                        v195 = 1;
                                                        v190 = 0x100000001;
                                                        v187 = 1;
                                                        v191 = 1;
                                                        v183 = 1;
                                                        v186 = 1;
                                                        v178 = 1;
                                                        v184 = 1;
                                                        v215 = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v178 = 0;
                                                    v184 = 0;
                                                    v215 = 0;
                                                    v176 = 0;
                                                    v182 = 0;
                                                    v214 = 0;
                                                    v174 = 0;
                                                    v180 = 0;
                                                    v213 = 0;
                                                    v175 = 0;
                                                    v181 = 0;
                                                    v212 = 0;
                                                    v177 = 0;
                                                    v179 = 0;
                                                    v211 = 0;
                                                    v185 = 0;
                                                    v189 = 0;
                                                    v210 = 0;
                                                    v188 = 0;
                                                    v192 = 0;
                                                    v208 = 0;
                                                    v194 = 0;
                                                    v196 = 0;
                                                    v206 = 0;
                                                    v197 = 0;
                                                    v200 = 0;
                                                    v12 = 0;
                                                    v13 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    v16 = 0;
                                                    v209 = 1;
                                                    v207 = 1;
                                                    v205 = 1;
                                                    *(_QWORD *)v204 = 0x100000001;
                                                    *(_DWORD *)&v204[16] = 0;
                                                    *(_QWORD *)&v204[8] = 0x100000001;
                                                    v11 = 1;
                                                    v202 = 0;
                                                    v203 = 1;
                                                    v201 = 1;
                                                    v198 = 1;
                                                    v199 = 1;
                                                    v193 = 1;
                                                    v195 = 1;
                                                    v190 = 0x100000001;
                                                    v187 = 1;
                                                    v191 = 1;
                                                    v183 = 1;
                                                    v186 = 1;
                                                    v216 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                v183 = 0;
                                                v186 = 0;
                                                v216 = 0;
                                                v178 = 0;
                                                v184 = 0;
                                                v215 = 0;
                                                v176 = 0;
                                                v182 = 0;
                                                v214 = 0;
                                                v174 = 0;
                                                v180 = 0;
                                                v213 = 0;
                                                v175 = 0;
                                                v181 = 0;
                                                v212 = 0;
                                                v177 = 0;
                                                v179 = 0;
                                                v211 = 0;
                                                v185 = 0;
                                                v189 = 0;
                                                v210 = 0;
                                                v188 = 0;
                                                v192 = 0;
                                                v208 = 0;
                                                v194 = 0;
                                                v196 = 0;
                                                v206 = 0;
                                                v197 = 0;
                                                v200 = 0;
                                                v12 = 0;
                                                v13 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                v16 = 0;
                                                v209 = 1;
                                                v207 = 1;
                                                v205 = 1;
                                                *(_QWORD *)v204 = 0x100000001;
                                                *(_DWORD *)&v204[16] = 0;
                                                *(_QWORD *)&v204[8] = 0x100000001;
                                                v11 = 1;
                                                v202 = 0;
                                                v203 = 1;
                                                v201 = 1;
                                                v198 = 1;
                                                v199 = 1;
                                                v193 = 1;
                                                v195 = 1;
                                                v190 = 0x100000001;
                                                v187 = 1;
                                                v191 = 1;
                                                v217 = 1;
                                              }
                                            }
                                          }
                                          else
                                          {
                                            v187 = 0;
                                            v191 = 0;
                                            v217 = 0;
                                            v183 = 0;
                                            v186 = 0;
                                            v216 = 0;
                                            v178 = 0;
                                            v184 = 0;
                                            v215 = 0;
                                            v176 = 0;
                                            v182 = 0;
                                            v214 = 0;
                                            v174 = 0;
                                            v180 = 0;
                                            v213 = 0;
                                            v175 = 0;
                                            v181 = 0;
                                            v212 = 0;
                                            v177 = 0;
                                            v179 = 0;
                                            v211 = 0;
                                            v185 = 0;
                                            v189 = 0;
                                            v210 = 0;
                                            v188 = 0;
                                            v192 = 0;
                                            v208 = 0;
                                            v194 = 0;
                                            v196 = 0;
                                            v206 = 0;
                                            v197 = 0;
                                            v200 = 0;
                                            v12 = 0;
                                            v13 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            v16 = 0;
                                            v209 = 1;
                                            v207 = 1;
                                            v205 = 1;
                                            *(_QWORD *)v204 = 0x100000001;
                                            *(_DWORD *)&v204[16] = 0;
                                            *(_QWORD *)&v204[8] = 0x100000001;
                                            v11 = 1;
                                            v202 = 0;
                                            v203 = 1;
                                            v201 = 1;
                                            v198 = 1;
                                            v199 = 1;
                                            v193 = 1;
                                            v195 = 1;
                                            v190 = 0x100000001;
                                          }
                                        }
                                        else
                                        {
                                          v187 = 0;
                                          v191 = 0;
                                          v217 = 0;
                                          v183 = 0;
                                          v186 = 0;
                                          v216 = 0;
                                          v178 = 0;
                                          v184 = 0;
                                          v215 = 0;
                                          v176 = 0;
                                          v182 = 0;
                                          v214 = 0;
                                          v174 = 0;
                                          v180 = 0;
                                          v213 = 0;
                                          v175 = 0;
                                          v181 = 0;
                                          v212 = 0;
                                          v177 = 0;
                                          v179 = 0;
                                          v211 = 0;
                                          v185 = 0;
                                          v189 = 0;
                                          v210 = 0;
                                          v188 = 0;
                                          v192 = 0;
                                          v208 = 0;
                                          v194 = 0;
                                          v196 = 0;
                                          v206 = 0;
                                          v197 = 0;
                                          v200 = 0;
                                          v12 = 0;
                                          v13 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          v16 = 0;
                                          v209 = 1;
                                          v207 = 1;
                                          v205 = 1;
                                          *(_QWORD *)v204 = 0x100000001;
                                          *(_DWORD *)&v204[16] = 0;
                                          *(_QWORD *)&v204[8] = 0x100000001;
                                          v11 = 1;
                                          v202 = 0;
                                          v203 = 1;
                                          v201 = 1;
                                          v198 = 1;
                                          v199 = 1;
                                          v193 = 1;
                                          v195 = 1;
                                          v190 = 0x100000001;
                                          v223 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v190 = 0;
                                      v223 = 0;
                                      v187 = 0;
                                      v191 = 0;
                                      v217 = 0;
                                      v183 = 0;
                                      v186 = 0;
                                      v216 = 0;
                                      v178 = 0;
                                      v184 = 0;
                                      v215 = 0;
                                      v176 = 0;
                                      v182 = 0;
                                      v214 = 0;
                                      v174 = 0;
                                      v180 = 0;
                                      v213 = 0;
                                      v175 = 0;
                                      v181 = 0;
                                      v212 = 0;
                                      v177 = 0;
                                      v179 = 0;
                                      v211 = 0;
                                      v185 = 0;
                                      v189 = 0;
                                      v210 = 0;
                                      v188 = 0;
                                      v192 = 0;
                                      v208 = 0;
                                      v194 = 0;
                                      v196 = 0;
                                      v206 = 0;
                                      v197 = 0;
                                      v200 = 0;
                                      v12 = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      v209 = 1;
                                      v207 = 1;
                                      v205 = 1;
                                      *(_QWORD *)v204 = 0x100000001;
                                      *(_DWORD *)&v204[16] = 0;
                                      *(_QWORD *)&v204[8] = 0x100000001;
                                      v11 = 1;
                                      v202 = 0;
                                      v203 = 1;
                                      v201 = 1;
                                      v198 = 1;
                                      v199 = 1;
                                      v193 = 1;
                                      v195 = 1;
                                      v224 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  v193 = 0;
                                  v195 = 0;
                                  v224 = 0;
                                  v190 = 0;
                                  v223 = 0;
                                  v187 = 0;
                                  v191 = 0;
                                  v217 = 0;
                                  v183 = 0;
                                  v186 = 0;
                                  v216 = 0;
                                  v178 = 0;
                                  v184 = 0;
                                  v215 = 0;
                                  v176 = 0;
                                  v182 = 0;
                                  v214 = 0;
                                  v174 = 0;
                                  v180 = 0;
                                  v213 = 0;
                                  v175 = 0;
                                  v181 = 0;
                                  v212 = 0;
                                  v177 = 0;
                                  v179 = 0;
                                  v211 = 0;
                                  v185 = 0;
                                  v189 = 0;
                                  v210 = 0;
                                  v188 = 0;
                                  v192 = 0;
                                  v208 = 0;
                                  v194 = 0;
                                  v196 = 0;
                                  v206 = 0;
                                  v197 = 0;
                                  v200 = 0;
                                  v12 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  v209 = 1;
                                  v207 = 1;
                                  v205 = 1;
                                  *(_QWORD *)v204 = 0x100000001;
                                  *(_DWORD *)&v204[16] = 0;
                                  *(_QWORD *)&v204[8] = 0x100000001;
                                  v11 = 1;
                                  v202 = 0;
                                  v203 = 1;
                                  v201 = 1;
                                  v198 = 1;
                                  v199 = 1;
                                  v225 = 1;
                                }
                              }
                            }
                            else
                            {
                              v198 = 0;
                              v199 = 0;
                              v225 = 0;
                              v193 = 0;
                              v195 = 0;
                              v224 = 0;
                              v190 = 0;
                              v223 = 0;
                              v187 = 0;
                              v191 = 0;
                              v217 = 0;
                              v183 = 0;
                              v186 = 0;
                              v216 = 0;
                              v178 = 0;
                              v184 = 0;
                              v215 = 0;
                              v176 = 0;
                              v182 = 0;
                              v214 = 0;
                              v174 = 0;
                              v180 = 0;
                              v213 = 0;
                              v175 = 0;
                              v181 = 0;
                              v212 = 0;
                              v177 = 0;
                              v179 = 0;
                              v211 = 0;
                              v185 = 0;
                              v189 = 0;
                              v210 = 0;
                              v188 = 0;
                              v192 = 0;
                              v208 = 0;
                              v194 = 0;
                              v196 = 0;
                              v206 = 0;
                              v197 = 0;
                              v200 = 0;
                              v12 = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              v209 = 1;
                              v207 = 1;
                              v205 = 1;
                              *(_QWORD *)v204 = 0x100000001;
                              *(_DWORD *)&v204[16] = 0;
                              *(_QWORD *)&v204[8] = 0x100000001;
                              v11 = 1;
                              v202 = 0;
                              v203 = 1;
                              v201 = 1;
                            }
                          }
                          else
                          {
                            v198 = 0;
                            v199 = 0;
                            v225 = 0;
                            v193 = 0;
                            v195 = 0;
                            v224 = 0;
                            v190 = 0;
                            v223 = 0;
                            v187 = 0;
                            v191 = 0;
                            v217 = 0;
                            v183 = 0;
                            v186 = 0;
                            v216 = 0;
                            v178 = 0;
                            v184 = 0;
                            v215 = 0;
                            v176 = 0;
                            v182 = 0;
                            v214 = 0;
                            v174 = 0;
                            v180 = 0;
                            v213 = 0;
                            v175 = 0;
                            v181 = 0;
                            v212 = 0;
                            v177 = 0;
                            v179 = 0;
                            v211 = 0;
                            v185 = 0;
                            v189 = 0;
                            v210 = 0;
                            v188 = 0;
                            v192 = 0;
                            v208 = 0;
                            v194 = 0;
                            v196 = 0;
                            v206 = 0;
                            v197 = 0;
                            v200 = 0;
                            v12 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v209 = 1;
                            v207 = 1;
                            v205 = 1;
                            *(_QWORD *)v204 = 0x100000001;
                            *(_DWORD *)&v204[16] = 0;
                            *(_QWORD *)&v204[8] = 0x100000001;
                            v11 = 1;
                            v202 = 0;
                            v203 = 1;
                            v201 = 1;
                            LODWORD(v226) = 1;
                          }
                        }
                      }
                      else
                      {
                        v203 = 0;
                        v201 = 0;
                        *(_QWORD *)&v226 = 0x100000000;
                        v198 = 0;
                        v199 = 0;
                        v225 = 0;
                        v193 = 0;
                        v195 = 0;
                        v224 = 0;
                        v190 = 0;
                        v223 = 0;
                        v187 = 0;
                        v191 = 0;
                        v217 = 0;
                        v183 = 0;
                        v186 = 0;
                        v216 = 0;
                        v178 = 0;
                        v184 = 0;
                        v215 = 0;
                        v176 = 0;
                        v182 = 0;
                        v214 = 0;
                        v174 = 0;
                        v180 = 0;
                        v213 = 0;
                        v175 = 0;
                        v181 = 0;
                        v212 = 0;
                        v177 = 0;
                        v179 = 0;
                        v211 = 0;
                        v185 = 0;
                        v189 = 0;
                        v210 = 0;
                        v188 = 0;
                        v192 = 0;
                        v208 = 0;
                        v194 = 0;
                        v196 = 0;
                        v206 = 0;
                        v197 = 0;
                        v200 = 0;
                        v202 = 0;
                        v12 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v209 = 1;
                        v207 = 1;
                        v205 = 1;
                        *(_QWORD *)v204 = 0x100000001;
                        *(_DWORD *)&v204[16] = 0;
                        *(_QWORD *)&v204[8] = 0x100000001;
                        v11 = 1;
                      }
                    }
                  }
                  else
                  {
                    v11 = 0;
                    *(_QWORD *)&v226 = 0;
                    v203 = 0;
                    v201 = 0;
                    v198 = 0;
                    v199 = 0;
                    v225 = 0;
                    v193 = 0;
                    v195 = 0;
                    v224 = 0;
                    v190 = 0;
                    v223 = 0;
                    v187 = 0;
                    v191 = 0;
                    v217 = 0;
                    v183 = 0;
                    v186 = 0;
                    v216 = 0;
                    v178 = 0;
                    v184 = 0;
                    v215 = 0;
                    v176 = 0;
                    v182 = 0;
                    v214 = 0;
                    v174 = 0;
                    v180 = 0;
                    v213 = 0;
                    v175 = 0;
                    v181 = 0;
                    v212 = 0;
                    v177 = 0;
                    v179 = 0;
                    v211 = 0;
                    v185 = 0;
                    v189 = 0;
                    v210 = 0;
                    v188 = 0;
                    v192 = 0;
                    v208 = 0;
                    v194 = 0;
                    v196 = 0;
                    v206 = 0;
                    v197 = 0;
                    v200 = 0;
                    v202 = 0;
                    v12 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v209 = 1;
                    v207 = 1;
                    v205 = 1;
                    *(_QWORD *)v204 = 1;
                    *(_DWORD *)&v204[16] = 0;
                    *(_QWORD *)&v204[8] = 0x100000001;
                  }
                  goto LABEL_16;
                }
                *(_QWORD *)&v204[4] = 0;
                LODWORD(v218) = 0;
                v11 = 0;
                *(_QWORD *)&v226 = 0;
                v203 = 0;
                v201 = 0;
                v198 = 0;
                v199 = 0;
                v225 = 0;
                v193 = 0;
                v195 = 0;
                v224 = 0;
                v190 = 0;
                v223 = 0;
                v187 = 0;
                v191 = 0;
                v217 = 0;
                v183 = 0;
                v186 = 0;
                v216 = 0;
                v178 = 0;
                v184 = 0;
                v215 = 0;
                v176 = 0;
                v182 = 0;
                v214 = 0;
                v174 = 0;
                v180 = 0;
                v213 = 0;
                v175 = 0;
                v181 = 0;
                v212 = 0;
                v177 = 0;
                v179 = 0;
                v211 = 0;
                v185 = 0;
                v189 = 0;
                v210 = 0;
                v188 = 0;
                v192 = 0;
                v208 = 0;
                v194 = 0;
                v196 = 0;
                v206 = 0;
                v197 = 0;
                v200 = 0;
                v202 = 0;
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v209 = 1;
                v207 = 1;
                v205 = 1;
                *(_DWORD *)v204 = 1;
                *(_QWORD *)&v204[12] = 1;
              }
              else
              {
                LODWORD(v218) = 0;
                v11 = 0;
                *(_QWORD *)&v226 = 0;
                v203 = 0;
                v201 = 0;
                v198 = 0;
                v199 = 0;
                v225 = 0;
                v193 = 0;
                v195 = 0;
                v224 = 0;
                v190 = 0;
                v223 = 0;
                v187 = 0;
                v191 = 0;
                v217 = 0;
                v183 = 0;
                v186 = 0;
                v216 = 0;
                v178 = 0;
                v184 = 0;
                v215 = 0;
                v176 = 0;
                v182 = 0;
                v214 = 0;
                v174 = 0;
                v180 = 0;
                v213 = 0;
                v175 = 0;
                v181 = 0;
                v212 = 0;
                v177 = 0;
                v179 = 0;
                v211 = 0;
                v185 = 0;
                v189 = 0;
                v210 = 0;
                v188 = 0;
                v192 = 0;
                v208 = 0;
                v194 = 0;
                v196 = 0;
                v206 = 0;
                v197 = 0;
                v200 = 0;
                v202 = 0;
                v12 = 0;
                *(_DWORD *)&v204[16] = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v209 = 1;
                v207 = 1;
                v205 = 1;
                *(_OWORD *)v204 = 1uLL;
              }
            }
            else
            {
              LODWORD(v218) = 0;
              v11 = 0;
              *(_QWORD *)&v226 = 0;
              v203 = 0;
              v201 = 0;
              v198 = 0;
              v199 = 0;
              v225 = 0;
              v193 = 0;
              v195 = 0;
              v224 = 0;
              v190 = 0;
              v223 = 0;
              v187 = 0;
              v191 = 0;
              v217 = 0;
              v183 = 0;
              v186 = 0;
              v216 = 0;
              v178 = 0;
              v184 = 0;
              v215 = 0;
              v176 = 0;
              v182 = 0;
              v214 = 0;
              v174 = 0;
              v180 = 0;
              v213 = 0;
              v175 = 0;
              v181 = 0;
              v212 = 0;
              v177 = 0;
              v179 = 0;
              v211 = 0;
              v185 = 0;
              v189 = 0;
              v210 = 0;
              v188 = 0;
              v192 = 0;
              v208 = 0;
              v194 = 0;
              v196 = 0;
              v206 = 0;
              v197 = 0;
              v200 = 0;
              v202 = 0;
              v12 = 0;
              *(_DWORD *)&v204[16] = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v209 = 1;
              v207 = 1;
              v205 = 1;
              *(_OWORD *)v204 = 1uLL;
              DWORD2(v226) = 1;
            }
          }
        }
        else
        {
          v205 = 0;
          memset(v204, 0, sizeof(v204));
          *(_QWORD *)((char *)&v226 + 4) = 0;
          LODWORD(v218) = 0;
          v11 = 0;
          v203 = 0;
          v201 = 0;
          LODWORD(v226) = 0;
          v198 = 0;
          v199 = 0;
          v225 = 0;
          v193 = 0;
          v195 = 0;
          v224 = 0;
          v190 = 0;
          v223 = 0;
          v187 = 0;
          v191 = 0;
          v217 = 0;
          v183 = 0;
          v186 = 0;
          v216 = 0;
          v178 = 0;
          v184 = 0;
          v215 = 0;
          v176 = 0;
          v182 = 0;
          v214 = 0;
          v174 = 0;
          v180 = 0;
          v213 = 0;
          v175 = 0;
          v181 = 0;
          v212 = 0;
          v177 = 0;
          v179 = 0;
          v211 = 0;
          v185 = 0;
          v189 = 0;
          v210 = 0;
          v188 = 0;
          v192 = 0;
          v208 = 0;
          v194 = 0;
          v196 = 0;
          v206 = 0;
          v197 = 0;
          v200 = 0;
          v202 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v209 = 1;
          v207 = 1;
          HIDWORD(v226) = 1;
        }
      }
    }
    else
    {
      v209 = 0;
      v207 = 0;
      v226 = 0uLL;
      v205 = 0;
      memset(v204, 0, sizeof(v204));
      v218 = 0x100000000;
      v11 = 0;
      v203 = 0;
      v201 = 0;
      v198 = 0;
      v199 = 0;
      v225 = 0;
      v193 = 0;
      v195 = 0;
      v224 = 0;
      v190 = 0;
      v223 = 0;
      v187 = 0;
      v191 = 0;
      v217 = 0;
      v183 = 0;
      v186 = 0;
      v216 = 0;
      v178 = 0;
      v184 = 0;
      v215 = 0;
      v176 = 0;
      v182 = 0;
      v214 = 0;
      v174 = 0;
      v180 = 0;
      v213 = 0;
      v175 = 0;
      v181 = 0;
      v212 = 0;
      v177 = 0;
      v179 = 0;
      v211 = 0;
      v185 = 0;
      v189 = 0;
      v210 = 0;
      v188 = 0;
      v192 = 0;
      v208 = 0;
      v194 = 0;
      v196 = 0;
      v206 = 0;
      v197 = 0;
      v200 = 0;
      v202 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }
  }
LABEL_16:
  if (v15)
  {
    v18 = v12;
    v19 = v13;
    v20 = v7;
    v21 = v11;
    v22 = v14;

    v14 = v22;
    v11 = v21;
    v7 = v20;
    v13 = v19;
    v12 = v18;
  }
  if (v14)

  if (v13)
  {

  }
  if (*(_DWORD *)&v204[16])
  {

  }
  if (v12)

  if (v202)
  {

  }
  if (HIDWORD(v205))
  {

  }
  if (v200)

  if (v197)
  {

  }
  if (v206)
  {

  }
  if (v196)

  if (v194)
  {

  }
  if (v208)
  {

  }
  if (v192)

  if (v188)
  {

  }
  if (v210)
  {

  }
  if (v189)

  if (v185)
  {

  }
  if (v211)
  {

  }
  if (v179)

  if (v177)
  {

  }
  if (v212)
  {

  }
  if (v181)

  if (v175)
  {

  }
  if (v213)
  {

  }
  if (v180)

  if (v174)
  {

  }
  if (v214)
  {

  }
  if (v182)

  if (v176)
  {

  }
  if (v215)
  {

  }
  if (v184)

  if (v178)
  {

  }
  if (v216)
  {

  }
  if (v186)

  if (v183)
  {

  }
  if (v217)
  {

  }
  if (v191)

  if (v187)
  {

  }
  if (v223)
  {

  }
  if ((_DWORD)v190)

  if (HIDWORD(v190))
  {

  }
  if (v224)
  {

  }
  if (v195)

  if (v193)
  {

  }
  if (v225)
  {

  }
  if (v199)

  if (v198)
  {

  }
  if ((_DWORD)v226)
  {

  }
  if (v201)

  if (v203)
  {

  }
  if (DWORD1(v226))
  {

  }
  if (*(_DWORD *)&v204[4])

  if (v11)
  {

  }
  if ((_DWORD)v218)
  {

  }
  if (*(_DWORD *)&v204[8])

  if (*(_DWORD *)&v204[12])
  {

  }
  if (DWORD2(v226))
  {

  }
  if (*(_DWORD *)v204)

  if ((_DWORD)v205)
  {

  }
  if (HIDWORD(v226))
  {

  }
  if (v207)

  if (v209)
  {

  }
  if (HIDWORD(v218))
  {

  }
  if (v220 != v219)

LABEL_147:
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
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
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)SFDetailedRowCardSection;
  v3 = -[SFCardSection hash](&v57, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v56, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v55, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v54, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFDetailedRowCardSection type](self, "type");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v53, "hash");
  v11 = v10 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v52, "hash");
  -[SFDetailedRowCardSection thumbnail](self, "thumbnail");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v12 ^ objc_msgSend(v51, "hash");
  v14 = -[SFDetailedRowCardSection preventThumbnailImageScaling](self, "preventThumbnailImageScaling");
  -[SFDetailedRowCardSection title](self, "title");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v50, "hash");
  -[SFDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v49, "hash");
  -[SFDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 ^ objc_msgSend(v48, "hash");
  v18 = v17 ^ -[SFDetailedRowCardSection isSecondaryTitleDetached](self, "isSecondaryTitleDetached");
  -[SFDetailedRowCardSection descriptions](self, "descriptions");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v18 ^ objc_msgSend(v47, "hash");
  -[SFDetailedRowCardSection footnote](self, "footnote");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v46, "hash");
  -[SFDetailedRowCardSection trailingTopText](self, "trailingTopText");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 ^ objc_msgSend(v45, "hash");
  -[SFDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 ^ objc_msgSend(v44, "hash");
  -[SFDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 ^ objc_msgSend(v43, "hash");
  -[SFDetailedRowCardSection action](self, "action");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 ^ objc_msgSend(v42, "hash");
  -[SFDetailedRowCardSection button](self, "button");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ objc_msgSend(v25, "hash");
  v27 = v26 ^ -[SFDetailedRowCardSection shouldUseCompactDisplay](self, "shouldUseCompactDisplay");
  -[SFDetailedRowCardSection buttonItems](self, "buttonItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v19 ^ v27 ^ objc_msgSend(v28, "hash");
  -[SFDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "hash");
  v32 = v31 ^ -[SFDetailedRowCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing");
  -[SFDetailedRowCardSection topText](self, "topText");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v32 ^ objc_msgSend(v33, "hash");
  -[SFDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34 ^ objc_msgSend(v35, "hash");
  -[SFDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v36 ^ objc_msgSend(v37, "hash");
  -[SFDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v29 ^ v38 ^ objc_msgSend(v39, "hash");

  return v40;
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

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (SFRichText)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (SFFormattedText)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitle, a3);
}

- (SFImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (void)setSecondaryTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitleImage, a3);
}

- (BOOL)isSecondaryTitleDetached
{
  return self->_isSecondaryTitleDetached;
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (void)setDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (SFRichText)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_storeStrong((id *)&self->_footnote, a3);
}

- (SFFormattedText)trailingTopText
{
  return self->_trailingTopText;
}

- (void)setTrailingTopText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTopText, a3);
}

- (SFFormattedText)trailingMiddleText
{
  return self->_trailingMiddleText;
}

- (void)setTrailingMiddleText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMiddleText, a3);
}

- (SFFormattedText)trailingBottomText
{
  return self->_trailingBottomText;
}

- (void)setTrailingBottomText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBottomText, a3);
}

- (SFActionItem)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (SFButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (BOOL)shouldUseCompactDisplay
{
  return self->_shouldUseCompactDisplay;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (SFImage)trailingThumbnail
{
  return self->_trailingThumbnail;
}

- (void)setTrailingThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_trailingThumbnail, a3);
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (SFRichText)topText
{
  return self->_topText;
}

- (void)setTopText:(id)a3
{
  objc_storeStrong((id *)&self->_topText, a3);
}

- (SFRichText)richTrailingTopText
{
  return self->_richTrailingTopText;
}

- (void)setRichTrailingTopText:(id)a3
{
  objc_storeStrong((id *)&self->_richTrailingTopText, a3);
}

- (SFRichText)richTrailingMiddleText
{
  return self->_richTrailingMiddleText;
}

- (void)setRichTrailingMiddleText:(id)a3
{
  objc_storeStrong((id *)&self->_richTrailingMiddleText, a3);
}

- (SFRichText)richTrailingBottomText
{
  return self->_richTrailingBottomText;
}

- (void)setRichTrailingBottomText:(id)a3
{
  objc_storeStrong((id *)&self->_richTrailingBottomText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richTrailingBottomText, 0);
  objc_storeStrong((id *)&self->_richTrailingMiddleText, 0);
  objc_storeStrong((id *)&self->_richTrailingTopText, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_trailingThumbnail, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_trailingTopText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFDetailedRowCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFDetailedRowCardSection *v5;
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
  SFFormattedText *v33;
  void *v34;
  SFFormattedText *v35;
  void *v36;
  SFImage *v37;
  void *v38;
  SFImage *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  SFRichText *v47;
  void *v48;
  SFRichText *v49;
  void *v50;
  SFRichText *v51;
  void *v52;
  SFFormattedText *v53;
  void *v54;
  SFFormattedText *v55;
  void *v56;
  SFFormattedText *v57;
  void *v58;
  SFFormattedText *v59;
  void *v60;
  SFFormattedText *v61;
  void *v62;
  SFFormattedText *v63;
  void *v64;
  SFActionItem *v65;
  void *v66;
  SFActionItem *v67;
  void *v68;
  SFButton *v69;
  void *v70;
  SFButton *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  SFButtonItem *v79;
  void *v80;
  SFImage *v81;
  void *v82;
  SFImage *v83;
  void *v84;
  SFRichText *v85;
  void *v86;
  SFRichText *v87;
  void *v88;
  SFRichText *v89;
  void *v90;
  SFRichText *v91;
  void *v92;
  SFRichText *v93;
  void *v94;
  SFRichText *v95;
  void *v96;
  SFRichText *v97;
  void *v98;
  SFRichText *v99;
  SFDetailedRowCardSection *v100;
  void *v102;
  SFDetailedRowCardSection *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  objc_super v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v116.receiver = self;
  v116.super_class = (Class)SFDetailedRowCardSection;
  v5 = -[SFCardSection init](&v116, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v7 = 0;
    }

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v113 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
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
      -[SFDetailedRowCardSection setType:](v5, "setType:", v19);

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
      -[SFDetailedRowCardSection setThumbnail:](v5, "setThumbnail:", v27);

    }
    if (objc_msgSend(v4, "preventThumbnailImageScaling"))
      -[SFDetailedRowCardSection setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", objc_msgSend(v4, "preventThumbnailImageScaling"));
    objc_msgSend(v4, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFRichText initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFDetailedRowCardSection setTitle:](v5, "setTitle:", v31);

    }
    objc_msgSend(v4, "secondaryTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [SFFormattedText alloc];
      objc_msgSend(v4, "secondaryTitle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SFFormattedText initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[SFDetailedRowCardSection setSecondaryTitle:](v5, "setSecondaryTitle:", v35);

    }
    objc_msgSend(v4, "secondaryTitleImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [SFImage alloc];
      objc_msgSend(v4, "secondaryTitleImage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SFImage initWithProtobuf:](v37, "initWithProtobuf:", v38);
      -[SFDetailedRowCardSection setSecondaryTitleImage:](v5, "setSecondaryTitleImage:", v39);

    }
    if (objc_msgSend(v4, "isSecondaryTitleDetached"))
      -[SFDetailedRowCardSection setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", objc_msgSend(v4, "isSecondaryTitleDetached"));
    objc_msgSend(v4, "descriptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v5;
    if (v40)
    {
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v41 = 0;
    }

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    objc_msgSend(v4, "descriptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v109;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v109 != v45)
            objc_enumerationMutation(v42);
          v47 = -[SFRichText initWithProtobuf:]([SFRichText alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * j));
          if (v47)
            objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
      }
      while (v44);
    }

    -[SFDetailedRowCardSection setDescriptions:](v103, "setDescriptions:", v41);
    objc_msgSend(v4, "footnote");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = [SFRichText alloc];
      objc_msgSend(v4, "footnote");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[SFRichText initWithProtobuf:](v49, "initWithProtobuf:", v50);
      -[SFDetailedRowCardSection setFootnote:](v103, "setFootnote:", v51);

    }
    objc_msgSend(v4, "trailingTopText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = [SFFormattedText alloc];
      objc_msgSend(v4, "trailingTopText");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[SFFormattedText initWithProtobuf:](v53, "initWithProtobuf:", v54);
      -[SFDetailedRowCardSection setTrailingTopText:](v103, "setTrailingTopText:", v55);

    }
    objc_msgSend(v4, "trailingMiddleText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [SFFormattedText alloc];
      objc_msgSend(v4, "trailingMiddleText");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[SFFormattedText initWithProtobuf:](v57, "initWithProtobuf:", v58);
      -[SFDetailedRowCardSection setTrailingMiddleText:](v103, "setTrailingMiddleText:", v59);

    }
    objc_msgSend(v4, "trailingBottomText");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = [SFFormattedText alloc];
      objc_msgSend(v4, "trailingBottomText");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[SFFormattedText initWithProtobuf:](v61, "initWithProtobuf:", v62);
      -[SFDetailedRowCardSection setTrailingBottomText:](v103, "setTrailingBottomText:", v63);

    }
    objc_msgSend(v4, "action");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = [SFActionItem alloc];
      objc_msgSend(v4, "action");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[SFActionItem initWithProtobuf:](v65, "initWithProtobuf:", v66);
      -[SFDetailedRowCardSection setAction:](v103, "setAction:", v67);

    }
    objc_msgSend(v4, "button");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = [SFButton alloc];
      objc_msgSend(v4, "button");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[SFButton initWithProtobuf:](v69, "initWithProtobuf:", v70);
      -[SFDetailedRowCardSection setButton:](v103, "setButton:", v71);

    }
    if (objc_msgSend(v4, "shouldUseCompactDisplay"))
      -[SFDetailedRowCardSection setShouldUseCompactDisplay:](v103, "setShouldUseCompactDisplay:", objc_msgSend(v4, "shouldUseCompactDisplay"));
    objc_msgSend(v4, "buttonItems");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v73 = 0;
    }

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = v4;
    objc_msgSend(v4, "buttonItems");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v105;
      do
      {
        for (k = 0; k != v76; ++k)
        {
          if (*(_QWORD *)v105 != v77)
            objc_enumerationMutation(v74);
          v79 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * k));
          if (v79)
            objc_msgSend(v73, "addObject:", v79);

        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
      }
      while (v76);
    }

    v5 = v103;
    -[SFDetailedRowCardSection setButtonItems:](v103, "setButtonItems:", v73);
    v4 = v102;
    objc_msgSend(v102, "trailingThumbnail");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      v81 = [SFImage alloc];
      objc_msgSend(v102, "trailingThumbnail");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = -[SFImage initWithProtobuf:](v81, "initWithProtobuf:", v82);
      -[SFDetailedRowCardSection setTrailingThumbnail:](v103, "setTrailingThumbnail:", v83);

    }
    if (objc_msgSend(v102, "buttonItemsAreTrailing"))
      -[SFDetailedRowCardSection setButtonItemsAreTrailing:](v103, "setButtonItemsAreTrailing:", objc_msgSend(v102, "buttonItemsAreTrailing"));
    objc_msgSend(v102, "topText");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      v85 = [SFRichText alloc];
      objc_msgSend(v102, "topText");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = -[SFRichText initWithProtobuf:](v85, "initWithProtobuf:", v86);
      -[SFDetailedRowCardSection setTopText:](v103, "setTopText:", v87);

    }
    objc_msgSend(v102, "richTrailingTopText");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88)
    {
      v89 = [SFRichText alloc];
      objc_msgSend(v102, "richTrailingTopText");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = -[SFRichText initWithProtobuf:](v89, "initWithProtobuf:", v90);
      -[SFDetailedRowCardSection setRichTrailingTopText:](v103, "setRichTrailingTopText:", v91);

    }
    objc_msgSend(v102, "richTrailingMiddleText");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      v93 = [SFRichText alloc];
      objc_msgSend(v102, "richTrailingMiddleText");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = -[SFRichText initWithProtobuf:](v93, "initWithProtobuf:", v94);
      -[SFDetailedRowCardSection setRichTrailingMiddleText:](v103, "setRichTrailingMiddleText:", v95);

    }
    objc_msgSend(v102, "richTrailingBottomText");
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      v97 = [SFRichText alloc];
      objc_msgSend(v102, "richTrailingBottomText");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = -[SFRichText initWithProtobuf:](v97, "initWithProtobuf:", v98);
      -[SFDetailedRowCardSection setRichTrailingBottomText:](v103, "setRichTrailingBottomText:", v99);

    }
    v100 = v103;

  }
  return v5;
}

@end
