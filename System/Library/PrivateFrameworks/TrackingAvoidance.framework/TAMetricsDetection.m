@implementation TAMetricsDetection

- (TAMetricsDetection)initWithDetectionType:(unint64_t)a3 visitDetectionMetrics:(id)a4 generalDetectionMetrics:(id)a5 singleVisitDetectionMetrics:(id)a6 latestAdvertisement:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TAMetricsDetection *v17;
  TAMetricsDetection *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TAMetricsDetection;
  v17 = -[TAMetricsDetection init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_detectionType = a3;
    objc_storeStrong((id *)&v17->_latestAdvertisement, a7);
    if (v13)
      objc_storeStrong((id *)&v18->_visitDetectionMetrics, a4);
    if (v14)
      objc_storeStrong((id *)&v18->_generalDetectionMetrics, a5);
    if (v15)
      objc_storeStrong((id *)&v18->_singleVisitDetectionMetrics, a6);
    switch(v18->_detectionType)
    {
      case 0uLL:
        goto LABEL_10;
      case 1uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
        if (!v18->_generalDetectionMetrics)
          goto LABEL_10;
        break;
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 0x10uLL:
        if (!v18->_visitDetectionMetrics)
          goto LABEL_10;
        break;
      case 3uLL:
      case 6uLL:
      case 0xAuLL:
      case 0xBuLL:
        if (!v18->_singleVisitDetectionMetrics)
        {
LABEL_10:

          v18 = 0;
        }
        break;
      default:
        break;
    }
  }

  return v18;
}

- (unint64_t)getMetricsCollectionType
{
  return 3;
}

+ (id)convertTADetectionTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 0xF)
    return CFSTR("Unknown");
  else
    return off_24D8150B8[a3 - 1];
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TAMetricsDetection *v5;
  TAMetricsDetection *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = (TAMetricsDetection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[TAMetricsDetection detectionType](self, "detectionType");
      if (v7 != -[TAMetricsDetection detectionType](v6, "detectionType"))
      {
        v11 = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[TAMetricsDetection visitDetectionMetrics](self, "visitDetectionMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAMetricsDetection visitDetectionMetrics](v6, "visitDetectionMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[TAMetricsDetection visitDetectionMetrics](self, "visitDetectionMetrics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAMetricsDetection visitDetectionMetrics](v6, "visitDetectionMetrics");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v10;
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_27;
        }
      }
      -[TAMetricsDetection generalDetectionMetrics](self, "generalDetectionMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAMetricsDetection generalDetectionMetrics](v6, "generalDetectionMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[TAMetricsDetection generalDetectionMetrics](self, "generalDetectionMetrics");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAMetricsDetection generalDetectionMetrics](v6, "generalDetectionMetrics");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqual:"))
        {
          v11 = 0;
LABEL_25:

LABEL_26:
          if (v8 == v9)
          {
LABEL_28:

            goto LABEL_29;
          }
LABEL_27:

          goto LABEL_28;
        }
        v30 = v14;
      }
      -[TAMetricsDetection singleVisitDetectionMetrics](self, "singleVisitDetectionMetrics");
      v15 = objc_claimAutoreleasedReturnValue();
      -[TAMetricsDetection singleVisitDetectionMetrics](v6, "singleVisitDetectionMetrics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v15;
      if ((void *)v15 == v16)
      {
        v26 = v13;
        v27 = v12;
      }
      else
      {
        -[TAMetricsDetection singleVisitDetectionMetrics](self, "singleVisitDetectionMetrics");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAMetricsDetection singleVisitDetectionMetrics](v6, "singleVisitDetectionMetrics");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v11 = 0;
          v23 = v31;
          goto LABEL_23;
        }
        v26 = v13;
        v27 = v12;
      }
      -[TAMetricsDetection latestAdvertisement](self, "latestAdvertisement");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAMetricsDetection latestAdvertisement](v6, "latestAdvertisement");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v19)
      {

        v11 = 1;
      }
      else
      {
        v20 = (void *)v19;
        -[TAMetricsDetection latestAdvertisement](self, "latestAdvertisement");
        v25 = v3;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAMetricsDetection latestAdvertisement](v6, "latestAdvertisement");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v21, "isEqual:", v22);

        v3 = v25;
      }
      v23 = v31;
      v13 = v26;
      v12 = v27;
      if (v31 == v16)
      {
LABEL_24:

        v14 = v30;
        if (v12 == v13)
          goto LABEL_26;
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    v11 = 0;
  }
LABEL_30:

  return v11;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MetricsType: TAMetricsDetection, DetectionType: %lu"), self->_detectionType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAMetricsDetection)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TAMetricsDetection *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MVisitMetrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MGeneralMetrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSingleMetrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MLatestAdvert"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TAMetricsDetection initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:](self, "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t detectionType;
  id v5;

  detectionType = self->_detectionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", detectionType, CFSTR("MType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visitDetectionMetrics, CFSTR("MVisitMetrics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_generalDetectionMetrics, CFSTR("MGeneralMetrics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_singleVisitDetectionMetrics, CFSTR("MSingleMetrics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestAdvertisement, CFSTR("MLatestAdvert"));

}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (TAGeneralDetectionMetrics)generalDetectionMetrics
{
  return self->_generalDetectionMetrics;
}

- (TAVisitDetectionMetrics)visitDetectionMetrics
{
  return self->_visitDetectionMetrics;
}

- (TASingleVisitDetectionMetrics)singleVisitDetectionMetrics
{
  return self->_singleVisitDetectionMetrics;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_singleVisitDetectionMetrics, 0);
  objc_storeStrong((id *)&self->_visitDetectionMetrics, 0);
  objc_storeStrong((id *)&self->_generalDetectionMetrics, 0);
}

@end
