@implementation SFMediaInfoCardSection

- (SFMediaInfoCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFMediaInfoCardSection *v5;
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
  SFMediaItem *v25;
  void *v26;
  SFMediaItem *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  SFMediaDetail *v35;
  void *v36;
  SFActionItem *v37;
  void *v38;
  SFActionItem *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  SFMediaOffer *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  SFRichText *v57;
  void *v58;
  SFRichText *v59;
  SFMediaInfoCardSection *v60;
  SFMediaInfoCardSection *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)SFMediaInfoCardSection;
  v5 = -[SFCardSection init](&v75, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v72 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
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
      -[SFMediaInfoCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "mediaItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFMediaItem alloc];
      objc_msgSend(v4, "mediaItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFMediaItem initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFMediaInfoCardSection setMediaItem:](v5, "setMediaItem:", v27);

    }
    objc_msgSend(v4, "details");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v29 = 0;

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v4, "details");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v68 != v33)
            objc_enumerationMutation(v30);
          v35 = -[SFMediaDetail initWithProtobuf:]([SFMediaDetail alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
          if (v35)
            objc_msgSend(v29, "addObject:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      }
      while (v32);
    }

    -[SFMediaInfoCardSection setDetails:](v5, "setDetails:", v29);
    objc_msgSend(v4, "playAction");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [SFActionItem alloc];
      objc_msgSend(v4, "playAction");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SFActionItem initWithProtobuf:](v37, "initWithProtobuf:", v38);
      -[SFMediaInfoCardSection setPlayAction:](v5, "setPlayAction:", v39);

    }
    objc_msgSend(v4, "offers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v5;
    if (v40)
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v41 = 0;

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v4, "offers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v64 != v45)
            objc_enumerationMutation(v42);
          v47 = -[SFMediaOffer initWithProtobuf:]([SFMediaOffer alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
          if (v47)
            objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      }
      while (v44);
    }

    v5 = v62;
    -[SFMediaInfoCardSection setOffers:](v62, "setOffers:", v41);
    objc_msgSend(v4, "watchListIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v4, "watchListIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaInfoCardSection setWatchListIdentifier:](v62, "setWatchListIdentifier:", v49);

    }
    objc_msgSend(v4, "watchListButtonLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v4, "watchListButtonLabel");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaInfoCardSection setWatchListButtonLabel:](v62, "setWatchListButtonLabel:", v51);

    }
    objc_msgSend(v4, "watchListContinuationText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v4, "watchListContinuationText");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaInfoCardSection setWatchListContinuationText:](v62, "setWatchListContinuationText:", v53);

    }
    objc_msgSend(v4, "watchListConfirmationText");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v4, "watchListConfirmationText");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaInfoCardSection setWatchListConfirmationText:](v62, "setWatchListConfirmationText:", v55);

    }
    if (objc_msgSend(v4, "isMediaContainer"))
      -[SFMediaInfoCardSection setIsMediaContainer:](v62, "setIsMediaContainer:", objc_msgSend(v4, "isMediaContainer"));
    objc_msgSend(v4, "specialOfferButtonLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [SFRichText alloc];
      objc_msgSend(v4, "specialOfferButtonLabel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[SFRichText initWithProtobuf:](v57, "initWithProtobuf:", v58);
      -[SFMediaInfoCardSection setSpecialOfferButtonLabel:](v62, "setSpecialOfferButtonLabel:", v59);

    }
    if (objc_msgSend(v4, "watchListItemType"))
      -[SFMediaInfoCardSection setWatchListItemType:](v62, "setWatchListItemType:", objc_msgSend(v4, "watchListItemType"));
    v60 = v62;

  }
  return v5;
}

- (void)setIsMediaContainer:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isMediaContainer = a3;
}

- (BOOL)hasIsMediaContainer
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWatchListItemType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_watchListItemType = a3;
}

- (BOOL)hasWatchListItemType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFMediaInfoCardSection)initWithCoder:(id)a3
{
  id v4;
  SFMediaInfoCardSection *v5;
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
  void *v40;
  void *v41;
  void *v42;

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
    -[SFMediaInfoCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection mediaItem](v8, "mediaItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setMediaItem:](v5, "setMediaItem:", v14);

    -[SFCardSection details](v8, "details");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setDetails:](v5, "setDetails:", v15);

    -[SFCardSection playAction](v8, "playAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setPlayAction:](v5, "setPlayAction:", v16);

    -[SFCardSection offers](v8, "offers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setOffers:](v5, "setOffers:", v17);

    -[SFCardSection watchListIdentifier](v8, "watchListIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setWatchListIdentifier:](v5, "setWatchListIdentifier:", v18);

    -[SFCardSection watchListButtonLabel](v8, "watchListButtonLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setWatchListButtonLabel:](v5, "setWatchListButtonLabel:", v19);

    -[SFCardSection watchListContinuationText](v8, "watchListContinuationText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setWatchListContinuationText:](v5, "setWatchListContinuationText:", v20);

    -[SFCardSection watchListConfirmationText](v8, "watchListConfirmationText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setWatchListConfirmationText:](v5, "setWatchListConfirmationText:", v21);

    -[SFMediaInfoCardSection setIsMediaContainer:](v5, "setIsMediaContainer:", -[SFCardSection isMediaContainer](v8, "isMediaContainer"));
    -[SFCardSection specialOfferButtonLabel](v8, "specialOfferButtonLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaInfoCardSection setSpecialOfferButtonLabel:](v5, "setSpecialOfferButtonLabel:", v22);

    -[SFMediaInfoCardSection setWatchListItemType:](v5, "setWatchListItemType:", -[SFCardSection watchListItemType](v8, "watchListItemType"));
    -[SFCardSection nextCard](v8, "nextCard");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v23);

    -[SFCardSection commands](v8, "commands");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v24);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v25);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v26);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v27);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v28);

    -[SFCardSection command](v8, "command");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v29);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v30);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v31);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v32);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v33);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v34);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v35);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v36);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v37);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v38);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v39);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v40);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v41);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v42);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMediaInfoCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMediaInfoCardSection *v2;
  void *v3;

  v2 = -[_SFPBMediaInfoCardSection initWithFacade:]([_SFPBMediaInfoCardSection alloc], "initWithFacade:", self);
  -[_SFPBMediaInfoCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMediaInfoCardSection *v2;
  void *v3;

  v2 = -[_SFPBMediaInfoCardSection initWithFacade:]([_SFPBMediaInfoCardSection alloc], "initWithFacade:", self);
  -[_SFPBMediaInfoCardSection jsonData](v2, "jsonData");
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)SFMediaInfoCardSection;
  v4 = -[SFCardSection copyWithZone:](&v34, sel_copyWithZone_, a3);
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
  -[SFMediaInfoCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFMediaInfoCardSection mediaItem](self, "mediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setMediaItem:", v16);

  -[SFMediaInfoCardSection details](self, "details");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setDetails:", v18);

  -[SFMediaInfoCardSection playAction](self, "playAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setPlayAction:", v20);

  -[SFMediaInfoCardSection offers](self, "offers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setOffers:", v22);

  -[SFMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setWatchListIdentifier:", v24);

  -[SFMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setWatchListButtonLabel:", v26);

  -[SFMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setWatchListContinuationText:", v28);

  -[SFMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setWatchListConfirmationText:", v30);

  objc_msgSend(v4, "setIsMediaContainer:", -[SFMediaInfoCardSection isMediaContainer](self, "isMediaContainer"));
  -[SFMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setSpecialOfferButtonLabel:", v32);

  objc_msgSend(v4, "setWatchListItemType:", -[SFMediaInfoCardSection watchListItemType](self, "watchListItemType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  SFMediaInfoCardSection *v7;
  SFMediaInfoCardSection *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  _BOOL4 v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  SFMediaInfoCardSection *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  SFMediaInfoCardSection *v34;
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
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  _BYTE v109[12];
  _BYTE v110[12];
  _BYTE v111[36];
  int v112;
  int v113;
  id v114;
  id v115;
  uint64_t v116;
  _BOOL4 v117;
  _BOOL4 v118;
  _BOOL4 v119;
  _BOOL4 v120;
  __int128 v121;
  objc_super v122;

  v7 = (SFMediaInfoCardSection *)a3;
  if (self == v7)
  {
    v15 = 1;
    goto LABEL_99;
  }
  if (!-[SFMediaInfoCardSection isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class())
    || (v122.receiver = self,
        v122.super_class = (Class)SFMediaInfoCardSection,
        !-[SFCardSection isEqual:](&v122, sel_isEqual_, v7)))
  {
    v15 = 0;
    goto LABEL_99;
  }
  v8 = v7;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v8, "punchoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;
  v114 = v10;
  v115 = v9;
  v112 = v11;
  v113 = v9 == 0;
  if (v113 == (_DWORD)v11)
  {
    v121 = 0uLL;
    memset(v111, 0, sizeof(v111));
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v107 = 0;
    v101 = 0;
    v106 = 0;
    v120 = 0;
    v99 = 0;
    v104 = 0;
    v119 = 0;
    v98 = 0;
    v103 = 0;
    v118 = 0;
    v100 = 0;
    v105 = 0;
    v117 = 0;
    v102 = 0;
    v108 = 0;
    v116 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  else
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    v5 = v3 != 0;
    v97 = (void *)v3;
    if (!v3
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v4 = objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v8, "punchoutOptions"),
          v93 = (void *)objc_claimAutoreleasedReturnValue(),
          v94 = (void *)v4,
          objc_msgSend((id)v4, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v4 = objc_claimAutoreleasedReturnValue();
      v3 = v4 == 0;
      -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = (void *)v4;
      *(_DWORD *)&v111[32] = v5;
      if ((_DWORD)v3 == (v95 != 0))
      {
        v121 = 0uLL;
        *(_QWORD *)&v111[24] = 0;
        memset(v111, 0, 20);
        memset(v109, 0, sizeof(v109));
        memset(v110, 0, sizeof(v110));
        v107 = 0;
        v101 = 0;
        v106 = 0;
        v120 = 0;
        v99 = 0;
        v104 = 0;
        v119 = 0;
        v98 = 0;
        v103 = 0;
        v118 = 0;
        v100 = 0;
        v105 = 0;
        v117 = 0;
        v102 = 0;
        v108 = 0;
        v116 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        *(_DWORD *)&v111[20] = 1;
      }
      else
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v16 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v121) = v16 != 0;
        v92 = (void *)v16;
        if (!v16
          || (-[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle"),
              v3 = objc_claimAutoreleasedReturnValue(),
              -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle"),
              v88 = (void *)objc_claimAutoreleasedReturnValue(),
              v89 = (void *)v3,
              objc_msgSend((id)v3, "isEqual:")))
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v91 == 0;
          -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v3 != (v90 != 0))
          {
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v19 = objc_claimAutoreleasedReturnValue();
            v3 = v19 != 0;
            v87 = (void *)v19;
            if (v19)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = v8;
              v22 = (void *)v20;
              v34 = v21;
              -[SFCardSection punchoutPickerDismissText](v21, "punchoutPickerDismissText");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v22;
              if (!objc_msgSend(v22, "isEqual:"))
              {
                *(_QWORD *)&v111[4] = 0;
                *(_QWORD *)&v111[24] = 0x100000000;
                *(_QWORD *)v110 = 0;
                *(_DWORD *)v111 = 0;
                *(_QWORD *)((char *)&v121 + 4) = 0;
                memset(v109, 0, sizeof(v109));
                v107 = 0;
                LODWORD(v121) = 0;
                v101 = 0;
                v106 = 0;
                v120 = 0;
                v99 = 0;
                v104 = 0;
                v119 = 0;
                v98 = 0;
                v103 = 0;
                v118 = 0;
                v100 = 0;
                v105 = 0;
                v117 = 0;
                v102 = 0;
                v108 = 0;
                v116 = 0;
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                *(_QWORD *)&v111[16] = 0x100000001;
                *(_DWORD *)&v111[12] = 1;
                *(_DWORD *)&v110[8] = 1;
                v8 = v34;
                goto LABEL_16;
              }
              v8 = v34;
            }
            v4 = -[SFCardSection canBeHidden](self, "canBeHidden");
            *(_DWORD *)&v111[28] = v3;
            if ((_DWORD)v4 == -[SFCardSection canBeHidden](v8, "canBeHidden")
              && (v4 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  (_DWORD)v4 == -[SFCardSection hasTopPadding](v8, "hasTopPadding"))
              && (v4 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  (_DWORD)v4 == -[SFCardSection hasBottomPadding](v8, "hasBottomPadding")))
            {
              -[SFMediaInfoCardSection type](self, "type");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = v84 == 0;
              -[SFMediaInfoCardSection type](v8, "type");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              if ((_DWORD)v3 == (v83 != 0))
              {
                *(_QWORD *)v111 = 0;
                *(_DWORD *)&v111[24] = 0;
                *(_QWORD *)v110 = 0;
                *(_QWORD *)((char *)&v121 + 4) = 0;
                memset(v109, 0, sizeof(v109));
                v107 = 0;
                LODWORD(v121) = 0;
                v101 = 0;
                v106 = 0;
                v120 = 0;
                v99 = 0;
                v104 = 0;
                v119 = 0;
                v98 = 0;
                v103 = 0;
                v118 = 0;
                v100 = 0;
                v105 = 0;
                v117 = 0;
                v102 = 0;
                v108 = 0;
                v116 = 0;
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                *(_QWORD *)&v111[16] = 0x100000001;
                *(_DWORD *)&v110[8] = 1;
                *(_QWORD *)&v111[8] = 0x100000001;
              }
              else
              {
                -[SFMediaInfoCardSection type](self, "type");
                v23 = objc_claimAutoreleasedReturnValue();
                v3 = v23 != 0;
                v82 = (void *)v23;
                if (!v23
                  || (-[SFMediaInfoCardSection type](self, "type"),
                      v4 = objc_claimAutoreleasedReturnValue(),
                      -[SFMediaInfoCardSection type](v8, "type"),
                      v80 = (void *)objc_claimAutoreleasedReturnValue(),
                      v81 = (void *)v4,
                      objc_msgSend((id)v4, "isEqual:")))
                {
                  *(_DWORD *)&v111[24] = v3;
                  v4 = -[SFCardSection separatorStyle](self, "separatorStyle");
                  if ((_DWORD)v4 == -[SFCardSection separatorStyle](v8, "separatorStyle"))
                  {
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v3 = v79 == 0;
                    -[SFCardSection backgroundColor](v8, "backgroundColor");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((_DWORD)v3 == (v78 != 0))
                    {
                      *(_QWORD *)v111 = 0x100000000;
                      *(_QWORD *)((char *)&v121 + 4) = 0;
                      memset(v109, 0, sizeof(v109));
                      *(_QWORD *)v110 = 0x100000000;
                      v107 = 0;
                      LODWORD(v121) = 0;
                      v101 = 0;
                      v106 = 0;
                      v120 = 0;
                      v99 = 0;
                      v104 = 0;
                      v119 = 0;
                      v98 = 0;
                      v103 = 0;
                      v118 = 0;
                      v100 = 0;
                      v105 = 0;
                      v117 = 0;
                      v102 = 0;
                      v108 = 0;
                      v116 = 0;
                      v12 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      *(_QWORD *)&v111[16] = 0x100000001;
                      *(_QWORD *)&v111[8] = 0x100000001;
                      *(_DWORD *)&v110[8] = 1;
                    }
                    else
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v24 = objc_claimAutoreleasedReturnValue();
                      DWORD2(v121) = v24 != 0;
                      v77 = (void *)v24;
                      if (!v24
                        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                            v3 = objc_claimAutoreleasedReturnValue(),
                            -[SFCardSection backgroundColor](v8, "backgroundColor"),
                            v73 = (void *)objc_claimAutoreleasedReturnValue(),
                            v74 = (void *)v3,
                            objc_msgSend((id)v3, "isEqual:")))
                      {
                        -[SFMediaInfoCardSection mediaItem](self, "mediaItem");
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        v3 = v76 == 0;
                        -[SFMediaInfoCardSection mediaItem](v8, "mediaItem");
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((_DWORD)v3 == (v75 != 0))
                        {
                          *(_DWORD *)v110 = 0;
                          *(_QWORD *)&v121 = 0;
                          v107 = 0;
                          *(_DWORD *)v109 = 0;
                          v101 = 0;
                          v106 = 0;
                          v120 = 0;
                          v99 = 0;
                          v104 = 0;
                          v119 = 0;
                          v98 = 0;
                          v103 = 0;
                          v118 = 0;
                          v100 = 0;
                          v105 = 0;
                          v117 = 0;
                          v102 = 0;
                          v108 = 0;
                          v116 = 0;
                          v12 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          *(_DWORD *)&v111[16] = 1;
                          *(_DWORD *)&v111[20] = 1;
                          *(_DWORD *)&v111[8] = 1;
                          *(_DWORD *)&v111[12] = 1;
                          *(_DWORD *)&v110[4] = 1;
                          *(_DWORD *)&v110[8] = 1;
                          *(_DWORD *)v111 = 1;
                          *(_DWORD *)&v111[4] = 1;
                          *(_QWORD *)&v109[4] = 1;
                        }
                        else
                        {
                          -[SFMediaInfoCardSection mediaItem](self, "mediaItem");
                          v25 = objc_claimAutoreleasedReturnValue();
                          DWORD1(v121) = v25 != 0;
                          v72 = (void *)v25;
                          if (!v25
                            || (-[SFMediaInfoCardSection mediaItem](self, "mediaItem"),
                                v3 = objc_claimAutoreleasedReturnValue(),
                                -[SFMediaInfoCardSection mediaItem](v8, "mediaItem"),
                                v68 = (void *)objc_claimAutoreleasedReturnValue(),
                                v69 = (void *)v3,
                                objc_msgSend((id)v3, "isEqual:")))
                          {
                            -[SFMediaInfoCardSection details](self, "details");
                            v71 = (void *)objc_claimAutoreleasedReturnValue();
                            v3 = v71 == 0;
                            -[SFMediaInfoCardSection details](v8, "details");
                            v70 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((_DWORD)v3 == (v70 != 0))
                            {
                              *(_DWORD *)v109 = 0;
                              LODWORD(v121) = 0;
                              v101 = 0;
                              v106 = 0;
                              v120 = 0;
                              v99 = 0;
                              v104 = 0;
                              v119 = 0;
                              v98 = 0;
                              v103 = 0;
                              v118 = 0;
                              v100 = 0;
                              v105 = 0;
                              v117 = 0;
                              v102 = 0;
                              v108 = 0;
                              v116 = 0;
                              v12 = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              *(_DWORD *)&v111[16] = 1;
                              *(_DWORD *)&v111[20] = 1;
                              *(_DWORD *)&v111[8] = 1;
                              *(_DWORD *)&v111[12] = 1;
                              *(_DWORD *)&v110[4] = 1;
                              *(_DWORD *)&v110[8] = 1;
                              *(_DWORD *)v111 = 1;
                              *(_DWORD *)&v111[4] = 1;
                              *(_DWORD *)&v109[4] = 1;
                              *(_DWORD *)&v109[8] = 0;
                              *(_DWORD *)v110 = 1;
                              v107 = 1;
                            }
                            else
                            {
                              -[SFMediaInfoCardSection details](self, "details");
                              v26 = objc_claimAutoreleasedReturnValue();
                              LODWORD(v121) = v26 != 0;
                              v67 = (void *)v26;
                              if (!v26
                                || (-[SFMediaInfoCardSection details](self, "details"),
                                    v3 = objc_claimAutoreleasedReturnValue(),
                                    -[SFMediaInfoCardSection details](v8, "details"),
                                    v63 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v64 = (void *)v3,
                                    objc_msgSend((id)v3, "isEqual:")))
                              {
                                -[SFMediaInfoCardSection playAction](self, "playAction");
                                v66 = (void *)objc_claimAutoreleasedReturnValue();
                                v3 = v66 == 0;
                                -[SFMediaInfoCardSection playAction](v8, "playAction");
                                v65 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((_DWORD)v3 == (v65 != 0))
                                {
                                  v106 = 0;
                                  v120 = 0;
                                  v99 = 0;
                                  v104 = 0;
                                  v119 = 0;
                                  v98 = 0;
                                  v103 = 0;
                                  v118 = 0;
                                  v100 = 0;
                                  v105 = 0;
                                  v117 = 0;
                                  v102 = 0;
                                  v108 = 0;
                                  v116 = 0;
                                  v12 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  *(_DWORD *)&v111[16] = 1;
                                  *(_DWORD *)&v111[20] = 1;
                                  *(_DWORD *)&v111[8] = 1;
                                  *(_DWORD *)&v111[12] = 1;
                                  *(_DWORD *)&v110[4] = 1;
                                  *(_DWORD *)&v110[8] = 1;
                                  *(_DWORD *)v111 = 1;
                                  *(_DWORD *)&v111[4] = 1;
                                  *(_DWORD *)&v109[4] = 1;
                                  *(_DWORD *)&v109[8] = 0;
                                  *(_DWORD *)v110 = 1;
                                  v107 = 1;
                                  *(_DWORD *)v109 = 1;
                                  v101 = 1;
                                }
                                else
                                {
                                  -[SFMediaInfoCardSection playAction](self, "playAction");
                                  v27 = objc_claimAutoreleasedReturnValue();
                                  v120 = v27 != 0;
                                  v62 = (void *)v27;
                                  if (!v27
                                    || (-[SFMediaInfoCardSection playAction](self, "playAction"),
                                        v3 = objc_claimAutoreleasedReturnValue(),
                                        -[SFMediaInfoCardSection playAction](v8, "playAction"),
                                        v58 = (void *)objc_claimAutoreleasedReturnValue(),
                                        v59 = (void *)v3,
                                        objc_msgSend((id)v3, "isEqual:")))
                                  {
                                    -[SFMediaInfoCardSection offers](self, "offers");
                                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                                    v3 = v61 == 0;
                                    -[SFMediaInfoCardSection offers](v8, "offers");
                                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                                    if ((_DWORD)v3 == (v60 != 0))
                                    {
                                      v104 = 0;
                                      v119 = 0;
                                      v98 = 0;
                                      v103 = 0;
                                      v118 = 0;
                                      v100 = 0;
                                      v105 = 0;
                                      v117 = 0;
                                      v102 = 0;
                                      v108 = 0;
                                      v116 = 0;
                                      v12 = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      *(_DWORD *)&v111[16] = 1;
                                      *(_DWORD *)&v111[20] = 1;
                                      *(_DWORD *)&v111[8] = 1;
                                      *(_DWORD *)&v111[12] = 1;
                                      *(_DWORD *)&v110[4] = 1;
                                      *(_DWORD *)&v110[8] = 1;
                                      *(_DWORD *)v111 = 1;
                                      *(_DWORD *)&v111[4] = 1;
                                      *(_DWORD *)&v109[4] = 1;
                                      *(_DWORD *)&v109[8] = 0;
                                      *(_DWORD *)v110 = 1;
                                      v107 = 1;
                                      *(_DWORD *)v109 = 1;
                                      v101 = 1;
                                      v106 = 1;
                                      v99 = 1;
                                    }
                                    else
                                    {
                                      -[SFMediaInfoCardSection offers](self, "offers");
                                      v28 = objc_claimAutoreleasedReturnValue();
                                      v119 = v28 != 0;
                                      v57 = (void *)v28;
                                      if (!v28
                                        || (-[SFMediaInfoCardSection offers](self, "offers"),
                                            v3 = objc_claimAutoreleasedReturnValue(),
                                            -[SFMediaInfoCardSection offers](v8, "offers"),
                                            v53 = (void *)objc_claimAutoreleasedReturnValue(),
                                            v54 = (void *)v3,
                                            objc_msgSend((id)v3, "isEqual:")))
                                      {
                                        -[SFMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
                                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                                        v3 = v56 == 0;
                                        -[SFMediaInfoCardSection watchListIdentifier](v8, "watchListIdentifier");
                                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                                        if ((_DWORD)v3 == (v55 != 0))
                                        {
                                          v103 = 0;
                                          v118 = 0;
                                          v100 = 0;
                                          v105 = 0;
                                          v117 = 0;
                                          v102 = 0;
                                          v108 = 0;
                                          v116 = 0;
                                          v12 = 0;
                                          v13 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          *(_DWORD *)&v111[16] = 1;
                                          *(_DWORD *)&v111[20] = 1;
                                          *(_DWORD *)&v111[8] = 1;
                                          *(_DWORD *)&v111[12] = 1;
                                          *(_DWORD *)&v110[4] = 1;
                                          *(_DWORD *)&v110[8] = 1;
                                          *(_DWORD *)v111 = 1;
                                          *(_DWORD *)&v111[4] = 1;
                                          *(_DWORD *)&v109[4] = 1;
                                          *(_DWORD *)&v109[8] = 0;
                                          *(_DWORD *)v110 = 1;
                                          v107 = 1;
                                          *(_DWORD *)v109 = 1;
                                          v101 = 1;
                                          v106 = 1;
                                          v99 = 1;
                                          v104 = 1;
                                          v98 = 1;
                                        }
                                        else
                                        {
                                          -[SFMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
                                          v29 = objc_claimAutoreleasedReturnValue();
                                          v118 = v29 != 0;
                                          v52 = (void *)v29;
                                          if (!v29
                                            || (-[SFMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier"), v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListIdentifier](v8, "watchListIdentifier"), v48 = (void *)objc_claimAutoreleasedReturnValue(), v49 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                          {
                                            -[SFMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
                                            v51 = (void *)objc_claimAutoreleasedReturnValue();
                                            v3 = v51 == 0;
                                            -[SFMediaInfoCardSection watchListButtonLabel](v8, "watchListButtonLabel");
                                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                                            if ((_DWORD)v3 == (v50 != 0))
                                            {
                                              v105 = 0;
                                              v117 = 0;
                                              v102 = 0;
                                              v108 = 0;
                                              v116 = 0;
                                              v12 = 0;
                                              v13 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              *(_DWORD *)&v111[16] = 1;
                                              *(_DWORD *)&v111[20] = 1;
                                              *(_DWORD *)&v111[8] = 1;
                                              *(_DWORD *)&v111[12] = 1;
                                              *(_DWORD *)&v110[4] = 1;
                                              *(_DWORD *)&v110[8] = 1;
                                              *(_DWORD *)v111 = 1;
                                              *(_DWORD *)&v111[4] = 1;
                                              *(_DWORD *)&v109[4] = 1;
                                              *(_DWORD *)&v109[8] = 0;
                                              *(_DWORD *)v110 = 1;
                                              v107 = 1;
                                              *(_DWORD *)v109 = 1;
                                              v101 = 1;
                                              v106 = 1;
                                              v99 = 1;
                                              v104 = 1;
                                              v98 = 1;
                                              v103 = 1;
                                              v100 = 1;
                                            }
                                            else
                                            {
                                              -[SFMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
                                              v30 = objc_claimAutoreleasedReturnValue();
                                              v117 = v30 != 0;
                                              v47 = (void *)v30;
                                              if (!v30
                                                || (-[SFMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel"), v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListButtonLabel](v8, "watchListButtonLabel"), v43 = (void *)objc_claimAutoreleasedReturnValue(), v44 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                              {
                                                -[SFMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
                                                v46 = (void *)objc_claimAutoreleasedReturnValue();
                                                v3 = v46 == 0;
                                                -[SFMediaInfoCardSection watchListContinuationText](v8, "watchListContinuationText");
                                                v45 = (void *)objc_claimAutoreleasedReturnValue();
                                                if ((_DWORD)v3 == (v45 != 0))
                                                {
                                                  v108 = 0;
                                                  v116 = 0;
                                                  v12 = 0;
                                                  v13 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  *(_DWORD *)&v111[16] = 1;
                                                  *(_DWORD *)&v111[20] = 1;
                                                  *(_DWORD *)&v111[8] = 1;
                                                  *(_DWORD *)&v111[12] = 1;
                                                  *(_DWORD *)&v110[4] = 1;
                                                  *(_DWORD *)&v110[8] = 1;
                                                  *(_DWORD *)v111 = 1;
                                                  *(_DWORD *)&v111[4] = 1;
                                                  *(_DWORD *)&v109[4] = 1;
                                                  *(_DWORD *)&v109[8] = 0;
                                                  *(_DWORD *)v110 = 1;
                                                  v107 = 1;
                                                  *(_DWORD *)v109 = 1;
                                                  v101 = 1;
                                                  v106 = 1;
                                                  v99 = 1;
                                                  v104 = 1;
                                                  v98 = 1;
                                                  v103 = 1;
                                                  v100 = 1;
                                                  v105 = 1;
                                                  v102 = 1;
                                                }
                                                else
                                                {
                                                  -[SFMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
                                                  v31 = objc_claimAutoreleasedReturnValue();
                                                  HIDWORD(v116) = v31 != 0;
                                                  v42 = (void *)v31;
                                                  if (!v31
                                                    || (-[SFMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText"), v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListContinuationText](v8, "watchListContinuationText"), v38 = (void *)objc_claimAutoreleasedReturnValue(), v39 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                  {
                                                    -[SFMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
                                                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v3 = v41 == 0;
                                                    -[SFMediaInfoCardSection watchListConfirmationText](v8, "watchListConfirmationText");
                                                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if ((_DWORD)v3 == (v40 != 0))
                                                    {
                                                      LODWORD(v116) = 0;
                                                      v12 = 0;
                                                      v13 = 0;
                                                      v14 = 0;
                                                      v15 = 0;
                                                      *(_QWORD *)&v111[16] = 0x100000001;
                                                      *(_QWORD *)&v111[8] = 0x100000001;
                                                      *(_DWORD *)&v110[8] = 1;
                                                      *(_QWORD *)v111 = 0x100000001;
                                                      *(_QWORD *)&v109[4] = 1;
                                                      *(_QWORD *)v110 = 0x100000001;
                                                      v107 = 1;
                                                      *(_DWORD *)v109 = 1;
                                                      v101 = 1;
                                                      v106 = 1;
                                                      v99 = 1;
                                                      v104 = 1;
                                                      v98 = 1;
                                                      v103 = 1;
                                                      v100 = 1;
                                                      v105 = 1;
                                                      v102 = 1;
                                                      v108 = 0x100000001;
                                                    }
                                                    else
                                                    {
                                                      -[SFMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
                                                      v32 = objc_claimAutoreleasedReturnValue();
                                                      LODWORD(v116) = v32 != 0;
                                                      v37 = (void *)v32;
                                                      if (!v32
                                                        || (-[SFMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText"), v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListConfirmationText](v8, "watchListConfirmationText"), v35 = (void *)objc_claimAutoreleasedReturnValue(), v36 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                      {
                                                        v4 = -[SFMediaInfoCardSection isMediaContainer](self, "isMediaContainer");
                                                        if ((_DWORD)v4 == -[SFMediaInfoCardSection isMediaContainer](v8, "isMediaContainer"))
                                                        {
                                                          -[SFMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
                                                          v3 = objc_claimAutoreleasedReturnValue();
                                                          -[SFMediaInfoCardSection specialOfferButtonLabel](v8, "specialOfferButtonLabel");
                                                          v4 = objc_claimAutoreleasedReturnValue();
                                                          if ((v3 == 0) == (v4 != 0))
                                                          {
                                                            v13 = 0;
                                                            v14 = 0;
                                                            v15 = 0;
                                                            *(_QWORD *)&v111[16] = 0x100000001;
                                                            *(_QWORD *)&v111[8] = 0x100000001;
                                                            *(_DWORD *)&v110[8] = 1;
                                                            *(_QWORD *)v111 = 0x100000001;
                                                            *(_QWORD *)v109 = 0x100000001;
                                                            *(_QWORD *)v110 = 0x100000001;
                                                            v107 = 1;
                                                            v101 = 1;
                                                            v106 = 1;
                                                            v99 = 1;
                                                            v104 = 1;
                                                            v98 = 1;
                                                            v103 = 1;
                                                            v100 = 1;
                                                            v105 = 1;
                                                            v102 = 1;
                                                            v108 = 0x100000001;
                                                            *(_DWORD *)&v109[8] = 1;
                                                            v12 = 1;
                                                          }
                                                          else
                                                          {
                                                            -[SFMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
                                                            v11 = objc_claimAutoreleasedReturnValue();
                                                            if (!v11
                                                              || (-[SFMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel"), v10 = (void *)objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection specialOfferButtonLabel](v8, "specialOfferButtonLabel"), v5 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v10, "isEqual:", v5)))
                                                            {
                                                              v33 = -[SFMediaInfoCardSection watchListItemType](self, "watchListItemType");
                                                              v15 = v33 == -[SFMediaInfoCardSection watchListItemType](v8, "watchListItemType");
                                                              *(_QWORD *)&v111[16] = 0x100000001;
                                                              *(_QWORD *)&v111[8] = 0x100000001;
                                                              *(_DWORD *)&v110[8] = 1;
                                                              *(_QWORD *)v111 = 0x100000001;
                                                              *(_QWORD *)v109 = 0x100000001;
                                                              *(_QWORD *)v110 = 0x100000001;
                                                              v107 = 1;
                                                              v101 = 1;
                                                              v106 = 1;
                                                              v99 = 1;
                                                              v104 = 1;
                                                              v98 = 1;
                                                              v103 = 1;
                                                              v100 = 1;
                                                              v105 = 1;
                                                              v102 = 1;
                                                              v108 = 0x100000001;
                                                              *(_DWORD *)&v109[8] = 1;
                                                              v12 = 1;
                                                              v13 = 1;
                                                              v14 = v11 != 0;
                                                            }
                                                            else
                                                            {
                                                              v15 = 0;
                                                              *(_QWORD *)&v111[16] = 0x100000001;
                                                              *(_QWORD *)&v111[8] = 0x100000001;
                                                              *(_DWORD *)&v110[8] = 1;
                                                              *(_QWORD *)v111 = 0x100000001;
                                                              *(_QWORD *)v109 = 0x100000001;
                                                              *(_QWORD *)v110 = 0x100000001;
                                                              v107 = 1;
                                                              v101 = 1;
                                                              v106 = 1;
                                                              v99 = 1;
                                                              v104 = 1;
                                                              v98 = 1;
                                                              v103 = 1;
                                                              v100 = 1;
                                                              v105 = 1;
                                                              v102 = 1;
                                                              v108 = 0x100000001;
                                                              *(_DWORD *)&v109[8] = 1;
                                                              v12 = 1;
                                                              v13 = 1;
                                                              v14 = 1;
                                                            }
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v12 = 0;
                                                          v13 = 0;
                                                          v14 = 0;
                                                          v15 = 0;
                                                          *(_QWORD *)&v111[16] = 0x100000001;
                                                          *(_QWORD *)&v111[8] = 0x100000001;
                                                          *(_DWORD *)&v110[8] = 1;
                                                          *(_QWORD *)v111 = 0x100000001;
                                                          *(_QWORD *)v109 = 0x100000001;
                                                          *(_QWORD *)v110 = 0x100000001;
                                                          v107 = 1;
                                                          v101 = 1;
                                                          v106 = 1;
                                                          v99 = 1;
                                                          v104 = 1;
                                                          v98 = 1;
                                                          v103 = 1;
                                                          v100 = 1;
                                                          v105 = 1;
                                                          v102 = 1;
                                                          v108 = 0x100000001;
                                                          *(_DWORD *)&v109[8] = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v12 = 0;
                                                        v13 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        *(_QWORD *)&v111[16] = 0x100000001;
                                                        *(_QWORD *)&v111[8] = 0x100000001;
                                                        *(_DWORD *)&v110[8] = 1;
                                                        *(_QWORD *)v111 = 0x100000001;
                                                        *(_QWORD *)v109 = 0x100000001;
                                                        *(_QWORD *)v110 = 0x100000001;
                                                        v107 = 1;
                                                        v101 = 1;
                                                        v106 = 1;
                                                        v99 = 1;
                                                        v104 = 1;
                                                        v98 = 1;
                                                        v103 = 1;
                                                        v100 = 1;
                                                        v105 = 1;
                                                        v102 = 1;
                                                        v108 = 0x100000001;
                                                        *(_DWORD *)&v109[8] = 1;
                                                        LODWORD(v116) = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v116 = 0x100000000;
                                                    v12 = 0;
                                                    v13 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    *(_QWORD *)&v111[16] = 0x100000001;
                                                    *(_QWORD *)&v111[8] = 0x100000001;
                                                    *(_DWORD *)&v110[8] = 1;
                                                    *(_QWORD *)v111 = 0x100000001;
                                                    *(_DWORD *)&v109[8] = 0;
                                                    *(_QWORD *)v110 = 0x100000001;
                                                    v107 = 1;
                                                    v108 = 0x100000000;
                                                    *(_QWORD *)v109 = 0x100000001;
                                                    v101 = 1;
                                                    v106 = 1;
                                                    v99 = 1;
                                                    v104 = 1;
                                                    v98 = 1;
                                                    v103 = 1;
                                                    v100 = 1;
                                                    v105 = 1;
                                                    v102 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                v102 = 0;
                                                v108 = 0;
                                                v116 = 0;
                                                v12 = 0;
                                                v13 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                *(_DWORD *)&v111[16] = 1;
                                                *(_DWORD *)&v111[20] = 1;
                                                *(_DWORD *)&v111[8] = 1;
                                                *(_DWORD *)&v111[12] = 1;
                                                *(_DWORD *)&v110[4] = 1;
                                                *(_DWORD *)&v110[8] = 1;
                                                *(_DWORD *)v111 = 1;
                                                *(_DWORD *)&v111[4] = 1;
                                                *(_DWORD *)&v109[4] = 1;
                                                *(_DWORD *)&v109[8] = 0;
                                                *(_DWORD *)v110 = 1;
                                                v107 = 1;
                                                *(_DWORD *)v109 = 1;
                                                v101 = 1;
                                                v106 = 1;
                                                v99 = 1;
                                                v104 = 1;
                                                v98 = 1;
                                                v103 = 1;
                                                v100 = 1;
                                                v105 = 1;
                                                v117 = 1;
                                              }
                                            }
                                          }
                                          else
                                          {
                                            v100 = 0;
                                            v105 = 0;
                                            v117 = 0;
                                            v102 = 0;
                                            v108 = 0;
                                            v116 = 0;
                                            v12 = 0;
                                            v13 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            *(_DWORD *)&v111[16] = 1;
                                            *(_DWORD *)&v111[20] = 1;
                                            *(_DWORD *)&v111[8] = 1;
                                            *(_DWORD *)&v111[12] = 1;
                                            *(_DWORD *)&v110[4] = 1;
                                            *(_DWORD *)&v110[8] = 1;
                                            *(_DWORD *)v111 = 1;
                                            *(_DWORD *)&v111[4] = 1;
                                            *(_DWORD *)&v109[4] = 1;
                                            *(_DWORD *)&v109[8] = 0;
                                            *(_DWORD *)v110 = 1;
                                            v107 = 1;
                                            *(_DWORD *)v109 = 1;
                                            v101 = 1;
                                            v106 = 1;
                                            v99 = 1;
                                            v104 = 1;
                                            v98 = 1;
                                            v103 = 1;
                                            v118 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        v98 = 0;
                                        v103 = 0;
                                        v118 = 0;
                                        v100 = 0;
                                        v105 = 0;
                                        v117 = 0;
                                        v102 = 0;
                                        v108 = 0;
                                        v116 = 0;
                                        v12 = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        *(_DWORD *)&v111[16] = 1;
                                        *(_DWORD *)&v111[20] = 1;
                                        *(_DWORD *)&v111[8] = 1;
                                        *(_DWORD *)&v111[12] = 1;
                                        *(_DWORD *)&v110[4] = 1;
                                        *(_DWORD *)&v110[8] = 1;
                                        *(_DWORD *)v111 = 1;
                                        *(_DWORD *)&v111[4] = 1;
                                        *(_DWORD *)&v109[4] = 1;
                                        *(_DWORD *)&v109[8] = 0;
                                        *(_DWORD *)v110 = 1;
                                        v107 = 1;
                                        *(_DWORD *)v109 = 1;
                                        v101 = 1;
                                        v106 = 1;
                                        v99 = 1;
                                        v104 = 1;
                                        v119 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v99 = 0;
                                    v104 = 0;
                                    v119 = 0;
                                    v98 = 0;
                                    v103 = 0;
                                    v118 = 0;
                                    v100 = 0;
                                    v105 = 0;
                                    v117 = 0;
                                    v102 = 0;
                                    v108 = 0;
                                    v116 = 0;
                                    v12 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    *(_DWORD *)&v111[16] = 1;
                                    *(_DWORD *)&v111[20] = 1;
                                    *(_DWORD *)&v111[8] = 1;
                                    *(_DWORD *)&v111[12] = 1;
                                    *(_DWORD *)&v110[4] = 1;
                                    *(_DWORD *)&v110[8] = 1;
                                    *(_DWORD *)v111 = 1;
                                    *(_DWORD *)&v111[4] = 1;
                                    *(_DWORD *)&v109[4] = 1;
                                    *(_DWORD *)&v109[8] = 0;
                                    *(_DWORD *)v110 = 1;
                                    v107 = 1;
                                    *(_DWORD *)v109 = 1;
                                    v101 = 1;
                                    v106 = 1;
                                    v120 = 1;
                                  }
                                }
                              }
                              else
                              {
                                v101 = 0;
                                v106 = 0;
                                v120 = 0;
                                v99 = 0;
                                v104 = 0;
                                v119 = 0;
                                v98 = 0;
                                v103 = 0;
                                v118 = 0;
                                v100 = 0;
                                v105 = 0;
                                v117 = 0;
                                v102 = 0;
                                v108 = 0;
                                v116 = 0;
                                v12 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                *(_DWORD *)&v111[16] = 1;
                                *(_DWORD *)&v111[20] = 1;
                                *(_DWORD *)&v111[8] = 1;
                                *(_DWORD *)&v111[12] = 1;
                                *(_DWORD *)&v110[4] = 1;
                                *(_DWORD *)&v110[8] = 1;
                                *(_DWORD *)v111 = 1;
                                *(_DWORD *)&v111[4] = 1;
                                *(_DWORD *)&v109[4] = 1;
                                *(_DWORD *)&v109[8] = 0;
                                *(_DWORD *)v110 = 1;
                                v107 = 1;
                                *(_DWORD *)v109 = 1;
                                LODWORD(v121) = 1;
                              }
                            }
                          }
                          else
                          {
                            v107 = 0;
                            *(_QWORD *)v109 = 0x100000000;
                            *(_QWORD *)&v121 = 0x100000000;
                            v101 = 0;
                            v106 = 0;
                            v120 = 0;
                            v99 = 0;
                            v104 = 0;
                            v119 = 0;
                            v98 = 0;
                            v103 = 0;
                            v118 = 0;
                            v100 = 0;
                            v105 = 0;
                            v117 = 0;
                            v102 = 0;
                            v108 = 0;
                            v116 = 0;
                            v12 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            *(_QWORD *)&v111[16] = 0x100000001;
                            *(_QWORD *)&v111[8] = 0x100000001;
                            *(_DWORD *)&v110[8] = 1;
                            *(_QWORD *)v111 = 0x100000001;
                            *(_DWORD *)&v109[8] = 0;
                            *(_QWORD *)v110 = 0x100000001;
                          }
                        }
                      }
                      else
                      {
                        memset(v109, 0, sizeof(v109));
                        *(_QWORD *)v110 = 0x100000000;
                        *(_QWORD *)&v121 = 0;
                        v107 = 0;
                        v101 = 0;
                        v106 = 0;
                        v120 = 0;
                        v99 = 0;
                        v104 = 0;
                        v119 = 0;
                        v98 = 0;
                        v103 = 0;
                        v118 = 0;
                        v100 = 0;
                        v105 = 0;
                        v117 = 0;
                        v102 = 0;
                        v108 = 0;
                        v116 = 0;
                        v12 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        *(_QWORD *)&v111[16] = 0x100000001;
                        *(_QWORD *)&v111[8] = 0x100000001;
                        *(_DWORD *)&v110[8] = 1;
                        *(_QWORD *)v111 = 0x100000001;
                        DWORD2(v121) = 1;
                      }
                    }
                  }
                  else
                  {
                    *(_QWORD *)v110 = 0;
                    *(_QWORD *)v111 = 0x100000000;
                    *(_QWORD *)((char *)&v121 + 4) = 0;
                    memset(v109, 0, sizeof(v109));
                    v107 = 0;
                    LODWORD(v121) = 0;
                    v101 = 0;
                    v106 = 0;
                    v120 = 0;
                    v99 = 0;
                    v104 = 0;
                    v119 = 0;
                    v98 = 0;
                    v103 = 0;
                    v118 = 0;
                    v100 = 0;
                    v105 = 0;
                    v117 = 0;
                    v102 = 0;
                    v108 = 0;
                    v116 = 0;
                    v12 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    *(_QWORD *)&v111[16] = 0x100000001;
                    *(_QWORD *)&v111[8] = 0x100000001;
                    *(_DWORD *)&v110[8] = 1;
                  }
                }
                else
                {
                  *(_QWORD *)v110 = 0;
                  *(_QWORD *)v111 = 0x100000000;
                  *(_QWORD *)((char *)&v121 + 4) = 0;
                  memset(v109, 0, sizeof(v109));
                  v107 = 0;
                  LODWORD(v121) = 0;
                  v101 = 0;
                  v106 = 0;
                  v120 = 0;
                  v99 = 0;
                  v104 = 0;
                  v119 = 0;
                  v98 = 0;
                  v103 = 0;
                  v118 = 0;
                  v100 = 0;
                  v105 = 0;
                  v117 = 0;
                  v102 = 0;
                  v108 = 0;
                  v116 = 0;
                  v12 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  *(_QWORD *)&v111[16] = 0x100000001;
                  *(_QWORD *)&v111[8] = 0x100000001;
                  *(_DWORD *)&v110[8] = 1;
                  *(_DWORD *)&v111[24] = 1;
                }
              }
            }
            else
            {
              *(_QWORD *)&v111[4] = 0;
              *(_DWORD *)&v111[24] = 0;
              *(_QWORD *)v110 = 0;
              *(_DWORD *)v111 = 0;
              *(_QWORD *)((char *)&v121 + 4) = 0;
              memset(v109, 0, sizeof(v109));
              v107 = 0;
              LODWORD(v121) = 0;
              v101 = 0;
              v106 = 0;
              v120 = 0;
              v99 = 0;
              v104 = 0;
              v119 = 0;
              v98 = 0;
              v103 = 0;
              v118 = 0;
              v100 = 0;
              v105 = 0;
              v117 = 0;
              v102 = 0;
              v108 = 0;
              v116 = 0;
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              *(_QWORD *)&v111[16] = 0x100000001;
              *(_DWORD *)&v111[12] = 1;
              *(_DWORD *)&v110[8] = 1;
            }
            goto LABEL_16;
          }
          *(_QWORD *)&v111[24] = 0;
          *(_QWORD *)&v111[4] = 0;
          *(_DWORD *)v111 = 0;
          *(_QWORD *)((char *)&v121 + 4) = 0;
          memset(v109, 0, sizeof(v109));
          memset(v110, 0, sizeof(v110));
          v107 = 0;
          LODWORD(v121) = 0;
          v101 = 0;
          v106 = 0;
          v120 = 0;
          v99 = 0;
          v104 = 0;
          v119 = 0;
          v98 = 0;
          v103 = 0;
          v118 = 0;
          v100 = 0;
          v105 = 0;
          v117 = 0;
          v102 = 0;
          v108 = 0;
          v116 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          *(_QWORD *)&v111[16] = 0x100000001;
          *(_DWORD *)&v111[12] = 1;
        }
        else
        {
          *(_QWORD *)&v111[24] = 0;
          *(_OWORD *)v111 = 0uLL;
          *(_QWORD *)((char *)&v121 + 4) = 0;
          memset(v109, 0, sizeof(v109));
          memset(v110, 0, sizeof(v110));
          v107 = 0;
          LODWORD(v121) = 0;
          v101 = 0;
          v106 = 0;
          v120 = 0;
          v99 = 0;
          v104 = 0;
          v119 = 0;
          v98 = 0;
          v103 = 0;
          v118 = 0;
          v100 = 0;
          v105 = 0;
          v117 = 0;
          v102 = 0;
          v108 = 0;
          v116 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          *(_QWORD *)&v111[16] = 0x100000001;
          HIDWORD(v121) = 1;
        }
      }
    }
    else
    {
      v121 = 0uLL;
      memset(v111, 0, 32);
      memset(v109, 0, sizeof(v109));
      memset(v110, 0, sizeof(v110));
      v107 = 0;
      v101 = 0;
      v106 = 0;
      v120 = 0;
      v99 = 0;
      v104 = 0;
      v119 = 0;
      v98 = 0;
      v103 = 0;
      v118 = 0;
      v100 = 0;
      v105 = 0;
      v117 = 0;
      v102 = 0;
      v108 = 0;
      v116 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v111[32] = 1;
    }
  }
LABEL_16:
  if (v14)
  {
    v17 = v13;

    v13 = v17;
  }
  if (v13)

  if (v12)
  {

  }
  if ((_DWORD)v116)
  {

  }
  if (*(_DWORD *)&v109[8])

  if ((_DWORD)v108)
  {

  }
  if (HIDWORD(v116))
  {

  }
  if (HIDWORD(v108))

  if (v102)
  {

  }
  if (v117)
  {

  }
  if (v105)

  if (v100)
  {

  }
  if (v118)
  {

  }
  if (v103)

  if (v98)
  {

  }
  if (v119)
  {

  }
  if (v104)

  if (v99)
  {

  }
  if (v120)
  {

  }
  if (v106)

  if (v101)
  {

  }
  if ((_DWORD)v121)
  {

  }
  if (*(_DWORD *)v109)

  if (v107)
  {

  }
  if (DWORD1(v121))
  {

  }
  if (*(_DWORD *)v110)

  if (*(_DWORD *)&v109[4])
  {

  }
  if (DWORD2(v121))
  {

  }
  if (*(_DWORD *)v111)

  if (*(_DWORD *)&v110[4])
  {

  }
  if (*(_DWORD *)&v111[24])
  {

  }
  if (*(_DWORD *)&v111[4])

  if (*(_DWORD *)&v111[8])
  {

  }
  if (*(_DWORD *)&v111[28])
  {

  }
  if (*(_DWORD *)&v110[8])

  if (*(_DWORD *)&v111[12])
  {

  }
  if (HIDWORD(v121))
  {

  }
  if (*(_DWORD *)&v111[16])

  if (*(_DWORD *)&v111[20])
  {

  }
  if (*(_DWORD *)&v111[32])
  {

  }
  if (v113 != v112)

LABEL_99:
  return v15;
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)SFMediaInfoCardSection;
  v3 = -[SFCardSection hash](&v39, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v38, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v37, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v36, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFMediaInfoCardSection type](self, "type");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v35, "hash");
  v11 = v10 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v34, "hash");
  -[SFMediaInfoCardSection mediaItem](self, "mediaItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v12 ^ objc_msgSend(v33, "hash");
  -[SFMediaInfoCardSection details](self, "details");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v32, "hash");
  -[SFMediaInfoCardSection playAction](self, "playAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[SFMediaInfoCardSection offers](self, "offers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[SFMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[SFMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  -[SFMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13 ^ v24 ^ objc_msgSend(v25, "hash");
  v27 = -[SFMediaInfoCardSection isMediaContainer](self, "isMediaContainer");
  -[SFMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");
  v30 = v26 ^ v29 ^ -[SFMediaInfoCardSection watchListItemType](self, "watchListItemType");

  return v30;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (SFMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (NSArray)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFActionItem)playAction
{
  return self->_playAction;
}

- (void)setPlayAction:(id)a3
{
  objc_storeStrong((id *)&self->_playAction, a3);
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (void)setWatchListIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)watchListButtonLabel
{
  return self->_watchListButtonLabel;
}

- (void)setWatchListButtonLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)watchListContinuationText
{
  return self->_watchListContinuationText;
}

- (void)setWatchListContinuationText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)watchListConfirmationText
{
  return self->_watchListConfirmationText;
}

- (void)setWatchListConfirmationText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)isMediaContainer
{
  return self->_isMediaContainer;
}

- (SFRichText)specialOfferButtonLabel
{
  return self->_specialOfferButtonLabel;
}

- (void)setSpecialOfferButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_specialOfferButtonLabel, a3);
}

- (int)watchListItemType
{
  return self->_watchListItemType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialOfferButtonLabel, 0);
  objc_storeStrong((id *)&self->_watchListConfirmationText, 0);
  objc_storeStrong((id *)&self->_watchListContinuationText, 0);
  objc_storeStrong((id *)&self->_watchListButtonLabel, 0);
  objc_storeStrong((id *)&self->_watchListIdentifier, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_playAction, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
