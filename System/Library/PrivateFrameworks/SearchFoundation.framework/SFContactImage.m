@implementation SFContactImage

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_threeDTouchEnabled = a3;
}

- (BOOL)hasThreeDTouchEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFContactImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFContactImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFContactImage;
  v7 = -[SFImage initWithProtobuf:](&v9, sel_initWithProtobuf_, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBContactImage *v2;
  void *v3;

  v2 = -[_SFPBContactImage initWithFacade:]([_SFPBContactImage alloc], "initWithFacade:", self);
  -[_SFPBContactImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBContactImage *v2;
  void *v3;

  v2 = -[_SFPBContactImage initWithFacade:]([_SFPBContactImage alloc], "initWithFacade:", self);
  -[_SFPBContactImage jsonData](v2, "jsonData");
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
  v10.super_class = (Class)SFContactImage;
  v4 = -[SFImage copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFContactImage contactIdentifiers](self, "contactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setContactIdentifiers:", v6);

  objc_msgSend(v4, "setThreeDTouchEnabled:", -[SFContactImage threeDTouchEnabled](self, "threeDTouchEnabled"));
  -[SFContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAppIconBadgeBundleIdentifier:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFContactImage *v5;
  SFContactImage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v5 = (SFContactImage *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFContactImage isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)SFContactImage;
      if (-[SFImage isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFContactImage contactIdentifiers](self, "contactIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContactImage contactIdentifiers](v6, "contactIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
        -[SFContactImage contactIdentifiers](self, "contactIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFContactImage contactIdentifiers](self, "contactIdentifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFContactImage contactIdentifiers](v6, "contactIdentifiers");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_19;
          }
          v21 = v10;
        }
        v12 = -[SFContactImage threeDTouchEnabled](self, "threeDTouchEnabled");
        if (v12 == -[SFContactImage threeDTouchEnabled](v6, "threeDTouchEnabled"))
        {
          -[SFContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFContactImage appIconBadgeBundleIdentifier](v6, "appIconBadgeBundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if ((v13 == 0) != (v14 != 0))
          {
            -[SFContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = (void *)v16;
              -[SFContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFContactImage appIconBadgeBundleIdentifier](v6, "appIconBadgeBundleIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v20, "isEqual:", v19);

            }
            else
            {

              v11 = 1;
            }
LABEL_18:
            v10 = v21;
            if (!v9)
            {
LABEL_20:

              goto LABEL_21;
            }
LABEL_19:

            goto LABEL_20;
          }

        }
        v11 = 0;
        goto LABEL_18;
      }
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFContactImage;
  v3 = -[SFImage hash](&v10, sel_hash);
  -[SFContactImage contactIdentifiers](self, "contactIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFContactImage threeDTouchEnabled](self, "threeDTouchEnabled");
  -[SFContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash") ^ v3;

  return v8;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (NSString)appIconBadgeBundleIdentifier
{
  return self->_appIconBadgeBundleIdentifier;
}

- (void)setAppIconBadgeBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconBadgeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFContactImage)initWithProtobuf:(id)a3
{
  id v4;
  SFContactImage *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  SFContactImage *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFContactImage;
  v5 = -[SFContactImage init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "contactIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "contactIdentifiers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    -[SFContactImage setContactIdentifiers:](v5, "setContactIdentifiers:", v7);
    if (objc_msgSend(v4, "threeDTouchEnabled"))
      -[SFContactImage setThreeDTouchEnabled:](v5, "setThreeDTouchEnabled:", objc_msgSend(v4, "threeDTouchEnabled"));
    objc_msgSend(v4, "appIconBadgeBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "appIconBadgeBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFContactImage setAppIconBadgeBundleIdentifier:](v5, "setAppIconBadgeBundleIdentifier:", v14);

    }
    v15 = v5;

  }
  return v5;
}

@end
