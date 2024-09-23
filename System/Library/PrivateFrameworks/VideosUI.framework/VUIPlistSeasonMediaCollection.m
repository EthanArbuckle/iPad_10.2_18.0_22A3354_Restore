@implementation VUIPlistSeasonMediaCollection

- (VUIPlistSeasonMediaCollection)initWithMediaLibrary:(id)a3 databaseSeason:(id)a4 requestedProperties:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUIPlistMediaEntityIdentifier *v12;
  void *v13;
  VUIPlistMediaEntityIdentifier *v14;
  void *v15;
  VUIPlistSeasonMediaCollection *v16;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = [VUIPlistMediaEntityIdentifier alloc];
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIPlistMediaEntityIdentifier initWithIdentifier:type:](v12, "initWithIdentifier:type:", v13, 5);

  VUIPlistSeasonMediaKind();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistSeasonMediaCollection;
  v16 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v18, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v11, v14, v10, v15);

  if (v16)
    objc_storeStrong((id *)&v16->_databaseSeason, a4);

  return v16;
}

- (VUIPlistSeasonMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The %@ initializer is not available."), v9);

  return 0;
}

- (id)coverArtImageIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIPlistSeasonMediaCollection databaseSeason](self, "databaseSeason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverArtURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)playedState
{
  return &unk_1EA0B9370;
}

- (id)showIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  VUIPlistMediaEntityIdentifier *v5;

  -[VUIPlistSeasonMediaCollection databaseSeason](self, "databaseSeason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "show");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[VUIPlistMediaEntityIdentifier initWithIdentifier:type:]([VUIPlistMediaEntityIdentifier alloc], "initWithIdentifier:type:", v4, 4);
  return v5;
}

- (id)showTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIPlistSeasonMediaCollection databaseSeason](self, "databaseSeason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "show");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)seasonNumber
{
  void *v2;
  void *v3;

  -[VUIPlistSeasonMediaCollection databaseSeason](self, "databaseSeason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seasonNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "sourcePropertyNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[VUIPlistSeasonMediaCollection databaseSeason](self, "databaseSeason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSSelectorFromString(v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "valueForKey:", v6);
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

- (id)mediaItemCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[VUIPlistSeasonMediaCollection databaseSeason](self, "databaseSeason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "episodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  VUIPlistMediaEntityImageLoadParams *v3;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[VUIPlistSeasonMediaCollection databaseSeason](self, "databaseSeason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coverArtURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlistSeasonMediaCollection coverArtImageIdentifier](self, "coverArtImageIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[VUIPlistMediaEntityImageLoadParams initWithImageURL:baseImageIdentifier:imageType:]([VUIPlistMediaEntityImageLoadParams alloc], "initWithImageURL:baseImageIdentifier:imageType:", v6, v7, 0);

  }
  return v3;
}

- (VUIPlistMediaDatabaseSeason)databaseSeason
{
  return self->_databaseSeason;
}

- (void)setDatabaseSeason:(id)a3
{
  objc_storeStrong((id *)&self->_databaseSeason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseSeason, 0);
}

@end
