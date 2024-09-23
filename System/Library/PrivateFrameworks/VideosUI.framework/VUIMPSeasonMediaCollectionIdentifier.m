@implementation VUIMPSeasonMediaCollectionIdentifier

+ (id)requiredMPPropertyNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1DA0], *MEMORY[0x1E0CC1F40], 0);
}

+ (id)seasonIdentifierWithMediaItem:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  VUIMPSeasonMediaCollectionIdentifier *v7;

  v3 = *MEMORY[0x1E0CC1DA0];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1F40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = -[VUIMPSeasonMediaCollectionIdentifier initWithPersistentID:seasonNumber:]([VUIMPSeasonMediaCollectionIdentifier alloc], "initWithPersistentID:seasonNumber:", v5, v6);
  else
    v7 = 0;

  return v7;
}

- (VUIMPSeasonMediaCollectionIdentifier)initWithPersistentID:(id)a3 mediaEntityType:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The %@ initializer is not available."), v7);

  return 0;
}

- (VUIMPSeasonMediaCollectionIdentifier)initWithPersistentID:(id)a3 seasonNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VUIMPSeasonMediaCollectionIdentifier *v9;
  uint64_t v10;
  NSNumber *seasonNumber;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("persistentID"));
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
  v9 = -[VUIMPMediaEntityIdentifier initWithPersistentID:mediaEntityType:](&v13, sel_initWithPersistentID_mediaEntityType_, v6, v8);

  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    seasonNumber = v9->_seasonNumber;
    v9->_seasonNumber = (NSNumber *)v10;

  }
  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
  v3 = -[VUIMPMediaEntityIdentifier hash](&v7, sel_hash);
  -[VUIMPSeasonMediaCollectionIdentifier seasonNumber](self, "seasonNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUIMPSeasonMediaCollectionIdentifier *v4;
  VUIMPSeasonMediaCollectionIdentifier *v5;
  VUIMPSeasonMediaCollectionIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (VUIMPSeasonMediaCollectionIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
    if (-[VUIMPMediaEntityIdentifier isEqual:](&v14, sel_isEqual_, v6))
    {
      -[VUIMPSeasonMediaCollectionIdentifier seasonNumber](self, "seasonNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMPSeasonMediaCollectionIdentifier seasonNumber](v6, "seasonNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
  -[VUIMPMediaEntityIdentifier description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMPSeasonMediaCollectionIdentifier seasonNumber](self, "seasonNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("seasonNumber"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seasonNumber, 0);
}

@end
