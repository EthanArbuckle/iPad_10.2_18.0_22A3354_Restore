@implementation SFColorBarCardSection

- (SFColorBarCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFColorBarCardSection *v5;
  void *v6;
  SFColor *v7;
  void *v8;
  SFColor *v9;
  void *v10;
  SFRichText *v11;
  void *v12;
  SFRichText *v13;
  void *v14;
  SFRichText *v15;
  void *v16;
  SFRichText *v17;
  void *v18;
  SFRichText *v19;
  void *v20;
  SFRichText *v21;
  SFColorBarCardSection *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFColorBarCardSection;
  v5 = -[SFCardSection init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "barColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFColor alloc];
      objc_msgSend(v4, "barColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFColor initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFColorBarCardSection setBarColor:](v5, "setBarColor:", v9);

    }
    objc_msgSend(v4, "topText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFRichText alloc];
      objc_msgSend(v4, "topText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFRichText initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFColorBarCardSection setTopText:](v5, "setTopText:", v13);

    }
    objc_msgSend(v4, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFRichText initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[SFColorBarCardSection setTitle:](v5, "setTitle:", v17);

    }
    objc_msgSend(v4, "subtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [SFRichText alloc];
      objc_msgSend(v4, "subtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SFRichText initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[SFColorBarCardSection setSubtitle:](v5, "setSubtitle:", v21);

    }
    v22 = v5;
  }

  return v5;
}

- (SFColorBarCardSection)initWithCoder:(id)a3
{
  id v4;
  SFColorBarCardSection *v5;
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

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection barColor](v8, "barColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFColorBarCardSection setBarColor:](v5, "setBarColor:", v9);

    -[SFCardSection topText](v8, "topText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFColorBarCardSection setTopText:](v5, "setTopText:", v10);

    -[SFCardSection title](v8, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFColorBarCardSection setTitle:](v5, "setTitle:", v11);

    -[SFCardSection subtitle](v8, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFColorBarCardSection setSubtitle:](v5, "setSubtitle:", v12);

    -[SFCardSection nextCard](v8, "nextCard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v13);

    -[SFCardSection commands](v8, "commands");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v14);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v15);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v16);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v17);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v18);

    -[SFCardSection command](v8, "command");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v19);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v20);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v21);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v22);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v23);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v24);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v25);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v26);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v27);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v28);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v29);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v30);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v31);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v32);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFColorBarCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBColorBarCardSection *v2;
  void *v3;

  v2 = -[_SFPBColorBarCardSection initWithFacade:]([_SFPBColorBarCardSection alloc], "initWithFacade:", self);
  -[_SFPBColorBarCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBColorBarCardSection *v2;
  void *v3;

  v2 = -[_SFPBColorBarCardSection initWithFacade:]([_SFPBColorBarCardSection alloc], "initWithFacade:", self);
  -[_SFPBColorBarCardSection jsonData](v2, "jsonData");
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFColorBarCardSection;
  v4 = -[SFCardSection copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[SFColorBarCardSection barColor](self, "barColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setBarColor:", v6);

  -[SFColorBarCardSection topText](self, "topText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTopText:", v8);

  -[SFColorBarCardSection title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setTitle:", v10);

  -[SFColorBarCardSection subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setSubtitle:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFColorBarCardSection *v5;
  SFColorBarCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
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
  objc_super v42;

  v5 = (SFColorBarCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFColorBarCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v42.receiver = self;
      v42.super_class = (Class)SFColorBarCardSection;
      if (-[SFCardSection isEqual:](&v42, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFColorBarCardSection barColor](self, "barColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFColorBarCardSection barColor](v6, "barColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[SFColorBarCardSection barColor](self, "barColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFColorBarCardSection barColor](self, "barColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFColorBarCardSection barColor](v6, "barColor");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_36;
          }
          v41 = v10;
        }
        -[SFColorBarCardSection topText](self, "topText");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFColorBarCardSection topText](v6, "topText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_35;
        }
        -[SFColorBarCardSection topText](self, "topText");
        v15 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v15;
        if (v15)
        {
          v16 = (void *)v15;
          v35 = v14;
          v17 = v12;
          -[SFColorBarCardSection topText](self, "topText");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFColorBarCardSection topText](v6, "topText");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v11 = 0;
            v12 = v17;
            v14 = v35;
            goto LABEL_33;
          }
          v39 = v3;
          v12 = v17;
          v14 = v35;
        }
        else
        {
          v39 = v3;
        }
        -[SFColorBarCardSection title](self, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFColorBarCardSection title](v6, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          v11 = 0;
          v3 = v39;
          v16 = v40;
          if (!v40)
            goto LABEL_34;
          goto LABEL_33;
        }
        v33 = v20;
        v34 = v19;
        -[SFColorBarCardSection title](self, "title");
        v16 = v40;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36
          || (-[SFColorBarCardSection title](self, "title"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFColorBarCardSection title](v6, "title"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = v21,
              objc_msgSend(v21, "isEqual:")))
        {
          -[SFColorBarCardSection subtitle](self, "subtitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFColorBarCardSection subtitle](v6, "subtitle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v22 == 0) == (v23 != 0))
          {

            v11 = 0;
            v16 = v40;
          }
          else
          {
            v29 = v22;
            v30 = v23;
            -[SFColorBarCardSection subtitle](self, "subtitle");
            v24 = objc_claimAutoreleasedReturnValue();
            v16 = v40;
            if (v24)
            {
              v28 = (void *)v24;
              -[SFColorBarCardSection subtitle](self, "subtitle");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFColorBarCardSection subtitle](v6, "subtitle");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v27, "isEqual:");

            }
            else
            {

              v11 = 1;
            }
          }
          v3 = v39;
          if (!v36)
          {
LABEL_32:

            if (!v16)
            {
LABEL_34:

LABEL_35:
              v10 = v41;
              if (!v9)
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
          v11 = 0;
          v3 = v39;
        }

        goto LABEL_32;
      }
    }
    v11 = 0;
  }
LABEL_39:

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
  void *v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFColorBarCardSection;
  v3 = -[SFCardSection hash](&v13, sel_hash);
  -[SFColorBarCardSection barColor](self, "barColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFColorBarCardSection topText](self, "topText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFColorBarCardSection title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[SFColorBarCardSection subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash") ^ v3;

  return v11;
}

- (SFColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_barColor, a3);
}

- (SFRichText)topText
{
  return self->_topText;
}

- (void)setTopText:(id)a3
{
  objc_storeStrong((id *)&self->_topText, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
