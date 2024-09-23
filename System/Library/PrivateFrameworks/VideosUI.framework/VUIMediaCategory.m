@implementation VUIMediaCategory

void __41__VUIMediaCategory_mediaCatgeoryForType___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType;
  mediaCatgeoryForType____mediaCategoriesByMediaCategoryType = (uint64_t)v0;

  v2 = -[VUIMediaCategory _initWithType:]([VUIMediaCategory alloc], "_initWithType:", 0);
  objc_msgSend((id)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType, "setObject:forKey:", v2, &unk_1EA0B93E8);
  v3 = -[VUIMediaCategory _initWithType:]([VUIMediaCategory alloc], "_initWithType:", 2);
  objc_msgSend((id)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType, "setObject:forKey:", v3, &unk_1EA0B9400);
  v4 = -[VUIMediaCategory _initWithType:]([VUIMediaCategory alloc], "_initWithType:", 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA0B9400, &unk_1EA0B9418, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportedMediaCollectionTypes:", v5);
  v8 = &unk_1EA0B9400;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA0B9418, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSupportedChildMediaCollectionTypes:", v7);
  objc_msgSend((id)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType, "setObject:forKey:", v4, &unk_1EA0B9418);

}

- (NSSet)supportedMediaCollectionTypes
{
  return self->_supportedMediaCollectionTypes;
}

- (void)setSupportedMediaCollectionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSupportedChildMediaCollectionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)_initWithType:(unint64_t)a3
{
  VUIMediaCategory *v4;
  VUIMediaCategory *v5;
  uint64_t v6;
  NSSet *supportedMediaCollectionTypes;
  NSDictionary *supportedChildMediaCollectionTypes;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIMediaCategory;
  v4 = -[VUIMediaCategory init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    supportedMediaCollectionTypes = v5->_supportedMediaCollectionTypes;
    v5->_supportedMediaCollectionTypes = (NSSet *)v6;

    supportedChildMediaCollectionTypes = v5->_supportedChildMediaCollectionTypes;
    v5->_supportedChildMediaCollectionTypes = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v5;
}

+ (id)mediaCatgeoryForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (mediaCatgeoryForType____onceToken != -1)
    dispatch_once(&mediaCatgeoryForType____onceToken, &__block_literal_global_55);
  v4 = (void *)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    VUIMediaCategoryTypeLogString(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpected mediaCategoryType parameter: %@"), v9);

  }
  return v6;
}

- (VUIMediaCategory)init
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
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  objc_super v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23.receiver = self;
  v23.super_class = (Class)VUIMediaCategory;
  -[VUIMediaCategory description](&v23, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaCategoryTypeLogString(-[VUIMediaCategory type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("type"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaCategory supportedMediaCollectionTypes](self, "supportedMediaCollectionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  VUIMediaCollectionTypesLogString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("supportedMediaCollectionTypes"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VUIMediaCategory supportedChildMediaCollectionTypes](self, "supportedChildMediaCollectionTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __31__VUIMediaCategory_description__block_invoke;
  v21[3] = &unk_1E9F9CBF0;
  v22 = v13;
  v15 = v13;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v21);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("supportedChildMediaCollectionTypes"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@>"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __31__VUIMediaCategory_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  VUIMediaCollectionTypeLogString(objc_msgSend(a2, "unsignedIntegerValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VUIMediaCollectionTypesLogString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)supportedChildMediaCollectionTypes
{
  return self->_supportedChildMediaCollectionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedChildMediaCollectionTypes, 0);
  objc_storeStrong((id *)&self->_supportedMediaCollectionTypes, 0);
}

@end
