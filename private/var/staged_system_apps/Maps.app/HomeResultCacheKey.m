@implementation HomeResultCacheKey

- (HomeResultCacheKey)initWithCountryCode:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  HomeResultCacheKey *v8;
  NSString *v9;
  NSString *countryCode;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeResultCacheKey;
  v8 = -[HomeResultCacheKey init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    countryCode = v8->_countryCode;
    v8->_countryCode = v9;

    objc_storeStrong((id *)&v8->_location, a4);
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_countryCode, "hash");
  return (unint64_t)-[GEOLocation hash](self->_location, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HomeResultCacheKey *v4;
  HomeResultCacheKey *v5;
  uint64_t v6;
  HomeResultCacheKey *v7;
  NSString *v8;
  NSString *v9;
  GEOLocation *v10;
  GEOLocation *v11;
  unsigned __int8 v12;

  v4 = (HomeResultCacheKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[HomeResultCacheKey countryCode](v7, "countryCode"));
    v9 = v8;
    if (v8 == self->_countryCode || -[NSString isEqual:](v8, "isEqual:"))
    {
      v10 = (GEOLocation *)objc_claimAutoreleasedReturnValue(-[HomeResultCacheKey location](v7, "location"));
      v11 = v10;
      if (v10 == self->_location)
        v12 = 1;
      else
        v12 = -[GEOLocation isEqual:](v10, "isEqual:");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualivantToKey:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCode"));
    v7 = v6;
    if (v6 == self->_countryCode || -[NSString isEqual:](v6, "isEqual:"))
    {
      v8 = (void *)objc_opt_class(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
      v10 = objc_msgSend(v8, "_location:isEquivalentToLocation:", v9, self->_location);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_location:(id)a3 isEquivalentToLocation:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL result;
  double Double;
  uint64_t v19;

  if ((a3 == 0) == (a4 != 0))
    return 0;
  v5 = a4;
  objc_msgSend(a3, "coordinate");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "coordinate");
  v11 = v10;
  v13 = v12;

  v14 = fabs(v9 + 180.0) < 0.00000001;
  v15 = fabs(v7 + 180.0) < 0.00000001 && v14;
  v16 = fabs(v13 + 180.0) < 0.00000001;
  if (fabs(v11 + 180.0) >= 0.00000001)
    v16 = 0;
  result = v15 ^ v16 ^ 1;
  if (!v15 && !v16)
  {
    Double = GEOConfigGetDouble(MapsConfig_MapsHomeResultCacheThresholdDistance, off_1014B3E88);
    return GEOCalculateDistance(v19, v7, v9, v11, v13) < Double;
  }
  return result;
}

- (id)description
{
  uint64_t v3;
  GEOLocation *location;
  NSString *countryCode;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(self);
  countryCode = self->_countryCode;
  location = self->_location;
  if (location)
  {
    -[GEOLocation coordinate](location, "coordinate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v6, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p; countryCode = %@; location = %@>"),
                     v3,
                     self,
                     countryCode,
                     v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p; countryCode = %@; location = %@>"),
                     v3,
                     self,
                     self->_countryCode,
                     0));
  }
  return v9;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (GEOLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
