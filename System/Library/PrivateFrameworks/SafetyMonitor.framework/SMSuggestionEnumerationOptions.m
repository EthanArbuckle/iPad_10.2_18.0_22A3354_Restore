@implementation SMSuggestionEnumerationOptions

- (SMSuggestionEnumerationOptions)init
{
  return -[SMSuggestionEnumerationOptions initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:](self, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);
}

- (SMSuggestionEnumerationOptions)initWithIncludeSuppressed:(BOOL)a3 sortByCreationDate:(BOOL)a4 ascending:(BOOL)a5 dateInterval:(id)a6 filteredToSuggestionTriggers:(id)a7 filteredToSuggestionUserTypes:(id)a8 filteredToSessionTypes:(id)a9
{
  return -[SMSuggestionEnumerationOptions initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:](self, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", 0, 0, 0, a3, a4, a5, a6, a7, a8, a9);
}

- (SMSuggestionEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 offset:(unint64_t)a5 includeSuppressed:(BOOL)a6 sortByCreationDate:(BOOL)a7 ascending:(BOOL)a8 dateInterval:(id)a9 filteredToSuggestionTriggers:(id)a10 filteredToSuggestionUserTypes:(id)a11 filteredToSessionTypes:(id)a12
{
  id v15;
  id v16;
  id v17;
  SMSuggestionEnumerationOptions *v18;
  SMSuggestionEnumerationOptions *v19;
  id v25;
  objc_super v26;

  v15 = a9;
  v16 = a10;
  v25 = a11;
  v17 = a12;
  v26.receiver = self;
  v26.super_class = (Class)SMSuggestionEnumerationOptions;
  v18 = -[SMSuggestionEnumerationOptions init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_batchSize = a3;
    v18->_fetchLimit = a4;
    v18->_offset = a5;
    v18->_includeSuppressed = a6;
    v18->_sortByCreationDate = a7;
    v18->_ascending = a8;
    objc_storeStrong((id *)&v18->_dateInterval, a9);
    objc_storeStrong((id *)&v19->_filteredToSuggestionTriggers, a10);
    objc_storeStrong((id *)&v19->_filteredToSuggestionUserTypes, a11);
    objc_storeStrong((id *)&v19->_filteredToSessionTypes, a12);
  }

  return v19;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", self->_batchSize, self->_fetchLimit, self->_offset, self->_includeSuppressed, self->_sortByCreationDate, self->_ascending, self->_dateInterval, self->_filteredToSuggestionTriggers, self->_filteredToSuggestionUserTypes, self->_filteredToSessionTypes);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t batchSize;
  id v5;

  batchSize = self->_batchSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fetchLimit, CFSTR("fetchLimit"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_offset, CFSTR("offset"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeSuppressed, CFSTR("includeSuppressed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sortByCreationDate, CFSTR("sortByCreationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredToSuggestionTriggers, CFSTR("filteredToSuggestionTriggers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredToSuggestionUserTypes, CFSTR("filteredToSuggestionUserTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredToSessionTypes, CFSTR("filteredToSessionTypes"));

}

- (SMSuggestionEnumerationOptions)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SMSuggestionEnumerationOptions *v13;
  uint64_t v15;

  v3 = a3;
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("batchSize"));
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("fetchLimit"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("offset"));
  v6 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("includeSuppressed"));
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sortByCreationDate")) != 0;
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("ascending")) != 0;
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("dateInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("filteredToSuggestionTriggers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("filteredToSuggestionUserTypes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("filteredToSessionTypes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SMSuggestionEnumerationOptions initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:](self, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v3 = -[SMSuggestionEnumerationOptions batchSize](self, "batchSize");
  v4 = -[SMSuggestionEnumerationOptions fetchLimit](self, "fetchLimit");
  v5 = -[SMSuggestionEnumerationOptions offset](self, "offset");
  if (-[SMSuggestionEnumerationOptions includeSuppressed](self, "includeSuppressed"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SMSuggestionEnumerationOptions sortByCreationDate](self, "sortByCreationDate"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[SMSuggestionEnumerationOptions ascending](self, "ascending"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[SMSuggestionEnumerationOptions dateInterval](self, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionEnumerationOptions filteredToSuggestionTriggers](self, "filteredToSuggestionTriggers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionEnumerationOptions filteredToSuggestionUserTypes](self, "filteredToSuggestionUserTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionEnumerationOptions filteredToSessionTypes](self, "filteredToSessionTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("batchSize, %lu, fetchLimit, %lu, offset, %lu, include suppressed, %@, sort by creation date, %@, ascending, %@, dateinterval, %@, filteredToSuggestionTriggers, %@, filteredToSuggestionUserTypes, %@, filteredToSessionTypes, %@"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)getEnumerationOptionsForLatestSuggestionSortedByCreationDateIncludeSuppressed:(BOOL)a3 filteredToSuggestionTriggers:(id)a4 filteredToSuggestionUserTypes:(id)a5 filteredToSessionTypes:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  SMSuggestionEnumerationOptions *v12;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[SMSuggestionEnumerationOptions initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:]([SMSuggestionEnumerationOptions alloc], "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", 0, 1, 0, v8, 1, 0, 0, v11, v10, v9);

  return v12;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BOOL)includeSuppressed
{
  return self->_includeSuppressed;
}

- (BOOL)sortByCreationDate
{
  return self->_sortByCreationDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)filteredToSuggestionTriggers
{
  return self->_filteredToSuggestionTriggers;
}

- (NSArray)filteredToSuggestionUserTypes
{
  return self->_filteredToSuggestionUserTypes;
}

- (NSArray)filteredToSessionTypes
{
  return self->_filteredToSessionTypes;
}

- (NSArray)filteredToSuggestionSessionTypes
{
  return self->_filteredToSuggestionSessionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredToSuggestionSessionTypes, 0);
  objc_storeStrong((id *)&self->_filteredToSessionTypes, 0);
  objc_storeStrong((id *)&self->_filteredToSuggestionUserTypes, 0);
  objc_storeStrong((id *)&self->_filteredToSuggestionTriggers, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
