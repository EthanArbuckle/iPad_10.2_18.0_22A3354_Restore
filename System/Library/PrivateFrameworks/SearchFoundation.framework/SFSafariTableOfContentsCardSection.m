@implementation SFSafariTableOfContentsCardSection

- (SFSafariTableOfContentsCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFSafariTableOfContentsCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFSafariTableOfContentsItem *v13;
  void *v14;
  void *v15;
  SFSafariTableOfContentsCardSection *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFSafariTableOfContentsCardSection;
  v5 = -[SFCardSection init](&v22, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "tableOfContentsType"))
      -[SFSafariTableOfContentsCardSection setTableOfContentsType:](v5, "setTableOfContentsType:", objc_msgSend(v4, "tableOfContentsType"));
    if (objc_msgSend(v4, "tableOfContentsSource"))
      -[SFSafariTableOfContentsCardSection setTableOfContentsSource:](v5, "setTableOfContentsSource:", objc_msgSend(v4, "tableOfContentsSource"));
    objc_msgSend(v4, "tableOfContentsItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "tableOfContentsItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFSafariTableOfContentsItem initWithProtobuf:]([SFSafariTableOfContentsItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    -[SFSafariTableOfContentsCardSection setTableOfContentsItems:](v5, "setTableOfContentsItems:", v7);
    objc_msgSend(v4, "algorithmVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "algorithmVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSafariTableOfContentsCardSection setAlgorithmVersion:](v5, "setAlgorithmVersion:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (void)setTableOfContentsType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tableOfContentsType = a3;
}

- (BOOL)hasTableOfContentsType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTableOfContentsSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tableOfContentsSource = a3;
}

- (BOOL)hasTableOfContentsSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFSafariTableOfContentsCardSection)initWithCoder:(id)a3
{
  id v4;
  SFSafariTableOfContentsCardSection *v5;
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

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFSafariTableOfContentsCardSection setTableOfContentsType:](v5, "setTableOfContentsType:", -[SFCardSection tableOfContentsType](v8, "tableOfContentsType"));
    -[SFSafariTableOfContentsCardSection setTableOfContentsSource:](v5, "setTableOfContentsSource:", -[SFCardSection tableOfContentsSource](v8, "tableOfContentsSource"));
    -[SFCardSection tableOfContentsItems](v8, "tableOfContentsItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSafariTableOfContentsCardSection setTableOfContentsItems:](v5, "setTableOfContentsItems:", v9);

    -[SFCardSection algorithmVersion](v8, "algorithmVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSafariTableOfContentsCardSection setAlgorithmVersion:](v5, "setAlgorithmVersion:", v10);

    -[SFCardSection nextCard](v8, "nextCard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v11);

    -[SFCardSection commands](v8, "commands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v12);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v13);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v14);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v15);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v16);

    -[SFCardSection command](v8, "command");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v17);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v18);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v19);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v20);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v21);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v22);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v23);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v24);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v25);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v26);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v27);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v28);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v29);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v30);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSafariTableOfContentsCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSafariTableOfContentsCardSection *v2;
  void *v3;

  v2 = -[_SFPBSafariTableOfContentsCardSection initWithFacade:]([_SFPBSafariTableOfContentsCardSection alloc], "initWithFacade:", self);
  -[_SFPBSafariTableOfContentsCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSafariTableOfContentsCardSection *v2;
  void *v3;

  v2 = -[_SFPBSafariTableOfContentsCardSection initWithFacade:]([_SFPBSafariTableOfContentsCardSection alloc], "initWithFacade:", self);
  -[_SFPBSafariTableOfContentsCardSection jsonData](v2, "jsonData");
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFSafariTableOfContentsCardSection;
  v4 = -[SFCardSection copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setTableOfContentsType:", -[SFSafariTableOfContentsCardSection tableOfContentsType](self, "tableOfContentsType"));
  objc_msgSend(v4, "setTableOfContentsSource:", -[SFSafariTableOfContentsCardSection tableOfContentsSource](self, "tableOfContentsSource"));
  -[SFSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTableOfContentsItems:", v6);

  -[SFSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAlgorithmVersion:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFSafariTableOfContentsCardSection *v5;
  SFSafariTableOfContentsCardSection *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v5 = (SFSafariTableOfContentsCardSection *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (-[SFSafariTableOfContentsCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v24.receiver = self;
      v24.super_class = (Class)SFSafariTableOfContentsCardSection;
      if (-[SFCardSection isEqual:](&v24, sel_isEqual_, v5))
      {
        v6 = v5;
        v7 = -[SFSafariTableOfContentsCardSection tableOfContentsType](self, "tableOfContentsType");
        if (v7 != -[SFSafariTableOfContentsCardSection tableOfContentsType](v6, "tableOfContentsType")
          || (v8 = -[SFSafariTableOfContentsCardSection tableOfContentsSource](self, "tableOfContentsSource"),
              v8 != -[SFSafariTableOfContentsCardSection tableOfContentsSource](v6, "tableOfContentsSource")))
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        -[SFSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSafariTableOfContentsCardSection tableOfContentsItems](v6, "tableOfContentsItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v9 == 0) == (v10 != 0))
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        -[SFSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[SFSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSafariTableOfContentsCardSection tableOfContentsItems](v6, "tableOfContentsItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v12))
          {
            v13 = 0;
LABEL_21:

LABEL_22:
            goto LABEL_23;
          }
          v23 = v12;
        }
        -[SFSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSafariTableOfContentsCardSection algorithmVersion](v6, "algorithmVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if ((v14 == 0) == (v15 != 0))
        {

          v13 = 0;
        }
        else
        {
          -[SFSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            -[SFSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSafariTableOfContentsCardSection algorithmVersion](v6, "algorithmVersion");
            v22 = v3;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v21, "isEqual:", v19);

            v3 = v22;
          }
          else
          {

            v13 = 1;
          }
        }
        v12 = v23;
        if (!v11)
          goto LABEL_22;
        goto LABEL_21;
      }
    }
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFSafariTableOfContentsCardSection;
  v3 = -[SFCardSection hash](&v11, sel_hash);
  v4 = -[SFSafariTableOfContentsCardSection tableOfContentsType](self, "tableOfContentsType");
  v5 = v4 ^ -[SFSafariTableOfContentsCardSection tableOfContentsSource](self, "tableOfContentsSource");
  -[SFSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (int)tableOfContentsType
{
  return self->_tableOfContentsType;
}

- (int)tableOfContentsSource
{
  return self->_tableOfContentsSource;
}

- (NSArray)tableOfContentsItems
{
  return self->_tableOfContentsItems;
}

- (void)setTableOfContentsItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmVersion, 0);
  objc_storeStrong((id *)&self->_tableOfContentsItems, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
