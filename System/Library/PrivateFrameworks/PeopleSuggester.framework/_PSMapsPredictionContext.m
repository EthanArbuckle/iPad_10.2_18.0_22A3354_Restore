@implementation _PSMapsPredictionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSMapsPredictionContext)init
{
  _PSMapsPredictionContext *v2;
  _PSMapsPredictionContext *v3;
  NSDate *suggestionDate;
  NSString *bundleID;
  NSString *navigationStartLocationId;
  NSString *navigationEndLocationId;
  NSArray *seedContactIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PSMapsPredictionContext;
  v2 = -[_PSMapsPredictionContext init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    suggestionDate = v2->_suggestionDate;
    v2->_suggestionDate = 0;

    bundleID = v3->_bundleID;
    v3->_bundleID = 0;

    navigationStartLocationId = v3->_navigationStartLocationId;
    v3->_navigationStartLocationId = 0;

    navigationEndLocationId = v3->_navigationEndLocationId;
    v3->_navigationEndLocationId = 0;

    seedContactIdentifiers = v3->_seedContactIdentifiers;
    v3->_seedContactIdentifiers = 0;

  }
  return v3;
}

- (NSDate)suggestionDate
{
  NSDate *suggestionDate;
  NSDate *v4;
  NSDate *v5;

  suggestionDate = self->_suggestionDate;
  if (!suggestionDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_suggestionDate;
    self->_suggestionDate = v4;

    suggestionDate = self->_suggestionDate;
  }
  return suggestionDate;
}

- (_PSMapsPredictionContext)initWithCoder:(id)a3
{
  id v4;
  _PSMapsPredictionContext *v5;
  uint64_t v6;
  NSDate *suggestionDate;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *navigationStartLocationId;
  uint64_t v12;
  NSString *navigationEndLocationId;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *seedContactIdentifiers;
  _PSMapsPredictionContext *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_PSMapsPredictionContext;
  v5 = -[_PSMapsPredictionContext init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestionDate = v5->_suggestionDate;
    v5->_suggestionDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("navigationStartLocationId"));
    v10 = objc_claimAutoreleasedReturnValue();
    navigationStartLocationId = v5->_navigationStartLocationId;
    v5->_navigationStartLocationId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("navigationEndLocationId"));
    v12 = objc_claimAutoreleasedReturnValue();
    navigationEndLocationId = v5->_navigationEndLocationId;
    v5->_navigationEndLocationId = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("seedContactIdentifiers"));
    v17 = objc_claimAutoreleasedReturnValue();
    seedContactIdentifiers = v5->_seedContactIdentifiers;
    v5->_seedContactIdentifiers = (NSArray *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *suggestionDate;
  id v5;

  suggestionDate = self->_suggestionDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestionDate, CFSTR("suggestionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_navigationStartLocationId, CFSTR("navigationStartLocationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_navigationEndLocationId, CFSTR("navigationEndLocationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seedContactIdentifiers, CFSTR("seedContactIdentifiers"));

}

- (void)setSuggestionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)navigationStartLocationId
{
  return self->_navigationStartLocationId;
}

- (void)setNavigationStartLocationId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)navigationEndLocationId
{
  return self->_navigationEndLocationId;
}

- (void)setNavigationEndLocationId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)seedContactIdentifiers
{
  return self->_seedContactIdentifiers;
}

- (void)setSeedContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_navigationEndLocationId, 0);
  objc_storeStrong((id *)&self->_navigationStartLocationId, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_suggestionDate, 0);
}

@end
