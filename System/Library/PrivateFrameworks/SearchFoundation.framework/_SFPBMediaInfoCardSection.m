@implementation _SFPBMediaInfoCardSection

- (_SFPBMediaInfoCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBMediaInfoCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBPunchout *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _SFPBColor *v21;
  void *v22;
  _SFPBColor *v23;
  void *v24;
  _SFPBMediaItem *v25;
  void *v26;
  _SFPBMediaItem *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  _SFPBMediaDetail *v35;
  void *v36;
  _SFPBActionItem *v37;
  void *v38;
  _SFPBActionItem *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  _SFPBMediaOffer *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _SFPBRichText *v57;
  void *v58;
  _SFPBRichText *v59;
  _SFPBMediaInfoCardSection *v60;
  _SFPBMediaInfoCardSection *v62;
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
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBMediaInfoCardSection init](self, "init");
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
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
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
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v10);
    }

    -[_SFPBMediaInfoCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaInfoCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaInfoCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBMediaInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBMediaInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBMediaInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaInfoCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBMediaInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBMediaInfoCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "mediaItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBMediaItem alloc];
      objc_msgSend(v4, "mediaItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBMediaItem initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBMediaInfoCardSection setMediaItem:](v5, "setMediaItem:", v27);

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
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
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
          v35 = -[_SFPBMediaDetail initWithFacade:]([_SFPBMediaDetail alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
          if (v35)
            objc_msgSend(v29, "addObject:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v32);
    }

    -[_SFPBMediaInfoCardSection setDetails:](v5, "setDetails:", v29);
    objc_msgSend(v4, "playAction");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [_SFPBActionItem alloc];
      objc_msgSend(v4, "playAction");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[_SFPBActionItem initWithFacade:](v37, "initWithFacade:", v38);
      -[_SFPBMediaInfoCardSection setPlayAction:](v5, "setPlayAction:", v39);

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
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
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
          v47 = -[_SFPBMediaOffer initWithFacade:]([_SFPBMediaOffer alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
          if (v47)
            objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v44);
    }

    v5 = v62;
    -[_SFPBMediaInfoCardSection setOffers:](v62, "setOffers:", v41);
    objc_msgSend(v4, "watchListIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v4, "watchListIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaInfoCardSection setWatchListIdentifier:](v62, "setWatchListIdentifier:", v49);

    }
    objc_msgSend(v4, "watchListButtonLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v4, "watchListButtonLabel");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaInfoCardSection setWatchListButtonLabel:](v62, "setWatchListButtonLabel:", v51);

    }
    objc_msgSend(v4, "watchListContinuationText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v4, "watchListContinuationText");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaInfoCardSection setWatchListContinuationText:](v62, "setWatchListContinuationText:", v53);

    }
    objc_msgSend(v4, "watchListConfirmationText");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v4, "watchListConfirmationText");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaInfoCardSection setWatchListConfirmationText:](v62, "setWatchListConfirmationText:", v55);

    }
    if (objc_msgSend(v4, "hasIsMediaContainer"))
      -[_SFPBMediaInfoCardSection setIsMediaContainer:](v62, "setIsMediaContainer:", objc_msgSend(v4, "isMediaContainer"));
    objc_msgSend(v4, "specialOfferButtonLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [_SFPBRichText alloc];
      objc_msgSend(v4, "specialOfferButtonLabel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[_SFPBRichText initWithFacade:](v57, "initWithFacade:", v58);
      -[_SFPBMediaInfoCardSection setSpecialOfferButtonLabel:](v62, "setSpecialOfferButtonLabel:", v59);

    }
    if (objc_msgSend(v4, "hasWatchListItemType"))
      -[_SFPBMediaInfoCardSection setWatchListItemType:](v62, "setWatchListItemType:", objc_msgSend(v4, "watchListItemType"));
    v60 = v62;

  }
  return v5;
}

- (void)setPunchoutOptions:(id)a3
{
  NSArray *v4;
  NSArray *punchoutOptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  punchoutOptions = self->_punchoutOptions;
  self->_punchoutOptions = v4;

}

- (void)clearPunchoutOptions
{
  -[NSArray removeAllObjects](self->_punchoutOptions, "removeAllObjects");
}

- (void)addPunchoutOptions:(id)a3
{
  id v4;
  NSArray *punchoutOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  v8 = v4;
  if (!punchoutOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  -[NSArray addObject:](punchoutOptions, "addObject:", v4);

}

- (unint64_t)punchoutOptionsCount
{
  return -[NSArray count](self->_punchoutOptions, "count");
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_punchoutOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setPunchoutPickerTitle:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerTitle = self->_punchoutPickerTitle;
  self->_punchoutPickerTitle = v4;

}

- (void)setPunchoutPickerDismissText:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerDismissText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerDismissText = self->_punchoutPickerDismissText;
  self->_punchoutPickerDismissText = v4;

}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_canBeHidden = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_hasTopPadding = a3;
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_hasBottomPadding = a3;
}

- (void)setType:(id)a3
{
  NSString *v4;
  NSString *type;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  type = self->_type;
  self->_type = v4;

}

- (void)setSeparatorStyle:(int)a3
{
  self->_separatorStyle = a3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void)setDetails:(id)a3
{
  NSArray *v4;
  NSArray *details;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  details = self->_details;
  self->_details = v4;

}

- (void)clearDetails
{
  -[NSArray removeAllObjects](self->_details, "removeAllObjects");
}

- (void)addDetails:(id)a3
{
  id v4;
  NSArray *details;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  details = self->_details;
  v8 = v4;
  if (!details)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_details;
    self->_details = v6;

    v4 = v8;
    details = self->_details;
  }
  -[NSArray addObject:](details, "addObject:", v4);

}

- (unint64_t)detailsCount
{
  return -[NSArray count](self->_details, "count");
}

- (id)detailsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_details, "objectAtIndexedSubscript:", a3);
}

- (void)setPlayAction:(id)a3
{
  objc_storeStrong((id *)&self->_playAction, a3);
}

- (void)setOffers:(id)a3
{
  NSArray *v4;
  NSArray *offers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  offers = self->_offers;
  self->_offers = v4;

}

- (void)clearOffers
{
  -[NSArray removeAllObjects](self->_offers, "removeAllObjects");
}

- (void)addOffers:(id)a3
{
  id v4;
  NSArray *offers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  offers = self->_offers;
  v8 = v4;
  if (!offers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_offers;
    self->_offers = v6;

    v4 = v8;
    offers = self->_offers;
  }
  -[NSArray addObject:](offers, "addObject:", v4);

}

- (unint64_t)offersCount
{
  return -[NSArray count](self->_offers, "count");
}

- (id)offersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_offers, "objectAtIndexedSubscript:", a3);
}

- (void)setWatchListIdentifier:(id)a3
{
  NSString *v4;
  NSString *watchListIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  watchListIdentifier = self->_watchListIdentifier;
  self->_watchListIdentifier = v4;

}

- (void)setWatchListButtonLabel:(id)a3
{
  NSString *v4;
  NSString *watchListButtonLabel;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  watchListButtonLabel = self->_watchListButtonLabel;
  self->_watchListButtonLabel = v4;

}

- (void)setWatchListContinuationText:(id)a3
{
  NSString *v4;
  NSString *watchListContinuationText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  watchListContinuationText = self->_watchListContinuationText;
  self->_watchListContinuationText = v4;

}

- (void)setWatchListConfirmationText:(id)a3
{
  NSString *v4;
  NSString *watchListConfirmationText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  watchListConfirmationText = self->_watchListConfirmationText;
  self->_watchListConfirmationText = v4;

}

- (void)setIsMediaContainer:(BOOL)a3
{
  self->_isMediaContainer = a3;
}

- (void)setSpecialOfferButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_specialOfferButtonLabel, a3);
}

- (void)setWatchListItemType:(int)a3
{
  self->_watchListItemType = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaInfoCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBMediaInfoCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v7);
  }

  -[_SFPBMediaInfoCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBMediaInfoCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBMediaInfoCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMediaInfoCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMediaInfoCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBMediaInfoCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBMediaInfoCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMediaInfoCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaInfoCardSection mediaItem](self, "mediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaInfoCardSection details](self, "details");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v17);
  }

  -[_SFPBMediaInfoCardSection playAction](self, "playAction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaInfoCardSection offers](self, "offers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v23);
  }

  -[_SFPBMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    PBDataWriterWriteStringField();

  -[_SFPBMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    PBDataWriterWriteStringField();

  -[_SFPBMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    PBDataWriterWriteStringField();

  -[_SFPBMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    PBDataWriterWriteStringField();

  if (-[_SFPBMediaInfoCardSection isMediaContainer](self, "isMediaContainer"))
    PBDataWriterWriteBOOLField();
  -[_SFPBMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBMediaInfoCardSection watchListItemType](self, "watchListItemType"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int canBeHidden;
  int hasTopPadding;
  int hasBottomPadding;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int separatorStyle;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  int isMediaContainer;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  BOOL v82;
  int watchListItemType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_77;
  -[_SFPBMediaInfoCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBMediaInfoCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBMediaInfoCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBMediaInfoCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_77;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_77;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_77;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_77;
  -[_SFPBMediaInfoCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBMediaInfoCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_77;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_77;
  -[_SFPBMediaInfoCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBMediaInfoCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection mediaItem](self, "mediaItem");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBMediaInfoCardSection mediaItem](self, "mediaItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection details](self, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection details](self, "details");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBMediaInfoCardSection details](self, "details");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "details");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection playAction](self, "playAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection playAction](self, "playAction");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBMediaInfoCardSection playAction](self, "playAction");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playAction");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection offers](self, "offers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection offers](self, "offers");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_SFPBMediaInfoCardSection offers](self, "offers");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offers");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[_SFPBMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListButtonLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
    -[_SFPBMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListButtonLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if (!v65)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListContinuationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v67 = (void *)v66;
    -[_SFPBMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListContinuationText");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "isEqual:", v69);

    if (!v70)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListConfirmationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)v71;
    -[_SFPBMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListConfirmationText");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v73, "isEqual:", v74);

    if (!v75)
      goto LABEL_77;
  }
  else
  {

  }
  isMediaContainer = self->_isMediaContainer;
  if (isMediaContainer != objc_msgSend(v4, "isMediaContainer"))
    goto LABEL_77;
  -[_SFPBMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specialOfferButtonLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_76:

    goto LABEL_77;
  }
  -[_SFPBMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
  v77 = objc_claimAutoreleasedReturnValue();
  if (!v77)
  {

LABEL_80:
    watchListItemType = self->_watchListItemType;
    v82 = watchListItemType == objc_msgSend(v4, "watchListItemType");
    goto LABEL_78;
  }
  v78 = (void *)v77;
  -[_SFPBMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specialOfferButtonLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v79, "isEqual:", v80);

  if (v81)
    goto LABEL_80;
LABEL_77:
  v82 = 0;
LABEL_78:

  return v82;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;

  v26 = -[NSArray hash](self->_punchoutOptions, "hash");
  v25 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v23 = v4;
  v24 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v21 = v6;
  v22 = v5;
  v7 = -[NSString hash](self->_type, "hash");
  v19 = 2654435761 * self->_separatorStyle;
  v20 = v7;
  v18 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v17 = -[_SFPBMediaItem hash](self->_mediaItem, "hash");
  v8 = -[NSArray hash](self->_details, "hash");
  v9 = -[_SFPBActionItem hash](self->_playAction, "hash");
  v10 = -[NSArray hash](self->_offers, "hash");
  v11 = -[NSString hash](self->_watchListIdentifier, "hash");
  v12 = -[NSString hash](self->_watchListButtonLabel, "hash");
  v13 = -[NSString hash](self->_watchListContinuationText, "hash");
  v14 = -[NSString hash](self->_watchListConfirmationText, "hash");
  if (self->_isMediaContainer)
    v15 = 2654435761;
  else
    v15 = 0;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[_SFPBRichText hash](self->_specialOfferButtonLabel, "hash") ^ (2654435761 * self->_watchListItemType);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
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
  uint64_t v60;
  void *v61;
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
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBMediaInfoCardSection backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("backgroundColor"));

    }
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMediaInfoCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (-[NSArray count](self->_details, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v9 = self->_details;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v72 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("details"));
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMediaInfoCardSection hasBottomPadding](self, "hasBottomPadding"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMediaInfoCardSection hasTopPadding](self, "hasTopPadding"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hasTopPadding"));

  }
  if (self->_isMediaContainer)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMediaInfoCardSection isMediaContainer](self, "isMediaContainer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isMediaContainer"));

  }
  if (self->_mediaItem)
  {
    -[_SFPBMediaInfoCardSection mediaItem](self, "mediaItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("mediaItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("mediaItem"));

    }
  }
  if (-[NSArray count](self->_offers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v23 = self->_offers;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v68 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v22, "addObject:", v28);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("offers"));
  }
  if (self->_playAction)
  {
    -[_SFPBMediaInfoCardSection playAction](self, "playAction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("playAction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("playAction"));

    }
  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v34 = self->_punchoutOptions;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v64 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k), "dictionaryRepresentation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(v33, "addObject:", v39);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v40);

          }
        }
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v36);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBMediaInfoCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBMediaInfoCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v45 = -[_SFPBMediaInfoCardSection separatorStyle](self, "separatorStyle");
    if (v45 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = *(&off_1E40421B0 + v45);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("separatorStyle"));

  }
  if (self->_specialOfferButtonLabel)
  {
    -[_SFPBMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("specialOfferButtonLabel"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("specialOfferButtonLabel"));

    }
  }
  if (self->_type)
  {
    -[_SFPBMediaInfoCardSection type](self, "type");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("type"));

  }
  if (self->_watchListButtonLabel)
  {
    -[_SFPBMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("watchListButtonLabel"));

  }
  if (self->_watchListConfirmationText)
  {
    -[_SFPBMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("watchListConfirmationText"));

  }
  if (self->_watchListContinuationText)
  {
    -[_SFPBMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v56, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("watchListContinuationText"));

  }
  if (self->_watchListIdentifier)
  {
    -[_SFPBMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("watchListIdentifier"));

  }
  if (self->_watchListItemType)
  {
    v60 = -[_SFPBMediaInfoCardSection watchListItemType](self, "watchListItemType");
    if (v60 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = *(&off_1E40421B0 + v60);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("watchListItemType"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMediaInfoCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBMediaInfoCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMediaInfoCardSection *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBMediaInfoCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMediaInfoCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMediaInfoCardSection *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _SFPBPunchout *v13;
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
  uint64_t v24;
  _SFPBColor *v25;
  uint64_t v26;
  _SFPBMediaItem *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  _SFPBMediaDetail *v35;
  uint64_t v36;
  _SFPBActionItem *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  _SFPBMediaOffer *v45;
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
  _SFPBRichText *v56;
  void *v57;
  _SFPBMediaInfoCardSection *v58;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)_SFPBMediaInfoCardSection;
  v5 = -[_SFPBMediaInfoCardSection init](&v84, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v81 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBMediaInfoCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBMediaInfoCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBMediaInfoCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    v63 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBMediaInfoCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    v61 = v23;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBMediaInfoCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaItem"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBMediaItem initWithDictionary:]([_SFPBMediaItem alloc], "initWithDictionary:", v26);
      -[_SFPBMediaInfoCardSection setMediaItem:](v5, "setMediaItem:", v27);

    }
    v62 = v19;
    v64 = v16;
    v65 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("details"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v77 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = -[_SFPBMediaDetail initWithDictionary:]([_SFPBMediaDetail alloc], "initWithDictionary:", v34);
              -[_SFPBMediaInfoCardSection addDetails:](v5, "addDetails:", v35);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        }
        while (v31);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playAction"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBActionItem initWithDictionary:]([_SFPBActionItem alloc], "initWithDictionary:", v36);
      -[_SFPBMediaInfoCardSection setPlayAction:](v5, "setPlayAction:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offers"), v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v39 = v38;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v73;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v73 != v42)
              objc_enumerationMutation(v39);
            v44 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v45 = -[_SFPBMediaOffer initWithDictionary:]([_SFPBMediaOffer alloc], "initWithDictionary:", v44);
              -[_SFPBMediaInfoCardSection addOffers:](v5, "addOffers:", v45);

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        }
        while (v41);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListIdentifier"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = (void *)objc_msgSend(v46, "copy");
      -[_SFPBMediaInfoCardSection setWatchListIdentifier:](v5, "setWatchListIdentifier:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListButtonLabel"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = (void *)objc_msgSend(v48, "copy");
      -[_SFPBMediaInfoCardSection setWatchListButtonLabel:](v5, "setWatchListButtonLabel:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListContinuationText"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = (void *)objc_msgSend(v50, "copy");
      -[_SFPBMediaInfoCardSection setWatchListContinuationText:](v5, "setWatchListContinuationText:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListConfirmationText"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = (void *)objc_msgSend(v52, "copy");
      -[_SFPBMediaInfoCardSection setWatchListConfirmationText:](v5, "setWatchListConfirmationText:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaContainer"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaInfoCardSection setIsMediaContainer:](v5, "setIsMediaContainer:", objc_msgSend(v54, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("specialOfferButtonLabel"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v55);
      -[_SFPBMediaInfoCardSection setSpecialOfferButtonLabel:](v5, "setSpecialOfferButtonLabel:", v56);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListItemType"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaInfoCardSection setWatchListItemType:](v5, "setWatchListItemType:", objc_msgSend(v57, "intValue"));
    v58 = v5;

  }
  return v5;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (NSString)type
{
  return self->_type;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (_SFPBMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSArray)details
{
  return self->_details;
}

- (_SFPBActionItem)playAction
{
  return self->_playAction;
}

- (NSArray)offers
{
  return self->_offers;
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (NSString)watchListButtonLabel
{
  return self->_watchListButtonLabel;
}

- (NSString)watchListContinuationText
{
  return self->_watchListContinuationText;
}

- (NSString)watchListConfirmationText
{
  return self->_watchListConfirmationText;
}

- (BOOL)isMediaContainer
{
  return self->_isMediaContainer;
}

- (_SFPBRichText)specialOfferButtonLabel
{
  return self->_specialOfferButtonLabel;
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
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
