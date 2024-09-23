@implementation SFPhotosLibraryImage

- (void)setIsSyndicated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSyndicated = a3;
}

- (BOOL)hasIsSyndicated
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFPhotosLibraryImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFPhotosLibraryImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFPhotosLibraryImage;
  v7 = -[SFImage initWithProtobuf:](&v9, sel_initWithProtobuf_, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPhotosLibraryImage *v2;
  void *v3;

  v2 = -[_SFPBPhotosLibraryImage initWithFacade:]([_SFPBPhotosLibraryImage alloc], "initWithFacade:", self);
  -[_SFPBPhotosLibraryImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPhotosLibraryImage *v2;
  void *v3;

  v2 = -[_SFPBPhotosLibraryImage initWithFacade:]([_SFPBPhotosLibraryImage alloc], "initWithFacade:", self);
  -[_SFPBPhotosLibraryImage jsonData](v2, "jsonData");
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFPhotosLibraryImage;
  v4 = -[SFImage copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPhotoIdentifier:", v6);

  objc_msgSend(v4, "setIsSyndicated:", -[SFPhotosLibraryImage isSyndicated](self, "isSyndicated"));
  -[SFPhotosLibraryImage peopleInPhoto](self, "peopleInPhoto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPeopleInPhoto:", v8);

  -[SFPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFPhotosLibraryImage *v6;
  SFPhotosLibraryImage *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  objc_super v32;

  v6 = (SFPhotosLibraryImage *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPhotosLibraryImage isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)SFPhotosLibraryImage;
      if (-[SFImage isEqual:](&v32, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPhotosLibraryImage photoIdentifier](v7, "photoIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SFPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPhotosLibraryImage photoIdentifier](v7, "photoIdentifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v4))
          {
            v11 = 0;
            goto LABEL_18;
          }
        }
        v12 = -[SFPhotosLibraryImage isSyndicated](self, "isSyndicated");
        if (v12 == -[SFPhotosLibraryImage isSyndicated](v7, "isSyndicated"))
        {
          -[SFPhotosLibraryImage peopleInPhoto](self, "peopleInPhoto");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPhotosLibraryImage peopleInPhoto](v7, "peopleInPhoto");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v13 == 0) != (v14 != 0))
          {
            v31 = v14;
            -[SFPhotosLibraryImage peopleInPhoto](self, "peopleInPhoto");
            v30 = objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              -[SFPhotosLibraryImage peopleInPhoto](self, "peopleInPhoto");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPhotosLibraryImage peopleInPhoto](v7, "peopleInPhoto");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v15;
              if (!objc_msgSend(v15, "isEqual:"))
              {
                v11 = 0;
                v20 = v13;
                v23 = (void *)v30;
                goto LABEL_30;
              }
              v27 = v3;
            }
            else
            {
              v27 = v3;
            }
            -[SFPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPhotosLibraryImage applicationBundleIdentifier](v7, "applicationBundleIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v17 == 0) == (v18 != 0))
            {

              v11 = 0;
              v20 = v13;
            }
            else
            {
              v25 = v17;
              v26 = v18;
              -[SFPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = v13;
              if (v19)
              {
                v21 = (void *)v19;
                -[SFPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFPhotosLibraryImage applicationBundleIdentifier](v7, "applicationBundleIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v24, "isEqual:");

              }
              else
              {

                v11 = 1;
              }
            }
            v23 = (void *)v30;
            v3 = v27;
            if (!v30)
            {
LABEL_31:

              if (!v10)
                goto LABEL_19;
              goto LABEL_18;
            }
LABEL_30:

            goto LABEL_31;
          }

        }
        v11 = 0;
        if (!v10)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFPhotosLibraryImage;
  v3 = -[SFImage hash](&v12, sel_hash);
  -[SFPhotosLibraryImage photoIdentifier](self, "photoIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFPhotosLibraryImage isSyndicated](self, "isSyndicated");
  -[SFPhotosLibraryImage peopleInPhoto](self, "peopleInPhoto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[SFPhotosLibraryImage applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v3;

  return v10;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (void)setPhotoIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (NSArray)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (void)setPeopleInPhoto:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_photoIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPhotosLibraryImage)initWithProtobuf:(id)a3
{
  id v4;
  SFPhotosLibraryImage *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  SFPerson *v15;
  void *v16;
  void *v17;
  SFPhotosLibraryImage *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFPhotosLibraryImage;
  v5 = -[SFPhotosLibraryImage init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "photoIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "photoIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPhotosLibraryImage setPhotoIdentifier:](v5, "setPhotoIdentifier:", v7);

    }
    if (objc_msgSend(v4, "isSyndicated"))
      -[SFPhotosLibraryImage setIsSyndicated:](v5, "setIsSyndicated:", objc_msgSend(v4, "isSyndicated"));
    objc_msgSend(v4, "peopleInPhotos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "peopleInPhotos", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = -[SFPerson initWithProtobuf:]([SFPerson alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }

    -[SFPhotosLibraryImage setPeopleInPhoto:](v5, "setPeopleInPhoto:", v9);
    objc_msgSend(v4, "applicationBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPhotosLibraryImage setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v17);

    }
    v18 = v5;

  }
  return v5;
}

@end
