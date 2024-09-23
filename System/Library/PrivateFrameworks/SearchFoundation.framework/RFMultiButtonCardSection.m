@implementation RFMultiButtonCardSection

- (RFMultiButtonCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFMultiButtonCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFButtonItem *v13;
  RFMultiButtonCardSection *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFMultiButtonCardSection;
  v5 = -[SFCardSection init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "buttons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "buttons", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[RFMultiButtonCardSection setButtons:](v5, "setButtons:", v7);
    if (objc_msgSend(v4, "layoutType"))
      -[RFMultiButtonCardSection setLayoutType:](v5, "setLayoutType:", objc_msgSend(v4, "layoutType"));
    v14 = v5;

  }
  return v5;
}

- (void)setLayoutType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_layoutType = a3;
}

- (BOOL)hasLayoutType
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFMultiButtonCardSection)initWithCoder:(id)a3
{
  id v4;
  RFMultiButtonCardSection *v5;
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

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection buttons](v8, "buttons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFMultiButtonCardSection setButtons:](v5, "setButtons:", v9);

    -[RFMultiButtonCardSection setLayoutType:](v5, "setLayoutType:", -[SFCardSection layoutType](v8, "layoutType"));
    -[SFCardSection nextCard](v8, "nextCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v10);

    -[SFCardSection commands](v8, "commands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v11);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v12);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v13);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v14);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v15);

    -[SFCardSection command](v8, "command");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v16);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v17);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v18);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v19);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v20);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v21);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v22);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v23);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v24);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v25);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v26);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v27);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v28);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v29);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFMultiButtonCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFMultiButtonCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFMultiButtonCardSection initWithFacade:]([_SFPBRFMultiButtonCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFMultiButtonCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFMultiButtonCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFMultiButtonCardSection initWithFacade:]([_SFPBRFMultiButtonCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFMultiButtonCardSection jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RFMultiButtonCardSection;
  v4 = -[SFCardSection copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[RFMultiButtonCardSection buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setButtons:", v6);

  objc_msgSend(v4, "setLayoutType:", -[RFMultiButtonCardSection layoutType](self, "layoutType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFMultiButtonCardSection *v6;
  RFMultiButtonCardSection *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  objc_super v14;

  v6 = (RFMultiButtonCardSection *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFMultiButtonCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)RFMultiButtonCardSection;
      if (-[SFCardSection isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[RFMultiButtonCardSection buttons](self, "buttons");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFMultiButtonCardSection buttons](v7, "buttons");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[RFMultiButtonCardSection buttons](self, "buttons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[RFMultiButtonCardSection buttons](self, "buttons"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFMultiButtonCardSection buttons](v7, "buttons"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[RFMultiButtonCardSection layoutType](self, "layoutType");
          v11 = v12 == -[RFMultiButtonCardSection layoutType](v7, "layoutType");
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_13;
      }
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RFMultiButtonCardSection;
  v3 = -[SFCardSection hash](&v8, sel_hash);
  -[RFMultiButtonCardSection buttons](self, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[RFMultiButtonCardSection layoutType](self, "layoutType") ^ v3;

  return v6;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (int)layoutType
{
  return self->_layoutType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
