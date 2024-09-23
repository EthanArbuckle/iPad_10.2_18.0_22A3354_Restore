@implementation RFPreviewList

- (RFPreviewList)initWithProtobuf:(id)a3
{
  id v4;
  RFPreviewList *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFPreview *v13;
  RFPreviewList *v14;
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
  v20.super_class = (Class)RFPreviewList;
  v5 = -[RFPreviewList init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "previews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "previews", 0);
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
          v13 = -[RFPreview initWithProtobuf:]([RFPreview alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[RFPreviewList setPreviews:](v5, "setPreviews:", v7);
    v14 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFPreviewList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFPreviewList *v6;
  RFPreviewList *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFPreviewList initWithData:]([_SFPBRFPreviewList alloc], "initWithData:", v5);
  v7 = -[RFPreviewList initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFPreviewList *v6;

  v4 = a3;
  v6 = -[_SFPBRFPreviewList initWithFacade:]([_SFPBRFPreviewList alloc], "initWithFacade:", self);
  -[_SFPBRFPreviewList data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFPreviewList *v2;
  void *v3;

  v2 = -[_SFPBRFPreviewList initWithFacade:]([_SFPBRFPreviewList alloc], "initWithFacade:", self);
  -[_SFPBRFPreviewList dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFPreviewList *v2;
  void *v3;

  v2 = -[_SFPBRFPreviewList initWithFacade:]([_SFPBRFPreviewList alloc], "initWithFacade:", self);
  -[_SFPBRFPreviewList jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFPreviewList previews](self, "previews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPreviews:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFPreviewList *v4;
  RFPreviewList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (RFPreviewList *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[RFPreviewList isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[RFPreviewList previews](self, "previews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFPreviewList previews](v5, "previews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[RFPreviewList previews](self, "previews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFPreviewList previews](self, "previews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFPreviewList previews](v5, "previews");
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

  -[RFPreviewList previews](self, "previews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)previews
{
  return self->_previews;
}

- (void)setPreviews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previews, 0);
}

@end
