@implementation MOResource

- (MOResource)initWithResourceMO:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  MOResource *v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v8 = objc_msgSend(v5, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "data"));
    objc_msgSend(v5, "value");
    v12 = v11;
    objc_msgSend(v5, "priorityScore");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoCurationScore"));
    self = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v6, v7, v8, v9, v10, v15, v12, v14, objc_msgSend(v5, "photoFaceCount"), objc_msgSend(v5, "photoAssetMediaType"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
      -[MOResource setSourceEventIdentifier:](self, "setSourceEventIdentifier:", v17);

    }
    if (objc_msgSend(v5, "sourceEventAccessType"))
      -[MOResource setSourceEventAccessType:](self, "setSourceEventAccessType:", objc_msgSend(v5, "sourceEventAccessType"));
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (MOResource)initWithIdentifier:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  MOResource *v9;

  v5 = a3;
  if (!v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOResource initWithIdentifier:].cold.1(v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOResource.m"), 29, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOResource initWithIdentifier:]", 29);

  }
  v9 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v5, CFSTR("Resource"), 0, 0, 0, 0, 0.0, -1.0, 0, 0);

  return v9;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 assets:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MOResource *v11;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v10, v9, a4, v8, 0, 0, 0.0, -1.0, 0, 0);

  return v11;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  MOResource *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v7, v6, a4, 0, 0, 0, 0.0, -1.0, 0, 0);

  return v8;
}

- (MOResource)initWithName:(id)a3 value:(double)a4
{
  id v6;
  void *v7;
  MOResource *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v7, v6, 1, 0, 0, 0, a4, -1.0, 0, 0);

  return v8;
}

- (MOResource)initWithName:(id)a3 type:(unint64_t)a4 dict:(id)a5 value:(double)a6
{
  id v10;
  id v11;
  BOOL v12;
  id os_log;
  NSObject *v14;
  void *v15;
  MOResource *v16;
  id v18;

  v10 = a3;
  if (a5)
  {
    v18 = 0;
    a5 = (id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a5, 0, &v18));
    v11 = v18;
    if (v11)
      v12 = 1;
    else
      v12 = a5 == 0;
    if (v12)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[MOResource initWithName:type:dict:value:].cold.1((uint64_t)v11, v14);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v16 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v15, v10, a4, 0, a5, 0, a6, -1.0, 0, 0);

  return v16;
}

- (MOResource)initWithIdentifier:(id)a3 name:(id)a4 type:(unint64_t)a5 assets:(id)a6 data:(id)a7 value:(double)a8 priorityScore:(double)a9 photoCurationScore:(id)a10 photoFaceCount:(unint64_t)a11 photoAssetMediaType:(unint64_t)a12
{
  id v21;
  id v22;
  id v23;
  MOResource *v24;
  MOResource *v25;
  id v27;
  id v28;
  objc_super v29;

  v21 = a3;
  v22 = a4;
  v28 = a6;
  v27 = a7;
  v23 = a10;
  v29.receiver = self;
  v29.super_class = (Class)MOResource;
  v24 = -[MOResource init](&v29, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifier, a3);
    objc_storeStrong((id *)&v25->_name, a4);
    v25->_type = a5;
    objc_storeStrong((id *)&v25->_assets, a6);
    objc_storeStrong((id *)&v25->_data, a7);
    v25->_value = a8;
    v25->_priorityScore = a9;
    objc_storeStrong((id *)&v25->_photoCurationScore, a10);
    v25->_photoFaceCount = a11;
    v25->_photoAssetMediaType = a12;
    v25->_sourceEventAccessType = -[MOResource dataAccessTypeFromResourceType:](v25, "dataAccessTypeFromResourceType:", a5);
  }

  return v25;
}

- (unint64_t)dataAccessTypeFromResourceType:(unint64_t)a3
{
  if (a3 > 0x10)
    return 0;
  else
    return qword_10029ED20[a3];
}

+ (id)getDictionaryForData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;

  v5 = a3;
  if (v5)
  {
    v15 = 0;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v5, 0, &v15));
    v7 = v15;
    if (v7)
      goto LABEL_10;
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "resource data dictionary , %@", buf, 0xCu);
    }

    v6 = v6;
    v7 = 0;
    v10 = v6;
    goto LABEL_15;
  }
  v7 = 0;
LABEL_10:
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[MOResource getDictionaryForData:error:].cold.1((uint64_t)v7, v12, v13);

  if (a4)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    *a4 = v7;
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)getDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource data](self, "data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getDictionaryForData:error:", v4, 0));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mask"));
  v6 = -[MOResource type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource assets](self, "assets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource data](self, "data"));
  v9 = objc_msgSend(v8, "length");
  -[MOResource value](self, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOResource identifier, %@, name, %@, type, %lu, assets, %@, data.length, %lu, value, %f"), v3, v5, v6, v7, v9, v10));

  return v11;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (void)setPriorityScore:(double)a3
{
  self->_priorityScore = a3;
}

- (void)setPhotoCurationScore:(id)a3
{
  objc_storeStrong((id *)&self->_photoCurationScore, a3);
}

- (void)setPhotoCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_photoCreationDate, a3);
}

+ (id)describeType:(unint64_t)a3
{
  if (a3 > 0x10)
    return CFSTR("Invalid");
  else
    return off_1002AFA18[a3];
}

- (id)describeType
{
  return +[MOResource describeType:](MOResource, "describeType:", -[MOResource type](self, "type"));
}

+ (id)getStringTypeForResources:(unint64_t)a3
{
  return +[MOResource describeType:](MOResource, "describeType:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOResource)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  MOResource *v9;
  id v10;
  uint64_t v11;
  NSString *name;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSNumber *photoCurationScore;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSDate *photoCreationDate;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSString *assets;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSData *data;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSUUID *sourceEventIdentifier;
  MOResource *v35;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v9 = -[MOResource initWithIdentifier:](self, "initWithIdentifier:", v7);
    if (v9)
    {
      v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("name"));
      v11 = objc_claimAutoreleasedReturnValue(v10);
      name = v9->_name;
      v9->_name = (NSString *)v11;

      v9->_type = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("value"));
      v9->_value = v13;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("priorityScore"));
      v9->_priorityScore = v14;
      v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v15), CFSTR("photoCurationScore"));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      photoCurationScore = v9->_photoCurationScore;
      v9->_photoCurationScore = (NSNumber *)v17;

      v9->_photoFaceCount = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoFaceCount"));
      v9->_photoAssetMediaType = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoAssetMediaType"));
      v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v19), CFSTR("photoCreationDate"));
      v21 = objc_claimAutoreleasedReturnValue(v20);
      photoCreationDate = v9->_photoCreationDate;
      v9->_photoCreationDate = (NSDate *)v21;

      v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v23), CFSTR("Assets"));
      v25 = objc_claimAutoreleasedReturnValue(v24);
      assets = v9->_assets;
      v9->_assets = (NSString *)v25;

      v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v27), CFSTR("data"));
      v29 = objc_claimAutoreleasedReturnValue(v28);
      data = v9->_data;
      v9->_data = (NSData *)v29;

      v32 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v31), CFSTR("sourceEventIdentifier"));
      v33 = objc_claimAutoreleasedReturnValue(v32);
      sourceEventIdentifier = v9->_sourceEventIdentifier;
      v9->_sourceEventIdentifier = (NSUUID *)v33;

      v9->_sourceEventAccessType = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType"));
    }
    self = v9;
    v35 = self;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("value"), self->_value);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("priorityScore"), self->_priorityScore);
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoCurationScore, CFSTR("photoCurationScore"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_photoFaceCount, CFSTR("photoFaceCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_photoAssetMediaType, CFSTR("photoAssetMediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoCreationDate, CFSTR("photoCreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assets, CFSTR("Assets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOResource *v5;
  uint64_t v6;
  MOResource *v7;
  uint64_t v8;
  MOResource *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOResource *)a3;
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](self, "identifier"));
        if (v10 || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](v9, "identifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](self, "identifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](v9, "identifier"));
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

+ (id)getDedupeKeyForResourceData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  id v5;
  id v8;
  id os_log;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v16;
  const __CFString *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;

  v8 = a3;
  if (v8)
  {
    if (a4 == 6)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v39 = objc_msgSend(v8, "length");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Using for the dedupe key the map item handler , %lu", buf, 0xCu);
      }

      v5 = v8;
      v11 = 0;
LABEL_6:
      v12 = 0;
      goto LABEL_18;
    }
    v37 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getDictionaryForData:error:](MOResource, "getDictionaryForData:error:", v8, &v37));
    v12 = v37;
    if (v12 || !objc_msgSend(v11, "count"))
    {
      if (a5)
      {
        v12 = objc_retainAutorelease(v12);
        v5 = 0;
        *a5 = v12;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v12 = 0;
      switch(a4)
      {
        case 0uLL:
        case 1uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
          v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            +[MOResource getDedupeKeyForResourceData:type:error:].cold.4(a4, v14);
          goto LABEL_15;
        case 2uLL:
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
          v17 = CFSTR("MOPhotoResourceLocalIdentifier");
          v18 = objc_msgSend(v16, "containsObject:", CFSTR("MOPhotoResourceLocalIdentifier"));

          v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          v21 = v20;
          if (!v18)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              +[MOResource getDedupeKeyForResourceData:type:error:].cold.1();
            goto LABEL_38;
          }
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            goto LABEL_27;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MOPhotoResourceLocalIdentifier")));
          *(_DWORD *)buf = 138412290;
          v39 = v22;
          goto LABEL_26;
        case 0xAuLL:
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
          v17 = CFSTR("MOWorkoutMetaDataKeyWorkoutID");
          v24 = objc_msgSend(v23, "containsObject:", CFSTR("MOWorkoutMetaDataKeyWorkoutID"));

          v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          v21 = v26;
          if (!v24)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              +[MOResource getDedupeKeyForResourceData:type:error:].cold.2();
LABEL_38:

            goto LABEL_16;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MOWorkoutMetaDataKeyWorkoutID")));
            *(_DWORD *)buf = 138412290;
            v39 = v22;
LABEL_26:
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Using for the dedupe key, %@", buf, 0xCu);

          }
LABEL_27:

          v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v17));
          goto LABEL_6;
        case 0xDuLL:
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
          if (!objc_msgSend(v27, "containsObject:", CFSTR("MOActivityMetaDataMotionType")))
            goto LABEL_40;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
          if ((objc_msgSend(v28, "containsObject:", CFSTR("MOActivityMetaDataKeyStartDate")) & 1) != 0)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
            v30 = objc_msgSend(v29, "containsObject:", CFSTR("MOActivityMetaDataKeyEndDate"));

            if (v30)
            {
              v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MOActivityMetaDataMotionType")));
              objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("MOActivityMetaDataMotionType"));

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MOActivityMetaDataKeyStartDate")));
              objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("MOActivityMetaDataKeyStartDate"));

              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MOActivityMetaDataKeyEndDate")));
              objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("MOActivityMetaDataKeyEndDate"));

              v34 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v39 = v5;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Using for the dedupe key the dictionary, %@", buf, 0xCu);
              }

              goto LABEL_6;
            }
          }
          else
          {

LABEL_40:
          }
          v36 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v14 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            +[MOResource getDedupeKeyForResourceData:type:error:].cold.3();
LABEL_15:

LABEL_16:
          v12 = 0;
          break;
        default:
          goto LABEL_18;
      }
    }
    v5 = 0;
    goto LABEL_18;
  }
  v5 = 0;
LABEL_19:

  return v5;
}

- (id)getDedupeKeyError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class(self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource data](self, "data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDedupeKeyForResourceData:type:error:", v6, -[MOResource type](self, "type"), a3));

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)value
{
  return self->_value;
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (NSNumber)photoCurationScore
{
  return self->_photoCurationScore;
}

- (unint64_t)photoFaceCount
{
  return self->_photoFaceCount;
}

- (void)setPhotoFaceCount:(unint64_t)a3
{
  self->_photoFaceCount = a3;
}

- (float)photoOverallAestheticScore
{
  return self->_photoOverallAestheticScore;
}

- (void)setPhotoOverallAestheticScore:(float)a3
{
  self->_photoOverallAestheticScore = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)assets
{
  return self->_assets;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)photoAssetMediaType
{
  return self->_photoAssetMediaType;
}

- (void)setPhotoAssetMediaType:(unint64_t)a3
{
  self->_photoAssetMediaType = a3;
}

- (NSDate)photoCreationDate
{
  return self->_photoCreationDate;
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_photoCreationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_photoCurationScore, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)photoLocalDate
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource data](self, "data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MOPhotoResourceLocalTime")));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", v6);
  return v7;
}

- (id)bundleSourceType
{
  unint64_t v2;

  v2 = -[MOResource type](self, "type") - 2;
  if (v2 <= 0xE && ((0x6F93u >> v2) & 1) != 0)
    return *off_1002B14C0[v2];
  else
    return 0;
}

- (MOResource)initWithPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  MOResource *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID uuidFromString:](NSUUID, "uuidFromString:", v5));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOResource(MOPerson) initWithPerson:].cold.1((uint64_t)v6, v4, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
  objc_msgSend(v4, "priorityScore");
  v12 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v6, v9, 11, v10, 0, 0, 0.0, v11, 0, 0);

  return v12;
}

- (MOResource)initWithWeather:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MOResource *v26;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, CFSTR("MOWeatherMetaDataKeyStartDate"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, CFSTR("MOWeatherMetaDataKeyEndDate"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weatherSummary"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, CFSTR("MOWeatherMetaDataKeyWeatherSummary"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weatherSymbolName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, CFSTR("MOWeatherMetaDataKeySymbolName"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "temperature"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "temperature"));
    objc_msgSend(v13, "doubleValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, CFSTR("MOWeatherMetaDataKeyTemperatureValue"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "temperature"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "unit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "symbol"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, CFSTR("MOWeatherMetaDataKeyTemperatureUnitSymbol"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windSpeed"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windSpeed"));
    objc_msgSend(v19, "doubleValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, CFSTR("MOWeatherMetaDataKeyWindSpeedValue"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windSpeed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "symbol"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("MOWeatherMetaDataKeyWindSpeedUnitSymbol"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", v5));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v26 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v25, CFSTR("Weather"), 14, 0, v24, 0, 0.0, -1.0, 0, 0);

  return v26;
}

- (double)endDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (!v3)
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyEndDate")));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (double)startDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (!v3)
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyStartDate")));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (id)temperature
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyTemperatureValue"))),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc((Class)NSMeasurement);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyTemperatureValue")));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = objc_alloc((Class)NSUnitTemperature);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyTemperatureUnitSymbol")));
    v14 = objc_msgSend(v11, "initWithSymbol:", v13);
    v15 = objc_msgSend(v6, "initWithDoubleValue:unit:", v14, v10);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)weatherSummary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWeatherSummary")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)weatherSymbolName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeySymbolName")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)windSpeed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWindSpeedValue"))),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc((Class)NSMeasurement);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWindSpeedValue")));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = objc_alloc((Class)NSUnit);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MOWeatherMetaDataKeyWindSpeedUnitSymbol")));
    v14 = objc_msgSend(v11, "initWithSymbol:", v13);
    v15 = objc_msgSend(v6, "initWithDoubleValue:unit:", v14, v10);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MOResource *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v6 = a3;
  v12[0] = CFSTR("evergreen_type");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOResource evergreenTypeFromEvergreenTypeString:](MOResource, "evergreenTypeFromEvergreenTypeString:", v6)));
  v13[0] = v7;
  v12[1] = CFSTR("evergreen_index");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  v10 = -[MOResource initWithName:type:dict:value:](self, "initWithName:type:dict:value:", v6, 9, v9, (double)a4);
  return v10;
}

- (MOResource)initWithEvergreenTypeName:(id)a3 promptIndexes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MOResource *v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v6 = a4;
  v7 = a3;
  v13[0] = CFSTR("evergreen_type");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOResource evergreenTypeFromEvergreenTypeString:](MOResource, "evergreenTypeFromEvergreenTypeString:", v7)));
  v14[0] = v8;
  v14[1] = v6;
  v13[1] = CFSTR("evergreen_indexes");
  v13[2] = CFSTR("evergreen_count");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
  v14[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

  v11 = -[MOResource initWithName:type:dict:value:](self, "initWithName:type:dict:value:", v7, 9, v10, 0.0);
  return v11;
}

- (unint64_t)evergreenType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_type")));
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)promptIndex
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_index")));
    v6 = (int)objc_msgSend(v5, "intValue");

  }
  else
  {
    -[MOResource value](self, "value");
    return (unint64_t)v7;
  }
  return v6;
}

- (id)promptIndexes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_indexes")));

  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

- (unint64_t)promptCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](self, "getDictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evergreen_count")));
    v6 = (int)objc_msgSend(v5, "intValue");

  }
  else
  {
    -[MOResource value](self, "value");
    return (unint64_t)v7;
  }
  return v6;
}

+ (id)evergreenTypeStringFromEvergreenType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return *off_1002B62C8[a3 - 1];
}

+ (unint64_t)evergreenTypeFromEvergreenTypeString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(CFSTR("WISDOM"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(CFSTR("PURPOSE"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(CFSTR("KINDNESS"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(CFSTR("GRATITUDE"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(CFSTR("CREATIVITY"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(CFSTR("RESILIENCE"), "isEqualToString:", v3))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MOResource)initWithPlace:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  MOResource *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_new(NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "placeType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("placeType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "placeUserType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, CFSTR("placeUserType"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dictionary"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, CFSTR("location"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "poiCategory"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v16, CFSTR("poiCategory"));

  if (objc_msgSend(v8, "placeType") != (id)101 && objc_msgSend(v8, "placeType") != (id)102)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enclosingArea"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, CFSTR("cityName"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enclosingArea"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v18, CFSTR("enclosingArea"));

  if (v9)
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v19, CFSTR("startDate"));

  }
  if (v10)
  {
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v20, CFSTR("endDate"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", v11));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeName"));
  objc_msgSend(v8, "placeNameConfidence");
  v25 = v24;
  objc_msgSend(v8, "priorityScore");
  v27 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v22, v23, 12, 0, v21, 0, v25, v26, 0, 0);

  return v27;
}

- (MOResource)initWithName:(id)a3 mapItemHandle:(id)a4 priorityScore:(double)a5
{
  id v8;
  id v9;
  void *v10;
  MOResource *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = -[MOResource initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:](self, "initWithIdentifier:name:type:assets:data:value:priorityScore:photoCurationScore:photoFaceCount:photoAssetMediaType:", v10, v9, 6, 0, v8, 0, 0.0, a5, 0, 0);

  return v11;
}

- (id)metaData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource data](self, "data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v2));

  return v3;
}

- (id)cityName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cityName")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)enclosingArea
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enclosingArea")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)placeUserType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeUserType")));
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)placeType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeType")));
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (id)location
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RTLocation locationFromDictionary:](RTLocation, "locationFromDictionary:", v5));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)poiCategory
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("poiCategory")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOResource initWithIdentifier:]";
  v3 = 1024;
  v4 = 29;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithName:(uint64_t)a1 type:(NSObject *)a2 dict:value:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)getDictionaryForData:(uint64_t)a3 error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, a3, "Unable to deserialize data to dictionary, %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", 2));
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_9((void *)&_mh_execute_header, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_1();
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", 10));
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_9((void *)&_mh_execute_header, v1, v2, "Malformed dictionary, %@, for resource type, %@, the key %@ is missing.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_1();
}

+ (void)getDedupeKeyForResourceData:type:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;

  OUTLINED_FUNCTION_6();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", 13));
  v4 = 138413314;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = v1;
  v10 = 2112;
  v11 = CFSTR("MOActivityMetaDataKeyStartDate");
  v12 = 2112;
  v13 = CFSTR("MOActivityMetaDataKeyEndDate");
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Malformed dictionary, %@, for resource type, %@, the one of the keys %@, %@, %@ is missing.", (uint8_t *)&v4, 0x34u);

}

+ (void)getDedupeKeyForResourceData:(uint64_t)a1 type:(NSObject *)a2 error:.cold.4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", a1));
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "Dedupe key not available for this type, %@.", (uint8_t *)&v5);

}

@end
