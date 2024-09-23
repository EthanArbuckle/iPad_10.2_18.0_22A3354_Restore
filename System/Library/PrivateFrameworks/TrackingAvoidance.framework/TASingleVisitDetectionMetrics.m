@implementation TASingleVisitDetectionMetrics

- (TASingleVisitDetectionMetrics)initWithInterVisitMetrics:(id)a3 loiType:(unint64_t)a4 previousVisitType:(unint64_t)a5
{
  TAInterVisitMetricPerDevice *v8;
  TASingleVisitDetectionMetrics *v9;
  TAInterVisitMetricPerDevice *interVisitMetrics;
  objc_super v12;

  v8 = (TAInterVisitMetricPerDevice *)a3;
  v12.receiver = self;
  v12.super_class = (Class)TASingleVisitDetectionMetrics;
  v9 = -[TASingleVisitDetectionMetrics init](&v12, sel_init);
  interVisitMetrics = v9->_interVisitMetrics;
  v9->_interVisitMetrics = v8;

  v9->_loiType = a4;
  v9->_previousVisitType = a5;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TASingleVisitDetectionMetrics *v6;
  TASingleVisitDetectionMetrics *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;

  v6 = (TASingleVisitDetectionMetrics *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[TASingleVisitDetectionMetrics interVisitMetrics](self, "interVisitMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TASingleVisitDetectionMetrics interVisitMetrics](v7, "interVisitMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[TASingleVisitDetectionMetrics interVisitMetrics](self, "interVisitMetrics"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[TASingleVisitDetectionMetrics interVisitMetrics](v7, "interVisitMetrics"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v11 = -[TASingleVisitDetectionMetrics loiType](self, "loiType");
        if (v11 == -[TASingleVisitDetectionMetrics loiType](v7, "loiType"))
        {
          v12 = -[TASingleVisitDetectionMetrics previousVisitType](self, "previousVisitType");
          v10 = v12 == -[TASingleVisitDetectionMetrics previousVisitType](v7, "previousVisitType");
        }
        else
        {
          v10 = 0;
        }
        if (v8 == v9)
          goto LABEL_13;
      }
      else
      {
        v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TASingleVisitDetectionMetrics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  TASingleVisitDetectionMetrics *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVInterVisitMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SVLOI"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SVPreviousVisitType"));

  v8 = -[TASingleVisitDetectionMetrics initWithInterVisitMetrics:loiType:previousVisitType:](self, "initWithInterVisitMetrics:loiType:previousVisitType:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  TAInterVisitMetricPerDevice *interVisitMetrics;
  id v5;

  interVisitMetrics = self->_interVisitMetrics;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interVisitMetrics, CFSTR("SVInterVisitMetrics"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_loiType, CFSTR("SVLOI"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_previousVisitType, CFSTR("SVPreviousVisitType"));

}

- (TAInterVisitMetricPerDevice)interVisitMetrics
{
  return self->_interVisitMetrics;
}

- (unint64_t)loiType
{
  return self->_loiType;
}

- (unint64_t)previousVisitType
{
  return self->_previousVisitType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interVisitMetrics, 0);
}

@end
