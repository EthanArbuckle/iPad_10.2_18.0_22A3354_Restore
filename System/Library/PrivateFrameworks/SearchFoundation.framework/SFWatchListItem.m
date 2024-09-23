@implementation SFWatchListItem

- (SFWatchListItem)initWithProtobuf:(id)a3
{
  id v4;
  SFWatchListItem *v5;
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
  SFWatchListItem *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFWatchListItem;
  v5 = -[SFWatchListItem init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "watchListIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "watchListIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setWatchListIdentifier:](v5, "setWatchListIdentifier:", v7);

    }
    objc_msgSend(v4, "seasonEpisodeTextFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "seasonEpisodeTextFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setSeasonEpisodeTextFormat:](v5, "setSeasonEpisodeTextFormat:", v9);

    }
    objc_msgSend(v4, "continueInTextFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "continueInTextFormat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setContinueInTextFormat:](v5, "setContinueInTextFormat:", v11);

    }
    objc_msgSend(v4, "openButtonTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "openButtonTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setOpenButtonTitle:](v5, "setOpenButtonTitle:", v13);

    }
    objc_msgSend(v4, "installButtonTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "installButtonTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setInstallButtonTitle:](v5, "setInstallButtonTitle:", v15);

    }
    objc_msgSend(v4, "purchaseOfferTextFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "purchaseOfferTextFormat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setPurchaseOfferTextFormat:](v5, "setPurchaseOfferTextFormat:", v17);

    }
    objc_msgSend(v4, "inUpNextText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "inUpNextText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setInUpNextText:](v5, "setInUpNextText:", v19);

    }
    objc_msgSend(v4, "addToUpNextText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "addToUpNextText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setAddToUpNextText:](v5, "setAddToUpNextText:", v21);

    }
    objc_msgSend(v4, "addedToUpNextText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "addedToUpNextText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setAddedToUpNextText:](v5, "setAddedToUpNextText:", v23);

    }
    objc_msgSend(v4, "watchLiveTextFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "watchLiveTextFormat");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWatchListItem setWatchLiveTextFormat:](v5, "setWatchLiveTextFormat:", v25);

    }
    if (objc_msgSend(v4, "isMediaContainer"))
      -[SFWatchListItem setIsMediaContainer:](v5, "setIsMediaContainer:", objc_msgSend(v4, "isMediaContainer"));
    if (objc_msgSend(v4, "type"))
      -[SFWatchListItem setType:](v5, "setType:", objc_msgSend(v4, "type"));
    v26 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFWatchListItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBWatchListItem *v6;
  SFWatchListItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBWatchListItem initWithData:]([_SFPBWatchListItem alloc], "initWithData:", v5);
  v7 = -[SFWatchListItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBWatchListItem *v6;

  v4 = a3;
  v6 = -[_SFPBWatchListItem initWithFacade:]([_SFPBWatchListItem alloc], "initWithFacade:", self);
  -[_SFPBWatchListItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBWatchListItem *v2;
  void *v3;

  v2 = -[_SFPBWatchListItem initWithFacade:]([_SFPBWatchListItem alloc], "initWithFacade:", self);
  -[_SFPBWatchListItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBWatchListItem *v2;
  void *v3;

  v2 = -[_SFPBWatchListItem initWithFacade:]([_SFPBWatchListItem alloc], "initWithFacade:", self);
  -[_SFPBWatchListItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFWatchListItem watchListIdentifier](self, "watchListIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setWatchListIdentifier:", v6);

  -[SFWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSeasonEpisodeTextFormat:", v8);

  -[SFWatchListItem continueInTextFormat](self, "continueInTextFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setContinueInTextFormat:", v10);

  -[SFWatchListItem openButtonTitle](self, "openButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setOpenButtonTitle:", v12);

  -[SFWatchListItem installButtonTitle](self, "installButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setInstallButtonTitle:", v14);

  -[SFWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setPurchaseOfferTextFormat:", v16);

  -[SFWatchListItem inUpNextText](self, "inUpNextText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setInUpNextText:", v18);

  -[SFWatchListItem addToUpNextText](self, "addToUpNextText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setAddToUpNextText:", v20);

  -[SFWatchListItem addedToUpNextText](self, "addedToUpNextText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setAddedToUpNextText:", v22);

  -[SFWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setWatchLiveTextFormat:", v24);

  objc_msgSend(v4, "setIsMediaContainer:", -[SFWatchListItem isMediaContainer](self, "isMediaContainer"));
  objc_msgSend(v4, "setType:", -[SFWatchListItem type](self, "type"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFWatchListItem *v4;
  SFWatchListItem *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  _BOOL4 v40;
  int v41;
  void *v42;
  SFWatchListItem *v43;
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
  _BOOL4 v90;
  void *v91;
  _QWORD v92[6];
  int v93;
  int v94;
  id v95;
  id v96;
  _QWORD v97[4];

  v4 = (SFWatchListItem *)a3;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_112;
  }
  if (!-[SFWatchListItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v18 = 0;
    goto LABEL_112;
  }
  v5 = v4;
  -[SFWatchListItem watchListIdentifier](self, "watchListIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem watchListIdentifier](v5, "watchListIdentifier");
  v95 = (id)objc_claimAutoreleasedReturnValue();
  v96 = v6;
  v93 = v95 != 0;
  v94 = v6 == 0;
  if (v94 == v93)
  {
    memset(v92, 0, sizeof(v92));
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v97, 0, 28);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_121;
  }
  -[SFWatchListItem watchListIdentifier](self, "watchListIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  v91 = (void *)v7;
  if (v7)
  {
    -[SFWatchListItem watchListIdentifier](self, "watchListIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem watchListIdentifier](v5, "watchListIdentifier");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      v10 = 0;
      memset(v92, 0, 44);
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v97, 0, 28);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      HIDWORD(v92[5]) = 1;
      goto LABEL_121;
    }
  }
  -[SFWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem seasonEpisodeTextFormat](v5, "seasonEpisodeTextFormat");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v92[5]) = v8;
  if ((v89 == 0) == (v88 != 0))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    memset(v92, 0, 36);
    v14 = 0;
    v15 = 0;
    memset(v97, 0, 28);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)((char *)&v92[4] + 4) = 1;
    goto LABEL_121;
  }
  -[SFWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
  v19 = objc_claimAutoreleasedReturnValue();
  LODWORD(v97[3]) = v19 != 0;
  v85 = (void *)v19;
  if (v19)
  {
    -[SFWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem seasonEpisodeTextFormat](v5, "seasonEpisodeTextFormat");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v92, 0, 32);
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      memset(v97, 0, 24);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v92[5]) = 0;
      v92[4] = 0x100000001;
      LODWORD(v97[3]) = 1;
      goto LABEL_121;
    }
  }
  -[SFWatchListItem continueInTextFormat](self, "continueInTextFormat");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem continueInTextFormat](v5, "continueInTextFormat");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v84 == 0) == (v83 != 0))
  {
    v10 = 0;
    memset(v92, 0, 24);
    v11 = 0;
    v12 = 0;
    v13 = 0;
    memset(v97, 0, 24);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v92[5]) = 0;
    v92[4] = 0x100000001;
    v92[3] = 1;
    goto LABEL_121;
  }
  -[SFWatchListItem continueInTextFormat](self, "continueInTextFormat");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v97[2]) = v80 != 0;
  if (v80)
  {
    -[SFWatchListItem continueInTextFormat](self, "continueInTextFormat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem continueInTextFormat](v5, "continueInTextFormat");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v21;
    if (!objc_msgSend(v21, "isEqual:"))
    {
      v10 = 0;
      memset(v92, 0, 24);
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v97, 0, 20);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v92[5]) = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      HIDWORD(v97[2]) = 1;
      goto LABEL_121;
    }
  }
  -[SFWatchListItem openButtonTitle](self, "openButtonTitle");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem openButtonTitle](v5, "openButtonTitle");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v79 == 0) == (v78 != 0))
  {
    v92[0] = 0;
    v92[1] = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v97, 0, 20);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v92[5]) = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 1;
    goto LABEL_121;
  }
  -[SFWatchListItem openButtonTitle](self, "openButtonTitle");
  v22 = objc_claimAutoreleasedReturnValue();
  LODWORD(v97[2]) = v22 != 0;
  v75 = (void *)v22;
  if (v22)
  {
    -[SFWatchListItem openButtonTitle](self, "openButtonTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem openButtonTitle](v5, "openButtonTitle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      v92[0] = 0;
      v92[1] = 0;
      v10 = 0;
      v97[1] = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v97[0] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v92[5]) = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      LODWORD(v97[2]) = 1;
      goto LABEL_121;
    }
  }
  -[SFWatchListItem installButtonTitle](self, "installButtonTitle");
  v24 = objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem installButtonTitle](v5, "installButtonTitle");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)v24;
  if ((v24 == 0) == (v73 != 0))
  {
    v10 = 0;
    v92[0] = 0;
    v97[1] = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v97[0] = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v92[5]) = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 1;
    goto LABEL_121;
  }
  -[SFWatchListItem installButtonTitle](self, "installButtonTitle");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25 != 0;
  v70 = (void *)v25;
  if (v25)
  {
    -[SFWatchListItem installButtonTitle](self, "installButtonTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem installButtonTitle](v5, "installButtonTitle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v27;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      v10 = 0;
      v92[0] = 0;
      v97[1] = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v97[0] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      LODWORD(v92[5]) = 1;
      goto LABEL_121;
    }
    LODWORD(v92[5]) = v26;
  }
  else
  {
    LODWORD(v92[5]) = 0;
  }
  -[SFWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
  v28 = objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem purchaseOfferTextFormat](v5, "purchaseOfferTextFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v28;
  if ((v28 == 0) == (v68 != 0))
  {
    v92[0] = 0;
    v97[1] = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v97[0] = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    v10 = 1;
    goto LABEL_121;
  }
  -[SFWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v97[1]) = v65 != 0;
  if (v65)
  {
    -[SFWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem purchaseOfferTextFormat](v5, "purchaseOfferTextFormat");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      v11 = 0;
      v12 = 0;
      *(_QWORD *)((char *)v97 + 4) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LODWORD(v97[0]) = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      v10 = 1;
      v92[0] = 0x100000000;
      HIDWORD(v97[1]) = 1;
      goto LABEL_121;
    }
  }
  -[SFWatchListItem inUpNextText](self, "inUpNextText");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem inUpNextText](v5, "inUpNextText");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v64 == 0) == (v63 != 0))
  {
    v12 = 0;
    *(_QWORD *)((char *)v97 + 4) = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    LODWORD(v97[0]) = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    v10 = 1;
    v92[0] = 0x100000000;
    v11 = 1;
    goto LABEL_121;
  }
  -[SFWatchListItem inUpNextText](self, "inUpNextText");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v97[1]) = v60 != 0;
  if (v60)
  {
    -[SFWatchListItem inUpNextText](self, "inUpNextText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem inUpNextText](v5, "inUpNextText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v30;
    if (!objc_msgSend(v30, "isEqual:"))
    {
      v13 = 0;
      v97[0] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      v10 = 1;
      v92[0] = 0x100000000;
      v11 = 1;
      v12 = 1;
      LODWORD(v97[1]) = 1;
      goto LABEL_121;
    }
  }
  -[SFWatchListItem addToUpNextText](self, "addToUpNextText");
  v31 = objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem addToUpNextText](v5, "addToUpNextText");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v31;
  if ((v31 == 0) == (v58 != 0))
  {
    v97[0] = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    v10 = 1;
    v92[0] = 0x100000000;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    goto LABEL_121;
  }
  -[SFWatchListItem addToUpNextText](self, "addToUpNextText");
  v32 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v97[0]) = v32 != 0;
  v55 = (void *)v32;
  v43 = v5;
  if (v32)
  {
    -[SFWatchListItem addToUpNextText](self, "addToUpNextText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem addToUpNextText](v5, "addToUpNextText");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      v14 = 0;
      v15 = 0;
      v97[0] = 0x100000000;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      v10 = 1;
      v92[0] = 0x100000001;
      v11 = 1;
      v12 = 1;
      v13 = 1;
LABEL_57:
      v5 = v43;
      goto LABEL_121;
    }
  }
  -[SFWatchListItem addedToUpNextText](self, "addedToUpNextText");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem addedToUpNextText](v5, "addedToUpNextText");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v54 == 0) == (v53 != 0))
  {
    v15 = 0;
    LODWORD(v97[0]) = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    v10 = 1;
    v92[0] = 0x100000001;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    goto LABEL_57;
  }
  -[SFWatchListItem addedToUpNextText](self, "addedToUpNextText");
  v34 = objc_claimAutoreleasedReturnValue();
  LODWORD(v97[0]) = v34 != 0;
  v50 = (void *)v34;
  if (v34)
  {
    -[SFWatchListItem addedToUpNextText](self, "addedToUpNextText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem addedToUpNextText](v43, "addedToUpNextText");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      v10 = 1;
      v92[0] = 0x100000001;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v14 = 1;
      v15 = 1;
      LODWORD(v97[0]) = 1;
      goto LABEL_57;
    }
  }
  -[SFWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWatchListItem watchLiveTextFormat](v43, "watchLiveTextFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v49 == 0) == (v48 != 0))
  {
    v17 = 0;
    v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    v10 = 1;
    v92[0] = 0x100000001;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    goto LABEL_57;
  }
  -[SFWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
  v36 = objc_claimAutoreleasedReturnValue();
  v90 = v36 != 0;
  v45 = (void *)v36;
  if (v36)
  {
    -[SFWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWatchListItem watchLiveTextFormat](v43, "watchLiveTextFormat");
    v44 = v37;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v37, "isEqual:"))
    {
      v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      v10 = 1;
      v92[0] = 0x100000001;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v14 = 1;
      v15 = 1;
      v16 = 1;
      v17 = 1;
      v38 = 1;
LABEL_118:
      v5 = v43;
      goto LABEL_120;
    }
  }
  v40 = -[SFWatchListItem isMediaContainer](self, "isMediaContainer");
  if (v40 != -[SFWatchListItem isMediaContainer](v43, "isMediaContainer"))
  {
    v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    v10 = 1;
    v92[0] = 0x100000001;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v17 = 1;
    v38 = v90;
    goto LABEL_118;
  }
  v41 = -[SFWatchListItem type](self, "type");
  v5 = v43;
  v18 = v41 == -[SFWatchListItem type](v43, "type");
  v92[4] = 0x100000001;
  v92[3] = 0x100000001;
  v92[2] = 0x100000001;
  v92[1] = 0x100000001;
  v10 = 1;
  v92[0] = 0x100000001;
  v11 = 1;
  v12 = 1;
  v13 = 1;
  v14 = 1;
  v15 = 1;
  v16 = 1;
  v17 = 1;
  v38 = v90;
LABEL_120:
  if (v38)
  {

    v16 = 1;
    v15 = 1;
    v12 = 1;
    v10 = 1;
    v14 = 1;
    v11 = 1;
    v13 = 1;
    goto LABEL_122;
  }
LABEL_121:
  if (!v17)
  {
    if (!v16)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_122:

  if (v16)
  {
LABEL_60:

  }
LABEL_61:
  if (LODWORD(v97[0]))
  {

    if (!v15)
      goto LABEL_63;
LABEL_114:

    if (!v14)
      goto LABEL_65;
    goto LABEL_64;
  }
  if (v15)
    goto LABEL_114;
LABEL_63:
  if (v14)
  {
LABEL_64:

  }
LABEL_65:
  if (HIDWORD(v97[0]))
  {

  }
  if (LODWORD(v92[0]))

  if (v13)
  {

  }
  if (LODWORD(v97[1]))
  {

  }
  if (v12)

  if (v11)
  {

  }
  if (HIDWORD(v97[1]))
  {

  }
  if (HIDWORD(v92[0]))

  if (v10)
  {

  }
  if (LODWORD(v92[5]))
  {

  }
  if (HIDWORD(v92[1]))

  if (LODWORD(v92[1]))
  {

  }
  if (LODWORD(v97[2]))
  {

  }
  if (HIDWORD(v92[2]))

  if (LODWORD(v92[2]))
  {

  }
  if (HIDWORD(v97[2]))
  {

  }
  if (HIDWORD(v92[3]))

  if (LODWORD(v92[3]))
  {

  }
  if (LODWORD(v97[3]))
  {

  }
  if (LODWORD(v92[4]))

  if (HIDWORD(v92[4]))
  {

  }
  if (HIDWORD(v92[5]))
  {

  }
  if (v94 != v93)

LABEL_112:
  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v23;
  void *v24;
  void *v25;

  -[SFWatchListItem watchListIdentifier](self, "watchListIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[SFWatchListItem seasonEpisodeTextFormat](self, "seasonEpisodeTextFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash") ^ v3;
  -[SFWatchListItem continueInTextFormat](self, "continueInTextFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v23, "hash");
  -[SFWatchListItem openButtonTitle](self, "openButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[SFWatchListItem installButtonTitle](self, "installButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFWatchListItem purchaseOfferTextFormat](self, "purchaseOfferTextFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[SFWatchListItem inUpNextText](self, "inUpNextText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[SFWatchListItem addToUpNextText](self, "addToUpNextText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFWatchListItem addedToUpNextText](self, "addedToUpNextText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFWatchListItem watchLiveTextFormat](self, "watchLiveTextFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  v20 = v13 ^ v19 ^ -[SFWatchListItem isMediaContainer](self, "isMediaContainer");
  v21 = v20 ^ -[SFWatchListItem type](self, "type");

  return v21;
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (void)setWatchListIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)seasonEpisodeTextFormat
{
  return self->_seasonEpisodeTextFormat;
}

- (void)setSeasonEpisodeTextFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)continueInTextFormat
{
  return self->_continueInTextFormat;
}

- (void)setContinueInTextFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (void)setOpenButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)installButtonTitle
{
  return self->_installButtonTitle;
}

- (void)setInstallButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)purchaseOfferTextFormat
{
  return self->_purchaseOfferTextFormat;
}

- (void)setPurchaseOfferTextFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)inUpNextText
{
  return self->_inUpNextText;
}

- (void)setInUpNextText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)addToUpNextText
{
  return self->_addToUpNextText;
}

- (void)setAddToUpNextText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)addedToUpNextText
{
  return self->_addedToUpNextText;
}

- (void)setAddedToUpNextText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)watchLiveTextFormat
{
  return self->_watchLiveTextFormat;
}

- (void)setWatchLiveTextFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
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
