@implementation TAGeneralDetectionMetrics

- (TAGeneralDetectionMetrics)initWithInterVisitMetrics:(id)a3 dominantUserActivity:(unint64_t)a4 pdState:(int64_t)a5 geoNavHint:(BOOL)a6 vehicularStateHint:(BOOL)a7
{
  id v13;
  TAGeneralDetectionMetrics *v14;
  TAGeneralDetectionMetrics *v15;
  TAGeneralDetectionMetrics *v16;
  objc_super v18;

  v13 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TAGeneralDetectionMetrics;
  v14 = -[TAGeneralDetectionMetrics init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    if (!v13)
    {
      v16 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v14->_interVisitMetrics, a3);
    v15->_dominantUserActivity = a4;
    v15->_pdState = a5;
    v15->_geoNavHint = a6;
    v15->_vehicularStateHint = a7;
  }
  v16 = v15;
LABEL_6:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAGeneralDetectionMetrics *v6;
  TAGeneralDetectionMetrics *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  BOOL v11;
  unint64_t v12;
  int64_t v13;
  _BOOL4 v14;
  _BOOL4 v16;

  v6 = (TAGeneralDetectionMetrics *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[TAGeneralDetectionMetrics interVisitMetrics](self, "interVisitMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAGeneralDetectionMetrics interVisitMetrics](v7, "interVisitMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[TAGeneralDetectionMetrics interVisitMetrics](self, "interVisitMetrics"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[TAGeneralDetectionMetrics interVisitMetrics](v7, "interVisitMetrics"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[TAGeneralDetectionMetrics dominantUserActivity](self, "dominantUserActivity");
        if (v12 == -[TAGeneralDetectionMetrics dominantUserActivity](v7, "dominantUserActivity")
          && (v13 = -[TAGeneralDetectionMetrics pdState](self, "pdState"),
              v13 == -[TAGeneralDetectionMetrics pdState](v7, "pdState"))
          && (v14 = -[TAGeneralDetectionMetrics geoNavHint](self, "geoNavHint"),
              v14 == -[TAGeneralDetectionMetrics geoNavHint](v7, "geoNavHint")))
        {
          v16 = -[TAGeneralDetectionMetrics vehicularStateHint](self, "vehicularStateHint");
          v10 = v16 ^ -[TAGeneralDetectionMetrics vehicularStateHint](v7, "vehicularStateHint") ^ 1;
          v11 = v10;
        }
        else
        {
          LOBYTE(v10) = 0;
          v11 = 0;
        }
        if (v8 == v9)
          goto LABEL_14;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

      v11 = v10;
LABEL_14:

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAGeneralDetectionMetrics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  TAGeneralDetectionMetrics *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GInterVisitMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GUserActivity"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GPeopleDensity"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GGeoNavHint")) != 0;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GVehicularStateHint"));

  v10 = -[TAGeneralDetectionMetrics initWithInterVisitMetrics:dominantUserActivity:pdState:geoNavHint:vehicularStateHint:](self, "initWithInterVisitMetrics:dominantUserActivity:pdState:geoNavHint:vehicularStateHint:", v5, v6, v7, v8, v9 != 0);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  TAInterVisitMetricPerDevice *interVisitMetrics;
  id v5;

  interVisitMetrics = self->_interVisitMetrics;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interVisitMetrics, CFSTR("GInterVisitMetrics"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dominantUserActivity, CFSTR("GUserActivity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pdState, CFSTR("GPeopleDensity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_geoNavHint, CFSTR("GGeoNavHint"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vehicularStateHint, CFSTR("GVehicularStateHint"));

}

- (TAInterVisitMetricPerDevice)interVisitMetrics
{
  return self->_interVisitMetrics;
}

- (unint64_t)dominantUserActivity
{
  return self->_dominantUserActivity;
}

- (int64_t)pdState
{
  return self->_pdState;
}

- (BOOL)geoNavHint
{
  return self->_geoNavHint;
}

- (BOOL)vehicularStateHint
{
  return self->_vehicularStateHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interVisitMetrics, 0);
}

@end
