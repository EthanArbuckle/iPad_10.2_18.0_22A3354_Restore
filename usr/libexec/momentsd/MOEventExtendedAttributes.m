@implementation MOEventExtendedAttributes

- (MOEventExtendedAttributes)initWithLocalIdentifier:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  MOEventExtendedAttributes *v9;
  NSString *v10;
  NSString *photoMomentLocalIdentifier;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEventExtendedAttributes initWithLocalIdentifier:].cold.1(v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventExtendedAtrributes.m"), 216, CFSTR("Invalid parameter not satisfying: localIdentifier (in %s:%d)"), "-[MOEventExtendedAttributes initWithLocalIdentifier:]", 216);

  }
  v13.receiver = self;
  v13.super_class = (Class)MOEventExtendedAttributes;
  v9 = -[MOEventExtendedAttributes init](&v13, "init");
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v5, "copy");
    photoMomentLocalIdentifier = v9->_photoMomentLocalIdentifier;
    v9->_photoMomentLocalIdentifier = v10;

  }
  return v9;
}

+ (id)lowerCaseArrayOfStrings:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "lowercaseString", (_QWORD)v12));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (MOEventExtendedAttributes)initWithMoment:(id)a3
{
  id v4;
  void *v5;
  MOEventExtendedAttributes *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *photoMomentInferences;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *photoMomentHolidays;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  MOPublicEvent *v23;
  NSArray *v24;
  NSArray *photoMomentPublicEvents;
  void *v26;
  NSMutableArray *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  MOPerson *v33;
  MOPerson *v34;
  NSArray *v35;
  NSArray *photoMomentPersons;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("localIdentifier")));
  v6 = -[MOEventExtendedAttributes initWithLocalIdentifier:](self, "initWithLocalIdentifier:", v5);
  if (v6)
  {
    v42 = v5;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("inferences")));
    v8 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", v7));
    v41 = (void *)v7;
    if (v7)
    {
      v9 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:copyItems:", v8, 1);
      photoMomentInferences = v6->_photoMomentInferences;
      v6->_photoMomentInferences = v9;

    }
    v40 = (void *)v8;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("holidays")));
    v12 = objc_claimAutoreleasedReturnValue(+[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", v11));
    v39 = (void *)v11;
    if (v11)
    {
      v13 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:copyItems:", v12, 1);
      photoMomentHolidays = v6->_photoMomentHolidays;
      v6->_photoMomentHolidays = v13;

    }
    v38 = (void *)v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("publicEvents")));
    if (v15)
    {
      v16 = objc_opt_new(NSMutableArray);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v17 = v15;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v48 != v21)
              objc_enumerationMutation(v18);
            v23 = -[MOPublicEvent initWithEventDictionary:]([MOPublicEvent alloc], "initWithEventDictionary:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i));
            -[NSMutableArray addObject:](v16, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v20);
      }

      v24 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v16, 1);
      photoMomentPublicEvents = v6->_photoMomentPublicEvents;
      v6->_photoMomentPublicEvents = v24;

      v15 = v17;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("persons")));
    if (v26)
    {
      v27 = objc_opt_new(NSMutableArray);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v28 = v26;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(_QWORD *)v44 != v31)
              objc_enumerationMutation(v28);
            v33 = -[MOPerson initWithPersonDictionary:]([MOPerson alloc], "initWithPersonDictionary:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j));
            v34 = v33;
            if (v33)
            {
              -[MOPerson setSourceEventAccessType:](v33, "setSourceEventAccessType:", 3);
              -[NSMutableArray addObject:](v27, "addObject:", v34);
            }

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v30);
      }

      v35 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v27, 1);
      photoMomentPersons = v6->_photoMomentPersons;
      v6->_photoMomentPersons = v35;

    }
    v5 = v42;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentLocalIdentifier](self, "photoMomentLocalIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentInferences](self, "photoMomentInferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentHolidays](self, "photoMomentHolidays"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentPublicEvents](self, "photoMomentPublicEvents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentPersons](self, "photoMomentPersons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes momentPropertyOfAssets](self, "momentPropertyOfAssets"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOEventExtendedAttributes localIdentifier, %@, photoMomentInferences, %@, photoMomentHolidays, %@, photoMomentPublicEvents, %@, photoMomentPersons, %@, momentPropertyOfAssets, %@>"), v3, v4, v5, v7, v9, v11));

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEventExtendedAttributes)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  MOEventExtendedAttributes *v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  uint64_t v14;
  NSArray *photoMomentInferences;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  uint64_t v21;
  NSArray *photoMomentHolidays;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSSet *v26;
  void *v27;
  uint64_t v28;
  NSArray *photoMomentPublicEvents;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSSet *v33;
  void *v34;
  uint64_t v35;
  NSArray *photoMomentPersons;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSSet *v40;
  void *v41;
  uint64_t v42;
  NSArray *momentPropertyOfAssets;
  MOEventExtendedAttributes *v44;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("photoMomentLocalIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v9 = -[MOEventExtendedAttributes initWithLocalIdentifier:](self, "initWithLocalIdentifier:", v7);
    if (v9)
    {
      v10 = objc_opt_class(NSArray, v8);
      v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(NSString, v11), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("photoMomentInferences")));
      photoMomentInferences = v9->_photoMomentInferences;
      v9->_photoMomentInferences = (NSArray *)v14;

      v17 = objc_opt_class(NSArray, v16);
      v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(NSString, v18), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("photoMomentHolidays")));
      photoMomentHolidays = v9->_photoMomentHolidays;
      v9->_photoMomentHolidays = (NSArray *)v21;

      v24 = objc_opt_class(NSArray, v23);
      v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(MOPublicEvent, v25), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("photoMomentPublicEvents")));
      photoMomentPublicEvents = v9->_photoMomentPublicEvents;
      v9->_photoMomentPublicEvents = (NSArray *)v28;

      v31 = objc_opt_class(NSArray, v30);
      v33 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, objc_opt_class(MOPerson, v32), 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("photoMomentPersons")));
      photoMomentPersons = v9->_photoMomentPersons;
      v9->_photoMomentPersons = (NSArray *)v35;

      v38 = objc_opt_class(NSArray, v37);
      v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v38, objc_opt_class(MOAssetProperty, v39), 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("momentPropertyOfAssets")));
      momentPropertyOfAssets = v9->_momentPropertyOfAssets;
      v9->_momentPropertyOfAssets = (NSArray *)v42;

    }
    self = v9;
    v44 = self;
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *photoMomentLocalIdentifier;
  id v5;

  photoMomentLocalIdentifier = self->_photoMomentLocalIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", photoMomentLocalIdentifier, CFSTR("photoMomentLocalIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentInferences, CFSTR("photoMomentInferences"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentHolidays, CFSTR("photoMomentHolidays"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentPublicEvents, CFSTR("photoMomentPublicEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentPersons, CFSTR("photoMomentPersons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_momentPropertyOfAssets, CFSTR("momentPropertyOfAssets"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_photoMomentLocalIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOEventExtendedAttributes *v5;
  uint64_t v6;
  MOEventExtendedAttributes *v7;
  uint64_t v8;
  MOEventExtendedAttributes *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOEventExtendedAttributes *)a3;
  v7 = v5;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (v5)
    {
      v8 = objc_opt_class(self, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentLocalIdentifier](self, "photoMomentLocalIdentifier"));
        if (v10
          || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentLocalIdentifier](v9, "photoMomentLocalIdentifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentLocalIdentifier](self, "photoMomentLocalIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventExtendedAttributes photoMomentLocalIdentifier](v9, "photoMomentLocalIdentifier"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v10)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (NSArray)photoMomentInferences
{
  return self->_photoMomentInferences;
}

- (void)setPhotoMomentInferences:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentInferences, a3);
}

- (NSString)photoMomentLocalIdentifier
{
  return self->_photoMomentLocalIdentifier;
}

- (void)setPhotoMomentLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)photoMomentHolidays
{
  return self->_photoMomentHolidays;
}

- (void)setPhotoMomentHolidays:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentHolidays, a3);
}

- (NSArray)photoMomentPublicEvents
{
  return self->_photoMomentPublicEvents;
}

- (void)setPhotoMomentPublicEvents:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentPublicEvents, a3);
}

- (NSArray)photoMomentPersons
{
  return self->_photoMomentPersons;
}

- (void)setPhotoMomentPersons:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentPersons, a3);
}

- (NSArray)momentPropertyOfAssets
{
  return self->_momentPropertyOfAssets;
}

- (void)setMomentPropertyOfAssets:(id)a3
{
  objc_storeStrong((id *)&self->_momentPropertyOfAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentPropertyOfAssets, 0);
  objc_storeStrong((id *)&self->_photoMomentPersons, 0);
  objc_storeStrong((id *)&self->_photoMomentPublicEvents, 0);
  objc_storeStrong((id *)&self->_photoMomentHolidays, 0);
  objc_storeStrong((id *)&self->_photoMomentLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_photoMomentInferences, 0);
}

- (void)initWithLocalIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOEventExtendedAttributes initWithLocalIdentifier:]";
  v3 = 1024;
  v4 = 216;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localIdentifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
