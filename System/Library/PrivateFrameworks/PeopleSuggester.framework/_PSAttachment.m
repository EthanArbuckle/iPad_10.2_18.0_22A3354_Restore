@implementation _PSAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9
{
  return -[_PSAttachment initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:](self, "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10
{
  return -[_PSAttachment initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:photoLocalIdentifiers:suggestedContactIdentifiers:](self, "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:photoLocalIdentifiers:suggestedContactIdentifiers:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10 photoLocalIdentifiers:(id)a11 suggestedContactIdentifiers:(id)a12
{
  return -[_PSAttachment initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:photoLocalIdentifiers:suggestedContactIdentifiers:photoSceneDescriptors:peopleInPhoto:](self, "initWithCreationDate:UTI:photoLocalIdentifier:identifier:cloudIdentifier:contentURL:contentText:imageData:photoLocalIdentifiers:suggestedContactIdentifiers:photoSceneDescriptors:peopleInPhoto:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0, 0);
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10 photoLocalIdentifiers:(id)a11 suggestedContactIdentifiers:(id)a12 photoSceneDescriptors:(id)a13 peopleInPhoto:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _PSAttachment *v28;
  uint64_t v29;
  NSDate *creationDate;
  uint64_t v31;
  NSString *UTI;
  uint64_t v33;
  NSString *photoLocalIdentifier;
  uint64_t v35;
  NSUUID *identifier;
  uint64_t v37;
  NSUUID *cloudIdentifier;
  uint64_t v39;
  NSURL *contentURL;
  uint64_t v41;
  NSString *contentText;
  id v45;
  id v46;
  objc_super v47;

  v46 = a3;
  v45 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a13;
  v27 = a14;
  v47.receiver = self;
  v47.super_class = (Class)_PSAttachment;
  v28 = -[_PSAttachment init](&v47, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v46, "copy");
    creationDate = v28->_creationDate;
    v28->_creationDate = (NSDate *)v29;

    v31 = objc_msgSend(v45, "copy");
    UTI = v28->_UTI;
    v28->_UTI = (NSString *)v31;

    v33 = objc_msgSend(v19, "copy");
    photoLocalIdentifier = v28->_photoLocalIdentifier;
    v28->_photoLocalIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v20, "copy");
    identifier = v28->_identifier;
    v28->_identifier = (NSUUID *)v35;

    v37 = objc_msgSend(v21, "copy");
    cloudIdentifier = v28->_cloudIdentifier;
    v28->_cloudIdentifier = (NSUUID *)v37;

    v39 = objc_msgSend(v22, "copy");
    contentURL = v28->_contentURL;
    v28->_contentURL = (NSURL *)v39;

    v41 = objc_msgSend(v23, "copy");
    contentText = v28->_contentText;
    v28->_contentText = (NSString *)v41;

    objc_storeStrong((id *)&v28->_imageData, a10);
    objc_storeStrong((id *)&v28->_photoLocalIdentifiers, a11);
    objc_storeStrong((id *)&v28->_photoSceneDescriptors, a13);
    objc_storeStrong((id *)&v28->_peopleInPhoto, a14);
  }

  return v28;
}

- (_PSAttachment)initWithCoder:(id)a3
{
  id v4;
  _PSAttachment *v5;
  uint64_t v6;
  NSDate *creationDate;
  uint64_t v8;
  NSString *UTI;
  uint64_t v10;
  NSString *photoLocalIdentifier;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  NSUUID *cloudIdentifier;
  uint64_t v16;
  NSURL *contentURL;
  uint64_t v18;
  NSString *contentText;
  uint64_t v20;
  NSData *imageData;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *photoLocalIdentifiers;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *photoSceneDescriptors;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *peopleInPhoto;
  void *v37;
  uint64_t v38;
  NSData *contentURLSandboxExtension;
  _PSAttachment *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_PSAttachment;
  v5 = -[_PSAttachment init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UTI"));
    v8 = objc_claimAutoreleasedReturnValue();
    UTI = v5->_UTI;
    v5->_UTI = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoLocalIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    photoLocalIdentifier = v5->_photoLocalIdentifier;
    v5->_photoLocalIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    cloudIdentifier = v5->_cloudIdentifier;
    v5->_cloudIdentifier = (NSUUID *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    contentURL = v5->_contentURL;
    v5->_contentURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentText"));
    v18 = objc_claimAutoreleasedReturnValue();
    contentText = v5->_contentText;
    v5->_contentText = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v20 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("photoLocalIdentifiers"));
    v25 = objc_claimAutoreleasedReturnValue();
    photoLocalIdentifiers = v5->_photoLocalIdentifiers;
    v5->_photoLocalIdentifiers = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("photoSceneDescriptors"));
    v30 = objc_claimAutoreleasedReturnValue();
    photoSceneDescriptors = v5->_photoSceneDescriptors;
    v5->_photoSceneDescriptors = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("peopleInPhoto"));
    v35 = objc_claimAutoreleasedReturnValue();
    peopleInPhoto = v5->_peopleInPhoto;
    v5->_peopleInPhoto = (NSArray *)v35;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("contentURLSandboxExtension"));
    v38 = objc_claimAutoreleasedReturnValue();
    contentURLSandboxExtension = v5->_contentURLSandboxExtension;
    v5->_contentURLSandboxExtension = (NSData *)v38;

    v40 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *creationDate;
  id v5;

  creationDate = self->_creationDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UTI, CFSTR("UTI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoLocalIdentifier, CFSTR("photoLocalIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudIdentifier, CFSTR("cloudIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentURL, CFSTR("contentURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentText, CFSTR("contentText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoLocalIdentifiers, CFSTR("photoLocalIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoSceneDescriptors, CFSTR("photoSceneDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peopleInPhoto, CFSTR("peopleInPhoto"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentURLSandboxExtension, CFSTR("contentURLSandboxExtension"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v17 = objc_opt_class();
  -[_PSAttachment creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAttachment UTI](self, "UTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAttachment photoLocalIdentifier](self, "photoLocalIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAttachment contentURL](self, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSAttachment contentURL](self, "contentURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("null");
  }
  -[_PSAttachment contentText](self, "contentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAttachment photoLocalIdentifiers](self, "photoLocalIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[_PSAttachment photoSceneDescriptors](self, "photoSceneDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAttachment peopleInPhoto](self, "peopleInPhoto");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@ %p> creationDate: %@, UTI: %@, photoIdentifier: %@, contentURL: %@, contentText: %@ photoLocalIds: %lu, photoSceneDescriptors: %@, peopleInPhoto: %@"), v17, self, v3, v4, v19, v7, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {

  }
  return v13;
}

- (NSArray)suggestedContactIdentifiers
{
  return 0;
}

- (unint64_t)totalHashOfElementsFromArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3
    && (v13 = 0u,
        v14 = 0u,
        v11 = 0u,
        v12 = 0u,
        (v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) != 0))
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 ^= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hash");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;

  v3 = -[NSString hash](self->_UTI, "hash");
  v4 = -[NSString hash](self->_photoLocalIdentifier, "hash") ^ v3;
  v5 = -[NSUUID hash](self->_identifier, "hash");
  v6 = v4 ^ v5 ^ -[NSUUID hash](self->_cloudIdentifier, "hash");
  v7 = -[NSURL hash](self->_contentURL, "hash");
  -[_PSAttachment photoLocalIdentifiers](self, "photoLocalIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ -[_PSAttachment totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v8);

  -[_PSAttachment photoSceneDescriptors](self, "photoSceneDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6 ^ v9 ^ -[_PSAttachment totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v10);

  -[_PSAttachment peopleInPhoto](self, "peopleInPhoto");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ -[_PSAttachment totalHashOfElementsFromArray:](self, "totalHashOfElementsFromArray:", v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _PSAttachment *v4;
  _PSAttachment *v5;
  _PSAttachment *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  char v58;

  v4 = (_PSAttachment *)a3;
  v5 = v4;
  if (self == v4)
  {
    v58 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_PSAttachment UTI](self, "UTI");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[_PSAttachment UTI](v6, "UTI");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[_PSAttachment UTI](self, "UTI");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSAttachment UTI](v6, "UTI");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v12)
          goto LABEL_27;
      }
    }
    -[_PSAttachment photoLocalIdentifier](self, "photoLocalIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[_PSAttachment photoLocalIdentifier](v6, "photoLocalIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[_PSAttachment photoLocalIdentifier](self, "photoLocalIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSAttachment photoLocalIdentifier](v6, "photoLocalIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (!v18)
          goto LABEL_27;
      }
    }
    -[_PSAttachment cloudIdentifier](self, "cloudIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[_PSAttachment cloudIdentifier](v6, "cloudIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[_PSAttachment cloudIdentifier](self, "cloudIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSAttachment cloudIdentifier](v6, "cloudIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqual:", v23);

        if (!v24)
          goto LABEL_27;
      }
    }
    -[_PSAttachment identifier](self, "identifier");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      -[_PSAttachment identifier](v6, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[_PSAttachment identifier](self, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSAttachment identifier](v6, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "isEqual:", v29);

        if (!v30)
          goto LABEL_27;
      }
    }
    -[_PSAttachment contentURL](self, "contentURL");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
      goto LABEL_19;
    v32 = (void *)v31;
    -[_PSAttachment contentURL](v6, "contentURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      goto LABEL_19;
    -[_PSAttachment contentURL](self, "contentURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSAttachment contentURL](v6, "contentURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
    {
LABEL_27:
      v58 = 0;
    }
    else
    {
LABEL_19:
      v37 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[_PSAttachment photoLocalIdentifiers](self, "photoLocalIdentifiers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v37, "initWithArray:", v38);

      v40 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[_PSAttachment photoLocalIdentifiers](v6, "photoLocalIdentifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v40, "initWithArray:", v41);

      v43 = objc_msgSend(v39, "count");
      if (v43 == objc_msgSend(v42, "count") && objc_msgSend(v39, "isEqualToSet:", v42))
      {
        v44 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[_PSAttachment photoSceneDescriptors](self, "photoSceneDescriptors");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v44, "initWithArray:", v45);

        v47 = objc_alloc(MEMORY[0x1E0C99E20]);
        -[_PSAttachment photoSceneDescriptors](v6, "photoSceneDescriptors");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v47, "initWithArray:", v48);

        v50 = objc_msgSend(v46, "count");
        if (v50 == objc_msgSend(v49, "count") && objc_msgSend(v46, "isEqualToSet:", v49))
        {
          v51 = objc_alloc(MEMORY[0x1E0C99E20]);
          -[_PSAttachment peopleInPhoto](self, "peopleInPhoto");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend(v51, "initWithArray:", v52);

          v54 = objc_alloc(MEMORY[0x1E0C99E20]);
          -[_PSAttachment peopleInPhoto](v6, "peopleInPhoto");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(v54, "initWithArray:", v55);

          v57 = objc_msgSend(v53, "count");
          if (v57 == objc_msgSend(v56, "count"))
            v58 = objc_msgSend(v53, "isEqualToSet:", v56);
          else
            v58 = 0;

        }
        else
        {
          v58 = 0;
        }

      }
      else
      {
        v58 = 0;
      }

    }
  }
  else
  {
    v58 = 0;
  }

  return v58;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)UTI
{
  return self->_UTI;
}

- (NSString)photoLocalIdentifier
{
  return self->_photoLocalIdentifier;
}

- (NSArray)photoLocalIdentifiers
{
  return self->_photoLocalIdentifiers;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSString)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)photoSceneDescriptors
{
  return self->_photoSceneDescriptors;
}

- (void)setPhotoSceneDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (void)setPeopleInPhoto:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSData)contentURLSandboxExtension
{
  return self->_contentURLSandboxExtension;
}

- (void)setContentURLSandboxExtension:(id)a3
{
  objc_storeStrong((id *)&self->_contentURLSandboxExtension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentURLSandboxExtension, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_photoSceneDescriptors, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_photoLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_photoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (unsigned)photoAnalysisRequestType
{
  void *v3;
  void *v4;
  void *v6;
  BOOL v7;

  -[_PSAttachment contentURL](self, "contentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFileURL") & 1) != 0)
  {
    -[_PSAttachment contentURLSandboxExtension](self, "contentURLSandboxExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return 1;
  }
  else
  {

  }
  -[_PSAttachment photoLocalIdentifier](self, "photoLocalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return 2 * v7;
}

@end
