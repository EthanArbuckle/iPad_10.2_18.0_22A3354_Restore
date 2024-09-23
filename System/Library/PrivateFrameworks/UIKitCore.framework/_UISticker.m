@implementation _UISticker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISticker)init
{
  _UISticker *v2;
  _UISticker *v3;
  NSString *identifier;
  NSArray *representations;
  NSString *name;
  NSString *externalURI;
  NSString *accessibilityLabel;
  NSData *metadata;
  NSDictionary *attributionInfo;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UISticker;
  v2 = -[_UISticker init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;

    representations = v3->_representations;
    v3->_representations = 0;

    name = v3->_name;
    v3->_effectType = -1;
    v3->_name = 0;

    externalURI = v3->_externalURI;
    v3->_externalURI = 0;

    accessibilityLabel = v3->_accessibilityLabel;
    v3->_accessibilityLabel = 0;

    metadata = v3->_metadata;
    v3->_metadata = 0;

    attributionInfo = v3->_attributionInfo;
    v3->_attributionInfo = 0;

  }
  return v3;
}

- (_UISticker)initWithCoder:(id)a3
{
  id v4;
  _UISticker *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSArray *representations;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *externalURI;
  uint64_t v14;
  NSString *accessibilityLabel;
  uint64_t v16;
  NSData *metadata;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *attributionInfo;
  uint64_t v24;
  _UIStickerRepresentation *bakedInRep;
  uint64_t v26;
  NSString *searchText;
  uint64_t v28;
  NSString *accessibilityName;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UISticker;
  v5 = -[_UISticker init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("r"));
    v8 = objc_claimAutoreleasedReturnValue();
    representations = v5->_representations;
    v5->_representations = (NSArray *)v8;

    v5->_effectType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("et"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("n"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eu"));
    v12 = objc_claimAutoreleasedReturnValue();
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("al"));
    v14 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
    v16 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v18, v21, CFSTR("ai"));
    v22 = objc_claimAutoreleasedReturnValue();
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
    v24 = objc_claimAutoreleasedReturnValue();
    bakedInRep = v5->_bakedInRep;
    v5->_bakedInRep = (_UIStickerRepresentation *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("st"));
    v26 = objc_claimAutoreleasedReturnValue();
    searchText = v5->_searchText;
    v5->_searchText = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("an"));
    v28 = objc_claimAutoreleasedReturnValue();
    accessibilityName = v5->_accessibilityName;
    v5->_accessibilityName = (NSString *)v28;

  }
  return v5;
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
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[_UISticker identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("i"));

  -[_UISticker representations](self, "representations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("r"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_UISticker effectType](self, "effectType"), CFSTR("et"));
  -[_UISticker name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("n"));

  -[_UISticker externalURI](self, "externalURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("eu"));

  -[_UISticker accessibilityLabel](self, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("al"));

  -[_UISticker metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("m"));

  -[_UISticker attributionInfo](self, "attributionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("ai"));

  -[_UISticker bakedInRep](self, "bakedInRep");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("b"));

  -[_UISticker searchText](self, "searchText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("st"));

  -[_UISticker accessibilityName](self, "accessibilityName");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("an"));

}

- (BOOL)isAnimated
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[_UISticker representations](self, "representations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[_UISticker representations](self, "representations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.stickers.role.animated"));

  return v8;
}

- (BOOL)hasLiveEffect
{
  return (unint64_t)(-[_UISticker effectType](self, "effectType") - 3) < 2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
  objc_storeStrong((id *)&self->_representations, a3);
}

- (_UIStickerRepresentation)bakedInRep
{
  return self->_bakedInRep;
}

- (void)setBakedInRep:(id)a3
{
  objc_storeStrong((id *)&self->_bakedInRep, a3);
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
  objc_storeStrong((id *)&self->_externalURI, a3);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_searchText, a3);
}

- (NSString)accessibilityName
{
  return self->_accessibilityName;
}

- (void)setAccessibilityName:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityName, a3);
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityLabel, a3);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_attributionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bakedInRep, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
