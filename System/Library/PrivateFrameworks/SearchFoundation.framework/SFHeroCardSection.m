@implementation SFHeroCardSection

- (SFHeroCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFHeroCardSection *v5;
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
  SFRichText *v25;
  void *v26;
  SFRichText *v27;
  void *v28;
  SFRichText *v29;
  void *v30;
  SFRichText *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  SFButtonItem *v39;
  void *v40;
  SFImage *v41;
  void *v42;
  SFImage *v43;
  SFHeroCardSection *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)SFHeroCardSection;
  v5 = -[SFCardSection init](&v54, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v51 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
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
      -[SFHeroCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFRichText initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFHeroCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "subtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFRichText alloc];
      objc_msgSend(v4, "subtitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFRichText initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFHeroCardSection setSubtitle:](v5, "setSubtitle:", v31);

    }
    objc_msgSend(v4, "buttonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v33 = 0;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v4, "buttonItems", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v34);
          v39 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
          if (v39)
            objc_msgSend(v33, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v36);
    }

    -[SFHeroCardSection setButtonItems:](v5, "setButtonItems:", v33);
    objc_msgSend(v4, "image");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SFImage initWithProtobuf:](v41, "initWithProtobuf:", v42);
      -[SFHeroCardSection setImage:](v5, "setImage:", v43);

    }
    if (objc_msgSend(v4, "imageAlign"))
      -[SFHeroCardSection setImageAlign:](v5, "setImageAlign:", objc_msgSend(v4, "imageAlign"));
    v44 = v5;

  }
  return v5;
}

- (void)setImageAlign:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_imageAlign = a3;
}

- (BOOL)hasImageAlign
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFHeroCardSection)initWithCoder:(id)a3
{
  id v4;
  SFHeroCardSection *v5;
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
    -[SFHeroCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection title](v8, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHeroCardSection setTitle:](v5, "setTitle:", v14);

    -[SFCardSection subtitle](v8, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHeroCardSection setSubtitle:](v5, "setSubtitle:", v15);

    -[SFCardSection buttonItems](v8, "buttonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHeroCardSection setButtonItems:](v5, "setButtonItems:", v16);

    -[SFCardSection image](v8, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHeroCardSection setImage:](v5, "setImage:", v17);

    -[SFHeroCardSection setImageAlign:](v5, "setImageAlign:", -[SFCardSection imageAlign](v8, "imageAlign"));
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
  v3.super_class = (Class)SFHeroCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBHeroCardSection *v2;
  void *v3;

  v2 = -[_SFPBHeroCardSection initWithFacade:]([_SFPBHeroCardSection alloc], "initWithFacade:", self);
  -[_SFPBHeroCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBHeroCardSection *v2;
  void *v3;

  v2 = -[_SFPBHeroCardSection initWithFacade:]([_SFPBHeroCardSection alloc], "initWithFacade:", self);
  -[_SFPBHeroCardSection jsonData](v2, "jsonData");
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
  v24.super_class = (Class)SFHeroCardSection;
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
  -[SFHeroCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFHeroCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setTitle:", v16);

  -[SFHeroCardSection subtitle](self, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setSubtitle:", v18);

  -[SFHeroCardSection buttonItems](self, "buttonItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setButtonItems:", v20);

  -[SFHeroCardSection image](self, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setImage:", v22);

  objc_msgSend(v4, "setImageAlign:", -[SFHeroCardSection imageAlign](self, "imageAlign"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFHeroCardSection *v5;
  SFHeroCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
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
  void *v45;
  int v46;
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
  SFHeroCardSection *v69;
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
  objc_super v87;

  v5 = (SFHeroCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFHeroCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v87.receiver = self;
      v87.super_class = (Class)SFHeroCardSection;
      if (-[SFCardSection isEqual:](&v87, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v6, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
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
            v11 = 0;
            goto LABEL_36;
          }
          v86 = v10;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
        {
LABEL_35:

          v11 = 0;
          v10 = v86;
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
          v80 = v8;
          v15 = v7;
          v16 = v9;
          v17 = v13;
          v18 = v12;
          v19 = v3;
          v20 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = (void *)v20;
          v21 = (void *)v20;
          v3 = v19;
          v12 = v18;
          v13 = v17;
          v9 = v16;
          v7 = v15;
          v8 = v80;
          if (!objc_msgSend(v21, "isEqual:"))
            goto LABEL_33;
        }
        v84 = v3;
        v85 = v14;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) == (v23 != 0))
        {

          goto LABEL_32;
        }
        v77 = v22;
        v78 = v23;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v24 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = (void *)v24;
          v25 = (void *)v24;
          v14 = v85;
          v26 = v79;
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
              -[SFHeroCardSection type](self, "type");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFHeroCardSection type](v6, "type");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v30 == 0) != (v31 != 0))
              {
                v73 = v31;
                v74 = v30;
                -[SFHeroCardSection type](self, "type");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v79;
                if (v32)
                {
                  -[SFHeroCardSection type](self, "type");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFHeroCardSection type](v6, "type");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v72, "isEqual:"))
                  {
LABEL_54:

LABEL_55:
                    v14 = v85;
                    if (!v26)
                      goto LABEL_31;
                    goto LABEL_30;
                  }
                }
                v71 = v32;
                v34 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v34 != -[SFCardSection separatorStyle](v6, "separatorStyle"))
                {
LABEL_53:
                  v26 = v79;
                  v32 = v71;
                  if (!v71)
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
                v66 = v36;
                v81 = v8;
                v65 = v7;
                v67 = v13;
                v68 = v12;
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
                -[SFHeroCardSection title](self, "title");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = v6;
                -[SFHeroCardSection title](v6, "title");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v40;
                if ((v39 == 0) == (v40 != 0))
                {

                  v6 = v69;
                  if (!v37)
                  {
LABEL_52:

                    v13 = v67;
                    v12 = v68;
                    v7 = v65;
                    v8 = v81;
                    goto LABEL_53;
                  }
LABEL_51:

                  goto LABEL_52;
                }
                -[SFHeroCardSection title](self, "title");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (v64)
                {
                  -[SFHeroCardSection title](self, "title");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFHeroCardSection title](v69, "title");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = v42;
                  if (!objc_msgSend(v42, "isEqual:"))
                    goto LABEL_62;
                }
                -[SFHeroCardSection subtitle](self, "subtitle");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFHeroCardSection subtitle](v69, "subtitle");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v63 == 0) == (v62 != 0))
                {

                  if (!v64)
                  {
LABEL_63:

                    if (v37)
                    {

                    }
                    if (v71)
                    {

                    }
                    if (v79)
                    {

                    }
                    if (!v85)
                    {
LABEL_89:

                      v11 = 0;
                      if (v9)
                      {
LABEL_90:
                        v10 = v86;
                        v3 = v84;
                        v7 = v65;
                        v8 = v81;
                        v6 = v69;
                        goto LABEL_36;
                      }
LABEL_114:
                      v7 = v65;
                      v8 = v81;
                      v6 = v69;
                      goto LABEL_37;
                    }
LABEL_87:

LABEL_88:
                    goto LABEL_89;
                  }
LABEL_62:

                  goto LABEL_63;
                }
                -[SFHeroCardSection subtitle](self, "subtitle");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                if (v59)
                {
                  -[SFHeroCardSection subtitle](self, "subtitle");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFHeroCardSection subtitle](v69, "subtitle");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = v43;
                  if (!objc_msgSend(v43, "isEqual:"))
                  {
LABEL_77:

LABEL_78:
                    if (v64)
                    {

                    }
                    if (v37)
                    {

                    }
                    if (v71)
                    {

                    }
                    if (v79)
                    {

                    }
                    if (!v85)
                      goto LABEL_88;
                    goto LABEL_87;
                  }
                }
                -[SFHeroCardSection buttonItems](self, "buttonItems");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFHeroCardSection buttonItems](v69, "buttonItems");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v58 == 0) == (v57 != 0))
                {

                  if (!v59)
                    goto LABEL_78;
                  goto LABEL_77;
                }
                -[SFHeroCardSection buttonItems](self, "buttonItems");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (v54)
                {
                  -[SFHeroCardSection buttonItems](self, "buttonItems");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFHeroCardSection buttonItems](v69, "buttonItems");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = v44;
                  if (!objc_msgSend(v44, "isEqual:"))
                  {
                    v11 = 0;
LABEL_100:

LABEL_101:
                    if (v59)
                    {

                    }
                    if (v64)
                    {

                    }
                    if (v37)
                    {

                    }
                    if (v71)
                    {

                    }
                    if (v79)
                    {

                    }
                    if (v85)
                    {

                    }
                    if (v9)
                      goto LABEL_90;
                    goto LABEL_114;
                  }
                }
                -[SFHeroCardSection image](self, "image");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFHeroCardSection image](v69, "image");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v53 == 0) == (v52 != 0))
                {

                  v11 = 0;
                  goto LABEL_99;
                }
                -[SFHeroCardSection image](self, "image");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v49
                  || (-[SFHeroCardSection image](self, "image"),
                      v45 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFHeroCardSection image](v69, "image"),
                      v47 = (void *)objc_claimAutoreleasedReturnValue(),
                      v48 = v45,
                      objc_msgSend(v45, "isEqual:")))
                {
                  v46 = -[SFHeroCardSection imageAlign](self, "imageAlign");
                  v11 = v46 == -[SFHeroCardSection imageAlign](v69, "imageAlign");
                  if (!v49)
                  {
LABEL_98:

LABEL_99:
                    if (!v54)
                      goto LABEL_101;
                    goto LABEL_100;
                  }
                }
                else
                {
                  v11 = 0;
                }

                goto LABEL_98;
              }

            }
          }
        }
        v14 = v85;
        v26 = v79;
        if (!v79)
        {
LABEL_31:

LABEL_32:
          v3 = v84;
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
    v11 = 0;
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
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SFHeroCardSection;
  v3 = -[SFCardSection hash](&v28, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v27, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v26, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v9 = v8 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v10 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFHeroCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  v13 = v12 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[SFHeroCardSection title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9 ^ v15 ^ objc_msgSend(v16, "hash");
  -[SFHeroCardSection subtitle](self, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  -[SFHeroCardSection buttonItems](self, "buttonItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[SFHeroCardSection image](self, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  v24 = v17 ^ v23 ^ -[SFHeroCardSection imageAlign](self, "imageAlign");

  return v24;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
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

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
