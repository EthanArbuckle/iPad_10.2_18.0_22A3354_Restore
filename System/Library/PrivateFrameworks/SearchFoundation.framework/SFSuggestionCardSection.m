@implementation SFSuggestionCardSection

- (SFSuggestionCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFSuggestionCardSection *v5;
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
  void *v29;
  void *v30;
  SFRichText *v31;
  void *v32;
  SFRichText *v33;
  void *v34;
  SFImage *v35;
  void *v36;
  SFImage *v37;
  void *v38;
  SFFormattedText *v39;
  void *v40;
  SFFormattedText *v41;
  void *v42;
  SFFormattedText *v43;
  void *v44;
  SFFormattedText *v45;
  SFSuggestionCardSection *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SFSuggestionCardSection;
  v5 = -[SFCardSection init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
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
      -[SFSuggestionCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "suggestionText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFRichText alloc];
      objc_msgSend(v4, "suggestionText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFRichText initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFSuggestionCardSection setSuggestionText:](v5, "setSuggestionText:", v27);

    }
    if (objc_msgSend(v4, "isContact"))
      -[SFSuggestionCardSection setIsContact:](v5, "setIsContact:", objc_msgSend(v4, "isContact"));
    objc_msgSend(v4, "scopedSearchSectionBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "scopedSearchSectionBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSuggestionCardSection setScopedSearchSectionBundleIdentifier:](v5, "setScopedSearchSectionBundleIdentifier:", v29);

    }
    if (objc_msgSend(v4, "suggestionType"))
      -[SFSuggestionCardSection setSuggestionType:](v5, "setSuggestionType:", objc_msgSend(v4, "suggestionType"));
    objc_msgSend(v4, "detailText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [SFRichText alloc];
      objc_msgSend(v4, "detailText");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SFRichText initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[SFSuggestionCardSection setDetailText:](v5, "setDetailText:", v33);

    }
    objc_msgSend(v4, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [SFImage alloc];
      objc_msgSend(v4, "thumbnail");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SFImage initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[SFSuggestionCardSection setThumbnail:](v5, "setThumbnail:", v37);

    }
    objc_msgSend(v4, "trailingMiddleText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [SFFormattedText alloc];
      objc_msgSend(v4, "trailingMiddleText");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[SFFormattedText initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[SFSuggestionCardSection setTrailingMiddleText:](v5, "setTrailingMiddleText:", v41);

    }
    objc_msgSend(v4, "trailingBottomText");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [SFFormattedText alloc];
      objc_msgSend(v4, "trailingBottomText");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[SFFormattedText initWithProtobuf:](v43, "initWithProtobuf:", v44);
      -[SFSuggestionCardSection setTrailingBottomText:](v5, "setTrailingBottomText:", v45);

    }
    v46 = v5;

  }
  return v5;
}

- (void)setIsContact:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isContact = a3;
}

- (BOOL)hasIsContact
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSuggestionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_suggestionType = a3;
}

- (BOOL)hasSuggestionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFSuggestionCardSection)initWithCoder:(id)a3
{
  id v4;
  SFSuggestionCardSection *v5;
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
    -[SFSuggestionCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection suggestionText](v8, "suggestionText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSuggestionCardSection setSuggestionText:](v5, "setSuggestionText:", v14);

    -[SFSuggestionCardSection setIsContact:](v5, "setIsContact:", -[SFCardSection isContact](v8, "isContact"));
    -[SFCardSection scopedSearchSectionBundleIdentifier](v8, "scopedSearchSectionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSuggestionCardSection setScopedSearchSectionBundleIdentifier:](v5, "setScopedSearchSectionBundleIdentifier:", v15);

    -[SFSuggestionCardSection setSuggestionType:](v5, "setSuggestionType:", -[SFCardSection suggestionType](v8, "suggestionType"));
    -[SFCardSection detailText](v8, "detailText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSuggestionCardSection setDetailText:](v5, "setDetailText:", v16);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSuggestionCardSection setThumbnail:](v5, "setThumbnail:", v17);

    -[SFCardSection trailingMiddleText](v8, "trailingMiddleText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSuggestionCardSection setTrailingMiddleText:](v5, "setTrailingMiddleText:", v18);

    -[SFCardSection trailingBottomText](v8, "trailingBottomText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSuggestionCardSection setTrailingBottomText:](v5, "setTrailingBottomText:", v19);

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
  v3.super_class = (Class)SFSuggestionCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSuggestionCardSection *v2;
  void *v3;

  v2 = -[_SFPBSuggestionCardSection initWithFacade:]([_SFPBSuggestionCardSection alloc], "initWithFacade:", self);
  -[_SFPBSuggestionCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSuggestionCardSection *v2;
  void *v3;

  v2 = -[_SFPBSuggestionCardSection initWithFacade:]([_SFPBSuggestionCardSection alloc], "initWithFacade:", self);
  -[_SFPBSuggestionCardSection jsonData](v2, "jsonData");
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
  v28.super_class = (Class)SFSuggestionCardSection;
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
  -[SFSuggestionCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFSuggestionCardSection suggestionText](self, "suggestionText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setSuggestionText:", v16);

  objc_msgSend(v4, "setIsContact:", -[SFSuggestionCardSection isContact](self, "isContact"));
  -[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setScopedSearchSectionBundleIdentifier:", v18);

  objc_msgSend(v4, "setSuggestionType:", -[SFSuggestionCardSection suggestionType](self, "suggestionType"));
  -[SFSuggestionCardSection detailText](self, "detailText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setDetailText:", v20);

  -[SFSuggestionCardSection thumbnail](self, "thumbnail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setThumbnail:", v22);

  -[SFSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setTrailingMiddleText:", v24);

  -[SFSuggestionCardSection trailingBottomText](self, "trailingBottomText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setTrailingBottomText:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFSuggestionCardSection *v4;
  SFSuggestionCardSection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  SFSuggestionCardSection *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v32;
  uint64_t v33;
  SFSuggestionCardSection *v34;
  void *v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  SFSuggestionCardSection *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _BOOL4 v48;
  uint64_t v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
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
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE v113[20];
  uint64_t v114;
  _BOOL4 v115;
  _BYTE v116[12];
  int v117;
  int v118;
  id v119;
  id v120;
  _QWORD v121[4];
  SFSuggestionCardSection *v122;
  objc_super v123;

  v4 = (SFSuggestionCardSection *)a3;
  if (self == v4)
  {
    v19 = 1;
    goto LABEL_77;
  }
  if (!-[SFSuggestionCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    || (v123.receiver = self,
        v123.super_class = (Class)SFSuggestionCardSection,
        !-[SFCardSection isEqual:](&v123, sel_isEqual_, v4)))
  {
    v19 = 0;
    goto LABEL_77;
  }
  v5 = v4;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;
  -[SFCardSection punchoutOptions](v5, "punchoutOptions");
  v119 = (id)objc_claimAutoreleasedReturnValue();
  v120 = v6;
  v117 = v119 != 0;
  v118 = v7;
  v122 = v5;
  if ((_DWORD)v7 == v117)
  {
    v115 = 0;
    memset(v116, 0, sizeof(v116));
    v114 = 0;
    v11 = 0;
    v12 = 0;
    v111 = 0;
    v112 = 0;
    memset(v121, 0, sizeof(v121));
    memset(v113, 0, sizeof(v113));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_16;
  }
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  v110 = (void *)v8;
  if (v8)
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection punchoutOptions](v5, "punchoutOptions");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      *(_QWORD *)v116 = 0;
      v114 = 0;
      v11 = 0;
      v12 = 0;
      v111 = 0;
      v112 = 0;
      memset(v121, 0, sizeof(v121));
      memset(v113, 0, sizeof(v113));
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v115 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      *(_DWORD *)&v116[8] = 1;
      goto LABEL_16;
    }
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerTitle](v5, "punchoutPickerTitle");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v116[8] = v9;
  if ((v109 == 0) == (v108 != 0))
  {
    v115 = 0;
    *(_QWORD *)v116 = 0x100000000;
    v114 = 0;
    v11 = 0;
    v12 = 0;
    v111 = 0;
    v112 = 0;
    memset(v121, 0, sizeof(v121));
    memset(v113, 0, sizeof(v113));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v20 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v121[3]) = v20 != 0;
  v105 = (void *)v20;
  if (v20)
  {
    -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v5;
    v23 = (void *)v21;
    -[SFCardSection punchoutPickerTitle](v22, "punchoutPickerTitle");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      v114 = 0;
      v11 = 0;
      v12 = 0;
      v111 = 0;
      v112 = 0;
      memset(v113, 0, sizeof(v113));
      v13 = 0;
      memset(v121, 0, 28);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v115 = 0;
      *(_QWORD *)v116 = 0x100000001;
      HIDWORD(v121[3]) = 1;
      goto LABEL_16;
    }
    v5 = v122;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerDismissText](v5, "punchoutPickerDismissText");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v104 == 0) == (v103 != 0))
  {
    v11 = 0;
    v12 = 0;
    v111 = 0;
    v112 = 0;
    memset(v113, 0, sizeof(v113));
    v13 = 0;
    memset(v121, 0, 28);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v115 = 0;
    *(_QWORD *)v116 = 0x100000001;
    v114 = 0x100000000;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v32 = objc_claimAutoreleasedReturnValue();
  LODWORD(v121[3]) = v32 != 0;
  v100 = (void *)v32;
  if (v32)
  {
    -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v5;
    v35 = (void *)v33;
    -[SFCardSection punchoutPickerDismissText](v34, "punchoutPickerDismissText");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v35;
    if (!objc_msgSend(v35, "isEqual:", v98))
    {
      v11 = 0;
      v12 = 0;
      *(_QWORD *)&v113[8] = 0;
      v111 = 0;
      v112 = 0;
      *(_QWORD *)v113 = 0;
      memset(v121, 0, 24);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v115 = 0;
      *(_QWORD *)v116 = 0x100000001;
      v114 = 0x100000000;
      *(_DWORD *)&v113[16] = 1;
      LODWORD(v121[3]) = 1;
      goto LABEL_16;
    }
    v5 = v122;
  }
  v36 = -[SFCardSection canBeHidden](self, "canBeHidden");
  if (v36 != -[SFCardSection canBeHidden](v5, "canBeHidden")
    || (v37 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
        v37 != -[SFCardSection hasTopPadding](v5, "hasTopPadding"))
    || (v38 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
        v38 != -[SFCardSection hasBottomPadding](v5, "hasBottomPadding")))
  {
    v11 = 0;
    v12 = 0;
    *(_QWORD *)&v113[8] = 0;
    v111 = 0;
    v112 = 0;
    *(_QWORD *)v113 = 0;
    memset(v121, 0, 24);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v115 = 0;
    *(_QWORD *)v116 = 0x100000001;
    v114 = 0x100000000;
    *(_DWORD *)&v113[16] = 1;
    goto LABEL_16;
  }
  -[SFSuggestionCardSection type](self, "type");
  v39 = objc_claimAutoreleasedReturnValue();
  -[SFSuggestionCardSection type](v5, "type");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)v39;
  if ((v39 == 0) == (v96 != 0))
  {
    v12 = 0;
    *(_QWORD *)&v113[8] = 0;
    v111 = 0;
    v112 = 0;
    *(_QWORD *)v113 = 0;
    memset(v121, 0, 24);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v115 = 0;
    *(_QWORD *)v116 = 0x100000001;
    v114 = 0x100000000;
    *(_DWORD *)&v113[16] = 1;
    v11 = 1;
    goto LABEL_16;
  }
  -[SFSuggestionCardSection type](self, "type");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v121[2]) = v95 != 0;
  if (v95)
  {
    -[SFSuggestionCardSection type](self, "type");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v5;
    v42 = (void *)v40;
    -[SFSuggestionCardSection type](v41, "type");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v42;
    if (!objc_msgSend(v42, "isEqual:"))
    {
      *(_QWORD *)&v113[8] = 0;
      v111 = 0;
      v112 = 0;
      *(_QWORD *)v113 = 0;
      v13 = 0;
      memset(v121, 0, 20);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v115 = 0;
      *(_QWORD *)v116 = 0x100000001;
      v114 = 0x100000000;
      *(_DWORD *)&v113[16] = 1;
      v11 = 1;
      v12 = 1;
      HIDWORD(v121[2]) = 1;
      goto LABEL_16;
    }
    v5 = v122;
  }
  v43 = -[SFCardSection separatorStyle](self, "separatorStyle");
  if (v43 == -[SFCardSection separatorStyle](v5, "separatorStyle"))
  {
    -[SFCardSection backgroundColor](self, "backgroundColor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection backgroundColor](v5, "backgroundColor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v92 == 0) == (v91 != 0))
    {
      v111 = 0;
      v112 = 0;
      *(_QWORD *)v113 = 0;
      v13 = 0;
      memset(v121, 0, 20);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v115 = 0;
      *(_QWORD *)v116 = 0x100000001;
      v114 = 0x100000000;
      *(_DWORD *)&v113[16] = 1;
      v11 = 1;
      v12 = 1;
      *(_QWORD *)&v113[8] = 0x100000000;
    }
    else
    {
      -[SFCardSection backgroundColor](self, "backgroundColor");
      v44 = objc_claimAutoreleasedReturnValue();
      LODWORD(v121[2]) = v44 != 0;
      v90 = (void *)v44;
      if (!v44
        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFCardSection backgroundColor](v122, "backgroundColor"),
            v86 = (void *)objc_claimAutoreleasedReturnValue(),
            v87 = v45,
            objc_msgSend(v45, "isEqual:")))
      {
        -[SFSuggestionCardSection suggestionText](self, "suggestionText");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSuggestionCardSection suggestionText](v122, "suggestionText");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v89 == 0) == (v88 != 0))
        {
          v112 = 0;
          v121[0] = 0;
          v121[1] = 0;
          v111 = 0x100000000;
          *(_QWORD *)v113 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v115 = 0;
          *(_QWORD *)v116 = 0x100000001;
          v114 = 0x100000001;
          *(_DWORD *)&v113[16] = 1;
          v11 = 1;
          v12 = 1;
          *(_QWORD *)&v113[8] = 0x100000000;
        }
        else
        {
          -[SFSuggestionCardSection suggestionText](self, "suggestionText");
          v46 = objc_claimAutoreleasedReturnValue();
          HIDWORD(v121[1]) = v46 != 0;
          v85 = (void *)v46;
          if (!v46
            || (-[SFSuggestionCardSection suggestionText](self, "suggestionText"),
                v47 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFSuggestionCardSection suggestionText](v122, "suggestionText"),
                v83 = (void *)objc_claimAutoreleasedReturnValue(),
                v84 = v47,
                objc_msgSend(v47, "isEqual:")))
          {
            v48 = -[SFSuggestionCardSection isContact](self, "isContact");
            if (v48 == -[SFSuggestionCardSection isContact](v122, "isContact"))
            {
              -[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](v122, "scopedSearchSectionBundleIdentifier");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v82 == 0) == (v81 != 0))
              {
                v112 = 0x100000000;
                *(_QWORD *)((char *)v121 + 4) = 0;
                *(_QWORD *)v113 = 0;
                v13 = 0;
                LODWORD(v121[0]) = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v18 = 0;
                v19 = 0;
                v115 = 0;
                *(_QWORD *)v116 = 0x100000001;
                v114 = 0x100000001;
                *(_DWORD *)&v113[16] = 1;
                v11 = 1;
                v12 = 1;
                *(_QWORD *)&v113[8] = 0x100000000;
                v111 = 0x100000001;
              }
              else
              {
                -[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
                v49 = objc_claimAutoreleasedReturnValue();
                LODWORD(v121[1]) = v49 != 0;
                v80 = (void *)v49;
                if (!v49
                  || (-[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier"), v50 = (void *)objc_claimAutoreleasedReturnValue(), -[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](v122, "scopedSearchSectionBundleIdentifier"), v78 = (void *)objc_claimAutoreleasedReturnValue(), v79 = v50, objc_msgSend(v50, "isEqual:")))
                {
                  v51 = -[SFSuggestionCardSection suggestionType](self, "suggestionType");
                  if (v51 == -[SFSuggestionCardSection suggestionType](v122, "suggestionType"))
                  {
                    -[SFSuggestionCardSection detailText](self, "detailText");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFSuggestionCardSection detailText](v122, "detailText");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v77 == 0) == (v76 != 0))
                    {
                      *(_QWORD *)&v113[4] = 0;
                      v121[0] = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v18 = 0;
                      v19 = 0;
                      v115 = 0;
                      *(_QWORD *)v116 = 0x100000001;
                      v114 = 0x100000001;
                      *(_DWORD *)&v113[12] = 1;
                      *(_DWORD *)&v113[16] = 1;
                      v11 = 1;
                      v12 = 1;
                      v111 = 0x100000001;
                      v112 = 0x100000001;
                      *(_DWORD *)v113 = 1;
                    }
                    else
                    {
                      -[SFSuggestionCardSection detailText](self, "detailText");
                      v52 = objc_claimAutoreleasedReturnValue();
                      HIDWORD(v121[0]) = v52 != 0;
                      v75 = (void *)v52;
                      if (!v52
                        || (-[SFSuggestionCardSection detailText](self, "detailText"),
                            v53 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFSuggestionCardSection detailText](v122, "detailText"),
                            v71 = (void *)objc_claimAutoreleasedReturnValue(),
                            v72 = v53,
                            objc_msgSend(v53, "isEqual:")))
                      {
                        -[SFSuggestionCardSection thumbnail](self, "thumbnail");
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFSuggestionCardSection thumbnail](v122, "thumbnail");
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v74 == 0) == (v73 != 0))
                        {
                          v13 = 0;
                          LODWORD(v121[0]) = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          v18 = 0;
                          v19 = 0;
                          v115 = 0;
                          *(_QWORD *)v116 = 0x100000001;
                          v114 = 0x100000001;
                          *(_DWORD *)&v113[16] = 1;
                          v11 = 1;
                          v12 = 1;
                          v111 = 0x100000001;
                          v112 = 0x100000001;
                          *(_QWORD *)v113 = 0x100000001;
                          *(_QWORD *)&v113[8] = 0x100000001;
                        }
                        else
                        {
                          -[SFSuggestionCardSection thumbnail](self, "thumbnail");
                          v54 = objc_claimAutoreleasedReturnValue();
                          LODWORD(v121[0]) = v54 != 0;
                          v70 = (void *)v54;
                          if (!v54
                            || (-[SFSuggestionCardSection thumbnail](self, "thumbnail"),
                                v55 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFSuggestionCardSection thumbnail](v122, "thumbnail"),
                                v66 = (void *)objc_claimAutoreleasedReturnValue(),
                                v67 = v55,
                                objc_msgSend(v55, "isEqual:")))
                          {
                            -[SFSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            -[SFSuggestionCardSection trailingMiddleText](v122, "trailingMiddleText");
                            v68 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((v69 == 0) == (v68 != 0))
                            {
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              v18 = 0;
                              v19 = 0;
                              v115 = 0;
                              *(_QWORD *)v116 = 0x100000001;
                              v114 = 0x100000001;
                              *(_DWORD *)&v113[16] = 1;
                              v11 = 1;
                              v12 = 1;
                              v111 = 0x100000001;
                              v112 = 0x100000001;
                              *(_QWORD *)v113 = 0x100000001;
                              *(_QWORD *)&v113[8] = 0x100000001;
                              v13 = 1;
                              v14 = 1;
                            }
                            else
                            {
                              -[SFSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
                              v56 = objc_claimAutoreleasedReturnValue();
                              v115 = v56 != 0;
                              v65 = (void *)v56;
                              if (!v56
                                || (-[SFSuggestionCardSection trailingMiddleText](self, "trailingMiddleText"),
                                    v57 = (void *)objc_claimAutoreleasedReturnValue(),
                                    -[SFSuggestionCardSection trailingMiddleText](v122, "trailingMiddleText"),
                                    v63 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v64 = v57,
                                    objc_msgSend(v57, "isEqual:")))
                              {
                                -[SFSuggestionCardSection trailingBottomText](self, "trailingBottomText");
                                v62 = (void *)objc_claimAutoreleasedReturnValue();
                                -[SFSuggestionCardSection trailingBottomText](v122, "trailingBottomText");
                                v61 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((v62 == 0) == (v61 != 0))
                                {
                                  v17 = 0;
                                  v18 = 0;
                                  v19 = 0;
                                  *(_QWORD *)v116 = 0x100000001;
                                  v114 = 0x100000001;
                                  *(_DWORD *)&v113[16] = 1;
                                  v11 = 1;
                                  v12 = 1;
                                  v111 = 0x100000001;
                                  v112 = 0x100000001;
                                  *(_QWORD *)v113 = 0x100000001;
                                  *(_QWORD *)&v113[8] = 0x100000001;
                                  v13 = 1;
                                  v14 = 1;
                                  v15 = 1;
                                  v16 = 1;
                                }
                                else
                                {
                                  -[SFSuggestionCardSection trailingBottomText](self, "trailingBottomText");
                                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v60)
                                  {
                                    -[SFSuggestionCardSection trailingBottomText](self, "trailingBottomText");
                                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[SFSuggestionCardSection trailingBottomText](v122, "trailingBottomText");
                                    v7 = objc_claimAutoreleasedReturnValue();
                                    v59 = v58;
                                    v19 = objc_msgSend(v58, "isEqual:", v7);
                                    v18 = 1;
                                    *(_QWORD *)v116 = 0x100000001;
                                    v114 = 0x100000001;
                                    *(_DWORD *)&v113[16] = 1;
                                    v11 = 1;
                                    v12 = 1;
                                    v111 = 0x100000001;
                                    v112 = 0x100000001;
                                    *(_QWORD *)v113 = 0x100000001;
                                    *(_QWORD *)&v113[8] = 0x100000001;
                                    v13 = 1;
                                    v14 = 1;
                                    v15 = 1;
                                    v16 = 1;
                                    v17 = 1;
                                  }
                                  else
                                  {
                                    v60 = 0;
                                    v18 = 0;
                                    *(_QWORD *)v116 = 0x100000001;
                                    v114 = 0x100000001;
                                    *(_DWORD *)&v113[16] = 1;
                                    v11 = 1;
                                    v12 = 1;
                                    v111 = 0x100000001;
                                    v112 = 0x100000001;
                                    *(_QWORD *)v113 = 0x100000001;
                                    *(_QWORD *)&v113[8] = 0x100000001;
                                    v13 = 1;
                                    v14 = 1;
                                    v15 = 1;
                                    v16 = 1;
                                    v17 = 1;
                                    v19 = 1;
                                  }
                                }
                              }
                              else
                              {
                                v16 = 0;
                                v17 = 0;
                                v18 = 0;
                                v19 = 0;
                                *(_QWORD *)v116 = 0x100000001;
                                v114 = 0x100000001;
                                *(_DWORD *)&v113[16] = 1;
                                v11 = 1;
                                v12 = 1;
                                v111 = 0x100000001;
                                v112 = 0x100000001;
                                *(_QWORD *)v113 = 0x100000001;
                                *(_QWORD *)&v113[8] = 0x100000001;
                                v13 = 1;
                                v14 = 1;
                                v15 = 1;
                                v115 = 1;
                              }
                            }
                          }
                          else
                          {
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            v18 = 0;
                            v19 = 0;
                            v115 = 0;
                            *(_QWORD *)v116 = 0x100000001;
                            v114 = 0x100000001;
                            *(_DWORD *)&v113[16] = 1;
                            v11 = 1;
                            v12 = 1;
                            v111 = 0x100000001;
                            v112 = 0x100000001;
                            *(_QWORD *)v113 = 0x100000001;
                            *(_QWORD *)&v113[8] = 0x100000001;
                            v13 = 1;
                            LODWORD(v121[0]) = 1;
                          }
                        }
                      }
                      else
                      {
                        v13 = 0;
                        v121[0] = 0x100000000;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        v18 = 0;
                        v19 = 0;
                        v115 = 0;
                        *(_QWORD *)v116 = 0x100000001;
                        v114 = 0x100000001;
                        *(_DWORD *)&v113[16] = 1;
                        v11 = 1;
                        v12 = 1;
                        v111 = 0x100000001;
                        v112 = 0x100000001;
                        *(_QWORD *)v113 = 1;
                        *(_QWORD *)&v113[8] = 0x100000001;
                      }
                    }
                  }
                  else
                  {
                    *(_QWORD *)v113 = 0;
                    v121[0] = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v17 = 0;
                    v18 = 0;
                    v19 = 0;
                    v115 = 0;
                    *(_QWORD *)v116 = 0x100000001;
                    v114 = 0x100000001;
                    *(_DWORD *)&v113[16] = 1;
                    v11 = 1;
                    v12 = 1;
                    *(_QWORD *)&v113[8] = 0x100000000;
                    v111 = 0x100000001;
                    v112 = 0x100000001;
                  }
                }
                else
                {
                  *(_QWORD *)v113 = 0;
                  v121[0] = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  v18 = 0;
                  v19 = 0;
                  v115 = 0;
                  *(_QWORD *)v116 = 0x100000001;
                  v114 = 0x100000001;
                  *(_DWORD *)&v113[16] = 1;
                  v11 = 1;
                  v12 = 1;
                  *(_QWORD *)&v113[8] = 0x100000000;
                  v111 = 0x100000001;
                  v112 = 0x100000001;
                  LODWORD(v121[1]) = 1;
                }
              }
            }
            else
            {
              v111 = 0x100000000;
              v112 = 0x100000000;
              *(_QWORD *)((char *)v121 + 4) = 0;
              *(_QWORD *)v113 = 0;
              v13 = 0;
              LODWORD(v121[0]) = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v19 = 0;
              v115 = 0;
              *(_QWORD *)v116 = 0x100000001;
              v114 = 0x100000001;
              *(_DWORD *)&v113[16] = 1;
              v11 = 1;
              v12 = 1;
              *(_QWORD *)&v113[8] = 0x100000000;
            }
          }
          else
          {
            v111 = 0x100000000;
            v112 = 0x100000000;
            *(_QWORD *)((char *)v121 + 4) = 0;
            *(_QWORD *)v113 = 0;
            v13 = 0;
            LODWORD(v121[0]) = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v115 = 0;
            *(_QWORD *)v116 = 0x100000001;
            v114 = 0x100000001;
            *(_DWORD *)&v113[16] = 1;
            v11 = 1;
            v12 = 1;
            *(_QWORD *)&v113[8] = 0x100000000;
            HIDWORD(v121[1]) = 1;
          }
        }
      }
      else
      {
        v111 = 0;
        v112 = 0;
        v121[0] = 0;
        v121[1] = 0;
        *(_QWORD *)v113 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v115 = 0;
        *(_QWORD *)v116 = 0x100000001;
        v114 = 0x100000001;
        *(_DWORD *)&v113[16] = 1;
        v11 = 1;
        v12 = 1;
        *(_QWORD *)&v113[8] = 0x100000000;
        LODWORD(v121[2]) = 1;
      }
    }
  }
  else
  {
    *(_QWORD *)&v113[8] = 0;
    v111 = 0;
    v112 = 0;
    *(_QWORD *)v113 = 0;
    v13 = 0;
    memset(v121, 0, 20);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v115 = 0;
    *(_QWORD *)v116 = 0x100000001;
    v114 = 0x100000000;
    *(_DWORD *)&v113[16] = 1;
    v11 = 1;
    v12 = 1;
  }
LABEL_16:
  if (v18)
  {
    v24 = v14;
    v25 = v13;
    v26 = v15;
    v27 = v16;
    v28 = v12;
    v29 = v11;
    v30 = v17;

    v17 = v30;
    v11 = v29;
    v12 = v28;
    v16 = v27;
    v15 = v26;
    v13 = v25;
    v14 = v24;
  }
  if (v17)

  if (v16)
  {

  }
  if (v115)
  {

    if (!v15)
      goto LABEL_24;
  }
  else if (!v15)
  {
LABEL_24:
    if (!v14)
      goto LABEL_26;
    goto LABEL_25;
  }

  if (v14)
  {
LABEL_25:

  }
LABEL_26:
  if (LODWORD(v121[0]))
  {

  }
  if (v13)

  if (*(_DWORD *)&v113[4])
  {

  }
  if (HIDWORD(v121[0]))
  {

  }
  if (*(_DWORD *)&v113[8])

  if (*(_DWORD *)v113)
  {

  }
  if (LODWORD(v121[1]))
  {

  }
  if ((_DWORD)v112)

  if ((_DWORD)v111)
  {

  }
  if (HIDWORD(v121[1]))
  {

  }
  if (HIDWORD(v112))

  if (HIDWORD(v111))
  {

  }
  if (LODWORD(v121[2]))
  {

  }
  if ((_DWORD)v114)

  if (*(_DWORD *)&v113[12])
  {

  }
  if (HIDWORD(v121[2]))
  {

    if (!v12)
      goto LABEL_58;
LABEL_82:

    if (!v11)
      goto LABEL_60;
    goto LABEL_59;
  }
  if (v12)
    goto LABEL_82;
LABEL_58:
  if (v11)
  {
LABEL_59:

  }
LABEL_60:
  if (LODWORD(v121[3]))
  {

  }
  if (*(_DWORD *)&v113[16])

  if (HIDWORD(v114))
  {

  }
  if (HIDWORD(v121[3]))
  {

  }
  if (*(_DWORD *)v116)

  if (*(_DWORD *)&v116[4])
  {

  }
  if (*(_DWORD *)&v116[8])
  {

  }
  if (v118 != v117)

LABEL_77:
  return v19;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SFSuggestionCardSection;
  v3 = -[SFCardSection hash](&v33, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v32, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v31, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v30, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFSuggestionCardSection type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SFSuggestionCardSection suggestionText](self, "suggestionText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = -[SFSuggestionCardSection isContact](self, "isContact");
  -[SFSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  v20 = v19 ^ -[SFSuggestionCardSection suggestionType](self, "suggestionType");
  -[SFSuggestionCardSection detailText](self, "detailText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFSuggestionCardSection thumbnail](self, "thumbnail");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  -[SFSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v16 ^ v24 ^ objc_msgSend(v25, "hash");
  -[SFSuggestionCardSection trailingBottomText](self, "trailingBottomText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26 ^ objc_msgSend(v27, "hash");

  return v28;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (SFRichText)suggestionText
{
  return self->_suggestionText;
}

- (void)setSuggestionText:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionText, a3);
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (NSString)scopedSearchSectionBundleIdentifier
{
  return self->_scopedSearchSectionBundleIdentifier;
}

- (void)setScopedSearchSectionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (SFRichText)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_scopedSearchSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionText, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
