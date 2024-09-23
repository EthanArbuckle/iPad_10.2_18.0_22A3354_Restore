@implementation SFAudioPlaybackCardSection

- (SFAudioPlaybackCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFAudioPlaybackCardSection *v5;
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
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  SFAbstractCommand *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  SFAbstractCommand *v39;
  void *v40;
  SFRichText *v41;
  void *v42;
  SFRichText *v43;
  void *v44;
  SFRichText *v45;
  void *v46;
  SFRichText *v47;
  void *v48;
  SFRichText *v49;
  void *v50;
  SFRichText *v51;
  void *v52;
  SFImage *v53;
  void *v54;
  SFImage *v55;
  SFAudioPlaybackCardSection *v56;
  SFAudioPlaybackCardSection *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SFAudioPlaybackCardSection;
  v5 = -[SFCardSection init](&v71, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v68 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
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
      -[SFAudioPlaybackCardSection setType:](v5, "setType:", v19);

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
    if (objc_msgSend(v4, "state"))
      -[SFAudioPlaybackCardSection setState:](v5, "setState:", objc_msgSend(v4, "state"));
    objc_msgSend(v4, "playCommands");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v4, "playCommands");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v64 != v29)
            objc_enumerationMutation(v26);
          v31 = -[SFAbstractCommand initWithProtobuf:]([SFAbstractCommand alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v28);
    }

    -[SFAudioPlaybackCardSection setPlayCommands:](v5, "setPlayCommands:", v25);
    objc_msgSend(v4, "stopCommands");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v5;
    if (v32)
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v33 = 0;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v4, "stopCommands");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v60 != v37)
            objc_enumerationMutation(v34);
          v39 = -[SFAbstractCommand initWithProtobuf:]([SFAbstractCommand alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
          if (v39)
            objc_msgSend(v33, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v36);
    }

    v5 = v58;
    -[SFAudioPlaybackCardSection setStopCommands:](v58, "setStopCommands:", v33);
    objc_msgSend(v4, "detailText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = [SFRichText alloc];
      objc_msgSend(v4, "detailText");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SFRichText initWithProtobuf:](v41, "initWithProtobuf:", v42);
      -[SFAudioPlaybackCardSection setDetailText:](v58, "setDetailText:", v43);

    }
    objc_msgSend(v4, "title");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[SFRichText initWithProtobuf:](v45, "initWithProtobuf:", v46);
      -[SFAudioPlaybackCardSection setTitle:](v58, "setTitle:", v47);

    }
    objc_msgSend(v4, "subtitle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = [SFRichText alloc];
      objc_msgSend(v4, "subtitle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[SFRichText initWithProtobuf:](v49, "initWithProtobuf:", v50);
      -[SFAudioPlaybackCardSection setSubtitle:](v58, "setSubtitle:", v51);

    }
    objc_msgSend(v4, "thumbnail");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = [SFImage alloc];
      objc_msgSend(v4, "thumbnail");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[SFImage initWithProtobuf:](v53, "initWithProtobuf:", v54);
      -[SFAudioPlaybackCardSection setThumbnail:](v58, "setThumbnail:", v55);

    }
    v56 = v58;

  }
  return v5;
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_state = a3;
}

- (BOOL)hasState
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFAudioPlaybackCardSection)initWithCoder:(id)a3
{
  id v4;
  SFAudioPlaybackCardSection *v5;
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
    -[SFAudioPlaybackCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFAudioPlaybackCardSection setState:](v5, "setState:", -[SFCardSection state](v8, "state"));
    -[SFCardSection playCommands](v8, "playCommands");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAudioPlaybackCardSection setPlayCommands:](v5, "setPlayCommands:", v14);

    -[SFCardSection stopCommands](v8, "stopCommands");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAudioPlaybackCardSection setStopCommands:](v5, "setStopCommands:", v15);

    -[SFCardSection detailText](v8, "detailText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAudioPlaybackCardSection setDetailText:](v5, "setDetailText:", v16);

    -[SFCardSection title](v8, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAudioPlaybackCardSection setTitle:](v5, "setTitle:", v17);

    -[SFCardSection subtitle](v8, "subtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAudioPlaybackCardSection setSubtitle:](v5, "setSubtitle:", v18);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAudioPlaybackCardSection setThumbnail:](v5, "setThumbnail:", v19);

    -[SFCardSection nextCard](v8, "nextCard");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v20);

    -[SFCardSection commands](v8, "commands");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v21);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v22);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v23);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v24);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v25);

    -[SFCardSection command](v8, "command");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v26);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v27);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v28);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v29);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v30);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v31);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v32);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v33);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v34);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v35);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v36);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v37);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v38);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v39);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAudioPlaybackCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAudioPlaybackCardSection *v2;
  void *v3;

  v2 = -[_SFPBAudioPlaybackCardSection initWithFacade:]([_SFPBAudioPlaybackCardSection alloc], "initWithFacade:", self);
  -[_SFPBAudioPlaybackCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAudioPlaybackCardSection *v2;
  void *v3;

  v2 = -[_SFPBAudioPlaybackCardSection initWithFacade:]([_SFPBAudioPlaybackCardSection alloc], "initWithFacade:", self);
  -[_SFPBAudioPlaybackCardSection jsonData](v2, "jsonData");
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SFAudioPlaybackCardSection;
  v4 = -[SFCardSection copyWithZone:](&v28, sel_copyWithZone_, a3);
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
  -[SFAudioPlaybackCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  objc_msgSend(v4, "setState:", -[SFAudioPlaybackCardSection state](self, "state"));
  -[SFAudioPlaybackCardSection playCommands](self, "playCommands");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setPlayCommands:", v16);

  -[SFAudioPlaybackCardSection stopCommands](self, "stopCommands");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setStopCommands:", v18);

  -[SFAudioPlaybackCardSection detailText](self, "detailText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setDetailText:", v20);

  -[SFAudioPlaybackCardSection title](self, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setTitle:", v22);

  -[SFAudioPlaybackCardSection subtitle](self, "subtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setSubtitle:", v24);

  -[SFAudioPlaybackCardSection thumbnail](self, "thumbnail");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setThumbnail:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SFAudioPlaybackCardSection *v5;
  SFAudioPlaybackCardSection *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  SFAudioPlaybackCardSection *v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v31;
  uint64_t v32;
  SFAudioPlaybackCardSection *v33;
  void *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  SFAudioPlaybackCardSection *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
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
  _BYTE v109[20];
  __int128 v110;
  _BYTE v111[20];
  int v112;
  int v113;
  id v114;
  id v115;
  _BYTE v116[36];
  SFAudioPlaybackCardSection *v117;
  objc_super v118;

  v5 = (SFAudioPlaybackCardSection *)a3;
  if (self == v5)
  {
    v18 = 1;
    goto LABEL_79;
  }
  if (!-[SFAudioPlaybackCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class())
    || (v118.receiver = self,
        v118.super_class = (Class)SFAudioPlaybackCardSection,
        !-[SFCardSection isEqual:](&v118, sel_isEqual_, v5)))
  {
    v18 = 0;
    goto LABEL_79;
  }
  v6 = v5;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v6, "punchoutOptions");
  v114 = (id)objc_claimAutoreleasedReturnValue();
  v115 = v7;
  v112 = v114 != 0;
  v113 = v7 == 0;
  v117 = v6;
  if (v113 == v112)
  {
    v10 = 0;
    v11 = 0;
    v110 = 0uLL;
    memset(v111, 0, sizeof(v111));
    v12 = 0;
    memset(v109, 0, sizeof(v109));
    v13 = 0;
    v14 = 0;
    memset(v116, 0, sizeof(v116));
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_16;
  }
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = objc_claimAutoreleasedReturnValue();
  v3 = v8 != 0;
  v108 = (void *)v8;
  if (v8)
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection punchoutOptions](v6, "punchoutOptions");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      *(_OWORD *)v111 = 0uLL;
      v10 = 0;
      v11 = 0;
      v110 = 0uLL;
      v12 = 0;
      memset(v109, 0, sizeof(v109));
      v13 = 0;
      v14 = 0;
      memset(v116, 0, sizeof(v116));
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_DWORD *)&v111[16] = 1;
      goto LABEL_16;
    }
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v111[16] = v3;
  if ((v107 == 0) == (v106 != 0))
  {
    *(_QWORD *)&v111[4] = 0;
    v10 = 0;
    v11 = 0;
    v110 = 0uLL;
    *(_DWORD *)v111 = 0;
    v12 = 0;
    memset(v109, 0, sizeof(v109));
    v13 = 0;
    v14 = 0;
    memset(v116, 0, sizeof(v116));
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_DWORD *)&v111[12] = 1;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v19 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v116[32] = v19 != 0;
  v103 = (void *)v19;
  if (v19)
  {
    -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v6;
    v22 = (void *)v20;
    -[SFCardSection punchoutPickerTitle](v21, "punchoutPickerTitle");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v22;
    if (!objc_msgSend(v22, "isEqual:"))
    {
      *(_QWORD *)v111 = 0;
      v10 = 0;
      v11 = 0;
      v110 = 0uLL;
      v12 = 0;
      memset(v109, 0, sizeof(v109));
      v13 = 0;
      memset(v116, 0, 32);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_QWORD *)&v111[8] = 0x100000001;
      *(_DWORD *)&v116[32] = 1;
      goto LABEL_16;
    }
    v6 = v117;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v102 == 0) == (v101 != 0))
  {
    v10 = 0;
    v11 = 0;
    v110 = 0uLL;
    v12 = 0;
    memset(v109, 0, sizeof(v109));
    v13 = 0;
    memset(v116, 0, 32);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)&v111[8] = 0x100000001;
    *(_QWORD *)v111 = 0x100000000;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v31 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v116[28] = v31 != 0;
  v98 = (void *)v31;
  if (v31)
  {
    -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v6;
    v34 = (void *)v32;
    -[SFCardSection punchoutPickerDismissText](v33, "punchoutPickerDismissText");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v34;
    if (!objc_msgSend(v34, "isEqual:", v96))
    {
      v10 = 0;
      v11 = 0;
      *(_QWORD *)((char *)&v110 + 4) = 0;
      v12 = 0;
      memset(v109, 0, sizeof(v109));
      v13 = 0;
      LODWORD(v110) = 0;
      v14 = 0;
      memset(v116, 0, 28);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_QWORD *)&v111[8] = 0x100000001;
      *(_QWORD *)v111 = 0x100000000;
      HIDWORD(v110) = 1;
      *(_DWORD *)&v116[28] = 1;
      goto LABEL_16;
    }
    v6 = v117;
  }
  v35 = -[SFCardSection canBeHidden](self, "canBeHidden");
  if (v35 != -[SFCardSection canBeHidden](v6, "canBeHidden")
    || (v36 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
        v36 != -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
    || (v37 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
        v37 != -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
  {
    v10 = 0;
    v11 = 0;
    *(_QWORD *)((char *)&v110 + 4) = 0;
    v12 = 0;
    memset(v109, 0, sizeof(v109));
    v13 = 0;
    LODWORD(v110) = 0;
    v14 = 0;
    memset(v116, 0, 28);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)&v111[8] = 0x100000001;
    *(_QWORD *)v111 = 0x100000000;
    HIDWORD(v110) = 1;
    goto LABEL_16;
  }
  -[SFAudioPlaybackCardSection type](self, "type");
  v38 = objc_claimAutoreleasedReturnValue();
  -[SFAudioPlaybackCardSection type](v6, "type");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)v38;
  if ((v38 == 0) == (v94 != 0))
  {
    v11 = 0;
    *(_QWORD *)((char *)&v110 + 4) = 0;
    v12 = 0;
    memset(v109, 0, sizeof(v109));
    v13 = 0;
    LODWORD(v110) = 0;
    v14 = 0;
    memset(v116, 0, 28);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)&v111[8] = 0x100000001;
    *(_QWORD *)v111 = 0x100000000;
    HIDWORD(v110) = 1;
    v10 = 1;
    goto LABEL_16;
  }
  -[SFAudioPlaybackCardSection type](self, "type");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v116[24] = v93 != 0;
  if (v93)
  {
    -[SFAudioPlaybackCardSection type](self, "type");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v6;
    v41 = (void *)v39;
    -[SFAudioPlaybackCardSection type](v40, "type");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      *(_QWORD *)((char *)&v110 + 4) = 0;
      v12 = 0;
      memset(v109, 0, sizeof(v109));
      v13 = 0;
      memset(v116, 0, 24);
      LODWORD(v110) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_QWORD *)&v111[8] = 0x100000001;
      *(_QWORD *)v111 = 0x100000000;
      HIDWORD(v110) = 1;
      v10 = 1;
      v11 = 1;
      *(_DWORD *)&v116[24] = 1;
      goto LABEL_16;
    }
    v6 = v117;
  }
  v42 = -[SFCardSection separatorStyle](self, "separatorStyle");
  if (v42 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
  {
    -[SFCardSection backgroundColor](self, "backgroundColor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection backgroundColor](v6, "backgroundColor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v90 == 0) == (v89 != 0))
    {
      *(_QWORD *)&v110 = 0;
      v12 = 0;
      memset(v109, 0, sizeof(v109));
      v13 = 0;
      memset(v116, 0, 24);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_QWORD *)&v111[8] = 0x100000001;
      *(_QWORD *)v111 = 0x100000000;
      v10 = 1;
      v11 = 1;
      *((_QWORD *)&v110 + 1) = 0x100000001;
    }
    else
    {
      -[SFCardSection backgroundColor](self, "backgroundColor");
      v43 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v116[20] = v43 != 0;
      v88 = (void *)v43;
      if (!v43
        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFCardSection backgroundColor](v117, "backgroundColor"),
            v86 = (void *)objc_claimAutoreleasedReturnValue(),
            v87 = v44,
            objc_msgSend(v44, "isEqual:")))
      {
        v45 = -[SFAudioPlaybackCardSection state](self, "state");
        if (v45 == -[SFAudioPlaybackCardSection state](v117, "state"))
        {
          -[SFAudioPlaybackCardSection playCommands](self, "playCommands");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAudioPlaybackCardSection playCommands](v117, "playCommands");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v85 == 0) == (v84 != 0))
          {
            *(_QWORD *)v109 = 0;
            *(_QWORD *)&v109[8] = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            memset(v116, 0, 20);
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            *(_QWORD *)&v111[8] = 0x100000001;
            *(_QWORD *)v111 = 0x100000000;
            *((_QWORD *)&v110 + 1) = 0x100000001;
            v10 = 1;
            v11 = 1;
            *(_QWORD *)&v110 = 0x100000000;
            *(_DWORD *)&v109[16] = 1;
          }
          else
          {
            -[SFAudioPlaybackCardSection playCommands](self, "playCommands");
            v46 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)&v116[16] = v46 != 0;
            v83 = (void *)v46;
            if (!v46
              || (-[SFAudioPlaybackCardSection playCommands](self, "playCommands"),
                  v47 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFAudioPlaybackCardSection playCommands](v117, "playCommands"),
                  v79 = (void *)objc_claimAutoreleasedReturnValue(),
                  v80 = v47,
                  objc_msgSend(v47, "isEqual:")))
            {
              -[SFAudioPlaybackCardSection stopCommands](self, "stopCommands");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFAudioPlaybackCardSection stopCommands](v117, "stopCommands");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v82 == 0) == (v81 != 0))
              {
                v12 = 0;
                *(_QWORD *)&v116[8] = 0;
                *(_QWORD *)v109 = 0;
                v13 = 0;
                *(_QWORD *)v116 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v18 = 0;
                *(_QWORD *)&v111[8] = 0x100000001;
                *(_QWORD *)v111 = 0x100000001;
                *((_QWORD *)&v110 + 1) = 0x100000001;
                v10 = 1;
                v11 = 1;
                *(_QWORD *)&v110 = 0x100000000;
                *(_QWORD *)&v109[12] = 0x100000000;
                *(_DWORD *)&v109[8] = 1;
              }
              else
              {
                -[SFAudioPlaybackCardSection stopCommands](self, "stopCommands");
                v48 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)&v116[12] = v48 != 0;
                v78 = (void *)v48;
                if (!v48
                  || (-[SFAudioPlaybackCardSection stopCommands](self, "stopCommands"),
                      v49 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFAudioPlaybackCardSection stopCommands](v117, "stopCommands"),
                      v74 = (void *)objc_claimAutoreleasedReturnValue(),
                      v75 = v49,
                      objc_msgSend(v49, "isEqual:")))
                {
                  -[SFAudioPlaybackCardSection detailText](self, "detailText");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFAudioPlaybackCardSection detailText](v117, "detailText");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v77 == 0) == (v76 != 0))
                  {
                    *(_QWORD *)&v116[4] = 0;
                    v13 = 0;
                    v14 = 0;
                    *(_DWORD *)v116 = 0;
                    v15 = 0;
                    v16 = 0;
                    v17 = 0;
                    v18 = 0;
                    *(_QWORD *)&v111[8] = 0x100000001;
                    *(_QWORD *)v111 = 0x100000001;
                    *((_QWORD *)&v110 + 1) = 0x100000001;
                    v10 = 1;
                    v11 = 1;
                    *(_QWORD *)&v110 = 0x100000000;
                    *(_QWORD *)&v109[12] = 0x100000000;
                    *(_DWORD *)&v109[8] = 1;
                    v12 = 1;
                    *(_QWORD *)v109 = 1;
                  }
                  else
                  {
                    -[SFAudioPlaybackCardSection detailText](self, "detailText");
                    v50 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)&v116[8] = v50 != 0;
                    v73 = (void *)v50;
                    if (!v50
                      || (-[SFAudioPlaybackCardSection detailText](self, "detailText"),
                          v51 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFAudioPlaybackCardSection detailText](v117, "detailText"),
                          v69 = (void *)objc_claimAutoreleasedReturnValue(),
                          v70 = v51,
                          objc_msgSend(v51, "isEqual:")))
                    {
                      -[SFAudioPlaybackCardSection title](self, "title");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFAudioPlaybackCardSection title](v117, "title");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v72 == 0) == (v71 != 0))
                      {
                        v13 = 0;
                        *(_QWORD *)v116 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        v18 = 0;
                        *(_QWORD *)&v111[8] = 0x100000001;
                        *(_QWORD *)v111 = 0x100000001;
                        *((_QWORD *)&v110 + 1) = 0x100000001;
                        v10 = 1;
                        v11 = 1;
                        *(_QWORD *)&v110 = 0x100000000;
                        *(_QWORD *)&v109[12] = 0x100000001;
                        *(_DWORD *)&v109[8] = 1;
                        v12 = 1;
                        *(_QWORD *)v109 = 0x100000001;
                      }
                      else
                      {
                        -[SFAudioPlaybackCardSection title](self, "title");
                        v52 = objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)&v116[4] = v52 != 0;
                        v68 = (void *)v52;
                        if (!v52
                          || (-[SFAudioPlaybackCardSection title](self, "title"),
                              v53 = (void *)objc_claimAutoreleasedReturnValue(),
                              -[SFAudioPlaybackCardSection title](v117, "title"),
                              v64 = (void *)objc_claimAutoreleasedReturnValue(),
                              v65 = v53,
                              objc_msgSend(v53, "isEqual:")))
                        {
                          -[SFAudioPlaybackCardSection subtitle](self, "subtitle");
                          v67 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFAudioPlaybackCardSection subtitle](v117, "subtitle");
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v67 == 0) == (v66 != 0))
                          {
                            v14 = 0;
                            *(_DWORD *)v116 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            v18 = 0;
                            *(_QWORD *)&v111[8] = 0x100000001;
                            *(_QWORD *)v111 = 0x100000001;
                            *((_QWORD *)&v110 + 1) = 0x100000001;
                            v10 = 1;
                            v11 = 1;
                            *(_QWORD *)&v109[12] = 0x100000001;
                            *(_DWORD *)&v109[8] = 1;
                            v12 = 1;
                            *(_QWORD *)v109 = 0x100000001;
                            v13 = 1;
                            *(_QWORD *)&v110 = 0x100000001;
                          }
                          else
                          {
                            -[SFAudioPlaybackCardSection subtitle](self, "subtitle");
                            v54 = objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v116 = v54 != 0;
                            v63 = (void *)v54;
                            if (!v54
                              || (-[SFAudioPlaybackCardSection subtitle](self, "subtitle"),
                                  v55 = (void *)objc_claimAutoreleasedReturnValue(),
                                  -[SFAudioPlaybackCardSection subtitle](v117, "subtitle"),
                                  v59 = (void *)objc_claimAutoreleasedReturnValue(),
                                  v60 = v55,
                                  objc_msgSend(v55, "isEqual:")))
                            {
                              -[SFAudioPlaybackCardSection thumbnail](self, "thumbnail");
                              v62 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SFAudioPlaybackCardSection thumbnail](v117, "thumbnail");
                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((v62 == 0) == (v61 != 0))
                              {
                                v16 = 0;
                                v17 = 0;
                                v18 = 0;
                                *(_QWORD *)&v111[8] = 0x100000001;
                                *(_QWORD *)v111 = 0x100000001;
                                *((_QWORD *)&v110 + 1) = 0x100000001;
                                v10 = 1;
                                v11 = 1;
                                *(_QWORD *)&v110 = 0x100000001;
                                *(_QWORD *)&v109[12] = 0x100000001;
                                *(_DWORD *)&v109[8] = 1;
                                v12 = 1;
                                *(_QWORD *)v109 = 0x100000001;
                                v13 = 1;
                                v14 = 1;
                                v15 = 1;
                              }
                              else
                              {
                                -[SFAudioPlaybackCardSection thumbnail](self, "thumbnail");
                                v58 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v58)
                                {
                                  -[SFAudioPlaybackCardSection thumbnail](self, "thumbnail");
                                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[SFAudioPlaybackCardSection thumbnail](v117, "thumbnail");
                                  v3 = objc_claimAutoreleasedReturnValue();
                                  v57 = v56;
                                  v18 = objc_msgSend(v56, "isEqual:", v3);
                                  v17 = 1;
                                  *(_QWORD *)&v111[8] = 0x100000001;
                                  *(_QWORD *)v111 = 0x100000001;
                                  *((_QWORD *)&v110 + 1) = 0x100000001;
                                  v10 = 1;
                                  v11 = 1;
                                  *(_QWORD *)&v110 = 0x100000001;
                                  *(_QWORD *)&v109[12] = 0x100000001;
                                  *(_DWORD *)&v109[8] = 1;
                                  v12 = 1;
                                  *(_QWORD *)v109 = 0x100000001;
                                  v13 = 1;
                                  v14 = 1;
                                  v15 = 1;
                                  v16 = 1;
                                }
                                else
                                {
                                  v58 = 0;
                                  v17 = 0;
                                  *(_QWORD *)&v111[8] = 0x100000001;
                                  *(_QWORD *)v111 = 0x100000001;
                                  *((_QWORD *)&v110 + 1) = 0x100000001;
                                  v10 = 1;
                                  v11 = 1;
                                  *(_QWORD *)&v110 = 0x100000001;
                                  *(_QWORD *)&v109[12] = 0x100000001;
                                  *(_DWORD *)&v109[8] = 1;
                                  v12 = 1;
                                  *(_QWORD *)v109 = 0x100000001;
                                  v13 = 1;
                                  v14 = 1;
                                  v15 = 1;
                                  v16 = 1;
                                  v18 = 1;
                                }
                              }
                            }
                            else
                            {
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              v18 = 0;
                              *(_QWORD *)&v111[8] = 0x100000001;
                              *(_QWORD *)v111 = 0x100000001;
                              *((_QWORD *)&v110 + 1) = 0x100000001;
                              v10 = 1;
                              v11 = 1;
                              *(_QWORD *)&v110 = 0x100000001;
                              *(_QWORD *)&v109[12] = 0x100000001;
                              *(_DWORD *)&v109[8] = 1;
                              v12 = 1;
                              *(_QWORD *)v109 = 0x100000001;
                              v13 = 1;
                              v14 = 1;
                              *(_DWORD *)v116 = 1;
                            }
                          }
                        }
                        else
                        {
                          v14 = 0;
                          *(_QWORD *)v116 = 0x100000000;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          v18 = 0;
                          *(_QWORD *)&v111[8] = 0x100000001;
                          *(_QWORD *)v111 = 0x100000001;
                          *((_QWORD *)&v110 + 1) = 0x100000001;
                          v10 = 1;
                          v11 = 1;
                          *(_QWORD *)&v110 = 0x100000000;
                          *(_QWORD *)&v109[12] = 0x100000001;
                          *(_DWORD *)&v109[8] = 1;
                          v12 = 1;
                          *(_QWORD *)v109 = 0x100000001;
                          v13 = 1;
                        }
                      }
                    }
                    else
                    {
                      v13 = 0;
                      *(_QWORD *)v116 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v18 = 0;
                      *(_QWORD *)&v111[8] = 0x100000001;
                      *(_QWORD *)v111 = 0x100000001;
                      *((_QWORD *)&v110 + 1) = 0x100000001;
                      v10 = 1;
                      v11 = 1;
                      *(_QWORD *)&v110 = 0x100000000;
                      *(_QWORD *)&v109[12] = 0x100000001;
                      *(_DWORD *)&v109[8] = 1;
                      v12 = 1;
                      *(_QWORD *)v109 = 1;
                      *(_DWORD *)&v116[8] = 1;
                    }
                  }
                }
                else
                {
                  *(_QWORD *)v109 = 0;
                  *(_QWORD *)&v116[4] = 0;
                  v13 = 0;
                  v14 = 0;
                  *(_DWORD *)v116 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  v18 = 0;
                  *(_QWORD *)&v111[8] = 0x100000001;
                  *(_QWORD *)v111 = 0x100000001;
                  *((_QWORD *)&v110 + 1) = 0x100000001;
                  v10 = 1;
                  v11 = 1;
                  *(_QWORD *)&v110 = 0x100000000;
                  *(_QWORD *)&v109[12] = 0x100000000;
                  *(_DWORD *)&v109[8] = 1;
                  v12 = 1;
                  *(_DWORD *)&v116[12] = 1;
                }
              }
            }
            else
            {
              *(_QWORD *)v109 = 0;
              *(_QWORD *)&v109[8] = 0;
              v12 = 0;
              *(_QWORD *)&v116[8] = 0;
              v13 = 0;
              *(_QWORD *)v116 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              v18 = 0;
              *(_QWORD *)&v111[8] = 0x100000001;
              *(_QWORD *)v111 = 0x100000001;
              *((_QWORD *)&v110 + 1) = 0x100000001;
              v10 = 1;
              v11 = 1;
              *(_QWORD *)&v110 = 0x100000000;
              *(_DWORD *)&v109[16] = 1;
              *(_DWORD *)&v116[16] = 1;
            }
          }
        }
        else
        {
          v12 = 0;
          memset(v109, 0, sizeof(v109));
          v13 = 0;
          v14 = 0;
          memset(v116, 0, 20);
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          *(_QWORD *)&v111[8] = 0x100000001;
          *(_QWORD *)v111 = 0x100000000;
          *((_QWORD *)&v110 + 1) = 0x100000001;
          v10 = 1;
          v11 = 1;
          *(_QWORD *)&v110 = 0x100000000;
        }
      }
      else
      {
        v12 = 0;
        memset(v109, 0, sizeof(v109));
        v13 = 0;
        v14 = 0;
        memset(v116, 0, 20);
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        *(_QWORD *)&v111[8] = 0x100000001;
        *(_QWORD *)v111 = 0x100000000;
        *((_QWORD *)&v110 + 1) = 0x100000001;
        v10 = 1;
        v11 = 1;
        *(_QWORD *)&v110 = 0x100000000;
        *(_DWORD *)&v116[20] = 1;
      }
    }
  }
  else
  {
    *(_QWORD *)((char *)&v110 + 4) = 0;
    v12 = 0;
    memset(v109, 0, sizeof(v109));
    v13 = 0;
    memset(v116, 0, 24);
    LODWORD(v110) = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)&v111[8] = 0x100000001;
    *(_QWORD *)v111 = 0x100000000;
    HIDWORD(v110) = 1;
    v10 = 1;
    v11 = 1;
  }
LABEL_16:
  if (v17)
  {
    v23 = v12;
    v24 = v13;
    v25 = v14;
    v26 = v15;
    v27 = v11;
    v28 = v10;
    v29 = v16;

    v16 = v29;
    v10 = v28;
    v11 = v27;
    v15 = v26;
    v14 = v25;
    v13 = v24;
    v12 = v23;
  }
  if (v16)

  if (v15)
  {

  }
  if (*(_DWORD *)v116)
  {

  }
  if (v14)

  if ((_DWORD)v110)
  {

  }
  if (*(_DWORD *)&v116[4])
  {

  }
  if (v13)

  if (*(_DWORD *)&v109[4])
  {

  }
  if (*(_DWORD *)&v116[8])
  {

  }
  if (*(_DWORD *)&v109[12])

  if (*(_DWORD *)v109)
  {

  }
  if (*(_DWORD *)&v116[12])
  {

  }
  if (v12)

  if (*(_DWORD *)&v109[8])
  {

  }
  if (*(_DWORD *)&v116[16])
  {

  }
  if (*(_DWORD *)v111)

  if (*(_DWORD *)&v109[16])
  {

  }
  if (*(_DWORD *)&v116[20])
  {

  }
  if (DWORD1(v110))

  if (DWORD2(v110))
  {

  }
  if (*(_DWORD *)&v116[24])
  {

    if (!v11)
      goto LABEL_60;
LABEL_81:

    if (!v10)
      goto LABEL_62;
    goto LABEL_61;
  }
  if (v11)
    goto LABEL_81;
LABEL_60:
  if (v10)
  {
LABEL_61:

  }
LABEL_62:
  if (*(_DWORD *)&v116[28])
  {

  }
  if (HIDWORD(v110))

  if (*(_DWORD *)&v111[4])
  {

  }
  if (*(_DWORD *)&v116[32])
  {

  }
  if (*(_DWORD *)&v111[8])

  if (*(_DWORD *)&v111[12])
  {

  }
  if (*(_DWORD *)&v111[16])
  {

  }
  if (v113 != v112)

LABEL_79:
  return v18;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SFAudioPlaybackCardSection;
  v3 = -[SFCardSection hash](&v32, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v31, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v30, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v29, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFAudioPlaybackCardSection type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v8 ^ v14 ^ -[SFAudioPlaybackCardSection state](self, "state");
  -[SFAudioPlaybackCardSection playCommands](self, "playCommands");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  -[SFAudioPlaybackCardSection stopCommands](self, "stopCommands");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[SFAudioPlaybackCardSection detailText](self, "detailText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[SFAudioPlaybackCardSection title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  -[SFAudioPlaybackCardSection subtitle](self, "subtitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23 ^ objc_msgSend(v24, "hash");
  -[SFAudioPlaybackCardSection thumbnail](self, "thumbnail");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v15 ^ v25 ^ objc_msgSend(v26, "hash");

  return v27;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (int)state
{
  return self->_state;
}

- (NSArray)playCommands
{
  return self->_playCommands;
}

- (void)setPlayCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)stopCommands
{
  return self->_stopCommands;
}

- (void)setStopCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (SFRichText)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_stopCommands, 0);
  objc_storeStrong((id *)&self->_playCommands, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
