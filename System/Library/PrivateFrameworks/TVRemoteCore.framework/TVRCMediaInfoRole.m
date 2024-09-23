@implementation TVRCMediaInfoRole

+ (id)roleWithDictionary:(id)a3
{
  id v3;
  TVRCMediaInfoRole *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = objc_alloc_init(TVRCMediaInfoRole);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setCanonicalID:](v4, "setCanonicalID:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setActorName:](v4, "setActorName:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("characterName"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v7 = &stru_24DCDC4B0;
  }
  -[TVRCMediaInfoRole setCharacterName:](v4, "setCharacterName:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("roleTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setRoleDescription:](v4, "setRoleDescription:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  -[TVRCMediaInfoRole setProductPage:](v4, "setProductPage:", v10);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("images"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("url"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  -[TVRCMediaInfoRole setImageURLTemplate:](v4, "setImageURLTemplate:", v16);
  return v4;
}

- (BOOL)isEqualToRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;

  v4 = a3;
  if (!v4)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  -[TVRCMediaInfoRole productPage](self, "productPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 == 0) ^ (v6 == 0);

  if ((v7 & 1) != 0)
    goto LABEL_11;
  -[TVRCMediaInfoRole imageURLTemplate](self, "imageURLTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageURLTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v8 == 0) ^ (v9 == 0);

  if ((v10 & 1) != 0)
    goto LABEL_11;
  -[TVRCMediaInfoRole canonicalID](self, "canonicalID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_11;
  -[TVRCMediaInfoRole actorName](self, "actorName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actorName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if (!v16)
    goto LABEL_11;
  -[TVRCMediaInfoRole characterName](self, "characterName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characterName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if (!v19)
    goto LABEL_11;
  -[TVRCMediaInfoRole roleDescription](self, "roleDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "roleDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if (!v22)
    goto LABEL_11;
  -[TVRCMediaInfoRole productPage](self, "productPage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productPage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

  if (v25)
  {
    -[TVRCMediaInfoRole imageURLTemplate](self, "imageURLTemplate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageURLTemplate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqualToString:", v27);

  }
  else
  {
LABEL_11:
    v28 = 0;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TVRCMediaInfoRole *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[TVRCMediaInfoRole init](+[TVRCMediaInfoRole allocWithZone:](TVRCMediaInfoRole, "allocWithZone:", a3), "init");
  -[TVRCMediaInfoRole canonicalID](self, "canonicalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setCanonicalID:](v4, "setCanonicalID:", v5);

  -[TVRCMediaInfoRole actorName](self, "actorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setActorName:](v4, "setActorName:", v6);

  -[TVRCMediaInfoRole characterName](self, "characterName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setCharacterName:](v4, "setCharacterName:", v7);

  -[TVRCMediaInfoRole roleDescription](self, "roleDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setRoleDescription:](v4, "setRoleDescription:", v8);

  -[TVRCMediaInfoRole productPage](self, "productPage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setProductPage:](v4, "setProductPage:", v9);

  -[TVRCMediaInfoRole imageURLTemplate](self, "imageURLTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCMediaInfoRole setImageURLTemplate:](v4, "setImageURLTemplate:", v10);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCMediaInfoRole)initWithCoder:(id)a3
{
  id v4;
  TVRCMediaInfoRole *v5;
  uint64_t v6;
  NSString *canonicalID;
  uint64_t v8;
  NSString *actorName;
  uint64_t v10;
  NSString *characterName;
  uint64_t v12;
  NSString *roleDescription;
  uint64_t v14;
  NSURL *productPage;
  uint64_t v16;
  NSString *imageURLTemplate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TVRCMediaInfoRole;
  v5 = -[TVRCMediaInfoRole init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canonicalID"));
    v6 = objc_claimAutoreleasedReturnValue();
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actorName"));
    v8 = objc_claimAutoreleasedReturnValue();
    actorName = v5->_actorName;
    v5->_actorName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characterName"));
    v10 = objc_claimAutoreleasedReturnValue();
    characterName = v5->_characterName;
    v5->_characterName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roleDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    roleDescription = v5->_roleDescription;
    v5->_roleDescription = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productPage"));
    v14 = objc_claimAutoreleasedReturnValue();
    productPage = v5->_productPage;
    v5->_productPage = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURLTemplate"));
    v16 = objc_claimAutoreleasedReturnValue();
    imageURLTemplate = v5->_imageURLTemplate;
    v5->_imageURLTemplate = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *canonicalID;
  id v5;

  canonicalID = self->_canonicalID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", canonicalID, CFSTR("canonicalID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actorName, CFSTR("actorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_characterName, CFSTR("characterName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roleDescription, CFSTR("roleDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productPage, CFSTR("productPage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURLTemplate, CFSTR("imageURLTemplate"));

}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalID, a3);
}

- (NSString)actorName
{
  return self->_actorName;
}

- (void)setActorName:(id)a3
{
  objc_storeStrong((id *)&self->_actorName, a3);
}

- (NSString)characterName
{
  return self->_characterName;
}

- (void)setCharacterName:(id)a3
{
  objc_storeStrong((id *)&self->_characterName, a3);
}

- (NSString)roleDescription
{
  return self->_roleDescription;
}

- (void)setRoleDescription:(id)a3
{
  objc_storeStrong((id *)&self->_roleDescription, a3);
}

- (NSURL)productPage
{
  return self->_productPage;
}

- (void)setProductPage:(id)a3
{
  objc_storeStrong((id *)&self->_productPage, a3);
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (void)setImageURLTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLTemplate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_roleDescription, 0);
  objc_storeStrong((id *)&self->_characterName, 0);
  objc_storeStrong((id *)&self->_actorName, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
