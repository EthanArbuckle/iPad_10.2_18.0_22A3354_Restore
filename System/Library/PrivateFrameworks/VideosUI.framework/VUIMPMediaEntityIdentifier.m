@implementation VUIMPMediaEntityIdentifier

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[VUIMPMediaEntityIdentifier persistentID](self, "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VUIMPMediaEntityIdentifier mediaEntityType](self, "mediaEntityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  VUIMPMediaEntityIdentifier *v4;
  VUIMPMediaEntityIdentifier *v5;
  VUIMPMediaEntityIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (VUIMPMediaEntityIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUIMPMediaEntityIdentifier persistentID](self, "persistentID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMPMediaEntityIdentifier persistentID](v6, "persistentID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
          {
LABEL_17:

            goto LABEL_18;
          }
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
          {
            v12 = 0;
LABEL_18:

            goto LABEL_19;
          }
        }
        -[VUIMPMediaEntityIdentifier mediaEntityType](self, "mediaEntityType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMPMediaEntityIdentifier mediaEntityType](v6, "mediaEntityType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        v11 = v16;
        if (v9 == v16)
        {
          v12 = 1;
        }
        else
        {
          v12 = 0;
          if (v9 && v16)
            v12 = objc_msgSend(v9, "isEqual:", v16);
        }
        goto LABEL_17;
      }
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (VUIMediaEntityType)mediaEntityType
{
  return self->_mediaEntityType;
}

+ (id)showIdentifierWithMediaItem:(id)a3
{
  void *v3;
  VUIMPMediaEntityIdentifier *v4;
  void *v5;
  VUIMPMediaEntityIdentifier *v6;

  objc_msgSend(a3, "valueForProperty:", *MEMORY[0x1E0CC1DA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [VUIMPMediaEntityIdentifier alloc];
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIMPMediaEntityIdentifier initWithPersistentID:mediaEntityType:](v4, "initWithPersistentID:mediaEntityType:", v3, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VUIMPMediaEntityIdentifier)initWithPersistentID:(id)a3 mediaEntityType:(id)a4
{
  id v6;
  id v7;
  VUIMPMediaEntityIdentifier *v8;
  uint64_t v9;
  NSNumber *persistentID;
  uint64_t v11;
  VUIMediaEntityType *mediaEntityType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("persistentID"));
  v14.receiver = self;
  v14.super_class = (Class)VUIMPMediaEntityIdentifier;
  v8 = -[VUIMPMediaEntityIdentifier init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    persistentID = v8->_persistentID;
    v8->_persistentID = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    mediaEntityType = v8->_mediaEntityType;
    v8->_mediaEntityType = (VUIMediaEntityType *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntityType, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

+ (id)mediaItemIdentifierWithMediaItem:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  VUIMPMediaEntityIdentifier *v8;

  v3 = *MEMORY[0x1E0CC1ED0];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_mediaEntityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = 0;
  else
    v8 = -[VUIMPMediaEntityIdentifier initWithPersistentID:mediaEntityType:]([VUIMPMediaEntityIdentifier alloc], "initWithPersistentID:mediaEntityType:", v5, v6);

  return v8;
}

- (VUIMPMediaEntityIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (NSString)description
{
  id v3;
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
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMPMediaEntityIdentifier;
  -[VUIMPMediaEntityIdentifier description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMPMediaEntityIdentifier persistentID](self, "persistentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("persistentID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMPMediaEntityIdentifier mediaEntityType](self, "mediaEntityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaEntityType"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)setPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setMediaEntityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
