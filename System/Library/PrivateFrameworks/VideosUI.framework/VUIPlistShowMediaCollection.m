@implementation VUIPlistShowMediaCollection

- (VUIPlistShowMediaCollection)initWithMediaLibrary:(id)a3 databaseShow:(id)a4 requestedProperties:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUIPlistMediaEntityIdentifier *v12;
  void *v13;
  VUIPlistMediaEntityIdentifier *v14;
  void *v15;
  VUIPlistShowMediaCollection *v16;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = [VUIPlistMediaEntityIdentifier alloc];
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIPlistMediaEntityIdentifier initWithIdentifier:type:](v12, "initWithIdentifier:type:", v13, 4);

  VUIPlistShowMediaKind();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistShowMediaCollection;
  v16 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v18, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v11, v14, v10, v15);

  if (v16)
    objc_storeStrong((id *)&v16->_databaseShow, a4);

  return v16;
}

- (VUIPlistShowMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
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

  -[VUIPlistShowMediaCollection databaseShow](self, "databaseShow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverArtURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)playedState
{
  return &unk_1EA0B93A0;
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
    -[VUIPlistShowMediaCollection databaseShow](self, "databaseShow");
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[VUIPlistShowMediaCollection databaseShow](self, "databaseShow", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "episodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "count");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
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
    -[VUIPlistShowMediaCollection databaseShow](self, "databaseShow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coverArtURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlistShowMediaCollection coverArtImageIdentifier](self, "coverArtImageIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[VUIPlistMediaEntityImageLoadParams initWithImageURL:baseImageIdentifier:imageType:]([VUIPlistMediaEntityImageLoadParams alloc], "initWithImageURL:baseImageIdentifier:imageType:", v6, v7, 0);

  }
  return v3;
}

- (VUIPlistMediaDatabaseShow)databaseShow
{
  return self->_databaseShow;
}

- (void)setDatabaseShow:(id)a3
{
  objc_storeStrong((id *)&self->_databaseShow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseShow, 0);
}

@end
