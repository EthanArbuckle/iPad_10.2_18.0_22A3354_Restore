@implementation TISticker

- (TISticker)initWithIdentifier:(id)a3 representations:(id)a4 effectType:(int64_t)a5 name:(id)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 attributionInfo:(id)a10
{
  return -[TISticker initWithIdentifier:representations:effectType:name:externalURI:accessibilityLabel:metadata:attributionInfo:searchText:accessibilityName:](self, "initWithIdentifier:representations:effectType:name:externalURI:accessibilityLabel:metadata:attributionInfo:searchText:accessibilityName:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

- (TISticker)initWithIdentifier:(id)a3 representations:(id)a4 effectType:(int64_t)a5 name:(id)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 attributionInfo:(id)a10 searchText:(id)a11 accessibilityName:(id)a12
{
  id v18;
  TISticker *v19;
  TISticker *v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v18 = a12;
  v31.receiver = self;
  v31.super_class = (Class)TISticker;
  v19 = -[TISticker init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_representations, a4);
    v20->_effectType = a5;
    objc_storeStrong((id *)&v20->_name, a6);
    objc_storeStrong((id *)&v20->_externalURI, a7);
    objc_storeStrong((id *)&v20->_accessibilityLabel, a8);
    objc_storeStrong((id *)&v20->_metadata, a9);
    objc_storeStrong((id *)&v20->_attributionInfo, a10);
    objc_storeStrong((id *)&v20->_searchText, a11);
    objc_storeStrong((id *)&v20->_accessibilityName, a12);
  }

  return v20;
}

- (TISticker)initWithCoder:(id)a3
{
  id v4;
  TISticker *v5;
  void *v6;
  uint64_t v7;
  NSUUID *identifier;
  void *v9;
  uint64_t v10;
  NSArray *representations;
  void *v12;
  uint64_t v13;
  NSString *name;
  void *v15;
  uint64_t v16;
  NSString *externalURI;
  void *v18;
  uint64_t v19;
  NSString *accessibilityLabel;
  void *v21;
  uint64_t v22;
  NSData *metadata;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDictionary *attributionInfo;
  uint64_t v31;
  NSString *accessibilityName;
  uint64_t v33;
  NSString *searchText;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TISticker;
  v5 = -[TISticker init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("representations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    representations = v5->_representations;
    v5->_representations = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v13;

    v5->_effectType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalURI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v22;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v24, v27, CFSTR("attributionInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityName"));
    v31 = objc_claimAutoreleasedReturnValue();
    accessibilityName = v5->_accessibilityName;
    v5->_accessibilityName = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchText"));
    v33 = objc_claimAutoreleasedReturnValue();
    searchText = v5->_searchText;
    v5->_searchText = (NSString *)v33;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_representations, CFSTR("representations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_effectType, CFSTR("effectType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalURI, CFSTR("externalURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityLabel, CFSTR("accessibilityLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metdata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributionInfo, CFSTR("attributionInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchText, CFSTR("searchText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityName, CFSTR("accessibilityName"));

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)representations
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)externalURI
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)accessibilityLabel
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)searchText
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)accessibilityName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSData)metadata
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSDictionary)attributionInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
