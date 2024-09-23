@implementation ICSharedListeningContainer

- (ICSharedListeningContainer)initWithProtobuf:(id)a3
{
  id *v4;
  ICSharedListeningContainer *v5;
  id v6;
  void *v7;
  NSString *v8;
  ICSharedListeningContainer *v9;
  NSString *identifier;
  int64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSString *mediaIdentifier;
  id v16;
  uint64_t v17;
  NSString *featureName;
  id v19;
  uint64_t v20;
  NSString *stationHash;
  ICSharedListeningContainer *v22;
  objc_super v24;

  v4 = (id *)a3;
  if (v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICSharedListeningContainer;
    v5 = -[ICSharedListeningContainer init](&v24, sel_init);
    if (v5)
    {
      v6 = v4[1];
      v7 = v6;
      if (v6)
      {
        v8 = (NSString *)v6;
      }
      else
      {
        MSVNanoIDCreateTaggedPointer();
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      identifier = v5->_identifier;
      v5->_identifier = v8;

      if ((*((_BYTE *)v4 + 44) & 1) != 0)
      {
        v12 = (*((_DWORD *)v4 + 10) - 1);
        if (v12 <= 3)
          v11 = v12 + 1;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v5->_kind = v11;
      v13 = v4[3];
      v14 = objc_msgSend(v13, "copy");
      mediaIdentifier = v5->_mediaIdentifier;
      v5->_mediaIdentifier = (NSString *)v14;

      v16 = v4[2];
      v17 = objc_msgSend(v16, "copy");
      featureName = v5->_featureName;
      v5->_featureName = (NSString *)v17;

      if (v5->_kind == 2 && !v5->_mediaIdentifier)
        objc_storeStrong((id *)&v5->_mediaIdentifier, v5->_identifier);
      v19 = v4[4];
      v20 = objc_msgSend(v19, "copy");
      stationHash = v5->_stationHash;
      v5->_stationHash = (NSString *)v20;

    }
    v9 = v5;
    self = v9;
  }
  else
  {
    +[ICSharedListeningContainer groupWithFeatureName:](ICSharedListeningContainer, "groupWithFeatureName:", 0);
    v9 = (ICSharedListeningContainer *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v9;

  return v22;
}

- (id)_initWithKind:(int64_t)a3 mediaIdentifier:(id)a4 featureName:(id)a5
{
  id v8;
  id v9;
  ICSharedListeningContainer *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *mediaIdentifier;
  uint64_t v15;
  NSString *featureName;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ICSharedListeningContainer;
  v10 = -[ICSharedListeningContainer init](&v18, sel_init);
  if (v10)
  {
    MSVNanoIDCreateTaggedPointer();
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_kind = a3;
    v13 = objc_msgSend(v8, "copy");
    mediaIdentifier = v10->_mediaIdentifier;
    v10->_mediaIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    featureName = v10->_featureName;
    v10->_featureName = (NSString *)v15;

  }
  return v10;
}

- (id)_initWithKind:(int64_t)a3 seedItem:(id)a4 featureName:(id)a5
{
  id v8;
  id v9;
  ICSharedListeningContainer *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  ICSharedListeningItem *seedItem;
  uint64_t v15;
  NSString *featureName;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ICSharedListeningContainer;
  v10 = -[ICSharedListeningContainer init](&v18, sel_init);
  if (v10)
  {
    MSVNanoIDCreateTaggedPointer();
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_kind = a3;
    v13 = objc_msgSend(v8, "copy");
    seedItem = v10->_seedItem;
    v10->_seedItem = (ICSharedListeningItem *)v13;

    v15 = objc_msgSend(v9, "copy");
    featureName = v10->_featureName;
    v10->_featureName = (NSString *)v15;

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *identifier;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  identifier = self->_identifier;
  _NSStringFromICSharedListeningContainerKind(self->_kind);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p id=%@ kind=%@ mediaID=%@ featureName=\"%@\">"), v4, self, identifier, v6, self->_mediaIdentifier, self->_featureName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)shortDescription
{
  void *v3;
  NSString *identifier;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  _NSStringFromICSharedListeningContainerKind(self->_kind);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CONTAINER id=%@ kind=%@ mediaID=%@ featureName=\"%@\">"), identifier, v5, self->_mediaIdentifier, self->_featureName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = -[NSString hash](self->_identifier, "hash", 1000);
  v10 = v5 ^ 0x7465646279746573 ^ v9;
  v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  v12 = v8 + v10;
  v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  v14 = v13 + __ROR8__(v6 + v7, 32);
  v15 = v12 + v11;
  v16 = __ROR8__(v11, 47);
  v17 = v14 ^ __ROR8__(v13, 43) ^ 0x800000000000000;
  v18 = (v14 ^ v9) + (v15 ^ v16);
  v19 = v18 ^ __ROR8__(v15 ^ v16, 51);
  v20 = __ROR8__(v15, 32) + v17;
  v21 = v20 ^ __ROR8__(v17, 48);
  v22 = v21 + __ROR8__(v18, 32);
  v23 = v22 ^ __ROR8__(v21, 43);
  v24 = v20 + v19;
  v25 = v24 ^ __ROR8__(v19, 47);
  v26 = (v22 ^ 0x800000000000000) + v25;
  v27 = __ROR8__(v26, 32);
  v28 = v26 ^ __ROR8__(v25, 51);
  v29 = (__ROR8__(v24, 32) ^ 0xFFLL) + v23;
  v30 = v29 ^ __ROR8__(v23, 48);
  v31 = v27 + v30;
  v32 = (v27 + v30) ^ __ROR8__(v30, 43);
  v33 = v28 + v29;
  v34 = v33 ^ __ROR8__(v28, 47);
  v35 = v34 + v31;
  v36 = v35 ^ __ROR8__(v34, 51);
  v37 = __ROR8__(v33, 32) + v32;
  v38 = __ROR8__(v32, 48);
  v39 = __ROR8__(v35, 32) + (v37 ^ v38);
  v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  v41 = v36 + v37;
  v42 = v41 ^ __ROR8__(v36, 47);
  v43 = v42 + v39;
  v44 = v43 ^ __ROR8__(v42, 51);
  v45 = __ROR8__(v41, 32) + v40;
  v46 = __ROR8__(v40, 48);
  v47 = __ROR8__(v43, 32) + (v45 ^ v46);
  return (v44 + v45) ^ __ROR8__(v44, 47) ^ v47 ^ __ROR8__(v44 + v45, 32) ^ v47 ^ __ROR8__(v45 ^ v46, 43);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](identifier, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (ICSharedListeningItem)seedItem
{
  return self->_seedItem;
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_seedItem, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)albumContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKind:mediaIdentifier:featureName:", 1, v6, v5);

  return v7;
}

+ (id)playlistContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKind:mediaIdentifier:featureName:", 3, v6, v5);

  return v7;
}

+ (id)radioContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKind:mediaIdentifier:featureName:", 2, v6, v5);

  return v7;
}

+ (id)radioContainerWithSeedItem:(id)a3 featureName:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKind:seedItem:featureName:", 2, v6, v5);

  return v7;
}

+ (id)groupWithFeatureName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKind:mediaIdentifier:featureName:", 4, 0, v3);

  return v4;
}

+ (id)autoPlayContainerWithMediaIdentifier:(id)a3 featureName:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKind:mediaIdentifier:featureName:", 5, v6, v5);

  return v7;
}

@end
