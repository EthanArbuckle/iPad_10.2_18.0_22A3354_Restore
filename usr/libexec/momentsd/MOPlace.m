@implementation MOPlace

- (MOPlace)initWithPlaceMO:(id)a3
{
  id v4;
  void *v5;
  double v6;
  MOPlace *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  id v34;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "range");
    if (v6 >= 0.0)
    {
      v8 = objc_alloc((Class)RTLocation);
      objc_msgSend(v5, "latitude");
      v10 = v9;
      objc_msgSend(v5, "longitude");
      v12 = v11;
      objc_msgSend(v5, "range");
      v34 = objc_msgSend(v8, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v10, v12, v13);
    }
    else
    {
      v34 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cityName"));
    v33 = objc_msgSend(v5, "placeType");
    v17 = objc_msgSend(v5, "userSpecificPlaceType");
    v18 = objc_msgSend(v5, "locationMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "poiCategory"));
    objc_msgSend(v5, "distanceToHomeInMiles");
    v21 = v20;
    objc_msgSend(v5, "placeNameConfidence");
    v23 = v22;
    objc_msgSend(v5, "familiarityIndexLOI");
    v25 = v24;
    objc_msgSend(v5, "priorityScore");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    self = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v14, v15, v16, v33, v17, v34, v21, v23, v25, v27, v18, v19, v28, v29);

    -[MOPlace setProposition:](self, "setProposition:", objc_msgSend(v5, "proposition"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
      -[MOPlace setSourceEventIdentifier:](self, "setSourceEventIdentifier:", v31);

    }
    if (objc_msgSend(v5, "sourceEventAccessType"))
      -[MOPlace setSourceEventAccessType:](self, "setSourceEventAccessType:", objc_msgSend(v5, "sourceEventAccessType"));

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MOPlace)initWithIdentifier:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  MOPlace *v9;

  v5 = a3;
  if (!v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOPlace initWithIdentifier:].cold.1(v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPlace.m"), 23, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOPlace initWithIdentifier:]", 23);

  }
  v9 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v5, &stru_1002B68D0, &stru_1002B68D0, 0, 0, 0, -1.0, -1.0, 0.0, -1.0, 0, &stru_1002B68D0, 0, 0);

  return v9;
}

- (MOPlace)initWithPlaceName:(id)a3 enclosingArea:(id)a4 placeType:(unint64_t)a5 placeUserType:(unint64_t)a6 location:(id)a7 locationMode:(unint64_t)a8 poiCategory:(id)a9 distanceToHomeInMiles:(double)a10 placeNameConfidence:(double)a11 familiarityIndexLOI:(double)a12 startDate:(id)a13 endDate:(id)a14
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  MOPlace *v30;

  v23 = a14;
  v24 = a13;
  v25 = a9;
  v26 = a7;
  v27 = a4;
  v28 = a3;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v30 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v29, v28, v27, a5, a6, v26, a10, a11, a12, -1.0, a8, v25, v24, v23);

  return v30;
}

- (MOPlace)initWithPlaceName:(id)a3 placeType:(unint64_t)a4 placeUserType:(unint64_t)a5 location:(id)a6 locationMode:(unint64_t)a7 poiCategory:(id)a8 distanceToHomeInMiles:(double)a9 placeNameConfidence:(double)a10 familiarityIndexLOI:(double)a11
{
  id v20;
  id v21;
  id v22;
  void *v23;
  MOPlace *v24;

  v20 = a8;
  v21 = a6;
  v22 = a3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v24 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v23, v22, &stru_1002B68D0, a4, a5, v21, a9, a10, a11, -1.0, a7, v20, 0, 0);

  return v24;
}

- (MOPlace)initWithIdentifier:(id)a3 placeName:(id)a4 enclosingArea:(id)a5 placeType:(unint64_t)a6 placeUserType:(unint64_t)a7 location:(id)a8 locationMode:(unint64_t)a9 poiCategory:(id)a10 distanceToHomeInMiles:(double)a11 placeNameConfidence:(double)a12 familiarityIndexLOI:(double)a13 priorityScore:(double)a14 startDate:(id)a15 endDate:(id)a16
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  MOPlace *v30;
  MOPlace *v31;
  id obj;
  id v36;
  id v37;
  objc_super v38;

  v25 = a3;
  v26 = a4;
  obj = a5;
  v27 = a5;
  v37 = a8;
  v36 = a10;
  v28 = a15;
  v29 = a16;
  v38.receiver = self;
  v38.super_class = (Class)MOPlace;
  v30 = -[MOPlace init](&v38, "init");
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_identifier, a3);
    v31->_placeUserType = a7;
    v31->_placeType = a6;
    objc_storeStrong((id *)&v31->_placeName, a4);
    objc_storeStrong((id *)&v31->_enclosingArea, obj);
    objc_storeStrong((id *)&v31->_location, a8);
    v31->_locationMode = a9;
    objc_storeStrong((id *)&v31->_poiCategory, a10);
    v31->_proposition = 0;
    v31->_familiarityIndexLOI = a13;
    v31->_distanceToHomeInMiles = a11;
    v31->_placeNameConfidence = a12;
    v31->_priorityScore = a14;
    objc_storeStrong((id *)&v31->_startDate, a15);
    objc_storeStrong((id *)&v31->_endDate, a16);
    v31->_sourceEventAccessType = 5;
  }

  return v31;
}

- (id)promptDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace placeName](self, "placeName"));

  if (v3)
  {
    v4 = -[MOPlace proposition](self, "proposition");
    v5 = CFSTR("at");
    if (v4 == 2)
      v5 = CFSTR("on");
    if (v4 == 3)
      v6 = CFSTR("in");
    else
      v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace placeName](self, "placeName"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v6, v7));

  }
  else
  {
    v8 = &stru_1002B68D0;
  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace placeName](self, "placeName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mask"));
  -[MOPlace placeNameConfidence](self, "placeNameConfidence");
  v7 = v6;
  v8 = -[MOPlace placeType](self, "placeType");
  v9 = -[MOPlace placeUserType](self, "placeUserType");
  v10 = -[MOPlace proposition](self, "proposition");
  v11 = -[MOPlace locationMode](self, "locationMode");
  -[MOPlace distanceToHomeInMiles](self, "distanceToHomeInMiles");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace poiCategory](self, "poiCategory"));
  -[MOPlace familiarityIndexLOI](self, "familiarityIndexLOI");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOPlace identifier, %@, name, %@, confidence, %f, placeType, %lu, placeUserType, %lu, preposition, %lu, locationMode, %lu, distanceToHomeInMiles, %f, poiCategory, %@, familiarityIndexLOI, %f>"), v3, v5, v7, v8, v9, v10, v11, v13, v14, v15));

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOPlace)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  float v16;
  double v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  double v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  MOPlace *v35;
  MOPlace *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  void *v44;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("identifier"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("placeName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v11), CFSTR("enclosingArea"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v43 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("placeType"));
  v42 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("placeUserType"));
  v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RTLocation, v13), CFSTR("location"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v41 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("proposition"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("placeNameConfidence"));
  v17 = v16;
  v18 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("locationMode"));
  v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v19), CFSTR("poiCategory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("distanceToHomeInMiles"));
  v23 = v22;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("familiarityIndexLOI"));
  v25 = v24;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("priorityScore"));
  v27 = v26;
  v29 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v28), CFSTR("startDate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v32 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v31), CFSTR("endDate"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)v7;
  v35 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v7, v10, v44, v43, v42, v15, v23, v17, v25, v27, v18, v21, v30, v33);
  v36 = v35;
  if (v35)
  {
    -[MOPlace setProposition:](v35, "setProposition:", v41);
    v38 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v37), CFSTR("sourceEventIdentifier"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    -[MOPlace setSourceEventIdentifier:](v36, "setSourceEventIdentifier:", v39);

    -[MOPlace setSourceEventAccessType:](v36, "setSourceEventAccessType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  double priorityScore;
  double distanceToHomeInMiles;
  double placeNameConfidence;
  double familiarityIndexLOI;
  id v9;

  identifier = self->_identifier;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_placeName, CFSTR("placeName"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_placeType, CFSTR("placeType"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_placeUserType, CFSTR("placeUserType"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_proposition, CFSTR("proposition"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_locationMode, CFSTR("locationMode"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_poiCategory, CFSTR("poiCategory"));
  priorityScore = self->_priorityScore;
  *(float *)&priorityScore = priorityScore;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("priorityScore"), priorityScore);
  distanceToHomeInMiles = self->_distanceToHomeInMiles;
  *(float *)&distanceToHomeInMiles = distanceToHomeInMiles;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("distanceToHomeInMiles"), distanceToHomeInMiles);
  placeNameConfidence = self->_placeNameConfidence;
  *(float *)&placeNameConfidence = placeNameConfidence;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("placeNameConfidence"), placeNameConfidence);
  familiarityIndexLOI = self->_familiarityIndexLOI;
  *(float *)&familiarityIndexLOI = familiarityIndexLOI;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("familiarityIndexLOI"), familiarityIndexLOI);
  objc_msgSend(v9, "encodeObject:forKey:", self->_enclosingArea, CFSTR("enclosingArea"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOPlace *v5;
  uint64_t v6;
  MOPlace *v7;
  uint64_t v8;
  MOPlace *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOPlace *)a3;
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace identifier](self, "identifier"));
        if (v10 || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace identifier](v9, "identifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace identifier](self, "identifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace identifier](v9, "identifier"));
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

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)placeUserType
{
  return self->_placeUserType;
}

- (void)setPlaceUserType:(unint64_t)a3
{
  self->_placeUserType = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_storeStrong((id *)&self->_placeName, a3);
}

- (double)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (void)setPlaceNameConfidence:(double)a3
{
  self->_placeNameConfidence = a3;
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (void)setPriorityScore:(double)a3
{
  self->_priorityScore = a3;
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (unint64_t)proposition
{
  return self->_proposition;
}

- (void)setProposition:(unint64_t)a3
{
  self->_proposition = a3;
}

- (unint64_t)locationMode
{
  return self->_locationMode;
}

- (void)setLocationMode:(unint64_t)a3
{
  self->_locationMode = a3;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategory, a3);
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  self->_familiarityIndexLOI = a3;
}

- (double)distanceToHomeInMiles
{
  return self->_distanceToHomeInMiles;
}

- (void)setDistanceToHomeInMiles:(double)a3
{
  self->_distanceToHomeInMiles = a3;
}

- (NSString)enclosingArea
{
  return self->_enclosingArea;
}

- (void)setEnclosingArea:(id)a3
{
  objc_storeStrong((id *)&self->_enclosingArea, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_enclosingArea, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOPlace initWithIdentifier:]";
  v3 = 1024;
  v4 = 23;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
