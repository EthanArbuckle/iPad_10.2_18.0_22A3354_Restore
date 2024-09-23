@implementation RFLongItemStandardCardSection

- (void)setIs_quote:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_is_quote = a3;
}

- (BOOL)hasIs_quote
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHas_background_platter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_has_background_platter = a3;
}

- (BOOL)hasHas_background_platter
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFLongItemStandardCardSection)initWithCoder:(id)a3
{
  id v4;
  RFLongItemStandardCardSection *v5;
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
    -[SFCardSection text](v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFLongItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    -[RFLongItemStandardCardSection setIs_quote:](v5, "setIs_quote:", -[SFCardSection is_quote](v8, "is_quote"));
    -[RFLongItemStandardCardSection setHas_background_platter:](v5, "setHas_background_platter:", -[SFCardSection has_background_platter](v8, "has_background_platter"));
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
  v3.super_class = (Class)RFLongItemStandardCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFLongItemStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFLongItemStandardCardSection initWithFacade:]([_SFPBRFLongItemStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFLongItemStandardCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFLongItemStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFLongItemStandardCardSection initWithFacade:]([_SFPBRFLongItemStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFLongItemStandardCardSection jsonData](v2, "jsonData");
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
  v8.super_class = (Class)RFLongItemStandardCardSection;
  v4 = -[SFCardSection copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[RFLongItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  objc_msgSend(v4, "setIs_quote:", -[RFLongItemStandardCardSection is_quote](self, "is_quote"));
  objc_msgSend(v4, "setHas_background_platter:", -[RFLongItemStandardCardSection has_background_platter](self, "has_background_platter"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFLongItemStandardCardSection *v6;
  RFLongItemStandardCardSection *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  objc_super v15;

  v6 = (RFLongItemStandardCardSection *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFLongItemStandardCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v15.receiver = self;
      v15.super_class = (Class)RFLongItemStandardCardSection;
      if (-[SFCardSection isEqual:](&v15, sel_isEqual_, v6))
      {
        v7 = v6;
        -[RFLongItemStandardCardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFLongItemStandardCardSection text](v7, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_17:

          goto LABEL_18;
        }
        -[RFLongItemStandardCardSection text](self, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[RFLongItemStandardCardSection text](self, "text"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFLongItemStandardCardSection text](v7, "text"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[RFLongItemStandardCardSection is_quote](self, "is_quote");
          if (v12 == -[RFLongItemStandardCardSection is_quote](v7, "is_quote"))
          {
            v13 = -[RFLongItemStandardCardSection has_background_platter](self, "has_background_platter");
            v11 = v13 ^ -[RFLongItemStandardCardSection has_background_platter](v7, "has_background_platter") ^ 1;
            if (!v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            LOBYTE(v11) = 0;
            if (!v10)
              goto LABEL_16;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_16;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RFLongItemStandardCardSection;
  v3 = -[SFCardSection hash](&v9, sel_hash);
  -[RFLongItemStandardCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[RFLongItemStandardCardSection is_quote](self, "is_quote");
  v7 = v6 ^ -[RFLongItemStandardCardSection has_background_platter](self, "has_background_platter") ^ v3;

  return v7;
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (BOOL)is_quote
{
  return self->_is_quote;
}

- (BOOL)has_background_platter
{
  return self->_has_background_platter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFLongItemStandardCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFLongItemStandardCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  RFLongItemStandardCardSection *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFLongItemStandardCardSection;
  v5 = -[SFCardSection init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTextProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFLongItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    }
    if (objc_msgSend(v4, "is_quote"))
      -[RFLongItemStandardCardSection setIs_quote:](v5, "setIs_quote:", objc_msgSend(v4, "is_quote"));
    if (objc_msgSend(v4, "has_background_platter"))
      -[RFLongItemStandardCardSection setHas_background_platter:](v5, "setHas_background_platter:", objc_msgSend(v4, "has_background_platter"));
    v10 = v5;
  }

  return v5;
}

@end
