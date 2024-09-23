@implementation PFPosterDescriptor

- (PFPosterDescriptor)initWithDescriptorType:(int64_t)a3 media:(id)a4
{
  id v7;
  PFPosterDescriptor *v8;
  PFPosterDescriptor *v9;
  NSString *styleCategory;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PFPosterDescriptor;
  v8 = -[PFPosterDescriptor init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_descriptorType = a3;
    objc_storeStrong((id *)&v8->_media, a4);
    v9->_version = 0;
    styleCategory = v9->_styleCategory;
    v9->_styleCategory = 0;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PFPosterDescriptor *v4;
  PFPosterDescriptor *v5;
  int64_t v6;
  id v7;
  id v8;
  int v9;
  char v10;
  unint64_t v11;
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;

  v4 = (PFPosterDescriptor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PFPosterDescriptor descriptorType](self, "descriptorType");
      if (v6 != -[PFPosterDescriptor descriptorType](v5, "descriptorType"))
      {
        v10 = 0;
LABEL_33:

        goto LABEL_34;
      }
      -[PFPosterDescriptor media](self, "media");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PFPosterDescriptor media](v5, "media");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {

      }
      else
      {
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (!v9)
          goto LABEL_15;
      }
      v11 = -[PFPosterDescriptor version](self, "version");
      if (v11 != -[PFPosterDescriptor version](v5, "version"))
      {
LABEL_15:
        v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
      -[PFPosterDescriptor identifier](self, "identifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[PFPosterDescriptor identifier](v5, "identifier");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {

      }
      else
      {
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (!v14)
        {
          v10 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
      -[PFPosterDescriptor displayNameLocalizationKey](self, "displayNameLocalizationKey");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[PFPosterDescriptor displayNameLocalizationKey](v5, "displayNameLocalizationKey");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
      {

      }
      else
      {
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (!v17)
        {
          v10 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      v26 = v15;
      -[PFPosterDescriptor styleCategory](self, "styleCategory");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[PFPosterDescriptor styleCategory](v5, "styleCategory");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v25 = v18;
      if (v18 == v19)
      {

      }
      else
      {
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
        {
          v10 = 0;
LABEL_29:

          v15 = v26;
          goto LABEL_30;
        }
      }
      v24 = v12;
      -[PFPosterDescriptor shuffleConfiguration](self, "shuffleConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFPosterDescriptor shuffleConfiguration](v5, "shuffleConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
        v10 = 1;
      else
        v10 = objc_msgSend(v21, "isEqual:", v22);

      v12 = v24;
      goto LABEL_29;
    }
    v10 = 0;
  }
LABEL_34:

  return v10;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  BOOL v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("DescriptorModel.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *a4;
  if (*a4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Failed to encode descriptor data at path:%@ error:%@";
LABEL_9:
      _os_log_error_impl(&dword_1A16EE000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v12 = 1;
  objc_msgSend(v7, "writeToURL:options:error:", v6, 1, a4);
  v13 = *a4;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v13;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Failed to write descriptor data at path:%@ error:%@";
      goto LABEL_9;
    }
LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterDescriptor descriptorType](self, "descriptorType"), CFSTR("descriptorType"));
  -[PFPosterDescriptor media](self, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("media"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterDescriptor version](self, "version"), CFSTR("version"));
  -[PFPosterDescriptor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[PFPosterDescriptor displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayNameLocalizationKey"));

  -[PFPosterDescriptor styleCategory](self, "styleCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("styleCategory"));

  -[PFPosterDescriptor shuffleConfiguration](self, "shuffleConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("shuffleConfiguration"));

}

- (PFPosterDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PFPosterDescriptor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("media"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PFPosterDescriptor initWithDescriptorType:media:](self, "initWithDescriptorType:media:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("descriptorType")), v5);
  -[PFPosterDescriptor setVersion:](v6, "setVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterDescriptor setIdentifier:](v6, "setIdentifier:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameLocalizationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterDescriptor setDisplayNameLocalizationKey:](v6, "setDisplayNameLocalizationKey:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("styleCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterDescriptor setStyleCategory:](v6, "setStyleCategory:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shuffleConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFPosterDescriptor setShuffleConfiguration:](v6, "setShuffleConfiguration:", v10);
  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_descriptorType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSArray hash](self->_media, "hash") ^ v4;

  return v5;
}

- (int64_t)descriptorType
{
  return self->_descriptorType;
}

- (NSArray)media
{
  return self->_media;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, a3);
}

- (NSString)styleCategory
{
  return self->_styleCategory;
}

- (void)setStyleCategory:(id)a3
{
  objc_storeStrong((id *)&self->_styleCategory, a3);
}

- (PFPosterShuffleConfiguration)shuffleConfiguration
{
  return self->_shuffleConfiguration;
}

- (void)setShuffleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_shuffleConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleConfiguration, 0);
  objc_storeStrong((id *)&self->_styleCategory, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_media, 0);
}

+ (id)descriptorIdentifierForDescriptorType:(int64_t)a3 uuids:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "descriptorTypeStringWithType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = CFSTR("Undefined");
  switch(a3)
  {
    case 0:
      break;
    case 1:
    case 3:
    case 4:
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "firstObject");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v12 = (void *)v11;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@|%@"), v8, v11);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      if ((unint64_t)(a3 - 101) >= 4)
        v9 = CFSTR("??");
      else
        v9 = v7;
      break;
  }

  return v9;
}

+ (id)descriptorTypeStringWithType:(int64_t)a3
{
  id result;

  result = CFSTR("Undefined");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("FeaturedPhoto");
      break;
    case 2:
      result = CFSTR("SmartAlbum");
      break;
    case 3:
      result = CFSTR("SettlingEffect");
      break;
    case 4:
      result = CFSTR("Fallback");
      break;
    default:
      switch(a3)
      {
        case 'e':
          result = CFSTR("CreateAFacePhotos");
          break;
        case 'f':
          result = CFSTR("CreateAFaceShuffle");
          break;
        case 'g':
          result = CFSTR("CreateAFacePeople");
          break;
        case 'h':
          result = CFSTR("CreateAFaceLivePhoto");
          break;
        default:
          result = CFSTR("??");
          break;
      }
      break;
  }
  return result;
}

+ (int64_t)descriptorTypeFromTypeString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Undefined")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FeaturedPhoto")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SmartAlbum")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SettlingEffect")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fallback")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CreateAFacePhotos")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CreateAFaceShuffle")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CreateAFacePeople")) & 1) != 0)
  {
    v4 = 103;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CreateAFaceLivePhoto")))
  {
    v4 = 104;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("DescriptorModel.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v12, v6, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;

    if (v13)
    {
      v15 = v13;
LABEL_10:

      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to unarchive data error:%@", buf, 0xCu);
      if (!a4)
        goto LABEL_10;
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    *a4 = objc_retainAutorelease(v14);
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to read descriptor data at path:%@ error:%@", buf, 0x16u);
    if (a4)
      goto LABEL_6;
LABEL_13:
    v13 = 0;
    v14 = v7;
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_13;
LABEL_6:
  v14 = objc_retainAutorelease(v7);
  v13 = 0;
  *a4 = v14;
LABEL_11:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isBlankTemplate
{
  return (unint64_t)(-[PFPosterDescriptor descriptorType](self, "descriptorType") - 101) < 4;
}

- (int64_t)posterType
{
  uint64_t v2;
  int64_t result;

  v2 = -[PFPosterDescriptor descriptorType](self, "descriptorType");
  result = 0;
  if (v2 > 100)
  {
    if ((unint64_t)(v2 - 103) >= 2 && v2 != 101)
    {
      if (v2 != 102)
        return result;
      return 2;
    }
    return 1;
  }
  if ((unint64_t)(v2 - 3) < 2 || v2 == 1)
    return 1;
  if (v2 == 2)
    return 2;
  return result;
}

@end
