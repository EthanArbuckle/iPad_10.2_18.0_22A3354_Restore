@implementation SFCommandButtonItem

- (SFCommandButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFCommandButtonItem *v5;
  void *v6;
  SFImage *v7;
  void *v8;
  SFImage *v9;
  void *v10;
  void *v11;
  void *v12;
  SFCommand *v13;
  void *v14;
  SFCommand *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  SFButtonItem *v23;
  SFCommandButtonItem *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFCommandButtonItem;
  v5 = -[SFCommandButtonItem init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFImage initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFCommandButtonItem setImage:](v5, "setImage:", v9);

    }
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommandButtonItem setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "command");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [SFCommand alloc];
      objc_msgSend(v4, "command");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SFCommand initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[SFCommandButtonItem setCommand:](v5, "setCommand:", v15);

    }
    objc_msgSend(v4, "previewButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v17 = 0;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "previewButtonItems", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }

    -[SFCommandButtonItem setPreviewButtonItems:](v5, "setPreviewButtonItems:", v17);
    if (objc_msgSend(v4, "isDestructive"))
      -[SFCommandButtonItem setIsDestructive:](v5, "setIsDestructive:", objc_msgSend(v4, "isDestructive"));
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v24 = v5;

  }
  return v5;
}

- (void)setIsDestructive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDestructive = a3;
}

- (BOOL)hasIsDestructive
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFCommandButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCommandButtonItem *v6;
  SFCommandButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCommandButtonItem initWithData:]([_SFPBCommandButtonItem alloc], "initWithData:", v5);
  v7 = -[SFCommandButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCommandButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBCommandButtonItem initWithFacade:]([_SFPBCommandButtonItem alloc], "initWithFacade:", self);
  -[_SFPBCommandButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCommandButtonItem *v2;
  void *v3;

  v2 = -[_SFPBCommandButtonItem initWithFacade:]([_SFPBCommandButtonItem alloc], "initWithFacade:", self);
  -[_SFPBCommandButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCommandButtonItem *v2;
  void *v3;

  v2 = -[_SFPBCommandButtonItem initWithFacade:]([_SFPBCommandButtonItem alloc], "initWithFacade:", self);
  -[_SFPBCommandButtonItem jsonData](v2, "jsonData");
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFCommandButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[SFCommandButtonItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setImage:", v6);

  -[SFCommandButtonItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTitle:", v8);

  -[SFCommandButtonItem command](self, "command");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCommand:", v10);

  -[SFCommandButtonItem previewButtonItems](self, "previewButtonItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPreviewButtonItems:", v12);

  objc_msgSend(v4, "setIsDestructive:", -[SFCommandButtonItem isDestructive](self, "isDestructive"));
  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCommandButtonItem *v4;
  SFCommandButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v4 = (SFCommandButtonItem *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[SFCommandButtonItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v43.receiver = self;
      v43.super_class = (Class)SFCommandButtonItem;
      if (-[SFButtonItem isEqual:](&v43, sel_isEqual_, v4))
      {
        v5 = v4;
        -[SFCommandButtonItem image](self, "image");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCommandButtonItem image](v5, "image");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v10 = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[SFCommandButtonItem image](self, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[SFCommandButtonItem image](self, "image");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCommandButtonItem image](v5, "image");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:"))
          {
            v10 = 0;
            goto LABEL_36;
          }
          v40 = v9;
        }
        -[SFCommandButtonItem title](self, "title");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCommandButtonItem title](v5, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v42 == 0) != (v11 != 0))
        {
          -[SFCommandButtonItem title](self, "title");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            -[SFCommandButtonItem title](self, "title");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCommandButtonItem title](v5, "title");
            v37 = v14;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:"))
            {
              v10 = 0;
              v19 = v39;
              goto LABEL_33;
            }
            v38 = v13;
          }
          else
          {
            v38 = 0;
          }
          -[SFCommandButtonItem command](self, "command");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCommandButtonItem command](v5, "command");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v15 == 0) != (v16 != 0))
          {
            v35 = v15;
            v36 = v16;
            -[SFCommandButtonItem command](self, "command");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[SFCommandButtonItem command](self, "command");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFCommandButtonItem command](v5, "command");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                v10 = 0;
                v13 = v38;
                v19 = v39;
                goto LABEL_31;
              }
            }
            -[SFCommandButtonItem previewButtonItems](self, "previewButtonItems");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCommandButtonItem previewButtonItems](v5, "previewButtonItems");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
            {

              v10 = 0;
              v13 = v38;
              v19 = v39;
              if (!v17)
                goto LABEL_32;
              goto LABEL_31;
            }
            v31 = v21;
            v32 = v20;
            -[SFCommandButtonItem previewButtonItems](self, "previewButtonItems");
            v19 = v39;
            v30 = objc_claimAutoreleasedReturnValue();
            if (!v30
              || (-[SFCommandButtonItem previewButtonItems](self, "previewButtonItems"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFCommandButtonItem previewButtonItems](v5, "previewButtonItems"),
                  v28 = v22,
                  v29 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v22, "isEqual:")))
            {
              v26 = -[SFCommandButtonItem isDestructive](self, "isDestructive");
              if (v26 == -[SFCommandButtonItem isDestructive](v5, "isDestructive"))
              {
                v27 = -[SFButtonItem uniqueId](self, "uniqueId");
                v10 = v27 == -[SFButtonItem uniqueId](v5, "uniqueId");
              }
              else
              {
                v10 = 0;
              }
              v23 = (void *)v29;
              v24 = (void *)v30;
              if (!v30)
              {
LABEL_45:

                v13 = v38;
                if (!v17)
                {
LABEL_32:

                  if (!v13)
                  {
LABEL_34:

LABEL_35:
                    v9 = v40;
                    if (!v8)
                    {
LABEL_37:

                      goto LABEL_38;
                    }
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_33:

                  goto LABEL_34;
                }
LABEL_31:

                goto LABEL_32;
              }
            }
            else
            {
              v10 = 0;
              v23 = (void *)v29;
              v24 = (void *)v30;
            }

            goto LABEL_45;
          }

          if (v38)
          {

          }
        }

        v10 = 0;
        goto LABEL_35;
      }
    }
    v10 = 0;
  }
LABEL_39:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SFCommandButtonItem;
  v3 = -[SFButtonItem hash](&v15, sel_hash);
  -[SFCommandButtonItem image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFCommandButtonItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFCommandButtonItem command](self, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[SFCommandButtonItem previewButtonItems](self, "previewButtonItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[SFCommandButtonItem isDestructive](self, "isDestructive") ^ v3;
  v13 = v12 ^ -[SFButtonItem uniqueId](self, "uniqueId");

  return v13;
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (void)setPreviewButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
