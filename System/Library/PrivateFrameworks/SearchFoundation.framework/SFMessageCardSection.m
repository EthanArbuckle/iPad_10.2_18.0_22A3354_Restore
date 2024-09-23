@implementation SFMessageCardSection

- (SFMessageCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFMessageCardSection *v5;
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
  void *v28;
  void *v29;
  SFMessageAttachment *v30;
  void *v31;
  SFMessageAttachment *v32;
  SFMessageCardSection *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SFMessageCardSection;
  v5 = -[SFCardSection init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
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
      -[SFMessageCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "messageText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "messageText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessageCardSection setMessageText:](v5, "setMessageText:", v25);

    }
    if (objc_msgSend(v4, "messageStatus"))
      -[SFMessageCardSection setMessageStatus:](v5, "setMessageStatus:", objc_msgSend(v4, "messageStatus"));
    if (objc_msgSend(v4, "messageServiceType"))
      -[SFMessageCardSection setMessageServiceType:](v5, "setMessageServiceType:", objc_msgSend(v4, "messageServiceType"));
    objc_msgSend(v4, "audioMessageURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "audioMessageURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessageCardSection setAudioMessageURL:](v5, "setAudioMessageURL:", v28);

    }
    objc_msgSend(v4, "messageAttachment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [SFMessageAttachment alloc];
      objc_msgSend(v4, "messageAttachment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[SFMessageAttachment initWithProtobuf:](v30, "initWithProtobuf:", v31);
      -[SFMessageCardSection setMessageAttachment:](v5, "setMessageAttachment:", v32);

    }
    v33 = v5;

  }
  return v5;
}

- (void)setMessageStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_messageStatus = a3;
}

- (BOOL)hasMessageStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMessageServiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_messageServiceType = a3;
}

- (BOOL)hasMessageServiceType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFMessageCardSection)initWithCoder:(id)a3
{
  id v4;
  SFMessageCardSection *v5;
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
    -[SFMessageCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection messageText](v8, "messageText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMessageCardSection setMessageText:](v5, "setMessageText:", v14);

    -[SFMessageCardSection setMessageStatus:](v5, "setMessageStatus:", -[SFCardSection messageStatus](v8, "messageStatus"));
    -[SFMessageCardSection setMessageServiceType:](v5, "setMessageServiceType:", -[SFCardSection messageServiceType](v8, "messageServiceType"));
    -[SFCardSection audioMessageURL](v8, "audioMessageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMessageCardSection setAudioMessageURL:](v5, "setAudioMessageURL:", v15);

    -[SFCardSection messageAttachment](v8, "messageAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMessageCardSection setMessageAttachment:](v5, "setMessageAttachment:", v16);

    -[SFCardSection nextCard](v8, "nextCard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v17);

    -[SFCardSection commands](v8, "commands");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v18);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v19);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v20);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v21);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v22);

    -[SFCardSection command](v8, "command");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v23);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v24);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v25);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v26);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v27);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v28);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v29);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v30);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v31);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v32);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v33);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v34);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v35);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v36);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMessageCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMessageCardSection *v2;
  void *v3;

  v2 = -[_SFPBMessageCardSection initWithFacade:]([_SFPBMessageCardSection alloc], "initWithFacade:", self);
  -[_SFPBMessageCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMessageCardSection *v2;
  void *v3;

  v2 = -[_SFPBMessageCardSection initWithFacade:]([_SFPBMessageCardSection alloc], "initWithFacade:", self);
  -[_SFPBMessageCardSection jsonData](v2, "jsonData");
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SFMessageCardSection;
  v4 = -[SFCardSection copyWithZone:](&v22, sel_copyWithZone_, a3);
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
  -[SFMessageCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFMessageCardSection messageText](self, "messageText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setMessageText:", v16);

  objc_msgSend(v4, "setMessageStatus:", -[SFMessageCardSection messageStatus](self, "messageStatus"));
  objc_msgSend(v4, "setMessageServiceType:", -[SFMessageCardSection messageServiceType](self, "messageServiceType"));
  -[SFMessageCardSection audioMessageURL](self, "audioMessageURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setAudioMessageURL:", v18);

  -[SFMessageCardSection messageAttachment](self, "messageAttachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setMessageAttachment:", v20);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFMessageCardSection *v4;
  SFMessageCardSection *v5;
  void *v6;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
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
  objc_super v69;

  v4 = (SFMessageCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMessageCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v69.receiver = self;
      v69.super_class = (Class)SFMessageCardSection;
      if (-[SFCardSection isEqual:](&v69, sel_isEqual_, v4))
      {
        v5 = v4;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v5, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[SFCardSection punchoutOptions](self, "punchoutOptions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutOptions](v5, "punchoutOptions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            v11 = 0;
LABEL_25:

            goto LABEL_26;
          }
          v67 = v10;
          v68 = v9;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v5, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
          goto LABEL_23;
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerTitle](v5, "punchoutPickerTitle");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v15;
          if (!objc_msgSend(v15, "isEqual:", v64))
            goto LABEL_21;
        }
        v66 = v14;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v5, "punchoutPickerDismissText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
          {
LABEL_22:

LABEL_23:
            v11 = 0;
            if (!v8)
            {
LABEL_26:

              goto LABEL_27;
            }
            goto LABEL_24;
          }
LABEL_21:

          goto LABEL_22;
        }
        v61 = v16;
        v62 = v17;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v18 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v5, "punchoutPickerDismissText");
          v19 = objc_claimAutoreleasedReturnValue();
          v60 = (void *)v18;
          v20 = (void *)v18;
          v16 = (void *)v19;
          if (!objc_msgSend(v20, "isEqual:", v19))
          {
LABEL_39:

LABEL_40:
            if (!v14)
              goto LABEL_22;
            goto LABEL_21;
          }
        }
        v22 = -[SFCardSection canBeHidden](self, "canBeHidden");
        if (v22 == -[SFCardSection canBeHidden](v5, "canBeHidden"))
        {
          v23 = -[SFCardSection hasTopPadding](self, "hasTopPadding");
          if (v23 == -[SFCardSection hasTopPadding](v5, "hasTopPadding"))
          {
            v24 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
            if (v24 == -[SFCardSection hasBottomPadding](v5, "hasBottomPadding"))
            {
              -[SFMessageCardSection type](self, "type");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMessageCardSection type](v5, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v25 == 0) != (v26 != 0))
              {
                v57 = v26;
                v58 = v25;
                -[SFMessageCardSection type](self, "type");
                v14 = v66;
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                if (v59)
                {
                  -[SFMessageCardSection type](self, "type");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFMessageCardSection type](v5, "type");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v56, "isEqual:"))
                    goto LABEL_50;
                }
                v27 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v27 == -[SFCardSection separatorStyle](v5, "separatorStyle"))
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v5, "backgroundColor");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v54 == 0) != (v28 != 0))
                  {
                    v52 = v16;
                    v53 = v28;
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v29)
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFCardSection backgroundColor](v5, "backgroundColor");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = v30;
                      if (!objc_msgSend(v30, "isEqual:"))
                        goto LABEL_57;
                    }
                    -[SFMessageCardSection messageText](self, "messageText");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFMessageCardSection messageText](v5, "messageText");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v51 == 0) == (v50 != 0))
                    {

                      if (!v29)
                      {
LABEL_58:

                        v14 = v66;
                        v16 = v52;
LABEL_49:
                        if (!v59)
                        {
LABEL_51:

LABEL_38:
                          if (!v63)
                            goto LABEL_40;
                          goto LABEL_39;
                        }
LABEL_50:

                        goto LABEL_51;
                      }
LABEL_57:

                      goto LABEL_58;
                    }
                    -[SFMessageCardSection messageText](self, "messageText");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v47)
                    {
                      -[SFMessageCardSection messageText](self, "messageText");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFMessageCardSection messageText](v5, "messageText");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      v46 = v31;
                      if (!objc_msgSend(v31, "isEqual:"))
                      {
                        v11 = 0;
LABEL_68:

LABEL_69:
                        if (v29)
                        {

                        }
                        if (v59)
                        {

                        }
                        if (v63)
                        {

                        }
                        if (v66)
                        {

                        }
                        if (!v8)
                          goto LABEL_26;
LABEL_24:
                        v10 = v67;
                        v9 = v68;
                        goto LABEL_25;
                      }
                    }
                    v32 = -[SFMessageCardSection messageStatus](self, "messageStatus");
                    if (v32 == -[SFMessageCardSection messageStatus](v5, "messageStatus"))
                    {
                      v33 = -[SFMessageCardSection messageServiceType](self, "messageServiceType");
                      if (v33 == -[SFMessageCardSection messageServiceType](v5, "messageServiceType"))
                      {
                        -[SFMessageCardSection audioMessageURL](self, "audioMessageURL");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFMessageCardSection audioMessageURL](v5, "audioMessageURL");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v44 == 0) != (v43 != 0))
                        {
                          -[SFMessageCardSection audioMessageURL](self, "audioMessageURL");
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v42
                            || (-[SFMessageCardSection audioMessageURL](self, "audioMessageURL"),
                                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFMessageCardSection audioMessageURL](v5, "audioMessageURL"),
                                v40 = (void *)objc_claimAutoreleasedReturnValue(),
                                v41 = v34,
                                objc_msgSend(v34, "isEqual:")))
                          {
                            -[SFMessageCardSection messageAttachment](self, "messageAttachment");
                            v39 = (void *)objc_claimAutoreleasedReturnValue();
                            -[SFMessageCardSection messageAttachment](v5, "messageAttachment");
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((v39 == 0) == (v38 != 0))
                            {

                              v11 = 0;
                            }
                            else
                            {
                              -[SFMessageCardSection messageAttachment](self, "messageAttachment");
                              v37 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v37)
                              {
                                -[SFMessageCardSection messageAttachment](self, "messageAttachment");
                                v36 = (void *)objc_claimAutoreleasedReturnValue();
                                -[SFMessageCardSection messageAttachment](v5, "messageAttachment");
                                v35 = (void *)objc_claimAutoreleasedReturnValue();
                                v11 = objc_msgSend(v36, "isEqual:", v35);

                              }
                              else
                              {

                                v11 = 1;
                              }
                            }
                            if (!v42)
                              goto LABEL_86;
                          }
                          else
                          {
                            v11 = 0;
                          }

LABEL_86:
LABEL_67:
                          if (!v47)
                            goto LABEL_69;
                          goto LABEL_68;
                        }

                      }
                    }
                    v11 = 0;
                    goto LABEL_67;
                  }

                }
                v14 = v66;
                goto LABEL_49;
              }

            }
          }
        }
        v14 = v66;
        goto LABEL_38;
      }
    }
    v11 = 0;
  }
LABEL_28:

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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SFMessageCardSection;
  v3 = -[SFCardSection hash](&v27, sel_hash);
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
  -[SFMessageCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFMessageCardSection messageText](self, "messageText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  v20 = -[SFMessageCardSection messageStatus](self, "messageStatus");
  v21 = v20 ^ -[SFMessageCardSection messageServiceType](self, "messageServiceType");
  -[SFMessageCardSection audioMessageURL](self, "audioMessageURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  -[SFMessageCardSection messageAttachment](self, "messageAttachment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v19 ^ v23 ^ objc_msgSend(v24, "hash");

  return v25;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (int)messageStatus
{
  return self->_messageStatus;
}

- (int)messageServiceType
{
  return self->_messageServiceType;
}

- (NSURL)audioMessageURL
{
  return self->_audioMessageURL;
}

- (void)setAudioMessageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFMessageAttachment)messageAttachment
{
  return self->_messageAttachment;
}

- (void)setMessageAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_messageAttachment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageAttachment, 0);
  objc_storeStrong((id *)&self->_audioMessageURL, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
