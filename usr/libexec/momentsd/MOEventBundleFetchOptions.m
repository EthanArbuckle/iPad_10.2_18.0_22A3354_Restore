@implementation MOEventBundleFetchOptions

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 filterBundle:(BOOL)a7
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:", a3, a4, a5, a6, 0, 0);
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, a3, a4, a5, a6, a7);
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7 interfaceType:(unint64_t)a8
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", 0, a3, a4, a5, a6, a7, a8);
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 filterBundle:(BOOL)a6
{
  return -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", a3, a4, a5, 0, 0);
}

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", a3, a4, a5, a6, a7, a8, 16);
}

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8 interfaceType:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  MOEventBundleFetchOptions *v19;
  MOEventBundleFetchOptions *v20;
  objc_super v22;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MOEventBundleFetchOptions;
  v19 = -[MOEventBundleFetchOptions init](&v22, "init");
  v20 = v19;
  if (v19)
  {
    v19->_ascending = a5;
    objc_storeStrong((id *)&v19->_dateInterval, a4);
    objc_storeStrong((id *)&v20->_limit, a6);
    v20->_filterBundle = 0;
    objc_storeStrong((id *)&v20->_categories, a3);
    v20->_includeDeletedBundles = a7;
    v20->_skipRanking = a8;
    v20->_interfaceType = a9;
  }

  return v20;
}

- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  MOEventBundleFetchOptions *v9;
  MOEventBundleFetchOptions *v10;

  v5 = a4;
  v8 = a3;
  v9 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, v5, 0, 0, 0);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_identifiers, a3);

  return v10;
}

- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5 skipRanking:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  MOEventBundleFetchOptions *v11;
  MOEventBundleFetchOptions *v12;

  v6 = a6;
  v7 = a4;
  v10 = a3;
  v11 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, v7, 0, 0, v6);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_identifiers, a3);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 ascending;
  void *v5;
  void *v6;
  id v7;

  ascending = self->_ascending;
  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", ascending));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("ascending"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_limit, CFSTR("limit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_skipRanking));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("skipRanking"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_includeDeletedBundles, CFSTR("includeDeletedBundles"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifiers, CFSTR("identifiers"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_interfaceType, CFSTR("interfaceType"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_personalizedSensingFilter, CFSTR("pssFilter"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_personalizedSensingVisitsAllowed, CFSTR("pssVisits"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_skipLocalization, CFSTR("skipLocalization"));

}

- (MOEventBundleFetchOptions)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSSet *v24;
  void *v25;
  void *v26;
  id v27;
  MOEventBundleFetchOptions *v28;
  MOEventBundleFetchOptions *v29;
  unsigned int v31;

  v3 = a3;
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v4), CFSTR("ascending"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v31 = objc_msgSend(v6, "BOOLValue");

  v8 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDateInterval, v7), CFSTR("dateInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("limit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v14 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v13), CFSTR("skipRanking"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("includeDeletedBundles"));
  v18 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("skipLocalization"));
  v19 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("pssFilter"));
  v20 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("pssVisits"));
  v22 = objc_opt_class(NSArray, v21);
  v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, objc_opt_class(NSUUID, v23), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v25, CFSTR("identifiers")));

  v27 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("interfaceType"));
  v28 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", v9, v31, v12, v17, v16);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_identifiers, v26);
    v29->_interfaceType = (unint64_t)v27;
    v29->_personalizedSensingFilter = v19;
    v29->_personalizedSensingVisitsAllowed = v20;
    v29->_skipLocalization = v18;
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  MOEventBundleFetchOptions *v4;
  uint64_t v5;
  MOEventBundleFetchOptions *v6;
  uint64_t v7;
  BOOL v8;

  v4 = (MOEventBundleFetchOptions *)a3;
  v6 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = -[MOEventBundleFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  void *v3;
  id v5;
  int ascending;
  unsigned int v7;
  NSDateInterval *dateInterval;
  uint64_t v9;
  void *v10;
  NSDateInterval *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSNumber *limit;
  void *v18;
  int filterBundle;
  unsigned int v20;
  int skipRanking;
  unsigned int v22;
  BOOL v23;

  v5 = a3;
  ascending = self->_ascending;
  v7 = objc_msgSend(v5, "ascending");
  dateInterval = self->_dateInterval;
  if (dateInterval)
    goto LABEL_2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateInterval"));
  if (!v3)
  {
    v13 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
LABEL_2:
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateInterval"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = self->_dateInterval;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateInterval"));
      v13 = -[NSDateInterval isEqualToDateInterval:](v11, "isEqualToDateInterval:", v12);

      if (dateInterval)
        goto LABEL_12;
    }
    else
    {
      v13 = 0;
      if (dateInterval)
        goto LABEL_12;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_11:

LABEL_12:
  if (self->_limit)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "limit"));
    if (v14)
    {
      v15 = 1;
    }
    else if (self->_limit)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "limit"));
      if (v16)
      {
        limit = self->_limit;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "limit"));
        v15 = -[NSNumber isEqualToNumber:](limit, "isEqualToNumber:", v18);

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  filterBundle = self->_filterBundle;
  v20 = objc_msgSend(v5, "filterBundle");
  skipRanking = self->_skipRanking;
  v22 = objc_msgSend(v5, "skipRanking");
  v23 = 0;
  if (ascending == v7 && ((v13 ^ 1) & 1) == 0 && v15)
    v23 = filterBundle == v20 && skipRanking == v22;

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ascending));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (unint64_t)-[NSDateInterval hash](self->_dateInterval, "hash");
  v6 = v5 ^ (unint64_t)-[NSNumber hash](self->_limit, "hash") ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_filterBundle));
  v8 = (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_skipRanking));
  v10 = v6 ^ v8 ^ (unint64_t)objc_msgSend(v9, "hash");

  return v10;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  if (self->_ascending)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval startDate](self->_dateInterval, "startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval endDate](self->_dateInterval, "endDate"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate"));
  v8 = (void *)v7;
  if (self->_filterBundle)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_skipRanking)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_personalizedSensingFilter)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_personalizedSensingVisitsAllowed)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ascending, %@,  startDate, %@, endDate, %@, limit, %@, filterBundle, %@, skipRanking, %@, interfaceType, %lu, pssFilter, %@, pssVisits, %@"), v3, v5, v7, self->_limit, v9, v10, self->_interfaceType, v11, v12));

  return v13;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (BOOL)filterBundle
{
  return self->_filterBundle;
}

- (BOOL)includeDeletedBundles
{
  return self->_includeDeletedBundles;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)skipRanking
{
  return self->_skipRanking;
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (BOOL)personalizedSensingFilter
{
  return self->_personalizedSensingFilter;
}

- (void)setPersonalizedSensingFilter:(BOOL)a3
{
  self->_personalizedSensingFilter = a3;
}

- (BOOL)personalizedSensingVisitsAllowed
{
  return self->_personalizedSensingVisitsAllowed;
}

- (void)setPersonalizedSensingVisitsAllowed:(BOOL)a3
{
  self->_personalizedSensingVisitsAllowed = a3;
}

- (BOOL)skipLocalization
{
  return self->_skipLocalization;
}

- (void)setSkipLocalization:(BOOL)a3
{
  self->_skipLocalization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
