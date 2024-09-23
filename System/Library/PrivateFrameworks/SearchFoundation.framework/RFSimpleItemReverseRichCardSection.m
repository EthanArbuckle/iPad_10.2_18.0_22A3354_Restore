@implementation RFSimpleItemReverseRichCardSection

- (RFSimpleItemReverseRichCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSimpleItemReverseRichCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  RFTextProperty *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  RFTextProperty *v21;
  void *v22;
  RFTextProperty *v23;
  void *v24;
  RFTextProperty *v25;
  void *v26;
  RFVisualProperty *v27;
  void *v28;
  RFVisualProperty *v29;
  RFSimpleItemReverseRichCardSection *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RFSimpleItemReverseRichCardSection;
  v5 = -[SFCardSection init](&v36, sel_init);
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
      -[RFSimpleItemReverseRichCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSimpleItemReverseRichCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text_3s");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "text_3s", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v18);
    }

    -[RFSimpleItemReverseRichCardSection setText_3:](v5, "setText_3:", v15);
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFTextProperty initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFSimpleItemReverseRichCardSection setText_4:](v5, "setText_4:", v25);

    }
    objc_msgSend(v4, "thumbnail");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[RFVisualProperty initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[RFSimpleItemReverseRichCardSection setThumbnail:](v5, "setThumbnail:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (RFSimpleItemReverseRichCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSimpleItemReverseRichCardSection *v5;
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
    -[RFSimpleItemReverseRichCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemReverseRichCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemReverseRichCardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemReverseRichCardSection setText_4:](v5, "setText_4:", v12);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemReverseRichCardSection setThumbnail:](v5, "setThumbnail:", v13);

    -[SFCardSection nextCard](v8, "nextCard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v14);

    -[SFCardSection commands](v8, "commands");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v15);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v16);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v17);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v18);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v19);

    -[SFCardSection command](v8, "command");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v20);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v21);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v22);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v23);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v24);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v26);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v27);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v28);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v29);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v30);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v31);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v32);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v33);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFSimpleItemReverseRichCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSimpleItemReverseRichCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemReverseRichCardSection initWithFacade:]([_SFPBRFSimpleItemReverseRichCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemReverseRichCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSimpleItemReverseRichCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemReverseRichCardSection initWithFacade:]([_SFPBRFSimpleItemReverseRichCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemReverseRichCardSection jsonData](v2, "jsonData");
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RFSimpleItemReverseRichCardSection;
  v4 = -[SFCardSection copyWithZone:](&v16, sel_copyWithZone_, a3);
  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_4:", v12);

  -[RFSimpleItemReverseRichCardSection thumbnail](self, "thumbnail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setThumbnail:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSimpleItemReverseRichCardSection *v4;
  RFSimpleItemReverseRichCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
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
  objc_super v50;

  v4 = (RFSimpleItemReverseRichCardSection *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[RFSimpleItemReverseRichCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v50.receiver = self;
      v50.super_class = (Class)RFSimpleItemReverseRichCardSection;
      if (-[SFCardSection isEqual:](&v50, sel_isEqual_, v4))
      {
        v5 = v4;
        -[RFSimpleItemReverseRichCardSection text](self, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemReverseRichCardSection text](v5, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v10 = 0;
LABEL_51:

          goto LABEL_52;
        }
        -[RFSimpleItemReverseRichCardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[RFSimpleItemReverseRichCardSection text](self, "text");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemReverseRichCardSection text](v5, "text");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:"))
          {
            v10 = 0;
            goto LABEL_49;
          }
          v47 = v9;
        }
        -[RFSimpleItemReverseRichCardSection text](self, "text");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemReverseRichCardSection text](v5, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v49 == 0) != (v11 != 0))
        {
          -[RFSimpleItemReverseRichCardSection text](self, "text");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            -[RFSimpleItemReverseRichCardSection text](self, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSimpleItemReverseRichCardSection text](v5, "text");
            v44 = v14;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:"))
            {
              v10 = 0;
              v19 = v13;
              v20 = v45;
              goto LABEL_46;
            }
            v46 = v13;
          }
          else
          {
            v46 = 0;
          }
          -[RFSimpleItemReverseRichCardSection text](self, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemReverseRichCardSection text](v5, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v15 == 0) != (v16 != 0))
          {
            v42 = v15;
            v43 = v16;
            -[RFSimpleItemReverseRichCardSection text](self, "text");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[RFSimpleItemReverseRichCardSection text](self, "text");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSimpleItemReverseRichCardSection text](v5, "text");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                v10 = 0;
                v20 = v45;
                v19 = v46;
                goto LABEL_44;
              }
              v41 = v17;
            }
            else
            {
              v41 = 0;
            }
            -[RFSimpleItemReverseRichCardSection text](self, "text");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSimpleItemReverseRichCardSection text](v5, "text");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v21 == 0) != (v22 != 0))
            {
              v38 = v22;
              -[RFSimpleItemReverseRichCardSection text](self, "text");
              v20 = v45;
              v37 = objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v33 = v21;
                -[RFSimpleItemReverseRichCardSection text](self, "text");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFSimpleItemReverseRichCardSection text](v5, "text");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v23;
                if (!objc_msgSend(v23, "isEqual:"))
                {
                  v10 = 0;
                  v27 = (void *)v37;
                  v21 = v33;
                  goto LABEL_42;
                }
                v21 = v33;
              }
              -[RFSimpleItemReverseRichCardSection thumbnail](self, "thumbnail");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSimpleItemReverseRichCardSection thumbnail](v5, "thumbnail");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v24 == 0) == (v25 != 0))
              {

                v10 = 0;
                v20 = v45;
                v27 = (void *)v37;
                if (!v37)
                {
LABEL_43:

                  v17 = v41;
                  v19 = v46;
                  if (!v41)
                    goto LABEL_45;
                  goto LABEL_44;
                }
              }
              else
              {
                v32 = v25;
                v34 = v24;
                -[RFSimpleItemReverseRichCardSection thumbnail](self, "thumbnail");
                v26 = objc_claimAutoreleasedReturnValue();
                v20 = v45;
                v27 = (void *)v37;
                if (v26)
                {
                  v31 = (void *)v26;
                  -[RFSimpleItemReverseRichCardSection thumbnail](self, "thumbnail");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSimpleItemReverseRichCardSection thumbnail](v5, "thumbnail");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = objc_msgSend(v30, "isEqual:", v29);

                  if (!v37)
                    goto LABEL_43;
                }
                else
                {

                  v10 = 1;
                  if (!v37)
                    goto LABEL_43;
                }
              }
LABEL_42:

              goto LABEL_43;
            }

            v10 = 0;
            v20 = v45;
            v19 = v46;
            v17 = v41;
            if (!v41)
            {
LABEL_45:

              if (!v19)
              {
LABEL_47:

LABEL_48:
                v9 = v47;
                if (!v8)
                {
LABEL_50:

                  goto LABEL_51;
                }
LABEL_49:

                goto LABEL_50;
              }
LABEL_46:

              goto LABEL_47;
            }
LABEL_44:

            goto LABEL_45;
          }

          if (v46)
          {

          }
        }

        v10 = 0;
        goto LABEL_48;
      }
    }
    v10 = 0;
  }
LABEL_52:

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
  void *v12;
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RFSimpleItemReverseRichCardSection;
  v3 = -[SFCardSection hash](&v15, sel_hash);
  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFSimpleItemReverseRichCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[RFSimpleItemReverseRichCardSection thumbnail](self, "thumbnail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;

  return v13;
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

- (NSArray)text_3
{
  return self->_text_3;
}

- (void)setText_3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (RFTextProperty)text_4
{
  return self->_text_4;
}

- (void)setText_4:(id)a3
{
  objc_storeStrong((id *)&self->_text_4, a3);
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
