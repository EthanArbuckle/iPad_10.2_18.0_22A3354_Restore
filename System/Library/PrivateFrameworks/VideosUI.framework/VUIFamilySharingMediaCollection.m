@implementation VUIFamilySharingMediaCollection

- (VUIFamilySharingMediaCollection)initWithAMSEntity:(id)a3 requestedProperties:(id)a4 mediaEntityType:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUIFamilySharingMediaEntityIdentifier *v12;
  void *v13;
  VUIFamilySharingMediaEntityIdentifier *v14;
  void *v15;
  VUIFamilySharingMediaCollection *v16;
  NSArray *v17;
  NSArray *seasonNumbers;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = [VUIFamilySharingMediaEntityIdentifier alloc];
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIFamilySharingMediaEntityIdentifier initWithEntityIdentifier:mediaEntityType:](v12, "initWithEntityIdentifier:mediaEntityType:", v13, v10);

  VUIFamilySharingMediaCollectionKind();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)VUIFamilySharingMediaCollection;
  v16 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v20, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, 0, v14, v11, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_entity, a3);
    v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    seasonNumbers = v16->_seasonNumbers;
    v16->_seasonNumbers = v17;

  }
  return v16;
}

- (id)title
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)artworkURL
{
  NSString *artworkURL;
  void *v4;
  NSString *v5;
  NSString *v6;

  artworkURL = self->_artworkURL;
  if (!artworkURL)
  {
    -[VUIFamilySharingMediaCollection entity](self, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artworkURL");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_artworkURL;
    self->_artworkURL = v5;

    artworkURL = self->_artworkURL;
  }
  return artworkURL;
}

- (id)seasonNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seasonNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIFamilySharingMediaCollection entity](self, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seasonNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)amsShowIdentifier
{
  NSString *amsShowIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  amsShowIdentifier = self->_amsShowIdentifier;
  if (!amsShowIdentifier)
  {
    -[VUIFamilySharingMediaCollection entity](self, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relationships");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "show");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "identifier");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_amsShowIdentifier;
      self->_amsShowIdentifier = v7;

    }
    amsShowIdentifier = self->_amsShowIdentifier;
  }
  return amsShowIdentifier;
}

- (NSString)amsSeasonIdentifier
{
  NSString *amsSeasonIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  amsSeasonIdentifier = self->_amsSeasonIdentifier;
  if (!amsSeasonIdentifier)
  {
    -[VUIFamilySharingMediaCollection entity](self, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relationships");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "season");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "identifier");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_amsSeasonIdentifier;
      self->_amsSeasonIdentifier = v7;

    }
    amsSeasonIdentifier = self->_amsSeasonIdentifier;
  }
  return amsSeasonIdentifier;
}

- (id)seasonCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VUIFamilySharingMediaCollection seasonNumbers](self, "seasonNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[VUIFamilySharingMediaCollection seasonNumbers](self, "seasonNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &unk_1EA0BAB58;
  }
  return v6;
}

- (id)contentRating
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentRating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentDescription
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "standardDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)releaseDate
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)releaseYear
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[VUIFamilySharingMediaCollection releaseDate](self, "releaseDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "components:fromDate:", 4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "year");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)genreTitle
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "genreTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)duration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offerListing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestStoreBuyOffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vui_numberForKey:", CFSTR("durationInMilliseconds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "doubleValue"), v7 / 1000.0 > 0.0))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)showTitle
{
  void *v2;
  void *v3;

  -[VUIFamilySharingMediaCollection entity](self, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (void)setAmsShowIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_amsShowIdentifier, a3);
}

- (void)setAmsSeasonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_amsSeasonIdentifier, a3);
}

- (NSArray)seasonNumbers
{
  return self->_seasonNumbers;
}

- (void)setSeasonNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_seasonNumbers, a3);
}

- (VUIFamilySharingEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_seasonNumbers, 0);
  objc_storeStrong((id *)&self->_amsSeasonIdentifier, 0);
  objc_storeStrong((id *)&self->_amsShowIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end
