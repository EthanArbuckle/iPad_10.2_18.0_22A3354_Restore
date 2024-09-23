@implementation PPLocationNamedEntities

- (void)setScore:(double)a3
{
  double v3;

  v3 = fmax(a3, 0.0);
  if (v3 > 1.0)
    v3 = 1.0;
  self->_score = v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_locationName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_streetAddress, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_city, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_stateOrProvince, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_postalCode, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[NSString copyWithZone:](self->_unstructuredLocationString, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  *(double *)(v5 + 64) = self->_score;
  v20 = -[NSString copyWithZone:](self->_documentId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = -[NSData copyWithZone:](self->_mapItem, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  v24 = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v24;

  v26 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v26;

  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *locationName;
  id v5;

  locationName = self->_locationName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locationName, CFSTR("loc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_streetAddress, CFSTR("str"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("cty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateOrProvince, CFSTR("sta"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("pst"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("cnt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unstructuredLocationString, CFSTR("uls"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sco"), self->_score);
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentId, CFSTR("doc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapItem, CFSTR("mit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("cll"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("dat"));

}

- (PPLocationNamedEntities)initWithCoder:(id)a3
{
  id v4;
  PPLocationNamedEntities *v5;
  uint64_t v6;
  NSString *locationName;
  uint64_t v8;
  NSString *streetAddress;
  uint64_t v10;
  NSString *city;
  uint64_t v12;
  NSString *stateOrProvince;
  uint64_t v14;
  NSString *postalCode;
  uint64_t v16;
  NSString *country;
  uint64_t v18;
  NSString *unstructuredLocationString;
  double v20;
  uint64_t v21;
  NSString *documentId;
  uint64_t v23;
  NSData *mapItem;
  uint64_t v25;
  CLLocation *location;
  uint64_t v27;
  NSDate *date;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PPLocationNamedEntities;
  v5 = -[PPLocationNamedEntities init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loc"));
    v6 = objc_claimAutoreleasedReturnValue();
    locationName = v5->_locationName;
    v5->_locationName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("str"));
    v8 = objc_claimAutoreleasedReturnValue();
    streetAddress = v5->_streetAddress;
    v5->_streetAddress = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cty"));
    v10 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sta"));
    v12 = objc_claimAutoreleasedReturnValue();
    stateOrProvince = v5->_stateOrProvince;
    v5->_stateOrProvince = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pst"));
    v14 = objc_claimAutoreleasedReturnValue();
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cnt"));
    v16 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uls"));
    v18 = objc_claimAutoreleasedReturnValue();
    unstructuredLocationString = v5->_unstructuredLocationString;
    v5->_unstructuredLocationString = (NSString *)v18;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sco"));
    v5->_score = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doc"));
    v21 = objc_claimAutoreleasedReturnValue();
    documentId = v5->_documentId;
    v5->_documentId = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mit"));
    v23 = objc_claimAutoreleasedReturnValue();
    mapItem = v5->_mapItem;
    v5->_mapItem = (NSData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cll"));
    v25 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dat"));
    v27 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v27;

  }
  return v5;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
  objc_storeStrong((id *)&self->_locationName, a3);
}

- (NSString)streetAddress
{
  return self->_streetAddress;
}

- (void)setStreetAddress:(id)a3
{
  objc_storeStrong((id *)&self->_streetAddress, a3);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (NSString)stateOrProvince
{
  return self->_stateOrProvince;
}

- (void)setStateOrProvince:(id)a3
{
  objc_storeStrong((id *)&self->_stateOrProvince, a3);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_storeStrong((id *)&self->_postalCode, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (NSString)unstructuredLocationString
{
  return self->_unstructuredLocationString;
}

- (void)setUnstructuredLocationString:(id)a3
{
  objc_storeStrong((id *)&self->_unstructuredLocationString, a3);
}

- (double)score
{
  return self->_score;
}

- (NSString)documentId
{
  return self->_documentId;
}

- (void)setDocumentId:(id)a3
{
  objc_storeStrong((id *)&self->_documentId, a3);
}

- (NSData)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_documentId, 0);
  objc_storeStrong((id *)&self->_unstructuredLocationString, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_stateOrProvince, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_streetAddress, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
