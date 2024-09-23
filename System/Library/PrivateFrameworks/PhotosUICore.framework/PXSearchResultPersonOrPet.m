@implementation PXSearchResultPersonOrPet

- (PXSearchResultPersonOrPet)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 26, CFSTR("%s is not available as initializer"), "-[PXSearchResultPersonOrPet init]");

  abort();
}

- (PXSearchResultPersonOrPet)initWithTitle:(id)a3 assetCount:(unint64_t)a4 personUUID:(id)a5 identifier:(id)a6 type:(unint64_t)a7 subtype:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  PXSearchResultPersonOrPet *v19;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *personUUID;
  uint64_t v24;
  NSString *identifier;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (v15)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    if (a4)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
LABEL_19:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID"));

      if (v17)
        goto LABEL_5;
      goto LABEL_20;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCount"));

  if (!v16)
    goto LABEL_19;
LABEL_4:
  if (v17)
    goto LABEL_5;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_5:
  if (a7 - 5 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type == PXSearchResultTypePerson || type == PXSearchResultTypePet"));

    if (a4)
      goto LABEL_10;
  }
  else if (a4)
  {
    goto LABEL_10;
  }
  PLPhotosSearchGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v17;
    _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "PXSearchResultPersonOrPet Intialization: Search result person asset count is 0 with title: %@, UUID: %@, identifier: %@", buf, 0x20u);
  }

LABEL_10:
  if (!objc_msgSend(v16, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 46, CFSTR("PXSearchResultPersonOrPet Intialization: Search result person UUID string is empty with title: %@"), v15);

  }
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultPersonOrPet.m"), 48, CFSTR("PXSearchResultPersonOrPet Intialization: Search result identifier string is empty with title: %@"), v15);

  }
  v34.receiver = self;
  v34.super_class = (Class)PXSearchResultPersonOrPet;
  v19 = -[PXSearchResultPersonOrPet init](&v34, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v20;

    v19->_assetCount = a4;
    v22 = objc_msgSend(v16, "copy");
    personUUID = v19->_personUUID;
    v19->_personUUID = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v24;

    v19->_type = a7;
    v19->_subtype = a8;
  }

  return v19;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXSearchResultPersonOrPet identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXSearchResultPersonOrPet *v4;
  PXSearchResultPersonOrPet *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXSearchResultPersonOrPet *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXSearchResultPersonOrPet identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultPersonOrPet identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXSearchResultPersonOrPet identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSearchResultPersonOrPet type](self, "type");
  -[PXSearchResultPersonOrPet title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSearchResultPersonOrPet assetCount](self, "assetCount");
  -[PXSearchResultPersonOrPet personUUID](self, "personUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, type: %ld, title: %@, assetCount: %ld, personUUID: %@, >"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (void)setPersonUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
}

+ (id)uniqueIdentiferFromPersonUUID:(id)a3 displayName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultPersonOrPet.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultPersonOrPet.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayName"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
