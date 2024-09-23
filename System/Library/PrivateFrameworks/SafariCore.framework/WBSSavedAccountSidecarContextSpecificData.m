@implementation WBSSavedAccountSidecarContextSpecificData

- (WBSSavedAccountSidecarContextSpecificData)initWithLastUsedDate:(id)a3
{
  id v5;
  WBSSavedAccountSidecarContextSpecificData *v6;
  WBSSavedAccountSidecarContextSpecificData *v7;
  WBSSavedAccountSidecarContextSpecificData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountSidecarContextSpecificData;
  v6 = -[WBSSavedAccountSidecarContextSpecificData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lastUsedDate, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSSavedAccountSidecarContextSpecificData)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *originalKeychainDictionary;
  void *v7;
  void *v8;
  NSDate *v9;
  NSDate *lastUsedDate;

  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  originalKeychainDictionary = self->_originalKeychainDictionary;
  self->_originalKeychainDictionary = v5;

  objc_msgSend(v4, "safari_numberForKey:", CFSTR("lUsed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastUsedDate = self->_lastUsedDate;
    self->_lastUsedDate = v9;

  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  WBSSavedAccountSidecarContextSpecificData *v4;
  char v5;

  v4 = (WBSSavedAccountSidecarContextSpecificData *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = WBSIsEqual(self->_lastUsedDate, v4->_lastUsedDate);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_lastUsedDate, "hash");
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)-[NSDictionary mutableCopy](self->_originalKeychainDictionary, "mutableCopy");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_lastUsedDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lUsed"));

  return (NSDictionary *)v3;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
}

@end
