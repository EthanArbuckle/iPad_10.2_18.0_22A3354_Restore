@implementation _SFPBMediaMetadata

- (_SFPBMediaMetadata)initWithFacade:(id)a3
{
  id v4;
  _SFPBMediaMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _SFPBPunchout *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _SFPBMediaMetadata *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBMediaMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "mediaName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "mediaName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaMetadata setMediaName:](v5, "setMediaName:", v7);

    }
    if (objc_msgSend(v4, "hasMediaType"))
      -[_SFPBMediaMetadata setMediaType:](v5, "setMediaType:", objc_msgSend(v4, "mediaType"));
    objc_msgSend(v4, "artistName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "artistName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaMetadata setArtistName:](v5, "setArtistName:", v9);

    }
    objc_msgSend(v4, "albumName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "albumName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaMetadata setAlbumName:](v5, "setAlbumName:", v11);

    }
    objc_msgSend(v4, "mediaPunchouts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "mediaPunchouts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          v19 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v16);
    }

    -[_SFPBMediaMetadata setMediaPunchouts:](v5, "setMediaPunchouts:", v13);
    objc_msgSend(v4, "bundleIdentifiersToExclude");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v21 = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "bundleIdentifiersToExclude", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          if (*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j))
            objc_msgSend(v21, "addObject:");
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v24);
    }

    -[_SFPBMediaMetadata setBundleIdentifiersToExcludes:](v5, "setBundleIdentifiersToExcludes:", v21);
    objc_msgSend(v4, "disambiguationTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "disambiguationTitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaMetadata setDisambiguationTitle:](v5, "setDisambiguationTitle:", v28);

    }
    objc_msgSend(v4, "mediaIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "mediaIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaMetadata setMediaIdentifier:](v5, "setMediaIdentifier:", v30);

    }
    v31 = v5;

  }
  return v5;
}

- (void)setMediaName:(id)a3
{
  NSString *v4;
  NSString *mediaName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  mediaName = self->_mediaName;
  self->_mediaName = v4;

}

- (void)setMediaType:(int)a3
{
  self->_mediaType = a3;
}

- (void)setArtistName:(id)a3
{
  NSString *v4;
  NSString *artistName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  artistName = self->_artistName;
  self->_artistName = v4;

}

- (void)setAlbumName:(id)a3
{
  NSString *v4;
  NSString *albumName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  albumName = self->_albumName;
  self->_albumName = v4;

}

- (void)setMediaPunchouts:(id)a3
{
  NSArray *v4;
  NSArray *mediaPunchouts;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  mediaPunchouts = self->_mediaPunchouts;
  self->_mediaPunchouts = v4;

}

- (void)clearMediaPunchouts
{
  -[NSArray removeAllObjects](self->_mediaPunchouts, "removeAllObjects");
}

- (void)addMediaPunchouts:(id)a3
{
  id v4;
  NSArray *mediaPunchouts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  mediaPunchouts = self->_mediaPunchouts;
  v8 = v4;
  if (!mediaPunchouts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mediaPunchouts;
    self->_mediaPunchouts = v6;

    v4 = v8;
    mediaPunchouts = self->_mediaPunchouts;
  }
  -[NSArray addObject:](mediaPunchouts, "addObject:", v4);

}

- (unint64_t)mediaPunchoutsCount
{
  return -[NSArray count](self->_mediaPunchouts, "count");
}

- (id)mediaPunchoutsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_mediaPunchouts, "objectAtIndexedSubscript:", a3);
}

- (void)setBundleIdentifiersToExclude:(id)a3
{
  NSArray *v4;
  NSArray *bundleIdentifiersToExcludes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  bundleIdentifiersToExcludes = self->_bundleIdentifiersToExcludes;
  self->_bundleIdentifiersToExcludes = v4;

}

- (void)clearBundleIdentifiersToExclude
{
  -[NSArray removeAllObjects](self->_bundleIdentifiersToExcludes, "removeAllObjects");
}

- (void)addBundleIdentifiersToExclude:(id)a3
{
  id v4;
  NSArray *bundleIdentifiersToExcludes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  bundleIdentifiersToExcludes = self->_bundleIdentifiersToExcludes;
  v8 = v4;
  if (!bundleIdentifiersToExcludes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bundleIdentifiersToExcludes;
    self->_bundleIdentifiersToExcludes = v6;

    v4 = v8;
    bundleIdentifiersToExcludes = self->_bundleIdentifiersToExcludes;
  }
  -[NSArray addObject:](bundleIdentifiersToExcludes, "addObject:", v4);

}

- (unint64_t)bundleIdentifiersToExcludeCount
{
  return -[NSArray count](self->_bundleIdentifiersToExcludes, "count");
}

- (id)bundleIdentifiersToExcludeAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_bundleIdentifiersToExcludes, "objectAtIndexedSubscript:", a3);
}

- (void)setDisambiguationTitle:(id)a3
{
  NSString *v4;
  NSString *disambiguationTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  disambiguationTitle = self->_disambiguationTitle;
  self->_disambiguationTitle = v4;

}

- (void)setMediaIdentifier:(id)a3
{
  NSString *v4;
  NSString *mediaIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  mediaIdentifier = self->_mediaIdentifier;
  self->_mediaIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBMediaMetadata mediaName](self, "mediaName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBMediaMetadata mediaType](self, "mediaType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMediaMetadata artistName](self, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBMediaMetadata albumName](self, "albumName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBMediaMetadata mediaPunchouts](self, "mediaPunchouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  -[_SFPBMediaMetadata bundleIdentifiersToExcludes](self, "bundleIdentifiersToExcludes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  -[_SFPBMediaMetadata disambiguationTitle](self, "disambiguationTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteStringField();

  -[_SFPBMediaMetadata mediaIdentifier](self, "mediaIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteStringField();

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
  int mediaType;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[_SFPBMediaMetadata mediaName](self, "mediaName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBMediaMetadata mediaName](self, "mediaName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBMediaMetadata mediaName](self, "mediaName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_38;
  }
  else
  {

  }
  mediaType = self->_mediaType;
  if (mediaType != objc_msgSend(v4, "mediaType"))
    goto LABEL_38;
  -[_SFPBMediaMetadata artistName](self, "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBMediaMetadata artistName](self, "artistName");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBMediaMetadata artistName](self, "artistName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artistName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBMediaMetadata albumName](self, "albumName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBMediaMetadata albumName](self, "albumName");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_SFPBMediaMetadata albumName](self, "albumName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBMediaMetadata mediaPunchouts](self, "mediaPunchouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPunchouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBMediaMetadata mediaPunchouts](self, "mediaPunchouts");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBMediaMetadata mediaPunchouts](self, "mediaPunchouts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPunchouts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBMediaMetadata bundleIdentifiersToExcludes](self, "bundleIdentifiersToExcludes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifiersToExcludes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBMediaMetadata bundleIdentifiersToExcludes](self, "bundleIdentifiersToExcludes");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBMediaMetadata bundleIdentifiersToExcludes](self, "bundleIdentifiersToExcludes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifiersToExcludes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBMediaMetadata disambiguationTitle](self, "disambiguationTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disambiguationTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[_SFPBMediaMetadata disambiguationTitle](self, "disambiguationTitle");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBMediaMetadata disambiguationTitle](self, "disambiguationTitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disambiguationTitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[_SFPBMediaMetadata mediaIdentifier](self, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_37:

    goto LABEL_38;
  }
  -[_SFPBMediaMetadata mediaIdentifier](self, "mediaIdentifier");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {

LABEL_41:
    v43 = 1;
    goto LABEL_39;
  }
  v39 = (void *)v38;
  -[_SFPBMediaMetadata mediaIdentifier](self, "mediaIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "isEqual:", v41);

  if ((v42 & 1) != 0)
    goto LABEL_41;
LABEL_38:
  v43 = 0;
LABEL_39:

  return v43;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_mediaName, "hash");
  v4 = 2654435761 * self->_mediaType;
  v5 = v3 ^ -[NSString hash](self->_artistName, "hash");
  v6 = v5 ^ -[NSString hash](self->_albumName, "hash");
  v7 = v6 ^ -[NSArray hash](self->_mediaPunchouts, "hash");
  v8 = v4 ^ v7 ^ -[NSArray hash](self->_bundleIdentifiersToExcludes, "hash");
  v9 = -[NSString hash](self->_disambiguationTitle, "hash");
  return v8 ^ v9 ^ -[NSString hash](self->_mediaIdentifier, "hash");
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
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_albumName)
  {
    -[_SFPBMediaMetadata albumName](self, "albumName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("albumName"));

  }
  if (self->_artistName)
  {
    -[_SFPBMediaMetadata artistName](self, "artistName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("artistName"));

  }
  if (self->_bundleIdentifiersToExcludes)
  {
    -[_SFPBMediaMetadata bundleIdentifiersToExcludes](self, "bundleIdentifiersToExcludes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bundleIdentifiersToExclude"));

  }
  if (self->_disambiguationTitle)
  {
    -[_SFPBMediaMetadata disambiguationTitle](self, "disambiguationTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("disambiguationTitle"));

  }
  if (self->_mediaIdentifier)
  {
    -[_SFPBMediaMetadata mediaIdentifier](self, "mediaIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("mediaIdentifier"));

  }
  if (self->_mediaName)
  {
    -[_SFPBMediaMetadata mediaName](self, "mediaName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mediaName"));

  }
  if (-[NSArray count](self->_mediaPunchouts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = self->_mediaPunchouts;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaPunchouts"));
  }
  if (self->_mediaType)
  {
    v24 = -[_SFPBMediaMetadata mediaType](self, "mediaType");
    v25 = CFSTR("0");
    switch((int)v24)
    {
      case 0:
        break;
      case 1:
        v25 = CFSTR("1");
        break;
      case 2:
        v25 = CFSTR("2");
        break;
      case 3:
        v25 = CFSTR("3");
        break;
      case 4:
        v25 = CFSTR("4");
        break;
      case 5:
        v25 = CFSTR("5");
        break;
      case 6:
        v25 = CFSTR("6");
        break;
      case 7:
        v25 = CFSTR("7");
        break;
      case 8:
        v25 = CFSTR("8");
        break;
      case 9:
        v25 = CFSTR("9");
        break;
      case 10:
        v25 = CFSTR("10");
        break;
      case 11:
        v25 = CFSTR("11");
        break;
      case 12:
        v25 = CFSTR("12");
        break;
      case 13:
        v25 = CFSTR("13");
        break;
      case 14:
        v25 = CFSTR("14");
        break;
      case 15:
        v25 = CFSTR("15");
        break;
      case 16:
        v25 = CFSTR("16");
        break;
      case 17:
        v25 = CFSTR("17");
        break;
      case 18:
        v25 = CFSTR("18");
        break;
      case 19:
        v25 = CFSTR("19");
        break;
      case 20:
        v25 = CFSTR("20");
        break;
      default:
        if ((_DWORD)v24 == 100)
        {
          v25 = CFSTR("100");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v24);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("mediaType"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMediaMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMediaMetadata)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMediaMetadata *v5;
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
    self = -[_SFPBMediaMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMediaMetadata)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMediaMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  _SFPBPunchout *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _SFPBMediaMetadata *v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_SFPBMediaMetadata;
  v5 = -[_SFPBMediaMetadata init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBMediaMetadata setMediaName:](v5, "setMediaName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaMetadata setMediaType:](v5, "setMediaType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artistName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[_SFPBMediaMetadata setArtistName:](v5, "setArtistName:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("albumName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[_SFPBMediaMetadata setAlbumName:](v5, "setAlbumName:", v12);

    }
    v37 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaPunchouts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v13;
    v38 = v9;
    v39 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v6;
      v36 = v4;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v46 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v19);
              -[_SFPBMediaMetadata addMediaPunchouts:](v5, "addMediaPunchouts:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v16);
      }

      v4 = v36;
      v8 = v39;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifiersToExclude"), v35, v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v42 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = (void *)objc_msgSend(v27, "copy");
              -[_SFPBMediaMetadata addBundleIdentifiersToExclude:](v5, "addBundleIdentifiersToExclude:", v28);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v24);
      }

      v9 = v38;
      v8 = v39;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationTitle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)objc_msgSend(v29, "copy");
      -[_SFPBMediaMetadata setDisambiguationTitle:](v5, "setDisambiguationTitle:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = (void *)objc_msgSend(v31, "copy");
      -[_SFPBMediaMetadata setMediaIdentifier:](v5, "setMediaIdentifier:", v32);

    }
    v33 = v5;

  }
  return v5;
}

- (NSString)mediaName
{
  return self->_mediaName;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSArray)mediaPunchouts
{
  return self->_mediaPunchouts;
}

- (NSArray)bundleIdentifiersToExcludes
{
  return self->_bundleIdentifiersToExcludes;
}

- (void)setBundleIdentifiersToExcludes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)disambiguationTitle
{
  return self->_disambiguationTitle;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_disambiguationTitle, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersToExcludes, 0);
  objc_storeStrong((id *)&self->_mediaPunchouts, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
}

@end
