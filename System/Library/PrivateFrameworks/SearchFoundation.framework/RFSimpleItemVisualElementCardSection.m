@implementation RFSimpleItemVisualElementCardSection

- (RFSimpleItemVisualElementCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSimpleItemVisualElementCardSection *v5;
  void *v6;
  RFVisualProperty *v7;
  void *v8;
  RFVisualProperty *v9;
  void *v10;
  RFTextProperty *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  RFTextProperty *v15;
  void *v16;
  RFTextProperty *v17;
  void *v18;
  RFTextProperty *v19;
  void *v20;
  RFTextProperty *v21;
  RFSimpleItemVisualElementCardSection *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFSimpleItemVisualElementCardSection;
  v5 = -[SFCardSection init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFVisualProperty alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFVisualProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFSimpleItemVisualElementCardSection setImage:](v5, "setImage:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSimpleItemVisualElementCardSection setText_1:](v5, "setText_1:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFTextProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFSimpleItemVisualElementCardSection setText_2:](v5, "setText_2:", v17);

    }
    objc_msgSend(v4, "footnote");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      objc_msgSend(v4, "footnote");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFTextProperty initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFSimpleItemVisualElementCardSection setFootnote:](v5, "setFootnote:", v21);

    }
    if (objc_msgSend(v4, "horizontal_alignment"))
      -[RFSimpleItemVisualElementCardSection setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    v22 = v5;
  }

  return v5;
}

- (void)setHorizontal_alignment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_horizontal_alignment = a3;
}

- (BOOL)hasHorizontal_alignment
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFSimpleItemVisualElementCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSimpleItemVisualElementCardSection *v5;
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
    -[SFCardSection image](v8, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemVisualElementCardSection setImage:](v5, "setImage:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemVisualElementCardSection setText_1:](v5, "setText_1:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemVisualElementCardSection setText_2:](v5, "setText_2:", v11);

    -[SFCardSection footnote](v8, "footnote");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemVisualElementCardSection setFootnote:](v5, "setFootnote:", v12);

    -[RFSimpleItemVisualElementCardSection setHorizontal_alignment:](v5, "setHorizontal_alignment:", -[SFCardSection horizontal_alignment](v8, "horizontal_alignment"));
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
  v3.super_class = (Class)RFSimpleItemVisualElementCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSimpleItemVisualElementCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemVisualElementCardSection initWithFacade:]([_SFPBRFSimpleItemVisualElementCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemVisualElementCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSimpleItemVisualElementCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemVisualElementCardSection initWithFacade:]([_SFPBRFSimpleItemVisualElementCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemVisualElementCardSection jsonData](v2, "jsonData");
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
  v14.super_class = (Class)RFSimpleItemVisualElementCardSection;
  v4 = -[SFCardSection copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[RFSimpleItemVisualElementCardSection image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setImage:", v6);

  -[RFSimpleItemVisualElementCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_1:", v8);

  -[RFSimpleItemVisualElementCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_2:", v10);

  -[RFSimpleItemVisualElementCardSection footnote](self, "footnote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setFootnote:", v12);

  objc_msgSend(v4, "setHorizontal_alignment:", -[RFSimpleItemVisualElementCardSection horizontal_alignment](self, "horizontal_alignment"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSimpleItemVisualElementCardSection *v4;
  RFSimpleItemVisualElementCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v27;
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

  v4 = (RFSimpleItemVisualElementCardSection *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[RFSimpleItemVisualElementCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v42.receiver = self;
      v42.super_class = (Class)RFSimpleItemVisualElementCardSection;
      if (-[SFCardSection isEqual:](&v42, sel_isEqual_, v4))
      {
        v5 = v4;
        -[RFSimpleItemVisualElementCardSection image](self, "image");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemVisualElementCardSection image](v5, "image");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v10 = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[RFSimpleItemVisualElementCardSection image](self, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[RFSimpleItemVisualElementCardSection image](self, "image");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemVisualElementCardSection image](v5, "image");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:"))
          {
            v10 = 0;
            goto LABEL_36;
          }
          v39 = v9;
        }
        -[RFSimpleItemVisualElementCardSection text](self, "text");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemVisualElementCardSection text](v5, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v41 == 0) != (v11 != 0))
        {
          -[RFSimpleItemVisualElementCardSection text](self, "text");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            -[RFSimpleItemVisualElementCardSection text](self, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSimpleItemVisualElementCardSection text](v5, "text");
            v36 = v14;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:"))
            {
              v10 = 0;
              v19 = v38;
              goto LABEL_33;
            }
            v37 = v13;
          }
          else
          {
            v37 = 0;
          }
          -[RFSimpleItemVisualElementCardSection text](self, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemVisualElementCardSection text](v5, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v15 == 0) != (v16 != 0))
          {
            v34 = v15;
            v35 = v16;
            -[RFSimpleItemVisualElementCardSection text](self, "text");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[RFSimpleItemVisualElementCardSection text](self, "text");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSimpleItemVisualElementCardSection text](v5, "text");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                v10 = 0;
                v13 = v37;
                v19 = v38;
                goto LABEL_31;
              }
            }
            -[RFSimpleItemVisualElementCardSection footnote](self, "footnote");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20 == 0;
            -[RFSimpleItemVisualElementCardSection footnote](v5, "footnote");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21 == (v22 != 0))
            {

              v10 = 0;
              v13 = v37;
              v19 = v38;
              if (!v17)
                goto LABEL_32;
              goto LABEL_31;
            }
            v29 = v22;
            v30 = v20;
            -[RFSimpleItemVisualElementCardSection footnote](self, "footnote");
            v19 = v38;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31
              || (-[RFSimpleItemVisualElementCardSection footnote](self, "footnote"),
                  v23 = objc_claimAutoreleasedReturnValue(),
                  -[RFSimpleItemVisualElementCardSection footnote](v5, "footnote"),
                  v24 = objc_claimAutoreleasedReturnValue(),
                  v28 = (void *)v23,
                  v25 = (void *)v23,
                  v21 = v24,
                  objc_msgSend(v25, "isEqual:", v24)))
            {
              v27 = -[RFSimpleItemVisualElementCardSection horizontal_alignment](self, "horizontal_alignment");
              v10 = v27 == -[RFSimpleItemVisualElementCardSection horizontal_alignment](v5, "horizontal_alignment");
              if (!v31)
                goto LABEL_42;
            }
            else
            {
              v10 = 0;
            }

LABEL_42:
            v13 = v37;
            if (!v17)
            {
LABEL_32:

              if (!v13)
              {
LABEL_34:

LABEL_35:
                v9 = v39;
                if (!v8)
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
LABEL_31:

            goto LABEL_32;
          }

          if (v37)
          {

          }
        }

        v10 = 0;
        goto LABEL_35;
      }
    }
    v10 = 0;
  }
LABEL_39:

  return v10;
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
  uint64_t v11;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RFSimpleItemVisualElementCardSection;
  v3 = -[SFCardSection hash](&v14, sel_hash);
  -[RFSimpleItemVisualElementCardSection image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFSimpleItemVisualElementCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFSimpleItemVisualElementCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFSimpleItemVisualElementCardSection footnote](self, "footnote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[RFSimpleItemVisualElementCardSection horizontal_alignment](self, "horizontal_alignment") ^ v3;

  return v12;
}

- (RFVisualProperty)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (RFTextProperty)text_2
{
  return self->_text_2;
}

- (void)setText_2:(id)a3
{
  objc_storeStrong((id *)&self->_text_2, a3);
}

- (RFTextProperty)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_storeStrong((id *)&self->_footnote, a3);
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
