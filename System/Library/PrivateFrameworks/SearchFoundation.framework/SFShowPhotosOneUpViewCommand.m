@implementation SFShowPhotosOneUpViewCommand

- (SFShowPhotosOneUpViewCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFShowPhotosOneUpViewCommand *v5;
  void *v6;
  SFPhotosLibraryImage *v7;
  void *v8;
  SFPhotosLibraryImage *v9;
  void *v10;
  SFPerson *v11;
  void *v12;
  SFPerson *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  SFScene *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  SFPerson *v29;
  void *v30;
  SFPunchout *v31;
  void *v32;
  SFPunchout *v33;
  SFShowPhotosOneUpViewCommand *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SFShowPhotosOneUpViewCommand;
  v5 = -[SFShowPhotosOneUpViewCommand init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "photosLibraryImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFPhotosLibraryImage alloc];
      objc_msgSend(v4, "photosLibraryImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFPhotosLibraryImage initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFShowPhotosOneUpViewCommand setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v9);

    }
    objc_msgSend(v4, "matchedPerson");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFPerson alloc];
      objc_msgSend(v4, "matchedPerson");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFPerson initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFShowPhotosOneUpViewCommand setMatchedPerson:](v5, "setMatchedPerson:", v13);

    }
    objc_msgSend(v4, "matchedScenes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "matchedScenes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          v21 = -[SFScene initWithProtobuf:]([SFScene alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v18);
    }

    -[SFShowPhotosOneUpViewCommand setMatchedScenes:](v5, "setMatchedScenes:", v15);
    objc_msgSend(v4, "matchedPeoples");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "matchedPeoples", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          v29 = -[SFPerson initWithProtobuf:]([SFPerson alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v26);
    }

    -[SFShowPhotosOneUpViewCommand setMatchedPeople:](v5, "setMatchedPeople:", v23);
    objc_msgSend(v4, "photoFilePunchout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [SFPunchout alloc];
      objc_msgSend(v4, "photoFilePunchout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SFPunchout initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[SFShowPhotosOneUpViewCommand setPhotoFilePunchout:](v5, "setPhotoFilePunchout:", v33);

    }
    v34 = v5;

  }
  return v5;
}

- (SFShowPhotosOneUpViewCommand)initWithCoder:(id)a3
{
  id v4;
  SFShowPhotosOneUpViewCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = -[SFShowPhotosOneUpViewCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand photosLibraryImage](v8, "photosLibraryImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowPhotosOneUpViewCommand setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v9);

    -[SFCommand matchedPerson](v8, "matchedPerson");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowPhotosOneUpViewCommand setMatchedPerson:](v5, "setMatchedPerson:", v10);

    -[SFCommand matchedScenes](v8, "matchedScenes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowPhotosOneUpViewCommand setMatchedScenes:](v5, "setMatchedScenes:", v11);

    -[SFCommand matchedPeople](v8, "matchedPeople");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowPhotosOneUpViewCommand setMatchedPeople:](v5, "setMatchedPeople:", v12);

    -[SFCommand photoFilePunchout](v8, "photoFilePunchout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShowPhotosOneUpViewCommand setPhotoFilePunchout:](v5, "setPhotoFilePunchout:", v13);

    -[SFCommand commandDetail](v8, "commandDetail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v14);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v15);

    -[SFCommand backendData](v8, "backendData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v16);

    -[SFCommand commandReference](v8, "commandReference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v17);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFShowPhotosOneUpViewCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBShowPhotosOneUpViewCommand *v2;
  void *v3;

  v2 = -[_SFPBShowPhotosOneUpViewCommand initWithFacade:]([_SFPBShowPhotosOneUpViewCommand alloc], "initWithFacade:", self);
  -[_SFPBShowPhotosOneUpViewCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBShowPhotosOneUpViewCommand *v2;
  void *v3;

  v2 = -[_SFPBShowPhotosOneUpViewCommand initWithFacade:]([_SFPBShowPhotosOneUpViewCommand alloc], "initWithFacade:", self);
  -[_SFPBShowPhotosOneUpViewCommand jsonData](v2, "jsonData");
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFShowPhotosOneUpViewCommand;
  v4 = -[SFCommand copyWithZone:](&v16, sel_copyWithZone_, a3);
  -[SFShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPhotosLibraryImage:", v6);

  -[SFShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMatchedPerson:", v8);

  -[SFShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setMatchedScenes:", v10);

  -[SFShowPhotosOneUpViewCommand matchedPeople](self, "matchedPeople");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setMatchedPeople:", v12);

  -[SFShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setPhotoFilePunchout:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFShowPhotosOneUpViewCommand *v4;
  SFShowPhotosOneUpViewCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v4 = (SFShowPhotosOneUpViewCommand *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[SFShowPhotosOneUpViewCommand isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v50.receiver = self;
      v50.super_class = (Class)SFShowPhotosOneUpViewCommand;
      if (-[SFCommand isEqual:](&v50, sel_isEqual_, v4))
      {
        v5 = v4;
        -[SFShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShowPhotosOneUpViewCommand photosLibraryImage](v5, "photosLibraryImage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v10 = 0;
LABEL_51:

          goto LABEL_52;
        }
        -[SFShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[SFShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFShowPhotosOneUpViewCommand photosLibraryImage](v5, "photosLibraryImage");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:"))
          {
            v10 = 0;
            goto LABEL_49;
          }
          v47 = v9;
        }
        -[SFShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShowPhotosOneUpViewCommand matchedPerson](v5, "matchedPerson");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v49 == 0) != (v11 != 0))
        {
          -[SFShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            -[SFShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFShowPhotosOneUpViewCommand matchedPerson](v5, "matchedPerson");
            v44 = v14;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:"))
            {
              v10 = 0;
              v19 = v13;
              v20 = v45;
              goto LABEL_46;
            }
            v46 = v13;
          }
          else
          {
            v46 = 0;
          }
          -[SFShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFShowPhotosOneUpViewCommand matchedScenes](v5, "matchedScenes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v15 == 0) != (v16 != 0))
          {
            v42 = v15;
            v43 = v16;
            -[SFShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[SFShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFShowPhotosOneUpViewCommand matchedScenes](v5, "matchedScenes");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                v10 = 0;
                v20 = v45;
                v19 = v46;
                goto LABEL_44;
              }
              v41 = v17;
            }
            else
            {
              v41 = 0;
            }
            -[SFShowPhotosOneUpViewCommand matchedPeople](self, "matchedPeople");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFShowPhotosOneUpViewCommand matchedPeople](v5, "matchedPeople");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v21 == 0) != (v22 != 0))
            {
              v38 = v22;
              -[SFShowPhotosOneUpViewCommand matchedPeople](self, "matchedPeople");
              v20 = v45;
              v37 = objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v33 = v21;
                -[SFShowPhotosOneUpViewCommand matchedPeople](self, "matchedPeople");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFShowPhotosOneUpViewCommand matchedPeople](v5, "matchedPeople");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v23;
                if (!objc_msgSend(v23, "isEqual:"))
                {
                  v10 = 0;
                  v27 = (void *)v37;
                  v21 = v33;
                  goto LABEL_42;
                }
                v21 = v33;
              }
              -[SFShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFShowPhotosOneUpViewCommand photoFilePunchout](v5, "photoFilePunchout");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v24 == 0) == (v25 != 0))
              {

                v10 = 0;
                v20 = v45;
                v27 = (void *)v37;
                if (!v37)
                {
LABEL_43:

                  v17 = v41;
                  v19 = v46;
                  if (!v41)
                    goto LABEL_45;
                  goto LABEL_44;
                }
              }
              else
              {
                v32 = v25;
                v34 = v24;
                -[SFShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
                v26 = objc_claimAutoreleasedReturnValue();
                v20 = v45;
                v27 = (void *)v37;
                if (v26)
                {
                  v31 = (void *)v26;
                  -[SFShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFShowPhotosOneUpViewCommand photoFilePunchout](v5, "photoFilePunchout");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = objc_msgSend(v30, "isEqual:", v29);

                  if (!v37)
                    goto LABEL_43;
                }
                else
                {

                  v10 = 1;
                  if (!v37)
                    goto LABEL_43;
                }
              }
LABEL_42:

              goto LABEL_43;
            }

            v10 = 0;
            v20 = v45;
            v19 = v46;
            v17 = v41;
            if (!v41)
            {
LABEL_45:

              if (!v19)
              {
LABEL_47:

LABEL_48:
                v9 = v47;
                if (!v8)
                {
LABEL_50:

                  goto LABEL_51;
                }
LABEL_49:

                goto LABEL_50;
              }
LABEL_46:

              goto LABEL_47;
            }
LABEL_44:

            goto LABEL_45;
          }

          if (v46)
          {

          }
        }

        v10 = 0;
        goto LABEL_48;
      }
    }
    v10 = 0;
  }
LABEL_52:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SFShowPhotosOneUpViewCommand;
  v3 = -[SFCommand hash](&v15, sel_hash);
  -[SFShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[SFShowPhotosOneUpViewCommand matchedPeople](self, "matchedPeople");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[SFShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;

  return v13;
}

- (SFPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (void)setPhotosLibraryImage:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibraryImage, a3);
}

- (SFPerson)matchedPerson
{
  return self->_matchedPerson;
}

- (void)setMatchedPerson:(id)a3
{
  objc_storeStrong((id *)&self->_matchedPerson, a3);
}

- (NSArray)matchedScenes
{
  return self->_matchedScenes;
}

- (void)setMatchedScenes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)matchedPeople
{
  return self->_matchedPeople;
}

- (void)setMatchedPeople:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SFPunchout)photoFilePunchout
{
  return self->_photoFilePunchout;
}

- (void)setPhotoFilePunchout:(id)a3
{
  objc_storeStrong((id *)&self->_photoFilePunchout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoFilePunchout, 0);
  objc_storeStrong((id *)&self->_matchedPeople, 0);
  objc_storeStrong((id *)&self->_matchedScenes, 0);
  objc_storeStrong((id *)&self->_matchedPerson, 0);
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
