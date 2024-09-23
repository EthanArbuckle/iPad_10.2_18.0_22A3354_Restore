@implementation TPSAssetSizes

- (TPSAssetSizes)initWithDictionary:(id)a3
{
  id v4;
  TPSAssetSizes *v5;
  TPSSizes *v6;
  void *v7;
  uint64_t v8;
  TPSSizes *tip;
  TPSSizes *v10;
  void *v11;
  uint64_t v12;
  TPSSizes *tipIntro;
  TPSSizes *v14;
  void *v15;
  uint64_t v16;
  TPSSizes *collectionFeatured;
  TPSSizes *v18;
  void *v19;
  uint64_t v20;
  TPSSizes *thumbnail;
  TPSAssetSizes *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSAssetSizes;
  v5 = -[TPSSerializableObject initWithDictionary:](&v24, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_6;
  v6 = [TPSSizes alloc];
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("tip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TPSSizes initWithDictionary:](v6, "initWithDictionary:", v7);
  tip = v5->_tip;
  v5->_tip = (TPSSizes *)v8;

  v10 = [TPSSizes alloc];
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("tipIntro"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TPSSizes initWithDictionary:](v10, "initWithDictionary:", v11);
  tipIntro = v5->_tipIntro;
  v5->_tipIntro = (TPSSizes *)v12;

  v14 = [TPSSizes alloc];
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("collectionHero"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TPSSizes initWithDictionary:](v14, "initWithDictionary:", v15);
  collectionFeatured = v5->_collectionFeatured;
  v5->_collectionFeatured = (TPSSizes *)v16;

  v18 = [TPSSizes alloc];
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("thumbnail"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[TPSSizes initWithDictionary:](v18, "initWithDictionary:", v19);
  thumbnail = v5->_thumbnail;
  v5->_thumbnail = (TPSSizes *)v20;

  if (v5->_tip || v5->_tipIntro || v5->_collectionFeatured || v5->_thumbnail)
LABEL_6:
    v22 = v5;
  else
    v22 = 0;

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSAssetSizes;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[TPSAssetSizes tip](self, "tip", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tip"));

  -[TPSAssetSizes tipIntro](self, "tipIntro");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tipIntro"));

  -[TPSAssetSizes collectionFeatured](self, "collectionFeatured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("collectionHero"));

  -[TPSAssetSizes thumbnail](self, "thumbnail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("thumbnail"));

}

- (TPSSizes)tip
{
  return self->_tip;
}

- (TPSSizes)tipIntro
{
  return self->_tipIntro;
}

- (TPSSizes)thumbnail
{
  return self->_thumbnail;
}

- (TPSSizes)collectionFeatured
{
  return self->_collectionFeatured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_collectionFeatured, 0);
  objc_storeStrong((id *)&self->_tipIntro, 0);
  objc_storeStrong((id *)&self->_tip, 0);
}

- (TPSAssetSizes)initWithCoder:(id)a3
{
  id v4;
  TPSAssetSizes *v5;
  uint64_t v6;
  TPSSizes *tip;
  uint64_t v8;
  TPSSizes *tipIntro;
  uint64_t v10;
  TPSSizes *collectionFeatured;
  uint64_t v12;
  TPSSizes *thumbnail;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAssetSizes;
  v5 = -[TPSSerializableObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip"));
    v6 = objc_claimAutoreleasedReturnValue();
    tip = v5->_tip;
    v5->_tip = (TPSSizes *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tipIntro"));
    v8 = objc_claimAutoreleasedReturnValue();
    tipIntro = v5->_tipIntro;
    v5->_tipIntro = (TPSSizes *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionHero"));
    v10 = objc_claimAutoreleasedReturnValue();
    collectionFeatured = v5->_collectionFeatured;
    v5->_collectionFeatured = (TPSSizes *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnail"));
    v12 = objc_claimAutoreleasedReturnValue();
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (TPSSizes *)v12;

  }
  return v5;
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
  v10.super_class = (Class)TPSAssetSizes;
  v4 = -[TPSSerializableObject copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[TPSAssetSizes tip](self, "tip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTip:", v5);

  -[TPSAssetSizes tipIntro](self, "tipIntro");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTipIntro:", v6);

  -[TPSAssetSizes collectionFeatured](self, "collectionFeatured");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionFeatured:", v7);

  -[TPSAssetSizes thumbnail](self, "thumbnail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumbnail:", v8);

  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v11.receiver = self;
  v11.super_class = (Class)TPSAssetSizes;
  -[TPSAssetSizes description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSAssetSizes tip](self, "tip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ = %@\n"), CFSTR("tip"), v6);

  -[TPSAssetSizes tipIntro](self, "tipIntro");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("tipIntro"), v7);

  -[TPSAssetSizes collectionFeatured](self, "collectionFeatured");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("collectionHero"), v8);

  -[TPSAssetSizes thumbnail](self, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@"), CFSTR("thumbnail"), v9);

  return v5;
}

- (void)setTip:(id)a3
{
  objc_storeStrong((id *)&self->_tip, a3);
}

- (void)setTipIntro:(id)a3
{
  objc_storeStrong((id *)&self->_tipIntro, a3);
}

- (void)setCollectionFeatured:(id)a3
{
  objc_storeStrong((id *)&self->_collectionFeatured, a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

@end
