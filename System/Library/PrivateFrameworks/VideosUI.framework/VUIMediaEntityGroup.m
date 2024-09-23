@implementation VUIMediaEntityGroup

- (void)setMediaEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VUIMediaEntityGroup)initWithIdentifier:(id)a3
{
  id v4;
  VUIMediaEntityGroup *v5;
  uint64_t v6;
  NSCopying *identifier;
  objc_super v9;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("identifier"));
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaEntityGroup;
  v5 = -[VUIMediaEntityGroup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSCopying *)v6;

  }
  return v5;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (VUIMediaEntityGroup)init
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

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMediaEntityGroup *v4;
  uint64_t v5;
  NSArray *mediaEntities;
  uint64_t v7;
  NSArray *sortIndexes;

  v4 = -[VUIMediaEntityGroup initWithIdentifier:]([VUIMediaEntityGroup alloc], "initWithIdentifier:", self->_identifier);
  v5 = -[NSArray copy](self->_mediaEntities, "copy");
  mediaEntities = v4->_mediaEntities;
  v4->_mediaEntities = (NSArray *)v5;

  v7 = -[NSArray copy](self->_sortIndexes, "copy");
  sortIndexes = v4->_sortIndexes;
  v4->_sortIndexes = (NSArray *)v7;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[VUIMediaEntityGroup identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VUIMediaEntityGroup mediaEntities](self, "mediaEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VUIMediaEntityGroup sortIndexes](self, "sortIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaEntityGroup *v4;
  VUIMediaEntityGroup *v5;
  VUIMediaEntityGroup *v6;
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
  char v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (VUIMediaEntityGroup *)a3;
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
        -[VUIMediaEntityGroup identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityGroup identifier](v6, "identifier");
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
            goto LABEL_23;
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_16;
        }
        -[VUIMediaEntityGroup mediaEntities](self, "mediaEntities");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityGroup mediaEntities](v6, "mediaEntities");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        if (v9 == v16)
        {

LABEL_18:
          -[VUIMediaEntityGroup sortIndexes](self, "sortIndexes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIMediaEntityGroup sortIndexes](v6, "sortIndexes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v18;
          v20 = v19;
          v11 = v20;
          if (v9 == v20)
          {
            v12 = 1;
          }
          else
          {
            v12 = 0;
            if (v9 && v20)
              v12 = objc_msgSend(v9, "isEqual:", v20);
          }
          goto LABEL_23;
        }
        v11 = v16;
        v12 = 0;
        if (v9 && v16)
        {
          v17 = objc_msgSend(v9, "isEqual:", v16);

          if ((v17 & 1) == 0)
          {
LABEL_16:
            v12 = 0;
LABEL_24:

            goto LABEL_25;
          }
          goto LABEL_18;
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    v12 = 0;
  }
LABEL_25:

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaEntityGroup;
  -[VUIMediaEntityGroup description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityGroup mediaEntities](self, "mediaEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaEntities"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityGroup sortIndexes](self, "sortIndexes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sortIndexes"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@>"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (NSArray)sortIndexes
{
  return self->_sortIndexes;
}

- (void)setSortIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortIndexes, 0);
  objc_storeStrong((id *)&self->_mediaEntities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
