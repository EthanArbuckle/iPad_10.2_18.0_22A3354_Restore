@implementation PXPhotosDetailsVisualLookupData

- (PXPhotosDetailsVisualLookupData)init
{
  return -[PXPhotosDetailsVisualLookupData initWithGlyphName:visualDomain:displayMessage:](self, "initWithGlyphName:visualDomain:displayMessage:", 0, 0, 0);
}

- (PXPhotosDetailsVisualLookupData)initWithGlyphName:(id)a3 visualDomain:(id)a4 displayMessage:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotosDetailsVisualLookupData *v12;
  PXPhotosDetailsVisualLookupData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotosDetailsVisualLookupData;
  v12 = -[PXPhotosDetailsVisualLookupData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_glyphImageName, a3);
    objc_storeStrong((id *)&v13->_visualDomain, a4);
    objc_storeStrong((id *)&v13->_displayMessage, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PXPhotosDetailsVisualLookupData *v4;
  BOOL v5;
  objc_super v7;

  v4 = (PXPhotosDetailsVisualLookupData *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)PXPhotosDetailsVisualLookupData,
          -[PXPhotosDetailsVisualLookupData isEqual:](&v7, sel_isEqual_, v4))
      && -[PXPhotosDetailsVisualLookupData _isEqualToVisualLookupData:](self, "_isEqualToVisualLookupData:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToVisualLookupData:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  char v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[PXPhotosDetailsVisualLookupData glyphImageName](self, "glyphImageName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "glyphImageName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {

LABEL_5:
    -[PXPhotosDetailsVisualLookupData visualDomain](self, "visualDomain");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualDomain");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {

    }
    else
    {
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
      {
        v8 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    -[PXPhotosDetailsVisualLookupData displayMessage](self, "displayMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
      v8 = 1;
    else
      v8 = objc_msgSend(v12, "isEqualToString:", v13);

    goto LABEL_13;
  }
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    goto LABEL_5;
  v8 = 0;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PXPhotosDetailsVisualLookupData glyphImageName](self, "glyphImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXPhotosDetailsVisualLookupData visualDomain](self, "visualDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[PXPhotosDetailsVisualLookupData displayMessage](self, "displayMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[PXPhotosDetailsVisualLookupData glyphImageName](self, "glyphImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsVisualLookupData visualDomain](self, "visualDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsVisualLookupData displayMessage](self, "displayMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; glyph name = %@, domain name = %@, display message = %@>"),
                 v4,
                 self,
                 v5,
                 v6,
                 v7);

  return v8;
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (void)setDisplayMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)glyphImageName
{
  return self->_glyphImageName;
}

- (void)setGlyphImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)visualDomain
{
  return self->_visualDomain;
}

- (void)setVisualDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualDomain, 0);
  objc_storeStrong((id *)&self->_glyphImageName, 0);
  objc_storeStrong((id *)&self->_displayMessage, 0);
}

@end
