@implementation SUCoreMAIdentifier

- (SUCoreMAIdentifier)initWithProductVersion:(id)a3 productBuildVersion:(id)a4 releaseType:(id)a5 measurement:(id)a6 measurementAlgorithm:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SUCoreMAIdentifier *v17;
  SUCoreMAIdentifier *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SUCoreMAIdentifier;
  v17 = -[SUCoreMAIdentifier init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_productVersion, a3);
    objc_storeStrong((id *)&v18->_productBuildVersion, a4);
    objc_storeStrong((id *)&v18->_releaseType, a5);
    objc_storeStrong((id *)&v18->_measurement, a6);
    objc_storeStrong((id *)&v18->_measurementAlgorithm, a7);
  }

  return v18;
}

- (SUCoreMAIdentifier)initWithCoder:(id)a3
{
  id v4;
  SUCoreMAIdentifier *v5;
  uint64_t v6;
  NSString *productVersion;
  uint64_t v8;
  NSString *productBuildVersion;
  uint64_t v10;
  NSString *releaseType;
  uint64_t v12;
  NSData *measurement;
  uint64_t v14;
  NSString *measurementAlgorithm;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreMAIdentifier;
  v5 = -[SUCoreMAIdentifier init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductBuildVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseType"));
    v10 = objc_claimAutoreleasedReturnValue();
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Measurement"));
    v12 = objc_claimAutoreleasedReturnValue();
    measurement = v5->_measurement;
    v5->_measurement = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MeasurementAlgorithm"));
    v14 = objc_claimAutoreleasedReturnValue();
    measurementAlgorithm = v5->_measurementAlgorithm;
    v5->_measurementAlgorithm = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SUCoreMAIdentifier productVersion](self, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ProductVersion"));

  -[SUCoreMAIdentifier productBuildVersion](self, "productBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ProductBuildVersion"));

  -[SUCoreMAIdentifier releaseType](self, "releaseType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ReleaseType"));

  -[SUCoreMAIdentifier measurement](self, "measurement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Measurement"));

  -[SUCoreMAIdentifier measurementAlgorithm](self, "measurementAlgorithm");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("MeasurementAlgorithm"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCoreMAIdentifier *v4;
  SUCoreMAIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;
  void *v20;
  void *v21;

  v4 = (SUCoreMAIdentifier *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUCoreMAIdentifier productVersion](self, "productVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreMAIdentifier productVersion](v5, "productVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v6, v7))
      {
        -[SUCoreMAIdentifier productBuildVersion](self, "productBuildVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreMAIdentifier productBuildVersion](v5, "productBuildVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v8, v9))
        {
          -[SUCoreMAIdentifier releaseType](self, "releaseType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreMAIdentifier releaseType](v5, "releaseType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v10))
          {
            v20 = v10;
            -[SUCoreMAIdentifier measurement](self, "measurement");
            v11 = objc_claimAutoreleasedReturnValue();
            -[SUCoreMAIdentifier measurement](v5, "measurement");
            v12 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v11;
            v13 = v11;
            v14 = (void *)v12;
            if (+[SUCore dataIsEqual:to:](SUCore, "dataIsEqual:to:", v13, v12))
            {
              -[SUCoreMAIdentifier measurementAlgorithm](self, "measurementAlgorithm");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCoreMAIdentifier measurementAlgorithm](v5, "measurementAlgorithm");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v15, v16);

            }
            else
            {
              v17 = 0;
            }

            v10 = v20;
          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreMAIdentifier productVersion](self, "productVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMAIdentifier productBuildVersion](self, "productBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMAIdentifier releaseType](self, "releaseType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMAIdentifier measurement](self, "measurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMAIdentifier measurementAlgorithm](self, "measurementAlgorithm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n[>>>\n        productVersion: %@\n   productBuildVersion: %@\n           releaseType: %@\n           measurement: %@\n  measurementAlgorithm: %@\n<<<]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productBuildVersion, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (NSData)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_measurement, a3);
}

- (NSString)measurementAlgorithm
{
  return self->_measurementAlgorithm;
}

- (void)setMeasurementAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_measurementAlgorithm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementAlgorithm, 0);
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
}

@end
