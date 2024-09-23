@implementation SFMediaMetadata

- (SFMediaMetadata)initWithProtobuf:(id)a3
{
  id v4;
  SFMediaMetadata *v5;
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
  SFPunchout *v19;
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
  SFMediaMetadata *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SFMediaMetadata;
  v5 = -[SFMediaMetadata init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mediaName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "mediaName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaMetadata setMediaName:](v5, "setMediaName:", v7);

    }
    if (objc_msgSend(v4, "mediaType"))
      -[SFMediaMetadata setMediaType:](v5, "setMediaType:", objc_msgSend(v4, "mediaType"));
    objc_msgSend(v4, "artistName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "artistName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaMetadata setArtistName:](v5, "setArtistName:", v9);

    }
    objc_msgSend(v4, "albumName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "albumName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaMetadata setAlbumName:](v5, "setAlbumName:", v11);

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
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
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
          v19 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v16);
    }

    -[SFMediaMetadata setMediaPunchouts:](v5, "setMediaPunchouts:", v13);
    objc_msgSend(v4, "bundleIdentifiersToExcludes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v21 = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "bundleIdentifiersToExcludes", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
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
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v24);
    }

    -[SFMediaMetadata setBundleIdentifiersToExclude:](v5, "setBundleIdentifiersToExclude:", v21);
    objc_msgSend(v4, "disambiguationTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "disambiguationTitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaMetadata setDisambiguationTitle:](v5, "setDisambiguationTitle:", v28);

    }
    objc_msgSend(v4, "mediaIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "mediaIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaMetadata setMediaIdentifier:](v5, "setMediaIdentifier:", v30);

    }
    v31 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setMediaType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mediaType = a3;
}

- (BOOL)hasMediaType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMediaMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaMetadata *v6;
  SFMediaMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMediaMetadata initWithData:]([_SFPBMediaMetadata alloc], "initWithData:", v5);
  v7 = -[SFMediaMetadata initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaMetadata *v6;

  v4 = a3;
  v6 = -[_SFPBMediaMetadata initWithFacade:]([_SFPBMediaMetadata alloc], "initWithFacade:", self);
  -[_SFPBMediaMetadata data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMediaMetadata *v2;
  void *v3;

  v2 = -[_SFPBMediaMetadata initWithFacade:]([_SFPBMediaMetadata alloc], "initWithFacade:", self);
  -[_SFPBMediaMetadata dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMediaMetadata *v2;
  void *v3;

  v2 = -[_SFPBMediaMetadata initWithFacade:]([_SFPBMediaMetadata alloc], "initWithFacade:", self);
  -[_SFPBMediaMetadata jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFMediaMetadata mediaName](self, "mediaName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMediaName:", v6);

  objc_msgSend(v4, "setMediaType:", -[SFMediaMetadata mediaType](self, "mediaType"));
  -[SFMediaMetadata artistName](self, "artistName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setArtistName:", v8);

  -[SFMediaMetadata albumName](self, "albumName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setAlbumName:", v10);

  -[SFMediaMetadata mediaPunchouts](self, "mediaPunchouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setMediaPunchouts:", v12);

  -[SFMediaMetadata bundleIdentifiersToExclude](self, "bundleIdentifiersToExclude");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBundleIdentifiersToExclude:", v14);

  -[SFMediaMetadata disambiguationTitle](self, "disambiguationTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setDisambiguationTitle:", v16);

  -[SFMediaMetadata mediaIdentifier](self, "mediaIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setMediaIdentifier:", v18);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMediaMetadata *v5;
  SFMediaMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
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
  id v63;
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

  v5 = (SFMediaMetadata *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMediaMetadata isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFMediaMetadata mediaName](self, "mediaName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaMetadata mediaName](v6, "mediaName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_47:

        goto LABEL_48;
      }
      -[SFMediaMetadata mediaName](self, "mediaName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFMediaMetadata mediaName](self, "mediaName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaMetadata mediaName](v6, "mediaName");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v10;
        if (!objc_msgSend(v10, "isEqual:"))
        {
          v11 = 0;
          goto LABEL_45;
        }
      }
      v12 = -[SFMediaMetadata mediaType](self, "mediaType");
      if (v12 == -[SFMediaMetadata mediaType](v6, "mediaType"))
      {
        -[SFMediaMetadata artistName](self, "artistName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaMetadata artistName](v6, "artistName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 == 0) == (v14 != 0))
        {
LABEL_42:

          goto LABEL_43;
        }
        v74 = v14;
        -[SFMediaMetadata artistName](self, "artistName");
        v15 = objc_claimAutoreleasedReturnValue();
        v73 = (void *)v15;
        if (v15)
        {
          v16 = (void *)v15;
          -[SFMediaMetadata artistName](self, "artistName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaMetadata artistName](v6, "artistName");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqual:", v3) & 1) == 0)
          {

LABEL_43:
            goto LABEL_44;
          }
          v71 = v9;
          v72 = v13;
          v18 = v76;
          v13 = v17;
        }
        else
        {
          v71 = v9;
          v72 = v13;
          v18 = v76;
        }
        v76 = v18;
        -[SFMediaMetadata albumName](self, "albumName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaMetadata albumName](v6, "albumName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v73;
        v9 = v71;
        if ((v19 == 0) == (v20 != 0))
        {
LABEL_39:

          if (v21)
          {

          }
          v13 = v72;
          v14 = v74;
          goto LABEL_42;
        }
        v69 = v20;
        -[SFMediaMetadata albumName](self, "albumName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v3;
        if (!v68)
        {
          v67 = v19;
          v25 = v13;
          v26 = v73;
          goto LABEL_22;
        }
        v22 = v19;
        -[SFMediaMetadata albumName](self, "albumName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaMetadata albumName](v6, "albumName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
        {
          v64 = v24;
          v65 = v23;
          v67 = v22;
          v25 = v13;
          v26 = v73;
LABEL_22:
          v66 = v25;
          -[SFMediaMetadata mediaPunchouts](self, "mediaPunchouts");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaMetadata mediaPunchouts](v6, "mediaPunchouts");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v26;
          v3 = v70;
          v19 = v67;
          if ((v27 == 0) != (v28 != 0))
          {
            v63 = v28;
            -[SFMediaMetadata mediaPunchouts](self, "mediaPunchouts");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            if (v62)
            {
              -[SFMediaMetadata mediaPunchouts](self, "mediaPunchouts");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMediaMetadata mediaPunchouts](v6, "mediaPunchouts");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = v29;
              if (!objc_msgSend(v29, "isEqual:"))
              {
                v11 = 0;
                v30 = v72;
                v31 = v62;
LABEL_65:

LABEL_66:
                if (v68)
                {

                }
                if (v21)
                {

                }
                if (!v71)
                  goto LABEL_46;
                goto LABEL_45;
              }
            }
            -[SFMediaMetadata bundleIdentifiersToExclude](self, "bundleIdentifiersToExclude");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFMediaMetadata bundleIdentifiersToExclude](v6, "bundleIdentifiersToExclude");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v32 == 0) != (v33 != 0))
            {
              v59 = v33;
              -[SFMediaMetadata bundleIdentifiersToExclude](self, "bundleIdentifiersToExclude");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v27;
              if (v34)
              {
                -[SFMediaMetadata bundleIdentifiersToExclude](self, "bundleIdentifiersToExclude");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFMediaMetadata bundleIdentifiersToExclude](v6, "bundleIdentifiersToExclude");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v35;
                if (!objc_msgSend(v35, "isEqual:"))
                {
                  v11 = 0;
                  v21 = v73;
                  goto LABEL_63;
                }
                v55 = v32;
              }
              else
              {
                v55 = v32;
              }
              -[SFMediaMetadata disambiguationTitle](self, "disambiguationTitle");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMediaMetadata disambiguationTitle](v6, "disambiguationTitle");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v37 == 0) != (v38 != 0))
              {
                v53 = v38;
                -[SFMediaMetadata disambiguationTitle](self, "disambiguationTitle");
                v54 = v34;
                v52 = objc_claimAutoreleasedReturnValue();
                if (!v52
                  || (-[SFMediaMetadata disambiguationTitle](self, "disambiguationTitle"),
                      v39 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFMediaMetadata disambiguationTitle](v6, "disambiguationTitle"),
                      v50 = (void *)objc_claimAutoreleasedReturnValue(),
                      v51 = v39,
                      objc_msgSend(v39, "isEqual:")))
                {
                  -[SFMediaMetadata mediaIdentifier](self, "mediaIdentifier");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFMediaMetadata mediaIdentifier](v6, "mediaIdentifier");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v42 == 0) == (v43 != 0))
                  {

                    v11 = 0;
                    v21 = v73;
                    v40 = v37;
                    v32 = v55;
                    v41 = (void *)v52;
                    if (!v52)
                      goto LABEL_62;
                  }
                  else
                  {
                    v48 = v43;
                    -[SFMediaMetadata mediaIdentifier](self, "mediaIdentifier");
                    v44 = objc_claimAutoreleasedReturnValue();
                    v21 = v73;
                    v49 = v37;
                    if (v44)
                    {
                      v45 = (void *)v44;
                      -[SFMediaMetadata mediaIdentifier](self, "mediaIdentifier");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFMediaMetadata mediaIdentifier](v6, "mediaIdentifier");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v11 = objc_msgSend(v46, "isEqual:", v47);

                    }
                    else
                    {

                      v11 = 1;
                    }
                    v32 = v55;
                    v41 = (void *)v52;
                    v40 = v49;
                    if (!v52)
                    {
LABEL_62:

                      v34 = v54;
                      if (!v54)
                        goto LABEL_64;
                      goto LABEL_63;
                    }
                  }
                }
                else
                {
                  v11 = 0;
                  v21 = v73;
                  v40 = v37;
                  v32 = v55;
                  v41 = (void *)v52;
                }

                goto LABEL_62;
              }

              v11 = 0;
              v21 = v73;
              v32 = v55;
              if (!v34)
              {
LABEL_64:

                v31 = v62;
                v30 = v72;
                v27 = v58;
                if (!v62)
                  goto LABEL_66;
                goto LABEL_65;
              }
LABEL_63:

              goto LABEL_64;
            }

            if (v62)
            {

            }
            v21 = v73;
            v28 = v63;
            v3 = v70;
          }

          if (v68)
          {

          }
          v20 = v69;
          v13 = v66;
          goto LABEL_39;
        }

        if (v73)
        {

        }
      }
LABEL_44:
      v11 = 0;
      if (!v9)
      {
LABEL_46:

        goto LABEL_47;
      }
LABEL_45:

      goto LABEL_46;
    }
    v11 = 0;
  }
LABEL_48:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
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
  unint64_t v17;

  -[SFMediaMetadata mediaName](self, "mediaName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[SFMediaMetadata mediaType](self, "mediaType");
  -[SFMediaMetadata artistName](self, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFMediaMetadata albumName](self, "albumName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[SFMediaMetadata mediaPunchouts](self, "mediaPunchouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SFMediaMetadata bundleIdentifiersToExclude](self, "bundleIdentifiersToExclude");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[SFMediaMetadata disambiguationTitle](self, "disambiguationTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  -[SFMediaMetadata mediaIdentifier](self, "mediaIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (NSString)mediaName
{
  return self->_mediaName;
}

- (void)setMediaName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)mediaType
{
  return self->_mediaType;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)mediaPunchouts
{
  return self->_mediaPunchouts;
}

- (void)setMediaPunchouts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)bundleIdentifiersToExclude
{
  return self->_bundleIdentifiersToExclude;
}

- (void)setBundleIdentifiersToExclude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)disambiguationTitle
{
  return self->_disambiguationTitle;
}

- (void)setDisambiguationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (void)setMediaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_disambiguationTitle, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersToExclude, 0);
  objc_storeStrong((id *)&self->_mediaPunchouts, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
}

@end
