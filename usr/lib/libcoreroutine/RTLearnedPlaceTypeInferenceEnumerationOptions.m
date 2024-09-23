@implementation RTLearnedPlaceTypeInferenceEnumerationOptions

- (RTLearnedPlaceTypeInferenceEnumerationOptions)init
{
  return -[RTLearnedPlaceTypeInferenceEnumerationOptions initWithBatchSize:fetchLimit:offset:dateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:](self, "initWithBatchSize:fetchLimit:offset:dateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:", 0, 0, 0, 0, 1, 1, 0, 0, 0, 0);
}

- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithDateInterval:(id)a3 sortByCreationDate:(BOOL)a4 ascending:(BOOL)a5 filteredToPlaceTypes:(id)a6 filteredToIdentifiers:(id)a7 filteredToSessionIds:(id)a8 filteredToLearnedPlaceIdentifiers:(id)a9
{
  return -[RTLearnedPlaceTypeInferenceEnumerationOptions initWithBatchSize:fetchLimit:offset:dateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:](self, "initWithBatchSize:fetchLimit:offset:dateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:", 0, 0, 0, a3, a4, a5, a6, a7, a8, a9);
}

- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 offset:(unint64_t)a5 dateInterval:(id)a6 sortByCreationDate:(BOOL)a7 ascending:(BOOL)a8 filteredToPlaceTypes:(id)a9 filteredToIdentifiers:(id)a10 filteredToSessionIds:(id)a11 filteredToLearnedPlaceIdentifiers:(id)a12
{
  id v15;
  id v16;
  id v17;
  RTLearnedPlaceTypeInferenceEnumerationOptions *v18;
  RTLearnedPlaceTypeInferenceEnumerationOptions *v19;
  id v25;
  id v26;
  objc_super v27;

  v15 = a6;
  v16 = a9;
  v26 = a10;
  v25 = a11;
  v17 = a12;
  v27.receiver = self;
  v27.super_class = (Class)RTLearnedPlaceTypeInferenceEnumerationOptions;
  v18 = -[RTLearnedPlaceTypeInferenceEnumerationOptions init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_batchSize = a3;
    v18->_fetchLimit = a4;
    v18->_offset = a5;
    objc_storeStrong((id *)&v18->_dateInterval, a6);
    v19->_sortByCreationDate = a7;
    v19->_ascending = a8;
    objc_storeStrong((id *)&v19->_filteredToPlaceTypes, a9);
    objc_storeStrong((id *)&v19->_filteredToIdentifiers, a10);
    objc_storeStrong((id *)&v19->_filteredToSessionIds, a11);
    objc_storeStrong((id *)&v19->_filteredToLearnedPlaceIdentifiers, a12);
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
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:fetchLimit:offset:dateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:", self->_batchSize, self->_fetchLimit, self->_offset, self->_dateInterval, self->_sortByCreationDate, self->_ascending, self->_filteredToPlaceTypes, self->_filteredToIdentifiers, self->_filteredToSessionIds, self->_filteredToLearnedPlaceIdentifiers);
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sortByCreationDate, CFSTR("sortByCreationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredToPlaceTypes, CFSTR("filteredToPlaceTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredToIdentifiers, CFSTR("filteredToIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredToSessionIds, CFSTR("filteredToSessionIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredToLearnedPlaceIdentifiers, CFSTR("filteredToLearnedPlaceIdentifiers"));

}

- (RTLearnedPlaceTypeInferenceEnumerationOptions)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RTLearnedPlaceTypeInferenceEnumerationOptions *v13;
  uint64_t v15;

  v3 = a3;
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("batchSize"));
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("fetchLimit"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("offset"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("dateInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sortByCreationDate")) != 0;
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("ascending")) != 0;
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("filteredToPlaceTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("filteredToIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("filteredToSessionIds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("filteredToLearnedPlaceIdentifiers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[RTLearnedPlaceTypeInferenceEnumerationOptions initWithBatchSize:fetchLimit:offset:dateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:](self, "initWithBatchSize:fetchLimit:offset:dateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[RTLearnedPlaceTypeInferenceEnumerationOptions batchSize](self, "batchSize");
  v4 = -[RTLearnedPlaceTypeInferenceEnumerationOptions fetchLimit](self, "fetchLimit");
  v5 = -[RTLearnedPlaceTypeInferenceEnumerationOptions offset](self, "offset");
  -[RTLearnedPlaceTypeInferenceEnumerationOptions dateInterval](self, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTLearnedPlaceTypeInferenceEnumerationOptions sortByCreationDate](self, "sortByCreationDate"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[RTLearnedPlaceTypeInferenceEnumerationOptions ascending](self, "ascending"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[RTLearnedPlaceTypeInferenceEnumerationOptions filteredToPlaceTypes](self, "filteredToPlaceTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceEnumerationOptions filteredToIdentifiers](self, "filteredToIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceEnumerationOptions filteredToSessionIds](self, "filteredToSessionIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInferenceEnumerationOptions filteredToLearnedPlaceIdentifiers](self, "filteredToLearnedPlaceIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("batchSize, %lu, fetchLimit, %lu, offset, %lu, dateinterval, %@, sort by creation date, %@, ascending, %@, filteredToPlaceTypes, %@, filteredToIdentifiers, %@, filteredToSessionIds, %@, filteredToLearnedPlaceIdentifiers, %@,"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (unint64_t)offset
{
  return self->_offset;
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

- (NSArray)filteredToPlaceTypes
{
  return self->_filteredToPlaceTypes;
}

- (NSArray)filteredToLearnedPlaceIdentifiers
{
  return self->_filteredToLearnedPlaceIdentifiers;
}

- (NSArray)filteredToIdentifiers
{
  return self->_filteredToIdentifiers;
}

- (NSArray)filteredToSessionIds
{
  return self->_filteredToSessionIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredToSessionIds, 0);
  objc_storeStrong((id *)&self->_filteredToIdentifiers, 0);
  objc_storeStrong((id *)&self->_filteredToLearnedPlaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_filteredToPlaceTypes, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
