@implementation PKWorldRegion

- (PKWorldRegion)init
{
  PKWorldRegion *result;
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKWorldRegion;
  result = -[PKWorldRegion init](&v5, sel_init);
  if (result)
  {
    v3 = *MEMORY[0x1E0C9E500];
    v4 = *(double *)(MEMORY[0x1E0C9E500] + 8);
    result->_latitude = *(double *)MEMORY[0x1E0C9E500];
    result->_longitude = v4;
    result->_latitudeDelta = v3;
    result->_longitudeDelta = v4;
  }
  return result;
}

- (PKWorldRegion)initWithCoder:(id)a3
{
  id v4;
  PKWorldRegion *v5;
  uint64_t v6;
  NSString *identifier;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  NSString *localizedName;
  uint64_t v14;
  NSString *localeIdentifier;
  uint64_t v16;
  NSString *abbreviationCode;
  uint64_t v18;
  PKWorldRegion *parentRegion;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKWorldRegion;
  v5 = -[PKWorldRegion init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_muid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("muid"));
    v5->_resultProviderIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("resultProviderIdentifier"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v5->_latitude = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v5->_longitude = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitudeDelta"));
    v5->_latitudeDelta = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitudeDelta"));
    v5->_longitudeDelta = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abbreviationCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    abbreviationCode = v5->_abbreviationCode;
    v5->_abbreviationCode = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentRegion"));
    v18 = objc_claimAutoreleasedReturnValue();
    parentRegion = v5->_parentRegion;
    v5->_parentRegion = (PKWorldRegion *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_muid, CFSTR("muid"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_resultProviderIdentifier, CFSTR("resultProviderIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("localizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localeIdentifier, CFSTR("localeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_abbreviationCode, CFSTR("abbreviationCode"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitudeDelta"), self->_latitudeDelta);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitudeDelta"), self->_longitudeDelta);
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentRegion, CFSTR("parentRegion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- ($F7B9B8DFEF474B3BB7BDDE1984A806A4)displayRegion
{
  CLLocationCoordinate2D v4;

  v4 = CLLocationCoordinate2DMake(self->_latitude, self->_longitude);
  return ($F7B9B8DFEF474B3BB7BDDE1984A806A4 *)CLLocationCoordinate2DIsValid(v4);
}

- (void)setDisplayRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  self->_latitude = v3;
  self->_longitude = v4;
  self->_latitudeDelta = v5;
  self->_longitudeDelta = v6;
}

- (BOOL)isEqual:(id)a3
{
  PKWorldRegion *v4;
  BOOL v5;

  v4 = (PKWorldRegion *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKWorldRegion isEqualToWorldRegion:](self, "isEqualToWorldRegion:", v4);
  }

  return v5;
}

- (BOOL)isEqualToWorldRegion:(id)a3
{
  id v4;
  NSString *localizedName;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  BOOL v11;
  NSString *v12;
  _BOOL4 v13;
  NSString *abbreviationCode;
  void *v15;
  NSString *v16;
  _BOOL4 v17;
  NSString *localeIdentifier;
  void *v19;
  NSString *v20;
  NSString *v21;
  _BOOL4 v22;
  unint64_t type;

  v4 = a3;
  localizedName = self->_localizedName;
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = localizedName;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = 0;
    v12 = v8;
    goto LABEL_33;
  }
  v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

  if (v13)
  {
LABEL_10:
    abbreviationCode = self->_abbreviationCode;
    objc_msgSend(v4, "abbreviationCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = abbreviationCode;
    v16 = v15;
    v7 = v16;
    if (v12 == v16)
    {

    }
    else
    {
      if (!v12 || !v16)
      {

        goto LABEL_32;
      }
      v17 = -[NSString isEqualToString:](v12, "isEqualToString:", v16);

      if (!v17)
      {
        v11 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    localeIdentifier = self->_localeIdentifier;
    objc_msgSend(v4, "localeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = localeIdentifier;
    v21 = v19;
    v12 = v21;
    if (v20 == v21)
    {

LABEL_24:
      type = self->_type;
      if (type != objc_msgSend(v4, "type")
        || self->_muid != *((_QWORD *)v4 + 1)
        || self->_resultProviderIdentifier != *((_DWORD *)v4 + 4)
        || self->_latitude != *((double *)v4 + 4)
        || self->_longitude != *((double *)v4 + 5)
        || self->_latitudeDelta != *((double *)v4 + 6))
      {
        goto LABEL_32;
      }
      v11 = self->_longitudeDelta == *((double *)v4 + 7);
LABEL_33:

      goto LABEL_34;
    }
    if (v20 && v21)
    {
      v22 = -[NSString isEqualToString:](v20, "isEqualToString:", v21);

      if (!v22)
        goto LABEL_32;
      goto LABEL_24;
    }

LABEL_32:
    v11 = 0;
    goto LABEL_33;
  }
  v11 = 0;
LABEL_35:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_abbreviationCode);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedName);
  objc_msgSend(v3, "safelyAddObject:", self->_localeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_parentRegion);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_muid - v5 + 32 * v5;
  v7 = self->_resultProviderIdentifier - v6 + 32 * v6;
  v8 = (unint64_t)self->_latitude - v7 + 32 * v7;
  v9 = (unint64_t)self->_longitude - v8 + 32 * v8;
  v10 = (unint64_t)self->_latitudeDelta - v9 + 32 * v9;
  v11 = (unint64_t)self->_longitudeDelta - v10 + 32 * v10;

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t type;
  NSString *localizedName;
  NSString *localeIdentifier;
  NSString *abbreviationCode;
  NSString *identifier;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  type = self->_type;
  localizedName = self->_localizedName;
  localeIdentifier = self->_localeIdentifier;
  identifier = self->_identifier;
  abbreviationCode = self->_abbreviationCode;
  -[PKWorldRegion identifier](self->_parentRegion, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, type: %lu, name: %@, locale: %@, code: %@, parentID: %@, displayRegion: %.4f/%.4f, %.4f/%.4f>"),
    v4,
    self,
    identifier,
    type,
    localizedName,
    localeIdentifier,
    abbreviationCode,
    v10,
    *(_QWORD *)&self->_latitude,
    *(_QWORD *)&self->_longitude,
    *(_QWORD *)&self->_latitudeDelta,
    *(_QWORD *)&self->_longitudeDelta);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)regionOfType:(unint64_t)a3
{
  PKWorldRegion *v3;
  uint64_t v5;

  if (self->_type == a3)
  {
    v3 = self;
  }
  else
  {
    -[PKWorldRegion parentRegion](self, "parentRegion");
    v3 = (PKWorldRegion *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      do
      {
        if (-[PKWorldRegion type](v3, "type") == a3)
          break;
        -[PKWorldRegion parentRegion](v3, "parentRegion");
        v5 = objc_claimAutoreleasedReturnValue();

        v3 = (PKWorldRegion *)v5;
      }
      while (v5);
    }
  }
  return v3;
}

- (id)searchString
{
  void *v2;
  void *v4;
  NSString *localizedName;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v2 = 0;
  switch(self->_type)
  {
    case 0uLL:
      v4 = (void *)MEMORY[0x1E0CB3940];
      localizedName = self->_localizedName;
      -[PKWorldRegion localizedName](self->_parentRegion, "localizedName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@, %@"), localizedName, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[PKWorldRegion regionOfType:](self, "regionOfType:", 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWorldRegion regionOfType:](self, "regionOfType:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "abbreviationCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedStringForCountryCode(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "localizedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = self->_localizedName;
      if (v12)
      {
        objc_msgSend(v6, "localizedName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %@, %@"), v14, v15, v11);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), self->_localizedName, v11);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_10;
    case 3uLL:
      -[PKWorldRegion regionOfType:](self, "regionOfType:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "abbreviationCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedStringForCountryCode(v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), self->_localizedName, v18);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedStringForCountryCode(v6, self->_abbreviationCode);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v2 = (void *)v7;
LABEL_10:

      break;
    default:
      return v2;
  }
  return v2;
}

- (BOOL)isIncludedInRegions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[PKWorldRegion parentRegion](self, "parentRegion", (_QWORD)v21);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          do
          {
            objc_msgSend(v9, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v12;
            v15 = v13;
            v16 = v15;
            if (v14 == v15)
            {
              v17 = 1;
            }
            else
            {
              v17 = 0;
              if (v14 && v15)
                v17 = objc_msgSend(v14, "isEqualToString:", v15);
            }

            objc_msgSend(v11, "parentRegion");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if ((v17 & 1) != 0)
              break;
            v11 = v18;
          }
          while (v18);

          if ((v17 & 1) != 0)
          {
            v19 = 1;
            goto LABEL_20;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_20:

  return v19;
}

+ (unint64_t)mostConstrainingTypeInRegions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "type");
        if (v9 < v7)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 4;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)resultProviderIdentifier
{
  return self->_resultProviderIdentifier;
}

- (void)setResultProviderIdentifier:(int)a3
{
  self->_resultProviderIdentifier = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSString)abbreviationCode
{
  return self->_abbreviationCode;
}

- (void)setAbbreviationCode:(id)a3
{
  objc_storeStrong((id *)&self->_abbreviationCode, a3);
}

- (PKWorldRegion)parentRegion
{
  return self->_parentRegion;
}

- (void)setParentRegion:(id)a3
{
  objc_storeStrong((id *)&self->_parentRegion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviationCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_parentRegion, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
