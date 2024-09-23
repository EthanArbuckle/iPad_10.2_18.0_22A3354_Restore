@implementation PLRevGeoMapItemAdditionalPlaceInfo

- (PLRevGeoMapItemAdditionalPlaceInfo)initWithName:(id)a3 placeType:(id)a4 dominantOrderType:(unint64_t)a5 areaInSquareMeters:(double)a6
{
  id v11;
  id v12;
  PLRevGeoMapItemAdditionalPlaceInfo *v13;
  PLRevGeoMapItemAdditionalPlaceInfo *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLRevGeoMapItemAdditionalPlaceInfo;
  v13 = -[PLRevGeoMapItemAdditionalPlaceInfo init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_placeType, a4);
    v14->_dominantOrderType = a5;
    v14->_areaInSquareMeters = a6;
  }

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@ placeType=%@ dominantOrderType=%lu areaInSquareMeters%f>"), v5, self, self->_name, self->_placeType, self->_dominantOrderType, *(_QWORD *)&self->_areaInSquareMeters);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PLRevGeoMapItemAdditionalPlaceInfo *v4;
  uint64_t v5;
  char v6;
  PLRevGeoMapItemAdditionalPlaceInfo *v7;
  unint64_t dominantOrderType;
  double areaInSquareMeters;
  double v10;
  NSString *name;
  void *v12;
  NSNumber *placeType;
  void *v14;

  v4 = (PLRevGeoMapItemAdditionalPlaceInfo *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      dominantOrderType = self->_dominantOrderType;
      if (dominantOrderType == -[PLRevGeoMapItemAdditionalPlaceInfo dominantOrderType](v7, "dominantOrderType")
        && (areaInSquareMeters = self->_areaInSquareMeters,
            -[PLRevGeoMapItemAdditionalPlaceInfo areaInSquareMeters](v7, "areaInSquareMeters"),
            areaInSquareMeters == v10)
        && (name = self->_name,
            -[PLRevGeoMapItemAdditionalPlaceInfo name](v7, "name"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(name) = -[NSString isEqualToString:](name, "isEqualToString:", v12),
            v12,
            (_DWORD)name))
      {
        placeType = self->_placeType;
        -[PLRevGeoMapItemAdditionalPlaceInfo placeType](v7, "placeType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[NSNumber isEqualToNumber:](placeType, "isEqualToNumber:", v14);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeType, CFSTR("placeType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dominantOrderType, CFSTR("dominantOrderType"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("area"), self->_areaInSquareMeters);

}

- (PLRevGeoMapItemAdditionalPlaceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  PLRevGeoMapItemAdditionalPlaceInfo *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dominantOrderType"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("area"));
  v9 = v8;

  v10 = -[PLRevGeoMapItemAdditionalPlaceInfo initWithName:placeType:dominantOrderType:areaInSquareMeters:](self, "initWithName:placeType:dominantOrderType:areaInSquareMeters:", v5, v6, v7, v9);
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)placeType
{
  return self->_placeType;
}

- (unint64_t)dominantOrderType
{
  return self->_dominantOrderType;
}

- (double)areaInSquareMeters
{
  return self->_areaInSquareMeters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
