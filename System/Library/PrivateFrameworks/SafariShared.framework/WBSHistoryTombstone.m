@implementation WBSHistoryTombstone

- (WBSHistoryTombstone)initWithURLString:(id)a3 urlHash:(id)a4 urlSalt:(id)a5 startTime:(double)a6 endTime:(double)a7 generation:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  WBSHistoryTombstone *v17;
  uint64_t v18;
  NSString *urlString;
  uint64_t v20;
  NSData *urlHash;
  uint64_t v22;
  NSData *urlSalt;
  WBSHistoryTombstone *v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v26.receiver = self;
  v26.super_class = (Class)WBSHistoryTombstone;
  v17 = -[WBSHistoryTombstone init](&v26, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    urlString = v17->_urlString;
    v17->_urlString = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    urlHash = v17->_urlHash;
    v17->_urlHash = (NSData *)v20;

    v22 = objc_msgSend(v16, "copy");
    urlSalt = v17->_urlSalt;
    v17->_urlSalt = (NSData *)v22;

    v17->_startTime = a6;
    v17->_endTime = a7;
    v17->_generation = a8;
    v24 = v17;
  }

  return v17;
}

- (WBSHistoryTombstone)initWithSQLiteRow:(id)a3 crypto:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  WBSHistoryTombstone *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataAtIndex:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "decryptDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_stringForKey:", CFSTR("url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_dataForKey:", CFSTR("url_hash"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_dataForKey:", CFSTR("url_salt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v12 = 0;
    v10 = 0;
  }

  objc_msgSend(v6, "doubleAtIndex:", 1);
  v14 = v13;
  objc_msgSend(v6, "doubleAtIndex:", 2);
  v16 = -[WBSHistoryTombstone initWithURLString:urlHash:urlSalt:startTime:endTime:generation:](self, "initWithURLString:urlHash:urlSalt:startTime:endTime:generation:", v10, v11, v12, objc_msgSend(v6, "int64AtIndex:", 4), v14, v15);

  return v16;
}

- (WBSHistoryTombstone)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  WBSHistoryTombstone *v14;

  v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dataForKey:", CFSTR("URLHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dataForKey:", CFSTR("URLSalt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_numberForKey:", CFSTR("StartTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "safari_numberForKey:", CFSTR("EndTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v14 = -[WBSHistoryTombstone initWithURLString:urlHash:urlSalt:startTime:endTime:generation:](self, "initWithURLString:urlHash:urlSalt:startTime:endTime:generation:", v5, v6, v7, 0, v10, v13);
  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_urlString, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_urlString, CFSTR("URL"));
  if (-[NSData length](self->_urlHash, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_urlHash, CFSTR("URLHash"));
  if (-[NSData length](self->_urlSalt, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_urlSalt, CFSTR("URLSalt"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("StartTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("EndTime"));

  return (NSDictionary *)v3;
}

- (BOOL)matchesVisitTime:(double)a3 urlString:(id)a4
{
  id v6;
  NSData *urlHash;
  void *v8;
  BOOL v9;

  v6 = a4;
  v9 = (!-[NSString length](self->_urlString, "length")
     || -[NSString isEqualToString:](self->_urlString, "isEqualToString:", v6))
    && (!-[NSData length](self->_urlHash, "length")
     || (urlHash = self->_urlHash,
         WBSHistorySHA512(self->_urlSalt, v6),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         LOBYTE(urlHash) = -[NSData isEqualToData:](urlHash, "isEqualToData:", v8),
         v8,
         (urlHash & 1) != 0))
    && self->_startTime <= a3
    && self->_endTime >= a3;

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; urlString = \"%@\"; startTime = %lf; endTime = %lf>"),
    v5,
    self,
    self->_urlString,
    *(_QWORD *)&self->_startTime,
    *(_QWORD *)&self->_endTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSecure
{
  return !self->_urlString && self->_urlHash != 0;
}

- (id)secureTombstoneWithSalt:(id)a3
{
  id v4;
  WBSHistoryTombstone *v5;
  WBSHistoryTombstone *v6;
  WBSHistoryTombstone *v7;
  void *v8;

  v4 = a3;
  if (-[NSString length](self->_urlString, "length"))
  {
    if (!-[NSData length](self->_urlHash, "length"))
    {
      v7 = [WBSHistoryTombstone alloc];
      WBSHistorySHA512(v4, self->_urlString);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WBSHistoryTombstone initWithURLString:urlHash:urlSalt:startTime:endTime:generation:](v7, "initWithURLString:urlHash:urlSalt:startTime:endTime:generation:", 0, v8, v4, self->_generation, self->_startTime, self->_endTime);

      goto LABEL_7;
    }
    v5 = -[WBSHistoryTombstone initWithURLString:urlHash:urlSalt:startTime:endTime:generation:]([WBSHistoryTombstone alloc], "initWithURLString:urlHash:urlSalt:startTime:endTime:generation:", 0, self->_urlHash, self->_urlSalt, self->_generation, self->_startTime, self->_endTime);
  }
  else
  {
    v5 = self;
  }
  v6 = v5;
LABEL_7:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryTombstone)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  WBSHistoryTombstone *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLSalt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("StartTime"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EndTime"));
  v11 = -[WBSHistoryTombstone initWithURLString:urlHash:urlSalt:startTime:endTime:generation:](self, "initWithURLString:urlHash:urlSalt:startTime:endTime:generation:", v5, v6, v7, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Generation")), v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, CFSTR("URL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlHash, CFSTR("URLHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlSalt, CFSTR("URLSalt"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("StartTime"), self->_startTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("EndTime"), self->_endTime);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_generation, CFSTR("Generation"));

}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSData)urlHash
{
  return self->_urlHash;
}

- (NSData)urlSalt
{
  return self->_urlSalt;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSalt, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
