@implementation SFTextColumn

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTextColumn)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTextColumn *v6;
  SFTextColumn *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBTextColumn initWithData:]([_SFPBTextColumn alloc], "initWithData:", v5);
  v7 = -[SFTextColumn initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTextColumn *v6;

  v4 = a3;
  v6 = -[_SFPBTextColumn initWithFacade:]([_SFPBTextColumn alloc], "initWithFacade:", self);
  -[_SFPBTextColumn data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTextColumn *v2;
  void *v3;

  v2 = -[_SFPBTextColumn initWithFacade:]([_SFPBTextColumn alloc], "initWithFacade:", self);
  -[_SFPBTextColumn dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTextColumn *v2;
  void *v3;

  v2 = -[_SFPBTextColumn initWithFacade:]([_SFPBTextColumn alloc], "initWithFacade:", self);
  -[_SFPBTextColumn jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFTextColumn sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSections:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFTextColumn *v4;
  SFTextColumn *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SFTextColumn *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFTextColumn isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFTextColumn sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTextColumn sections](v5, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFTextColumn sections](self, "sections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFTextColumn sections](self, "sections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTextColumn sections](v5, "sections");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SFTextColumn sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

- (SFTextColumn)initWithProtobuf:(id)a3
{
  id v4;
  SFTextColumn *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFTextColumnSection *v13;
  SFTextColumn *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFTextColumn;
  v5 = -[SFTextColumn init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "sections", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFTextColumnSection initWithProtobuf:]([SFTextColumnSection alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[SFTextColumn setSections:](v5, "setSections:", v7);
    v14 = v5;

  }
  return v5;
}

@end
