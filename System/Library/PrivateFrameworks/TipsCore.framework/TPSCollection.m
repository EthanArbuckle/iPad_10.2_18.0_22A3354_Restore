@implementation TPSCollection

- (NSString)title
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[TPSCollection tileContent](self, "tileContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E39608B8;
  v5 = v3;

  return v5;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[TPSCollection tileContent](self, "tileContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TPSContent)tileContent
{
  return self->_tileContent;
}

- (NSString)featuredTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[TPSCollection featuredContent](self, "featuredContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[TPSCollection title](self, "title");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (TPSContent)featuredContent
{
  return self->_featuredContent;
}

uint64_t __28__TPSCollection_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tocAssets");
}

uint64_t __28__TPSCollection_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tileContent");
}

uint64_t __28__TPSCollection_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featuredContent");
}

uint64_t __28__TPSCollection_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tipIdentifiers");
}

uint64_t __28__TPSCollection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortTitle");
}

uint64_t __28__TPSCollection_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collectionAssets");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__TPSCollection_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __28__TPSCollection_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __28__TPSCollection_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__TPSCollection_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (TPSCollectionGradientKey_block_invoke_na_once_token_0[0] != -1)
    dispatch_once(TPSCollectionGradientKey_block_invoke_na_once_token_0, block);
  return (id)TPSCollectionGradientKey_block_invoke_na_once_object_0;
}

+ (id)collectionLabelForDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("collectionLabel"));
}

+ (id)collectionOrderIdentifierForDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("collectionId"));
}

+ (id)tipIdentifiersForDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeArrayForKey:", CFSTR("documentIds"));
}

- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  TPSContent *v16;
  void *v17;
  TPSContent *v18;
  void *v19;
  void *v20;
  void *v21;
  TPSAssets *v22;
  void *v23;
  TPSAssets *v24;
  void *v25;
  TPSGradient *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)TPSCollection;
  v12 = a4;
  v13 = a3;
  -[TPSDocument updateWithContentDictionary:metadata:clientConditionIdentifier:fileIdMap:clientConditions:](&v27, sel_updateWithContentDictionary_metadata_clientConditionIdentifier_fileIdMap_clientConditions_, v13, v12, a5, a6, a7);
  objc_msgSend(v13, "TPSSafeStringForKey:", CFSTR("shortTitle"), v27.receiver, v27.super_class);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCollection setShortTitle:](self, "setShortTitle:", v14);

  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("tile"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TPSContent initWithDictionary:metadata:]([TPSContent alloc], "initWithDictionary:metadata:", v15, v12);
  -[TPSCollection setTileContent:](self, "setTileContent:", v16);

  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("featured"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[TPSContent initWithDictionary:metadata:]([TPSContent alloc], "initWithDictionary:metadata:", v17, v12);
  -[TPSCollection setFeaturedContent:](self, "setFeaturedContent:", v18);

  -[TPSCollection tileAssets](self, "tileAssets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDocument notification](self, "notification");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAssets:", v19);

  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("tocIcon"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TPSAssets initWithDictionary:metadata:]([TPSAssets alloc], "initWithDictionary:metadata:", v21, v12);
  -[TPSCollection setTocAssets:](self, "setTocAssets:", v22);

  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("collectionIcon"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[TPSAssets initWithDictionary:metadata:]([TPSAssets alloc], "initWithDictionary:metadata:", v23, v12);

  -[TPSCollection setCollectionAssets:](self, "setCollectionAssets:", v24);
  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("gradient"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[TPSGradient initWithDictionary:]([TPSGradient alloc], "initWithDictionary:", v25);
  -[TPSCollection setGradient:](self, "setGradient:", v26);

}

- (void)setTocAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setTileContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setShortTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setGradient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setFeaturedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setCollectionAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TPSCollection;
  v4 = a3;
  -[TPSDocument encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSCollection containsIntroTip](self, "containsIntroTip", v12.receiver, v12.super_class), CFSTR("containsIntroTip"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSCollection containsOutroTip](self, "containsOutroTip"), CFSTR("containsOutroTip"));
  -[TPSCollection shortTitle](self, "shortTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("shortTitle"));

  -[TPSCollection tipIdentifiers](self, "tipIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("documentIds"));

  -[TPSCollection featuredContent](self, "featuredContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("featured"));

  -[TPSCollection tileContent](self, "tileContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("tile"));

  -[TPSCollection tocAssets](self, "tocAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("tocIcon"));

  -[TPSCollection collectionAssets](self, "collectionAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("collectionIcon"));

  -[TPSCollection gradient](self, "gradient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("gradient"));

}

- (TPSAssets)tocAssets
{
  return self->_tocAssets;
}

- (NSArray)tipIdentifiers
{
  return self->_tipIdentifiers;
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

uint64_t __28__TPSCollection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "containsIntroTip"));
}

- (BOOL)containsIntroTip
{
  return self->_containsIntroTip;
}

- (TPSAssets)tileAssets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[TPSCollection tileContent](self, "tileContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[TPSCollection collectionAssets](self, "collectionAssets");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (TPSAssets *)v7;
}

- (TPSAssets)collectionAssets
{
  return self->_collectionAssets;
}

- (TPSGradient)gradient
{
  TPSGradient *gradient;
  TPSGradient *v3;
  void *v4;

  gradient = self->_gradient;
  if (gradient)
  {
    v3 = gradient;
  }
  else
  {
    -[TPSCollection collectionAssets](self, "collectionAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradient");
    v3 = (TPSGradient *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)containsOutroTip
{
  return self->_containsOutroTip;
}

- (void)setTipIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)isChecklist
{
  void *v2;
  void *v3;
  char v4;

  -[TPSDocument identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSCommonDefines checklistCollectionIdentifier](TPSCommonDefines, "checklistCollectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)setContainsOutroTip:(BOOL)a3
{
  self->_containsOutroTip = a3;
}

- (void)setContainsIntroTip:(BOOL)a3
{
  self->_containsIntroTip = a3;
}

- (int64_t)priority
{
  void *v2;
  int64_t v3;

  -[TPSCollection featuredContent](self, "featuredContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (TPSCollection)initWithDictionary:(id)a3 metadata:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCollection;
  return -[TPSDocument initWithDictionary:metadata:identifierKey:](&v5, sel_initWithDictionary_metadata_identifierKey_, a3, a4, CFSTR("collectionLabel"));
}

- (TPSCollection)initWithCoder:(id)a3
{
  id v4;
  TPSCollection *v5;
  uint64_t v6;
  NSString *shortTitle;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *tipIdentifiers;
  uint64_t v13;
  TPSContent *featuredContent;
  uint64_t v15;
  TPSContent *tileContent;
  uint64_t v17;
  TPSAssets *tocAssets;
  uint64_t v19;
  TPSAssets *collectionAssets;
  uint64_t v21;
  TPSGradient *gradient;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSCollection;
  v5 = -[TPSDocument initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_containsIntroTip = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containsIntroTip"));
    v5->_containsOutroTip = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containsOutroTip"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    shortTitle = v5->_shortTitle;
    v5->_shortTitle = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("documentIds"));
    v11 = objc_claimAutoreleasedReturnValue();
    tipIdentifiers = v5->_tipIdentifiers;
    v5->_tipIdentifiers = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featured"));
    v13 = objc_claimAutoreleasedReturnValue();
    featuredContent = v5->_featuredContent;
    v5->_featuredContent = (TPSContent *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tile"));
    v15 = objc_claimAutoreleasedReturnValue();
    tileContent = v5->_tileContent;
    v5->_tileContent = (TPSContent *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tocIcon"));
    v17 = objc_claimAutoreleasedReturnValue();
    tocAssets = v5->_tocAssets;
    v5->_tocAssets = (TPSAssets *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionIcon"));
    v19 = objc_claimAutoreleasedReturnValue();
    collectionAssets = v5->_collectionAssets;
    v5->_collectionAssets = (TPSAssets *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradient"));
    v21 = objc_claimAutoreleasedReturnValue();
    gradient = v5->_gradient;
    v5->_gradient = (TPSGradient *)v21;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __28__TPSCollection_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__TPSCollection_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __28__TPSCollection_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)TPSCollectionGradientKey_block_invoke_na_once_object_0;
  TPSCollectionGradientKey_block_invoke_na_once_object_0 = v1;

}

id __28__TPSCollection_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___TPSCollection;
  objc_msgSendSuper2(&v13, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_5);
  v5 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_63_0);
  v6 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_65);
  v7 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_67);
  v8 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_68);
  v9 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_70);
  v10 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_71);
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setTopFeatured:(BOOL)a3
{
  self->_topFeatured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_collectionAssets, 0);
  objc_storeStrong((id *)&self->_tocAssets, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_tipIdentifiers, 0);
  objc_storeStrong((id *)&self->_countText, 0);
  objc_storeStrong((id *)&self->_tileContent, 0);
  objc_storeStrong((id *)&self->_featuredContent, 0);
}

- (TPSAssets)featuredAssets
{
  void *v2;
  void *v3;

  -[TPSCollection featuredContent](self, "featuredContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TPSAssets *)v3;
}

- (TPSCollection)initWithIdentifier:(id)a3 title:(id)a4 text:(id)a5 metadata:(id)a6 tocAssets:(id)a7 collectionAssets:(id)a8 tipIdentifiers:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  TPSCollection *v25;
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[2];
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_opt_new();
  v31 = CFSTR("tile");
  v29[0] = CFSTR("title");
  v29[1] = CFSTR("text");
  v30[0] = v20;
  v30[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("content"));

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("collectionLabel"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, CFSTR("tipIdentifiers"));
  v28.receiver = self;
  v28.super_class = (Class)TPSCollection;
  v25 = -[TPSDocument initWithDictionary:metadata:identifierKey:](&v28, sel_initWithDictionary_metadata_identifierKey_, v22, v18, CFSTR("collectionLabel"));

  -[TPSCollection setTipIdentifiers:](v25, "setTipIdentifiers:", v15);
  -[TPSCollection setTocAssets:](v25, "setTocAssets:", v17);

  -[TPSCollection setCollectionAssets:](v25, "setCollectionAssets:", v16);
  return v25;
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TPSCollection;
  v4 = -[TPSDocument copyWithZone:](&v13, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setContainsIntroTip:", -[TPSCollection containsIntroTip](self, "containsIntroTip"));
  -[TPSCollection shortTitle](self, "shortTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShortTitle:", v5);

  -[TPSCollection tipIdentifiers](self, "tipIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTipIdentifiers:", v6);

  -[TPSCollection featuredContent](self, "featuredContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFeaturedContent:", v7);

  -[TPSCollection tileContent](self, "tileContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTileContent:", v8);

  -[TPSCollection tocAssets](self, "tocAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTocAssets:", v9);

  -[TPSCollection collectionAssets](self, "collectionAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionAssets:", v10);

  -[TPSCollection gradient](self, "gradient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGradient:", v11);

  return v4;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[TPSCollection tipIdentifiers](self, "tipIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)countExcludingBookends
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[TPSCollection tipIdentifiers](self, "tipIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = v4 - -[TPSCollection containsIntroTip](self, "containsIntroTip");
  return v5 - -[TPSCollection containsOutroTip](self, "containsOutroTip");
}

- (id)URLWithReferrer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TPSDocument identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSDocument URLWithTipIdentifier:collectionIdentifier:referrer:](TPSDocument, "URLWithTipIdentifier:collectionIdentifier:referrer:", 0, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)countText
{
  NSString *countText;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;

  countText = self->_countText;
  if (!countText)
  {
    v4 = -[TPSCollection countExcludingBookends](self, "countExcludingBookends");
    +[TPSCommonDefines tipsCoreFrameworkBundle](TPSCommonDefines, "tipsCoreFrameworkBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NUMBER_TIPS"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_1E39608B8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v4);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_countText;
    self->_countText = v10;

    countText = self->_countText;
  }
  return countText;
}

- (NSString)featuredText
{
  void *v2;
  void *v3;

  -[TPSCollection featuredContent](self, "featuredContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isHardwareWelcome
{
  void *v2;
  void *v3;
  char v4;

  -[TPSDocument identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSCommonDefines hardwareWelcomeCollectionIdentifier](TPSCommonDefines, "hardwareWelcomeCollectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isSoftwareWelcome
{
  void *v2;
  void *v3;
  char v4;

  -[TPSDocument identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSCommonDefines softwareWelcomeCollectionIdentifier](TPSCommonDefines, "softwareWelcomeCollectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isSwitcherWelcome
{
  void *v2;
  void *v3;
  char v4;

  -[TPSDocument identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSCommonDefines switcherWelcomeCollectionIdentifier](TPSCommonDefines, "switcherWelcomeCollectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

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
  objc_super v25;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v25.receiver = self;
  v25.super_class = (Class)TPSCollection;
  -[TPSDocument debugDescription](&v25, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("Priority"), -[TPSCollection priority](self, "priority"));
  -[TPSCollection tipIdentifiers](self, "tipIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("documentIds"), v6);

  -[TPSCollection shortTitle](self, "shortTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPSCollection shortTitle](self, "shortTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("shortTitle"), v8);

  }
  -[TPSCollection featuredContent](self, "featuredContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TPSCollection featuredContent](self, "featuredContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("featured"), v11);

  }
  -[TPSCollection tileContent](self, "tileContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSCollection tileContent](self, "tileContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("tile"), v14);

  }
  -[TPSCollection tocAssets](self, "tocAssets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TPSCollection tocAssets](self, "tocAssets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "debugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("tocIcon"), v17);

  }
  -[TPSCollection collectionAssets](self, "collectionAssets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[TPSCollection collectionAssets](self, "collectionAssets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "debugDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("collectionIcon"), v20);

  }
  -[TPSCollection gradient](self, "gradient");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TPSCollection gradient](self, "gradient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "debugDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("gradient"), v23);

  }
  return v5;
}

- (BOOL)isTopFeatured
{
  return self->_topFeatured;
}

- (void)setCountText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

@end
