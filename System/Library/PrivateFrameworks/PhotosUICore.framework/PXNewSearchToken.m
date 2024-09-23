@implementation PXNewSearchToken

+ (id)px_oneYearAgoSearchToken
{
  void *v2;
  void *v3;
  void *v4;
  PXNewSearchToken *v5;

  PXLocalizedStringFromTable(CFSTR("SEARCH_SUGGESTION_LAST_YEAR"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1102);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71C08]), "initWithText:userCategory:searchedCategories:matchType:", v2, 8, v3, 2);
  v5 = -[PXNewSearchToken initWithTitle:queryToken:type:priorityAssetUUID:]([PXNewSearchToken alloc], "initWithTitle:queryToken:type:priorityAssetUUID:", v2, v4, 1, 0);

  return v5;
}

+ (id)px_searchTokenForHashtag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PXNewSearchToken *v6;

  v3 = a3;
  objc_msgSend(CFSTR("#"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71C08]), "initWithText:userCategory:matchType:", v3, 0, 1);

  v6 = -[PXNewSearchToken initWithTitle:queryToken:type:priorityAssetUUID:]([PXNewSearchToken alloc], "initWithTitle:queryToken:type:priorityAssetUUID:", v4, v5, 1, 0);
  return v6;
}

+ (id)px_searchTokenFromZeroKeyword:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PXNewSearchToken *v14;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "representedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v3, "title");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = objc_msgSend(v6, "userCategory");
  if (v11 == 6)
  {
    if (!objc_msgSend(v10, "length"))
    {
      +[PXNewSearchToken unnamedPetDisplayText](PXNewSearchToken, "unnamedPetDisplayText");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    if (v11 == 5)
    {
      +[PXNewSearchToken socialGroupDisplayText](PXNewSearchToken, "socialGroupDisplayText");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (v11 == 1 && !objc_msgSend(v10, "length"))
    {
      +[PXNewSearchToken unnamedPersonDisplayText](PXNewSearchToken, "unnamedPersonDisplayText");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v13 = (void *)v12;

      v10 = v13;
    }
  }
  v14 = -[PXNewSearchToken initWithTitle:queryToken:type:priorityAssetUUID:]([PXNewSearchToken alloc], "initWithTitle:queryToken:type:priorityAssetUUID:", v10, v6, 1, v5);

  return v14;
}

- (PXNewSearchToken)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 36, CFSTR("%s is not available as initializer"), "-[PXNewSearchToken init]");

  abort();
}

- (PXNewSearchToken)initWithAttributedTitle:(id)a3 queryToken:(id)a4 type:(unint64_t)a5 priorityAssetUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXNewSearchToken *v14;
  uint64_t v15;
  NSAttributedString *attributedTitle;
  uint64_t v17;
  NSString *priorityAssetUUID;
  uint64_t v19;
  UIImage *icon;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *identifier;
  void *v26;
  void *v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributedTitle"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryToken"));

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)PXNewSearchToken;
  v14 = -[PXNewSearchToken init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    attributedTitle = v14->_attributedTitle;
    v14->_attributedTitle = (NSAttributedString *)v15;

    objc_storeStrong((id *)&v14->_queryToken, a4);
    v14->_type = a5;
    v14->_count = objc_msgSend(v12, "resultCount");
    v17 = objc_msgSend(v13, "copy");
    priorityAssetUUID = v14->_priorityAssetUUID;
    v14->_priorityAssetUUID = (NSString *)v17;

    objc_msgSend((id)objc_opt_class(), "_iconForSearchUserCategory:", objc_msgSend(v12, "userCategory"));
    v19 = objc_claimAutoreleasedReturnValue();
    icon = v14->_icon;
    v14->_icon = (UIImage *)v19;

    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@/%lu"), v22, objc_msgSend(v12, "hash"));
    v23 = objc_claimAutoreleasedReturnValue();
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v23;

    v14->_searchUserCategory = objc_msgSend(v12, "userCategory");
  }

  return v14;
}

- (PXNewSearchToken)initWithTitle:(id)a3 queryToken:(id)a4 type:(unint64_t)a5 priorityAssetUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PXNewSearchToken *v15;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryToken"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v11);
  v15 = -[PXNewSearchToken initWithAttributedTitle:queryToken:type:priorityAssetUUID:](self, "initWithAttributedTitle:queryToken:type:priorityAssetUUID:", v14, v12, a5, v13);

  return v15;
}

- (PXNewSearchToken)initWithSearchText:(id)a3 searchCategory:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  PXNewSearchToken *v9;

  v6 = a3;
  v7 = +[PXNewSearchToken _searchUserCategoryForSearchTokenCategory:](PXNewSearchToken, "_searchUserCategoryForSearchTokenCategory:", a4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71C08]), "initWithText:userCategory:matchType:", v6, v7, 2);
  v9 = -[PXNewSearchToken initWithTitle:queryToken:type:priorityAssetUUID:](self, "initWithTitle:queryToken:type:priorityAssetUUID:", v6, v8, 1, 0);

  return v9;
}

- (PXNewSearchToken)initWithDictionaryRepresentation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  PXNewSearchToken *v11;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dict"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryRepresentedObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
    self = -[PXNewSearchToken initWithAttributedTitle:queryToken:type:priorityAssetUUID:](self, "initWithAttributedTitle:queryToken:type:priorityAssetUUID:", v10, v8, 1, 0);
    v11 = self;
  }
  else
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive Query Token. Unable to initalize PXSearchTokenRepresentedObject, error: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  PSIQueryToken *queryToken;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  PXNewSearchToken *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[PXNewSearchToken isPersistable](self, "isPersistable"))
  {
    queryToken = self->_queryToken;
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", queryToken, 1, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v4)
    {
      v10[0] = CFSTR("title");
      -[NSAttributedString string](self->_attributedTitle, "string");
      v6 = objc_claimAutoreleasedReturnValue();
      v10[1] = CFSTR("queryRepresentedObject");
      v11[0] = v6;
      v11[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PXAssertGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = (PXNewSearchToken *)v5;
        _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to encode Query Token, error: %@", buf, 0xCu);
      }
      v7 = 0;
    }

  }
  else
  {
    PLPhotosSearchGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Attempted to get dictionaryRepresentation for search token which isn't persistable: %@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)isPersistable
{
  if (-[PXNewSearchToken isUnnamedPersonOrPet](self, "isUnnamedPersonOrPet"))
    return 0;
  else
    return !-[PXNewSearchToken isSocialGroup](self, "isSocialGroup");
}

- (BOOL)hasLeadingHashtag
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXNewSearchToken attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "characterAtIndex:", 0) == 35;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isUnnamedPersonOrPet
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[PXNewSearchToken queryToken](self, "queryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userCategory");
  if (v5 == 1
    || (-[PXNewSearchToken queryToken](self, "queryToken"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "userCategory") == 6))
  {
    -[PXNewSearchToken attributedTitle](self, "attributedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXNewSearchToken unnamedPersonDisplayText](PXNewSearchToken, "unnamedPersonDisplayText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v5 == 1)
      goto LABEL_7;
  }
  else
  {
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (BOOL)isSocialGroup
{
  void *v2;
  BOOL v3;

  -[PXNewSearchToken queryToken](self, "queryToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userCategory") == 5;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXNewSearchToken *v4;
  BOOL v5;

  v4 = (PXNewSearchToken *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PXNewSearchToken isEqualToToken:](self, "isEqualToToken:", v4);
  }

  return v5;
}

- (BOOL)isEqualToToken:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 218, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("otherToken"), v18, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchToken.m"), 218, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("otherToken"), v18);
  }

LABEL_3:
  -[PXNewSearchToken attributedTitle](self, "attributedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (v7 == v10)
  {

  }
  else
  {
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if (!v11)
    {
      v12 = 0;
      goto LABEL_11;
    }
  }
  -[PXNewSearchToken queryToken](self, "queryToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v14)
    v12 = 1;
  else
    v12 = objc_msgSend(v13, "isEqual:", v14);

LABEL_11:
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[PXNewSearchToken attributedTitle](self, "attributedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[PXNewSearchToken queryToken](self, "queryToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
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
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier: %@"), self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attributedTitle: %@"), self->_attributedTitle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("priorityAssetUUID: %@"), self->_priorityAssetUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("icon: %@"), self->_icon);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryToken: %@"), self->_queryToken);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@>"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)searchUserCategory
{
  return self->_searchUserCategory;
}

- (void)setSearchUserCategory:(unint64_t)a3
{
  self->_searchUserCategory = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (unint64_t)count
{
  return self->_count;
}

- (PSIQueryToken)queryToken
{
  return self->_queryToken;
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_queryToken, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (unint64_t)_searchUserCategoryForSearchTokenCategory:(unint64_t)a3
{
  void *v6;

  if (a3 >= 0x26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXNewSearchToken.m"), 116, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return qword_1A7C0A9A8[a3];
}

+ (id)unnamedPersonDisplayText
{
  return PXLocalizedStringFromTable(CFSTR("SEARCH_UNNAMED_PERSON_SEARCH_TOKEN_TITLE"), CFSTR("PhotosUICore"));
}

+ (id)unnamedPetDisplayText
{
  return PXLocalizedStringFromTable(CFSTR("SEARCH_UNNAMED_PET_SEARCH_TOKEN_TITLE"), CFSTR("PhotosUICore"));
}

+ (id)socialGroupDisplayText
{
  return PXLocalizedStringFromTable(CFSTR("SEARCH_SOCIAL_GROUP_TITLE"), CFSTR("PhotosUICore"));
}

+ (id)symbolNameForSearchUserCategory:(unint64_t)a3
{
  if (a3 > 0x26)
    return CFSTR("square.stack.3d.down.dottedline");
  else
    return off_1E5138158[a3];
}

+ (id)_iconForSearchUserCategory:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "symbolNameForSearchUserCategory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imagewithSymbolName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "_imagewithSymbolName:", CFSTR("magnifyingglass"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)_imagewithSymbolName:(id)a3
{
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = +[PXImageUtilities symbolIsEmbeddedGlyph:](PXImageUtilities, "symbolIsEmbeddedGlyph:", v3);
  v5 = (void *)MEMORY[0x1E0DC3870];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
