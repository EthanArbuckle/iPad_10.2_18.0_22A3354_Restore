@implementation SFRejectPeopleInPhotoCommand

- (SFRejectPeopleInPhotoCommand)initWithCoder:(id)a3
{
  id v4;
  SFRejectPeopleInPhotoCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SFRejectPeopleInPhotoCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand rejectedPeople](v8, "rejectedPeople");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRejectPeopleInPhotoCommand setRejectedPeople:](v5, "setRejectedPeople:", v9);

    -[SFCommand photosLibraryImage](v8, "photosLibraryImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRejectPeopleInPhotoCommand setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v10);

    -[SFCommand commandDetail](v8, "commandDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v11);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v12);

    -[SFCommand backendData](v8, "backendData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v13);

    -[SFCommand commandReference](v8, "commandReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFRejectPeopleInPhotoCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRejectPeopleInPhotoCommand *v2;
  void *v3;

  v2 = -[_SFPBRejectPeopleInPhotoCommand initWithFacade:]([_SFPBRejectPeopleInPhotoCommand alloc], "initWithFacade:", self);
  -[_SFPBRejectPeopleInPhotoCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRejectPeopleInPhotoCommand *v2;
  void *v3;

  v2 = -[_SFPBRejectPeopleInPhotoCommand initWithFacade:]([_SFPBRejectPeopleInPhotoCommand alloc], "initWithFacade:", self);
  -[_SFPBRejectPeopleInPhotoCommand jsonData](v2, "jsonData");
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFRejectPeopleInPhotoCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFRejectPeopleInPhotoCommand rejectedPeople](self, "rejectedPeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRejectedPeople:", v6);

  -[SFRejectPeopleInPhotoCommand photosLibraryImage](self, "photosLibraryImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPhotosLibraryImage:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFRejectPeopleInPhotoCommand *v5;
  SFRejectPeopleInPhotoCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v5 = (SFRejectPeopleInPhotoCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFRejectPeopleInPhotoCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFRejectPeopleInPhotoCommand;
      if (-[SFCommand isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFRejectPeopleInPhotoCommand rejectedPeople](self, "rejectedPeople");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRejectPeopleInPhotoCommand rejectedPeople](v6, "rejectedPeople");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[SFRejectPeopleInPhotoCommand rejectedPeople](self, "rejectedPeople");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFRejectPeopleInPhotoCommand rejectedPeople](self, "rejectedPeople");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFRejectPeopleInPhotoCommand rejectedPeople](v6, "rejectedPeople");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        -[SFRejectPeopleInPhotoCommand photosLibraryImage](self, "photosLibraryImage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRejectPeopleInPhotoCommand photosLibraryImage](v6, "photosLibraryImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFRejectPeopleInPhotoCommand photosLibraryImage](self, "photosLibraryImage");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[SFRejectPeopleInPhotoCommand photosLibraryImage](self, "photosLibraryImage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFRejectPeopleInPhotoCommand photosLibraryImage](v6, "photosLibraryImage");
            v20 = v3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v19, "isEqual:", v17);

            v3 = v20;
          }
          else
          {

            v11 = 1;
          }
        }
        v10 = v21;
        if (!v9)
          goto LABEL_19;
        goto LABEL_18;
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
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFRejectPeopleInPhotoCommand;
  v3 = -[SFCommand hash](&v9, sel_hash);
  -[SFRejectPeopleInPhotoCommand rejectedPeople](self, "rejectedPeople");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFRejectPeopleInPhotoCommand photosLibraryImage](self, "photosLibraryImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (NSArray)rejectedPeople
{
  return self->_rejectedPeople;
}

- (void)setRejectedPeople:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SFPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (void)setPhotosLibraryImage:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibraryImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_rejectedPeople, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRejectPeopleInPhotoCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFRejectPeopleInPhotoCommand *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFPerson *v13;
  void *v14;
  SFPhotosLibraryImage *v15;
  void *v16;
  SFPhotosLibraryImage *v17;
  SFRejectPeopleInPhotoCommand *v18;
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
  v24.super_class = (Class)SFRejectPeopleInPhotoCommand;
  v5 = -[SFRejectPeopleInPhotoCommand init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "rejectedPeoples");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "rejectedPeoples", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPerson initWithProtobuf:]([SFPerson alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    -[SFRejectPeopleInPhotoCommand setRejectedPeople:](v5, "setRejectedPeople:", v7);
    objc_msgSend(v4, "photosLibraryImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFPhotosLibraryImage alloc];
      objc_msgSend(v4, "photosLibraryImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFPhotosLibraryImage initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[SFRejectPeopleInPhotoCommand setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v17);

    }
    v18 = v5;

  }
  return v5;
}

@end
