@implementation PXPeopleFaceTile

- (PXPeopleFaceTile)initWithFace:(id)a3 asset:(id)a4 person:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPeopleFaceTile *v12;
  PXPeopleFaceTile *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceTile;
  v12 = -[PXPeopleFaceTile init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_face, a3);
    objc_storeStrong((id *)&v13->_asset, a4);
    objc_storeStrong((id *)&v13->_person, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXPeopleFaceTile face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleFaceTile person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleFaceTile person](self, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleFaceTile asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("face:%@, person:%@(%@), asset:%@"), v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isUserDefined
{
  void *v2;
  char v3;

  -[PXPeopleFaceTile face](self, "face");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "manual");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  char v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXPeopleFaceTile person](self, "person");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "person");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
      {
        v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    -[PXPeopleFaceTile face](self, "face");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "face");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {

    }
    else
    {
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
      {
        v9 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[PXPeopleFaceTile asset](self, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
      v9 = 1;
    else
      v9 = objc_msgSend(v13, "isEqual:", v14);

    goto LABEL_15;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (PHPerson)person
{
  return self->_person;
}

- (PHFace)face
{
  return self->_face;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
