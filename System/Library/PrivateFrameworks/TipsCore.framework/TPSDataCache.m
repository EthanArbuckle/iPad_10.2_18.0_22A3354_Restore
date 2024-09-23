@implementation TPSDataCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TPSDataCache *v4;

  v4 = +[TPSDataCache allocWithZone:](TPSDataCache, "allocWithZone:", a3);
  -[TPSDataCache setCacheType:](v4, "setCacheType:", self->_cacheType);
  -[TPSDataCache setMaxAge:](v4, "setMaxAge:", self->_maxAge);
  -[TPSDataCache setFileSize:](v4, "setFileSize:", self->_fileSize);
  -[TPSDataCache setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[TPSDataCache setUpdatedDate:](v4, "setUpdatedDate:", self->_updatedDate);
  -[TPSDataCache setLastModified:](v4, "setLastModified:", self->_lastModified);
  -[TPSDataCache setLanguageCode:](v4, "setLanguageCode:", self->_languageCode);
  return v4;
}

- (TPSDataCache)initWithCoder:(id)a3
{
  id v4;
  TPSDataCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSDataCache;
  v5 = -[TPSDataCache init](&v11, sel_init);
  if (v5)
  {
    -[TPSDataCache setMaxAge:](v5, "setMaxAge:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TPSDataCacheMaxAge")));
    -[TPSDataCache setCacheType:](v5, "setCacheType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TPSDataCacheType")));
    -[TPSDataCache setFileSize:](v5, "setFileSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TPSDataCacheFileSize")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TPSDataCacheIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSDataCache setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TPSDataCacheLastModified"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSDataCache setLastModified:](v5, "setLastModified:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TPSDataCacheLangaugeCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSDataCache setLanguageCode:](v5, "setLanguageCode:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TPSDataCacheUpdatedDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSDataCache setUpdatedDate:](v5, "setUpdatedDate:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDataCache maxAge](self, "maxAge"), CFSTR("TPSDataCacheMaxAge"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDataCache cacheType](self, "cacheType"), CFSTR("TPSDataCacheType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDataCache fileSize](self, "fileSize"), CFSTR("TPSDataCacheFileSize"));
  -[TPSDataCache identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("TPSDataCacheIdentifier"));

  -[TPSDataCache updatedDate](self, "updatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("TPSDataCacheUpdatedDate"));

  -[TPSDataCache lastModified](self, "lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("TPSDataCacheLastModified"));

  -[TPSDataCache languageCode](self, "languageCode");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("TPSDataCacheLangaugeCode"));

}

- (BOOL)expired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[TPSDataCache updatedDate](self, "updatedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)self->_maxAge);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDataCache updatedDate](self, "updatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_msgSend(v4, "compare:", v5) == -1;
  else
    v7 = 1;

  return v7;
}

- (id)debugDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("TPSDataCacheIdentifier"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %zd\n"), CFSTR("TPSDataCacheType"), self->_cacheType);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %zd\n"), CFSTR("TPSDataCacheMaxAge"), self->_maxAge);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %zd\n"), CFSTR("TPSDataCacheFileSize"), self->_fileSize);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("TPSDataCacheUpdatedDate"), self->_updatedDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("TPSDataCacheLastModified"), self->_lastModified);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("TPSDataCacheLangaugeCode"), self->_languageCode);
  return v3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
{
  self->_cacheType = a3;
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(int64_t)a3
{
  self->_maxAge = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_lastModified, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_updatedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDate, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
