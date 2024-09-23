@implementation RFAvatarImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImage_style:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_image_style = a3;
}

- (BOOL)hasImage_style
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFAvatarImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAvatarImage *v6;
  RFAvatarImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFAvatarImage initWithData:]([_SFPBRFAvatarImage alloc], "initWithData:", v5);
  v7 = -[RFAvatarImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAvatarImage *v6;

  v4 = a3;
  v6 = -[_SFPBRFAvatarImage initWithFacade:]([_SFPBRFAvatarImage alloc], "initWithFacade:", self);
  -[_SFPBRFAvatarImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFAvatarImage *v2;
  void *v3;

  v2 = -[_SFPBRFAvatarImage initWithFacade:]([_SFPBRFAvatarImage alloc], "initWithFacade:", self);
  -[_SFPBRFAvatarImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFAvatarImage *v2;
  void *v3;

  v2 = -[_SFPBRFAvatarImage initWithFacade:]([_SFPBRFAvatarImage alloc], "initWithFacade:", self);
  -[_SFPBRFAvatarImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFAvatarImage contact_ids](self, "contact_ids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setContact_ids:", v6);

  objc_msgSend(v4, "setImage_style:", -[RFAvatarImage image_style](self, "image_style"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFAvatarImage *v6;
  RFAvatarImage *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;

  v6 = (RFAvatarImage *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFAvatarImage isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[RFAvatarImage contact_ids](self, "contact_ids");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAvatarImage contact_ids](v7, "contact_ids");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[RFAvatarImage contact_ids](self, "contact_ids");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[RFAvatarImage contact_ids](self, "contact_ids"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFAvatarImage contact_ids](v7, "contact_ids"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[RFAvatarImage image_style](self, "image_style");
        v11 = v12 == -[RFAvatarImage image_style](v7, "image_style");
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[RFAvatarImage contact_ids](self, "contact_ids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFAvatarImage image_style](self, "image_style");

  return v5;
}

- (NSArray)contact_ids
{
  return self->_contact_ids;
}

- (void)setContact_ids:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)image_style
{
  return self->_image_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact_ids, 0);
}

- (RFAvatarImage)initWithProtobuf:(id)a3
{
  id v4;
  RFAvatarImage *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFAvatarImage *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RFAvatarImage;
  v5 = -[RFAvatarImage init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "contact_ids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "contact_ids", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

    -[RFAvatarImage setContact_ids:](v5, "setContact_ids:", v7);
    if (objc_msgSend(v4, "image_style"))
      -[RFAvatarImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    v13 = v5;

  }
  return v5;
}

@end
