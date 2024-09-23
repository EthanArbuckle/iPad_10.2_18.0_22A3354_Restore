@implementation _SFPBWatchListItem

- (_SFPBWatchListItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBWatchListItem *v5;
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
  _SFPBWatchListItem *v26;

  v4 = a3;
  v5 = -[_SFPBWatchListItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "watchListIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "watchListIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setWatchListIdentifier:](v5, "setWatchListIdentifier:", v7);

    }
    objc_msgSend(v4, "seasonEpisodeTextFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "seasonEpisodeTextFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setSeasonEpisodeTextFormat:](v5, "setSeasonEpisodeTextFormat:", v9);

    }
    objc_msgSend(v4, "continueInTextFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "continueInTextFormat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setContinueInTextFormat:](v5, "setContinueInTextFormat:", v11);

    }
    objc_msgSend(v4, "openButtonTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "openButtonTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setOpenButtonTitle:](v5, "setOpenButtonTitle:", v13);

    }
    objc_msgSend(v4, "installButtonTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "installButtonTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setInstallButtonTitle:](v5, "setInstallButtonTitle:", v15);

    }
    objc_msgSend(v4, "purchaseOfferTextFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "purchaseOfferTextFormat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setPurchaseOfferTextFormat:](v5, "setPurchaseOfferTextFormat:", v17);

    }
    objc_msgSend(v4, "inUpNextText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "inUpNextText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setInUpNextText:](v5, "setInUpNextText:", v19);

    }
    objc_msgSend(v4, "addToUpNextText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "addToUpNextText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setAddToUpNextText:](v5, "setAddToUpNextText:", v21);

    }
    objc_msgSend(v4, "addedToUpNextText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "addedToUpNextText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setAddedToUpNextText:](v5, "setAddedToUpNextText:", v23);

    }
    objc_msgSend(v4, "watchLiveTextFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "watchLiveTextFormat");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBWatchListItem setWatchLiveTextFormat:](v5, "setWatchLiveTextFormat:", v25);

    }
    if (objc_msgSend(v4, "hasIsMediaContainer"))
      -[_SFPBWatchListItem setIsMediaContainer:](v5, "setIsMediaContainer:", objc_msgSend(v4, "isMediaContainer"));
    if (objc_msgSend(v4, "hasType"))
      -[_SFPBWatchListItem setType:](v5, "setType:", objc_msgSend(v4, "type"));
    v26 = v5;
  }

  return v5;
}

- (void)setWatchListIdentifier:(id)a3
{
  NSString *v4;
  NSString *watchListIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  watchListIdentifier = self->_watchListIdentifier;
  self->_watchListIdentifier = v4;

}

- (void)setSeasonEpisodeTextFormat:(id)a3
{
  NSString *v4;
  NSString *seasonEpisodeTextFormat;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  seasonEpisodeTextFormat = self->_seasonEpisodeTextFormat;
  self->_seasonEpisodeTextFormat = v4;

}

- (void)setContinueInTextFormat:(id)a3
{
  NSString *v4;
  NSString *continueInTextFormat;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  continueInTextFormat = self->_continueInTextFormat;
  self->_continueInTextFormat = v4;

}

- (void)setOpenButtonTitle:(id)a3
{
  NSString *v4;
  NSString *openButtonTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  openButtonTitle = self->_openButtonTitle;
  self->_openButtonTitle = v4;

}

- (void)setInstallButtonTitle:(id)a3
{
  NSString *v4;
  NSString *installButtonTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  installButtonTitle = self->_installButtonTitle;
  self->_installButtonTitle = v4;

}

- (void)setPurchaseOfferTextFormat:(id)a3
{
  NSString *v4;
  NSString *purchaseOfferTextFormat;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  purchaseOfferTextFormat = self->_purchaseOfferTextFormat;
  self->_purchaseOfferTextFormat = v4;

}

- (void)setInUpNextText:(id)a3
{
  NSString *v4;
  NSString *inUpNextText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  inUpNextText = self->_inUpNextText;
  self->_inUpNextText = v4;

}

- (void)setAddToUpNextText:(id)a3
{
  NSString *v4;
  NSString *addToUpNextText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  addToUpNextText = self->_addToUpNextText;
  self->_addToUpNextText = v4;

}

- (void)setAddedToUpNextText:(id)a3
{
  NSString *v4;
  NSString *addedToUpNextText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  addedToUpNextText = self->_addedToUpNextText;
  self->_addedToUpNextText = v4;

}

- (void)setWatchLiveTextFormat:(id)a3
{
  NSString *v4;
  NSString *watchLiveTextFormat;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  watchLiveTextFormat = self->_watchLiveTextFormat;
  self->_watchLiveTextFormat = v4;

}

- (void)setIsMediaContainer:(BOOL)a3
{
  self->_isMediaContainer = a3;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBWatchListItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_SFPBWatchListItem watchListIdentifier](self, "watchListIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem continueInTextFormat](self, "continueInTextFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem openButtonTitle](self, "openButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem installButtonTitle](self, "installButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem inUpNextText](self, "inUpNextText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem addToUpNextText](self, "addToUpNextText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem addedToUpNextText](self, "addedToUpNextText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  -[_SFPBWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteStringField();

  if (-[_SFPBWatchListItem isMediaContainer](self, "isMediaContainer"))
    PBDataWriterWriteBOOLField();
  v14 = -[_SFPBWatchListItem type](self, "type");
  v15 = v16;
  if (v14)
  {
    PBDataWriterWriteInt32Field();
    v15 = v16;
  }

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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  BOOL v57;
  int isMediaContainer;
  int type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[_SFPBWatchListItem watchListIdentifier](self, "watchListIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchListIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem watchListIdentifier](self, "watchListIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBWatchListItem watchListIdentifier](self, "watchListIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchListIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seasonEpisodeTextFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seasonEpisodeTextFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem continueInTextFormat](self, "continueInTextFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continueInTextFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem continueInTextFormat](self, "continueInTextFormat");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBWatchListItem continueInTextFormat](self, "continueInTextFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "continueInTextFormat");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem openButtonTitle](self, "openButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem openButtonTitle](self, "openButtonTitle");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBWatchListItem openButtonTitle](self, "openButtonTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openButtonTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem installButtonTitle](self, "installButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem installButtonTitle](self, "installButtonTitle");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBWatchListItem installButtonTitle](self, "installButtonTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installButtonTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purchaseOfferTextFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "purchaseOfferTextFormat");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem inUpNextText](self, "inUpNextText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inUpNextText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem inUpNextText](self, "inUpNextText");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBWatchListItem inUpNextText](self, "inUpNextText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inUpNextText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem addToUpNextText](self, "addToUpNextText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToUpNextText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem addToUpNextText](self, "addToUpNextText");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBWatchListItem addToUpNextText](self, "addToUpNextText");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addToUpNextText");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem addedToUpNextText](self, "addedToUpNextText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedToUpNextText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBWatchListItem addedToUpNextText](self, "addedToUpNextText");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBWatchListItem addedToUpNextText](self, "addedToUpNextText");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addedToUpNextText");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchLiveTextFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  -[_SFPBWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchLiveTextFormat");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_52;
  }
  else
  {

  }
  isMediaContainer = self->_isMediaContainer;
  if (isMediaContainer == objc_msgSend(v4, "isMediaContainer"))
  {
    type = self->_type;
    v57 = type == objc_msgSend(v4, "type");
    goto LABEL_53;
  }
LABEL_52:
  v57 = 0;
LABEL_53:

  return v57;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_watchListIdentifier, "hash");
  v4 = -[NSString hash](self->_seasonEpisodeTextFormat, "hash");
  v5 = -[NSString hash](self->_continueInTextFormat, "hash");
  v6 = -[NSString hash](self->_openButtonTitle, "hash");
  v7 = -[NSString hash](self->_installButtonTitle, "hash");
  v8 = -[NSString hash](self->_purchaseOfferTextFormat, "hash");
  v9 = -[NSString hash](self->_inUpNextText, "hash");
  v10 = -[NSString hash](self->_addToUpNextText, "hash");
  v11 = -[NSString hash](self->_addedToUpNextText, "hash");
  v12 = -[NSString hash](self->_watchLiveTextFormat, "hash");
  if (self->_isMediaContainer)
    v13 = 2654435761;
  else
    v13 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ (2654435761 * self->_type);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_addToUpNextText)
  {
    -[_SFPBWatchListItem addToUpNextText](self, "addToUpNextText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("addToUpNextText"));

  }
  if (self->_addedToUpNextText)
  {
    -[_SFPBWatchListItem addedToUpNextText](self, "addedToUpNextText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("addedToUpNextText"));

  }
  if (self->_continueInTextFormat)
  {
    -[_SFPBWatchListItem continueInTextFormat](self, "continueInTextFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("continueInTextFormat"));

  }
  if (self->_inUpNextText)
  {
    -[_SFPBWatchListItem inUpNextText](self, "inUpNextText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("inUpNextText"));

  }
  if (self->_installButtonTitle)
  {
    -[_SFPBWatchListItem installButtonTitle](self, "installButtonTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("installButtonTitle"));

  }
  if (self->_isMediaContainer)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBWatchListItem isMediaContainer](self, "isMediaContainer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isMediaContainer"));

  }
  if (self->_openButtonTitle)
  {
    -[_SFPBWatchListItem openButtonTitle](self, "openButtonTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("openButtonTitle"));

  }
  if (self->_purchaseOfferTextFormat)
  {
    -[_SFPBWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("purchaseOfferTextFormat"));

  }
  if (self->_seasonEpisodeTextFormat)
  {
    -[_SFPBWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("seasonEpisodeTextFormat"));

  }
  if (self->_type)
  {
    v21 = -[_SFPBWatchListItem type](self, "type");
    if (v21 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_1E40421B0 + v21);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("type"));

  }
  if (self->_watchListIdentifier)
  {
    -[_SFPBWatchListItem watchListIdentifier](self, "watchListIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("watchListIdentifier"));

  }
  if (self->_watchLiveTextFormat)
  {
    -[_SFPBWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("watchLiveTextFormat"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBWatchListItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBWatchListItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBWatchListItem *v5;
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
    self = -[_SFPBWatchListItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBWatchListItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBWatchListItem *v5;
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
  _SFPBWatchListItem *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_SFPBWatchListItem;
  v5 = -[_SFPBWatchListItem init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchListIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBWatchListItem setWatchListIdentifier:](v5, "setWatchListIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seasonEpisodeTextFormat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBWatchListItem setSeasonEpisodeTextFormat:](v5, "setSeasonEpisodeTextFormat:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("continueInTextFormat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBWatchListItem setContinueInTextFormat:](v5, "setContinueInTextFormat:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openButtonTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBWatchListItem setOpenButtonTitle:](v5, "setOpenButtonTitle:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("installButtonTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBWatchListItem setInstallButtonTitle:](v5, "setInstallButtonTitle:", v15);

    }
    v32 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purchaseOfferTextFormat"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBWatchListItem setPurchaseOfferTextFormat:](v5, "setPurchaseOfferTextFormat:", v17);

    }
    v31 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inUpNextText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[_SFPBWatchListItem setInUpNextText:](v5, "setInUpNextText:", v19);

    }
    v34 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("addToUpNextText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(v20, "copy");
      -[_SFPBWatchListItem setAddToUpNextText:](v5, "setAddToUpNextText:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("addedToUpNextText"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[_SFPBWatchListItem setAddedToUpNextText:](v5, "setAddedToUpNextText:", v23);

    }
    v33 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchLiveTextFormat"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[_SFPBWatchListItem setWatchLiveTextFormat:](v5, "setWatchLiveTextFormat:", v25);

    }
    v26 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaContainer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBWatchListItem setIsMediaContainer:](v5, "setIsMediaContainer:", objc_msgSend(v27, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBWatchListItem setType:](v5, "setType:", objc_msgSend(v28, "intValue"));
    v29 = v5;

  }
  return v5;
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (NSString)seasonEpisodeTextFormat
{
  return self->_seasonEpisodeTextFormat;
}

- (NSString)continueInTextFormat
{
  return self->_continueInTextFormat;
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (NSString)installButtonTitle
{
  return self->_installButtonTitle;
}

- (NSString)purchaseOfferTextFormat
{
  return self->_purchaseOfferTextFormat;
}

- (NSString)inUpNextText
{
  return self->_inUpNextText;
}

- (NSString)addToUpNextText
{
  return self->_addToUpNextText;
}

- (NSString)addedToUpNextText
{
  return self->_addedToUpNextText;
}

- (NSString)watchLiveTextFormat
{
  return self->_watchLiveTextFormat;
}

- (BOOL)isMediaContainer
{
  return self->_isMediaContainer;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchLiveTextFormat, 0);
  objc_storeStrong((id *)&self->_addedToUpNextText, 0);
  objc_storeStrong((id *)&self->_addToUpNextText, 0);
  objc_storeStrong((id *)&self->_inUpNextText, 0);
  objc_storeStrong((id *)&self->_purchaseOfferTextFormat, 0);
  objc_storeStrong((id *)&self->_installButtonTitle, 0);
  objc_storeStrong((id *)&self->_openButtonTitle, 0);
  objc_storeStrong((id *)&self->_continueInTextFormat, 0);
  objc_storeStrong((id *)&self->_seasonEpisodeTextFormat, 0);
  objc_storeStrong((id *)&self->_watchListIdentifier, 0);
}

@end
