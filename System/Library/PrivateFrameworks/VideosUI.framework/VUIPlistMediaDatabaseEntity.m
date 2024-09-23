@implementation VUIPlistMediaDatabaseEntity

- (VUIPlistMediaDatabaseEntity)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6;
  VUIPlistMediaDatabaseEntity *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  objc_super v12;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("identifier"));
  v12.receiver = self;
  v12.super_class = (Class)VUIPlistMediaDatabaseEntity;
  v7 = -[VUIPlistMediaDatabaseEntity init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_type = a4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__mediaEntityPropertyDidChange_, VUIPlistMediaEntityPropertyDidChange, 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIPlistMediaDatabaseEntity;
  -[VUIPlistMediaDatabaseEntity dealloc](&v4, sel_dealloc);
}

- (VUIPlistMediaDatabaseEntity)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  VUIPlistMediaDatabaseEntity *v8;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSString *genreTitle;
  void *v15;
  uint64_t v16;
  NSString *contentDescription;
  void *v18;
  uint64_t v19;
  NSString *canonicalID;
  void *v21;
  uint64_t v22;
  NSURL *coverArtURL;

  v4 = a3;
  objc_msgSend(v4, "vui_stringForKey:", CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_numberForKey:", CFSTR("Type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = -[VUIPlistMediaDatabaseEntity initWithIdentifier:type:](self, "initWithIdentifier:type:", v5, v7);
  if (v8)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("Title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v10;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("GenreTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    genreTitle = v8->_genreTitle;
    v8->_genreTitle = (NSString *)v13;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("ContentDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    contentDescription = v8->_contentDescription;
    v8->_contentDescription = (NSString *)v16;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("canonicalId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    canonicalID = v8->_canonicalID;
    v8->_canonicalID = (NSString *)v19;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("CoverArtURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      coverArtURL = v8->_coverArtURL;
      v8->_coverArtURL = (NSURL *)v22;

    }
  }

  return v8;
}

- (VUIPlistMediaDatabaseEntity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (NSNumber)isLocal
{
  return 0;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VUIPlistMediaDatabaseEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("Identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIPlistMediaDatabaseEntity type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, CFSTR("Type"));

  -[VUIPlistMediaDatabaseEntity title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v6, CFSTR("Title"));

  -[VUIPlistMediaDatabaseEntity contentDescription](self, "contentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("ContentDescription"));

  -[VUIPlistMediaDatabaseEntity coverArtURL](self, "coverArtURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v9, CFSTR("CoverArtURL"));

  -[VUIPlistMediaDatabaseEntity genreTitle](self, "genreTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v10, CFSTR("GenreTitle"));

  -[VUIPlistMediaDatabaseEntity canonicalID](self, "canonicalID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v11, CFSTR("canonicalId"));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:type:", self->_identifier, self->_type);
  v5 = -[NSString copy](self->_title, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[NSString copy](self->_contentDescription, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[NSURL copy](self->_coverArtURL, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSString copy](self->_genreTitle, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_canonicalID, "copy");
  v14 = (void *)v4[7];
  v4[7] = v13;

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[VUIPlistMediaDatabaseEntity type](self, "type");
  -[VUIPlistMediaDatabaseEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlistMediaDatabaseEntity *v4;
  VUIPlistMediaDatabaseEntity *v5;
  VUIPlistMediaDatabaseEntity *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v4 = (VUIPlistMediaDatabaseEntity *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUIPlistMediaDatabaseEntity identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseEntity identifier](v6, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
            goto LABEL_49;
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_47;
        }
        -[VUIPlistMediaDatabaseEntity isLocal](self, "isLocal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseEntity isLocal](v6, "isLocal");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        if (v9 == v16)
        {

        }
        else
        {
          v11 = v16;
          v12 = 0;
          if (!v9 || !v16)
            goto LABEL_49;
          v17 = objc_msgSend(v9, "isEqual:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_47;
        }
        -[VUIPlistMediaDatabaseEntity title](self, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseEntity title](v6, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        v20 = v19;
        if (v9 == v20)
        {

        }
        else
        {
          v11 = v20;
          v12 = 0;
          if (!v9 || !v20)
            goto LABEL_49;
          v21 = objc_msgSend(v9, "isEqual:", v20);

          if ((v21 & 1) == 0)
            goto LABEL_47;
        }
        -[VUIPlistMediaDatabaseEntity contentDescription](self, "contentDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseEntity contentDescription](v6, "contentDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v22;
        v24 = v23;
        if (v9 == v24)
        {

        }
        else
        {
          v11 = v24;
          v12 = 0;
          if (!v9 || !v24)
            goto LABEL_49;
          v25 = objc_msgSend(v9, "isEqual:", v24);

          if ((v25 & 1) == 0)
            goto LABEL_47;
        }
        -[VUIPlistMediaDatabaseEntity coverArtURL](self, "coverArtURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseEntity coverArtURL](v6, "coverArtURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v26;
        v28 = v27;
        if (v9 == v28)
        {

        }
        else
        {
          v11 = v28;
          v12 = 0;
          if (!v9 || !v28)
            goto LABEL_49;
          v29 = objc_msgSend(v9, "isEqual:", v28);

          if ((v29 & 1) == 0)
            goto LABEL_47;
        }
        -[VUIPlistMediaDatabaseEntity genreTitle](self, "genreTitle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseEntity genreTitle](v6, "genreTitle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v30;
        v32 = v31;
        if (v9 == v32)
        {

        }
        else
        {
          v11 = v32;
          v12 = 0;
          if (!v9 || !v32)
            goto LABEL_49;
          v33 = objc_msgSend(v9, "isEqual:", v32);

          if ((v33 & 1) == 0)
            goto LABEL_47;
        }
        v34 = -[VUIPlistMediaDatabaseEntity type](self, "type");
        if (v34 != -[VUIPlistMediaDatabaseEntity type](v6, "type"))
        {
LABEL_47:
          v12 = 0;
LABEL_50:

          goto LABEL_51;
        }
        -[VUIPlistMediaDatabaseEntity canonicalID](self, "canonicalID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabaseEntity canonicalID](v6, "canonicalID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v35;
        v37 = v36;
        v11 = v37;
        if (v9 == v37)
        {
          v12 = 1;
        }
        else
        {
          v12 = 0;
          if (v9 && v37)
            v12 = objc_msgSend(v9, "isEqual:", v37);
        }
LABEL_49:

        goto LABEL_50;
      }
    }
    v12 = 0;
  }
LABEL_51:

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33.receiver = self;
  v33.super_class = (Class)VUIPlistMediaDatabaseEntity;
  -[VUIPlistMediaDatabaseEntity description](&v33, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseEntity identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIPlistMediaDatabaseEntity type](self, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("type"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseEntity isLocal](self, "isLocal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("isLocal"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseEntity title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("title"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseEntity contentDescription](self, "contentDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("contentDescription"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseEntity coverArtURL](self, "coverArtURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("coverArtURL"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v23 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseEntity genreTitle](self, "genreTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("genreTitle"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaDatabaseEntity canonicalID](self, "canonicalID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("canonicalID"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@>"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)_mediaEntityPropertyDidChange:(id)a3
{
  VUIPlistMediaDatabaseEntity *v4;
  VUIPlistMediaDatabaseEntity *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "object");
  v4 = (VUIPlistMediaDatabaseEntity *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != self)
  {
    -[VUIPlistMediaDatabaseEntity identifier](v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlistMediaDatabaseEntity identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v14, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", VUIPlistMediaEntityPropertyDidChangePropertyNameKey);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", VUIPlistMediaEntityPropertyDidChangePropertyValueKey);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
        {

          v12 = 0;
        }
        -[VUIPlistMediaDatabaseEntity setValue:forKey:](self, "setValue:forKey:", v12, v10);
      }

    }
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)genreTitle
{
  return self->_genreTitle;
}

- (void)setGenreTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setContentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)coverArtURL
{
  return self->_coverArtURL;
}

- (void)setCoverArtURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_coverArtURL, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_genreTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
