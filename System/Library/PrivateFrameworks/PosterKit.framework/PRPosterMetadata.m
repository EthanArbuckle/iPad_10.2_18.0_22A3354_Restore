@implementation PRPosterMetadata

- (PRPosterMetadata)initWithDisplayNameLocalizationKey:(id)a3
{
  id v4;
  PRPosterMetadata *v5;
  uint64_t v6;
  NSString *displayNameLocalizationKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterMetadata;
  v5 = -[PRPosterMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    displayNameLocalizationKey = v5->_displayNameLocalizationKey;
    v5->_displayNameLocalizationKey = (NSString *)v6;

  }
  return v5;
}

- (PRPosterMetadata)init
{
  return -[PRPosterMetadata initWithDisplayNameLocalizationKey:](self, "initWithDisplayNameLocalizationKey:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRMutablePosterMetadata *v4;
  void *v5;
  PRMutablePosterMetadata *v6;

  v4 = +[PRMutablePosterMetadata allocWithZone:](PRMutablePosterMetadata, "allocWithZone:", a3);
  -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterMetadata initWithDisplayNameLocalizationKey:](v4, "initWithDisplayNameLocalizationKey:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterMetadata *v4;
  void *v5;
  char isKindOfClass;
  PRPosterMetadata *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (PRPosterMetadata *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterMetadata displayNameLocalizationKey](v7, "displayNameLocalizationKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = BSEqualStrings();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayNameLocalizationKey"));

}

- (PRPosterMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRPosterMetadata *v7;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("displayNameLocalizationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PRPosterMetadata initWithDisplayNameLocalizationKey:](self, "initWithDisplayNameLocalizationKey:", v6);
  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayNameLocalizationKey"));

}

- (PRPosterMetadata)initWithBSXPCCoder:(id)a3
{
  void *v4;
  PRPosterMetadata *v5;

  objc_msgSend(a3, "decodeStringForKey:", CFSTR("displayNameLocalizationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRPosterMetadata initWithDisplayNameLocalizationKey:](self, "initWithDisplayNameLocalizationKey:", v4);

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("displayNameLocalizationKey"), 1);

}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeMetadata");
}

- (id)encodeJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterMetadata displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("displayNameLocalizationKey"));

  -[PRPosterMetadata attributeType](self, "attributeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, CFSTR("attributeType"));

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {
    PRLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PRPosterMetadata encodeJSON].cold.1((uint64_t)self, (uint64_t)v7, v8);

  }
  return v6;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  void *v3;
  id v4;
  PRPosterMetadata *v5;
  NSObject *v6;
  PRPosterMetadata *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !v4)
  {
    v5 = [PRPosterMetadata alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayNameLocalizationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[PRPosterMetadata initWithDisplayNameLocalizationKey:](v5, "initWithDisplayNameLocalizationKey:", v6);
  }
  else
  {
    PRLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[PRPosterMetadata decodeObjectWithJSON:].cold.1((uint64_t)v4, v6);
    v7 = 0;
  }

  return v7;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
}

- (void)encodeJSON
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "Error encoding to JSON: %@ : %@", (uint8_t *)&v3, 0x16u);
}

+ (void)decodeObjectWithJSON:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18B634000, a2, OS_LOG_TYPE_ERROR, "Error decoding object from JSON: %@", (uint8_t *)&v2, 0xCu);
}

@end
