@implementation SFTableAlignmentSchema

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTableAlignmentSchema)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTableAlignmentSchema *v6;
  SFTableAlignmentSchema *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBTableAlignmentSchema initWithData:]([_SFPBTableAlignmentSchema alloc], "initWithData:", v5);
  v7 = -[SFTableAlignmentSchema initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTableAlignmentSchema *v6;

  v4 = a3;
  v6 = -[_SFPBTableAlignmentSchema initWithFacade:]([_SFPBTableAlignmentSchema alloc], "initWithFacade:", self);
  -[_SFPBTableAlignmentSchema data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTableAlignmentSchema *v2;
  void *v3;

  v2 = -[_SFPBTableAlignmentSchema initWithFacade:]([_SFPBTableAlignmentSchema alloc], "initWithFacade:", self);
  -[_SFPBTableAlignmentSchema dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTableAlignmentSchema *v2;
  void *v3;

  v2 = -[_SFPBTableAlignmentSchema initWithFacade:]([_SFPBTableAlignmentSchema alloc], "initWithFacade:", self);
  -[_SFPBTableAlignmentSchema jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFTableAlignmentSchema tableColumnAlignment](self, "tableColumnAlignment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTableColumnAlignment:", v6);

  -[SFTableAlignmentSchema metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMetadata:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFTableAlignmentSchema *v5;
  SFTableAlignmentSchema *v6;
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

  v5 = (SFTableAlignmentSchema *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFTableAlignmentSchema isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFTableAlignmentSchema tableColumnAlignment](self, "tableColumnAlignment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableAlignmentSchema tableColumnAlignment](v6, "tableColumnAlignment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFTableAlignmentSchema tableColumnAlignment](self, "tableColumnAlignment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFTableAlignmentSchema tableColumnAlignment](self, "tableColumnAlignment");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTableAlignmentSchema tableColumnAlignment](v6, "tableColumnAlignment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[SFTableAlignmentSchema metadata](self, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableAlignmentSchema metadata](v6, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[SFTableAlignmentSchema metadata](self, "metadata");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[SFTableAlignmentSchema metadata](self, "metadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFTableAlignmentSchema metadata](v6, "metadata");
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
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SFTableAlignmentSchema tableColumnAlignment](self, "tableColumnAlignment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFTableAlignmentSchema metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)tableColumnAlignment
{
  return self->_tableColumnAlignment;
}

- (void)setTableColumnAlignment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tableColumnAlignment, 0);
}

- (SFTableAlignmentSchema)initWithProtobuf:(id)a3
{
  id v4;
  SFTableAlignmentSchema *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFTableColumnAlignment *v13;
  void *v14;
  void *v15;
  void *v16;
  SFTableAlignmentSchema *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFTableAlignmentSchema;
  v5 = -[SFTableAlignmentSchema init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tableColumnAlignments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "tableColumnAlignments", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFTableColumnAlignment initWithProtobuf:]([SFTableColumnAlignment alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    -[SFTableAlignmentSchema setTableColumnAlignment:](v5, "setTableColumnAlignment:", v7);
    objc_msgSend(v4, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBStringDictionaryHandwrittenTranslator(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableAlignmentSchema setMetadata:](v5, "setMetadata:", v16);

    }
    v17 = v5;

  }
  return v5;
}

@end
